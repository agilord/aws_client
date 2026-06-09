# Smithy → legacy `Api` IR: known squeeze cases

Unversioned working notes (gitignored). The Smithy path translates the v3 AST
into the legacy `Api` IR (`apiFromSmithy`) and reuses the existing builders.
Some Smithy concepts have no IR equivalent and are mapped lossily. This tracks
them so they're not lost. Symptoms show up in
`generator/smithy_protocol_tests/{skip,exclude}_list.json`.

Legend — "Where": Adapter = `lib/smithy/from_smithy.dart` only; IR = needs a new
field on `model/*.dart`; Builder = codegen; Runtime = `aws_client` shared.

| # | Smithy feature | Current mapping | What's lost | Where the fix lives | Real-world impact |
|---|---|---|---|---|---|
| 1 | `@mixin` | **FIXED** — mixin members merged into the structure (adapter) | (was: all mixin members silently dropped) | Adapter | High — mixins common in real v3 models |
| 2 | `@sparse` list/map | ignored | null elements not preserved/serialized | IR + Builder + Runtime | Low–med (sparse uncommon) |
| 3 | `@default` value | ignored | client does not populate defaults | IR + Builder (+ client-semantics call) | Low for a client (server fills defaults) |
| 4 | `bigDecimal` | → `double` | **precision loss, silent** (no conformance test catches it) | IR + Runtime (decimal type) | High for money/precision APIs, but rare shapes |
| 5 | `intEnum` | → `integer` | int-enum type safety (wire value round-trips fine) | IR + Builder | Cosmetic |
| 6 | `union` | → `structure` | exactly-one-member semantics; XML/payload union cases fail | Builder/Runtime (JSON already works) | Low |
| 7 | `@streaming`, `@httpChecksumRequired`, request compression (gzip) | ignored | discrete protocol features | Builder + Runtime | Feature-by-feature; mostly niche |
| 8 | **error/exception shapes** | **FIXED** — adapter keeps `@error` shapes out of `api.shapes` (unless also referenced as a member), so the builder routes them through `GenericAwsException(type, message)` exactly like legacy | (was: server `message` lost for member-less errors; `type` always dropped) | Adapter (`from_smithy.dart`) | **High — affected every service; was INVISIBLE to the acceptance suite** (harness generates no error-response tests) |

## Real-API diff findings (Session 6, smithy v3.1063.0 vs legacy v2.1692.0)

Generator is structurally robust: **425/427 real models build** via `apiFromSmithy`+`buildService`.
Structural outliers (sweep now: 426/427 build, 0 crashes, 1 unsupported):
- `acm-pca` — **FIXED**. Service shape has no `version` (the *only* such model). `apiFromSmithy`
  now recovers it from the `aws.api#service` `docId` (`acm-pca-2017-08-22` → `2017-08-22`, via
  `_versionFromDocId` trailing-date extraction). Verified across all 427 models: every `docId`
  ends with the service `version` (61/61 where both present), so the suffix is the version.
  acm-pca now generates as `acm_pca/v2017_08_22.dart` — same dir/name + same 20 ops as legacy.
  A null version that yields no docId date still throws `UnsupportedError` (service skipped, not
  a crash). Locked by `from_smithy_test.dart` ('version fallback from docId').
- `ec2` — uses **`ec2Query`** protocol, unsupported by the transform (only the 5 protocols handled).

## Localstack run on the smithy clients (Session 6)

Ran `aws_client/test/localstack` against the `--smithy`-generated tree. **All 28 pass**, incl.
`errors_test` (typed exceptions across all 4 protocols — live-backend proof of the #8 fix:
DynamoDB→ResourceNotFoundException, S3→NoSuchBucket, IAM→NoSuchEntityException,
ApiGateway→NotFoundException). Two more real gaps found + fixed:
- **`_fixApi` duplicate enum** (`generate_command.dart`): the s3 `ChecksumAlgorithm`+`CRC64NVME`
  and lambda `LastUpdateStatusReasonCode`+`Creating` patches assumed the legacy v2 snapshot lacked
  those values. The newer v3 Smithy models already include them → duplicate enum entry → S3 client
  won't compile. Fixed: only add when absent (`addEnumValue` guard). Legacy output unchanged.
- Env note: the dev box already had another project's localstack on :4566 (`server-localstack-1`,
  community 4.14 with those services off). Ran a separate localstack on **:4567** with
  `EAGER_SERVICE_LOADING=1` + explicit `SERVICES`, tests via `AWS_ENDPOINT=http://localhost:4567`.

## Corpus-wide parity audit (Session 6) — `generator/tool/smithy_parity.dart`

Matches legacy (apis/) vs smithy (smithy_apis/) Apis by generated `directoryName`, reports the
DANGEROUS direction (legacy has it, smithy drops it). **385 legacy / 426 smithy / 362 overlap.**
**Conclusion: every operation-level difference traces to a real AWS model change, NOT a transform
gap — the smithy generator never silently drops operations.**
- **Dropped operations — 5 services, all AWS-side:** chime (129 → AWS split into `chime-sdk-*`,
  all present as new v3 services); data_sync (13) + cloud_search (11) genuinely removed from v3
  models (verified absent); s3 (4 = deprecated `GetBucketLifecycle`/`*Notification` aliases, the
  `*Configuration` replacements are present); lambda (5 = old 2014-11-11 preview vs current
  2015-03-31 artifact).
- **23 services "vanish"** = AWS deprecated/removed them from the v3 SDK (qldb, robomaker, opsworks,
  worklink, nimble, simpledb, elastic_transcoder, mobile_analytics, import_export, iot_1_click_*,
  evidently, lookout_*, etc.) + `ec2` (ec2Query unsupported). All confirmed absent from smithy_apis.
- **64 smithy-only services** = new in v3 (benign, more coverage).
- **4 files renamed** (newer apiVersion → new filename): cloud_front 2018→2020, cloud_search
  2011→2013, cloud_directory 2016→2017, lambda (artifact). Transition consideration: barrel import
  path changes for these; consider an alias/export shim.
- **1435 "dropped" shapes across 109 services = benign:** overwhelmingly inline constraint-wrapper
  shapes (`FooRequestMaxResultsInteger`, `…List`, `…String`) that v3 inlines instead of naming,
  plus error shapes now routed through `GenericAwsException` (the #8 fix). Not real losses.
- **Member-level parity (done): 78,456 shared shapes compared.** No transform-caused data loss.
  - **49 dropped members** — ALL verified absent from the v3 model (AWS removals/restructuring,
    version artifacts like cloud_search/lambda, and v2-SDK-injected helper fields that were never
    real API members, e.g. `rds.*.SourceRegion`). Spot-checked bedrock_agent.topK,
    gamelift.containerDefinitions, device_farm.clientId — all genuinely gone from v3.
  - **14 optional→required** — smithy faithfully reflects v3 `@required` traits (stricter than v2).
  - **153 type changes** — mostly benign: document/any→`Object`, enum renames
    (PrincipalType→DeadlinePrincipalType), disambiguation suffixes (`FooShape`). Two systematic
    source-breaking-but-faithful buckets: **String→int (41)** = numeric pagination params
    (`maxItems`/`limit`/`maxResults`, cloud_front/glacier/route_53) — wire-identical, smithy more
    precise; **Object→String (41)** = `@mediaType("application/json")` fields (lex sessionAttributes,
    grafana configuration, network_manager policyDocument, …) where v2's `jsonvalue` convenience
    (Dart `Object`, auto-encoded) becomes a raw JSON `String`.
  - **The actionable parity gap — FIXED.** `apiFromSmithy` now maps Smithy
    `@mediaType("application/json")` (on the target string shape or member ref) → legacy `jsonvalue`
    (Dart `Object`, auto JSON-encoded). New `TraitIds.mediaType` + `_isJsonValue` helper, threaded
    through `_member`/`_memberDescriptor` (list case too). Only `application/json` maps; yaml/markdown/
    image stay plain strings. Re-audit: the 41 `Object→String` + 1 `List<Object>→List<String>`
    divergences are gone (type changes 153→111), no new divergence introduced. Locked by 3 unit tests
    (`@mediaType(application/json) -> jsonvalue`). **Harness fix required:** the conformance vector
    `serializes_string_shapes_with_jsonvalue_trait` feeds jsonvalue params as pre-encoded JSON
    strings; `test_suite_common.buildParameters` now `jsonDecode`s them so the client (which
    `jsonEncode`s, like legacy) round-trips exactly. Conformance stays **383/251/0**; legacy clients
    + legacy `test/generated` byte-identical (the buildParameters change is inert there — no jsonvalue
    input vectors).

**Smithy tree is now `dart analyze`-clean (Session 6).** Full 426-service smithy package had
7 warnings (legacy was clean); all fixed, legacy stays byte-identical:
- **6× `unnecessary_cast`** — list-of-`document` decode emitted `.map((e) => e as Object)`, but
  `.nonNulls` already yields non-null `Object`. `builder_utils.extractJsonCode` now emits
  `.nonNulls.toList()` for document-element lists. Legacy-safe: legacy has 0 `e as Object`
  (no list-of-document fields); direct document members keep their `as Object` untouched.
- **1× `unnecessary_null_comparison` (s3)** — a rest-xml `@idempotencyToken` *header* is `??=`'d
  to non-null, so the later `if (token != null)` guard was dead. `buildRequestHeaders` now takes
  `guaranteedNonNull` (default `{}`, so other callers unchanged) and `rest_xml_builder` passes the
  auto-filled set, matching what `buildRequestQueryParams` already did. Legacy-safe: legacy's
  `??=`'d tokens are all query/body params, never headers (s3_control analyzes clean).
Verified: full smithy tree `No issues found`, legacy `git diff` empty, conformance 383/251/0,
all 60 generator + 21 from_smithy tests green.

**Server vectors filtered as out-of-scope (Session 6).** The conformance suite ran *all* vectors,
including `appliesTo: "server"` ones a client library can never satisfy — they were polluting the
skip count. The generator now filters `appliesTo == 'server'` in the test builder's `only()` helper
(never emitted) and counts them under a new `outOfScope` column in `readiness.md`
(Corpus → Server → Applicable = Corpus − Server). 41 server vectors total; readiness is now honest:
**371 passing / 655 applicable** (was the muddier 383/696). Gotcha handled: the suite *reuses* a
vector id for client+server pairs (e.g. `RestJsonNullAndEmptyHeaders` is `appliesTo:client` on
`NullAndEmptyHeadersClient` AND `appliesTo:server` on `NullAndEmptyHeadersServer`) — so skip_list
removal must drop only *purely*-server ids (every occurrence server), keeping shared ids whose client
side is still emitted and skipped. Removed 20 purely-server skip entries, kept 2 shared. Verified:
conformance all-green (371/228/0), drift guard clean, 60 generator tests pass, legacy untouched
(Suite-2-only change).

**Transition verdict: structurally SAFE.** The smithy generator never silently drops an operation,
shape, or member — every difference vs legacy traces to a real v3 model change. Remaining real items
are product decisions (23 AWS-deprecated services vanish; 4 files renamed; stricter required;
String→int pagination) + one fixable parity improvement (@mediaType→jsonvalue). Tool:
`generator/tool/smithy_parity.dart`.

Per-service diffs (dynamo_db, sqs, sts, lambda): smithy **never drops an operation or shape**. Data
shapes are byte-identical (e.g. SQS `BatchResultErrorEntry`). Diff bulk is (a) newer v3 operations
(STS +3, Lambda +15), (b) emission ordering, (c) the **error-shape divergence (#8 above)** — the one
real correctness bug found. The acceptance suite cannot catch #8: `smithy_protocol_test_builder.dart`
emits no error-response tests. Tooling: `generator/tool/smithy_gap_sweep.dart` (full inventory),
`generator/tool/smithy_one.dart <model>` (generate one service to /tmp for diffing).

**#8 fixed (Session 6).** `apiFromSmithy` now excludes `@error` shapes from the emitted shape map
*unless* the shape is also referenced as a struct/union member or list/map element (e.g. an
event-stream union's error variant — see restJson1 `EventStream`/`ErrorEvent`, which crashed
`buildService` when blanket-excluded). Verified: SQS exceptions now byte-match legacy
(`MessageNotInflight extends GenericAwsException`, `_exceptionFns` plumbs `(type, message)`);
SQS structural diff dropped 1379→810 lines (rest = ordering + newer v3 ops). Locked by 3 unit tests
in `from_smithy_test.dart` (`@error shapes` + `@error shape referenced as a member`). Full
conformance suite still green: 383 pass / 251 skip / 0 fail. Remaining diff drivers are benign
(emission ordering, newer v3 operations). Open structural follow-ups: `acm-pca` null `version`
fallback, `ec2`/ec2Query protocol.

## Notes per case

- **#1 `@mixin`** — the `smithy ast` output does NOT pre-flatten mixins: a
  structure using `with [SomeMixin]` arrives with `members: []` and
  `mixins: [SomeMixin]`. Fixed by merging mixin members (recursively) in the
  adapter, both in the reachability walk and when building the structure; mixin
  shapes themselves are not emitted. Locked in by unit tests in
  `test/smithy/from_smithy_test.dart` ("@mixin resolution"). The client member
  drop is fixed; the conformance suite can't demonstrate it on
  `OperationWithNestedStructure` because of a separate harness gap (below), so
  those two ops stay excluded.

- **Test-harness gap (not an IR squeeze)** — `buildSmithyProtocolTestSuite`
  emits response tests that call the operation with no arguments
  (`await service.op()`). When the input has a `@required` member that fails to
  compile. `OperationWithNestedStructure` hits this. Fix lives in the test
  builder (synthesize required input for response tests), independent of the
  Smithy transform.

- **#2 `@sparse` / #3 `@default`** — both want a new IR field (`sparse` on
  list/map; `defaultValue` on member) plus builder + (for sparse) runtime
  null-tolerance. Multi-layer; deliberately deferred out of the dormant-flag PR.

- **#4 `bigDecimal → double`** — flagged loud because it's a *silent* numeric
  precision loss. A real fix needs a decimal-capable IR type + runtime support.

## Next-step ordering (when burning these down)
1. (done) `@mixin` — adapter only, real-service correctness.
2. `@default` + `@sparse` — the two compile/behavior excludes; IR extensions.
3. `bigDecimal` precision — correctness for financial services.
4. `intEnum`, union XML, streaming/compression — quality / niche.

#!/usr/bin/env bash
# Regenerate ast/*.json from the vendored .smithy sources.
# Developer-only: needs the Smithy CLI (Java). CI never runs this.
#   ./regenerate.sh                 # rewrite ast/*.json
#   ./regenerate.sh --record-skips  # also bootstrap skip_list.json + exclude_list.json
set -euo pipefail
cd "$(dirname "$0")"

if ! command -v smithy >/dev/null 2>&1; then
  echo "Smithy CLI not found. Install: brew install smithy-lang/tap/smithy-cli" >&2
  exit 1
fi

mkdir -p ast
PROTOCOLS=(awsJson1_0 awsJson1_1 restJson1 restXml awsQuery)
for proto in "${PROTOCOLS[@]}"; do
  echo "Converting $proto ..."
  # Write to a temp file and move into place only on success, so a failed
  # conversion (set -e aborts the loop) never leaves a truncated/partial AST.
  smithy ast --quiet "model/$proto" model/shared > "ast/$proto.json.tmp"
  mv "ast/$proto.json.tmp" "ast/$proto.json"
done
echo "Wrote ast/*.json"

if [[ "${1:-}" == "--record-skips" ]]; then
  echo "Bootstrapping skip-list ..."
  # Developer-only recorder: regenerates the suite, probes every test, and
  # re-seeds skip_list.json + exclude_list.json (then regenerates green).
  (cd .. && dart run tool/record_smithy_skips.dart) || true
fi

## 2.0.1

- Patch signing algorithm for S3 compatibility

## 2.0.0

- Bug fixes in protocols
- Bump package:xml to >=6.0.0

## 1.2.0

- Add `close()` method to protocol classes for closing auto created http client.

## 1.1.0

- Add `credentialsProvider` and `requestSigner` to protocol classes.

## 1.0.1

- Remove string parameter pattern validation due to regex incompatibility.

## 1.0.0

- Null safety
- Bug fixes

## 0.3.0

- Innumerable bug fixes
- Updated service definitions to 2.821.0

## 0.2.4

- Fix header being null in multiple protocols.

## 0.2.3

- Fix crash in query protocol meta-data initialization

## 0.2.2

- Updated implementation of the rest-json protocol.

## 0.2.1

- Fix broken date serialization by unifying naming conventions to `${timeStampFormat}ToJson` and `${timeStampFormat}FromJson`

## 0.2.0

- Fixes and breaking changes in protocol clients.
- Fixed: sending headers with `RestXmlRequest`.

## 0.1.8

- Fixed type conversion issue in `Uint8ListListConverter`.
- Fixed type parameter in extension method.

## 0.1.7

- Fix: export `XmlFindExtension` from `package:xml`.

## 0.1.6

- Auto-detect `AwsClientCredentials`.

## 0.1.5

- Validation functions get an additional `isRequired` parameter.

## 0.1.4

- Fixed `json` protocol signing, enabling the protocol to work.
- Removed `package:sigv4` dependency.

## 0.1.3

- Upgraded `package:sigv4` dependency.

## 0.1.2

- Fixed constraint on `package:http`.

## 0.1.1

- Updated SDK constraint to use Dart 2.7.0 (for extension methods).

## 0.1.0

- Initial release.

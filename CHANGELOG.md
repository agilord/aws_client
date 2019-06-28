# Changelog

## 0.1.3

Thanks to [paulreimer](https://github.com/paulreimer) and [ipconfiger](https://github.com/ipconfiger)!

- Allow 'service' field in AwsRequestBuilder constructor to override detection from uri.
- URI-encoding for path in Request signature.
- Create Queue api.
- SNS Service API support.
- Upgrade to `http_client` `1.0`
- Expanded lints.

## 0.1.2

- Dart 2 support.

## 0.1.1

- Updated to use `http_client` 0.3.0.

## 0.1.0

**Breaking changes**:

- Updated to use `http_client` 0.2.0, which has a slightly different
  API to initialize the HTTP Client.

## 0.0.2

- Enable url-form-encoding (for `POST` requests).
- Use `POST` request for SQS methods (enables larger messages to be sent).

## 0.0.1

- Initial version.
- Support for 3 methods in SQS.

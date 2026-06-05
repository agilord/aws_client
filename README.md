# High-level APIs for Amazon Web Services (AWS) in Dart

This repository contains a single Dart package, [`aws_client`](/aws_client), which
bundles auto-generated clients for all supported AWS APIs together with the shared
runtime, DynamoDB document client and credential providers.

- [`aws_client`](/aws_client) — the published package with all AWS API clients
- [Code generator](/generator) — generates `aws_client` from the AWS SDK for JavaScript API models

## Development

### Generate the APIs

Generated sources are checked into the repository. To regenerate them, run the
following command with the working directory set to the [`generator`](/generator)
folder:

```bash
dart bin/generate.dart generate
```

This downloads the JSON API definitions (if needed) and regenerates the
`aws_client` package and its protocol conformance test suite. See the
[generator README](/generator/README.md) for more options.

# TODO

- Implement EC2 protocol

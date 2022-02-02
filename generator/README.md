# Generating the SDK

In order to generate the SDK from scratch, run the `generate.dart` file, while the working directory is `generator/`.

```bash
dart bin/generate.dart generate
```

This will download the JSON definitions automatically, if needed, from Github at 
`https://api.github.com/repos/aws/aws-sdk-js/zipball/<version>`
, then generate all the services.
The version is specified in the [config file](/generator/config.yaml) as `awsSdkJsReference`.

To force the download, add the `--download` argument:

```bash
dart bin/generate.dart generate --download
```

If you just want to download the definitions, then run:

```bash
dart bin/generate.dart download
```

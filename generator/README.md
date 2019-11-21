# Generating the SDK

In order to generate the SDK from scratch, run the `generate.dart` file:

```bash
dart generate.dart generate --download
```

This will download the JSON definitions first from Github at 
https://api.github.com/repos/aws/aws-sdk-js/zipball/master 
, then generate all the services.

If you are developing the [library_builder.dart](bin/library_builder.dart), it is unnecessary to download the definitions every time. 
To skip the download, omit the `--download` argument:

```bash
dart generate.dart generate
```

If you just want to download the definitions, then run:

```bash
dart generate.dart download
```
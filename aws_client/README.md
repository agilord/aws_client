# High-level APIs for Amazon Web Services (AWS) in Dart

Warning: incomplete, untested, but we accept pull requests :-)

## Usage

A simple usage example:

````dart
import 'package:aws_client/aws_client.dart';
import 'package:http_client/console.dart';

main() async {
  var httpClient = newHttpClient();
  var credentials = new Credentials(accessKey: 'MY_ACCESS_KEY', secretKey: 'MY_SECRET_KEY');
  var aws = new Aws(credentials: credentials, httpClient: httpClient);
  var queue = aws.sqs.queue('https://my-queue-url/number/queue-name');
  await queue.sendMessage('Hello from Dart client!');
  httpClient.close();
}
````

## How to contribute

This library is not an official library from Amazon or Google.
It is developed by best effort, in the motto of _"Scratch your own itch!"_,
meaning we have APIs here that we care about. Looking for contributions:

- tests:

  - never put AWS credentials inside the code
  - read AWS credentials from environment variables in the beginning
  - provide description what setup it needs upfront

- API documentation

- New API contribution:

  - please open an issue ticket first about what you are planning to implement
  - take a look at the implementation of the others, most of the API calls will be similar
  - always include a link to AWS API docs

## Links

- [source code][source]
- contributors: [Agilord][agilord]

[source]: https://github.com/agilord/aws_client
[agilord]: https://www.agilord.com/

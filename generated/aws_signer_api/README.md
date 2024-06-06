# AWS API client for AWS Signer

**Generated Dart library from API specification**

*About the service:*
AWS Signer is a fully managed code-signing service to help you ensure the
trust and integrity of your code.

Signer supports the following applications:

With code signing for AWS Lambda, you can sign <a
href="https://docs.aws.amazon.com/lambda/latest/dg/">AWS Lambda</a>
deployment packages. Integrated support is provided for <a
href="https://docs.aws.amazon.com/AmazonS3/latest/gsg/">Amazon S3</a>, <a
href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/">Amazon
CloudWatch</a>, and <a
href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/">AWS
CloudTrail</a>. In order to sign code, you create a signing profile and then
use Signer to sign Lambda zip files in S3.

With code signing for IoT, you can sign code for any IoT device that is
supported by AWS. IoT code signing is available for <a
href="https://docs.aws.amazon.com/freertos/latest/userguide/">Amazon
FreeRTOS</a> and <a
href="https://docs.aws.amazon.com/iot/latest/developerguide/">AWS IoT Device
Management</a>, and is integrated with <a
href="https://docs.aws.amazon.com/acm/latest/userguide/">AWS Certificate
Manager (ACM)</a>. In order to sign code, you import a third-party
code-signing certificate using ACM, and use that to sign updates in Amazon
FreeRTOS and AWS IoT Device Management.

With Signer and the Notation CLI from the <a
href="https://notaryproject.dev/">Notary&#x2028; Project</a>, you can sign
container images stored in a container registry such as Amazon Elastic
Container Registry (ECR). The signatures are stored in the registry
alongside the images, where they are available for verifying image
authenticity and integrity.

For more information about Signer, see the <a
href="https://docs.aws.amazon.com/signer/latest/developerguide/Welcome.html">AWS
Signer Developer Guide</a>.

## Links

- [Other AWS libraries](https://github.com/agilord/aws_client/tree/master/generated).
- [Issue tracker](https://github.com/agilord/aws_client/issues).
- [AWS API definitions](https://github.com/aws/aws-sdk-js/tree/master/apis).

# AWS Client for Dart

[![pub package](https://img.shields.io/pub/v/aws_client.svg)](https://pub.dev/packages/aws_client)
[![package publisher](https://img.shields.io/pub/publisher/aws_client.svg)](https://pub.dev/packages/aws_client/publisher)
[![likes](https://img.shields.io/pub/likes/aws_client)](https://pub.dev/packages/aws_client/score)
[![pub points](https://img.shields.io/pub/points/aws_client)](https://pub.dev/packages/aws_client/score)

High-level, strongly-typed Dart client libraries for 400+ Amazon Web Services
(AWS) APIs, including S3, DynamoDB, Lambda, SQS, SES, Cognito and IAM. The
libraries are generated from the official AWS service definitions and run on the
Dart VM, Flutter and the web.

## Features

- Coverage of 400+ AWS services, each exposed as a separate library.
- Typed request and response models, removing the need to hand-craft XML or JSON
  payloads.
- Built-in SigV4 request signing with credential resolution from environment
  variables, the shared profile, EC2/ECS instance metadata, STS or a custom
  provider.
- One API surface that runs on the Dart VM, Flutter and the web.

## Credentials

By default the client resolves credentials from the standard AWS sources
(environment variables, the shared `~/.aws/credentials` profile, EC2/ECS
instance metadata, and so on). They can also be passed explicitly:

```dart
final s3 = S3(
  region: 'us-west-1',
  credentials: AwsClientCredentials(
    accessKey: '...',
    secretKey: '...',
  ),
);
```

Credentials can also be loaded from a named profile in the shared
`~/.aws/credentials` file:

```dart
final s3 = S3(
  region: 'us-west-1',
  credentials: AwsClientCredentials.fromProfileFile(profile: 'my-profile'),
);
```

## Usage examples

##### S3
```dart
import 'dart:io';
import 'package:aws_client/s3.dart';

void main() async {
  final api = S3(region: 'us-east-2');
  await api.createBucket(bucket: 'my_bucket');
  await api.putObject(
      bucket: 'my_bucket',
      key: 'my_file.png',
      body: File('my_file.png').readAsBytesSync());
  api.close();
}
```

##### DynamoDB
```dart
import 'dart:convert';
import 'package:aws_client/dynamo_document.dart';

void main() async {
  final db = DocumentClient(region: 'us-east-2');

  final getResponse = await db.get(
    tableName: 'MyTable',
    key: {'Car': 'DudeWheresMyCar'},
  );

  print(jsonEncode(getResponse.item));
}
```

##### SQS
```dart
import 'package:aws_client/sqs.dart';

void main() async {
  final sqs = Sqs(
      region: 'us-east-1',
      credentials: AwsClientCredentials.fromProfileFile(profile: 'prod'));
  final queue = await sqs.createQueue(
      queueName: 'bucket2', attributes: {QueueAttributeName.delaySeconds: '5'});

  print(queue.queueUrl);
  await sqs.deleteQueue(queueUrl: queue.queueUrl!);
  sqs.close();
}
```

##### Lambda
```dart
import 'dart:io';

import 'package:aws_client/lambda.dart';

void main(List<String> args) async {
  final api = Lambda(region: 'us-west-1');

  // List functions
  final functions = await api.listFunctions();
  print(functions.functions);

  // Update code
  await api.updateFunctionCode(
    functionName: 'my_function',
    zipFile: File('code.zip').readAsBytesSync(),
  );

  api.close();
}
```

##### Cognito Identity provider
```dart
import 'package:aws_client/cognito_identity_provider.dart';

void main() async {
  final api = CognitoIdentityProvider(region: 'us-east-1');

  final cognitoPool = 'us-east-1_abc';
  final user = 'email@email.com';

  try {
    await api.adminDeleteUser(userPoolId: cognitoPool, username: user);
  } on ResourceNotFoundException catch (_) {
    // ok
  }

  await api.adminCreateUser(
    userPoolId: cognitoPool,
    username: user,
    temporaryPassword: r'Pass123$$',
    userAttributes: [AttributeType(name: 'email', value: user)],
    clientMetadata: {
      'language': 'fr',
    },
  );

  await api.adminSetUserPassword(
      password: 'newpassword', userPoolId: cognitoPool, username: user);

  api.close();
}
```

##### IAM
```dart
import 'package:aws_client/iam.dart';

void main() async {
  final iam = Iam();

  final users = await iam.listUsers();
  print(users.users.length);

  try {
    final existing = await iam.getRole(roleName: 'my_role');
    final existingPolicies =
        await iam.listRolePolicies(roleName: existing.role.roleName);
    print(existingPolicies);
  } on NoSuchEntityException {
    await iam.createRole(assumeRolePolicyDocument: '''
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}''', roleName: 'my_role');
  }
}
```

##### SES
```dart
import 'package:aws_client/ses_v2.dart';

void main() async {
  final api = SesV2(region: 'eu-central-1');

  final response = await api.sendEmail(
    content: EmailContent(
      simple: Message(
        body: Body(text: Content(data: 'Hello, here is a message')),
        subject: Content(data: 'An email from SES'),
      ),
    ),
    destination: Destination(toAddresses: ['user@email.com']),
    fromEmailAddress: 'from@email.com',
  );
  print(response.messageId);

  api.close();
}
```


## Contributing

This is not an official library from Amazon or Google. It is developed on a
best-effort basis; issues and pull requests are welcome.

## Links

- [source code][source]
- contributors: [Agilord][agilord]

[source]: https://github.com/agilord/aws_client
[agilord]: https://www.agilord.com/

## Available AWS APIs

The following is a list of APIs that are currently available inside this package.

- Access Analyzer (`package:aws_client/access_analyzer.dart`)
- AWS Account (`package:aws_client/account.dart`)
- AWS Certificate Manager Private Certificate Authority (`package:aws_client/acm_pca.dart`)
- AWS Certificate Manager (`package:aws_client/acm.dart`)
- AWS AI Ops (`package:aws_client/ai_ops.dart`)
- Amazon Prometheus Service (`package:aws_client/amp.dart`)
- AWS Amplify (`package:aws_client/amplify.dart`)
- AmplifyBackend (`package:aws_client/amplify_backend.dart`)
- AWS Amplify UI Builder (`package:aws_client/amplify_ui_builder.dart`)
- Amazon API Gateway (`package:aws_client/api_gateway.dart`)
- AmazonApiGatewayManagementApi (`package:aws_client/api_gateway_management_api.dart`)
- AmazonApiGatewayV2 (`package:aws_client/api_gateway_v2.dart`)
- AWS App Mesh (`package:aws_client/app_mesh.dart`)
- Amazon AppConfig (`package:aws_client/app_config.dart`)
- AWS AppConfig Data (`package:aws_client/app_config_data.dart`)
- AppFabric (`package:aws_client/app_fabric.dart`)
- Amazon Appflow (`package:aws_client/appflow.dart`)
- Amazon AppIntegrations Service (`package:aws_client/app_integrations.dart`)
- Application Auto Scaling (`package:aws_client/application_auto_scaling.dart`)
- AWS Application Discovery Service (`package:aws_client/application_discovery_service.dart`)
- Amazon CloudWatch Application Insights (`package:aws_client/application_insights.dart`)
- Amazon CloudWatch Application Signals (`package:aws_client/application_signals.dart`)
- AWS Application Cost Profiler (`package:aws_client/application_cost_profiler.dart`)
- AWS App Runner (`package:aws_client/app_runner.dart`)
- Amazon AppStream (`package:aws_client/app_stream.dart`)
- AWS AppSync (`package:aws_client/app_sync.dart`)
- ARC - Region switch (`package:aws_client/arc_region_switch.dart`)
- AWS ARC - Zonal Shift (`package:aws_client/arc_zonal_shift.dart`)
- AWS Artifact (`package:aws_client/artifact.dart`)
- Amazon Athena (`package:aws_client/athena.dart`)
- AWS Audit Manager (`package:aws_client/audit_manager.dart`)
- AWS Auto Scaling Plans (`package:aws_client/auto_scaling_plans.dart`)
- Auto Scaling (`package:aws_client/auto_scaling.dart`)
- AWS B2B Data Interchange (`package:aws_client/b2_bi.dart`)
- AWS Backup Gateway (`package:aws_client/backup_gateway.dart`)
- AWS Backup (`package:aws_client/backup.dart`)
- AWS Backup Search (`package:aws_client/backup_search.dart`)
- AWS Batch (`package:aws_client/batch.dart`)
- AWS Billing and Cost Management Dashboards (`package:aws_client/bcm_dashboards.dart`)
- AWS Billing and Cost Management Data Exports (`package:aws_client/bcm_data_exports.dart`)
- AWS Billing and Cost Management Pricing Calculator (`package:aws_client/bcm_pricing_calculator.dart`)
- AWS Billing and Cost Management Recommended Actions (`package:aws_client/bcm_recommended_actions.dart`)
- Agents for Amazon Bedrock Runtime (`package:aws_client/bedrock_agent_runtime.dart`)
- Agents for Amazon Bedrock (`package:aws_client/bedrock_agent.dart`)
- Amazon Bedrock AgentCore Control (`package:aws_client/bedrock_agent_core_control.dart`)
- Amazon Bedrock AgentCore (`package:aws_client/bedrock_agent_core.dart`)
- Runtime for Amazon Bedrock Data Automation (`package:aws_client/bedrock_data_automation_runtime.dart`)
- Data Automation for Amazon Bedrock (`package:aws_client/bedrock_data_automation.dart`)
- Amazon Bedrock Runtime (`package:aws_client/bedrock_runtime.dart`)
- Amazon Bedrock (`package:aws_client/bedrock.dart`)
- AWS Billing (`package:aws_client/billing.dart`)
- AWSBillingConductor (`package:aws_client/billingconductor.dart`)
- Braket (`package:aws_client/braket.dart`)
- AWS Budgets (`package:aws_client/budgets.dart`)
- AWS Chatbot (`package:aws_client/chatbot.dart`)
- Amazon Chime SDK Identity (`package:aws_client/chime_sdk_identity.dart`)
- Amazon Chime SDK Media Pipelines (`package:aws_client/chime_sdk_media_pipelines.dart`)
- Amazon Chime SDK Meetings (`package:aws_client/chime_sdk_meetings.dart`)
- Amazon Chime SDK Messaging (`package:aws_client/chime_sdk_messaging.dart`)
- Amazon Chime SDK Voice (`package:aws_client/chime_sdk_voice.dart`)
- Amazon Chime (`package:aws_client/chime.dart`)
- AWS Clean Rooms Service (`package:aws_client/clean_rooms.dart`)
- AWS Clean Rooms ML (`package:aws_client/clean_rooms_ml.dart`)
- AWS Cloud9 (`package:aws_client/cloud9.dart`)
- AWS Cloud Control API (`package:aws_client/cloud_control.dart`)
- Amazon CloudDirectory (`package:aws_client/cloud_directory.dart`)
- AWS CloudFormation (`package:aws_client/cloud_formation.dart`)
- Amazon CloudFront KeyValueStore (`package:aws_client/cloud_front_key_value_store.dart`)
- Amazon CloudFront (`package:aws_client/cloud_front.dart`)
- AWS CloudHSM V2 (`package:aws_client/cloud_hsm_v2.dart`)
- Amazon CloudHSM (`package:aws_client/cloud_hsm.dart`)
- Amazon CloudSearch Domain (`package:aws_client/cloud_search_domain.dart`)
- Amazon CloudSearch (`package:aws_client/cloud_search.dart`)
- AWS CloudTrail Data Service (`package:aws_client/cloud_trail_data.dart`)
- AWS CloudTrail (`package:aws_client/cloud_trail.dart`)
- Amazon CloudWatch Events (`package:aws_client/cloud_watch_events.dart`)
- Amazon CloudWatch Logs (`package:aws_client/cloud_watch_logs.dart`)
- Amazon CloudWatch (`package:aws_client/cloud_watch.dart`)
- CodeArtifact (`package:aws_client/codeartifact.dart`)
- AWS CodeBuild (`package:aws_client/code_build.dart`)
- Amazon CodeCatalyst (`package:aws_client/code_catalyst.dart`)
- AWS CodeCommit (`package:aws_client/code_commit.dart`)
- AWS CodeConnections (`package:aws_client/code_connections.dart`)
- AWS CodeDeploy (`package:aws_client/code_deploy.dart`)
- Amazon CodeGuru Reviewer (`package:aws_client/code_guru_reviewer.dart`)
- Amazon CodeGuru Security (`package:aws_client/code_guru_security.dart`)
- Amazon CodeGuru Profiler (`package:aws_client/code_guru_profiler.dart`)
- AWS CodePipeline (`package:aws_client/code_pipeline.dart`)
- AWS CodeStar connections (`package:aws_client/code_star_connections.dart`)
- AWS CodeStar Notifications (`package:aws_client/codestar_notifications.dart`)
- Amazon Cognito Identity Provider (`package:aws_client/cognito_identity_provider.dart`)
- Amazon Cognito Identity (`package:aws_client/cognito_identity.dart`)
- Amazon Cognito Sync (`package:aws_client/cognito_sync.dart`)
- Amazon Comprehend (`package:aws_client/comprehend.dart`)
- AWS Comprehend Medical (`package:aws_client/comprehend_medical.dart`)
- Compute Optimizer Automation (`package:aws_client/compute_optimizer_automation.dart`)
- AWS Compute Optimizer (`package:aws_client/compute_optimizer.dart`)
- AWS Config (`package:aws_client/config_service.dart`)
- Amazon Connect Contact Lens (`package:aws_client/connect_contact_lens.dart`)
- Amazon Connect Service (`package:aws_client/connect.dart`)
- AmazonConnectCampaignService (`package:aws_client/connect_campaigns.dart`)
- AmazonConnectCampaignServiceV2 (`package:aws_client/connect_campaigns_v2.dart`)
- Amazon Connect Cases (`package:aws_client/connect_cases.dart`)
- Connect Health (`package:aws_client/connect_health.dart`)
- Amazon Connect Participant Service (`package:aws_client/connect_participant.dart`)
- AWS Control Catalog (`package:aws_client/control_catalog.dart`)
- AWS Control Tower (`package:aws_client/control_tower.dart`)
- AWS Cost and Usage Report Service (`package:aws_client/cost_and_usage_report_service.dart`)
- AWS Cost Explorer Service (`package:aws_client/cost_explorer.dart`)
- Cost Optimization Hub (`package:aws_client/cost_optimization_hub.dart`)
- Amazon Connect Customer Profiles (`package:aws_client/customer_profiles.dart`)
- AWS Data Pipeline (`package:aws_client/data_pipeline.dart`)
- AWS Database Migration Service (`package:aws_client/database_migration_service.dart`)
- AWS Glue DataBrew (`package:aws_client/data_brew.dart`)
- AWS Data Exchange (`package:aws_client/data_exchange.dart`)
- AWS DataSync (`package:aws_client/data_sync.dart`)
- Amazon DataZone (`package:aws_client/data_zone.dart`)
- Amazon DynamoDB Accelerator (DAX) (`package:aws_client/dax.dart`)
- AWSDeadlineCloud (`package:aws_client/deadline.dart`)
- Amazon Detective (`package:aws_client/detective.dart`)
- AWS Device Farm (`package:aws_client/device_farm.dart`)
- AWS DevOps Agent Service (`package:aws_client/dev_ops_agent.dart`)
- Amazon DevOps Guru (`package:aws_client/dev_ops_guru.dart`)
- AWS Direct Connect (`package:aws_client/direct_connect.dart`)
- AWS Directory Service Data (`package:aws_client/directory_service_data.dart`)
- AWS Directory Service (`package:aws_client/directory_service.dart`)
- Amazon Data Lifecycle Manager (`package:aws_client/dlm.dart`)
- Amazon DocumentDB Elastic Clusters (`package:aws_client/doc_db_elastic.dart`)
- Amazon DocumentDB with MongoDB compatibility (`package:aws_client/doc_db.dart`)
- Elastic Disaster Recovery Service (`package:aws_client/drs.dart`)
- Amazon Aurora DSQL (`package:aws_client/dsql.dart`)
- Amazon DynamoDB Streams (`package:aws_client/dynamo_db_streams.dart`)
- Amazon DynamoDB (`package:aws_client/dynamo_db.dart`)
- Amazon Elastic Block Store (`package:aws_client/ebs.dart`)
- AWS EC2 Instance Connect (`package:aws_client/ec2_instance_connect.dart`)
- Amazon Elastic Container Registry Public (`package:aws_client/ecr_public.dart`)
- Amazon Elastic Container Registry (`package:aws_client/ecr.dart`)
- Amazon EC2 Container Service (`package:aws_client/ecs.dart`)
- Amazon Elastic File System (`package:aws_client/efs.dart`)
- Amazon EKS Auth (`package:aws_client/eks_auth.dart`)
- Amazon Elastic Kubernetes Service (`package:aws_client/eks.dart`)
- AWS Elastic Beanstalk (`package:aws_client/elastic_beanstalk.dart`)
- Elastic Load Balancing (`package:aws_client/elastic_load_balancing_v2.dart`)
- Elastic Load Balancing (`package:aws_client/elastic_load_balancing.dart`)
- Amazon ElastiCache (`package:aws_client/elasti_cache.dart`)
- Amazon Elasticsearch Service (`package:aws_client/elasticsearch_service.dart`)
- AWS Elemental Inference (`package:aws_client/elemental_inference.dart`)
- Amazon EMR Containers (`package:aws_client/emr_containers.dart`)
- EMR Serverless (`package:aws_client/emr_serverless.dart`)
- Amazon EMR (`package:aws_client/emr.dart`)
- AWS EntityResolution (`package:aws_client/entity_resolution.dart`)
- Amazon EventBridge (`package:aws_client/event_bridge.dart`)
- Amazon Elastic VMware Service (`package:aws_client/evs.dart`)
- FinSpace Public API (`package:aws_client/finspace_data.dart`)
- FinSpace User Environment Management service (`package:aws_client/finspace.dart`)
- Amazon Kinesis Firehose (`package:aws_client/firehose.dart`)
- AWS Fault Injection Simulator (`package:aws_client/fis.dart`)
- Firewall Management Service (`package:aws_client/fms.dart`)
- Amazon Forecast Service (`package:aws_client/forecast.dart`)
- Amazon Forecast Query Service (`package:aws_client/forecastquery.dart`)
- Amazon Fraud Detector (`package:aws_client/fraud_detector.dart`)
- AWS Free Tier (`package:aws_client/free_tier.dart`)
- Amazon FSx (`package:aws_client/f_sx.dart`)
- Amazon GameLift (`package:aws_client/game_lift.dart`)
- Amazon GameLift Streams (`package:aws_client/game_lift_streams.dart`)
- Amazon Location Service Maps V2 (`package:aws_client/geo_maps.dart`)
- Amazon Location Service Places V2 (`package:aws_client/geo_places.dart`)
- Amazon Location Service Routes V2 (`package:aws_client/geo_routes.dart`)
- Amazon Glacier (`package:aws_client/glacier.dart`)
- AWS Global Accelerator (`package:aws_client/global_accelerator.dart`)
- AWS Glue (`package:aws_client/glue.dart`)
- Amazon Managed Grafana (`package:aws_client/grafana.dart`)
- AWS Greengrass (`package:aws_client/greengrass.dart`)
- AWS IoT Greengrass V2 (`package:aws_client/greengrass_v2.dart`)
- AWS Ground Station (`package:aws_client/ground_station.dart`)
- Amazon GuardDuty (`package:aws_client/guard_duty.dart`)
- AWS Health APIs and Notifications (`package:aws_client/health.dart`)
- Amazon HealthLake (`package:aws_client/health_lake.dart`)
- AWS Identity and Access Management (`package:aws_client/iam.dart`)
- AWS SSO Identity Store (`package:aws_client/identitystore.dart`)
- EC2 Image Builder (`package:aws_client/imagebuilder.dart`)
- Inspector Scan (`package:aws_client/inspector_scan.dart`)
- Amazon Inspector (`package:aws_client/inspector.dart`)
- Inspector2 (`package:aws_client/inspector2.dart`)
- Interconnect (`package:aws_client/interconnect.dart`)
- Amazon CloudWatch Internet Monitor (`package:aws_client/internet_monitor.dart`)
- AWS Invoicing (`package:aws_client/invoicing.dart`)
- AWS IoT Data Plane (`package:aws_client/iot_data_plane.dart`)
- AWS IoT Events Data (`package:aws_client/iot_events_data.dart`)
- AWS IoT Events (`package:aws_client/iot_events.dart`)
- AWS IoT Jobs Data Plane (`package:aws_client/iot_jobs_data_plane.dart`)
- Managed integrations for AWS IoT Device Management (`package:aws_client/iot_managed_integrations.dart`)
- AWS IoT Wireless (`package:aws_client/iot_wireless.dart`)
- AWS IoT (`package:aws_client/iot.dart`)
- AWS IoT Core Device Advisor (`package:aws_client/iot_device_advisor.dart`)
- AWS IoT FleetWise (`package:aws_client/iot_fleet_wise.dart`)
- AWS IoT Secure Tunneling (`package:aws_client/iot_secure_tunneling.dart`)
- AWS IoT SiteWise (`package:aws_client/iot_site_wise.dart`)
- AWS IoT Things Graph (`package:aws_client/iot_things_graph.dart`)
- AWS IoT TwinMaker (`package:aws_client/iot_twin_maker.dart`)
- Amazon Interactive Video Service RealTime (`package:aws_client/ivs_real_time.dart`)
- Amazon Interactive Video Service (`package:aws_client/ivs.dart`)
- Amazon Interactive Video Service Chat (`package:aws_client/ivschat.dart`)
- Managed Streaming for Kafka (`package:aws_client/kafka.dart`)
- Managed Streaming for Kafka Connect (`package:aws_client/kafka_connect.dart`)
- Amazon Kendra Intelligent Ranking (`package:aws_client/kendra_ranking.dart`)
- AWSKendraFrontendService (`package:aws_client/kendra.dart`)
- Amazon Keyspaces (`package:aws_client/keyspaces.dart`)
- Amazon Keyspaces Streams (`package:aws_client/keyspaces_streams.dart`)
- Amazon Kinesis Analytics (`package:aws_client/kinesis_analytics_v2.dart`)
- Amazon Kinesis Analytics (`package:aws_client/kinesis_analytics.dart`)
- Amazon Kinesis Video Streams Archived Media (`package:aws_client/kinesis_video_archived_media.dart`)
- Amazon Kinesis Video Streams Media (`package:aws_client/kinesis_video_media.dart`)
- Amazon Kinesis Video Signaling Channels (`package:aws_client/kinesis_video_signaling.dart`)
- Amazon Kinesis Video WebRTC Storage (`package:aws_client/kinesis_video_web_rtc_storage.dart`)
- Amazon Kinesis Video Streams (`package:aws_client/kinesis_video.dart`)
- Amazon Kinesis (`package:aws_client/kinesis.dart`)
- AWS Key Management Service (`package:aws_client/kms.dart`)
- AWS Lake Formation (`package:aws_client/lake_formation.dart`)
- AWS Lambda (`package:aws_client/lambda.dart`)
- AWS Launch Wizard (`package:aws_client/launch_wizard.dart`)
- Amazon Lex Model Building Service (`package:aws_client/lex_model_building_service.dart`)
- Amazon Lex Model Building V2 (`package:aws_client/lex_models_v2.dart`)
- Amazon Lex Runtime Service (`package:aws_client/lex_runtime_service.dart`)
- Amazon Lex Runtime V2 (`package:aws_client/lex_runtime_v2.dart`)
- AWS License Manager Linux Subscriptions (`package:aws_client/license_manager_linux_subscriptions.dart`)
- AWS License Manager User Subscriptions (`package:aws_client/license_manager_user_subscriptions.dart`)
- AWS License Manager (`package:aws_client/license_manager.dart`)
- Amazon Lightsail (`package:aws_client/lightsail.dart`)
- Amazon Location Service (`package:aws_client/location.dart`)
- Amazon Lookout for Equipment (`package:aws_client/lookout_equipment.dart`)
- AWSMainframeModernization (`package:aws_client/m2.dart`)
- Amazon Machine Learning (`package:aws_client/machine_learning.dart`)
- Amazon Macie 2 (`package:aws_client/macie2.dart`)
- MailManager (`package:aws_client/mail_manager.dart`)
- Amazon Managed Blockchain Query (`package:aws_client/managed_blockchain_query.dart`)
- Amazon Managed Blockchain (`package:aws_client/managed_blockchain.dart`)
- AWS Marketplace Agreement Service (`package:aws_client/marketplace_agreement.dart`)
- AWS Marketplace Catalog Service (`package:aws_client/marketplace_catalog.dart`)
- AWS Marketplace Commerce Analytics (`package:aws_client/marketplace_commerce_analytics.dart`)
- AWS Marketplace Deployment Service (`package:aws_client/marketplace_deployment.dart`)
- AWS Marketplace Discovery (`package:aws_client/marketplace_discovery.dart`)
- AWS Marketplace Entitlement Service (`package:aws_client/marketplace_entitlement_service.dart`)
- AWSMarketplace Metering (`package:aws_client/marketplace_metering.dart`)
- AWS Marketplace Reporting Service (`package:aws_client/marketplace_reporting.dart`)
- AWS MediaConnect (`package:aws_client/media_connect.dart`)
- AWS Elemental MediaConvert (`package:aws_client/media_convert.dart`)
- AWS Elemental MediaLive (`package:aws_client/media_live.dart`)
- AWS Elemental MediaPackage VOD (`package:aws_client/media_package_vod.dart`)
- AWS Elemental MediaPackage (`package:aws_client/media_package.dart`)
- AWS Elemental MediaPackage v2 (`package:aws_client/media_package_v2.dart`)
- AWS Elemental MediaStore Data Plane (`package:aws_client/media_store_data.dart`)
- AWS Elemental MediaStore (`package:aws_client/media_store.dart`)
- AWS MediaTailor (`package:aws_client/media_tailor.dart`)
- AWS Health Imaging (`package:aws_client/medical_imaging.dart`)
- Amazon MemoryDB (`package:aws_client/memory_db.dart`)
- Application Migration Service (`package:aws_client/mgn.dart`)
- AWS Migration Hub Refactor Spaces (`package:aws_client/migration_hub_refactor_spaces.dart`)
- AWS Migration Hub (`package:aws_client/migration_hub.dart`)
- AWS Migration Hub Config (`package:aws_client/migration_hub_config.dart`)
- AWS Migration Hub Orchestrator (`package:aws_client/migration_hub_orchestrator.dart`)
- Migration Hub Strategy Recommendations (`package:aws_client/migration_hub_strategy.dart`)
- AWS Multi-party Approval (`package:aws_client/mpa.dart`)
- AmazonMQ (`package:aws_client/mq.dart`)
- Amazon Mechanical Turk (`package:aws_client/m_turk.dart`)
- AmazonMWAAServerless (`package:aws_client/mwaa_serverless.dart`)
- AmazonMWAA (`package:aws_client/mwaa.dart`)
- Amazon Neptune Graph (`package:aws_client/neptune_graph.dart`)
- Amazon Neptune (`package:aws_client/neptune.dart`)
- Amazon NeptuneData (`package:aws_client/neptunedata.dart`)
- AWS Network Firewall (`package:aws_client/network_firewall.dart`)
- Network Flow Monitor (`package:aws_client/network_flow_monitor.dart`)
- AWS Network Manager (`package:aws_client/network_manager.dart`)
- Amazon CloudWatch Network Monitor (`package:aws_client/network_monitor.dart`)
- AWS User Notifications (`package:aws_client/notifications.dart`)
- AWS User Notifications Contacts (`package:aws_client/notifications_contacts.dart`)
- Nova Act Service (`package:aws_client/nova_act.dart`)
- CloudWatch Observability Access Manager (`package:aws_client/oam.dart`)
- CloudWatch Observability Admin Service (`package:aws_client/observability_admin.dart`)
- odb (`package:aws_client/odb.dart`)
- Amazon Omics (`package:aws_client/omics.dart`)
- Amazon OpenSearch Service (`package:aws_client/open_search.dart`)
- OpenSearch Service Serverless (`package:aws_client/open_search_serverless.dart`)
- AWS Organizations (`package:aws_client/organizations.dart`)
- Amazon OpenSearch Ingestion (`package:aws_client/osis.dart`)
- AWS Outposts (`package:aws_client/outposts.dart`)
- AWS Panorama (`package:aws_client/panorama.dart`)
- Partner Central Account API (`package:aws_client/partner_central_account.dart`)
- Partner Central Benefits API (`package:aws_client/partner_central_benefits.dart`)
- Partner Central Channel API (`package:aws_client/partner_central_channel.dart`)
- Partner Central Selling API (`package:aws_client/partner_central_selling.dart`)
- Payment Cryptography Data Plane (`package:aws_client/payment_cryptography_data.dart`)
- Payment Cryptography Control Plane (`package:aws_client/payment_cryptography.dart`)
- PcaConnectorAd (`package:aws_client/pca_connector_ad.dart`)
- Private CA Connector for SCEP (`package:aws_client/pca_connector_scep.dart`)
- AWS Parallel Computing Service (`package:aws_client/pcs.dart`)
- Amazon Personalize Events (`package:aws_client/personalize_events.dart`)
- Amazon Personalize Runtime (`package:aws_client/personalize_runtime.dart`)
- Amazon Personalize (`package:aws_client/personalize.dart`)
- AWS Performance Insights (`package:aws_client/pi.dart`)
- Amazon Pinpoint Email Service (`package:aws_client/pinpoint_email.dart`)
- Amazon Pinpoint SMS Voice V2 (`package:aws_client/pinpoint_sms_voice_v2.dart`)
- Amazon Pinpoint SMS and Voice Service (`package:aws_client/pinpoint_sms_voice.dart`)
- Amazon Pinpoint (`package:aws_client/pinpoint.dart`)
- Amazon EventBridge Pipes (`package:aws_client/pipes.dart`)
- Amazon Polly (`package:aws_client/polly.dart`)
- AWS Price List Service (`package:aws_client/pricing.dart`)
- AWS Proton (`package:aws_client/proton.dart`)
- QApps (`package:aws_client/q_apps.dart`)
- QBusiness (`package:aws_client/q_business.dart`)
- Amazon Q Connect (`package:aws_client/q_connect.dart`)
- Amazon QuickSight (`package:aws_client/quick_sight.dart`)
- AWS Resource Access Manager (`package:aws_client/ram.dart`)
- Amazon Recycle Bin (`package:aws_client/rbin.dart`)
- AWS RDS DataService (`package:aws_client/rds_data.dart`)
- Amazon Relational Database Service (`package:aws_client/rds.dart`)
- Redshift Data API Service (`package:aws_client/redshift_data.dart`)
- Redshift Serverless (`package:aws_client/redshift_serverless.dart`)
- Amazon Redshift (`package:aws_client/redshift.dart`)
- Amazon Rekognition (`package:aws_client/rekognition.dart`)
- Amazon Rekognition Streaming (`package:aws_client/rekognition_streaming.dart`)
- AWS re:Post Private (`package:aws_client/repostspace.dart`)
- AWS Resilience Hub (`package:aws_client/resiliencehub.dart`)
- AWS Resilience Hub V2 (`package:aws_client/resiliencehubv2.dart`)
- AWS Resource Explorer (`package:aws_client/resource_explorer_2.dart`)
- AWS Resource Groups Tagging API (`package:aws_client/resource_groups_tagging_api.dart`)
- AWS Resource Groups (`package:aws_client/resource_groups.dart`)
- IAM Roles Anywhere (`package:aws_client/roles_anywhere.dart`)
- Amazon Route 53 Domains (`package:aws_client/route_53_domains.dart`)
- Amazon Route 53 (`package:aws_client/route_53.dart`)
- Route53 Recovery Cluster (`package:aws_client/route_53_recovery_cluster.dart`)
- AWS Route53 Recovery Control Config (`package:aws_client/route_53_recovery_control_config.dart`)
- AWS Route53 Recovery Readiness (`package:aws_client/route_53_recovery_readiness.dart`)
- Amazon Route 53 Global Resolver (`package:aws_client/route_53_global_resolver.dart`)
- Route 53 Profiles (`package:aws_client/route_53_profiles.dart`)
- Amazon Route 53 Resolver (`package:aws_client/route_53_resolver.dart`)
- RTBFabric (`package:aws_client/rtb_fabric.dart`)
- CloudWatch RUM (`package:aws_client/rum.dart`)
- AWS S3 Control (`package:aws_client/s3_control.dart`)
- Amazon Simple Storage Service (`package:aws_client/s3.dart`)
- Amazon S3 Files (`package:aws_client/s3_files.dart`)
- Amazon S3 on Outposts (`package:aws_client/s3_outposts.dart`)
- Amazon S3 Tables (`package:aws_client/s3_tables.dart`)
- Amazon S3 Vectors (`package:aws_client/s3_vectors.dart`)
- Amazon Augmented AI Runtime (`package:aws_client/sage_maker_a2i_runtime.dart`)
- Amazon Sagemaker Edge Manager (`package:aws_client/sagemaker_edge.dart`)
- Amazon SageMaker Feature Store Runtime (`package:aws_client/sage_maker_feature_store_runtime.dart`)
- Amazon SageMaker geospatial capabilities (`package:aws_client/sage_maker_geospatial.dart`)
- Amazon SageMaker Metrics Service (`package:aws_client/sage_maker_metrics.dart`)
- Amazon SageMaker Runtime HTTP2 (`package:aws_client/sage_maker_runtime_http2.dart`)
- Amazon SageMaker Runtime (`package:aws_client/sage_maker_runtime.dart`)
- Amazon SageMaker Service (`package:aws_client/sage_maker.dart`)
- Sagemaker Job Runtime Service (`package:aws_client/sagemaker_job_runtime.dart`)
- AWS Savings Plans (`package:aws_client/savingsplans.dart`)
- Amazon EventBridge Scheduler (`package:aws_client/scheduler.dart`)
- Schemas (`package:aws_client/schemas.dart`)
- AWS Secrets Manager (`package:aws_client/secrets_manager.dart`)
- Security Incident Response (`package:aws_client/security_ir.dart`)
- AWS Security Agent (`package:aws_client/security_agent.dart`)
- AWS SecurityHub (`package:aws_client/security_hub.dart`)
- Amazon Security Lake (`package:aws_client/security_lake.dart`)
- AWSServerlessApplicationRepository (`package:aws_client/serverless_application_repository.dart`)
- AWS Service Catalog App Registry (`package:aws_client/service_catalog_app_registry.dart`)
- AWS Service Catalog (`package:aws_client/service_catalog.dart`)
- Service Quotas (`package:aws_client/service_quotas.dart`)
- AWS Cloud Map (`package:aws_client/service_discovery.dart`)
- Amazon Simple Email Service (`package:aws_client/ses.dart`)
- Amazon Simple Email Service (`package:aws_client/ses_v2.dart`)
- AWS Step Functions (`package:aws_client/sfn.dart`)
- AWS Shield (`package:aws_client/shield.dart`)
- AWS Signer Data Plane (`package:aws_client/signer_data.dart`)
- AWS Signer (`package:aws_client/signer.dart`)
- AWS Sign-In Service (`package:aws_client/signin.dart`)
- Amazon SimpleDB v2 (`package:aws_client/simpled_bv2.dart`)
- AWS SimSpace Weaver (`package:aws_client/sim_space_weaver.dart`)
- AWS Snow Device Management (`package:aws_client/snow_device_management.dart`)
- Amazon Import/Export Snowball (`package:aws_client/snowball.dart`)
- Amazon Simple Notification Service (`package:aws_client/sns.dart`)
- AWS End User Messaging Social (`package:aws_client/social_messaging.dart`)
- Amazon Simple Queue Service (`package:aws_client/sqs.dart`)
- AWS Systems Manager Incident Manager Contacts (`package:aws_client/ssm_contacts.dart`)
- AWS SSM-GUIConnect (`package:aws_client/ssm_gui_connect.dart`)
- AWS Systems Manager Incident Manager (`package:aws_client/ssm_incidents.dart`)
- AWS Systems Manager QuickSetup (`package:aws_client/ssm_quick_setup.dart`)
- AWS Systems Manager for SAP (`package:aws_client/ssm_sap.dart`)
- Amazon Simple Systems Manager (SSM) (`package:aws_client/ssm.dart`)
- AWS Single Sign-On Admin (`package:aws_client/sso_admin.dart`)
- AWS SSO OIDC (`package:aws_client/sso_oidc.dart`)
- AWS Single Sign-On (`package:aws_client/sso.dart`)
- AWS Storage Gateway (`package:aws_client/storage_gateway.dart`)
- AWS Security Token Service (`package:aws_client/sts.dart`)
- AWS Supply Chain (`package:aws_client/supply_chain.dart`)
- AWS Support App (`package:aws_client/support_app.dart`)
- AWS Support (`package:aws_client/support.dart`)
- AWS Sustainability (`package:aws_client/sustainability.dart`)
- Amazon Simple Workflow Service (`package:aws_client/swf.dart`)
- Synthetics (`package:aws_client/synthetics.dart`)
- Tax Settings (`package:aws_client/tax_settings.dart`)
- Amazon Textract (`package:aws_client/textract.dart`)
- Timestream InfluxDB (`package:aws_client/timestream_influx_db.dart`)
- Amazon Timestream Query (`package:aws_client/timestream_query.dart`)
- Amazon Timestream Write (`package:aws_client/timestream_write.dart`)
- AWS Telco Network Builder (`package:aws_client/tnb.dart`)
- Amazon Transcribe Streaming Service (`package:aws_client/transcribe_streaming.dart`)
- Amazon Transcribe Service (`package:aws_client/transcribe.dart`)
- AWS Transfer Family (`package:aws_client/transfer.dart`)
- Amazon Translate (`package:aws_client/translate.dart`)
- TrustedAdvisor Public API (`package:aws_client/trusted_advisor.dart`)
- AWS User Experience Customization (`package:aws_client/uxc.dart`)
- Amazon Verified Permissions (`package:aws_client/verified_permissions.dart`)
- Amazon Voice ID (`package:aws_client/voice_id.dart`)
- Amazon VPC Lattice (`package:aws_client/vpc_lattice.dart`)
- AWS WAF Regional (`package:aws_client/waf_regional.dart`)
- AWS WAF (`package:aws_client/waf.dart`)
- AWS WAFV2 (`package:aws_client/wafv2.dart`)
- AWS Well-Architected Tool (`package:aws_client/well_architected.dart`)
- AWS Wickr Admin API (`package:aws_client/wickr.dart`)
- Amazon Connect Wisdom Service (`package:aws_client/wisdom.dart`)
- Amazon WorkDocs (`package:aws_client/work_docs.dart`)
- Amazon WorkMail (`package:aws_client/work_mail.dart`)
- Amazon WorkMail Message Flow (`package:aws_client/work_mail_message_flow.dart`)
- Amazon Workspaces Instances (`package:aws_client/workspaces_instances.dart`)
- Amazon WorkSpaces Thin Client (`package:aws_client/work_spaces_thin_client.dart`)
- Amazon WorkSpaces Web (`package:aws_client/work_spaces_web.dart`)
- Amazon WorkSpaces (`package:aws_client/work_spaces.dart`)
- AWS X-Ray (`package:aws_client/x_ray.dart`)
# High-level APIs for Amazon Web Services (AWS) in Dart

## Usage

A simple usage example:

##### S3
```dart
import 'dart:io';
import 'package:aws_client/s3_2006_03_01.dart';

void main() async {
  final api = S3(region: 'us-west-1');
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
  final db = DocumentClient(region: 'us-west-1');

  final getResponse = await db.get(
    tableName: 'MyTable',
    key: {'Car': 'DudeWheresMyCar'},
  );

  print(jsonEncode(getResponse.item));
}
```

##### SQS
```dart
import 'package:aws_client/sqs_2012_11_05.dart';

void main() async {
  final sqs = Sqs(region: 'us-west-1');
  final queue = await sqs.createQueue(queueName: 'queue');
  await sqs.sendMessage(
          messageBody: 'Hello from Dart client!', queueUrl: queue.queueUrl!);
  sqs.close();
}
```

##### Lambda
```dart
import 'package:aws_client/lambda_2015_03_31.dart';

void main(List<String> args) async {
  final lambda = Lambda(region: 'us-west-1');
  final response = await lambda.invoke(
    functionName: 'my-function',
    invocationType: InvocationType.requestResponse,
  );

  print('StatusCode: ${response.statusCode}');
  lambda.close();
}
```

##### Cognito Identity provider

```dart
import 'package:aws_client/cognito_identity_provider_2016_04_18.dart';

void main() async {
  final api = CognitoIdentityProvider(region: 'us-west-1');

  final cognitoPool = 'us-west-1_abc';
  final user = 'email@email.com';
  
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

  await api.adminDeleteUser(userPoolId: cognitoPool, username: user);

  api.close();
}
```

##### IAM
```dart
import 'package:aws_client/iam_2010_05_08.dart';

void main() async {
  final iam = Iam();

  final users = await iam.listUsers();
  print(users.users.length);

  iam.close();
}
```

##### SES
```dart
import 'package:aws_client/ses_v2_2019_09_27.dart';

void main() async {
  final api = SesV2(region: 'us-west-1');

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

## Available AWS APIs

The following is a list of APIs that are currently available inside this package.

- AWS Migration Hub (`package:aws_client/migration_hub`)
- Access Analyzer (`package:aws_client/access_analyzer`)
- AWS Account (`package:aws_client/account`)
- AWS Certificate Manager (`package:aws_client/acm`)
- AWS Certificate Manager Private Certificate Authority (`package:aws_client/acm_pca`)
- Alexa For Business (`package:aws_client/alexa_for_business`)
- Amazon Prometheus Service (`package:aws_client/amp`)
- AWS Amplify (`package:aws_client/amplify`)
- AmplifyBackend (`package:aws_client/amplify_backend`)
- AWS Amplify UI Builder (`package:aws_client/amplify_ui_builder`)
- Amazon API Gateway (`package:aws_client/api_gateway`)
- AmazonApiGatewayManagementApi (`package:aws_client/api_gateway_management_api`)
- AmazonApiGatewayV2 (`package:aws_client/api_gateway_v2`)
- Amazon AppConfig (`package:aws_client/app_config`)
- AWS AppConfig Data (`package:aws_client/app_config_data`)
- AppFabric (`package:aws_client/app_fabric`)
- Amazon Appflow (`package:aws_client/appflow`)
- Amazon AppIntegrations Service (`package:aws_client/app_integrations`)
- Application Auto Scaling (`package:aws_client/application_auto_scaling`)
- Amazon CloudWatch Application Insights (`package:aws_client/application_insights`)
- AWS Application Cost Profiler (`package:aws_client/application_cost_profiler`)
- AWS App Mesh (`package:aws_client/app_mesh`)
- AWS App Runner (`package:aws_client/app_runner`)
- Amazon AppStream (`package:aws_client/app_stream`)
- AWS AppSync (`package:aws_client/app_sync`)
- AWS ARC - Zonal Shift (`package:aws_client/arc_zonal_shift`)
- AWS Artifact (`package:aws_client/artifact`)
- Amazon Athena (`package:aws_client/athena`)
- AWS Audit Manager (`package:aws_client/audit_manager`)
- Auto Scaling (`package:aws_client/auto_scaling`)
- AWS Auto Scaling Plans (`package:aws_client/auto_scaling_plans`)
- AWS B2B Data Interchange (`package:aws_client/b2_bi`)
- AWS Backup (`package:aws_client/backup`)
- AWS Backup Gateway (`package:aws_client/backup_gateway`)
- AWS Backup Storage (`package:aws_client/backup_storage`)
- AWS Batch (`package:aws_client/batch`)
- AWS Billing and Cost Management Data Exports (`package:aws_client/bcm_data_exports`)
- Amazon Bedrock (`package:aws_client/bedrock`)
- Agents for Amazon Bedrock (`package:aws_client/bedrock_agent`)
- Agents for Amazon Bedrock Runtime (`package:aws_client/bedrock_agent_runtime`)
- Amazon Bedrock Runtime (`package:aws_client/bedrock_runtime`)
- AWSBillingConductor (`package:aws_client/billingconductor`)
- Braket (`package:aws_client/braket`)
- AWS Budgets (`package:aws_client/budgets`)
- AWS Cost Explorer Service (`package:aws_client/cost_explorer`)
- AWS Chatbot (`package:aws_client/chatbot`)
- Amazon Chime (`package:aws_client/chime`)
- Amazon Chime SDK Identity (`package:aws_client/chime_sdk_identity`)
- Amazon Chime SDK Media Pipelines (`package:aws_client/chime_sdk_media_pipelines`)
- Amazon Chime SDK Meetings (`package:aws_client/chime_sdk_meetings`)
- Amazon Chime SDK Messaging (`package:aws_client/chime_sdk_messaging`)
- Amazon Chime SDK Voice (`package:aws_client/chime_sdk_voice`)
- AWS Clean Rooms Service (`package:aws_client/clean_rooms`)
- AWS Clean Rooms ML (`package:aws_client/clean_rooms_ml`)
- AWS Cloud9 (`package:aws_client/cloud9`)
- AWS Cloud Control API (`package:aws_client/cloud_control`)
- Amazon CloudDirectory (`package:aws_client/cloud_directory`)
- AWS CloudFormation (`package:aws_client/cloud_formation`)
- Amazon CloudFront (`package:aws_client/cloud_front`)
- Amazon CloudHSM (`package:aws_client/cloud_hsm`)
- AWS CloudHSM V2 (`package:aws_client/cloud_hsm_v2`)
- Amazon CloudSearch (`package:aws_client/cloud_search`)
- Amazon CloudSearch Domain (`package:aws_client/cloud_search_domain`)
- AWS CloudTrail (`package:aws_client/cloud_trail`)
- AWS CloudTrail Data Service (`package:aws_client/cloud_trail_data`)
- CodeArtifact (`package:aws_client/codeartifact`)
- AWS CodeBuild (`package:aws_client/code_build`)
- Amazon CodeCatalyst (`package:aws_client/code_catalyst`)
- AWS CodeCommit (`package:aws_client/code_commit`)
- AWS CodeConnections (`package:aws_client/code_connections`)
- AWS CodeDeploy (`package:aws_client/code_deploy`)
- Amazon CodeGuru Reviewer (`package:aws_client/code_guru_reviewer`)
- Amazon CodeGuru Security (`package:aws_client/code_guru_security`)
- Amazon CodeGuru Profiler (`package:aws_client/code_guru_profiler`)
- AWS CodePipeline (`package:aws_client/code_pipeline`)
- AWS CodeStar (`package:aws_client/code_star`)
- AWS CodeStar connections (`package:aws_client/code_star_connections`)
- AWS CodeStar Notifications (`package:aws_client/codestar_notifications`)
- Amazon Cognito Identity (`package:aws_client/cognito_identity`)
- Amazon Cognito Identity Provider (`package:aws_client/cognito_identity_provider`)
- Amazon Cognito Sync (`package:aws_client/cognito_sync`)
- Amazon Comprehend (`package:aws_client/comprehend`)
- AWS Comprehend Medical (`package:aws_client/comprehend_medical`)
- AWS Compute Optimizer (`package:aws_client/compute_optimizer`)
- AWS Config (`package:aws_client/config_service`)
- Amazon Connect Service (`package:aws_client/connect`)
- Amazon Connect Contact Lens (`package:aws_client/connect_contact_lens`)
- AmazonConnectCampaignService (`package:aws_client/connect_campaigns`)
- Amazon Connect Cases (`package:aws_client/connect_cases`)
- Amazon Connect Participant Service (`package:aws_client/connect_participant`)
- AWS Control Catalog (`package:aws_client/control_catalog`)
- AWS Control Tower (`package:aws_client/control_tower`)
- Cost Optimization Hub (`package:aws_client/cost_optimization_hub`)
- AWS Cost and Usage Report Service (`package:aws_client/cost_and_usage_report_service`)
- Amazon Connect Customer Profiles (`package:aws_client/customer_profiles`)
- AWS Glue DataBrew (`package:aws_client/data_brew`)
- AWS Data Exchange (`package:aws_client/data_exchange`)
- AWS Data Pipeline (`package:aws_client/data_pipeline`)
- AWS DataSync (`package:aws_client/data_sync`)
- Amazon DataZone (`package:aws_client/data_zone`)
- Amazon DynamoDB Accelerator (DAX) (`package:aws_client/dax`)
- AWSDeadlineCloud (`package:aws_client/deadline`)
- Amazon Detective (`package:aws_client/detective`)
- AWS Device Farm (`package:aws_client/device_farm`)
- Amazon DevOps Guru (`package:aws_client/dev_ops_guru`)
- AWS Direct Connect (`package:aws_client/direct_connect`)
- AWS Application Discovery Service (`package:aws_client/application_discovery_service`)
- Amazon Data Lifecycle Manager (`package:aws_client/dlm`)
- AWS Database Migration Service (`package:aws_client/database_migration_service`)
- Amazon DocumentDB with MongoDB compatibility (`package:aws_client/doc_db`)
- Amazon DocumentDB Elastic Clusters (`package:aws_client/doc_db_elastic`)
- Elastic Disaster Recovery Service (`package:aws_client/drs`)
- AWS Directory Service (`package:aws_client/directory_service`)
- Amazon DynamoDB (`package:aws_client/dynamo_db`)
- Amazon Elastic Block Store (`package:aws_client/ebs`)
- Amazon Elastic Compute Cloud (`package:aws_client/ec2`)
- AWS EC2 Instance Connect (`package:aws_client/ec2_instance_connect`)
- Amazon EC2 Container Registry (`package:aws_client/ecr`)
- Amazon Elastic Container Registry Public (`package:aws_client/ecr_public`)
- Amazon EC2 Container Service (`package:aws_client/ecs`)
- Amazon Elastic Kubernetes Service (`package:aws_client/eks`)
- Amazon EKS Auth (`package:aws_client/eks_auth`)
- Amazon Elastic  Inference (`package:aws_client/elastic_inference`)
- Amazon ElastiCache (`package:aws_client/elasti_cache`)
- AWS Elastic Beanstalk (`package:aws_client/elastic_beanstalk`)
- Amazon Elastic File System (`package:aws_client/efs`)
- Elastic Load Balancing (`package:aws_client/elastic_load_balancing`)
- Elastic Load Balancing (`package:aws_client/elastic_load_balancing_v2`)
- Amazon EMR (`package:aws_client/emr`)
- Amazon Elastic Transcoder (`package:aws_client/elastic_transcoder`)
- Amazon Simple Email Service (`package:aws_client/ses`)
- Amazon EMR Containers (`package:aws_client/emr_containers`)
- EMR Serverless (`package:aws_client/emr_serverless`)
- AWS Marketplace Entitlement Service (`package:aws_client/marketplace_entitlement_service`)
- AWS EntityResolution (`package:aws_client/entity_resolution`)
- Amazon Elasticsearch Service (`package:aws_client/elasticsearch_service`)
- Amazon EventBridge (`package:aws_client/event_bridge`)
- Amazon CloudWatch Events (`package:aws_client/cloud_watch_events`)
- Amazon CloudWatch Evidently (`package:aws_client/evidently`)
- FinSpace User Environment Management service (`package:aws_client/finspace`)
- FinSpace Public API (`package:aws_client/finspace_data`)
- Amazon Kinesis Firehose (`package:aws_client/firehose`)
- AWS Fault Injection Simulator (`package:aws_client/fis`)
- Firewall Management Service (`package:aws_client/fms`)
- Amazon Forecast Service (`package:aws_client/forecast`)
- Amazon Forecast Query Service (`package:aws_client/forecastquery`)
- Amazon Fraud Detector (`package:aws_client/fraud_detector`)
- AWS Free Tier (`package:aws_client/free_tier`)
- Amazon FSx (`package:aws_client/f_sx`)
- Amazon GameLift (`package:aws_client/game_lift`)
- GameSparks (`package:aws_client/game_sparks`)
- Amazon Glacier (`package:aws_client/glacier`)
- AWS Global Accelerator (`package:aws_client/global_accelerator`)
- AWS Glue (`package:aws_client/glue`)
- Amazon Managed Grafana (`package:aws_client/grafana`)
- AWS Greengrass (`package:aws_client/greengrass`)
- AWS IoT Greengrass V2 (`package:aws_client/greengrass_v2`)
- AWS Ground Station (`package:aws_client/ground_station`)
- Amazon GuardDuty (`package:aws_client/guard_duty`)
- AWS Health APIs and Notifications (`package:aws_client/health`)
- Amazon HealthLake (`package:aws_client/health_lake`)
- Amazon Honeycode (`package:aws_client/honeycode`)
- AWS Identity and Access Management (`package:aws_client/iam`)
- AWS SSO Identity Store (`package:aws_client/identitystore`)
- EC2 Image Builder (`package:aws_client/imagebuilder`)
- AWS Import/Export (`package:aws_client/import_export`)
- Amazon Inspector (`package:aws_client/inspector`)
- Inspector Scan (`package:aws_client/inspector_scan`)
- Inspector2 (`package:aws_client/inspector2`)
- Amazon CloudWatch Internet Monitor (`package:aws_client/internet_monitor`)
- AWS IoT (`package:aws_client/iot`)
- AWS IoT Data Plane (`package:aws_client/iot_data_plane`)
- AWS IoT Jobs Data Plane (`package:aws_client/iot_jobs_data_plane`)
- AWS IoT RoboRunner (`package:aws_client/iot_robo_runner`)
- AWS IoT 1-Click Devices Service (`package:aws_client/iot_1_click_devices_service`)
- AWS IoT 1-Click Projects Service (`package:aws_client/iot_1_click_projects`)
- AWS IoT Analytics (`package:aws_client/iot_analytics`)
- AWS IoT Core Device Advisor (`package:aws_client/iot_device_advisor`)
- AWS IoT Events (`package:aws_client/iot_events`)
- AWS IoT Events Data (`package:aws_client/iot_events_data`)
- AWS IoT Fleet Hub (`package:aws_client/iot_fleet_hub`)
- AWS IoT FleetWise (`package:aws_client/iot_fleet_wise`)
- AWS IoT Secure Tunneling (`package:aws_client/iot_secure_tunneling`)
- AWS IoT SiteWise (`package:aws_client/iot_site_wise`)
- AWS IoT Things Graph (`package:aws_client/iot_things_graph`)
- AWS IoT TwinMaker (`package:aws_client/iot_twin_maker`)
- AWS IoT Wireless (`package:aws_client/iot_wireless`)
- Amazon Interactive Video Service (`package:aws_client/ivs`)
- Amazon Interactive Video Service RealTime (`package:aws_client/ivs_real_time`)
- Amazon Interactive Video Service Chat (`package:aws_client/ivschat`)
- Managed Streaming for Kafka (`package:aws_client/kafka`)
- Managed Streaming for Kafka Connect (`package:aws_client/kafka_connect`)
- AWSKendraFrontendService (`package:aws_client/kendra`)
- Amazon Kendra Intelligent Ranking (`package:aws_client/kendra_ranking`)
- Amazon Keyspaces (`package:aws_client/keyspaces`)
- Amazon Kinesis (`package:aws_client/kinesis`)
- Amazon Kinesis Video Streams Archived Media (`package:aws_client/kinesis_video_archived_media`)
- Amazon Kinesis Video Streams Media (`package:aws_client/kinesis_video_media`)
- Amazon Kinesis Video Signaling Channels (`package:aws_client/kinesis_video_signaling`)
- Amazon Kinesis Video WebRTC Storage (`package:aws_client/kinesis_video_web_rtc_storage`)
- Amazon Kinesis Analytics (`package:aws_client/kinesis_analytics`)
- Amazon Kinesis Analytics (`package:aws_client/kinesis_analytics_v2`)
- Amazon Kinesis Video Streams (`package:aws_client/kinesis_video`)
- AWS Key Management Service (`package:aws_client/kms`)
- AWS Lake Formation (`package:aws_client/lake_formation`)
- AWS Lambda (`package:aws_client/lambda`)
- AWS Launch Wizard (`package:aws_client/launch_wizard`)
- Amazon Lex Model Building Service (`package:aws_client/lex_model_building_service`)
- AWS License Manager (`package:aws_client/license_manager`)
- AWS License Manager Linux Subscriptions (`package:aws_client/license_manager_linux_subscriptions`)
- AWS License Manager User Subscriptions (`package:aws_client/license_manager_user_subscriptions`)
- Amazon Lightsail (`package:aws_client/lightsail`)
- Amazon Location Service (`package:aws_client/location`)
- Amazon CloudWatch Logs (`package:aws_client/cloud_watch_logs`)
- Amazon Lookout for Equipment (`package:aws_client/lookout_equipment`)
- Amazon Lookout for Metrics (`package:aws_client/lookout_metrics`)
- Amazon Lookout for Vision (`package:aws_client/lookout_vision`)
- AWSMainframeModernization (`package:aws_client/m2`)
- Amazon Machine Learning (`package:aws_client/machine_learning`)
- Amazon Macie (`package:aws_client/macie`)
- Amazon Macie 2 (`package:aws_client/macie2`)
- MailManager (`package:aws_client/mail_manager`)
- Amazon Managed Blockchain (`package:aws_client/managed_blockchain`)
- Amazon Managed Blockchain Query (`package:aws_client/managed_blockchain_query`)
- AWS Marketplace Agreement Service (`package:aws_client/marketplace_agreement`)
- AWS Marketplace Catalog Service (`package:aws_client/marketplace_catalog`)
- AWS Marketplace Deployment Service (`package:aws_client/marketplace_deployment`)
- AWS Marketplace Commerce Analytics (`package:aws_client/marketplace_commerce_analytics`)
- AWS MediaConnect (`package:aws_client/media_connect`)
- AWS Elemental MediaConvert (`package:aws_client/media_convert`)
- AWS Elemental MediaLive (`package:aws_client/media_live`)
- AWS Elemental MediaPackage (`package:aws_client/media_package`)
- AWS Elemental MediaPackage VOD (`package:aws_client/media_package_vod`)
- AWS Elemental MediaPackage v2 (`package:aws_client/media_package_v2`)
- AWS Elemental MediaStore (`package:aws_client/media_store`)
- AWS Elemental MediaStore Data Plane (`package:aws_client/media_store_data`)
- AWS MediaTailor (`package:aws_client/media_tailor`)
- AWS Health Imaging (`package:aws_client/medical_imaging`)
- Amazon MemoryDB (`package:aws_client/memory_db`)
- AWSMarketplace Metering (`package:aws_client/marketplace_metering`)
- Application Migration Service (`package:aws_client/mgn`)
- AWS Migration Hub Refactor Spaces (`package:aws_client/migration_hub_refactor_spaces`)
- AWS Migration Hub Config (`package:aws_client/migration_hub_config`)
- AWS Migration Hub Orchestrator (`package:aws_client/migration_hub_orchestrator`)
- Migration Hub Strategy Recommendations (`package:aws_client/migration_hub_strategy`)
- AWS Mobile (`package:aws_client/mobile`)
- Amazon Mobile Analytics (`package:aws_client/mobile_analytics`)
- Amazon Lex Model Building V2 (`package:aws_client/lex_models_v2`)
- Amazon CloudWatch (`package:aws_client/cloud_watch`)
- AmazonMQ (`package:aws_client/mq`)
- Amazon Mechanical Turk (`package:aws_client/m_turk`)
- AmazonMWAA (`package:aws_client/mwaa`)
- Amazon Neptune (`package:aws_client/neptune`)
- Amazon NeptuneData (`package:aws_client/neptunedata`)
- AWS Network Firewall (`package:aws_client/network_firewall`)
- AWS Network Manager (`package:aws_client/network_manager`)
- Amazon CloudWatch Network Monitor (`package:aws_client/network_monitor`)
- AmazonNimbleStudio (`package:aws_client/nimble`)
- CloudWatch Observability Access Manager (`package:aws_client/oam`)
- Amazon Omics (`package:aws_client/omics`)
- Amazon OpenSearch Service (`package:aws_client/open_search`)
- OpenSearch Service Serverless (`package:aws_client/open_search_serverless`)
- AWS OpsWorks (`package:aws_client/ops_works`)
- AWS OpsWorks CM (`package:aws_client/ops_works_cm`)
- AWS Organizations (`package:aws_client/organizations`)
- Amazon OpenSearch Ingestion (`package:aws_client/osis`)
- AWS Outposts (`package:aws_client/outposts`)
- AWS Panorama (`package:aws_client/panorama`)
- Payment Cryptography Control Plane (`package:aws_client/payment_cryptography`)
- Payment Cryptography Data Plane (`package:aws_client/payment_cryptography_data`)
- PcaConnectorAd (`package:aws_client/pca_connector_ad`)
- Amazon Personalize (`package:aws_client/personalize`)
- Amazon Personalize Events (`package:aws_client/personalize_events`)
- Amazon Personalize Runtime (`package:aws_client/personalize_runtime`)
- AWS Performance Insights (`package:aws_client/pi`)
- Amazon Pinpoint (`package:aws_client/pinpoint`)
- Amazon Pinpoint Email Service (`package:aws_client/pinpoint_email`)
- Amazon Pinpoint SMS Voice V2 (`package:aws_client/pinpoint_sms_voice_v2`)
- Amazon EventBridge Pipes (`package:aws_client/pipes`)
- Amazon Polly (`package:aws_client/polly`)
- AWS Price List Service (`package:aws_client/pricing`)
- AWS Private 5G (`package:aws_client/private_networks`)
- AWS Proton (`package:aws_client/proton`)
- QBusiness (`package:aws_client/q_business`)
- Amazon Q Connect (`package:aws_client/q_connect`)
- Amazon QLDB (`package:aws_client/qldb`)
- Amazon QLDB Session (`package:aws_client/qldb_session`)
- Amazon QuickSight (`package:aws_client/quick_sight`)
- AWS Resource Access Manager (`package:aws_client/ram`)
- Amazon Recycle Bin (`package:aws_client/rbin`)
- Amazon Relational Database Service (`package:aws_client/rds`)
- AWS RDS DataService (`package:aws_client/rds_data`)
- Amazon Redshift (`package:aws_client/redshift`)
- Redshift Data API Service (`package:aws_client/redshift_data`)
- Redshift Serverless (`package:aws_client/redshift_serverless`)
- Amazon Rekognition (`package:aws_client/rekognition`)
- AWS re:Post Private (`package:aws_client/repostspace`)
- AWS Resilience Hub (`package:aws_client/resiliencehub`)
- AWS Resource Explorer (`package:aws_client/resource_explorer_2`)
- AWS Resource Groups (`package:aws_client/resource_groups`)
- AWS Resource Groups Tagging API (`package:aws_client/resource_groups_tagging_api`)
- AWS RoboMaker (`package:aws_client/robo_maker`)
- IAM Roles Anywhere (`package:aws_client/roles_anywhere`)
- Amazon Route 53 (`package:aws_client/route_53`)
- Route53 Recovery Cluster (`package:aws_client/route_53_recovery_cluster`)
- AWS Route53 Recovery Control Config (`package:aws_client/route_53_recovery_control_config`)
- AWS Route53 Recovery Readiness (`package:aws_client/route_53_recovery_readiness`)
- Amazon Route 53 Domains (`package:aws_client/route_53_domains`)
- Route 53 Profiles (`package:aws_client/route_53_profiles`)
- Amazon Route 53 Resolver (`package:aws_client/route_53_resolver`)
- CloudWatch RUM (`package:aws_client/rum`)
- Amazon Lex Runtime Service (`package:aws_client/lex_runtime_service`)
- Amazon Lex Runtime V2 (`package:aws_client/lex_runtime_v2`)
- Amazon SageMaker Runtime (`package:aws_client/sage_maker_runtime`)
- Amazon Simple Storage Service (`package:aws_client/s3`)
- AWS S3 Control (`package:aws_client/s3_control`)
- Amazon S3 on Outposts (`package:aws_client/s3_outposts`)
- Amazon SageMaker Service (`package:aws_client/sage_maker`)
- Amazon Augmented AI Runtime (`package:aws_client/sage_maker_a2i_runtime`)
- Amazon Sagemaker Edge Manager (`package:aws_client/sagemaker_edge`)
- Amazon SageMaker Feature Store Runtime (`package:aws_client/sage_maker_feature_store_runtime`)
- Amazon SageMaker geospatial capabilities (`package:aws_client/sage_maker_geospatial`)
- Amazon SageMaker Metrics Service (`package:aws_client/sage_maker_metrics`)
- AWS Savings Plans (`package:aws_client/savingsplans`)
- Amazon EventBridge Scheduler (`package:aws_client/scheduler`)
- Schemas (`package:aws_client/schemas`)
- Amazon SimpleDB (`package:aws_client/simple_db`)
- AWS Secrets Manager (`package:aws_client/secrets_manager`)
- AWS SecurityHub (`package:aws_client/security_hub`)
- Amazon Security Lake (`package:aws_client/security_lake`)
- AWSServerlessApplicationRepository (`package:aws_client/serverless_application_repository`)
- Service Quotas (`package:aws_client/service_quotas`)
- AWS Service Catalog (`package:aws_client/service_catalog`)
- AWS Service Catalog App Registry (`package:aws_client/service_catalog_app_registry`)
- AWS Cloud Map (`package:aws_client/service_discovery`)
- Amazon Simple Email Service (`package:aws_client/ses_v2`)
- AWS Shield (`package:aws_client/shield`)
- AWS Signer (`package:aws_client/signer`)
- AWS SimSpace Weaver (`package:aws_client/sim_space_weaver`)
- AWS Server Migration Service (`package:aws_client/sms`)
- Amazon Pinpoint SMS and Voice Service (`package:aws_client/pinpoint_sms_voice`)
- AWS Snow Device Management (`package:aws_client/snow_device_management`)
- Amazon Import/Export Snowball (`package:aws_client/snowball`)
- Amazon Simple Notification Service (`package:aws_client/sns`)
- Amazon Simple Queue Service (`package:aws_client/sqs`)
- Amazon Simple Systems Manager (SSM) (`package:aws_client/ssm`)
- AWS Systems Manager Incident Manager Contacts (`package:aws_client/ssm_contacts`)
- AWS Systems Manager Incident Manager (`package:aws_client/ssm_incidents`)
- AWS Systems Manager for SAP (`package:aws_client/ssm_sap`)
- AWS Single Sign-On (`package:aws_client/sso`)
- AWS Single Sign-On Admin (`package:aws_client/sso_admin`)
- AWS SSO OIDC (`package:aws_client/sso_oidc`)
- AWS Step Functions (`package:aws_client/sfn`)
- AWS Storage Gateway (`package:aws_client/storage_gateway`)
- Amazon DynamoDB Streams (`package:aws_client/dynamo_db_streams`)
- AWS Security Token Service (`package:aws_client/sts`)
- AWS Supply Chain (`package:aws_client/supply_chain`)
- AWS Support (`package:aws_client/support`)
- AWS Support App (`package:aws_client/support_app`)
- Amazon Simple Workflow Service (`package:aws_client/swf`)
- Synthetics (`package:aws_client/synthetics`)
- Tax Settings (`package:aws_client/tax_settings`)
- Amazon Textract (`package:aws_client/textract`)
- Timestream InfluxDB (`package:aws_client/timestream_influx_db`)
- Amazon Timestream Query (`package:aws_client/timestream_query`)
- Amazon Timestream Write (`package:aws_client/timestream_write`)
- AWS Telco Network Builder (`package:aws_client/tnb`)
- Amazon Transcribe Service (`package:aws_client/transcribe`)
- AWS Transfer Family (`package:aws_client/transfer`)
- Amazon Translate (`package:aws_client/translate`)
- TrustedAdvisor Public API (`package:aws_client/trusted_advisor`)
- Amazon Verified Permissions (`package:aws_client/verified_permissions`)
- Amazon Voice ID (`package:aws_client/voice_id`)
- Amazon VPC Lattice (`package:aws_client/vpc_lattice`)
- AWS WAF (`package:aws_client/waf`)
- AWS WAF Regional (`package:aws_client/waf_regional`)
- AWS WAFV2 (`package:aws_client/wafv2`)
- AWS Well-Architected Tool (`package:aws_client/well_architected`)
- Amazon Connect Wisdom Service (`package:aws_client/wisdom`)
- Amazon WorkDocs (`package:aws_client/work_docs`)
- Amazon WorkLink (`package:aws_client/work_link`)
- Amazon WorkMail (`package:aws_client/work_mail`)
- Amazon WorkMail Message Flow (`package:aws_client/work_mail_message_flow`)
- Amazon WorkSpaces (`package:aws_client/work_spaces`)
- Amazon WorkSpaces Thin Client (`package:aws_client/work_spaces_thin_client`)
- Amazon WorkSpaces Web (`package:aws_client/work_spaces_web`)
- AWS X-Ray (`package:aws_client/x_ray`)
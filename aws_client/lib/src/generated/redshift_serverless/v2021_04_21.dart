// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import '../../shared/shared.dart' as _s;
import '../../shared/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export '../../shared/shared.dart' show AwsClientCredentials;

/// This is an interface reference for Amazon Redshift Serverless. It contains
/// documentation for one of the programming or command line interfaces you can
/// use to manage Amazon Redshift Serverless.
///
/// Amazon Redshift Serverless automatically provisions data warehouse capacity
/// and intelligently scales the underlying resources based on workload demands.
/// Amazon Redshift Serverless adjusts capacity in seconds to deliver
/// consistently high performance and simplified operations for even the most
/// demanding and volatile workloads. Amazon Redshift Serverless lets you focus
/// on using your data to acquire new insights for your business and customers.
///
/// To learn more about Amazon Redshift Serverless, see <a
/// href="https://docs.aws.amazon.com/redshift/latest/mgmt/serverless-whatis.html">What
/// is Amazon Redshift Serverless</a>.
class RedshiftServerless {
  final _s.JsonProtocol _protocol;
  RedshiftServerless({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'redshift-serverless',
            signingName: 'redshift-serverless',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Converts a recovery point to a snapshot. For more information about
  /// recovery points and snapshots, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/serverless-snapshots-recovery.html">Working
  /// with snapshots and recovery points</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [TooManyTagsException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [recoveryPointId] :
  /// The unique identifier of the recovery point.
  ///
  /// Parameter [snapshotName] :
  /// The name of the snapshot.
  ///
  /// Parameter [retentionPeriod] :
  /// How long to retain the snapshot.
  ///
  /// Parameter [tags] :
  /// An array of <a
  /// href="https://docs.aws.amazon.com/redshift-serverless/latest/APIReference/API_Tag.html">Tag
  /// objects</a> to associate with the created snapshot.
  Future<ConvertRecoveryPointToSnapshotResponse>
      convertRecoveryPointToSnapshot({
    required String recoveryPointId,
    required String snapshotName,
    int? retentionPeriod,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.ConvertRecoveryPointToSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'recoveryPointId': recoveryPointId,
        'snapshotName': snapshotName,
        if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
        if (tags != null) 'tags': tags,
      },
    );

    return ConvertRecoveryPointToSnapshotResponse.fromJson(jsonResponse.body);
  }

  /// Creates a custom domain association for Amazon Redshift Serverless.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [customDomainCertificateArn] :
  /// The custom domain name’s certificate Amazon resource name (ARN).
  ///
  /// Parameter [customDomainName] :
  /// The custom domain name to associate with the workgroup.
  ///
  /// Parameter [workgroupName] :
  /// The name of the workgroup associated with the database.
  Future<CreateCustomDomainAssociationResponse> createCustomDomainAssociation({
    required String customDomainCertificateArn,
    required String customDomainName,
    required String workgroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.CreateCustomDomainAssociation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'customDomainCertificateArn': customDomainCertificateArn,
        'customDomainName': customDomainName,
        'workgroupName': workgroupName,
      },
    );

    return CreateCustomDomainAssociationResponse.fromJson(jsonResponse.body);
  }

  /// Creates an Amazon Redshift Serverless managed VPC endpoint.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [endpointName] :
  /// The name of the VPC endpoint. An endpoint name must contain 1-30
  /// characters. Valid characters are A-Z, a-z, 0-9, and hyphen(-). The first
  /// character must be a letter. The name can't contain two consecutive hyphens
  /// or end with a hyphen.
  ///
  /// Parameter [subnetIds] :
  /// The unique identifers of subnets from which Amazon Redshift Serverless
  /// chooses one to deploy a VPC endpoint.
  ///
  /// Parameter [workgroupName] :
  /// The name of the workgroup to associate with the VPC endpoint.
  ///
  /// Parameter [ownerAccount] :
  /// The owner Amazon Web Services account for the Amazon Redshift Serverless
  /// workgroup.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// The unique identifiers of the security group that defines the ports,
  /// protocols, and sources for inbound traffic that you are authorizing into
  /// your endpoint.
  Future<CreateEndpointAccessResponse> createEndpointAccess({
    required String endpointName,
    required List<String> subnetIds,
    required String workgroupName,
    String? ownerAccount,
    List<String>? vpcSecurityGroupIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.CreateEndpointAccess'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'endpointName': endpointName,
        'subnetIds': subnetIds,
        'workgroupName': workgroupName,
        if (ownerAccount != null) 'ownerAccount': ownerAccount,
        if (vpcSecurityGroupIds != null)
          'vpcSecurityGroupIds': vpcSecurityGroupIds,
      },
    );

    return CreateEndpointAccessResponse.fromJson(jsonResponse.body);
  }

  /// Creates a namespace in Amazon Redshift Serverless.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [namespaceName] :
  /// The name of the namespace.
  ///
  /// Parameter [adminPasswordSecretKmsKeyId] :
  /// The ID of the Key Management Service (KMS) key used to encrypt and store
  /// the namespace's admin credentials secret. You can only use this parameter
  /// if <code>manageAdminPassword</code> is true.
  ///
  /// Parameter [adminUserPassword] :
  /// The password of the administrator for the first database created in the
  /// namespace.
  ///
  /// You can't use <code>adminUserPassword</code> if
  /// <code>manageAdminPassword</code> is true.
  ///
  /// Parameter [adminUsername] :
  /// The username of the administrator for the first database created in the
  /// namespace.
  ///
  /// Parameter [dbName] :
  /// The name of the first database created in the namespace.
  ///
  /// Parameter [defaultIamRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to set as a default in the
  /// namespace.
  ///
  /// Parameter [iamRoles] :
  /// A list of IAM roles to associate with the namespace.
  ///
  /// Parameter [kmsKeyId] :
  /// The ID of the Amazon Web Services Key Management Service key used to
  /// encrypt your data.
  ///
  /// Parameter [logExports] :
  /// The types of logs the namespace can export. Available export types are
  /// <code>userlog</code>, <code>connectionlog</code>, and
  /// <code>useractivitylog</code>.
  ///
  /// Parameter [manageAdminPassword] :
  /// If <code>true</code>, Amazon Redshift uses Secrets Manager to manage the
  /// namespace's admin credentials. You can't use
  /// <code>adminUserPassword</code> if <code>manageAdminPassword</code> is
  /// true. If <code>manageAdminPassword</code> is false or not set, Amazon
  /// Redshift uses <code>adminUserPassword</code> for the admin user account's
  /// password.
  ///
  /// Parameter [redshiftIdcApplicationArn] :
  /// The ARN for the Redshift application that integrates with IAM Identity
  /// Center.
  ///
  /// Parameter [tags] :
  /// A list of tag instances.
  Future<CreateNamespaceResponse> createNamespace({
    required String namespaceName,
    String? adminPasswordSecretKmsKeyId,
    String? adminUserPassword,
    String? adminUsername,
    String? dbName,
    String? defaultIamRoleArn,
    List<String>? iamRoles,
    String? kmsKeyId,
    List<LogExport>? logExports,
    bool? manageAdminPassword,
    String? redshiftIdcApplicationArn,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.CreateNamespace'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'namespaceName': namespaceName,
        if (adminPasswordSecretKmsKeyId != null)
          'adminPasswordSecretKmsKeyId': adminPasswordSecretKmsKeyId,
        if (adminUserPassword != null) 'adminUserPassword': adminUserPassword,
        if (adminUsername != null) 'adminUsername': adminUsername,
        if (dbName != null) 'dbName': dbName,
        if (defaultIamRoleArn != null) 'defaultIamRoleArn': defaultIamRoleArn,
        if (iamRoles != null) 'iamRoles': iamRoles,
        if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
        if (logExports != null)
          'logExports': logExports.map((e) => e.toValue()).toList(),
        if (manageAdminPassword != null)
          'manageAdminPassword': manageAdminPassword,
        if (redshiftIdcApplicationArn != null)
          'redshiftIdcApplicationArn': redshiftIdcApplicationArn,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateNamespaceResponse.fromJson(jsonResponse.body);
  }

  /// Creates a scheduled action. A scheduled action contains a schedule and an
  /// Amazon Redshift API action. For example, you can create a schedule of when
  /// to run the <code>CreateSnapshot</code> API operation.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [namespaceName] :
  /// The name of the namespace for which to create a scheduled action.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the IAM role to assume to run the scheduled action. This IAM
  /// role must have permission to run the Amazon Redshift Serverless API
  /// operation in the scheduled action. This IAM role must allow the Amazon
  /// Redshift scheduler to schedule creating snapshots. (Principal
  /// scheduler.redshift.amazonaws.com) to assume permissions on your behalf.
  /// For more information about the IAM role to use with the Amazon Redshift
  /// scheduler, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-identity-based.html">Using
  /// Identity-Based Policies for Amazon Redshift</a> in the Amazon Redshift
  /// Cluster Management Guide
  ///
  /// Parameter [schedule] :
  /// The schedule for a one-time (at timestamp format) or recurring (cron
  /// format) scheduled action. Schedule invocations must be separated by at
  /// least one hour. Times are in UTC.
  ///
  /// <ul>
  /// <li>
  /// Format of at timestamp is <code>yyyy-mm-ddThh:mm:ss</code>. For example,
  /// <code>2016-03-04T17:27:00</code>.
  /// </li>
  /// <li>
  /// Format of cron expression is <code>(Minutes Hours Day-of-month Month
  /// Day-of-week Year)</code>. For example, <code>"(0 10 ? * MON *)"</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions">Cron
  /// Expressions</a> in the <i>Amazon CloudWatch Events User Guide</i>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scheduledActionName] :
  /// The name of the scheduled action.
  ///
  /// Parameter [enabled] :
  /// Indicates whether the schedule is enabled. If false, the scheduled action
  /// does not trigger. For more information about <code>state</code> of the
  /// scheduled action, see <a
  /// href="https://docs.aws.amazon.com/redshift-serverless/latest/APIReference/API_ScheduledAction.html">ScheduledAction</a>.
  ///
  /// Parameter [endTime] :
  /// The end time in UTC when the schedule is no longer active. After this
  /// time, the scheduled action does not trigger.
  ///
  /// Parameter [scheduledActionDescription] :
  /// The description of the scheduled action.
  ///
  /// Parameter [startTime] :
  /// The start time in UTC when the schedule is active. Before this time, the
  /// scheduled action does not trigger.
  Future<CreateScheduledActionResponse> createScheduledAction({
    required String namespaceName,
    required String roleArn,
    required Schedule schedule,
    required String scheduledActionName,
    required TargetAction targetAction,
    bool? enabled,
    DateTime? endTime,
    String? scheduledActionDescription,
    DateTime? startTime,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.CreateScheduledAction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'namespaceName': namespaceName,
        'roleArn': roleArn,
        'schedule': schedule,
        'scheduledActionName': scheduledActionName,
        'targetAction': targetAction,
        if (enabled != null) 'enabled': enabled,
        if (endTime != null) 'endTime': unixTimestampToJson(endTime),
        if (scheduledActionDescription != null)
          'scheduledActionDescription': scheduledActionDescription,
        if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      },
    );

    return CreateScheduledActionResponse.fromJson(jsonResponse.body);
  }

  /// Creates a snapshot of all databases in a namespace. For more information
  /// about snapshots, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/serverless-snapshots-recovery.html">
  /// Working with snapshots and recovery points</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [TooManyTagsException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [namespaceName] :
  /// The namespace to create a snapshot for.
  ///
  /// Parameter [snapshotName] :
  /// The name of the snapshot.
  ///
  /// Parameter [retentionPeriod] :
  /// How long to retain the created snapshot.
  ///
  /// Parameter [tags] :
  /// An array of <a
  /// href="https://docs.aws.amazon.com/redshift-serverless/latest/APIReference/API_Tag.html">Tag
  /// objects</a> to associate with the snapshot.
  Future<CreateSnapshotResponse> createSnapshot({
    required String namespaceName,
    required String snapshotName,
    int? retentionPeriod,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.CreateSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'namespaceName': namespaceName,
        'snapshotName': snapshotName,
        if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateSnapshotResponse.fromJson(jsonResponse.body);
  }

  /// Creates a snapshot copy configuration that lets you copy snapshots to
  /// another Amazon Web Services Region.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [destinationRegion] :
  /// The destination Amazon Web Services Region that you want to copy snapshots
  /// to.
  ///
  /// Parameter [namespaceName] :
  /// The name of the namespace to copy snapshots from.
  ///
  /// Parameter [destinationKmsKeyId] :
  /// The KMS key to use to encrypt your snapshots in the destination Amazon Web
  /// Services Region.
  ///
  /// Parameter [snapshotRetentionPeriod] :
  /// The retention period of the snapshots that you copy to the destination
  /// Amazon Web Services Region.
  Future<CreateSnapshotCopyConfigurationResponse>
      createSnapshotCopyConfiguration({
    required String destinationRegion,
    required String namespaceName,
    String? destinationKmsKeyId,
    int? snapshotRetentionPeriod,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.CreateSnapshotCopyConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'destinationRegion': destinationRegion,
        'namespaceName': namespaceName,
        if (destinationKmsKeyId != null)
          'destinationKmsKeyId': destinationKmsKeyId,
        if (snapshotRetentionPeriod != null)
          'snapshotRetentionPeriod': snapshotRetentionPeriod,
      },
    );

    return CreateSnapshotCopyConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Creates a usage limit for a specified Amazon Redshift Serverless usage
  /// type. The usage limit is identified by the returned usage limit
  /// identifier.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [amount] :
  /// The limit amount. If time-based, this amount is in Redshift Processing
  /// Units (RPU) consumed per hour. If data-based, this amount is in terabytes
  /// (TB) of data transferred between Regions in cross-account sharing. The
  /// value must be a positive number.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Redshift Serverless resource
  /// to create the usage limit for.
  ///
  /// Parameter [usageType] :
  /// The type of Amazon Redshift Serverless usage to create a usage limit for.
  ///
  /// Parameter [breachAction] :
  /// The action that Amazon Redshift Serverless takes when the limit is
  /// reached. The default is log.
  ///
  /// Parameter [period] :
  /// The time period that the amount applies to. A weekly period begins on
  /// Sunday. The default is monthly.
  Future<CreateUsageLimitResponse> createUsageLimit({
    required int amount,
    required String resourceArn,
    required UsageLimitUsageType usageType,
    UsageLimitBreachAction? breachAction,
    UsageLimitPeriod? period,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.CreateUsageLimit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'amount': amount,
        'resourceArn': resourceArn,
        'usageType': usageType.toValue(),
        if (breachAction != null) 'breachAction': breachAction.toValue(),
        if (period != null) 'period': period.toValue(),
      },
    );

    return CreateUsageLimitResponse.fromJson(jsonResponse.body);
  }

  /// Creates an workgroup in Amazon Redshift Serverless.
  ///
  /// May throw [InternalServerException].
  /// May throw [InsufficientCapacityException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [namespaceName] :
  /// The name of the namespace to associate with the workgroup.
  ///
  /// Parameter [workgroupName] :
  /// The name of the created workgroup.
  ///
  /// Parameter [baseCapacity] :
  /// The base data warehouse capacity of the workgroup in Redshift Processing
  /// Units (RPUs).
  ///
  /// Parameter [configParameters] :
  /// An array of parameters to set for advanced control over a database. The
  /// options are <code>auto_mv</code>, <code>datestyle</code>,
  /// <code>enable_case_sensitive_identifier</code>,
  /// <code>enable_user_activity_logging</code>, <code>query_group</code>,
  /// <code>search_path</code>, <code>require_ssl</code>,
  /// <code>use_fips_ssl</code>, and query monitoring metrics that let you
  /// define performance boundaries. For more information about query monitoring
  /// rules and available metrics, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/dg/cm-c-wlm-query-monitoring-rules.html#cm-c-wlm-query-monitoring-metrics-serverless">
  /// Query monitoring metrics for Amazon Redshift Serverless</a>.
  ///
  /// Parameter [enhancedVpcRouting] :
  /// The value that specifies whether to turn on enhanced virtual private cloud
  /// (VPC) routing, which forces Amazon Redshift Serverless to route traffic
  /// through your VPC instead of over the internet.
  ///
  /// Parameter [maxCapacity] :
  /// The maximum data-warehouse capacity Amazon Redshift Serverless uses to
  /// serve queries. The max capacity is specified in RPUs.
  ///
  /// Parameter [port] :
  /// The custom port to use when connecting to a workgroup. Valid port ranges
  /// are 5431-5455 and 8191-8215. The default is 5439.
  ///
  /// Parameter [publiclyAccessible] :
  /// A value that specifies whether the workgroup can be accessed from a public
  /// network.
  ///
  /// Parameter [securityGroupIds] :
  /// An array of security group IDs to associate with the workgroup.
  ///
  /// Parameter [subnetIds] :
  /// An array of VPC subnet IDs to associate with the workgroup.
  ///
  /// Parameter [tags] :
  /// A array of tag instances.
  Future<CreateWorkgroupResponse> createWorkgroup({
    required String namespaceName,
    required String workgroupName,
    int? baseCapacity,
    List<ConfigParameter>? configParameters,
    bool? enhancedVpcRouting,
    int? maxCapacity,
    int? port,
    bool? publiclyAccessible,
    List<String>? securityGroupIds,
    List<String>? subnetIds,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.CreateWorkgroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'namespaceName': namespaceName,
        'workgroupName': workgroupName,
        if (baseCapacity != null) 'baseCapacity': baseCapacity,
        if (configParameters != null) 'configParameters': configParameters,
        if (enhancedVpcRouting != null)
          'enhancedVpcRouting': enhancedVpcRouting,
        if (maxCapacity != null) 'maxCapacity': maxCapacity,
        if (port != null) 'port': port,
        if (publiclyAccessible != null)
          'publiclyAccessible': publiclyAccessible,
        if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
        if (subnetIds != null) 'subnetIds': subnetIds,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateWorkgroupResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a custom domain association for Amazon Redshift Serverless.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [customDomainName] :
  /// The custom domain name associated with the workgroup.
  ///
  /// Parameter [workgroupName] :
  /// The name of the workgroup associated with the database.
  Future<void> deleteCustomDomainAssociation({
    required String customDomainName,
    required String workgroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.DeleteCustomDomainAssociation'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'customDomainName': customDomainName,
        'workgroupName': workgroupName,
      },
    );
  }

  /// Deletes an Amazon Redshift Serverless managed VPC endpoint.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endpointName] :
  /// The name of the VPC endpoint to delete.
  Future<DeleteEndpointAccessResponse> deleteEndpointAccess({
    required String endpointName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.DeleteEndpointAccess'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'endpointName': endpointName,
      },
    );

    return DeleteEndpointAccessResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a namespace from Amazon Redshift Serverless. Before you delete the
  /// namespace, you can create a final snapshot that has all of the data within
  /// the namespace.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [namespaceName] :
  /// The name of the namespace to delete.
  ///
  /// Parameter [finalSnapshotName] :
  /// The name of the snapshot to be created before the namespace is deleted.
  ///
  /// Parameter [finalSnapshotRetentionPeriod] :
  /// How long to retain the final snapshot.
  Future<DeleteNamespaceResponse> deleteNamespace({
    required String namespaceName,
    String? finalSnapshotName,
    int? finalSnapshotRetentionPeriod,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.DeleteNamespace'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'namespaceName': namespaceName,
        if (finalSnapshotName != null) 'finalSnapshotName': finalSnapshotName,
        if (finalSnapshotRetentionPeriod != null)
          'finalSnapshotRetentionPeriod': finalSnapshotRetentionPeriod,
      },
    );

    return DeleteNamespaceResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified resource policy.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the policy to delete.
  Future<void> deleteResourcePolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.DeleteResourcePolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
      },
    );
  }

  /// Deletes a scheduled action.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scheduledActionName] :
  /// The name of the scheduled action to delete.
  Future<DeleteScheduledActionResponse> deleteScheduledAction({
    required String scheduledActionName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.DeleteScheduledAction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'scheduledActionName': scheduledActionName,
      },
    );

    return DeleteScheduledActionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a snapshot from Amazon Redshift Serverless.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [snapshotName] :
  /// The name of the snapshot to be deleted.
  Future<DeleteSnapshotResponse> deleteSnapshot({
    required String snapshotName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.DeleteSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'snapshotName': snapshotName,
      },
    );

    return DeleteSnapshotResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a snapshot copy configuration
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [snapshotCopyConfigurationId] :
  /// The ID of the snapshot copy configuration to delete.
  Future<DeleteSnapshotCopyConfigurationResponse>
      deleteSnapshotCopyConfiguration({
    required String snapshotCopyConfigurationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.DeleteSnapshotCopyConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'snapshotCopyConfigurationId': snapshotCopyConfigurationId,
      },
    );

    return DeleteSnapshotCopyConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a usage limit from Amazon Redshift Serverless.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [usageLimitId] :
  /// The unique identifier of the usage limit to delete.
  Future<DeleteUsageLimitResponse> deleteUsageLimit({
    required String usageLimitId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.DeleteUsageLimit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'usageLimitId': usageLimitId,
      },
    );

    return DeleteUsageLimitResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a workgroup.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workgroupName] :
  /// The name of the workgroup to be deleted.
  Future<DeleteWorkgroupResponse> deleteWorkgroup({
    required String workgroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.DeleteWorkgroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'workgroupName': workgroupName,
      },
    );

    return DeleteWorkgroupResponse.fromJson(jsonResponse.body);
  }

  /// Returns a database user name and temporary password with temporary
  /// authorization to log in to Amazon Redshift Serverless.
  ///
  /// By default, the temporary credentials expire in 900 seconds. You can
  /// optionally specify a duration between 900 seconds (15 minutes) and 3600
  /// seconds (60 minutes).
  /// <pre><code> &lt;p&gt;The Identity and Access Management (IAM) user or role
  /// that runs GetCredentials must have an IAM policy attached that allows
  /// access to all necessary actions and resources.&lt;/p&gt; &lt;p&gt;If the
  /// &lt;code&gt;DbName&lt;/code&gt; parameter is specified, the IAM policy
  /// must allow access to the resource dbname for the specified database
  /// name.&lt;/p&gt; </code></pre>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [customDomainName] :
  /// The custom domain name associated with the workgroup. The custom domain
  /// name or the workgroup name must be included in the request.
  ///
  /// Parameter [dbName] :
  /// The name of the database to get temporary authorization to log on to.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be 1 to 64 alphanumeric characters or hyphens.
  /// </li>
  /// <li>
  /// Must contain only uppercase or lowercase letters, numbers, underscore,
  /// plus sign, period (dot), at symbol (@), or hyphen.
  /// </li>
  /// <li>
  /// The first character must be a letter.
  /// </li>
  /// <li>
  /// Must not contain a colon ( : ) or slash ( / ).
  /// </li>
  /// <li>
  /// Cannot be a reserved word. A list of reserved words can be found in <a
  /// href="https://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html">Reserved
  /// Words </a> in the Amazon Redshift Database Developer Guide
  /// </li>
  /// </ul>
  ///
  /// Parameter [durationSeconds] :
  /// The number of seconds until the returned temporary password expires. The
  /// minimum is 900 seconds, and the maximum is 3600 seconds.
  ///
  /// Parameter [workgroupName] :
  /// The name of the workgroup associated with the database.
  Future<GetCredentialsResponse> getCredentials({
    String? customDomainName,
    String? dbName,
    int? durationSeconds,
    String? workgroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.GetCredentials'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (customDomainName != null) 'customDomainName': customDomainName,
        if (dbName != null) 'dbName': dbName,
        if (durationSeconds != null) 'durationSeconds': durationSeconds,
        if (workgroupName != null) 'workgroupName': workgroupName,
      },
    );

    return GetCredentialsResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about a specific custom domain association.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [customDomainName] :
  /// The custom domain name associated with the workgroup.
  ///
  /// Parameter [workgroupName] :
  /// The name of the workgroup associated with the database.
  Future<GetCustomDomainAssociationResponse> getCustomDomainAssociation({
    required String customDomainName,
    required String workgroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.GetCustomDomainAssociation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'customDomainName': customDomainName,
        'workgroupName': workgroupName,
      },
    );

    return GetCustomDomainAssociationResponse.fromJson(jsonResponse.body);
  }

  /// Returns information, such as the name, about a VPC endpoint.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endpointName] :
  /// The name of the VPC endpoint to return information for.
  Future<GetEndpointAccessResponse> getEndpointAccess({
    required String endpointName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.GetEndpointAccess'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'endpointName': endpointName,
      },
    );

    return GetEndpointAccessResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a namespace in Amazon Redshift Serverless.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [namespaceName] :
  /// The name of the namespace to retrieve information for.
  Future<GetNamespaceResponse> getNamespace({
    required String namespaceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.GetNamespace'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'namespaceName': namespaceName,
      },
    );

    return GetNamespaceResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a recovery point.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [recoveryPointId] :
  /// The unique identifier of the recovery point to return information for.
  Future<GetRecoveryPointResponse> getRecoveryPoint({
    required String recoveryPointId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.GetRecoveryPoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'recoveryPointId': recoveryPointId,
      },
    );

    return GetRecoveryPointResponse.fromJson(jsonResponse.body);
  }

  /// Returns a resource policy.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to return.
  Future<GetResourcePolicyResponse> getResourcePolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.GetResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
      },
    );

    return GetResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a scheduled action.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scheduledActionName] :
  /// The name of the scheduled action.
  Future<GetScheduledActionResponse> getScheduledAction({
    required String scheduledActionName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.GetScheduledAction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'scheduledActionName': scheduledActionName,
      },
    );

    return GetScheduledActionResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a specific snapshot.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ownerAccount] :
  /// The owner Amazon Web Services account of a snapshot shared with another
  /// user.
  ///
  /// Parameter [snapshotArn] :
  /// The Amazon Resource Name (ARN) of the snapshot to return.
  ///
  /// Parameter [snapshotName] :
  /// The name of the snapshot to return.
  Future<GetSnapshotResponse> getSnapshot({
    String? ownerAccount,
    String? snapshotArn,
    String? snapshotName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.GetSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (ownerAccount != null) 'ownerAccount': ownerAccount,
        if (snapshotArn != null) 'snapshotArn': snapshotArn,
        if (snapshotName != null) 'snapshotName': snapshotName,
      },
    );

    return GetSnapshotResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a <code>TableRestoreStatus</code> object.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [tableRestoreRequestId] :
  /// The ID of the <code>RestoreTableFromSnapshot</code> request to return
  /// status for.
  Future<GetTableRestoreStatusResponse> getTableRestoreStatus({
    required String tableRestoreRequestId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.GetTableRestoreStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'tableRestoreRequestId': tableRestoreRequestId,
      },
    );

    return GetTableRestoreStatusResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a usage limit.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [usageLimitId] :
  /// The unique identifier of the usage limit to return information for.
  Future<GetUsageLimitResponse> getUsageLimit({
    required String usageLimitId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.GetUsageLimit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'usageLimitId': usageLimitId,
      },
    );

    return GetUsageLimitResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a specific workgroup.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workgroupName] :
  /// The name of the workgroup to return information for.
  Future<GetWorkgroupResponse> getWorkgroup({
    required String workgroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.GetWorkgroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'workgroupName': workgroupName,
      },
    );

    return GetWorkgroupResponse.fromJson(jsonResponse.body);
  }

  /// Lists custom domain associations for Amazon Redshift Serverless.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidPaginationException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [customDomainCertificateArn] :
  /// The custom domain name’s certificate Amazon resource name (ARN).
  ///
  /// Parameter [customDomainName] :
  /// The custom domain name associated with the workgroup.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to display the next page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page.
  Future<ListCustomDomainAssociationsResponse> listCustomDomainAssociations({
    String? customDomainCertificateArn,
    String? customDomainName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.ListCustomDomainAssociations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (customDomainCertificateArn != null)
          'customDomainCertificateArn': customDomainCertificateArn,
        if (customDomainName != null) 'customDomainName': customDomainName,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListCustomDomainAssociationsResponse.fromJson(jsonResponse.body);
  }

  /// Returns an array of <code>EndpointAccess</code> objects and relevant
  /// information.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to display the next page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListEndpointAccess</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in following <code>ListEndpointAccess</code>
  /// operations, which returns results in the next page.
  ///
  /// Parameter [ownerAccount] :
  /// The owner Amazon Web Services account for the Amazon Redshift Serverless
  /// workgroup.
  ///
  /// Parameter [vpcId] :
  /// The unique identifier of the virtual private cloud with access to Amazon
  /// Redshift Serverless.
  ///
  /// Parameter [workgroupName] :
  /// The name of the workgroup associated with the VPC endpoint to return.
  Future<ListEndpointAccessResponse> listEndpointAccess({
    int? maxResults,
    String? nextToken,
    String? ownerAccount,
    String? vpcId,
    String? workgroupName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.ListEndpointAccess'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (ownerAccount != null) 'ownerAccount': ownerAccount,
        if (vpcId != null) 'vpcId': vpcId,
        if (workgroupName != null) 'workgroupName': workgroupName,
      },
    );

    return ListEndpointAccessResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a list of specified namespaces.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to display the next page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListNamespaces</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in following <code>ListNamespaces</code>
  /// operations, which returns results in the next page.
  Future<ListNamespacesResponse> listNamespaces({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.ListNamespaces'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListNamespacesResponse.fromJson(jsonResponse.body);
  }

  /// Returns an array of recovery points.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endTime] :
  /// The time when creation of the recovery point finished.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to display the next page of
  /// results.
  ///
  /// Parameter [namespaceArn] :
  /// The Amazon Resource Name (ARN) of the namespace from which to list
  /// recovery points.
  ///
  /// Parameter [namespaceName] :
  /// The name of the namespace to list recovery points for.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListRecoveryPoints</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in following <code>ListRecoveryPoints</code>
  /// operations, which returns results in the next page.
  ///
  /// Parameter [startTime] :
  /// The time when the recovery point's creation was initiated.
  Future<ListRecoveryPointsResponse> listRecoveryPoints({
    DateTime? endTime,
    int? maxResults,
    String? namespaceArn,
    String? namespaceName,
    String? nextToken,
    DateTime? startTime,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.ListRecoveryPoints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (endTime != null) 'endTime': unixTimestampToJson(endTime),
        if (maxResults != null) 'maxResults': maxResults,
        if (namespaceArn != null) 'namespaceArn': namespaceArn,
        if (namespaceName != null) 'namespaceName': namespaceName,
        if (nextToken != null) 'nextToken': nextToken,
        if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      },
    );

    return ListRecoveryPointsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of scheduled actions. You can use the flags to filter the
  /// list of returned scheduled actions.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidPaginationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. Use <code>nextToken</code> to display the next page of results.
  ///
  /// Parameter [namespaceName] :
  /// The name of namespace associated with the scheduled action to retrieve.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page.
  Future<ListScheduledActionsResponse> listScheduledActions({
    int? maxResults,
    String? namespaceName,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.ListScheduledActions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (namespaceName != null) 'namespaceName': namespaceName,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListScheduledActionsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of snapshot copy configurations.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidPaginationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to display the next page of
  /// results.
  ///
  /// Parameter [namespaceName] :
  /// The namespace from which to list all snapshot copy configurations.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page.
  Future<ListSnapshotCopyConfigurationsResponse>
      listSnapshotCopyConfigurations({
    int? maxResults,
    String? namespaceName,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.ListSnapshotCopyConfigurations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (namespaceName != null) 'namespaceName': namespaceName,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListSnapshotCopyConfigurationsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of snapshots.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endTime] :
  /// The timestamp showing when the snapshot creation finished.
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to display the next page of
  /// results.
  ///
  /// Parameter [namespaceArn] :
  /// The Amazon Resource Name (ARN) of the namespace from which to list all
  /// snapshots.
  ///
  /// Parameter [namespaceName] :
  /// The namespace from which to list all snapshots.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page.
  ///
  /// Parameter [ownerAccount] :
  /// The owner Amazon Web Services account of the snapshot.
  ///
  /// Parameter [startTime] :
  /// The time when the creation of the snapshot was initiated.
  Future<ListSnapshotsResponse> listSnapshots({
    DateTime? endTime,
    int? maxResults,
    String? namespaceArn,
    String? namespaceName,
    String? nextToken,
    String? ownerAccount,
    DateTime? startTime,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.ListSnapshots'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (endTime != null) 'endTime': unixTimestampToJson(endTime),
        if (maxResults != null) 'maxResults': maxResults,
        if (namespaceArn != null) 'namespaceArn': namespaceArn,
        if (namespaceName != null) 'namespaceName': namespaceName,
        if (nextToken != null) 'nextToken': nextToken,
        if (ownerAccount != null) 'ownerAccount': ownerAccount,
        if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      },
    );

    return ListSnapshotsResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about an array of <code>TableRestoreStatus</code>
  /// objects.
  ///
  /// May throw [InvalidPaginationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use nextToken to display the next page of results.
  ///
  /// Parameter [namespaceName] :
  /// The namespace from which to list all of the statuses of
  /// <code>RestoreTableFromSnapshot</code> operations .
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListTableRestoreStatus</code> operation returns a
  /// nextToken, you can include the returned <code>nextToken</code> in
  /// following <code>ListTableRestoreStatus</code> operations. This will return
  /// results on the next page.
  ///
  /// Parameter [workgroupName] :
  /// The workgroup from which to list all of the statuses of
  /// <code>RestoreTableFromSnapshot</code> operations.
  Future<ListTableRestoreStatusResponse> listTableRestoreStatus({
    int? maxResults,
    String? namespaceName,
    String? nextToken,
    String? workgroupName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.ListTableRestoreStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (namespaceName != null) 'namespaceName': namespaceName,
        if (nextToken != null) 'nextToken': nextToken,
        if (workgroupName != null) 'workgroupName': workgroupName,
      },
    );

    return ListTableRestoreStatusResponse.fromJson(jsonResponse.body);
  }

  /// Lists the tags assigned to a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to list tags for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Lists all usage limits within Amazon Redshift Serverless.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidPaginationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to get the next page of
  /// results. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// If your initial <code>ListUsageLimits</code> operation returns a
  /// <code>nextToken</code>, you can include the returned
  /// <code>nextToken</code> in following <code>ListUsageLimits</code>
  /// operations, which returns results in the next page.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) associated with the resource whose usage
  /// limits you want to list.
  ///
  /// Parameter [usageType] :
  /// The Amazon Redshift Serverless feature whose limits you want to see.
  Future<ListUsageLimitsResponse> listUsageLimits({
    int? maxResults,
    String? nextToken,
    String? resourceArn,
    UsageLimitUsageType? usageType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.ListUsageLimits'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (resourceArn != null) 'resourceArn': resourceArn,
        if (usageType != null) 'usageType': usageType.toValue(),
      },
    );

    return ListUsageLimitsResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a list of specified workgroups.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// An optional parameter that specifies the maximum number of results to
  /// return. You can use <code>nextToken</code> to display the next page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// If your initial ListWorkgroups operation returns a <code>nextToken</code>,
  /// you can include the returned <code>nextToken</code> in following
  /// ListNamespaces operations, which returns results in the next page.
  ///
  /// Parameter [ownerAccount] :
  /// The owner Amazon Web Services account for the Amazon Redshift Serverless
  /// workgroup.
  Future<ListWorkgroupsResponse> listWorkgroups({
    int? maxResults,
    String? nextToken,
    String? ownerAccount,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.ListWorkgroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (ownerAccount != null) 'ownerAccount': ownerAccount,
      },
    );

    return ListWorkgroupsResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates a resource policy. Currently, you can use policies to
  /// share snapshots across Amazon Web Services accounts.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [policy] :
  /// The policy to create or update. For example, the following policy grants a
  /// user authorization to restore a snapshot.
  ///
  /// <code>"{\"Version\": \"2012-10-17\", \"Statement\" : [{ \"Sid\":
  /// \"AllowUserRestoreFromSnapshot\", \"Principal\":{\"AWS\":
  /// [\"739247239426\"]}, \"Action\":
  /// [\"redshift-serverless:RestoreFromSnapshot\"] , \"Effect\": \"Allow\"
  /// }]}"</code>
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the account to create or update a
  /// resource policy for.
  Future<PutResourcePolicyResponse> putResourcePolicy({
    required String policy,
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.PutResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policy': policy,
        'resourceArn': resourceArn,
      },
    );

    return PutResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Restore the data from a recovery point.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [namespaceName] :
  /// The name of the namespace to restore data into.
  ///
  /// Parameter [recoveryPointId] :
  /// The unique identifier of the recovery point to restore from.
  ///
  /// Parameter [workgroupName] :
  /// The name of the workgroup used to restore data.
  Future<RestoreFromRecoveryPointResponse> restoreFromRecoveryPoint({
    required String namespaceName,
    required String recoveryPointId,
    required String workgroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.RestoreFromRecoveryPoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'namespaceName': namespaceName,
        'recoveryPointId': recoveryPointId,
        'workgroupName': workgroupName,
      },
    );

    return RestoreFromRecoveryPointResponse.fromJson(jsonResponse.body);
  }

  /// Restores a namespace from a snapshot.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [namespaceName] :
  /// The name of the namespace to restore the snapshot to.
  ///
  /// Parameter [workgroupName] :
  /// The name of the workgroup used to restore the snapshot.
  ///
  /// Parameter [adminPasswordSecretKmsKeyId] :
  /// The ID of the Key Management Service (KMS) key used to encrypt and store
  /// the namespace's admin credentials secret.
  ///
  /// Parameter [manageAdminPassword] :
  /// If <code>true</code>, Amazon Redshift uses Secrets Manager to manage the
  /// restored snapshot's admin credentials. If
  /// <code>MmanageAdminPassword</code> is false or not set, Amazon Redshift
  /// uses the admin credentials that the namespace or cluster had at the time
  /// the snapshot was taken.
  ///
  /// Parameter [ownerAccount] :
  /// The Amazon Web Services account that owns the snapshot.
  ///
  /// Parameter [snapshotArn] :
  /// The Amazon Resource Name (ARN) of the snapshot to restore from. Required
  /// if restoring from Amazon Redshift Serverless to a provisioned cluster.
  /// Must not be specified at the same time as <code>snapshotName</code>.
  ///
  /// The format of the ARN is
  /// arn:aws:redshift:&lt;region&gt;:&lt;account_id&gt;:snapshot:&lt;cluster_identifier&gt;/&lt;snapshot_identifier&gt;.
  ///
  /// Parameter [snapshotName] :
  /// The name of the snapshot to restore from. Must not be specified at the
  /// same time as <code>snapshotArn</code>.
  Future<RestoreFromSnapshotResponse> restoreFromSnapshot({
    required String namespaceName,
    required String workgroupName,
    String? adminPasswordSecretKmsKeyId,
    bool? manageAdminPassword,
    String? ownerAccount,
    String? snapshotArn,
    String? snapshotName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.RestoreFromSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'namespaceName': namespaceName,
        'workgroupName': workgroupName,
        if (adminPasswordSecretKmsKeyId != null)
          'adminPasswordSecretKmsKeyId': adminPasswordSecretKmsKeyId,
        if (manageAdminPassword != null)
          'manageAdminPassword': manageAdminPassword,
        if (ownerAccount != null) 'ownerAccount': ownerAccount,
        if (snapshotArn != null) 'snapshotArn': snapshotArn,
        if (snapshotName != null) 'snapshotName': snapshotName,
      },
    );

    return RestoreFromSnapshotResponse.fromJson(jsonResponse.body);
  }

  /// Restores a table from a recovery point to your Amazon Redshift Serverless
  /// instance. You can't use this operation to restore tables with interleaved
  /// sort keys.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [namespaceName] :
  /// Namespace of the recovery point to restore from.
  ///
  /// Parameter [newTableName] :
  /// The name of the table to create from the restore operation.
  ///
  /// Parameter [recoveryPointId] :
  /// The ID of the recovery point to restore the table from.
  ///
  /// Parameter [sourceDatabaseName] :
  /// The name of the source database that contains the table being restored.
  ///
  /// Parameter [sourceTableName] :
  /// The name of the source table being restored.
  ///
  /// Parameter [workgroupName] :
  /// The workgroup to restore the table to.
  ///
  /// Parameter [activateCaseSensitiveIdentifier] :
  /// Indicates whether name identifiers for database, schema, and table are
  /// case sensitive. If true, the names are case sensitive. If false, the names
  /// are not case sensitive. The default is false.
  ///
  /// Parameter [sourceSchemaName] :
  /// The name of the source schema that contains the table being restored.
  ///
  /// Parameter [targetDatabaseName] :
  /// The name of the database to restore the table to.
  ///
  /// Parameter [targetSchemaName] :
  /// The name of the schema to restore the table to.
  Future<RestoreTableFromRecoveryPointResponse> restoreTableFromRecoveryPoint({
    required String namespaceName,
    required String newTableName,
    required String recoveryPointId,
    required String sourceDatabaseName,
    required String sourceTableName,
    required String workgroupName,
    bool? activateCaseSensitiveIdentifier,
    String? sourceSchemaName,
    String? targetDatabaseName,
    String? targetSchemaName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.RestoreTableFromRecoveryPoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'namespaceName': namespaceName,
        'newTableName': newTableName,
        'recoveryPointId': recoveryPointId,
        'sourceDatabaseName': sourceDatabaseName,
        'sourceTableName': sourceTableName,
        'workgroupName': workgroupName,
        if (activateCaseSensitiveIdentifier != null)
          'activateCaseSensitiveIdentifier': activateCaseSensitiveIdentifier,
        if (sourceSchemaName != null) 'sourceSchemaName': sourceSchemaName,
        if (targetDatabaseName != null)
          'targetDatabaseName': targetDatabaseName,
        if (targetSchemaName != null) 'targetSchemaName': targetSchemaName,
      },
    );

    return RestoreTableFromRecoveryPointResponse.fromJson(jsonResponse.body);
  }

  /// Restores a table from a snapshot to your Amazon Redshift Serverless
  /// instance. You can't use this operation to restore tables with <a
  /// href="https://docs.aws.amazon.com/redshift/latest/dg/t_Sorting_data.html#t_Sorting_data-interleaved">interleaved
  /// sort keys</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [namespaceName] :
  /// The namespace of the snapshot to restore from.
  ///
  /// Parameter [newTableName] :
  /// The name of the table to create from the restore operation.
  ///
  /// Parameter [snapshotName] :
  /// The name of the snapshot to restore the table from.
  ///
  /// Parameter [sourceDatabaseName] :
  /// The name of the source database that contains the table being restored.
  ///
  /// Parameter [sourceTableName] :
  /// The name of the source table being restored.
  ///
  /// Parameter [workgroupName] :
  /// The workgroup to restore the table to.
  ///
  /// Parameter [activateCaseSensitiveIdentifier] :
  /// Indicates whether name identifiers for database, schema, and table are
  /// case sensitive. If true, the names are case sensitive. If false, the names
  /// are not case sensitive. The default is false.
  ///
  /// Parameter [sourceSchemaName] :
  /// The name of the source schema that contains the table being restored.
  ///
  /// Parameter [targetDatabaseName] :
  /// The name of the database to restore the table to.
  ///
  /// Parameter [targetSchemaName] :
  /// The name of the schema to restore the table to.
  Future<RestoreTableFromSnapshotResponse> restoreTableFromSnapshot({
    required String namespaceName,
    required String newTableName,
    required String snapshotName,
    required String sourceDatabaseName,
    required String sourceTableName,
    required String workgroupName,
    bool? activateCaseSensitiveIdentifier,
    String? sourceSchemaName,
    String? targetDatabaseName,
    String? targetSchemaName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.RestoreTableFromSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'namespaceName': namespaceName,
        'newTableName': newTableName,
        'snapshotName': snapshotName,
        'sourceDatabaseName': sourceDatabaseName,
        'sourceTableName': sourceTableName,
        'workgroupName': workgroupName,
        if (activateCaseSensitiveIdentifier != null)
          'activateCaseSensitiveIdentifier': activateCaseSensitiveIdentifier,
        if (sourceSchemaName != null) 'sourceSchemaName': sourceSchemaName,
        if (targetDatabaseName != null)
          'targetDatabaseName': targetDatabaseName,
        if (targetSchemaName != null) 'targetSchemaName': targetSchemaName,
      },
    );

    return RestoreTableFromSnapshotResponse.fromJson(jsonResponse.body);
  }

  /// Assigns one or more tags to a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [TooManyTagsException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to tag.
  ///
  /// Parameter [tags] :
  /// The map of the key-value pairs used to tag the resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tags': tags,
      },
    );
  }

  /// Removes a tag or set of tags from a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to remove tags from.
  ///
  /// Parameter [tagKeys] :
  /// The tag or set of tags to remove from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tagKeys': tagKeys,
      },
    );
  }

  /// Updates an Amazon Redshift Serverless certificate associated with a custom
  /// domain.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [customDomainCertificateArn] :
  /// The custom domain name’s certificate Amazon resource name (ARN). This is
  /// optional.
  ///
  /// Parameter [customDomainName] :
  /// The custom domain name associated with the workgroup.
  ///
  /// Parameter [workgroupName] :
  /// The name of the workgroup associated with the database.
  Future<UpdateCustomDomainAssociationResponse> updateCustomDomainAssociation({
    required String customDomainCertificateArn,
    required String customDomainName,
    required String workgroupName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.UpdateCustomDomainAssociation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'customDomainCertificateArn': customDomainCertificateArn,
        'customDomainName': customDomainName,
        'workgroupName': workgroupName,
      },
    );

    return UpdateCustomDomainAssociationResponse.fromJson(jsonResponse.body);
  }

  /// Updates an Amazon Redshift Serverless managed endpoint.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [endpointName] :
  /// The name of the VPC endpoint to update.
  ///
  /// Parameter [vpcSecurityGroupIds] :
  /// The list of VPC security groups associated with the endpoint after the
  /// endpoint is modified.
  Future<UpdateEndpointAccessResponse> updateEndpointAccess({
    required String endpointName,
    List<String>? vpcSecurityGroupIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.UpdateEndpointAccess'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'endpointName': endpointName,
        if (vpcSecurityGroupIds != null)
          'vpcSecurityGroupIds': vpcSecurityGroupIds,
      },
    );

    return UpdateEndpointAccessResponse.fromJson(jsonResponse.body);
  }

  /// Updates a namespace with the specified settings. Unless required, you
  /// can't update multiple parameters in one request. For example, you must
  /// specify both <code>adminUsername</code> and <code>adminUserPassword</code>
  /// to update either field, but you can't update both <code>kmsKeyId</code>
  /// and <code>logExports</code> in a single request.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [namespaceName] :
  /// The name of the namespace to update. You can't update the name of a
  /// namespace once it is created.
  ///
  /// Parameter [adminPasswordSecretKmsKeyId] :
  /// The ID of the Key Management Service (KMS) key used to encrypt and store
  /// the namespace's admin credentials secret. You can only use this parameter
  /// if <code>manageAdminPassword</code> is true.
  ///
  /// Parameter [adminUserPassword] :
  /// The password of the administrator for the first database created in the
  /// namespace. This parameter must be updated together with
  /// <code>adminUsername</code>.
  ///
  /// You can't use <code>adminUserPassword</code> if
  /// <code>manageAdminPassword</code> is true.
  ///
  /// Parameter [adminUsername] :
  /// The username of the administrator for the first database created in the
  /// namespace. This parameter must be updated together with
  /// <code>adminUserPassword</code>.
  ///
  /// Parameter [defaultIamRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role to set as a default in the
  /// namespace. This parameter must be updated together with
  /// <code>iamRoles</code>.
  ///
  /// Parameter [iamRoles] :
  /// A list of IAM roles to associate with the namespace. This parameter must
  /// be updated together with <code>defaultIamRoleArn</code>.
  ///
  /// Parameter [kmsKeyId] :
  /// The ID of the Amazon Web Services Key Management Service key used to
  /// encrypt your data.
  ///
  /// Parameter [logExports] :
  /// The types of logs the namespace can export. The export types are
  /// <code>userlog</code>, <code>connectionlog</code>, and
  /// <code>useractivitylog</code>.
  ///
  /// Parameter [manageAdminPassword] :
  /// If <code>true</code>, Amazon Redshift uses Secrets Manager to manage the
  /// namespace's admin credentials. You can't use
  /// <code>adminUserPassword</code> if <code>manageAdminPassword</code> is
  /// true. If <code>manageAdminPassword</code> is false or not set, Amazon
  /// Redshift uses <code>adminUserPassword</code> for the admin user account's
  /// password.
  Future<UpdateNamespaceResponse> updateNamespace({
    required String namespaceName,
    String? adminPasswordSecretKmsKeyId,
    String? adminUserPassword,
    String? adminUsername,
    String? defaultIamRoleArn,
    List<String>? iamRoles,
    String? kmsKeyId,
    List<LogExport>? logExports,
    bool? manageAdminPassword,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.UpdateNamespace'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'namespaceName': namespaceName,
        if (adminPasswordSecretKmsKeyId != null)
          'adminPasswordSecretKmsKeyId': adminPasswordSecretKmsKeyId,
        if (adminUserPassword != null) 'adminUserPassword': adminUserPassword,
        if (adminUsername != null) 'adminUsername': adminUsername,
        if (defaultIamRoleArn != null) 'defaultIamRoleArn': defaultIamRoleArn,
        if (iamRoles != null) 'iamRoles': iamRoles,
        if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
        if (logExports != null)
          'logExports': logExports.map((e) => e.toValue()).toList(),
        if (manageAdminPassword != null)
          'manageAdminPassword': manageAdminPassword,
      },
    );

    return UpdateNamespaceResponse.fromJson(jsonResponse.body);
  }

  /// Updates a scheduled action.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [scheduledActionName] :
  /// The name of the scheduled action to update to.
  ///
  /// Parameter [enabled] :
  /// Specifies whether to enable the scheduled action.
  ///
  /// Parameter [endTime] :
  /// The end time in UTC of the scheduled action to update.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the IAM role to assume to run the scheduled action. This IAM
  /// role must have permission to run the Amazon Redshift Serverless API
  /// operation in the scheduled action. This IAM role must allow the Amazon
  /// Redshift scheduler to schedule creating snapshots (Principal
  /// scheduler.redshift.amazonaws.com) to assume permissions on your behalf.
  /// For more information about the IAM role to use with the Amazon Redshift
  /// scheduler, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-identity-based.html">Using
  /// Identity-Based Policies for Amazon Redshift</a> in the Amazon Redshift
  /// Cluster Management Guide
  ///
  /// Parameter [schedule] :
  /// The schedule for a one-time (at timestamp format) or recurring (cron
  /// format) scheduled action. Schedule invocations must be separated by at
  /// least one hour. Times are in UTC.
  ///
  /// <ul>
  /// <li>
  /// Format of at timestamp is <code>yyyy-mm-ddThh:mm:ss</code>. For example,
  /// <code>2016-03-04T17:27:00</code>.
  /// </li>
  /// <li>
  /// Format of cron expression is <code>(Minutes Hours Day-of-month Month
  /// Day-of-week Year)</code>. For example, <code>"(0 10 ? * MON *)"</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions">Cron
  /// Expressions</a> in the <i>Amazon CloudWatch Events User Guide</i>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scheduledActionDescription] :
  /// The descripion of the scheduled action to update to.
  ///
  /// Parameter [startTime] :
  /// The start time in UTC of the scheduled action to update to.
  Future<UpdateScheduledActionResponse> updateScheduledAction({
    required String scheduledActionName,
    bool? enabled,
    DateTime? endTime,
    String? roleArn,
    Schedule? schedule,
    String? scheduledActionDescription,
    DateTime? startTime,
    TargetAction? targetAction,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.UpdateScheduledAction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'scheduledActionName': scheduledActionName,
        if (enabled != null) 'enabled': enabled,
        if (endTime != null) 'endTime': unixTimestampToJson(endTime),
        if (roleArn != null) 'roleArn': roleArn,
        if (schedule != null) 'schedule': schedule,
        if (scheduledActionDescription != null)
          'scheduledActionDescription': scheduledActionDescription,
        if (startTime != null) 'startTime': unixTimestampToJson(startTime),
        if (targetAction != null) 'targetAction': targetAction,
      },
    );

    return UpdateScheduledActionResponse.fromJson(jsonResponse.body);
  }

  /// Updates a snapshot.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [snapshotName] :
  /// The name of the snapshot.
  ///
  /// Parameter [retentionPeriod] :
  /// The new retention period of the snapshot.
  Future<UpdateSnapshotResponse> updateSnapshot({
    required String snapshotName,
    int? retentionPeriod,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.UpdateSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'snapshotName': snapshotName,
        if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
      },
    );

    return UpdateSnapshotResponse.fromJson(jsonResponse.body);
  }

  /// Updates a snapshot copy configuration.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [snapshotCopyConfigurationId] :
  /// The ID of the snapshot copy configuration to update.
  ///
  /// Parameter [snapshotRetentionPeriod] :
  /// The new retention period of how long to keep a snapshot in the destination
  /// Amazon Web Services Region.
  Future<UpdateSnapshotCopyConfigurationResponse>
      updateSnapshotCopyConfiguration({
    required String snapshotCopyConfigurationId,
    int? snapshotRetentionPeriod,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.UpdateSnapshotCopyConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'snapshotCopyConfigurationId': snapshotCopyConfigurationId,
        if (snapshotRetentionPeriod != null)
          'snapshotRetentionPeriod': snapshotRetentionPeriod,
      },
    );

    return UpdateSnapshotCopyConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Update a usage limit in Amazon Redshift Serverless. You can't update the
  /// usage type or period of a usage limit.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [usageLimitId] :
  /// The identifier of the usage limit to update.
  ///
  /// Parameter [amount] :
  /// The new limit amount. If time-based, this amount is in Redshift Processing
  /// Units (RPU) consumed per hour. If data-based, this amount is in terabytes
  /// (TB) of data transferred between Regions in cross-account sharing. The
  /// value must be a positive number.
  ///
  /// Parameter [breachAction] :
  /// The new action that Amazon Redshift Serverless takes when the limit is
  /// reached.
  Future<UpdateUsageLimitResponse> updateUsageLimit({
    required String usageLimitId,
    int? amount,
    UsageLimitBreachAction? breachAction,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.UpdateUsageLimit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'usageLimitId': usageLimitId,
        if (amount != null) 'amount': amount,
        if (breachAction != null) 'breachAction': breachAction.toValue(),
      },
    );

    return UpdateUsageLimitResponse.fromJson(jsonResponse.body);
  }

  /// Updates a workgroup with the specified configuration settings. You can't
  /// update multiple parameters in one request. For example, you can update
  /// <code>baseCapacity</code> or <code>port</code> in a single request, but
  /// you can't update both in the same request.
  ///
  /// May throw [InternalServerException].
  /// May throw [InsufficientCapacityException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [workgroupName] :
  /// The name of the workgroup to update. You can't update the name of a
  /// workgroup once it is created.
  ///
  /// Parameter [baseCapacity] :
  /// The new base data warehouse capacity in Redshift Processing Units (RPUs).
  ///
  /// Parameter [configParameters] :
  /// An array of parameters to set for advanced control over a database. The
  /// options are <code>auto_mv</code>, <code>datestyle</code>,
  /// <code>enable_case_sensitive_identifier</code>,
  /// <code>enable_user_activity_logging</code>, <code>query_group</code>,
  /// <code>search_path</code>, <code>require_ssl</code>,
  /// <code>use_fips_ssl</code>, and query monitoring metrics that let you
  /// define performance boundaries. For more information about query monitoring
  /// rules and available metrics, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/dg/cm-c-wlm-query-monitoring-rules.html#cm-c-wlm-query-monitoring-metrics-serverless">
  /// Query monitoring metrics for Amazon Redshift Serverless</a>.
  ///
  /// Parameter [enhancedVpcRouting] :
  /// The value that specifies whether to turn on enhanced virtual private cloud
  /// (VPC) routing, which forces Amazon Redshift Serverless to route traffic
  /// through your VPC.
  ///
  /// Parameter [maxCapacity] :
  /// The maximum data-warehouse capacity Amazon Redshift Serverless uses to
  /// serve queries. The max capacity is specified in RPUs.
  ///
  /// Parameter [port] :
  /// The custom port to use when connecting to a workgroup. Valid port ranges
  /// are 5431-5455 and 8191-8215. The default is 5439.
  ///
  /// Parameter [publiclyAccessible] :
  /// A value that specifies whether the workgroup can be accessible from a
  /// public network.
  ///
  /// Parameter [securityGroupIds] :
  /// An array of security group IDs to associate with the workgroup.
  ///
  /// Parameter [subnetIds] :
  /// An array of VPC subnet IDs to associate with the workgroup.
  Future<UpdateWorkgroupResponse> updateWorkgroup({
    required String workgroupName,
    int? baseCapacity,
    List<ConfigParameter>? configParameters,
    bool? enhancedVpcRouting,
    int? maxCapacity,
    int? port,
    bool? publiclyAccessible,
    List<String>? securityGroupIds,
    List<String>? subnetIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'RedshiftServerless.UpdateWorkgroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'workgroupName': workgroupName,
        if (baseCapacity != null) 'baseCapacity': baseCapacity,
        if (configParameters != null) 'configParameters': configParameters,
        if (enhancedVpcRouting != null)
          'enhancedVpcRouting': enhancedVpcRouting,
        if (maxCapacity != null) 'maxCapacity': maxCapacity,
        if (port != null) 'port': port,
        if (publiclyAccessible != null)
          'publiclyAccessible': publiclyAccessible,
        if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
        if (subnetIds != null) 'subnetIds': subnetIds,
      },
    );

    return UpdateWorkgroupResponse.fromJson(jsonResponse.body);
  }
}

/// An object that represents the custom domain name association.
class Association {
  /// The custom domain name’s certificate Amazon resource name (ARN).
  final String? customDomainCertificateArn;

  /// The expiration time for the certificate.
  final DateTime? customDomainCertificateExpiryTime;

  /// The custom domain name associated with the workgroup.
  final String? customDomainName;

  /// The name of the workgroup associated with the database.
  final String? workgroupName;

  Association({
    this.customDomainCertificateArn,
    this.customDomainCertificateExpiryTime,
    this.customDomainName,
    this.workgroupName,
  });

  factory Association.fromJson(Map<String, dynamic> json) {
    return Association(
      customDomainCertificateArn: json['customDomainCertificateArn'] as String?,
      customDomainCertificateExpiryTime:
          timeStampFromJson(json['customDomainCertificateExpiryTime']),
      customDomainName: json['customDomainName'] as String?,
      workgroupName: json['workgroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customDomainCertificateArn = this.customDomainCertificateArn;
    final customDomainCertificateExpiryTime =
        this.customDomainCertificateExpiryTime;
    final customDomainName = this.customDomainName;
    final workgroupName = this.workgroupName;
    return {
      if (customDomainCertificateArn != null)
        'customDomainCertificateArn': customDomainCertificateArn,
      if (customDomainCertificateExpiryTime != null)
        'customDomainCertificateExpiryTime':
            iso8601ToJson(customDomainCertificateExpiryTime),
      if (customDomainName != null) 'customDomainName': customDomainName,
      if (workgroupName != null) 'workgroupName': workgroupName,
    };
  }
}

/// An array of key-value pairs to set for advanced control over Amazon Redshift
/// Serverless.
class ConfigParameter {
  /// The key of the parameter. The options are <code>auto_mv</code>,
  /// <code>datestyle</code>, <code>enable_case_sensitive_identifier</code>,
  /// <code>enable_user_activity_logging</code>, <code>query_group</code>,
  /// <code>search_path</code>, <code>require_ssl</code>,
  /// <code>use_fips_ssl</code>, and query monitoring metrics that let you define
  /// performance boundaries. For more information about query monitoring rules
  /// and available metrics, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/dg/cm-c-wlm-query-monitoring-rules.html#cm-c-wlm-query-monitoring-metrics-serverless">Query
  /// monitoring metrics for Amazon Redshift Serverless</a>.
  final String? parameterKey;

  /// The value of the parameter to set.
  final String? parameterValue;

  ConfigParameter({
    this.parameterKey,
    this.parameterValue,
  });

  factory ConfigParameter.fromJson(Map<String, dynamic> json) {
    return ConfigParameter(
      parameterKey: json['parameterKey'] as String?,
      parameterValue: json['parameterValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final parameterKey = this.parameterKey;
    final parameterValue = this.parameterValue;
    return {
      if (parameterKey != null) 'parameterKey': parameterKey,
      if (parameterValue != null) 'parameterValue': parameterValue,
    };
  }
}

class ConvertRecoveryPointToSnapshotResponse {
  /// The snapshot converted from the recovery point.
  final Snapshot? snapshot;

  ConvertRecoveryPointToSnapshotResponse({
    this.snapshot,
  });

  factory ConvertRecoveryPointToSnapshotResponse.fromJson(
      Map<String, dynamic> json) {
    return ConvertRecoveryPointToSnapshotResponse(
      snapshot: json['snapshot'] != null
          ? Snapshot.fromJson(json['snapshot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'snapshot': snapshot,
    };
  }
}

class CreateCustomDomainAssociationResponse {
  /// The custom domain name’s certificate Amazon resource name (ARN).
  final String? customDomainCertificateArn;

  /// The expiration time for the certificate.
  final DateTime? customDomainCertificateExpiryTime;

  /// The custom domain name to associate with the workgroup.
  final String? customDomainName;

  /// The name of the workgroup associated with the database.
  final String? workgroupName;

  CreateCustomDomainAssociationResponse({
    this.customDomainCertificateArn,
    this.customDomainCertificateExpiryTime,
    this.customDomainName,
    this.workgroupName,
  });

  factory CreateCustomDomainAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateCustomDomainAssociationResponse(
      customDomainCertificateArn: json['customDomainCertificateArn'] as String?,
      customDomainCertificateExpiryTime:
          timeStampFromJson(json['customDomainCertificateExpiryTime']),
      customDomainName: json['customDomainName'] as String?,
      workgroupName: json['workgroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customDomainCertificateArn = this.customDomainCertificateArn;
    final customDomainCertificateExpiryTime =
        this.customDomainCertificateExpiryTime;
    final customDomainName = this.customDomainName;
    final workgroupName = this.workgroupName;
    return {
      if (customDomainCertificateArn != null)
        'customDomainCertificateArn': customDomainCertificateArn,
      if (customDomainCertificateExpiryTime != null)
        'customDomainCertificateExpiryTime':
            iso8601ToJson(customDomainCertificateExpiryTime),
      if (customDomainName != null) 'customDomainName': customDomainName,
      if (workgroupName != null) 'workgroupName': workgroupName,
    };
  }
}

class CreateEndpointAccessResponse {
  /// The created VPC endpoint.
  final EndpointAccess? endpoint;

  CreateEndpointAccessResponse({
    this.endpoint,
  });

  factory CreateEndpointAccessResponse.fromJson(Map<String, dynamic> json) {
    return CreateEndpointAccessResponse(
      endpoint: json['endpoint'] != null
          ? EndpointAccess.fromJson(json['endpoint'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    return {
      if (endpoint != null) 'endpoint': endpoint,
    };
  }
}

class CreateNamespaceResponse {
  /// The created namespace object.
  final Namespace? namespace;

  CreateNamespaceResponse({
    this.namespace,
  });

  factory CreateNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return CreateNamespaceResponse(
      namespace: json['namespace'] != null
          ? Namespace.fromJson(json['namespace'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    return {
      if (namespace != null) 'namespace': namespace,
    };
  }
}

class CreateScheduledActionResponse {
  /// The returned <code>ScheduledAction</code> object that describes the
  /// properties of a scheduled action.
  final ScheduledActionResponse? scheduledAction;

  CreateScheduledActionResponse({
    this.scheduledAction,
  });

  factory CreateScheduledActionResponse.fromJson(Map<String, dynamic> json) {
    return CreateScheduledActionResponse(
      scheduledAction: json['scheduledAction'] != null
          ? ScheduledActionResponse.fromJson(
              json['scheduledAction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledAction = this.scheduledAction;
    return {
      if (scheduledAction != null) 'scheduledAction': scheduledAction,
    };
  }
}

class CreateSnapshotCopyConfigurationResponse {
  /// The snapshot copy configuration object that is returned.
  final SnapshotCopyConfiguration snapshotCopyConfiguration;

  CreateSnapshotCopyConfigurationResponse({
    required this.snapshotCopyConfiguration,
  });

  factory CreateSnapshotCopyConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateSnapshotCopyConfigurationResponse(
      snapshotCopyConfiguration: SnapshotCopyConfiguration.fromJson(
          json['snapshotCopyConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshotCopyConfiguration = this.snapshotCopyConfiguration;
    return {
      'snapshotCopyConfiguration': snapshotCopyConfiguration,
    };
  }
}

class CreateSnapshotResponse {
  /// The created snapshot object.
  final Snapshot? snapshot;

  CreateSnapshotResponse({
    this.snapshot,
  });

  factory CreateSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return CreateSnapshotResponse(
      snapshot: json['snapshot'] != null
          ? Snapshot.fromJson(json['snapshot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'snapshot': snapshot,
    };
  }
}

/// The parameters that you can use to configure a <a
/// href="https://docs.aws.amazon.com/redshift-serverless/latest/APIReference/API_CreateScheduledAction.html">scheduled
/// action</a> to create a snapshot. For more information about creating a
/// scheduled action, see <a
/// href="https://docs.aws.amazon.com/redshift-serverless/latest/APIReference/API_CreateScheduledAction.html">CreateScheduledAction</a>.
class CreateSnapshotScheduleActionParameters {
  /// The name of the namespace for which you want to configure a scheduled action
  /// to create a snapshot.
  final String namespaceName;

  /// A string prefix that is attached to the name of the snapshot created by the
  /// scheduled action. The final name of the snapshot is the string prefix
  /// appended by the date and time of when the snapshot was created.
  final String snapshotNamePrefix;

  /// The retention period of the snapshot created by the scheduled action.
  final int? retentionPeriod;

  /// An array of <a
  /// href="https://docs.aws.amazon.com/redshift-serverless/latest/APIReference/API_Tag.html">Tag
  /// objects</a> to associate with the snapshot.
  final List<Tag>? tags;

  CreateSnapshotScheduleActionParameters({
    required this.namespaceName,
    required this.snapshotNamePrefix,
    this.retentionPeriod,
    this.tags,
  });

  factory CreateSnapshotScheduleActionParameters.fromJson(
      Map<String, dynamic> json) {
    return CreateSnapshotScheduleActionParameters(
      namespaceName: json['namespaceName'] as String,
      snapshotNamePrefix: json['snapshotNamePrefix'] as String,
      retentionPeriod: json['retentionPeriod'] as int?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final namespaceName = this.namespaceName;
    final snapshotNamePrefix = this.snapshotNamePrefix;
    final retentionPeriod = this.retentionPeriod;
    final tags = this.tags;
    return {
      'namespaceName': namespaceName,
      'snapshotNamePrefix': snapshotNamePrefix,
      if (retentionPeriod != null) 'retentionPeriod': retentionPeriod,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateUsageLimitResponse {
  /// The returned usage limit object.
  final UsageLimit? usageLimit;

  CreateUsageLimitResponse({
    this.usageLimit,
  });

  factory CreateUsageLimitResponse.fromJson(Map<String, dynamic> json) {
    return CreateUsageLimitResponse(
      usageLimit: json['usageLimit'] != null
          ? UsageLimit.fromJson(json['usageLimit'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final usageLimit = this.usageLimit;
    return {
      if (usageLimit != null) 'usageLimit': usageLimit,
    };
  }
}

class CreateWorkgroupResponse {
  /// The created workgroup object.
  final Workgroup? workgroup;

  CreateWorkgroupResponse({
    this.workgroup,
  });

  factory CreateWorkgroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkgroupResponse(
      workgroup: json['workgroup'] != null
          ? Workgroup.fromJson(json['workgroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final workgroup = this.workgroup;
    return {
      if (workgroup != null) 'workgroup': workgroup,
    };
  }
}

class DeleteCustomDomainAssociationResponse {
  DeleteCustomDomainAssociationResponse();

  factory DeleteCustomDomainAssociationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteCustomDomainAssociationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteEndpointAccessResponse {
  /// The deleted VPC endpoint.
  final EndpointAccess? endpoint;

  DeleteEndpointAccessResponse({
    this.endpoint,
  });

  factory DeleteEndpointAccessResponse.fromJson(Map<String, dynamic> json) {
    return DeleteEndpointAccessResponse(
      endpoint: json['endpoint'] != null
          ? EndpointAccess.fromJson(json['endpoint'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    return {
      if (endpoint != null) 'endpoint': endpoint,
    };
  }
}

class DeleteNamespaceResponse {
  /// The deleted namespace object.
  final Namespace namespace;

  DeleteNamespaceResponse({
    required this.namespace,
  });

  factory DeleteNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteNamespaceResponse(
      namespace: Namespace.fromJson(json['namespace'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    return {
      'namespace': namespace,
    };
  }
}

class DeleteResourcePolicyResponse {
  DeleteResourcePolicyResponse();

  factory DeleteResourcePolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteResourcePolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteScheduledActionResponse {
  /// The deleted scheduled action object.
  final ScheduledActionResponse? scheduledAction;

  DeleteScheduledActionResponse({
    this.scheduledAction,
  });

  factory DeleteScheduledActionResponse.fromJson(Map<String, dynamic> json) {
    return DeleteScheduledActionResponse(
      scheduledAction: json['scheduledAction'] != null
          ? ScheduledActionResponse.fromJson(
              json['scheduledAction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledAction = this.scheduledAction;
    return {
      if (scheduledAction != null) 'scheduledAction': scheduledAction,
    };
  }
}

class DeleteSnapshotCopyConfigurationResponse {
  /// The deleted snapshot copy configuration object.
  final SnapshotCopyConfiguration snapshotCopyConfiguration;

  DeleteSnapshotCopyConfigurationResponse({
    required this.snapshotCopyConfiguration,
  });

  factory DeleteSnapshotCopyConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteSnapshotCopyConfigurationResponse(
      snapshotCopyConfiguration: SnapshotCopyConfiguration.fromJson(
          json['snapshotCopyConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshotCopyConfiguration = this.snapshotCopyConfiguration;
    return {
      'snapshotCopyConfiguration': snapshotCopyConfiguration,
    };
  }
}

class DeleteSnapshotResponse {
  /// The deleted snapshot object.
  final Snapshot? snapshot;

  DeleteSnapshotResponse({
    this.snapshot,
  });

  factory DeleteSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return DeleteSnapshotResponse(
      snapshot: json['snapshot'] != null
          ? Snapshot.fromJson(json['snapshot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'snapshot': snapshot,
    };
  }
}

class DeleteUsageLimitResponse {
  /// The deleted usage limit object.
  final UsageLimit? usageLimit;

  DeleteUsageLimitResponse({
    this.usageLimit,
  });

  factory DeleteUsageLimitResponse.fromJson(Map<String, dynamic> json) {
    return DeleteUsageLimitResponse(
      usageLimit: json['usageLimit'] != null
          ? UsageLimit.fromJson(json['usageLimit'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final usageLimit = this.usageLimit;
    return {
      if (usageLimit != null) 'usageLimit': usageLimit,
    };
  }
}

class DeleteWorkgroupResponse {
  /// The deleted workgroup object.
  final Workgroup workgroup;

  DeleteWorkgroupResponse({
    required this.workgroup,
  });

  factory DeleteWorkgroupResponse.fromJson(Map<String, dynamic> json) {
    return DeleteWorkgroupResponse(
      workgroup: Workgroup.fromJson(json['workgroup'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final workgroup = this.workgroup;
    return {
      'workgroup': workgroup,
    };
  }
}

/// The VPC endpoint object.
class Endpoint {
  /// The DNS address of the VPC endpoint.
  final String? address;

  /// The port that Amazon Redshift Serverless listens on.
  final int? port;

  /// An array of <code>VpcEndpoint</code> objects.
  final List<VpcEndpoint>? vpcEndpoints;

  Endpoint({
    this.address,
    this.port,
    this.vpcEndpoints,
  });

  factory Endpoint.fromJson(Map<String, dynamic> json) {
    return Endpoint(
      address: json['address'] as String?,
      port: json['port'] as int?,
      vpcEndpoints: (json['vpcEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => VpcEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final port = this.port;
    final vpcEndpoints = this.vpcEndpoints;
    return {
      if (address != null) 'address': address,
      if (port != null) 'port': port,
      if (vpcEndpoints != null) 'vpcEndpoints': vpcEndpoints,
    };
  }
}

/// Information about an Amazon Redshift Serverless VPC endpoint.
class EndpointAccess {
  /// The DNS address of the endpoint.
  final String? address;

  /// The Amazon Resource Name (ARN) of the VPC endpoint.
  final String? endpointArn;

  /// The time that the endpoint was created.
  final DateTime? endpointCreateTime;

  /// The name of the VPC endpoint.
  final String? endpointName;

  /// The status of the VPC endpoint.
  final String? endpointStatus;

  /// The port number on which Amazon Redshift Serverless accepts incoming
  /// connections.
  final int? port;

  /// The unique identifier of subnets where Amazon Redshift Serverless choose to
  /// deploy the VPC endpoint.
  final List<String>? subnetIds;

  /// The connection endpoint for connecting to Amazon Redshift Serverless.
  final VpcEndpoint? vpcEndpoint;

  /// The security groups associated with the endpoint.
  final List<VpcSecurityGroupMembership>? vpcSecurityGroups;

  /// The name of the workgroup associated with the endpoint.
  final String? workgroupName;

  EndpointAccess({
    this.address,
    this.endpointArn,
    this.endpointCreateTime,
    this.endpointName,
    this.endpointStatus,
    this.port,
    this.subnetIds,
    this.vpcEndpoint,
    this.vpcSecurityGroups,
    this.workgroupName,
  });

  factory EndpointAccess.fromJson(Map<String, dynamic> json) {
    return EndpointAccess(
      address: json['address'] as String?,
      endpointArn: json['endpointArn'] as String?,
      endpointCreateTime: timeStampFromJson(json['endpointCreateTime']),
      endpointName: json['endpointName'] as String?,
      endpointStatus: json['endpointStatus'] as String?,
      port: json['port'] as int?,
      subnetIds: (json['subnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcEndpoint: json['vpcEndpoint'] != null
          ? VpcEndpoint.fromJson(json['vpcEndpoint'] as Map<String, dynamic>)
          : null,
      vpcSecurityGroups: (json['vpcSecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) =>
              VpcSecurityGroupMembership.fromJson(e as Map<String, dynamic>))
          .toList(),
      workgroupName: json['workgroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final endpointArn = this.endpointArn;
    final endpointCreateTime = this.endpointCreateTime;
    final endpointName = this.endpointName;
    final endpointStatus = this.endpointStatus;
    final port = this.port;
    final subnetIds = this.subnetIds;
    final vpcEndpoint = this.vpcEndpoint;
    final vpcSecurityGroups = this.vpcSecurityGroups;
    final workgroupName = this.workgroupName;
    return {
      if (address != null) 'address': address,
      if (endpointArn != null) 'endpointArn': endpointArn,
      if (endpointCreateTime != null)
        'endpointCreateTime': iso8601ToJson(endpointCreateTime),
      if (endpointName != null) 'endpointName': endpointName,
      if (endpointStatus != null) 'endpointStatus': endpointStatus,
      if (port != null) 'port': port,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (vpcEndpoint != null) 'vpcEndpoint': vpcEndpoint,
      if (vpcSecurityGroups != null) 'vpcSecurityGroups': vpcSecurityGroups,
      if (workgroupName != null) 'workgroupName': workgroupName,
    };
  }
}

class GetCredentialsResponse {
  /// A temporary password that authorizes the user name returned by
  /// <code>DbUser</code> to log on to the database <code>DbName</code>.
  final String? dbPassword;

  /// A database user name that is authorized to log on to the database
  /// <code>DbName</code> using the password <code>DbPassword</code>. If the
  /// specified <code>DbUser</code> exists in the database, the new user name has
  /// the same database privileges as the the user named in <code>DbUser</code>.
  /// By default, the user is added to PUBLIC.
  final String? dbUser;

  /// The date and time the password in <code>DbPassword</code> expires.
  final DateTime? expiration;

  /// The date and time of when the <code>DbUser</code> and
  /// <code>DbPassword</code> authorization refreshes.
  final DateTime? nextRefreshTime;

  GetCredentialsResponse({
    this.dbPassword,
    this.dbUser,
    this.expiration,
    this.nextRefreshTime,
  });

  factory GetCredentialsResponse.fromJson(Map<String, dynamic> json) {
    return GetCredentialsResponse(
      dbPassword: json['dbPassword'] as String?,
      dbUser: json['dbUser'] as String?,
      expiration: timeStampFromJson(json['expiration']),
      nextRefreshTime: timeStampFromJson(json['nextRefreshTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final dbPassword = this.dbPassword;
    final dbUser = this.dbUser;
    final expiration = this.expiration;
    final nextRefreshTime = this.nextRefreshTime;
    return {
      if (dbPassword != null) 'dbPassword': dbPassword,
      if (dbUser != null) 'dbUser': dbUser,
      if (expiration != null) 'expiration': unixTimestampToJson(expiration),
      if (nextRefreshTime != null)
        'nextRefreshTime': unixTimestampToJson(nextRefreshTime),
    };
  }
}

class GetCustomDomainAssociationResponse {
  /// The custom domain name’s certificate Amazon resource name (ARN).
  final String? customDomainCertificateArn;

  /// The expiration time for the certificate.
  final DateTime? customDomainCertificateExpiryTime;

  /// The custom domain name associated with the workgroup.
  final String? customDomainName;

  /// The name of the workgroup associated with the database.
  final String? workgroupName;

  GetCustomDomainAssociationResponse({
    this.customDomainCertificateArn,
    this.customDomainCertificateExpiryTime,
    this.customDomainName,
    this.workgroupName,
  });

  factory GetCustomDomainAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCustomDomainAssociationResponse(
      customDomainCertificateArn: json['customDomainCertificateArn'] as String?,
      customDomainCertificateExpiryTime:
          timeStampFromJson(json['customDomainCertificateExpiryTime']),
      customDomainName: json['customDomainName'] as String?,
      workgroupName: json['workgroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customDomainCertificateArn = this.customDomainCertificateArn;
    final customDomainCertificateExpiryTime =
        this.customDomainCertificateExpiryTime;
    final customDomainName = this.customDomainName;
    final workgroupName = this.workgroupName;
    return {
      if (customDomainCertificateArn != null)
        'customDomainCertificateArn': customDomainCertificateArn,
      if (customDomainCertificateExpiryTime != null)
        'customDomainCertificateExpiryTime':
            iso8601ToJson(customDomainCertificateExpiryTime),
      if (customDomainName != null) 'customDomainName': customDomainName,
      if (workgroupName != null) 'workgroupName': workgroupName,
    };
  }
}

class GetEndpointAccessResponse {
  /// The returned VPC endpoint.
  final EndpointAccess? endpoint;

  GetEndpointAccessResponse({
    this.endpoint,
  });

  factory GetEndpointAccessResponse.fromJson(Map<String, dynamic> json) {
    return GetEndpointAccessResponse(
      endpoint: json['endpoint'] != null
          ? EndpointAccess.fromJson(json['endpoint'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    return {
      if (endpoint != null) 'endpoint': endpoint,
    };
  }
}

class GetNamespaceResponse {
  /// The returned namespace object.
  final Namespace namespace;

  GetNamespaceResponse({
    required this.namespace,
  });

  factory GetNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return GetNamespaceResponse(
      namespace: Namespace.fromJson(json['namespace'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    return {
      'namespace': namespace,
    };
  }
}

class GetRecoveryPointResponse {
  /// The returned recovery point object.
  final RecoveryPoint? recoveryPoint;

  GetRecoveryPointResponse({
    this.recoveryPoint,
  });

  factory GetRecoveryPointResponse.fromJson(Map<String, dynamic> json) {
    return GetRecoveryPointResponse(
      recoveryPoint: json['recoveryPoint'] != null
          ? RecoveryPoint.fromJson(
              json['recoveryPoint'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final recoveryPoint = this.recoveryPoint;
    return {
      if (recoveryPoint != null) 'recoveryPoint': recoveryPoint,
    };
  }
}

class GetResourcePolicyResponse {
  /// The returned resource policy.
  final ResourcePolicy? resourcePolicy;

  GetResourcePolicyResponse({
    this.resourcePolicy,
  });

  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyResponse(
      resourcePolicy: json['resourcePolicy'] != null
          ? ResourcePolicy.fromJson(
              json['resourcePolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resourcePolicy = this.resourcePolicy;
    return {
      if (resourcePolicy != null) 'resourcePolicy': resourcePolicy,
    };
  }
}

class GetScheduledActionResponse {
  /// The returned scheduled action object.
  final ScheduledActionResponse? scheduledAction;

  GetScheduledActionResponse({
    this.scheduledAction,
  });

  factory GetScheduledActionResponse.fromJson(Map<String, dynamic> json) {
    return GetScheduledActionResponse(
      scheduledAction: json['scheduledAction'] != null
          ? ScheduledActionResponse.fromJson(
              json['scheduledAction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledAction = this.scheduledAction;
    return {
      if (scheduledAction != null) 'scheduledAction': scheduledAction,
    };
  }
}

class GetSnapshotResponse {
  /// The returned snapshot object.
  final Snapshot? snapshot;

  GetSnapshotResponse({
    this.snapshot,
  });

  factory GetSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return GetSnapshotResponse(
      snapshot: json['snapshot'] != null
          ? Snapshot.fromJson(json['snapshot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'snapshot': snapshot,
    };
  }
}

class GetTableRestoreStatusResponse {
  /// The returned <code>TableRestoreStatus</code> object that contains
  /// information about the status of your <code>RestoreTableFromSnapshot</code>
  /// request.
  final TableRestoreStatus? tableRestoreStatus;

  GetTableRestoreStatusResponse({
    this.tableRestoreStatus,
  });

  factory GetTableRestoreStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetTableRestoreStatusResponse(
      tableRestoreStatus: json['tableRestoreStatus'] != null
          ? TableRestoreStatus.fromJson(
              json['tableRestoreStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tableRestoreStatus = this.tableRestoreStatus;
    return {
      if (tableRestoreStatus != null) 'tableRestoreStatus': tableRestoreStatus,
    };
  }
}

class GetUsageLimitResponse {
  /// The returned usage limit object.
  final UsageLimit? usageLimit;

  GetUsageLimitResponse({
    this.usageLimit,
  });

  factory GetUsageLimitResponse.fromJson(Map<String, dynamic> json) {
    return GetUsageLimitResponse(
      usageLimit: json['usageLimit'] != null
          ? UsageLimit.fromJson(json['usageLimit'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final usageLimit = this.usageLimit;
    return {
      if (usageLimit != null) 'usageLimit': usageLimit,
    };
  }
}

class GetWorkgroupResponse {
  /// The returned workgroup object.
  final Workgroup workgroup;

  GetWorkgroupResponse({
    required this.workgroup,
  });

  factory GetWorkgroupResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkgroupResponse(
      workgroup: Workgroup.fromJson(json['workgroup'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final workgroup = this.workgroup;
    return {
      'workgroup': workgroup,
    };
  }
}

class ListCustomDomainAssociationsResponse {
  /// A list of Association objects.
  final List<Association>? associations;

  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  ListCustomDomainAssociationsResponse({
    this.associations,
    this.nextToken,
  });

  factory ListCustomDomainAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCustomDomainAssociationsResponse(
      associations: (json['associations'] as List?)
          ?.whereNotNull()
          .map((e) => Association.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associations = this.associations;
    final nextToken = this.nextToken;
    return {
      if (associations != null) 'associations': associations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEndpointAccessResponse {
  /// The returned VPC endpoints.
  final List<EndpointAccess> endpoints;

  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  ListEndpointAccessResponse({
    required this.endpoints,
    this.nextToken,
  });

  factory ListEndpointAccessResponse.fromJson(Map<String, dynamic> json) {
    return ListEndpointAccessResponse(
      endpoints: (json['endpoints'] as List)
          .whereNotNull()
          .map((e) => EndpointAccess.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoints = this.endpoints;
    final nextToken = this.nextToken;
    return {
      'endpoints': endpoints,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNamespacesResponse {
  /// The list of returned namespaces.
  final List<Namespace> namespaces;

  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  ListNamespacesResponse({
    required this.namespaces,
    this.nextToken,
  });

  factory ListNamespacesResponse.fromJson(Map<String, dynamic> json) {
    return ListNamespacesResponse(
      namespaces: (json['namespaces'] as List)
          .whereNotNull()
          .map((e) => Namespace.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final namespaces = this.namespaces;
    final nextToken = this.nextToken;
    return {
      'namespaces': namespaces,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListRecoveryPointsResponse {
  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page.
  final String? nextToken;

  /// The returned recovery point objects.
  final List<RecoveryPoint>? recoveryPoints;

  ListRecoveryPointsResponse({
    this.nextToken,
    this.recoveryPoints,
  });

  factory ListRecoveryPointsResponse.fromJson(Map<String, dynamic> json) {
    return ListRecoveryPointsResponse(
      nextToken: json['nextToken'] as String?,
      recoveryPoints: (json['recoveryPoints'] as List?)
          ?.whereNotNull()
          .map((e) => RecoveryPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final recoveryPoints = this.recoveryPoints;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (recoveryPoints != null) 'recoveryPoints': recoveryPoints,
    };
  }
}

class ListScheduledActionsResponse {
  /// If nextToken is returned, there are more results available. The value of
  /// nextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  final String? nextToken;

  /// All of the returned scheduled action association objects.
  final List<ScheduledActionAssociation>? scheduledActions;

  ListScheduledActionsResponse({
    this.nextToken,
    this.scheduledActions,
  });

  factory ListScheduledActionsResponse.fromJson(Map<String, dynamic> json) {
    return ListScheduledActionsResponse(
      nextToken: json['nextToken'] as String?,
      scheduledActions: (json['scheduledActions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ScheduledActionAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final scheduledActions = this.scheduledActions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (scheduledActions != null) 'scheduledActions': scheduledActions,
    };
  }
}

class ListSnapshotCopyConfigurationsResponse {
  /// All of the returned snapshot copy configurations.
  final List<SnapshotCopyConfiguration> snapshotCopyConfigurations;

  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page.
  final String? nextToken;

  ListSnapshotCopyConfigurationsResponse({
    required this.snapshotCopyConfigurations,
    this.nextToken,
  });

  factory ListSnapshotCopyConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSnapshotCopyConfigurationsResponse(
      snapshotCopyConfigurations: (json['snapshotCopyConfigurations'] as List)
          .whereNotNull()
          .map((e) =>
              SnapshotCopyConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshotCopyConfigurations = this.snapshotCopyConfigurations;
    final nextToken = this.nextToken;
    return {
      'snapshotCopyConfigurations': snapshotCopyConfigurations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSnapshotsResponse {
  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// Make the call again using the returned token to retrieve the next page.
  final String? nextToken;

  /// All of the returned snapshot objects.
  final List<Snapshot>? snapshots;

  ListSnapshotsResponse({
    this.nextToken,
    this.snapshots,
  });

  factory ListSnapshotsResponse.fromJson(Map<String, dynamic> json) {
    return ListSnapshotsResponse(
      nextToken: json['nextToken'] as String?,
      snapshots: (json['snapshots'] as List?)
          ?.whereNotNull()
          .map((e) => Snapshot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final snapshots = this.snapshots;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (snapshots != null) 'snapshots': snapshots,
    };
  }
}

class ListTableRestoreStatusResponse {
  /// If your initial <code>ListTableRestoreStatus</code> operation returns a
  /// <code>nextToken</code>, you can include the returned <code>nextToken</code>
  /// in following <code>ListTableRestoreStatus</code> operations. This will
  /// returns results on the next page.
  final String? nextToken;

  /// The array of returned <code>TableRestoreStatus</code> objects.
  final List<TableRestoreStatus>? tableRestoreStatuses;

  ListTableRestoreStatusResponse({
    this.nextToken,
    this.tableRestoreStatuses,
  });

  factory ListTableRestoreStatusResponse.fromJson(Map<String, dynamic> json) {
    return ListTableRestoreStatusResponse(
      nextToken: json['nextToken'] as String?,
      tableRestoreStatuses: (json['tableRestoreStatuses'] as List?)
          ?.whereNotNull()
          .map((e) => TableRestoreStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tableRestoreStatuses = this.tableRestoreStatuses;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (tableRestoreStatuses != null)
        'tableRestoreStatuses': tableRestoreStatuses,
    };
  }
}

class ListTagsForResourceResponse {
  /// A map of the key-value pairs assigned to the resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

class ListUsageLimitsResponse {
  /// When <code>nextToken</code> is returned, there are more results available.
  /// The value of <code>nextToken</code> is a unique pagination token for each
  /// page. Make the call again using the returned token to retrieve the next
  /// page.
  final String? nextToken;

  /// An array of returned usage limit objects.
  final List<UsageLimit>? usageLimits;

  ListUsageLimitsResponse({
    this.nextToken,
    this.usageLimits,
  });

  factory ListUsageLimitsResponse.fromJson(Map<String, dynamic> json) {
    return ListUsageLimitsResponse(
      nextToken: json['nextToken'] as String?,
      usageLimits: (json['usageLimits'] as List?)
          ?.whereNotNull()
          .map((e) => UsageLimit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final usageLimits = this.usageLimits;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (usageLimits != null) 'usageLimits': usageLimits,
    };
  }
}

class ListWorkgroupsResponse {
  /// The returned array of workgroups.
  final List<Workgroup> workgroups;

  /// If <code>nextToken</code> is returned, there are more results available. The
  /// value of <code>nextToken</code> is a unique pagination token for each page.
  /// To retrieve the next page, make the call again using the returned token.
  final String? nextToken;

  ListWorkgroupsResponse({
    required this.workgroups,
    this.nextToken,
  });

  factory ListWorkgroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkgroupsResponse(
      workgroups: (json['workgroups'] as List)
          .whereNotNull()
          .map((e) => Workgroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workgroups = this.workgroups;
    final nextToken = this.nextToken;
    return {
      'workgroups': workgroups,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

enum LogExport {
  useractivitylog,
  userlog,
  connectionlog,
}

extension LogExportValueExtension on LogExport {
  String toValue() {
    switch (this) {
      case LogExport.useractivitylog:
        return 'useractivitylog';
      case LogExport.userlog:
        return 'userlog';
      case LogExport.connectionlog:
        return 'connectionlog';
    }
  }
}

extension LogExportFromString on String {
  LogExport toLogExport() {
    switch (this) {
      case 'useractivitylog':
        return LogExport.useractivitylog;
      case 'userlog':
        return LogExport.userlog;
      case 'connectionlog':
        return LogExport.connectionlog;
    }
    throw Exception('$this is not known in enum LogExport');
  }
}

/// A collection of database objects and users.
class Namespace {
  /// The Amazon Resource Name (ARN) for the namespace's admin user credentials
  /// secret.
  final String? adminPasswordSecretArn;

  /// The ID of the Key Management Service (KMS) key used to encrypt and store the
  /// namespace's admin credentials secret.
  final String? adminPasswordSecretKmsKeyId;

  /// The username of the administrator for the first database created in the
  /// namespace.
  final String? adminUsername;

  /// The date of when the namespace was created.
  final DateTime? creationDate;

  /// The name of the first database created in the namespace.
  final String? dbName;

  /// The Amazon Resource Name (ARN) of the IAM role to set as a default in the
  /// namespace.
  final String? defaultIamRoleArn;

  /// A list of IAM roles to associate with the namespace.
  final List<String>? iamRoles;

  /// The ID of the Amazon Web Services Key Management Service key used to encrypt
  /// your data.
  final String? kmsKeyId;

  /// The types of logs the namespace can export. Available export types are User
  /// log, Connection log, and User activity log.
  final List<LogExport>? logExports;

  /// The Amazon Resource Name (ARN) associated with a namespace.
  final String? namespaceArn;

  /// The unique identifier of a namespace.
  final String? namespaceId;

  /// The name of the namespace. Must be between 3-64 alphanumeric characters in
  /// lowercase, and it cannot be a reserved word. A list of reserved words can be
  /// found in <a
  /// href="https://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html">Reserved
  /// Words</a> in the Amazon Redshift Database Developer Guide.
  final String? namespaceName;

  /// The status of the namespace.
  final NamespaceStatus? status;

  Namespace({
    this.adminPasswordSecretArn,
    this.adminPasswordSecretKmsKeyId,
    this.adminUsername,
    this.creationDate,
    this.dbName,
    this.defaultIamRoleArn,
    this.iamRoles,
    this.kmsKeyId,
    this.logExports,
    this.namespaceArn,
    this.namespaceId,
    this.namespaceName,
    this.status,
  });

  factory Namespace.fromJson(Map<String, dynamic> json) {
    return Namespace(
      adminPasswordSecretArn: json['adminPasswordSecretArn'] as String?,
      adminPasswordSecretKmsKeyId:
          json['adminPasswordSecretKmsKeyId'] as String?,
      adminUsername: json['adminUsername'] as String?,
      creationDate: timeStampFromJson(json['creationDate']),
      dbName: json['dbName'] as String?,
      defaultIamRoleArn: json['defaultIamRoleArn'] as String?,
      iamRoles: (json['iamRoles'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      kmsKeyId: json['kmsKeyId'] as String?,
      logExports: (json['logExports'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toLogExport())
          .toList(),
      namespaceArn: json['namespaceArn'] as String?,
      namespaceId: json['namespaceId'] as String?,
      namespaceName: json['namespaceName'] as String?,
      status: (json['status'] as String?)?.toNamespaceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final adminPasswordSecretArn = this.adminPasswordSecretArn;
    final adminPasswordSecretKmsKeyId = this.adminPasswordSecretKmsKeyId;
    final adminUsername = this.adminUsername;
    final creationDate = this.creationDate;
    final dbName = this.dbName;
    final defaultIamRoleArn = this.defaultIamRoleArn;
    final iamRoles = this.iamRoles;
    final kmsKeyId = this.kmsKeyId;
    final logExports = this.logExports;
    final namespaceArn = this.namespaceArn;
    final namespaceId = this.namespaceId;
    final namespaceName = this.namespaceName;
    final status = this.status;
    return {
      if (adminPasswordSecretArn != null)
        'adminPasswordSecretArn': adminPasswordSecretArn,
      if (adminPasswordSecretKmsKeyId != null)
        'adminPasswordSecretKmsKeyId': adminPasswordSecretKmsKeyId,
      if (adminUsername != null) 'adminUsername': adminUsername,
      if (creationDate != null) 'creationDate': iso8601ToJson(creationDate),
      if (dbName != null) 'dbName': dbName,
      if (defaultIamRoleArn != null) 'defaultIamRoleArn': defaultIamRoleArn,
      if (iamRoles != null) 'iamRoles': iamRoles,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (logExports != null)
        'logExports': logExports.map((e) => e.toValue()).toList(),
      if (namespaceArn != null) 'namespaceArn': namespaceArn,
      if (namespaceId != null) 'namespaceId': namespaceId,
      if (namespaceName != null) 'namespaceName': namespaceName,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum NamespaceStatus {
  available,
  modifying,
  deleting,
}

extension NamespaceStatusValueExtension on NamespaceStatus {
  String toValue() {
    switch (this) {
      case NamespaceStatus.available:
        return 'AVAILABLE';
      case NamespaceStatus.modifying:
        return 'MODIFYING';
      case NamespaceStatus.deleting:
        return 'DELETING';
    }
  }
}

extension NamespaceStatusFromString on String {
  NamespaceStatus toNamespaceStatus() {
    switch (this) {
      case 'AVAILABLE':
        return NamespaceStatus.available;
      case 'MODIFYING':
        return NamespaceStatus.modifying;
      case 'DELETING':
        return NamespaceStatus.deleting;
    }
    throw Exception('$this is not known in enum NamespaceStatus');
  }
}

/// Contains information about a network interface in an Amazon Redshift
/// Serverless managed VPC endpoint.
class NetworkInterface {
  /// The availability Zone.
  final String? availabilityZone;

  /// The unique identifier of the network interface.
  final String? networkInterfaceId;

  /// The IPv4 address of the network interface within the subnet.
  final String? privateIpAddress;

  /// The unique identifier of the subnet.
  final String? subnetId;

  NetworkInterface({
    this.availabilityZone,
    this.networkInterfaceId,
    this.privateIpAddress,
    this.subnetId,
  });

  factory NetworkInterface.fromJson(Map<String, dynamic> json) {
    return NetworkInterface(
      availabilityZone: json['availabilityZone'] as String?,
      networkInterfaceId: json['networkInterfaceId'] as String?,
      privateIpAddress: json['privateIpAddress'] as String?,
      subnetId: json['subnetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final networkInterfaceId = this.networkInterfaceId;
    final privateIpAddress = this.privateIpAddress;
    final subnetId = this.subnetId;
    return {
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (networkInterfaceId != null) 'networkInterfaceId': networkInterfaceId,
      if (privateIpAddress != null) 'privateIpAddress': privateIpAddress,
      if (subnetId != null) 'subnetId': subnetId,
    };
  }
}

class PutResourcePolicyResponse {
  /// The policy that was created or updated.
  final ResourcePolicy? resourcePolicy;

  PutResourcePolicyResponse({
    this.resourcePolicy,
  });

  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutResourcePolicyResponse(
      resourcePolicy: json['resourcePolicy'] != null
          ? ResourcePolicy.fromJson(
              json['resourcePolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resourcePolicy = this.resourcePolicy;
    return {
      if (resourcePolicy != null) 'resourcePolicy': resourcePolicy,
    };
  }
}

/// The automatically created recovery point of a namespace. Recovery points are
/// created every 30 minutes and kept for 24 hours.
class RecoveryPoint {
  /// The Amazon Resource Name (ARN) of the namespace the recovery point is
  /// associated with.
  final String? namespaceArn;

  /// The name of the namespace the recovery point is associated with.
  final String? namespaceName;

  /// The time the recovery point is created.
  final DateTime? recoveryPointCreateTime;

  /// The unique identifier of the recovery point.
  final String? recoveryPointId;

  /// The total size of the data in the recovery point in megabytes.
  final double? totalSizeInMegaBytes;

  /// The name of the workgroup the recovery point is associated with.
  final String? workgroupName;

  RecoveryPoint({
    this.namespaceArn,
    this.namespaceName,
    this.recoveryPointCreateTime,
    this.recoveryPointId,
    this.totalSizeInMegaBytes,
    this.workgroupName,
  });

  factory RecoveryPoint.fromJson(Map<String, dynamic> json) {
    return RecoveryPoint(
      namespaceArn: json['namespaceArn'] as String?,
      namespaceName: json['namespaceName'] as String?,
      recoveryPointCreateTime:
          timeStampFromJson(json['recoveryPointCreateTime']),
      recoveryPointId: json['recoveryPointId'] as String?,
      totalSizeInMegaBytes: json['totalSizeInMegaBytes'] as double?,
      workgroupName: json['workgroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final namespaceArn = this.namespaceArn;
    final namespaceName = this.namespaceName;
    final recoveryPointCreateTime = this.recoveryPointCreateTime;
    final recoveryPointId = this.recoveryPointId;
    final totalSizeInMegaBytes = this.totalSizeInMegaBytes;
    final workgroupName = this.workgroupName;
    return {
      if (namespaceArn != null) 'namespaceArn': namespaceArn,
      if (namespaceName != null) 'namespaceName': namespaceName,
      if (recoveryPointCreateTime != null)
        'recoveryPointCreateTime': iso8601ToJson(recoveryPointCreateTime),
      if (recoveryPointId != null) 'recoveryPointId': recoveryPointId,
      if (totalSizeInMegaBytes != null)
        'totalSizeInMegaBytes': totalSizeInMegaBytes,
      if (workgroupName != null) 'workgroupName': workgroupName,
    };
  }
}

/// The resource policy object. Currently, you can use policies to share
/// snapshots across Amazon Web Services accounts.
class ResourcePolicy {
  /// The resource policy.
  final String? policy;

  /// The Amazon Resource Name (ARN) of the policy.
  final String? resourceArn;

  ResourcePolicy({
    this.policy,
    this.resourceArn,
  });

  factory ResourcePolicy.fromJson(Map<String, dynamic> json) {
    return ResourcePolicy(
      policy: json['policy'] as String?,
      resourceArn: json['resourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final resourceArn = this.resourceArn;
    return {
      if (policy != null) 'policy': policy,
      if (resourceArn != null) 'resourceArn': resourceArn,
    };
  }
}

class RestoreFromRecoveryPointResponse {
  /// The namespace that data was restored into.
  final Namespace? namespace;

  /// The unique identifier of the recovery point used for the restore.
  final String? recoveryPointId;

  RestoreFromRecoveryPointResponse({
    this.namespace,
    this.recoveryPointId,
  });

  factory RestoreFromRecoveryPointResponse.fromJson(Map<String, dynamic> json) {
    return RestoreFromRecoveryPointResponse(
      namespace: json['namespace'] != null
          ? Namespace.fromJson(json['namespace'] as Map<String, dynamic>)
          : null,
      recoveryPointId: json['recoveryPointId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    final recoveryPointId = this.recoveryPointId;
    return {
      if (namespace != null) 'namespace': namespace,
      if (recoveryPointId != null) 'recoveryPointId': recoveryPointId,
    };
  }
}

class RestoreFromSnapshotResponse {
  final Namespace? namespace;

  /// The owner Amazon Web Services; account of the snapshot that was restored.
  final String? ownerAccount;

  /// The name of the snapshot used to restore the namespace.
  final String? snapshotName;

  RestoreFromSnapshotResponse({
    this.namespace,
    this.ownerAccount,
    this.snapshotName,
  });

  factory RestoreFromSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return RestoreFromSnapshotResponse(
      namespace: json['namespace'] != null
          ? Namespace.fromJson(json['namespace'] as Map<String, dynamic>)
          : null,
      ownerAccount: json['ownerAccount'] as String?,
      snapshotName: json['snapshotName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    final ownerAccount = this.ownerAccount;
    final snapshotName = this.snapshotName;
    return {
      if (namespace != null) 'namespace': namespace,
      if (ownerAccount != null) 'ownerAccount': ownerAccount,
      if (snapshotName != null) 'snapshotName': snapshotName,
    };
  }
}

class RestoreTableFromRecoveryPointResponse {
  final TableRestoreStatus? tableRestoreStatus;

  RestoreTableFromRecoveryPointResponse({
    this.tableRestoreStatus,
  });

  factory RestoreTableFromRecoveryPointResponse.fromJson(
      Map<String, dynamic> json) {
    return RestoreTableFromRecoveryPointResponse(
      tableRestoreStatus: json['tableRestoreStatus'] != null
          ? TableRestoreStatus.fromJson(
              json['tableRestoreStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tableRestoreStatus = this.tableRestoreStatus;
    return {
      if (tableRestoreStatus != null) 'tableRestoreStatus': tableRestoreStatus,
    };
  }
}

class RestoreTableFromSnapshotResponse {
  /// The TableRestoreStatus object that contains the status of the restore
  /// operation.
  final TableRestoreStatus? tableRestoreStatus;

  RestoreTableFromSnapshotResponse({
    this.tableRestoreStatus,
  });

  factory RestoreTableFromSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return RestoreTableFromSnapshotResponse(
      tableRestoreStatus: json['tableRestoreStatus'] != null
          ? TableRestoreStatus.fromJson(
              json['tableRestoreStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tableRestoreStatus = this.tableRestoreStatus;
    return {
      if (tableRestoreStatus != null) 'tableRestoreStatus': tableRestoreStatus,
    };
  }
}

/// The schedule of when Amazon Redshift Serverless should run the scheduled
/// action.
class Schedule {
  /// The timestamp of when Amazon Redshift Serverless should run the scheduled
  /// action. Timestamp is in UTC. Format of at expression is
  /// <code>yyyy-mm-ddThh:mm:ss</code>. For example,
  /// <code>2016-03-04T17:27:00</code>.
  final DateTime? at;

  /// The cron expression to use to schedule a recurring scheduled action.
  /// Schedule invocations must be separated by at least one hour. Times are in
  /// UTC.
  ///
  /// Format of cron expressions is <code>(Minutes Hours Day-of-month Month
  /// Day-of-week Year)</code>. For example, <code>"(0 10 ? * MON *)"</code>. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions">Cron
  /// Expressions</a> in the <i>Amazon CloudWatch Events User Guide</i>.
  final String? cron;

  Schedule({
    this.at,
    this.cron,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      at: timeStampFromJson(json['at']),
      cron: json['cron'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final at = this.at;
    final cron = this.cron;
    return {
      if (at != null) 'at': unixTimestampToJson(at),
      if (cron != null) 'cron': cron,
    };
  }
}

/// Contains names of objects associated with a scheduled action.
class ScheduledActionAssociation {
  /// Name of associated Amazon Redshift Serverless namespace.
  final String? namespaceName;

  /// Name of associated scheduled action.
  final String? scheduledActionName;

  ScheduledActionAssociation({
    this.namespaceName,
    this.scheduledActionName,
  });

  factory ScheduledActionAssociation.fromJson(Map<String, dynamic> json) {
    return ScheduledActionAssociation(
      namespaceName: json['namespaceName'] as String?,
      scheduledActionName: json['scheduledActionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final namespaceName = this.namespaceName;
    final scheduledActionName = this.scheduledActionName;
    return {
      if (namespaceName != null) 'namespaceName': namespaceName,
      if (scheduledActionName != null)
        'scheduledActionName': scheduledActionName,
    };
  }
}

/// The returned scheduled action object.
class ScheduledActionResponse {
  /// The end time of
  final DateTime? endTime;

  /// The end time in UTC when the schedule is no longer active. After this time,
  /// the scheduled action does not trigger.
  final String? namespaceName;

  /// An array of timestamps of when the next scheduled actions will trigger.
  final List<DateTime>? nextInvocations;

  /// The ARN of the IAM role to assume to run the scheduled action. This IAM role
  /// must have permission to run the Amazon Redshift Serverless API operation in
  /// the scheduled action. This IAM role must allow the Amazon Redshift scheduler
  /// to schedule creating snapshots. (Principal scheduler.redshift.amazonaws.com)
  /// to assume permissions on your behalf. For more information about the IAM
  /// role to use with the Amazon Redshift scheduler, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-identity-based.html">Using
  /// Identity-Based Policies for Amazon Redshift</a> in the Amazon Redshift
  /// Cluster Management Guide
  final String? roleArn;

  /// The schedule for a one-time (at timestamp format) or recurring (cron format)
  /// scheduled action. Schedule invocations must be separated by at least one
  /// hour. Times are in UTC.
  ///
  /// <ul>
  /// <li>
  /// Format of at timestamp is <code>yyyy-mm-ddThh:mm:ss</code>. For example,
  /// <code>2016-03-04T17:27:00</code>.
  /// </li>
  /// <li>
  /// Format of cron expression is <code>(Minutes Hours Day-of-month Month
  /// Day-of-week Year)</code>. For example, <code>"(0 10 ? * MON *)"</code>. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions">Cron
  /// Expressions</a> in the <i>Amazon CloudWatch Events User Guide</i>.
  /// </li>
  /// </ul>
  final Schedule? schedule;

  /// The description of the scheduled action.
  final String? scheduledActionDescription;

  /// The name of the scheduled action.
  final String? scheduledActionName;

  /// The uuid of the scheduled action.
  final String? scheduledActionUuid;

  /// The start time in UTC when the schedule is active. Before this time, the
  /// scheduled action does not trigger.
  final DateTime? startTime;

  /// The state of the scheduled action.
  final State? state;
  final TargetAction? targetAction;

  ScheduledActionResponse({
    this.endTime,
    this.namespaceName,
    this.nextInvocations,
    this.roleArn,
    this.schedule,
    this.scheduledActionDescription,
    this.scheduledActionName,
    this.scheduledActionUuid,
    this.startTime,
    this.state,
    this.targetAction,
  });

  factory ScheduledActionResponse.fromJson(Map<String, dynamic> json) {
    return ScheduledActionResponse(
      endTime: timeStampFromJson(json['endTime']),
      namespaceName: json['namespaceName'] as String?,
      nextInvocations: (json['nextInvocations'] as List?)
          ?.whereNotNull()
          .map(nonNullableTimeStampFromJson)
          .toList(),
      roleArn: json['roleArn'] as String?,
      schedule: json['schedule'] != null
          ? Schedule.fromJson(json['schedule'] as Map<String, dynamic>)
          : null,
      scheduledActionDescription: json['scheduledActionDescription'] as String?,
      scheduledActionName: json['scheduledActionName'] as String?,
      scheduledActionUuid: json['scheduledActionUuid'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      state: (json['state'] as String?)?.toState(),
      targetAction: json['targetAction'] != null
          ? TargetAction.fromJson(json['targetAction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final namespaceName = this.namespaceName;
    final nextInvocations = this.nextInvocations;
    final roleArn = this.roleArn;
    final schedule = this.schedule;
    final scheduledActionDescription = this.scheduledActionDescription;
    final scheduledActionName = this.scheduledActionName;
    final scheduledActionUuid = this.scheduledActionUuid;
    final startTime = this.startTime;
    final state = this.state;
    final targetAction = this.targetAction;
    return {
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (namespaceName != null) 'namespaceName': namespaceName,
      if (nextInvocations != null)
        'nextInvocations': nextInvocations.map(unixTimestampToJson).toList(),
      if (roleArn != null) 'roleArn': roleArn,
      if (schedule != null) 'schedule': schedule,
      if (scheduledActionDescription != null)
        'scheduledActionDescription': scheduledActionDescription,
      if (scheduledActionName != null)
        'scheduledActionName': scheduledActionName,
      if (scheduledActionUuid != null)
        'scheduledActionUuid': scheduledActionUuid,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (state != null) 'state': state.toValue(),
      if (targetAction != null) 'targetAction': targetAction,
    };
  }
}

/// A snapshot object that contains databases.
class Snapshot {
  /// All of the Amazon Web Services accounts that have access to restore a
  /// snapshot to a provisioned cluster.
  final List<String>? accountsWithProvisionedRestoreAccess;

  /// All of the Amazon Web Services accounts that have access to restore a
  /// snapshot to a namespace.
  final List<String>? accountsWithRestoreAccess;

  /// The size of the incremental backup in megabytes.
  final double? actualIncrementalBackupSizeInMegaBytes;

  /// The Amazon Resource Name (ARN) for the namespace's admin user credentials
  /// secret.
  final String? adminPasswordSecretArn;

  /// The ID of the Key Management Service (KMS) key used to encrypt and store the
  /// namespace's admin credentials secret.
  final String? adminPasswordSecretKmsKeyId;

  /// The username of the database within a snapshot.
  final String? adminUsername;

  /// The size in megabytes of the data that has been backed up to a snapshot.
  final double? backupProgressInMegaBytes;

  /// The rate at which data is backed up into a snapshot in megabytes per second.
  final double? currentBackupRateInMegaBytesPerSecond;

  /// The amount of time it took to back up data into a snapshot.
  final int? elapsedTimeInSeconds;

  /// The estimated amount of seconds until the snapshot completes backup.
  final int? estimatedSecondsToCompletion;

  /// The unique identifier of the KMS key used to encrypt the snapshot.
  final String? kmsKeyId;

  /// The Amazon Resource Name (ARN) of the namespace the snapshot was created
  /// from.
  final String? namespaceArn;

  /// The name of the namepsace.
  final String? namespaceName;

  /// The owner Amazon Web Services; account of the snapshot.
  final String? ownerAccount;

  /// The Amazon Resource Name (ARN) of the snapshot.
  final String? snapshotArn;

  /// The timestamp of when the snapshot was created.
  final DateTime? snapshotCreateTime;

  /// The name of the snapshot.
  final String? snapshotName;

  /// The amount of days until the snapshot is deleted.
  final int? snapshotRemainingDays;

  /// The period of time, in days, of how long the snapshot is retained.
  final int? snapshotRetentionPeriod;

  /// The timestamp of when data within the snapshot started getting retained.
  final DateTime? snapshotRetentionStartTime;

  /// The status of the snapshot.
  final SnapshotStatus? status;

  /// The total size, in megabytes, of how big the snapshot is.
  final double? totalBackupSizeInMegaBytes;

  Snapshot({
    this.accountsWithProvisionedRestoreAccess,
    this.accountsWithRestoreAccess,
    this.actualIncrementalBackupSizeInMegaBytes,
    this.adminPasswordSecretArn,
    this.adminPasswordSecretKmsKeyId,
    this.adminUsername,
    this.backupProgressInMegaBytes,
    this.currentBackupRateInMegaBytesPerSecond,
    this.elapsedTimeInSeconds,
    this.estimatedSecondsToCompletion,
    this.kmsKeyId,
    this.namespaceArn,
    this.namespaceName,
    this.ownerAccount,
    this.snapshotArn,
    this.snapshotCreateTime,
    this.snapshotName,
    this.snapshotRemainingDays,
    this.snapshotRetentionPeriod,
    this.snapshotRetentionStartTime,
    this.status,
    this.totalBackupSizeInMegaBytes,
  });

  factory Snapshot.fromJson(Map<String, dynamic> json) {
    return Snapshot(
      accountsWithProvisionedRestoreAccess:
          (json['accountsWithProvisionedRestoreAccess'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      accountsWithRestoreAccess: (json['accountsWithRestoreAccess'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      actualIncrementalBackupSizeInMegaBytes:
          json['actualIncrementalBackupSizeInMegaBytes'] as double?,
      adminPasswordSecretArn: json['adminPasswordSecretArn'] as String?,
      adminPasswordSecretKmsKeyId:
          json['adminPasswordSecretKmsKeyId'] as String?,
      adminUsername: json['adminUsername'] as String?,
      backupProgressInMegaBytes: json['backupProgressInMegaBytes'] as double?,
      currentBackupRateInMegaBytesPerSecond:
          json['currentBackupRateInMegaBytesPerSecond'] as double?,
      elapsedTimeInSeconds: json['elapsedTimeInSeconds'] as int?,
      estimatedSecondsToCompletion:
          json['estimatedSecondsToCompletion'] as int?,
      kmsKeyId: json['kmsKeyId'] as String?,
      namespaceArn: json['namespaceArn'] as String?,
      namespaceName: json['namespaceName'] as String?,
      ownerAccount: json['ownerAccount'] as String?,
      snapshotArn: json['snapshotArn'] as String?,
      snapshotCreateTime: timeStampFromJson(json['snapshotCreateTime']),
      snapshotName: json['snapshotName'] as String?,
      snapshotRemainingDays: json['snapshotRemainingDays'] as int?,
      snapshotRetentionPeriod: json['snapshotRetentionPeriod'] as int?,
      snapshotRetentionStartTime:
          timeStampFromJson(json['snapshotRetentionStartTime']),
      status: (json['status'] as String?)?.toSnapshotStatus(),
      totalBackupSizeInMegaBytes: json['totalBackupSizeInMegaBytes'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountsWithProvisionedRestoreAccess =
        this.accountsWithProvisionedRestoreAccess;
    final accountsWithRestoreAccess = this.accountsWithRestoreAccess;
    final actualIncrementalBackupSizeInMegaBytes =
        this.actualIncrementalBackupSizeInMegaBytes;
    final adminPasswordSecretArn = this.adminPasswordSecretArn;
    final adminPasswordSecretKmsKeyId = this.adminPasswordSecretKmsKeyId;
    final adminUsername = this.adminUsername;
    final backupProgressInMegaBytes = this.backupProgressInMegaBytes;
    final currentBackupRateInMegaBytesPerSecond =
        this.currentBackupRateInMegaBytesPerSecond;
    final elapsedTimeInSeconds = this.elapsedTimeInSeconds;
    final estimatedSecondsToCompletion = this.estimatedSecondsToCompletion;
    final kmsKeyId = this.kmsKeyId;
    final namespaceArn = this.namespaceArn;
    final namespaceName = this.namespaceName;
    final ownerAccount = this.ownerAccount;
    final snapshotArn = this.snapshotArn;
    final snapshotCreateTime = this.snapshotCreateTime;
    final snapshotName = this.snapshotName;
    final snapshotRemainingDays = this.snapshotRemainingDays;
    final snapshotRetentionPeriod = this.snapshotRetentionPeriod;
    final snapshotRetentionStartTime = this.snapshotRetentionStartTime;
    final status = this.status;
    final totalBackupSizeInMegaBytes = this.totalBackupSizeInMegaBytes;
    return {
      if (accountsWithProvisionedRestoreAccess != null)
        'accountsWithProvisionedRestoreAccess':
            accountsWithProvisionedRestoreAccess,
      if (accountsWithRestoreAccess != null)
        'accountsWithRestoreAccess': accountsWithRestoreAccess,
      if (actualIncrementalBackupSizeInMegaBytes != null)
        'actualIncrementalBackupSizeInMegaBytes':
            actualIncrementalBackupSizeInMegaBytes,
      if (adminPasswordSecretArn != null)
        'adminPasswordSecretArn': adminPasswordSecretArn,
      if (adminPasswordSecretKmsKeyId != null)
        'adminPasswordSecretKmsKeyId': adminPasswordSecretKmsKeyId,
      if (adminUsername != null) 'adminUsername': adminUsername,
      if (backupProgressInMegaBytes != null)
        'backupProgressInMegaBytes': backupProgressInMegaBytes,
      if (currentBackupRateInMegaBytesPerSecond != null)
        'currentBackupRateInMegaBytesPerSecond':
            currentBackupRateInMegaBytesPerSecond,
      if (elapsedTimeInSeconds != null)
        'elapsedTimeInSeconds': elapsedTimeInSeconds,
      if (estimatedSecondsToCompletion != null)
        'estimatedSecondsToCompletion': estimatedSecondsToCompletion,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (namespaceArn != null) 'namespaceArn': namespaceArn,
      if (namespaceName != null) 'namespaceName': namespaceName,
      if (ownerAccount != null) 'ownerAccount': ownerAccount,
      if (snapshotArn != null) 'snapshotArn': snapshotArn,
      if (snapshotCreateTime != null)
        'snapshotCreateTime': iso8601ToJson(snapshotCreateTime),
      if (snapshotName != null) 'snapshotName': snapshotName,
      if (snapshotRemainingDays != null)
        'snapshotRemainingDays': snapshotRemainingDays,
      if (snapshotRetentionPeriod != null)
        'snapshotRetentionPeriod': snapshotRetentionPeriod,
      if (snapshotRetentionStartTime != null)
        'snapshotRetentionStartTime': iso8601ToJson(snapshotRetentionStartTime),
      if (status != null) 'status': status.toValue(),
      if (totalBackupSizeInMegaBytes != null)
        'totalBackupSizeInMegaBytes': totalBackupSizeInMegaBytes,
    };
  }
}

/// The object that you configure to copy snapshots from one namespace to a
/// namespace in another Amazon Web Services Region.
class SnapshotCopyConfiguration {
  /// The ID of the KMS key to use to encrypt your snapshots in the destination
  /// Amazon Web Services Region.
  final String? destinationKmsKeyId;

  /// The destination Amazon Web Services Region to copy snapshots to.
  final String? destinationRegion;

  /// The name of the namespace to copy snapshots from in the source Amazon Web
  /// Services Region.
  final String? namespaceName;

  /// The ARN of the snapshot copy configuration object.
  final String? snapshotCopyConfigurationArn;

  /// The ID of the snapshot copy configuration object.
  final String? snapshotCopyConfigurationId;

  /// The retention period of snapshots that are copied to the destination Amazon
  /// Web Services Region.
  final int? snapshotRetentionPeriod;

  SnapshotCopyConfiguration({
    this.destinationKmsKeyId,
    this.destinationRegion,
    this.namespaceName,
    this.snapshotCopyConfigurationArn,
    this.snapshotCopyConfigurationId,
    this.snapshotRetentionPeriod,
  });

  factory SnapshotCopyConfiguration.fromJson(Map<String, dynamic> json) {
    return SnapshotCopyConfiguration(
      destinationKmsKeyId: json['destinationKmsKeyId'] as String?,
      destinationRegion: json['destinationRegion'] as String?,
      namespaceName: json['namespaceName'] as String?,
      snapshotCopyConfigurationArn:
          json['snapshotCopyConfigurationArn'] as String?,
      snapshotCopyConfigurationId:
          json['snapshotCopyConfigurationId'] as String?,
      snapshotRetentionPeriod: json['snapshotRetentionPeriod'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationKmsKeyId = this.destinationKmsKeyId;
    final destinationRegion = this.destinationRegion;
    final namespaceName = this.namespaceName;
    final snapshotCopyConfigurationArn = this.snapshotCopyConfigurationArn;
    final snapshotCopyConfigurationId = this.snapshotCopyConfigurationId;
    final snapshotRetentionPeriod = this.snapshotRetentionPeriod;
    return {
      if (destinationKmsKeyId != null)
        'destinationKmsKeyId': destinationKmsKeyId,
      if (destinationRegion != null) 'destinationRegion': destinationRegion,
      if (namespaceName != null) 'namespaceName': namespaceName,
      if (snapshotCopyConfigurationArn != null)
        'snapshotCopyConfigurationArn': snapshotCopyConfigurationArn,
      if (snapshotCopyConfigurationId != null)
        'snapshotCopyConfigurationId': snapshotCopyConfigurationId,
      if (snapshotRetentionPeriod != null)
        'snapshotRetentionPeriod': snapshotRetentionPeriod,
    };
  }
}

enum SnapshotStatus {
  available,
  creating,
  deleted,
  cancelled,
  failed,
  copying,
}

extension SnapshotStatusValueExtension on SnapshotStatus {
  String toValue() {
    switch (this) {
      case SnapshotStatus.available:
        return 'AVAILABLE';
      case SnapshotStatus.creating:
        return 'CREATING';
      case SnapshotStatus.deleted:
        return 'DELETED';
      case SnapshotStatus.cancelled:
        return 'CANCELLED';
      case SnapshotStatus.failed:
        return 'FAILED';
      case SnapshotStatus.copying:
        return 'COPYING';
    }
  }
}

extension SnapshotStatusFromString on String {
  SnapshotStatus toSnapshotStatus() {
    switch (this) {
      case 'AVAILABLE':
        return SnapshotStatus.available;
      case 'CREATING':
        return SnapshotStatus.creating;
      case 'DELETED':
        return SnapshotStatus.deleted;
      case 'CANCELLED':
        return SnapshotStatus.cancelled;
      case 'FAILED':
        return SnapshotStatus.failed;
      case 'COPYING':
        return SnapshotStatus.copying;
    }
    throw Exception('$this is not known in enum SnapshotStatus');
  }
}

enum State {
  active,
  disabled,
}

extension StateValueExtension on State {
  String toValue() {
    switch (this) {
      case State.active:
        return 'ACTIVE';
      case State.disabled:
        return 'DISABLED';
    }
  }
}

extension StateFromString on String {
  State toState() {
    switch (this) {
      case 'ACTIVE':
        return State.active;
      case 'DISABLED':
        return State.disabled;
    }
    throw Exception('$this is not known in enum State');
  }
}

/// Contains information about a table restore request.
class TableRestoreStatus {
  /// A message that explains the returned status. For example, if the status of
  /// the operation is <code>FAILED</code>, the message explains why the operation
  /// failed.
  final String? message;

  /// The namespace of the table being restored from.
  final String? namespaceName;

  /// The name of the table to create from the restore operation.
  final String? newTableName;

  /// The amount of data restored to the new table so far, in megabytes (MB).
  final int? progressInMegaBytes;

  /// The ID of the recovery point being restored from.
  final String? recoveryPointId;

  /// The time that the table restore request was made, in Universal Coordinated
  /// Time (UTC).
  final DateTime? requestTime;

  /// The name of the snapshot being restored from.
  final String? snapshotName;

  /// The name of the source database being restored from.
  final String? sourceDatabaseName;

  /// The name of the source schema being restored from.
  final String? sourceSchemaName;

  /// The name of the source table being restored from.
  final String? sourceTableName;

  /// A value that describes the current state of the table restore request.
  /// Possible values are <code>SUCCEEDED</code>, <code>FAILED</code>,
  /// <code>CANCELED</code>, <code>PENDING</code>, and <code>IN_PROGRESS</code>.
  final String? status;

  /// The ID of the RestoreTableFromSnapshot request.
  final String? tableRestoreRequestId;

  /// The name of the database to restore to.
  final String? targetDatabaseName;

  /// The name of the schema to restore to.
  final String? targetSchemaName;

  /// The total amount of data to restore to the new table, in megabytes (MB).
  final int? totalDataInMegaBytes;

  /// The name of the workgroup being restored from.
  final String? workgroupName;

  TableRestoreStatus({
    this.message,
    this.namespaceName,
    this.newTableName,
    this.progressInMegaBytes,
    this.recoveryPointId,
    this.requestTime,
    this.snapshotName,
    this.sourceDatabaseName,
    this.sourceSchemaName,
    this.sourceTableName,
    this.status,
    this.tableRestoreRequestId,
    this.targetDatabaseName,
    this.targetSchemaName,
    this.totalDataInMegaBytes,
    this.workgroupName,
  });

  factory TableRestoreStatus.fromJson(Map<String, dynamic> json) {
    return TableRestoreStatus(
      message: json['message'] as String?,
      namespaceName: json['namespaceName'] as String?,
      newTableName: json['newTableName'] as String?,
      progressInMegaBytes: json['progressInMegaBytes'] as int?,
      recoveryPointId: json['recoveryPointId'] as String?,
      requestTime: timeStampFromJson(json['requestTime']),
      snapshotName: json['snapshotName'] as String?,
      sourceDatabaseName: json['sourceDatabaseName'] as String?,
      sourceSchemaName: json['sourceSchemaName'] as String?,
      sourceTableName: json['sourceTableName'] as String?,
      status: json['status'] as String?,
      tableRestoreRequestId: json['tableRestoreRequestId'] as String?,
      targetDatabaseName: json['targetDatabaseName'] as String?,
      targetSchemaName: json['targetSchemaName'] as String?,
      totalDataInMegaBytes: json['totalDataInMegaBytes'] as int?,
      workgroupName: json['workgroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final namespaceName = this.namespaceName;
    final newTableName = this.newTableName;
    final progressInMegaBytes = this.progressInMegaBytes;
    final recoveryPointId = this.recoveryPointId;
    final requestTime = this.requestTime;
    final snapshotName = this.snapshotName;
    final sourceDatabaseName = this.sourceDatabaseName;
    final sourceSchemaName = this.sourceSchemaName;
    final sourceTableName = this.sourceTableName;
    final status = this.status;
    final tableRestoreRequestId = this.tableRestoreRequestId;
    final targetDatabaseName = this.targetDatabaseName;
    final targetSchemaName = this.targetSchemaName;
    final totalDataInMegaBytes = this.totalDataInMegaBytes;
    final workgroupName = this.workgroupName;
    return {
      if (message != null) 'message': message,
      if (namespaceName != null) 'namespaceName': namespaceName,
      if (newTableName != null) 'newTableName': newTableName,
      if (progressInMegaBytes != null)
        'progressInMegaBytes': progressInMegaBytes,
      if (recoveryPointId != null) 'recoveryPointId': recoveryPointId,
      if (requestTime != null) 'requestTime': unixTimestampToJson(requestTime),
      if (snapshotName != null) 'snapshotName': snapshotName,
      if (sourceDatabaseName != null) 'sourceDatabaseName': sourceDatabaseName,
      if (sourceSchemaName != null) 'sourceSchemaName': sourceSchemaName,
      if (sourceTableName != null) 'sourceTableName': sourceTableName,
      if (status != null) 'status': status,
      if (tableRestoreRequestId != null)
        'tableRestoreRequestId': tableRestoreRequestId,
      if (targetDatabaseName != null) 'targetDatabaseName': targetDatabaseName,
      if (targetSchemaName != null) 'targetSchemaName': targetSchemaName,
      if (totalDataInMegaBytes != null)
        'totalDataInMegaBytes': totalDataInMegaBytes,
      if (workgroupName != null) 'workgroupName': workgroupName,
    };
  }
}

/// A map of key-value pairs.
class Tag {
  /// The key to use in the tag.
  final String key;

  /// The value of the tag.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A JSON format string of the Amazon Redshift Serverless API operation with
/// input parameters. The following is an example of a target action.
///
/// <code>"{"CreateSnapshot": {"NamespaceName":
/// "sampleNamespace","SnapshotName": "sampleSnapshot", "retentionPeriod":
/// "1"}}"</code>
class TargetAction {
  final CreateSnapshotScheduleActionParameters? createSnapshot;

  TargetAction({
    this.createSnapshot,
  });

  factory TargetAction.fromJson(Map<String, dynamic> json) {
    return TargetAction(
      createSnapshot: json['createSnapshot'] != null
          ? CreateSnapshotScheduleActionParameters.fromJson(
              json['createSnapshot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createSnapshot = this.createSnapshot;
    return {
      if (createSnapshot != null) 'createSnapshot': createSnapshot,
    };
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateCustomDomainAssociationResponse {
  /// The custom domain name’s certificate Amazon resource name (ARN).
  final String? customDomainCertificateArn;

  /// The expiration time for the certificate.
  final DateTime? customDomainCertificateExpiryTime;

  /// The custom domain name associated with the workgroup.
  final String? customDomainName;

  /// The name of the workgroup associated with the database.
  final String? workgroupName;

  UpdateCustomDomainAssociationResponse({
    this.customDomainCertificateArn,
    this.customDomainCertificateExpiryTime,
    this.customDomainName,
    this.workgroupName,
  });

  factory UpdateCustomDomainAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateCustomDomainAssociationResponse(
      customDomainCertificateArn: json['customDomainCertificateArn'] as String?,
      customDomainCertificateExpiryTime:
          timeStampFromJson(json['customDomainCertificateExpiryTime']),
      customDomainName: json['customDomainName'] as String?,
      workgroupName: json['workgroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customDomainCertificateArn = this.customDomainCertificateArn;
    final customDomainCertificateExpiryTime =
        this.customDomainCertificateExpiryTime;
    final customDomainName = this.customDomainName;
    final workgroupName = this.workgroupName;
    return {
      if (customDomainCertificateArn != null)
        'customDomainCertificateArn': customDomainCertificateArn,
      if (customDomainCertificateExpiryTime != null)
        'customDomainCertificateExpiryTime':
            iso8601ToJson(customDomainCertificateExpiryTime),
      if (customDomainName != null) 'customDomainName': customDomainName,
      if (workgroupName != null) 'workgroupName': workgroupName,
    };
  }
}

class UpdateEndpointAccessResponse {
  /// The updated VPC endpoint.
  final EndpointAccess? endpoint;

  UpdateEndpointAccessResponse({
    this.endpoint,
  });

  factory UpdateEndpointAccessResponse.fromJson(Map<String, dynamic> json) {
    return UpdateEndpointAccessResponse(
      endpoint: json['endpoint'] != null
          ? EndpointAccess.fromJson(json['endpoint'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    return {
      if (endpoint != null) 'endpoint': endpoint,
    };
  }
}

class UpdateNamespaceResponse {
  /// A list of tag instances.
  final Namespace namespace;

  UpdateNamespaceResponse({
    required this.namespace,
  });

  factory UpdateNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateNamespaceResponse(
      namespace: Namespace.fromJson(json['namespace'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    return {
      'namespace': namespace,
    };
  }
}

class UpdateScheduledActionResponse {
  /// The ScheduledAction object that was updated.
  final ScheduledActionResponse? scheduledAction;

  UpdateScheduledActionResponse({
    this.scheduledAction,
  });

  factory UpdateScheduledActionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateScheduledActionResponse(
      scheduledAction: json['scheduledAction'] != null
          ? ScheduledActionResponse.fromJson(
              json['scheduledAction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final scheduledAction = this.scheduledAction;
    return {
      if (scheduledAction != null) 'scheduledAction': scheduledAction,
    };
  }
}

class UpdateSnapshotCopyConfigurationResponse {
  /// The updated snapshot copy configuration object.
  final SnapshotCopyConfiguration snapshotCopyConfiguration;

  UpdateSnapshotCopyConfigurationResponse({
    required this.snapshotCopyConfiguration,
  });

  factory UpdateSnapshotCopyConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateSnapshotCopyConfigurationResponse(
      snapshotCopyConfiguration: SnapshotCopyConfiguration.fromJson(
          json['snapshotCopyConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final snapshotCopyConfiguration = this.snapshotCopyConfiguration;
    return {
      'snapshotCopyConfiguration': snapshotCopyConfiguration,
    };
  }
}

class UpdateSnapshotResponse {
  /// The updated snapshot object.
  final Snapshot? snapshot;

  UpdateSnapshotResponse({
    this.snapshot,
  });

  factory UpdateSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSnapshotResponse(
      snapshot: json['snapshot'] != null
          ? Snapshot.fromJson(json['snapshot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'snapshot': snapshot,
    };
  }
}

class UpdateUsageLimitResponse {
  /// The updated usage limit object.
  final UsageLimit? usageLimit;

  UpdateUsageLimitResponse({
    this.usageLimit,
  });

  factory UpdateUsageLimitResponse.fromJson(Map<String, dynamic> json) {
    return UpdateUsageLimitResponse(
      usageLimit: json['usageLimit'] != null
          ? UsageLimit.fromJson(json['usageLimit'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final usageLimit = this.usageLimit;
    return {
      if (usageLimit != null) 'usageLimit': usageLimit,
    };
  }
}

class UpdateWorkgroupResponse {
  /// The updated workgroup object.
  final Workgroup workgroup;

  UpdateWorkgroupResponse({
    required this.workgroup,
  });

  factory UpdateWorkgroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWorkgroupResponse(
      workgroup: Workgroup.fromJson(json['workgroup'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final workgroup = this.workgroup;
    return {
      'workgroup': workgroup,
    };
  }
}

/// The usage limit object.
class UsageLimit {
  /// The limit amount. If time-based, this amount is in RPUs consumed per hour.
  /// If data-based, this amount is in terabytes (TB). The value must be a
  /// positive number.
  final int? amount;

  /// The action that Amazon Redshift Serverless takes when the limit is reached.
  final UsageLimitBreachAction? breachAction;

  /// The time period that the amount applies to. A weekly period begins on
  /// Sunday. The default is monthly.
  final UsageLimitPeriod? period;

  /// The Amazon Resource Name (ARN) that identifies the Amazon Redshift
  /// Serverless resource.
  final String? resourceArn;

  /// The Amazon Resource Name (ARN) of the resource associated with the usage
  /// limit.
  final String? usageLimitArn;

  /// The identifier of the usage limit.
  final String? usageLimitId;

  /// The Amazon Redshift Serverless feature to limit.
  final UsageLimitUsageType? usageType;

  UsageLimit({
    this.amount,
    this.breachAction,
    this.period,
    this.resourceArn,
    this.usageLimitArn,
    this.usageLimitId,
    this.usageType,
  });

  factory UsageLimit.fromJson(Map<String, dynamic> json) {
    return UsageLimit(
      amount: json['amount'] as int?,
      breachAction:
          (json['breachAction'] as String?)?.toUsageLimitBreachAction(),
      period: (json['period'] as String?)?.toUsageLimitPeriod(),
      resourceArn: json['resourceArn'] as String?,
      usageLimitArn: json['usageLimitArn'] as String?,
      usageLimitId: json['usageLimitId'] as String?,
      usageType: (json['usageType'] as String?)?.toUsageLimitUsageType(),
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final breachAction = this.breachAction;
    final period = this.period;
    final resourceArn = this.resourceArn;
    final usageLimitArn = this.usageLimitArn;
    final usageLimitId = this.usageLimitId;
    final usageType = this.usageType;
    return {
      if (amount != null) 'amount': amount,
      if (breachAction != null) 'breachAction': breachAction.toValue(),
      if (period != null) 'period': period.toValue(),
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (usageLimitArn != null) 'usageLimitArn': usageLimitArn,
      if (usageLimitId != null) 'usageLimitId': usageLimitId,
      if (usageType != null) 'usageType': usageType.toValue(),
    };
  }
}

enum UsageLimitBreachAction {
  log,
  emitMetric,
  deactivate,
}

extension UsageLimitBreachActionValueExtension on UsageLimitBreachAction {
  String toValue() {
    switch (this) {
      case UsageLimitBreachAction.log:
        return 'log';
      case UsageLimitBreachAction.emitMetric:
        return 'emit-metric';
      case UsageLimitBreachAction.deactivate:
        return 'deactivate';
    }
  }
}

extension UsageLimitBreachActionFromString on String {
  UsageLimitBreachAction toUsageLimitBreachAction() {
    switch (this) {
      case 'log':
        return UsageLimitBreachAction.log;
      case 'emit-metric':
        return UsageLimitBreachAction.emitMetric;
      case 'deactivate':
        return UsageLimitBreachAction.deactivate;
    }
    throw Exception('$this is not known in enum UsageLimitBreachAction');
  }
}

enum UsageLimitPeriod {
  daily,
  weekly,
  monthly,
}

extension UsageLimitPeriodValueExtension on UsageLimitPeriod {
  String toValue() {
    switch (this) {
      case UsageLimitPeriod.daily:
        return 'daily';
      case UsageLimitPeriod.weekly:
        return 'weekly';
      case UsageLimitPeriod.monthly:
        return 'monthly';
    }
  }
}

extension UsageLimitPeriodFromString on String {
  UsageLimitPeriod toUsageLimitPeriod() {
    switch (this) {
      case 'daily':
        return UsageLimitPeriod.daily;
      case 'weekly':
        return UsageLimitPeriod.weekly;
      case 'monthly':
        return UsageLimitPeriod.monthly;
    }
    throw Exception('$this is not known in enum UsageLimitPeriod');
  }
}

enum UsageLimitUsageType {
  serverlessCompute,
  crossRegionDatasharing,
}

extension UsageLimitUsageTypeValueExtension on UsageLimitUsageType {
  String toValue() {
    switch (this) {
      case UsageLimitUsageType.serverlessCompute:
        return 'serverless-compute';
      case UsageLimitUsageType.crossRegionDatasharing:
        return 'cross-region-datasharing';
    }
  }
}

extension UsageLimitUsageTypeFromString on String {
  UsageLimitUsageType toUsageLimitUsageType() {
    switch (this) {
      case 'serverless-compute':
        return UsageLimitUsageType.serverlessCompute;
      case 'cross-region-datasharing':
        return UsageLimitUsageType.crossRegionDatasharing;
    }
    throw Exception('$this is not known in enum UsageLimitUsageType');
  }
}

/// The connection endpoint for connecting to Amazon Redshift Serverless through
/// the proxy.
class VpcEndpoint {
  /// One or more network interfaces of the endpoint. Also known as an interface
  /// endpoint.
  final List<NetworkInterface>? networkInterfaces;

  /// The connection endpoint ID for connecting to Amazon Redshift Serverless.
  final String? vpcEndpointId;

  /// The VPC identifier that the endpoint is associated with.
  final String? vpcId;

  VpcEndpoint({
    this.networkInterfaces,
    this.vpcEndpointId,
    this.vpcId,
  });

  factory VpcEndpoint.fromJson(Map<String, dynamic> json) {
    return VpcEndpoint(
      networkInterfaces: (json['networkInterfaces'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkInterface.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcEndpointId: json['vpcEndpointId'] as String?,
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkInterfaces = this.networkInterfaces;
    final vpcEndpointId = this.vpcEndpointId;
    final vpcId = this.vpcId;
    return {
      if (networkInterfaces != null) 'networkInterfaces': networkInterfaces,
      if (vpcEndpointId != null) 'vpcEndpointId': vpcEndpointId,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

/// Describes the members of a VPC security group.
class VpcSecurityGroupMembership {
  /// The status of the VPC security group.
  final String? status;

  /// The unique identifier of the VPC security group.
  final String? vpcSecurityGroupId;

  VpcSecurityGroupMembership({
    this.status,
    this.vpcSecurityGroupId,
  });

  factory VpcSecurityGroupMembership.fromJson(Map<String, dynamic> json) {
    return VpcSecurityGroupMembership(
      status: json['status'] as String?,
      vpcSecurityGroupId: json['vpcSecurityGroupId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final vpcSecurityGroupId = this.vpcSecurityGroupId;
    return {
      if (status != null) 'status': status,
      if (vpcSecurityGroupId != null) 'vpcSecurityGroupId': vpcSecurityGroupId,
    };
  }
}

/// The collection of computing resources from which an endpoint is created.
class Workgroup {
  /// The base data warehouse capacity of the workgroup in Redshift Processing
  /// Units (RPUs).
  final int? baseCapacity;

  /// An array of parameters to set for advanced control over a database. The
  /// options are <code>auto_mv</code>, <code>datestyle</code>,
  /// <code>enable_case_sensitive_identifier</code>,
  /// <code>enable_user_activity_logging</code>, <code>query_group</code>,
  /// <code>search_path</code>, <code>require_ssl</code>,
  /// <code>use_fips_ssl</code>, and query monitoring metrics that let you define
  /// performance boundaries. For more information about query monitoring rules
  /// and available metrics, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/dg/cm-c-wlm-query-monitoring-rules.html#cm-c-wlm-query-monitoring-metrics-serverless">
  /// Query monitoring metrics for Amazon Redshift Serverless</a>.
  final List<ConfigParameter>? configParameters;

  /// The creation date of the workgroup.
  final DateTime? creationDate;

  /// A list of VPCs. Each entry is the unique identifier of a virtual private
  /// cloud with access to Amazon Redshift Serverless. If all of the VPCs for the
  /// grantee are allowed, it shows an asterisk.
  final List<String>? crossAccountVpcs;

  /// The custom domain name’s certificate Amazon resource name (ARN).
  final String? customDomainCertificateArn;

  /// The expiration time for the certificate.
  final DateTime? customDomainCertificateExpiryTime;

  /// The custom domain name associated with the workgroup.
  final String? customDomainName;

  /// The endpoint that is created from the workgroup.
  final Endpoint? endpoint;

  /// The value that specifies whether to enable enhanced virtual private cloud
  /// (VPC) routing, which forces Amazon Redshift Serverless to route traffic
  /// through your VPC.
  final bool? enhancedVpcRouting;

  /// The maximum data-warehouse capacity Amazon Redshift Serverless uses to serve
  /// queries. The max capacity is specified in RPUs.
  final int? maxCapacity;

  /// The namespace the workgroup is associated with.
  final String? namespaceName;

  /// The patch version of your Amazon Redshift Serverless workgroup. For more
  /// information about patch versions, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/cluster-versions.html">Cluster
  /// versions for Amazon Redshift</a>.
  final String? patchVersion;

  /// The custom port to use when connecting to a workgroup. Valid port ranges are
  /// 5431-5455 and 8191-8215. The default is 5439.
  final int? port;

  /// A value that specifies whether the workgroup can be accessible from a public
  /// network.
  final bool? publiclyAccessible;

  /// An array of security group IDs to associate with the workgroup.
  final List<String>? securityGroupIds;

  /// The status of the workgroup.
  final WorkgroupStatus? status;

  /// An array of subnet IDs the workgroup is associated with.
  final List<String>? subnetIds;

  /// The Amazon Resource Name (ARN) that links to the workgroup.
  final String? workgroupArn;

  /// The unique identifier of the workgroup.
  final String? workgroupId;

  /// The name of the workgroup.
  final String? workgroupName;

  /// The Amazon Redshift Serverless version of your workgroup. For more
  /// information about Amazon Redshift Serverless versions, see<a
  /// href="https://docs.aws.amazon.com/redshift/latest/mgmt/cluster-versions.html">Cluster
  /// versions for Amazon Redshift</a>.
  final String? workgroupVersion;

  Workgroup({
    this.baseCapacity,
    this.configParameters,
    this.creationDate,
    this.crossAccountVpcs,
    this.customDomainCertificateArn,
    this.customDomainCertificateExpiryTime,
    this.customDomainName,
    this.endpoint,
    this.enhancedVpcRouting,
    this.maxCapacity,
    this.namespaceName,
    this.patchVersion,
    this.port,
    this.publiclyAccessible,
    this.securityGroupIds,
    this.status,
    this.subnetIds,
    this.workgroupArn,
    this.workgroupId,
    this.workgroupName,
    this.workgroupVersion,
  });

  factory Workgroup.fromJson(Map<String, dynamic> json) {
    return Workgroup(
      baseCapacity: json['baseCapacity'] as int?,
      configParameters: (json['configParameters'] as List?)
          ?.whereNotNull()
          .map((e) => ConfigParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      creationDate: timeStampFromJson(json['creationDate']),
      crossAccountVpcs: (json['crossAccountVpcs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      customDomainCertificateArn: json['customDomainCertificateArn'] as String?,
      customDomainCertificateExpiryTime:
          timeStampFromJson(json['customDomainCertificateExpiryTime']),
      customDomainName: json['customDomainName'] as String?,
      endpoint: json['endpoint'] != null
          ? Endpoint.fromJson(json['endpoint'] as Map<String, dynamic>)
          : null,
      enhancedVpcRouting: json['enhancedVpcRouting'] as bool?,
      maxCapacity: json['maxCapacity'] as int?,
      namespaceName: json['namespaceName'] as String?,
      patchVersion: json['patchVersion'] as String?,
      port: json['port'] as int?,
      publiclyAccessible: json['publiclyAccessible'] as bool?,
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)?.toWorkgroupStatus(),
      subnetIds: (json['subnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      workgroupArn: json['workgroupArn'] as String?,
      workgroupId: json['workgroupId'] as String?,
      workgroupName: json['workgroupName'] as String?,
      workgroupVersion: json['workgroupVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final baseCapacity = this.baseCapacity;
    final configParameters = this.configParameters;
    final creationDate = this.creationDate;
    final crossAccountVpcs = this.crossAccountVpcs;
    final customDomainCertificateArn = this.customDomainCertificateArn;
    final customDomainCertificateExpiryTime =
        this.customDomainCertificateExpiryTime;
    final customDomainName = this.customDomainName;
    final endpoint = this.endpoint;
    final enhancedVpcRouting = this.enhancedVpcRouting;
    final maxCapacity = this.maxCapacity;
    final namespaceName = this.namespaceName;
    final patchVersion = this.patchVersion;
    final port = this.port;
    final publiclyAccessible = this.publiclyAccessible;
    final securityGroupIds = this.securityGroupIds;
    final status = this.status;
    final subnetIds = this.subnetIds;
    final workgroupArn = this.workgroupArn;
    final workgroupId = this.workgroupId;
    final workgroupName = this.workgroupName;
    final workgroupVersion = this.workgroupVersion;
    return {
      if (baseCapacity != null) 'baseCapacity': baseCapacity,
      if (configParameters != null) 'configParameters': configParameters,
      if (creationDate != null) 'creationDate': iso8601ToJson(creationDate),
      if (crossAccountVpcs != null) 'crossAccountVpcs': crossAccountVpcs,
      if (customDomainCertificateArn != null)
        'customDomainCertificateArn': customDomainCertificateArn,
      if (customDomainCertificateExpiryTime != null)
        'customDomainCertificateExpiryTime':
            iso8601ToJson(customDomainCertificateExpiryTime),
      if (customDomainName != null) 'customDomainName': customDomainName,
      if (endpoint != null) 'endpoint': endpoint,
      if (enhancedVpcRouting != null) 'enhancedVpcRouting': enhancedVpcRouting,
      if (maxCapacity != null) 'maxCapacity': maxCapacity,
      if (namespaceName != null) 'namespaceName': namespaceName,
      if (patchVersion != null) 'patchVersion': patchVersion,
      if (port != null) 'port': port,
      if (publiclyAccessible != null) 'publiclyAccessible': publiclyAccessible,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (status != null) 'status': status.toValue(),
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (workgroupArn != null) 'workgroupArn': workgroupArn,
      if (workgroupId != null) 'workgroupId': workgroupId,
      if (workgroupName != null) 'workgroupName': workgroupName,
      if (workgroupVersion != null) 'workgroupVersion': workgroupVersion,
    };
  }
}

enum WorkgroupStatus {
  creating,
  available,
  modifying,
  deleting,
}

extension WorkgroupStatusValueExtension on WorkgroupStatus {
  String toValue() {
    switch (this) {
      case WorkgroupStatus.creating:
        return 'CREATING';
      case WorkgroupStatus.available:
        return 'AVAILABLE';
      case WorkgroupStatus.modifying:
        return 'MODIFYING';
      case WorkgroupStatus.deleting:
        return 'DELETING';
    }
  }
}

extension WorkgroupStatusFromString on String {
  WorkgroupStatus toWorkgroupStatus() {
    switch (this) {
      case 'CREATING':
        return WorkgroupStatus.creating;
      case 'AVAILABLE':
        return WorkgroupStatus.available;
      case 'MODIFYING':
        return WorkgroupStatus.modifying;
      case 'DELETING':
        return WorkgroupStatus.deleting;
    }
    throw Exception('$this is not known in enum WorkgroupStatus');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InsufficientCapacityException extends _s.GenericAwsException {
  InsufficientCapacityException({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientCapacityException',
            message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidPaginationException extends _s.GenericAwsException {
  InvalidPaginationException({String? type, String? message})
      : super(type: type, code: 'InvalidPaginationException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InsufficientCapacityException': (type, message) =>
      InsufficientCapacityException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidPaginationException': (type, message) =>
      InvalidPaginationException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};

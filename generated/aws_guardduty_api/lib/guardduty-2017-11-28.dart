// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Amazon GuardDuty is a continuous security monitoring service that analyzes
/// and processes the following foundational data sources - VPC flow logs,
/// Amazon Web Services CloudTrail management event logs, CloudTrail S3 data
/// event logs, EKS audit logs, DNS logs, Amazon EBS volume data, runtime
/// activity belonging to container workloads, such as Amazon EKS, Amazon ECS
/// (including Amazon Web Services Fargate), and Amazon EC2 instances. It uses
/// threat intelligence feeds, such as lists of malicious IPs and domains, and
/// machine learning to identify unexpected, potentially unauthorized, and
/// malicious activity within your Amazon Web Services environment. This can
/// include issues like escalations of privileges, uses of exposed credentials,
/// or communication with malicious IPs, domains, or presence of malware on your
/// Amazon EC2 instances and container workloads. For example, GuardDuty can
/// detect compromised EC2 instances and container workloads serving malware, or
/// mining bitcoin.
///
/// GuardDuty also monitors Amazon Web Services account access behavior for
/// signs of compromise, such as unauthorized infrastructure deployments like
/// EC2 instances deployed in a Region that has never been used, or unusual API
/// calls like a password policy change to reduce password strength.
///
/// GuardDuty informs you about the status of your Amazon Web Services
/// environment by producing security findings that you can view in the
/// GuardDuty console or through Amazon EventBridge. For more information, see
/// the <i> <a
/// href="https://docs.aws.amazon.com/guardduty/latest/ug/what-is-guardduty.html">Amazon
/// GuardDuty User Guide</a> </i>.
class GuardDuty {
  final _s.RestJsonProtocol _protocol;
  GuardDuty({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'guardduty',
            signingName: 'guardduty',
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

  /// Accepts the invitation to be a member account and get monitored by a
  /// GuardDuty administrator account that sent the invitation.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [administratorId] :
  /// The account ID of the GuardDuty administrator account whose invitation
  /// you're accepting.
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty member account.
  ///
  /// Parameter [invitationId] :
  /// The value that is used to validate the administrator account to the member
  /// account.
  Future<void> acceptAdministratorInvitation({
    required String administratorId,
    required String detectorId,
    required String invitationId,
  }) async {
    final $payload = <String, dynamic>{
      'administratorId': administratorId,
      'invitationId': invitationId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/administrator',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Accepts the invitation to be monitored by a GuardDuty administrator
  /// account.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty member account.
  ///
  /// Parameter [invitationId] :
  /// The value that is used to validate the administrator account to the member
  /// account.
  ///
  /// Parameter [masterId] :
  /// The account ID of the GuardDuty administrator account whose invitation
  /// you're accepting.
  @Deprecated(
      'This operation is deprecated, use AcceptAdministratorInvitation instead')
  Future<void> acceptInvitation({
    required String detectorId,
    required String invitationId,
    required String masterId,
  }) async {
    final $payload = <String, dynamic>{
      'invitationId': invitationId,
      'masterId': masterId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/master',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Archives GuardDuty findings that are specified by the list of finding IDs.
  /// <note>
  /// Only the administrator account can archive findings. Member accounts don't
  /// have permission to archive findings from their accounts.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The ID of the detector that specifies the GuardDuty service whose findings
  /// you want to archive.
  ///
  /// Parameter [findingIds] :
  /// The IDs of the findings that you want to archive.
  Future<void> archiveFindings({
    required String detectorId,
    required List<String> findingIds,
  }) async {
    final $payload = <String, dynamic>{
      'findingIds': findingIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/findings/archive',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a single GuardDuty detector. A detector is a resource that
  /// represents the GuardDuty service. To start using GuardDuty, you must
  /// create a detector in each Region where you enable the service. You can
  /// have only one detector per account per Region. All data sources are
  /// enabled in a new detector by default.
  ///
  /// <ul>
  /// <li>
  /// When you don't specify any <code>features</code>, with an exception to
  /// <code>RUNTIME_MONITORING</code>, all the optional features are enabled by
  /// default.
  /// </li>
  /// <li>
  /// When you specify some of the <code>features</code>, any feature that is
  /// not specified in the API call gets enabled by default, with an exception
  /// to <code>RUNTIME_MONITORING</code>.
  /// </li>
  /// </ul>
  /// Specifying both EKS Runtime Monitoring
  /// (<code>EKS_RUNTIME_MONITORING</code>) and Runtime Monitoring
  /// (<code>RUNTIME_MONITORING</code>) will cause an error. You can add only
  /// one of these two features because Runtime Monitoring already includes the
  /// threat detection for Amazon EKS resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/runtime-monitoring.html">Runtime
  /// Monitoring</a>.
  ///
  /// There might be regional differences because some data sources might not be
  /// available in all the Amazon Web Services Regions where GuardDuty is
  /// presently supported. For more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_regions.html">Regions
  /// and endpoints</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [enable] :
  /// A Boolean value that specifies whether the detector is to be enabled.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token for the create request.
  ///
  /// Parameter [dataSources] :
  /// Describes which data sources will be enabled for the detector.
  ///
  /// There might be regional differences because some data sources might not be
  /// available in all the Amazon Web Services Regions where GuardDuty is
  /// presently supported. For more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_regions.html">Regions
  /// and endpoints</a>.
  ///
  /// Parameter [features] :
  /// A list of features that will be configured for the detector.
  ///
  /// Parameter [findingPublishingFrequency] :
  /// A value that specifies how frequently updated findings are exported.
  ///
  /// Parameter [tags] :
  /// The tags to be added to a new detector resource.
  Future<CreateDetectorResponse> createDetector({
    required bool enable,
    String? clientToken,
    DataSourceConfigurations? dataSources,
    List<DetectorFeatureConfiguration>? features,
    FindingPublishingFrequency? findingPublishingFrequency,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'enable': enable,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (dataSources != null) 'dataSources': dataSources,
      if (features != null) 'features': features,
      if (findingPublishingFrequency != null)
        'findingPublishingFrequency': findingPublishingFrequency.value,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDetectorResponse.fromJson(response);
  }

  /// Creates a filter using the specified finding criteria. The maximum number
  /// of saved filters per Amazon Web Services account per Region is 100. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_limits.html">Quotas
  /// for GuardDuty</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The ID of the detector belonging to the GuardDuty account that you want to
  /// create a filter for.
  ///
  /// Parameter [findingCriteria] :
  /// Represents the criteria to be used in the filter for querying findings.
  ///
  /// You can only use the following attributes to query findings:
  ///
  /// <ul>
  /// <li>
  /// accountId
  /// </li>
  /// <li>
  /// id
  /// </li>
  /// <li>
  /// region
  /// </li>
  /// <li>
  /// severity
  ///
  /// To filter on the basis of severity, the API and CLI use the following
  /// input list for the <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_FindingCriteria.html">FindingCriteria</a>
  /// condition:
  ///
  /// <ul>
  /// <li>
  /// <b>Low</b>: <code>["1", "2", "3"]</code>
  /// </li>
  /// <li>
  /// <b>Medium</b>: <code>["4", "5", "6"]</code>
  /// </li>
  /// <li>
  /// <b>High</b>: <code>["7", "8", "9"]</code>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_findings.html#guardduty_findings-severity">Severity
  /// levels for GuardDuty findings</a>.
  /// </li>
  /// <li>
  /// type
  /// </li>
  /// <li>
  /// updatedAt
  ///
  /// Type: ISO 8601 string format: YYYY-MM-DDTHH:MM:SS.SSSZ or
  /// YYYY-MM-DDTHH:MM:SSZ depending on whether the value contains milliseconds.
  /// </li>
  /// <li>
  /// resource.accessKeyDetails.accessKeyId
  /// </li>
  /// <li>
  /// resource.accessKeyDetails.principalId
  /// </li>
  /// <li>
  /// resource.accessKeyDetails.userName
  /// </li>
  /// <li>
  /// resource.accessKeyDetails.userType
  /// </li>
  /// <li>
  /// resource.instanceDetails.iamInstanceProfile.id
  /// </li>
  /// <li>
  /// resource.instanceDetails.imageId
  /// </li>
  /// <li>
  /// resource.instanceDetails.instanceId
  /// </li>
  /// <li>
  /// resource.instanceDetails.tags.key
  /// </li>
  /// <li>
  /// resource.instanceDetails.tags.value
  /// </li>
  /// <li>
  /// resource.instanceDetails.networkInterfaces.ipv6Addresses
  /// </li>
  /// <li>
  /// resource.instanceDetails.networkInterfaces.privateIpAddresses.privateIpAddress
  /// </li>
  /// <li>
  /// resource.instanceDetails.networkInterfaces.publicDnsName
  /// </li>
  /// <li>
  /// resource.instanceDetails.networkInterfaces.publicIp
  /// </li>
  /// <li>
  /// resource.instanceDetails.networkInterfaces.securityGroups.groupId
  /// </li>
  /// <li>
  /// resource.instanceDetails.networkInterfaces.securityGroups.groupName
  /// </li>
  /// <li>
  /// resource.instanceDetails.networkInterfaces.subnetId
  /// </li>
  /// <li>
  /// resource.instanceDetails.networkInterfaces.vpcId
  /// </li>
  /// <li>
  /// resource.instanceDetails.outpostArn
  /// </li>
  /// <li>
  /// resource.resourceType
  /// </li>
  /// <li>
  /// resource.s3BucketDetails.publicAccess.effectivePermissions
  /// </li>
  /// <li>
  /// resource.s3BucketDetails.name
  /// </li>
  /// <li>
  /// resource.s3BucketDetails.tags.key
  /// </li>
  /// <li>
  /// resource.s3BucketDetails.tags.value
  /// </li>
  /// <li>
  /// resource.s3BucketDetails.type
  /// </li>
  /// <li>
  /// service.action.actionType
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.api
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.callerType
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.errorCode
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.remoteIpDetails.city.cityName
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.remoteIpDetails.country.countryName
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.remoteIpDetails.ipAddressV4
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.remoteIpDetails.ipAddressV6
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.remoteIpDetails.organization.asn
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.remoteIpDetails.organization.asnOrg
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.serviceName
  /// </li>
  /// <li>
  /// service.action.dnsRequestAction.domain
  /// </li>
  /// <li>
  /// service.action.dnsRequestAction.domainWithSuffix
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.blocked
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.connectionDirection
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.localPortDetails.port
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.protocol
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.remoteIpDetails.city.cityName
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.remoteIpDetails.country.countryName
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.remoteIpDetails.ipAddressV4
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.remoteIpDetails.ipAddressV6
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.remoteIpDetails.organization.asn
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.remoteIpDetails.organization.asnOrg
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.remotePortDetails.port
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.remoteAccountDetails.affiliated
  /// </li>
  /// <li>
  /// service.action.kubernetesApiCallAction.remoteIpDetails.ipAddressV4
  /// </li>
  /// <li>
  /// service.action.kubernetesApiCallAction.remoteIpDetails.ipAddressV6
  /// </li>
  /// <li>
  /// service.action.kubernetesApiCallAction.namespace
  /// </li>
  /// <li>
  /// service.action.kubernetesApiCallAction.remoteIpDetails.organization.asn
  /// </li>
  /// <li>
  /// service.action.kubernetesApiCallAction.requestUri
  /// </li>
  /// <li>
  /// service.action.kubernetesApiCallAction.statusCode
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.localIpDetails.ipAddressV4
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.localIpDetails.ipAddressV6
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.protocol
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.serviceName
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.remoteAccountDetails.accountId
  /// </li>
  /// <li>
  /// service.additionalInfo.threatListName
  /// </li>
  /// <li>
  /// service.resourceRole
  /// </li>
  /// <li>
  /// resource.eksClusterDetails.name
  /// </li>
  /// <li>
  /// resource.kubernetesDetails.kubernetesWorkloadDetails.name
  /// </li>
  /// <li>
  /// resource.kubernetesDetails.kubernetesWorkloadDetails.namespace
  /// </li>
  /// <li>
  /// resource.kubernetesDetails.kubernetesUserDetails.username
  /// </li>
  /// <li>
  /// resource.kubernetesDetails.kubernetesWorkloadDetails.containers.image
  /// </li>
  /// <li>
  /// resource.kubernetesDetails.kubernetesWorkloadDetails.containers.imagePrefix
  /// </li>
  /// <li>
  /// service.ebsVolumeScanDetails.scanId
  /// </li>
  /// <li>
  /// service.ebsVolumeScanDetails.scanDetections.threatDetectedByName.threatNames.name
  /// </li>
  /// <li>
  /// service.ebsVolumeScanDetails.scanDetections.threatDetectedByName.threatNames.severity
  /// </li>
  /// <li>
  /// service.ebsVolumeScanDetails.scanDetections.threatDetectedByName.threatNames.filePaths.hash
  /// </li>
  /// <li>
  /// resource.ecsClusterDetails.name
  /// </li>
  /// <li>
  /// resource.ecsClusterDetails.taskDetails.containers.image
  /// </li>
  /// <li>
  /// resource.ecsClusterDetails.taskDetails.definitionArn
  /// </li>
  /// <li>
  /// resource.containerDetails.image
  /// </li>
  /// <li>
  /// resource.rdsDbInstanceDetails.dbInstanceIdentifier
  /// </li>
  /// <li>
  /// resource.rdsDbInstanceDetails.dbClusterIdentifier
  /// </li>
  /// <li>
  /// resource.rdsDbInstanceDetails.engine
  /// </li>
  /// <li>
  /// resource.rdsDbUserDetails.user
  /// </li>
  /// <li>
  /// resource.rdsDbInstanceDetails.tags.key
  /// </li>
  /// <li>
  /// resource.rdsDbInstanceDetails.tags.value
  /// </li>
  /// <li>
  /// service.runtimeDetails.process.executableSha256
  /// </li>
  /// <li>
  /// service.runtimeDetails.process.name
  /// </li>
  /// <li>
  /// service.runtimeDetails.process.name
  /// </li>
  /// <li>
  /// resource.lambdaDetails.functionName
  /// </li>
  /// <li>
  /// resource.lambdaDetails.functionArn
  /// </li>
  /// <li>
  /// resource.lambdaDetails.tags.key
  /// </li>
  /// <li>
  /// resource.lambdaDetails.tags.value
  /// </li>
  /// </ul>
  ///
  /// Parameter [name] :
  /// The name of the filter. Valid characters include period (.), underscore
  /// (_), dash (-), and alphanumeric characters. A whitespace is considered to
  /// be an invalid character.
  ///
  /// Parameter [action] :
  /// Specifies the action that is to be applied to the findings that match the
  /// filter.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token for the create request.
  ///
  /// Parameter [description] :
  /// The description of the filter. Valid characters include alphanumeric
  /// characters, and special characters such as hyphen, period, colon,
  /// underscore, parentheses (<code>{ }</code>, <code>[ ]</code>, and <code>(
  /// )</code>), forward slash, horizontal tab, vertical tab, newline, form
  /// feed, return, and whitespace.
  ///
  /// Parameter [rank] :
  /// Specifies the position of the filter in the list of current filters. Also
  /// specifies the order in which this filter is applied to the findings.
  ///
  /// Parameter [tags] :
  /// The tags to be added to a new filter resource.
  Future<CreateFilterResponse> createFilter({
    required String detectorId,
    required FindingCriteria findingCriteria,
    required String name,
    FilterAction? action,
    String? clientToken,
    String? description,
    int? rank,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'rank',
      rank,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'findingCriteria': findingCriteria,
      'name': name,
      if (action != null) 'action': action.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (rank != null) 'rank': rank,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/filter',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFilterResponse.fromJson(response);
  }

  /// Creates a new IPSet, which is called a trusted IP list in the console user
  /// interface. An IPSet is a list of IP addresses that are trusted for secure
  /// communication with Amazon Web Services infrastructure and applications.
  /// GuardDuty doesn't generate findings for IP addresses that are included in
  /// IPSets. Only users from the administrator account can use this operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [activate] :
  /// A Boolean value that indicates whether GuardDuty is to start using the
  /// uploaded IPSet.
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty account that you want to
  /// create an IPSet for.
  ///
  /// Parameter [format] :
  /// The format of the file that contains the IPSet.
  ///
  /// Parameter [location] :
  /// The URI of the file that contains the IPSet.
  ///
  /// Parameter [name] :
  /// The user-friendly name to identify the IPSet.
  ///
  /// Allowed characters are alphanumeric, whitespace, dash (-), and underscores
  /// (_).
  ///
  /// Parameter [clientToken] :
  /// The idempotency token for the create request.
  ///
  /// Parameter [tags] :
  /// The tags to be added to a new IP set resource.
  Future<CreateIPSetResponse> createIPSet({
    required bool activate,
    required String detectorId,
    required IpSetFormat format,
    required String location,
    required String name,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'activate': activate,
      'format': format.value,
      'location': location,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/ipset',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIPSetResponse.fromJson(response);
  }

  /// Creates member accounts of the current Amazon Web Services account by
  /// specifying a list of Amazon Web Services account IDs. This step is a
  /// prerequisite for managing the associated member accounts either by
  /// invitation or through an organization.
  ///
  /// As a delegated administrator, using <code>CreateMembers</code> will enable
  /// GuardDuty in the added member accounts, with the exception of the
  /// organization delegated administrator account. A delegated administrator
  /// must enable GuardDuty prior to being added as a member.
  ///
  /// When you use CreateMembers as an Organizations delegated administrator,
  /// GuardDuty applies your organization's auto-enable settings to the member
  /// accounts in this request, irrespective of the accounts being new or
  /// existing members. For more information about the existing auto-enable
  /// settings for your organization, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_DescribeOrganizationConfiguration.html">DescribeOrganizationConfiguration</a>.
  ///
  /// If you disassociate a member account that was added by invitation, the
  /// member account details obtained from this API, including the associated
  /// email addresses, will be retained. This is done so that the delegated
  /// administrator can invoke the <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_InviteMembers.html">InviteMembers</a>
  /// API without the need to invoke the CreateMembers API again. To remove the
  /// details associated with a member account, the delegated administrator must
  /// invoke the <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_DeleteMembers.html">DeleteMembers</a>
  /// API.
  ///
  /// When the member accounts added through Organizations are later
  /// disassociated, you (administrator) can't invite them by calling the
  /// InviteMembers API. You can create an association with these member
  /// accounts again only by calling the CreateMembers API.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [accountDetails] :
  /// A list of account ID and email address pairs of the accounts that you want
  /// to associate with the GuardDuty administrator account.
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty account that you want to
  /// associate member accounts with.
  Future<CreateMembersResponse> createMembers({
    required List<AccountDetail> accountDetails,
    required String detectorId,
  }) async {
    final $payload = <String, dynamic>{
      'accountDetails': accountDetails,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/member',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMembersResponse.fromJson(response);
  }

  /// Creates a publishing destination to export findings to. The resource to
  /// export findings to must exist before you use this operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [destinationProperties] :
  /// The properties of the publishing destination, including the ARNs for the
  /// destination and the KMS key used for encryption.
  ///
  /// Parameter [destinationType] :
  /// The type of resource for the publishing destination. Currently only Amazon
  /// S3 buckets are supported.
  ///
  /// Parameter [detectorId] :
  /// The ID of the GuardDuty detector associated with the publishing
  /// destination.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token for the request.
  Future<CreatePublishingDestinationResponse> createPublishingDestination({
    required DestinationProperties destinationProperties,
    required DestinationType destinationType,
    required String detectorId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'destinationProperties': destinationProperties,
      'destinationType': destinationType.value,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/publishingDestination',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePublishingDestinationResponse.fromJson(response);
  }

  /// Generates sample findings of types specified by the list of finding types.
  /// If 'NULL' is specified for <code>findingTypes</code>, the API generates
  /// sample findings of all supported finding types.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The ID of the detector to create sample findings for.
  ///
  /// Parameter [findingTypes] :
  /// The types of sample findings to generate.
  Future<void> createSampleFindings({
    required String detectorId,
    List<String>? findingTypes,
  }) async {
    final $payload = <String, dynamic>{
      if (findingTypes != null) 'findingTypes': findingTypes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/findings/create',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a new ThreatIntelSet. ThreatIntelSets consist of known malicious
  /// IP addresses. GuardDuty generates findings based on ThreatIntelSets. Only
  /// users of the administrator account can use this operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [activate] :
  /// A Boolean value that indicates whether GuardDuty is to start using the
  /// uploaded ThreatIntelSet.
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty account that you want to
  /// create a threatIntelSet for.
  ///
  /// Parameter [format] :
  /// The format of the file that contains the ThreatIntelSet.
  ///
  /// Parameter [location] :
  /// The URI of the file that contains the ThreatIntelSet.
  ///
  /// Parameter [name] :
  /// A user-friendly ThreatIntelSet name displayed in all findings that are
  /// generated by activity that involves IP addresses included in this
  /// ThreatIntelSet.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token for the create request.
  ///
  /// Parameter [tags] :
  /// The tags to be added to a new threat list resource.
  Future<CreateThreatIntelSetResponse> createThreatIntelSet({
    required bool activate,
    required String detectorId,
    required ThreatIntelSetFormat format,
    required String location,
    required String name,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'activate': activate,
      'format': format.value,
      'location': location,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/threatintelset',
      exceptionFnMap: _exceptionFns,
    );
    return CreateThreatIntelSetResponse.fromJson(response);
  }

  /// Declines invitations sent to the current member account by Amazon Web
  /// Services accounts specified by their account IDs.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [accountIds] :
  /// A list of account IDs of the Amazon Web Services accounts that sent
  /// invitations to the current member account that you want to decline
  /// invitations from.
  Future<DeclineInvitationsResponse> declineInvitations({
    required List<String> accountIds,
  }) async {
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/invitation/decline',
      exceptionFnMap: _exceptionFns,
    );
    return DeclineInvitationsResponse.fromJson(response);
  }

  /// Deletes an Amazon GuardDuty detector that is specified by the detector ID.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector that you want to delete.
  Future<void> deleteDetector({
    required String detectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the filter specified by the filter name.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector that the filter is associated with.
  ///
  /// Parameter [filterName] :
  /// The name of the filter that you want to delete.
  Future<void> deleteFilter({
    required String detectorId,
    required String filterName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/filter/${Uri.encodeComponent(filterName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the IPSet specified by the <code>ipSetId</code>. IPSets are called
  /// trusted IP lists in the console user interface.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector associated with the IPSet.
  ///
  /// Parameter [ipSetId] :
  /// The unique ID of the IPSet to delete.
  Future<void> deleteIPSet({
    required String detectorId,
    required String ipSetId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/ipset/${Uri.encodeComponent(ipSetId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes invitations sent to the current member account by Amazon Web
  /// Services accounts specified by their account IDs.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [accountIds] :
  /// A list of account IDs of the Amazon Web Services accounts that sent
  /// invitations to the current member account that you want to delete
  /// invitations from.
  Future<DeleteInvitationsResponse> deleteInvitations({
    required List<String> accountIds,
  }) async {
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/invitation/delete',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteInvitationsResponse.fromJson(response);
  }

  /// Deletes GuardDuty member accounts (to the current GuardDuty administrator
  /// account) specified by the account IDs.
  ///
  /// With <code>autoEnableOrganizationMembers</code> configuration for your
  /// organization set to <code>ALL</code>, you'll receive an error if you
  /// attempt to disable GuardDuty for a member account in your organization.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [accountIds] :
  /// A list of account IDs of the GuardDuty member accounts that you want to
  /// delete.
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty account whose members you
  /// want to delete.
  Future<DeleteMembersResponse> deleteMembers({
    required List<String> accountIds,
    required String detectorId,
  }) async {
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/member/delete',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteMembersResponse.fromJson(response);
  }

  /// Deletes the publishing definition with the specified
  /// <code>destinationId</code>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [destinationId] :
  /// The ID of the publishing destination to delete.
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector associated with the publishing destination
  /// to delete.
  Future<void> deletePublishingDestination({
    required String destinationId,
    required String detectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/publishingDestination/${Uri.encodeComponent(destinationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the ThreatIntelSet specified by the ThreatIntelSet ID.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector that the threatIntelSet is associated with.
  ///
  /// Parameter [threatIntelSetId] :
  /// The unique ID of the threatIntelSet that you want to delete.
  Future<void> deleteThreatIntelSet({
    required String detectorId,
    required String threatIntelSetId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/threatintelset/${Uri.encodeComponent(threatIntelSetId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of malware scans. Each member account can view the malware
  /// scans for their own accounts. An administrator can view the malware scans
  /// for all the member accounts.
  ///
  /// There might be regional differences because some data sources might not be
  /// available in all the Amazon Web Services Regions where GuardDuty is
  /// presently supported. For more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_regions.html">Regions
  /// and endpoints</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector that the request is associated with.
  ///
  /// Parameter [filterCriteria] :
  /// Represents the criteria to be used in the filter for describing scan
  /// entries.
  ///
  /// Parameter [maxResults] :
  /// You can use this parameter to indicate the maximum number of items that
  /// you want in the response. The default value is 50. The maximum value is
  /// 50.
  ///
  /// Parameter [nextToken] :
  /// You can use this parameter when paginating results. Set the value of this
  /// parameter to null on your first call to the list action. For subsequent
  /// calls to the action, fill nextToken in the request with the value of
  /// NextToken from the previous response to continue listing data.
  ///
  /// Parameter [sortCriteria] :
  /// Represents the criteria used for sorting scan entries. The <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_SortCriteria.html#guardduty-Type-SortCriteria-attributeName">
  /// <code>attributeName</code> </a> is required and it must be
  /// <code>scanStartTime</code>.
  Future<DescribeMalwareScansResponse> describeMalwareScans({
    required String detectorId,
    FilterCriteria? filterCriteria,
    int? maxResults,
    String? nextToken,
    SortCriteria? sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (filterCriteria != null) 'filterCriteria': filterCriteria,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortCriteria != null) 'sortCriteria': sortCriteria,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/malware-scans',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeMalwareScansResponse.fromJson(response);
  }

  /// Returns information about the account selected as the delegated
  /// administrator for GuardDuty.
  ///
  /// There might be regional differences because some data sources might not be
  /// available in all the Amazon Web Services Regions where GuardDuty is
  /// presently supported. For more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_regions.html">Regions
  /// and endpoints</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The ID of the detector to retrieve information about the delegated
  /// administrator from.
  ///
  /// Parameter [maxResults] :
  /// You can use this parameter to indicate the maximum number of items that
  /// you want in the response.
  ///
  /// Parameter [nextToken] :
  /// You can use this parameter when paginating results. Set the value of this
  /// parameter to null on your first call to the list action. For subsequent
  /// calls to the action, fill <code>nextToken</code> in the request with the
  /// value of <code>NextToken</code> from the previous response to continue
  /// listing data.
  Future<DescribeOrganizationConfigurationResponse>
      describeOrganizationConfiguration({
    required String detectorId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/admin',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeOrganizationConfigurationResponse.fromJson(response);
  }

  /// Returns information about the publishing destination specified by the
  /// provided <code>destinationId</code>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [destinationId] :
  /// The ID of the publishing destination to retrieve.
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector associated with the publishing destination
  /// to retrieve.
  Future<DescribePublishingDestinationResponse> describePublishingDestination({
    required String destinationId,
    required String detectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/publishingDestination/${Uri.encodeComponent(destinationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribePublishingDestinationResponse.fromJson(response);
  }

  /// Removes the existing GuardDuty delegated administrator of the
  /// organization. Only the organization's management account can run this API
  /// operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [adminAccountId] :
  /// The Amazon Web Services Account ID for the organizations account to be
  /// disabled as a GuardDuty delegated administrator.
  Future<void> disableOrganizationAdminAccount({
    required String adminAccountId,
  }) async {
    final $payload = <String, dynamic>{
      'adminAccountId': adminAccountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/admin/disable',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates the current GuardDuty member account from its administrator
  /// account.
  ///
  /// When you disassociate an invited member from a GuardDuty delegated
  /// administrator, the member account details obtained from the <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_CreateMembers.html">CreateMembers</a>
  /// API, including the associated email addresses, are retained. This is done
  /// so that the delegated administrator can invoke the <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_InviteMembers.html">InviteMembers</a>
  /// API without the need to invoke the CreateMembers API again. To remove the
  /// details associated with a member account, the delegated administrator must
  /// invoke the <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_DeleteMembers.html">DeleteMembers</a>
  /// API.
  ///
  /// With <code>autoEnableOrganizationMembers</code> configuration for your
  /// organization set to <code>ALL</code>, you'll receive an error if you
  /// attempt to disable GuardDuty in a member account.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty member account.
  Future<void> disassociateFromAdministratorAccount({
    required String detectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/administrator/disassociate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates the current GuardDuty member account from its administrator
  /// account.
  ///
  /// When you disassociate an invited member from a GuardDuty delegated
  /// administrator, the member account details obtained from the <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_CreateMembers.html">CreateMembers</a>
  /// API, including the associated email addresses, are retained. This is done
  /// so that the delegated administrator can invoke the <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_InviteMembers.html">InviteMembers</a>
  /// API without the need to invoke the CreateMembers API again. To remove the
  /// details associated with a member account, the delegated administrator must
  /// invoke the <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_DeleteMembers.html">DeleteMembers</a>
  /// API.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty member account.
  @Deprecated(
      'This operation is deprecated, use DisassociateFromAdministratorAccount instead')
  Future<void> disassociateFromMasterAccount({
    required String detectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/master/disassociate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates GuardDuty member accounts (from the current administrator
  /// account) specified by the account IDs.
  ///
  /// When you disassociate an invited member from a GuardDuty delegated
  /// administrator, the member account details obtained from the <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_CreateMembers.html">CreateMembers</a>
  /// API, including the associated email addresses, are retained. This is done
  /// so that the delegated administrator can invoke the <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_InviteMembers.html">InviteMembers</a>
  /// API without the need to invoke the CreateMembers API again. To remove the
  /// details associated with a member account, the delegated administrator must
  /// invoke the <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_DeleteMembers.html">DeleteMembers</a>
  /// API.
  ///
  /// With <code>autoEnableOrganizationMembers</code> configuration for your
  /// organization set to <code>ALL</code>, you'll receive an error if you
  /// attempt to disassociate a member account before removing them from your
  /// organization.
  ///
  /// If you disassociate a member account that was added by invitation, the
  /// member account details obtained from this API, including the associated
  /// email addresses, will be retained. This is done so that the delegated
  /// administrator can invoke the <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_InviteMembers.html">InviteMembers</a>
  /// API without the need to invoke the CreateMembers API again. To remove the
  /// details associated with a member account, the delegated administrator must
  /// invoke the <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_DeleteMembers.html">DeleteMembers</a>
  /// API.
  ///
  /// When the member accounts added through Organizations are later
  /// disassociated, you (administrator) can't invite them by calling the
  /// InviteMembers API. You can create an association with these member
  /// accounts again only by calling the CreateMembers API.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [accountIds] :
  /// A list of account IDs of the GuardDuty member accounts that you want to
  /// disassociate from the administrator account.
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty account whose members you
  /// want to disassociate from the administrator account.
  Future<DisassociateMembersResponse> disassociateMembers({
    required List<String> accountIds,
    required String detectorId,
  }) async {
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/member/disassociate',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateMembersResponse.fromJson(response);
  }

  /// Designates an Amazon Web Services account within the organization as your
  /// GuardDuty delegated administrator. Only the organization's management
  /// account can run this API operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [adminAccountId] :
  /// The Amazon Web Services account ID for the organization account to be
  /// enabled as a GuardDuty delegated administrator.
  Future<void> enableOrganizationAdminAccount({
    required String adminAccountId,
  }) async {
    final $payload = <String, dynamic>{
      'adminAccountId': adminAccountId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/admin/enable',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Provides the details of the GuardDuty administrator account associated
  /// with the current GuardDuty member account.
  /// <note>
  /// If the organization's management account or a delegated administrator runs
  /// this API, it will return success (<code>HTTP 200</code>) but no content.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty member account.
  Future<GetAdministratorAccountResponse> getAdministratorAccount({
    required String detectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/administrator',
      exceptionFnMap: _exceptionFns,
    );
    return GetAdministratorAccountResponse.fromJson(response);
  }

  /// Retrieves aggregated statistics for your account. If you are a GuardDuty
  /// administrator, you can retrieve the statistics for all the resources
  /// associated with the active member accounts in your organization who have
  /// enabled Runtime Monitoring and have the GuardDuty security agent running
  /// on their resources.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the GuardDuty detector associated to the coverage
  /// statistics.
  ///
  /// Parameter [statisticsType] :
  /// Represents the statistics type used to aggregate the coverage details.
  ///
  /// Parameter [filterCriteria] :
  /// Represents the criteria used to filter the coverage statistics
  Future<GetCoverageStatisticsResponse> getCoverageStatistics({
    required String detectorId,
    required List<CoverageStatisticsType> statisticsType,
    CoverageFilterCriteria? filterCriteria,
  }) async {
    final $payload = <String, dynamic>{
      'statisticsType': statisticsType.map((e) => e.value).toList(),
      if (filterCriteria != null) 'filterCriteria': filterCriteria,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/coverage/statistics',
      exceptionFnMap: _exceptionFns,
    );
    return GetCoverageStatisticsResponse.fromJson(response);
  }

  /// Retrieves an Amazon GuardDuty detector specified by the detectorId.
  ///
  /// There might be regional differences because some data sources might not be
  /// available in all the Amazon Web Services Regions where GuardDuty is
  /// presently supported. For more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_regions.html">Regions
  /// and endpoints</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector that you want to get.
  Future<GetDetectorResponse> getDetector({
    required String detectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDetectorResponse.fromJson(response);
  }

  /// Returns the details of the filter specified by the filter name.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector that the filter is associated with.
  ///
  /// Parameter [filterName] :
  /// The name of the filter you want to get.
  Future<GetFilterResponse> getFilter({
    required String detectorId,
    required String filterName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/filter/${Uri.encodeComponent(filterName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFilterResponse.fromJson(response);
  }

  /// Describes Amazon GuardDuty findings specified by finding IDs.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The ID of the detector that specifies the GuardDuty service whose findings
  /// you want to retrieve.
  ///
  /// Parameter [findingIds] :
  /// The IDs of the findings that you want to retrieve.
  ///
  /// Parameter [sortCriteria] :
  /// Represents the criteria used for sorting findings.
  Future<GetFindingsResponse> getFindings({
    required String detectorId,
    required List<String> findingIds,
    SortCriteria? sortCriteria,
  }) async {
    final $payload = <String, dynamic>{
      'findingIds': findingIds,
      if (sortCriteria != null) 'sortCriteria': sortCriteria,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/findings/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetFindingsResponse.fromJson(response);
  }

  /// Lists Amazon GuardDuty findings statistics for the specified detector ID.
  ///
  /// There might be regional differences because some flags might not be
  /// available in all the Regions where GuardDuty is currently supported. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_regions.html">Regions
  /// and endpoints</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The ID of the detector that specifies the GuardDuty service whose
  /// findings' statistics you want to retrieve.
  ///
  /// Parameter [findingStatisticTypes] :
  /// The types of finding statistics to retrieve.
  ///
  /// Parameter [findingCriteria] :
  /// Represents the criteria that is used for querying findings.
  Future<GetFindingsStatisticsResponse> getFindingsStatistics({
    required String detectorId,
    required List<FindingStatisticType> findingStatisticTypes,
    FindingCriteria? findingCriteria,
  }) async {
    final $payload = <String, dynamic>{
      'findingStatisticTypes':
          findingStatisticTypes.map((e) => e.value).toList(),
      if (findingCriteria != null) 'findingCriteria': findingCriteria,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/findings/statistics',
      exceptionFnMap: _exceptionFns,
    );
    return GetFindingsStatisticsResponse.fromJson(response);
  }

  /// Retrieves the IPSet specified by the <code>ipSetId</code>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector that the IPSet is associated with.
  ///
  /// Parameter [ipSetId] :
  /// The unique ID of the IPSet to retrieve.
  Future<GetIPSetResponse> getIPSet({
    required String detectorId,
    required String ipSetId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/ipset/${Uri.encodeComponent(ipSetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetIPSetResponse.fromJson(response);
  }

  /// Returns the count of all GuardDuty membership invitations that were sent
  /// to the current member account except the currently accepted invitation.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  Future<GetInvitationsCountResponse> getInvitationsCount() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/invitation/count',
      exceptionFnMap: _exceptionFns,
    );
    return GetInvitationsCountResponse.fromJson(response);
  }

  /// Returns the details of the malware scan settings.
  ///
  /// There might be regional differences because some data sources might not be
  /// available in all the Amazon Web Services Regions where GuardDuty is
  /// presently supported. For more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_regions.html">Regions
  /// and endpoints</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector that the scan setting is associated with.
  Future<GetMalwareScanSettingsResponse> getMalwareScanSettings({
    required String detectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/malware-scan-settings',
      exceptionFnMap: _exceptionFns,
    );
    return GetMalwareScanSettingsResponse.fromJson(response);
  }

  /// Provides the details for the GuardDuty administrator account associated
  /// with the current GuardDuty member account.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty member account.
  @Deprecated(
      'This operation is deprecated, use GetAdministratorAccount instead')
  Future<GetMasterAccountResponse> getMasterAccount({
    required String detectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/master',
      exceptionFnMap: _exceptionFns,
    );
    return GetMasterAccountResponse.fromJson(response);
  }

  /// Describes which data sources are enabled for the member account's
  /// detector.
  ///
  /// There might be regional differences because some data sources might not be
  /// available in all the Amazon Web Services Regions where GuardDuty is
  /// presently supported. For more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_regions.html">Regions
  /// and endpoints</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [accountIds] :
  /// The account ID of the member account.
  ///
  /// Parameter [detectorId] :
  /// The detector ID for the administrator account.
  Future<GetMemberDetectorsResponse> getMemberDetectors({
    required List<String> accountIds,
    required String detectorId,
  }) async {
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/member/detector/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetMemberDetectorsResponse.fromJson(response);
  }

  /// Retrieves GuardDuty member accounts (of the current GuardDuty
  /// administrator account) specified by the account IDs.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [accountIds] :
  /// A list of account IDs of the GuardDuty member accounts that you want to
  /// describe.
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty account whose members you
  /// want to retrieve.
  Future<GetMembersResponse> getMembers({
    required List<String> accountIds,
    required String detectorId,
  }) async {
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/member/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetMembersResponse.fromJson(response);
  }

  /// Retrieves how many active member accounts have each feature enabled within
  /// GuardDuty. Only a delegated GuardDuty administrator of an organization can
  /// run this API.
  ///
  /// When you create a new organization, it might take up to 24 hours to
  /// generate the statistics for the entire organization.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  Future<GetOrganizationStatisticsResponse> getOrganizationStatistics() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/organization/statistics',
      exceptionFnMap: _exceptionFns,
    );
    return GetOrganizationStatisticsResponse.fromJson(response);
  }

  /// Provides the number of days left for each data source used in the free
  /// trial period.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty member account.
  ///
  /// Parameter [accountIds] :
  /// A list of account identifiers of the GuardDuty member account.
  Future<GetRemainingFreeTrialDaysResponse> getRemainingFreeTrialDays({
    required String detectorId,
    List<String>? accountIds,
  }) async {
    final $payload = <String, dynamic>{
      if (accountIds != null) 'accountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/freeTrial/daysRemaining',
      exceptionFnMap: _exceptionFns,
    );
    return GetRemainingFreeTrialDaysResponse.fromJson(response);
  }

  /// Retrieves the ThreatIntelSet that is specified by the ThreatIntelSet ID.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector that the threatIntelSet is associated with.
  ///
  /// Parameter [threatIntelSetId] :
  /// The unique ID of the threatIntelSet that you want to get.
  Future<GetThreatIntelSetResponse> getThreatIntelSet({
    required String detectorId,
    required String threatIntelSetId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/threatintelset/${Uri.encodeComponent(threatIntelSetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetThreatIntelSetResponse.fromJson(response);
  }

  /// Lists Amazon GuardDuty usage statistics over the last 30 days for the
  /// specified detector ID. For newly enabled detectors or data sources, the
  /// cost returned will include only the usage so far under 30 days. This may
  /// differ from the cost metrics in the console, which project usage over 30
  /// days to provide a monthly cost estimate. For more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/monitoring_costs.html#usage-calculations">Understanding
  /// How Usage Costs are Calculated</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The ID of the detector that specifies the GuardDuty service whose usage
  /// statistics you want to retrieve.
  ///
  /// Parameter [usageCriteria] :
  /// Represents the criteria used for querying usage.
  ///
  /// Parameter [usageStatisticType] :
  /// The type of usage statistics to retrieve.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. For subsequent calls, use the NextToken value returned from the
  /// previous request to continue listing results after the first page.
  ///
  /// Parameter [unit] :
  /// The currency unit you would like to view your usage statistics in. Current
  /// valid values are USD.
  Future<GetUsageStatisticsResponse> getUsageStatistics({
    required String detectorId,
    required UsageCriteria usageCriteria,
    required UsageStatisticType usageStatisticType,
    int? maxResults,
    String? nextToken,
    String? unit,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      'usageCriteria': usageCriteria,
      'usageStatisticsType': usageStatisticType.value,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (unit != null) 'unit': unit,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/usage/statistics',
      exceptionFnMap: _exceptionFns,
    );
    return GetUsageStatisticsResponse.fromJson(response);
  }

  /// Invites Amazon Web Services accounts to become members of an organization
  /// administered by the Amazon Web Services account that invokes this API. If
  /// you are using Amazon Web Services Organizations to manage your GuardDuty
  /// environment, this step is not needed. For more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_organizations.html">Managing
  /// accounts with organizations</a>.
  ///
  /// To invite Amazon Web Services accounts, the first step is to ensure that
  /// GuardDuty has been enabled in the potential member accounts. You can now
  /// invoke this API to add accounts by invitation. The invited accounts can
  /// either accept or decline the invitation from their GuardDuty accounts.
  /// Each invited Amazon Web Services account can choose to accept the
  /// invitation from only one Amazon Web Services account. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_invitations.html">Managing
  /// GuardDuty accounts by invitation</a>.
  ///
  /// After the invite has been accepted and you choose to disassociate a member
  /// account (by using <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_DisassociateMembers.html">DisassociateMembers</a>)
  /// from your account, the details of the member account obtained by invoking
  /// <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_CreateMembers.html">CreateMembers</a>,
  /// including the associated email addresses, will be retained. This is done
  /// so that you can invoke InviteMembers without the need to invoke <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_CreateMembers.html">CreateMembers</a>
  /// again. To remove the details associated with a member account, you must
  /// also invoke <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_DeleteMembers.html">DeleteMembers</a>.
  ///
  /// If you disassociate a member account that was added by invitation, the
  /// member account details obtained from this API, including the associated
  /// email addresses, will be retained. This is done so that the delegated
  /// administrator can invoke the <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_InviteMembers.html">InviteMembers</a>
  /// API without the need to invoke the CreateMembers API again. To remove the
  /// details associated with a member account, the delegated administrator must
  /// invoke the <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_DeleteMembers.html">DeleteMembers</a>
  /// API.
  ///
  /// When the member accounts added through Organizations are later
  /// disassociated, you (administrator) can't invite them by calling the
  /// InviteMembers API. You can create an association with these member
  /// accounts again only by calling the CreateMembers API.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [accountIds] :
  /// A list of account IDs of the accounts that you want to invite to GuardDuty
  /// as members.
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty account that you want to
  /// invite members with.
  ///
  /// Parameter [disableEmailNotification] :
  /// A Boolean value that specifies whether you want to disable email
  /// notification to the accounts that you are inviting to GuardDuty as
  /// members.
  ///
  /// Parameter [message] :
  /// The invitation message that you want to send to the accounts that you're
  /// inviting to GuardDuty as members.
  Future<InviteMembersResponse> inviteMembers({
    required List<String> accountIds,
    required String detectorId,
    bool? disableEmailNotification,
    String? message,
  }) async {
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
      if (disableEmailNotification != null)
        'disableEmailNotification': disableEmailNotification,
      if (message != null) 'message': message,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/member/invite',
      exceptionFnMap: _exceptionFns,
    );
    return InviteMembersResponse.fromJson(response);
  }

  /// Lists coverage details for your GuardDuty account. If you're a GuardDuty
  /// administrator, you can retrieve all resources associated with the active
  /// member accounts in your organization.
  ///
  /// Make sure the accounts have Runtime Monitoring enabled and GuardDuty agent
  /// running on their resources.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector whose coverage details you want to retrieve.
  ///
  /// Parameter [filterCriteria] :
  /// Represents the criteria used to filter the coverage details.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. For subsequent calls, use the NextToken value returned from the
  /// previous request to continue listing results after the first page.
  ///
  /// Parameter [sortCriteria] :
  /// Represents the criteria used to sort the coverage details.
  Future<ListCoverageResponse> listCoverage({
    required String detectorId,
    CoverageFilterCriteria? filterCriteria,
    int? maxResults,
    String? nextToken,
    CoverageSortCriteria? sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (filterCriteria != null) 'filterCriteria': filterCriteria,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortCriteria != null) 'sortCriteria': sortCriteria,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/coverage',
      exceptionFnMap: _exceptionFns,
    );
    return ListCoverageResponse.fromJson(response);
  }

  /// Lists detectorIds of all the existing Amazon GuardDuty detector resources.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [maxResults] :
  /// You can use this parameter to indicate the maximum number of items that
  /// you want in the response. The default value is 50. The maximum value is
  /// 50.
  ///
  /// Parameter [nextToken] :
  /// You can use this parameter when paginating results. Set the value of this
  /// parameter to null on your first call to the list action. For subsequent
  /// calls to the action, fill nextToken in the request with the value of
  /// NextToken from the previous response to continue listing data.
  Future<ListDetectorsResponse> listDetectors({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/detector',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDetectorsResponse.fromJson(response);
  }

  /// Returns a paginated list of the current filters.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector that the filter is associated with.
  ///
  /// Parameter [maxResults] :
  /// You can use this parameter to indicate the maximum number of items that
  /// you want in the response. The default value is 50. The maximum value is
  /// 50.
  ///
  /// Parameter [nextToken] :
  /// You can use this parameter when paginating results. Set the value of this
  /// parameter to null on your first call to the list action. For subsequent
  /// calls to the action, fill nextToken in the request with the value of
  /// NextToken from the previous response to continue listing data.
  Future<ListFiltersResponse> listFilters({
    required String detectorId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/filter',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFiltersResponse.fromJson(response);
  }

  /// Lists GuardDuty findings for the specified detector ID.
  ///
  /// There might be regional differences because some flags might not be
  /// available in all the Regions where GuardDuty is currently supported. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_regions.html">Regions
  /// and endpoints</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The ID of the detector that specifies the GuardDuty service whose findings
  /// you want to list.
  ///
  /// Parameter [findingCriteria] :
  /// Represents the criteria used for querying findings. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// JSON field name
  /// </li>
  /// <li>
  /// accountId
  /// </li>
  /// <li>
  /// region
  /// </li>
  /// <li>
  /// confidence
  /// </li>
  /// <li>
  /// id
  /// </li>
  /// <li>
  /// resource.accessKeyDetails.accessKeyId
  /// </li>
  /// <li>
  /// resource.accessKeyDetails.principalId
  /// </li>
  /// <li>
  /// resource.accessKeyDetails.userName
  /// </li>
  /// <li>
  /// resource.accessKeyDetails.userType
  /// </li>
  /// <li>
  /// resource.instanceDetails.iamInstanceProfile.id
  /// </li>
  /// <li>
  /// resource.instanceDetails.imageId
  /// </li>
  /// <li>
  /// resource.instanceDetails.instanceId
  /// </li>
  /// <li>
  /// resource.instanceDetails.networkInterfaces.ipv6Addresses
  /// </li>
  /// <li>
  /// resource.instanceDetails.networkInterfaces.privateIpAddresses.privateIpAddress
  /// </li>
  /// <li>
  /// resource.instanceDetails.networkInterfaces.publicDnsName
  /// </li>
  /// <li>
  /// resource.instanceDetails.networkInterfaces.publicIp
  /// </li>
  /// <li>
  /// resource.instanceDetails.networkInterfaces.securityGroups.groupId
  /// </li>
  /// <li>
  /// resource.instanceDetails.networkInterfaces.securityGroups.groupName
  /// </li>
  /// <li>
  /// resource.instanceDetails.networkInterfaces.subnetId
  /// </li>
  /// <li>
  /// resource.instanceDetails.networkInterfaces.vpcId
  /// </li>
  /// <li>
  /// resource.instanceDetails.tags.key
  /// </li>
  /// <li>
  /// resource.instanceDetails.tags.value
  /// </li>
  /// <li>
  /// resource.resourceType
  /// </li>
  /// <li>
  /// service.action.actionType
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.api
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.callerType
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.remoteIpDetails.city.cityName
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.remoteIpDetails.country.countryName
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.remoteIpDetails.ipAddressV4
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.remoteIpDetails.organization.asn
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.remoteIpDetails.organization.asnOrg
  /// </li>
  /// <li>
  /// service.action.awsApiCallAction.serviceName
  /// </li>
  /// <li>
  /// service.action.dnsRequestAction.domain
  /// </li>
  /// <li>
  /// service.action.dnsRequestAction.domainWithSuffix
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.blocked
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.connectionDirection
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.localPortDetails.port
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.protocol
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.remoteIpDetails.country.countryName
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.remoteIpDetails.ipAddressV4
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.remoteIpDetails.organization.asn
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.remoteIpDetails.organization.asnOrg
  /// </li>
  /// <li>
  /// service.action.networkConnectionAction.remotePortDetails.port
  /// </li>
  /// <li>
  /// service.additionalInfo.threatListName
  /// </li>
  /// <li>
  /// service.archived
  ///
  /// When this attribute is set to 'true', only archived findings are listed.
  /// When it's set to 'false', only unarchived findings are listed. When this
  /// attribute is not set, all existing findings are listed.
  /// </li>
  /// <li>
  /// service.resourceRole
  /// </li>
  /// <li>
  /// severity
  /// </li>
  /// <li>
  /// type
  /// </li>
  /// <li>
  /// updatedAt
  ///
  /// Type: Timestamp in Unix Epoch millisecond format: 1486685375000
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// You can use this parameter to indicate the maximum number of items you
  /// want in the response. The default value is 50. The maximum value is 50.
  ///
  /// Parameter [nextToken] :
  /// You can use this parameter when paginating results. Set the value of this
  /// parameter to null on your first call to the list action. For subsequent
  /// calls to the action, fill nextToken in the request with the value of
  /// NextToken from the previous response to continue listing data.
  ///
  /// Parameter [sortCriteria] :
  /// Represents the criteria used for sorting findings.
  Future<ListFindingsResponse> listFindings({
    required String detectorId,
    FindingCriteria? findingCriteria,
    int? maxResults,
    String? nextToken,
    SortCriteria? sortCriteria,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (findingCriteria != null) 'findingCriteria': findingCriteria,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sortCriteria != null) 'sortCriteria': sortCriteria,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/findings',
      exceptionFnMap: _exceptionFns,
    );
    return ListFindingsResponse.fromJson(response);
  }

  /// Lists the IPSets of the GuardDuty service specified by the detector ID. If
  /// you use this operation from a member account, the IPSets returned are the
  /// IPSets from the associated administrator account.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector that the IPSet is associated with.
  ///
  /// Parameter [maxResults] :
  /// You can use this parameter to indicate the maximum number of items you
  /// want in the response. The default value is 50. The maximum value is 50.
  ///
  /// Parameter [nextToken] :
  /// You can use this parameter when paginating results. Set the value of this
  /// parameter to null on your first call to the list action. For subsequent
  /// calls to the action, fill nextToken in the request with the value of
  /// NextToken from the previous response to continue listing data.
  Future<ListIPSetsResponse> listIPSets({
    required String detectorId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/ipset',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIPSetsResponse.fromJson(response);
  }

  /// Lists all GuardDuty membership invitations that were sent to the current
  /// Amazon Web Services account.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [maxResults] :
  /// You can use this parameter to indicate the maximum number of items that
  /// you want in the response. The default value is 50. The maximum value is
  /// 50.
  ///
  /// Parameter [nextToken] :
  /// You can use this parameter when paginating results. Set the value of this
  /// parameter to null on your first call to the list action. For subsequent
  /// calls to the action, fill nextToken in the request with the value of
  /// NextToken from the previous response to continue listing data.
  Future<ListInvitationsResponse> listInvitations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/invitation',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInvitationsResponse.fromJson(response);
  }

  /// Lists details about all member accounts for the current GuardDuty
  /// administrator account.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector the member is associated with.
  ///
  /// Parameter [maxResults] :
  /// You can use this parameter to indicate the maximum number of items you
  /// want in the response. The default value is 50. The maximum value is 50.
  ///
  /// Parameter [nextToken] :
  /// You can use this parameter when paginating results. Set the value of this
  /// parameter to null on your first call to the list action. For subsequent
  /// calls to the action, fill nextToken in the request with the value of
  /// NextToken from the previous response to continue listing data.
  ///
  /// Parameter [onlyAssociated] :
  /// Specifies whether to only return associated members or to return all
  /// members (including members who haven't been invited yet or have been
  /// disassociated). Member accounts must have been previously associated with
  /// the GuardDuty administrator account using <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_CreateMembers.html">
  /// <code>Create Members</code> </a>.
  Future<ListMembersResponse> listMembers({
    required String detectorId,
    int? maxResults,
    String? nextToken,
    String? onlyAssociated,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (onlyAssociated != null) 'onlyAssociated': [onlyAssociated],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/member',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMembersResponse.fromJson(response);
  }

  /// Lists the accounts designated as GuardDuty delegated administrators. Only
  /// the organization's management account can run this API operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. For subsequent calls, use the <code>NextToken</code> value
  /// returned from the previous request to continue listing results after the
  /// first page.
  Future<ListOrganizationAdminAccountsResponse> listOrganizationAdminAccounts({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/admin',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOrganizationAdminAccountsResponse.fromJson(response);
  }

  /// Returns a list of publishing destinations associated with the specified
  /// <code>detectorId</code>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The ID of the detector to retrieve publishing destinations for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token to use for paginating results that are returned in the response.
  /// Set the value of this parameter to null for the first request to a list
  /// action. For subsequent calls, use the <code>NextToken</code> value
  /// returned from the previous request to continue listing results after the
  /// first page.
  Future<ListPublishingDestinationsResponse> listPublishingDestinations({
    required String detectorId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/publishingDestination',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPublishingDestinationsResponse.fromJson(response);
  }

  /// Lists tags for a resource. Tagging is currently supported for detectors,
  /// finding filters, IP sets, threat intel sets, and publishing destination,
  /// with a limit of 50 tags per resource. When invoked, this operation returns
  /// all assigned tags for a given resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the given GuardDuty resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Lists the ThreatIntelSets of the GuardDuty service specified by the
  /// detector ID. If you use this operation from a member account, the
  /// ThreatIntelSets associated with the administrator account are returned.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector that the threatIntelSet is associated with.
  ///
  /// Parameter [maxResults] :
  /// You can use this parameter to indicate the maximum number of items that
  /// you want in the response. The default value is 50. The maximum value is
  /// 50.
  ///
  /// Parameter [nextToken] :
  /// You can use this parameter to paginate results in the response. Set the
  /// value of this parameter to null on your first call to the list action. For
  /// subsequent calls to the action, fill nextToken in the request with the
  /// value of NextToken from the previous response to continue listing data.
  Future<ListThreatIntelSetsResponse> listThreatIntelSets({
    required String detectorId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/threatintelset',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThreatIntelSetsResponse.fromJson(response);
  }

  /// Initiates the malware scan. Invoking this API will automatically create
  /// the <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/slr-permissions-malware-protection.html">Service-linked
  /// role</a> in the corresponding account.
  ///
  /// When the malware scan starts, you can use the associated scan ID to track
  /// the status of the scan. For more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_DescribeMalwareScans.html">DescribeMalwareScans</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  /// Amazon Resource Name (ARN) of the resource for which you invoked the API.
  Future<StartMalwareScanResponse> startMalwareScan({
    required String resourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/malware-scan/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartMalwareScanResponse.fromJson(response);
  }

  /// Turns on GuardDuty monitoring of the specified member accounts. Use this
  /// operation to restart monitoring of accounts that you stopped monitoring
  /// with the <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_StopMonitoringMembers.html">StopMonitoringMembers</a>
  /// operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [accountIds] :
  /// A list of account IDs of the GuardDuty member accounts to start
  /// monitoring.
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty administrator account
  /// associated with the member accounts to monitor.
  Future<StartMonitoringMembersResponse> startMonitoringMembers({
    required List<String> accountIds,
    required String detectorId,
  }) async {
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/member/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartMonitoringMembersResponse.fromJson(response);
  }

  /// Stops GuardDuty monitoring for the specified member accounts. Use the
  /// <code>StartMonitoringMembers</code> operation to restart monitoring for
  /// those accounts.
  ///
  /// With <code>autoEnableOrganizationMembers</code> configuration for your
  /// organization set to <code>ALL</code>, you'll receive an error if you
  /// attempt to stop monitoring the member accounts in your organization.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [accountIds] :
  /// A list of account IDs for the member accounts to stop monitoring.
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector associated with the GuardDuty administrator
  /// account that is monitoring member accounts.
  Future<StopMonitoringMembersResponse> stopMonitoringMembers({
    required List<String> accountIds,
    required String detectorId,
  }) async {
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/member/stop',
      exceptionFnMap: _exceptionFns,
    );
    return StopMonitoringMembersResponse.fromJson(response);
  }

  /// Adds tags to a resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the GuardDuty resource to apply a tag
  /// to.
  ///
  /// Parameter [tags] :
  /// The tags to be added to a resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Unarchives GuardDuty findings specified by the <code>findingIds</code>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The ID of the detector associated with the findings to unarchive.
  ///
  /// Parameter [findingIds] :
  /// The IDs of the findings to unarchive.
  Future<void> unarchiveFindings({
    required String detectorId,
    required List<String> findingIds,
  }) async {
    final $payload = <String, dynamic>{
      'findingIds': findingIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/findings/unarchive',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from a resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the resource to remove tags from.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys to remove from the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the GuardDuty detector specified by the detector ID.
  ///
  /// Specifying both EKS Runtime Monitoring
  /// (<code>EKS_RUNTIME_MONITORING</code>) and Runtime Monitoring
  /// (<code>RUNTIME_MONITORING</code>) will cause an error. You can add only
  /// one of these two features because Runtime Monitoring already includes the
  /// threat detection for Amazon EKS resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/runtime-monitoring.html">Runtime
  /// Monitoring</a>.
  ///
  /// There might be regional differences because some data sources might not be
  /// available in all the Amazon Web Services Regions where GuardDuty is
  /// presently supported. For more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_regions.html">Regions
  /// and endpoints</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector to update.
  ///
  /// Parameter [dataSources] :
  /// Describes which data sources will be updated.
  ///
  /// There might be regional differences because some data sources might not be
  /// available in all the Amazon Web Services Regions where GuardDuty is
  /// presently supported. For more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_regions.html">Regions
  /// and endpoints</a>.
  ///
  /// Parameter [enable] :
  /// Specifies whether the detector is enabled or not enabled.
  ///
  /// Parameter [features] :
  /// Provides the features that will be updated for the detector.
  ///
  /// Parameter [findingPublishingFrequency] :
  /// An enum value that specifies how frequently findings are exported, such as
  /// to CloudWatch Events.
  Future<void> updateDetector({
    required String detectorId,
    DataSourceConfigurations? dataSources,
    bool? enable,
    List<DetectorFeatureConfiguration>? features,
    FindingPublishingFrequency? findingPublishingFrequency,
  }) async {
    final $payload = <String, dynamic>{
      if (dataSources != null) 'dataSources': dataSources,
      if (enable != null) 'enable': enable,
      if (features != null) 'features': features,
      if (findingPublishingFrequency != null)
        'findingPublishingFrequency': findingPublishingFrequency.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the filter specified by the filter name.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector that specifies the GuardDuty service where
  /// you want to update a filter.
  ///
  /// Parameter [filterName] :
  /// The name of the filter.
  ///
  /// Parameter [action] :
  /// Specifies the action that is to be applied to the findings that match the
  /// filter.
  ///
  /// Parameter [description] :
  /// The description of the filter. Valid characters include alphanumeric
  /// characters, and special characters such as hyphen, period, colon,
  /// underscore, parentheses (<code>{ }</code>, <code>[ ]</code>, and <code>(
  /// )</code>), forward slash, horizontal tab, vertical tab, newline, form
  /// feed, return, and whitespace.
  ///
  /// Parameter [findingCriteria] :
  /// Represents the criteria to be used in the filter for querying findings.
  ///
  /// Parameter [rank] :
  /// Specifies the position of the filter in the list of current filters. Also
  /// specifies the order in which this filter is applied to the findings.
  Future<UpdateFilterResponse> updateFilter({
    required String detectorId,
    required String filterName,
    FilterAction? action,
    String? description,
    FindingCriteria? findingCriteria,
    int? rank,
  }) async {
    _s.validateNumRange(
      'rank',
      rank,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (action != null) 'action': action.value,
      if (description != null) 'description': description,
      if (findingCriteria != null) 'findingCriteria': findingCriteria,
      if (rank != null) 'rank': rank,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/filter/${Uri.encodeComponent(filterName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFilterResponse.fromJson(response);
  }

  /// Marks the specified GuardDuty findings as useful or not useful.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The ID of the detector associated with the findings to update feedback
  /// for.
  ///
  /// Parameter [feedback] :
  /// The feedback for the finding.
  ///
  /// Parameter [findingIds] :
  /// The IDs of the findings that you want to mark as useful or not useful.
  ///
  /// Parameter [comments] :
  /// Additional feedback about the GuardDuty findings.
  Future<void> updateFindingsFeedback({
    required String detectorId,
    required Feedback feedback,
    required List<String> findingIds,
    String? comments,
  }) async {
    final $payload = <String, dynamic>{
      'feedback': feedback.value,
      'findingIds': findingIds,
      if (comments != null) 'comments': comments,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/findings/feedback',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the IPSet specified by the IPSet ID.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The detectorID that specifies the GuardDuty service whose IPSet you want
  /// to update.
  ///
  /// Parameter [ipSetId] :
  /// The unique ID that specifies the IPSet that you want to update.
  ///
  /// Parameter [activate] :
  /// The updated Boolean value that specifies whether the IPSet is active or
  /// not.
  ///
  /// Parameter [location] :
  /// The updated URI of the file that contains the IPSet.
  ///
  /// Parameter [name] :
  /// The unique ID that specifies the IPSet that you want to update.
  Future<void> updateIPSet({
    required String detectorId,
    required String ipSetId,
    bool? activate,
    String? location,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (activate != null) 'activate': activate,
      if (location != null) 'location': location,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/ipset/${Uri.encodeComponent(ipSetId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the malware scan settings.
  ///
  /// There might be regional differences because some data sources might not be
  /// available in all the Amazon Web Services Regions where GuardDuty is
  /// presently supported. For more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_regions.html">Regions
  /// and endpoints</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector that specifies the GuardDuty service where
  /// you want to update scan settings.
  ///
  /// Parameter [ebsSnapshotPreservation] :
  /// An enum value representing possible snapshot preservation settings.
  ///
  /// Parameter [scanResourceCriteria] :
  /// Represents the criteria to be used in the filter for selecting resources
  /// to scan.
  Future<void> updateMalwareScanSettings({
    required String detectorId,
    EbsSnapshotPreservation? ebsSnapshotPreservation,
    ScanResourceCriteria? scanResourceCriteria,
  }) async {
    final $payload = <String, dynamic>{
      if (ebsSnapshotPreservation != null)
        'ebsSnapshotPreservation': ebsSnapshotPreservation.value,
      if (scanResourceCriteria != null)
        'scanResourceCriteria': scanResourceCriteria,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/malware-scan-settings',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Contains information on member accounts to be updated.
  ///
  /// Specifying both EKS Runtime Monitoring
  /// (<code>EKS_RUNTIME_MONITORING</code>) and Runtime Monitoring
  /// (<code>RUNTIME_MONITORING</code>) will cause an error. You can add only
  /// one of these two features because Runtime Monitoring already includes the
  /// threat detection for Amazon EKS resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/runtime-monitoring.html">Runtime
  /// Monitoring</a>.
  ///
  /// There might be regional differences because some data sources might not be
  /// available in all the Amazon Web Services Regions where GuardDuty is
  /// presently supported. For more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_regions.html">Regions
  /// and endpoints</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [accountIds] :
  /// A list of member account IDs to be updated.
  ///
  /// Parameter [detectorId] :
  /// The detector ID of the administrator account.
  ///
  /// Parameter [dataSources] :
  /// Describes which data sources will be updated.
  ///
  /// Parameter [features] :
  /// A list of features that will be updated for the specified member accounts.
  Future<UpdateMemberDetectorsResponse> updateMemberDetectors({
    required List<String> accountIds,
    required String detectorId,
    DataSourceConfigurations? dataSources,
    List<MemberFeaturesConfiguration>? features,
  }) async {
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
      if (dataSources != null) 'dataSources': dataSources,
      if (features != null) 'features': features,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/member/detector/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMemberDetectorsResponse.fromJson(response);
  }

  /// Configures the delegated administrator account with the provided values.
  /// You must provide a value for either
  /// <code>autoEnableOrganizationMembers</code> or <code>autoEnable</code>, but
  /// not both.
  ///
  /// Specifying both EKS Runtime Monitoring
  /// (<code>EKS_RUNTIME_MONITORING</code>) and Runtime Monitoring
  /// (<code>RUNTIME_MONITORING</code>) will cause an error. You can add only
  /// one of these two features because Runtime Monitoring already includes the
  /// threat detection for Amazon EKS resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/runtime-monitoring.html">Runtime
  /// Monitoring</a>.
  ///
  /// There might be regional differences because some data sources might not be
  /// available in all the Amazon Web Services Regions where GuardDuty is
  /// presently supported. For more information, see <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/ug/guardduty_regions.html">Regions
  /// and endpoints</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The ID of the detector that configures the delegated administrator.
  ///
  /// Parameter [autoEnable] :
  /// Represents whether or not to automatically enable member accounts in the
  /// organization.
  ///
  /// Even though this is still supported, we recommend using
  /// <code>AutoEnableOrganizationMembers</code> to achieve the similar results.
  /// You must provide a value for either
  /// <code>autoEnableOrganizationMembers</code> or <code>autoEnable</code>.
  ///
  /// Parameter [autoEnableOrganizationMembers] :
  /// Indicates the auto-enablement configuration of GuardDuty for the member
  /// accounts in the organization. You must provide a value for either
  /// <code>autoEnableOrganizationMembers</code> or <code>autoEnable</code>.
  ///
  /// Use one of the following configuration values for
  /// <code>autoEnableOrganizationMembers</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>NEW</code>: Indicates that when a new account joins the
  /// organization, they will have GuardDuty enabled automatically.
  /// </li>
  /// <li>
  /// <code>ALL</code>: Indicates that all accounts in the organization have
  /// GuardDuty enabled automatically. This includes <code>NEW</code> accounts
  /// that join the organization and accounts that may have been suspended or
  /// removed from the organization in GuardDuty.
  ///
  /// It may take up to 24 hours to update the configuration for all the member
  /// accounts.
  /// </li>
  /// <li>
  /// <code>NONE</code>: Indicates that GuardDuty will not be automatically
  /// enabled for any account in the organization. The administrator must manage
  /// GuardDuty for each account in the organization individually.
  ///
  /// When you update the auto-enable setting from <code>ALL</code> or
  /// <code>NEW</code> to <code>NONE</code>, this action doesn't disable the
  /// corresponding option for your existing accounts. This configuration will
  /// apply to the new accounts that join the organization. After you update the
  /// auto-enable settings, no new account will have the corresponding option as
  /// enabled.
  /// </li>
  /// </ul>
  ///
  /// Parameter [dataSources] :
  /// Describes which data sources will be updated.
  ///
  /// Parameter [features] :
  /// A list of features that will be configured for the organization.
  Future<void> updateOrganizationConfiguration({
    required String detectorId,
    bool? autoEnable,
    AutoEnableMembers? autoEnableOrganizationMembers,
    OrganizationDataSourceConfigurations? dataSources,
    List<OrganizationFeatureConfiguration>? features,
  }) async {
    final $payload = <String, dynamic>{
      if (autoEnable != null) 'autoEnable': autoEnable,
      if (autoEnableOrganizationMembers != null)
        'autoEnableOrganizationMembers': autoEnableOrganizationMembers.value,
      if (dataSources != null) 'dataSources': dataSources,
      if (features != null) 'features': features,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/admin',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates information about the publishing destination specified by the
  /// <code>destinationId</code>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [destinationId] :
  /// The ID of the publishing destination to update.
  ///
  /// Parameter [detectorId] :
  /// The ID of the detector associated with the publishing destinations to
  /// update.
  ///
  /// Parameter [destinationProperties] :
  /// A <code>DestinationProperties</code> object that includes the
  /// <code>DestinationArn</code> and <code>KmsKeyArn</code> of the publishing
  /// destination.
  Future<void> updatePublishingDestination({
    required String destinationId,
    required String detectorId,
    DestinationProperties? destinationProperties,
  }) async {
    final $payload = <String, dynamic>{
      if (destinationProperties != null)
        'destinationProperties': destinationProperties,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/publishingDestination/${Uri.encodeComponent(destinationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the ThreatIntelSet specified by the ThreatIntelSet ID.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The detectorID that specifies the GuardDuty service whose ThreatIntelSet
  /// you want to update.
  ///
  /// Parameter [threatIntelSetId] :
  /// The unique ID that specifies the ThreatIntelSet that you want to update.
  ///
  /// Parameter [activate] :
  /// The updated Boolean value that specifies whether the ThreateIntelSet is
  /// active or not.
  ///
  /// Parameter [location] :
  /// The updated URI of the file that contains the ThreateIntelSet.
  ///
  /// Parameter [name] :
  /// The unique ID that specifies the ThreatIntelSet that you want to update.
  Future<void> updateThreatIntelSet({
    required String detectorId,
    required String threatIntelSetId,
    bool? activate,
    String? location,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (activate != null) 'activate': activate,
      if (location != null) 'location': location,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/threatintelset/${Uri.encodeComponent(threatIntelSetId)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

class AcceptAdministratorInvitationResponse {
  AcceptAdministratorInvitationResponse();

  factory AcceptAdministratorInvitationResponse.fromJson(
      Map<String, dynamic> _) {
    return AcceptAdministratorInvitationResponse();
  }
}

@Deprecated(
    'This output is deprecated, use AcceptAdministratorInvitationResponse instead')
class AcceptInvitationResponse {
  AcceptInvitationResponse();

  factory AcceptInvitationResponse.fromJson(Map<String, dynamic> _) {
    return AcceptInvitationResponse();
  }
}

/// Contains information on the current access control policies for the bucket.
class AccessControlList {
  /// A value that indicates whether public read access for the bucket is enabled
  /// through an Access Control List (ACL).
  final bool? allowsPublicReadAccess;

  /// A value that indicates whether public write access for the bucket is enabled
  /// through an Access Control List (ACL).
  final bool? allowsPublicWriteAccess;

  AccessControlList({
    this.allowsPublicReadAccess,
    this.allowsPublicWriteAccess,
  });

  factory AccessControlList.fromJson(Map<String, dynamic> json) {
    return AccessControlList(
      allowsPublicReadAccess: json['allowsPublicReadAccess'] as bool?,
      allowsPublicWriteAccess: json['allowsPublicWriteAccess'] as bool?,
    );
  }
}

/// Contains information about the access keys.
class AccessKeyDetails {
  /// The access key ID of the user.
  final String? accessKeyId;

  /// The principal ID of the user.
  final String? principalId;

  /// The name of the user.
  final String? userName;

  /// The type of the user.
  final String? userType;

  AccessKeyDetails({
    this.accessKeyId,
    this.principalId,
    this.userName,
    this.userType,
  });

  factory AccessKeyDetails.fromJson(Map<String, dynamic> json) {
    return AccessKeyDetails(
      accessKeyId: json['accessKeyId'] as String?,
      principalId: json['principalId'] as String?,
      userName: json['userName'] as String?,
      userType: json['userType'] as String?,
    );
  }
}

/// Contains information about the account.
class AccountDetail {
  /// The member account ID.
  final String accountId;

  /// The email address of the member account.
  final String email;

  AccountDetail({
    required this.accountId,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final email = this.email;
    return {
      'accountId': accountId,
      'email': email,
    };
  }
}

/// Provides details of the GuardDuty member account that uses a free trial
/// service.
class AccountFreeTrialInfo {
  /// The account identifier of the GuardDuty member account.
  final String? accountId;

  /// Describes the data source enabled for the GuardDuty member account.
  final DataSourcesFreeTrial? dataSources;

  /// A list of features enabled for the GuardDuty account.
  final List<FreeTrialFeatureConfigurationResult>? features;

  AccountFreeTrialInfo({
    this.accountId,
    this.dataSources,
    this.features,
  });

  factory AccountFreeTrialInfo.fromJson(Map<String, dynamic> json) {
    return AccountFreeTrialInfo(
      accountId: json['accountId'] as String?,
      dataSources: json['dataSources'] != null
          ? DataSourcesFreeTrial.fromJson(
              json['dataSources'] as Map<String, dynamic>)
          : null,
      features: (json['features'] as List?)
          ?.whereNotNull()
          .map((e) => FreeTrialFeatureConfigurationResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Contains information about the account level permissions on the S3 bucket.
class AccountLevelPermissions {
  /// Describes the S3 Block Public Access settings of the bucket's parent
  /// account.
  final BlockPublicAccess? blockPublicAccess;

  AccountLevelPermissions({
    this.blockPublicAccess,
  });

  factory AccountLevelPermissions.fromJson(Map<String, dynamic> json) {
    return AccountLevelPermissions(
      blockPublicAccess: json['blockPublicAccess'] != null
          ? BlockPublicAccess.fromJson(
              json['blockPublicAccess'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains information about actions.
class Action {
  /// The GuardDuty finding activity type.
  final String? actionType;

  /// Information about the AWS_API_CALL action described in this finding.
  final AwsApiCallAction? awsApiCallAction;

  /// Information about the DNS_REQUEST action described in this finding.
  final DnsRequestAction? dnsRequestAction;

  /// Information about the Kubernetes API call action described in this finding.
  final KubernetesApiCallAction? kubernetesApiCallAction;

  /// Information whether the user has the permission to use a specific Kubernetes
  /// API.
  final KubernetesPermissionCheckedDetails? kubernetesPermissionCheckedDetails;

  /// Information about the role binding that grants the permission defined in a
  /// Kubernetes role.
  final KubernetesRoleBindingDetails? kubernetesRoleBindingDetails;

  /// Information about the Kubernetes role name and role type.
  final KubernetesRoleDetails? kubernetesRoleDetails;

  /// Information about the NETWORK_CONNECTION action described in this finding.
  final NetworkConnectionAction? networkConnectionAction;

  /// Information about the PORT_PROBE action described in this finding.
  final PortProbeAction? portProbeAction;

  /// Information about <code>RDS_LOGIN_ATTEMPT</code> action described in this
  /// finding.
  final RdsLoginAttemptAction? rdsLoginAttemptAction;

  Action({
    this.actionType,
    this.awsApiCallAction,
    this.dnsRequestAction,
    this.kubernetesApiCallAction,
    this.kubernetesPermissionCheckedDetails,
    this.kubernetesRoleBindingDetails,
    this.kubernetesRoleDetails,
    this.networkConnectionAction,
    this.portProbeAction,
    this.rdsLoginAttemptAction,
  });

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
      actionType: json['actionType'] as String?,
      awsApiCallAction: json['awsApiCallAction'] != null
          ? AwsApiCallAction.fromJson(
              json['awsApiCallAction'] as Map<String, dynamic>)
          : null,
      dnsRequestAction: json['dnsRequestAction'] != null
          ? DnsRequestAction.fromJson(
              json['dnsRequestAction'] as Map<String, dynamic>)
          : null,
      kubernetesApiCallAction: json['kubernetesApiCallAction'] != null
          ? KubernetesApiCallAction.fromJson(
              json['kubernetesApiCallAction'] as Map<String, dynamic>)
          : null,
      kubernetesPermissionCheckedDetails:
          json['kubernetesPermissionCheckedDetails'] != null
              ? KubernetesPermissionCheckedDetails.fromJson(
                  json['kubernetesPermissionCheckedDetails']
                      as Map<String, dynamic>)
              : null,
      kubernetesRoleBindingDetails: json['kubernetesRoleBindingDetails'] != null
          ? KubernetesRoleBindingDetails.fromJson(
              json['kubernetesRoleBindingDetails'] as Map<String, dynamic>)
          : null,
      kubernetesRoleDetails: json['kubernetesRoleDetails'] != null
          ? KubernetesRoleDetails.fromJson(
              json['kubernetesRoleDetails'] as Map<String, dynamic>)
          : null,
      networkConnectionAction: json['networkConnectionAction'] != null
          ? NetworkConnectionAction.fromJson(
              json['networkConnectionAction'] as Map<String, dynamic>)
          : null,
      portProbeAction: json['portProbeAction'] != null
          ? PortProbeAction.fromJson(
              json['portProbeAction'] as Map<String, dynamic>)
          : null,
      rdsLoginAttemptAction: json['rdsLoginAttemptAction'] != null
          ? RdsLoginAttemptAction.fromJson(
              json['rdsLoginAttemptAction'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Information about the installed EKS add-on (GuardDuty security agent).
class AddonDetails {
  /// Status of the installed EKS add-on.
  final String? addonStatus;

  /// Version of the installed EKS add-on.
  final String? addonVersion;

  AddonDetails({
    this.addonStatus,
    this.addonVersion,
  });

  factory AddonDetails.fromJson(Map<String, dynamic> json) {
    return AddonDetails(
      addonStatus: json['addonStatus'] as String?,
      addonVersion: json['addonVersion'] as String?,
    );
  }
}

/// The account within the organization specified as the GuardDuty delegated
/// administrator.
class AdminAccount {
  /// The Amazon Web Services account ID for the account.
  final String? adminAccountId;

  /// Indicates whether the account is enabled as the delegated administrator.
  final AdminStatus? adminStatus;

  AdminAccount({
    this.adminAccountId,
    this.adminStatus,
  });

  factory AdminAccount.fromJson(Map<String, dynamic> json) {
    return AdminAccount(
      adminAccountId: json['adminAccountId'] as String?,
      adminStatus:
          (json['adminStatus'] as String?)?.let(AdminStatus.fromString),
    );
  }
}

enum AdminStatus {
  enabled('ENABLED'),
  disableInProgress('DISABLE_IN_PROGRESS'),
  ;

  final String value;

  const AdminStatus(this.value);

  static AdminStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum AdminStatus'));
}

/// Contains information about the administrator account and invitation.
class Administrator {
  /// The ID of the account used as the administrator account.
  final String? accountId;

  /// The value that is used to validate the administrator account to the member
  /// account.
  final String? invitationId;

  /// The timestamp when the invitation was sent.
  final String? invitedAt;

  /// The status of the relationship between the administrator and member
  /// accounts.
  final String? relationshipStatus;

  Administrator({
    this.accountId,
    this.invitationId,
    this.invitedAt,
    this.relationshipStatus,
  });

  factory Administrator.fromJson(Map<String, dynamic> json) {
    return Administrator(
      accountId: json['accountId'] as String?,
      invitationId: json['invitationId'] as String?,
      invitedAt: json['invitedAt'] as String?,
      relationshipStatus: json['relationshipStatus'] as String?,
    );
  }
}

/// Information about the installed GuardDuty security agent.
class AgentDetails {
  /// Version of the installed GuardDuty security agent.
  final String? version;

  AgentDetails({
    this.version,
  });

  factory AgentDetails.fromJson(Map<String, dynamic> json) {
    return AgentDetails(
      version: json['version'] as String?,
    );
  }
}

/// Contains information about the anomalies.
class Anomaly {
  /// Information about the types of profiles.
  final Map<String, Map<String, List<AnomalyObject>>>? profiles;

  /// Information about the behavior of the anomalies.
  final AnomalyUnusual? unusual;

  Anomaly({
    this.profiles,
    this.unusual,
  });

  factory Anomaly.fromJson(Map<String, dynamic> json) {
    return Anomaly(
      profiles: (json['profiles'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              (e as Map<String, dynamic>).map((k, e) => MapEntry(
                  k,
                  (e as List)
                      .whereNotNull()
                      .map((e) =>
                          AnomalyObject.fromJson(e as Map<String, dynamic>))
                      .toList())))),
      unusual: json['unusual'] != null
          ? AnomalyUnusual.fromJson(json['unusual'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains information about the unusual anomalies.
class AnomalyObject {
  /// The recorded value.
  final Observations? observations;

  /// The frequency of the anomaly.
  final ProfileSubtype? profileSubtype;

  /// The type of behavior of the profile.
  final ProfileType? profileType;

  AnomalyObject({
    this.observations,
    this.profileSubtype,
    this.profileType,
  });

  factory AnomalyObject.fromJson(Map<String, dynamic> json) {
    return AnomalyObject(
      observations: json['observations'] != null
          ? Observations.fromJson(json['observations'] as Map<String, dynamic>)
          : null,
      profileSubtype:
          (json['profileSubtype'] as String?)?.let(ProfileSubtype.fromString),
      profileType:
          (json['profileType'] as String?)?.let(ProfileType.fromString),
    );
  }
}

/// Contains information about the behavior of the anomaly that is new to
/// GuardDuty.
class AnomalyUnusual {
  /// The behavior of the anomalous activity that caused GuardDuty to generate the
  /// finding.
  final Map<String, Map<String, AnomalyObject>>? behavior;

  AnomalyUnusual({
    this.behavior,
  });

  factory AnomalyUnusual.fromJson(Map<String, dynamic> json) {
    return AnomalyUnusual(
      behavior: (json['behavior'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              (e as Map<String, dynamic>).map((k, e) => MapEntry(
                  k, AnomalyObject.fromJson(e as Map<String, dynamic>))))),
    );
  }
}

class ArchiveFindingsResponse {
  ArchiveFindingsResponse();

  factory ArchiveFindingsResponse.fromJson(Map<String, dynamic> _) {
    return ArchiveFindingsResponse();
  }
}

enum AutoEnableMembers {
  $new('NEW'),
  all('ALL'),
  none('NONE'),
  ;

  final String value;

  const AutoEnableMembers(this.value);

  static AutoEnableMembers fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum AutoEnableMembers'));
}

/// Contains information about the API action.
class AwsApiCallAction {
  /// The details of the Amazon Web Services account that made the API call. This
  /// field identifies the resources that were affected by this API call.
  final Map<String, String>? affectedResources;

  /// The Amazon Web Services API name.
  final String? api;

  /// The Amazon Web Services API caller type.
  final String? callerType;

  /// The domain information for the Amazon Web Services API call.
  final DomainDetails? domainDetails;

  /// The error code of the failed Amazon Web Services API action.
  final String? errorCode;

  /// The details of the Amazon Web Services account that made the API call. This
  /// field appears if the call was made from outside your account.
  final RemoteAccountDetails? remoteAccountDetails;

  /// The remote IP information of the connection that initiated the Amazon Web
  /// Services API call.
  final RemoteIpDetails? remoteIpDetails;

  /// The Amazon Web Services service name whose API was invoked.
  final String? serviceName;

  /// The agent through which the API request was made.
  final String? userAgent;

  AwsApiCallAction({
    this.affectedResources,
    this.api,
    this.callerType,
    this.domainDetails,
    this.errorCode,
    this.remoteAccountDetails,
    this.remoteIpDetails,
    this.serviceName,
    this.userAgent,
  });

  factory AwsApiCallAction.fromJson(Map<String, dynamic> json) {
    return AwsApiCallAction(
      affectedResources: (json['affectedResources'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      api: json['api'] as String?,
      callerType: json['callerType'] as String?,
      domainDetails: json['domainDetails'] != null
          ? DomainDetails.fromJson(
              json['domainDetails'] as Map<String, dynamic>)
          : null,
      errorCode: json['errorCode'] as String?,
      remoteAccountDetails: json['remoteAccountDetails'] != null
          ? RemoteAccountDetails.fromJson(
              json['remoteAccountDetails'] as Map<String, dynamic>)
          : null,
      remoteIpDetails: json['remoteIpDetails'] != null
          ? RemoteIpDetails.fromJson(
              json['remoteIpDetails'] as Map<String, dynamic>)
          : null,
      serviceName: json['serviceName'] as String?,
      userAgent: json['userAgent'] as String?,
    );
  }
}

/// Contains information on how the bucker owner's S3 Block Public Access
/// settings are being applied to the S3 bucket. See <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html">S3
/// Block Public Access</a> for more information.
class BlockPublicAccess {
  /// Indicates if S3 Block Public Access is set to <code>BlockPublicAcls</code>.
  final bool? blockPublicAcls;

  /// Indicates if S3 Block Public Access is set to
  /// <code>BlockPublicPolicy</code>.
  final bool? blockPublicPolicy;

  /// Indicates if S3 Block Public Access is set to <code>IgnorePublicAcls</code>.
  final bool? ignorePublicAcls;

  /// Indicates if S3 Block Public Access is set to
  /// <code>RestrictPublicBuckets</code>.
  final bool? restrictPublicBuckets;

  BlockPublicAccess({
    this.blockPublicAcls,
    this.blockPublicPolicy,
    this.ignorePublicAcls,
    this.restrictPublicBuckets,
  });

  factory BlockPublicAccess.fromJson(Map<String, dynamic> json) {
    return BlockPublicAccess(
      blockPublicAcls: json['blockPublicAcls'] as bool?,
      blockPublicPolicy: json['blockPublicPolicy'] as bool?,
      ignorePublicAcls: json['ignorePublicAcls'] as bool?,
      restrictPublicBuckets: json['restrictPublicBuckets'] as bool?,
    );
  }
}

/// Contains information about the bucket level permissions for the S3 bucket.
class BucketLevelPermissions {
  /// Contains information on how Access Control Policies are applied to the
  /// bucket.
  final AccessControlList? accessControlList;

  /// Contains information on which account level S3 Block Public Access settings
  /// are applied to the S3 bucket.
  final BlockPublicAccess? blockPublicAccess;

  /// Contains information on the bucket policies for the S3 bucket.
  final BucketPolicy? bucketPolicy;

  BucketLevelPermissions({
    this.accessControlList,
    this.blockPublicAccess,
    this.bucketPolicy,
  });

  factory BucketLevelPermissions.fromJson(Map<String, dynamic> json) {
    return BucketLevelPermissions(
      accessControlList: json['accessControlList'] != null
          ? AccessControlList.fromJson(
              json['accessControlList'] as Map<String, dynamic>)
          : null,
      blockPublicAccess: json['blockPublicAccess'] != null
          ? BlockPublicAccess.fromJson(
              json['blockPublicAccess'] as Map<String, dynamic>)
          : null,
      bucketPolicy: json['bucketPolicy'] != null
          ? BucketPolicy.fromJson(json['bucketPolicy'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains information on the current bucket policies for the S3 bucket.
class BucketPolicy {
  /// A value that indicates whether public read access for the bucket is enabled
  /// through a bucket policy.
  final bool? allowsPublicReadAccess;

  /// A value that indicates whether public write access for the bucket is enabled
  /// through a bucket policy.
  final bool? allowsPublicWriteAccess;

  BucketPolicy({
    this.allowsPublicReadAccess,
    this.allowsPublicWriteAccess,
  });

  factory BucketPolicy.fromJson(Map<String, dynamic> json) {
    return BucketPolicy(
      allowsPublicReadAccess: json['allowsPublicReadAccess'] as bool?,
      allowsPublicWriteAccess: json['allowsPublicWriteAccess'] as bool?,
    );
  }
}

/// Contains information about the city associated with the IP address.
class City {
  /// The city name of the remote IP address.
  final String? cityName;

  City({
    this.cityName,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityName: json['cityName'] as String?,
    );
  }
}

/// Contains information on the status of CloudTrail as a data source for the
/// detector.
class CloudTrailConfigurationResult {
  /// Describes whether CloudTrail is enabled as a data source for the detector.
  final DataSourceStatus status;

  CloudTrailConfigurationResult({
    required this.status,
  });

  factory CloudTrailConfigurationResult.fromJson(Map<String, dynamic> json) {
    return CloudTrailConfigurationResult(
      status: DataSourceStatus.fromString((json['status'] as String)),
    );
  }
}

/// Contains information about the condition.
class Condition {
  /// Represents the <i>equal</i> condition to be applied to a single field when
  /// querying for findings.
  final List<String>? eq;

  /// Represents an <i>equal</i> <b/> condition to be applied to a single field
  /// when querying for findings.
  final List<String>? equals;

  /// Represents a <i>greater than</i> condition to be applied to a single field
  /// when querying for findings.
  final int? greaterThan;

  /// Represents a <i>greater than or equal</i> condition to be applied to a
  /// single field when querying for findings.
  final int? greaterThanOrEqual;

  /// Represents a <i>greater than</i> condition to be applied to a single field
  /// when querying for findings.
  final int? gt;

  /// Represents a <i>greater than or equal</i> condition to be applied to a
  /// single field when querying for findings.
  final int? gte;

  /// Represents a <i>less than</i> condition to be applied to a single field when
  /// querying for findings.
  final int? lessThan;

  /// Represents a <i>less than or equal</i> condition to be applied to a single
  /// field when querying for findings.
  final int? lessThanOrEqual;

  /// Represents a <i>less than</i> condition to be applied to a single field when
  /// querying for findings.
  final int? lt;

  /// Represents a <i>less than or equal</i> condition to be applied to a single
  /// field when querying for findings.
  final int? lte;

  /// Represents the <i>not equal</i> condition to be applied to a single field
  /// when querying for findings.
  final List<String>? neq;

  /// Represents a <i>not equal</i> <b/> condition to be applied to a single field
  /// when querying for findings.
  final List<String>? notEquals;

  Condition({
    this.eq,
    this.equals,
    this.greaterThan,
    this.greaterThanOrEqual,
    this.gt,
    this.gte,
    this.lessThan,
    this.lessThanOrEqual,
    this.lt,
    this.lte,
    this.neq,
    this.notEquals,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      eq: (json['eq'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      equals: (json['equals'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      greaterThan: json['greaterThan'] as int?,
      greaterThanOrEqual: json['greaterThanOrEqual'] as int?,
      gt: json['gt'] as int?,
      gte: json['gte'] as int?,
      lessThan: json['lessThan'] as int?,
      lessThanOrEqual: json['lessThanOrEqual'] as int?,
      lt: json['lt'] as int?,
      lte: json['lte'] as int?,
      neq: (json['neq'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      notEquals: (json['notEquals'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final eq = this.eq;
    final equals = this.equals;
    final greaterThan = this.greaterThan;
    final greaterThanOrEqual = this.greaterThanOrEqual;
    final gt = this.gt;
    final gte = this.gte;
    final lessThan = this.lessThan;
    final lessThanOrEqual = this.lessThanOrEqual;
    final lt = this.lt;
    final lte = this.lte;
    final neq = this.neq;
    final notEquals = this.notEquals;
    return {
      if (eq != null) 'eq': eq,
      if (equals != null) 'equals': equals,
      if (greaterThan != null) 'greaterThan': greaterThan,
      if (greaterThanOrEqual != null) 'greaterThanOrEqual': greaterThanOrEqual,
      if (gt != null) 'gt': gt,
      if (gte != null) 'gte': gte,
      if (lessThan != null) 'lessThan': lessThan,
      if (lessThanOrEqual != null) 'lessThanOrEqual': lessThanOrEqual,
      if (lt != null) 'lt': lt,
      if (lte != null) 'lte': lte,
      if (neq != null) 'neq': neq,
      if (notEquals != null) 'notEquals': notEquals,
    };
  }
}

/// Details of a container.
class Container {
  /// The container runtime (such as, Docker or containerd) used to run the
  /// container.
  final String? containerRuntime;

  /// Container ID.
  final String? id;

  /// Container image.
  final String? image;

  /// Part of the image name before the last slash. For example, imagePrefix for
  /// public.ecr.aws/amazonlinux/amazonlinux:latest would be
  /// public.ecr.aws/amazonlinux. If the image name is relative and does not have
  /// a slash, this field is empty.
  final String? imagePrefix;

  /// Container name.
  final String? name;

  /// Container security context.
  final SecurityContext? securityContext;

  /// Container volume mounts.
  final List<VolumeMount>? volumeMounts;

  Container({
    this.containerRuntime,
    this.id,
    this.image,
    this.imagePrefix,
    this.name,
    this.securityContext,
    this.volumeMounts,
  });

  factory Container.fromJson(Map<String, dynamic> json) {
    return Container(
      containerRuntime: json['containerRuntime'] as String?,
      id: json['id'] as String?,
      image: json['image'] as String?,
      imagePrefix: json['imagePrefix'] as String?,
      name: json['name'] as String?,
      securityContext: json['securityContext'] != null
          ? SecurityContext.fromJson(
              json['securityContext'] as Map<String, dynamic>)
          : null,
      volumeMounts: (json['volumeMounts'] as List?)
          ?.whereNotNull()
          .map((e) => VolumeMount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Contains information about the Amazon EC2 instance that is running the
/// Amazon ECS container.
class ContainerInstanceDetails {
  /// Represents total number of nodes in the Amazon ECS cluster.
  final int? compatibleContainerInstances;

  /// Represents the nodes in the Amazon ECS cluster that has a
  /// <code>HEALTHY</code> coverage status.
  final int? coveredContainerInstances;

  ContainerInstanceDetails({
    this.compatibleContainerInstances,
    this.coveredContainerInstances,
  });

  factory ContainerInstanceDetails.fromJson(Map<String, dynamic> json) {
    return ContainerInstanceDetails(
      compatibleContainerInstances:
          json['compatibleContainerInstances'] as int?,
      coveredContainerInstances: json['coveredContainerInstances'] as int?,
    );
  }
}

/// Contains information about the country where the remote IP address is
/// located.
class Country {
  /// The country code of the remote IP address.
  final String? countryCode;

  /// The country name of the remote IP address.
  final String? countryName;

  Country({
    this.countryCode,
    this.countryName,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      countryCode: json['countryCode'] as String?,
      countryName: json['countryName'] as String?,
    );
  }
}

/// Contains information about the Amazon EC2 instance runtime coverage details.
class CoverageEc2InstanceDetails {
  /// Information about the installed security agent.
  final AgentDetails? agentDetails;

  /// The cluster ARN of the Amazon ECS cluster running on the Amazon EC2
  /// instance.
  final String? clusterArn;

  /// The Amazon EC2 instance ID.
  final String? instanceId;

  /// The instance type of the Amazon EC2 instance.
  final String? instanceType;

  /// Indicates how the GuardDuty security agent is managed for this resource.
  ///
  /// <ul>
  /// <li>
  /// <code>AUTO_MANAGED</code> indicates that GuardDuty deploys and manages
  /// updates for this resource.
  /// </li>
  /// <li>
  /// <code>MANUAL</code> indicates that you are responsible to deploy, update,
  /// and manage the GuardDuty security agent updates for this resource.
  /// </li>
  /// </ul> <note>
  /// The <code>DISABLED</code> status doesn't apply to Amazon EC2 instances and
  /// Amazon EKS clusters.
  /// </note>
  final ManagementType? managementType;

  CoverageEc2InstanceDetails({
    this.agentDetails,
    this.clusterArn,
    this.instanceId,
    this.instanceType,
    this.managementType,
  });

  factory CoverageEc2InstanceDetails.fromJson(Map<String, dynamic> json) {
    return CoverageEc2InstanceDetails(
      agentDetails: json['agentDetails'] != null
          ? AgentDetails.fromJson(json['agentDetails'] as Map<String, dynamic>)
          : null,
      clusterArn: json['clusterArn'] as String?,
      instanceId: json['instanceId'] as String?,
      instanceType: json['instanceType'] as String?,
      managementType:
          (json['managementType'] as String?)?.let(ManagementType.fromString),
    );
  }
}

/// Contains information about Amazon ECS cluster runtime coverage details.
class CoverageEcsClusterDetails {
  /// The name of the Amazon ECS cluster.
  final String? clusterName;

  /// Information about the Amazon ECS container running on Amazon EC2 instance.
  final ContainerInstanceDetails? containerInstanceDetails;

  /// Information about the Fargate details associated with the Amazon ECS
  /// cluster.
  final FargateDetails? fargateDetails;

  CoverageEcsClusterDetails({
    this.clusterName,
    this.containerInstanceDetails,
    this.fargateDetails,
  });

  factory CoverageEcsClusterDetails.fromJson(Map<String, dynamic> json) {
    return CoverageEcsClusterDetails(
      clusterName: json['clusterName'] as String?,
      containerInstanceDetails: json['containerInstanceDetails'] != null
          ? ContainerInstanceDetails.fromJson(
              json['containerInstanceDetails'] as Map<String, dynamic>)
          : null,
      fargateDetails: json['fargateDetails'] != null
          ? FargateDetails.fromJson(
              json['fargateDetails'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Information about the EKS cluster that has a coverage status.
class CoverageEksClusterDetails {
  /// Information about the installed EKS add-on.
  final AddonDetails? addonDetails;

  /// Name of the EKS cluster.
  final String? clusterName;

  /// Represents all the nodes within the EKS cluster in your account.
  final int? compatibleNodes;

  /// Represents the nodes within the EKS cluster that have a <code>HEALTHY</code>
  /// coverage status.
  final int? coveredNodes;

  /// Indicates how the Amazon EKS add-on GuardDuty agent is managed for this EKS
  /// cluster.
  ///
  /// <code>AUTO_MANAGED</code> indicates GuardDuty deploys and manages updates
  /// for this resource.
  ///
  /// <code>MANUAL</code> indicates that you are responsible to deploy, update,
  /// and manage the Amazon EKS add-on GuardDuty agent for this resource.
  final ManagementType? managementType;

  CoverageEksClusterDetails({
    this.addonDetails,
    this.clusterName,
    this.compatibleNodes,
    this.coveredNodes,
    this.managementType,
  });

  factory CoverageEksClusterDetails.fromJson(Map<String, dynamic> json) {
    return CoverageEksClusterDetails(
      addonDetails: json['addonDetails'] != null
          ? AddonDetails.fromJson(json['addonDetails'] as Map<String, dynamic>)
          : null,
      clusterName: json['clusterName'] as String?,
      compatibleNodes: json['compatibleNodes'] as int?,
      coveredNodes: json['coveredNodes'] as int?,
      managementType:
          (json['managementType'] as String?)?.let(ManagementType.fromString),
    );
  }
}

/// Represents a condition that when matched will be added to the response of
/// the operation.
class CoverageFilterCondition {
  /// Represents an equal condition that is applied to a single field while
  /// retrieving the coverage details.
  final List<String>? equals;

  /// Represents a not equal condition that is applied to a single field while
  /// retrieving the coverage details.
  final List<String>? notEquals;

  CoverageFilterCondition({
    this.equals,
    this.notEquals,
  });

  Map<String, dynamic> toJson() {
    final equals = this.equals;
    final notEquals = this.notEquals;
    return {
      if (equals != null) 'equals': equals,
      if (notEquals != null) 'notEquals': notEquals,
    };
  }
}

/// Represents the criteria used in the filter.
class CoverageFilterCriteria {
  /// Represents a condition that when matched will be added to the response of
  /// the operation.
  final List<CoverageFilterCriterion>? filterCriterion;

  CoverageFilterCriteria({
    this.filterCriterion,
  });

  Map<String, dynamic> toJson() {
    final filterCriterion = this.filterCriterion;
    return {
      if (filterCriterion != null) 'filterCriterion': filterCriterion,
    };
  }
}

/// Represents a condition that when matched will be added to the response of
/// the operation.
class CoverageFilterCriterion {
  /// An enum value representing possible filter fields.
  /// <note>
  /// Replace the enum value <code>CLUSTER_NAME</code> with
  /// <code>EKS_CLUSTER_NAME</code>. <code>CLUSTER_NAME</code> has been
  /// deprecated.
  /// </note>
  final CoverageFilterCriterionKey? criterionKey;

  /// Contains information about the condition.
  final CoverageFilterCondition? filterCondition;

  CoverageFilterCriterion({
    this.criterionKey,
    this.filterCondition,
  });

  Map<String, dynamic> toJson() {
    final criterionKey = this.criterionKey;
    final filterCondition = this.filterCondition;
    return {
      if (criterionKey != null) 'criterionKey': criterionKey.value,
      if (filterCondition != null) 'filterCondition': filterCondition,
    };
  }
}

enum CoverageFilterCriterionKey {
  accountId('ACCOUNT_ID'),
  clusterName('CLUSTER_NAME'),
  resourceType('RESOURCE_TYPE'),
  coverageStatus('COVERAGE_STATUS'),
  addonVersion('ADDON_VERSION'),
  managementType('MANAGEMENT_TYPE'),
  eksClusterName('EKS_CLUSTER_NAME'),
  ecsClusterName('ECS_CLUSTER_NAME'),
  agentVersion('AGENT_VERSION'),
  instanceId('INSTANCE_ID'),
  clusterArn('CLUSTER_ARN'),
  ;

  final String value;

  const CoverageFilterCriterionKey(this.value);

  static CoverageFilterCriterionKey fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum CoverageFilterCriterionKey'));
}

/// Information about the resource of the GuardDuty account.
class CoverageResource {
  /// The unique ID of the Amazon Web Services account.
  final String? accountId;

  /// Represents the status of the EKS cluster coverage.
  final CoverageStatus? coverageStatus;

  /// The unique ID of the GuardDuty detector associated with the resource.
  final String? detectorId;

  /// Represents the reason why a coverage status was <code>UNHEALTHY</code> for
  /// the EKS cluster.
  final String? issue;

  /// Information about the resource for which the coverage statistics are
  /// retrieved.
  final CoverageResourceDetails? resourceDetails;

  /// The unique ID of the resource.
  final String? resourceId;

  /// The timestamp at which the coverage details for the resource were last
  /// updated. This is in UTC format.
  final DateTime? updatedAt;

  CoverageResource({
    this.accountId,
    this.coverageStatus,
    this.detectorId,
    this.issue,
    this.resourceDetails,
    this.resourceId,
    this.updatedAt,
  });

  factory CoverageResource.fromJson(Map<String, dynamic> json) {
    return CoverageResource(
      accountId: json['accountId'] as String?,
      coverageStatus:
          (json['coverageStatus'] as String?)?.let(CoverageStatus.fromString),
      detectorId: json['detectorId'] as String?,
      issue: json['issue'] as String?,
      resourceDetails: json['resourceDetails'] != null
          ? CoverageResourceDetails.fromJson(
              json['resourceDetails'] as Map<String, dynamic>)
          : null,
      resourceId: json['resourceId'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }
}

/// Information about the resource for each individual EKS cluster.
class CoverageResourceDetails {
  /// Information about the Amazon EC2 instance assessed for runtime coverage.
  final CoverageEc2InstanceDetails? ec2InstanceDetails;

  /// Information about the Amazon ECS cluster that is assessed for runtime
  /// coverage.
  final CoverageEcsClusterDetails? ecsClusterDetails;

  /// EKS cluster details involved in the coverage statistics.
  final CoverageEksClusterDetails? eksClusterDetails;

  /// The type of Amazon Web Services resource.
  final ResourceType? resourceType;

  CoverageResourceDetails({
    this.ec2InstanceDetails,
    this.ecsClusterDetails,
    this.eksClusterDetails,
    this.resourceType,
  });

  factory CoverageResourceDetails.fromJson(Map<String, dynamic> json) {
    return CoverageResourceDetails(
      ec2InstanceDetails: json['ec2InstanceDetails'] != null
          ? CoverageEc2InstanceDetails.fromJson(
              json['ec2InstanceDetails'] as Map<String, dynamic>)
          : null,
      ecsClusterDetails: json['ecsClusterDetails'] != null
          ? CoverageEcsClusterDetails.fromJson(
              json['ecsClusterDetails'] as Map<String, dynamic>)
          : null,
      eksClusterDetails: json['eksClusterDetails'] != null
          ? CoverageEksClusterDetails.fromJson(
              json['eksClusterDetails'] as Map<String, dynamic>)
          : null,
      resourceType:
          (json['resourceType'] as String?)?.let(ResourceType.fromString),
    );
  }
}

/// Information about the sorting criteria used in the coverage statistics.
class CoverageSortCriteria {
  /// Represents the field name used to sort the coverage details.
  /// <note>
  /// Replace the enum value <code>CLUSTER_NAME</code> with
  /// <code>EKS_CLUSTER_NAME</code>. <code>CLUSTER_NAME</code> has been
  /// deprecated.
  /// </note>
  final CoverageSortKey? attributeName;

  /// The order in which the sorted findings are to be displayed.
  final OrderBy? orderBy;

  CoverageSortCriteria({
    this.attributeName,
    this.orderBy,
  });

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final orderBy = this.orderBy;
    return {
      if (attributeName != null) 'attributeName': attributeName.value,
      if (orderBy != null) 'orderBy': orderBy.value,
    };
  }
}

enum CoverageSortKey {
  accountId('ACCOUNT_ID'),
  clusterName('CLUSTER_NAME'),
  coverageStatus('COVERAGE_STATUS'),
  issue('ISSUE'),
  addonVersion('ADDON_VERSION'),
  updatedAt('UPDATED_AT'),
  eksClusterName('EKS_CLUSTER_NAME'),
  ecsClusterName('ECS_CLUSTER_NAME'),
  instanceId('INSTANCE_ID'),
  ;

  final String value;

  const CoverageSortKey(this.value);

  static CoverageSortKey fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum CoverageSortKey'));
}

/// Information about the coverage statistics for a resource.
class CoverageStatistics {
  /// Represents coverage statistics for EKS clusters aggregated by coverage
  /// status.
  final Map<CoverageStatus, int>? countByCoverageStatus;

  /// Represents coverage statistics for EKS clusters aggregated by resource type.
  final Map<ResourceType, int>? countByResourceType;

  CoverageStatistics({
    this.countByCoverageStatus,
    this.countByResourceType,
  });

  factory CoverageStatistics.fromJson(Map<String, dynamic> json) {
    return CoverageStatistics(
      countByCoverageStatus:
          (json['countByCoverageStatus'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(CoverageStatus.fromString(k), e as int)),
      countByResourceType:
          (json['countByResourceType'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(ResourceType.fromString(k), e as int)),
    );
  }
}

enum CoverageStatisticsType {
  countByResourceType('COUNT_BY_RESOURCE_TYPE'),
  countByCoverageStatus('COUNT_BY_COVERAGE_STATUS'),
  ;

  final String value;

  const CoverageStatisticsType(this.value);

  static CoverageStatisticsType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum CoverageStatisticsType'));
}

enum CoverageStatus {
  healthy('HEALTHY'),
  unhealthy('UNHEALTHY'),
  ;

  final String value;

  const CoverageStatus(this.value);

  static CoverageStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum CoverageStatus'));
}

class CreateDetectorResponse {
  /// The unique ID of the created detector.
  final String? detectorId;

  /// Specifies the data sources that couldn't be enabled when GuardDuty was
  /// enabled for the first time.
  final UnprocessedDataSourcesResult? unprocessedDataSources;

  CreateDetectorResponse({
    this.detectorId,
    this.unprocessedDataSources,
  });

  factory CreateDetectorResponse.fromJson(Map<String, dynamic> json) {
    return CreateDetectorResponse(
      detectorId: json['detectorId'] as String?,
      unprocessedDataSources: json['unprocessedDataSources'] != null
          ? UnprocessedDataSourcesResult.fromJson(
              json['unprocessedDataSources'] as Map<String, dynamic>)
          : null,
    );
  }
}

class CreateFilterResponse {
  /// The name of the successfully created filter.
  final String name;

  CreateFilterResponse({
    required this.name,
  });

  factory CreateFilterResponse.fromJson(Map<String, dynamic> json) {
    return CreateFilterResponse(
      name: json['name'] as String,
    );
  }
}

class CreateIPSetResponse {
  /// The ID of the IPSet resource.
  final String ipSetId;

  CreateIPSetResponse({
    required this.ipSetId,
  });

  factory CreateIPSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateIPSetResponse(
      ipSetId: json['ipSetId'] as String,
    );
  }
}

class CreateMembersResponse {
  /// A list of objects that include the <code>accountIds</code> of the
  /// unprocessed accounts and a result string that explains why each was
  /// unprocessed.
  final List<UnprocessedAccount> unprocessedAccounts;

  CreateMembersResponse({
    required this.unprocessedAccounts,
  });

  factory CreateMembersResponse.fromJson(Map<String, dynamic> json) {
    return CreateMembersResponse(
      unprocessedAccounts: (json['unprocessedAccounts'] as List)
          .whereNotNull()
          .map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class CreatePublishingDestinationResponse {
  /// The ID of the publishing destination that is created.
  final String destinationId;

  CreatePublishingDestinationResponse({
    required this.destinationId,
  });

  factory CreatePublishingDestinationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreatePublishingDestinationResponse(
      destinationId: json['destinationId'] as String,
    );
  }
}

class CreateSampleFindingsResponse {
  CreateSampleFindingsResponse();

  factory CreateSampleFindingsResponse.fromJson(Map<String, dynamic> _) {
    return CreateSampleFindingsResponse();
  }
}

class CreateThreatIntelSetResponse {
  /// The ID of the ThreatIntelSet resource.
  final String threatIntelSetId;

  CreateThreatIntelSetResponse({
    required this.threatIntelSetId,
  });

  factory CreateThreatIntelSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateThreatIntelSetResponse(
      threatIntelSetId: json['threatIntelSetId'] as String,
    );
  }
}

enum CriterionKey {
  ec2InstanceArn('EC2_INSTANCE_ARN'),
  scanId('SCAN_ID'),
  accountId('ACCOUNT_ID'),
  guarddutyFindingId('GUARDDUTY_FINDING_ID'),
  scanStartTime('SCAN_START_TIME'),
  scanStatus('SCAN_STATUS'),
  scanType('SCAN_TYPE'),
  ;

  final String value;

  const CriterionKey(this.value);

  static CriterionKey fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum CriterionKey'));
}

/// Contains information on the status of DNS logs as a data source.
class DNSLogsConfigurationResult {
  /// Denotes whether DNS logs is enabled as a data source.
  final DataSourceStatus status;

  DNSLogsConfigurationResult({
    required this.status,
  });

  factory DNSLogsConfigurationResult.fromJson(Map<String, dynamic> json) {
    return DNSLogsConfigurationResult(
      status: DataSourceStatus.fromString((json['status'] as String)),
    );
  }
}

enum DataSource {
  flowLogs('FLOW_LOGS'),
  cloudTrail('CLOUD_TRAIL'),
  dnsLogs('DNS_LOGS'),
  s3Logs('S3_LOGS'),
  kubernetesAuditLogs('KUBERNETES_AUDIT_LOGS'),
  ec2MalwareScan('EC2_MALWARE_SCAN'),
  ;

  final String value;

  const DataSource(this.value);

  static DataSource fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum DataSource'));
}

/// Contains information about which data sources are enabled.
class DataSourceConfigurations {
  /// Describes whether any Kubernetes logs are enabled as data sources.
  final KubernetesConfiguration? kubernetes;

  /// Describes whether Malware Protection is enabled as a data source.
  final MalwareProtectionConfiguration? malwareProtection;

  /// Describes whether S3 data event logs are enabled as a data source.
  final S3LogsConfiguration? s3Logs;

  DataSourceConfigurations({
    this.kubernetes,
    this.malwareProtection,
    this.s3Logs,
  });

  Map<String, dynamic> toJson() {
    final kubernetes = this.kubernetes;
    final malwareProtection = this.malwareProtection;
    final s3Logs = this.s3Logs;
    return {
      if (kubernetes != null) 'kubernetes': kubernetes,
      if (malwareProtection != null) 'malwareProtection': malwareProtection,
      if (s3Logs != null) 's3Logs': s3Logs,
    };
  }
}

/// Contains information on the status of data sources for the detector.
class DataSourceConfigurationsResult {
  /// An object that contains information on the status of CloudTrail as a data
  /// source.
  final CloudTrailConfigurationResult cloudTrail;

  /// An object that contains information on the status of DNS logs as a data
  /// source.
  final DNSLogsConfigurationResult dNSLogs;

  /// An object that contains information on the status of VPC flow logs as a data
  /// source.
  final FlowLogsConfigurationResult flowLogs;

  /// An object that contains information on the status of S3 Data event logs as a
  /// data source.
  final S3LogsConfigurationResult s3Logs;

  /// An object that contains information on the status of all Kubernetes data
  /// sources.
  final KubernetesConfigurationResult? kubernetes;

  /// Describes the configuration of Malware Protection data sources.
  final MalwareProtectionConfigurationResult? malwareProtection;

  DataSourceConfigurationsResult({
    required this.cloudTrail,
    required this.dNSLogs,
    required this.flowLogs,
    required this.s3Logs,
    this.kubernetes,
    this.malwareProtection,
  });

  factory DataSourceConfigurationsResult.fromJson(Map<String, dynamic> json) {
    return DataSourceConfigurationsResult(
      cloudTrail: CloudTrailConfigurationResult.fromJson(
          json['cloudTrail'] as Map<String, dynamic>),
      dNSLogs: DNSLogsConfigurationResult.fromJson(
          json['dnsLogs'] as Map<String, dynamic>),
      flowLogs: FlowLogsConfigurationResult.fromJson(
          json['flowLogs'] as Map<String, dynamic>),
      s3Logs: S3LogsConfigurationResult.fromJson(
          json['s3Logs'] as Map<String, dynamic>),
      kubernetes: json['kubernetes'] != null
          ? KubernetesConfigurationResult.fromJson(
              json['kubernetes'] as Map<String, dynamic>)
          : null,
      malwareProtection: json['malwareProtection'] != null
          ? MalwareProtectionConfigurationResult.fromJson(
              json['malwareProtection'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains information about which data sources are enabled for the GuardDuty
/// member account.
class DataSourceFreeTrial {
  /// A value that specifies the number of days left to use each enabled data
  /// source.
  final int? freeTrialDaysRemaining;

  DataSourceFreeTrial({
    this.freeTrialDaysRemaining,
  });

  factory DataSourceFreeTrial.fromJson(Map<String, dynamic> json) {
    return DataSourceFreeTrial(
      freeTrialDaysRemaining: json['freeTrialDaysRemaining'] as int?,
    );
  }
}

enum DataSourceStatus {
  enabled('ENABLED'),
  disabled('DISABLED'),
  ;

  final String value;

  const DataSourceStatus(this.value);

  static DataSourceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DataSourceStatus'));
}

/// Contains information about which data sources are enabled for the GuardDuty
/// member account.
class DataSourcesFreeTrial {
  /// Describes whether any Amazon Web Services CloudTrail management event logs
  /// are enabled as data sources.
  final DataSourceFreeTrial? cloudTrail;

  /// Describes whether any DNS logs are enabled as data sources.
  final DataSourceFreeTrial? dnsLogs;

  /// Describes whether any VPC Flow logs are enabled as data sources.
  final DataSourceFreeTrial? flowLogs;

  /// Describes whether any Kubernetes logs are enabled as data sources.
  final KubernetesDataSourceFreeTrial? kubernetes;

  /// Describes whether Malware Protection is enabled as a data source.
  final MalwareProtectionDataSourceFreeTrial? malwareProtection;

  /// Describes whether any S3 data event logs are enabled as data sources.
  final DataSourceFreeTrial? s3Logs;

  DataSourcesFreeTrial({
    this.cloudTrail,
    this.dnsLogs,
    this.flowLogs,
    this.kubernetes,
    this.malwareProtection,
    this.s3Logs,
  });

  factory DataSourcesFreeTrial.fromJson(Map<String, dynamic> json) {
    return DataSourcesFreeTrial(
      cloudTrail: json['cloudTrail'] != null
          ? DataSourceFreeTrial.fromJson(
              json['cloudTrail'] as Map<String, dynamic>)
          : null,
      dnsLogs: json['dnsLogs'] != null
          ? DataSourceFreeTrial.fromJson(
              json['dnsLogs'] as Map<String, dynamic>)
          : null,
      flowLogs: json['flowLogs'] != null
          ? DataSourceFreeTrial.fromJson(
              json['flowLogs'] as Map<String, dynamic>)
          : null,
      kubernetes: json['kubernetes'] != null
          ? KubernetesDataSourceFreeTrial.fromJson(
              json['kubernetes'] as Map<String, dynamic>)
          : null,
      malwareProtection: json['malwareProtection'] != null
          ? MalwareProtectionDataSourceFreeTrial.fromJson(
              json['malwareProtection'] as Map<String, dynamic>)
          : null,
      s3Logs: json['s3Logs'] != null
          ? DataSourceFreeTrial.fromJson(json['s3Logs'] as Map<String, dynamic>)
          : null,
    );
  }
}

class DeclineInvitationsResponse {
  /// A list of objects that contain the unprocessed account and a result string
  /// that explains why it was unprocessed.
  final List<UnprocessedAccount> unprocessedAccounts;

  DeclineInvitationsResponse({
    required this.unprocessedAccounts,
  });

  factory DeclineInvitationsResponse.fromJson(Map<String, dynamic> json) {
    return DeclineInvitationsResponse(
      unprocessedAccounts: (json['unprocessedAccounts'] as List)
          .whereNotNull()
          .map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Contains information on the server side encryption method used in the S3
/// bucket. See <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html">S3
/// Server-Side Encryption</a> for more information.
class DefaultServerSideEncryption {
  /// The type of encryption used for objects within the S3 bucket.
  final String? encryptionType;

  /// The Amazon Resource Name (ARN) of the KMS encryption key. Only available if
  /// the bucket <code>EncryptionType</code> is <code>aws:kms</code>.
  final String? kmsMasterKeyArn;

  DefaultServerSideEncryption({
    this.encryptionType,
    this.kmsMasterKeyArn,
  });

  factory DefaultServerSideEncryption.fromJson(Map<String, dynamic> json) {
    return DefaultServerSideEncryption(
      encryptionType: json['encryptionType'] as String?,
      kmsMasterKeyArn: json['kmsMasterKeyArn'] as String?,
    );
  }
}

class DeleteDetectorResponse {
  DeleteDetectorResponse();

  factory DeleteDetectorResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDetectorResponse();
  }
}

class DeleteFilterResponse {
  DeleteFilterResponse();

  factory DeleteFilterResponse.fromJson(Map<String, dynamic> _) {
    return DeleteFilterResponse();
  }
}

class DeleteIPSetResponse {
  DeleteIPSetResponse();

  factory DeleteIPSetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteIPSetResponse();
  }
}

class DeleteInvitationsResponse {
  /// A list of objects that contain the unprocessed account and a result string
  /// that explains why it was unprocessed.
  final List<UnprocessedAccount> unprocessedAccounts;

  DeleteInvitationsResponse({
    required this.unprocessedAccounts,
  });

  factory DeleteInvitationsResponse.fromJson(Map<String, dynamic> json) {
    return DeleteInvitationsResponse(
      unprocessedAccounts: (json['unprocessedAccounts'] as List)
          .whereNotNull()
          .map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DeleteMembersResponse {
  /// The accounts that could not be processed.
  final List<UnprocessedAccount> unprocessedAccounts;

  DeleteMembersResponse({
    required this.unprocessedAccounts,
  });

  factory DeleteMembersResponse.fromJson(Map<String, dynamic> json) {
    return DeleteMembersResponse(
      unprocessedAccounts: (json['unprocessedAccounts'] as List)
          .whereNotNull()
          .map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class DeletePublishingDestinationResponse {
  DeletePublishingDestinationResponse();

  factory DeletePublishingDestinationResponse.fromJson(Map<String, dynamic> _) {
    return DeletePublishingDestinationResponse();
  }
}

class DeleteThreatIntelSetResponse {
  DeleteThreatIntelSetResponse();

  factory DeleteThreatIntelSetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteThreatIntelSetResponse();
  }
}

class DescribeMalwareScansResponse {
  /// Contains information about malware scans.
  final List<Scan> scans;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  final String? nextToken;

  DescribeMalwareScansResponse({
    required this.scans,
    this.nextToken,
  });

  factory DescribeMalwareScansResponse.fromJson(Map<String, dynamic> json) {
    return DescribeMalwareScansResponse(
      scans: (json['scans'] as List)
          .whereNotNull()
          .map((e) => Scan.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class DescribeOrganizationConfigurationResponse {
  /// Indicates whether the maximum number of allowed member accounts are already
  /// associated with the delegated administrator account for your organization.
  final bool memberAccountLimitReached;

  /// Indicates whether GuardDuty is automatically enabled for accounts added to
  /// the organization.
  ///
  /// Even though this is still supported, we recommend using
  /// <code>AutoEnableOrganizationMembers</code> to achieve the similar results.
  final bool? autoEnable;

  /// Indicates the auto-enablement configuration of GuardDuty or any of the
  /// corresponding protection plans for the member accounts in the organization.
  ///
  /// <ul>
  /// <li>
  /// <code>NEW</code>: Indicates that when a new account joins the organization,
  /// they will have GuardDuty or any of the corresponding protection plans
  /// enabled automatically.
  /// </li>
  /// <li>
  /// <code>ALL</code>: Indicates that all accounts in the organization have
  /// GuardDuty and any of the corresponding protection plans enabled
  /// automatically. This includes <code>NEW</code> accounts that join the
  /// organization and accounts that may have been suspended or removed from the
  /// organization in GuardDuty.
  /// </li>
  /// <li>
  /// <code>NONE</code>: Indicates that GuardDuty or any of the corresponding
  /// protection plans will not be automatically enabled for any account in the
  /// organization. The administrator must manage GuardDuty for each account in
  /// the organization individually.
  ///
  /// When you update the auto-enable setting from <code>ALL</code> or
  /// <code>NEW</code> to <code>NONE</code>, this action doesn't disable the
  /// corresponding option for your existing accounts. This configuration will
  /// apply to the new accounts that join the organization. After you update the
  /// auto-enable settings, no new account will have the corresponding option as
  /// enabled.
  /// </li>
  /// </ul>
  final AutoEnableMembers? autoEnableOrganizationMembers;

  /// Describes which data sources are enabled automatically for member accounts.
  final OrganizationDataSourceConfigurationsResult? dataSources;

  /// A list of features that are configured for this organization.
  final List<OrganizationFeatureConfigurationResult>? features;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  final String? nextToken;

  DescribeOrganizationConfigurationResponse({
    required this.memberAccountLimitReached,
    this.autoEnable,
    this.autoEnableOrganizationMembers,
    this.dataSources,
    this.features,
    this.nextToken,
  });

  factory DescribeOrganizationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeOrganizationConfigurationResponse(
      memberAccountLimitReached: json['memberAccountLimitReached'] as bool,
      autoEnable: json['autoEnable'] as bool?,
      autoEnableOrganizationMembers:
          (json['autoEnableOrganizationMembers'] as String?)
              ?.let(AutoEnableMembers.fromString),
      dataSources: json['dataSources'] != null
          ? OrganizationDataSourceConfigurationsResult.fromJson(
              json['dataSources'] as Map<String, dynamic>)
          : null,
      features: (json['features'] as List?)
          ?.whereNotNull()
          .map((e) => OrganizationFeatureConfigurationResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class DescribePublishingDestinationResponse {
  /// The ID of the publishing destination.
  final String destinationId;

  /// A <code>DestinationProperties</code> object that includes the
  /// <code>DestinationArn</code> and <code>KmsKeyArn</code> of the publishing
  /// destination.
  final DestinationProperties destinationProperties;

  /// The type of publishing destination. Currently, only Amazon S3 buckets are
  /// supported.
  final DestinationType destinationType;

  /// The time, in epoch millisecond format, at which GuardDuty was first unable
  /// to publish findings to the destination.
  final int publishingFailureStartTimestamp;

  /// The status of the publishing destination.
  final PublishingStatus status;

  DescribePublishingDestinationResponse({
    required this.destinationId,
    required this.destinationProperties,
    required this.destinationType,
    required this.publishingFailureStartTimestamp,
    required this.status,
  });

  factory DescribePublishingDestinationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribePublishingDestinationResponse(
      destinationId: json['destinationId'] as String,
      destinationProperties: DestinationProperties.fromJson(
          json['destinationProperties'] as Map<String, dynamic>),
      destinationType:
          DestinationType.fromString((json['destinationType'] as String)),
      publishingFailureStartTimestamp:
          json['publishingFailureStartTimestamp'] as int,
      status: PublishingStatus.fromString((json['status'] as String)),
    );
  }
}

/// Contains information about the publishing destination, including the ID,
/// type, and status.
class Destination {
  /// The unique ID of the publishing destination.
  final String destinationId;

  /// The type of resource used for the publishing destination. Currently, only
  /// Amazon S3 buckets are supported.
  final DestinationType destinationType;

  /// The status of the publishing destination.
  final PublishingStatus status;

  Destination({
    required this.destinationId,
    required this.destinationType,
    required this.status,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      destinationId: json['destinationId'] as String,
      destinationType:
          DestinationType.fromString((json['destinationType'] as String)),
      status: PublishingStatus.fromString((json['status'] as String)),
    );
  }
}

/// Contains the Amazon Resource Name (ARN) of the resource to publish to, such
/// as an S3 bucket, and the ARN of the KMS key to use to encrypt published
/// findings.
class DestinationProperties {
  /// The ARN of the resource to publish to.
  ///
  /// To specify an S3 bucket folder use the following format:
  /// <code>arn:aws:s3:::DOC-EXAMPLE-BUCKET/myFolder/</code>
  final String? destinationArn;

  /// The ARN of the KMS key to use for encryption.
  final String? kmsKeyArn;

  DestinationProperties({
    this.destinationArn,
    this.kmsKeyArn,
  });

  factory DestinationProperties.fromJson(Map<String, dynamic> json) {
    return DestinationProperties(
      destinationArn: json['destinationArn'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationArn = this.destinationArn;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      if (destinationArn != null) 'destinationArn': destinationArn,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

enum DestinationType {
  s3('S3'),
  ;

  final String value;

  const DestinationType(this.value);

  static DestinationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DestinationType'));
}

/// Contains information about the detected behavior.
class Detection {
  /// The details about the anomalous activity that caused GuardDuty to generate
  /// the finding.
  final Anomaly? anomaly;

  Detection({
    this.anomaly,
  });

  factory Detection.fromJson(Map<String, dynamic> json) {
    return Detection(
      anomaly: json['anomaly'] != null
          ? Anomaly.fromJson(json['anomaly'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Information about the additional configuration for a feature in your
/// GuardDuty account.
class DetectorAdditionalConfiguration {
  /// Name of the additional configuration.
  final FeatureAdditionalConfiguration? name;

  /// Status of the additional configuration.
  final FeatureStatus? status;

  DetectorAdditionalConfiguration({
    this.name,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    return {
      if (name != null) 'name': name.value,
      if (status != null) 'status': status.value,
    };
  }
}

/// Information about the additional configuration.
class DetectorAdditionalConfigurationResult {
  /// Name of the additional configuration.
  final FeatureAdditionalConfiguration? name;

  /// Status of the additional configuration.
  final FeatureStatus? status;

  /// The timestamp at which the additional configuration was last updated. This
  /// is in UTC format.
  final DateTime? updatedAt;

  DetectorAdditionalConfigurationResult({
    this.name,
    this.status,
    this.updatedAt,
  });

  factory DetectorAdditionalConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return DetectorAdditionalConfigurationResult(
      name: (json['name'] as String?)
          ?.let(FeatureAdditionalConfiguration.fromString),
      status: (json['status'] as String?)?.let(FeatureStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }
}

enum DetectorFeature {
  s3DataEvents('S3_DATA_EVENTS'),
  eksAuditLogs('EKS_AUDIT_LOGS'),
  ebsMalwareProtection('EBS_MALWARE_PROTECTION'),
  rdsLoginEvents('RDS_LOGIN_EVENTS'),
  eksRuntimeMonitoring('EKS_RUNTIME_MONITORING'),
  lambdaNetworkLogs('LAMBDA_NETWORK_LOGS'),
  runtimeMonitoring('RUNTIME_MONITORING'),
  ;

  final String value;

  const DetectorFeature(this.value);

  static DetectorFeature fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DetectorFeature'));
}

/// Contains information about a GuardDuty feature.
///
/// Specifying both EKS Runtime Monitoring (<code>EKS_RUNTIME_MONITORING</code>)
/// and Runtime Monitoring (<code>RUNTIME_MONITORING</code>) will cause an
/// error. You can add only one of these two features because Runtime Monitoring
/// already includes the threat detection for Amazon EKS resources. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/guardduty/latest/ug/runtime-monitoring.html">Runtime
/// Monitoring</a>.
class DetectorFeatureConfiguration {
  /// Additional configuration for a resource.
  final List<DetectorAdditionalConfiguration>? additionalConfiguration;

  /// The name of the feature.
  final DetectorFeature? name;

  /// The status of the feature.
  final FeatureStatus? status;

  DetectorFeatureConfiguration({
    this.additionalConfiguration,
    this.name,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final additionalConfiguration = this.additionalConfiguration;
    final name = this.name;
    final status = this.status;
    return {
      if (additionalConfiguration != null)
        'additionalConfiguration': additionalConfiguration,
      if (name != null) 'name': name.value,
      if (status != null) 'status': status.value,
    };
  }
}

/// Contains information about a GuardDuty feature.
///
/// Specifying both EKS Runtime Monitoring (<code>EKS_RUNTIME_MONITORING</code>)
/// and Runtime Monitoring (<code>RUNTIME_MONITORING</code>) will cause an
/// error. You can add only one of these two features because Runtime Monitoring
/// already includes the threat detection for Amazon EKS resources. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/guardduty/latest/ug/runtime-monitoring.html">Runtime
/// Monitoring</a>.
class DetectorFeatureConfigurationResult {
  /// Additional configuration for a resource.
  final List<DetectorAdditionalConfigurationResult>? additionalConfiguration;

  /// Indicates the name of the feature that can be enabled for the detector.
  final DetectorFeatureResult? name;

  /// Indicates the status of the feature that is enabled for the detector.
  final FeatureStatus? status;

  /// The timestamp at which the feature object was updated.
  final DateTime? updatedAt;

  DetectorFeatureConfigurationResult({
    this.additionalConfiguration,
    this.name,
    this.status,
    this.updatedAt,
  });

  factory DetectorFeatureConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return DetectorFeatureConfigurationResult(
      additionalConfiguration: (json['additionalConfiguration'] as List?)
          ?.whereNotNull()
          .map((e) => DetectorAdditionalConfigurationResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      name: (json['name'] as String?)?.let(DetectorFeatureResult.fromString),
      status: (json['status'] as String?)?.let(FeatureStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }
}

enum DetectorFeatureResult {
  flowLogs('FLOW_LOGS'),
  cloudTrail('CLOUD_TRAIL'),
  dnsLogs('DNS_LOGS'),
  s3DataEvents('S3_DATA_EVENTS'),
  eksAuditLogs('EKS_AUDIT_LOGS'),
  ebsMalwareProtection('EBS_MALWARE_PROTECTION'),
  rdsLoginEvents('RDS_LOGIN_EVENTS'),
  eksRuntimeMonitoring('EKS_RUNTIME_MONITORING'),
  lambdaNetworkLogs('LAMBDA_NETWORK_LOGS'),
  runtimeMonitoring('RUNTIME_MONITORING'),
  ;

  final String value;

  const DetectorFeatureResult(this.value);

  static DetectorFeatureResult fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum DetectorFeatureResult'));
}

enum DetectorStatus {
  enabled('ENABLED'),
  disabled('DISABLED'),
  ;

  final String value;

  const DetectorStatus(this.value);

  static DetectorStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DetectorStatus'));
}

class DisableOrganizationAdminAccountResponse {
  DisableOrganizationAdminAccountResponse();

  factory DisableOrganizationAdminAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return DisableOrganizationAdminAccountResponse();
  }
}

class DisassociateFromAdministratorAccountResponse {
  DisassociateFromAdministratorAccountResponse();

  factory DisassociateFromAdministratorAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateFromAdministratorAccountResponse();
  }
}

@Deprecated(
    'This output is deprecated, use DisassociateFromAdministratorAccountResponse instead')
class DisassociateFromMasterAccountResponse {
  DisassociateFromMasterAccountResponse();

  factory DisassociateFromMasterAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateFromMasterAccountResponse();
  }
}

class DisassociateMembersResponse {
  /// A list of objects that contain the unprocessed account and a result string
  /// that explains why it was unprocessed.
  final List<UnprocessedAccount> unprocessedAccounts;

  DisassociateMembersResponse({
    required this.unprocessedAccounts,
  });

  factory DisassociateMembersResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateMembersResponse(
      unprocessedAccounts: (json['unprocessedAccounts'] as List)
          .whereNotNull()
          .map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Contains information about the DNS_REQUEST action described in this finding.
class DnsRequestAction {
  /// Indicates whether the targeted port is blocked.
  final bool? blocked;

  /// The domain information for the DNS query.
  final String? domain;

  /// The second and top level domain involved in the activity that potentially
  /// prompted GuardDuty to generate this finding. For a list of top-level and
  /// second-level domains, see <a href="https://publicsuffix.org/">public suffix
  /// list</a>.
  final String? domainWithSuffix;

  /// The network connection protocol observed in the activity that prompted
  /// GuardDuty to generate the finding.
  final String? protocol;

  DnsRequestAction({
    this.blocked,
    this.domain,
    this.domainWithSuffix,
    this.protocol,
  });

  factory DnsRequestAction.fromJson(Map<String, dynamic> json) {
    return DnsRequestAction(
      blocked: json['blocked'] as bool?,
      domain: json['domain'] as String?,
      domainWithSuffix: json['domainWithSuffix'] as String?,
      protocol: json['protocol'] as String?,
    );
  }
}

/// Contains information about the domain.
class DomainDetails {
  /// The domain information for the Amazon Web Services API call.
  final String? domain;

  DomainDetails({
    this.domain,
  });

  factory DomainDetails.fromJson(Map<String, dynamic> json) {
    return DomainDetails(
      domain: json['domain'] as String?,
    );
  }
}

enum EbsSnapshotPreservation {
  noRetention('NO_RETENTION'),
  retentionWithFinding('RETENTION_WITH_FINDING'),
  ;

  final String value;

  const EbsSnapshotPreservation(this.value);

  static EbsSnapshotPreservation fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum EbsSnapshotPreservation'));
}

/// Contains list of scanned and skipped EBS volumes with details.
class EbsVolumeDetails {
  /// List of EBS volumes that were scanned.
  final List<VolumeDetail>? scannedVolumeDetails;

  /// List of EBS volumes that were skipped from the malware scan.
  final List<VolumeDetail>? skippedVolumeDetails;

  EbsVolumeDetails({
    this.scannedVolumeDetails,
    this.skippedVolumeDetails,
  });

  factory EbsVolumeDetails.fromJson(Map<String, dynamic> json) {
    return EbsVolumeDetails(
      scannedVolumeDetails: (json['scannedVolumeDetails'] as List?)
          ?.whereNotNull()
          .map((e) => VolumeDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      skippedVolumeDetails: (json['skippedVolumeDetails'] as List?)
          ?.whereNotNull()
          .map((e) => VolumeDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Contains details from the malware scan that created a finding.
class EbsVolumeScanDetails {
  /// Returns the completion date and time of the malware scan.
  final DateTime? scanCompletedAt;

  /// Contains a complete view providing malware scan result details.
  final ScanDetections? scanDetections;

  /// Unique Id of the malware scan that generated the finding.
  final String? scanId;

  /// Returns the start date and time of the malware scan.
  final DateTime? scanStartedAt;

  /// Specifies the scan type that invoked the malware scan.
  final ScanType? scanType;

  /// Contains list of threat intelligence sources used to detect threats.
  final List<String>? sources;

  /// GuardDuty finding ID that triggered a malware scan.
  final String? triggerFindingId;

  EbsVolumeScanDetails({
    this.scanCompletedAt,
    this.scanDetections,
    this.scanId,
    this.scanStartedAt,
    this.scanType,
    this.sources,
    this.triggerFindingId,
  });

  factory EbsVolumeScanDetails.fromJson(Map<String, dynamic> json) {
    return EbsVolumeScanDetails(
      scanCompletedAt: timeStampFromJson(json['scanCompletedAt']),
      scanDetections: json['scanDetections'] != null
          ? ScanDetections.fromJson(
              json['scanDetections'] as Map<String, dynamic>)
          : null,
      scanId: json['scanId'] as String?,
      scanStartedAt: timeStampFromJson(json['scanStartedAt']),
      scanType: (json['scanType'] as String?)?.let(ScanType.fromString),
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      triggerFindingId: json['triggerFindingId'] as String?,
    );
  }
}

/// Describes the configuration of scanning EBS volumes as a data source.
class EbsVolumesResult {
  /// Specifies the reason why scanning EBS volumes (Malware Protection) was not
  /// enabled as a data source.
  final String? reason;

  /// Describes whether scanning EBS volumes is enabled as a data source.
  final DataSourceStatus? status;

  EbsVolumesResult({
    this.reason,
    this.status,
  });

  factory EbsVolumesResult.fromJson(Map<String, dynamic> json) {
    return EbsVolumesResult(
      reason: json['reason'] as String?,
      status: (json['status'] as String?)?.let(DataSourceStatus.fromString),
    );
  }
}

/// Contains information about the details of the ECS Cluster.
class EcsClusterDetails {
  /// The number of services that are running on the cluster in an ACTIVE state.
  final int? activeServicesCount;

  /// The Amazon Resource Name (ARN) that identifies the cluster.
  final String? arn;

  /// The name of the ECS Cluster.
  final String? name;

  /// The number of container instances registered into the cluster.
  final int? registeredContainerInstancesCount;

  /// The number of tasks in the cluster that are in the RUNNING state.
  final int? runningTasksCount;

  /// The status of the ECS cluster.
  final String? status;

  /// The tags of the ECS Cluster.
  final List<Tag>? tags;

  /// Contains information about the details of the ECS Task.
  final EcsTaskDetails? taskDetails;

  EcsClusterDetails({
    this.activeServicesCount,
    this.arn,
    this.name,
    this.registeredContainerInstancesCount,
    this.runningTasksCount,
    this.status,
    this.tags,
    this.taskDetails,
  });

  factory EcsClusterDetails.fromJson(Map<String, dynamic> json) {
    return EcsClusterDetails(
      activeServicesCount: json['activeServicesCount'] as int?,
      arn: json['arn'] as String?,
      name: json['name'] as String?,
      registeredContainerInstancesCount:
          json['registeredContainerInstancesCount'] as int?,
      runningTasksCount: json['runningTasksCount'] as int?,
      status: json['status'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskDetails: json['taskDetails'] != null
          ? EcsTaskDetails.fromJson(json['taskDetails'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains information about the task in an ECS cluster.
class EcsTaskDetails {
  /// The Amazon Resource Name (ARN) of the task.
  final String? arn;

  /// The containers that's associated with the task.
  final List<Container>? containers;

  /// The ARN of the task definition that creates the task.
  final String? definitionArn;

  /// The name of the task group that's associated with the task.
  final String? group;

  /// The Unix timestamp for the time when the task started.
  final DateTime? startedAt;

  /// Contains the tag specified when a task is started.
  final String? startedBy;

  /// The tags of the ECS Task.
  final List<Tag>? tags;

  /// The Unix timestamp for the time when the task was created.
  final DateTime? taskCreatedAt;

  /// The version counter for the task.
  final String? version;

  /// The list of data volume definitions for the task.
  final List<Volume>? volumes;

  EcsTaskDetails({
    this.arn,
    this.containers,
    this.definitionArn,
    this.group,
    this.startedAt,
    this.startedBy,
    this.tags,
    this.taskCreatedAt,
    this.version,
    this.volumes,
  });

  factory EcsTaskDetails.fromJson(Map<String, dynamic> json) {
    return EcsTaskDetails(
      arn: json['arn'] as String?,
      containers: (json['containers'] as List?)
          ?.whereNotNull()
          .map((e) => Container.fromJson(e as Map<String, dynamic>))
          .toList(),
      definitionArn: json['definitionArn'] as String?,
      group: json['group'] as String?,
      startedAt: timeStampFromJson(json['startedAt']),
      startedBy: json['startedBy'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskCreatedAt: timeStampFromJson(json['createdAt']),
      version: json['version'] as String?,
      volumes: (json['volumes'] as List?)
          ?.whereNotNull()
          .map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Details about the EKS cluster involved in a Kubernetes finding.
class EksClusterDetails {
  /// EKS cluster ARN.
  final String? arn;

  /// The timestamp when the EKS cluster was created.
  final DateTime? createdAt;

  /// EKS cluster name.
  final String? name;

  /// The EKS cluster status.
  final String? status;

  /// The EKS cluster tags.
  final List<Tag>? tags;

  /// The VPC ID to which the EKS cluster is attached.
  final String? vpcId;

  EksClusterDetails({
    this.arn,
    this.createdAt,
    this.name,
    this.status,
    this.tags,
    this.vpcId,
  });

  factory EksClusterDetails.fromJson(Map<String, dynamic> json) {
    return EksClusterDetails(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      name: json['name'] as String?,
      status: json['status'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcId: json['vpcId'] as String?,
    );
  }
}

class EnableOrganizationAdminAccountResponse {
  EnableOrganizationAdminAccountResponse();

  factory EnableOrganizationAdminAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return EnableOrganizationAdminAccountResponse();
  }
}

/// Contains information about the reason that the finding was generated.
class Evidence {
  /// A list of threat intelligence details related to the evidence.
  final List<ThreatIntelligenceDetail>? threatIntelligenceDetails;

  Evidence({
    this.threatIntelligenceDetails,
  });

  factory Evidence.fromJson(Map<String, dynamic> json) {
    return Evidence(
      threatIntelligenceDetails: (json['threatIntelligenceDetails'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ThreatIntelligenceDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Contains information about Amazon Web Services Fargate details associated
/// with an Amazon ECS cluster.
class FargateDetails {
  /// Runtime coverage issues identified for the resource running on Amazon Web
  /// Services Fargate.
  final List<String>? issues;

  /// Indicates how the GuardDuty security agent is managed for this resource.
  ///
  /// <ul>
  /// <li>
  /// <code>AUTO_MANAGED</code> indicates that GuardDuty deploys and manages
  /// updates for this resource.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> indicates that the deployment of the GuardDuty
  /// security agent is disabled for this resource.
  /// </li>
  /// </ul> <note>
  /// The <code>MANUAL</code> status doesn't apply to the Amazon Web Services
  /// Fargate (Amazon ECS only) woprkloads.
  /// </note>
  final ManagementType? managementType;

  FargateDetails({
    this.issues,
    this.managementType,
  });

  factory FargateDetails.fromJson(Map<String, dynamic> json) {
    return FargateDetails(
      issues: (json['issues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      managementType:
          (json['managementType'] as String?)?.let(ManagementType.fromString),
    );
  }
}

enum FeatureAdditionalConfiguration {
  eksAddonManagement('EKS_ADDON_MANAGEMENT'),
  ecsFargateAgentManagement('ECS_FARGATE_AGENT_MANAGEMENT'),
  ec2AgentManagement('EC2_AGENT_MANAGEMENT'),
  ;

  final String value;

  const FeatureAdditionalConfiguration(this.value);

  static FeatureAdditionalConfiguration fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum FeatureAdditionalConfiguration'));
}

enum FeatureStatus {
  enabled('ENABLED'),
  disabled('DISABLED'),
  ;

  final String value;

  const FeatureStatus(this.value);

  static FeatureStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum FeatureStatus'));
}

enum Feedback {
  useful('USEFUL'),
  notUseful('NOT_USEFUL'),
  ;

  final String value;

  const Feedback(this.value);

  static Feedback fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum Feedback'));
}

enum FilterAction {
  noop('NOOP'),
  archive('ARCHIVE'),
  ;

  final String value;

  const FilterAction(this.value);

  static FilterAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum FilterAction'));
}

/// Contains information about the condition.
class FilterCondition {
  /// Represents an <i>equal</i> <b/> condition to be applied to a single field
  /// when querying for scan entries.
  final String? equalsValue;

  /// Represents a <i>greater than</i> condition to be applied to a single field
  /// when querying for scan entries.
  final int? greaterThan;

  /// Represents a <i>less than</i> condition to be applied to a single field when
  /// querying for scan entries.
  final int? lessThan;

  FilterCondition({
    this.equalsValue,
    this.greaterThan,
    this.lessThan,
  });

  Map<String, dynamic> toJson() {
    final equalsValue = this.equalsValue;
    final greaterThan = this.greaterThan;
    final lessThan = this.lessThan;
    return {
      if (equalsValue != null) 'equalsValue': equalsValue,
      if (greaterThan != null) 'greaterThan': greaterThan,
      if (lessThan != null) 'lessThan': lessThan,
    };
  }
}

/// Represents the criteria to be used in the filter for describing scan
/// entries.
class FilterCriteria {
  /// Represents a condition that when matched will be added to the response of
  /// the operation.
  final List<FilterCriterion>? filterCriterion;

  FilterCriteria({
    this.filterCriterion,
  });

  Map<String, dynamic> toJson() {
    final filterCriterion = this.filterCriterion;
    return {
      if (filterCriterion != null) 'filterCriterion': filterCriterion,
    };
  }
}

/// Represents a condition that when matched will be added to the response of
/// the operation. Irrespective of using any filter criteria, an administrator
/// account can view the scan entries for all of its member accounts. However,
/// each member account can view the scan entries only for their own account.
class FilterCriterion {
  /// An enum value representing possible scan properties to match with given scan
  /// entries.
  /// <note>
  /// Replace the enum value <code>CLUSTER_NAME</code> with
  /// <code>EKS_CLUSTER_NAME</code>. <code>CLUSTER_NAME</code> has been
  /// deprecated.
  /// </note>
  final CriterionKey? criterionKey;

  /// Contains information about the condition.
  final FilterCondition? filterCondition;

  FilterCriterion({
    this.criterionKey,
    this.filterCondition,
  });

  Map<String, dynamic> toJson() {
    final criterionKey = this.criterionKey;
    final filterCondition = this.filterCondition;
    return {
      if (criterionKey != null) 'criterionKey': criterionKey.value,
      if (filterCondition != null) 'filterCondition': filterCondition,
    };
  }
}

/// Contains information about the finding that is generated when abnormal or
/// suspicious activity is detected.
class Finding {
  /// The ID of the account in which the finding was generated.
  final String accountId;

  /// The ARN of the finding.
  final String arn;

  /// The time and date when the finding was created.
  final String createdAt;

  /// The ID of the finding.
  final String id;

  /// The Region where the finding was generated.
  final String region;
  final Resource resource;

  /// The version of the schema used for the finding.
  final String schemaVersion;

  /// The severity of the finding.
  final double severity;

  /// The type of finding.
  final String type;

  /// The time and date when the finding was last updated.
  final String updatedAt;

  /// The confidence score for the finding.
  final double? confidence;

  /// The description of the finding.
  final String? description;

  /// The partition associated with the finding.
  final String? partition;
  final Service? service;

  /// The title of the finding.
  final String? title;

  Finding({
    required this.accountId,
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.region,
    required this.resource,
    required this.schemaVersion,
    required this.severity,
    required this.type,
    required this.updatedAt,
    this.confidence,
    this.description,
    this.partition,
    this.service,
    this.title,
  });

  factory Finding.fromJson(Map<String, dynamic> json) {
    return Finding(
      accountId: json['accountId'] as String,
      arn: json['arn'] as String,
      createdAt: json['createdAt'] as String,
      id: json['id'] as String,
      region: json['region'] as String,
      resource: Resource.fromJson(json['resource'] as Map<String, dynamic>),
      schemaVersion: json['schemaVersion'] as String,
      severity: json['severity'] as double,
      type: json['type'] as String,
      updatedAt: json['updatedAt'] as String,
      confidence: json['confidence'] as double?,
      description: json['description'] as String?,
      partition: json['partition'] as String?,
      service: json['service'] != null
          ? Service.fromJson(json['service'] as Map<String, dynamic>)
          : null,
      title: json['title'] as String?,
    );
  }
}

/// Contains information about the criteria used for querying findings.
class FindingCriteria {
  /// Represents a map of finding properties that match specified conditions and
  /// values when querying findings.
  final Map<String, Condition>? criterion;

  FindingCriteria({
    this.criterion,
  });

  factory FindingCriteria.fromJson(Map<String, dynamic> json) {
    return FindingCriteria(
      criterion: (json['criterion'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, Condition.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final criterion = this.criterion;
    return {
      if (criterion != null) 'criterion': criterion,
    };
  }
}

enum FindingPublishingFrequency {
  fifteenMinutes('FIFTEEN_MINUTES'),
  oneHour('ONE_HOUR'),
  sixHours('SIX_HOURS'),
  ;

  final String value;

  const FindingPublishingFrequency(this.value);

  static FindingPublishingFrequency fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum FindingPublishingFrequency'));
}

enum FindingStatisticType {
  countBySeverity('COUNT_BY_SEVERITY'),
  ;

  final String value;

  const FindingStatisticType(this.value);

  static FindingStatisticType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum FindingStatisticType'));
}

/// Contains information about finding statistics.
class FindingStatistics {
  /// Represents a map of severity to count statistics for a set of findings.
  final Map<String, int>? countBySeverity;

  FindingStatistics({
    this.countBySeverity,
  });

  factory FindingStatistics.fromJson(Map<String, dynamic> json) {
    return FindingStatistics(
      countBySeverity: (json['countBySeverity'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as int)),
    );
  }
}

/// Contains information on the status of VPC flow logs as a data source.
class FlowLogsConfigurationResult {
  /// Denotes whether VPC flow logs is enabled as a data source.
  final DataSourceStatus status;

  FlowLogsConfigurationResult({
    required this.status,
  });

  factory FlowLogsConfigurationResult.fromJson(Map<String, dynamic> json) {
    return FlowLogsConfigurationResult(
      status: DataSourceStatus.fromString((json['status'] as String)),
    );
  }
}

/// Contains information about the free trial period for a feature.
class FreeTrialFeatureConfigurationResult {
  /// The number of the remaining free trial days for the feature.
  final int? freeTrialDaysRemaining;

  /// The name of the feature for which the free trial is configured.
  final FreeTrialFeatureResult? name;

  FreeTrialFeatureConfigurationResult({
    this.freeTrialDaysRemaining,
    this.name,
  });

  factory FreeTrialFeatureConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return FreeTrialFeatureConfigurationResult(
      freeTrialDaysRemaining: json['freeTrialDaysRemaining'] as int?,
      name: (json['name'] as String?)?.let(FreeTrialFeatureResult.fromString),
    );
  }
}

enum FreeTrialFeatureResult {
  flowLogs('FLOW_LOGS'),
  cloudTrail('CLOUD_TRAIL'),
  dnsLogs('DNS_LOGS'),
  s3DataEvents('S3_DATA_EVENTS'),
  eksAuditLogs('EKS_AUDIT_LOGS'),
  ebsMalwareProtection('EBS_MALWARE_PROTECTION'),
  rdsLoginEvents('RDS_LOGIN_EVENTS'),
  eksRuntimeMonitoring('EKS_RUNTIME_MONITORING'),
  lambdaNetworkLogs('LAMBDA_NETWORK_LOGS'),
  fargateRuntimeMonitoring('FARGATE_RUNTIME_MONITORING'),
  ec2RuntimeMonitoring('EC2_RUNTIME_MONITORING'),
  ;

  final String value;

  const FreeTrialFeatureResult(this.value);

  static FreeTrialFeatureResult fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum FreeTrialFeatureResult'));
}

/// Contains information about the location of the remote IP address.
class GeoLocation {
  /// The latitude information of the remote IP address.
  final double? lat;

  /// The longitude information of the remote IP address.
  final double? lon;

  GeoLocation({
    this.lat,
    this.lon,
  });

  factory GeoLocation.fromJson(Map<String, dynamic> json) {
    return GeoLocation(
      lat: json['lat'] as double?,
      lon: json['lon'] as double?,
    );
  }
}

class GetAdministratorAccountResponse {
  /// The administrator account details.
  final Administrator administrator;

  GetAdministratorAccountResponse({
    required this.administrator,
  });

  factory GetAdministratorAccountResponse.fromJson(Map<String, dynamic> json) {
    return GetAdministratorAccountResponse(
      administrator:
          Administrator.fromJson(json['administrator'] as Map<String, dynamic>),
    );
  }
}

class GetCoverageStatisticsResponse {
  /// Represents the count aggregated by the <code>statusCode</code> and
  /// <code>resourceType</code>.
  final CoverageStatistics? coverageStatistics;

  GetCoverageStatisticsResponse({
    this.coverageStatistics,
  });

  factory GetCoverageStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return GetCoverageStatisticsResponse(
      coverageStatistics: json['coverageStatistics'] != null
          ? CoverageStatistics.fromJson(
              json['coverageStatistics'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetDetectorResponse {
  /// The GuardDuty service role.
  final String serviceRole;

  /// The detector status.
  final DetectorStatus status;

  /// The timestamp of when the detector was created.
  final String? createdAt;

  /// Describes which data sources are enabled for the detector.
  final DataSourceConfigurationsResult? dataSources;

  /// Describes the features that have been enabled for the detector.
  final List<DetectorFeatureConfigurationResult>? features;

  /// The publishing frequency of the finding.
  final FindingPublishingFrequency? findingPublishingFrequency;

  /// The tags of the detector resource.
  final Map<String, String>? tags;

  /// The last-updated timestamp for the detector.
  final String? updatedAt;

  GetDetectorResponse({
    required this.serviceRole,
    required this.status,
    this.createdAt,
    this.dataSources,
    this.features,
    this.findingPublishingFrequency,
    this.tags,
    this.updatedAt,
  });

  factory GetDetectorResponse.fromJson(Map<String, dynamic> json) {
    return GetDetectorResponse(
      serviceRole: json['serviceRole'] as String,
      status: DetectorStatus.fromString((json['status'] as String)),
      createdAt: json['createdAt'] as String?,
      dataSources: json['dataSources'] != null
          ? DataSourceConfigurationsResult.fromJson(
              json['dataSources'] as Map<String, dynamic>)
          : null,
      features: (json['features'] as List?)
          ?.whereNotNull()
          .map((e) => DetectorFeatureConfigurationResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      findingPublishingFrequency:
          (json['findingPublishingFrequency'] as String?)
              ?.let(FindingPublishingFrequency.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: json['updatedAt'] as String?,
    );
  }
}

class GetFilterResponse {
  /// Specifies the action that is to be applied to the findings that match the
  /// filter.
  final FilterAction action;

  /// Represents the criteria to be used in the filter for querying findings.
  final FindingCriteria findingCriteria;

  /// The name of the filter.
  final String name;

  /// The description of the filter.
  final String? description;

  /// Specifies the position of the filter in the list of current filters. Also
  /// specifies the order in which this filter is applied to the findings.
  final int? rank;

  /// The tags of the filter resource.
  final Map<String, String>? tags;

  GetFilterResponse({
    required this.action,
    required this.findingCriteria,
    required this.name,
    this.description,
    this.rank,
    this.tags,
  });

  factory GetFilterResponse.fromJson(Map<String, dynamic> json) {
    return GetFilterResponse(
      action: FilterAction.fromString((json['action'] as String)),
      findingCriteria: FindingCriteria.fromJson(
          json['findingCriteria'] as Map<String, dynamic>),
      name: json['name'] as String,
      description: json['description'] as String?,
      rank: json['rank'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

class GetFindingsResponse {
  /// A list of findings.
  final List<Finding> findings;

  GetFindingsResponse({
    required this.findings,
  });

  factory GetFindingsResponse.fromJson(Map<String, dynamic> json) {
    return GetFindingsResponse(
      findings: (json['findings'] as List)
          .whereNotNull()
          .map((e) => Finding.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GetFindingsStatisticsResponse {
  /// The finding statistics object.
  final FindingStatistics findingStatistics;

  GetFindingsStatisticsResponse({
    required this.findingStatistics,
  });

  factory GetFindingsStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return GetFindingsStatisticsResponse(
      findingStatistics: FindingStatistics.fromJson(
          json['findingStatistics'] as Map<String, dynamic>),
    );
  }
}

class GetIPSetResponse {
  /// The format of the file that contains the IPSet.
  final IpSetFormat format;

  /// The URI of the file that contains the IPSet.
  final String location;

  /// The user-friendly name for the IPSet.
  final String name;

  /// The status of IPSet file that was uploaded.
  final IpSetStatus status;

  /// The tags of the IPSet resource.
  final Map<String, String>? tags;

  GetIPSetResponse({
    required this.format,
    required this.location,
    required this.name,
    required this.status,
    this.tags,
  });

  factory GetIPSetResponse.fromJson(Map<String, dynamic> json) {
    return GetIPSetResponse(
      format: IpSetFormat.fromString((json['format'] as String)),
      location: json['location'] as String,
      name: json['name'] as String,
      status: IpSetStatus.fromString((json['status'] as String)),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

class GetInvitationsCountResponse {
  /// The number of received invitations.
  final int? invitationsCount;

  GetInvitationsCountResponse({
    this.invitationsCount,
  });

  factory GetInvitationsCountResponse.fromJson(Map<String, dynamic> json) {
    return GetInvitationsCountResponse(
      invitationsCount: json['invitationsCount'] as int?,
    );
  }
}

class GetMalwareScanSettingsResponse {
  /// An enum value representing possible snapshot preservation settings.
  final EbsSnapshotPreservation? ebsSnapshotPreservation;

  /// Represents the criteria to be used in the filter for scanning resources.
  final ScanResourceCriteria? scanResourceCriteria;

  GetMalwareScanSettingsResponse({
    this.ebsSnapshotPreservation,
    this.scanResourceCriteria,
  });

  factory GetMalwareScanSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetMalwareScanSettingsResponse(
      ebsSnapshotPreservation: (json['ebsSnapshotPreservation'] as String?)
          ?.let(EbsSnapshotPreservation.fromString),
      scanResourceCriteria: json['scanResourceCriteria'] != null
          ? ScanResourceCriteria.fromJson(
              json['scanResourceCriteria'] as Map<String, dynamic>)
          : null,
    );
  }
}

@Deprecated(
    'This output is deprecated, use GetAdministratorAccountResponse instead')
class GetMasterAccountResponse {
  /// The administrator account details.
  final Master master;

  GetMasterAccountResponse({
    required this.master,
  });

  factory GetMasterAccountResponse.fromJson(Map<String, dynamic> json) {
    return GetMasterAccountResponse(
      master: Master.fromJson(json['master'] as Map<String, dynamic>),
    );
  }
}

class GetMemberDetectorsResponse {
  /// An object that describes which data sources are enabled for a member
  /// account.
  final List<MemberDataSourceConfiguration> memberDataSourceConfigurations;

  /// A list of member account IDs that were unable to be processed along with an
  /// explanation for why they were not processed.
  final List<UnprocessedAccount> unprocessedAccounts;

  GetMemberDetectorsResponse({
    required this.memberDataSourceConfigurations,
    required this.unprocessedAccounts,
  });

  factory GetMemberDetectorsResponse.fromJson(Map<String, dynamic> json) {
    return GetMemberDetectorsResponse(
      memberDataSourceConfigurations: (json['members'] as List)
          .whereNotNull()
          .map((e) =>
              MemberDataSourceConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedAccounts: (json['unprocessedAccounts'] as List)
          .whereNotNull()
          .map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GetMembersResponse {
  /// A list of members.
  final List<Member> members;

  /// A list of objects that contain the unprocessed account and a result string
  /// that explains why it was unprocessed.
  final List<UnprocessedAccount> unprocessedAccounts;

  GetMembersResponse({
    required this.members,
    required this.unprocessedAccounts,
  });

  factory GetMembersResponse.fromJson(Map<String, dynamic> json) {
    return GetMembersResponse(
      members: (json['members'] as List)
          .whereNotNull()
          .map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedAccounts: (json['unprocessedAccounts'] as List)
          .whereNotNull()
          .map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GetOrganizationStatisticsResponse {
  /// Information about the statistics report for your organization.
  final OrganizationDetails? organizationDetails;

  GetOrganizationStatisticsResponse({
    this.organizationDetails,
  });

  factory GetOrganizationStatisticsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetOrganizationStatisticsResponse(
      organizationDetails: json['organizationDetails'] != null
          ? OrganizationDetails.fromJson(
              json['organizationDetails'] as Map<String, dynamic>)
          : null,
    );
  }
}

class GetRemainingFreeTrialDaysResponse {
  /// The member accounts which were included in a request and were processed
  /// successfully.
  final List<AccountFreeTrialInfo>? accounts;

  /// The member account that was included in a request but for which the request
  /// could not be processed.
  final List<UnprocessedAccount>? unprocessedAccounts;

  GetRemainingFreeTrialDaysResponse({
    this.accounts,
    this.unprocessedAccounts,
  });

  factory GetRemainingFreeTrialDaysResponse.fromJson(
      Map<String, dynamic> json) {
    return GetRemainingFreeTrialDaysResponse(
      accounts: (json['accounts'] as List?)
          ?.whereNotNull()
          .map((e) => AccountFreeTrialInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedAccounts: (json['unprocessedAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GetThreatIntelSetResponse {
  /// The format of the threatIntelSet.
  final ThreatIntelSetFormat format;

  /// The URI of the file that contains the ThreatIntelSet.
  final String location;

  /// A user-friendly ThreatIntelSet name displayed in all findings that are
  /// generated by activity that involves IP addresses included in this
  /// ThreatIntelSet.
  final String name;

  /// The status of threatIntelSet file uploaded.
  final ThreatIntelSetStatus status;

  /// The tags of the threat list resource.
  final Map<String, String>? tags;

  GetThreatIntelSetResponse({
    required this.format,
    required this.location,
    required this.name,
    required this.status,
    this.tags,
  });

  factory GetThreatIntelSetResponse.fromJson(Map<String, dynamic> json) {
    return GetThreatIntelSetResponse(
      format: ThreatIntelSetFormat.fromString((json['format'] as String)),
      location: json['location'] as String,
      name: json['name'] as String,
      status: ThreatIntelSetStatus.fromString((json['status'] as String)),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

class GetUsageStatisticsResponse {
  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  final String? nextToken;

  /// The usage statistics object. If a UsageStatisticType was provided, the
  /// objects representing other types will be null.
  final UsageStatistics? usageStatistics;

  GetUsageStatisticsResponse({
    this.nextToken,
    this.usageStatistics,
  });

  factory GetUsageStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return GetUsageStatisticsResponse(
      nextToken: json['nextToken'] as String?,
      usageStatistics: json['usageStatistics'] != null
          ? UsageStatistics.fromJson(
              json['usageStatistics'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains details of the highest severity threat detected during scan and
/// number of infected files.
class HighestSeverityThreatDetails {
  /// Total number of infected files with the highest severity threat detected.
  final int? count;

  /// Severity level of the highest severity threat detected.
  final String? severity;

  /// Threat name of the highest severity threat detected as part of the malware
  /// scan.
  final String? threatName;

  HighestSeverityThreatDetails({
    this.count,
    this.severity,
    this.threatName,
  });

  factory HighestSeverityThreatDetails.fromJson(Map<String, dynamic> json) {
    return HighestSeverityThreatDetails(
      count: json['count'] as int?,
      severity: json['severity'] as String?,
      threatName: json['threatName'] as String?,
    );
  }
}

/// Represents a pre-existing file or directory on the host machine that the
/// volume maps to.
class HostPath {
  /// Path of the file or directory on the host that the volume maps to.
  final String? path;

  HostPath({
    this.path,
  });

  factory HostPath.fromJson(Map<String, dynamic> json) {
    return HostPath(
      path: json['path'] as String?,
    );
  }
}

/// Contains information about the EC2 instance profile.
class IamInstanceProfile {
  /// The profile ARN of the EC2 instance.
  final String? arn;

  /// The profile ID of the EC2 instance.
  final String? id;

  IamInstanceProfile({
    this.arn,
    this.id,
  });

  factory IamInstanceProfile.fromJson(Map<String, dynamic> json) {
    return IamInstanceProfile(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
    );
  }
}

/// Contains information about the impersonated user.
class ImpersonatedUser {
  /// The <code>group</code> to which the user name belongs.
  final List<String>? groups;

  /// Information about the <code>username</code> that was being impersonated.
  final String? username;

  ImpersonatedUser({
    this.groups,
    this.username,
  });

  factory ImpersonatedUser.fromJson(Map<String, dynamic> json) {
    return ImpersonatedUser(
      groups: (json['groups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      username: json['username'] as String?,
    );
  }
}

/// Contains information about the details of an instance.
class InstanceDetails {
  /// The Availability Zone of the EC2 instance.
  final String? availabilityZone;

  /// The profile information of the EC2 instance.
  final IamInstanceProfile? iamInstanceProfile;

  /// The image description of the EC2 instance.
  final String? imageDescription;

  /// The image ID of the EC2 instance.
  final String? imageId;

  /// The ID of the EC2 instance.
  final String? instanceId;

  /// The state of the EC2 instance.
  final String? instanceState;

  /// The type of the EC2 instance.
  final String? instanceType;

  /// The launch time of the EC2 instance.
  final String? launchTime;

  /// The elastic network interface information of the EC2 instance.
  final List<NetworkInterface>? networkInterfaces;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services Outpost. Only
  /// applicable to Amazon Web Services Outposts instances.
  final String? outpostArn;

  /// The platform of the EC2 instance.
  final String? platform;

  /// The product code of the EC2 instance.
  final List<ProductCode>? productCodes;

  /// The tags of the EC2 instance.
  final List<Tag>? tags;

  InstanceDetails({
    this.availabilityZone,
    this.iamInstanceProfile,
    this.imageDescription,
    this.imageId,
    this.instanceId,
    this.instanceState,
    this.instanceType,
    this.launchTime,
    this.networkInterfaces,
    this.outpostArn,
    this.platform,
    this.productCodes,
    this.tags,
  });

  factory InstanceDetails.fromJson(Map<String, dynamic> json) {
    return InstanceDetails(
      availabilityZone: json['availabilityZone'] as String?,
      iamInstanceProfile: json['iamInstanceProfile'] != null
          ? IamInstanceProfile.fromJson(
              json['iamInstanceProfile'] as Map<String, dynamic>)
          : null,
      imageDescription: json['imageDescription'] as String?,
      imageId: json['imageId'] as String?,
      instanceId: json['instanceId'] as String?,
      instanceState: json['instanceState'] as String?,
      instanceType: json['instanceType'] as String?,
      launchTime: json['launchTime'] as String?,
      networkInterfaces: (json['networkInterfaces'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkInterface.fromJson(e as Map<String, dynamic>))
          .toList(),
      outpostArn: json['outpostArn'] as String?,
      platform: json['platform'] as String?,
      productCodes: (json['productCodes'] as List?)
          ?.whereNotNull()
          .map((e) => ProductCode.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Contains information about the invitation to become a member account.
class Invitation {
  /// The ID of the account that the invitation was sent from.
  final String? accountId;

  /// The ID of the invitation. This value is used to validate the inviter account
  /// to the member account.
  final String? invitationId;

  /// The timestamp when the invitation was sent.
  final String? invitedAt;

  /// The status of the relationship between the inviter and invitee accounts.
  final String? relationshipStatus;

  Invitation({
    this.accountId,
    this.invitationId,
    this.invitedAt,
    this.relationshipStatus,
  });

  factory Invitation.fromJson(Map<String, dynamic> json) {
    return Invitation(
      accountId: json['accountId'] as String?,
      invitationId: json['invitationId'] as String?,
      invitedAt: json['invitedAt'] as String?,
      relationshipStatus: json['relationshipStatus'] as String?,
    );
  }
}

class InviteMembersResponse {
  /// A list of objects that contain the unprocessed account and a result string
  /// that explains why it was unprocessed.
  final List<UnprocessedAccount> unprocessedAccounts;

  InviteMembersResponse({
    required this.unprocessedAccounts,
  });

  factory InviteMembersResponse.fromJson(Map<String, dynamic> json) {
    return InviteMembersResponse(
      unprocessedAccounts: (json['unprocessedAccounts'] as List)
          .whereNotNull()
          .map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

enum IpSetFormat {
  txt('TXT'),
  stix('STIX'),
  otxCsv('OTX_CSV'),
  alienVault('ALIEN_VAULT'),
  proofPoint('PROOF_POINT'),
  fireEye('FIRE_EYE'),
  ;

  final String value;

  const IpSetFormat(this.value);

  static IpSetFormat fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum IpSetFormat'));
}

enum IpSetStatus {
  inactive('INACTIVE'),
  activating('ACTIVATING'),
  active('ACTIVE'),
  deactivating('DEACTIVATING'),
  error('ERROR'),
  deletePending('DELETE_PENDING'),
  deleted('DELETED'),
  ;

  final String value;

  const IpSetStatus(this.value);

  static IpSetStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum IpSetStatus'));
}

/// Information about the Kubernetes API call action described in this finding.
class KubernetesApiCallAction {
  /// The name of the namespace where the Kubernetes API call action takes place.
  final String? namespace;

  /// Parameters related to the Kubernetes API call action.
  final String? parameters;
  final RemoteIpDetails? remoteIpDetails;

  /// The Kubernetes API request URI.
  final String? requestUri;

  /// The resource component in the Kubernetes API call action.
  final String? resource;

  /// The name of the resource in the Kubernetes API call action.
  final String? resourceName;

  /// The IP of the Kubernetes API caller and the IPs of any proxies or load
  /// balancers between the caller and the API endpoint.
  final List<String>? sourceIps;

  /// The resulting HTTP response code of the Kubernetes API call action.
  final int? statusCode;

  /// The name of the sub-resource in the Kubernetes API call action.
  final String? subresource;

  /// The user agent of the caller of the Kubernetes API.
  final String? userAgent;

  /// The Kubernetes API request HTTP verb.
  final String? verb;

  KubernetesApiCallAction({
    this.namespace,
    this.parameters,
    this.remoteIpDetails,
    this.requestUri,
    this.resource,
    this.resourceName,
    this.sourceIps,
    this.statusCode,
    this.subresource,
    this.userAgent,
    this.verb,
  });

  factory KubernetesApiCallAction.fromJson(Map<String, dynamic> json) {
    return KubernetesApiCallAction(
      namespace: json['namespace'] as String?,
      parameters: json['parameters'] as String?,
      remoteIpDetails: json['remoteIpDetails'] != null
          ? RemoteIpDetails.fromJson(
              json['remoteIpDetails'] as Map<String, dynamic>)
          : null,
      requestUri: json['requestUri'] as String?,
      resource: json['resource'] as String?,
      resourceName: json['resourceName'] as String?,
      sourceIps: (json['sourceIps'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      statusCode: json['statusCode'] as int?,
      subresource: json['subresource'] as String?,
      userAgent: json['userAgent'] as String?,
      verb: json['verb'] as String?,
    );
  }
}

/// Describes whether Kubernetes audit logs are enabled as a data source.
class KubernetesAuditLogsConfiguration {
  /// The status of Kubernetes audit logs as a data source.
  final bool enable;

  KubernetesAuditLogsConfiguration({
    required this.enable,
  });

  Map<String, dynamic> toJson() {
    final enable = this.enable;
    return {
      'enable': enable,
    };
  }
}

/// Describes whether Kubernetes audit logs are enabled as a data source.
class KubernetesAuditLogsConfigurationResult {
  /// A value that describes whether Kubernetes audit logs are enabled as a data
  /// source.
  final DataSourceStatus status;

  KubernetesAuditLogsConfigurationResult({
    required this.status,
  });

  factory KubernetesAuditLogsConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return KubernetesAuditLogsConfigurationResult(
      status: DataSourceStatus.fromString((json['status'] as String)),
    );
  }
}

/// Describes whether any Kubernetes data sources are enabled.
class KubernetesConfiguration {
  /// The status of Kubernetes audit logs as a data source.
  final KubernetesAuditLogsConfiguration auditLogs;

  KubernetesConfiguration({
    required this.auditLogs,
  });

  Map<String, dynamic> toJson() {
    final auditLogs = this.auditLogs;
    return {
      'auditLogs': auditLogs,
    };
  }
}

/// Describes whether any Kubernetes logs will be enabled as a data source.
class KubernetesConfigurationResult {
  /// Describes whether Kubernetes audit logs are enabled as a data source.
  final KubernetesAuditLogsConfigurationResult auditLogs;

  KubernetesConfigurationResult({
    required this.auditLogs,
  });

  factory KubernetesConfigurationResult.fromJson(Map<String, dynamic> json) {
    return KubernetesConfigurationResult(
      auditLogs: KubernetesAuditLogsConfigurationResult.fromJson(
          json['auditLogs'] as Map<String, dynamic>),
    );
  }
}

/// Provides details about the Kubernetes resources when it is enabled as a data
/// source.
class KubernetesDataSourceFreeTrial {
  /// Describes whether Kubernetes audit logs are enabled as a data source.
  final DataSourceFreeTrial? auditLogs;

  KubernetesDataSourceFreeTrial({
    this.auditLogs,
  });

  factory KubernetesDataSourceFreeTrial.fromJson(Map<String, dynamic> json) {
    return KubernetesDataSourceFreeTrial(
      auditLogs: json['auditLogs'] != null
          ? DataSourceFreeTrial.fromJson(
              json['auditLogs'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Details about Kubernetes resources such as a Kubernetes user or workload
/// resource involved in a Kubernetes finding.
class KubernetesDetails {
  /// Details about the Kubernetes user involved in a Kubernetes finding.
  final KubernetesUserDetails? kubernetesUserDetails;

  /// Details about the Kubernetes workload involved in a Kubernetes finding.
  final KubernetesWorkloadDetails? kubernetesWorkloadDetails;

  KubernetesDetails({
    this.kubernetesUserDetails,
    this.kubernetesWorkloadDetails,
  });

  factory KubernetesDetails.fromJson(Map<String, dynamic> json) {
    return KubernetesDetails(
      kubernetesUserDetails: json['kubernetesUserDetails'] != null
          ? KubernetesUserDetails.fromJson(
              json['kubernetesUserDetails'] as Map<String, dynamic>)
          : null,
      kubernetesWorkloadDetails: json['kubernetesWorkloadDetails'] != null
          ? KubernetesWorkloadDetails.fromJson(
              json['kubernetesWorkloadDetails'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Information about the Kubernetes API for which you check if you have
/// permission to call.
class KubernetesPermissionCheckedDetails {
  /// Information whether the user has the permission to call the Kubernetes API.
  final bool? allowed;

  /// The namespace where the Kubernetes API action will take place.
  final String? namespace;

  /// The Kubernetes resource with which your Kubernetes API call will interact.
  final String? resource;

  /// The verb component of the Kubernetes API call. For example, when you check
  /// whether or not you have the permission to call the <code>CreatePod</code>
  /// API, the verb component will be <code>Create</code>.
  final String? verb;

  KubernetesPermissionCheckedDetails({
    this.allowed,
    this.namespace,
    this.resource,
    this.verb,
  });

  factory KubernetesPermissionCheckedDetails.fromJson(
      Map<String, dynamic> json) {
    return KubernetesPermissionCheckedDetails(
      allowed: json['allowed'] as bool?,
      namespace: json['namespace'] as String?,
      resource: json['resource'] as String?,
      verb: json['verb'] as String?,
    );
  }
}

/// Contains information about the role binding that grants the permission
/// defined in a Kubernetes role.
class KubernetesRoleBindingDetails {
  /// The kind of the role. For role binding, this value will be
  /// <code>RoleBinding</code>.
  final String? kind;

  /// The name of the <code>RoleBinding</code>.
  final String? name;

  /// The type of the role being referenced. This could be either
  /// <code>Role</code> or <code>ClusterRole</code>.
  final String? roleRefKind;

  /// The name of the role being referenced. This must match the name of the
  /// <code>Role</code> or <code>ClusterRole</code> that you want to bind to.
  final String? roleRefName;

  /// The unique identifier of the role binding.
  final String? uid;

  KubernetesRoleBindingDetails({
    this.kind,
    this.name,
    this.roleRefKind,
    this.roleRefName,
    this.uid,
  });

  factory KubernetesRoleBindingDetails.fromJson(Map<String, dynamic> json) {
    return KubernetesRoleBindingDetails(
      kind: json['kind'] as String?,
      name: json['name'] as String?,
      roleRefKind: json['roleRefKind'] as String?,
      roleRefName: json['roleRefName'] as String?,
      uid: json['uid'] as String?,
    );
  }
}

/// Information about the Kubernetes role name and role type.
class KubernetesRoleDetails {
  /// The kind of role. For this API, the value of <code>kind</code> will be
  /// <code>Role</code>.
  final String? kind;

  /// The name of the Kubernetes role.
  final String? name;

  /// The unique identifier of the Kubernetes role name.
  final String? uid;

  KubernetesRoleDetails({
    this.kind,
    this.name,
    this.uid,
  });

  factory KubernetesRoleDetails.fromJson(Map<String, dynamic> json) {
    return KubernetesRoleDetails(
      kind: json['kind'] as String?,
      name: json['name'] as String?,
      uid: json['uid'] as String?,
    );
  }
}

/// Details about the Kubernetes user involved in a Kubernetes finding.
class KubernetesUserDetails {
  /// The groups that include the user who called the Kubernetes API.
  final List<String>? groups;

  /// Information about the impersonated user.
  final ImpersonatedUser? impersonatedUser;

  /// Entity that assumes the IAM role when Kubernetes RBAC permissions are
  /// assigned to that role.
  final List<String>? sessionName;

  /// The user ID of the user who called the Kubernetes API.
  final String? uid;

  /// The username of the user who called the Kubernetes API.
  final String? username;

  KubernetesUserDetails({
    this.groups,
    this.impersonatedUser,
    this.sessionName,
    this.uid,
    this.username,
  });

  factory KubernetesUserDetails.fromJson(Map<String, dynamic> json) {
    return KubernetesUserDetails(
      groups: (json['groups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      impersonatedUser: json['impersonatedUser'] != null
          ? ImpersonatedUser.fromJson(
              json['impersonatedUser'] as Map<String, dynamic>)
          : null,
      sessionName: (json['sessionName'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      uid: json['uid'] as String?,
      username: json['username'] as String?,
    );
  }
}

/// Details about the Kubernetes workload involved in a Kubernetes finding.
class KubernetesWorkloadDetails {
  /// Containers running as part of the Kubernetes workload.
  final List<Container>? containers;

  /// Whether the host IPC flag is enabled for the pods in the workload.
  final bool? hostIPC;

  /// Whether the hostNetwork flag is enabled for the pods included in the
  /// workload.
  final bool? hostNetwork;

  /// Whether the host PID flag is enabled for the pods in the workload.
  final bool? hostPID;

  /// Kubernetes workload name.
  final String? name;

  /// Kubernetes namespace that the workload is part of.
  final String? namespace;

  /// The service account name that is associated with a Kubernetes workload.
  final String? serviceAccountName;

  /// Kubernetes workload type (e.g. Pod, Deployment, etc.).
  final String? type;

  /// Kubernetes workload ID.
  final String? uid;

  /// Volumes used by the Kubernetes workload.
  final List<Volume>? volumes;

  KubernetesWorkloadDetails({
    this.containers,
    this.hostIPC,
    this.hostNetwork,
    this.hostPID,
    this.name,
    this.namespace,
    this.serviceAccountName,
    this.type,
    this.uid,
    this.volumes,
  });

  factory KubernetesWorkloadDetails.fromJson(Map<String, dynamic> json) {
    return KubernetesWorkloadDetails(
      containers: (json['containers'] as List?)
          ?.whereNotNull()
          .map((e) => Container.fromJson(e as Map<String, dynamic>))
          .toList(),
      hostIPC: json['hostIPC'] as bool?,
      hostNetwork: json['hostNetwork'] as bool?,
      hostPID: json['hostPID'] as bool?,
      name: json['name'] as String?,
      namespace: json['namespace'] as String?,
      serviceAccountName: json['serviceAccountName'] as String?,
      type: json['type'] as String?,
      uid: json['uid'] as String?,
      volumes: (json['volumes'] as List?)
          ?.whereNotNull()
          .map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Information about the Lambda function involved in the finding.
class LambdaDetails {
  /// Description of the Lambda function.
  final String? description;

  /// Amazon Resource Name (ARN) of the Lambda function.
  final String? functionArn;

  /// Name of the Lambda function.
  final String? functionName;

  /// The version of the Lambda function.
  final String? functionVersion;

  /// The timestamp when the Lambda function was last modified. This field is in
  /// the UTC date string format <code>(2023-03-22T19:37:20.168Z)</code>.
  final DateTime? lastModifiedAt;

  /// The revision ID of the Lambda function version.
  final String? revisionId;

  /// The execution role of the Lambda function.
  final String? role;

  /// A list of tags attached to this resource, listed in the format of
  /// <code>key</code>:<code>value</code> pair.
  final List<Tag>? tags;

  /// Amazon Virtual Private Cloud configuration details associated with your
  /// Lambda function.
  final VpcConfig? vpcConfig;

  LambdaDetails({
    this.description,
    this.functionArn,
    this.functionName,
    this.functionVersion,
    this.lastModifiedAt,
    this.revisionId,
    this.role,
    this.tags,
    this.vpcConfig,
  });

  factory LambdaDetails.fromJson(Map<String, dynamic> json) {
    return LambdaDetails(
      description: json['description'] as String?,
      functionArn: json['functionArn'] as String?,
      functionName: json['functionName'] as String?,
      functionVersion: json['functionVersion'] as String?,
      lastModifiedAt: timeStampFromJson(json['lastModifiedAt']),
      revisionId: json['revisionId'] as String?,
      role: json['role'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcConfig: json['vpcConfig'] != null
          ? VpcConfig.fromJson(json['vpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Information about the runtime process details.
class LineageObject {
  /// The effective user ID that was used to execute the process.
  final int? euid;

  /// The absolute path of the process executable file.
  final String? executablePath;

  /// The name of the process.
  final String? name;

  /// The process ID of the child process.
  final int? namespacePid;

  /// The unique ID of the parent process. This ID is assigned to the parent
  /// process by GuardDuty.
  final String? parentUuid;

  /// The ID of the process.
  final int? pid;

  /// The time when the process started. This is in UTC format.
  final DateTime? startTime;

  /// The user ID of the user that executed the process.
  final int? userId;

  /// The unique ID assigned to the process by GuardDuty.
  final String? uuid;

  LineageObject({
    this.euid,
    this.executablePath,
    this.name,
    this.namespacePid,
    this.parentUuid,
    this.pid,
    this.startTime,
    this.userId,
    this.uuid,
  });

  factory LineageObject.fromJson(Map<String, dynamic> json) {
    return LineageObject(
      euid: json['euid'] as int?,
      executablePath: json['executablePath'] as String?,
      name: json['name'] as String?,
      namespacePid: json['namespacePid'] as int?,
      parentUuid: json['parentUuid'] as String?,
      pid: json['pid'] as int?,
      startTime: timeStampFromJson(json['startTime']),
      userId: json['userId'] as int?,
      uuid: json['uuid'] as String?,
    );
  }
}

class ListCoverageResponse {
  /// A list of resources and their attributes providing cluster details.
  final List<CoverageResource> resources;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  final String? nextToken;

  ListCoverageResponse({
    required this.resources,
    this.nextToken,
  });

  factory ListCoverageResponse.fromJson(Map<String, dynamic> json) {
    return ListCoverageResponse(
      resources: (json['resources'] as List)
          .whereNotNull()
          .map((e) => CoverageResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListDetectorsResponse {
  /// A list of detector IDs.
  final List<String> detectorIds;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  final String? nextToken;

  ListDetectorsResponse({
    required this.detectorIds,
    this.nextToken,
  });

  factory ListDetectorsResponse.fromJson(Map<String, dynamic> json) {
    return ListDetectorsResponse(
      detectorIds: (json['detectorIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListFiltersResponse {
  /// A list of filter names.
  final List<String> filterNames;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  final String? nextToken;

  ListFiltersResponse({
    required this.filterNames,
    this.nextToken,
  });

  factory ListFiltersResponse.fromJson(Map<String, dynamic> json) {
    return ListFiltersResponse(
      filterNames: (json['filterNames'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListFindingsResponse {
  /// The IDs of the findings that you're listing.
  final List<String> findingIds;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  final String? nextToken;

  ListFindingsResponse({
    required this.findingIds,
    this.nextToken,
  });

  factory ListFindingsResponse.fromJson(Map<String, dynamic> json) {
    return ListFindingsResponse(
      findingIds: (json['findingIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListIPSetsResponse {
  /// The IDs of the IPSet resources.
  final List<String> ipSetIds;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  final String? nextToken;

  ListIPSetsResponse({
    required this.ipSetIds,
    this.nextToken,
  });

  factory ListIPSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListIPSetsResponse(
      ipSetIds: (json['ipSetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListInvitationsResponse {
  /// A list of invitation descriptions.
  final List<Invitation>? invitations;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  final String? nextToken;

  ListInvitationsResponse({
    this.invitations,
    this.nextToken,
  });

  factory ListInvitationsResponse.fromJson(Map<String, dynamic> json) {
    return ListInvitationsResponse(
      invitations: (json['invitations'] as List?)
          ?.whereNotNull()
          .map((e) => Invitation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListMembersResponse {
  /// A list of members.
  /// <note>
  /// The values for <code>email</code> and <code>invitedAt</code> are available
  /// only if the member accounts are added by invitation.
  /// </note>
  final List<Member>? members;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  final String? nextToken;

  ListMembersResponse({
    this.members,
    this.nextToken,
  });

  factory ListMembersResponse.fromJson(Map<String, dynamic> json) {
    return ListMembersResponse(
      members: (json['members'] as List?)
          ?.whereNotNull()
          .map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListOrganizationAdminAccountsResponse {
  /// A list of accounts configured as GuardDuty delegated administrators.
  final List<AdminAccount>? adminAccounts;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  final String? nextToken;

  ListOrganizationAdminAccountsResponse({
    this.adminAccounts,
    this.nextToken,
  });

  factory ListOrganizationAdminAccountsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListOrganizationAdminAccountsResponse(
      adminAccounts: (json['adminAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => AdminAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListPublishingDestinationsResponse {
  /// A <code>Destinations</code> object that includes information about each
  /// publishing destination returned.
  final List<Destination> destinations;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request to a list action.
  /// For subsequent calls, use the <code>NextToken</code> value returned from the
  /// previous request to continue listing results after the first page.
  final String? nextToken;

  ListPublishingDestinationsResponse({
    required this.destinations,
    this.nextToken,
  });

  factory ListPublishingDestinationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListPublishingDestinationsResponse(
      destinations: (json['destinations'] as List)
          .whereNotNull()
          .map((e) => Destination.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

class ListTagsForResourceResponse {
  /// The tags associated with the resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

class ListThreatIntelSetsResponse {
  /// The IDs of the ThreatIntelSet resources.
  final List<String> threatIntelSetIds;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  final String? nextToken;

  ListThreatIntelSetsResponse({
    required this.threatIntelSetIds,
    this.nextToken,
  });

  factory ListThreatIntelSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListThreatIntelSetsResponse(
      threatIntelSetIds: (json['threatIntelSetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }
}

/// Contains information about the local IP address of the connection.
class LocalIpDetails {
  /// The IPv4 local address of the connection.
  final String? ipAddressV4;

  /// The IPv6 local address of the connection.
  final String? ipAddressV6;

  LocalIpDetails({
    this.ipAddressV4,
    this.ipAddressV6,
  });

  factory LocalIpDetails.fromJson(Map<String, dynamic> json) {
    return LocalIpDetails(
      ipAddressV4: json['ipAddressV4'] as String?,
      ipAddressV6: json['ipAddressV6'] as String?,
    );
  }
}

/// Contains information about the port for the local connection.
class LocalPortDetails {
  /// The port number of the local connection.
  final int? port;

  /// The port name of the local connection.
  final String? portName;

  LocalPortDetails({
    this.port,
    this.portName,
  });

  factory LocalPortDetails.fromJson(Map<String, dynamic> json) {
    return LocalPortDetails(
      port: json['port'] as int?,
      portName: json['portName'] as String?,
    );
  }
}

/// Information about the login attempts.
class LoginAttribute {
  /// Indicates the application name used to attempt log in.
  final String? application;

  /// Represents the sum of failed (unsuccessful) login attempts made to establish
  /// a connection to the database instance.
  final int? failedLoginAttempts;

  /// Represents the sum of successful connections (a correct combination of login
  /// attributes) made to the database instance by the actor.
  final int? successfulLoginAttempts;

  /// Indicates the user name which attempted to log in.
  final String? user;

  LoginAttribute({
    this.application,
    this.failedLoginAttempts,
    this.successfulLoginAttempts,
    this.user,
  });

  factory LoginAttribute.fromJson(Map<String, dynamic> json) {
    return LoginAttribute(
      application: json['application'] as String?,
      failedLoginAttempts: json['failedLoginAttempts'] as int?,
      successfulLoginAttempts: json['successfulLoginAttempts'] as int?,
      user: json['user'] as String?,
    );
  }
}

/// Describes whether Malware Protection will be enabled as a data source.
class MalwareProtectionConfiguration {
  /// Describes the configuration of Malware Protection for EC2 instances with
  /// findings.
  final ScanEc2InstanceWithFindings? scanEc2InstanceWithFindings;

  MalwareProtectionConfiguration({
    this.scanEc2InstanceWithFindings,
  });

  Map<String, dynamic> toJson() {
    final scanEc2InstanceWithFindings = this.scanEc2InstanceWithFindings;
    return {
      if (scanEc2InstanceWithFindings != null)
        'scanEc2InstanceWithFindings': scanEc2InstanceWithFindings,
    };
  }
}

/// An object that contains information on the status of all Malware Protection
/// data sources.
class MalwareProtectionConfigurationResult {
  /// Describes the configuration of Malware Protection for EC2 instances with
  /// findings.
  final ScanEc2InstanceWithFindingsResult? scanEc2InstanceWithFindings;

  /// The GuardDuty Malware Protection service role.
  final String? serviceRole;

  MalwareProtectionConfigurationResult({
    this.scanEc2InstanceWithFindings,
    this.serviceRole,
  });

  factory MalwareProtectionConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return MalwareProtectionConfigurationResult(
      scanEc2InstanceWithFindings: json['scanEc2InstanceWithFindings'] != null
          ? ScanEc2InstanceWithFindingsResult.fromJson(
              json['scanEc2InstanceWithFindings'] as Map<String, dynamic>)
          : null,
      serviceRole: json['serviceRole'] as String?,
    );
  }
}

/// Provides details about Malware Protection when it is enabled as a data
/// source.
class MalwareProtectionDataSourceFreeTrial {
  /// Describes whether Malware Protection for EC2 instances with findings is
  /// enabled as a data source.
  final DataSourceFreeTrial? scanEc2InstanceWithFindings;

  MalwareProtectionDataSourceFreeTrial({
    this.scanEc2InstanceWithFindings,
  });

  factory MalwareProtectionDataSourceFreeTrial.fromJson(
      Map<String, dynamic> json) {
    return MalwareProtectionDataSourceFreeTrial(
      scanEc2InstanceWithFindings: json['scanEc2InstanceWithFindings'] != null
          ? DataSourceFreeTrial.fromJson(
              json['scanEc2InstanceWithFindings'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum ManagementType {
  autoManaged('AUTO_MANAGED'),
  manual('MANUAL'),
  disabled('DISABLED'),
  ;

  final String value;

  const ManagementType(this.value);

  static ManagementType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ManagementType'));
}

/// Contains information about the administrator account and invitation.
class Master {
  /// The ID of the account used as the administrator account.
  final String? accountId;

  /// The value used to validate the administrator account to the member account.
  final String? invitationId;

  /// The timestamp when the invitation was sent.
  final String? invitedAt;

  /// The status of the relationship between the administrator and member
  /// accounts.
  final String? relationshipStatus;

  Master({
    this.accountId,
    this.invitationId,
    this.invitedAt,
    this.relationshipStatus,
  });

  factory Master.fromJson(Map<String, dynamic> json) {
    return Master(
      accountId: json['accountId'] as String?,
      invitationId: json['invitationId'] as String?,
      invitedAt: json['invitedAt'] as String?,
      relationshipStatus: json['relationshipStatus'] as String?,
    );
  }
}

/// Contains information about the member account.
class Member {
  /// The ID of the member account.
  final String accountId;

  /// The email address of the member account.
  final String email;

  /// The administrator account ID.
  final String masterId;

  /// The status of the relationship between the member and the administrator.
  final String relationshipStatus;

  /// The last-updated timestamp of the member.
  final String updatedAt;

  /// The administrator account ID.
  final String? administratorId;

  /// The detector ID of the member account.
  final String? detectorId;

  /// The timestamp when the invitation was sent.
  final String? invitedAt;

  Member({
    required this.accountId,
    required this.email,
    required this.masterId,
    required this.relationshipStatus,
    required this.updatedAt,
    this.administratorId,
    this.detectorId,
    this.invitedAt,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      accountId: json['accountId'] as String,
      email: json['email'] as String,
      masterId: json['masterId'] as String,
      relationshipStatus: json['relationshipStatus'] as String,
      updatedAt: json['updatedAt'] as String,
      administratorId: json['administratorId'] as String?,
      detectorId: json['detectorId'] as String?,
      invitedAt: json['invitedAt'] as String?,
    );
  }
}

/// Information about the additional configuration for the member account.
class MemberAdditionalConfiguration {
  /// Name of the additional configuration.
  final OrgFeatureAdditionalConfiguration? name;

  /// Status of the additional configuration.
  final FeatureStatus? status;

  MemberAdditionalConfiguration({
    this.name,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    return {
      if (name != null) 'name': name.value,
      if (status != null) 'status': status.value,
    };
  }
}

/// Information about the additional configuration for the member account.
class MemberAdditionalConfigurationResult {
  /// Indicates the name of the additional configuration that is set for the
  /// member account.
  final OrgFeatureAdditionalConfiguration? name;

  /// Indicates the status of the additional configuration that is set for the
  /// member account.
  final FeatureStatus? status;

  /// The timestamp at which the additional configuration was set for the member
  /// account. This is in UTC format.
  final DateTime? updatedAt;

  MemberAdditionalConfigurationResult({
    this.name,
    this.status,
    this.updatedAt,
  });

  factory MemberAdditionalConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return MemberAdditionalConfigurationResult(
      name: (json['name'] as String?)
          ?.let(OrgFeatureAdditionalConfiguration.fromString),
      status: (json['status'] as String?)?.let(FeatureStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }
}

/// Contains information on which data sources are enabled for a member account.
class MemberDataSourceConfiguration {
  /// The account ID for the member account.
  final String accountId;

  /// Contains information on the status of data sources for the account.
  final DataSourceConfigurationsResult? dataSources;

  /// Contains information about the status of the features for the member
  /// account.
  final List<MemberFeaturesConfigurationResult>? features;

  MemberDataSourceConfiguration({
    required this.accountId,
    this.dataSources,
    this.features,
  });

  factory MemberDataSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return MemberDataSourceConfiguration(
      accountId: json['accountId'] as String,
      dataSources: json['dataSources'] != null
          ? DataSourceConfigurationsResult.fromJson(
              json['dataSources'] as Map<String, dynamic>)
          : null,
      features: (json['features'] as List?)
          ?.whereNotNull()
          .map((e) => MemberFeaturesConfigurationResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Contains information about the features for the member account.
class MemberFeaturesConfiguration {
  /// Additional configuration of the feature for the member account.
  final List<MemberAdditionalConfiguration>? additionalConfiguration;

  /// The name of the feature.
  final OrgFeature? name;

  /// The status of the feature.
  final FeatureStatus? status;

  MemberFeaturesConfiguration({
    this.additionalConfiguration,
    this.name,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final additionalConfiguration = this.additionalConfiguration;
    final name = this.name;
    final status = this.status;
    return {
      if (additionalConfiguration != null)
        'additionalConfiguration': additionalConfiguration,
      if (name != null) 'name': name.value,
      if (status != null) 'status': status.value,
    };
  }
}

/// Contains information about the features for the member account.
class MemberFeaturesConfigurationResult {
  /// Indicates the additional configuration of the feature that is configured for
  /// the member account.
  final List<MemberAdditionalConfigurationResult>? additionalConfiguration;

  /// Indicates the name of the feature that is enabled for the detector.
  final OrgFeature? name;

  /// Indicates the status of the feature that is enabled for the detector.
  final FeatureStatus? status;

  /// The timestamp at which the feature object was updated.
  final DateTime? updatedAt;

  MemberFeaturesConfigurationResult({
    this.additionalConfiguration,
    this.name,
    this.status,
    this.updatedAt,
  });

  factory MemberFeaturesConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return MemberFeaturesConfigurationResult(
      additionalConfiguration: (json['additionalConfiguration'] as List?)
          ?.whereNotNull()
          .map((e) => MemberAdditionalConfigurationResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      name: (json['name'] as String?)?.let(OrgFeature.fromString),
      status: (json['status'] as String?)?.let(FeatureStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }
}

/// Contains information about the NETWORK_CONNECTION action described in the
/// finding.
class NetworkConnectionAction {
  /// Indicates whether EC2 blocked the network connection to your instance.
  final bool? blocked;

  /// The network connection direction.
  final String? connectionDirection;

  /// The local IP information of the connection.
  final LocalIpDetails? localIpDetails;

  /// The local port information of the connection.
  final LocalPortDetails? localPortDetails;

  /// The network connection protocol.
  final String? protocol;

  /// The remote IP information of the connection.
  final RemoteIpDetails? remoteIpDetails;

  /// The remote port information of the connection.
  final RemotePortDetails? remotePortDetails;

  NetworkConnectionAction({
    this.blocked,
    this.connectionDirection,
    this.localIpDetails,
    this.localPortDetails,
    this.protocol,
    this.remoteIpDetails,
    this.remotePortDetails,
  });

  factory NetworkConnectionAction.fromJson(Map<String, dynamic> json) {
    return NetworkConnectionAction(
      blocked: json['blocked'] as bool?,
      connectionDirection: json['connectionDirection'] as String?,
      localIpDetails: json['localIpDetails'] != null
          ? LocalIpDetails.fromJson(
              json['localIpDetails'] as Map<String, dynamic>)
          : null,
      localPortDetails: json['localPortDetails'] != null
          ? LocalPortDetails.fromJson(
              json['localPortDetails'] as Map<String, dynamic>)
          : null,
      protocol: json['protocol'] as String?,
      remoteIpDetails: json['remoteIpDetails'] != null
          ? RemoteIpDetails.fromJson(
              json['remoteIpDetails'] as Map<String, dynamic>)
          : null,
      remotePortDetails: json['remotePortDetails'] != null
          ? RemotePortDetails.fromJson(
              json['remotePortDetails'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains information about the elastic network interface of the EC2
/// instance.
class NetworkInterface {
  /// A list of IPv6 addresses for the EC2 instance.
  final List<String>? ipv6Addresses;

  /// The ID of the network interface.
  final String? networkInterfaceId;

  /// The private DNS name of the EC2 instance.
  final String? privateDnsName;

  /// The private IP address of the EC2 instance.
  final String? privateIpAddress;

  /// Other private IP address information of the EC2 instance.
  final List<PrivateIpAddressDetails>? privateIpAddresses;

  /// The public DNS name of the EC2 instance.
  final String? publicDnsName;

  /// The public IP address of the EC2 instance.
  final String? publicIp;

  /// The security groups associated with the EC2 instance.
  final List<SecurityGroup>? securityGroups;

  /// The subnet ID of the EC2 instance.
  final String? subnetId;

  /// The VPC ID of the EC2 instance.
  final String? vpcId;

  NetworkInterface({
    this.ipv6Addresses,
    this.networkInterfaceId,
    this.privateDnsName,
    this.privateIpAddress,
    this.privateIpAddresses,
    this.publicDnsName,
    this.publicIp,
    this.securityGroups,
    this.subnetId,
    this.vpcId,
  });

  factory NetworkInterface.fromJson(Map<String, dynamic> json) {
    return NetworkInterface(
      ipv6Addresses: (json['ipv6Addresses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      networkInterfaceId: json['networkInterfaceId'] as String?,
      privateDnsName: json['privateDnsName'] as String?,
      privateIpAddress: json['privateIpAddress'] as String?,
      privateIpAddresses: (json['privateIpAddresses'] as List?)
          ?.whereNotNull()
          .map((e) =>
              PrivateIpAddressDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      publicDnsName: json['publicDnsName'] as String?,
      publicIp: json['publicIp'] as String?,
      securityGroups: (json['securityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => SecurityGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      subnetId: json['subnetId'] as String?,
      vpcId: json['vpcId'] as String?,
    );
  }
}

/// Contains information about the observed behavior.
class Observations {
  /// The text that was unusual.
  final List<String>? text;

  Observations({
    this.text,
  });

  factory Observations.fromJson(Map<String, dynamic> json) {
    return Observations(
      text: (json['text'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }
}

enum OrderBy {
  asc('ASC'),
  desc('DESC'),
  ;

  final String value;

  const OrderBy(this.value);

  static OrderBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum OrderBy'));
}

enum OrgFeature {
  s3DataEvents('S3_DATA_EVENTS'),
  eksAuditLogs('EKS_AUDIT_LOGS'),
  ebsMalwareProtection('EBS_MALWARE_PROTECTION'),
  rdsLoginEvents('RDS_LOGIN_EVENTS'),
  eksRuntimeMonitoring('EKS_RUNTIME_MONITORING'),
  lambdaNetworkLogs('LAMBDA_NETWORK_LOGS'),
  runtimeMonitoring('RUNTIME_MONITORING'),
  ;

  final String value;

  const OrgFeature(this.value);

  static OrgFeature fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum OrgFeature'));
}

enum OrgFeatureAdditionalConfiguration {
  eksAddonManagement('EKS_ADDON_MANAGEMENT'),
  ecsFargateAgentManagement('ECS_FARGATE_AGENT_MANAGEMENT'),
  ec2AgentManagement('EC2_AGENT_MANAGEMENT'),
  ;

  final String value;

  const OrgFeatureAdditionalConfiguration(this.value);

  static OrgFeatureAdditionalConfiguration fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum OrgFeatureAdditionalConfiguration'));
}

enum OrgFeatureStatus {
  $new('NEW'),
  none('NONE'),
  all('ALL'),
  ;

  final String value;

  const OrgFeatureStatus(this.value);

  static OrgFeatureStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum OrgFeatureStatus'));
}

/// Contains information about the ISP organization of the remote IP address.
class Organization {
  /// The Autonomous System Number (ASN) of the internet provider of the remote IP
  /// address.
  final String? asn;

  /// The organization that registered this ASN.
  final String? asnOrg;

  /// The ISP information for the internet provider.
  final String? isp;

  /// The name of the internet provider.
  final String? org;

  Organization({
    this.asn,
    this.asnOrg,
    this.isp,
    this.org,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      asn: json['asn'] as String?,
      asnOrg: json['asnOrg'] as String?,
      isp: json['isp'] as String?,
      org: json['org'] as String?,
    );
  }
}

/// A list of additional configurations which will be configured for the
/// organization.
class OrganizationAdditionalConfiguration {
  /// The status of the additional configuration that will be configured for the
  /// organization. Use one of the following values to configure the feature
  /// status for the entire organization:
  ///
  /// <ul>
  /// <li>
  /// <code>NEW</code>: Indicates that when a new account joins the organization,
  /// they will have the additional configuration enabled automatically.
  /// </li>
  /// <li>
  /// <code>ALL</code>: Indicates that all accounts in the organization have the
  /// additional configuration enabled automatically. This includes
  /// <code>NEW</code> accounts that join the organization and accounts that may
  /// have been suspended or removed from the organization in GuardDuty.
  ///
  /// It may take up to 24 hours to update the configuration for all the member
  /// accounts.
  /// </li>
  /// <li>
  /// <code>NONE</code>: Indicates that the additional configuration will not be
  /// automatically enabled for any account in the organization. The administrator
  /// must manage the additional configuration for each account individually.
  /// </li>
  /// </ul>
  final OrgFeatureStatus? autoEnable;

  /// The name of the additional configuration that will be configured for the
  /// organization.
  final OrgFeatureAdditionalConfiguration? name;

  OrganizationAdditionalConfiguration({
    this.autoEnable,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final autoEnable = this.autoEnable;
    final name = this.name;
    return {
      if (autoEnable != null) 'autoEnable': autoEnable.value,
      if (name != null) 'name': name.value,
    };
  }
}

/// A list of additional configuration which will be configured for the
/// organization.
class OrganizationAdditionalConfigurationResult {
  /// Describes the status of the additional configuration that is configured for
  /// the member accounts within the organization. One of the following values is
  /// the status for the entire organization:
  ///
  /// <ul>
  /// <li>
  /// <code>NEW</code>: Indicates that when a new account joins the organization,
  /// they will have the additional configuration enabled automatically.
  /// </li>
  /// <li>
  /// <code>ALL</code>: Indicates that all accounts in the organization have the
  /// additional configuration enabled automatically. This includes
  /// <code>NEW</code> accounts that join the organization and accounts that may
  /// have been suspended or removed from the organization in GuardDuty.
  ///
  /// It may take up to 24 hours to update the configuration for all the member
  /// accounts.
  /// </li>
  /// <li>
  /// <code>NONE</code>: Indicates that the additional configuration will not be
  /// automatically enabled for any account in the organization. The administrator
  /// must manage the additional configuration for each account individually.
  /// </li>
  /// </ul>
  final OrgFeatureStatus? autoEnable;

  /// The name of the additional configuration that is configured for the member
  /// accounts within the organization.
  final OrgFeatureAdditionalConfiguration? name;

  OrganizationAdditionalConfigurationResult({
    this.autoEnable,
    this.name,
  });

  factory OrganizationAdditionalConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return OrganizationAdditionalConfigurationResult(
      autoEnable:
          (json['autoEnable'] as String?)?.let(OrgFeatureStatus.fromString),
      name: (json['name'] as String?)
          ?.let(OrgFeatureAdditionalConfiguration.fromString),
    );
  }
}

/// An object that contains information on which data sources will be configured
/// to be automatically enabled for new members within the organization.
class OrganizationDataSourceConfigurations {
  /// Describes the configuration of Kubernetes data sources for new members of
  /// the organization.
  final OrganizationKubernetesConfiguration? kubernetes;

  /// Describes the configuration of Malware Protection for new members of the
  /// organization.
  final OrganizationMalwareProtectionConfiguration? malwareProtection;

  /// Describes whether S3 data event logs are enabled for new members of the
  /// organization.
  final OrganizationS3LogsConfiguration? s3Logs;

  OrganizationDataSourceConfigurations({
    this.kubernetes,
    this.malwareProtection,
    this.s3Logs,
  });

  Map<String, dynamic> toJson() {
    final kubernetes = this.kubernetes;
    final malwareProtection = this.malwareProtection;
    final s3Logs = this.s3Logs;
    return {
      if (kubernetes != null) 'kubernetes': kubernetes,
      if (malwareProtection != null) 'malwareProtection': malwareProtection,
      if (s3Logs != null) 's3Logs': s3Logs,
    };
  }
}

/// An object that contains information on which data sources are automatically
/// enabled for new members within the organization.
class OrganizationDataSourceConfigurationsResult {
  /// Describes whether S3 data event logs are enabled as a data source.
  final OrganizationS3LogsConfigurationResult s3Logs;

  /// Describes the configuration of Kubernetes data sources.
  final OrganizationKubernetesConfigurationResult? kubernetes;

  /// Describes the configuration of Malware Protection data source for an
  /// organization.
  final OrganizationMalwareProtectionConfigurationResult? malwareProtection;

  OrganizationDataSourceConfigurationsResult({
    required this.s3Logs,
    this.kubernetes,
    this.malwareProtection,
  });

  factory OrganizationDataSourceConfigurationsResult.fromJson(
      Map<String, dynamic> json) {
    return OrganizationDataSourceConfigurationsResult(
      s3Logs: OrganizationS3LogsConfigurationResult.fromJson(
          json['s3Logs'] as Map<String, dynamic>),
      kubernetes: json['kubernetes'] != null
          ? OrganizationKubernetesConfigurationResult.fromJson(
              json['kubernetes'] as Map<String, dynamic>)
          : null,
      malwareProtection: json['malwareProtection'] != null
          ? OrganizationMalwareProtectionConfigurationResult.fromJson(
              json['malwareProtection'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Information about GuardDuty coverage statistics for members in your Amazon
/// Web Services organization.
class OrganizationDetails {
  /// Information about the GuardDuty coverage statistics for members in your
  /// Amazon Web Services organization.
  final OrganizationStatistics? organizationStatistics;

  /// The timestamp at which the organization statistics was last updated. This is
  /// in UTC format.
  final DateTime? updatedAt;

  OrganizationDetails({
    this.organizationStatistics,
    this.updatedAt,
  });

  factory OrganizationDetails.fromJson(Map<String, dynamic> json) {
    return OrganizationDetails(
      organizationStatistics: json['organizationStatistics'] != null
          ? OrganizationStatistics.fromJson(
              json['organizationStatistics'] as Map<String, dynamic>)
          : null,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }
}

/// Organization-wide EBS volumes scan configuration.
class OrganizationEbsVolumes {
  /// Whether scanning EBS volumes should be auto-enabled for new members joining
  /// the organization.
  final bool? autoEnable;

  OrganizationEbsVolumes({
    this.autoEnable,
  });

  Map<String, dynamic> toJson() {
    final autoEnable = this.autoEnable;
    return {
      if (autoEnable != null) 'autoEnable': autoEnable,
    };
  }
}

/// An object that contains information on the status of whether EBS volumes
/// scanning will be enabled as a data source for an organization.
class OrganizationEbsVolumesResult {
  /// An object that contains the status of whether scanning EBS volumes should be
  /// auto-enabled for new members joining the organization.
  final bool? autoEnable;

  OrganizationEbsVolumesResult({
    this.autoEnable,
  });

  factory OrganizationEbsVolumesResult.fromJson(Map<String, dynamic> json) {
    return OrganizationEbsVolumesResult(
      autoEnable: json['autoEnable'] as bool?,
    );
  }
}

/// A list of features which will be configured for the organization.
class OrganizationFeatureConfiguration {
  /// The additional information that will be configured for the organization.
  final List<OrganizationAdditionalConfiguration>? additionalConfiguration;

  /// Describes the status of the feature that is configured for the member
  /// accounts within the organization. One of the following values is the status
  /// for the entire organization:
  ///
  /// <ul>
  /// <li>
  /// <code>NEW</code>: Indicates that when a new account joins the organization,
  /// they will have the feature enabled automatically.
  /// </li>
  /// <li>
  /// <code>ALL</code>: Indicates that all accounts in the organization have the
  /// feature enabled automatically. This includes <code>NEW</code> accounts that
  /// join the organization and accounts that may have been suspended or removed
  /// from the organization in GuardDuty.
  ///
  /// It may take up to 24 hours to update the configuration for all the member
  /// accounts.
  /// </li>
  /// <li>
  /// <code>NONE</code>: Indicates that the feature will not be automatically
  /// enabled for any account in the organization. The administrator must manage
  /// the feature for each account individually.
  /// </li>
  /// </ul>
  final OrgFeatureStatus? autoEnable;

  /// The name of the feature that will be configured for the organization.
  final OrgFeature? name;

  OrganizationFeatureConfiguration({
    this.additionalConfiguration,
    this.autoEnable,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final additionalConfiguration = this.additionalConfiguration;
    final autoEnable = this.autoEnable;
    final name = this.name;
    return {
      if (additionalConfiguration != null)
        'additionalConfiguration': additionalConfiguration,
      if (autoEnable != null) 'autoEnable': autoEnable.value,
      if (name != null) 'name': name.value,
    };
  }
}

/// A list of features which will be configured for the organization.
class OrganizationFeatureConfigurationResult {
  /// The additional configuration that is configured for the member accounts
  /// within the organization.
  final List<OrganizationAdditionalConfigurationResult>?
      additionalConfiguration;

  /// Describes the status of the feature that is configured for the member
  /// accounts within the organization.
  ///
  /// <ul>
  /// <li>
  /// <code>NEW</code>: Indicates that when a new account joins the organization,
  /// they will have the feature enabled automatically.
  /// </li>
  /// <li>
  /// <code>ALL</code>: Indicates that all accounts in the organization have the
  /// feature enabled automatically. This includes <code>NEW</code> accounts that
  /// join the organization and accounts that may have been suspended or removed
  /// from the organization in GuardDuty.
  /// </li>
  /// <li>
  /// <code>NONE</code>: Indicates that the feature will not be automatically
  /// enabled for any account in the organization. In this case, each account will
  /// be managed individually by the administrator.
  /// </li>
  /// </ul>
  final OrgFeatureStatus? autoEnable;

  /// The name of the feature that is configured for the member accounts within
  /// the organization.
  final OrgFeature? name;

  OrganizationFeatureConfigurationResult({
    this.additionalConfiguration,
    this.autoEnable,
    this.name,
  });

  factory OrganizationFeatureConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return OrganizationFeatureConfigurationResult(
      additionalConfiguration: (json['additionalConfiguration'] as List?)
          ?.whereNotNull()
          .map((e) => OrganizationAdditionalConfigurationResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      autoEnable:
          (json['autoEnable'] as String?)?.let(OrgFeatureStatus.fromString),
      name: (json['name'] as String?)?.let(OrgFeature.fromString),
    );
  }
}

/// Information about the number of accounts that have enabled a specific
/// feature.
class OrganizationFeatureStatistics {
  /// Name of the additional configuration.
  final List<OrganizationFeatureStatisticsAdditionalConfiguration>?
      additionalConfiguration;

  /// Total number of accounts that have enabled a specific feature.
  final int? enabledAccountsCount;

  /// Name of the feature.
  final OrgFeature? name;

  OrganizationFeatureStatistics({
    this.additionalConfiguration,
    this.enabledAccountsCount,
    this.name,
  });

  factory OrganizationFeatureStatistics.fromJson(Map<String, dynamic> json) {
    return OrganizationFeatureStatistics(
      additionalConfiguration: (json['additionalConfiguration'] as List?)
          ?.whereNotNull()
          .map((e) =>
              OrganizationFeatureStatisticsAdditionalConfiguration.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      enabledAccountsCount: json['enabledAccountsCount'] as int?,
      name: (json['name'] as String?)?.let(OrgFeature.fromString),
    );
  }
}

/// Information about the coverage statistic for the additional configuration of
/// the feature.
class OrganizationFeatureStatisticsAdditionalConfiguration {
  /// Total number of accounts that have enabled the additional configuration.
  final int? enabledAccountsCount;

  /// Name of the additional configuration within a feature.
  final OrgFeatureAdditionalConfiguration? name;

  OrganizationFeatureStatisticsAdditionalConfiguration({
    this.enabledAccountsCount,
    this.name,
  });

  factory OrganizationFeatureStatisticsAdditionalConfiguration.fromJson(
      Map<String, dynamic> json) {
    return OrganizationFeatureStatisticsAdditionalConfiguration(
      enabledAccountsCount: json['enabledAccountsCount'] as int?,
      name: (json['name'] as String?)
          ?.let(OrgFeatureAdditionalConfiguration.fromString),
    );
  }
}

/// Organization-wide Kubernetes audit logs configuration.
class OrganizationKubernetesAuditLogsConfiguration {
  /// A value that contains information on whether Kubernetes audit logs should be
  /// enabled automatically as a data source for the organization.
  final bool autoEnable;

  OrganizationKubernetesAuditLogsConfiguration({
    required this.autoEnable,
  });

  Map<String, dynamic> toJson() {
    final autoEnable = this.autoEnable;
    return {
      'autoEnable': autoEnable,
    };
  }
}

/// The current configuration of Kubernetes audit logs as a data source for the
/// organization.
class OrganizationKubernetesAuditLogsConfigurationResult {
  /// Whether Kubernetes audit logs data source should be auto-enabled for new
  /// members joining the organization.
  final bool autoEnable;

  OrganizationKubernetesAuditLogsConfigurationResult({
    required this.autoEnable,
  });

  factory OrganizationKubernetesAuditLogsConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return OrganizationKubernetesAuditLogsConfigurationResult(
      autoEnable: json['autoEnable'] as bool,
    );
  }
}

/// Organization-wide Kubernetes data sources configurations.
class OrganizationKubernetesConfiguration {
  /// Whether Kubernetes audit logs data source should be auto-enabled for new
  /// members joining the organization.
  final OrganizationKubernetesAuditLogsConfiguration auditLogs;

  OrganizationKubernetesConfiguration({
    required this.auditLogs,
  });

  Map<String, dynamic> toJson() {
    final auditLogs = this.auditLogs;
    return {
      'auditLogs': auditLogs,
    };
  }
}

/// The current configuration of all Kubernetes data sources for the
/// organization.
class OrganizationKubernetesConfigurationResult {
  /// The current configuration of Kubernetes audit logs as a data source for the
  /// organization.
  final OrganizationKubernetesAuditLogsConfigurationResult auditLogs;

  OrganizationKubernetesConfigurationResult({
    required this.auditLogs,
  });

  factory OrganizationKubernetesConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return OrganizationKubernetesConfigurationResult(
      auditLogs: OrganizationKubernetesAuditLogsConfigurationResult.fromJson(
          json['auditLogs'] as Map<String, dynamic>),
    );
  }
}

/// Organization-wide Malware Protection configurations.
class OrganizationMalwareProtectionConfiguration {
  /// Whether Malware Protection for EC2 instances with findings should be
  /// auto-enabled for new members joining the organization.
  final OrganizationScanEc2InstanceWithFindings? scanEc2InstanceWithFindings;

  OrganizationMalwareProtectionConfiguration({
    this.scanEc2InstanceWithFindings,
  });

  Map<String, dynamic> toJson() {
    final scanEc2InstanceWithFindings = this.scanEc2InstanceWithFindings;
    return {
      if (scanEc2InstanceWithFindings != null)
        'scanEc2InstanceWithFindings': scanEc2InstanceWithFindings,
    };
  }
}

/// An object that contains information on the status of all Malware Protection
/// data source for an organization.
class OrganizationMalwareProtectionConfigurationResult {
  /// Describes the configuration for scanning EC2 instances with findings for an
  /// organization.
  final OrganizationScanEc2InstanceWithFindingsResult?
      scanEc2InstanceWithFindings;

  OrganizationMalwareProtectionConfigurationResult({
    this.scanEc2InstanceWithFindings,
  });

  factory OrganizationMalwareProtectionConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return OrganizationMalwareProtectionConfigurationResult(
      scanEc2InstanceWithFindings: json['scanEc2InstanceWithFindings'] != null
          ? OrganizationScanEc2InstanceWithFindingsResult.fromJson(
              json['scanEc2InstanceWithFindings'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Describes whether S3 data event logs will be automatically enabled for new
/// members of the organization.
class OrganizationS3LogsConfiguration {
  /// A value that contains information on whether S3 data event logs will be
  /// enabled automatically as a data source for the organization.
  final bool autoEnable;

  OrganizationS3LogsConfiguration({
    required this.autoEnable,
  });

  Map<String, dynamic> toJson() {
    final autoEnable = this.autoEnable;
    return {
      'autoEnable': autoEnable,
    };
  }
}

/// The current configuration of S3 data event logs as a data source for the
/// organization.
class OrganizationS3LogsConfigurationResult {
  /// A value that describes whether S3 data event logs are automatically enabled
  /// for new members of the organization.
  final bool autoEnable;

  OrganizationS3LogsConfigurationResult({
    required this.autoEnable,
  });

  factory OrganizationS3LogsConfigurationResult.fromJson(
      Map<String, dynamic> json) {
    return OrganizationS3LogsConfigurationResult(
      autoEnable: json['autoEnable'] as bool,
    );
  }
}

/// Organization-wide EC2 instances with findings scan configuration.
class OrganizationScanEc2InstanceWithFindings {
  /// Whether scanning EBS volumes should be auto-enabled for new members joining
  /// the organization.
  final OrganizationEbsVolumes? ebsVolumes;

  OrganizationScanEc2InstanceWithFindings({
    this.ebsVolumes,
  });

  Map<String, dynamic> toJson() {
    final ebsVolumes = this.ebsVolumes;
    return {
      if (ebsVolumes != null) 'ebsVolumes': ebsVolumes,
    };
  }
}

/// An object that contains information on the status of scanning EC2 instances
/// with findings for an organization.
class OrganizationScanEc2InstanceWithFindingsResult {
  /// Describes the configuration for scanning EBS volumes for an organization.
  final OrganizationEbsVolumesResult? ebsVolumes;

  OrganizationScanEc2InstanceWithFindingsResult({
    this.ebsVolumes,
  });

  factory OrganizationScanEc2InstanceWithFindingsResult.fromJson(
      Map<String, dynamic> json) {
    return OrganizationScanEc2InstanceWithFindingsResult(
      ebsVolumes: json['ebsVolumes'] != null
          ? OrganizationEbsVolumesResult.fromJson(
              json['ebsVolumes'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Information about the coverage statistics of the features for the entire
/// Amazon Web Services organization.
///
/// When you create a new Amazon Web Services organization, it might take up to
/// 24 hours to generate the statistics summary for this organization.
class OrganizationStatistics {
  /// Total number of active accounts in your Amazon Web Services organization
  /// that are associated with GuardDuty.
  final int? activeAccountsCount;

  /// Retrieves the coverage statistics for each feature.
  final List<OrganizationFeatureStatistics>? countByFeature;

  /// Total number of accounts that have enabled GuardDuty.
  final int? enabledAccountsCount;

  /// Total number of accounts in your Amazon Web Services organization that are
  /// associated with GuardDuty.
  final int? memberAccountsCount;

  /// Total number of accounts in your Amazon Web Services organization.
  final int? totalAccountsCount;

  OrganizationStatistics({
    this.activeAccountsCount,
    this.countByFeature,
    this.enabledAccountsCount,
    this.memberAccountsCount,
    this.totalAccountsCount,
  });

  factory OrganizationStatistics.fromJson(Map<String, dynamic> json) {
    return OrganizationStatistics(
      activeAccountsCount: json['activeAccountsCount'] as int?,
      countByFeature: (json['countByFeature'] as List?)
          ?.whereNotNull()
          .map((e) =>
              OrganizationFeatureStatistics.fromJson(e as Map<String, dynamic>))
          .toList(),
      enabledAccountsCount: json['enabledAccountsCount'] as int?,
      memberAccountsCount: json['memberAccountsCount'] as int?,
      totalAccountsCount: json['totalAccountsCount'] as int?,
    );
  }
}

/// Contains information on the owner of the bucket.
class Owner {
  /// The canonical user ID of the bucket owner. For information about locating
  /// your canonical user ID see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/acct-identifiers.html#FindingCanonicalId">Finding
  /// Your Account Canonical User ID.</a>
  final String? id;

  Owner({
    this.id,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      id: json['id'] as String?,
    );
  }
}

/// Contains information about how permissions are configured for the S3 bucket.
class PermissionConfiguration {
  /// Contains information about the account level permissions on the S3 bucket.
  final AccountLevelPermissions? accountLevelPermissions;

  /// Contains information about the bucket level permissions for the S3 bucket.
  final BucketLevelPermissions? bucketLevelPermissions;

  PermissionConfiguration({
    this.accountLevelPermissions,
    this.bucketLevelPermissions,
  });

  factory PermissionConfiguration.fromJson(Map<String, dynamic> json) {
    return PermissionConfiguration(
      accountLevelPermissions: json['accountLevelPermissions'] != null
          ? AccountLevelPermissions.fromJson(
              json['accountLevelPermissions'] as Map<String, dynamic>)
          : null,
      bucketLevelPermissions: json['bucketLevelPermissions'] != null
          ? BucketLevelPermissions.fromJson(
              json['bucketLevelPermissions'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains information about the PORT_PROBE action described in the finding.
class PortProbeAction {
  /// Indicates whether EC2 blocked the port probe to the instance, such as with
  /// an ACL.
  final bool? blocked;

  /// A list of objects related to port probe details.
  final List<PortProbeDetail>? portProbeDetails;

  PortProbeAction({
    this.blocked,
    this.portProbeDetails,
  });

  factory PortProbeAction.fromJson(Map<String, dynamic> json) {
    return PortProbeAction(
      blocked: json['blocked'] as bool?,
      portProbeDetails: (json['portProbeDetails'] as List?)
          ?.whereNotNull()
          .map((e) => PortProbeDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Contains information about the port probe details.
class PortProbeDetail {
  /// The local IP information of the connection.
  final LocalIpDetails? localIpDetails;

  /// The local port information of the connection.
  final LocalPortDetails? localPortDetails;

  /// The remote IP information of the connection.
  final RemoteIpDetails? remoteIpDetails;

  PortProbeDetail({
    this.localIpDetails,
    this.localPortDetails,
    this.remoteIpDetails,
  });

  factory PortProbeDetail.fromJson(Map<String, dynamic> json) {
    return PortProbeDetail(
      localIpDetails: json['localIpDetails'] != null
          ? LocalIpDetails.fromJson(
              json['localIpDetails'] as Map<String, dynamic>)
          : null,
      localPortDetails: json['localPortDetails'] != null
          ? LocalPortDetails.fromJson(
              json['localPortDetails'] as Map<String, dynamic>)
          : null,
      remoteIpDetails: json['remoteIpDetails'] != null
          ? RemoteIpDetails.fromJson(
              json['remoteIpDetails'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains other private IP address information of the EC2 instance.
class PrivateIpAddressDetails {
  /// The private DNS name of the EC2 instance.
  final String? privateDnsName;

  /// The private IP address of the EC2 instance.
  final String? privateIpAddress;

  PrivateIpAddressDetails({
    this.privateDnsName,
    this.privateIpAddress,
  });

  factory PrivateIpAddressDetails.fromJson(Map<String, dynamic> json) {
    return PrivateIpAddressDetails(
      privateDnsName: json['privateDnsName'] as String?,
      privateIpAddress: json['privateIpAddress'] as String?,
    );
  }
}

/// Information about the observed process.
class ProcessDetails {
  /// The effective user ID of the user that executed the process.
  final int? euid;

  /// The absolute path of the process executable file.
  final String? executablePath;

  /// The <code>SHA256</code> hash of the process executable.
  final String? executableSha256;

  /// Information about the process's lineage.
  final List<LineageObject>? lineage;

  /// The name of the process.
  final String? name;

  /// The ID of the child process.
  final int? namespacePid;

  /// The unique ID of the parent process. This ID is assigned to the parent
  /// process by GuardDuty.
  final String? parentUuid;

  /// The ID of the process.
  final int? pid;

  /// The present working directory of the process.
  final String? pwd;

  /// The time when the process started. This is in UTC format.
  final DateTime? startTime;

  /// The user that executed the process.
  final String? user;

  /// The unique ID of the user that executed the process.
  final int? userId;

  /// The unique ID assigned to the process by GuardDuty.
  final String? uuid;

  ProcessDetails({
    this.euid,
    this.executablePath,
    this.executableSha256,
    this.lineage,
    this.name,
    this.namespacePid,
    this.parentUuid,
    this.pid,
    this.pwd,
    this.startTime,
    this.user,
    this.userId,
    this.uuid,
  });

  factory ProcessDetails.fromJson(Map<String, dynamic> json) {
    return ProcessDetails(
      euid: json['euid'] as int?,
      executablePath: json['executablePath'] as String?,
      executableSha256: json['executableSha256'] as String?,
      lineage: (json['lineage'] as List?)
          ?.whereNotNull()
          .map((e) => LineageObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      namespacePid: json['namespacePid'] as int?,
      parentUuid: json['parentUuid'] as String?,
      pid: json['pid'] as int?,
      pwd: json['pwd'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      user: json['user'] as String?,
      userId: json['userId'] as int?,
      uuid: json['uuid'] as String?,
    );
  }
}

/// Contains information about the product code for the EC2 instance.
class ProductCode {
  /// The product code information.
  final String? code;

  /// The product code type.
  final String? productType;

  ProductCode({
    this.code,
    this.productType,
  });

  factory ProductCode.fromJson(Map<String, dynamic> json) {
    return ProductCode(
      code: json['productCodeId'] as String?,
      productType: json['productCodeType'] as String?,
    );
  }
}

enum ProfileSubtype {
  frequent('FREQUENT'),
  infrequent('INFREQUENT'),
  unseen('UNSEEN'),
  rare('RARE'),
  ;

  final String value;

  const ProfileSubtype(this.value);

  static ProfileSubtype fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ProfileSubtype'));
}

enum ProfileType {
  frequency('FREQUENCY'),
  ;

  final String value;

  const ProfileType(this.value);

  static ProfileType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum ProfileType'));
}

/// Describes the public access policies that apply to the S3 bucket.
class PublicAccess {
  /// Describes the effective permission on this bucket after factoring all
  /// attached policies.
  final String? effectivePermission;

  /// Contains information about how permissions are configured for the S3 bucket.
  final PermissionConfiguration? permissionConfiguration;

  PublicAccess({
    this.effectivePermission,
    this.permissionConfiguration,
  });

  factory PublicAccess.fromJson(Map<String, dynamic> json) {
    return PublicAccess(
      effectivePermission: json['effectivePermission'] as String?,
      permissionConfiguration: json['permissionConfiguration'] != null
          ? PermissionConfiguration.fromJson(
              json['permissionConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum PublishingStatus {
  pendingVerification('PENDING_VERIFICATION'),
  publishing('PUBLISHING'),
  unableToPublishFixDestinationProperty(
      'UNABLE_TO_PUBLISH_FIX_DESTINATION_PROPERTY'),
  stopped('STOPPED'),
  ;

  final String value;

  const PublishingStatus(this.value);

  static PublishingStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum PublishingStatus'));
}

/// Contains information about the resource type <code>RDSDBInstance</code>
/// involved in a GuardDuty finding.
class RdsDbInstanceDetails {
  /// The identifier of the database cluster that contains the database instance
  /// ID involved in the finding.
  final String? dbClusterIdentifier;

  /// The Amazon Resource Name (ARN) that identifies the database instance
  /// involved in the finding.
  final String? dbInstanceArn;

  /// The identifier associated to the database instance that was involved in the
  /// finding.
  final String? dbInstanceIdentifier;

  /// The database engine of the database instance involved in the finding.
  final String? engine;

  /// The version of the database engine that was involved in the finding.
  final String? engineVersion;

  /// Instance tag key-value pairs associated with the database instance ID.
  final List<Tag>? tags;

  RdsDbInstanceDetails({
    this.dbClusterIdentifier,
    this.dbInstanceArn,
    this.dbInstanceIdentifier,
    this.engine,
    this.engineVersion,
    this.tags,
  });

  factory RdsDbInstanceDetails.fromJson(Map<String, dynamic> json) {
    return RdsDbInstanceDetails(
      dbClusterIdentifier: json['dbClusterIdentifier'] as String?,
      dbInstanceArn: json['dbInstanceArn'] as String?,
      dbInstanceIdentifier: json['dbInstanceIdentifier'] as String?,
      engine: json['engine'] as String?,
      engineVersion: json['engineVersion'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Contains information about the user and authentication details for a
/// database instance involved in the finding.
class RdsDbUserDetails {
  /// The application name used in the anomalous login attempt.
  final String? application;

  /// The authentication method used by the user involved in the finding.
  final String? authMethod;

  /// The name of the database instance involved in the anomalous login attempt.
  final String? database;

  /// The version of the Secure Socket Layer (SSL) used for the network.
  final String? ssl;

  /// The user name used in the anomalous login attempt.
  final String? user;

  RdsDbUserDetails({
    this.application,
    this.authMethod,
    this.database,
    this.ssl,
    this.user,
  });

  factory RdsDbUserDetails.fromJson(Map<String, dynamic> json) {
    return RdsDbUserDetails(
      application: json['application'] as String?,
      authMethod: json['authMethod'] as String?,
      database: json['database'] as String?,
      ssl: json['ssl'] as String?,
      user: json['user'] as String?,
    );
  }
}

/// Indicates that a login attempt was made to the potentially compromised
/// database from a remote IP address.
class RdsLoginAttemptAction {
  /// Indicates the login attributes used in the login attempt.
  final List<LoginAttribute>? loginAttributes;
  final RemoteIpDetails? remoteIpDetails;

  RdsLoginAttemptAction({
    this.loginAttributes,
    this.remoteIpDetails,
  });

  factory RdsLoginAttemptAction.fromJson(Map<String, dynamic> json) {
    return RdsLoginAttemptAction(
      loginAttributes: (json['LoginAttributes'] as List?)
          ?.whereNotNull()
          .map((e) => LoginAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      remoteIpDetails: json['remoteIpDetails'] != null
          ? RemoteIpDetails.fromJson(
              json['remoteIpDetails'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains details about the remote Amazon Web Services account that made the
/// API call.
class RemoteAccountDetails {
  /// The Amazon Web Services account ID of the remote API caller.
  final String? accountId;

  /// Details on whether the Amazon Web Services account of the remote API caller
  /// is related to your GuardDuty environment. If this value is <code>True</code>
  /// the API caller is affiliated to your account in some way. If it is
  /// <code>False</code> the API caller is from outside your environment.
  final bool? affiliated;

  RemoteAccountDetails({
    this.accountId,
    this.affiliated,
  });

  factory RemoteAccountDetails.fromJson(Map<String, dynamic> json) {
    return RemoteAccountDetails(
      accountId: json['accountId'] as String?,
      affiliated: json['affiliated'] as bool?,
    );
  }
}

/// Contains information about the remote IP address of the connection.
class RemoteIpDetails {
  /// The city information of the remote IP address.
  final City? city;

  /// The country code of the remote IP address.
  final Country? country;

  /// The location information of the remote IP address.
  final GeoLocation? geoLocation;

  /// The IPv4 remote address of the connection.
  final String? ipAddressV4;

  /// The IPv6 remote address of the connection.
  final String? ipAddressV6;

  /// The ISP organization information of the remote IP address.
  final Organization? organization;

  RemoteIpDetails({
    this.city,
    this.country,
    this.geoLocation,
    this.ipAddressV4,
    this.ipAddressV6,
    this.organization,
  });

  factory RemoteIpDetails.fromJson(Map<String, dynamic> json) {
    return RemoteIpDetails(
      city: json['city'] != null
          ? City.fromJson(json['city'] as Map<String, dynamic>)
          : null,
      country: json['country'] != null
          ? Country.fromJson(json['country'] as Map<String, dynamic>)
          : null,
      geoLocation: json['geoLocation'] != null
          ? GeoLocation.fromJson(json['geoLocation'] as Map<String, dynamic>)
          : null,
      ipAddressV4: json['ipAddressV4'] as String?,
      ipAddressV6: json['ipAddressV6'] as String?,
      organization: json['organization'] != null
          ? Organization.fromJson(json['organization'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains information about the remote port.
class RemotePortDetails {
  /// The port number of the remote connection.
  final int? port;

  /// The port name of the remote connection.
  final String? portName;

  RemotePortDetails({
    this.port,
    this.portName,
  });

  factory RemotePortDetails.fromJson(Map<String, dynamic> json) {
    return RemotePortDetails(
      port: json['port'] as int?,
      portName: json['portName'] as String?,
    );
  }
}

/// Contains information about the Amazon Web Services resource associated with
/// the activity that prompted GuardDuty to generate a finding.
class Resource {
  /// The IAM access key details (user information) of a user that engaged in the
  /// activity that prompted GuardDuty to generate a finding.
  final AccessKeyDetails? accessKeyDetails;
  final Container? containerDetails;

  /// Contains list of scanned and skipped EBS volumes with details.
  final EbsVolumeDetails? ebsVolumeDetails;

  /// Contains information about the details of the ECS Cluster.
  final EcsClusterDetails? ecsClusterDetails;

  /// Details about the EKS cluster involved in a Kubernetes finding.
  final EksClusterDetails? eksClusterDetails;

  /// The information about the EC2 instance associated with the activity that
  /// prompted GuardDuty to generate a finding.
  final InstanceDetails? instanceDetails;

  /// Details about the Kubernetes user and workload involved in a Kubernetes
  /// finding.
  final KubernetesDetails? kubernetesDetails;

  /// Contains information about the Lambda function that was involved in a
  /// finding.
  final LambdaDetails? lambdaDetails;

  /// Contains information about the database instance to which an anomalous login
  /// attempt was made.
  final RdsDbInstanceDetails? rdsDbInstanceDetails;

  /// Contains information about the user details through which anomalous login
  /// attempt was made.
  final RdsDbUserDetails? rdsDbUserDetails;

  /// The type of Amazon Web Services resource.
  final String? resourceType;

  /// Contains information on the S3 bucket.
  final List<S3BucketDetail>? s3BucketDetails;

  Resource({
    this.accessKeyDetails,
    this.containerDetails,
    this.ebsVolumeDetails,
    this.ecsClusterDetails,
    this.eksClusterDetails,
    this.instanceDetails,
    this.kubernetesDetails,
    this.lambdaDetails,
    this.rdsDbInstanceDetails,
    this.rdsDbUserDetails,
    this.resourceType,
    this.s3BucketDetails,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      accessKeyDetails: json['accessKeyDetails'] != null
          ? AccessKeyDetails.fromJson(
              json['accessKeyDetails'] as Map<String, dynamic>)
          : null,
      containerDetails: json['containerDetails'] != null
          ? Container.fromJson(json['containerDetails'] as Map<String, dynamic>)
          : null,
      ebsVolumeDetails: json['ebsVolumeDetails'] != null
          ? EbsVolumeDetails.fromJson(
              json['ebsVolumeDetails'] as Map<String, dynamic>)
          : null,
      ecsClusterDetails: json['ecsClusterDetails'] != null
          ? EcsClusterDetails.fromJson(
              json['ecsClusterDetails'] as Map<String, dynamic>)
          : null,
      eksClusterDetails: json['eksClusterDetails'] != null
          ? EksClusterDetails.fromJson(
              json['eksClusterDetails'] as Map<String, dynamic>)
          : null,
      instanceDetails: json['instanceDetails'] != null
          ? InstanceDetails.fromJson(
              json['instanceDetails'] as Map<String, dynamic>)
          : null,
      kubernetesDetails: json['kubernetesDetails'] != null
          ? KubernetesDetails.fromJson(
              json['kubernetesDetails'] as Map<String, dynamic>)
          : null,
      lambdaDetails: json['lambdaDetails'] != null
          ? LambdaDetails.fromJson(
              json['lambdaDetails'] as Map<String, dynamic>)
          : null,
      rdsDbInstanceDetails: json['rdsDbInstanceDetails'] != null
          ? RdsDbInstanceDetails.fromJson(
              json['rdsDbInstanceDetails'] as Map<String, dynamic>)
          : null,
      rdsDbUserDetails: json['rdsDbUserDetails'] != null
          ? RdsDbUserDetails.fromJson(
              json['rdsDbUserDetails'] as Map<String, dynamic>)
          : null,
      resourceType: json['resourceType'] as String?,
      s3BucketDetails: (json['s3BucketDetails'] as List?)
          ?.whereNotNull()
          .map((e) => S3BucketDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Represents the resources that were scanned in the scan entry.
class ResourceDetails {
  /// InstanceArn that was scanned in the scan entry.
  final String? instanceArn;

  ResourceDetails({
    this.instanceArn,
  });

  factory ResourceDetails.fromJson(Map<String, dynamic> json) {
    return ResourceDetails(
      instanceArn: json['instanceArn'] as String?,
    );
  }
}

enum ResourceType {
  eks('EKS'),
  ecs('ECS'),
  ec2('EC2'),
  ;

  final String value;

  const ResourceType(this.value);

  static ResourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ResourceType'));
}

/// Additional information about the suspicious activity.
class RuntimeContext {
  /// Represents the communication protocol associated with the address. For
  /// example, the address family <code>AF_INET</code> is used for IP version of 4
  /// protocol.
  final String? addressFamily;

  /// Example of the command line involved in the suspicious activity.
  final String? commandLineExample;

  /// Represents the type of mounted fileSystem.
  final String? fileSystemType;

  /// Represents options that control the behavior of a runtime operation or
  /// action. For example, a filesystem mount operation may contain a read-only
  /// flag.
  final List<String>? flags;

  /// Specifies a particular protocol within the address family. Usually there is
  /// a single protocol in address families. For example, the address family
  /// <code>AF_INET</code> only has the IP protocol.
  final int? ianaProtocolNumber;

  /// The value of the LD_PRELOAD environment variable.
  final String? ldPreloadValue;

  /// The path to the new library that was loaded.
  final String? libraryPath;

  /// Specifies the Region of a process's address space such as stack and heap.
  final List<String>? memoryRegions;

  /// The timestamp at which the process modified the current process. The
  /// timestamp is in UTC date string format.
  final DateTime? modifiedAt;

  /// Information about the process that modified the current process. This is
  /// available for multiple finding types.
  final ProcessDetails? modifyingProcess;

  /// The path to the module loaded into the kernel.
  final String? moduleFilePath;

  /// The name of the module loaded into the kernel.
  final String? moduleName;

  /// The <code>SHA256</code> hash of the module.
  final String? moduleSha256;

  /// The path on the host that is mounted by the container.
  final String? mountSource;

  /// The path in the container that is mapped to the host directory.
  final String? mountTarget;

  /// The path in the container that modified the release agent file.
  final String? releaseAgentPath;

  /// The path to the leveraged <code>runc</code> implementation.
  final String? runcBinaryPath;

  /// The path to the script that was executed.
  final String? scriptPath;

  /// Name of the security service that has been potentially disabled.
  final String? serviceName;

  /// The path to the modified shell history file.
  final String? shellHistoryFilePath;

  /// The path to the docket socket that was accessed.
  final String? socketPath;

  /// Information about the process that had its memory overwritten by the current
  /// process.
  final ProcessDetails? targetProcess;

  /// The suspicious file path for which the threat intelligence details were
  /// found.
  final String? threatFilePath;

  /// Category that the tool belongs to. Some of the examples are Backdoor Tool,
  /// Pentest Tool, Network Scanner, and Network Sniffer.
  final String? toolCategory;

  /// Name of the potentially suspicious tool.
  final String? toolName;

  RuntimeContext({
    this.addressFamily,
    this.commandLineExample,
    this.fileSystemType,
    this.flags,
    this.ianaProtocolNumber,
    this.ldPreloadValue,
    this.libraryPath,
    this.memoryRegions,
    this.modifiedAt,
    this.modifyingProcess,
    this.moduleFilePath,
    this.moduleName,
    this.moduleSha256,
    this.mountSource,
    this.mountTarget,
    this.releaseAgentPath,
    this.runcBinaryPath,
    this.scriptPath,
    this.serviceName,
    this.shellHistoryFilePath,
    this.socketPath,
    this.targetProcess,
    this.threatFilePath,
    this.toolCategory,
    this.toolName,
  });

  factory RuntimeContext.fromJson(Map<String, dynamic> json) {
    return RuntimeContext(
      addressFamily: json['addressFamily'] as String?,
      commandLineExample: json['commandLineExample'] as String?,
      fileSystemType: json['fileSystemType'] as String?,
      flags: (json['flags'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      ianaProtocolNumber: json['ianaProtocolNumber'] as int?,
      ldPreloadValue: json['ldPreloadValue'] as String?,
      libraryPath: json['libraryPath'] as String?,
      memoryRegions: (json['memoryRegions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      modifiedAt: timeStampFromJson(json['modifiedAt']),
      modifyingProcess: json['modifyingProcess'] != null
          ? ProcessDetails.fromJson(
              json['modifyingProcess'] as Map<String, dynamic>)
          : null,
      moduleFilePath: json['moduleFilePath'] as String?,
      moduleName: json['moduleName'] as String?,
      moduleSha256: json['moduleSha256'] as String?,
      mountSource: json['mountSource'] as String?,
      mountTarget: json['mountTarget'] as String?,
      releaseAgentPath: json['releaseAgentPath'] as String?,
      runcBinaryPath: json['runcBinaryPath'] as String?,
      scriptPath: json['scriptPath'] as String?,
      serviceName: json['serviceName'] as String?,
      shellHistoryFilePath: json['shellHistoryFilePath'] as String?,
      socketPath: json['socketPath'] as String?,
      targetProcess: json['targetProcess'] != null
          ? ProcessDetails.fromJson(
              json['targetProcess'] as Map<String, dynamic>)
          : null,
      threatFilePath: json['threatFilePath'] as String?,
      toolCategory: json['toolCategory'] as String?,
      toolName: json['toolName'] as String?,
    );
  }
}

/// Information about the process and any required context values for a specific
/// finding.
class RuntimeDetails {
  /// Additional information about the suspicious activity.
  final RuntimeContext? context;

  /// Information about the observed process.
  final ProcessDetails? process;

  RuntimeDetails({
    this.context,
    this.process,
  });

  factory RuntimeDetails.fromJson(Map<String, dynamic> json) {
    return RuntimeDetails(
      context: json['context'] != null
          ? RuntimeContext.fromJson(json['context'] as Map<String, dynamic>)
          : null,
      process: json['process'] != null
          ? ProcessDetails.fromJson(json['process'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains information on the S3 bucket.
class S3BucketDetail {
  /// The Amazon Resource Name (ARN) of the S3 bucket.
  final String? arn;

  /// The date and time the bucket was created at.
  final DateTime? createdAt;

  /// Describes the server side encryption method used in the S3 bucket.
  final DefaultServerSideEncryption? defaultServerSideEncryption;

  /// The name of the S3 bucket.
  final String? name;

  /// The owner of the S3 bucket.
  final Owner? owner;

  /// Describes the public access policies that apply to the S3 bucket.
  final PublicAccess? publicAccess;

  /// All tags attached to the S3 bucket
  final List<Tag>? tags;

  /// Describes whether the bucket is a source or destination bucket.
  final String? type;

  S3BucketDetail({
    this.arn,
    this.createdAt,
    this.defaultServerSideEncryption,
    this.name,
    this.owner,
    this.publicAccess,
    this.tags,
    this.type,
  });

  factory S3BucketDetail.fromJson(Map<String, dynamic> json) {
    return S3BucketDetail(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      defaultServerSideEncryption: json['defaultServerSideEncryption'] != null
          ? DefaultServerSideEncryption.fromJson(
              json['defaultServerSideEncryption'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      owner: json['owner'] != null
          ? Owner.fromJson(json['owner'] as Map<String, dynamic>)
          : null,
      publicAccess: json['publicAccess'] != null
          ? PublicAccess.fromJson(json['publicAccess'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
    );
  }
}

/// Describes whether S3 data event logs will be enabled as a data source.
class S3LogsConfiguration {
  /// The status of S3 data event logs as a data source.
  final bool enable;

  S3LogsConfiguration({
    required this.enable,
  });

  Map<String, dynamic> toJson() {
    final enable = this.enable;
    return {
      'enable': enable,
    };
  }
}

/// Describes whether S3 data event logs will be enabled as a data source.
class S3LogsConfigurationResult {
  /// A value that describes whether S3 data event logs are automatically enabled
  /// for new members of the organization.
  final DataSourceStatus status;

  S3LogsConfigurationResult({
    required this.status,
  });

  factory S3LogsConfigurationResult.fromJson(Map<String, dynamic> json) {
    return S3LogsConfigurationResult(
      status: DataSourceStatus.fromString((json['status'] as String)),
    );
  }
}

/// Contains information about a malware scan.
class Scan {
  /// The ID for the account that belongs to the scan.
  final String? accountId;

  /// The unique detector ID of the administrator account that the request is
  /// associated with. Note that this value will be the same as the one used for
  /// <code>DetectorId</code> if the account is an administrator.
  final String? adminDetectorId;

  /// List of volumes that were attached to the original instance to be scanned.
  final List<VolumeDetail>? attachedVolumes;

  /// The unique ID of the detector that the request is associated with.
  final String? detectorId;

  /// Represents the reason for FAILED scan status.
  final String? failureReason;

  /// Represents the number of files that were scanned.
  final int? fileCount;

  /// Represents the resources that were scanned in the scan entry.
  final ResourceDetails? resourceDetails;

  /// The timestamp of when the scan was finished.
  final DateTime? scanEndTime;

  /// The unique scan ID associated with a scan entry.
  final String? scanId;

  /// Represents the result of the scan.
  final ScanResultDetails? scanResultDetails;

  /// The timestamp of when the scan was triggered.
  final DateTime? scanStartTime;

  /// An enum value representing possible scan statuses.
  final ScanStatus? scanStatus;

  /// Specifies the scan type that invoked the malware scan.
  final ScanType? scanType;

  /// Represents total bytes that were scanned.
  final int? totalBytes;

  /// Specifies the reason why the scan was initiated.
  final TriggerDetails? triggerDetails;

  Scan({
    this.accountId,
    this.adminDetectorId,
    this.attachedVolumes,
    this.detectorId,
    this.failureReason,
    this.fileCount,
    this.resourceDetails,
    this.scanEndTime,
    this.scanId,
    this.scanResultDetails,
    this.scanStartTime,
    this.scanStatus,
    this.scanType,
    this.totalBytes,
    this.triggerDetails,
  });

  factory Scan.fromJson(Map<String, dynamic> json) {
    return Scan(
      accountId: json['accountId'] as String?,
      adminDetectorId: json['adminDetectorId'] as String?,
      attachedVolumes: (json['attachedVolumes'] as List?)
          ?.whereNotNull()
          .map((e) => VolumeDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      detectorId: json['detectorId'] as String?,
      failureReason: json['failureReason'] as String?,
      fileCount: json['fileCount'] as int?,
      resourceDetails: json['resourceDetails'] != null
          ? ResourceDetails.fromJson(
              json['resourceDetails'] as Map<String, dynamic>)
          : null,
      scanEndTime: timeStampFromJson(json['scanEndTime']),
      scanId: json['scanId'] as String?,
      scanResultDetails: json['scanResultDetails'] != null
          ? ScanResultDetails.fromJson(
              json['scanResultDetails'] as Map<String, dynamic>)
          : null,
      scanStartTime: timeStampFromJson(json['scanStartTime']),
      scanStatus: (json['scanStatus'] as String?)?.let(ScanStatus.fromString),
      scanType: (json['scanType'] as String?)?.let(ScanType.fromString),
      totalBytes: json['totalBytes'] as int?,
      triggerDetails: json['triggerDetails'] != null
          ? TriggerDetails.fromJson(
              json['triggerDetails'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains information about the condition.
class ScanCondition {
  /// Represents an <i>mapEqual</i> <b/> condition to be applied to a single field
  /// when triggering for malware scan.
  final List<ScanConditionPair> mapEquals;

  ScanCondition({
    required this.mapEquals,
  });

  factory ScanCondition.fromJson(Map<String, dynamic> json) {
    return ScanCondition(
      mapEquals: (json['mapEquals'] as List)
          .whereNotNull()
          .map((e) => ScanConditionPair.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final mapEquals = this.mapEquals;
    return {
      'mapEquals': mapEquals,
    };
  }
}

/// Represents the <code>key:value</code> pair to be matched against given
/// resource property.
class ScanConditionPair {
  /// Represents the <b>key</b> in the map condition.
  final String key;

  /// Represents optional <b>value</b> in the map condition. If not specified,
  /// only the <b>key</b> will be matched.
  final String? value;

  ScanConditionPair({
    required this.key,
    this.value,
  });

  factory ScanConditionPair.fromJson(Map<String, dynamic> json) {
    return ScanConditionPair(
      key: json['key'] as String,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      if (value != null) 'value': value,
    };
  }
}

/// An enum value representing possible resource properties to match with given
/// scan condition.
enum ScanCriterionKey {
  ec2InstanceTag('EC2_INSTANCE_TAG'),
  ;

  final String value;

  const ScanCriterionKey(this.value);

  static ScanCriterionKey fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ScanCriterionKey'));
}

/// Contains a complete view providing malware scan result details.
class ScanDetections {
  /// Details of the highest severity threat detected during malware scan and
  /// number of infected files.
  final HighestSeverityThreatDetails? highestSeverityThreatDetails;

  /// Total number of scanned files.
  final ScannedItemCount? scannedItemCount;

  /// Contains details about identified threats organized by threat name.
  final ThreatDetectedByName? threatDetectedByName;

  /// Total number of infected files.
  final ThreatsDetectedItemCount? threatsDetectedItemCount;

  ScanDetections({
    this.highestSeverityThreatDetails,
    this.scannedItemCount,
    this.threatDetectedByName,
    this.threatsDetectedItemCount,
  });

  factory ScanDetections.fromJson(Map<String, dynamic> json) {
    return ScanDetections(
      highestSeverityThreatDetails: json['highestSeverityThreatDetails'] != null
          ? HighestSeverityThreatDetails.fromJson(
              json['highestSeverityThreatDetails'] as Map<String, dynamic>)
          : null,
      scannedItemCount: json['scannedItemCount'] != null
          ? ScannedItemCount.fromJson(
              json['scannedItemCount'] as Map<String, dynamic>)
          : null,
      threatDetectedByName: json['threatDetectedByName'] != null
          ? ThreatDetectedByName.fromJson(
              json['threatDetectedByName'] as Map<String, dynamic>)
          : null,
      threatsDetectedItemCount: json['threatsDetectedItemCount'] != null
          ? ThreatsDetectedItemCount.fromJson(
              json['threatsDetectedItemCount'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Describes whether Malware Protection for EC2 instances with findings will be
/// enabled as a data source.
class ScanEc2InstanceWithFindings {
  /// Describes the configuration for scanning EBS volumes as data source.
  final bool? ebsVolumes;

  ScanEc2InstanceWithFindings({
    this.ebsVolumes,
  });

  Map<String, dynamic> toJson() {
    final ebsVolumes = this.ebsVolumes;
    return {
      if (ebsVolumes != null) 'ebsVolumes': ebsVolumes,
    };
  }
}

/// An object that contains information on the status of whether Malware
/// Protection for EC2 instances with findings will be enabled as a data source.
class ScanEc2InstanceWithFindingsResult {
  /// Describes the configuration of scanning EBS volumes as a data source.
  final EbsVolumesResult? ebsVolumes;

  ScanEc2InstanceWithFindingsResult({
    this.ebsVolumes,
  });

  factory ScanEc2InstanceWithFindingsResult.fromJson(
      Map<String, dynamic> json) {
    return ScanEc2InstanceWithFindingsResult(
      ebsVolumes: json['ebsVolumes'] != null
          ? EbsVolumesResult.fromJson(
              json['ebsVolumes'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains details of infected file including name, file path and hash.
class ScanFilePath {
  /// File name of the infected file.
  final String? fileName;

  /// The file path of the infected file.
  final String? filePath;

  /// The hash value of the infected file.
  final String? hash;

  /// EBS volume Arn details of the infected file.
  final String? volumeArn;

  ScanFilePath({
    this.fileName,
    this.filePath,
    this.hash,
    this.volumeArn,
  });

  factory ScanFilePath.fromJson(Map<String, dynamic> json) {
    return ScanFilePath(
      fileName: json['fileName'] as String?,
      filePath: json['filePath'] as String?,
      hash: json['hash'] as String?,
      volumeArn: json['volumeArn'] as String?,
    );
  }
}

/// Contains information about criteria used to filter resources before
/// triggering malware scan.
class ScanResourceCriteria {
  /// Represents condition that when matched will prevent a malware scan for a
  /// certain resource.
  final Map<ScanCriterionKey, ScanCondition>? exclude;

  /// Represents condition that when matched will allow a malware scan for a
  /// certain resource.
  final Map<ScanCriterionKey, ScanCondition>? include;

  ScanResourceCriteria({
    this.exclude,
    this.include,
  });

  factory ScanResourceCriteria.fromJson(Map<String, dynamic> json) {
    return ScanResourceCriteria(
      exclude: (json['exclude'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(ScanCriterionKey.fromString(k),
              ScanCondition.fromJson(e as Map<String, dynamic>))),
      include: (json['include'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(ScanCriterionKey.fromString(k),
              ScanCondition.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final exclude = this.exclude;
    final include = this.include;
    return {
      if (exclude != null)
        'exclude': exclude.map((k, e) => MapEntry(k.value, e)),
      if (include != null)
        'include': include.map((k, e) => MapEntry(k.value, e)),
    };
  }
}

enum ScanResult {
  clean('CLEAN'),
  infected('INFECTED'),
  ;

  final String value;

  const ScanResult(this.value);

  static ScanResult fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum ScanResult'));
}

/// Represents the result of the scan.
class ScanResultDetails {
  /// An enum value representing possible scan results.
  final ScanResult? scanResult;

  ScanResultDetails({
    this.scanResult,
  });

  factory ScanResultDetails.fromJson(Map<String, dynamic> json) {
    return ScanResultDetails(
      scanResult: (json['scanResult'] as String?)?.let(ScanResult.fromString),
    );
  }
}

enum ScanStatus {
  running('RUNNING'),
  completed('COMPLETED'),
  failed('FAILED'),
  skipped('SKIPPED'),
  ;

  final String value;

  const ScanStatus(this.value);

  static ScanStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum ScanStatus'));
}

/// Contains files infected with the given threat providing details of malware
/// name and severity.
class ScanThreatName {
  /// List of infected files in EBS volume with details.
  final List<ScanFilePath>? filePaths;

  /// Total number of files infected with given threat.
  final int? itemCount;

  /// The name of the identified threat.
  final String? name;

  /// Severity of threat identified as part of the malware scan.
  final String? severity;

  ScanThreatName({
    this.filePaths,
    this.itemCount,
    this.name,
    this.severity,
  });

  factory ScanThreatName.fromJson(Map<String, dynamic> json) {
    return ScanThreatName(
      filePaths: (json['filePaths'] as List?)
          ?.whereNotNull()
          .map((e) => ScanFilePath.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemCount: json['itemCount'] as int?,
      name: json['name'] as String?,
      severity: json['severity'] as String?,
    );
  }
}

enum ScanType {
  guarddutyInitiated('GUARDDUTY_INITIATED'),
  onDemand('ON_DEMAND'),
  ;

  final String value;

  const ScanType(this.value);

  static ScanType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum ScanType'));
}

/// Total number of scanned files.
class ScannedItemCount {
  /// Number of files scanned.
  final int? files;

  /// Total GB of files scanned for malware.
  final int? totalGb;

  /// Total number of scanned volumes.
  final int? volumes;

  ScannedItemCount({
    this.files,
    this.totalGb,
    this.volumes,
  });

  factory ScannedItemCount.fromJson(Map<String, dynamic> json) {
    return ScannedItemCount(
      files: json['files'] as int?,
      totalGb: json['totalGb'] as int?,
      volumes: json['volumes'] as int?,
    );
  }
}

/// Container security context.
class SecurityContext {
  /// Whether or not a container or a Kubernetes pod is allowed to gain more
  /// privileges than its parent process.
  final bool? allowPrivilegeEscalation;

  /// Whether the container is privileged.
  final bool? privileged;

  SecurityContext({
    this.allowPrivilegeEscalation,
    this.privileged,
  });

  factory SecurityContext.fromJson(Map<String, dynamic> json) {
    return SecurityContext(
      allowPrivilegeEscalation: json['allowPrivilegeEscalation'] as bool?,
      privileged: json['privileged'] as bool?,
    );
  }
}

/// Contains information about the security groups associated with the EC2
/// instance.
class SecurityGroup {
  /// The security group ID of the EC2 instance.
  final String? groupId;

  /// The security group name of the EC2 instance.
  final String? groupName;

  SecurityGroup({
    this.groupId,
    this.groupName,
  });

  factory SecurityGroup.fromJson(Map<String, dynamic> json) {
    return SecurityGroup(
      groupId: json['groupId'] as String?,
      groupName: json['groupName'] as String?,
    );
  }
}

/// Contains additional information about the generated finding.
class Service {
  /// Information about the activity that is described in a finding.
  final Action? action;

  /// Contains additional information about the generated finding.
  final ServiceAdditionalInfo? additionalInfo;

  /// Indicates whether this finding is archived.
  final bool? archived;

  /// The total count of the occurrences of this finding type.
  final int? count;

  /// Contains information about the detected unusual behavior.
  final Detection? detection;

  /// The detector ID for the GuardDuty service.
  final String? detectorId;

  /// Returns details from the malware scan that created a finding.
  final EbsVolumeScanDetails? ebsVolumeScanDetails;

  /// The first-seen timestamp of the activity that prompted GuardDuty to generate
  /// this finding.
  final String? eventFirstSeen;

  /// The last-seen timestamp of the activity that prompted GuardDuty to generate
  /// this finding.
  final String? eventLastSeen;

  /// An evidence object associated with the service.
  final Evidence? evidence;

  /// The name of the feature that generated a finding.
  final String? featureName;

  /// The resource role information for this finding.
  final String? resourceRole;

  /// Information about the process and any required context values for a specific
  /// finding
  final RuntimeDetails? runtimeDetails;

  /// The name of the Amazon Web Services service (GuardDuty) that generated a
  /// finding.
  final String? serviceName;

  /// Feedback that was submitted about the finding.
  final String? userFeedback;

  Service({
    this.action,
    this.additionalInfo,
    this.archived,
    this.count,
    this.detection,
    this.detectorId,
    this.ebsVolumeScanDetails,
    this.eventFirstSeen,
    this.eventLastSeen,
    this.evidence,
    this.featureName,
    this.resourceRole,
    this.runtimeDetails,
    this.serviceName,
    this.userFeedback,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      action: json['action'] != null
          ? Action.fromJson(json['action'] as Map<String, dynamic>)
          : null,
      additionalInfo: json['additionalInfo'] != null
          ? ServiceAdditionalInfo.fromJson(
              json['additionalInfo'] as Map<String, dynamic>)
          : null,
      archived: json['archived'] as bool?,
      count: json['count'] as int?,
      detection: json['detection'] != null
          ? Detection.fromJson(json['detection'] as Map<String, dynamic>)
          : null,
      detectorId: json['detectorId'] as String?,
      ebsVolumeScanDetails: json['ebsVolumeScanDetails'] != null
          ? EbsVolumeScanDetails.fromJson(
              json['ebsVolumeScanDetails'] as Map<String, dynamic>)
          : null,
      eventFirstSeen: json['eventFirstSeen'] as String?,
      eventLastSeen: json['eventLastSeen'] as String?,
      evidence: json['evidence'] != null
          ? Evidence.fromJson(json['evidence'] as Map<String, dynamic>)
          : null,
      featureName: json['featureName'] as String?,
      resourceRole: json['resourceRole'] as String?,
      runtimeDetails: json['runtimeDetails'] != null
          ? RuntimeDetails.fromJson(
              json['runtimeDetails'] as Map<String, dynamic>)
          : null,
      serviceName: json['serviceName'] as String?,
      userFeedback: json['userFeedback'] as String?,
    );
  }
}

/// Additional information about the generated finding.
class ServiceAdditionalInfo {
  /// Describes the type of the additional information.
  final String? type;

  /// This field specifies the value of the additional information.
  final String? value;

  ServiceAdditionalInfo({
    this.type,
    this.value,
  });

  factory ServiceAdditionalInfo.fromJson(Map<String, dynamic> json) {
    return ServiceAdditionalInfo(
      type: json['type'] as String?,
      value: json['value'] as String?,
    );
  }
}

/// Contains information about the criteria used for sorting findings.
class SortCriteria {
  /// Represents the finding attribute, such as <code>accountId</code>, that sorts
  /// the findings.
  final String? attributeName;

  /// The order by which the sorted findings are to be displayed.
  final OrderBy? orderBy;

  SortCriteria({
    this.attributeName,
    this.orderBy,
  });

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final orderBy = this.orderBy;
    return {
      if (attributeName != null) 'attributeName': attributeName,
      if (orderBy != null) 'orderBy': orderBy.value,
    };
  }
}

class StartMalwareScanResponse {
  /// A unique identifier that gets generated when you invoke the API without any
  /// error. Each malware scan has a corresponding scan ID. Using this scan ID,
  /// you can monitor the status of your malware scan.
  final String? scanId;

  StartMalwareScanResponse({
    this.scanId,
  });

  factory StartMalwareScanResponse.fromJson(Map<String, dynamic> json) {
    return StartMalwareScanResponse(
      scanId: json['scanId'] as String?,
    );
  }
}

class StartMonitoringMembersResponse {
  /// A list of objects that contain the unprocessed account and a result string
  /// that explains why it was unprocessed.
  final List<UnprocessedAccount> unprocessedAccounts;

  StartMonitoringMembersResponse({
    required this.unprocessedAccounts,
  });

  factory StartMonitoringMembersResponse.fromJson(Map<String, dynamic> json) {
    return StartMonitoringMembersResponse(
      unprocessedAccounts: (json['unprocessedAccounts'] as List)
          .whereNotNull()
          .map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class StopMonitoringMembersResponse {
  /// A list of objects that contain an accountId for each account that could not
  /// be processed, and a result string that indicates why the account was not
  /// processed.
  final List<UnprocessedAccount> unprocessedAccounts;

  StopMonitoringMembersResponse({
    required this.unprocessedAccounts,
  });

  factory StopMonitoringMembersResponse.fromJson(Map<String, dynamic> json) {
    return StopMonitoringMembersResponse(
      unprocessedAccounts: (json['unprocessedAccounts'] as List)
          .whereNotNull()
          .map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Contains information about a tag associated with the EC2 instance.
class Tag {
  /// The EC2 instance tag key.
  final String? key;

  /// The EC2 instance tag value.
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }
}

/// Contains details about identified threats organized by threat name.
class ThreatDetectedByName {
  /// Total number of infected files identified.
  final int? itemCount;

  /// Flag to determine if the finding contains every single infected file-path
  /// and/or every threat.
  final bool? shortened;

  /// List of identified threats with details, organized by threat name.
  final List<ScanThreatName>? threatNames;

  /// Total number of unique threats by name identified, as part of the malware
  /// scan.
  final int? uniqueThreatNameCount;

  ThreatDetectedByName({
    this.itemCount,
    this.shortened,
    this.threatNames,
    this.uniqueThreatNameCount,
  });

  factory ThreatDetectedByName.fromJson(Map<String, dynamic> json) {
    return ThreatDetectedByName(
      itemCount: json['itemCount'] as int?,
      shortened: json['shortened'] as bool?,
      threatNames: (json['threatNames'] as List?)
          ?.whereNotNull()
          .map((e) => ScanThreatName.fromJson(e as Map<String, dynamic>))
          .toList(),
      uniqueThreatNameCount: json['uniqueThreatNameCount'] as int?,
    );
  }
}

enum ThreatIntelSetFormat {
  txt('TXT'),
  stix('STIX'),
  otxCsv('OTX_CSV'),
  alienVault('ALIEN_VAULT'),
  proofPoint('PROOF_POINT'),
  fireEye('FIRE_EYE'),
  ;

  final String value;

  const ThreatIntelSetFormat(this.value);

  static ThreatIntelSetFormat fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ThreatIntelSetFormat'));
}

enum ThreatIntelSetStatus {
  inactive('INACTIVE'),
  activating('ACTIVATING'),
  active('ACTIVE'),
  deactivating('DEACTIVATING'),
  error('ERROR'),
  deletePending('DELETE_PENDING'),
  deleted('DELETED'),
  ;

  final String value;

  const ThreatIntelSetStatus(this.value);

  static ThreatIntelSetStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ThreatIntelSetStatus'));
}

/// An instance of a threat intelligence detail that constitutes evidence for
/// the finding.
class ThreatIntelligenceDetail {
  /// SHA256 of the file that generated the finding.
  final String? threatFileSha256;

  /// The name of the threat intelligence list that triggered the finding.
  final String? threatListName;

  /// A list of names of the threats in the threat intelligence list that
  /// triggered the finding.
  final List<String>? threatNames;

  ThreatIntelligenceDetail({
    this.threatFileSha256,
    this.threatListName,
    this.threatNames,
  });

  factory ThreatIntelligenceDetail.fromJson(Map<String, dynamic> json) {
    return ThreatIntelligenceDetail(
      threatFileSha256: json['threatFileSha256'] as String?,
      threatListName: json['threatListName'] as String?,
      threatNames: (json['threatNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }
}

/// Contains total number of infected files.
class ThreatsDetectedItemCount {
  /// Total number of infected files.
  final int? files;

  ThreatsDetectedItemCount({
    this.files,
  });

  factory ThreatsDetectedItemCount.fromJson(Map<String, dynamic> json) {
    return ThreatsDetectedItemCount(
      files: json['files'] as int?,
    );
  }
}

/// Contains the total usage with the corresponding currency unit for that
/// value.
class Total {
  /// The total usage.
  final String? amount;

  /// The currency unit that the amount is given in.
  final String? unit;

  Total({
    this.amount,
    this.unit,
  });

  factory Total.fromJson(Map<String, dynamic> json) {
    return Total(
      amount: json['amount'] as String?,
      unit: json['unit'] as String?,
    );
  }
}

/// Represents the reason the scan was triggered.
class TriggerDetails {
  /// The description of the scan trigger.
  final String? description;

  /// The ID of the GuardDuty finding that triggered the malware scan.
  final String? guardDutyFindingId;

  TriggerDetails({
    this.description,
    this.guardDutyFindingId,
  });

  factory TriggerDetails.fromJson(Map<String, dynamic> json) {
    return TriggerDetails(
      description: json['description'] as String?,
      guardDutyFindingId: json['guardDutyFindingId'] as String?,
    );
  }
}

class UnarchiveFindingsResponse {
  UnarchiveFindingsResponse();

  factory UnarchiveFindingsResponse.fromJson(Map<String, dynamic> _) {
    return UnarchiveFindingsResponse();
  }
}

/// Contains information about the accounts that weren't processed.
class UnprocessedAccount {
  /// The Amazon Web Services account ID.
  final String accountId;

  /// A reason why the account hasn't been processed.
  final String result;

  UnprocessedAccount({
    required this.accountId,
    required this.result,
  });

  factory UnprocessedAccount.fromJson(Map<String, dynamic> json) {
    return UnprocessedAccount(
      accountId: json['accountId'] as String,
      result: json['result'] as String,
    );
  }
}

/// Specifies the names of the data sources that couldn't be enabled.
class UnprocessedDataSourcesResult {
  final MalwareProtectionConfigurationResult? malwareProtection;

  UnprocessedDataSourcesResult({
    this.malwareProtection,
  });

  factory UnprocessedDataSourcesResult.fromJson(Map<String, dynamic> json) {
    return UnprocessedDataSourcesResult(
      malwareProtection: json['malwareProtection'] != null
          ? MalwareProtectionConfigurationResult.fromJson(
              json['malwareProtection'] as Map<String, dynamic>)
          : null,
    );
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }
}

class UpdateDetectorResponse {
  UpdateDetectorResponse();

  factory UpdateDetectorResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDetectorResponse();
  }
}

class UpdateFilterResponse {
  /// The name of the filter.
  final String name;

  UpdateFilterResponse({
    required this.name,
  });

  factory UpdateFilterResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFilterResponse(
      name: json['name'] as String,
    );
  }
}

class UpdateFindingsFeedbackResponse {
  UpdateFindingsFeedbackResponse();

  factory UpdateFindingsFeedbackResponse.fromJson(Map<String, dynamic> _) {
    return UpdateFindingsFeedbackResponse();
  }
}

class UpdateIPSetResponse {
  UpdateIPSetResponse();

  factory UpdateIPSetResponse.fromJson(Map<String, dynamic> _) {
    return UpdateIPSetResponse();
  }
}

class UpdateMalwareScanSettingsResponse {
  UpdateMalwareScanSettingsResponse();

  factory UpdateMalwareScanSettingsResponse.fromJson(Map<String, dynamic> _) {
    return UpdateMalwareScanSettingsResponse();
  }
}

class UpdateMemberDetectorsResponse {
  /// A list of member account IDs that were unable to be processed along with an
  /// explanation for why they were not processed.
  final List<UnprocessedAccount> unprocessedAccounts;

  UpdateMemberDetectorsResponse({
    required this.unprocessedAccounts,
  });

  factory UpdateMemberDetectorsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMemberDetectorsResponse(
      unprocessedAccounts: (json['unprocessedAccounts'] as List)
          .whereNotNull()
          .map((e) => UnprocessedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class UpdateOrganizationConfigurationResponse {
  UpdateOrganizationConfigurationResponse();

  factory UpdateOrganizationConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateOrganizationConfigurationResponse();
  }
}

class UpdatePublishingDestinationResponse {
  UpdatePublishingDestinationResponse();

  factory UpdatePublishingDestinationResponse.fromJson(Map<String, dynamic> _) {
    return UpdatePublishingDestinationResponse();
  }
}

class UpdateThreatIntelSetResponse {
  UpdateThreatIntelSetResponse();

  factory UpdateThreatIntelSetResponse.fromJson(Map<String, dynamic> _) {
    return UpdateThreatIntelSetResponse();
  }
}

/// Contains information on the total of usage based on account IDs.
class UsageAccountResult {
  /// The Account ID that generated usage.
  final String? accountId;

  /// Represents the total of usage for the Account ID.
  final Total? total;

  UsageAccountResult({
    this.accountId,
    this.total,
  });

  factory UsageAccountResult.fromJson(Map<String, dynamic> json) {
    return UsageAccountResult(
      accountId: json['accountId'] as String?,
      total: json['total'] != null
          ? Total.fromJson(json['total'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains information about the criteria used to query usage statistics.
class UsageCriteria {
  /// The account IDs to aggregate usage statistics from.
  final List<String>? accountIds;

  /// The data sources to aggregate usage statistics from.
  final List<DataSource>? dataSources;

  /// The features to aggregate usage statistics from.
  final List<UsageFeature>? features;

  /// The resources to aggregate usage statistics from. Only accepts exact
  /// resource names.
  final List<String>? resources;

  UsageCriteria({
    this.accountIds,
    this.dataSources,
    this.features,
    this.resources,
  });

  Map<String, dynamic> toJson() {
    final accountIds = this.accountIds;
    final dataSources = this.dataSources;
    final features = this.features;
    final resources = this.resources;
    return {
      if (accountIds != null) 'accountIds': accountIds,
      if (dataSources != null)
        'dataSources': dataSources.map((e) => e.value).toList(),
      if (features != null) 'features': features.map((e) => e.value).toList(),
      if (resources != null) 'resources': resources,
    };
  }
}

/// Contains information on the result of usage based on data source type.
class UsageDataSourceResult {
  /// The data source type that generated usage.
  final DataSource? dataSource;

  /// Represents the total of usage for the specified data source.
  final Total? total;

  UsageDataSourceResult({
    this.dataSource,
    this.total,
  });

  factory UsageDataSourceResult.fromJson(Map<String, dynamic> json) {
    return UsageDataSourceResult(
      dataSource: (json['dataSource'] as String?)?.let(DataSource.fromString),
      total: json['total'] != null
          ? Total.fromJson(json['total'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum UsageFeature {
  flowLogs('FLOW_LOGS'),
  cloudTrail('CLOUD_TRAIL'),
  dnsLogs('DNS_LOGS'),
  s3DataEvents('S3_DATA_EVENTS'),
  eksAuditLogs('EKS_AUDIT_LOGS'),
  ebsMalwareProtection('EBS_MALWARE_PROTECTION'),
  rdsLoginEvents('RDS_LOGIN_EVENTS'),
  lambdaNetworkLogs('LAMBDA_NETWORK_LOGS'),
  eksRuntimeMonitoring('EKS_RUNTIME_MONITORING'),
  fargateRuntimeMonitoring('FARGATE_RUNTIME_MONITORING'),
  ec2RuntimeMonitoring('EC2_RUNTIME_MONITORING'),
  rdsDbiProtectionProvisioned('RDS_DBI_PROTECTION_PROVISIONED'),
  rdsDbiProtectionServerless('RDS_DBI_PROTECTION_SERVERLESS'),
  ;

  final String value;

  const UsageFeature(this.value);

  static UsageFeature fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum UsageFeature'));
}

/// Contains information about the result of the total usage based on the
/// feature.
class UsageFeatureResult {
  /// The feature that generated the usage cost.
  final UsageFeature? feature;
  final Total? total;

  UsageFeatureResult({
    this.feature,
    this.total,
  });

  factory UsageFeatureResult.fromJson(Map<String, dynamic> json) {
    return UsageFeatureResult(
      feature: (json['feature'] as String?)?.let(UsageFeature.fromString),
      total: json['total'] != null
          ? Total.fromJson(json['total'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Contains information on the sum of usage based on an Amazon Web Services
/// resource.
class UsageResourceResult {
  /// The Amazon Web Services resource that generated usage.
  final String? resource;

  /// Represents the sum total of usage for the specified resource type.
  final Total? total;

  UsageResourceResult({
    this.resource,
    this.total,
  });

  factory UsageResourceResult.fromJson(Map<String, dynamic> json) {
    return UsageResourceResult(
      resource: json['resource'] as String?,
      total: json['total'] != null
          ? Total.fromJson(json['total'] as Map<String, dynamic>)
          : null,
    );
  }
}

enum UsageStatisticType {
  sumByAccount('SUM_BY_ACCOUNT'),
  sumByDataSource('SUM_BY_DATA_SOURCE'),
  sumByResource('SUM_BY_RESOURCE'),
  topResources('TOP_RESOURCES'),
  sumByFeatures('SUM_BY_FEATURES'),
  topAccountsByFeature('TOP_ACCOUNTS_BY_FEATURE'),
  ;

  final String value;

  const UsageStatisticType(this.value);

  static UsageStatisticType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum UsageStatisticType'));
}

/// Contains the result of GuardDuty usage. If a UsageStatisticType is provided
/// the result for other types will be null.
class UsageStatistics {
  /// The usage statistic sum organized by account ID.
  final List<UsageAccountResult>? sumByAccount;

  /// The usage statistic sum organized by on data source.
  final List<UsageDataSourceResult>? sumByDataSource;

  /// The usage statistic sum organized by feature.
  final List<UsageFeatureResult>? sumByFeature;

  /// The usage statistic sum organized by resource.
  final List<UsageResourceResult>? sumByResource;

  /// Lists the top 50 accounts by feature that have generated the most GuardDuty
  /// usage, in the order from most to least expensive.
  ///
  /// Currently, this doesn't support <code>RDS_LOGIN_EVENTS</code>.
  final List<UsageTopAccountsResult>? topAccountsByFeature;

  /// Lists the top 50 resources that have generated the most GuardDuty usage, in
  /// order from most to least expensive.
  final List<UsageResourceResult>? topResources;

  UsageStatistics({
    this.sumByAccount,
    this.sumByDataSource,
    this.sumByFeature,
    this.sumByResource,
    this.topAccountsByFeature,
    this.topResources,
  });

  factory UsageStatistics.fromJson(Map<String, dynamic> json) {
    return UsageStatistics(
      sumByAccount: (json['sumByAccount'] as List?)
          ?.whereNotNull()
          .map((e) => UsageAccountResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      sumByDataSource: (json['sumByDataSource'] as List?)
          ?.whereNotNull()
          .map((e) => UsageDataSourceResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      sumByFeature: (json['sumByFeature'] as List?)
          ?.whereNotNull()
          .map((e) => UsageFeatureResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      sumByResource: (json['sumByResource'] as List?)
          ?.whereNotNull()
          .map((e) => UsageResourceResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      topAccountsByFeature: (json['topAccountsByFeature'] as List?)
          ?.whereNotNull()
          .map(
              (e) => UsageTopAccountsResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      topResources: (json['topResources'] as List?)
          ?.whereNotNull()
          .map((e) => UsageResourceResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Contains information on the total of usage based on the topmost 50 account
/// IDs.
class UsageTopAccountResult {
  /// The unique account ID.
  final String? accountId;
  final Total? total;

  UsageTopAccountResult({
    this.accountId,
    this.total,
  });

  factory UsageTopAccountResult.fromJson(Map<String, dynamic> json) {
    return UsageTopAccountResult(
      accountId: json['accountId'] as String?,
      total: json['total'] != null
          ? Total.fromJson(json['total'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// Information about the usage statistics, calculated by top accounts by
/// feature.
class UsageTopAccountsResult {
  /// The accounts that contributed to the total usage cost.
  final List<UsageTopAccountResult>? accounts;

  /// Features by which you can generate the usage statistics.
  ///
  /// <code>RDS_LOGIN_EVENTS</code> is currently not supported with
  /// <code>topAccountsByFeature</code>.
  final UsageFeature? feature;

  UsageTopAccountsResult({
    this.accounts,
    this.feature,
  });

  factory UsageTopAccountsResult.fromJson(Map<String, dynamic> json) {
    return UsageTopAccountsResult(
      accounts: (json['accounts'] as List?)
          ?.whereNotNull()
          .map((e) => UsageTopAccountResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      feature: (json['feature'] as String?)?.let(UsageFeature.fromString),
    );
  }
}

/// Volume used by the Kubernetes workload.
class Volume {
  /// Represents a pre-existing file or directory on the host machine that the
  /// volume maps to.
  final HostPath? hostPath;

  /// Volume name.
  final String? name;

  Volume({
    this.hostPath,
    this.name,
  });

  factory Volume.fromJson(Map<String, dynamic> json) {
    return Volume(
      hostPath: json['hostPath'] != null
          ? HostPath.fromJson(json['hostPath'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
    );
  }
}

/// Contains EBS volume details.
class VolumeDetail {
  /// The device name for the EBS volume.
  final String? deviceName;

  /// EBS volume encryption type.
  final String? encryptionType;

  /// KMS key Arn used to encrypt the EBS volume.
  final String? kmsKeyArn;

  /// Snapshot Arn of the EBS volume.
  final String? snapshotArn;

  /// EBS volume Arn information.
  final String? volumeArn;

  /// EBS volume size in GB.
  final int? volumeSizeInGB;

  /// The EBS volume type.
  final String? volumeType;

  VolumeDetail({
    this.deviceName,
    this.encryptionType,
    this.kmsKeyArn,
    this.snapshotArn,
    this.volumeArn,
    this.volumeSizeInGB,
    this.volumeType,
  });

  factory VolumeDetail.fromJson(Map<String, dynamic> json) {
    return VolumeDetail(
      deviceName: json['deviceName'] as String?,
      encryptionType: json['encryptionType'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      snapshotArn: json['snapshotArn'] as String?,
      volumeArn: json['volumeArn'] as String?,
      volumeSizeInGB: json['volumeSizeInGB'] as int?,
      volumeType: json['volumeType'] as String?,
    );
  }
}

/// Container volume mount.
class VolumeMount {
  /// Volume mount path.
  final String? mountPath;

  /// Volume mount name.
  final String? name;

  VolumeMount({
    this.mountPath,
    this.name,
  });

  factory VolumeMount.fromJson(Map<String, dynamic> json) {
    return VolumeMount(
      mountPath: json['mountPath'] as String?,
      name: json['name'] as String?,
    );
  }
}

/// Amazon Virtual Private Cloud configuration details associated with your
/// Lambda function.
class VpcConfig {
  /// The identifier of the security group attached to the Lambda function.
  final List<SecurityGroup>? securityGroups;

  /// The identifiers of the subnets that are associated with your Lambda
  /// function.
  final List<String>? subnetIds;

  /// The identifier of the Amazon Virtual Private Cloud.
  final String? vpcId;

  VpcConfig({
    this.securityGroups,
    this.subnetIds,
    this.vpcId,
  });

  factory VpcConfig.fromJson(Map<String, dynamic> json) {
    return VpcConfig(
      securityGroups: (json['securityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => SecurityGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['vpcId'] as String?,
    );
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
};

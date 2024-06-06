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
        'findingPublishingFrequency': findingPublishingFrequency.toValue(),
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
      if (action != null) 'action': action.toValue(),
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
      'format': format.toValue(),
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
      'destinationType': destinationType.toValue(),
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
      'format': format.toValue(),
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
      'statisticsType': statisticsType.map((e) => e.toValue()).toList(),
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
          findingStatisticTypes.map((e) => e.toValue()).toList(),
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
      'usageStatisticsType': usageStatisticType.toValue(),
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
        'findingPublishingFrequency': findingPublishingFrequency.toValue(),
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
      if (action != null) 'action': action.toValue(),
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
      'feedback': feedback.toValue(),
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
        'ebsSnapshotPreservation': ebsSnapshotPreservation.toValue(),
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
        'autoEnableOrganizationMembers':
            autoEnableOrganizationMembers.toValue(),
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

  Map<String, dynamic> toJson() {
    return {};
  }
}

@Deprecated(
    'This output is deprecated, use AcceptAdministratorInvitationResponse instead')
class AcceptInvitationResponse {
  AcceptInvitationResponse();

  factory AcceptInvitationResponse.fromJson(Map<String, dynamic> _) {
    return AcceptInvitationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

  Map<String, dynamic> toJson() {
    final allowsPublicReadAccess = this.allowsPublicReadAccess;
    final allowsPublicWriteAccess = this.allowsPublicWriteAccess;
    return {
      if (allowsPublicReadAccess != null)
        'allowsPublicReadAccess': allowsPublicReadAccess,
      if (allowsPublicWriteAccess != null)
        'allowsPublicWriteAccess': allowsPublicWriteAccess,
    };
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

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final principalId = this.principalId;
    final userName = this.userName;
    final userType = this.userType;
    return {
      if (accessKeyId != null) 'accessKeyId': accessKeyId,
      if (principalId != null) 'principalId': principalId,
      if (userName != null) 'userName': userName,
      if (userType != null) 'userType': userType,
    };
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

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final dataSources = this.dataSources;
    final features = this.features;
    return {
      if (accountId != null) 'accountId': accountId,
      if (dataSources != null) 'dataSources': dataSources,
      if (features != null) 'features': features,
    };
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

  Map<String, dynamic> toJson() {
    final blockPublicAccess = this.blockPublicAccess;
    return {
      if (blockPublicAccess != null) 'blockPublicAccess': blockPublicAccess,
    };
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

  Map<String, dynamic> toJson() {
    final actionType = this.actionType;
    final awsApiCallAction = this.awsApiCallAction;
    final dnsRequestAction = this.dnsRequestAction;
    final kubernetesApiCallAction = this.kubernetesApiCallAction;
    final kubernetesPermissionCheckedDetails =
        this.kubernetesPermissionCheckedDetails;
    final kubernetesRoleBindingDetails = this.kubernetesRoleBindingDetails;
    final kubernetesRoleDetails = this.kubernetesRoleDetails;
    final networkConnectionAction = this.networkConnectionAction;
    final portProbeAction = this.portProbeAction;
    final rdsLoginAttemptAction = this.rdsLoginAttemptAction;
    return {
      if (actionType != null) 'actionType': actionType,
      if (awsApiCallAction != null) 'awsApiCallAction': awsApiCallAction,
      if (dnsRequestAction != null) 'dnsRequestAction': dnsRequestAction,
      if (kubernetesApiCallAction != null)
        'kubernetesApiCallAction': kubernetesApiCallAction,
      if (kubernetesPermissionCheckedDetails != null)
        'kubernetesPermissionCheckedDetails':
            kubernetesPermissionCheckedDetails,
      if (kubernetesRoleBindingDetails != null)
        'kubernetesRoleBindingDetails': kubernetesRoleBindingDetails,
      if (kubernetesRoleDetails != null)
        'kubernetesRoleDetails': kubernetesRoleDetails,
      if (networkConnectionAction != null)
        'networkConnectionAction': networkConnectionAction,
      if (portProbeAction != null) 'portProbeAction': portProbeAction,
      if (rdsLoginAttemptAction != null)
        'rdsLoginAttemptAction': rdsLoginAttemptAction,
    };
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

  Map<String, dynamic> toJson() {
    final addonStatus = this.addonStatus;
    final addonVersion = this.addonVersion;
    return {
      if (addonStatus != null) 'addonStatus': addonStatus,
      if (addonVersion != null) 'addonVersion': addonVersion,
    };
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
      adminStatus: (json['adminStatus'] as String?)?.toAdminStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final adminAccountId = this.adminAccountId;
    final adminStatus = this.adminStatus;
    return {
      if (adminAccountId != null) 'adminAccountId': adminAccountId,
      if (adminStatus != null) 'adminStatus': adminStatus.toValue(),
    };
  }
}

enum AdminStatus {
  enabled,
  disableInProgress,
}

extension AdminStatusValueExtension on AdminStatus {
  String toValue() {
    switch (this) {
      case AdminStatus.enabled:
        return 'ENABLED';
      case AdminStatus.disableInProgress:
        return 'DISABLE_IN_PROGRESS';
    }
  }
}

extension AdminStatusFromString on String {
  AdminStatus toAdminStatus() {
    switch (this) {
      case 'ENABLED':
        return AdminStatus.enabled;
      case 'DISABLE_IN_PROGRESS':
        return AdminStatus.disableInProgress;
    }
    throw Exception('$this is not known in enum AdminStatus');
  }
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

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final invitationId = this.invitationId;
    final invitedAt = this.invitedAt;
    final relationshipStatus = this.relationshipStatus;
    return {
      if (accountId != null) 'accountId': accountId,
      if (invitationId != null) 'invitationId': invitationId,
      if (invitedAt != null) 'invitedAt': invitedAt,
      if (relationshipStatus != null) 'relationshipStatus': relationshipStatus,
    };
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

  Map<String, dynamic> toJson() {
    final version = this.version;
    return {
      if (version != null) 'version': version,
    };
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

  Map<String, dynamic> toJson() {
    final profiles = this.profiles;
    final unusual = this.unusual;
    return {
      if (profiles != null) 'profiles': profiles,
      if (unusual != null) 'unusual': unusual,
    };
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
      profileSubtype: (json['profileSubtype'] as String?)?.toProfileSubtype(),
      profileType: (json['profileType'] as String?)?.toProfileType(),
    );
  }

  Map<String, dynamic> toJson() {
    final observations = this.observations;
    final profileSubtype = this.profileSubtype;
    final profileType = this.profileType;
    return {
      if (observations != null) 'observations': observations,
      if (profileSubtype != null) 'profileSubtype': profileSubtype.toValue(),
      if (profileType != null) 'profileType': profileType.toValue(),
    };
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

  Map<String, dynamic> toJson() {
    final behavior = this.behavior;
    return {
      if (behavior != null) 'behavior': behavior,
    };
  }
}

class ArchiveFindingsResponse {
  ArchiveFindingsResponse();

  factory ArchiveFindingsResponse.fromJson(Map<String, dynamic> _) {
    return ArchiveFindingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum AutoEnableMembers {
  $new,
  all,
  none,
}

extension AutoEnableMembersValueExtension on AutoEnableMembers {
  String toValue() {
    switch (this) {
      case AutoEnableMembers.$new:
        return 'NEW';
      case AutoEnableMembers.all:
        return 'ALL';
      case AutoEnableMembers.none:
        return 'NONE';
    }
  }
}

extension AutoEnableMembersFromString on String {
  AutoEnableMembers toAutoEnableMembers() {
    switch (this) {
      case 'NEW':
        return AutoEnableMembers.$new;
      case 'ALL':
        return AutoEnableMembers.all;
      case 'NONE':
        return AutoEnableMembers.none;
    }
    throw Exception('$this is not known in enum AutoEnableMembers');
  }
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

  Map<String, dynamic> toJson() {
    final affectedResources = this.affectedResources;
    final api = this.api;
    final callerType = this.callerType;
    final domainDetails = this.domainDetails;
    final errorCode = this.errorCode;
    final remoteAccountDetails = this.remoteAccountDetails;
    final remoteIpDetails = this.remoteIpDetails;
    final serviceName = this.serviceName;
    final userAgent = this.userAgent;
    return {
      if (affectedResources != null) 'affectedResources': affectedResources,
      if (api != null) 'api': api,
      if (callerType != null) 'callerType': callerType,
      if (domainDetails != null) 'domainDetails': domainDetails,
      if (errorCode != null) 'errorCode': errorCode,
      if (remoteAccountDetails != null)
        'remoteAccountDetails': remoteAccountDetails,
      if (remoteIpDetails != null) 'remoteIpDetails': remoteIpDetails,
      if (serviceName != null) 'serviceName': serviceName,
      if (userAgent != null) 'userAgent': userAgent,
    };
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

  Map<String, dynamic> toJson() {
    final blockPublicAcls = this.blockPublicAcls;
    final blockPublicPolicy = this.blockPublicPolicy;
    final ignorePublicAcls = this.ignorePublicAcls;
    final restrictPublicBuckets = this.restrictPublicBuckets;
    return {
      if (blockPublicAcls != null) 'blockPublicAcls': blockPublicAcls,
      if (blockPublicPolicy != null) 'blockPublicPolicy': blockPublicPolicy,
      if (ignorePublicAcls != null) 'ignorePublicAcls': ignorePublicAcls,
      if (restrictPublicBuckets != null)
        'restrictPublicBuckets': restrictPublicBuckets,
    };
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

  Map<String, dynamic> toJson() {
    final accessControlList = this.accessControlList;
    final blockPublicAccess = this.blockPublicAccess;
    final bucketPolicy = this.bucketPolicy;
    return {
      if (accessControlList != null) 'accessControlList': accessControlList,
      if (blockPublicAccess != null) 'blockPublicAccess': blockPublicAccess,
      if (bucketPolicy != null) 'bucketPolicy': bucketPolicy,
    };
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

  Map<String, dynamic> toJson() {
    final allowsPublicReadAccess = this.allowsPublicReadAccess;
    final allowsPublicWriteAccess = this.allowsPublicWriteAccess;
    return {
      if (allowsPublicReadAccess != null)
        'allowsPublicReadAccess': allowsPublicReadAccess,
      if (allowsPublicWriteAccess != null)
        'allowsPublicWriteAccess': allowsPublicWriteAccess,
    };
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

  Map<String, dynamic> toJson() {
    final cityName = this.cityName;
    return {
      if (cityName != null) 'cityName': cityName,
    };
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
      status: (json['status'] as String).toDataSourceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.toValue(),
    };
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

  Map<String, dynamic> toJson() {
    final containerRuntime = this.containerRuntime;
    final id = this.id;
    final image = this.image;
    final imagePrefix = this.imagePrefix;
    final name = this.name;
    final securityContext = this.securityContext;
    final volumeMounts = this.volumeMounts;
    return {
      if (containerRuntime != null) 'containerRuntime': containerRuntime,
      if (id != null) 'id': id,
      if (image != null) 'image': image,
      if (imagePrefix != null) 'imagePrefix': imagePrefix,
      if (name != null) 'name': name,
      if (securityContext != null) 'securityContext': securityContext,
      if (volumeMounts != null) 'volumeMounts': volumeMounts,
    };
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

  Map<String, dynamic> toJson() {
    final compatibleContainerInstances = this.compatibleContainerInstances;
    final coveredContainerInstances = this.coveredContainerInstances;
    return {
      if (compatibleContainerInstances != null)
        'compatibleContainerInstances': compatibleContainerInstances,
      if (coveredContainerInstances != null)
        'coveredContainerInstances': coveredContainerInstances,
    };
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

  Map<String, dynamic> toJson() {
    final countryCode = this.countryCode;
    final countryName = this.countryName;
    return {
      if (countryCode != null) 'countryCode': countryCode,
      if (countryName != null) 'countryName': countryName,
    };
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
      managementType: (json['managementType'] as String?)?.toManagementType(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentDetails = this.agentDetails;
    final clusterArn = this.clusterArn;
    final instanceId = this.instanceId;
    final instanceType = this.instanceType;
    final managementType = this.managementType;
    return {
      if (agentDetails != null) 'agentDetails': agentDetails,
      if (clusterArn != null) 'clusterArn': clusterArn,
      if (instanceId != null) 'instanceId': instanceId,
      if (instanceType != null) 'instanceType': instanceType,
      if (managementType != null) 'managementType': managementType.toValue(),
    };
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

  Map<String, dynamic> toJson() {
    final clusterName = this.clusterName;
    final containerInstanceDetails = this.containerInstanceDetails;
    final fargateDetails = this.fargateDetails;
    return {
      if (clusterName != null) 'clusterName': clusterName,
      if (containerInstanceDetails != null)
        'containerInstanceDetails': containerInstanceDetails,
      if (fargateDetails != null) 'fargateDetails': fargateDetails,
    };
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
      managementType: (json['managementType'] as String?)?.toManagementType(),
    );
  }

  Map<String, dynamic> toJson() {
    final addonDetails = this.addonDetails;
    final clusterName = this.clusterName;
    final compatibleNodes = this.compatibleNodes;
    final coveredNodes = this.coveredNodes;
    final managementType = this.managementType;
    return {
      if (addonDetails != null) 'addonDetails': addonDetails,
      if (clusterName != null) 'clusterName': clusterName,
      if (compatibleNodes != null) 'compatibleNodes': compatibleNodes,
      if (coveredNodes != null) 'coveredNodes': coveredNodes,
      if (managementType != null) 'managementType': managementType.toValue(),
    };
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
      if (criterionKey != null) 'criterionKey': criterionKey.toValue(),
      if (filterCondition != null) 'filterCondition': filterCondition,
    };
  }
}

enum CoverageFilterCriterionKey {
  accountId,
  clusterName,
  resourceType,
  coverageStatus,
  addonVersion,
  managementType,
  eksClusterName,
  ecsClusterName,
  agentVersion,
  instanceId,
  clusterArn,
}

extension CoverageFilterCriterionKeyValueExtension
    on CoverageFilterCriterionKey {
  String toValue() {
    switch (this) {
      case CoverageFilterCriterionKey.accountId:
        return 'ACCOUNT_ID';
      case CoverageFilterCriterionKey.clusterName:
        return 'CLUSTER_NAME';
      case CoverageFilterCriterionKey.resourceType:
        return 'RESOURCE_TYPE';
      case CoverageFilterCriterionKey.coverageStatus:
        return 'COVERAGE_STATUS';
      case CoverageFilterCriterionKey.addonVersion:
        return 'ADDON_VERSION';
      case CoverageFilterCriterionKey.managementType:
        return 'MANAGEMENT_TYPE';
      case CoverageFilterCriterionKey.eksClusterName:
        return 'EKS_CLUSTER_NAME';
      case CoverageFilterCriterionKey.ecsClusterName:
        return 'ECS_CLUSTER_NAME';
      case CoverageFilterCriterionKey.agentVersion:
        return 'AGENT_VERSION';
      case CoverageFilterCriterionKey.instanceId:
        return 'INSTANCE_ID';
      case CoverageFilterCriterionKey.clusterArn:
        return 'CLUSTER_ARN';
    }
  }
}

extension CoverageFilterCriterionKeyFromString on String {
  CoverageFilterCriterionKey toCoverageFilterCriterionKey() {
    switch (this) {
      case 'ACCOUNT_ID':
        return CoverageFilterCriterionKey.accountId;
      case 'CLUSTER_NAME':
        return CoverageFilterCriterionKey.clusterName;
      case 'RESOURCE_TYPE':
        return CoverageFilterCriterionKey.resourceType;
      case 'COVERAGE_STATUS':
        return CoverageFilterCriterionKey.coverageStatus;
      case 'ADDON_VERSION':
        return CoverageFilterCriterionKey.addonVersion;
      case 'MANAGEMENT_TYPE':
        return CoverageFilterCriterionKey.managementType;
      case 'EKS_CLUSTER_NAME':
        return CoverageFilterCriterionKey.eksClusterName;
      case 'ECS_CLUSTER_NAME':
        return CoverageFilterCriterionKey.ecsClusterName;
      case 'AGENT_VERSION':
        return CoverageFilterCriterionKey.agentVersion;
      case 'INSTANCE_ID':
        return CoverageFilterCriterionKey.instanceId;
      case 'CLUSTER_ARN':
        return CoverageFilterCriterionKey.clusterArn;
    }
    throw Exception('$this is not known in enum CoverageFilterCriterionKey');
  }
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
      coverageStatus: (json['coverageStatus'] as String?)?.toCoverageStatus(),
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

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final coverageStatus = this.coverageStatus;
    final detectorId = this.detectorId;
    final issue = this.issue;
    final resourceDetails = this.resourceDetails;
    final resourceId = this.resourceId;
    final updatedAt = this.updatedAt;
    return {
      if (accountId != null) 'accountId': accountId,
      if (coverageStatus != null) 'coverageStatus': coverageStatus.toValue(),
      if (detectorId != null) 'detectorId': detectorId,
      if (issue != null) 'issue': issue,
      if (resourceDetails != null) 'resourceDetails': resourceDetails,
      if (resourceId != null) 'resourceId': resourceId,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
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
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final ec2InstanceDetails = this.ec2InstanceDetails;
    final ecsClusterDetails = this.ecsClusterDetails;
    final eksClusterDetails = this.eksClusterDetails;
    final resourceType = this.resourceType;
    return {
      if (ec2InstanceDetails != null) 'ec2InstanceDetails': ec2InstanceDetails,
      if (ecsClusterDetails != null) 'ecsClusterDetails': ecsClusterDetails,
      if (eksClusterDetails != null) 'eksClusterDetails': eksClusterDetails,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
    };
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
      if (attributeName != null) 'attributeName': attributeName.toValue(),
      if (orderBy != null) 'orderBy': orderBy.toValue(),
    };
  }
}

enum CoverageSortKey {
  accountId,
  clusterName,
  coverageStatus,
  issue,
  addonVersion,
  updatedAt,
  eksClusterName,
  ecsClusterName,
  instanceId,
}

extension CoverageSortKeyValueExtension on CoverageSortKey {
  String toValue() {
    switch (this) {
      case CoverageSortKey.accountId:
        return 'ACCOUNT_ID';
      case CoverageSortKey.clusterName:
        return 'CLUSTER_NAME';
      case CoverageSortKey.coverageStatus:
        return 'COVERAGE_STATUS';
      case CoverageSortKey.issue:
        return 'ISSUE';
      case CoverageSortKey.addonVersion:
        return 'ADDON_VERSION';
      case CoverageSortKey.updatedAt:
        return 'UPDATED_AT';
      case CoverageSortKey.eksClusterName:
        return 'EKS_CLUSTER_NAME';
      case CoverageSortKey.ecsClusterName:
        return 'ECS_CLUSTER_NAME';
      case CoverageSortKey.instanceId:
        return 'INSTANCE_ID';
    }
  }
}

extension CoverageSortKeyFromString on String {
  CoverageSortKey toCoverageSortKey() {
    switch (this) {
      case 'ACCOUNT_ID':
        return CoverageSortKey.accountId;
      case 'CLUSTER_NAME':
        return CoverageSortKey.clusterName;
      case 'COVERAGE_STATUS':
        return CoverageSortKey.coverageStatus;
      case 'ISSUE':
        return CoverageSortKey.issue;
      case 'ADDON_VERSION':
        return CoverageSortKey.addonVersion;
      case 'UPDATED_AT':
        return CoverageSortKey.updatedAt;
      case 'EKS_CLUSTER_NAME':
        return CoverageSortKey.eksClusterName;
      case 'ECS_CLUSTER_NAME':
        return CoverageSortKey.ecsClusterName;
      case 'INSTANCE_ID':
        return CoverageSortKey.instanceId;
    }
    throw Exception('$this is not known in enum CoverageSortKey');
  }
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
              ?.map((k, e) => MapEntry(k.toCoverageStatus(), e as int)),
      countByResourceType:
          (json['countByResourceType'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k.toResourceType(), e as int)),
    );
  }

  Map<String, dynamic> toJson() {
    final countByCoverageStatus = this.countByCoverageStatus;
    final countByResourceType = this.countByResourceType;
    return {
      if (countByCoverageStatus != null)
        'countByCoverageStatus':
            countByCoverageStatus.map((k, e) => MapEntry(k.toValue(), e)),
      if (countByResourceType != null)
        'countByResourceType':
            countByResourceType.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

enum CoverageStatisticsType {
  countByResourceType,
  countByCoverageStatus,
}

extension CoverageStatisticsTypeValueExtension on CoverageStatisticsType {
  String toValue() {
    switch (this) {
      case CoverageStatisticsType.countByResourceType:
        return 'COUNT_BY_RESOURCE_TYPE';
      case CoverageStatisticsType.countByCoverageStatus:
        return 'COUNT_BY_COVERAGE_STATUS';
    }
  }
}

extension CoverageStatisticsTypeFromString on String {
  CoverageStatisticsType toCoverageStatisticsType() {
    switch (this) {
      case 'COUNT_BY_RESOURCE_TYPE':
        return CoverageStatisticsType.countByResourceType;
      case 'COUNT_BY_COVERAGE_STATUS':
        return CoverageStatisticsType.countByCoverageStatus;
    }
    throw Exception('$this is not known in enum CoverageStatisticsType');
  }
}

enum CoverageStatus {
  healthy,
  unhealthy,
}

extension CoverageStatusValueExtension on CoverageStatus {
  String toValue() {
    switch (this) {
      case CoverageStatus.healthy:
        return 'HEALTHY';
      case CoverageStatus.unhealthy:
        return 'UNHEALTHY';
    }
  }
}

extension CoverageStatusFromString on String {
  CoverageStatus toCoverageStatus() {
    switch (this) {
      case 'HEALTHY':
        return CoverageStatus.healthy;
      case 'UNHEALTHY':
        return CoverageStatus.unhealthy;
    }
    throw Exception('$this is not known in enum CoverageStatus');
  }
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

  Map<String, dynamic> toJson() {
    final detectorId = this.detectorId;
    final unprocessedDataSources = this.unprocessedDataSources;
    return {
      if (detectorId != null) 'detectorId': detectorId,
      if (unprocessedDataSources != null)
        'unprocessedDataSources': unprocessedDataSources,
    };
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

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
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

  Map<String, dynamic> toJson() {
    final ipSetId = this.ipSetId;
    return {
      'ipSetId': ipSetId,
    };
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

  Map<String, dynamic> toJson() {
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      'unprocessedAccounts': unprocessedAccounts,
    };
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

  Map<String, dynamic> toJson() {
    final destinationId = this.destinationId;
    return {
      'destinationId': destinationId,
    };
  }
}

class CreateSampleFindingsResponse {
  CreateSampleFindingsResponse();

  factory CreateSampleFindingsResponse.fromJson(Map<String, dynamic> _) {
    return CreateSampleFindingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

  Map<String, dynamic> toJson() {
    final threatIntelSetId = this.threatIntelSetId;
    return {
      'threatIntelSetId': threatIntelSetId,
    };
  }
}

enum CriterionKey {
  ec2InstanceArn,
  scanId,
  accountId,
  guarddutyFindingId,
  scanStartTime,
  scanStatus,
  scanType,
}

extension CriterionKeyValueExtension on CriterionKey {
  String toValue() {
    switch (this) {
      case CriterionKey.ec2InstanceArn:
        return 'EC2_INSTANCE_ARN';
      case CriterionKey.scanId:
        return 'SCAN_ID';
      case CriterionKey.accountId:
        return 'ACCOUNT_ID';
      case CriterionKey.guarddutyFindingId:
        return 'GUARDDUTY_FINDING_ID';
      case CriterionKey.scanStartTime:
        return 'SCAN_START_TIME';
      case CriterionKey.scanStatus:
        return 'SCAN_STATUS';
      case CriterionKey.scanType:
        return 'SCAN_TYPE';
    }
  }
}

extension CriterionKeyFromString on String {
  CriterionKey toCriterionKey() {
    switch (this) {
      case 'EC2_INSTANCE_ARN':
        return CriterionKey.ec2InstanceArn;
      case 'SCAN_ID':
        return CriterionKey.scanId;
      case 'ACCOUNT_ID':
        return CriterionKey.accountId;
      case 'GUARDDUTY_FINDING_ID':
        return CriterionKey.guarddutyFindingId;
      case 'SCAN_START_TIME':
        return CriterionKey.scanStartTime;
      case 'SCAN_STATUS':
        return CriterionKey.scanStatus;
      case 'SCAN_TYPE':
        return CriterionKey.scanType;
    }
    throw Exception('$this is not known in enum CriterionKey');
  }
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
      status: (json['status'] as String).toDataSourceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.toValue(),
    };
  }
}

enum DataSource {
  flowLogs,
  cloudTrail,
  dnsLogs,
  s3Logs,
  kubernetesAuditLogs,
  ec2MalwareScan,
}

extension DataSourceValueExtension on DataSource {
  String toValue() {
    switch (this) {
      case DataSource.flowLogs:
        return 'FLOW_LOGS';
      case DataSource.cloudTrail:
        return 'CLOUD_TRAIL';
      case DataSource.dnsLogs:
        return 'DNS_LOGS';
      case DataSource.s3Logs:
        return 'S3_LOGS';
      case DataSource.kubernetesAuditLogs:
        return 'KUBERNETES_AUDIT_LOGS';
      case DataSource.ec2MalwareScan:
        return 'EC2_MALWARE_SCAN';
    }
  }
}

extension DataSourceFromString on String {
  DataSource toDataSource() {
    switch (this) {
      case 'FLOW_LOGS':
        return DataSource.flowLogs;
      case 'CLOUD_TRAIL':
        return DataSource.cloudTrail;
      case 'DNS_LOGS':
        return DataSource.dnsLogs;
      case 'S3_LOGS':
        return DataSource.s3Logs;
      case 'KUBERNETES_AUDIT_LOGS':
        return DataSource.kubernetesAuditLogs;
      case 'EC2_MALWARE_SCAN':
        return DataSource.ec2MalwareScan;
    }
    throw Exception('$this is not known in enum DataSource');
  }
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

  Map<String, dynamic> toJson() {
    final cloudTrail = this.cloudTrail;
    final dNSLogs = this.dNSLogs;
    final flowLogs = this.flowLogs;
    final s3Logs = this.s3Logs;
    final kubernetes = this.kubernetes;
    final malwareProtection = this.malwareProtection;
    return {
      'cloudTrail': cloudTrail,
      'dnsLogs': dNSLogs,
      'flowLogs': flowLogs,
      's3Logs': s3Logs,
      if (kubernetes != null) 'kubernetes': kubernetes,
      if (malwareProtection != null) 'malwareProtection': malwareProtection,
    };
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

  Map<String, dynamic> toJson() {
    final freeTrialDaysRemaining = this.freeTrialDaysRemaining;
    return {
      if (freeTrialDaysRemaining != null)
        'freeTrialDaysRemaining': freeTrialDaysRemaining,
    };
  }
}

enum DataSourceStatus {
  enabled,
  disabled,
}

extension DataSourceStatusValueExtension on DataSourceStatus {
  String toValue() {
    switch (this) {
      case DataSourceStatus.enabled:
        return 'ENABLED';
      case DataSourceStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension DataSourceStatusFromString on String {
  DataSourceStatus toDataSourceStatus() {
    switch (this) {
      case 'ENABLED':
        return DataSourceStatus.enabled;
      case 'DISABLED':
        return DataSourceStatus.disabled;
    }
    throw Exception('$this is not known in enum DataSourceStatus');
  }
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

  Map<String, dynamic> toJson() {
    final cloudTrail = this.cloudTrail;
    final dnsLogs = this.dnsLogs;
    final flowLogs = this.flowLogs;
    final kubernetes = this.kubernetes;
    final malwareProtection = this.malwareProtection;
    final s3Logs = this.s3Logs;
    return {
      if (cloudTrail != null) 'cloudTrail': cloudTrail,
      if (dnsLogs != null) 'dnsLogs': dnsLogs,
      if (flowLogs != null) 'flowLogs': flowLogs,
      if (kubernetes != null) 'kubernetes': kubernetes,
      if (malwareProtection != null) 'malwareProtection': malwareProtection,
      if (s3Logs != null) 's3Logs': s3Logs,
    };
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

  Map<String, dynamic> toJson() {
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      'unprocessedAccounts': unprocessedAccounts,
    };
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

  Map<String, dynamic> toJson() {
    final encryptionType = this.encryptionType;
    final kmsMasterKeyArn = this.kmsMasterKeyArn;
    return {
      if (encryptionType != null) 'encryptionType': encryptionType,
      if (kmsMasterKeyArn != null) 'kmsMasterKeyArn': kmsMasterKeyArn,
    };
  }
}

class DeleteDetectorResponse {
  DeleteDetectorResponse();

  factory DeleteDetectorResponse.fromJson(Map<String, dynamic> _) {
    return DeleteDetectorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteFilterResponse {
  DeleteFilterResponse();

  factory DeleteFilterResponse.fromJson(Map<String, dynamic> _) {
    return DeleteFilterResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteIPSetResponse {
  DeleteIPSetResponse();

  factory DeleteIPSetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteIPSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

  Map<String, dynamic> toJson() {
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      'unprocessedAccounts': unprocessedAccounts,
    };
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

  Map<String, dynamic> toJson() {
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      'unprocessedAccounts': unprocessedAccounts,
    };
  }
}

class DeletePublishingDestinationResponse {
  DeletePublishingDestinationResponse();

  factory DeletePublishingDestinationResponse.fromJson(Map<String, dynamic> _) {
    return DeletePublishingDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteThreatIntelSetResponse {
  DeleteThreatIntelSetResponse();

  factory DeleteThreatIntelSetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteThreatIntelSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

  Map<String, dynamic> toJson() {
    final scans = this.scans;
    final nextToken = this.nextToken;
    return {
      'scans': scans,
      if (nextToken != null) 'nextToken': nextToken,
    };
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
              ?.toAutoEnableMembers(),
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

  Map<String, dynamic> toJson() {
    final memberAccountLimitReached = this.memberAccountLimitReached;
    final autoEnable = this.autoEnable;
    final autoEnableOrganizationMembers = this.autoEnableOrganizationMembers;
    final dataSources = this.dataSources;
    final features = this.features;
    final nextToken = this.nextToken;
    return {
      'memberAccountLimitReached': memberAccountLimitReached,
      if (autoEnable != null) 'autoEnable': autoEnable,
      if (autoEnableOrganizationMembers != null)
        'autoEnableOrganizationMembers':
            autoEnableOrganizationMembers.toValue(),
      if (dataSources != null) 'dataSources': dataSources,
      if (features != null) 'features': features,
      if (nextToken != null) 'nextToken': nextToken,
    };
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
      destinationType: (json['destinationType'] as String).toDestinationType(),
      publishingFailureStartTimestamp:
          json['publishingFailureStartTimestamp'] as int,
      status: (json['status'] as String).toPublishingStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final destinationId = this.destinationId;
    final destinationProperties = this.destinationProperties;
    final destinationType = this.destinationType;
    final publishingFailureStartTimestamp =
        this.publishingFailureStartTimestamp;
    final status = this.status;
    return {
      'destinationId': destinationId,
      'destinationProperties': destinationProperties,
      'destinationType': destinationType.toValue(),
      'publishingFailureStartTimestamp': publishingFailureStartTimestamp,
      'status': status.toValue(),
    };
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
      destinationType: (json['destinationType'] as String).toDestinationType(),
      status: (json['status'] as String).toPublishingStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final destinationId = this.destinationId;
    final destinationType = this.destinationType;
    final status = this.status;
    return {
      'destinationId': destinationId,
      'destinationType': destinationType.toValue(),
      'status': status.toValue(),
    };
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
  s3,
}

extension DestinationTypeValueExtension on DestinationType {
  String toValue() {
    switch (this) {
      case DestinationType.s3:
        return 'S3';
    }
  }
}

extension DestinationTypeFromString on String {
  DestinationType toDestinationType() {
    switch (this) {
      case 'S3':
        return DestinationType.s3;
    }
    throw Exception('$this is not known in enum DestinationType');
  }
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

  Map<String, dynamic> toJson() {
    final anomaly = this.anomaly;
    return {
      if (anomaly != null) 'anomaly': anomaly,
    };
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
      if (name != null) 'name': name.toValue(),
      if (status != null) 'status': status.toValue(),
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
      name: (json['name'] as String?)?.toFeatureAdditionalConfiguration(),
      status: (json['status'] as String?)?.toFeatureStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (name != null) 'name': name.toValue(),
      if (status != null) 'status': status.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum DetectorFeature {
  s3DataEvents,
  eksAuditLogs,
  ebsMalwareProtection,
  rdsLoginEvents,
  eksRuntimeMonitoring,
  lambdaNetworkLogs,
  runtimeMonitoring,
}

extension DetectorFeatureValueExtension on DetectorFeature {
  String toValue() {
    switch (this) {
      case DetectorFeature.s3DataEvents:
        return 'S3_DATA_EVENTS';
      case DetectorFeature.eksAuditLogs:
        return 'EKS_AUDIT_LOGS';
      case DetectorFeature.ebsMalwareProtection:
        return 'EBS_MALWARE_PROTECTION';
      case DetectorFeature.rdsLoginEvents:
        return 'RDS_LOGIN_EVENTS';
      case DetectorFeature.eksRuntimeMonitoring:
        return 'EKS_RUNTIME_MONITORING';
      case DetectorFeature.lambdaNetworkLogs:
        return 'LAMBDA_NETWORK_LOGS';
      case DetectorFeature.runtimeMonitoring:
        return 'RUNTIME_MONITORING';
    }
  }
}

extension DetectorFeatureFromString on String {
  DetectorFeature toDetectorFeature() {
    switch (this) {
      case 'S3_DATA_EVENTS':
        return DetectorFeature.s3DataEvents;
      case 'EKS_AUDIT_LOGS':
        return DetectorFeature.eksAuditLogs;
      case 'EBS_MALWARE_PROTECTION':
        return DetectorFeature.ebsMalwareProtection;
      case 'RDS_LOGIN_EVENTS':
        return DetectorFeature.rdsLoginEvents;
      case 'EKS_RUNTIME_MONITORING':
        return DetectorFeature.eksRuntimeMonitoring;
      case 'LAMBDA_NETWORK_LOGS':
        return DetectorFeature.lambdaNetworkLogs;
      case 'RUNTIME_MONITORING':
        return DetectorFeature.runtimeMonitoring;
    }
    throw Exception('$this is not known in enum DetectorFeature');
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
      if (name != null) 'name': name.toValue(),
      if (status != null) 'status': status.toValue(),
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
      name: (json['name'] as String?)?.toDetectorFeatureResult(),
      status: (json['status'] as String?)?.toFeatureStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalConfiguration = this.additionalConfiguration;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (additionalConfiguration != null)
        'additionalConfiguration': additionalConfiguration,
      if (name != null) 'name': name.toValue(),
      if (status != null) 'status': status.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum DetectorFeatureResult {
  flowLogs,
  cloudTrail,
  dnsLogs,
  s3DataEvents,
  eksAuditLogs,
  ebsMalwareProtection,
  rdsLoginEvents,
  eksRuntimeMonitoring,
  lambdaNetworkLogs,
  runtimeMonitoring,
}

extension DetectorFeatureResultValueExtension on DetectorFeatureResult {
  String toValue() {
    switch (this) {
      case DetectorFeatureResult.flowLogs:
        return 'FLOW_LOGS';
      case DetectorFeatureResult.cloudTrail:
        return 'CLOUD_TRAIL';
      case DetectorFeatureResult.dnsLogs:
        return 'DNS_LOGS';
      case DetectorFeatureResult.s3DataEvents:
        return 'S3_DATA_EVENTS';
      case DetectorFeatureResult.eksAuditLogs:
        return 'EKS_AUDIT_LOGS';
      case DetectorFeatureResult.ebsMalwareProtection:
        return 'EBS_MALWARE_PROTECTION';
      case DetectorFeatureResult.rdsLoginEvents:
        return 'RDS_LOGIN_EVENTS';
      case DetectorFeatureResult.eksRuntimeMonitoring:
        return 'EKS_RUNTIME_MONITORING';
      case DetectorFeatureResult.lambdaNetworkLogs:
        return 'LAMBDA_NETWORK_LOGS';
      case DetectorFeatureResult.runtimeMonitoring:
        return 'RUNTIME_MONITORING';
    }
  }
}

extension DetectorFeatureResultFromString on String {
  DetectorFeatureResult toDetectorFeatureResult() {
    switch (this) {
      case 'FLOW_LOGS':
        return DetectorFeatureResult.flowLogs;
      case 'CLOUD_TRAIL':
        return DetectorFeatureResult.cloudTrail;
      case 'DNS_LOGS':
        return DetectorFeatureResult.dnsLogs;
      case 'S3_DATA_EVENTS':
        return DetectorFeatureResult.s3DataEvents;
      case 'EKS_AUDIT_LOGS':
        return DetectorFeatureResult.eksAuditLogs;
      case 'EBS_MALWARE_PROTECTION':
        return DetectorFeatureResult.ebsMalwareProtection;
      case 'RDS_LOGIN_EVENTS':
        return DetectorFeatureResult.rdsLoginEvents;
      case 'EKS_RUNTIME_MONITORING':
        return DetectorFeatureResult.eksRuntimeMonitoring;
      case 'LAMBDA_NETWORK_LOGS':
        return DetectorFeatureResult.lambdaNetworkLogs;
      case 'RUNTIME_MONITORING':
        return DetectorFeatureResult.runtimeMonitoring;
    }
    throw Exception('$this is not known in enum DetectorFeatureResult');
  }
}

enum DetectorStatus {
  enabled,
  disabled,
}

extension DetectorStatusValueExtension on DetectorStatus {
  String toValue() {
    switch (this) {
      case DetectorStatus.enabled:
        return 'ENABLED';
      case DetectorStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension DetectorStatusFromString on String {
  DetectorStatus toDetectorStatus() {
    switch (this) {
      case 'ENABLED':
        return DetectorStatus.enabled;
      case 'DISABLED':
        return DetectorStatus.disabled;
    }
    throw Exception('$this is not known in enum DetectorStatus');
  }
}

class DisableOrganizationAdminAccountResponse {
  DisableOrganizationAdminAccountResponse();

  factory DisableOrganizationAdminAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return DisableOrganizationAdminAccountResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateFromAdministratorAccountResponse {
  DisassociateFromAdministratorAccountResponse();

  factory DisassociateFromAdministratorAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateFromAdministratorAccountResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

  Map<String, dynamic> toJson() {
    return {};
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

  Map<String, dynamic> toJson() {
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      'unprocessedAccounts': unprocessedAccounts,
    };
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

  Map<String, dynamic> toJson() {
    final blocked = this.blocked;
    final domain = this.domain;
    final domainWithSuffix = this.domainWithSuffix;
    final protocol = this.protocol;
    return {
      if (blocked != null) 'blocked': blocked,
      if (domain != null) 'domain': domain,
      if (domainWithSuffix != null) 'domainWithSuffix': domainWithSuffix,
      if (protocol != null) 'protocol': protocol,
    };
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

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    return {
      if (domain != null) 'domain': domain,
    };
  }
}

enum EbsSnapshotPreservation {
  noRetention,
  retentionWithFinding,
}

extension EbsSnapshotPreservationValueExtension on EbsSnapshotPreservation {
  String toValue() {
    switch (this) {
      case EbsSnapshotPreservation.noRetention:
        return 'NO_RETENTION';
      case EbsSnapshotPreservation.retentionWithFinding:
        return 'RETENTION_WITH_FINDING';
    }
  }
}

extension EbsSnapshotPreservationFromString on String {
  EbsSnapshotPreservation toEbsSnapshotPreservation() {
    switch (this) {
      case 'NO_RETENTION':
        return EbsSnapshotPreservation.noRetention;
      case 'RETENTION_WITH_FINDING':
        return EbsSnapshotPreservation.retentionWithFinding;
    }
    throw Exception('$this is not known in enum EbsSnapshotPreservation');
  }
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

  Map<String, dynamic> toJson() {
    final scannedVolumeDetails = this.scannedVolumeDetails;
    final skippedVolumeDetails = this.skippedVolumeDetails;
    return {
      if (scannedVolumeDetails != null)
        'scannedVolumeDetails': scannedVolumeDetails,
      if (skippedVolumeDetails != null)
        'skippedVolumeDetails': skippedVolumeDetails,
    };
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
      scanType: (json['scanType'] as String?)?.toScanType(),
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      triggerFindingId: json['triggerFindingId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scanCompletedAt = this.scanCompletedAt;
    final scanDetections = this.scanDetections;
    final scanId = this.scanId;
    final scanStartedAt = this.scanStartedAt;
    final scanType = this.scanType;
    final sources = this.sources;
    final triggerFindingId = this.triggerFindingId;
    return {
      if (scanCompletedAt != null)
        'scanCompletedAt': unixTimestampToJson(scanCompletedAt),
      if (scanDetections != null) 'scanDetections': scanDetections,
      if (scanId != null) 'scanId': scanId,
      if (scanStartedAt != null)
        'scanStartedAt': unixTimestampToJson(scanStartedAt),
      if (scanType != null) 'scanType': scanType.toValue(),
      if (sources != null) 'sources': sources,
      if (triggerFindingId != null) 'triggerFindingId': triggerFindingId,
    };
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
      status: (json['status'] as String?)?.toDataSourceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    final status = this.status;
    return {
      if (reason != null) 'reason': reason,
      if (status != null) 'status': status.toValue(),
    };
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

  Map<String, dynamic> toJson() {
    final activeServicesCount = this.activeServicesCount;
    final arn = this.arn;
    final name = this.name;
    final registeredContainerInstancesCount =
        this.registeredContainerInstancesCount;
    final runningTasksCount = this.runningTasksCount;
    final status = this.status;
    final tags = this.tags;
    final taskDetails = this.taskDetails;
    return {
      if (activeServicesCount != null)
        'activeServicesCount': activeServicesCount,
      if (arn != null) 'arn': arn,
      if (name != null) 'name': name,
      if (registeredContainerInstancesCount != null)
        'registeredContainerInstancesCount': registeredContainerInstancesCount,
      if (runningTasksCount != null) 'runningTasksCount': runningTasksCount,
      if (status != null) 'status': status,
      if (tags != null) 'tags': tags,
      if (taskDetails != null) 'taskDetails': taskDetails,
    };
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

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final containers = this.containers;
    final definitionArn = this.definitionArn;
    final group = this.group;
    final startedAt = this.startedAt;
    final startedBy = this.startedBy;
    final tags = this.tags;
    final taskCreatedAt = this.taskCreatedAt;
    final version = this.version;
    final volumes = this.volumes;
    return {
      if (arn != null) 'arn': arn,
      if (containers != null) 'containers': containers,
      if (definitionArn != null) 'definitionArn': definitionArn,
      if (group != null) 'group': group,
      if (startedAt != null) 'startedAt': unixTimestampToJson(startedAt),
      if (startedBy != null) 'startedBy': startedBy,
      if (tags != null) 'tags': tags,
      if (taskCreatedAt != null)
        'createdAt': unixTimestampToJson(taskCreatedAt),
      if (version != null) 'version': version,
      if (volumes != null) 'volumes': volumes,
    };
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

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final name = this.name;
    final status = this.status;
    final tags = this.tags;
    final vpcId = this.vpcId;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (name != null) 'name': name,
      if (status != null) 'status': status,
      if (tags != null) 'tags': tags,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

class EnableOrganizationAdminAccountResponse {
  EnableOrganizationAdminAccountResponse();

  factory EnableOrganizationAdminAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return EnableOrganizationAdminAccountResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

  Map<String, dynamic> toJson() {
    final threatIntelligenceDetails = this.threatIntelligenceDetails;
    return {
      if (threatIntelligenceDetails != null)
        'threatIntelligenceDetails': threatIntelligenceDetails,
    };
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
      managementType: (json['managementType'] as String?)?.toManagementType(),
    );
  }

  Map<String, dynamic> toJson() {
    final issues = this.issues;
    final managementType = this.managementType;
    return {
      if (issues != null) 'issues': issues,
      if (managementType != null) 'managementType': managementType.toValue(),
    };
  }
}

enum FeatureAdditionalConfiguration {
  eksAddonManagement,
  ecsFargateAgentManagement,
  ec2AgentManagement,
}

extension FeatureAdditionalConfigurationValueExtension
    on FeatureAdditionalConfiguration {
  String toValue() {
    switch (this) {
      case FeatureAdditionalConfiguration.eksAddonManagement:
        return 'EKS_ADDON_MANAGEMENT';
      case FeatureAdditionalConfiguration.ecsFargateAgentManagement:
        return 'ECS_FARGATE_AGENT_MANAGEMENT';
      case FeatureAdditionalConfiguration.ec2AgentManagement:
        return 'EC2_AGENT_MANAGEMENT';
    }
  }
}

extension FeatureAdditionalConfigurationFromString on String {
  FeatureAdditionalConfiguration toFeatureAdditionalConfiguration() {
    switch (this) {
      case 'EKS_ADDON_MANAGEMENT':
        return FeatureAdditionalConfiguration.eksAddonManagement;
      case 'ECS_FARGATE_AGENT_MANAGEMENT':
        return FeatureAdditionalConfiguration.ecsFargateAgentManagement;
      case 'EC2_AGENT_MANAGEMENT':
        return FeatureAdditionalConfiguration.ec2AgentManagement;
    }
    throw Exception(
        '$this is not known in enum FeatureAdditionalConfiguration');
  }
}

enum FeatureStatus {
  enabled,
  disabled,
}

extension FeatureStatusValueExtension on FeatureStatus {
  String toValue() {
    switch (this) {
      case FeatureStatus.enabled:
        return 'ENABLED';
      case FeatureStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension FeatureStatusFromString on String {
  FeatureStatus toFeatureStatus() {
    switch (this) {
      case 'ENABLED':
        return FeatureStatus.enabled;
      case 'DISABLED':
        return FeatureStatus.disabled;
    }
    throw Exception('$this is not known in enum FeatureStatus');
  }
}

enum Feedback {
  useful,
  notUseful,
}

extension FeedbackValueExtension on Feedback {
  String toValue() {
    switch (this) {
      case Feedback.useful:
        return 'USEFUL';
      case Feedback.notUseful:
        return 'NOT_USEFUL';
    }
  }
}

extension FeedbackFromString on String {
  Feedback toFeedback() {
    switch (this) {
      case 'USEFUL':
        return Feedback.useful;
      case 'NOT_USEFUL':
        return Feedback.notUseful;
    }
    throw Exception('$this is not known in enum Feedback');
  }
}

enum FilterAction {
  noop,
  archive,
}

extension FilterActionValueExtension on FilterAction {
  String toValue() {
    switch (this) {
      case FilterAction.noop:
        return 'NOOP';
      case FilterAction.archive:
        return 'ARCHIVE';
    }
  }
}

extension FilterActionFromString on String {
  FilterAction toFilterAction() {
    switch (this) {
      case 'NOOP':
        return FilterAction.noop;
      case 'ARCHIVE':
        return FilterAction.archive;
    }
    throw Exception('$this is not known in enum FilterAction');
  }
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
      if (criterionKey != null) 'criterionKey': criterionKey.toValue(),
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

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final region = this.region;
    final resource = this.resource;
    final schemaVersion = this.schemaVersion;
    final severity = this.severity;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final confidence = this.confidence;
    final description = this.description;
    final partition = this.partition;
    final service = this.service;
    final title = this.title;
    return {
      'accountId': accountId,
      'arn': arn,
      'createdAt': createdAt,
      'id': id,
      'region': region,
      'resource': resource,
      'schemaVersion': schemaVersion,
      'severity': severity,
      'type': type,
      'updatedAt': updatedAt,
      if (confidence != null) 'confidence': confidence,
      if (description != null) 'description': description,
      if (partition != null) 'partition': partition,
      if (service != null) 'service': service,
      if (title != null) 'title': title,
    };
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
  fifteenMinutes,
  oneHour,
  sixHours,
}

extension FindingPublishingFrequencyValueExtension
    on FindingPublishingFrequency {
  String toValue() {
    switch (this) {
      case FindingPublishingFrequency.fifteenMinutes:
        return 'FIFTEEN_MINUTES';
      case FindingPublishingFrequency.oneHour:
        return 'ONE_HOUR';
      case FindingPublishingFrequency.sixHours:
        return 'SIX_HOURS';
    }
  }
}

extension FindingPublishingFrequencyFromString on String {
  FindingPublishingFrequency toFindingPublishingFrequency() {
    switch (this) {
      case 'FIFTEEN_MINUTES':
        return FindingPublishingFrequency.fifteenMinutes;
      case 'ONE_HOUR':
        return FindingPublishingFrequency.oneHour;
      case 'SIX_HOURS':
        return FindingPublishingFrequency.sixHours;
    }
    throw Exception('$this is not known in enum FindingPublishingFrequency');
  }
}

enum FindingStatisticType {
  countBySeverity,
}

extension FindingStatisticTypeValueExtension on FindingStatisticType {
  String toValue() {
    switch (this) {
      case FindingStatisticType.countBySeverity:
        return 'COUNT_BY_SEVERITY';
    }
  }
}

extension FindingStatisticTypeFromString on String {
  FindingStatisticType toFindingStatisticType() {
    switch (this) {
      case 'COUNT_BY_SEVERITY':
        return FindingStatisticType.countBySeverity;
    }
    throw Exception('$this is not known in enum FindingStatisticType');
  }
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

  Map<String, dynamic> toJson() {
    final countBySeverity = this.countBySeverity;
    return {
      if (countBySeverity != null) 'countBySeverity': countBySeverity,
    };
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
      status: (json['status'] as String).toDataSourceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.toValue(),
    };
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
      name: (json['name'] as String?)?.toFreeTrialFeatureResult(),
    );
  }

  Map<String, dynamic> toJson() {
    final freeTrialDaysRemaining = this.freeTrialDaysRemaining;
    final name = this.name;
    return {
      if (freeTrialDaysRemaining != null)
        'freeTrialDaysRemaining': freeTrialDaysRemaining,
      if (name != null) 'name': name.toValue(),
    };
  }
}

enum FreeTrialFeatureResult {
  flowLogs,
  cloudTrail,
  dnsLogs,
  s3DataEvents,
  eksAuditLogs,
  ebsMalwareProtection,
  rdsLoginEvents,
  eksRuntimeMonitoring,
  lambdaNetworkLogs,
  fargateRuntimeMonitoring,
  ec2RuntimeMonitoring,
}

extension FreeTrialFeatureResultValueExtension on FreeTrialFeatureResult {
  String toValue() {
    switch (this) {
      case FreeTrialFeatureResult.flowLogs:
        return 'FLOW_LOGS';
      case FreeTrialFeatureResult.cloudTrail:
        return 'CLOUD_TRAIL';
      case FreeTrialFeatureResult.dnsLogs:
        return 'DNS_LOGS';
      case FreeTrialFeatureResult.s3DataEvents:
        return 'S3_DATA_EVENTS';
      case FreeTrialFeatureResult.eksAuditLogs:
        return 'EKS_AUDIT_LOGS';
      case FreeTrialFeatureResult.ebsMalwareProtection:
        return 'EBS_MALWARE_PROTECTION';
      case FreeTrialFeatureResult.rdsLoginEvents:
        return 'RDS_LOGIN_EVENTS';
      case FreeTrialFeatureResult.eksRuntimeMonitoring:
        return 'EKS_RUNTIME_MONITORING';
      case FreeTrialFeatureResult.lambdaNetworkLogs:
        return 'LAMBDA_NETWORK_LOGS';
      case FreeTrialFeatureResult.fargateRuntimeMonitoring:
        return 'FARGATE_RUNTIME_MONITORING';
      case FreeTrialFeatureResult.ec2RuntimeMonitoring:
        return 'EC2_RUNTIME_MONITORING';
    }
  }
}

extension FreeTrialFeatureResultFromString on String {
  FreeTrialFeatureResult toFreeTrialFeatureResult() {
    switch (this) {
      case 'FLOW_LOGS':
        return FreeTrialFeatureResult.flowLogs;
      case 'CLOUD_TRAIL':
        return FreeTrialFeatureResult.cloudTrail;
      case 'DNS_LOGS':
        return FreeTrialFeatureResult.dnsLogs;
      case 'S3_DATA_EVENTS':
        return FreeTrialFeatureResult.s3DataEvents;
      case 'EKS_AUDIT_LOGS':
        return FreeTrialFeatureResult.eksAuditLogs;
      case 'EBS_MALWARE_PROTECTION':
        return FreeTrialFeatureResult.ebsMalwareProtection;
      case 'RDS_LOGIN_EVENTS':
        return FreeTrialFeatureResult.rdsLoginEvents;
      case 'EKS_RUNTIME_MONITORING':
        return FreeTrialFeatureResult.eksRuntimeMonitoring;
      case 'LAMBDA_NETWORK_LOGS':
        return FreeTrialFeatureResult.lambdaNetworkLogs;
      case 'FARGATE_RUNTIME_MONITORING':
        return FreeTrialFeatureResult.fargateRuntimeMonitoring;
      case 'EC2_RUNTIME_MONITORING':
        return FreeTrialFeatureResult.ec2RuntimeMonitoring;
    }
    throw Exception('$this is not known in enum FreeTrialFeatureResult');
  }
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

  Map<String, dynamic> toJson() {
    final lat = this.lat;
    final lon = this.lon;
    return {
      if (lat != null) 'lat': lat,
      if (lon != null) 'lon': lon,
    };
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

  Map<String, dynamic> toJson() {
    final administrator = this.administrator;
    return {
      'administrator': administrator,
    };
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

  Map<String, dynamic> toJson() {
    final coverageStatistics = this.coverageStatistics;
    return {
      if (coverageStatistics != null) 'coverageStatistics': coverageStatistics,
    };
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
      status: (json['status'] as String).toDetectorStatus(),
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
              ?.toFindingPublishingFrequency(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: json['updatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceRole = this.serviceRole;
    final status = this.status;
    final createdAt = this.createdAt;
    final dataSources = this.dataSources;
    final features = this.features;
    final findingPublishingFrequency = this.findingPublishingFrequency;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      'serviceRole': serviceRole,
      'status': status.toValue(),
      if (createdAt != null) 'createdAt': createdAt,
      if (dataSources != null) 'dataSources': dataSources,
      if (features != null) 'features': features,
      if (findingPublishingFrequency != null)
        'findingPublishingFrequency': findingPublishingFrequency.toValue(),
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updatedAt': updatedAt,
    };
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
      action: (json['action'] as String).toFilterAction(),
      findingCriteria: FindingCriteria.fromJson(
          json['findingCriteria'] as Map<String, dynamic>),
      name: json['name'] as String,
      description: json['description'] as String?,
      rank: json['rank'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final findingCriteria = this.findingCriteria;
    final name = this.name;
    final description = this.description;
    final rank = this.rank;
    final tags = this.tags;
    return {
      'action': action.toValue(),
      'findingCriteria': findingCriteria,
      'name': name,
      if (description != null) 'description': description,
      if (rank != null) 'rank': rank,
      if (tags != null) 'tags': tags,
    };
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

  Map<String, dynamic> toJson() {
    final findings = this.findings;
    return {
      'findings': findings,
    };
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

  Map<String, dynamic> toJson() {
    final findingStatistics = this.findingStatistics;
    return {
      'findingStatistics': findingStatistics,
    };
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
      format: (json['format'] as String).toIpSetFormat(),
      location: json['location'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toIpSetStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final location = this.location;
    final name = this.name;
    final status = this.status;
    final tags = this.tags;
    return {
      'format': format.toValue(),
      'location': location,
      'name': name,
      'status': status.toValue(),
      if (tags != null) 'tags': tags,
    };
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

  Map<String, dynamic> toJson() {
    final invitationsCount = this.invitationsCount;
    return {
      if (invitationsCount != null) 'invitationsCount': invitationsCount,
    };
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
          ?.toEbsSnapshotPreservation(),
      scanResourceCriteria: json['scanResourceCriteria'] != null
          ? ScanResourceCriteria.fromJson(
              json['scanResourceCriteria'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ebsSnapshotPreservation = this.ebsSnapshotPreservation;
    final scanResourceCriteria = this.scanResourceCriteria;
    return {
      if (ebsSnapshotPreservation != null)
        'ebsSnapshotPreservation': ebsSnapshotPreservation.toValue(),
      if (scanResourceCriteria != null)
        'scanResourceCriteria': scanResourceCriteria,
    };
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

  Map<String, dynamic> toJson() {
    final master = this.master;
    return {
      'master': master,
    };
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

  Map<String, dynamic> toJson() {
    final memberDataSourceConfigurations = this.memberDataSourceConfigurations;
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      'members': memberDataSourceConfigurations,
      'unprocessedAccounts': unprocessedAccounts,
    };
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

  Map<String, dynamic> toJson() {
    final members = this.members;
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      'members': members,
      'unprocessedAccounts': unprocessedAccounts,
    };
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

  Map<String, dynamic> toJson() {
    final organizationDetails = this.organizationDetails;
    return {
      if (organizationDetails != null)
        'organizationDetails': organizationDetails,
    };
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

  Map<String, dynamic> toJson() {
    final accounts = this.accounts;
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      if (accounts != null) 'accounts': accounts,
      if (unprocessedAccounts != null)
        'unprocessedAccounts': unprocessedAccounts,
    };
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
      format: (json['format'] as String).toThreatIntelSetFormat(),
      location: json['location'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toThreatIntelSetStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final location = this.location;
    final name = this.name;
    final status = this.status;
    final tags = this.tags;
    return {
      'format': format.toValue(),
      'location': location,
      'name': name,
      'status': status.toValue(),
      if (tags != null) 'tags': tags,
    };
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

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final usageStatistics = this.usageStatistics;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (usageStatistics != null) 'usageStatistics': usageStatistics,
    };
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

  Map<String, dynamic> toJson() {
    final count = this.count;
    final severity = this.severity;
    final threatName = this.threatName;
    return {
      if (count != null) 'count': count,
      if (severity != null) 'severity': severity,
      if (threatName != null) 'threatName': threatName,
    };
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

  Map<String, dynamic> toJson() {
    final path = this.path;
    return {
      if (path != null) 'path': path,
    };
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

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
    };
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

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final username = this.username;
    return {
      if (groups != null) 'groups': groups,
      if (username != null) 'username': username,
    };
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

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final iamInstanceProfile = this.iamInstanceProfile;
    final imageDescription = this.imageDescription;
    final imageId = this.imageId;
    final instanceId = this.instanceId;
    final instanceState = this.instanceState;
    final instanceType = this.instanceType;
    final launchTime = this.launchTime;
    final networkInterfaces = this.networkInterfaces;
    final outpostArn = this.outpostArn;
    final platform = this.platform;
    final productCodes = this.productCodes;
    final tags = this.tags;
    return {
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (iamInstanceProfile != null) 'iamInstanceProfile': iamInstanceProfile,
      if (imageDescription != null) 'imageDescription': imageDescription,
      if (imageId != null) 'imageId': imageId,
      if (instanceId != null) 'instanceId': instanceId,
      if (instanceState != null) 'instanceState': instanceState,
      if (instanceType != null) 'instanceType': instanceType,
      if (launchTime != null) 'launchTime': launchTime,
      if (networkInterfaces != null) 'networkInterfaces': networkInterfaces,
      if (outpostArn != null) 'outpostArn': outpostArn,
      if (platform != null) 'platform': platform,
      if (productCodes != null) 'productCodes': productCodes,
      if (tags != null) 'tags': tags,
    };
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

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final invitationId = this.invitationId;
    final invitedAt = this.invitedAt;
    final relationshipStatus = this.relationshipStatus;
    return {
      if (accountId != null) 'accountId': accountId,
      if (invitationId != null) 'invitationId': invitationId,
      if (invitedAt != null) 'invitedAt': invitedAt,
      if (relationshipStatus != null) 'relationshipStatus': relationshipStatus,
    };
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

  Map<String, dynamic> toJson() {
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      'unprocessedAccounts': unprocessedAccounts,
    };
  }
}

enum IpSetFormat {
  txt,
  stix,
  otxCsv,
  alienVault,
  proofPoint,
  fireEye,
}

extension IpSetFormatValueExtension on IpSetFormat {
  String toValue() {
    switch (this) {
      case IpSetFormat.txt:
        return 'TXT';
      case IpSetFormat.stix:
        return 'STIX';
      case IpSetFormat.otxCsv:
        return 'OTX_CSV';
      case IpSetFormat.alienVault:
        return 'ALIEN_VAULT';
      case IpSetFormat.proofPoint:
        return 'PROOF_POINT';
      case IpSetFormat.fireEye:
        return 'FIRE_EYE';
    }
  }
}

extension IpSetFormatFromString on String {
  IpSetFormat toIpSetFormat() {
    switch (this) {
      case 'TXT':
        return IpSetFormat.txt;
      case 'STIX':
        return IpSetFormat.stix;
      case 'OTX_CSV':
        return IpSetFormat.otxCsv;
      case 'ALIEN_VAULT':
        return IpSetFormat.alienVault;
      case 'PROOF_POINT':
        return IpSetFormat.proofPoint;
      case 'FIRE_EYE':
        return IpSetFormat.fireEye;
    }
    throw Exception('$this is not known in enum IpSetFormat');
  }
}

enum IpSetStatus {
  inactive,
  activating,
  active,
  deactivating,
  error,
  deletePending,
  deleted,
}

extension IpSetStatusValueExtension on IpSetStatus {
  String toValue() {
    switch (this) {
      case IpSetStatus.inactive:
        return 'INACTIVE';
      case IpSetStatus.activating:
        return 'ACTIVATING';
      case IpSetStatus.active:
        return 'ACTIVE';
      case IpSetStatus.deactivating:
        return 'DEACTIVATING';
      case IpSetStatus.error:
        return 'ERROR';
      case IpSetStatus.deletePending:
        return 'DELETE_PENDING';
      case IpSetStatus.deleted:
        return 'DELETED';
    }
  }
}

extension IpSetStatusFromString on String {
  IpSetStatus toIpSetStatus() {
    switch (this) {
      case 'INACTIVE':
        return IpSetStatus.inactive;
      case 'ACTIVATING':
        return IpSetStatus.activating;
      case 'ACTIVE':
        return IpSetStatus.active;
      case 'DEACTIVATING':
        return IpSetStatus.deactivating;
      case 'ERROR':
        return IpSetStatus.error;
      case 'DELETE_PENDING':
        return IpSetStatus.deletePending;
      case 'DELETED':
        return IpSetStatus.deleted;
    }
    throw Exception('$this is not known in enum IpSetStatus');
  }
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

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    final parameters = this.parameters;
    final remoteIpDetails = this.remoteIpDetails;
    final requestUri = this.requestUri;
    final resource = this.resource;
    final resourceName = this.resourceName;
    final sourceIps = this.sourceIps;
    final statusCode = this.statusCode;
    final subresource = this.subresource;
    final userAgent = this.userAgent;
    final verb = this.verb;
    return {
      if (namespace != null) 'namespace': namespace,
      if (parameters != null) 'parameters': parameters,
      if (remoteIpDetails != null) 'remoteIpDetails': remoteIpDetails,
      if (requestUri != null) 'requestUri': requestUri,
      if (resource != null) 'resource': resource,
      if (resourceName != null) 'resourceName': resourceName,
      if (sourceIps != null) 'sourceIps': sourceIps,
      if (statusCode != null) 'statusCode': statusCode,
      if (subresource != null) 'subresource': subresource,
      if (userAgent != null) 'userAgent': userAgent,
      if (verb != null) 'verb': verb,
    };
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
      status: (json['status'] as String).toDataSourceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.toValue(),
    };
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

  Map<String, dynamic> toJson() {
    final auditLogs = this.auditLogs;
    return {
      'auditLogs': auditLogs,
    };
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

  Map<String, dynamic> toJson() {
    final auditLogs = this.auditLogs;
    return {
      if (auditLogs != null) 'auditLogs': auditLogs,
    };
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

  Map<String, dynamic> toJson() {
    final kubernetesUserDetails = this.kubernetesUserDetails;
    final kubernetesWorkloadDetails = this.kubernetesWorkloadDetails;
    return {
      if (kubernetesUserDetails != null)
        'kubernetesUserDetails': kubernetesUserDetails,
      if (kubernetesWorkloadDetails != null)
        'kubernetesWorkloadDetails': kubernetesWorkloadDetails,
    };
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

  Map<String, dynamic> toJson() {
    final allowed = this.allowed;
    final namespace = this.namespace;
    final resource = this.resource;
    final verb = this.verb;
    return {
      if (allowed != null) 'allowed': allowed,
      if (namespace != null) 'namespace': namespace,
      if (resource != null) 'resource': resource,
      if (verb != null) 'verb': verb,
    };
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

  Map<String, dynamic> toJson() {
    final kind = this.kind;
    final name = this.name;
    final roleRefKind = this.roleRefKind;
    final roleRefName = this.roleRefName;
    final uid = this.uid;
    return {
      if (kind != null) 'kind': kind,
      if (name != null) 'name': name,
      if (roleRefKind != null) 'roleRefKind': roleRefKind,
      if (roleRefName != null) 'roleRefName': roleRefName,
      if (uid != null) 'uid': uid,
    };
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

  Map<String, dynamic> toJson() {
    final kind = this.kind;
    final name = this.name;
    final uid = this.uid;
    return {
      if (kind != null) 'kind': kind,
      if (name != null) 'name': name,
      if (uid != null) 'uid': uid,
    };
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

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final impersonatedUser = this.impersonatedUser;
    final sessionName = this.sessionName;
    final uid = this.uid;
    final username = this.username;
    return {
      if (groups != null) 'groups': groups,
      if (impersonatedUser != null) 'impersonatedUser': impersonatedUser,
      if (sessionName != null) 'sessionName': sessionName,
      if (uid != null) 'uid': uid,
      if (username != null) 'username': username,
    };
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

  Map<String, dynamic> toJson() {
    final containers = this.containers;
    final hostIPC = this.hostIPC;
    final hostNetwork = this.hostNetwork;
    final hostPID = this.hostPID;
    final name = this.name;
    final namespace = this.namespace;
    final serviceAccountName = this.serviceAccountName;
    final type = this.type;
    final uid = this.uid;
    final volumes = this.volumes;
    return {
      if (containers != null) 'containers': containers,
      if (hostIPC != null) 'hostIPC': hostIPC,
      if (hostNetwork != null) 'hostNetwork': hostNetwork,
      if (hostPID != null) 'hostPID': hostPID,
      if (name != null) 'name': name,
      if (namespace != null) 'namespace': namespace,
      if (serviceAccountName != null) 'serviceAccountName': serviceAccountName,
      if (type != null) 'type': type,
      if (uid != null) 'uid': uid,
      if (volumes != null) 'volumes': volumes,
    };
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

  Map<String, dynamic> toJson() {
    final description = this.description;
    final functionArn = this.functionArn;
    final functionName = this.functionName;
    final functionVersion = this.functionVersion;
    final lastModifiedAt = this.lastModifiedAt;
    final revisionId = this.revisionId;
    final role = this.role;
    final tags = this.tags;
    final vpcConfig = this.vpcConfig;
    return {
      if (description != null) 'description': description,
      if (functionArn != null) 'functionArn': functionArn,
      if (functionName != null) 'functionName': functionName,
      if (functionVersion != null) 'functionVersion': functionVersion,
      if (lastModifiedAt != null)
        'lastModifiedAt': unixTimestampToJson(lastModifiedAt),
      if (revisionId != null) 'revisionId': revisionId,
      if (role != null) 'role': role,
      if (tags != null) 'tags': tags,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
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

  Map<String, dynamic> toJson() {
    final euid = this.euid;
    final executablePath = this.executablePath;
    final name = this.name;
    final namespacePid = this.namespacePid;
    final parentUuid = this.parentUuid;
    final pid = this.pid;
    final startTime = this.startTime;
    final userId = this.userId;
    final uuid = this.uuid;
    return {
      if (euid != null) 'euid': euid,
      if (executablePath != null) 'executablePath': executablePath,
      if (name != null) 'name': name,
      if (namespacePid != null) 'namespacePid': namespacePid,
      if (parentUuid != null) 'parentUuid': parentUuid,
      if (pid != null) 'pid': pid,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (userId != null) 'userId': userId,
      if (uuid != null) 'uuid': uuid,
    };
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

  Map<String, dynamic> toJson() {
    final resources = this.resources;
    final nextToken = this.nextToken;
    return {
      'resources': resources,
      if (nextToken != null) 'nextToken': nextToken,
    };
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

  Map<String, dynamic> toJson() {
    final detectorIds = this.detectorIds;
    final nextToken = this.nextToken;
    return {
      'detectorIds': detectorIds,
      if (nextToken != null) 'nextToken': nextToken,
    };
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

  Map<String, dynamic> toJson() {
    final filterNames = this.filterNames;
    final nextToken = this.nextToken;
    return {
      'filterNames': filterNames,
      if (nextToken != null) 'nextToken': nextToken,
    };
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

  Map<String, dynamic> toJson() {
    final findingIds = this.findingIds;
    final nextToken = this.nextToken;
    return {
      'findingIds': findingIds,
      if (nextToken != null) 'nextToken': nextToken,
    };
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

  Map<String, dynamic> toJson() {
    final ipSetIds = this.ipSetIds;
    final nextToken = this.nextToken;
    return {
      'ipSetIds': ipSetIds,
      if (nextToken != null) 'nextToken': nextToken,
    };
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

  Map<String, dynamic> toJson() {
    final invitations = this.invitations;
    final nextToken = this.nextToken;
    return {
      if (invitations != null) 'invitations': invitations,
      if (nextToken != null) 'nextToken': nextToken,
    };
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

  Map<String, dynamic> toJson() {
    final members = this.members;
    final nextToken = this.nextToken;
    return {
      if (members != null) 'members': members,
      if (nextToken != null) 'nextToken': nextToken,
    };
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

  Map<String, dynamic> toJson() {
    final adminAccounts = this.adminAccounts;
    final nextToken = this.nextToken;
    return {
      if (adminAccounts != null) 'adminAccounts': adminAccounts,
      if (nextToken != null) 'nextToken': nextToken,
    };
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

  Map<String, dynamic> toJson() {
    final destinations = this.destinations;
    final nextToken = this.nextToken;
    return {
      'destinations': destinations,
      if (nextToken != null) 'nextToken': nextToken,
    };
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

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
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

  Map<String, dynamic> toJson() {
    final threatIntelSetIds = this.threatIntelSetIds;
    final nextToken = this.nextToken;
    return {
      'threatIntelSetIds': threatIntelSetIds,
      if (nextToken != null) 'nextToken': nextToken,
    };
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

  Map<String, dynamic> toJson() {
    final ipAddressV4 = this.ipAddressV4;
    final ipAddressV6 = this.ipAddressV6;
    return {
      if (ipAddressV4 != null) 'ipAddressV4': ipAddressV4,
      if (ipAddressV6 != null) 'ipAddressV6': ipAddressV6,
    };
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

  Map<String, dynamic> toJson() {
    final port = this.port;
    final portName = this.portName;
    return {
      if (port != null) 'port': port,
      if (portName != null) 'portName': portName,
    };
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

  Map<String, dynamic> toJson() {
    final application = this.application;
    final failedLoginAttempts = this.failedLoginAttempts;
    final successfulLoginAttempts = this.successfulLoginAttempts;
    final user = this.user;
    return {
      if (application != null) 'application': application,
      if (failedLoginAttempts != null)
        'failedLoginAttempts': failedLoginAttempts,
      if (successfulLoginAttempts != null)
        'successfulLoginAttempts': successfulLoginAttempts,
      if (user != null) 'user': user,
    };
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

  Map<String, dynamic> toJson() {
    final scanEc2InstanceWithFindings = this.scanEc2InstanceWithFindings;
    final serviceRole = this.serviceRole;
    return {
      if (scanEc2InstanceWithFindings != null)
        'scanEc2InstanceWithFindings': scanEc2InstanceWithFindings,
      if (serviceRole != null) 'serviceRole': serviceRole,
    };
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

  Map<String, dynamic> toJson() {
    final scanEc2InstanceWithFindings = this.scanEc2InstanceWithFindings;
    return {
      if (scanEc2InstanceWithFindings != null)
        'scanEc2InstanceWithFindings': scanEc2InstanceWithFindings,
    };
  }
}

enum ManagementType {
  autoManaged,
  manual,
  disabled,
}

extension ManagementTypeValueExtension on ManagementType {
  String toValue() {
    switch (this) {
      case ManagementType.autoManaged:
        return 'AUTO_MANAGED';
      case ManagementType.manual:
        return 'MANUAL';
      case ManagementType.disabled:
        return 'DISABLED';
    }
  }
}

extension ManagementTypeFromString on String {
  ManagementType toManagementType() {
    switch (this) {
      case 'AUTO_MANAGED':
        return ManagementType.autoManaged;
      case 'MANUAL':
        return ManagementType.manual;
      case 'DISABLED':
        return ManagementType.disabled;
    }
    throw Exception('$this is not known in enum ManagementType');
  }
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

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final invitationId = this.invitationId;
    final invitedAt = this.invitedAt;
    final relationshipStatus = this.relationshipStatus;
    return {
      if (accountId != null) 'accountId': accountId,
      if (invitationId != null) 'invitationId': invitationId,
      if (invitedAt != null) 'invitedAt': invitedAt,
      if (relationshipStatus != null) 'relationshipStatus': relationshipStatus,
    };
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

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final email = this.email;
    final masterId = this.masterId;
    final relationshipStatus = this.relationshipStatus;
    final updatedAt = this.updatedAt;
    final administratorId = this.administratorId;
    final detectorId = this.detectorId;
    final invitedAt = this.invitedAt;
    return {
      'accountId': accountId,
      'email': email,
      'masterId': masterId,
      'relationshipStatus': relationshipStatus,
      'updatedAt': updatedAt,
      if (administratorId != null) 'administratorId': administratorId,
      if (detectorId != null) 'detectorId': detectorId,
      if (invitedAt != null) 'invitedAt': invitedAt,
    };
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
      if (name != null) 'name': name.toValue(),
      if (status != null) 'status': status.toValue(),
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
      name: (json['name'] as String?)?.toOrgFeatureAdditionalConfiguration(),
      status: (json['status'] as String?)?.toFeatureStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (name != null) 'name': name.toValue(),
      if (status != null) 'status': status.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
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

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final dataSources = this.dataSources;
    final features = this.features;
    return {
      'accountId': accountId,
      if (dataSources != null) 'dataSources': dataSources,
      if (features != null) 'features': features,
    };
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
      if (name != null) 'name': name.toValue(),
      if (status != null) 'status': status.toValue(),
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
      name: (json['name'] as String?)?.toOrgFeature(),
      status: (json['status'] as String?)?.toFeatureStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalConfiguration = this.additionalConfiguration;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (additionalConfiguration != null)
        'additionalConfiguration': additionalConfiguration,
      if (name != null) 'name': name.toValue(),
      if (status != null) 'status': status.toValue(),
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
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

  Map<String, dynamic> toJson() {
    final blocked = this.blocked;
    final connectionDirection = this.connectionDirection;
    final localIpDetails = this.localIpDetails;
    final localPortDetails = this.localPortDetails;
    final protocol = this.protocol;
    final remoteIpDetails = this.remoteIpDetails;
    final remotePortDetails = this.remotePortDetails;
    return {
      if (blocked != null) 'blocked': blocked,
      if (connectionDirection != null)
        'connectionDirection': connectionDirection,
      if (localIpDetails != null) 'localIpDetails': localIpDetails,
      if (localPortDetails != null) 'localPortDetails': localPortDetails,
      if (protocol != null) 'protocol': protocol,
      if (remoteIpDetails != null) 'remoteIpDetails': remoteIpDetails,
      if (remotePortDetails != null) 'remotePortDetails': remotePortDetails,
    };
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

  Map<String, dynamic> toJson() {
    final ipv6Addresses = this.ipv6Addresses;
    final networkInterfaceId = this.networkInterfaceId;
    final privateDnsName = this.privateDnsName;
    final privateIpAddress = this.privateIpAddress;
    final privateIpAddresses = this.privateIpAddresses;
    final publicDnsName = this.publicDnsName;
    final publicIp = this.publicIp;
    final securityGroups = this.securityGroups;
    final subnetId = this.subnetId;
    final vpcId = this.vpcId;
    return {
      if (ipv6Addresses != null) 'ipv6Addresses': ipv6Addresses,
      if (networkInterfaceId != null) 'networkInterfaceId': networkInterfaceId,
      if (privateDnsName != null) 'privateDnsName': privateDnsName,
      if (privateIpAddress != null) 'privateIpAddress': privateIpAddress,
      if (privateIpAddresses != null) 'privateIpAddresses': privateIpAddresses,
      if (publicDnsName != null) 'publicDnsName': publicDnsName,
      if (publicIp != null) 'publicIp': publicIp,
      if (securityGroups != null) 'securityGroups': securityGroups,
      if (subnetId != null) 'subnetId': subnetId,
      if (vpcId != null) 'vpcId': vpcId,
    };
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

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      if (text != null) 'text': text,
    };
  }
}

enum OrderBy {
  asc,
  desc,
}

extension OrderByValueExtension on OrderBy {
  String toValue() {
    switch (this) {
      case OrderBy.asc:
        return 'ASC';
      case OrderBy.desc:
        return 'DESC';
    }
  }
}

extension OrderByFromString on String {
  OrderBy toOrderBy() {
    switch (this) {
      case 'ASC':
        return OrderBy.asc;
      case 'DESC':
        return OrderBy.desc;
    }
    throw Exception('$this is not known in enum OrderBy');
  }
}

enum OrgFeature {
  s3DataEvents,
  eksAuditLogs,
  ebsMalwareProtection,
  rdsLoginEvents,
  eksRuntimeMonitoring,
  lambdaNetworkLogs,
  runtimeMonitoring,
}

extension OrgFeatureValueExtension on OrgFeature {
  String toValue() {
    switch (this) {
      case OrgFeature.s3DataEvents:
        return 'S3_DATA_EVENTS';
      case OrgFeature.eksAuditLogs:
        return 'EKS_AUDIT_LOGS';
      case OrgFeature.ebsMalwareProtection:
        return 'EBS_MALWARE_PROTECTION';
      case OrgFeature.rdsLoginEvents:
        return 'RDS_LOGIN_EVENTS';
      case OrgFeature.eksRuntimeMonitoring:
        return 'EKS_RUNTIME_MONITORING';
      case OrgFeature.lambdaNetworkLogs:
        return 'LAMBDA_NETWORK_LOGS';
      case OrgFeature.runtimeMonitoring:
        return 'RUNTIME_MONITORING';
    }
  }
}

extension OrgFeatureFromString on String {
  OrgFeature toOrgFeature() {
    switch (this) {
      case 'S3_DATA_EVENTS':
        return OrgFeature.s3DataEvents;
      case 'EKS_AUDIT_LOGS':
        return OrgFeature.eksAuditLogs;
      case 'EBS_MALWARE_PROTECTION':
        return OrgFeature.ebsMalwareProtection;
      case 'RDS_LOGIN_EVENTS':
        return OrgFeature.rdsLoginEvents;
      case 'EKS_RUNTIME_MONITORING':
        return OrgFeature.eksRuntimeMonitoring;
      case 'LAMBDA_NETWORK_LOGS':
        return OrgFeature.lambdaNetworkLogs;
      case 'RUNTIME_MONITORING':
        return OrgFeature.runtimeMonitoring;
    }
    throw Exception('$this is not known in enum OrgFeature');
  }
}

enum OrgFeatureAdditionalConfiguration {
  eksAddonManagement,
  ecsFargateAgentManagement,
  ec2AgentManagement,
}

extension OrgFeatureAdditionalConfigurationValueExtension
    on OrgFeatureAdditionalConfiguration {
  String toValue() {
    switch (this) {
      case OrgFeatureAdditionalConfiguration.eksAddonManagement:
        return 'EKS_ADDON_MANAGEMENT';
      case OrgFeatureAdditionalConfiguration.ecsFargateAgentManagement:
        return 'ECS_FARGATE_AGENT_MANAGEMENT';
      case OrgFeatureAdditionalConfiguration.ec2AgentManagement:
        return 'EC2_AGENT_MANAGEMENT';
    }
  }
}

extension OrgFeatureAdditionalConfigurationFromString on String {
  OrgFeatureAdditionalConfiguration toOrgFeatureAdditionalConfiguration() {
    switch (this) {
      case 'EKS_ADDON_MANAGEMENT':
        return OrgFeatureAdditionalConfiguration.eksAddonManagement;
      case 'ECS_FARGATE_AGENT_MANAGEMENT':
        return OrgFeatureAdditionalConfiguration.ecsFargateAgentManagement;
      case 'EC2_AGENT_MANAGEMENT':
        return OrgFeatureAdditionalConfiguration.ec2AgentManagement;
    }
    throw Exception(
        '$this is not known in enum OrgFeatureAdditionalConfiguration');
  }
}

enum OrgFeatureStatus {
  $new,
  none,
  all,
}

extension OrgFeatureStatusValueExtension on OrgFeatureStatus {
  String toValue() {
    switch (this) {
      case OrgFeatureStatus.$new:
        return 'NEW';
      case OrgFeatureStatus.none:
        return 'NONE';
      case OrgFeatureStatus.all:
        return 'ALL';
    }
  }
}

extension OrgFeatureStatusFromString on String {
  OrgFeatureStatus toOrgFeatureStatus() {
    switch (this) {
      case 'NEW':
        return OrgFeatureStatus.$new;
      case 'NONE':
        return OrgFeatureStatus.none;
      case 'ALL':
        return OrgFeatureStatus.all;
    }
    throw Exception('$this is not known in enum OrgFeatureStatus');
  }
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

  Map<String, dynamic> toJson() {
    final asn = this.asn;
    final asnOrg = this.asnOrg;
    final isp = this.isp;
    final org = this.org;
    return {
      if (asn != null) 'asn': asn,
      if (asnOrg != null) 'asnOrg': asnOrg,
      if (isp != null) 'isp': isp,
      if (org != null) 'org': org,
    };
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
      if (autoEnable != null) 'autoEnable': autoEnable.toValue(),
      if (name != null) 'name': name.toValue(),
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
      autoEnable: (json['autoEnable'] as String?)?.toOrgFeatureStatus(),
      name: (json['name'] as String?)?.toOrgFeatureAdditionalConfiguration(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoEnable = this.autoEnable;
    final name = this.name;
    return {
      if (autoEnable != null) 'autoEnable': autoEnable.toValue(),
      if (name != null) 'name': name.toValue(),
    };
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

  Map<String, dynamic> toJson() {
    final s3Logs = this.s3Logs;
    final kubernetes = this.kubernetes;
    final malwareProtection = this.malwareProtection;
    return {
      's3Logs': s3Logs,
      if (kubernetes != null) 'kubernetes': kubernetes,
      if (malwareProtection != null) 'malwareProtection': malwareProtection,
    };
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

  Map<String, dynamic> toJson() {
    final organizationStatistics = this.organizationStatistics;
    final updatedAt = this.updatedAt;
    return {
      if (organizationStatistics != null)
        'organizationStatistics': organizationStatistics,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
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

  Map<String, dynamic> toJson() {
    final autoEnable = this.autoEnable;
    return {
      if (autoEnable != null) 'autoEnable': autoEnable,
    };
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
      if (autoEnable != null) 'autoEnable': autoEnable.toValue(),
      if (name != null) 'name': name.toValue(),
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
      autoEnable: (json['autoEnable'] as String?)?.toOrgFeatureStatus(),
      name: (json['name'] as String?)?.toOrgFeature(),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalConfiguration = this.additionalConfiguration;
    final autoEnable = this.autoEnable;
    final name = this.name;
    return {
      if (additionalConfiguration != null)
        'additionalConfiguration': additionalConfiguration,
      if (autoEnable != null) 'autoEnable': autoEnable.toValue(),
      if (name != null) 'name': name.toValue(),
    };
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
      name: (json['name'] as String?)?.toOrgFeature(),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalConfiguration = this.additionalConfiguration;
    final enabledAccountsCount = this.enabledAccountsCount;
    final name = this.name;
    return {
      if (additionalConfiguration != null)
        'additionalConfiguration': additionalConfiguration,
      if (enabledAccountsCount != null)
        'enabledAccountsCount': enabledAccountsCount,
      if (name != null) 'name': name.toValue(),
    };
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
      name: (json['name'] as String?)?.toOrgFeatureAdditionalConfiguration(),
    );
  }

  Map<String, dynamic> toJson() {
    final enabledAccountsCount = this.enabledAccountsCount;
    final name = this.name;
    return {
      if (enabledAccountsCount != null)
        'enabledAccountsCount': enabledAccountsCount,
      if (name != null) 'name': name.toValue(),
    };
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

  Map<String, dynamic> toJson() {
    final autoEnable = this.autoEnable;
    return {
      'autoEnable': autoEnable,
    };
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

  Map<String, dynamic> toJson() {
    final auditLogs = this.auditLogs;
    return {
      'auditLogs': auditLogs,
    };
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

  Map<String, dynamic> toJson() {
    final scanEc2InstanceWithFindings = this.scanEc2InstanceWithFindings;
    return {
      if (scanEc2InstanceWithFindings != null)
        'scanEc2InstanceWithFindings': scanEc2InstanceWithFindings,
    };
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

  Map<String, dynamic> toJson() {
    final autoEnable = this.autoEnable;
    return {
      'autoEnable': autoEnable,
    };
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

  Map<String, dynamic> toJson() {
    final ebsVolumes = this.ebsVolumes;
    return {
      if (ebsVolumes != null) 'ebsVolumes': ebsVolumes,
    };
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

  Map<String, dynamic> toJson() {
    final activeAccountsCount = this.activeAccountsCount;
    final countByFeature = this.countByFeature;
    final enabledAccountsCount = this.enabledAccountsCount;
    final memberAccountsCount = this.memberAccountsCount;
    final totalAccountsCount = this.totalAccountsCount;
    return {
      if (activeAccountsCount != null)
        'activeAccountsCount': activeAccountsCount,
      if (countByFeature != null) 'countByFeature': countByFeature,
      if (enabledAccountsCount != null)
        'enabledAccountsCount': enabledAccountsCount,
      if (memberAccountsCount != null)
        'memberAccountsCount': memberAccountsCount,
      if (totalAccountsCount != null) 'totalAccountsCount': totalAccountsCount,
    };
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

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'id': id,
    };
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

  Map<String, dynamic> toJson() {
    final accountLevelPermissions = this.accountLevelPermissions;
    final bucketLevelPermissions = this.bucketLevelPermissions;
    return {
      if (accountLevelPermissions != null)
        'accountLevelPermissions': accountLevelPermissions,
      if (bucketLevelPermissions != null)
        'bucketLevelPermissions': bucketLevelPermissions,
    };
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

  Map<String, dynamic> toJson() {
    final blocked = this.blocked;
    final portProbeDetails = this.portProbeDetails;
    return {
      if (blocked != null) 'blocked': blocked,
      if (portProbeDetails != null) 'portProbeDetails': portProbeDetails,
    };
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

  Map<String, dynamic> toJson() {
    final localIpDetails = this.localIpDetails;
    final localPortDetails = this.localPortDetails;
    final remoteIpDetails = this.remoteIpDetails;
    return {
      if (localIpDetails != null) 'localIpDetails': localIpDetails,
      if (localPortDetails != null) 'localPortDetails': localPortDetails,
      if (remoteIpDetails != null) 'remoteIpDetails': remoteIpDetails,
    };
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

  Map<String, dynamic> toJson() {
    final privateDnsName = this.privateDnsName;
    final privateIpAddress = this.privateIpAddress;
    return {
      if (privateDnsName != null) 'privateDnsName': privateDnsName,
      if (privateIpAddress != null) 'privateIpAddress': privateIpAddress,
    };
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

  Map<String, dynamic> toJson() {
    final euid = this.euid;
    final executablePath = this.executablePath;
    final executableSha256 = this.executableSha256;
    final lineage = this.lineage;
    final name = this.name;
    final namespacePid = this.namespacePid;
    final parentUuid = this.parentUuid;
    final pid = this.pid;
    final pwd = this.pwd;
    final startTime = this.startTime;
    final user = this.user;
    final userId = this.userId;
    final uuid = this.uuid;
    return {
      if (euid != null) 'euid': euid,
      if (executablePath != null) 'executablePath': executablePath,
      if (executableSha256 != null) 'executableSha256': executableSha256,
      if (lineage != null) 'lineage': lineage,
      if (name != null) 'name': name,
      if (namespacePid != null) 'namespacePid': namespacePid,
      if (parentUuid != null) 'parentUuid': parentUuid,
      if (pid != null) 'pid': pid,
      if (pwd != null) 'pwd': pwd,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (user != null) 'user': user,
      if (userId != null) 'userId': userId,
      if (uuid != null) 'uuid': uuid,
    };
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

  Map<String, dynamic> toJson() {
    final code = this.code;
    final productType = this.productType;
    return {
      if (code != null) 'productCodeId': code,
      if (productType != null) 'productCodeType': productType,
    };
  }
}

enum ProfileSubtype {
  frequent,
  infrequent,
  unseen,
  rare,
}

extension ProfileSubtypeValueExtension on ProfileSubtype {
  String toValue() {
    switch (this) {
      case ProfileSubtype.frequent:
        return 'FREQUENT';
      case ProfileSubtype.infrequent:
        return 'INFREQUENT';
      case ProfileSubtype.unseen:
        return 'UNSEEN';
      case ProfileSubtype.rare:
        return 'RARE';
    }
  }
}

extension ProfileSubtypeFromString on String {
  ProfileSubtype toProfileSubtype() {
    switch (this) {
      case 'FREQUENT':
        return ProfileSubtype.frequent;
      case 'INFREQUENT':
        return ProfileSubtype.infrequent;
      case 'UNSEEN':
        return ProfileSubtype.unseen;
      case 'RARE':
        return ProfileSubtype.rare;
    }
    throw Exception('$this is not known in enum ProfileSubtype');
  }
}

enum ProfileType {
  frequency,
}

extension ProfileTypeValueExtension on ProfileType {
  String toValue() {
    switch (this) {
      case ProfileType.frequency:
        return 'FREQUENCY';
    }
  }
}

extension ProfileTypeFromString on String {
  ProfileType toProfileType() {
    switch (this) {
      case 'FREQUENCY':
        return ProfileType.frequency;
    }
    throw Exception('$this is not known in enum ProfileType');
  }
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

  Map<String, dynamic> toJson() {
    final effectivePermission = this.effectivePermission;
    final permissionConfiguration = this.permissionConfiguration;
    return {
      if (effectivePermission != null)
        'effectivePermission': effectivePermission,
      if (permissionConfiguration != null)
        'permissionConfiguration': permissionConfiguration,
    };
  }
}

enum PublishingStatus {
  pendingVerification,
  publishing,
  unableToPublishFixDestinationProperty,
  stopped,
}

extension PublishingStatusValueExtension on PublishingStatus {
  String toValue() {
    switch (this) {
      case PublishingStatus.pendingVerification:
        return 'PENDING_VERIFICATION';
      case PublishingStatus.publishing:
        return 'PUBLISHING';
      case PublishingStatus.unableToPublishFixDestinationProperty:
        return 'UNABLE_TO_PUBLISH_FIX_DESTINATION_PROPERTY';
      case PublishingStatus.stopped:
        return 'STOPPED';
    }
  }
}

extension PublishingStatusFromString on String {
  PublishingStatus toPublishingStatus() {
    switch (this) {
      case 'PENDING_VERIFICATION':
        return PublishingStatus.pendingVerification;
      case 'PUBLISHING':
        return PublishingStatus.publishing;
      case 'UNABLE_TO_PUBLISH_FIX_DESTINATION_PROPERTY':
        return PublishingStatus.unableToPublishFixDestinationProperty;
      case 'STOPPED':
        return PublishingStatus.stopped;
    }
    throw Exception('$this is not known in enum PublishingStatus');
  }
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

  Map<String, dynamic> toJson() {
    final dbClusterIdentifier = this.dbClusterIdentifier;
    final dbInstanceArn = this.dbInstanceArn;
    final dbInstanceIdentifier = this.dbInstanceIdentifier;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    final tags = this.tags;
    return {
      if (dbClusterIdentifier != null)
        'dbClusterIdentifier': dbClusterIdentifier,
      if (dbInstanceArn != null) 'dbInstanceArn': dbInstanceArn,
      if (dbInstanceIdentifier != null)
        'dbInstanceIdentifier': dbInstanceIdentifier,
      if (engine != null) 'engine': engine,
      if (engineVersion != null) 'engineVersion': engineVersion,
      if (tags != null) 'tags': tags,
    };
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

  Map<String, dynamic> toJson() {
    final application = this.application;
    final authMethod = this.authMethod;
    final database = this.database;
    final ssl = this.ssl;
    final user = this.user;
    return {
      if (application != null) 'application': application,
      if (authMethod != null) 'authMethod': authMethod,
      if (database != null) 'database': database,
      if (ssl != null) 'ssl': ssl,
      if (user != null) 'user': user,
    };
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

  Map<String, dynamic> toJson() {
    final loginAttributes = this.loginAttributes;
    final remoteIpDetails = this.remoteIpDetails;
    return {
      if (loginAttributes != null) 'LoginAttributes': loginAttributes,
      if (remoteIpDetails != null) 'remoteIpDetails': remoteIpDetails,
    };
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

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final affiliated = this.affiliated;
    return {
      if (accountId != null) 'accountId': accountId,
      if (affiliated != null) 'affiliated': affiliated,
    };
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

  Map<String, dynamic> toJson() {
    final city = this.city;
    final country = this.country;
    final geoLocation = this.geoLocation;
    final ipAddressV4 = this.ipAddressV4;
    final ipAddressV6 = this.ipAddressV6;
    final organization = this.organization;
    return {
      if (city != null) 'city': city,
      if (country != null) 'country': country,
      if (geoLocation != null) 'geoLocation': geoLocation,
      if (ipAddressV4 != null) 'ipAddressV4': ipAddressV4,
      if (ipAddressV6 != null) 'ipAddressV6': ipAddressV6,
      if (organization != null) 'organization': organization,
    };
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

  Map<String, dynamic> toJson() {
    final port = this.port;
    final portName = this.portName;
    return {
      if (port != null) 'port': port,
      if (portName != null) 'portName': portName,
    };
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

  Map<String, dynamic> toJson() {
    final accessKeyDetails = this.accessKeyDetails;
    final containerDetails = this.containerDetails;
    final ebsVolumeDetails = this.ebsVolumeDetails;
    final ecsClusterDetails = this.ecsClusterDetails;
    final eksClusterDetails = this.eksClusterDetails;
    final instanceDetails = this.instanceDetails;
    final kubernetesDetails = this.kubernetesDetails;
    final lambdaDetails = this.lambdaDetails;
    final rdsDbInstanceDetails = this.rdsDbInstanceDetails;
    final rdsDbUserDetails = this.rdsDbUserDetails;
    final resourceType = this.resourceType;
    final s3BucketDetails = this.s3BucketDetails;
    return {
      if (accessKeyDetails != null) 'accessKeyDetails': accessKeyDetails,
      if (containerDetails != null) 'containerDetails': containerDetails,
      if (ebsVolumeDetails != null) 'ebsVolumeDetails': ebsVolumeDetails,
      if (ecsClusterDetails != null) 'ecsClusterDetails': ecsClusterDetails,
      if (eksClusterDetails != null) 'eksClusterDetails': eksClusterDetails,
      if (instanceDetails != null) 'instanceDetails': instanceDetails,
      if (kubernetesDetails != null) 'kubernetesDetails': kubernetesDetails,
      if (lambdaDetails != null) 'lambdaDetails': lambdaDetails,
      if (rdsDbInstanceDetails != null)
        'rdsDbInstanceDetails': rdsDbInstanceDetails,
      if (rdsDbUserDetails != null) 'rdsDbUserDetails': rdsDbUserDetails,
      if (resourceType != null) 'resourceType': resourceType,
      if (s3BucketDetails != null) 's3BucketDetails': s3BucketDetails,
    };
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

  Map<String, dynamic> toJson() {
    final instanceArn = this.instanceArn;
    return {
      if (instanceArn != null) 'instanceArn': instanceArn,
    };
  }
}

enum ResourceType {
  eks,
  ecs,
  ec2,
}

extension ResourceTypeValueExtension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.eks:
        return 'EKS';
      case ResourceType.ecs:
        return 'ECS';
      case ResourceType.ec2:
        return 'EC2';
    }
  }
}

extension ResourceTypeFromString on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'EKS':
        return ResourceType.eks;
      case 'ECS':
        return ResourceType.ecs;
      case 'EC2':
        return ResourceType.ec2;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
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

  Map<String, dynamic> toJson() {
    final addressFamily = this.addressFamily;
    final commandLineExample = this.commandLineExample;
    final fileSystemType = this.fileSystemType;
    final flags = this.flags;
    final ianaProtocolNumber = this.ianaProtocolNumber;
    final ldPreloadValue = this.ldPreloadValue;
    final libraryPath = this.libraryPath;
    final memoryRegions = this.memoryRegions;
    final modifiedAt = this.modifiedAt;
    final modifyingProcess = this.modifyingProcess;
    final moduleFilePath = this.moduleFilePath;
    final moduleName = this.moduleName;
    final moduleSha256 = this.moduleSha256;
    final mountSource = this.mountSource;
    final mountTarget = this.mountTarget;
    final releaseAgentPath = this.releaseAgentPath;
    final runcBinaryPath = this.runcBinaryPath;
    final scriptPath = this.scriptPath;
    final serviceName = this.serviceName;
    final shellHistoryFilePath = this.shellHistoryFilePath;
    final socketPath = this.socketPath;
    final targetProcess = this.targetProcess;
    final threatFilePath = this.threatFilePath;
    final toolCategory = this.toolCategory;
    final toolName = this.toolName;
    return {
      if (addressFamily != null) 'addressFamily': addressFamily,
      if (commandLineExample != null) 'commandLineExample': commandLineExample,
      if (fileSystemType != null) 'fileSystemType': fileSystemType,
      if (flags != null) 'flags': flags,
      if (ianaProtocolNumber != null) 'ianaProtocolNumber': ianaProtocolNumber,
      if (ldPreloadValue != null) 'ldPreloadValue': ldPreloadValue,
      if (libraryPath != null) 'libraryPath': libraryPath,
      if (memoryRegions != null) 'memoryRegions': memoryRegions,
      if (modifiedAt != null) 'modifiedAt': unixTimestampToJson(modifiedAt),
      if (modifyingProcess != null) 'modifyingProcess': modifyingProcess,
      if (moduleFilePath != null) 'moduleFilePath': moduleFilePath,
      if (moduleName != null) 'moduleName': moduleName,
      if (moduleSha256 != null) 'moduleSha256': moduleSha256,
      if (mountSource != null) 'mountSource': mountSource,
      if (mountTarget != null) 'mountTarget': mountTarget,
      if (releaseAgentPath != null) 'releaseAgentPath': releaseAgentPath,
      if (runcBinaryPath != null) 'runcBinaryPath': runcBinaryPath,
      if (scriptPath != null) 'scriptPath': scriptPath,
      if (serviceName != null) 'serviceName': serviceName,
      if (shellHistoryFilePath != null)
        'shellHistoryFilePath': shellHistoryFilePath,
      if (socketPath != null) 'socketPath': socketPath,
      if (targetProcess != null) 'targetProcess': targetProcess,
      if (threatFilePath != null) 'threatFilePath': threatFilePath,
      if (toolCategory != null) 'toolCategory': toolCategory,
      if (toolName != null) 'toolName': toolName,
    };
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

  Map<String, dynamic> toJson() {
    final context = this.context;
    final process = this.process;
    return {
      if (context != null) 'context': context,
      if (process != null) 'process': process,
    };
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

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final defaultServerSideEncryption = this.defaultServerSideEncryption;
    final name = this.name;
    final owner = this.owner;
    final publicAccess = this.publicAccess;
    final tags = this.tags;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (defaultServerSideEncryption != null)
        'defaultServerSideEncryption': defaultServerSideEncryption,
      if (name != null) 'name': name,
      if (owner != null) 'owner': owner,
      if (publicAccess != null) 'publicAccess': publicAccess,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type,
    };
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
      status: (json['status'] as String).toDataSourceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.toValue(),
    };
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
      scanStatus: (json['scanStatus'] as String?)?.toScanStatus(),
      scanType: (json['scanType'] as String?)?.toScanType(),
      totalBytes: json['totalBytes'] as int?,
      triggerDetails: json['triggerDetails'] != null
          ? TriggerDetails.fromJson(
              json['triggerDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final adminDetectorId = this.adminDetectorId;
    final attachedVolumes = this.attachedVolumes;
    final detectorId = this.detectorId;
    final failureReason = this.failureReason;
    final fileCount = this.fileCount;
    final resourceDetails = this.resourceDetails;
    final scanEndTime = this.scanEndTime;
    final scanId = this.scanId;
    final scanResultDetails = this.scanResultDetails;
    final scanStartTime = this.scanStartTime;
    final scanStatus = this.scanStatus;
    final scanType = this.scanType;
    final totalBytes = this.totalBytes;
    final triggerDetails = this.triggerDetails;
    return {
      if (accountId != null) 'accountId': accountId,
      if (adminDetectorId != null) 'adminDetectorId': adminDetectorId,
      if (attachedVolumes != null) 'attachedVolumes': attachedVolumes,
      if (detectorId != null) 'detectorId': detectorId,
      if (failureReason != null) 'failureReason': failureReason,
      if (fileCount != null) 'fileCount': fileCount,
      if (resourceDetails != null) 'resourceDetails': resourceDetails,
      if (scanEndTime != null) 'scanEndTime': unixTimestampToJson(scanEndTime),
      if (scanId != null) 'scanId': scanId,
      if (scanResultDetails != null) 'scanResultDetails': scanResultDetails,
      if (scanStartTime != null)
        'scanStartTime': unixTimestampToJson(scanStartTime),
      if (scanStatus != null) 'scanStatus': scanStatus.toValue(),
      if (scanType != null) 'scanType': scanType.toValue(),
      if (totalBytes != null) 'totalBytes': totalBytes,
      if (triggerDetails != null) 'triggerDetails': triggerDetails,
    };
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
  ec2InstanceTag,
}

extension ScanCriterionKeyValueExtension on ScanCriterionKey {
  String toValue() {
    switch (this) {
      case ScanCriterionKey.ec2InstanceTag:
        return 'EC2_INSTANCE_TAG';
    }
  }
}

extension ScanCriterionKeyFromString on String {
  ScanCriterionKey toScanCriterionKey() {
    switch (this) {
      case 'EC2_INSTANCE_TAG':
        return ScanCriterionKey.ec2InstanceTag;
    }
    throw Exception('$this is not known in enum ScanCriterionKey');
  }
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

  Map<String, dynamic> toJson() {
    final highestSeverityThreatDetails = this.highestSeverityThreatDetails;
    final scannedItemCount = this.scannedItemCount;
    final threatDetectedByName = this.threatDetectedByName;
    final threatsDetectedItemCount = this.threatsDetectedItemCount;
    return {
      if (highestSeverityThreatDetails != null)
        'highestSeverityThreatDetails': highestSeverityThreatDetails,
      if (scannedItemCount != null) 'scannedItemCount': scannedItemCount,
      if (threatDetectedByName != null)
        'threatDetectedByName': threatDetectedByName,
      if (threatsDetectedItemCount != null)
        'threatsDetectedItemCount': threatsDetectedItemCount,
    };
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

  Map<String, dynamic> toJson() {
    final ebsVolumes = this.ebsVolumes;
    return {
      if (ebsVolumes != null) 'ebsVolumes': ebsVolumes,
    };
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

  Map<String, dynamic> toJson() {
    final fileName = this.fileName;
    final filePath = this.filePath;
    final hash = this.hash;
    final volumeArn = this.volumeArn;
    return {
      if (fileName != null) 'fileName': fileName,
      if (filePath != null) 'filePath': filePath,
      if (hash != null) 'hash': hash,
      if (volumeArn != null) 'volumeArn': volumeArn,
    };
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
          MapEntry(k.toScanCriterionKey(),
              ScanCondition.fromJson(e as Map<String, dynamic>))),
      include: (json['include'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k.toScanCriterionKey(),
              ScanCondition.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final exclude = this.exclude;
    final include = this.include;
    return {
      if (exclude != null)
        'exclude': exclude.map((k, e) => MapEntry(k.toValue(), e)),
      if (include != null)
        'include': include.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

enum ScanResult {
  clean,
  infected,
}

extension ScanResultValueExtension on ScanResult {
  String toValue() {
    switch (this) {
      case ScanResult.clean:
        return 'CLEAN';
      case ScanResult.infected:
        return 'INFECTED';
    }
  }
}

extension ScanResultFromString on String {
  ScanResult toScanResult() {
    switch (this) {
      case 'CLEAN':
        return ScanResult.clean;
      case 'INFECTED':
        return ScanResult.infected;
    }
    throw Exception('$this is not known in enum ScanResult');
  }
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
      scanResult: (json['scanResult'] as String?)?.toScanResult(),
    );
  }

  Map<String, dynamic> toJson() {
    final scanResult = this.scanResult;
    return {
      if (scanResult != null) 'scanResult': scanResult.toValue(),
    };
  }
}

enum ScanStatus {
  running,
  completed,
  failed,
  skipped,
}

extension ScanStatusValueExtension on ScanStatus {
  String toValue() {
    switch (this) {
      case ScanStatus.running:
        return 'RUNNING';
      case ScanStatus.completed:
        return 'COMPLETED';
      case ScanStatus.failed:
        return 'FAILED';
      case ScanStatus.skipped:
        return 'SKIPPED';
    }
  }
}

extension ScanStatusFromString on String {
  ScanStatus toScanStatus() {
    switch (this) {
      case 'RUNNING':
        return ScanStatus.running;
      case 'COMPLETED':
        return ScanStatus.completed;
      case 'FAILED':
        return ScanStatus.failed;
      case 'SKIPPED':
        return ScanStatus.skipped;
    }
    throw Exception('$this is not known in enum ScanStatus');
  }
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

  Map<String, dynamic> toJson() {
    final filePaths = this.filePaths;
    final itemCount = this.itemCount;
    final name = this.name;
    final severity = this.severity;
    return {
      if (filePaths != null) 'filePaths': filePaths,
      if (itemCount != null) 'itemCount': itemCount,
      if (name != null) 'name': name,
      if (severity != null) 'severity': severity,
    };
  }
}

enum ScanType {
  guarddutyInitiated,
  onDemand,
}

extension ScanTypeValueExtension on ScanType {
  String toValue() {
    switch (this) {
      case ScanType.guarddutyInitiated:
        return 'GUARDDUTY_INITIATED';
      case ScanType.onDemand:
        return 'ON_DEMAND';
    }
  }
}

extension ScanTypeFromString on String {
  ScanType toScanType() {
    switch (this) {
      case 'GUARDDUTY_INITIATED':
        return ScanType.guarddutyInitiated;
      case 'ON_DEMAND':
        return ScanType.onDemand;
    }
    throw Exception('$this is not known in enum ScanType');
  }
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

  Map<String, dynamic> toJson() {
    final files = this.files;
    final totalGb = this.totalGb;
    final volumes = this.volumes;
    return {
      if (files != null) 'files': files,
      if (totalGb != null) 'totalGb': totalGb,
      if (volumes != null) 'volumes': volumes,
    };
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

  Map<String, dynamic> toJson() {
    final allowPrivilegeEscalation = this.allowPrivilegeEscalation;
    final privileged = this.privileged;
    return {
      if (allowPrivilegeEscalation != null)
        'allowPrivilegeEscalation': allowPrivilegeEscalation,
      if (privileged != null) 'privileged': privileged,
    };
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

  Map<String, dynamic> toJson() {
    final groupId = this.groupId;
    final groupName = this.groupName;
    return {
      if (groupId != null) 'groupId': groupId,
      if (groupName != null) 'groupName': groupName,
    };
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

  Map<String, dynamic> toJson() {
    final action = this.action;
    final additionalInfo = this.additionalInfo;
    final archived = this.archived;
    final count = this.count;
    final detection = this.detection;
    final detectorId = this.detectorId;
    final ebsVolumeScanDetails = this.ebsVolumeScanDetails;
    final eventFirstSeen = this.eventFirstSeen;
    final eventLastSeen = this.eventLastSeen;
    final evidence = this.evidence;
    final featureName = this.featureName;
    final resourceRole = this.resourceRole;
    final runtimeDetails = this.runtimeDetails;
    final serviceName = this.serviceName;
    final userFeedback = this.userFeedback;
    return {
      if (action != null) 'action': action,
      if (additionalInfo != null) 'additionalInfo': additionalInfo,
      if (archived != null) 'archived': archived,
      if (count != null) 'count': count,
      if (detection != null) 'detection': detection,
      if (detectorId != null) 'detectorId': detectorId,
      if (ebsVolumeScanDetails != null)
        'ebsVolumeScanDetails': ebsVolumeScanDetails,
      if (eventFirstSeen != null) 'eventFirstSeen': eventFirstSeen,
      if (eventLastSeen != null) 'eventLastSeen': eventLastSeen,
      if (evidence != null) 'evidence': evidence,
      if (featureName != null) 'featureName': featureName,
      if (resourceRole != null) 'resourceRole': resourceRole,
      if (runtimeDetails != null) 'runtimeDetails': runtimeDetails,
      if (serviceName != null) 'serviceName': serviceName,
      if (userFeedback != null) 'userFeedback': userFeedback,
    };
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

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      if (type != null) 'type': type,
      if (value != null) 'value': value,
    };
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
      if (orderBy != null) 'orderBy': orderBy.toValue(),
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

  Map<String, dynamic> toJson() {
    final scanId = this.scanId;
    return {
      if (scanId != null) 'scanId': scanId,
    };
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

  Map<String, dynamic> toJson() {
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      'unprocessedAccounts': unprocessedAccounts,
    };
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

  Map<String, dynamic> toJson() {
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      'unprocessedAccounts': unprocessedAccounts,
    };
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

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'key': key,
      if (value != null) 'value': value,
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

  Map<String, dynamic> toJson() {
    final itemCount = this.itemCount;
    final shortened = this.shortened;
    final threatNames = this.threatNames;
    final uniqueThreatNameCount = this.uniqueThreatNameCount;
    return {
      if (itemCount != null) 'itemCount': itemCount,
      if (shortened != null) 'shortened': shortened,
      if (threatNames != null) 'threatNames': threatNames,
      if (uniqueThreatNameCount != null)
        'uniqueThreatNameCount': uniqueThreatNameCount,
    };
  }
}

enum ThreatIntelSetFormat {
  txt,
  stix,
  otxCsv,
  alienVault,
  proofPoint,
  fireEye,
}

extension ThreatIntelSetFormatValueExtension on ThreatIntelSetFormat {
  String toValue() {
    switch (this) {
      case ThreatIntelSetFormat.txt:
        return 'TXT';
      case ThreatIntelSetFormat.stix:
        return 'STIX';
      case ThreatIntelSetFormat.otxCsv:
        return 'OTX_CSV';
      case ThreatIntelSetFormat.alienVault:
        return 'ALIEN_VAULT';
      case ThreatIntelSetFormat.proofPoint:
        return 'PROOF_POINT';
      case ThreatIntelSetFormat.fireEye:
        return 'FIRE_EYE';
    }
  }
}

extension ThreatIntelSetFormatFromString on String {
  ThreatIntelSetFormat toThreatIntelSetFormat() {
    switch (this) {
      case 'TXT':
        return ThreatIntelSetFormat.txt;
      case 'STIX':
        return ThreatIntelSetFormat.stix;
      case 'OTX_CSV':
        return ThreatIntelSetFormat.otxCsv;
      case 'ALIEN_VAULT':
        return ThreatIntelSetFormat.alienVault;
      case 'PROOF_POINT':
        return ThreatIntelSetFormat.proofPoint;
      case 'FIRE_EYE':
        return ThreatIntelSetFormat.fireEye;
    }
    throw Exception('$this is not known in enum ThreatIntelSetFormat');
  }
}

enum ThreatIntelSetStatus {
  inactive,
  activating,
  active,
  deactivating,
  error,
  deletePending,
  deleted,
}

extension ThreatIntelSetStatusValueExtension on ThreatIntelSetStatus {
  String toValue() {
    switch (this) {
      case ThreatIntelSetStatus.inactive:
        return 'INACTIVE';
      case ThreatIntelSetStatus.activating:
        return 'ACTIVATING';
      case ThreatIntelSetStatus.active:
        return 'ACTIVE';
      case ThreatIntelSetStatus.deactivating:
        return 'DEACTIVATING';
      case ThreatIntelSetStatus.error:
        return 'ERROR';
      case ThreatIntelSetStatus.deletePending:
        return 'DELETE_PENDING';
      case ThreatIntelSetStatus.deleted:
        return 'DELETED';
    }
  }
}

extension ThreatIntelSetStatusFromString on String {
  ThreatIntelSetStatus toThreatIntelSetStatus() {
    switch (this) {
      case 'INACTIVE':
        return ThreatIntelSetStatus.inactive;
      case 'ACTIVATING':
        return ThreatIntelSetStatus.activating;
      case 'ACTIVE':
        return ThreatIntelSetStatus.active;
      case 'DEACTIVATING':
        return ThreatIntelSetStatus.deactivating;
      case 'ERROR':
        return ThreatIntelSetStatus.error;
      case 'DELETE_PENDING':
        return ThreatIntelSetStatus.deletePending;
      case 'DELETED':
        return ThreatIntelSetStatus.deleted;
    }
    throw Exception('$this is not known in enum ThreatIntelSetStatus');
  }
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

  Map<String, dynamic> toJson() {
    final threatFileSha256 = this.threatFileSha256;
    final threatListName = this.threatListName;
    final threatNames = this.threatNames;
    return {
      if (threatFileSha256 != null) 'threatFileSha256': threatFileSha256,
      if (threatListName != null) 'threatListName': threatListName,
      if (threatNames != null) 'threatNames': threatNames,
    };
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

  Map<String, dynamic> toJson() {
    final files = this.files;
    return {
      if (files != null) 'files': files,
    };
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

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final unit = this.unit;
    return {
      if (amount != null) 'amount': amount,
      if (unit != null) 'unit': unit,
    };
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

  Map<String, dynamic> toJson() {
    final description = this.description;
    final guardDutyFindingId = this.guardDutyFindingId;
    return {
      if (description != null) 'description': description,
      if (guardDutyFindingId != null) 'guardDutyFindingId': guardDutyFindingId,
    };
  }
}

class UnarchiveFindingsResponse {
  UnarchiveFindingsResponse();

  factory UnarchiveFindingsResponse.fromJson(Map<String, dynamic> _) {
    return UnarchiveFindingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final result = this.result;
    return {
      'accountId': accountId,
      'result': result,
    };
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

  Map<String, dynamic> toJson() {
    final malwareProtection = this.malwareProtection;
    return {
      if (malwareProtection != null) 'malwareProtection': malwareProtection,
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

class UpdateDetectorResponse {
  UpdateDetectorResponse();

  factory UpdateDetectorResponse.fromJson(Map<String, dynamic> _) {
    return UpdateDetectorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

class UpdateFindingsFeedbackResponse {
  UpdateFindingsFeedbackResponse();

  factory UpdateFindingsFeedbackResponse.fromJson(Map<String, dynamic> _) {
    return UpdateFindingsFeedbackResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateIPSetResponse {
  UpdateIPSetResponse();

  factory UpdateIPSetResponse.fromJson(Map<String, dynamic> _) {
    return UpdateIPSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateMalwareScanSettingsResponse {
  UpdateMalwareScanSettingsResponse();

  factory UpdateMalwareScanSettingsResponse.fromJson(Map<String, dynamic> _) {
    return UpdateMalwareScanSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

  Map<String, dynamic> toJson() {
    final unprocessedAccounts = this.unprocessedAccounts;
    return {
      'unprocessedAccounts': unprocessedAccounts,
    };
  }
}

class UpdateOrganizationConfigurationResponse {
  UpdateOrganizationConfigurationResponse();

  factory UpdateOrganizationConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateOrganizationConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdatePublishingDestinationResponse {
  UpdatePublishingDestinationResponse();

  factory UpdatePublishingDestinationResponse.fromJson(Map<String, dynamic> _) {
    return UpdatePublishingDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateThreatIntelSetResponse {
  UpdateThreatIntelSetResponse();

  factory UpdateThreatIntelSetResponse.fromJson(Map<String, dynamic> _) {
    return UpdateThreatIntelSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final total = this.total;
    return {
      if (accountId != null) 'accountId': accountId,
      if (total != null) 'total': total,
    };
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
        'dataSources': dataSources.map((e) => e.toValue()).toList(),
      if (features != null)
        'features': features.map((e) => e.toValue()).toList(),
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
      dataSource: (json['dataSource'] as String?)?.toDataSource(),
      total: json['total'] != null
          ? Total.fromJson(json['total'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSource = this.dataSource;
    final total = this.total;
    return {
      if (dataSource != null) 'dataSource': dataSource.toValue(),
      if (total != null) 'total': total,
    };
  }
}

enum UsageFeature {
  flowLogs,
  cloudTrail,
  dnsLogs,
  s3DataEvents,
  eksAuditLogs,
  ebsMalwareProtection,
  rdsLoginEvents,
  lambdaNetworkLogs,
  eksRuntimeMonitoring,
  fargateRuntimeMonitoring,
  ec2RuntimeMonitoring,
  rdsDbiProtectionProvisioned,
  rdsDbiProtectionServerless,
}

extension UsageFeatureValueExtension on UsageFeature {
  String toValue() {
    switch (this) {
      case UsageFeature.flowLogs:
        return 'FLOW_LOGS';
      case UsageFeature.cloudTrail:
        return 'CLOUD_TRAIL';
      case UsageFeature.dnsLogs:
        return 'DNS_LOGS';
      case UsageFeature.s3DataEvents:
        return 'S3_DATA_EVENTS';
      case UsageFeature.eksAuditLogs:
        return 'EKS_AUDIT_LOGS';
      case UsageFeature.ebsMalwareProtection:
        return 'EBS_MALWARE_PROTECTION';
      case UsageFeature.rdsLoginEvents:
        return 'RDS_LOGIN_EVENTS';
      case UsageFeature.lambdaNetworkLogs:
        return 'LAMBDA_NETWORK_LOGS';
      case UsageFeature.eksRuntimeMonitoring:
        return 'EKS_RUNTIME_MONITORING';
      case UsageFeature.fargateRuntimeMonitoring:
        return 'FARGATE_RUNTIME_MONITORING';
      case UsageFeature.ec2RuntimeMonitoring:
        return 'EC2_RUNTIME_MONITORING';
      case UsageFeature.rdsDbiProtectionProvisioned:
        return 'RDS_DBI_PROTECTION_PROVISIONED';
      case UsageFeature.rdsDbiProtectionServerless:
        return 'RDS_DBI_PROTECTION_SERVERLESS';
    }
  }
}

extension UsageFeatureFromString on String {
  UsageFeature toUsageFeature() {
    switch (this) {
      case 'FLOW_LOGS':
        return UsageFeature.flowLogs;
      case 'CLOUD_TRAIL':
        return UsageFeature.cloudTrail;
      case 'DNS_LOGS':
        return UsageFeature.dnsLogs;
      case 'S3_DATA_EVENTS':
        return UsageFeature.s3DataEvents;
      case 'EKS_AUDIT_LOGS':
        return UsageFeature.eksAuditLogs;
      case 'EBS_MALWARE_PROTECTION':
        return UsageFeature.ebsMalwareProtection;
      case 'RDS_LOGIN_EVENTS':
        return UsageFeature.rdsLoginEvents;
      case 'LAMBDA_NETWORK_LOGS':
        return UsageFeature.lambdaNetworkLogs;
      case 'EKS_RUNTIME_MONITORING':
        return UsageFeature.eksRuntimeMonitoring;
      case 'FARGATE_RUNTIME_MONITORING':
        return UsageFeature.fargateRuntimeMonitoring;
      case 'EC2_RUNTIME_MONITORING':
        return UsageFeature.ec2RuntimeMonitoring;
      case 'RDS_DBI_PROTECTION_PROVISIONED':
        return UsageFeature.rdsDbiProtectionProvisioned;
      case 'RDS_DBI_PROTECTION_SERVERLESS':
        return UsageFeature.rdsDbiProtectionServerless;
    }
    throw Exception('$this is not known in enum UsageFeature');
  }
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
      feature: (json['feature'] as String?)?.toUsageFeature(),
      total: json['total'] != null
          ? Total.fromJson(json['total'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final feature = this.feature;
    final total = this.total;
    return {
      if (feature != null) 'feature': feature.toValue(),
      if (total != null) 'total': total,
    };
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

  Map<String, dynamic> toJson() {
    final resource = this.resource;
    final total = this.total;
    return {
      if (resource != null) 'resource': resource,
      if (total != null) 'total': total,
    };
  }
}

enum UsageStatisticType {
  sumByAccount,
  sumByDataSource,
  sumByResource,
  topResources,
  sumByFeatures,
  topAccountsByFeature,
}

extension UsageStatisticTypeValueExtension on UsageStatisticType {
  String toValue() {
    switch (this) {
      case UsageStatisticType.sumByAccount:
        return 'SUM_BY_ACCOUNT';
      case UsageStatisticType.sumByDataSource:
        return 'SUM_BY_DATA_SOURCE';
      case UsageStatisticType.sumByResource:
        return 'SUM_BY_RESOURCE';
      case UsageStatisticType.topResources:
        return 'TOP_RESOURCES';
      case UsageStatisticType.sumByFeatures:
        return 'SUM_BY_FEATURES';
      case UsageStatisticType.topAccountsByFeature:
        return 'TOP_ACCOUNTS_BY_FEATURE';
    }
  }
}

extension UsageStatisticTypeFromString on String {
  UsageStatisticType toUsageStatisticType() {
    switch (this) {
      case 'SUM_BY_ACCOUNT':
        return UsageStatisticType.sumByAccount;
      case 'SUM_BY_DATA_SOURCE':
        return UsageStatisticType.sumByDataSource;
      case 'SUM_BY_RESOURCE':
        return UsageStatisticType.sumByResource;
      case 'TOP_RESOURCES':
        return UsageStatisticType.topResources;
      case 'SUM_BY_FEATURES':
        return UsageStatisticType.sumByFeatures;
      case 'TOP_ACCOUNTS_BY_FEATURE':
        return UsageStatisticType.topAccountsByFeature;
    }
    throw Exception('$this is not known in enum UsageStatisticType');
  }
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

  Map<String, dynamic> toJson() {
    final sumByAccount = this.sumByAccount;
    final sumByDataSource = this.sumByDataSource;
    final sumByFeature = this.sumByFeature;
    final sumByResource = this.sumByResource;
    final topAccountsByFeature = this.topAccountsByFeature;
    final topResources = this.topResources;
    return {
      if (sumByAccount != null) 'sumByAccount': sumByAccount,
      if (sumByDataSource != null) 'sumByDataSource': sumByDataSource,
      if (sumByFeature != null) 'sumByFeature': sumByFeature,
      if (sumByResource != null) 'sumByResource': sumByResource,
      if (topAccountsByFeature != null)
        'topAccountsByFeature': topAccountsByFeature,
      if (topResources != null) 'topResources': topResources,
    };
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

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final total = this.total;
    return {
      if (accountId != null) 'accountId': accountId,
      if (total != null) 'total': total,
    };
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
      feature: (json['feature'] as String?)?.toUsageFeature(),
    );
  }

  Map<String, dynamic> toJson() {
    final accounts = this.accounts;
    final feature = this.feature;
    return {
      if (accounts != null) 'accounts': accounts,
      if (feature != null) 'feature': feature.toValue(),
    };
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

  Map<String, dynamic> toJson() {
    final hostPath = this.hostPath;
    final name = this.name;
    return {
      if (hostPath != null) 'hostPath': hostPath,
      if (name != null) 'name': name,
    };
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

  Map<String, dynamic> toJson() {
    final deviceName = this.deviceName;
    final encryptionType = this.encryptionType;
    final kmsKeyArn = this.kmsKeyArn;
    final snapshotArn = this.snapshotArn;
    final volumeArn = this.volumeArn;
    final volumeSizeInGB = this.volumeSizeInGB;
    final volumeType = this.volumeType;
    return {
      if (deviceName != null) 'deviceName': deviceName,
      if (encryptionType != null) 'encryptionType': encryptionType,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (snapshotArn != null) 'snapshotArn': snapshotArn,
      if (volumeArn != null) 'volumeArn': volumeArn,
      if (volumeSizeInGB != null) 'volumeSizeInGB': volumeSizeInGB,
      if (volumeType != null) 'volumeType': volumeType,
    };
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

  Map<String, dynamic> toJson() {
    final mountPath = this.mountPath;
    final name = this.name;
    return {
      if (mountPath != null) 'mountPath': mountPath,
      if (name != null) 'name': name,
    };
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

  Map<String, dynamic> toJson() {
    final securityGroups = this.securityGroups;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      if (securityGroups != null) 'securityGroups': securityGroups,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (vpcId != null) 'vpcId': vpcId,
    };
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

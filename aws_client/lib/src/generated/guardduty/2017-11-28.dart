// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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
/// and processes the following data sources: VPC Flow Logs, AWS CloudTrail
/// event logs, and DNS logs. It uses threat intelligence feeds (such as lists
/// of malicious IPs and domains) and machine learning to identify unexpected,
/// potentially unauthorized, and malicious activity within your AWS
/// environment. This can include issues like escalations of privileges, uses of
/// exposed credentials, or communication with malicious IPs, URLs, or domains.
/// For example, GuardDuty can detect compromised EC2 instances that serve
/// malware or mine bitcoin.
///
/// GuardDuty also monitors AWS account access behavior for signs of compromise.
/// Some examples of this are unauthorized infrastructure deployments such as
/// EC2 instances deployed in a Region that has never been used, or unusual API
/// calls like a password policy change to reduce password strength.
///
/// GuardDuty informs you of the status of your AWS environment by producing
/// security findings that you can view in the GuardDuty console or through
/// Amazon CloudWatch events. For more information, see the <i> <a
/// href="https://docs.aws.amazon.com/guardduty/latest/ug/what-is-guardduty.html">Amazon
/// GuardDuty User Guide</a> </i>.
class GuardDuty {
  final _s.RestJsonProtocol _protocol;
  GuardDuty({
    required String region,
    _s.AwsClientCredentials? credentials,
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
          endpointUrl: endpointUrl,
        );

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
  Future<void> acceptInvitation({
    required String detectorId,
    required String invitationId,
    required String masterId,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(invitationId, 'invitationId');
    ArgumentError.checkNotNull(masterId, 'masterId');
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(findingIds, 'findingIds');
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

  /// Creates a single Amazon GuardDuty detector. A detector is a resource that
  /// represents the GuardDuty service. To start using GuardDuty, you must
  /// create a detector in each Region where you enable the service. You can
  /// have only one detector per account per Region. All data sources are
  /// enabled in a new detector by default.
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
  /// Parameter [findingPublishingFrequency] :
  /// A value that specifies how frequently updated findings are exported.
  ///
  /// Parameter [tags] :
  /// The tags to be added to a new detector resource.
  Future<CreateDetectorResponse> createDetector({
    required bool enable,
    String? clientToken,
    DataSourceConfigurations? dataSources,
    FindingPublishingFrequency? findingPublishingFrequency,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(enable, 'enable');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      0,
      64,
    );
    final $payload = <String, dynamic>{
      'enable': enable,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (dataSources != null) 'dataSources': dataSources,
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

  /// Creates a filter using the specified finding criteria.
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
  /// resource.instanceDetails.outpostArn
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
  /// service.action.networkConnectionAction.localIpDetails.ipAddressV4
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
  /// When this attribute is set to TRUE, only archived findings are listed.
  /// When it's set to FALSE, only unarchived findings are listed. When this
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
  /// Type: ISO 8601 string format: YYYY-MM-DDTHH:MM:SS.SSSZ or
  /// YYYY-MM-DDTHH:MM:SSZ depending on whether the value contains milliseconds.
  /// </li>
  /// </ul>
  ///
  /// Parameter [name] :
  /// The name of the filter. Minimum length of 3. Maximum length of 64. Valid
  /// characters include alphanumeric characters, dot (.), underscore (_), and
  /// dash (-). Spaces are not allowed.
  ///
  /// Parameter [action] :
  /// Specifies the action that is to be applied to the findings that match the
  /// filter.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token for the create request.
  ///
  /// Parameter [description] :
  /// The description of the filter.
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(findingCriteria, 'findingCriteria');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      3,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      0,
      64,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
    );
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
  /// communication with AWS infrastructure and applications. GuardDuty doesn't
  /// generate findings for IP addresses that are included in IPSets. Only users
  /// from the administrator account can use this operation.
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
  /// The URI of the file that contains the IPSet. For example:
  /// https://s3.us-west-2.amazonaws.com/my-bucket/my-object-key.
  ///
  /// Parameter [name] :
  /// The user-friendly name to identify the IPSet.
  ///
  /// Allowed characters are alphanumerics, spaces, hyphens (-), and underscores
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
    ArgumentError.checkNotNull(activate, 'activate');
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(format, 'format');
    ArgumentError.checkNotNull(location, 'location');
    _s.validateStringLength(
      'location',
      location,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      300,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      0,
      64,
    );
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

  /// Creates member accounts of the current AWS account by specifying a list of
  /// AWS account IDs. This step is a prerequisite for managing the associated
  /// member accounts either by invitation or through an organization.
  ///
  /// When using <code>Create Members</code> as an organizations delegated
  /// administrator this action will enable GuardDuty in the added member
  /// accounts, with the exception of the organization delegated administrator
  /// account, which must enable GuardDuty prior to being added as a member.
  ///
  /// If you are adding accounts by invitation use this action after GuardDuty
  /// has been enabled in potential member accounts and before using <a
  /// href="https://docs.aws.amazon.com/guardduty/latest/APIReference/API_InviteMembers.html">
  /// <code>Invite Members</code> </a>.
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
    ArgumentError.checkNotNull(accountDetails, 'accountDetails');
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(destinationProperties, 'destinationProperties');
    ArgumentError.checkNotNull(destinationType, 'destinationType');
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      0,
      64,
    );
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

  /// Generates example findings of types specified by the list of finding
  /// types. If 'NULL' is specified for <code>findingTypes</code>, the API
  /// generates example findings of all supported finding types.
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
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
  /// The URI of the file that contains the ThreatIntelSet. For example:
  /// https://s3.us-west-2.amazonaws.com/my-bucket/my-object-key.
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
    ArgumentError.checkNotNull(activate, 'activate');
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(format, 'format');
    ArgumentError.checkNotNull(location, 'location');
    _s.validateStringLength(
      'location',
      location,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      300,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      0,
      64,
    );
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

  /// Declines invitations sent to the current member account by AWS accounts
  /// specified by their account IDs.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [accountIds] :
  /// A list of account IDs of the AWS accounts that sent invitations to the
  /// current member account that you want to decline invitations from.
  Future<DeclineInvitationsResponse> declineInvitations({
    required List<String> accountIds,
  }) async {
    ArgumentError.checkNotNull(accountIds, 'accountIds');
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(filterName, 'filterName');
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(ipSetId, 'ipSetId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/ipset/${Uri.encodeComponent(ipSetId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes invitations sent to the current member account by AWS accounts
  /// specified by their account IDs.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [accountIds] :
  /// A list of account IDs of the AWS accounts that sent invitations to the
  /// current member account that you want to delete invitations from.
  Future<DeleteInvitationsResponse> deleteInvitations({
    required List<String> accountIds,
  }) async {
    ArgumentError.checkNotNull(accountIds, 'accountIds');
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
    ArgumentError.checkNotNull(accountIds, 'accountIds');
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(destinationId, 'destinationId');
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(threatIntelSetId, 'threatIntelSetId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/threatintelset/${Uri.encodeComponent(threatIntelSetId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns information about the account selected as the delegated
  /// administrator for GuardDuty.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The ID of the detector to retrieve information about the delegated
  /// administrator from.
  Future<DescribeOrganizationConfigurationResponse>
      describeOrganizationConfiguration({
    required String detectorId,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/detector/${Uri.encodeComponent(detectorId)}/admin',
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
    ArgumentError.checkNotNull(destinationId, 'destinationId');
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/publishingDestination/${Uri.encodeComponent(destinationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribePublishingDestinationResponse.fromJson(response);
  }

  /// Disables an AWS account within the Organization as the GuardDuty delegated
  /// administrator.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [adminAccountId] :
  /// The AWS Account ID for the organizations account to be disabled as a
  /// GuardDuty delegated administrator.
  Future<void> disableOrganizationAdminAccount({
    required String adminAccountId,
  }) async {
    ArgumentError.checkNotNull(adminAccountId, 'adminAccountId');
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
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty member account.
  Future<void> disassociateFromMasterAccount({
    required String detectorId,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId)}/master/disassociate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates GuardDuty member accounts (to the current GuardDuty
  /// administrator account) specified by the account IDs.
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
    ArgumentError.checkNotNull(accountIds, 'accountIds');
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
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

  /// Enables an AWS account within the organization as the GuardDuty delegated
  /// administrator.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [adminAccountId] :
  /// The AWS Account ID for the organization account to be enabled as a
  /// GuardDuty delegated administrator.
  Future<void> enableOrganizationAdminAccount({
    required String adminAccountId,
  }) async {
    ArgumentError.checkNotNull(adminAccountId, 'adminAccountId');
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

  /// Retrieves an Amazon GuardDuty detector specified by the detectorId.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector that you want to get.
  Future<GetDetectorResponse> getDetector({
    required String detectorId,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(filterName, 'filterName');
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(findingIds, 'findingIds');
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(findingStatisticTypes, 'findingStatisticTypes');
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(ipSetId, 'ipSetId');
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

  /// Provides the details for the GuardDuty administrator account associated
  /// with the current GuardDuty member account.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty member account.
  Future<GetMasterAccountResponse> getMasterAccount({
    required String detectorId,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(accountIds, 'accountIds');
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(accountIds, 'accountIds');
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(threatIntelSetId, 'threatIntelSetId');
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
  /// specified detector ID. For newly enabled detectors or data sources the
  /// cost returned will include only the usage so far under 30 days, this may
  /// differ from the cost metrics in the console, which projects usage over 30
  /// days to provide a monthly cost estimate. For more information see <a
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(usageCriteria, 'usageCriteria');
    ArgumentError.checkNotNull(usageStatisticType, 'usageStatisticType');
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

  /// Invites other AWS accounts (created as members of the current AWS account
  /// by CreateMembers) to enable GuardDuty, and allow the current AWS account
  /// to view and manage these accounts' findings on their behalf as the
  /// GuardDuty administrator account.
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
    ArgumentError.checkNotNull(accountIds, 'accountIds');
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
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

  /// Lists Amazon GuardDuty findings for the specified detector ID.
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
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
  /// AWS account.
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
  /// disassociated).
  Future<ListMembersResponse> listMembers({
    required String detectorId,
    int? maxResults,
    String? nextToken,
    String? onlyAssociated,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
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

  /// Lists the accounts configured as GuardDuty delegated administrators.
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
  /// <code>dectectorId</code>.
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
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
  /// finding filters, IP sets, and threat intel sets, with a limit of 50 tags
  /// per resource. When invoked, this operation returns all assigned tags for a
  /// given resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the given GuardDuty resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
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

  /// Turns on GuardDuty monitoring of the specified member accounts. Use this
  /// operation to restart monitoring of accounts that you stopped monitoring
  /// with the <code>StopMonitoringMembers</code> operation.
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
    ArgumentError.checkNotNull(accountIds, 'accountIds');
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(accountIds, 'accountIds');
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(findingIds, 'findingIds');
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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

  /// Updates the Amazon GuardDuty detector specified by the detectorId.
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
  /// Parameter [enable] :
  /// Specifies whether the detector is enabled or not enabled.
  ///
  /// Parameter [findingPublishingFrequency] :
  /// An enum value that specifies how frequently findings are exported, such as
  /// to CloudWatch Events.
  Future<void> updateDetector({
    required String detectorId,
    DataSourceConfigurations? dataSources,
    bool? enable,
    FindingPublishingFrequency? findingPublishingFrequency,
  }) async {
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (dataSources != null) 'dataSources': dataSources,
      if (enable != null) 'enable': enable,
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
  /// The description of the filter.
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(filterName, 'filterName');
    _s.validateStringLength(
      'description',
      description,
      0,
      512,
    );
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(feedback, 'feedback');
    ArgumentError.checkNotNull(findingIds, 'findingIds');
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
  /// The updated URI of the file that contains the IPSet. For example:
  /// https://s3.us-west-2.amazonaws.com/my-bucket/my-object-key.
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(ipSetId, 'ipSetId');
    _s.validateStringLength(
      'location',
      location,
      1,
      300,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      300,
    );
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

  /// Contains information on member accounts to be updated.
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
  Future<UpdateMemberDetectorsResponse> updateMemberDetectors({
    required List<String> accountIds,
    required String detectorId,
    DataSourceConfigurations? dataSources,
  }) async {
    ArgumentError.checkNotNull(accountIds, 'accountIds');
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'accountIds': accountIds,
      if (dataSources != null) 'dataSources': dataSources,
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

  /// Updates the delegated administrator account with the values provided.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [autoEnable] :
  /// Indicates whether to automatically enable member accounts in the
  /// organization.
  ///
  /// Parameter [detectorId] :
  /// The ID of the detector to update the delegated administrator for.
  ///
  /// Parameter [dataSources] :
  /// Describes which data sources will be updated.
  Future<void> updateOrganizationConfiguration({
    required bool autoEnable,
    required String detectorId,
    OrganizationDataSourceConfigurations? dataSources,
  }) async {
    ArgumentError.checkNotNull(autoEnable, 'autoEnable');
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'autoEnable': autoEnable,
      if (dataSources != null) 'dataSources': dataSources,
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
    ArgumentError.checkNotNull(destinationId, 'destinationId');
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(detectorId, 'detectorId');
    _s.validateStringLength(
      'detectorId',
      detectorId,
      1,
      300,
      isRequired: true,
    );
    ArgumentError.checkNotNull(threatIntelSetId, 'threatIntelSetId');
    _s.validateStringLength(
      'location',
      location,
      1,
      300,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      300,
    );
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

  factory AccountDetail.fromJson(Map<String, dynamic> json) {
    return AccountDetail(
      accountId: json['accountId'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final email = this.email;
    return {
      'accountId': accountId,
      'email': email,
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

  /// Information about the NETWORK_CONNECTION action described in this finding.
  final NetworkConnectionAction? networkConnectionAction;

  /// Information about the PORT_PROBE action described in this finding.
  final PortProbeAction? portProbeAction;

  Action({
    this.actionType,
    this.awsApiCallAction,
    this.dnsRequestAction,
    this.networkConnectionAction,
    this.portProbeAction,
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
      networkConnectionAction: json['networkConnectionAction'] != null
          ? NetworkConnectionAction.fromJson(
              json['networkConnectionAction'] as Map<String, dynamic>)
          : null,
      portProbeAction: json['portProbeAction'] != null
          ? PortProbeAction.fromJson(
              json['portProbeAction'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final actionType = this.actionType;
    final awsApiCallAction = this.awsApiCallAction;
    final dnsRequestAction = this.dnsRequestAction;
    final networkConnectionAction = this.networkConnectionAction;
    final portProbeAction = this.portProbeAction;
    return {
      if (actionType != null) 'actionType': actionType,
      if (awsApiCallAction != null) 'awsApiCallAction': awsApiCallAction,
      if (dnsRequestAction != null) 'dnsRequestAction': dnsRequestAction,
      if (networkConnectionAction != null)
        'networkConnectionAction': networkConnectionAction,
      if (portProbeAction != null) 'portProbeAction': portProbeAction,
    };
  }
}

/// The account within the organization specified as the GuardDuty delegated
/// administrator.
class AdminAccount {
  /// The AWS account ID for the account.
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

extension on AdminStatus {
  String toValue() {
    switch (this) {
      case AdminStatus.enabled:
        return 'ENABLED';
      case AdminStatus.disableInProgress:
        return 'DISABLE_IN_PROGRESS';
    }
  }
}

extension on String {
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

class ArchiveFindingsResponse {
  ArchiveFindingsResponse();

  factory ArchiveFindingsResponse.fromJson(Map<String, dynamic> _) {
    return ArchiveFindingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains information about the API action.
class AwsApiCallAction {
  /// The AWS API name.
  final String? api;

  /// The AWS API caller type.
  final String? callerType;

  /// The domain information for the AWS API call.
  final DomainDetails? domainDetails;

  /// The error code of the failed AWS API action.
  final String? errorCode;

  /// The remote IP information of the connection that initiated the AWS API call.
  final RemoteIpDetails? remoteIpDetails;

  /// The AWS service name whose API was invoked.
  final String? serviceName;

  AwsApiCallAction({
    this.api,
    this.callerType,
    this.domainDetails,
    this.errorCode,
    this.remoteIpDetails,
    this.serviceName,
  });

  factory AwsApiCallAction.fromJson(Map<String, dynamic> json) {
    return AwsApiCallAction(
      api: json['api'] as String?,
      callerType: json['callerType'] as String?,
      domainDetails: json['domainDetails'] != null
          ? DomainDetails.fromJson(
              json['domainDetails'] as Map<String, dynamic>)
          : null,
      errorCode: json['errorCode'] as String?,
      remoteIpDetails: json['remoteIpDetails'] != null
          ? RemoteIpDetails.fromJson(
              json['remoteIpDetails'] as Map<String, dynamic>)
          : null,
      serviceName: json['serviceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final api = this.api;
    final callerType = this.callerType;
    final domainDetails = this.domainDetails;
    final errorCode = this.errorCode;
    final remoteIpDetails = this.remoteIpDetails;
    final serviceName = this.serviceName;
    return {
      if (api != null) 'api': api,
      if (callerType != null) 'callerType': callerType,
      if (domainDetails != null) 'domainDetails': domainDetails,
      if (errorCode != null) 'errorCode': errorCode,
      if (remoteIpDetails != null) 'remoteIpDetails': remoteIpDetails,
      if (serviceName != null) 'serviceName': serviceName,
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

class CreateDetectorResponse {
  /// The unique ID of the created detector.
  final String? detectorId;

  CreateDetectorResponse({
    this.detectorId,
  });

  factory CreateDetectorResponse.fromJson(Map<String, dynamic> json) {
    return CreateDetectorResponse(
      detectorId: json['detectorId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final detectorId = this.detectorId;
    return {
      if (detectorId != null) 'detectorId': detectorId,
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
}

extension on DataSource {
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
    }
  }
}

extension on String {
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
    }
    throw Exception('$this is not known in enum DataSource');
  }
}

/// Contains information about which data sources are enabled.
class DataSourceConfigurations {
  /// Describes whether S3 data event logs are enabled as a data source.
  final S3LogsConfiguration? s3Logs;

  DataSourceConfigurations({
    this.s3Logs,
  });

  factory DataSourceConfigurations.fromJson(Map<String, dynamic> json) {
    return DataSourceConfigurations(
      s3Logs: json['s3Logs'] != null
          ? S3LogsConfiguration.fromJson(json['s3Logs'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Logs = this.s3Logs;
    return {
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

  DataSourceConfigurationsResult({
    required this.cloudTrail,
    required this.dNSLogs,
    required this.flowLogs,
    required this.s3Logs,
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
    );
  }

  Map<String, dynamic> toJson() {
    final cloudTrail = this.cloudTrail;
    final dNSLogs = this.dNSLogs;
    final flowLogs = this.flowLogs;
    final s3Logs = this.s3Logs;
    return {
      'cloudTrail': cloudTrail,
      'dnsLogs': dNSLogs,
      'flowLogs': flowLogs,
      's3Logs': s3Logs,
    };
  }
}

enum DataSourceStatus {
  enabled,
  disabled,
}

extension on DataSourceStatus {
  String toValue() {
    switch (this) {
      case DataSourceStatus.enabled:
        return 'ENABLED';
      case DataSourceStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
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

class DescribeOrganizationConfigurationResponse {
  /// Indicates whether GuardDuty is automatically enabled for accounts added to
  /// the organization.
  final bool autoEnable;

  /// Indicates whether the maximum number of allowed member accounts are already
  /// associated with the delegated administrator account for your organization.
  final bool memberAccountLimitReached;

  /// Describes which data sources are enabled automatically for member accounts.
  final OrganizationDataSourceConfigurationsResult? dataSources;

  DescribeOrganizationConfigurationResponse({
    required this.autoEnable,
    required this.memberAccountLimitReached,
    this.dataSources,
  });

  factory DescribeOrganizationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeOrganizationConfigurationResponse(
      autoEnable: json['autoEnable'] as bool,
      memberAccountLimitReached: json['memberAccountLimitReached'] as bool,
      dataSources: json['dataSources'] != null
          ? OrganizationDataSourceConfigurationsResult.fromJson(
              json['dataSources'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final autoEnable = this.autoEnable;
    final memberAccountLimitReached = this.memberAccountLimitReached;
    final dataSources = this.dataSources;
    return {
      'autoEnable': autoEnable,
      'memberAccountLimitReached': memberAccountLimitReached,
      if (dataSources != null) 'dataSources': dataSources,
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

extension on DestinationType {
  String toValue() {
    switch (this) {
      case DestinationType.s3:
        return 'S3';
    }
  }
}

extension on String {
  DestinationType toDestinationType() {
    switch (this) {
      case 'S3':
        return DestinationType.s3;
    }
    throw Exception('$this is not known in enum DestinationType');
  }
}

enum DetectorStatus {
  enabled,
  disabled,
}

extension on DetectorStatus {
  String toValue() {
    switch (this) {
      case DetectorStatus.enabled:
        return 'ENABLED';
      case DetectorStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
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
  /// The domain information for the API request.
  final String? domain;

  DnsRequestAction({
    this.domain,
  });

  factory DnsRequestAction.fromJson(Map<String, dynamic> json) {
    return DnsRequestAction(
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

/// Contains information about the domain.
class DomainDetails {
  /// The domain information for the AWS API call.
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

enum Feedback {
  useful,
  notUseful,
}

extension on Feedback {
  String toValue() {
    switch (this) {
      case Feedback.useful:
        return 'USEFUL';
      case Feedback.notUseful:
        return 'NOT_USEFUL';
    }
  }
}

extension on String {
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

extension on FilterAction {
  String toValue() {
    switch (this) {
      case FilterAction.noop:
        return 'NOOP';
      case FilterAction.archive:
        return 'ARCHIVE';
    }
  }
}

extension on String {
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

/// Contains information about the finding, which is generated when abnormal or
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

extension on FindingPublishingFrequency {
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

extension on String {
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

extension on FindingStatisticType {
  String toValue() {
    switch (this) {
      case FindingStatisticType.countBySeverity:
        return 'COUNT_BY_SEVERITY';
    }
  }
}

extension on String {
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

class GetDetectorResponse {
  /// The GuardDuty service role.
  final String serviceRole;

  /// The detector status.
  final DetectorStatus status;

  /// The timestamp of when the detector was created.
  final String? createdAt;

  /// Describes which data sources are enabled for the detector.
  final DataSourceConfigurationsResult? dataSources;

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
    final findingPublishingFrequency = this.findingPublishingFrequency;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      'serviceRole': serviceRole,
      'status': status.toValue(),
      if (createdAt != null) 'createdAt': createdAt,
      if (dataSources != null) 'dataSources': dataSources,
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

  /// The URI of the file that contains the IPSet. For example:
  /// https://s3.us-west-2.amazonaws.com/my-bucket/my-object-key.
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

class GetThreatIntelSetResponse {
  /// The format of the threatIntelSet.
  final ThreatIntelSetFormat format;

  /// The URI of the file that contains the ThreatIntelSet. For example:
  /// https://s3.us-west-2.amazonaws.com/my-bucket/my-object-key.
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

  /// The Amazon Resource Name (ARN) of the AWS Outpost. Only applicable to AWS
  /// Outposts instances.
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

extension on IpSetFormat {
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

extension on String {
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

extension on IpSetStatus {
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

extension on String {
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

  LocalIpDetails({
    this.ipAddressV4,
  });

  factory LocalIpDetails.fromJson(Map<String, dynamic> json) {
    return LocalIpDetails(
      ipAddressV4: json['ipAddressV4'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ipAddressV4 = this.ipAddressV4;
    return {
      if (ipAddressV4 != null) 'ipAddressV4': ipAddressV4,
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
    final detectorId = this.detectorId;
    final invitedAt = this.invitedAt;
    return {
      'accountId': accountId,
      'email': email,
      'masterId': masterId,
      'relationshipStatus': relationshipStatus,
      'updatedAt': updatedAt,
      if (detectorId != null) 'detectorId': detectorId,
      if (invitedAt != null) 'invitedAt': invitedAt,
    };
  }
}

/// Contains information on which data sources are enabled for a member account.
class MemberDataSourceConfiguration {
  /// The account ID for the member account.
  final String accountId;

  /// Contains information on the status of data sources for the account.
  final DataSourceConfigurationsResult dataSources;

  MemberDataSourceConfiguration({
    required this.accountId,
    required this.dataSources,
  });

  factory MemberDataSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return MemberDataSourceConfiguration(
      accountId: json['accountId'] as String,
      dataSources: DataSourceConfigurationsResult.fromJson(
          json['dataSources'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final dataSources = this.dataSources;
    return {
      'accountId': accountId,
      'dataSources': dataSources,
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

enum OrderBy {
  asc,
  desc,
}

extension on OrderBy {
  String toValue() {
    switch (this) {
      case OrderBy.asc:
        return 'ASC';
      case OrderBy.desc:
        return 'DESC';
    }
  }
}

extension on String {
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

/// An object that contains information on which data sources will be configured
/// to be automatically enabled for new members within the organization.
class OrganizationDataSourceConfigurations {
  /// Describes whether S3 data event logs are enabled for new members of the
  /// organization.
  final OrganizationS3LogsConfiguration? s3Logs;

  OrganizationDataSourceConfigurations({
    this.s3Logs,
  });

  factory OrganizationDataSourceConfigurations.fromJson(
      Map<String, dynamic> json) {
    return OrganizationDataSourceConfigurations(
      s3Logs: json['s3Logs'] != null
          ? OrganizationS3LogsConfiguration.fromJson(
              json['s3Logs'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Logs = this.s3Logs;
    return {
      if (s3Logs != null) 's3Logs': s3Logs,
    };
  }
}

/// An object that contains information on which data sources are automatically
/// enabled for new members within the organization.
class OrganizationDataSourceConfigurationsResult {
  /// Describes whether S3 data event logs are enabled as a data source.
  final OrganizationS3LogsConfigurationResult s3Logs;

  OrganizationDataSourceConfigurationsResult({
    required this.s3Logs,
  });

  factory OrganizationDataSourceConfigurationsResult.fromJson(
      Map<String, dynamic> json) {
    return OrganizationDataSourceConfigurationsResult(
      s3Logs: OrganizationS3LogsConfigurationResult.fromJson(
          json['s3Logs'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Logs = this.s3Logs;
    return {
      's3Logs': s3Logs,
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

  factory OrganizationS3LogsConfiguration.fromJson(Map<String, dynamic> json) {
    return OrganizationS3LogsConfiguration(
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
      code: json['code'] as String?,
      productType: json['productType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final productType = this.productType;
    return {
      if (code != null) 'code': code,
      if (productType != null) 'productType': productType,
    };
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

extension on PublishingStatus {
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

extension on String {
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

  /// The ISP organization information of the remote IP address.
  final Organization? organization;

  RemoteIpDetails({
    this.city,
    this.country,
    this.geoLocation,
    this.ipAddressV4,
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
    final organization = this.organization;
    return {
      if (city != null) 'city': city,
      if (country != null) 'country': country,
      if (geoLocation != null) 'geoLocation': geoLocation,
      if (ipAddressV4 != null) 'ipAddressV4': ipAddressV4,
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

/// Contains information about the AWS resource associated with the activity
/// that prompted GuardDuty to generate a finding.
class Resource {
  /// The IAM access key details (IAM user information) of a user that engaged in
  /// the activity that prompted GuardDuty to generate a finding.
  final AccessKeyDetails? accessKeyDetails;

  /// The information about the EC2 instance associated with the activity that
  /// prompted GuardDuty to generate a finding.
  final InstanceDetails? instanceDetails;

  /// The type of AWS resource.
  final String? resourceType;

  /// Contains information on the S3 bucket.
  final List<S3BucketDetail>? s3BucketDetails;

  Resource({
    this.accessKeyDetails,
    this.instanceDetails,
    this.resourceType,
    this.s3BucketDetails,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      accessKeyDetails: json['accessKeyDetails'] != null
          ? AccessKeyDetails.fromJson(
              json['accessKeyDetails'] as Map<String, dynamic>)
          : null,
      instanceDetails: json['instanceDetails'] != null
          ? InstanceDetails.fromJson(
              json['instanceDetails'] as Map<String, dynamic>)
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
    final instanceDetails = this.instanceDetails;
    final resourceType = this.resourceType;
    final s3BucketDetails = this.s3BucketDetails;
    return {
      if (accessKeyDetails != null) 'accessKeyDetails': accessKeyDetails,
      if (instanceDetails != null) 'instanceDetails': instanceDetails,
      if (resourceType != null) 'resourceType': resourceType,
      if (s3BucketDetails != null) 's3BucketDetails': s3BucketDetails,
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

  factory S3LogsConfiguration.fromJson(Map<String, dynamic> json) {
    return S3LogsConfiguration(
      enable: json['enable'] as bool,
    );
  }

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

  /// Indicates whether this finding is archived.
  final bool? archived;

  /// The total count of the occurrences of this finding type.
  final int? count;

  /// The detector ID for the GuardDuty service.
  final String? detectorId;

  /// The first-seen timestamp of the activity that prompted GuardDuty to generate
  /// this finding.
  final String? eventFirstSeen;

  /// The last-seen timestamp of the activity that prompted GuardDuty to generate
  /// this finding.
  final String? eventLastSeen;

  /// An evidence object associated with the service.
  final Evidence? evidence;

  /// The resource role information for this finding.
  final String? resourceRole;

  /// The name of the AWS service (GuardDuty) that generated a finding.
  final String? serviceName;

  /// Feedback that was submitted about the finding.
  final String? userFeedback;

  Service({
    this.action,
    this.archived,
    this.count,
    this.detectorId,
    this.eventFirstSeen,
    this.eventLastSeen,
    this.evidence,
    this.resourceRole,
    this.serviceName,
    this.userFeedback,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      action: json['action'] != null
          ? Action.fromJson(json['action'] as Map<String, dynamic>)
          : null,
      archived: json['archived'] as bool?,
      count: json['count'] as int?,
      detectorId: json['detectorId'] as String?,
      eventFirstSeen: json['eventFirstSeen'] as String?,
      eventLastSeen: json['eventLastSeen'] as String?,
      evidence: json['evidence'] != null
          ? Evidence.fromJson(json['evidence'] as Map<String, dynamic>)
          : null,
      resourceRole: json['resourceRole'] as String?,
      serviceName: json['serviceName'] as String?,
      userFeedback: json['userFeedback'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final archived = this.archived;
    final count = this.count;
    final detectorId = this.detectorId;
    final eventFirstSeen = this.eventFirstSeen;
    final eventLastSeen = this.eventLastSeen;
    final evidence = this.evidence;
    final resourceRole = this.resourceRole;
    final serviceName = this.serviceName;
    final userFeedback = this.userFeedback;
    return {
      if (action != null) 'action': action,
      if (archived != null) 'archived': archived,
      if (count != null) 'count': count,
      if (detectorId != null) 'detectorId': detectorId,
      if (eventFirstSeen != null) 'eventFirstSeen': eventFirstSeen,
      if (eventLastSeen != null) 'eventLastSeen': eventLastSeen,
      if (evidence != null) 'evidence': evidence,
      if (resourceRole != null) 'resourceRole': resourceRole,
      if (serviceName != null) 'serviceName': serviceName,
      if (userFeedback != null) 'userFeedback': userFeedback,
    };
  }
}

/// Contains information about the criteria used for sorting findings.
class SortCriteria {
  /// Represents the finding attribute (for example, accountId) to sort findings
  /// by.
  final String? attributeName;

  /// The order by which the sorted findings are to be displayed.
  final OrderBy? orderBy;

  SortCriteria({
    this.attributeName,
    this.orderBy,
  });

  factory SortCriteria.fromJson(Map<String, dynamic> json) {
    return SortCriteria(
      attributeName: json['attributeName'] as String?,
      orderBy: (json['orderBy'] as String?)?.toOrderBy(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final orderBy = this.orderBy;
    return {
      if (attributeName != null) 'attributeName': attributeName,
      if (orderBy != null) 'orderBy': orderBy.toValue(),
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

enum ThreatIntelSetFormat {
  txt,
  stix,
  otxCsv,
  alienVault,
  proofPoint,
  fireEye,
}

extension on ThreatIntelSetFormat {
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

extension on String {
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

extension on ThreatIntelSetStatus {
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

extension on String {
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
  /// The name of the threat intelligence list that triggered the finding.
  final String? threatListName;

  /// A list of names of the threats in the threat intelligence list that
  /// triggered the finding.
  final List<String>? threatNames;

  ThreatIntelligenceDetail({
    this.threatListName,
    this.threatNames,
  });

  factory ThreatIntelligenceDetail.fromJson(Map<String, dynamic> json) {
    return ThreatIntelligenceDetail(
      threatListName: json['threatListName'] as String?,
      threatNames: (json['threatNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final threatListName = this.threatListName;
    final threatNames = this.threatNames;
    return {
      if (threatListName != null) 'threatListName': threatListName,
      if (threatNames != null) 'threatNames': threatNames,
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
  /// The AWS account ID.
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
  /// The data sources to aggregate usage statistics from.
  final List<DataSource> dataSources;

  /// The account IDs to aggregate usage statistics from.
  final List<String>? accountIds;

  /// The resources to aggregate usage statistics from. Only accepts exact
  /// resource names.
  final List<String>? resources;

  UsageCriteria({
    required this.dataSources,
    this.accountIds,
    this.resources,
  });

  factory UsageCriteria.fromJson(Map<String, dynamic> json) {
    return UsageCriteria(
      dataSources: (json['dataSources'] as List)
          .whereNotNull()
          .map((e) => (e as String).toDataSource())
          .toList(),
      accountIds: (json['accountIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      resources: (json['resources'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSources = this.dataSources;
    final accountIds = this.accountIds;
    final resources = this.resources;
    return {
      'dataSources': dataSources.map((e) => e.toValue()).toList(),
      if (accountIds != null) 'accountIds': accountIds,
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

/// Contains information on the sum of usage based on an AWS resource.
class UsageResourceResult {
  /// The AWS resource that generated usage.
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
}

extension on UsageStatisticType {
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
    }
  }
}

extension on String {
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

  /// The usage statistic sum organized by resource.
  final List<UsageResourceResult>? sumByResource;

  /// Lists the top 50 resources that have generated the most GuardDuty usage, in
  /// order from most to least expensive.
  final List<UsageResourceResult>? topResources;

  UsageStatistics({
    this.sumByAccount,
    this.sumByDataSource,
    this.sumByResource,
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
      sumByResource: (json['sumByResource'] as List?)
          ?.whereNotNull()
          .map((e) => UsageResourceResult.fromJson(e as Map<String, dynamic>))
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
    final sumByResource = this.sumByResource;
    final topResources = this.topResources;
    return {
      if (sumByAccount != null) 'sumByAccount': sumByAccount,
      if (sumByDataSource != null) 'sumByDataSource': sumByDataSource,
      if (sumByResource != null) 'sumByResource': sumByResource,
      if (topResources != null) 'topResources': topResources,
    };
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
};

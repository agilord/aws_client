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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2017-11-28.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required String detectorId,
    @_s.required String invitationId,
    @_s.required String masterId,
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
    return AcceptInvitationResponse.fromJson(response);
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
    @_s.required String detectorId,
    @_s.required List<String> findingIds,
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
    return ArchiveFindingsResponse.fromJson(response);
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
    @_s.required bool enable,
    String clientToken,
    DataSourceConfigurations dataSources,
    FindingPublishingFrequency findingPublishingFrequency,
    Map<String, String> tags,
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
    @_s.required String detectorId,
    @_s.required FindingCriteria findingCriteria,
    @_s.required String name,
    FilterAction action,
    String clientToken,
    String description,
    int rank,
    Map<String, String> tags,
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
    @_s.required bool activate,
    @_s.required String detectorId,
    @_s.required IpSetFormat format,
    @_s.required String location,
    @_s.required String name,
    String clientToken,
    Map<String, String> tags,
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
      'format': format?.toValue() ?? '',
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
    @_s.required List<AccountDetail> accountDetails,
    @_s.required String detectorId,
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
    @_s.required DestinationProperties destinationProperties,
    @_s.required DestinationType destinationType,
    @_s.required String detectorId,
    String clientToken,
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
      'destinationType': destinationType?.toValue() ?? '',
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
    @_s.required String detectorId,
    List<String> findingTypes,
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
    return CreateSampleFindingsResponse.fromJson(response);
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
    @_s.required bool activate,
    @_s.required String detectorId,
    @_s.required ThreatIntelSetFormat format,
    @_s.required String location,
    @_s.required String name,
    String clientToken,
    Map<String, String> tags,
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
      'format': format?.toValue() ?? '',
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
    @_s.required List<String> accountIds,
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
    @_s.required String detectorId,
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
    return DeleteDetectorResponse.fromJson(response);
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
    @_s.required String detectorId,
    @_s.required String filterName,
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
    return DeleteFilterResponse.fromJson(response);
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
    @_s.required String detectorId,
    @_s.required String ipSetId,
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
    return DeleteIPSetResponse.fromJson(response);
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
    @_s.required List<String> accountIds,
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
    @_s.required List<String> accountIds,
    @_s.required String detectorId,
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
    @_s.required String destinationId,
    @_s.required String detectorId,
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
    return DeletePublishingDestinationResponse.fromJson(response);
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
    @_s.required String detectorId,
    @_s.required String threatIntelSetId,
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
    return DeleteThreatIntelSetResponse.fromJson(response);
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
    @_s.required String detectorId,
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
    @_s.required String destinationId,
    @_s.required String detectorId,
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
    @_s.required String adminAccountId,
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
    return DisableOrganizationAdminAccountResponse.fromJson(response);
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
    @_s.required String detectorId,
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
    return DisassociateFromMasterAccountResponse.fromJson(response);
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
    @_s.required List<String> accountIds,
    @_s.required String detectorId,
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
    @_s.required String adminAccountId,
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
    return EnableOrganizationAdminAccountResponse.fromJson(response);
  }

  /// Retrieves an Amazon GuardDuty detector specified by the detectorId.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector that you want to get.
  Future<GetDetectorResponse> getDetector({
    @_s.required String detectorId,
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
    @_s.required String detectorId,
    @_s.required String filterName,
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
    @_s.required String detectorId,
    @_s.required List<String> findingIds,
    SortCriteria sortCriteria,
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
    @_s.required String detectorId,
    @_s.required List<FindingStatisticType> findingStatisticTypes,
    FindingCriteria findingCriteria,
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
          findingStatisticTypes?.map((e) => e?.toValue() ?? '')?.toList(),
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
    @_s.required String detectorId,
    @_s.required String ipSetId,
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
    @_s.required String detectorId,
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
    @_s.required List<String> accountIds,
    @_s.required String detectorId,
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
    @_s.required List<String> accountIds,
    @_s.required String detectorId,
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
    @_s.required String detectorId,
    @_s.required String threatIntelSetId,
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
    @_s.required String detectorId,
    @_s.required UsageCriteria usageCriteria,
    @_s.required UsageStatisticType usageStatisticType,
    int maxResults,
    String nextToken,
    String unit,
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
      'usageStatisticsType': usageStatisticType?.toValue() ?? '',
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
    @_s.required List<String> accountIds,
    @_s.required String detectorId,
    bool disableEmailNotification,
    String message,
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
    int maxResults,
    String nextToken,
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
    @_s.required String detectorId,
    int maxResults,
    String nextToken,
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
    @_s.required String detectorId,
    FindingCriteria findingCriteria,
    int maxResults,
    String nextToken,
    SortCriteria sortCriteria,
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
    @_s.required String detectorId,
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
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
    @_s.required String detectorId,
    int maxResults,
    String nextToken,
    String onlyAssociated,
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
    int maxResults,
    String nextToken,
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
    @_s.required String detectorId,
    int maxResults,
    String nextToken,
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:[A-Za-z_.-]{1,20}:guardduty:[A-Za-z0-9_/.-]{0,63}:\d+:detector/[A-Za-z0-9_/.-]{32,264}$''',
      isRequired: true,
    );
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
    @_s.required String detectorId,
    int maxResults,
    String nextToken,
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
    @_s.required List<String> accountIds,
    @_s.required String detectorId,
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
    @_s.required List<String> accountIds,
    @_s.required String detectorId,
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:[A-Za-z_.-]{1,20}:guardduty:[A-Za-z0-9_/.-]{0,63}:\d+:detector/[A-Za-z0-9_/.-]{32,264}$''',
      isRequired: true,
    );
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
    return TagResourceResponse.fromJson(response);
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
    @_s.required String detectorId,
    @_s.required List<String> findingIds,
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
    return UnarchiveFindingsResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:[A-Za-z_.-]{1,20}:guardduty:[A-Za-z0-9_/.-]{0,63}:\d+:detector/[A-Za-z0-9_/.-]{32,264}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
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
    @_s.required String detectorId,
    DataSourceConfigurations dataSources,
    bool enable,
    FindingPublishingFrequency findingPublishingFrequency,
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
    return UpdateDetectorResponse.fromJson(response);
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
    @_s.required String detectorId,
    @_s.required String filterName,
    FilterAction action,
    String description,
    FindingCriteria findingCriteria,
    int rank,
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
    @_s.required String detectorId,
    @_s.required Feedback feedback,
    @_s.required List<String> findingIds,
    String comments,
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
      'feedback': feedback?.toValue() ?? '',
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
    return UpdateFindingsFeedbackResponse.fromJson(response);
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
    @_s.required String detectorId,
    @_s.required String ipSetId,
    bool activate,
    String location,
    String name,
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
    return UpdateIPSetResponse.fromJson(response);
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
    @_s.required List<String> accountIds,
    @_s.required String detectorId,
    DataSourceConfigurations dataSources,
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
    @_s.required bool autoEnable,
    @_s.required String detectorId,
    OrganizationDataSourceConfigurations dataSources,
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
    return UpdateOrganizationConfigurationResponse.fromJson(response);
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
    @_s.required String destinationId,
    @_s.required String detectorId,
    DestinationProperties destinationProperties,
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
    return UpdatePublishingDestinationResponse.fromJson(response);
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
    @_s.required String detectorId,
    @_s.required String threatIntelSetId,
    bool activate,
    String location,
    String name,
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
    return UpdateThreatIntelSetResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AcceptInvitationResponse {
  AcceptInvitationResponse();
  factory AcceptInvitationResponse.fromJson(Map<String, dynamic> json) =>
      _$AcceptInvitationResponseFromJson(json);
}

/// Contains information on the current access control policies for the bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccessControlList {
  /// A value that indicates whether public read access for the bucket is enabled
  /// through an Access Control List (ACL).
  @_s.JsonKey(name: 'allowsPublicReadAccess')
  final bool allowsPublicReadAccess;

  /// A value that indicates whether public write access for the bucket is enabled
  /// through an Access Control List (ACL).
  @_s.JsonKey(name: 'allowsPublicWriteAccess')
  final bool allowsPublicWriteAccess;

  AccessControlList({
    this.allowsPublicReadAccess,
    this.allowsPublicWriteAccess,
  });
  factory AccessControlList.fromJson(Map<String, dynamic> json) =>
      _$AccessControlListFromJson(json);
}

/// Contains information about the access keys.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccessKeyDetails {
  /// The access key ID of the user.
  @_s.JsonKey(name: 'accessKeyId')
  final String accessKeyId;

  /// The principal ID of the user.
  @_s.JsonKey(name: 'principalId')
  final String principalId;

  /// The name of the user.
  @_s.JsonKey(name: 'userName')
  final String userName;

  /// The type of the user.
  @_s.JsonKey(name: 'userType')
  final String userType;

  AccessKeyDetails({
    this.accessKeyId,
    this.principalId,
    this.userName,
    this.userType,
  });
  factory AccessKeyDetails.fromJson(Map<String, dynamic> json) =>
      _$AccessKeyDetailsFromJson(json);
}

/// Contains information about the account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AccountDetail {
  /// The member account ID.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The email address of the member account.
  @_s.JsonKey(name: 'email')
  final String email;

  AccountDetail({
    @_s.required this.accountId,
    @_s.required this.email,
  });
  Map<String, dynamic> toJson() => _$AccountDetailToJson(this);
}

/// Contains information about the account level permissions on the S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccountLevelPermissions {
  /// Describes the S3 Block Public Access settings of the bucket's parent
  /// account.
  @_s.JsonKey(name: 'blockPublicAccess')
  final BlockPublicAccess blockPublicAccess;

  AccountLevelPermissions({
    this.blockPublicAccess,
  });
  factory AccountLevelPermissions.fromJson(Map<String, dynamic> json) =>
      _$AccountLevelPermissionsFromJson(json);
}

/// Contains information about actions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Action {
  /// The GuardDuty finding activity type.
  @_s.JsonKey(name: 'actionType')
  final String actionType;

  /// Information about the AWS_API_CALL action described in this finding.
  @_s.JsonKey(name: 'awsApiCallAction')
  final AwsApiCallAction awsApiCallAction;

  /// Information about the DNS_REQUEST action described in this finding.
  @_s.JsonKey(name: 'dnsRequestAction')
  final DnsRequestAction dnsRequestAction;

  /// Information about the NETWORK_CONNECTION action described in this finding.
  @_s.JsonKey(name: 'networkConnectionAction')
  final NetworkConnectionAction networkConnectionAction;

  /// Information about the PORT_PROBE action described in this finding.
  @_s.JsonKey(name: 'portProbeAction')
  final PortProbeAction portProbeAction;

  Action({
    this.actionType,
    this.awsApiCallAction,
    this.dnsRequestAction,
    this.networkConnectionAction,
    this.portProbeAction,
  });
  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);
}

/// The account within the organization specified as the GuardDuty delegated
/// administrator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdminAccount {
  /// The AWS account ID for the account.
  @_s.JsonKey(name: 'adminAccountId')
  final String adminAccountId;

  /// Indicates whether the account is enabled as the delegated administrator.
  @_s.JsonKey(name: 'adminStatus')
  final AdminStatus adminStatus;

  AdminAccount({
    this.adminAccountId,
    this.adminStatus,
  });
  factory AdminAccount.fromJson(Map<String, dynamic> json) =>
      _$AdminAccountFromJson(json);
}

enum AdminStatus {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLE_IN_PROGRESS')
  disableInProgress,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ArchiveFindingsResponse {
  ArchiveFindingsResponse();
  factory ArchiveFindingsResponse.fromJson(Map<String, dynamic> json) =>
      _$ArchiveFindingsResponseFromJson(json);
}

/// Contains information about the API action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AwsApiCallAction {
  /// The AWS API name.
  @_s.JsonKey(name: 'api')
  final String api;

  /// The AWS API caller type.
  @_s.JsonKey(name: 'callerType')
  final String callerType;

  /// The domain information for the AWS API call.
  @_s.JsonKey(name: 'domainDetails')
  final DomainDetails domainDetails;

  /// The error code of the failed AWS API action.
  @_s.JsonKey(name: 'errorCode')
  final String errorCode;

  /// The remote IP information of the connection that initiated the AWS API call.
  @_s.JsonKey(name: 'remoteIpDetails')
  final RemoteIpDetails remoteIpDetails;

  /// The AWS service name whose API was invoked.
  @_s.JsonKey(name: 'serviceName')
  final String serviceName;

  AwsApiCallAction({
    this.api,
    this.callerType,
    this.domainDetails,
    this.errorCode,
    this.remoteIpDetails,
    this.serviceName,
  });
  factory AwsApiCallAction.fromJson(Map<String, dynamic> json) =>
      _$AwsApiCallActionFromJson(json);
}

/// Contains information on how the bucker owner's S3 Block Public Access
/// settings are being applied to the S3 bucket. See <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html">S3
/// Block Public Access</a> for more information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BlockPublicAccess {
  /// Indicates if S3 Block Public Access is set to <code>BlockPublicAcls</code>.
  @_s.JsonKey(name: 'blockPublicAcls')
  final bool blockPublicAcls;

  /// Indicates if S3 Block Public Access is set to
  /// <code>BlockPublicPolicy</code>.
  @_s.JsonKey(name: 'blockPublicPolicy')
  final bool blockPublicPolicy;

  /// Indicates if S3 Block Public Access is set to <code>IgnorePublicAcls</code>.
  @_s.JsonKey(name: 'ignorePublicAcls')
  final bool ignorePublicAcls;

  /// Indicates if S3 Block Public Access is set to
  /// <code>RestrictPublicBuckets</code>.
  @_s.JsonKey(name: 'restrictPublicBuckets')
  final bool restrictPublicBuckets;

  BlockPublicAccess({
    this.blockPublicAcls,
    this.blockPublicPolicy,
    this.ignorePublicAcls,
    this.restrictPublicBuckets,
  });
  factory BlockPublicAccess.fromJson(Map<String, dynamic> json) =>
      _$BlockPublicAccessFromJson(json);
}

/// Contains information about the bucket level permissions for the S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BucketLevelPermissions {
  /// Contains information on how Access Control Policies are applied to the
  /// bucket.
  @_s.JsonKey(name: 'accessControlList')
  final AccessControlList accessControlList;

  /// Contains information on which account level S3 Block Public Access settings
  /// are applied to the S3 bucket.
  @_s.JsonKey(name: 'blockPublicAccess')
  final BlockPublicAccess blockPublicAccess;

  /// Contains information on the bucket policies for the S3 bucket.
  @_s.JsonKey(name: 'bucketPolicy')
  final BucketPolicy bucketPolicy;

  BucketLevelPermissions({
    this.accessControlList,
    this.blockPublicAccess,
    this.bucketPolicy,
  });
  factory BucketLevelPermissions.fromJson(Map<String, dynamic> json) =>
      _$BucketLevelPermissionsFromJson(json);
}

/// Contains information on the current bucket policies for the S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BucketPolicy {
  /// A value that indicates whether public read access for the bucket is enabled
  /// through a bucket policy.
  @_s.JsonKey(name: 'allowsPublicReadAccess')
  final bool allowsPublicReadAccess;

  /// A value that indicates whether public write access for the bucket is enabled
  /// through a bucket policy.
  @_s.JsonKey(name: 'allowsPublicWriteAccess')
  final bool allowsPublicWriteAccess;

  BucketPolicy({
    this.allowsPublicReadAccess,
    this.allowsPublicWriteAccess,
  });
  factory BucketPolicy.fromJson(Map<String, dynamic> json) =>
      _$BucketPolicyFromJson(json);
}

/// Contains information about the city associated with the IP address.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class City {
  /// The city name of the remote IP address.
  @_s.JsonKey(name: 'cityName')
  final String cityName;

  City({
    this.cityName,
  });
  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

/// Contains information on the status of CloudTrail as a data source for the
/// detector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CloudTrailConfigurationResult {
  /// Describes whether CloudTrail is enabled as a data source for the detector.
  @_s.JsonKey(name: 'status')
  final DataSourceStatus status;

  CloudTrailConfigurationResult({
    @_s.required this.status,
  });
  factory CloudTrailConfigurationResult.fromJson(Map<String, dynamic> json) =>
      _$CloudTrailConfigurationResultFromJson(json);
}

/// Contains information about the condition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Condition {
  /// Represents the <i>equal</i> condition to be applied to a single field when
  /// querying for findings.
  @_s.JsonKey(name: 'eq')
  final List<String> eq;

  /// Represents an <i>equal</i> <b/> condition to be applied to a single field
  /// when querying for findings.
  @_s.JsonKey(name: 'equals')
  final List<String> equals;

  /// Represents a <i>greater than</i> condition to be applied to a single field
  /// when querying for findings.
  @_s.JsonKey(name: 'greaterThan')
  final int greaterThan;

  /// Represents a <i>greater than or equal</i> condition to be applied to a
  /// single field when querying for findings.
  @_s.JsonKey(name: 'greaterThanOrEqual')
  final int greaterThanOrEqual;

  /// Represents a <i>greater than</i> condition to be applied to a single field
  /// when querying for findings.
  @_s.JsonKey(name: 'gt')
  final int gt;

  /// Represents a <i>greater than or equal</i> condition to be applied to a
  /// single field when querying for findings.
  @_s.JsonKey(name: 'gte')
  final int gte;

  /// Represents a <i>less than</i> condition to be applied to a single field when
  /// querying for findings.
  @_s.JsonKey(name: 'lessThan')
  final int lessThan;

  /// Represents a <i>less than or equal</i> condition to be applied to a single
  /// field when querying for findings.
  @_s.JsonKey(name: 'lessThanOrEqual')
  final int lessThanOrEqual;

  /// Represents a <i>less than</i> condition to be applied to a single field when
  /// querying for findings.
  @_s.JsonKey(name: 'lt')
  final int lt;

  /// Represents a <i>less than or equal</i> condition to be applied to a single
  /// field when querying for findings.
  @_s.JsonKey(name: 'lte')
  final int lte;

  /// Represents the <i>not equal</i> condition to be applied to a single field
  /// when querying for findings.
  @_s.JsonKey(name: 'neq')
  final List<String> neq;

  /// Represents a <i>not equal</i> <b/> condition to be applied to a single field
  /// when querying for findings.
  @_s.JsonKey(name: 'notEquals')
  final List<String> notEquals;

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
  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

/// Contains information about the country where the remote IP address is
/// located.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Country {
  /// The country code of the remote IP address.
  @_s.JsonKey(name: 'countryCode')
  final String countryCode;

  /// The country name of the remote IP address.
  @_s.JsonKey(name: 'countryName')
  final String countryName;

  Country({
    this.countryCode,
    this.countryName,
  });
  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDetectorResponse {
  /// The unique ID of the created detector.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  CreateDetectorResponse({
    this.detectorId,
  });
  factory CreateDetectorResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDetectorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFilterResponse {
  /// The name of the successfully created filter.
  @_s.JsonKey(name: 'name')
  final String name;

  CreateFilterResponse({
    @_s.required this.name,
  });
  factory CreateFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFilterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateIPSetResponse {
  /// The ID of the IPSet resource.
  @_s.JsonKey(name: 'ipSetId')
  final String ipSetId;

  CreateIPSetResponse({
    @_s.required this.ipSetId,
  });
  factory CreateIPSetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateIPSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateMembersResponse {
  /// A list of objects that include the <code>accountIds</code> of the
  /// unprocessed accounts and a result string that explains why each was
  /// unprocessed.
  @_s.JsonKey(name: 'unprocessedAccounts')
  final List<UnprocessedAccount> unprocessedAccounts;

  CreateMembersResponse({
    @_s.required this.unprocessedAccounts,
  });
  factory CreateMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateMembersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePublishingDestinationResponse {
  /// The ID of the publishing destination that is created.
  @_s.JsonKey(name: 'destinationId')
  final String destinationId;

  CreatePublishingDestinationResponse({
    @_s.required this.destinationId,
  });
  factory CreatePublishingDestinationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreatePublishingDestinationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSampleFindingsResponse {
  CreateSampleFindingsResponse();
  factory CreateSampleFindingsResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSampleFindingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateThreatIntelSetResponse {
  /// The ID of the ThreatIntelSet resource.
  @_s.JsonKey(name: 'threatIntelSetId')
  final String threatIntelSetId;

  CreateThreatIntelSetResponse({
    @_s.required this.threatIntelSetId,
  });
  factory CreateThreatIntelSetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateThreatIntelSetResponseFromJson(json);
}

/// Contains information on the status of DNS logs as a data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DNSLogsConfigurationResult {
  /// Denotes whether DNS logs is enabled as a data source.
  @_s.JsonKey(name: 'status')
  final DataSourceStatus status;

  DNSLogsConfigurationResult({
    @_s.required this.status,
  });
  factory DNSLogsConfigurationResult.fromJson(Map<String, dynamic> json) =>
      _$DNSLogsConfigurationResultFromJson(json);
}

enum DataSource {
  @_s.JsonValue('FLOW_LOGS')
  flowLogs,
  @_s.JsonValue('CLOUD_TRAIL')
  cloudTrail,
  @_s.JsonValue('DNS_LOGS')
  dnsLogs,
  @_s.JsonValue('S3_LOGS')
  s3Logs,
}

/// Contains information about which data sources are enabled.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DataSourceConfigurations {
  /// Describes whether S3 data event logs are enabled as a data source.
  @_s.JsonKey(name: 's3Logs')
  final S3LogsConfiguration s3Logs;

  DataSourceConfigurations({
    this.s3Logs,
  });
  Map<String, dynamic> toJson() => _$DataSourceConfigurationsToJson(this);
}

/// Contains information on the status of data sources for the detector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataSourceConfigurationsResult {
  /// An object that contains information on the status of CloudTrail as a data
  /// source.
  @_s.JsonKey(name: 'cloudTrail')
  final CloudTrailConfigurationResult cloudTrail;

  /// An object that contains information on the status of DNS logs as a data
  /// source.
  @_s.JsonKey(name: 'dnsLogs')
  final DNSLogsConfigurationResult dNSLogs;

  /// An object that contains information on the status of VPC flow logs as a data
  /// source.
  @_s.JsonKey(name: 'flowLogs')
  final FlowLogsConfigurationResult flowLogs;

  /// An object that contains information on the status of S3 Data event logs as a
  /// data source.
  @_s.JsonKey(name: 's3Logs')
  final S3LogsConfigurationResult s3Logs;

  DataSourceConfigurationsResult({
    @_s.required this.cloudTrail,
    @_s.required this.dNSLogs,
    @_s.required this.flowLogs,
    @_s.required this.s3Logs,
  });
  factory DataSourceConfigurationsResult.fromJson(Map<String, dynamic> json) =>
      _$DataSourceConfigurationsResultFromJson(json);
}

enum DataSourceStatus {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeclineInvitationsResponse {
  /// A list of objects that contain the unprocessed account and a result string
  /// that explains why it was unprocessed.
  @_s.JsonKey(name: 'unprocessedAccounts')
  final List<UnprocessedAccount> unprocessedAccounts;

  DeclineInvitationsResponse({
    @_s.required this.unprocessedAccounts,
  });
  factory DeclineInvitationsResponse.fromJson(Map<String, dynamic> json) =>
      _$DeclineInvitationsResponseFromJson(json);
}

/// Contains information on the server side encryption method used in the S3
/// bucket. See <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html">S3
/// Server-Side Encryption</a> for more information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DefaultServerSideEncryption {
  /// The type of encryption used for objects within the S3 bucket.
  @_s.JsonKey(name: 'encryptionType')
  final String encryptionType;

  /// The Amazon Resource Name (ARN) of the KMS encryption key. Only available if
  /// the bucket <code>EncryptionType</code> is <code>aws:kms</code>.
  @_s.JsonKey(name: 'kmsMasterKeyArn')
  final String kmsMasterKeyArn;

  DefaultServerSideEncryption({
    this.encryptionType,
    this.kmsMasterKeyArn,
  });
  factory DefaultServerSideEncryption.fromJson(Map<String, dynamic> json) =>
      _$DefaultServerSideEncryptionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDetectorResponse {
  DeleteDetectorResponse();
  factory DeleteDetectorResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDetectorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFilterResponse {
  DeleteFilterResponse();
  factory DeleteFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteFilterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteIPSetResponse {
  DeleteIPSetResponse();
  factory DeleteIPSetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteIPSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteInvitationsResponse {
  /// A list of objects that contain the unprocessed account and a result string
  /// that explains why it was unprocessed.
  @_s.JsonKey(name: 'unprocessedAccounts')
  final List<UnprocessedAccount> unprocessedAccounts;

  DeleteInvitationsResponse({
    @_s.required this.unprocessedAccounts,
  });
  factory DeleteInvitationsResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteInvitationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteMembersResponse {
  /// The accounts that could not be processed.
  @_s.JsonKey(name: 'unprocessedAccounts')
  final List<UnprocessedAccount> unprocessedAccounts;

  DeleteMembersResponse({
    @_s.required this.unprocessedAccounts,
  });
  factory DeleteMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteMembersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeletePublishingDestinationResponse {
  DeletePublishingDestinationResponse();
  factory DeletePublishingDestinationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeletePublishingDestinationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteThreatIntelSetResponse {
  DeleteThreatIntelSetResponse();
  factory DeleteThreatIntelSetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteThreatIntelSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeOrganizationConfigurationResponse {
  /// Indicates whether GuardDuty is automatically enabled for accounts added to
  /// the organization.
  @_s.JsonKey(name: 'autoEnable')
  final bool autoEnable;

  /// Indicates whether the maximum number of allowed member accounts are already
  /// associated with the delegated administrator account for your organization.
  @_s.JsonKey(name: 'memberAccountLimitReached')
  final bool memberAccountLimitReached;

  /// Describes which data sources are enabled automatically for member accounts.
  @_s.JsonKey(name: 'dataSources')
  final OrganizationDataSourceConfigurationsResult dataSources;

  DescribeOrganizationConfigurationResponse({
    @_s.required this.autoEnable,
    @_s.required this.memberAccountLimitReached,
    this.dataSources,
  });
  factory DescribeOrganizationConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeOrganizationConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePublishingDestinationResponse {
  /// The ID of the publishing destination.
  @_s.JsonKey(name: 'destinationId')
  final String destinationId;

  /// A <code>DestinationProperties</code> object that includes the
  /// <code>DestinationArn</code> and <code>KmsKeyArn</code> of the publishing
  /// destination.
  @_s.JsonKey(name: 'destinationProperties')
  final DestinationProperties destinationProperties;

  /// The type of publishing destination. Currently, only Amazon S3 buckets are
  /// supported.
  @_s.JsonKey(name: 'destinationType')
  final DestinationType destinationType;

  /// The time, in epoch millisecond format, at which GuardDuty was first unable
  /// to publish findings to the destination.
  @_s.JsonKey(name: 'publishingFailureStartTimestamp')
  final int publishingFailureStartTimestamp;

  /// The status of the publishing destination.
  @_s.JsonKey(name: 'status')
  final PublishingStatus status;

  DescribePublishingDestinationResponse({
    @_s.required this.destinationId,
    @_s.required this.destinationProperties,
    @_s.required this.destinationType,
    @_s.required this.publishingFailureStartTimestamp,
    @_s.required this.status,
  });
  factory DescribePublishingDestinationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribePublishingDestinationResponseFromJson(json);
}

/// Contains information about the publishing destination, including the ID,
/// type, and status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Destination {
  /// The unique ID of the publishing destination.
  @_s.JsonKey(name: 'destinationId')
  final String destinationId;

  /// The type of resource used for the publishing destination. Currently, only
  /// Amazon S3 buckets are supported.
  @_s.JsonKey(name: 'destinationType')
  final DestinationType destinationType;

  /// The status of the publishing destination.
  @_s.JsonKey(name: 'status')
  final PublishingStatus status;

  Destination({
    @_s.required this.destinationId,
    @_s.required this.destinationType,
    @_s.required this.status,
  });
  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);
}

/// Contains the Amazon Resource Name (ARN) of the resource to publish to, such
/// as an S3 bucket, and the ARN of the KMS key to use to encrypt published
/// findings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DestinationProperties {
  /// The ARN of the resource to publish to.
  @_s.JsonKey(name: 'destinationArn')
  final String destinationArn;

  /// The ARN of the KMS key to use for encryption.
  @_s.JsonKey(name: 'kmsKeyArn')
  final String kmsKeyArn;

  DestinationProperties({
    this.destinationArn,
    this.kmsKeyArn,
  });
  factory DestinationProperties.fromJson(Map<String, dynamic> json) =>
      _$DestinationPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationPropertiesToJson(this);
}

enum DestinationType {
  @_s.JsonValue('S3')
  s3,
}

extension on DestinationType {
  String toValue() {
    switch (this) {
      case DestinationType.s3:
        return 'S3';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum DetectorStatus {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisableOrganizationAdminAccountResponse {
  DisableOrganizationAdminAccountResponse();
  factory DisableOrganizationAdminAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisableOrganizationAdminAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateFromMasterAccountResponse {
  DisassociateFromMasterAccountResponse();
  factory DisassociateFromMasterAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateFromMasterAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateMembersResponse {
  /// A list of objects that contain the unprocessed account and a result string
  /// that explains why it was unprocessed.
  @_s.JsonKey(name: 'unprocessedAccounts')
  final List<UnprocessedAccount> unprocessedAccounts;

  DisassociateMembersResponse({
    @_s.required this.unprocessedAccounts,
  });
  factory DisassociateMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$DisassociateMembersResponseFromJson(json);
}

/// Contains information about the DNS_REQUEST action described in this finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DnsRequestAction {
  /// The domain information for the API request.
  @_s.JsonKey(name: 'domain')
  final String domain;

  DnsRequestAction({
    this.domain,
  });
  factory DnsRequestAction.fromJson(Map<String, dynamic> json) =>
      _$DnsRequestActionFromJson(json);
}

/// Contains information about the domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainDetails {
  /// The domain information for the AWS API call.
  @_s.JsonKey(name: 'domain')
  final String domain;

  DomainDetails({
    this.domain,
  });
  factory DomainDetails.fromJson(Map<String, dynamic> json) =>
      _$DomainDetailsFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnableOrganizationAdminAccountResponse {
  EnableOrganizationAdminAccountResponse();
  factory EnableOrganizationAdminAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$EnableOrganizationAdminAccountResponseFromJson(json);
}

/// Contains information about the reason that the finding was generated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Evidence {
  /// A list of threat intelligence details related to the evidence.
  @_s.JsonKey(name: 'threatIntelligenceDetails')
  final List<ThreatIntelligenceDetail> threatIntelligenceDetails;

  Evidence({
    this.threatIntelligenceDetails,
  });
  factory Evidence.fromJson(Map<String, dynamic> json) =>
      _$EvidenceFromJson(json);
}

enum Feedback {
  @_s.JsonValue('USEFUL')
  useful,
  @_s.JsonValue('NOT_USEFUL')
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
    throw Exception('Unknown enum value: $this');
  }
}

enum FilterAction {
  @_s.JsonValue('NOOP')
  noop,
  @_s.JsonValue('ARCHIVE')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains information about the finding, which is generated when abnormal or
/// suspicious activity is detected.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Finding {
  /// The ID of the account in which the finding was generated.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The ARN of the finding.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time and date when the finding was created.
  @_s.JsonKey(name: 'createdAt')
  final String createdAt;

  /// The ID of the finding.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The Region where the finding was generated.
  @_s.JsonKey(name: 'region')
  final String region;
  @_s.JsonKey(name: 'resource')
  final Resource resource;

  /// The version of the schema used for the finding.
  @_s.JsonKey(name: 'schemaVersion')
  final String schemaVersion;

  /// The severity of the finding.
  @_s.JsonKey(name: 'severity')
  final double severity;

  /// The type of finding.
  @_s.JsonKey(name: 'type')
  final String type;

  /// The time and date when the finding was last updated.
  @_s.JsonKey(name: 'updatedAt')
  final String updatedAt;

  /// The confidence score for the finding.
  @_s.JsonKey(name: 'confidence')
  final double confidence;

  /// The description of the finding.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The partition associated with the finding.
  @_s.JsonKey(name: 'partition')
  final String partition;
  @_s.JsonKey(name: 'service')
  final Service service;

  /// The title of the finding.
  @_s.JsonKey(name: 'title')
  final String title;

  Finding({
    @_s.required this.accountId,
    @_s.required this.arn,
    @_s.required this.createdAt,
    @_s.required this.id,
    @_s.required this.region,
    @_s.required this.resource,
    @_s.required this.schemaVersion,
    @_s.required this.severity,
    @_s.required this.type,
    @_s.required this.updatedAt,
    this.confidence,
    this.description,
    this.partition,
    this.service,
    this.title,
  });
  factory Finding.fromJson(Map<String, dynamic> json) =>
      _$FindingFromJson(json);
}

/// Contains information about the criteria used for querying findings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FindingCriteria {
  /// Represents a map of finding properties that match specified conditions and
  /// values when querying findings.
  @_s.JsonKey(name: 'criterion')
  final Map<String, Condition> criterion;

  FindingCriteria({
    this.criterion,
  });
  factory FindingCriteria.fromJson(Map<String, dynamic> json) =>
      _$FindingCriteriaFromJson(json);

  Map<String, dynamic> toJson() => _$FindingCriteriaToJson(this);
}

enum FindingPublishingFrequency {
  @_s.JsonValue('FIFTEEN_MINUTES')
  fifteenMinutes,
  @_s.JsonValue('ONE_HOUR')
  oneHour,
  @_s.JsonValue('SIX_HOURS')
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
    throw Exception('Unknown enum value: $this');
  }
}

enum FindingStatisticType {
  @_s.JsonValue('COUNT_BY_SEVERITY')
  countBySeverity,
}

extension on FindingStatisticType {
  String toValue() {
    switch (this) {
      case FindingStatisticType.countBySeverity:
        return 'COUNT_BY_SEVERITY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains information about finding statistics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FindingStatistics {
  /// Represents a map of severity to count statistics for a set of findings.
  @_s.JsonKey(name: 'countBySeverity')
  final Map<String, int> countBySeverity;

  FindingStatistics({
    this.countBySeverity,
  });
  factory FindingStatistics.fromJson(Map<String, dynamic> json) =>
      _$FindingStatisticsFromJson(json);
}

/// Contains information on the status of VPC flow logs as a data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FlowLogsConfigurationResult {
  /// Denotes whether VPC flow logs is enabled as a data source.
  @_s.JsonKey(name: 'status')
  final DataSourceStatus status;

  FlowLogsConfigurationResult({
    @_s.required this.status,
  });
  factory FlowLogsConfigurationResult.fromJson(Map<String, dynamic> json) =>
      _$FlowLogsConfigurationResultFromJson(json);
}

/// Contains information about the location of the remote IP address.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GeoLocation {
  /// The latitude information of the remote IP address.
  @_s.JsonKey(name: 'lat')
  final double lat;

  /// The longitude information of the remote IP address.
  @_s.JsonKey(name: 'lon')
  final double lon;

  GeoLocation({
    this.lat,
    this.lon,
  });
  factory GeoLocation.fromJson(Map<String, dynamic> json) =>
      _$GeoLocationFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDetectorResponse {
  /// The GuardDuty service role.
  @_s.JsonKey(name: 'serviceRole')
  final String serviceRole;

  /// The detector status.
  @_s.JsonKey(name: 'status')
  final DetectorStatus status;

  /// The timestamp of when the detector was created.
  @_s.JsonKey(name: 'createdAt')
  final String createdAt;

  /// Describes which data sources are enabled for the detector.
  @_s.JsonKey(name: 'dataSources')
  final DataSourceConfigurationsResult dataSources;

  /// The publishing frequency of the finding.
  @_s.JsonKey(name: 'findingPublishingFrequency')
  final FindingPublishingFrequency findingPublishingFrequency;

  /// The tags of the detector resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The last-updated timestamp for the detector.
  @_s.JsonKey(name: 'updatedAt')
  final String updatedAt;

  GetDetectorResponse({
    @_s.required this.serviceRole,
    @_s.required this.status,
    this.createdAt,
    this.dataSources,
    this.findingPublishingFrequency,
    this.tags,
    this.updatedAt,
  });
  factory GetDetectorResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDetectorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFilterResponse {
  /// Specifies the action that is to be applied to the findings that match the
  /// filter.
  @_s.JsonKey(name: 'action')
  final FilterAction action;

  /// Represents the criteria to be used in the filter for querying findings.
  @_s.JsonKey(name: 'findingCriteria')
  final FindingCriteria findingCriteria;

  /// The name of the filter.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The description of the filter.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Specifies the position of the filter in the list of current filters. Also
  /// specifies the order in which this filter is applied to the findings.
  @_s.JsonKey(name: 'rank')
  final int rank;

  /// The tags of the filter resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  GetFilterResponse({
    @_s.required this.action,
    @_s.required this.findingCriteria,
    @_s.required this.name,
    this.description,
    this.rank,
    this.tags,
  });
  factory GetFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFilterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFindingsResponse {
  /// A list of findings.
  @_s.JsonKey(name: 'findings')
  final List<Finding> findings;

  GetFindingsResponse({
    @_s.required this.findings,
  });
  factory GetFindingsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFindingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFindingsStatisticsResponse {
  /// The finding statistics object.
  @_s.JsonKey(name: 'findingStatistics')
  final FindingStatistics findingStatistics;

  GetFindingsStatisticsResponse({
    @_s.required this.findingStatistics,
  });
  factory GetFindingsStatisticsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFindingsStatisticsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetIPSetResponse {
  /// The format of the file that contains the IPSet.
  @_s.JsonKey(name: 'format')
  final IpSetFormat format;

  /// The URI of the file that contains the IPSet. For example:
  /// https://s3.us-west-2.amazonaws.com/my-bucket/my-object-key.
  @_s.JsonKey(name: 'location')
  final String location;

  /// The user-friendly name for the IPSet.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The status of IPSet file that was uploaded.
  @_s.JsonKey(name: 'status')
  final IpSetStatus status;

  /// The tags of the IPSet resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  GetIPSetResponse({
    @_s.required this.format,
    @_s.required this.location,
    @_s.required this.name,
    @_s.required this.status,
    this.tags,
  });
  factory GetIPSetResponse.fromJson(Map<String, dynamic> json) =>
      _$GetIPSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInvitationsCountResponse {
  /// The number of received invitations.
  @_s.JsonKey(name: 'invitationsCount')
  final int invitationsCount;

  GetInvitationsCountResponse({
    this.invitationsCount,
  });
  factory GetInvitationsCountResponse.fromJson(Map<String, dynamic> json) =>
      _$GetInvitationsCountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMasterAccountResponse {
  /// The administrator account details.
  @_s.JsonKey(name: 'master')
  final Master master;

  GetMasterAccountResponse({
    @_s.required this.master,
  });
  factory GetMasterAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMasterAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMemberDetectorsResponse {
  /// An object that describes which data sources are enabled for a member
  /// account.
  @_s.JsonKey(name: 'members')
  final List<MemberDataSourceConfiguration> memberDataSourceConfigurations;

  /// A list of member account IDs that were unable to be processed along with an
  /// explanation for why they were not processed.
  @_s.JsonKey(name: 'unprocessedAccounts')
  final List<UnprocessedAccount> unprocessedAccounts;

  GetMemberDetectorsResponse({
    @_s.required this.memberDataSourceConfigurations,
    @_s.required this.unprocessedAccounts,
  });
  factory GetMemberDetectorsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMemberDetectorsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMembersResponse {
  /// A list of members.
  @_s.JsonKey(name: 'members')
  final List<Member> members;

  /// A list of objects that contain the unprocessed account and a result string
  /// that explains why it was unprocessed.
  @_s.JsonKey(name: 'unprocessedAccounts')
  final List<UnprocessedAccount> unprocessedAccounts;

  GetMembersResponse({
    @_s.required this.members,
    @_s.required this.unprocessedAccounts,
  });
  factory GetMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMembersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetThreatIntelSetResponse {
  /// The format of the threatIntelSet.
  @_s.JsonKey(name: 'format')
  final ThreatIntelSetFormat format;

  /// The URI of the file that contains the ThreatIntelSet. For example:
  /// https://s3.us-west-2.amazonaws.com/my-bucket/my-object-key.
  @_s.JsonKey(name: 'location')
  final String location;

  /// A user-friendly ThreatIntelSet name displayed in all findings that are
  /// generated by activity that involves IP addresses included in this
  /// ThreatIntelSet.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The status of threatIntelSet file uploaded.
  @_s.JsonKey(name: 'status')
  final ThreatIntelSetStatus status;

  /// The tags of the threat list resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  GetThreatIntelSetResponse({
    @_s.required this.format,
    @_s.required this.location,
    @_s.required this.name,
    @_s.required this.status,
    this.tags,
  });
  factory GetThreatIntelSetResponse.fromJson(Map<String, dynamic> json) =>
      _$GetThreatIntelSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetUsageStatisticsResponse {
  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The usage statistics object. If a UsageStatisticType was provided, the
  /// objects representing other types will be null.
  @_s.JsonKey(name: 'usageStatistics')
  final UsageStatistics usageStatistics;

  GetUsageStatisticsResponse({
    this.nextToken,
    this.usageStatistics,
  });
  factory GetUsageStatisticsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUsageStatisticsResponseFromJson(json);
}

/// Contains information about the EC2 instance profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IamInstanceProfile {
  /// The profile ARN of the EC2 instance.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The profile ID of the EC2 instance.
  @_s.JsonKey(name: 'id')
  final String id;

  IamInstanceProfile({
    this.arn,
    this.id,
  });
  factory IamInstanceProfile.fromJson(Map<String, dynamic> json) =>
      _$IamInstanceProfileFromJson(json);
}

/// Contains information about the details of an instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceDetails {
  /// The Availability Zone of the EC2 instance.
  @_s.JsonKey(name: 'availabilityZone')
  final String availabilityZone;

  /// The profile information of the EC2 instance.
  @_s.JsonKey(name: 'iamInstanceProfile')
  final IamInstanceProfile iamInstanceProfile;

  /// The image description of the EC2 instance.
  @_s.JsonKey(name: 'imageDescription')
  final String imageDescription;

  /// The image ID of the EC2 instance.
  @_s.JsonKey(name: 'imageId')
  final String imageId;

  /// The ID of the EC2 instance.
  @_s.JsonKey(name: 'instanceId')
  final String instanceId;

  /// The state of the EC2 instance.
  @_s.JsonKey(name: 'instanceState')
  final String instanceState;

  /// The type of the EC2 instance.
  @_s.JsonKey(name: 'instanceType')
  final String instanceType;

  /// The launch time of the EC2 instance.
  @_s.JsonKey(name: 'launchTime')
  final String launchTime;

  /// The elastic network interface information of the EC2 instance.
  @_s.JsonKey(name: 'networkInterfaces')
  final List<NetworkInterface> networkInterfaces;

  /// The Amazon Resource Name (ARN) of the AWS Outpost. Only applicable to AWS
  /// Outposts instances.
  @_s.JsonKey(name: 'outpostArn')
  final String outpostArn;

  /// The platform of the EC2 instance.
  @_s.JsonKey(name: 'platform')
  final String platform;

  /// The product code of the EC2 instance.
  @_s.JsonKey(name: 'productCodes')
  final List<ProductCode> productCodes;

  /// The tags of the EC2 instance.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

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
  factory InstanceDetails.fromJson(Map<String, dynamic> json) =>
      _$InstanceDetailsFromJson(json);
}

/// Contains information about the invitation to become a member account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Invitation {
  /// The ID of the account that the invitation was sent from.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The ID of the invitation. This value is used to validate the inviter account
  /// to the member account.
  @_s.JsonKey(name: 'invitationId')
  final String invitationId;

  /// The timestamp when the invitation was sent.
  @_s.JsonKey(name: 'invitedAt')
  final String invitedAt;

  /// The status of the relationship between the inviter and invitee accounts.
  @_s.JsonKey(name: 'relationshipStatus')
  final String relationshipStatus;

  Invitation({
    this.accountId,
    this.invitationId,
    this.invitedAt,
    this.relationshipStatus,
  });
  factory Invitation.fromJson(Map<String, dynamic> json) =>
      _$InvitationFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InviteMembersResponse {
  /// A list of objects that contain the unprocessed account and a result string
  /// that explains why it was unprocessed.
  @_s.JsonKey(name: 'unprocessedAccounts')
  final List<UnprocessedAccount> unprocessedAccounts;

  InviteMembersResponse({
    @_s.required this.unprocessedAccounts,
  });
  factory InviteMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$InviteMembersResponseFromJson(json);
}

enum IpSetFormat {
  @_s.JsonValue('TXT')
  txt,
  @_s.JsonValue('STIX')
  stix,
  @_s.JsonValue('OTX_CSV')
  otxCsv,
  @_s.JsonValue('ALIEN_VAULT')
  alienVault,
  @_s.JsonValue('PROOF_POINT')
  proofPoint,
  @_s.JsonValue('FIRE_EYE')
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
    throw Exception('Unknown enum value: $this');
  }
}

enum IpSetStatus {
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('ACTIVATING')
  activating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DEACTIVATING')
  deactivating,
  @_s.JsonValue('ERROR')
  error,
  @_s.JsonValue('DELETE_PENDING')
  deletePending,
  @_s.JsonValue('DELETED')
  deleted,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDetectorsResponse {
  /// A list of detector IDs.
  @_s.JsonKey(name: 'detectorIds')
  final List<String> detectorIds;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDetectorsResponse({
    @_s.required this.detectorIds,
    this.nextToken,
  });
  factory ListDetectorsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDetectorsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFiltersResponse {
  /// A list of filter names.
  @_s.JsonKey(name: 'filterNames')
  final List<String> filterNames;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListFiltersResponse({
    @_s.required this.filterNames,
    this.nextToken,
  });
  factory ListFiltersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFiltersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFindingsResponse {
  /// The IDs of the findings that you're listing.
  @_s.JsonKey(name: 'findingIds')
  final List<String> findingIds;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListFindingsResponse({
    @_s.required this.findingIds,
    this.nextToken,
  });
  factory ListFindingsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFindingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListIPSetsResponse {
  /// The IDs of the IPSet resources.
  @_s.JsonKey(name: 'ipSetIds')
  final List<String> ipSetIds;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListIPSetsResponse({
    @_s.required this.ipSetIds,
    this.nextToken,
  });
  factory ListIPSetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListIPSetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInvitationsResponse {
  /// A list of invitation descriptions.
  @_s.JsonKey(name: 'invitations')
  final List<Invitation> invitations;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListInvitationsResponse({
    this.invitations,
    this.nextToken,
  });
  factory ListInvitationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListInvitationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMembersResponse {
  /// A list of members.
  @_s.JsonKey(name: 'members')
  final List<Member> members;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListMembersResponse({
    this.members,
    this.nextToken,
  });
  factory ListMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMembersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListOrganizationAdminAccountsResponse {
  /// A list of accounts configured as GuardDuty delegated administrators.
  @_s.JsonKey(name: 'adminAccounts')
  final List<AdminAccount> adminAccounts;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListOrganizationAdminAccountsResponse({
    this.adminAccounts,
    this.nextToken,
  });
  factory ListOrganizationAdminAccountsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListOrganizationAdminAccountsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPublishingDestinationsResponse {
  /// A <code>Destinations</code> object that includes information about each
  /// publishing destination returned.
  @_s.JsonKey(name: 'destinations')
  final List<Destination> destinations;

  /// A token to use for paginating results that are returned in the response. Set
  /// the value of this parameter to null for the first request to a list action.
  /// For subsequent calls, use the <code>NextToken</code> value returned from the
  /// previous request to continue listing results after the first page.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListPublishingDestinationsResponse({
    @_s.required this.destinations,
    this.nextToken,
  });
  factory ListPublishingDestinationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListPublishingDestinationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags associated with the resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListThreatIntelSetsResponse {
  /// The IDs of the ThreatIntelSet resources.
  @_s.JsonKey(name: 'threatIntelSetIds')
  final List<String> threatIntelSetIds;

  /// The pagination parameter to be used on the next list operation to retrieve
  /// more items.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListThreatIntelSetsResponse({
    @_s.required this.threatIntelSetIds,
    this.nextToken,
  });
  factory ListThreatIntelSetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListThreatIntelSetsResponseFromJson(json);
}

/// Contains information about the local IP address of the connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LocalIpDetails {
  /// The IPv4 local address of the connection.
  @_s.JsonKey(name: 'ipAddressV4')
  final String ipAddressV4;

  LocalIpDetails({
    this.ipAddressV4,
  });
  factory LocalIpDetails.fromJson(Map<String, dynamic> json) =>
      _$LocalIpDetailsFromJson(json);
}

/// Contains information about the port for the local connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LocalPortDetails {
  /// The port number of the local connection.
  @_s.JsonKey(name: 'port')
  final int port;

  /// The port name of the local connection.
  @_s.JsonKey(name: 'portName')
  final String portName;

  LocalPortDetails({
    this.port,
    this.portName,
  });
  factory LocalPortDetails.fromJson(Map<String, dynamic> json) =>
      _$LocalPortDetailsFromJson(json);
}

/// Contains information about the administrator account and invitation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Master {
  /// The ID of the account used as the administrator account.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The value used to validate the administrator account to the member account.
  @_s.JsonKey(name: 'invitationId')
  final String invitationId;

  /// The timestamp when the invitation was sent.
  @_s.JsonKey(name: 'invitedAt')
  final String invitedAt;

  /// The status of the relationship between the administrator and member
  /// accounts.
  @_s.JsonKey(name: 'relationshipStatus')
  final String relationshipStatus;

  Master({
    this.accountId,
    this.invitationId,
    this.invitedAt,
    this.relationshipStatus,
  });
  factory Master.fromJson(Map<String, dynamic> json) => _$MasterFromJson(json);
}

/// Contains information about the member account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Member {
  /// The ID of the member account.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The email address of the member account.
  @_s.JsonKey(name: 'email')
  final String email;

  /// The administrator account ID.
  @_s.JsonKey(name: 'masterId')
  final String masterId;

  /// The status of the relationship between the member and the administrator.
  @_s.JsonKey(name: 'relationshipStatus')
  final String relationshipStatus;

  /// The last-updated timestamp of the member.
  @_s.JsonKey(name: 'updatedAt')
  final String updatedAt;

  /// The detector ID of the member account.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The timestamp when the invitation was sent.
  @_s.JsonKey(name: 'invitedAt')
  final String invitedAt;

  Member({
    @_s.required this.accountId,
    @_s.required this.email,
    @_s.required this.masterId,
    @_s.required this.relationshipStatus,
    @_s.required this.updatedAt,
    this.detectorId,
    this.invitedAt,
  });
  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}

/// Contains information on which data sources are enabled for a member account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MemberDataSourceConfiguration {
  /// The account ID for the member account.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// Contains information on the status of data sources for the account.
  @_s.JsonKey(name: 'dataSources')
  final DataSourceConfigurationsResult dataSources;

  MemberDataSourceConfiguration({
    @_s.required this.accountId,
    @_s.required this.dataSources,
  });
  factory MemberDataSourceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$MemberDataSourceConfigurationFromJson(json);
}

/// Contains information about the NETWORK_CONNECTION action described in the
/// finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkConnectionAction {
  /// Indicates whether EC2 blocked the network connection to your instance.
  @_s.JsonKey(name: 'blocked')
  final bool blocked;

  /// The network connection direction.
  @_s.JsonKey(name: 'connectionDirection')
  final String connectionDirection;

  /// The local IP information of the connection.
  @_s.JsonKey(name: 'localIpDetails')
  final LocalIpDetails localIpDetails;

  /// The local port information of the connection.
  @_s.JsonKey(name: 'localPortDetails')
  final LocalPortDetails localPortDetails;

  /// The network connection protocol.
  @_s.JsonKey(name: 'protocol')
  final String protocol;

  /// The remote IP information of the connection.
  @_s.JsonKey(name: 'remoteIpDetails')
  final RemoteIpDetails remoteIpDetails;

  /// The remote port information of the connection.
  @_s.JsonKey(name: 'remotePortDetails')
  final RemotePortDetails remotePortDetails;

  NetworkConnectionAction({
    this.blocked,
    this.connectionDirection,
    this.localIpDetails,
    this.localPortDetails,
    this.protocol,
    this.remoteIpDetails,
    this.remotePortDetails,
  });
  factory NetworkConnectionAction.fromJson(Map<String, dynamic> json) =>
      _$NetworkConnectionActionFromJson(json);
}

/// Contains information about the elastic network interface of the EC2
/// instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkInterface {
  /// A list of IPv6 addresses for the EC2 instance.
  @_s.JsonKey(name: 'ipv6Addresses')
  final List<String> ipv6Addresses;

  /// The ID of the network interface.
  @_s.JsonKey(name: 'networkInterfaceId')
  final String networkInterfaceId;

  /// The private DNS name of the EC2 instance.
  @_s.JsonKey(name: 'privateDnsName')
  final String privateDnsName;

  /// The private IP address of the EC2 instance.
  @_s.JsonKey(name: 'privateIpAddress')
  final String privateIpAddress;

  /// Other private IP address information of the EC2 instance.
  @_s.JsonKey(name: 'privateIpAddresses')
  final List<PrivateIpAddressDetails> privateIpAddresses;

  /// The public DNS name of the EC2 instance.
  @_s.JsonKey(name: 'publicDnsName')
  final String publicDnsName;

  /// The public IP address of the EC2 instance.
  @_s.JsonKey(name: 'publicIp')
  final String publicIp;

  /// The security groups associated with the EC2 instance.
  @_s.JsonKey(name: 'securityGroups')
  final List<SecurityGroup> securityGroups;

  /// The subnet ID of the EC2 instance.
  @_s.JsonKey(name: 'subnetId')
  final String subnetId;

  /// The VPC ID of the EC2 instance.
  @_s.JsonKey(name: 'vpcId')
  final String vpcId;

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
  factory NetworkInterface.fromJson(Map<String, dynamic> json) =>
      _$NetworkInterfaceFromJson(json);
}

enum OrderBy {
  @_s.JsonValue('ASC')
  asc,
  @_s.JsonValue('DESC')
  desc,
}

/// Contains information about the ISP organization of the remote IP address.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Organization {
  /// The Autonomous System Number (ASN) of the internet provider of the remote IP
  /// address.
  @_s.JsonKey(name: 'asn')
  final String asn;

  /// The organization that registered this ASN.
  @_s.JsonKey(name: 'asnOrg')
  final String asnOrg;

  /// The ISP information for the internet provider.
  @_s.JsonKey(name: 'isp')
  final String isp;

  /// The name of the internet provider.
  @_s.JsonKey(name: 'org')
  final String org;

  Organization({
    this.asn,
    this.asnOrg,
    this.isp,
    this.org,
  });
  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);
}

/// An object that contains information on which data sources will be configured
/// to be automatically enabled for new members within the organization.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class OrganizationDataSourceConfigurations {
  /// Describes whether S3 data event logs are enabled for new members of the
  /// organization.
  @_s.JsonKey(name: 's3Logs')
  final OrganizationS3LogsConfiguration s3Logs;

  OrganizationDataSourceConfigurations({
    this.s3Logs,
  });
  Map<String, dynamic> toJson() =>
      _$OrganizationDataSourceConfigurationsToJson(this);
}

/// An object that contains information on which data sources are automatically
/// enabled for new members within the organization.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OrganizationDataSourceConfigurationsResult {
  /// Describes whether S3 data event logs are enabled as a data source.
  @_s.JsonKey(name: 's3Logs')
  final OrganizationS3LogsConfigurationResult s3Logs;

  OrganizationDataSourceConfigurationsResult({
    @_s.required this.s3Logs,
  });
  factory OrganizationDataSourceConfigurationsResult.fromJson(
          Map<String, dynamic> json) =>
      _$OrganizationDataSourceConfigurationsResultFromJson(json);
}

/// Describes whether S3 data event logs will be automatically enabled for new
/// members of the organization.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class OrganizationS3LogsConfiguration {
  /// A value that contains information on whether S3 data event logs will be
  /// enabled automatically as a data source for the organization.
  @_s.JsonKey(name: 'autoEnable')
  final bool autoEnable;

  OrganizationS3LogsConfiguration({
    @_s.required this.autoEnable,
  });
  Map<String, dynamic> toJson() =>
      _$OrganizationS3LogsConfigurationToJson(this);
}

/// The current configuration of S3 data event logs as a data source for the
/// organization.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OrganizationS3LogsConfigurationResult {
  /// A value that describes whether S3 data event logs are automatically enabled
  /// for new members of the organization.
  @_s.JsonKey(name: 'autoEnable')
  final bool autoEnable;

  OrganizationS3LogsConfigurationResult({
    @_s.required this.autoEnable,
  });
  factory OrganizationS3LogsConfigurationResult.fromJson(
          Map<String, dynamic> json) =>
      _$OrganizationS3LogsConfigurationResultFromJson(json);
}

/// Contains information on the owner of the bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Owner {
  /// The canonical user ID of the bucket owner. For information about locating
  /// your canonical user ID see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/acct-identifiers.html#FindingCanonicalId">Finding
  /// Your Account Canonical User ID.</a>
  @_s.JsonKey(name: 'id')
  final String id;

  Owner({
    this.id,
  });
  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}

/// Contains information about how permissions are configured for the S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PermissionConfiguration {
  /// Contains information about the account level permissions on the S3 bucket.
  @_s.JsonKey(name: 'accountLevelPermissions')
  final AccountLevelPermissions accountLevelPermissions;

  /// Contains information about the bucket level permissions for the S3 bucket.
  @_s.JsonKey(name: 'bucketLevelPermissions')
  final BucketLevelPermissions bucketLevelPermissions;

  PermissionConfiguration({
    this.accountLevelPermissions,
    this.bucketLevelPermissions,
  });
  factory PermissionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$PermissionConfigurationFromJson(json);
}

/// Contains information about the PORT_PROBE action described in the finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PortProbeAction {
  /// Indicates whether EC2 blocked the port probe to the instance, such as with
  /// an ACL.
  @_s.JsonKey(name: 'blocked')
  final bool blocked;

  /// A list of objects related to port probe details.
  @_s.JsonKey(name: 'portProbeDetails')
  final List<PortProbeDetail> portProbeDetails;

  PortProbeAction({
    this.blocked,
    this.portProbeDetails,
  });
  factory PortProbeAction.fromJson(Map<String, dynamic> json) =>
      _$PortProbeActionFromJson(json);
}

/// Contains information about the port probe details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PortProbeDetail {
  /// The local IP information of the connection.
  @_s.JsonKey(name: 'localIpDetails')
  final LocalIpDetails localIpDetails;

  /// The local port information of the connection.
  @_s.JsonKey(name: 'localPortDetails')
  final LocalPortDetails localPortDetails;

  /// The remote IP information of the connection.
  @_s.JsonKey(name: 'remoteIpDetails')
  final RemoteIpDetails remoteIpDetails;

  PortProbeDetail({
    this.localIpDetails,
    this.localPortDetails,
    this.remoteIpDetails,
  });
  factory PortProbeDetail.fromJson(Map<String, dynamic> json) =>
      _$PortProbeDetailFromJson(json);
}

/// Contains other private IP address information of the EC2 instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PrivateIpAddressDetails {
  /// The private DNS name of the EC2 instance.
  @_s.JsonKey(name: 'privateDnsName')
  final String privateDnsName;

  /// The private IP address of the EC2 instance.
  @_s.JsonKey(name: 'privateIpAddress')
  final String privateIpAddress;

  PrivateIpAddressDetails({
    this.privateDnsName,
    this.privateIpAddress,
  });
  factory PrivateIpAddressDetails.fromJson(Map<String, dynamic> json) =>
      _$PrivateIpAddressDetailsFromJson(json);
}

/// Contains information about the product code for the EC2 instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProductCode {
  /// The product code information.
  @_s.JsonKey(name: 'code')
  final String code;

  /// The product code type.
  @_s.JsonKey(name: 'productType')
  final String productType;

  ProductCode({
    this.code,
    this.productType,
  });
  factory ProductCode.fromJson(Map<String, dynamic> json) =>
      _$ProductCodeFromJson(json);
}

/// Describes the public access policies that apply to the S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PublicAccess {
  /// Describes the effective permission on this bucket after factoring all
  /// attached policies.
  @_s.JsonKey(name: 'effectivePermission')
  final String effectivePermission;

  /// Contains information about how permissions are configured for the S3 bucket.
  @_s.JsonKey(name: 'permissionConfiguration')
  final PermissionConfiguration permissionConfiguration;

  PublicAccess({
    this.effectivePermission,
    this.permissionConfiguration,
  });
  factory PublicAccess.fromJson(Map<String, dynamic> json) =>
      _$PublicAccessFromJson(json);
}

enum PublishingStatus {
  @_s.JsonValue('PENDING_VERIFICATION')
  pendingVerification,
  @_s.JsonValue('PUBLISHING')
  publishing,
  @_s.JsonValue('UNABLE_TO_PUBLISH_FIX_DESTINATION_PROPERTY')
  unableToPublishFixDestinationProperty,
  @_s.JsonValue('STOPPED')
  stopped,
}

/// Contains information about the remote IP address of the connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoteIpDetails {
  /// The city information of the remote IP address.
  @_s.JsonKey(name: 'city')
  final City city;

  /// The country code of the remote IP address.
  @_s.JsonKey(name: 'country')
  final Country country;

  /// The location information of the remote IP address.
  @_s.JsonKey(name: 'geoLocation')
  final GeoLocation geoLocation;

  /// The IPv4 remote address of the connection.
  @_s.JsonKey(name: 'ipAddressV4')
  final String ipAddressV4;

  /// The ISP organization information of the remote IP address.
  @_s.JsonKey(name: 'organization')
  final Organization organization;

  RemoteIpDetails({
    this.city,
    this.country,
    this.geoLocation,
    this.ipAddressV4,
    this.organization,
  });
  factory RemoteIpDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteIpDetailsFromJson(json);
}

/// Contains information about the remote port.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemotePortDetails {
  /// The port number of the remote connection.
  @_s.JsonKey(name: 'port')
  final int port;

  /// The port name of the remote connection.
  @_s.JsonKey(name: 'portName')
  final String portName;

  RemotePortDetails({
    this.port,
    this.portName,
  });
  factory RemotePortDetails.fromJson(Map<String, dynamic> json) =>
      _$RemotePortDetailsFromJson(json);
}

/// Contains information about the AWS resource associated with the activity
/// that prompted GuardDuty to generate a finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Resource {
  /// The IAM access key details (IAM user information) of a user that engaged in
  /// the activity that prompted GuardDuty to generate a finding.
  @_s.JsonKey(name: 'accessKeyDetails')
  final AccessKeyDetails accessKeyDetails;

  /// The information about the EC2 instance associated with the activity that
  /// prompted GuardDuty to generate a finding.
  @_s.JsonKey(name: 'instanceDetails')
  final InstanceDetails instanceDetails;

  /// The type of AWS resource.
  @_s.JsonKey(name: 'resourceType')
  final String resourceType;

  /// Contains information on the S3 bucket.
  @_s.JsonKey(name: 's3BucketDetails')
  final List<S3BucketDetail> s3BucketDetails;

  Resource({
    this.accessKeyDetails,
    this.instanceDetails,
    this.resourceType,
    this.s3BucketDetails,
  });
  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);
}

/// Contains information on the S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class S3BucketDetail {
  /// The Amazon Resource Name (ARN) of the S3 bucket.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date and time the bucket was created at.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// Describes the server side encryption method used in the S3 bucket.
  @_s.JsonKey(name: 'defaultServerSideEncryption')
  final DefaultServerSideEncryption defaultServerSideEncryption;

  /// The name of the S3 bucket.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The owner of the S3 bucket.
  @_s.JsonKey(name: 'owner')
  final Owner owner;

  /// Describes the public access policies that apply to the S3 bucket.
  @_s.JsonKey(name: 'publicAccess')
  final PublicAccess publicAccess;

  /// All tags attached to the S3 bucket
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  /// Describes whether the bucket is a source or destination bucket.
  @_s.JsonKey(name: 'type')
  final String type;

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
  factory S3BucketDetail.fromJson(Map<String, dynamic> json) =>
      _$S3BucketDetailFromJson(json);
}

/// Describes whether S3 data event logs will be enabled as a data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class S3LogsConfiguration {
  /// The status of S3 data event logs as a data source.
  @_s.JsonKey(name: 'enable')
  final bool enable;

  S3LogsConfiguration({
    @_s.required this.enable,
  });
  Map<String, dynamic> toJson() => _$S3LogsConfigurationToJson(this);
}

/// Describes whether S3 data event logs will be enabled as a data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class S3LogsConfigurationResult {
  /// A value that describes whether S3 data event logs are automatically enabled
  /// for new members of the organization.
  @_s.JsonKey(name: 'status')
  final DataSourceStatus status;

  S3LogsConfigurationResult({
    @_s.required this.status,
  });
  factory S3LogsConfigurationResult.fromJson(Map<String, dynamic> json) =>
      _$S3LogsConfigurationResultFromJson(json);
}

/// Contains information about the security groups associated with the EC2
/// instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SecurityGroup {
  /// The security group ID of the EC2 instance.
  @_s.JsonKey(name: 'groupId')
  final String groupId;

  /// The security group name of the EC2 instance.
  @_s.JsonKey(name: 'groupName')
  final String groupName;

  SecurityGroup({
    this.groupId,
    this.groupName,
  });
  factory SecurityGroup.fromJson(Map<String, dynamic> json) =>
      _$SecurityGroupFromJson(json);
}

/// Contains additional information about the generated finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Service {
  /// Information about the activity that is described in a finding.
  @_s.JsonKey(name: 'action')
  final Action action;

  /// Indicates whether this finding is archived.
  @_s.JsonKey(name: 'archived')
  final bool archived;

  /// The total count of the occurrences of this finding type.
  @_s.JsonKey(name: 'count')
  final int count;

  /// The detector ID for the GuardDuty service.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// The first-seen timestamp of the activity that prompted GuardDuty to generate
  /// this finding.
  @_s.JsonKey(name: 'eventFirstSeen')
  final String eventFirstSeen;

  /// The last-seen timestamp of the activity that prompted GuardDuty to generate
  /// this finding.
  @_s.JsonKey(name: 'eventLastSeen')
  final String eventLastSeen;

  /// An evidence object associated with the service.
  @_s.JsonKey(name: 'evidence')
  final Evidence evidence;

  /// The resource role information for this finding.
  @_s.JsonKey(name: 'resourceRole')
  final String resourceRole;

  /// The name of the AWS service (GuardDuty) that generated a finding.
  @_s.JsonKey(name: 'serviceName')
  final String serviceName;

  /// Feedback that was submitted about the finding.
  @_s.JsonKey(name: 'userFeedback')
  final String userFeedback;

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
  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

/// Contains information about the criteria used for sorting findings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SortCriteria {
  /// Represents the finding attribute (for example, accountId) to sort findings
  /// by.
  @_s.JsonKey(name: 'attributeName')
  final String attributeName;

  /// The order by which the sorted findings are to be displayed.
  @_s.JsonKey(name: 'orderBy')
  final OrderBy orderBy;

  SortCriteria({
    this.attributeName,
    this.orderBy,
  });
  Map<String, dynamic> toJson() => _$SortCriteriaToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartMonitoringMembersResponse {
  /// A list of objects that contain the unprocessed account and a result string
  /// that explains why it was unprocessed.
  @_s.JsonKey(name: 'unprocessedAccounts')
  final List<UnprocessedAccount> unprocessedAccounts;

  StartMonitoringMembersResponse({
    @_s.required this.unprocessedAccounts,
  });
  factory StartMonitoringMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$StartMonitoringMembersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopMonitoringMembersResponse {
  /// A list of objects that contain an accountId for each account that could not
  /// be processed, and a result string that indicates why the account was not
  /// processed.
  @_s.JsonKey(name: 'unprocessedAccounts')
  final List<UnprocessedAccount> unprocessedAccounts;

  StopMonitoringMembersResponse({
    @_s.required this.unprocessedAccounts,
  });
  factory StopMonitoringMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$StopMonitoringMembersResponseFromJson(json);
}

/// Contains information about a tag associated with the EC2 instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Tag {
  /// The EC2 instance tag key.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The EC2 instance tag value.
  @_s.JsonKey(name: 'value')
  final String value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

enum ThreatIntelSetFormat {
  @_s.JsonValue('TXT')
  txt,
  @_s.JsonValue('STIX')
  stix,
  @_s.JsonValue('OTX_CSV')
  otxCsv,
  @_s.JsonValue('ALIEN_VAULT')
  alienVault,
  @_s.JsonValue('PROOF_POINT')
  proofPoint,
  @_s.JsonValue('FIRE_EYE')
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
    throw Exception('Unknown enum value: $this');
  }
}

enum ThreatIntelSetStatus {
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('ACTIVATING')
  activating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DEACTIVATING')
  deactivating,
  @_s.JsonValue('ERROR')
  error,
  @_s.JsonValue('DELETE_PENDING')
  deletePending,
  @_s.JsonValue('DELETED')
  deleted,
}

/// An instance of a threat intelligence detail that constitutes evidence for
/// the finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ThreatIntelligenceDetail {
  /// The name of the threat intelligence list that triggered the finding.
  @_s.JsonKey(name: 'threatListName')
  final String threatListName;

  /// A list of names of the threats in the threat intelligence list that
  /// triggered the finding.
  @_s.JsonKey(name: 'threatNames')
  final List<String> threatNames;

  ThreatIntelligenceDetail({
    this.threatListName,
    this.threatNames,
  });
  factory ThreatIntelligenceDetail.fromJson(Map<String, dynamic> json) =>
      _$ThreatIntelligenceDetailFromJson(json);
}

/// Contains the total usage with the corresponding currency unit for that
/// value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Total {
  /// The total usage.
  @_s.JsonKey(name: 'amount')
  final String amount;

  /// The currency unit that the amount is given in.
  @_s.JsonKey(name: 'unit')
  final String unit;

  Total({
    this.amount,
    this.unit,
  });
  factory Total.fromJson(Map<String, dynamic> json) => _$TotalFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UnarchiveFindingsResponse {
  UnarchiveFindingsResponse();
  factory UnarchiveFindingsResponse.fromJson(Map<String, dynamic> json) =>
      _$UnarchiveFindingsResponseFromJson(json);
}

/// Contains information about the accounts that weren't processed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UnprocessedAccount {
  /// The AWS account ID.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// A reason why the account hasn't been processed.
  @_s.JsonKey(name: 'result')
  final String result;

  UnprocessedAccount({
    @_s.required this.accountId,
    @_s.required this.result,
  });
  factory UnprocessedAccount.fromJson(Map<String, dynamic> json) =>
      _$UnprocessedAccountFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDetectorResponse {
  UpdateDetectorResponse();
  factory UpdateDetectorResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDetectorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFilterResponse {
  /// The name of the filter.
  @_s.JsonKey(name: 'name')
  final String name;

  UpdateFilterResponse({
    @_s.required this.name,
  });
  factory UpdateFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateFilterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateFindingsFeedbackResponse {
  UpdateFindingsFeedbackResponse();
  factory UpdateFindingsFeedbackResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateFindingsFeedbackResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateIPSetResponse {
  UpdateIPSetResponse();
  factory UpdateIPSetResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateIPSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateMemberDetectorsResponse {
  /// A list of member account IDs that were unable to be processed along with an
  /// explanation for why they were not processed.
  @_s.JsonKey(name: 'unprocessedAccounts')
  final List<UnprocessedAccount> unprocessedAccounts;

  UpdateMemberDetectorsResponse({
    @_s.required this.unprocessedAccounts,
  });
  factory UpdateMemberDetectorsResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateMemberDetectorsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateOrganizationConfigurationResponse {
  UpdateOrganizationConfigurationResponse();
  factory UpdateOrganizationConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateOrganizationConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePublishingDestinationResponse {
  UpdatePublishingDestinationResponse();
  factory UpdatePublishingDestinationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatePublishingDestinationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateThreatIntelSetResponse {
  UpdateThreatIntelSetResponse();
  factory UpdateThreatIntelSetResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateThreatIntelSetResponseFromJson(json);
}

/// Contains information on the total of usage based on account IDs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UsageAccountResult {
  /// The Account ID that generated usage.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// Represents the total of usage for the Account ID.
  @_s.JsonKey(name: 'total')
  final Total total;

  UsageAccountResult({
    this.accountId,
    this.total,
  });
  factory UsageAccountResult.fromJson(Map<String, dynamic> json) =>
      _$UsageAccountResultFromJson(json);
}

/// Contains information about the criteria used to query usage statistics.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UsageCriteria {
  /// The data sources to aggregate usage statistics from.
  @_s.JsonKey(name: 'dataSources')
  final List<DataSource> dataSources;

  /// The account IDs to aggregate usage statistics from.
  @_s.JsonKey(name: 'accountIds')
  final List<String> accountIds;

  /// The resources to aggregate usage statistics from. Only accepts exact
  /// resource names.
  @_s.JsonKey(name: 'resources')
  final List<String> resources;

  UsageCriteria({
    @_s.required this.dataSources,
    this.accountIds,
    this.resources,
  });
  Map<String, dynamic> toJson() => _$UsageCriteriaToJson(this);
}

/// Contains information on the result of usage based on data source type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UsageDataSourceResult {
  /// The data source type that generated usage.
  @_s.JsonKey(name: 'dataSource')
  final DataSource dataSource;

  /// Represents the total of usage for the specified data source.
  @_s.JsonKey(name: 'total')
  final Total total;

  UsageDataSourceResult({
    this.dataSource,
    this.total,
  });
  factory UsageDataSourceResult.fromJson(Map<String, dynamic> json) =>
      _$UsageDataSourceResultFromJson(json);
}

/// Contains information on the sum of usage based on an AWS resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UsageResourceResult {
  /// The AWS resource that generated usage.
  @_s.JsonKey(name: 'resource')
  final String resource;

  /// Represents the sum total of usage for the specified resource type.
  @_s.JsonKey(name: 'total')
  final Total total;

  UsageResourceResult({
    this.resource,
    this.total,
  });
  factory UsageResourceResult.fromJson(Map<String, dynamic> json) =>
      _$UsageResourceResultFromJson(json);
}

enum UsageStatisticType {
  @_s.JsonValue('SUM_BY_ACCOUNT')
  sumByAccount,
  @_s.JsonValue('SUM_BY_DATA_SOURCE')
  sumByDataSource,
  @_s.JsonValue('SUM_BY_RESOURCE')
  sumByResource,
  @_s.JsonValue('TOP_RESOURCES')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains the result of GuardDuty usage. If a UsageStatisticType is provided
/// the result for other types will be null.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UsageStatistics {
  /// The usage statistic sum organized by account ID.
  @_s.JsonKey(name: 'sumByAccount')
  final List<UsageAccountResult> sumByAccount;

  /// The usage statistic sum organized by on data source.
  @_s.JsonKey(name: 'sumByDataSource')
  final List<UsageDataSourceResult> sumByDataSource;

  /// The usage statistic sum organized by resource.
  @_s.JsonKey(name: 'sumByResource')
  final List<UsageResourceResult> sumByResource;

  /// Lists the top 50 resources that have generated the most GuardDuty usage, in
  /// order from most to least expensive.
  @_s.JsonKey(name: 'topResources')
  final List<UsageResourceResult> topResources;

  UsageStatistics({
    this.sumByAccount,
    this.sumByDataSource,
    this.sumByResource,
    this.topResources,
  });
  factory UsageStatistics.fromJson(Map<String, dynamic> json) =>
      _$UsageStatisticsFromJson(json);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String type, String message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
};

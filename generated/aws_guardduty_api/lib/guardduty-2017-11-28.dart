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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'guardduty-2017-11-28.g.dart';

/// Amazon GuardDuty is a continuous security monitoring service that analyzes
/// and processes the following data sources: VPC Flow Logs, AWS CloudTrail
/// event logs, and DNS logs. It uses threat intelligence feeds, such as lists
/// of malicious IPs and domains, and machine learning to identify unexpected
/// and potentially unauthorized and malicious activity within your AWS
/// environment. This can include issues like escalations of privileges, uses of
/// exposed credentials, or communication with malicious IPs, URLs, or domains.
/// For example, GuardDuty can detect compromised EC2 instances serving malware
/// or mining bitcoin. It also monitors AWS account access behavior for signs of
/// compromise, such as unauthorized infrastructure deployments, like instances
/// deployed in a region that has never been used, or unusual API calls, like a
/// password policy change to reduce password strength. GuardDuty informs you of
/// the status of your AWS environment by producing security findings that you
/// can view in the GuardDuty console or through Amazon CloudWatch events. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/guardduty/latest/ug/what-is-guardduty.html">Amazon
/// GuardDuty User Guide</a>.
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

  /// Accepts the invitation to be monitored by a master GuardDuty account.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty member account.
  ///
  /// Parameter [invitationId] :
  /// This value is used to validate the master account to the member account.
  ///
  /// Parameter [masterId] :
  /// The account ID of the master GuardDuty account whose invitation you're
  /// accepting.
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
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/master',
      exceptionFnMap: _exceptionFns,
    );
    return AcceptInvitationResponse.fromJson(response);
  }

  /// Archives GuardDuty findings specified by the list of finding IDs.
  /// <note>
  /// Only the master account can archive findings. Member accounts do not have
  /// permission to archive findings from their accounts.
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
  /// IDs of the findings that you want to archive.
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
          '/detector/${Uri.encodeComponent(detectorId.toString())}/findings/archive',
      exceptionFnMap: _exceptionFns,
    );
    return ArchiveFindingsResponse.fromJson(response);
  }

  /// Creates a single Amazon GuardDuty detector. A detector is a resource that
  /// represents the GuardDuty service. To start using GuardDuty, you must
  /// create a detector in each region that you enable the service. You can have
  /// only one detector per account per region.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [enable] :
  /// A boolean value that specifies whether the detector is to be enabled.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token for the create request.
  ///
  /// Parameter [findingPublishingFrequency] :
  /// A enum value that specifies how frequently customer got Finding updates
  /// published.
  ///
  /// Parameter [tags] :
  /// The tags to be added to a new detector resource.
  Future<CreateDetectorResponse> createDetector({
    @_s.required bool enable,
    String clientToken,
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
      if (clientToken != null) 'clientToken': clientToken,
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
  /// The unique ID of the detector of the GuardDuty account for which you want
  /// to create a filter.
  ///
  /// Parameter [findingCriteria] :
  /// Represents the criteria to be used in the filter for querying findings.
  ///
  /// Parameter [name] :
  /// The name of the filter.
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
      if (clientToken != null) 'clientToken': clientToken,
      if (description != null) 'description': description,
      if (rank != null) 'rank': rank,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/filter',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFilterResponse.fromJson(response);
  }

  /// Creates a new IPSet, called Trusted IP list in the consoler user
  /// interface. An IPSet is a list IP addresses trusted for secure
  /// communication with AWS infrastructure and applications. GuardDuty does not
  /// generate findings for IP addresses included in IPSets. Only users from the
  /// master account can use this operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [activate] :
  /// A boolean value that indicates whether GuardDuty is to start using the
  /// uploaded IPSet.
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty account for which you want
  /// to create an IPSet.
  ///
  /// Parameter [format] :
  /// The format of the file that contains the IPSet.
  ///
  /// Parameter [location] :
  /// The URI of the file that contains the IPSet. For example
  /// (https://s3.us-west-2.amazonaws.com/my-bucket/my-object-key)
  ///
  /// Parameter [name] :
  /// The user friendly name to identify the IPSet. This name is displayed in
  /// all findings that are triggered by activity that involves IP addresses
  /// included in this IPSet.
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
      if (clientToken != null) 'clientToken': clientToken,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/ipset',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIPSetResponse.fromJson(response);
  }

  /// Creates member accounts of the current AWS account by specifying a list of
  /// AWS account IDs. The current AWS account can then invite these members to
  /// manage GuardDuty in their accounts.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [accountDetails] :
  /// A list of account ID and email address pairs of the accounts that you want
  /// to associate with the master GuardDuty account.
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty account with which you want
  /// to associate member accounts.
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
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/member',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMembersResponse.fromJson(response);
  }

  /// Creates a publishing destination to send findings to. The resource to send
  /// findings to must exist before you use this operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [destinationProperties] :
  /// Properties of the publishing destination, including the ARNs for the
  /// destination and the KMS key used for encryption.
  ///
  /// Parameter [destinationType] :
  /// The type of resource for the publishing destination. Currently only S3 is
  /// supported.
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
      if (clientToken != null) 'clientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/publishingDestination',
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
  /// Types of sample findings to generate.
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
          '/detector/${Uri.encodeComponent(detectorId.toString())}/findings/create',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSampleFindingsResponse.fromJson(response);
  }

  /// Create a new ThreatIntelSet. ThreatIntelSets consist of known malicious IP
  /// addresses. GuardDuty generates findings based on ThreatIntelSets. Only
  /// users of the master account can use this operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [activate] :
  /// A boolean value that indicates whether GuardDuty is to start using the
  /// uploaded ThreatIntelSet.
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty account for which you want
  /// to create a threatIntelSet.
  ///
  /// Parameter [format] :
  /// The format of the file that contains the ThreatIntelSet.
  ///
  /// Parameter [location] :
  /// The URI of the file that contains the ThreatIntelSet. For example
  /// (https://s3.us-west-2.amazonaws.com/my-bucket/my-object-key).
  ///
  /// Parameter [name] :
  /// A user-friendly ThreatIntelSet name that is displayed in all finding
  /// generated by activity that involves IP addresses included in this
  /// ThreatIntelSet.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token for the create request.
  ///
  /// Parameter [tags] :
  /// The tags to be added to a new Threat List resource.
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
      if (clientToken != null) 'clientToken': clientToken,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/threatintelset',
      exceptionFnMap: _exceptionFns,
    );
    return CreateThreatIntelSetResponse.fromJson(response);
  }

  /// Declines invitations sent to the current member account by AWS account
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

  /// Deletes a Amazon GuardDuty detector specified by the detector ID.
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
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/detector/${Uri.encodeComponent(detectorId.toString())}',
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
  /// The unique ID of the detector the filter is associated with.
  ///
  /// Parameter [filterName] :
  /// The name of the filter you want to delete.
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
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/filter/${Uri.encodeComponent(filterName.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteFilterResponse.fromJson(response);
  }

  /// Deletes the IPSet specified by the <code>ipSetId</code>. IPSets are called
  /// Trusted IP lists in the console user interface.
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
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/ipset/${Uri.encodeComponent(ipSetId.toString())}',
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

  /// Deletes GuardDuty member accounts (to the current GuardDuty master
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
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/member/delete',
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
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/publishingDestination/${Uri.encodeComponent(destinationId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePublishingDestinationResponse.fromJson(response);
  }

  /// Deletes ThreatIntelSet specified by the ThreatIntelSet ID.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector the threatIntelSet is associated with.
  ///
  /// Parameter [threatIntelSetId] :
  /// The unique ID of the threatIntelSet you want to delete.
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
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/threatintelset/${Uri.encodeComponent(threatIntelSetId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteThreatIntelSetResponse.fromJson(response);
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
          '/detector/${Uri.encodeComponent(detectorId.toString())}/publishingDestination/${Uri.encodeComponent(destinationId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribePublishingDestinationResponse.fromJson(response);
  }

  /// Disassociates the current GuardDuty member account from its master
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
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/master/disassociate',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateFromMasterAccountResponse.fromJson(response);
  }

  /// Disassociates GuardDuty member accounts (to the current GuardDuty master
  /// account) specified by the account IDs.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [accountIds] :
  /// A list of account IDs of the GuardDuty member accounts that you want to
  /// disassociate from master.
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty account whose members you
  /// want to disassociate from master.
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
          '/detector/${Uri.encodeComponent(detectorId.toString())}/member/disassociate',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateMembersResponse.fromJson(response);
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
      requestUri: '/detector/${Uri.encodeComponent(detectorId.toString())}',
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
  /// The unique ID of the detector the filter is associated with.
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
          '/detector/${Uri.encodeComponent(detectorId.toString())}/filter/${Uri.encodeComponent(filterName.toString())}',
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
  /// IDs of the findings that you want to retrieve.
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
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/findings/get',
      exceptionFnMap: _exceptionFns,
    );
    return GetFindingsResponse.fromJson(response);
  }

  /// Lists Amazon GuardDuty findings' statistics for the specified detector ID.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The ID of the detector that specifies the GuardDuty service whose
  /// findings' statistics you want to retrieve.
  ///
  /// Parameter [findingStatisticTypes] :
  /// Types of finding statistics to retrieve.
  ///
  /// Parameter [findingCriteria] :
  /// Represents the criteria used for querying findings.
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
          '/detector/${Uri.encodeComponent(detectorId.toString())}/findings/statistics',
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
  /// The unique ID of the detector the ipSet is associated with.
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
          '/detector/${Uri.encodeComponent(detectorId.toString())}/ipset/${Uri.encodeComponent(ipSetId.toString())}',
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

  /// Provides the details for the GuardDuty master account associated with the
  /// current GuardDuty member account.
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
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/master',
      exceptionFnMap: _exceptionFns,
    );
    return GetMasterAccountResponse.fromJson(response);
  }

  /// Retrieves GuardDuty member accounts (to the current GuardDuty master
  /// account) specified by the account IDs.
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
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/member/get',
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
  /// The unique ID of the detector the threatIntelSet is associated with.
  ///
  /// Parameter [threatIntelSetId] :
  /// The unique ID of the threatIntelSet you want to get.
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
          '/detector/${Uri.encodeComponent(detectorId.toString())}/threatintelset/${Uri.encodeComponent(threatIntelSetId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetThreatIntelSetResponse.fromJson(response);
  }

  /// Invites other AWS accounts (created as members of the current AWS account
  /// by CreateMembers) to enable GuardDuty and allow the current AWS account to
  /// view and manage these accounts' GuardDuty findings on their behalf as the
  /// master account.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [accountIds] :
  /// A list of account IDs of the accounts that you want to invite to GuardDuty
  /// as members.
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty account with which you want
  /// to invite members.
  ///
  /// Parameter [disableEmailNotification] :
  /// A boolean value that specifies whether you want to disable email
  /// notification to the accounts that you’re inviting to GuardDuty as members.
  ///
  /// Parameter [message] :
  /// The invitation message that you want to send to the accounts that you’re
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
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/member/invite',
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
  /// You can use this parameter to indicate the maximum number of items you
  /// want in the response. The default value is 50. The maximum value is 50.
  ///
  /// Parameter [nextToken] :
  /// You can use this parameter when paginating results. Set the value of this
  /// parameter to null on your first call to the list action. For subsequent
  /// calls to the action fill nextToken in the request with the value of
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/detector$_query',
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
  /// The unique ID of the detector the filter is associated with.
  ///
  /// Parameter [maxResults] :
  /// You can use this parameter to indicate the maximum number of items you
  /// want in the response. The default value is 50. The maximum value is 50.
  ///
  /// Parameter [nextToken] :
  /// You can use this parameter when paginating results. Set the value of this
  /// parameter to null on your first call to the list action. For subsequent
  /// calls to the action fill nextToken in the request with the value of
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/filter$_query',
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
  /// calls to the action fill nextToken in the request with the value of
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
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/findings',
      exceptionFnMap: _exceptionFns,
    );
    return ListFindingsResponse.fromJson(response);
  }

  /// Lists the IPSets of the GuardDuty service specified by the detector ID. If
  /// you use this operation from a member account, the IPSets returned are the
  /// IPSets from the associated master account.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector the ipSet is associated with.
  ///
  /// Parameter [maxResults] :
  /// You can use this parameter to indicate the maximum number of items you
  /// want in the response. The default value is 50. The maximum value is 50.
  ///
  /// Parameter [nextToken] :
  /// You can use this parameter when paginating results. Set the value of this
  /// parameter to null on your first call to the list action. For subsequent
  /// calls to the action fill nextToken in the request with the value of
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/ipset$_query',
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
  /// You can use this parameter to indicate the maximum number of items you
  /// want in the response. The default value is 50. The maximum value is 50.
  ///
  /// Parameter [nextToken] :
  /// You can use this parameter when paginating results. Set the value of this
  /// parameter to null on your first call to the list action. For subsequent
  /// calls to the action fill nextToken in the request with the value of
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/invitation$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListInvitationsResponse.fromJson(response);
  }

  /// Lists details about all member accounts for the current GuardDuty master
  /// account.
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
  /// calls to the action fill nextToken in the request with the value of
  /// NextToken from the previous response to continue listing data.
  ///
  /// Parameter [onlyAssociated] :
  /// Specifies whether to only return associated members or to return all
  /// members (including members which haven't been invited yet or have been
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
      if (onlyAssociated != null)
        _s.toQueryParam('onlyAssociated', onlyAssociated),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/member$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListMembersResponse.fromJson(response);
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
  /// A token to use for paginating results returned in the repsonse. Set the
  /// value of this parameter to null for the first request to a list action.
  /// For subsequent calls, use the <code>NextToken</code> value returned from
  /// the previous request to continue listing results after the first page.
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/publishingDestination$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListPublishingDestinationsResponse.fromJson(response);
  }

  /// Lists tags for a resource. Tagging is currently supported for detectors,
  /// finding filters, IP sets, and Threat Intel sets, with a limit of 50 tags
  /// per resource. When invoked, this operation returns all assigned tags for a
  /// given resource..
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the given GuardDuty resource
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
      requestUri: '/tags/${Uri.encodeComponent(resourceArn.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Lists the ThreatIntelSets of the GuardDuty service specified by the
  /// detector ID. If you use this operation from a member account, the
  /// ThreatIntelSets associated with the master account are returned.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector the threatIntelSet is associated with.
  ///
  /// Parameter [maxResults] :
  /// You can use this parameter to indicate the maximum number of items you
  /// want in the response. The default value is 50. The maximum value is 50.
  ///
  /// Parameter [nextToken] :
  /// You can use this parameter to paginate results in the response. Set the
  /// value of this parameter to null on your first call to the list action. For
  /// subsequent calls to the action fill nextToken in the request with the
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('nextToken', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/threatintelset$_query',
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
  /// The unique ID of the detector of the GuardDuty master account associated
  /// with the member accounts to monitor.
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
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/member/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartMonitoringMembersResponse.fromJson(response);
  }

  /// Stops GuardDuty monitoring for the specified member accounnts. Use the
  /// <code>StartMonitoringMembers</code> to restart monitoring for those
  /// accounts.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [accountIds] :
  /// A list of account IDs of the GuardDuty member accounts whose findings you
  /// want the master account to stop monitoring.
  ///
  /// Parameter [detectorId] :
  /// The unique ID of the detector of the GuardDuty account that you want to
  /// stop from monitor members' findings.
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
      requestUri:
          '/detector/${Uri.encodeComponent(detectorId.toString())}/member/stop',
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
      requestUri: '/tags/${Uri.encodeComponent(resourceArn.toString())}',
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
  /// IDs of the findings to unarchive.
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
          '/detector/${Uri.encodeComponent(detectorId.toString())}/findings/unarchive',
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
    var _query = '';
    _query = '?${[
      if (tagKeys != null) _s.toQueryParam('tagKeys', tagKeys),
    ].where((e) => e != null).join('&')}';
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn.toString())}$_query',
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
  /// Parameter [enable] :
  /// Specifies whether the detector is enabled or not enabled.
  ///
  /// Parameter [findingPublishingFrequency] :
  /// A enum value that specifies how frequently findings are exported, such as
  /// to CloudWatch Events.
  Future<void> updateDetector({
    @_s.required String detectorId,
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
      if (enable != null) 'enable': enable,
      if (findingPublishingFrequency != null)
        'findingPublishingFrequency': findingPublishingFrequency.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/detector/${Uri.encodeComponent(detectorId.toString())}',
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
          '/detector/${Uri.encodeComponent(detectorId.toString())}/filter/${Uri.encodeComponent(filterName.toString())}',
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
  /// IDs of the findings that you want to mark as useful or not useful.
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
          '/detector/${Uri.encodeComponent(detectorId.toString())}/findings/feedback',
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
  /// The updated boolean value that specifies whether the IPSet is active or
  /// not.
  ///
  /// Parameter [location] :
  /// The updated URI of the file that contains the IPSet. For example
  /// (https://s3.us-west-2.amazonaws.com/my-bucket/my-object-key).
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
          '/detector/${Uri.encodeComponent(detectorId.toString())}/ipset/${Uri.encodeComponent(ipSetId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateIPSetResponse.fromJson(response);
  }

  /// Updates information about the publishing destination specified by the
  /// <code>destinationId</code>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  ///
  /// Parameter [destinationId] :
  /// The ID of the detector associated with the publishing destinations to
  /// update.
  ///
  /// Parameter [detectorId] :
  /// The ID of the
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
          '/detector/${Uri.encodeComponent(detectorId.toString())}/publishingDestination/${Uri.encodeComponent(destinationId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePublishingDestinationResponse.fromJson(response);
  }

  /// Updates the ThreatIntelSet specified by ThreatIntelSet ID.
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
  /// The updated boolean value that specifies whether the ThreateIntelSet is
  /// active or not.
  ///
  /// Parameter [location] :
  /// The updated URI of the file that contains the ThreateIntelSet. For example
  /// (https://s3.us-west-2.amazonaws.com/my-bucket/my-object-key)
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
          '/detector/${Uri.encodeComponent(detectorId.toString())}/threatintelset/${Uri.encodeComponent(threatIntelSetId.toString())}',
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

/// Contains information about the access keys.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccessKeyDetails {
  /// Access key ID of the user.
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
  /// Member account ID.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// Member account's email address.
  @_s.JsonKey(name: 'email')
  final String email;

  AccountDetail({
    @_s.required this.accountId,
    @_s.required this.email,
  });
  Map<String, dynamic> toJson() => _$AccountDetailToJson(this);
}

/// Contains information about action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Action {
  /// GuardDuty Finding activity type.
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

/// Contains information about the API operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AwsApiCallAction {
  /// AWS API name.
  @_s.JsonKey(name: 'api')
  final String api;

  /// AWS API caller type.
  @_s.JsonKey(name: 'callerType')
  final String callerType;

  /// Domain information for the AWS API call.
  @_s.JsonKey(name: 'domainDetails')
  final DomainDetails domainDetails;

  /// Remote IP information of the connection.
  @_s.JsonKey(name: 'remoteIpDetails')
  final RemoteIpDetails remoteIpDetails;

  /// AWS service name whose API was invoked.
  @_s.JsonKey(name: 'serviceName')
  final String serviceName;

  AwsApiCallAction({
    this.api,
    this.callerType,
    this.domainDetails,
    this.remoteIpDetails,
    this.serviceName,
  });
  factory AwsApiCallAction.fromJson(Map<String, dynamic> json) =>
      _$AwsApiCallActionFromJson(json);
}

/// Contains information about the city associated with the IP address.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class City {
  /// City name of the remote IP address.
  @_s.JsonKey(name: 'cityName')
  final String cityName;

  City({
    this.cityName,
  });
  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

/// Contains information about the condition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Condition {
  /// Represents the equal condition to be applied to a single field when querying
  /// for findings.
  @_s.JsonKey(name: 'eq')
  final List<String> eq;

  /// Represents an <b>equal</b> condition to be applied to a single field when
  /// querying for findings.
  @_s.JsonKey(name: 'equals')
  final List<String> equals;

  /// Represents a greater than condition to be applied to a single field when
  /// querying for findings.
  @_s.JsonKey(name: 'greaterThan')
  final int greaterThan;

  /// Represents a greater than equal condition to be applied to a single field
  /// when querying for findings.
  @_s.JsonKey(name: 'greaterThanOrEqual')
  final int greaterThanOrEqual;

  /// Represents a greater than condition to be applied to a single field when
  /// querying for findings.
  @_s.JsonKey(name: 'gt')
  final int gt;

  /// Represents a greater than equal condition to be applied to a single field
  /// when querying for findings.
  @_s.JsonKey(name: 'gte')
  final int gte;

  /// Represents a less than condition to be applied to a single field when
  /// querying for findings.
  @_s.JsonKey(name: 'lessThan')
  final int lessThan;

  /// Represents a less than equal condition to be applied to a single field when
  /// querying for findings.
  @_s.JsonKey(name: 'lessThanOrEqual')
  final int lessThanOrEqual;

  /// Represents a less than condition to be applied to a single field when
  /// querying for findings.
  @_s.JsonKey(name: 'lt')
  final int lt;

  /// Represents a less than equal condition to be applied to a single field when
  /// querying for findings.
  @_s.JsonKey(name: 'lte')
  final int lte;

  /// Represents the not equal condition to be applied to a single field when
  /// querying for findings.
  @_s.JsonKey(name: 'neq')
  final List<String> neq;

  /// Represents an <b>not equal</b> condition to be applied to a single field
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

/// Contains information about the country in which the remote IP address is
/// located.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Country {
  /// Country code of the remote IP address.
  @_s.JsonKey(name: 'countryCode')
  final String countryCode;

  /// Country name of the remote IP address.
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
  /// A list of objects containing the unprocessed account and a result string
  /// explaining why it was unprocessed.
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
  /// The ID of the publishing destination created.
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeclineInvitationsResponse {
  /// A list of objects containing the unprocessed account and a result string
  /// explaining why it was unprocessed.
  @_s.JsonKey(name: 'unprocessedAccounts')
  final List<UnprocessedAccount> unprocessedAccounts;

  DeclineInvitationsResponse({
    @_s.required this.unprocessedAccounts,
  });
  factory DeclineInvitationsResponse.fromJson(Map<String, dynamic> json) =>
      _$DeclineInvitationsResponseFromJson(json);
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
  /// A list of objects containing the unprocessed account and a result string
  /// explaining why it was unprocessed.
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
class DescribePublishingDestinationResponse {
  /// The ID of the publishing destination.
  @_s.JsonKey(name: 'destinationId')
  final String destinationId;

  /// A <code>DestinationProperties</code> object that includes the
  /// <code>DestinationArn</code> and <code>KmsKeyArn</code> of the publishing
  /// destination.
  @_s.JsonKey(name: 'destinationProperties')
  final DestinationProperties destinationProperties;

  /// The type of the publishing destination. Currently, only S3 is supported.
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

/// Contains information about a publishing destination, including the ID, type,
/// and status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Destination {
  /// The unique ID of the publishing destination.
  @_s.JsonKey(name: 'destinationId')
  final String destinationId;

  /// The type of resource used for the publishing destination. Currently, only S3
  /// is supported.
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

/// Contains the ARN of the resource to publish to, such as an S3 bucket, and
/// the ARN of the KMS key to use to encrypt published findings.
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
  /// A list of objects containing the unprocessed account and a result string
  /// explaining why it was unprocessed.
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
  /// Domain information for the API request.
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
  /// Domain information for the AWS API call.
  @_s.JsonKey(name: 'domain')
  final String domain;

  DomainDetails({
    this.domain,
  });
  factory DomainDetails.fromJson(Map<String, dynamic> json) =>
      _$DomainDetailsFromJson(json);
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

  /// The ARN for the finding.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time and date at which the finding was created.
  @_s.JsonKey(name: 'createdAt')
  final String createdAt;

  /// The ID of the finding.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The Region in which the finding was generated.
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

  /// The type of the finding.
  @_s.JsonKey(name: 'type')
  final String type;

  /// The time and date at which the finding was laste updated.
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

  /// The title for the finding.
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
  /// Represents a map of severity to count statistic for a set of findings
  @_s.JsonKey(name: 'countBySeverity')
  final Map<String, int> countBySeverity;

  FindingStatistics({
    this.countBySeverity,
  });
  factory FindingStatistics.fromJson(Map<String, dynamic> json) =>
      _$FindingStatisticsFromJson(json);
}

/// Contains information about the location of the remote IP address.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GeoLocation {
  /// Latitude information of remote IP address.
  @_s.JsonKey(name: 'lat')
  final double lat;

  /// Longitude information of remote IP address.
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

  /// Detector creation timestamp.
  @_s.JsonKey(name: 'createdAt')
  final String createdAt;

  /// Finding publishing frequency.
  @_s.JsonKey(name: 'findingPublishingFrequency')
  final FindingPublishingFrequency findingPublishingFrequency;

  /// The tags of the detector resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Detector last update timestamp.
  @_s.JsonKey(name: 'updatedAt')
  final String updatedAt;

  GetDetectorResponse({
    @_s.required this.serviceRole,
    @_s.required this.status,
    this.createdAt,
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
  /// Finding statistics object.
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

  /// The URI of the file that contains the IPSet. For example
  /// (https://s3.us-west-2.amazonaws.com/my-bucket/my-object-key)
  @_s.JsonKey(name: 'location')
  final String location;

  /// The user friendly name for the IPSet.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The status of ipSet file uploaded.
  @_s.JsonKey(name: 'status')
  final IpSetStatus status;

  /// The tags of the IP set resource.
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
  /// Master account details.
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
class GetMembersResponse {
  /// A list of members.
  @_s.JsonKey(name: 'members')
  final List<Member> members;

  /// A list of objects containing the unprocessed account and a result string
  /// explaining why it was unprocessed.
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

  /// The URI of the file that contains the ThreatIntelSet. For example
  /// (https://s3.us-west-2.amazonaws.com/my-bucket/my-object-key).
  @_s.JsonKey(name: 'location')
  final String location;

  /// A user-friendly ThreatIntelSet name that is displayed in all finding
  /// generated by activity that involves IP addresses included in this
  /// ThreatIntelSet.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The status of threatIntelSet file uploaded.
  @_s.JsonKey(name: 'status')
  final ThreatIntelSetStatus status;

  /// The tags of the Threat List resource.
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

/// Contains information about the EC2 instance profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IamInstanceProfile {
  /// AWS EC2 instance profile ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// AWS EC2 instance profile ID.
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
  /// The availability zone of the EC2 instance.
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

  /// The network interface information of the EC2 instance.
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
  /// The ID of the account from which the invitations was sent.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The ID of the invitation. This value is used to validate the inviter account
  /// to the member account.
  @_s.JsonKey(name: 'invitationId')
  final String invitationId;

  /// Timestamp at which the invitation was sent.
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
  /// A list of objects containing the unprocessed account and a result string
  /// explaining why it was unprocessed.
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
  /// A list of detector Ids.
  @_s.JsonKey(name: 'detectorIds')
  final List<String> detectorIds;

  /// Pagination parameter to be used on the next list operation to retrieve more
  /// items.
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
  /// A list of filter names
  @_s.JsonKey(name: 'filterNames')
  final List<String> filterNames;

  /// Pagination parameter to be used on the next list operation to retrieve more
  /// items.
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
  /// The IDs of the findings you are listing.
  @_s.JsonKey(name: 'findingIds')
  final List<String> findingIds;

  /// Pagination parameter to be used on the next list operation to retrieve more
  /// items.
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

  /// Pagination parameter to be used on the next list operation to retrieve more
  /// items.
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

  /// Pagination parameter to be used on the next list operation to retrieve more
  /// items.
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

  /// Pagination parameter to be used on the next list operation to retrieve more
  /// items.
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
class ListPublishingDestinationsResponse {
  /// A <code>Destinations</code> obect that includes information about each
  /// publishing destination returned.
  @_s.JsonKey(name: 'destinations')
  final List<Destination> destinations;

  /// A token to use for paginating results returned in the repsonse. Set the
  /// value of this parameter to null for the first request to a list action. For
  /// subsequent calls, use the <code>NextToken</code> value returned from the
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

  /// Pagination parameter to be used on the next list operation to retrieve more
  /// items.
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
  /// IPV4 remote address of the connection.
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
  /// Port number of the local connection.
  @_s.JsonKey(name: 'port')
  final int port;

  /// Port name of the local connection.
  @_s.JsonKey(name: 'portName')
  final String portName;

  LocalPortDetails({
    this.port,
    this.portName,
  });
  factory LocalPortDetails.fromJson(Map<String, dynamic> json) =>
      _$LocalPortDetailsFromJson(json);
}

/// Contains information about the Master account and invitation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Master {
  /// The ID of the account used as the Master account.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// This value is used to validate the master account to the member account.
  @_s.JsonKey(name: 'invitationId')
  final String invitationId;

  /// Timestamp at which the invitation was sent.
  @_s.JsonKey(name: 'invitedAt')
  final String invitedAt;

  /// The status of the relationship between the master and member accounts.
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

/// Continas information about the member account
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Member {
  /// Member account ID.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// Member account's email address.
  @_s.JsonKey(name: 'email')
  final String email;

  /// Master account ID.
  @_s.JsonKey(name: 'masterId')
  final String masterId;

  /// The status of the relationship between the member and the master.
  @_s.JsonKey(name: 'relationshipStatus')
  final String relationshipStatus;

  /// Member last updated timestamp.
  @_s.JsonKey(name: 'updatedAt')
  final String updatedAt;

  /// Member account's detector ID.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// Timestamp at which the invitation was sent
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

/// Contains information about the NETWORK_CONNECTION action described in the
/// finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkConnectionAction {
  /// Network connection blocked information.
  @_s.JsonKey(name: 'blocked')
  final bool blocked;

  /// Network connection direction.
  @_s.JsonKey(name: 'connectionDirection')
  final String connectionDirection;

  /// Local IP information of the connection.
  @_s.JsonKey(name: 'localIpDetails')
  final LocalIpDetails localIpDetails;

  /// Local port information of the connection.
  @_s.JsonKey(name: 'localPortDetails')
  final LocalPortDetails localPortDetails;

  /// Network connection protocol.
  @_s.JsonKey(name: 'protocol')
  final String protocol;

  /// Remote IP information of the connection.
  @_s.JsonKey(name: 'remoteIpDetails')
  final RemoteIpDetails remoteIpDetails;

  /// Remote port information of the connection.
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

/// Contains information about the network interface of the Ec2 instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkInterface {
  /// A list of EC2 instance IPv6 address information.
  @_s.JsonKey(name: 'ipv6Addresses')
  final List<String> ipv6Addresses;

  /// The ID of the network interface
  @_s.JsonKey(name: 'networkInterfaceId')
  final String networkInterfaceId;

  /// Private DNS name of the EC2 instance.
  @_s.JsonKey(name: 'privateDnsName')
  final String privateDnsName;

  /// Private IP address of the EC2 instance.
  @_s.JsonKey(name: 'privateIpAddress')
  final String privateIpAddress;

  /// Other private IP address information of the EC2 instance.
  @_s.JsonKey(name: 'privateIpAddresses')
  final List<PrivateIpAddressDetails> privateIpAddresses;

  /// Public DNS name of the EC2 instance.
  @_s.JsonKey(name: 'publicDnsName')
  final String publicDnsName;

  /// Public IP address of the EC2 instance.
  @_s.JsonKey(name: 'publicIp')
  final String publicIp;

  /// Security groups associated with the EC2 instance.
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

/// Continas information about the ISP organization of the remote IP address.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Organization {
  /// Autonomous system number of the internet provider of the remote IP address.
  @_s.JsonKey(name: 'asn')
  final String asn;

  /// Organization that registered this ASN.
  @_s.JsonKey(name: 'asnOrg')
  final String asnOrg;

  /// ISP information for the internet provider.
  @_s.JsonKey(name: 'isp')
  final String isp;

  /// Name of the internet provider.
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

/// Contains information about the PORT_PROBE action described in the finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PortProbeAction {
  /// Port probe blocked information.
  @_s.JsonKey(name: 'blocked')
  final bool blocked;

  /// A list of port probe details objects.
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
  /// Local IP information of the connection.
  @_s.JsonKey(name: 'localIpDetails')
  final LocalIpDetails localIpDetails;

  /// Local port information of the connection.
  @_s.JsonKey(name: 'localPortDetails')
  final LocalPortDetails localPortDetails;

  /// Remote IP information of the connection.
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
  /// Private DNS name of the EC2 instance.
  @_s.JsonKey(name: 'privateDnsName')
  final String privateDnsName;

  /// Private IP address of the EC2 instance.
  @_s.JsonKey(name: 'privateIpAddress')
  final String privateIpAddress;

  PrivateIpAddressDetails({
    this.privateDnsName,
    this.privateIpAddress,
  });
  factory PrivateIpAddressDetails.fromJson(Map<String, dynamic> json) =>
      _$PrivateIpAddressDetailsFromJson(json);
}

/// Contains information about the product code for the Ec2 instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProductCode {
  /// Product code information.
  @_s.JsonKey(name: 'code')
  final String code;

  /// Product code type.
  @_s.JsonKey(name: 'productType')
  final String productType;

  ProductCode({
    this.code,
    this.productType,
  });
  factory ProductCode.fromJson(Map<String, dynamic> json) =>
      _$ProductCodeFromJson(json);
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

/// Continas information about the remote IP address of the connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoteIpDetails {
  /// City information of the remote IP address.
  @_s.JsonKey(name: 'city')
  final City city;

  /// Country code of the remote IP address.
  @_s.JsonKey(name: 'country')
  final Country country;

  /// Location information of the remote IP address.
  @_s.JsonKey(name: 'geoLocation')
  final GeoLocation geoLocation;

  /// IPV4 remote address of the connection.
  @_s.JsonKey(name: 'ipAddressV4')
  final String ipAddressV4;

  /// ISP Organization information of the remote IP address.
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
  /// Port number of the remote connection.
  @_s.JsonKey(name: 'port')
  final int port;

  /// Port name of the remote connection.
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

  /// The type of the AWS resource.
  @_s.JsonKey(name: 'resourceType')
  final String resourceType;

  Resource({
    this.accessKeyDetails,
    this.instanceDetails,
    this.resourceType,
  });
  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);
}

/// Contains information about the security groups associated with the EC2
/// instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SecurityGroup {
  /// EC2 instance's security group ID.
  @_s.JsonKey(name: 'groupId')
  final String groupId;

  /// EC2 instance's security group name.
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
  /// Information about the activity described in a finding.
  @_s.JsonKey(name: 'action')
  final Action action;

  /// Indicates whether this finding is archived.
  @_s.JsonKey(name: 'archived')
  final bool archived;

  /// Total count of the occurrences of this finding type.
  @_s.JsonKey(name: 'count')
  final int count;

  /// Detector ID for the GuardDuty service.
  @_s.JsonKey(name: 'detectorId')
  final String detectorId;

  /// First seen timestamp of the activity that prompted GuardDuty to generate
  /// this finding.
  @_s.JsonKey(name: 'eventFirstSeen')
  final String eventFirstSeen;

  /// Last seen timestamp of the activity that prompted GuardDuty to generate this
  /// finding.
  @_s.JsonKey(name: 'eventLastSeen')
  final String eventLastSeen;

  /// An evidence object associated with the service.
  @_s.JsonKey(name: 'evidence')
  final Evidence evidence;

  /// Resource role information for this finding.
  @_s.JsonKey(name: 'resourceRole')
  final String resourceRole;

  /// The name of the AWS service (GuardDuty) that generated a finding.
  @_s.JsonKey(name: 'serviceName')
  final String serviceName;

  /// Feedback left about the finding.
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
  /// Represents the finding attribute (for example, accountId) by which to sort
  /// findings.
  @_s.JsonKey(name: 'attributeName')
  final String attributeName;

  /// Order by which the sorted findings are to be displayed.
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
  /// A list of objects containing the unprocessed account and a result string
  /// explaining why it was unprocessed.
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
  /// A list of objects containing the unprocessed account and a result string
  /// explaining why it was unprocessed.
  @_s.JsonKey(name: 'unprocessedAccounts')
  final List<UnprocessedAccount> unprocessedAccounts;

  StopMonitoringMembersResponse({
    @_s.required this.unprocessedAccounts,
  });
  factory StopMonitoringMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$StopMonitoringMembersResponseFromJson(json);
}

/// Contains information about a tag associated with the Ec2 instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Tag {
  /// EC2 instance tag key.
  @_s.JsonKey(name: 'key')
  final String key;

  /// EC2 instance tag value.
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

/// Contains information about the accounts that were not processed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UnprocessedAccount {
  /// AWS Account ID.
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

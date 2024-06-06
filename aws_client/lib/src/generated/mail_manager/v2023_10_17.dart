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

/// <a href="http://aws.amazon.com/ses">AWS SES Mail Manager API</a> contains
/// operations and data types that comprise the Mail Manager feature of Amazon
/// Simple Email Service.
class MailManager {
  final _s.JsonProtocol _protocol;
  MailManager({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mail-manager',
            signingName: 'ses',
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

  /// Creates an Add On instance for the subscription indicated in the request.
  /// The resulting Amazon Resource Name (ARN) can be used in a conditional
  /// statement for a rule set or traffic policy.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [addonSubscriptionId] :
  /// The unique ID of a previously created subscription that an Add On instance
  /// is created for. You can only have one instance per subscription.
  ///
  /// Parameter [clientToken] :
  /// A unique token that Amazon SES uses to recognize subsequent retries of the
  /// same request.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for the resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  Future<CreateAddonInstanceResponse> createAddonInstance({
    required String addonSubscriptionId,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.CreateAddonInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddonSubscriptionId': addonSubscriptionId,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateAddonInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Creates a subscription for an Add On representing the acceptance of its
  /// terms of use and additional pricing. The subscription can then be used to
  /// create an instance for use in rule sets or traffic policies.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [addonName] :
  /// The name of the Add On to subscribe to. You can only have one subscription
  /// for each Add On name.
  ///
  /// Parameter [clientToken] :
  /// A unique token that Amazon SES uses to recognize subsequent retries of the
  /// same request.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for the resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  Future<CreateAddonSubscriptionResponse> createAddonSubscription({
    required String addonName,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.CreateAddonSubscription'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddonName': addonName,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateAddonSubscriptionResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new email archive resource for storing and retaining emails.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [archiveName] :
  /// A unique name for the new archive.
  ///
  /// Parameter [clientToken] :
  /// A unique token Amazon SES uses to recognize retries of this request.
  ///
  /// Parameter [kmsKeyArn] :
  /// The Amazon Resource Name (ARN) of the KMS key for encrypting emails in the
  /// archive.
  ///
  /// Parameter [retention] :
  /// The period for retaining emails in the archive before automatic deletion.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for the resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  Future<CreateArchiveResponse> createArchive({
    required String archiveName,
    String? clientToken,
    String? kmsKeyArn,
    ArchiveRetention? retention,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.CreateArchive'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchiveName': archiveName,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
        if (retention != null) 'Retention': retention,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateArchiveResponse.fromJson(jsonResponse.body);
  }

  /// Provision a new ingress endpoint resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [ingressPointName] :
  /// A user friendly name for an ingress endpoint resource.
  ///
  /// Parameter [ruleSetId] :
  /// The identifier of an existing rule set that you attach to an ingress
  /// endpoint resource.
  ///
  /// Parameter [trafficPolicyId] :
  /// The identifier of an existing traffic policy that you attach to an ingress
  /// endpoint resource.
  ///
  /// Parameter [type] :
  /// The type of the ingress endpoint to create.
  ///
  /// Parameter [clientToken] :
  /// A unique token that Amazon SES uses to recognize subsequent retries of the
  /// same request.
  ///
  /// Parameter [ingressPointConfiguration] :
  /// If you choose an Authenticated ingress endpoint, you must configure either
  /// an SMTP password or a secret ARN.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for the resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  Future<CreateIngressPointResponse> createIngressPoint({
    required String ingressPointName,
    required String ruleSetId,
    required String trafficPolicyId,
    required IngressPointType type,
    String? clientToken,
    IngressPointConfiguration? ingressPointConfiguration,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.CreateIngressPoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IngressPointName': ingressPointName,
        'RuleSetId': ruleSetId,
        'TrafficPolicyId': trafficPolicyId,
        'Type': type.toValue(),
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (ingressPointConfiguration != null)
          'IngressPointConfiguration': ingressPointConfiguration,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateIngressPointResponse.fromJson(jsonResponse.body);
  }

  /// Creates a relay resource which can be used in rules to relay incoming
  /// emails to defined relay destinations.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [authentication] :
  /// Authentication for the relay destination server—specify the secretARN
  /// where the SMTP credentials are stored.
  ///
  /// Parameter [relayName] :
  /// The unique name of the relay resource.
  ///
  /// Parameter [serverName] :
  /// The destination relay server address.
  ///
  /// Parameter [serverPort] :
  /// The destination relay server port.
  ///
  /// Parameter [clientToken] :
  /// A unique token that Amazon SES uses to recognize subsequent retries of the
  /// same request.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for the resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  Future<CreateRelayResponse> createRelay({
    required RelayAuthentication authentication,
    required String relayName,
    required String serverName,
    required int serverPort,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'serverPort',
      serverPort,
      1,
      65535,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.CreateRelay'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Authentication': authentication,
        'RelayName': relayName,
        'ServerName': serverName,
        'ServerPort': serverPort,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRelayResponse.fromJson(jsonResponse.body);
  }

  /// Provision a new rule set.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [ruleSetName] :
  /// A user-friendly name for the rule set.
  ///
  /// Parameter [rules] :
  /// Conditional rules that are evaluated for determining actions on email.
  ///
  /// Parameter [clientToken] :
  /// A unique token that Amazon SES uses to recognize subsequent retries of the
  /// same request.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for the resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  Future<CreateRuleSetResponse> createRuleSet({
    required String ruleSetName,
    required List<Rule> rules,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.CreateRuleSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RuleSetName': ruleSetName,
        'Rules': rules,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateRuleSetResponse.fromJson(jsonResponse.body);
  }

  /// Provision a new traffic policy resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [defaultAction] :
  /// Default action instructs the traﬃc policy to either Allow or Deny (block)
  /// messages that fall outside of (or not addressed by) the conditions of your
  /// policy statements
  ///
  /// Parameter [policyStatements] :
  /// Conditional statements for filtering email traffic.
  ///
  /// Parameter [trafficPolicyName] :
  /// A user-friendly name for the traffic policy resource.
  ///
  /// Parameter [clientToken] :
  /// A unique token that Amazon SES uses to recognize subsequent retries of the
  /// same request.
  ///
  /// Parameter [maxMessageSizeBytes] :
  /// The maximum message size in bytes of email which is allowed in by this
  /// traffic policy—anything larger will be blocked.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for the resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  Future<CreateTrafficPolicyResponse> createTrafficPolicy({
    required AcceptAction defaultAction,
    required List<PolicyStatement> policyStatements,
    required String trafficPolicyName,
    String? clientToken,
    int? maxMessageSizeBytes,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'maxMessageSizeBytes',
      maxMessageSizeBytes,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.CreateTrafficPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DefaultAction': defaultAction.toValue(),
        'PolicyStatements': policyStatements,
        'TrafficPolicyName': trafficPolicyName,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (maxMessageSizeBytes != null)
          'MaxMessageSizeBytes': maxMessageSizeBytes,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateTrafficPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an Add On instance.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [addonInstanceId] :
  /// The Add On instance ID to delete.
  Future<void> deleteAddonInstance({
    required String addonInstanceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.DeleteAddonInstance'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddonInstanceId': addonInstanceId,
      },
    );
  }

  /// Deletes an Add On subscription.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [addonSubscriptionId] :
  /// The Add On subscription ID to delete.
  Future<void> deleteAddonSubscription({
    required String addonSubscriptionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.DeleteAddonSubscription'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddonSubscriptionId': addonSubscriptionId,
      },
    );
  }

  /// Initiates deletion of an email archive. This changes the archive state to
  /// pending deletion. In this state, no new emails can be added, and existing
  /// archived emails become inaccessible (search, export, download). The
  /// archive and all of its contents will be permanently deleted 30 days after
  /// entering the pending deletion state, regardless of the configured
  /// retention period.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [archiveId] :
  /// The identifier of the archive to delete.
  Future<void> deleteArchive({
    required String archiveId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.DeleteArchive'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchiveId': archiveId,
      },
    );
  }

  /// Delete an ingress endpoint resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [ingressPointId] :
  /// The identifier of the ingress endpoint resource that you want to delete.
  Future<void> deleteIngressPoint({
    required String ingressPointId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.DeleteIngressPoint'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IngressPointId': ingressPointId,
      },
    );
  }

  /// Deletes an existing relay resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [relayId] :
  /// The unique relay identifier.
  Future<void> deleteRelay({
    required String relayId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.DeleteRelay'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RelayId': relayId,
      },
    );
  }

  /// Delete a rule set.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [ruleSetId] :
  /// The identifier of an existing rule set resource to delete.
  Future<void> deleteRuleSet({
    required String ruleSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.DeleteRuleSet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RuleSetId': ruleSetId,
      },
    );
  }

  /// Delete a traffic policy resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [trafficPolicyId] :
  /// The identifier of the traffic policy that you want to delete.
  Future<void> deleteTrafficPolicy({
    required String trafficPolicyId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.DeleteTrafficPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrafficPolicyId': trafficPolicyId,
      },
    );
  }

  /// Gets detailed information about an Add On instance.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [addonInstanceId] :
  /// The Add On instance ID to retrieve information for.
  Future<GetAddonInstanceResponse> getAddonInstance({
    required String addonInstanceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetAddonInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddonInstanceId': addonInstanceId,
      },
    );

    return GetAddonInstanceResponse.fromJson(jsonResponse.body);
  }

  /// Gets detailed information about an Add On subscription.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [addonSubscriptionId] :
  /// The Add On subscription ID to retrieve information for.
  Future<GetAddonSubscriptionResponse> getAddonSubscription({
    required String addonSubscriptionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetAddonSubscription'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddonSubscriptionId': addonSubscriptionId,
      },
    );

    return GetAddonSubscriptionResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the full details and current state of a specified email archive.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [archiveId] :
  /// The identifier of the archive to retrieve.
  Future<GetArchiveResponse> getArchive({
    required String archiveId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetArchive'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchiveId': archiveId,
      },
    );

    return GetArchiveResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the details and current status of a specific email archive
  /// export job.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [exportId] :
  /// The identifier of the export job to get details for.
  Future<GetArchiveExportResponse> getArchiveExport({
    required String exportId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetArchiveExport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExportId': exportId,
      },
    );

    return GetArchiveExportResponse.fromJson(jsonResponse.body);
  }

  /// Returns a pre-signed URL that provides temporary download access to the
  /// specific email message stored in the archive.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [archivedMessageId] :
  /// The unique identifier of the archived email message.
  Future<GetArchiveMessageResponse> getArchiveMessage({
    required String archivedMessageId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetArchiveMessage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchivedMessageId': archivedMessageId,
      },
    );

    return GetArchiveMessageResponse.fromJson(jsonResponse.body);
  }

  /// Returns the textual content of a specific email message stored in the
  /// archive. Attachments are not included.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [archivedMessageId] :
  /// The unique identifier of the archived email message.
  Future<GetArchiveMessageContentResponse> getArchiveMessageContent({
    required String archivedMessageId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetArchiveMessageContent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchivedMessageId': archivedMessageId,
      },
    );

    return GetArchiveMessageContentResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the details and current status of a specific email archive
  /// search job.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [searchId] :
  /// The identifier of the search job to get details for.
  Future<GetArchiveSearchResponse> getArchiveSearch({
    required String searchId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetArchiveSearch'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SearchId': searchId,
      },
    );

    return GetArchiveSearchResponse.fromJson(jsonResponse.body);
  }

  /// Returns the results of a completed email archive search job.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [searchId] :
  /// The identifier of the completed search job.
  Future<GetArchiveSearchResultsResponse> getArchiveSearchResults({
    required String searchId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetArchiveSearchResults'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SearchId': searchId,
      },
    );

    return GetArchiveSearchResultsResponse.fromJson(jsonResponse.body);
  }

  /// Fetch ingress endpoint resource attributes.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [ingressPointId] :
  /// The identifier of an ingress endpoint.
  Future<GetIngressPointResponse> getIngressPoint({
    required String ingressPointId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetIngressPoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IngressPointId': ingressPointId,
      },
    );

    return GetIngressPointResponse.fromJson(jsonResponse.body);
  }

  /// Fetch the relay resource and it's attributes.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [relayId] :
  /// A unique relay identifier.
  Future<GetRelayResponse> getRelay({
    required String relayId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetRelay'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RelayId': relayId,
      },
    );

    return GetRelayResponse.fromJson(jsonResponse.body);
  }

  /// Fetch attributes of a rule set.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [ruleSetId] :
  /// The identifier of an existing rule set to be retrieved.
  Future<GetRuleSetResponse> getRuleSet({
    required String ruleSetId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetRuleSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RuleSetId': ruleSetId,
      },
    );

    return GetRuleSetResponse.fromJson(jsonResponse.body);
  }

  /// Fetch attributes of a traffic policy resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [trafficPolicyId] :
  /// The identifier of the traffic policy resource.
  Future<GetTrafficPolicyResponse> getTrafficPolicy({
    required String trafficPolicyId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.GetTrafficPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrafficPolicyId': trafficPolicyId,
      },
    );

    return GetTrafficPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Lists all Add On instances in your account.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [nextToken] :
  /// If you received a pagination token from a previous call to this API, you
  /// can provide it here to continue paginating through the next page of
  /// results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of ingress endpoint resources that are returned per
  /// call. You can use NextToken to obtain further ingress endpoints.
  Future<ListAddonInstancesResponse> listAddonInstances({
    String? nextToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListAddonInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListAddonInstancesResponse.fromJson(jsonResponse.body);
  }

  /// Lists all Add On subscriptions in your account.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [nextToken] :
  /// If you received a pagination token from a previous call to this API, you
  /// can provide it here to continue paginating through the next page of
  /// results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of ingress endpoint resources that are returned per
  /// call. You can use NextToken to obtain further ingress endpoints.
  Future<ListAddonSubscriptionsResponse> listAddonSubscriptions({
    String? nextToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListAddonSubscriptions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListAddonSubscriptionsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of email archive export jobs.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [archiveId] :
  /// The identifier of the archive.
  ///
  /// Parameter [nextToken] :
  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of archive export jobs that are returned per call. You
  /// can use NextToken to obtain further pages of archives.
  Future<ListArchiveExportsResponse> listArchiveExports({
    required String archiveId,
    String? nextToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListArchiveExports'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchiveId': archiveId,
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListArchiveExportsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of email archive search jobs.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [archiveId] :
  /// The identifier of the archive.
  ///
  /// Parameter [nextToken] :
  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of archive search jobs that are returned per call. You
  /// can use NextToken to obtain further pages of archives.
  Future<ListArchiveSearchesResponse> listArchiveSearches({
    required String archiveId,
    String? nextToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListArchiveSearches'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchiveId': archiveId,
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListArchiveSearchesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of all email archives in your account.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [nextToken] :
  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of archives that are returned per call. You can use
  /// NextToken to obtain further pages of archives.
  Future<ListArchivesResponse> listArchives({
    String? nextToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListArchives'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListArchivesResponse.fromJson(jsonResponse.body);
  }

  /// List all ingress endpoint resources.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [nextToken] :
  /// If you received a pagination token from a previous call to this API, you
  /// can provide it here to continue paginating through the next page of
  /// results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of ingress endpoint resources that are returned per
  /// call. You can use NextToken to obtain further ingress endpoints.
  Future<ListIngressPointsResponse> listIngressPoints({
    String? nextToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListIngressPoints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListIngressPointsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all the existing relay resources.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [nextToken] :
  /// If you received a pagination token from a previous call to this API, you
  /// can provide it here to continue paginating through the next page of
  /// results.
  ///
  /// Parameter [pageSize] :
  /// The number of relays to be returned in one request.
  Future<ListRelaysResponse> listRelays({
    String? nextToken,
    int? pageSize,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListRelays'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListRelaysResponse.fromJson(jsonResponse.body);
  }

  /// List rule sets for this account.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [nextToken] :
  /// If you received a pagination token from a previous call to this API, you
  /// can provide it here to continue paginating through the next page of
  /// results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of rule set resources that are returned per call. You
  /// can use NextToken to obtain further rule sets.
  Future<ListRuleSetsResponse> listRuleSets({
    String? nextToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListRuleSets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListRuleSetsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the list of tags (keys and values) assigned to the resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to retrieve tags from.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// List traffic policy resources.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [nextToken] :
  /// If you received a pagination token from a previous call to this API, you
  /// can provide it here to continue paginating through the next page of
  /// results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of traffic policy resources that are returned per call.
  /// You can use NextToken to obtain further traffic policies.
  Future<ListTrafficPoliciesResponse> listTrafficPolicies({
    String? nextToken,
    int? pageSize,
  }) async {
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.ListTrafficPolicies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (nextToken != null) 'NextToken': nextToken,
        if (pageSize != null) 'PageSize': pageSize,
      },
    );

    return ListTrafficPoliciesResponse.fromJson(jsonResponse.body);
  }

  /// Initiates an export of emails from the specified archive.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [archiveId] :
  /// The identifier of the archive to export emails from.
  ///
  /// Parameter [exportDestinationConfiguration] :
  /// Details on where to deliver the exported email data.
  ///
  /// Parameter [fromTimestamp] :
  /// The start of the timestamp range to include emails from.
  ///
  /// Parameter [toTimestamp] :
  /// The end of the timestamp range to include emails from.
  ///
  /// Parameter [filters] :
  /// Criteria to filter which emails are included in the export.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of email items to include in the export.
  Future<StartArchiveExportResponse> startArchiveExport({
    required String archiveId,
    required ExportDestinationConfiguration exportDestinationConfiguration,
    required DateTime fromTimestamp,
    required DateTime toTimestamp,
    ArchiveFilters? filters,
    int? maxResults,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.StartArchiveExport'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchiveId': archiveId,
        'ExportDestinationConfiguration': exportDestinationConfiguration,
        'FromTimestamp': unixTimestampToJson(fromTimestamp),
        'ToTimestamp': unixTimestampToJson(toTimestamp),
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
      },
    );

    return StartArchiveExportResponse.fromJson(jsonResponse.body);
  }

  /// Initiates a search across emails in the specified archive.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [archiveId] :
  /// The identifier of the archive to search emails in.
  ///
  /// Parameter [fromTimestamp] :
  /// The start timestamp of the range to search emails from.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of search results to return.
  ///
  /// Parameter [toTimestamp] :
  /// The end timestamp of the range to search emails from.
  ///
  /// Parameter [filters] :
  /// Criteria to filter which emails are included in the search results.
  Future<StartArchiveSearchResponse> startArchiveSearch({
    required String archiveId,
    required DateTime fromTimestamp,
    required int maxResults,
    required DateTime toTimestamp,
    ArchiveFilters? filters,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.StartArchiveSearch'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchiveId': archiveId,
        'FromTimestamp': unixTimestampToJson(fromTimestamp),
        'MaxResults': maxResults,
        'ToTimestamp': unixTimestampToJson(toTimestamp),
        if (filters != null) 'Filters': filters,
      },
    );

    return StartArchiveSearchResponse.fromJson(jsonResponse.body);
  }

  /// Stops an in-progress export of emails from an archive.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [exportId] :
  /// The identifier of the export job to stop.
  Future<void> stopArchiveExport({
    required String exportId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.StopArchiveExport'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExportId': exportId,
      },
    );
  }

  /// Stops an in-progress archive search job.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [searchId] :
  /// The identifier of the search job to stop.
  Future<void> stopArchiveSearch({
    required String searchId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.StopArchiveSearch'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SearchId': searchId,
      },
    );
  }

  /// Adds one or more tags (keys and values) to a specified resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to tag.
  ///
  /// Parameter [tags] :
  /// The tags used to organize, track, or control access for the resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );
  }

  /// Remove one or more tags (keys and values) from a specified resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to untag.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the key-value pairs for the tag or tags you want to remove
  /// from the specified resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates the attributes of an existing email archive.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [archiveId] :
  /// The identifier of the archive to update.
  ///
  /// Parameter [archiveName] :
  /// A new, unique name for the archive.
  ///
  /// Parameter [retention] :
  /// A new retention period for emails in the archive.
  Future<void> updateArchive({
    required String archiveId,
    String? archiveName,
    ArchiveRetention? retention,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.UpdateArchive'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ArchiveId': archiveId,
        if (archiveName != null) 'ArchiveName': archiveName,
        if (retention != null) 'Retention': retention,
      },
    );
  }

  /// Update attributes of a provisioned ingress endpoint resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [ingressPointId] :
  /// The identifier for the ingress endpoint you want to update.
  ///
  /// Parameter [ingressPointConfiguration] :
  /// If you choose an Authenticated ingress endpoint, you must configure either
  /// an SMTP password or a secret ARN.
  ///
  /// Parameter [ingressPointName] :
  /// A user friendly name for the ingress endpoint resource.
  ///
  /// Parameter [ruleSetId] :
  /// The identifier of an existing rule set that you attach to an ingress
  /// endpoint resource.
  ///
  /// Parameter [statusToUpdate] :
  /// The update status of an ingress endpoint.
  ///
  /// Parameter [trafficPolicyId] :
  /// The identifier of an existing traffic policy that you attach to an ingress
  /// endpoint resource.
  Future<void> updateIngressPoint({
    required String ingressPointId,
    IngressPointConfiguration? ingressPointConfiguration,
    String? ingressPointName,
    String? ruleSetId,
    IngressPointStatusToUpdate? statusToUpdate,
    String? trafficPolicyId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.UpdateIngressPoint'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IngressPointId': ingressPointId,
        if (ingressPointConfiguration != null)
          'IngressPointConfiguration': ingressPointConfiguration,
        if (ingressPointName != null) 'IngressPointName': ingressPointName,
        if (ruleSetId != null) 'RuleSetId': ruleSetId,
        if (statusToUpdate != null) 'StatusToUpdate': statusToUpdate.toValue(),
        if (trafficPolicyId != null) 'TrafficPolicyId': trafficPolicyId,
      },
    );
  }

  /// Updates the attributes of an existing relay resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [relayId] :
  /// The unique relay identifier.
  ///
  /// Parameter [authentication] :
  /// Authentication for the relay destination server—specify the secretARN
  /// where the SMTP credentials are stored.
  ///
  /// Parameter [relayName] :
  /// The name of the relay resource.
  ///
  /// Parameter [serverName] :
  /// The destination relay server address.
  ///
  /// Parameter [serverPort] :
  /// The destination relay server port.
  Future<void> updateRelay({
    required String relayId,
    RelayAuthentication? authentication,
    String? relayName,
    String? serverName,
    int? serverPort,
  }) async {
    _s.validateNumRange(
      'serverPort',
      serverPort,
      1,
      65535,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.UpdateRelay'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RelayId': relayId,
        if (authentication != null) 'Authentication': authentication,
        if (relayName != null) 'RelayName': relayName,
        if (serverName != null) 'ServerName': serverName,
        if (serverPort != null) 'ServerPort': serverPort,
      },
    );
  }

  /// &gt;Update attributes of an already provisioned rule set.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [ruleSetId] :
  /// The identifier of a rule set you want to update.
  ///
  /// Parameter [ruleSetName] :
  /// A user-friendly name for the rule set resource.
  ///
  /// Parameter [rules] :
  /// A new set of rules to replace the current rules of the rule set—these
  /// rules will override all the rules of the rule set.
  Future<void> updateRuleSet({
    required String ruleSetId,
    String? ruleSetName,
    List<Rule>? rules,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.UpdateRuleSet'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RuleSetId': ruleSetId,
        if (ruleSetName != null) 'RuleSetName': ruleSetName,
        if (rules != null) 'Rules': rules,
      },
    );
  }

  /// Update attributes of an already provisioned traffic policy resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [trafficPolicyId] :
  /// The identifier of the traffic policy that you want to update.
  ///
  /// Parameter [defaultAction] :
  /// Default action instructs the traﬃc policy to either Allow or Deny (block)
  /// messages that fall outside of (or not addressed by) the conditions of your
  /// policy statements
  ///
  /// Parameter [maxMessageSizeBytes] :
  /// The maximum message size in bytes of email which is allowed in by this
  /// traffic policy—anything larger will be blocked.
  ///
  /// Parameter [policyStatements] :
  /// The list of conditions to be updated for filtering email traffic.
  ///
  /// Parameter [trafficPolicyName] :
  /// A user-friendly name for the traffic policy resource.
  Future<void> updateTrafficPolicy({
    required String trafficPolicyId,
    AcceptAction? defaultAction,
    int? maxMessageSizeBytes,
    List<PolicyStatement>? policyStatements,
    String? trafficPolicyName,
  }) async {
    _s.validateNumRange(
      'maxMessageSizeBytes',
      maxMessageSizeBytes,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'MailManagerSvc.UpdateTrafficPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrafficPolicyId': trafficPolicyId,
        if (defaultAction != null) 'DefaultAction': defaultAction.toValue(),
        if (maxMessageSizeBytes != null)
          'MaxMessageSizeBytes': maxMessageSizeBytes,
        if (policyStatements != null) 'PolicyStatements': policyStatements,
        if (trafficPolicyName != null) 'TrafficPolicyName': trafficPolicyName,
      },
    );
  }
}

enum AcceptAction {
  allow,
  deny,
}

extension AcceptActionValueExtension on AcceptAction {
  String toValue() {
    switch (this) {
      case AcceptAction.allow:
        return 'ALLOW';
      case AcceptAction.deny:
        return 'DENY';
    }
  }
}

extension AcceptActionFromString on String {
  AcceptAction toAcceptAction() {
    switch (this) {
      case 'ALLOW':
        return AcceptAction.allow;
      case 'DENY':
        return AcceptAction.deny;
    }
    throw Exception('$this is not known in enum AcceptAction');
  }
}

enum ActionFailurePolicy {
  $continue,
  drop,
}

extension ActionFailurePolicyValueExtension on ActionFailurePolicy {
  String toValue() {
    switch (this) {
      case ActionFailurePolicy.$continue:
        return 'CONTINUE';
      case ActionFailurePolicy.drop:
        return 'DROP';
    }
  }
}

extension ActionFailurePolicyFromString on String {
  ActionFailurePolicy toActionFailurePolicy() {
    switch (this) {
      case 'CONTINUE':
        return ActionFailurePolicy.$continue;
      case 'DROP':
        return ActionFailurePolicy.drop;
    }
    throw Exception('$this is not known in enum ActionFailurePolicy');
  }
}

/// The action to add a header to a message. When executed, this action will add
/// the given header to the message.
class AddHeaderAction {
  /// The name of the header to add to an email. The header must be prefixed with
  /// "X-". Headers are added regardless of whether the header name pre-existed in
  /// the email.
  final String headerName;

  /// The value of the header to add to the email.
  final String headerValue;

  AddHeaderAction({
    required this.headerName,
    required this.headerValue,
  });

  factory AddHeaderAction.fromJson(Map<String, dynamic> json) {
    return AddHeaderAction(
      headerName: json['HeaderName'] as String,
      headerValue: json['HeaderValue'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final headerName = this.headerName;
    final headerValue = this.headerValue;
    return {
      'HeaderName': headerName,
      'HeaderValue': headerValue,
    };
  }
}

/// An Add On instance represents a specific configuration of an Add On.
class AddonInstance {
  /// The Amazon Resource Name (ARN) of the Add On instance.
  final String? addonInstanceArn;

  /// The unique ID of the Add On instance.
  final String? addonInstanceId;

  /// The name of the Add On for the instance.
  final String? addonName;

  /// The subscription ID for the instance.
  final String? addonSubscriptionId;

  /// The timestamp of when the Add On instance was created.
  final DateTime? createdTimestamp;

  AddonInstance({
    this.addonInstanceArn,
    this.addonInstanceId,
    this.addonName,
    this.addonSubscriptionId,
    this.createdTimestamp,
  });

  factory AddonInstance.fromJson(Map<String, dynamic> json) {
    return AddonInstance(
      addonInstanceArn: json['AddonInstanceArn'] as String?,
      addonInstanceId: json['AddonInstanceId'] as String?,
      addonName: json['AddonName'] as String?,
      addonSubscriptionId: json['AddonSubscriptionId'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final addonInstanceArn = this.addonInstanceArn;
    final addonInstanceId = this.addonInstanceId;
    final addonName = this.addonName;
    final addonSubscriptionId = this.addonSubscriptionId;
    final createdTimestamp = this.createdTimestamp;
    return {
      if (addonInstanceArn != null) 'AddonInstanceArn': addonInstanceArn,
      if (addonInstanceId != null) 'AddonInstanceId': addonInstanceId,
      if (addonName != null) 'AddonName': addonName,
      if (addonSubscriptionId != null)
        'AddonSubscriptionId': addonSubscriptionId,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
    };
  }
}

/// A subscription for an Add On representing the acceptance of its terms of use
/// and additional pricing.
class AddonSubscription {
  /// The name of the Add On.
  final String? addonName;

  /// The Amazon Resource Name (ARN) of the Add On subscription.
  final String? addonSubscriptionArn;

  /// The unique ID of the Add On subscription.
  final String? addonSubscriptionId;

  /// The timestamp of when the Add On subscription was created.
  final DateTime? createdTimestamp;

  AddonSubscription({
    this.addonName,
    this.addonSubscriptionArn,
    this.addonSubscriptionId,
    this.createdTimestamp,
  });

  factory AddonSubscription.fromJson(Map<String, dynamic> json) {
    return AddonSubscription(
      addonName: json['AddonName'] as String?,
      addonSubscriptionArn: json['AddonSubscriptionArn'] as String?,
      addonSubscriptionId: json['AddonSubscriptionId'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final addonName = this.addonName;
    final addonSubscriptionArn = this.addonSubscriptionArn;
    final addonSubscriptionId = this.addonSubscriptionId;
    final createdTimestamp = this.createdTimestamp;
    return {
      if (addonName != null) 'AddonName': addonName,
      if (addonSubscriptionArn != null)
        'AddonSubscriptionArn': addonSubscriptionArn,
      if (addonSubscriptionId != null)
        'AddonSubscriptionId': addonSubscriptionId,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
    };
  }
}

/// The result of an analysis can be used in conditions to trigger actions.
/// Analyses can inspect the email content and report a certain aspect of the
/// email.
class Analysis {
  /// The Amazon Resource Name (ARN) of an Add On.
  final String analyzer;

  /// The returned value from an Add On.
  final String resultField;

  Analysis({
    required this.analyzer,
    required this.resultField,
  });

  factory Analysis.fromJson(Map<String, dynamic> json) {
    return Analysis(
      analyzer: json['Analyzer'] as String,
      resultField: json['ResultField'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final analyzer = this.analyzer;
    final resultField = this.resultField;
    return {
      'Analyzer': analyzer,
      'ResultField': resultField,
    };
  }
}

/// An archive resource for storing and retaining emails.
class Archive {
  /// The unique identifier of the archive.
  final String archiveId;

  /// The unique name assigned to the archive.
  final String? archiveName;

  /// The current state of the archive:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> – The archive is ready and available for use.
  /// </li>
  /// <li>
  /// <code>PENDING_DELETION</code> – The archive has been marked for deletion and
  /// will be permanently deleted in 30 days. No further modifications can be made
  /// in this state.
  /// </li>
  /// </ul>
  final ArchiveState? archiveState;

  /// The timestamp of when the archive was last updated.
  final DateTime? lastUpdatedTimestamp;

  Archive({
    required this.archiveId,
    this.archiveName,
    this.archiveState,
    this.lastUpdatedTimestamp,
  });

  factory Archive.fromJson(Map<String, dynamic> json) {
    return Archive(
      archiveId: json['ArchiveId'] as String,
      archiveName: json['ArchiveName'] as String?,
      archiveState: (json['ArchiveState'] as String?)?.toArchiveState(),
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final archiveId = this.archiveId;
    final archiveName = this.archiveName;
    final archiveState = this.archiveState;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    return {
      'ArchiveId': archiveId,
      if (archiveName != null) 'ArchiveName': archiveName,
      if (archiveState != null) 'ArchiveState': archiveState.toValue(),
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
    };
  }
}

/// The action to archive the email by delivering the email to an Amazon SES
/// archive.
class ArchiveAction {
  /// The identifier of the archive to send the email to.
  final String targetArchive;

  /// A policy that states what to do in the case of failure. The action will fail
  /// if there are configuration errors. For example, the specified archive has
  /// been deleted.
  final ActionFailurePolicy? actionFailurePolicy;

  ArchiveAction({
    required this.targetArchive,
    this.actionFailurePolicy,
  });

  factory ArchiveAction.fromJson(Map<String, dynamic> json) {
    return ArchiveAction(
      targetArchive: json['TargetArchive'] as String,
      actionFailurePolicy:
          (json['ActionFailurePolicy'] as String?)?.toActionFailurePolicy(),
    );
  }

  Map<String, dynamic> toJson() {
    final targetArchive = this.targetArchive;
    final actionFailurePolicy = this.actionFailurePolicy;
    return {
      'TargetArchive': targetArchive,
      if (actionFailurePolicy != null)
        'ActionFailurePolicy': actionFailurePolicy.toValue(),
    };
  }
}

enum ArchiveBooleanEmailAttribute {
  hasAttachments,
}

extension ArchiveBooleanEmailAttributeValueExtension
    on ArchiveBooleanEmailAttribute {
  String toValue() {
    switch (this) {
      case ArchiveBooleanEmailAttribute.hasAttachments:
        return 'HAS_ATTACHMENTS';
    }
  }
}

extension ArchiveBooleanEmailAttributeFromString on String {
  ArchiveBooleanEmailAttribute toArchiveBooleanEmailAttribute() {
    switch (this) {
      case 'HAS_ATTACHMENTS':
        return ArchiveBooleanEmailAttribute.hasAttachments;
    }
    throw Exception('$this is not known in enum ArchiveBooleanEmailAttribute');
  }
}

/// A boolean expression to evaluate email attribute values.
class ArchiveBooleanExpression {
  /// The email attribute value to evaluate.
  final ArchiveBooleanToEvaluate evaluate;

  /// The boolean operator to use for evaluation.
  final ArchiveBooleanOperator operator;

  ArchiveBooleanExpression({
    required this.evaluate,
    required this.operator,
  });

  factory ArchiveBooleanExpression.fromJson(Map<String, dynamic> json) {
    return ArchiveBooleanExpression(
      evaluate: ArchiveBooleanToEvaluate.fromJson(
          json['Evaluate'] as Map<String, dynamic>),
      operator: (json['Operator'] as String).toArchiveBooleanOperator(),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    return {
      'Evaluate': evaluate,
      'Operator': operator.toValue(),
    };
  }
}

enum ArchiveBooleanOperator {
  isTrue,
  isFalse,
}

extension ArchiveBooleanOperatorValueExtension on ArchiveBooleanOperator {
  String toValue() {
    switch (this) {
      case ArchiveBooleanOperator.isTrue:
        return 'IS_TRUE';
      case ArchiveBooleanOperator.isFalse:
        return 'IS_FALSE';
    }
  }
}

extension ArchiveBooleanOperatorFromString on String {
  ArchiveBooleanOperator toArchiveBooleanOperator() {
    switch (this) {
      case 'IS_TRUE':
        return ArchiveBooleanOperator.isTrue;
      case 'IS_FALSE':
        return ArchiveBooleanOperator.isFalse;
    }
    throw Exception('$this is not known in enum ArchiveBooleanOperator');
  }
}

/// The attribute to evaluate in a boolean expression.
class ArchiveBooleanToEvaluate {
  /// The name of the email attribute to evaluate.
  final ArchiveBooleanEmailAttribute? attribute;

  ArchiveBooleanToEvaluate({
    this.attribute,
  });

  factory ArchiveBooleanToEvaluate.fromJson(Map<String, dynamic> json) {
    return ArchiveBooleanToEvaluate(
      attribute:
          (json['Attribute'] as String?)?.toArchiveBooleanEmailAttribute(),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    return {
      if (attribute != null) 'Attribute': attribute.toValue(),
    };
  }
}

/// A filter condition used to include or exclude emails when exporting from or
/// searching an archive.
class ArchiveFilterCondition {
  /// A boolean expression to evaluate against email attributes.
  final ArchiveBooleanExpression? booleanExpression;

  /// A string expression to evaluate against email attributes.
  final ArchiveStringExpression? stringExpression;

  ArchiveFilterCondition({
    this.booleanExpression,
    this.stringExpression,
  });

  factory ArchiveFilterCondition.fromJson(Map<String, dynamic> json) {
    return ArchiveFilterCondition(
      booleanExpression: json['BooleanExpression'] != null
          ? ArchiveBooleanExpression.fromJson(
              json['BooleanExpression'] as Map<String, dynamic>)
          : null,
      stringExpression: json['StringExpression'] != null
          ? ArchiveStringExpression.fromJson(
              json['StringExpression'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final booleanExpression = this.booleanExpression;
    final stringExpression = this.stringExpression;
    return {
      if (booleanExpression != null) 'BooleanExpression': booleanExpression,
      if (stringExpression != null) 'StringExpression': stringExpression,
    };
  }
}

/// A set of filter conditions to include and/or exclude emails.
class ArchiveFilters {
  /// The filter conditions for emails to include.
  final List<ArchiveFilterCondition>? include;

  /// The filter conditions for emails to exclude.
  final List<ArchiveFilterCondition>? unless;

  ArchiveFilters({
    this.include,
    this.unless,
  });

  factory ArchiveFilters.fromJson(Map<String, dynamic> json) {
    return ArchiveFilters(
      include: (json['Include'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ArchiveFilterCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      unless: (json['Unless'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ArchiveFilterCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final include = this.include;
    final unless = this.unless;
    return {
      if (include != null) 'Include': include,
      if (unless != null) 'Unless': unless,
    };
  }
}

/// The retention policy for an email archive that specifies how long emails are
/// kept before being automatically deleted.
class ArchiveRetention {
  /// The enum value sets the period for retaining emails in an archive.
  final RetentionPeriod? retentionPeriod;

  ArchiveRetention({
    this.retentionPeriod,
  });

  factory ArchiveRetention.fromJson(Map<String, dynamic> json) {
    return ArchiveRetention(
      retentionPeriod:
          (json['RetentionPeriod'] as String?)?.toRetentionPeriod(),
    );
  }

  Map<String, dynamic> toJson() {
    final retentionPeriod = this.retentionPeriod;
    return {
      if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod.toValue(),
    };
  }
}

enum ArchiveState {
  active,
  pendingDeletion,
}

extension ArchiveStateValueExtension on ArchiveState {
  String toValue() {
    switch (this) {
      case ArchiveState.active:
        return 'ACTIVE';
      case ArchiveState.pendingDeletion:
        return 'PENDING_DELETION';
    }
  }
}

extension ArchiveStateFromString on String {
  ArchiveState toArchiveState() {
    switch (this) {
      case 'ACTIVE':
        return ArchiveState.active;
      case 'PENDING_DELETION':
        return ArchiveState.pendingDeletion;
    }
    throw Exception('$this is not known in enum ArchiveState');
  }
}

enum ArchiveStringEmailAttribute {
  to,
  from,
  cc,
  subject,
}

extension ArchiveStringEmailAttributeValueExtension
    on ArchiveStringEmailAttribute {
  String toValue() {
    switch (this) {
      case ArchiveStringEmailAttribute.to:
        return 'TO';
      case ArchiveStringEmailAttribute.from:
        return 'FROM';
      case ArchiveStringEmailAttribute.cc:
        return 'CC';
      case ArchiveStringEmailAttribute.subject:
        return 'SUBJECT';
    }
  }
}

extension ArchiveStringEmailAttributeFromString on String {
  ArchiveStringEmailAttribute toArchiveStringEmailAttribute() {
    switch (this) {
      case 'TO':
        return ArchiveStringEmailAttribute.to;
      case 'FROM':
        return ArchiveStringEmailAttribute.from;
      case 'CC':
        return ArchiveStringEmailAttribute.cc;
      case 'SUBJECT':
        return ArchiveStringEmailAttribute.subject;
    }
    throw Exception('$this is not known in enum ArchiveStringEmailAttribute');
  }
}

/// A string expression to evaluate an email attribute value against one or more
/// string values.
class ArchiveStringExpression {
  /// The attribute of the email to evaluate.
  final ArchiveStringToEvaluate evaluate;

  /// The operator to use when evaluating the string values.
  final ArchiveStringOperator operator;

  /// The list of string values to evaluate the email attribute against.
  final List<String> values;

  ArchiveStringExpression({
    required this.evaluate,
    required this.operator,
    required this.values,
  });

  factory ArchiveStringExpression.fromJson(Map<String, dynamic> json) {
    return ArchiveStringExpression(
      evaluate: ArchiveStringToEvaluate.fromJson(
          json['Evaluate'] as Map<String, dynamic>),
      operator: (json['Operator'] as String).toArchiveStringOperator(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    final values = this.values;
    return {
      'Evaluate': evaluate,
      'Operator': operator.toValue(),
      'Values': values,
    };
  }
}

enum ArchiveStringOperator {
  contains,
}

extension ArchiveStringOperatorValueExtension on ArchiveStringOperator {
  String toValue() {
    switch (this) {
      case ArchiveStringOperator.contains:
        return 'CONTAINS';
    }
  }
}

extension ArchiveStringOperatorFromString on String {
  ArchiveStringOperator toArchiveStringOperator() {
    switch (this) {
      case 'CONTAINS':
        return ArchiveStringOperator.contains;
    }
    throw Exception('$this is not known in enum ArchiveStringOperator');
  }
}

/// Specifies the email attribute to evaluate in a string expression.
class ArchiveStringToEvaluate {
  /// The name of the email attribute to evaluate.
  final ArchiveStringEmailAttribute? attribute;

  ArchiveStringToEvaluate({
    this.attribute,
  });

  factory ArchiveStringToEvaluate.fromJson(Map<String, dynamic> json) {
    return ArchiveStringToEvaluate(
      attribute:
          (json['Attribute'] as String?)?.toArchiveStringEmailAttribute(),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    return {
      if (attribute != null) 'Attribute': attribute.toValue(),
    };
  }
}

class CreateAddonInstanceResponse {
  /// The unique ID of the Add On instance created by this API.
  final String addonInstanceId;

  CreateAddonInstanceResponse({
    required this.addonInstanceId,
  });

  factory CreateAddonInstanceResponse.fromJson(Map<String, dynamic> json) {
    return CreateAddonInstanceResponse(
      addonInstanceId: json['AddonInstanceId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final addonInstanceId = this.addonInstanceId;
    return {
      'AddonInstanceId': addonInstanceId,
    };
  }
}

class CreateAddonSubscriptionResponse {
  /// The unique ID of the Add On subscription created by this API.
  final String addonSubscriptionId;

  CreateAddonSubscriptionResponse({
    required this.addonSubscriptionId,
  });

  factory CreateAddonSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return CreateAddonSubscriptionResponse(
      addonSubscriptionId: json['AddonSubscriptionId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final addonSubscriptionId = this.addonSubscriptionId;
    return {
      'AddonSubscriptionId': addonSubscriptionId,
    };
  }
}

/// The response from creating a new email archive.
class CreateArchiveResponse {
  /// The unique identifier for the newly created archive.
  final String archiveId;

  CreateArchiveResponse({
    required this.archiveId,
  });

  factory CreateArchiveResponse.fromJson(Map<String, dynamic> json) {
    return CreateArchiveResponse(
      archiveId: json['ArchiveId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final archiveId = this.archiveId;
    return {
      'ArchiveId': archiveId,
    };
  }
}

class CreateIngressPointResponse {
  /// The unique identifier for a previously created ingress endpoint.
  final String ingressPointId;

  CreateIngressPointResponse({
    required this.ingressPointId,
  });

  factory CreateIngressPointResponse.fromJson(Map<String, dynamic> json) {
    return CreateIngressPointResponse(
      ingressPointId: json['IngressPointId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final ingressPointId = this.ingressPointId;
    return {
      'IngressPointId': ingressPointId,
    };
  }
}

class CreateRelayResponse {
  /// A unique identifier of the created relay resource.
  final String relayId;

  CreateRelayResponse({
    required this.relayId,
  });

  factory CreateRelayResponse.fromJson(Map<String, dynamic> json) {
    return CreateRelayResponse(
      relayId: json['RelayId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final relayId = this.relayId;
    return {
      'RelayId': relayId,
    };
  }
}

class CreateRuleSetResponse {
  /// The identifier of the created rule set.
  final String ruleSetId;

  CreateRuleSetResponse({
    required this.ruleSetId,
  });

  factory CreateRuleSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateRuleSetResponse(
      ruleSetId: json['RuleSetId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleSetId = this.ruleSetId;
    return {
      'RuleSetId': ruleSetId,
    };
  }
}

class CreateTrafficPolicyResponse {
  /// The identifier of the traffic policy resource.
  final String trafficPolicyId;

  CreateTrafficPolicyResponse({
    required this.trafficPolicyId,
  });

  factory CreateTrafficPolicyResponse.fromJson(Map<String, dynamic> json) {
    return CreateTrafficPolicyResponse(
      trafficPolicyId: json['TrafficPolicyId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final trafficPolicyId = this.trafficPolicyId;
    return {
      'TrafficPolicyId': trafficPolicyId,
    };
  }
}

class DeleteAddonInstanceResponse {
  DeleteAddonInstanceResponse();

  factory DeleteAddonInstanceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAddonInstanceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAddonSubscriptionResponse {
  DeleteAddonSubscriptionResponse();

  factory DeleteAddonSubscriptionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAddonSubscriptionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The response indicating if the archive deletion was successfully initiated.
///
/// On success, returns an HTTP 200 status code. On failure, returns an error
/// message.
class DeleteArchiveResponse {
  DeleteArchiveResponse();

  factory DeleteArchiveResponse.fromJson(Map<String, dynamic> _) {
    return DeleteArchiveResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteIngressPointResponse {
  DeleteIngressPointResponse();

  factory DeleteIngressPointResponse.fromJson(Map<String, dynamic> _) {
    return DeleteIngressPointResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteRelayResponse {
  DeleteRelayResponse();

  factory DeleteRelayResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRelayResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteRuleSetResponse {
  DeleteRuleSetResponse();

  factory DeleteRuleSetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRuleSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteTrafficPolicyResponse {
  DeleteTrafficPolicyResponse();

  factory DeleteTrafficPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteTrafficPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// This action to delivers an email to a mailbox.
class DeliverToMailboxAction {
  /// The Amazon Resource Name (ARN) of a WorkMail organization to deliver the
  /// email to.
  final String mailboxArn;

  /// The Amazon Resource Name (ARN) of an IAM role to use to execute this action.
  /// The role must have access to the workmail:DeliverToMailbox API.
  final String roleArn;

  /// A policy that states what to do in the case of failure. The action will fail
  /// if there are configuration errors. For example, the mailbox ARN is no longer
  /// valid.
  final ActionFailurePolicy? actionFailurePolicy;

  DeliverToMailboxAction({
    required this.mailboxArn,
    required this.roleArn,
    this.actionFailurePolicy,
  });

  factory DeliverToMailboxAction.fromJson(Map<String, dynamic> json) {
    return DeliverToMailboxAction(
      mailboxArn: json['MailboxArn'] as String,
      roleArn: json['RoleArn'] as String,
      actionFailurePolicy:
          (json['ActionFailurePolicy'] as String?)?.toActionFailurePolicy(),
    );
  }

  Map<String, dynamic> toJson() {
    final mailboxArn = this.mailboxArn;
    final roleArn = this.roleArn;
    final actionFailurePolicy = this.actionFailurePolicy;
    return {
      'MailboxArn': mailboxArn,
      'RoleArn': roleArn,
      if (actionFailurePolicy != null)
        'ActionFailurePolicy': actionFailurePolicy.toValue(),
    };
  }
}

/// This action causes processing to stop and the email to be dropped. If the
/// action applies only to certain recipients, only those recipients are
/// dropped, and processing continues for other recipients.
class DropAction {
  DropAction();

  factory DropAction.fromJson(Map<String, dynamic> _) {
    return DropAction();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The destination configuration for delivering exported email data.
class ExportDestinationConfiguration {
  /// Configuration for delivering to an Amazon S3 bucket.
  final S3ExportDestinationConfiguration? s3;

  ExportDestinationConfiguration({
    this.s3,
  });

  factory ExportDestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return ExportDestinationConfiguration(
      s3: json['S3'] != null
          ? S3ExportDestinationConfiguration.fromJson(
              json['S3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3 = this.s3;
    return {
      if (s3 != null) 'S3': s3,
    };
  }
}

enum ExportState {
  queued,
  preprocessing,
  processing,
  completed,
  failed,
  cancelled,
}

extension ExportStateValueExtension on ExportState {
  String toValue() {
    switch (this) {
      case ExportState.queued:
        return 'QUEUED';
      case ExportState.preprocessing:
        return 'PREPROCESSING';
      case ExportState.processing:
        return 'PROCESSING';
      case ExportState.completed:
        return 'COMPLETED';
      case ExportState.failed:
        return 'FAILED';
      case ExportState.cancelled:
        return 'CANCELLED';
    }
  }
}

extension ExportStateFromString on String {
  ExportState toExportState() {
    switch (this) {
      case 'QUEUED':
        return ExportState.queued;
      case 'PREPROCESSING':
        return ExportState.preprocessing;
      case 'PROCESSING':
        return ExportState.processing;
      case 'COMPLETED':
        return ExportState.completed;
      case 'FAILED':
        return ExportState.failed;
      case 'CANCELLED':
        return ExportState.cancelled;
    }
    throw Exception('$this is not known in enum ExportState');
  }
}

/// The current status of an archive export job.
class ExportStatus {
  /// The timestamp of when the export job completed (if finished).
  final DateTime? completionTimestamp;

  /// An error message if the export job failed.
  final String? errorMessage;

  /// The current state of the export job.
  final ExportState? state;

  /// The timestamp of when the export job was submitted.
  final DateTime? submissionTimestamp;

  ExportStatus({
    this.completionTimestamp,
    this.errorMessage,
    this.state,
    this.submissionTimestamp,
  });

  factory ExportStatus.fromJson(Map<String, dynamic> json) {
    return ExportStatus(
      completionTimestamp: timeStampFromJson(json['CompletionTimestamp']),
      errorMessage: json['ErrorMessage'] as String?,
      state: (json['State'] as String?)?.toExportState(),
      submissionTimestamp: timeStampFromJson(json['SubmissionTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final completionTimestamp = this.completionTimestamp;
    final errorMessage = this.errorMessage;
    final state = this.state;
    final submissionTimestamp = this.submissionTimestamp;
    return {
      if (completionTimestamp != null)
        'CompletionTimestamp': unixTimestampToJson(completionTimestamp),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (state != null) 'State': state.toValue(),
      if (submissionTimestamp != null)
        'SubmissionTimestamp': unixTimestampToJson(submissionTimestamp),
    };
  }
}

/// Summary statuses of an archive export job.
class ExportSummary {
  /// The unique identifier of the export job.
  final String? exportId;

  /// The current status of the export job.
  final ExportStatus? status;

  ExportSummary({
    this.exportId,
    this.status,
  });

  factory ExportSummary.fromJson(Map<String, dynamic> json) {
    return ExportSummary(
      exportId: json['ExportId'] as String?,
      status: json['Status'] != null
          ? ExportStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final exportId = this.exportId;
    final status = this.status;
    return {
      if (exportId != null) 'ExportId': exportId,
      if (status != null) 'Status': status,
    };
  }
}

class GetAddonInstanceResponse {
  /// The Amazon Resource Name (ARN) of the Add On instance.
  final String? addonInstanceArn;

  /// The name of the Add On provider associated to the subscription of the
  /// instance.
  final String? addonName;

  /// The subscription ID associated to the instance.
  final String? addonSubscriptionId;

  /// The timestamp of when the Add On instance was created.
  final DateTime? createdTimestamp;

  GetAddonInstanceResponse({
    this.addonInstanceArn,
    this.addonName,
    this.addonSubscriptionId,
    this.createdTimestamp,
  });

  factory GetAddonInstanceResponse.fromJson(Map<String, dynamic> json) {
    return GetAddonInstanceResponse(
      addonInstanceArn: json['AddonInstanceArn'] as String?,
      addonName: json['AddonName'] as String?,
      addonSubscriptionId: json['AddonSubscriptionId'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final addonInstanceArn = this.addonInstanceArn;
    final addonName = this.addonName;
    final addonSubscriptionId = this.addonSubscriptionId;
    final createdTimestamp = this.createdTimestamp;
    return {
      if (addonInstanceArn != null) 'AddonInstanceArn': addonInstanceArn,
      if (addonName != null) 'AddonName': addonName,
      if (addonSubscriptionId != null)
        'AddonSubscriptionId': addonSubscriptionId,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
    };
  }
}

class GetAddonSubscriptionResponse {
  /// The name of the Add On for the subscription.
  final String? addonName;

  /// Amazon Resource Name (ARN) for the subscription.
  final String? addonSubscriptionArn;

  /// The timestamp of when the Add On subscription was created.
  final DateTime? createdTimestamp;

  GetAddonSubscriptionResponse({
    this.addonName,
    this.addonSubscriptionArn,
    this.createdTimestamp,
  });

  factory GetAddonSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return GetAddonSubscriptionResponse(
      addonName: json['AddonName'] as String?,
      addonSubscriptionArn: json['AddonSubscriptionArn'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final addonName = this.addonName;
    final addonSubscriptionArn = this.addonSubscriptionArn;
    final createdTimestamp = this.createdTimestamp;
    return {
      if (addonName != null) 'AddonName': addonName,
      if (addonSubscriptionArn != null)
        'AddonSubscriptionArn': addonSubscriptionArn,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
    };
  }
}

/// The response containing details of the specified archive export job.
class GetArchiveExportResponse {
  /// The identifier of the archive the email export was performed from.
  final String? archiveId;

  /// Where the exported emails are being delivered.
  final ExportDestinationConfiguration? exportDestinationConfiguration;

  /// The criteria used to filter emails included in the export.
  final ArchiveFilters? filters;

  /// The start of the timestamp range the exported emails cover.
  final DateTime? fromTimestamp;

  /// The maximum number of email items included in the export.
  final int? maxResults;

  /// The current status of the export job.
  final ExportStatus? status;

  /// The end of the date range the exported emails cover.
  final DateTime? toTimestamp;

  GetArchiveExportResponse({
    this.archiveId,
    this.exportDestinationConfiguration,
    this.filters,
    this.fromTimestamp,
    this.maxResults,
    this.status,
    this.toTimestamp,
  });

  factory GetArchiveExportResponse.fromJson(Map<String, dynamic> json) {
    return GetArchiveExportResponse(
      archiveId: json['ArchiveId'] as String?,
      exportDestinationConfiguration: json['ExportDestinationConfiguration'] !=
              null
          ? ExportDestinationConfiguration.fromJson(
              json['ExportDestinationConfiguration'] as Map<String, dynamic>)
          : null,
      filters: json['Filters'] != null
          ? ArchiveFilters.fromJson(json['Filters'] as Map<String, dynamic>)
          : null,
      fromTimestamp: timeStampFromJson(json['FromTimestamp']),
      maxResults: json['MaxResults'] as int?,
      status: json['Status'] != null
          ? ExportStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
      toTimestamp: timeStampFromJson(json['ToTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final archiveId = this.archiveId;
    final exportDestinationConfiguration = this.exportDestinationConfiguration;
    final filters = this.filters;
    final fromTimestamp = this.fromTimestamp;
    final maxResults = this.maxResults;
    final status = this.status;
    final toTimestamp = this.toTimestamp;
    return {
      if (archiveId != null) 'ArchiveId': archiveId,
      if (exportDestinationConfiguration != null)
        'ExportDestinationConfiguration': exportDestinationConfiguration,
      if (filters != null) 'Filters': filters,
      if (fromTimestamp != null)
        'FromTimestamp': unixTimestampToJson(fromTimestamp),
      if (maxResults != null) 'MaxResults': maxResults,
      if (status != null) 'Status': status,
      if (toTimestamp != null) 'ToTimestamp': unixTimestampToJson(toTimestamp),
    };
  }
}

/// The response containing the textual content of the requested archived email
/// message.
class GetArchiveMessageContentResponse {
  /// The textual body content of the email message.
  final MessageBody? body;

  GetArchiveMessageContentResponse({
    this.body,
  });

  factory GetArchiveMessageContentResponse.fromJson(Map<String, dynamic> json) {
    return GetArchiveMessageContentResponse(
      body: json['Body'] != null
          ? MessageBody.fromJson(json['Body'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final body = this.body;
    return {
      if (body != null) 'Body': body,
    };
  }
}

/// The response containing details about the requested archived email message.
class GetArchiveMessageResponse {
  /// A pre-signed URL to temporarily download the full message content.
  final String? messageDownloadLink;

  GetArchiveMessageResponse({
    this.messageDownloadLink,
  });

  factory GetArchiveMessageResponse.fromJson(Map<String, dynamic> json) {
    return GetArchiveMessageResponse(
      messageDownloadLink: json['MessageDownloadLink'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messageDownloadLink = this.messageDownloadLink;
    return {
      if (messageDownloadLink != null)
        'MessageDownloadLink': messageDownloadLink,
    };
  }
}

/// The response containing details of the requested archive.
class GetArchiveResponse {
  /// The Amazon Resource Name (ARN) of the archive.
  final String archiveArn;

  /// The unique identifier of the archive.
  final String archiveId;

  /// The unique name assigned to the archive.
  final String archiveName;

  /// The current state of the archive:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> – The archive is ready and available for use.
  /// </li>
  /// <li>
  /// <code>PENDING_DELETION</code> – The archive has been marked for deletion and
  /// will be permanently deleted in 30 days. No further modifications can be made
  /// in this state.
  /// </li>
  /// </ul>
  final ArchiveState archiveState;

  /// The retention period for emails in this archive.
  final ArchiveRetention retention;

  /// The timestamp of when the archive was created.
  final DateTime? createdTimestamp;

  /// The Amazon Resource Name (ARN) of the KMS key used to encrypt the archive.
  final String? kmsKeyArn;

  /// The timestamp of when the archive was modified.
  final DateTime? lastUpdatedTimestamp;

  GetArchiveResponse({
    required this.archiveArn,
    required this.archiveId,
    required this.archiveName,
    required this.archiveState,
    required this.retention,
    this.createdTimestamp,
    this.kmsKeyArn,
    this.lastUpdatedTimestamp,
  });

  factory GetArchiveResponse.fromJson(Map<String, dynamic> json) {
    return GetArchiveResponse(
      archiveArn: json['ArchiveArn'] as String,
      archiveId: json['ArchiveId'] as String,
      archiveName: json['ArchiveName'] as String,
      archiveState: (json['ArchiveState'] as String).toArchiveState(),
      retention:
          ArchiveRetention.fromJson(json['Retention'] as Map<String, dynamic>),
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      kmsKeyArn: json['KmsKeyArn'] as String?,
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final archiveArn = this.archiveArn;
    final archiveId = this.archiveId;
    final archiveName = this.archiveName;
    final archiveState = this.archiveState;
    final retention = this.retention;
    final createdTimestamp = this.createdTimestamp;
    final kmsKeyArn = this.kmsKeyArn;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    return {
      'ArchiveArn': archiveArn,
      'ArchiveId': archiveId,
      'ArchiveName': archiveName,
      'ArchiveState': archiveState.toValue(),
      'Retention': retention,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
    };
  }
}

/// The response containing details of the specified archive search job.
class GetArchiveSearchResponse {
  /// The identifier of the archive the email search was performed in.
  final String? archiveId;

  /// The criteria used to filter emails included in the search.
  final ArchiveFilters? filters;

  /// The start timestamp of the range the searched emails cover.
  final DateTime? fromTimestamp;

  /// The maximum number of search results to return.
  final int? maxResults;

  /// The current status of the search job.
  final SearchStatus? status;

  /// The end timestamp of the range the searched emails cover.
  final DateTime? toTimestamp;

  GetArchiveSearchResponse({
    this.archiveId,
    this.filters,
    this.fromTimestamp,
    this.maxResults,
    this.status,
    this.toTimestamp,
  });

  factory GetArchiveSearchResponse.fromJson(Map<String, dynamic> json) {
    return GetArchiveSearchResponse(
      archiveId: json['ArchiveId'] as String?,
      filters: json['Filters'] != null
          ? ArchiveFilters.fromJson(json['Filters'] as Map<String, dynamic>)
          : null,
      fromTimestamp: timeStampFromJson(json['FromTimestamp']),
      maxResults: json['MaxResults'] as int?,
      status: json['Status'] != null
          ? SearchStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
      toTimestamp: timeStampFromJson(json['ToTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final archiveId = this.archiveId;
    final filters = this.filters;
    final fromTimestamp = this.fromTimestamp;
    final maxResults = this.maxResults;
    final status = this.status;
    final toTimestamp = this.toTimestamp;
    return {
      if (archiveId != null) 'ArchiveId': archiveId,
      if (filters != null) 'Filters': filters,
      if (fromTimestamp != null)
        'FromTimestamp': unixTimestampToJson(fromTimestamp),
      if (maxResults != null) 'MaxResults': maxResults,
      if (status != null) 'Status': status,
      if (toTimestamp != null) 'ToTimestamp': unixTimestampToJson(toTimestamp),
    };
  }
}

/// The response containing search results from a completed archive search.
class GetArchiveSearchResultsResponse {
  /// The list of email result objects matching the search criteria.
  final List<Row>? rows;

  GetArchiveSearchResultsResponse({
    this.rows,
  });

  factory GetArchiveSearchResultsResponse.fromJson(Map<String, dynamic> json) {
    return GetArchiveSearchResultsResponse(
      rows: (json['Rows'] as List?)
          ?.whereNotNull()
          .map((e) => Row.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rows = this.rows;
    return {
      if (rows != null) 'Rows': rows,
    };
  }
}

class GetIngressPointResponse {
  /// The identifier of an ingress endpoint resource.
  final String ingressPointId;

  /// A user friendly name for the ingress endpoint.
  final String ingressPointName;

  /// The DNS A Record that identifies your ingress endpoint. Configure your DNS
  /// Mail Exchange (MX) record with this value to route emails to Mail Manager.
  final String? aRecord;

  /// The timestamp of when the ingress endpoint was created.
  final DateTime? createdTimestamp;

  /// The Amazon Resource Name (ARN) of the ingress endpoint resource.
  final String? ingressPointArn;

  /// The authentication configuration of the ingress endpoint resource.
  final IngressPointAuthConfiguration? ingressPointAuthConfiguration;

  /// The timestamp of when the ingress endpoint was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The identifier of a rule set resource associated with the ingress endpoint.
  final String? ruleSetId;

  /// The status of the ingress endpoint resource.
  final IngressPointStatus? status;

  /// The identifier of the traffic policy resource associated with the ingress
  /// endpoint.
  final String? trafficPolicyId;

  /// The type of ingress endpoint.
  final IngressPointType? type;

  GetIngressPointResponse({
    required this.ingressPointId,
    required this.ingressPointName,
    this.aRecord,
    this.createdTimestamp,
    this.ingressPointArn,
    this.ingressPointAuthConfiguration,
    this.lastUpdatedTimestamp,
    this.ruleSetId,
    this.status,
    this.trafficPolicyId,
    this.type,
  });

  factory GetIngressPointResponse.fromJson(Map<String, dynamic> json) {
    return GetIngressPointResponse(
      ingressPointId: json['IngressPointId'] as String,
      ingressPointName: json['IngressPointName'] as String,
      aRecord: json['ARecord'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      ingressPointArn: json['IngressPointArn'] as String?,
      ingressPointAuthConfiguration:
          json['IngressPointAuthConfiguration'] != null
              ? IngressPointAuthConfiguration.fromJson(
                  json['IngressPointAuthConfiguration'] as Map<String, dynamic>)
              : null,
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      ruleSetId: json['RuleSetId'] as String?,
      status: (json['Status'] as String?)?.toIngressPointStatus(),
      trafficPolicyId: json['TrafficPolicyId'] as String?,
      type: (json['Type'] as String?)?.toIngressPointType(),
    );
  }

  Map<String, dynamic> toJson() {
    final ingressPointId = this.ingressPointId;
    final ingressPointName = this.ingressPointName;
    final aRecord = this.aRecord;
    final createdTimestamp = this.createdTimestamp;
    final ingressPointArn = this.ingressPointArn;
    final ingressPointAuthConfiguration = this.ingressPointAuthConfiguration;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final ruleSetId = this.ruleSetId;
    final status = this.status;
    final trafficPolicyId = this.trafficPolicyId;
    final type = this.type;
    return {
      'IngressPointId': ingressPointId,
      'IngressPointName': ingressPointName,
      if (aRecord != null) 'ARecord': aRecord,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (ingressPointArn != null) 'IngressPointArn': ingressPointArn,
      if (ingressPointAuthConfiguration != null)
        'IngressPointAuthConfiguration': ingressPointAuthConfiguration,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (ruleSetId != null) 'RuleSetId': ruleSetId,
      if (status != null) 'Status': status.toValue(),
      if (trafficPolicyId != null) 'TrafficPolicyId': trafficPolicyId,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

class GetRelayResponse {
  /// The unique relay identifier.
  final String relayId;

  /// The authentication attribute—contains the secret ARN where the customer
  /// relay server credentials are stored.
  final RelayAuthentication? authentication;

  /// The timestamp of when the relay was created.
  final DateTime? createdTimestamp;

  /// The timestamp of when relay was last updated.
  final DateTime? lastModifiedTimestamp;

  /// The Amazon Resource Name (ARN) of the relay.
  final String? relayArn;

  /// The unique name of the relay.
  final String? relayName;

  /// The destination relay server address.
  final String? serverName;

  /// The destination relay server port.
  final int? serverPort;

  GetRelayResponse({
    required this.relayId,
    this.authentication,
    this.createdTimestamp,
    this.lastModifiedTimestamp,
    this.relayArn,
    this.relayName,
    this.serverName,
    this.serverPort,
  });

  factory GetRelayResponse.fromJson(Map<String, dynamic> json) {
    return GetRelayResponse(
      relayId: json['RelayId'] as String,
      authentication: json['Authentication'] != null
          ? RelayAuthentication.fromJson(
              json['Authentication'] as Map<String, dynamic>)
          : null,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      lastModifiedTimestamp: timeStampFromJson(json['LastModifiedTimestamp']),
      relayArn: json['RelayArn'] as String?,
      relayName: json['RelayName'] as String?,
      serverName: json['ServerName'] as String?,
      serverPort: json['ServerPort'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final relayId = this.relayId;
    final authentication = this.authentication;
    final createdTimestamp = this.createdTimestamp;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final relayArn = this.relayArn;
    final relayName = this.relayName;
    final serverName = this.serverName;
    final serverPort = this.serverPort;
    return {
      'RelayId': relayId,
      if (authentication != null) 'Authentication': authentication,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (lastModifiedTimestamp != null)
        'LastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (relayArn != null) 'RelayArn': relayArn,
      if (relayName != null) 'RelayName': relayName,
      if (serverName != null) 'ServerName': serverName,
      if (serverPort != null) 'ServerPort': serverPort,
    };
  }
}

class GetRuleSetResponse {
  /// The date of when then rule set was created.
  final DateTime createdDate;

  /// The date of when the rule set was last modified.
  final DateTime lastModificationDate;

  /// The Amazon Resource Name (ARN) of the rule set resource.
  final String ruleSetArn;

  /// The identifier of the rule set resource.
  final String ruleSetId;

  /// A user-friendly name for the rule set resource.
  final String ruleSetName;

  /// The rules contained in the rule set.
  final List<Rule> rules;

  GetRuleSetResponse({
    required this.createdDate,
    required this.lastModificationDate,
    required this.ruleSetArn,
    required this.ruleSetId,
    required this.ruleSetName,
    required this.rules,
  });

  factory GetRuleSetResponse.fromJson(Map<String, dynamic> json) {
    return GetRuleSetResponse(
      createdDate: nonNullableTimeStampFromJson(json['CreatedDate'] as Object),
      lastModificationDate:
          nonNullableTimeStampFromJson(json['LastModificationDate'] as Object),
      ruleSetArn: json['RuleSetArn'] as String,
      ruleSetId: json['RuleSetId'] as String,
      ruleSetName: json['RuleSetName'] as String,
      rules: (json['Rules'] as List)
          .whereNotNull()
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdDate = this.createdDate;
    final lastModificationDate = this.lastModificationDate;
    final ruleSetArn = this.ruleSetArn;
    final ruleSetId = this.ruleSetId;
    final ruleSetName = this.ruleSetName;
    final rules = this.rules;
    return {
      'CreatedDate': unixTimestampToJson(createdDate),
      'LastModificationDate': unixTimestampToJson(lastModificationDate),
      'RuleSetArn': ruleSetArn,
      'RuleSetId': ruleSetId,
      'RuleSetName': ruleSetName,
      'Rules': rules,
    };
  }
}

class GetTrafficPolicyResponse {
  /// The identifier of the traffic policy resource.
  final String trafficPolicyId;

  /// A user-friendly name for the traffic policy resource.
  final String trafficPolicyName;

  /// The timestamp of when the traffic policy was created.
  final DateTime? createdTimestamp;

  /// The default action of the traffic policy.
  final AcceptAction? defaultAction;

  /// The timestamp of when the traffic policy was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The maximum message size in bytes of email which is allowed in by this
  /// traffic policy—anything larger will be blocked.
  final int? maxMessageSizeBytes;

  /// The list of conditions which are in the traffic policy resource.
  final List<PolicyStatement>? policyStatements;

  /// The Amazon Resource Name (ARN) of the traffic policy resource.
  final String? trafficPolicyArn;

  GetTrafficPolicyResponse({
    required this.trafficPolicyId,
    required this.trafficPolicyName,
    this.createdTimestamp,
    this.defaultAction,
    this.lastUpdatedTimestamp,
    this.maxMessageSizeBytes,
    this.policyStatements,
    this.trafficPolicyArn,
  });

  factory GetTrafficPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetTrafficPolicyResponse(
      trafficPolicyId: json['TrafficPolicyId'] as String,
      trafficPolicyName: json['TrafficPolicyName'] as String,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      defaultAction: (json['DefaultAction'] as String?)?.toAcceptAction(),
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      maxMessageSizeBytes: json['MaxMessageSizeBytes'] as int?,
      policyStatements: (json['PolicyStatements'] as List?)
          ?.whereNotNull()
          .map((e) => PolicyStatement.fromJson(e as Map<String, dynamic>))
          .toList(),
      trafficPolicyArn: json['TrafficPolicyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final trafficPolicyId = this.trafficPolicyId;
    final trafficPolicyName = this.trafficPolicyName;
    final createdTimestamp = this.createdTimestamp;
    final defaultAction = this.defaultAction;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final maxMessageSizeBytes = this.maxMessageSizeBytes;
    final policyStatements = this.policyStatements;
    final trafficPolicyArn = this.trafficPolicyArn;
    return {
      'TrafficPolicyId': trafficPolicyId,
      'TrafficPolicyName': trafficPolicyName,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (defaultAction != null) 'DefaultAction': defaultAction.toValue(),
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (maxMessageSizeBytes != null)
        'MaxMessageSizeBytes': maxMessageSizeBytes,
      if (policyStatements != null) 'PolicyStatements': policyStatements,
      if (trafficPolicyArn != null) 'TrafficPolicyArn': trafficPolicyArn,
    };
  }
}

/// The Add On ARN and its returned value that is evaluated in a policy
/// statement's conditional expression to either deny or block the incoming
/// email.
class IngressAnalysis {
  /// The Amazon Resource Name (ARN) of an Add On.
  final String analyzer;

  /// The returned value from an Add On.
  final String resultField;

  IngressAnalysis({
    required this.analyzer,
    required this.resultField,
  });

  factory IngressAnalysis.fromJson(Map<String, dynamic> json) {
    return IngressAnalysis(
      analyzer: json['Analyzer'] as String,
      resultField: json['ResultField'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final analyzer = this.analyzer;
    final resultField = this.resultField;
    return {
      'Analyzer': analyzer,
      'ResultField': resultField,
    };
  }
}

/// The structure for a boolean condition matching on the incoming mail.
class IngressBooleanExpression {
  /// The operand on which to perform a boolean condition operation.
  final IngressBooleanToEvaluate evaluate;

  /// The matching operator for a boolean condition expression.
  final IngressBooleanOperator operator;

  IngressBooleanExpression({
    required this.evaluate,
    required this.operator,
  });

  factory IngressBooleanExpression.fromJson(Map<String, dynamic> json) {
    return IngressBooleanExpression(
      evaluate: IngressBooleanToEvaluate.fromJson(
          json['Evaluate'] as Map<String, dynamic>),
      operator: (json['Operator'] as String).toIngressBooleanOperator(),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    return {
      'Evaluate': evaluate,
      'Operator': operator.toValue(),
    };
  }
}

enum IngressBooleanOperator {
  isTrue,
  isFalse,
}

extension IngressBooleanOperatorValueExtension on IngressBooleanOperator {
  String toValue() {
    switch (this) {
      case IngressBooleanOperator.isTrue:
        return 'IS_TRUE';
      case IngressBooleanOperator.isFalse:
        return 'IS_FALSE';
    }
  }
}

extension IngressBooleanOperatorFromString on String {
  IngressBooleanOperator toIngressBooleanOperator() {
    switch (this) {
      case 'IS_TRUE':
        return IngressBooleanOperator.isTrue;
      case 'IS_FALSE':
        return IngressBooleanOperator.isFalse;
    }
    throw Exception('$this is not known in enum IngressBooleanOperator');
  }
}

/// The union type representing the allowed types of operands for a boolean
/// condition.
class IngressBooleanToEvaluate {
  /// The structure type for a boolean condition stating the Add On ARN and its
  /// returned value.
  final IngressAnalysis? analysis;

  IngressBooleanToEvaluate({
    this.analysis,
  });

  factory IngressBooleanToEvaluate.fromJson(Map<String, dynamic> json) {
    return IngressBooleanToEvaluate(
      analysis: json['Analysis'] != null
          ? IngressAnalysis.fromJson(json['Analysis'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final analysis = this.analysis;
    return {
      if (analysis != null) 'Analysis': analysis,
    };
  }
}

enum IngressIpOperator {
  cidrMatches,
  notCidrMatches,
}

extension IngressIpOperatorValueExtension on IngressIpOperator {
  String toValue() {
    switch (this) {
      case IngressIpOperator.cidrMatches:
        return 'CIDR_MATCHES';
      case IngressIpOperator.notCidrMatches:
        return 'NOT_CIDR_MATCHES';
    }
  }
}

extension IngressIpOperatorFromString on String {
  IngressIpOperator toIngressIpOperator() {
    switch (this) {
      case 'CIDR_MATCHES':
        return IngressIpOperator.cidrMatches;
      case 'NOT_CIDR_MATCHES':
        return IngressIpOperator.notCidrMatches;
    }
    throw Exception('$this is not known in enum IngressIpOperator');
  }
}

/// The structure for an IP based condition matching on the incoming mail.
class IngressIpToEvaluate {
  /// An enum type representing the allowed attribute types for an IP condition.
  final IngressIpv4Attribute? attribute;

  IngressIpToEvaluate({
    this.attribute,
  });

  factory IngressIpToEvaluate.fromJson(Map<String, dynamic> json) {
    return IngressIpToEvaluate(
      attribute: (json['Attribute'] as String?)?.toIngressIpv4Attribute(),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    return {
      if (attribute != null) 'Attribute': attribute.toValue(),
    };
  }
}

enum IngressIpv4Attribute {
  senderIp,
}

extension IngressIpv4AttributeValueExtension on IngressIpv4Attribute {
  String toValue() {
    switch (this) {
      case IngressIpv4Attribute.senderIp:
        return 'SENDER_IP';
    }
  }
}

extension IngressIpv4AttributeFromString on String {
  IngressIpv4Attribute toIngressIpv4Attribute() {
    switch (this) {
      case 'SENDER_IP':
        return IngressIpv4Attribute.senderIp;
    }
    throw Exception('$this is not known in enum IngressIpv4Attribute');
  }
}

/// The union type representing the allowed types for the left hand side of an
/// IP condition.
class IngressIpv4Expression {
  /// The left hand side argument of an IP condition expression.
  final IngressIpToEvaluate evaluate;

  /// The matching operator for an IP condition expression.
  final IngressIpOperator operator;

  /// The right hand side argument of an IP condition expression.
  final List<String> values;

  IngressIpv4Expression({
    required this.evaluate,
    required this.operator,
    required this.values,
  });

  factory IngressIpv4Expression.fromJson(Map<String, dynamic> json) {
    return IngressIpv4Expression(
      evaluate: IngressIpToEvaluate.fromJson(
          json['Evaluate'] as Map<String, dynamic>),
      operator: (json['Operator'] as String).toIngressIpOperator(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    final values = this.values;
    return {
      'Evaluate': evaluate,
      'Operator': operator.toValue(),
      'Values': values,
    };
  }
}

/// The structure of an ingress endpoint resource.
class IngressPoint {
  /// The identifier of the ingress endpoint resource.
  final String ingressPointId;

  /// A user friendly name for the ingress endpoint resource.
  final String ingressPointName;

  /// The status of the ingress endpoint resource.
  final IngressPointStatus status;

  /// The type of ingress endpoint resource.
  final IngressPointType type;

  /// The DNS A Record that identifies your ingress endpoint. Configure your DNS
  /// Mail Exchange (MX) record with this value to route emails to Mail Manager.
  final String? aRecord;

  IngressPoint({
    required this.ingressPointId,
    required this.ingressPointName,
    required this.status,
    required this.type,
    this.aRecord,
  });

  factory IngressPoint.fromJson(Map<String, dynamic> json) {
    return IngressPoint(
      ingressPointId: json['IngressPointId'] as String,
      ingressPointName: json['IngressPointName'] as String,
      status: (json['Status'] as String).toIngressPointStatus(),
      type: (json['Type'] as String).toIngressPointType(),
      aRecord: json['ARecord'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ingressPointId = this.ingressPointId;
    final ingressPointName = this.ingressPointName;
    final status = this.status;
    final type = this.type;
    final aRecord = this.aRecord;
    return {
      'IngressPointId': ingressPointId,
      'IngressPointName': ingressPointName,
      'Status': status.toValue(),
      'Type': type.toValue(),
      if (aRecord != null) 'ARecord': aRecord,
    };
  }
}

/// The authentication configuration for the ingress endpoint resource.
class IngressPointAuthConfiguration {
  /// The ingress endpoint password configuration for the ingress endpoint
  /// resource.
  final IngressPointPasswordConfiguration? ingressPointPasswordConfiguration;

  /// The ingress endpoint SecretsManager::Secret ARN configuration for the
  /// ingress endpoint resource.
  final String? secretArn;

  IngressPointAuthConfiguration({
    this.ingressPointPasswordConfiguration,
    this.secretArn,
  });

  factory IngressPointAuthConfiguration.fromJson(Map<String, dynamic> json) {
    return IngressPointAuthConfiguration(
      ingressPointPasswordConfiguration:
          json['IngressPointPasswordConfiguration'] != null
              ? IngressPointPasswordConfiguration.fromJson(
                  json['IngressPointPasswordConfiguration']
                      as Map<String, dynamic>)
              : null,
      secretArn: json['SecretArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ingressPointPasswordConfiguration =
        this.ingressPointPasswordConfiguration;
    final secretArn = this.secretArn;
    return {
      if (ingressPointPasswordConfiguration != null)
        'IngressPointPasswordConfiguration': ingressPointPasswordConfiguration,
      if (secretArn != null) 'SecretArn': secretArn,
    };
  }
}

/// The configuration of the ingress endpoint resource.
class IngressPointConfiguration {
  /// The SecretsManager::Secret ARN of the ingress endpoint resource.
  final String? secretArn;

  /// The password of the ingress endpoint resource.
  final String? smtpPassword;

  IngressPointConfiguration({
    this.secretArn,
    this.smtpPassword,
  });

  Map<String, dynamic> toJson() {
    final secretArn = this.secretArn;
    final smtpPassword = this.smtpPassword;
    return {
      if (secretArn != null) 'SecretArn': secretArn,
      if (smtpPassword != null) 'SmtpPassword': smtpPassword,
    };
  }
}

/// The password configuration of the ingress endpoint resource.
class IngressPointPasswordConfiguration {
  /// The previous password expiry timestamp of the ingress endpoint resource.
  final DateTime? previousSmtpPasswordExpiryTimestamp;

  /// The previous password version of the ingress endpoint resource.
  final String? previousSmtpPasswordVersion;

  /// The current password expiry timestamp of the ingress endpoint resource.
  final String? smtpPasswordVersion;

  IngressPointPasswordConfiguration({
    this.previousSmtpPasswordExpiryTimestamp,
    this.previousSmtpPasswordVersion,
    this.smtpPasswordVersion,
  });

  factory IngressPointPasswordConfiguration.fromJson(
      Map<String, dynamic> json) {
    return IngressPointPasswordConfiguration(
      previousSmtpPasswordExpiryTimestamp:
          timeStampFromJson(json['PreviousSmtpPasswordExpiryTimestamp']),
      previousSmtpPasswordVersion:
          json['PreviousSmtpPasswordVersion'] as String?,
      smtpPasswordVersion: json['SmtpPasswordVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final previousSmtpPasswordExpiryTimestamp =
        this.previousSmtpPasswordExpiryTimestamp;
    final previousSmtpPasswordVersion = this.previousSmtpPasswordVersion;
    final smtpPasswordVersion = this.smtpPasswordVersion;
    return {
      if (previousSmtpPasswordExpiryTimestamp != null)
        'PreviousSmtpPasswordExpiryTimestamp':
            unixTimestampToJson(previousSmtpPasswordExpiryTimestamp),
      if (previousSmtpPasswordVersion != null)
        'PreviousSmtpPasswordVersion': previousSmtpPasswordVersion,
      if (smtpPasswordVersion != null)
        'SmtpPasswordVersion': smtpPasswordVersion,
    };
  }
}

enum IngressPointStatus {
  provisioning,
  deprovisioning,
  updating,
  active,
  closed,
  failed,
}

extension IngressPointStatusValueExtension on IngressPointStatus {
  String toValue() {
    switch (this) {
      case IngressPointStatus.provisioning:
        return 'PROVISIONING';
      case IngressPointStatus.deprovisioning:
        return 'DEPROVISIONING';
      case IngressPointStatus.updating:
        return 'UPDATING';
      case IngressPointStatus.active:
        return 'ACTIVE';
      case IngressPointStatus.closed:
        return 'CLOSED';
      case IngressPointStatus.failed:
        return 'FAILED';
    }
  }
}

extension IngressPointStatusFromString on String {
  IngressPointStatus toIngressPointStatus() {
    switch (this) {
      case 'PROVISIONING':
        return IngressPointStatus.provisioning;
      case 'DEPROVISIONING':
        return IngressPointStatus.deprovisioning;
      case 'UPDATING':
        return IngressPointStatus.updating;
      case 'ACTIVE':
        return IngressPointStatus.active;
      case 'CLOSED':
        return IngressPointStatus.closed;
      case 'FAILED':
        return IngressPointStatus.failed;
    }
    throw Exception('$this is not known in enum IngressPointStatus');
  }
}

enum IngressPointStatusToUpdate {
  active,
  closed,
}

extension IngressPointStatusToUpdateValueExtension
    on IngressPointStatusToUpdate {
  String toValue() {
    switch (this) {
      case IngressPointStatusToUpdate.active:
        return 'ACTIVE';
      case IngressPointStatusToUpdate.closed:
        return 'CLOSED';
    }
  }
}

extension IngressPointStatusToUpdateFromString on String {
  IngressPointStatusToUpdate toIngressPointStatusToUpdate() {
    switch (this) {
      case 'ACTIVE':
        return IngressPointStatusToUpdate.active;
      case 'CLOSED':
        return IngressPointStatusToUpdate.closed;
    }
    throw Exception('$this is not known in enum IngressPointStatusToUpdate');
  }
}

enum IngressPointType {
  open,
  auth,
}

extension IngressPointTypeValueExtension on IngressPointType {
  String toValue() {
    switch (this) {
      case IngressPointType.open:
        return 'OPEN';
      case IngressPointType.auth:
        return 'AUTH';
    }
  }
}

extension IngressPointTypeFromString on String {
  IngressPointType toIngressPointType() {
    switch (this) {
      case 'OPEN':
        return IngressPointType.open;
      case 'AUTH':
        return IngressPointType.auth;
    }
    throw Exception('$this is not known in enum IngressPointType');
  }
}

enum IngressStringEmailAttribute {
  recipient,
}

extension IngressStringEmailAttributeValueExtension
    on IngressStringEmailAttribute {
  String toValue() {
    switch (this) {
      case IngressStringEmailAttribute.recipient:
        return 'RECIPIENT';
    }
  }
}

extension IngressStringEmailAttributeFromString on String {
  IngressStringEmailAttribute toIngressStringEmailAttribute() {
    switch (this) {
      case 'RECIPIENT':
        return IngressStringEmailAttribute.recipient;
    }
    throw Exception('$this is not known in enum IngressStringEmailAttribute');
  }
}

/// The structure for a string based condition matching on the incoming mail.
class IngressStringExpression {
  /// The left hand side argument of a string condition expression.
  final IngressStringToEvaluate evaluate;

  /// The matching operator for a string condition expression.
  final IngressStringOperator operator;

  /// The right hand side argument of a string condition expression.
  final List<String> values;

  IngressStringExpression({
    required this.evaluate,
    required this.operator,
    required this.values,
  });

  factory IngressStringExpression.fromJson(Map<String, dynamic> json) {
    return IngressStringExpression(
      evaluate: IngressStringToEvaluate.fromJson(
          json['Evaluate'] as Map<String, dynamic>),
      operator: (json['Operator'] as String).toIngressStringOperator(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    final values = this.values;
    return {
      'Evaluate': evaluate,
      'Operator': operator.toValue(),
      'Values': values,
    };
  }
}

enum IngressStringOperator {
  equals,
  notEquals,
  startsWith,
  endsWith,
  contains,
}

extension IngressStringOperatorValueExtension on IngressStringOperator {
  String toValue() {
    switch (this) {
      case IngressStringOperator.equals:
        return 'EQUALS';
      case IngressStringOperator.notEquals:
        return 'NOT_EQUALS';
      case IngressStringOperator.startsWith:
        return 'STARTS_WITH';
      case IngressStringOperator.endsWith:
        return 'ENDS_WITH';
      case IngressStringOperator.contains:
        return 'CONTAINS';
    }
  }
}

extension IngressStringOperatorFromString on String {
  IngressStringOperator toIngressStringOperator() {
    switch (this) {
      case 'EQUALS':
        return IngressStringOperator.equals;
      case 'NOT_EQUALS':
        return IngressStringOperator.notEquals;
      case 'STARTS_WITH':
        return IngressStringOperator.startsWith;
      case 'ENDS_WITH':
        return IngressStringOperator.endsWith;
      case 'CONTAINS':
        return IngressStringOperator.contains;
    }
    throw Exception('$this is not known in enum IngressStringOperator');
  }
}

/// The union type representing the allowed types for the left hand side of a
/// string condition.
class IngressStringToEvaluate {
  /// The enum type representing the allowed attribute types for a string
  /// condition.
  final IngressStringEmailAttribute? attribute;

  IngressStringToEvaluate({
    this.attribute,
  });

  factory IngressStringToEvaluate.fromJson(Map<String, dynamic> json) {
    return IngressStringToEvaluate(
      attribute:
          (json['Attribute'] as String?)?.toIngressStringEmailAttribute(),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    return {
      if (attribute != null) 'Attribute': attribute.toValue(),
    };
  }
}

enum IngressTlsAttribute {
  tlsProtocol,
}

extension IngressTlsAttributeValueExtension on IngressTlsAttribute {
  String toValue() {
    switch (this) {
      case IngressTlsAttribute.tlsProtocol:
        return 'TLS_PROTOCOL';
    }
  }
}

extension IngressTlsAttributeFromString on String {
  IngressTlsAttribute toIngressTlsAttribute() {
    switch (this) {
      case 'TLS_PROTOCOL':
        return IngressTlsAttribute.tlsProtocol;
    }
    throw Exception('$this is not known in enum IngressTlsAttribute');
  }
}

enum IngressTlsProtocolAttribute {
  tls1_2,
  tls1_3,
}

extension IngressTlsProtocolAttributeValueExtension
    on IngressTlsProtocolAttribute {
  String toValue() {
    switch (this) {
      case IngressTlsProtocolAttribute.tls1_2:
        return 'TLS1_2';
      case IngressTlsProtocolAttribute.tls1_3:
        return 'TLS1_3';
    }
  }
}

extension IngressTlsProtocolAttributeFromString on String {
  IngressTlsProtocolAttribute toIngressTlsProtocolAttribute() {
    switch (this) {
      case 'TLS1_2':
        return IngressTlsProtocolAttribute.tls1_2;
      case 'TLS1_3':
        return IngressTlsProtocolAttribute.tls1_3;
    }
    throw Exception('$this is not known in enum IngressTlsProtocolAttribute');
  }
}

/// The structure for a TLS related condition matching on the incoming mail.
class IngressTlsProtocolExpression {
  /// The left hand side argument of a TLS condition expression.
  final IngressTlsProtocolToEvaluate evaluate;

  /// The matching operator for a TLS condition expression.
  final IngressTlsProtocolOperator operator;

  /// The right hand side argument of a TLS condition expression.
  final IngressTlsProtocolAttribute value;

  IngressTlsProtocolExpression({
    required this.evaluate,
    required this.operator,
    required this.value,
  });

  factory IngressTlsProtocolExpression.fromJson(Map<String, dynamic> json) {
    return IngressTlsProtocolExpression(
      evaluate: IngressTlsProtocolToEvaluate.fromJson(
          json['Evaluate'] as Map<String, dynamic>),
      operator: (json['Operator'] as String).toIngressTlsProtocolOperator(),
      value: (json['Value'] as String).toIngressTlsProtocolAttribute(),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    final value = this.value;
    return {
      'Evaluate': evaluate,
      'Operator': operator.toValue(),
      'Value': value.toValue(),
    };
  }
}

enum IngressTlsProtocolOperator {
  minimumTlsVersion,
  $is,
}

extension IngressTlsProtocolOperatorValueExtension
    on IngressTlsProtocolOperator {
  String toValue() {
    switch (this) {
      case IngressTlsProtocolOperator.minimumTlsVersion:
        return 'MINIMUM_TLS_VERSION';
      case IngressTlsProtocolOperator.$is:
        return 'IS';
    }
  }
}

extension IngressTlsProtocolOperatorFromString on String {
  IngressTlsProtocolOperator toIngressTlsProtocolOperator() {
    switch (this) {
      case 'MINIMUM_TLS_VERSION':
        return IngressTlsProtocolOperator.minimumTlsVersion;
      case 'IS':
        return IngressTlsProtocolOperator.$is;
    }
    throw Exception('$this is not known in enum IngressTlsProtocolOperator');
  }
}

/// The union type representing the allowed types for the left hand side of a
/// TLS condition.
class IngressTlsProtocolToEvaluate {
  /// The enum type representing the allowed attribute types for the TLS
  /// condition.
  final IngressTlsAttribute? attribute;

  IngressTlsProtocolToEvaluate({
    this.attribute,
  });

  factory IngressTlsProtocolToEvaluate.fromJson(Map<String, dynamic> json) {
    return IngressTlsProtocolToEvaluate(
      attribute: (json['Attribute'] as String?)?.toIngressTlsAttribute(),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    return {
      if (attribute != null) 'Attribute': attribute.toValue(),
    };
  }
}

class ListAddonInstancesResponse {
  /// The list of ingress endpoints.
  final List<AddonInstance>? addonInstances;

  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  final String? nextToken;

  ListAddonInstancesResponse({
    this.addonInstances,
    this.nextToken,
  });

  factory ListAddonInstancesResponse.fromJson(Map<String, dynamic> json) {
    return ListAddonInstancesResponse(
      addonInstances: (json['AddonInstances'] as List?)
          ?.whereNotNull()
          .map((e) => AddonInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addonInstances = this.addonInstances;
    final nextToken = this.nextToken;
    return {
      if (addonInstances != null) 'AddonInstances': addonInstances,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListAddonSubscriptionsResponse {
  /// The list of ingress endpoints.
  final List<AddonSubscription>? addonSubscriptions;

  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  final String? nextToken;

  ListAddonSubscriptionsResponse({
    this.addonSubscriptions,
    this.nextToken,
  });

  factory ListAddonSubscriptionsResponse.fromJson(Map<String, dynamic> json) {
    return ListAddonSubscriptionsResponse(
      addonSubscriptions: (json['AddonSubscriptions'] as List?)
          ?.whereNotNull()
          .map((e) => AddonSubscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addonSubscriptions = this.addonSubscriptions;
    final nextToken = this.nextToken;
    return {
      if (addonSubscriptions != null) 'AddonSubscriptions': addonSubscriptions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The response containing a list of archive export jobs and their statuses.
class ListArchiveExportsResponse {
  /// The list of export job identifiers and statuses.
  final List<ExportSummary>? exports;

  /// If present, use to retrieve the next page of results.
  final String? nextToken;

  ListArchiveExportsResponse({
    this.exports,
    this.nextToken,
  });

  factory ListArchiveExportsResponse.fromJson(Map<String, dynamic> json) {
    return ListArchiveExportsResponse(
      exports: (json['Exports'] as List?)
          ?.whereNotNull()
          .map((e) => ExportSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exports = this.exports;
    final nextToken = this.nextToken;
    return {
      if (exports != null) 'Exports': exports,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The response containing a list of archive search jobs and their statuses.
class ListArchiveSearchesResponse {
  /// If present, use to retrieve the next page of results.
  final String? nextToken;

  /// The list of search job identifiers and statuses.
  final List<SearchSummary>? searches;

  ListArchiveSearchesResponse({
    this.nextToken,
    this.searches,
  });

  factory ListArchiveSearchesResponse.fromJson(Map<String, dynamic> json) {
    return ListArchiveSearchesResponse(
      nextToken: json['NextToken'] as String?,
      searches: (json['Searches'] as List?)
          ?.whereNotNull()
          .map((e) => SearchSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final searches = this.searches;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (searches != null) 'Searches': searches,
    };
  }
}

/// The response containing a list of your email archives.
class ListArchivesResponse {
  /// The list of archive details.
  final List<Archive> archives;

  /// If present, use to retrieve the next page of results.
  final String? nextToken;

  ListArchivesResponse({
    required this.archives,
    this.nextToken,
  });

  factory ListArchivesResponse.fromJson(Map<String, dynamic> json) {
    return ListArchivesResponse(
      archives: (json['Archives'] as List)
          .whereNotNull()
          .map((e) => Archive.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final archives = this.archives;
    final nextToken = this.nextToken;
    return {
      'Archives': archives,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListIngressPointsResponse {
  /// The list of ingress endpoints.
  final List<IngressPoint>? ingressPoints;

  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  final String? nextToken;

  ListIngressPointsResponse({
    this.ingressPoints,
    this.nextToken,
  });

  factory ListIngressPointsResponse.fromJson(Map<String, dynamic> json) {
    return ListIngressPointsResponse(
      ingressPoints: (json['IngressPoints'] as List?)
          ?.whereNotNull()
          .map((e) => IngressPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ingressPoints = this.ingressPoints;
    final nextToken = this.nextToken;
    return {
      if (ingressPoints != null) 'IngressPoints': ingressPoints,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListRelaysResponse {
  /// The list of returned relays.
  final List<Relay> relays;

  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  final String? nextToken;

  ListRelaysResponse({
    required this.relays,
    this.nextToken,
  });

  factory ListRelaysResponse.fromJson(Map<String, dynamic> json) {
    return ListRelaysResponse(
      relays: (json['Relays'] as List)
          .whereNotNull()
          .map((e) => Relay.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final relays = this.relays;
    final nextToken = this.nextToken;
    return {
      'Relays': relays,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListRuleSetsResponse {
  /// The list of rule sets.
  final List<RuleSet> ruleSets;

  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  final String? nextToken;

  ListRuleSetsResponse({
    required this.ruleSets,
    this.nextToken,
  });

  factory ListRuleSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListRuleSetsResponse(
      ruleSets: (json['RuleSets'] as List)
          .whereNotNull()
          .map((e) => RuleSet.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleSets = this.ruleSets;
    final nextToken = this.nextToken;
    return {
      'RuleSets': ruleSets,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags used to organize, track, or control access for the resource. For
  /// example, { "tags": {"key1":"value1", "key2":"value2"} }.
  final List<Tag> tags;

  ListTagsForResourceResponse({
    required this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List)
          .whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'Tags': tags,
    };
  }
}

class ListTrafficPoliciesResponse {
  /// If NextToken is returned, there are more results available. The value of
  /// NextToken is a unique pagination token for each page. Make the call again
  /// using the returned token to retrieve the next page.
  final String? nextToken;

  /// The list of traffic policies.
  final List<TrafficPolicy>? trafficPolicies;

  ListTrafficPoliciesResponse({
    this.nextToken,
    this.trafficPolicies,
  });

  factory ListTrafficPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListTrafficPoliciesResponse(
      nextToken: json['NextToken'] as String?,
      trafficPolicies: (json['TrafficPolicies'] as List?)
          ?.whereNotNull()
          .map((e) => TrafficPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final trafficPolicies = this.trafficPolicies;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (trafficPolicies != null) 'TrafficPolicies': trafficPolicies,
    };
  }
}

enum MailFrom {
  replace,
  preserve,
}

extension MailFromValueExtension on MailFrom {
  String toValue() {
    switch (this) {
      case MailFrom.replace:
        return 'REPLACE';
      case MailFrom.preserve:
        return 'PRESERVE';
    }
  }
}

extension MailFromFromString on String {
  MailFrom toMailFrom() {
    switch (this) {
      case 'REPLACE':
        return MailFrom.replace;
      case 'PRESERVE':
        return MailFrom.preserve;
    }
    throw Exception('$this is not known in enum MailFrom');
  }
}

/// The textual body content of an email message.
class MessageBody {
  /// The HTML body content of the message.
  final String? html;

  /// A flag indicating if the email was malformed.
  final bool? messageMalformed;

  /// The plain text body content of the message.
  final String? text;

  MessageBody({
    this.html,
    this.messageMalformed,
    this.text,
  });

  factory MessageBody.fromJson(Map<String, dynamic> json) {
    return MessageBody(
      html: json['Html'] as String?,
      messageMalformed: json['MessageMalformed'] as bool?,
      text: json['Text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final html = this.html;
    final messageMalformed = this.messageMalformed;
    final text = this.text;
    return {
      if (html != null) 'Html': html,
      if (messageMalformed != null) 'MessageMalformed': messageMalformed,
      if (text != null) 'Text': text,
    };
  }
}

/// Explicitly indicate that the relay destination server does not require SMTP
/// credential authentication.
class NoAuthentication {
  NoAuthentication();

  factory NoAuthentication.fromJson(Map<String, dynamic> _) {
    return NoAuthentication();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The email traffic filtering conditions which are contained in a traffic
/// policy resource.
class PolicyCondition {
  /// This represents a boolean type condition matching on the incoming mail. It
  /// performs the boolean operation configured in 'Operator' and evaluates the
  /// 'Protocol' object against the 'Value'.
  final IngressBooleanExpression? booleanExpression;

  /// This represents an IP based condition matching on the incoming mail. It
  /// performs the operation configured in 'Operator' and evaluates the 'Protocol'
  /// object against the 'Value'.
  final IngressIpv4Expression? ipExpression;

  /// This represents a string based condition matching on the incoming mail. It
  /// performs the string operation configured in 'Operator' and evaluates the
  /// 'Protocol' object against the 'Value'.
  final IngressStringExpression? stringExpression;

  /// This represents a TLS based condition matching on the incoming mail. It
  /// performs the operation configured in 'Operator' and evaluates the 'Protocol'
  /// object against the 'Value'.
  final IngressTlsProtocolExpression? tlsExpression;

  PolicyCondition({
    this.booleanExpression,
    this.ipExpression,
    this.stringExpression,
    this.tlsExpression,
  });

  factory PolicyCondition.fromJson(Map<String, dynamic> json) {
    return PolicyCondition(
      booleanExpression: json['BooleanExpression'] != null
          ? IngressBooleanExpression.fromJson(
              json['BooleanExpression'] as Map<String, dynamic>)
          : null,
      ipExpression: json['IpExpression'] != null
          ? IngressIpv4Expression.fromJson(
              json['IpExpression'] as Map<String, dynamic>)
          : null,
      stringExpression: json['StringExpression'] != null
          ? IngressStringExpression.fromJson(
              json['StringExpression'] as Map<String, dynamic>)
          : null,
      tlsExpression: json['TlsExpression'] != null
          ? IngressTlsProtocolExpression.fromJson(
              json['TlsExpression'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final booleanExpression = this.booleanExpression;
    final ipExpression = this.ipExpression;
    final stringExpression = this.stringExpression;
    final tlsExpression = this.tlsExpression;
    return {
      if (booleanExpression != null) 'BooleanExpression': booleanExpression,
      if (ipExpression != null) 'IpExpression': ipExpression,
      if (stringExpression != null) 'StringExpression': stringExpression,
      if (tlsExpression != null) 'TlsExpression': tlsExpression,
    };
  }
}

/// The structure containing traffic policy conditions and actions.
class PolicyStatement {
  /// The action that informs a traffic policy resource to either allow or block
  /// the email if it matches a condition in the policy statement.
  final AcceptAction action;

  /// The list of conditions to apply to incoming messages for filtering email
  /// traffic.
  final List<PolicyCondition> conditions;

  PolicyStatement({
    required this.action,
    required this.conditions,
  });

  factory PolicyStatement.fromJson(Map<String, dynamic> json) {
    return PolicyStatement(
      action: (json['Action'] as String).toAcceptAction(),
      conditions: (json['Conditions'] as List)
          .whereNotNull()
          .map((e) => PolicyCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final conditions = this.conditions;
    return {
      'Action': action.toValue(),
      'Conditions': conditions,
    };
  }
}

/// The relay resource that can be used as a rule to relay receiving emails to
/// the destination relay server.
class Relay {
  /// The timestamp of when the relay was last modified.
  final DateTime? lastModifiedTimestamp;

  /// The unique relay identifier.
  final String? relayId;

  /// The unique relay name.
  final String? relayName;

  Relay({
    this.lastModifiedTimestamp,
    this.relayId,
    this.relayName,
  });

  factory Relay.fromJson(Map<String, dynamic> json) {
    return Relay(
      lastModifiedTimestamp: timeStampFromJson(json['LastModifiedTimestamp']),
      relayId: json['RelayId'] as String?,
      relayName: json['RelayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final relayId = this.relayId;
    final relayName = this.relayName;
    return {
      if (lastModifiedTimestamp != null)
        'LastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (relayId != null) 'RelayId': relayId,
      if (relayName != null) 'RelayName': relayName,
    };
  }
}

/// The action relays the email via SMTP to another specific SMTP server.
class RelayAction {
  /// The identifier of the relay resource to be used when relaying an email.
  final String relay;

  /// A policy that states what to do in the case of failure. The action will fail
  /// if there are configuration errors. For example, the specified relay has been
  /// deleted.
  final ActionFailurePolicy? actionFailurePolicy;

  /// This action specifies whether to preserve or replace original mail from
  /// address while relaying received emails to a destination server.
  final MailFrom? mailFrom;

  RelayAction({
    required this.relay,
    this.actionFailurePolicy,
    this.mailFrom,
  });

  factory RelayAction.fromJson(Map<String, dynamic> json) {
    return RelayAction(
      relay: json['Relay'] as String,
      actionFailurePolicy:
          (json['ActionFailurePolicy'] as String?)?.toActionFailurePolicy(),
      mailFrom: (json['MailFrom'] as String?)?.toMailFrom(),
    );
  }

  Map<String, dynamic> toJson() {
    final relay = this.relay;
    final actionFailurePolicy = this.actionFailurePolicy;
    final mailFrom = this.mailFrom;
    return {
      'Relay': relay,
      if (actionFailurePolicy != null)
        'ActionFailurePolicy': actionFailurePolicy.toValue(),
      if (mailFrom != null) 'MailFrom': mailFrom.toValue(),
    };
  }
}

/// Authentication for the relay destination server—specify the secretARN where
/// the SMTP credentials are stored, or specify an empty NoAuthentication
/// structure if the relay destination server does not require SMTP credential
/// authentication.
class RelayAuthentication {
  /// Keep an empty structure if the relay destination server does not require
  /// SMTP credential authentication.
  final NoAuthentication? noAuthentication;

  /// The ARN of the secret created in secrets manager where the relay server's
  /// SMTP credentials are stored.
  final String? secretArn;

  RelayAuthentication({
    this.noAuthentication,
    this.secretArn,
  });

  factory RelayAuthentication.fromJson(Map<String, dynamic> json) {
    return RelayAuthentication(
      noAuthentication: json['NoAuthentication'] != null
          ? NoAuthentication.fromJson(
              json['NoAuthentication'] as Map<String, dynamic>)
          : null,
      secretArn: json['SecretArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final noAuthentication = this.noAuthentication;
    final secretArn = this.secretArn;
    return {
      if (noAuthentication != null) 'NoAuthentication': noAuthentication,
      if (secretArn != null) 'SecretArn': secretArn,
    };
  }
}

/// This action replaces the email envelope recipients with the given list of
/// recipients. If the condition of this action applies only to a subset of
/// recipients, only those recipients are replaced with the recipients specified
/// in the action. The message contents and headers are unaffected by this
/// action, only the envelope recipients are updated.
class ReplaceRecipientAction {
  /// This action specifies the replacement recipient email addresses to insert.
  final List<String>? replaceWith;

  ReplaceRecipientAction({
    this.replaceWith,
  });

  factory ReplaceRecipientAction.fromJson(Map<String, dynamic> json) {
    return ReplaceRecipientAction(
      replaceWith: (json['ReplaceWith'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final replaceWith = this.replaceWith;
    return {
      if (replaceWith != null) 'ReplaceWith': replaceWith,
    };
  }
}

enum RetentionPeriod {
  threeMonths,
  sixMonths,
  nineMonths,
  oneYear,
  eighteenMonths,
  twoYears,
  thirtyMonths,
  threeYears,
  fourYears,
  fiveYears,
  sixYears,
  sevenYears,
  eightYears,
  nineYears,
  tenYears,
  permanent,
}

extension RetentionPeriodValueExtension on RetentionPeriod {
  String toValue() {
    switch (this) {
      case RetentionPeriod.threeMonths:
        return 'THREE_MONTHS';
      case RetentionPeriod.sixMonths:
        return 'SIX_MONTHS';
      case RetentionPeriod.nineMonths:
        return 'NINE_MONTHS';
      case RetentionPeriod.oneYear:
        return 'ONE_YEAR';
      case RetentionPeriod.eighteenMonths:
        return 'EIGHTEEN_MONTHS';
      case RetentionPeriod.twoYears:
        return 'TWO_YEARS';
      case RetentionPeriod.thirtyMonths:
        return 'THIRTY_MONTHS';
      case RetentionPeriod.threeYears:
        return 'THREE_YEARS';
      case RetentionPeriod.fourYears:
        return 'FOUR_YEARS';
      case RetentionPeriod.fiveYears:
        return 'FIVE_YEARS';
      case RetentionPeriod.sixYears:
        return 'SIX_YEARS';
      case RetentionPeriod.sevenYears:
        return 'SEVEN_YEARS';
      case RetentionPeriod.eightYears:
        return 'EIGHT_YEARS';
      case RetentionPeriod.nineYears:
        return 'NINE_YEARS';
      case RetentionPeriod.tenYears:
        return 'TEN_YEARS';
      case RetentionPeriod.permanent:
        return 'PERMANENT';
    }
  }
}

extension RetentionPeriodFromString on String {
  RetentionPeriod toRetentionPeriod() {
    switch (this) {
      case 'THREE_MONTHS':
        return RetentionPeriod.threeMonths;
      case 'SIX_MONTHS':
        return RetentionPeriod.sixMonths;
      case 'NINE_MONTHS':
        return RetentionPeriod.nineMonths;
      case 'ONE_YEAR':
        return RetentionPeriod.oneYear;
      case 'EIGHTEEN_MONTHS':
        return RetentionPeriod.eighteenMonths;
      case 'TWO_YEARS':
        return RetentionPeriod.twoYears;
      case 'THIRTY_MONTHS':
        return RetentionPeriod.thirtyMonths;
      case 'THREE_YEARS':
        return RetentionPeriod.threeYears;
      case 'FOUR_YEARS':
        return RetentionPeriod.fourYears;
      case 'FIVE_YEARS':
        return RetentionPeriod.fiveYears;
      case 'SIX_YEARS':
        return RetentionPeriod.sixYears;
      case 'SEVEN_YEARS':
        return RetentionPeriod.sevenYears;
      case 'EIGHT_YEARS':
        return RetentionPeriod.eightYears;
      case 'NINE_YEARS':
        return RetentionPeriod.nineYears;
      case 'TEN_YEARS':
        return RetentionPeriod.tenYears;
      case 'PERMANENT':
        return RetentionPeriod.permanent;
    }
    throw Exception('$this is not known in enum RetentionPeriod');
  }
}

/// A result row containing metadata for an archived email message.
class Row {
  /// The unique identifier of the archived message.
  final String? archivedMessageId;

  /// The email addresses in the CC header.
  final String? cc;

  /// The date the email was sent.
  final String? date;

  /// The email address of the sender.
  final String? from;

  /// A flag indicating if the email has attachments.
  final bool? hasAttachments;

  /// The email message ID this is a reply to.
  final String? inReplyTo;

  /// The unique message ID of the email.
  final String? messageId;

  /// The received headers from the email delivery path.
  final List<String>? receivedHeaders;

  /// The timestamp of when the email was received.
  final DateTime? receivedTimestamp;

  /// The subject header value of the email.
  final String? subject;

  /// The email addresses in the To header.
  final String? to;

  /// The user agent that sent the email.
  final String? xMailer;

  /// The original user agent that sent the email.
  final String? xOriginalMailer;

  /// The priority level of the email.
  final String? xPriority;

  Row({
    this.archivedMessageId,
    this.cc,
    this.date,
    this.from,
    this.hasAttachments,
    this.inReplyTo,
    this.messageId,
    this.receivedHeaders,
    this.receivedTimestamp,
    this.subject,
    this.to,
    this.xMailer,
    this.xOriginalMailer,
    this.xPriority,
  });

  factory Row.fromJson(Map<String, dynamic> json) {
    return Row(
      archivedMessageId: json['ArchivedMessageId'] as String?,
      cc: json['Cc'] as String?,
      date: json['Date'] as String?,
      from: json['From'] as String?,
      hasAttachments: json['HasAttachments'] as bool?,
      inReplyTo: json['InReplyTo'] as String?,
      messageId: json['MessageId'] as String?,
      receivedHeaders: (json['ReceivedHeaders'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      receivedTimestamp: timeStampFromJson(json['ReceivedTimestamp']),
      subject: json['Subject'] as String?,
      to: json['To'] as String?,
      xMailer: json['XMailer'] as String?,
      xOriginalMailer: json['XOriginalMailer'] as String?,
      xPriority: json['XPriority'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final archivedMessageId = this.archivedMessageId;
    final cc = this.cc;
    final date = this.date;
    final from = this.from;
    final hasAttachments = this.hasAttachments;
    final inReplyTo = this.inReplyTo;
    final messageId = this.messageId;
    final receivedHeaders = this.receivedHeaders;
    final receivedTimestamp = this.receivedTimestamp;
    final subject = this.subject;
    final to = this.to;
    final xMailer = this.xMailer;
    final xOriginalMailer = this.xOriginalMailer;
    final xPriority = this.xPriority;
    return {
      if (archivedMessageId != null) 'ArchivedMessageId': archivedMessageId,
      if (cc != null) 'Cc': cc,
      if (date != null) 'Date': date,
      if (from != null) 'From': from,
      if (hasAttachments != null) 'HasAttachments': hasAttachments,
      if (inReplyTo != null) 'InReplyTo': inReplyTo,
      if (messageId != null) 'MessageId': messageId,
      if (receivedHeaders != null) 'ReceivedHeaders': receivedHeaders,
      if (receivedTimestamp != null)
        'ReceivedTimestamp': unixTimestampToJson(receivedTimestamp),
      if (subject != null) 'Subject': subject,
      if (to != null) 'To': to,
      if (xMailer != null) 'XMailer': xMailer,
      if (xOriginalMailer != null) 'XOriginalMailer': xOriginalMailer,
      if (xPriority != null) 'XPriority': xPriority,
    };
  }
}

/// A rule contains conditions, "unless conditions" and actions. For each
/// envelope recipient of an email, if all conditions match and none of the
/// "unless conditions" match, then all of the actions are executed
/// sequentially. If no conditions are provided, the rule always applies and the
/// actions are implicitly executed. If only "unless conditions" are provided,
/// the rule applies if the email does not match the evaluation of the "unless
/// conditions".
class Rule {
  /// The list of actions to execute when the conditions match the incoming email,
  /// and none of the "unless conditions" match.
  final List<RuleAction> actions;

  /// The conditions of this rule. All conditions must match the email for the
  /// actions to be executed. An empty list of conditions means that all emails
  /// match, but are still subject to any "unless conditions"
  final List<RuleCondition>? conditions;

  /// The user-friendly name of the rule.
  final String? name;

  /// The "unless conditions" of this rule. None of the conditions can match the
  /// email for the actions to be executed. If any of these conditions do match
  /// the email, then the actions are not executed.
  final List<RuleCondition>? unless;

  Rule({
    required this.actions,
    this.conditions,
    this.name,
    this.unless,
  });

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      actions: (json['Actions'] as List)
          .whereNotNull()
          .map((e) => RuleAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      conditions: (json['Conditions'] as List?)
          ?.whereNotNull()
          .map((e) => RuleCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      unless: (json['Unless'] as List?)
          ?.whereNotNull()
          .map((e) => RuleCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final conditions = this.conditions;
    final name = this.name;
    final unless = this.unless;
    return {
      'Actions': actions,
      if (conditions != null) 'Conditions': conditions,
      if (name != null) 'Name': name,
      if (unless != null) 'Unless': unless,
    };
  }
}

/// The action for a rule to take. Only one of the contained actions can be set.
class RuleAction {
  /// This action adds a header. This can be used to add arbitrary email headers.
  final AddHeaderAction? addHeader;

  /// This action archives the email. This can be used to deliver an email to an
  /// archive.
  final ArchiveAction? archive;

  /// This action delivers an email to a WorkMail mailbox.
  final DeliverToMailboxAction? deliverToMailbox;

  /// This action terminates the evaluation of rules in the rule set.
  final DropAction? drop;

  /// This action relays the email to another SMTP server.
  final RelayAction? relay;

  /// The action replaces certain or all recipients with a different set of
  /// recipients.
  final ReplaceRecipientAction? replaceRecipient;

  /// This action sends the email to the internet.
  final SendAction? send;

  /// This action writes the MIME content of the email to an S3 bucket.
  final S3Action? writeToS3;

  RuleAction({
    this.addHeader,
    this.archive,
    this.deliverToMailbox,
    this.drop,
    this.relay,
    this.replaceRecipient,
    this.send,
    this.writeToS3,
  });

  factory RuleAction.fromJson(Map<String, dynamic> json) {
    return RuleAction(
      addHeader: json['AddHeader'] != null
          ? AddHeaderAction.fromJson(json['AddHeader'] as Map<String, dynamic>)
          : null,
      archive: json['Archive'] != null
          ? ArchiveAction.fromJson(json['Archive'] as Map<String, dynamic>)
          : null,
      deliverToMailbox: json['DeliverToMailbox'] != null
          ? DeliverToMailboxAction.fromJson(
              json['DeliverToMailbox'] as Map<String, dynamic>)
          : null,
      drop: json['Drop'] != null
          ? DropAction.fromJson(json['Drop'] as Map<String, dynamic>)
          : null,
      relay: json['Relay'] != null
          ? RelayAction.fromJson(json['Relay'] as Map<String, dynamic>)
          : null,
      replaceRecipient: json['ReplaceRecipient'] != null
          ? ReplaceRecipientAction.fromJson(
              json['ReplaceRecipient'] as Map<String, dynamic>)
          : null,
      send: json['Send'] != null
          ? SendAction.fromJson(json['Send'] as Map<String, dynamic>)
          : null,
      writeToS3: json['WriteToS3'] != null
          ? S3Action.fromJson(json['WriteToS3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final addHeader = this.addHeader;
    final archive = this.archive;
    final deliverToMailbox = this.deliverToMailbox;
    final drop = this.drop;
    final relay = this.relay;
    final replaceRecipient = this.replaceRecipient;
    final send = this.send;
    final writeToS3 = this.writeToS3;
    return {
      if (addHeader != null) 'AddHeader': addHeader,
      if (archive != null) 'Archive': archive,
      if (deliverToMailbox != null) 'DeliverToMailbox': deliverToMailbox,
      if (drop != null) 'Drop': drop,
      if (relay != null) 'Relay': relay,
      if (replaceRecipient != null) 'ReplaceRecipient': replaceRecipient,
      if (send != null) 'Send': send,
      if (writeToS3 != null) 'WriteToS3': writeToS3,
    };
  }
}

enum RuleBooleanEmailAttribute {
  readReceiptRequested,
  tls,
  tlsWrapped,
}

extension RuleBooleanEmailAttributeValueExtension on RuleBooleanEmailAttribute {
  String toValue() {
    switch (this) {
      case RuleBooleanEmailAttribute.readReceiptRequested:
        return 'READ_RECEIPT_REQUESTED';
      case RuleBooleanEmailAttribute.tls:
        return 'TLS';
      case RuleBooleanEmailAttribute.tlsWrapped:
        return 'TLS_WRAPPED';
    }
  }
}

extension RuleBooleanEmailAttributeFromString on String {
  RuleBooleanEmailAttribute toRuleBooleanEmailAttribute() {
    switch (this) {
      case 'READ_RECEIPT_REQUESTED':
        return RuleBooleanEmailAttribute.readReceiptRequested;
      case 'TLS':
        return RuleBooleanEmailAttribute.tls;
      case 'TLS_WRAPPED':
        return RuleBooleanEmailAttribute.tlsWrapped;
    }
    throw Exception('$this is not known in enum RuleBooleanEmailAttribute');
  }
}

/// A boolean expression to be used in a rule condition.
class RuleBooleanExpression {
  /// The operand on which to perform a boolean condition operation.
  final RuleBooleanToEvaluate evaluate;

  /// The matching operator for a boolean condition expression.
  final RuleBooleanOperator operator;

  RuleBooleanExpression({
    required this.evaluate,
    required this.operator,
  });

  factory RuleBooleanExpression.fromJson(Map<String, dynamic> json) {
    return RuleBooleanExpression(
      evaluate: RuleBooleanToEvaluate.fromJson(
          json['Evaluate'] as Map<String, dynamic>),
      operator: (json['Operator'] as String).toRuleBooleanOperator(),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    return {
      'Evaluate': evaluate,
      'Operator': operator.toValue(),
    };
  }
}

enum RuleBooleanOperator {
  isTrue,
  isFalse,
}

extension RuleBooleanOperatorValueExtension on RuleBooleanOperator {
  String toValue() {
    switch (this) {
      case RuleBooleanOperator.isTrue:
        return 'IS_TRUE';
      case RuleBooleanOperator.isFalse:
        return 'IS_FALSE';
    }
  }
}

extension RuleBooleanOperatorFromString on String {
  RuleBooleanOperator toRuleBooleanOperator() {
    switch (this) {
      case 'IS_TRUE':
        return RuleBooleanOperator.isTrue;
      case 'IS_FALSE':
        return RuleBooleanOperator.isFalse;
    }
    throw Exception('$this is not known in enum RuleBooleanOperator');
  }
}

/// The union type representing the allowed types of operands for a boolean
/// condition.
class RuleBooleanToEvaluate {
  /// The boolean type representing the allowed attribute types for an email.
  final RuleBooleanEmailAttribute? attribute;

  RuleBooleanToEvaluate({
    this.attribute,
  });

  factory RuleBooleanToEvaluate.fromJson(Map<String, dynamic> json) {
    return RuleBooleanToEvaluate(
      attribute: (json['Attribute'] as String?)?.toRuleBooleanEmailAttribute(),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    return {
      if (attribute != null) 'Attribute': attribute.toValue(),
    };
  }
}

/// The conditional expression used to evaluate an email for determining if a
/// rule action should be taken.
class RuleCondition {
  /// The condition applies to a boolean expression passed in this field.
  final RuleBooleanExpression? booleanExpression;

  /// The condition applies to a DMARC policy expression passed in this field.
  final RuleDmarcExpression? dmarcExpression;

  /// The condition applies to an IP address expression passed in this field.
  final RuleIpExpression? ipExpression;

  /// The condition applies to a number expression passed in this field.
  final RuleNumberExpression? numberExpression;

  /// The condition applies to a string expression passed in this field.
  final RuleStringExpression? stringExpression;

  /// The condition applies to a verdict expression passed in this field.
  final RuleVerdictExpression? verdictExpression;

  RuleCondition({
    this.booleanExpression,
    this.dmarcExpression,
    this.ipExpression,
    this.numberExpression,
    this.stringExpression,
    this.verdictExpression,
  });

  factory RuleCondition.fromJson(Map<String, dynamic> json) {
    return RuleCondition(
      booleanExpression: json['BooleanExpression'] != null
          ? RuleBooleanExpression.fromJson(
              json['BooleanExpression'] as Map<String, dynamic>)
          : null,
      dmarcExpression: json['DmarcExpression'] != null
          ? RuleDmarcExpression.fromJson(
              json['DmarcExpression'] as Map<String, dynamic>)
          : null,
      ipExpression: json['IpExpression'] != null
          ? RuleIpExpression.fromJson(
              json['IpExpression'] as Map<String, dynamic>)
          : null,
      numberExpression: json['NumberExpression'] != null
          ? RuleNumberExpression.fromJson(
              json['NumberExpression'] as Map<String, dynamic>)
          : null,
      stringExpression: json['StringExpression'] != null
          ? RuleStringExpression.fromJson(
              json['StringExpression'] as Map<String, dynamic>)
          : null,
      verdictExpression: json['VerdictExpression'] != null
          ? RuleVerdictExpression.fromJson(
              json['VerdictExpression'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final booleanExpression = this.booleanExpression;
    final dmarcExpression = this.dmarcExpression;
    final ipExpression = this.ipExpression;
    final numberExpression = this.numberExpression;
    final stringExpression = this.stringExpression;
    final verdictExpression = this.verdictExpression;
    return {
      if (booleanExpression != null) 'BooleanExpression': booleanExpression,
      if (dmarcExpression != null) 'DmarcExpression': dmarcExpression,
      if (ipExpression != null) 'IpExpression': ipExpression,
      if (numberExpression != null) 'NumberExpression': numberExpression,
      if (stringExpression != null) 'StringExpression': stringExpression,
      if (verdictExpression != null) 'VerdictExpression': verdictExpression,
    };
  }
}

/// A DMARC policy expression. The condition matches if the given DMARC policy
/// matches that of the incoming email.
class RuleDmarcExpression {
  /// The operator to apply to the DMARC policy of the incoming email.
  final RuleDmarcOperator operator;

  /// The values to use for the given DMARC policy operator. For the operator
  /// EQUALS, if multiple values are given, they are evaluated as an OR. That is,
  /// if any of the given values match, the condition is deemed to match. For the
  /// operator NOT_EQUALS, if multiple values are given, they are evaluated as an
  /// AND. That is, only if the email's DMARC policy is not equal to any of the
  /// given values, then the condition is deemed to match.
  final List<RuleDmarcPolicy> values;

  RuleDmarcExpression({
    required this.operator,
    required this.values,
  });

  factory RuleDmarcExpression.fromJson(Map<String, dynamic> json) {
    return RuleDmarcExpression(
      operator: (json['Operator'] as String).toRuleDmarcOperator(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => (e as String).toRuleDmarcPolicy())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operator = this.operator;
    final values = this.values;
    return {
      'Operator': operator.toValue(),
      'Values': values.map((e) => e.toValue()).toList(),
    };
  }
}

enum RuleDmarcOperator {
  equals,
  notEquals,
}

extension RuleDmarcOperatorValueExtension on RuleDmarcOperator {
  String toValue() {
    switch (this) {
      case RuleDmarcOperator.equals:
        return 'EQUALS';
      case RuleDmarcOperator.notEquals:
        return 'NOT_EQUALS';
    }
  }
}

extension RuleDmarcOperatorFromString on String {
  RuleDmarcOperator toRuleDmarcOperator() {
    switch (this) {
      case 'EQUALS':
        return RuleDmarcOperator.equals;
      case 'NOT_EQUALS':
        return RuleDmarcOperator.notEquals;
    }
    throw Exception('$this is not known in enum RuleDmarcOperator');
  }
}

enum RuleDmarcPolicy {
  none,
  quarantine,
  reject,
}

extension RuleDmarcPolicyValueExtension on RuleDmarcPolicy {
  String toValue() {
    switch (this) {
      case RuleDmarcPolicy.none:
        return 'NONE';
      case RuleDmarcPolicy.quarantine:
        return 'QUARANTINE';
      case RuleDmarcPolicy.reject:
        return 'REJECT';
    }
  }
}

extension RuleDmarcPolicyFromString on String {
  RuleDmarcPolicy toRuleDmarcPolicy() {
    switch (this) {
      case 'NONE':
        return RuleDmarcPolicy.none;
      case 'QUARANTINE':
        return RuleDmarcPolicy.quarantine;
      case 'REJECT':
        return RuleDmarcPolicy.reject;
    }
    throw Exception('$this is not known in enum RuleDmarcPolicy');
  }
}

enum RuleIpEmailAttribute {
  sourceIp,
}

extension RuleIpEmailAttributeValueExtension on RuleIpEmailAttribute {
  String toValue() {
    switch (this) {
      case RuleIpEmailAttribute.sourceIp:
        return 'SOURCE_IP';
    }
  }
}

extension RuleIpEmailAttributeFromString on String {
  RuleIpEmailAttribute toRuleIpEmailAttribute() {
    switch (this) {
      case 'SOURCE_IP':
        return RuleIpEmailAttribute.sourceIp;
    }
    throw Exception('$this is not known in enum RuleIpEmailAttribute');
  }
}

/// An IP address expression matching certain IP addresses within a given range
/// of IP addresses.
class RuleIpExpression {
  /// The IP address to evaluate in this condition.
  final RuleIpToEvaluate evaluate;

  /// The operator to evaluate the IP address.
  final RuleIpOperator operator;

  /// The IP CIDR blocks in format "x.y.z.w/n" (eg 10.0.0.0/8) to match with the
  /// email's IP address. For the operator CIDR_MATCHES, if multiple values are
  /// given, they are evaluated as an OR. That is, if the IP address is contained
  /// within any of the given CIDR ranges, the condition is deemed to match. For
  /// NOT_CIDR_MATCHES, if multiple CIDR ranges are given, the condition is deemed
  /// to match if the IP address is not contained in any of the given CIDR ranges.
  final List<String> values;

  RuleIpExpression({
    required this.evaluate,
    required this.operator,
    required this.values,
  });

  factory RuleIpExpression.fromJson(Map<String, dynamic> json) {
    return RuleIpExpression(
      evaluate:
          RuleIpToEvaluate.fromJson(json['Evaluate'] as Map<String, dynamic>),
      operator: (json['Operator'] as String).toRuleIpOperator(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    final values = this.values;
    return {
      'Evaluate': evaluate,
      'Operator': operator.toValue(),
      'Values': values,
    };
  }
}

enum RuleIpOperator {
  cidrMatches,
  notCidrMatches,
}

extension RuleIpOperatorValueExtension on RuleIpOperator {
  String toValue() {
    switch (this) {
      case RuleIpOperator.cidrMatches:
        return 'CIDR_MATCHES';
      case RuleIpOperator.notCidrMatches:
        return 'NOT_CIDR_MATCHES';
    }
  }
}

extension RuleIpOperatorFromString on String {
  RuleIpOperator toRuleIpOperator() {
    switch (this) {
      case 'CIDR_MATCHES':
        return RuleIpOperator.cidrMatches;
      case 'NOT_CIDR_MATCHES':
        return RuleIpOperator.notCidrMatches;
    }
    throw Exception('$this is not known in enum RuleIpOperator');
  }
}

/// The IP address to evaluate for this condition.
class RuleIpToEvaluate {
  /// The attribute of the email to evaluate.
  final RuleIpEmailAttribute? attribute;

  RuleIpToEvaluate({
    this.attribute,
  });

  factory RuleIpToEvaluate.fromJson(Map<String, dynamic> json) {
    return RuleIpToEvaluate(
      attribute: (json['Attribute'] as String?)?.toRuleIpEmailAttribute(),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    return {
      if (attribute != null) 'Attribute': attribute.toValue(),
    };
  }
}

enum RuleNumberEmailAttribute {
  messageSize,
}

extension RuleNumberEmailAttributeValueExtension on RuleNumberEmailAttribute {
  String toValue() {
    switch (this) {
      case RuleNumberEmailAttribute.messageSize:
        return 'MESSAGE_SIZE';
    }
  }
}

extension RuleNumberEmailAttributeFromString on String {
  RuleNumberEmailAttribute toRuleNumberEmailAttribute() {
    switch (this) {
      case 'MESSAGE_SIZE':
        return RuleNumberEmailAttribute.messageSize;
    }
    throw Exception('$this is not known in enum RuleNumberEmailAttribute');
  }
}

/// A number expression to match numeric conditions with integers from the
/// incoming email.
class RuleNumberExpression {
  /// The number to evaluate in a numeric condition expression.
  final RuleNumberToEvaluate evaluate;

  /// The operator for a numeric condition expression.
  final RuleNumberOperator operator;

  /// The value to evaluate in a numeric condition expression.
  final double value;

  RuleNumberExpression({
    required this.evaluate,
    required this.operator,
    required this.value,
  });

  factory RuleNumberExpression.fromJson(Map<String, dynamic> json) {
    return RuleNumberExpression(
      evaluate: RuleNumberToEvaluate.fromJson(
          json['Evaluate'] as Map<String, dynamic>),
      operator: (json['Operator'] as String).toRuleNumberOperator(),
      value: json['Value'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    final value = this.value;
    return {
      'Evaluate': evaluate,
      'Operator': operator.toValue(),
      'Value': value,
    };
  }
}

enum RuleNumberOperator {
  equals,
  notEquals,
  lessThan,
  greaterThan,
  lessThanOrEqual,
  greaterThanOrEqual,
}

extension RuleNumberOperatorValueExtension on RuleNumberOperator {
  String toValue() {
    switch (this) {
      case RuleNumberOperator.equals:
        return 'EQUALS';
      case RuleNumberOperator.notEquals:
        return 'NOT_EQUALS';
      case RuleNumberOperator.lessThan:
        return 'LESS_THAN';
      case RuleNumberOperator.greaterThan:
        return 'GREATER_THAN';
      case RuleNumberOperator.lessThanOrEqual:
        return 'LESS_THAN_OR_EQUAL';
      case RuleNumberOperator.greaterThanOrEqual:
        return 'GREATER_THAN_OR_EQUAL';
    }
  }
}

extension RuleNumberOperatorFromString on String {
  RuleNumberOperator toRuleNumberOperator() {
    switch (this) {
      case 'EQUALS':
        return RuleNumberOperator.equals;
      case 'NOT_EQUALS':
        return RuleNumberOperator.notEquals;
      case 'LESS_THAN':
        return RuleNumberOperator.lessThan;
      case 'GREATER_THAN':
        return RuleNumberOperator.greaterThan;
      case 'LESS_THAN_OR_EQUAL':
        return RuleNumberOperator.lessThanOrEqual;
      case 'GREATER_THAN_OR_EQUAL':
        return RuleNumberOperator.greaterThanOrEqual;
    }
    throw Exception('$this is not known in enum RuleNumberOperator');
  }
}

/// The number to evaluate in a numeric condition expression.
class RuleNumberToEvaluate {
  /// An email attribute that is used as the number to evaluate.
  final RuleNumberEmailAttribute? attribute;

  RuleNumberToEvaluate({
    this.attribute,
  });

  factory RuleNumberToEvaluate.fromJson(Map<String, dynamic> json) {
    return RuleNumberToEvaluate(
      attribute: (json['Attribute'] as String?)?.toRuleNumberEmailAttribute(),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    return {
      if (attribute != null) 'Attribute': attribute.toValue(),
    };
  }
}

/// A rule set contains a list of rules that are evaluated in order. Each rule
/// is evaluated sequentially for each email.
class RuleSet {
  /// The last modification date of the rule set.
  final DateTime? lastModificationDate;

  /// The identifier of the rule set.
  final String? ruleSetId;

  /// A user-friendly name for the rule set.
  final String? ruleSetName;

  RuleSet({
    this.lastModificationDate,
    this.ruleSetId,
    this.ruleSetName,
  });

  factory RuleSet.fromJson(Map<String, dynamic> json) {
    return RuleSet(
      lastModificationDate: timeStampFromJson(json['LastModificationDate']),
      ruleSetId: json['RuleSetId'] as String?,
      ruleSetName: json['RuleSetName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastModificationDate = this.lastModificationDate;
    final ruleSetId = this.ruleSetId;
    final ruleSetName = this.ruleSetName;
    return {
      if (lastModificationDate != null)
        'LastModificationDate': unixTimestampToJson(lastModificationDate),
      if (ruleSetId != null) 'RuleSetId': ruleSetId,
      if (ruleSetName != null) 'RuleSetName': ruleSetName,
    };
  }
}

enum RuleStringEmailAttribute {
  mailFrom,
  helo,
  recipient,
  sender,
  from,
  subject,
  to,
  cc,
}

extension RuleStringEmailAttributeValueExtension on RuleStringEmailAttribute {
  String toValue() {
    switch (this) {
      case RuleStringEmailAttribute.mailFrom:
        return 'MAIL_FROM';
      case RuleStringEmailAttribute.helo:
        return 'HELO';
      case RuleStringEmailAttribute.recipient:
        return 'RECIPIENT';
      case RuleStringEmailAttribute.sender:
        return 'SENDER';
      case RuleStringEmailAttribute.from:
        return 'FROM';
      case RuleStringEmailAttribute.subject:
        return 'SUBJECT';
      case RuleStringEmailAttribute.to:
        return 'TO';
      case RuleStringEmailAttribute.cc:
        return 'CC';
    }
  }
}

extension RuleStringEmailAttributeFromString on String {
  RuleStringEmailAttribute toRuleStringEmailAttribute() {
    switch (this) {
      case 'MAIL_FROM':
        return RuleStringEmailAttribute.mailFrom;
      case 'HELO':
        return RuleStringEmailAttribute.helo;
      case 'RECIPIENT':
        return RuleStringEmailAttribute.recipient;
      case 'SENDER':
        return RuleStringEmailAttribute.sender;
      case 'FROM':
        return RuleStringEmailAttribute.from;
      case 'SUBJECT':
        return RuleStringEmailAttribute.subject;
      case 'TO':
        return RuleStringEmailAttribute.to;
      case 'CC':
        return RuleStringEmailAttribute.cc;
    }
    throw Exception('$this is not known in enum RuleStringEmailAttribute');
  }
}

/// A string expression is evaluated against strings or substrings of the email.
class RuleStringExpression {
  /// The string to evaluate in a string condition expression.
  final RuleStringToEvaluate evaluate;

  /// The matching operator for a string condition expression.
  final RuleStringOperator operator;

  /// The string(s) to be evaluated in a string condition expression. For all
  /// operators, except for NOT_EQUALS, if multiple values are given, the values
  /// are processed as an OR. That is, if any of the values match the email's
  /// string using the given operator, the condition is deemed to match. However,
  /// for NOT_EQUALS, the condition is only deemed to match if none of the given
  /// strings match the email's string.
  final List<String> values;

  RuleStringExpression({
    required this.evaluate,
    required this.operator,
    required this.values,
  });

  factory RuleStringExpression.fromJson(Map<String, dynamic> json) {
    return RuleStringExpression(
      evaluate: RuleStringToEvaluate.fromJson(
          json['Evaluate'] as Map<String, dynamic>),
      operator: (json['Operator'] as String).toRuleStringOperator(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    final values = this.values;
    return {
      'Evaluate': evaluate,
      'Operator': operator.toValue(),
      'Values': values,
    };
  }
}

enum RuleStringOperator {
  equals,
  notEquals,
  startsWith,
  endsWith,
  contains,
}

extension RuleStringOperatorValueExtension on RuleStringOperator {
  String toValue() {
    switch (this) {
      case RuleStringOperator.equals:
        return 'EQUALS';
      case RuleStringOperator.notEquals:
        return 'NOT_EQUALS';
      case RuleStringOperator.startsWith:
        return 'STARTS_WITH';
      case RuleStringOperator.endsWith:
        return 'ENDS_WITH';
      case RuleStringOperator.contains:
        return 'CONTAINS';
    }
  }
}

extension RuleStringOperatorFromString on String {
  RuleStringOperator toRuleStringOperator() {
    switch (this) {
      case 'EQUALS':
        return RuleStringOperator.equals;
      case 'NOT_EQUALS':
        return RuleStringOperator.notEquals;
      case 'STARTS_WITH':
        return RuleStringOperator.startsWith;
      case 'ENDS_WITH':
        return RuleStringOperator.endsWith;
      case 'CONTAINS':
        return RuleStringOperator.contains;
    }
    throw Exception('$this is not known in enum RuleStringOperator');
  }
}

/// The string to evaluate in a string condition expression.
class RuleStringToEvaluate {
  /// The email attribute to evaluate in a string condition expression.
  final RuleStringEmailAttribute? attribute;

  RuleStringToEvaluate({
    this.attribute,
  });

  factory RuleStringToEvaluate.fromJson(Map<String, dynamic> json) {
    return RuleStringToEvaluate(
      attribute: (json['Attribute'] as String?)?.toRuleStringEmailAttribute(),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    return {
      if (attribute != null) 'Attribute': attribute.toValue(),
    };
  }
}

enum RuleVerdict {
  pass,
  fail,
  gray,
  processingFailed,
}

extension RuleVerdictValueExtension on RuleVerdict {
  String toValue() {
    switch (this) {
      case RuleVerdict.pass:
        return 'PASS';
      case RuleVerdict.fail:
        return 'FAIL';
      case RuleVerdict.gray:
        return 'GRAY';
      case RuleVerdict.processingFailed:
        return 'PROCESSING_FAILED';
    }
  }
}

extension RuleVerdictFromString on String {
  RuleVerdict toRuleVerdict() {
    switch (this) {
      case 'PASS':
        return RuleVerdict.pass;
      case 'FAIL':
        return RuleVerdict.fail;
      case 'GRAY':
        return RuleVerdict.gray;
      case 'PROCESSING_FAILED':
        return RuleVerdict.processingFailed;
    }
    throw Exception('$this is not known in enum RuleVerdict');
  }
}

enum RuleVerdictAttribute {
  spf,
  dkim,
}

extension RuleVerdictAttributeValueExtension on RuleVerdictAttribute {
  String toValue() {
    switch (this) {
      case RuleVerdictAttribute.spf:
        return 'SPF';
      case RuleVerdictAttribute.dkim:
        return 'DKIM';
    }
  }
}

extension RuleVerdictAttributeFromString on String {
  RuleVerdictAttribute toRuleVerdictAttribute() {
    switch (this) {
      case 'SPF':
        return RuleVerdictAttribute.spf;
      case 'DKIM':
        return RuleVerdictAttribute.dkim;
    }
    throw Exception('$this is not known in enum RuleVerdictAttribute');
  }
}

/// A verdict expression is evaluated against verdicts of the email.
class RuleVerdictExpression {
  /// The verdict to evaluate in a verdict condition expression.
  final RuleVerdictToEvaluate evaluate;

  /// The matching operator for a verdict condition expression.
  final RuleVerdictOperator operator;

  /// The values to match with the email's verdict using the given operator. For
  /// the EQUALS operator, if multiple values are given, the condition is deemed
  /// to match if any of the given verdicts match that of the email. For the
  /// NOT_EQUALS operator, if multiple values are given, the condition is deemed
  /// to match of none of the given verdicts match the verdict of the email.
  final List<RuleVerdict> values;

  RuleVerdictExpression({
    required this.evaluate,
    required this.operator,
    required this.values,
  });

  factory RuleVerdictExpression.fromJson(Map<String, dynamic> json) {
    return RuleVerdictExpression(
      evaluate: RuleVerdictToEvaluate.fromJson(
          json['Evaluate'] as Map<String, dynamic>),
      operator: (json['Operator'] as String).toRuleVerdictOperator(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => (e as String).toRuleVerdict())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final evaluate = this.evaluate;
    final operator = this.operator;
    final values = this.values;
    return {
      'Evaluate': evaluate,
      'Operator': operator.toValue(),
      'Values': values.map((e) => e.toValue()).toList(),
    };
  }
}

enum RuleVerdictOperator {
  equals,
  notEquals,
}

extension RuleVerdictOperatorValueExtension on RuleVerdictOperator {
  String toValue() {
    switch (this) {
      case RuleVerdictOperator.equals:
        return 'EQUALS';
      case RuleVerdictOperator.notEquals:
        return 'NOT_EQUALS';
    }
  }
}

extension RuleVerdictOperatorFromString on String {
  RuleVerdictOperator toRuleVerdictOperator() {
    switch (this) {
      case 'EQUALS':
        return RuleVerdictOperator.equals;
      case 'NOT_EQUALS':
        return RuleVerdictOperator.notEquals;
    }
    throw Exception('$this is not known in enum RuleVerdictOperator');
  }
}

/// The verdict to evaluate in a verdict condition expression.
class RuleVerdictToEvaluate {
  /// The Add On ARN and its returned value to evaluate in a verdict condition
  /// expression.
  final Analysis? analysis;

  /// The email verdict attribute to evaluate in a string verdict expression.
  final RuleVerdictAttribute? attribute;

  RuleVerdictToEvaluate({
    this.analysis,
    this.attribute,
  });

  factory RuleVerdictToEvaluate.fromJson(Map<String, dynamic> json) {
    return RuleVerdictToEvaluate(
      analysis: json['Analysis'] != null
          ? Analysis.fromJson(json['Analysis'] as Map<String, dynamic>)
          : null,
      attribute: (json['Attribute'] as String?)?.toRuleVerdictAttribute(),
    );
  }

  Map<String, dynamic> toJson() {
    final analysis = this.analysis;
    final attribute = this.attribute;
    return {
      if (analysis != null) 'Analysis': analysis,
      if (attribute != null) 'Attribute': attribute.toValue(),
    };
  }
}

/// Writes the MIME content of the email to an S3 bucket.
class S3Action {
  /// The Amazon Resource Name (ARN) of the IAM Role to use while writing to S3.
  /// This role must have access to the s3:PutObject, kms:Encrypt, and
  /// kms:GenerateDataKey APIs for the given bucket.
  final String roleArn;

  /// The bucket name of the S3 bucket to write to.
  final String s3Bucket;

  /// A policy that states what to do in the case of failure. The action will fail
  /// if there are configuration errors. For example, the specified the bucket has
  /// been deleted.
  final ActionFailurePolicy? actionFailurePolicy;

  /// The S3 prefix to use for the write to the s3 bucket.
  final String? s3Prefix;

  /// The KMS Key ID to use to encrypt the message in S3.
  final String? s3SseKmsKeyId;

  S3Action({
    required this.roleArn,
    required this.s3Bucket,
    this.actionFailurePolicy,
    this.s3Prefix,
    this.s3SseKmsKeyId,
  });

  factory S3Action.fromJson(Map<String, dynamic> json) {
    return S3Action(
      roleArn: json['RoleArn'] as String,
      s3Bucket: json['S3Bucket'] as String,
      actionFailurePolicy:
          (json['ActionFailurePolicy'] as String?)?.toActionFailurePolicy(),
      s3Prefix: json['S3Prefix'] as String?,
      s3SseKmsKeyId: json['S3SseKmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final s3Bucket = this.s3Bucket;
    final actionFailurePolicy = this.actionFailurePolicy;
    final s3Prefix = this.s3Prefix;
    final s3SseKmsKeyId = this.s3SseKmsKeyId;
    return {
      'RoleArn': roleArn,
      'S3Bucket': s3Bucket,
      if (actionFailurePolicy != null)
        'ActionFailurePolicy': actionFailurePolicy.toValue(),
      if (s3Prefix != null) 'S3Prefix': s3Prefix,
      if (s3SseKmsKeyId != null) 'S3SseKmsKeyId': s3SseKmsKeyId,
    };
  }
}

/// The configuration for exporting email data to an Amazon S3 bucket.
class S3ExportDestinationConfiguration {
  /// The S3 location to deliver the exported email data.
  final String? s3Location;

  S3ExportDestinationConfiguration({
    this.s3Location,
  });

  factory S3ExportDestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return S3ExportDestinationConfiguration(
      s3Location: json['S3Location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Location = this.s3Location;
    return {
      if (s3Location != null) 'S3Location': s3Location,
    };
  }
}

enum SearchState {
  queued,
  running,
  completed,
  failed,
  cancelled,
}

extension SearchStateValueExtension on SearchState {
  String toValue() {
    switch (this) {
      case SearchState.queued:
        return 'QUEUED';
      case SearchState.running:
        return 'RUNNING';
      case SearchState.completed:
        return 'COMPLETED';
      case SearchState.failed:
        return 'FAILED';
      case SearchState.cancelled:
        return 'CANCELLED';
    }
  }
}

extension SearchStateFromString on String {
  SearchState toSearchState() {
    switch (this) {
      case 'QUEUED':
        return SearchState.queued;
      case 'RUNNING':
        return SearchState.running;
      case 'COMPLETED':
        return SearchState.completed;
      case 'FAILED':
        return SearchState.failed;
      case 'CANCELLED':
        return SearchState.cancelled;
    }
    throw Exception('$this is not known in enum SearchState');
  }
}

/// The current status of an archive search job.
class SearchStatus {
  /// The timestamp of when the search completed (if finished).
  final DateTime? completionTimestamp;

  /// An error message if the search failed.
  final String? errorMessage;

  /// The current state of the search job.
  final SearchState? state;

  /// The timestamp of when the search was submitted.
  final DateTime? submissionTimestamp;

  SearchStatus({
    this.completionTimestamp,
    this.errorMessage,
    this.state,
    this.submissionTimestamp,
  });

  factory SearchStatus.fromJson(Map<String, dynamic> json) {
    return SearchStatus(
      completionTimestamp: timeStampFromJson(json['CompletionTimestamp']),
      errorMessage: json['ErrorMessage'] as String?,
      state: (json['State'] as String?)?.toSearchState(),
      submissionTimestamp: timeStampFromJson(json['SubmissionTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final completionTimestamp = this.completionTimestamp;
    final errorMessage = this.errorMessage;
    final state = this.state;
    final submissionTimestamp = this.submissionTimestamp;
    return {
      if (completionTimestamp != null)
        'CompletionTimestamp': unixTimestampToJson(completionTimestamp),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (state != null) 'State': state.toValue(),
      if (submissionTimestamp != null)
        'SubmissionTimestamp': unixTimestampToJson(submissionTimestamp),
    };
  }
}

/// Summary details of an archive search job.
class SearchSummary {
  /// The unique identifier of the search job.
  final String? searchId;

  /// The current status of the search job.
  final SearchStatus? status;

  SearchSummary({
    this.searchId,
    this.status,
  });

  factory SearchSummary.fromJson(Map<String, dynamic> json) {
    return SearchSummary(
      searchId: json['SearchId'] as String?,
      status: json['Status'] != null
          ? SearchStatus.fromJson(json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final searchId = this.searchId;
    final status = this.status;
    return {
      if (searchId != null) 'SearchId': searchId,
      if (status != null) 'Status': status,
    };
  }
}

/// Sends the email to the internet using the ses:SendRawEmail API.
class SendAction {
  /// The Amazon Resource Name (ARN) of the role to use for this action. This role
  /// must have access to the ses:SendRawEmail API.
  final String roleArn;

  /// A policy that states what to do in the case of failure. The action will fail
  /// if there are configuration errors. For example, the caller does not have the
  /// permissions to call the sendRawEmail API.
  final ActionFailurePolicy? actionFailurePolicy;

  SendAction({
    required this.roleArn,
    this.actionFailurePolicy,
  });

  factory SendAction.fromJson(Map<String, dynamic> json) {
    return SendAction(
      roleArn: json['RoleArn'] as String,
      actionFailurePolicy:
          (json['ActionFailurePolicy'] as String?)?.toActionFailurePolicy(),
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final actionFailurePolicy = this.actionFailurePolicy;
    return {
      'RoleArn': roleArn,
      if (actionFailurePolicy != null)
        'ActionFailurePolicy': actionFailurePolicy.toValue(),
    };
  }
}

/// The response from initiating an archive export.
class StartArchiveExportResponse {
  /// The unique identifier for the initiated export job.
  final String? exportId;

  StartArchiveExportResponse({
    this.exportId,
  });

  factory StartArchiveExportResponse.fromJson(Map<String, dynamic> json) {
    return StartArchiveExportResponse(
      exportId: json['ExportId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportId = this.exportId;
    return {
      if (exportId != null) 'ExportId': exportId,
    };
  }
}

/// The response from initiating an archive search.
class StartArchiveSearchResponse {
  /// The unique identifier for the initiated search job.
  final String? searchId;

  StartArchiveSearchResponse({
    this.searchId,
  });

  factory StartArchiveSearchResponse.fromJson(Map<String, dynamic> json) {
    return StartArchiveSearchResponse(
      searchId: json['SearchId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final searchId = this.searchId;
    return {
      if (searchId != null) 'SearchId': searchId,
    };
  }
}

/// The response indicating if the request to stop the export job succeeded.
///
/// On success, returns an HTTP 200 status code. On failure, returns an error
/// message.
class StopArchiveExportResponse {
  StopArchiveExportResponse();

  factory StopArchiveExportResponse.fromJson(Map<String, dynamic> _) {
    return StopArchiveExportResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The response indicating if the request to stop the search job succeeded.
///
/// On success, returns an HTTP 200 status code. On failure, returns an error
/// message.
class StopArchiveSearchResponse {
  StopArchiveSearchResponse();

  factory StopArchiveSearchResponse.fromJson(Map<String, dynamic> _) {
    return StopArchiveSearchResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A key-value pair (the value is optional), that you can define and assign to
/// Amazon Web Services resources.
class Tag {
  /// The key of the key-value tag.
  final String key;

  /// The value of the key-value tag.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
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

/// The structure of a traffic policy resource which is a container for policy
/// statements.
class TrafficPolicy {
  /// Default action instructs the traﬃc policy to either Allow or Deny (block)
  /// messages that fall outside of (or not addressed by) the conditions of your
  /// policy statements
  final AcceptAction defaultAction;

  /// The identifier of the traffic policy resource.
  final String trafficPolicyId;

  /// A user-friendly name of the traffic policy resource.
  final String trafficPolicyName;

  TrafficPolicy({
    required this.defaultAction,
    required this.trafficPolicyId,
    required this.trafficPolicyName,
  });

  factory TrafficPolicy.fromJson(Map<String, dynamic> json) {
    return TrafficPolicy(
      defaultAction: (json['DefaultAction'] as String).toAcceptAction(),
      trafficPolicyId: json['TrafficPolicyId'] as String,
      trafficPolicyName: json['TrafficPolicyName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final defaultAction = this.defaultAction;
    final trafficPolicyId = this.trafficPolicyId;
    final trafficPolicyName = this.trafficPolicyName;
    return {
      'DefaultAction': defaultAction.toValue(),
      'TrafficPolicyId': trafficPolicyId,
      'TrafficPolicyName': trafficPolicyName,
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

/// The response indicating if the archive update succeeded or failed.
///
/// On success, returns an HTTP 200 status code. On failure, returns an error
/// message.
class UpdateArchiveResponse {
  UpdateArchiveResponse();

  factory UpdateArchiveResponse.fromJson(Map<String, dynamic> _) {
    return UpdateArchiveResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateIngressPointResponse {
  UpdateIngressPointResponse();

  factory UpdateIngressPointResponse.fromJson(Map<String, dynamic> _) {
    return UpdateIngressPointResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateRelayResponse {
  UpdateRelayResponse();

  factory UpdateRelayResponse.fromJson(Map<String, dynamic> _) {
    return UpdateRelayResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateRuleSetResponse {
  UpdateRuleSetResponse();

  factory UpdateRuleSetResponse.fromJson(Map<String, dynamic> _) {
    return UpdateRuleSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateTrafficPolicyResponse {
  UpdateTrafficPolicyResponse();

  factory UpdateTrafficPolicyResponse.fromJson(Map<String, dynamic> _) {
    return UpdateTrafficPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};

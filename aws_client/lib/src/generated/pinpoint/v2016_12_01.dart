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

/// Doc Engage API - Amazon Pinpoint API
class Pinpoint {
  final _s.RestJsonProtocol _protocol;
  Pinpoint({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'pinpoint',
            signingName: 'mobiletargeting',
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

  /// Creates an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  Future<CreateAppResponse> createApp({
    required CreateApplicationRequest createApplicationRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: createApplicationRequest,
      method: 'POST',
      requestUri: '/v1/apps',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateAppResponse(
      applicationResponse: ApplicationResponse.fromJson($json),
    );
  }

  /// Creates a new campaign for an application or updates the settings of an
  /// existing campaign for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<CreateCampaignResponse> createCampaign({
    required String applicationId,
    required WriteCampaignRequest writeCampaignRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: writeCampaignRequest,
      method: 'POST',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/campaigns',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateCampaignResponse(
      campaignResponse: CampaignResponse.fromJson($json),
    );
  }

  /// Creates a message template for messages that are sent through the email
  /// channel.
  ///
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  Future<CreateEmailTemplateResponse> createEmailTemplate({
    required EmailTemplateRequest emailTemplateRequest,
    required String templateName,
  }) async {
    final response = await _protocol.sendRaw(
      payload: emailTemplateRequest,
      method: 'POST',
      requestUri: '/v1/templates/${Uri.encodeComponent(templateName)}/email',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateEmailTemplateResponse(
      createTemplateMessageBody: CreateTemplateMessageBody.fromJson($json),
    );
  }

  /// Creates an export job for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<CreateExportJobResponse> createExportJob({
    required String applicationId,
    required ExportJobRequest exportJobRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: exportJobRequest,
      method: 'POST',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/jobs/export',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateExportJobResponse(
      exportJobResponse: ExportJobResponse.fromJson($json),
    );
  }

  /// Creates an import job for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<CreateImportJobResponse> createImportJob({
    required String applicationId,
    required ImportJobRequest importJobRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: importJobRequest,
      method: 'POST',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/jobs/import',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateImportJobResponse(
      importJobResponse: ImportJobResponse.fromJson($json),
    );
  }

  /// Creates a new message template for messages using the in-app message
  /// channel.
  ///
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  Future<CreateInAppTemplateResponse> createInAppTemplate({
    required InAppTemplateRequest inAppTemplateRequest,
    required String templateName,
  }) async {
    final response = await _protocol.sendRaw(
      payload: inAppTemplateRequest,
      method: 'POST',
      requestUri: '/v1/templates/${Uri.encodeComponent(templateName)}/inapp',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateInAppTemplateResponse(
      templateCreateMessageBody: TemplateCreateMessageBody.fromJson($json),
    );
  }

  /// Creates a journey for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<CreateJourneyResponse> createJourney({
    required String applicationId,
    required WriteJourneyRequest writeJourneyRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: writeJourneyRequest,
      method: 'POST',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/journeys',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateJourneyResponse(
      journeyResponse: JourneyResponse.fromJson($json),
    );
  }

  /// Creates a message template for messages that are sent through a push
  /// notification channel.
  ///
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  Future<CreatePushTemplateResponse> createPushTemplate({
    required PushNotificationTemplateRequest pushNotificationTemplateRequest,
    required String templateName,
  }) async {
    final response = await _protocol.sendRaw(
      payload: pushNotificationTemplateRequest,
      method: 'POST',
      requestUri: '/v1/templates/${Uri.encodeComponent(templateName)}/push',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreatePushTemplateResponse(
      createTemplateMessageBody: CreateTemplateMessageBody.fromJson($json),
    );
  }

  /// Creates an Amazon Pinpoint configuration for a recommender model.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  Future<CreateRecommenderConfigurationResponse>
      createRecommenderConfiguration({
    required CreateRecommenderConfiguration createRecommenderConfiguration,
  }) async {
    final response = await _protocol.sendRaw(
      payload: createRecommenderConfiguration,
      method: 'POST',
      requestUri: '/v1/recommenders',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateRecommenderConfigurationResponse(
      recommenderConfigurationResponse:
          RecommenderConfigurationResponse.fromJson($json),
    );
  }

  /// Creates a new segment for an application or updates the configuration,
  /// dimension, and other settings for an existing segment that's associated
  /// with an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<CreateSegmentResponse> createSegment({
    required String applicationId,
    required WriteSegmentRequest writeSegmentRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: writeSegmentRequest,
      method: 'POST',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/segments',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateSegmentResponse(
      segmentResponse: SegmentResponse.fromJson($json),
    );
  }

  /// Creates a message template for messages that are sent through the SMS
  /// channel.
  ///
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  Future<CreateSmsTemplateResponse> createSmsTemplate({
    required SMSTemplateRequest sMSTemplateRequest,
    required String templateName,
  }) async {
    final response = await _protocol.sendRaw(
      payload: sMSTemplateRequest,
      method: 'POST',
      requestUri: '/v1/templates/${Uri.encodeComponent(templateName)}/sms',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateSmsTemplateResponse(
      createTemplateMessageBody: CreateTemplateMessageBody.fromJson($json),
    );
  }

  /// Creates a message template for messages that are sent through the voice
  /// channel.
  ///
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  Future<CreateVoiceTemplateResponse> createVoiceTemplate({
    required String templateName,
    required VoiceTemplateRequest voiceTemplateRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: voiceTemplateRequest,
      method: 'POST',
      requestUri: '/v1/templates/${Uri.encodeComponent(templateName)}/voice',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateVoiceTemplateResponse(
      createTemplateMessageBody: CreateTemplateMessageBody.fromJson($json),
    );
  }

  /// Disables the ADM channel for an application and deletes any existing
  /// settings for the channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<DeleteAdmChannelResponse> deleteAdmChannel({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/adm',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteAdmChannelResponse(
      aDMChannelResponse: ADMChannelResponse.fromJson($json),
    );
  }

  /// Disables the APNs channel for an application and deletes any existing
  /// settings for the channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<DeleteApnsChannelResponse> deleteApnsChannel({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/apns',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteApnsChannelResponse(
      aPNSChannelResponse: APNSChannelResponse.fromJson($json),
    );
  }

  /// Disables the APNs sandbox channel for an application and deletes any
  /// existing settings for the channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<DeleteApnsSandboxChannelResponse> deleteApnsSandboxChannel({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/apns_sandbox',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteApnsSandboxChannelResponse(
      aPNSSandboxChannelResponse: APNSSandboxChannelResponse.fromJson($json),
    );
  }

  /// Disables the APNs VoIP channel for an application and deletes any existing
  /// settings for the channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<DeleteApnsVoipChannelResponse> deleteApnsVoipChannel({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/apns_voip',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteApnsVoipChannelResponse(
      aPNSVoipChannelResponse: APNSVoipChannelResponse.fromJson($json),
    );
  }

  /// Disables the APNs VoIP sandbox channel for an application and deletes any
  /// existing settings for the channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<DeleteApnsVoipSandboxChannelResponse> deleteApnsVoipSandboxChannel({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/apns_voip_sandbox',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteApnsVoipSandboxChannelResponse(
      aPNSVoipSandboxChannelResponse:
          APNSVoipSandboxChannelResponse.fromJson($json),
    );
  }

  /// Deletes an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<DeleteAppResponse> deleteApp({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteAppResponse(
      applicationResponse: ApplicationResponse.fromJson($json),
    );
  }

  /// Disables the Baidu channel for an application and deletes any existing
  /// settings for the channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<DeleteBaiduChannelResponse> deleteBaiduChannel({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/baidu',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteBaiduChannelResponse(
      baiduChannelResponse: BaiduChannelResponse.fromJson($json),
    );
  }

  /// Deletes a campaign from an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [campaignId] :
  /// The unique identifier for the campaign.
  Future<DeleteCampaignResponse> deleteCampaign({
    required String applicationId,
    required String campaignId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/campaigns/${Uri.encodeComponent(campaignId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteCampaignResponse(
      campaignResponse: CampaignResponse.fromJson($json),
    );
  }

  /// Disables the email channel for an application and deletes any existing
  /// settings for the channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<DeleteEmailChannelResponse> deleteEmailChannel({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/email',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteEmailChannelResponse(
      emailChannelResponse: EmailChannelResponse.fromJson($json),
    );
  }

  /// Deletes a message template for messages that were sent through the email
  /// channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  ///
  /// Parameter [version] :
  /// The unique identifier for the version of the message template to update,
  /// retrieve information about, or delete. To retrieve identifiers and other
  /// information for all the versions of a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  ///
  /// If specified, this value must match the identifier for an existing
  /// template version. If specified for an update operation, this value must
  /// match the identifier for the latest existing version of the template. This
  /// restriction helps ensure that race conditions don't occur.
  ///
  /// If you don't specify a value for this parameter, Amazon Pinpoint does the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// For a get operation, retrieves information about the active version of the
  /// template.
  /// </li>
  /// <li>
  /// For an update operation, saves the updates to (overwrites) the latest
  /// existing version of the template, if the create-new-version parameter
  /// isn't used or is set to false.
  /// </li>
  /// <li>
  /// For a delete operation, deletes the template, including all versions of
  /// the template.
  /// </li>
  /// </ul>
  Future<DeleteEmailTemplateResponse> deleteEmailTemplate({
    required String templateName,
    String? version,
  }) async {
    final $query = <String, List<String>>{
      if (version != null) 'version': [version],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/templates/${Uri.encodeComponent(templateName)}/email',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteEmailTemplateResponse(
      messageBody: MessageBody.fromJson($json),
    );
  }

  /// Deletes an endpoint from an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [endpointId] :
  /// The case insensitive unique identifier for the endpoint. The identifier
  /// can't contain <code>$</code>, <code>{</code> or <code>}</code>.
  Future<DeleteEndpointResponse> deleteEndpoint({
    required String applicationId,
    required String endpointId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/endpoints/${Uri.encodeComponent(endpointId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteEndpointResponse(
      endpointResponse: EndpointResponse.fromJson($json),
    );
  }

  /// Deletes the event stream for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<DeleteEventStreamResponse> deleteEventStream({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/eventstream',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteEventStreamResponse(
      eventStream: EventStream.fromJson($json),
    );
  }

  /// Disables the GCM channel for an application and deletes any existing
  /// settings for the channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<DeleteGcmChannelResponse> deleteGcmChannel({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/gcm',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteGcmChannelResponse(
      gCMChannelResponse: GCMChannelResponse.fromJson($json),
    );
  }

  /// Deletes a message template for messages sent using the in-app message
  /// channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  ///
  /// Parameter [version] :
  /// The unique identifier for the version of the message template to update,
  /// retrieve information about, or delete. To retrieve identifiers and other
  /// information for all the versions of a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  ///
  /// If specified, this value must match the identifier for an existing
  /// template version. If specified for an update operation, this value must
  /// match the identifier for the latest existing version of the template. This
  /// restriction helps ensure that race conditions don't occur.
  ///
  /// If you don't specify a value for this parameter, Amazon Pinpoint does the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// For a get operation, retrieves information about the active version of the
  /// template.
  /// </li>
  /// <li>
  /// For an update operation, saves the updates to (overwrites) the latest
  /// existing version of the template, if the create-new-version parameter
  /// isn't used or is set to false.
  /// </li>
  /// <li>
  /// For a delete operation, deletes the template, including all versions of
  /// the template.
  /// </li>
  /// </ul>
  Future<DeleteInAppTemplateResponse> deleteInAppTemplate({
    required String templateName,
    String? version,
  }) async {
    final $query = <String, List<String>>{
      if (version != null) 'version': [version],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/templates/${Uri.encodeComponent(templateName)}/inapp',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteInAppTemplateResponse(
      messageBody: MessageBody.fromJson($json),
    );
  }

  /// Deletes a journey from an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [journeyId] :
  /// The unique identifier for the journey.
  Future<DeleteJourneyResponse> deleteJourney({
    required String applicationId,
    required String journeyId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/journeys/${Uri.encodeComponent(journeyId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteJourneyResponse(
      journeyResponse: JourneyResponse.fromJson($json),
    );
  }

  /// Deletes a message template for messages that were sent through a push
  /// notification channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  ///
  /// Parameter [version] :
  /// The unique identifier for the version of the message template to update,
  /// retrieve information about, or delete. To retrieve identifiers and other
  /// information for all the versions of a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  ///
  /// If specified, this value must match the identifier for an existing
  /// template version. If specified for an update operation, this value must
  /// match the identifier for the latest existing version of the template. This
  /// restriction helps ensure that race conditions don't occur.
  ///
  /// If you don't specify a value for this parameter, Amazon Pinpoint does the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// For a get operation, retrieves information about the active version of the
  /// template.
  /// </li>
  /// <li>
  /// For an update operation, saves the updates to (overwrites) the latest
  /// existing version of the template, if the create-new-version parameter
  /// isn't used or is set to false.
  /// </li>
  /// <li>
  /// For a delete operation, deletes the template, including all versions of
  /// the template.
  /// </li>
  /// </ul>
  Future<DeletePushTemplateResponse> deletePushTemplate({
    required String templateName,
    String? version,
  }) async {
    final $query = <String, List<String>>{
      if (version != null) 'version': [version],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/templates/${Uri.encodeComponent(templateName)}/push',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeletePushTemplateResponse(
      messageBody: MessageBody.fromJson($json),
    );
  }

  /// Deletes an Amazon Pinpoint configuration for a recommender model.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [recommenderId] :
  /// The unique identifier for the recommender model configuration. This
  /// identifier is displayed as the <b>Recommender ID</b> on the Amazon
  /// Pinpoint console.
  Future<DeleteRecommenderConfigurationResponse>
      deleteRecommenderConfiguration({
    required String recommenderId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/recommenders/${Uri.encodeComponent(recommenderId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteRecommenderConfigurationResponse(
      recommenderConfigurationResponse:
          RecommenderConfigurationResponse.fromJson($json),
    );
  }

  /// Deletes a segment from an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [segmentId] :
  /// The unique identifier for the segment.
  Future<DeleteSegmentResponse> deleteSegment({
    required String applicationId,
    required String segmentId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/segments/${Uri.encodeComponent(segmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteSegmentResponse(
      segmentResponse: SegmentResponse.fromJson($json),
    );
  }

  /// Disables the SMS channel for an application and deletes any existing
  /// settings for the channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<DeleteSmsChannelResponse> deleteSmsChannel({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/sms',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteSmsChannelResponse(
      sMSChannelResponse: SMSChannelResponse.fromJson($json),
    );
  }

  /// Deletes a message template for messages that were sent through the SMS
  /// channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  ///
  /// Parameter [version] :
  /// The unique identifier for the version of the message template to update,
  /// retrieve information about, or delete. To retrieve identifiers and other
  /// information for all the versions of a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  ///
  /// If specified, this value must match the identifier for an existing
  /// template version. If specified for an update operation, this value must
  /// match the identifier for the latest existing version of the template. This
  /// restriction helps ensure that race conditions don't occur.
  ///
  /// If you don't specify a value for this parameter, Amazon Pinpoint does the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// For a get operation, retrieves information about the active version of the
  /// template.
  /// </li>
  /// <li>
  /// For an update operation, saves the updates to (overwrites) the latest
  /// existing version of the template, if the create-new-version parameter
  /// isn't used or is set to false.
  /// </li>
  /// <li>
  /// For a delete operation, deletes the template, including all versions of
  /// the template.
  /// </li>
  /// </ul>
  Future<DeleteSmsTemplateResponse> deleteSmsTemplate({
    required String templateName,
    String? version,
  }) async {
    final $query = <String, List<String>>{
      if (version != null) 'version': [version],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/templates/${Uri.encodeComponent(templateName)}/sms',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteSmsTemplateResponse(
      messageBody: MessageBody.fromJson($json),
    );
  }

  /// Deletes all the endpoints that are associated with a specific user ID.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [userId] :
  /// The unique identifier for the user.
  Future<DeleteUserEndpointsResponse> deleteUserEndpoints({
    required String applicationId,
    required String userId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/users/${Uri.encodeComponent(userId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteUserEndpointsResponse(
      endpointsResponse: EndpointsResponse.fromJson($json),
    );
  }

  /// Disables the voice channel for an application and deletes any existing
  /// settings for the channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<DeleteVoiceChannelResponse> deleteVoiceChannel({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/voice',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteVoiceChannelResponse(
      voiceChannelResponse: VoiceChannelResponse.fromJson($json),
    );
  }

  /// Deletes a message template for messages that were sent through the voice
  /// channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  ///
  /// Parameter [version] :
  /// The unique identifier for the version of the message template to update,
  /// retrieve information about, or delete. To retrieve identifiers and other
  /// information for all the versions of a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  ///
  /// If specified, this value must match the identifier for an existing
  /// template version. If specified for an update operation, this value must
  /// match the identifier for the latest existing version of the template. This
  /// restriction helps ensure that race conditions don't occur.
  ///
  /// If you don't specify a value for this parameter, Amazon Pinpoint does the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// For a get operation, retrieves information about the active version of the
  /// template.
  /// </li>
  /// <li>
  /// For an update operation, saves the updates to (overwrites) the latest
  /// existing version of the template, if the create-new-version parameter
  /// isn't used or is set to false.
  /// </li>
  /// <li>
  /// For a delete operation, deletes the template, including all versions of
  /// the template.
  /// </li>
  /// </ul>
  Future<DeleteVoiceTemplateResponse> deleteVoiceTemplate({
    required String templateName,
    String? version,
  }) async {
    final $query = <String, List<String>>{
      if (version != null) 'version': [version],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/templates/${Uri.encodeComponent(templateName)}/voice',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DeleteVoiceTemplateResponse(
      messageBody: MessageBody.fromJson($json),
    );
  }

  /// Retrieves information about the status and settings of the ADM channel for
  /// an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<GetAdmChannelResponse> getAdmChannel({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/adm',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetAdmChannelResponse(
      aDMChannelResponse: ADMChannelResponse.fromJson($json),
    );
  }

  /// Retrieves information about the status and settings of the APNs channel
  /// for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<GetApnsChannelResponse> getApnsChannel({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/apns',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetApnsChannelResponse(
      aPNSChannelResponse: APNSChannelResponse.fromJson($json),
    );
  }

  /// Retrieves information about the status and settings of the APNs sandbox
  /// channel for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<GetApnsSandboxChannelResponse> getApnsSandboxChannel({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/apns_sandbox',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetApnsSandboxChannelResponse(
      aPNSSandboxChannelResponse: APNSSandboxChannelResponse.fromJson($json),
    );
  }

  /// Retrieves information about the status and settings of the APNs VoIP
  /// channel for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<GetApnsVoipChannelResponse> getApnsVoipChannel({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/apns_voip',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetApnsVoipChannelResponse(
      aPNSVoipChannelResponse: APNSVoipChannelResponse.fromJson($json),
    );
  }

  /// Retrieves information about the status and settings of the APNs VoIP
  /// sandbox channel for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<GetApnsVoipSandboxChannelResponse> getApnsVoipSandboxChannel({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/apns_voip_sandbox',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetApnsVoipSandboxChannelResponse(
      aPNSVoipSandboxChannelResponse:
          APNSVoipSandboxChannelResponse.fromJson($json),
    );
  }

  /// Retrieves information about an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<GetAppResponse> getApp({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetAppResponse(
      applicationResponse: ApplicationResponse.fromJson($json),
    );
  }

  /// Retrieves (queries) pre-aggregated data for a standard metric that applies
  /// to an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [kpiName] :
  /// The name of the metric, also referred to as a <i>key performance indicator
  /// (KPI)</i>, to retrieve data for. This value describes the associated
  /// metric and consists of two or more terms, which are comprised of lowercase
  /// alphanumeric characters, separated by a hyphen. Examples are
  /// email-open-rate and successful-delivery-rate. For a list of valid values,
  /// see the <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/analytics-standard-metrics.html">Amazon
  /// Pinpoint Developer Guide</a>.
  ///
  /// Parameter [endTime] :
  /// The last date and time to retrieve data for, as part of an inclusive date
  /// range that filters the query results. This value should be in extended ISO
  /// 8601 format and use Coordinated Universal Time (UTC), for example:
  /// 2019-07-26T20:00:00Z for 8:00 PM UTC July 26, 2019.
  ///
  /// Parameter [nextToken] :
  /// The  string that specifies which page of results to return in a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [startTime] :
  /// The first date and time to retrieve data for, as part of an inclusive date
  /// range that filters the query results. This value should be in extended ISO
  /// 8601 format and use Coordinated Universal Time (UTC), for example:
  /// 2019-07-19T20:00:00Z for 8:00 PM UTC July 19, 2019. This value should also
  /// be fewer than 90 days from the current day.
  Future<GetApplicationDateRangeKpiResponse> getApplicationDateRangeKpi({
    required String applicationId,
    required String kpiName,
    DateTime? endTime,
    String? nextToken,
    String? pageSize,
    DateTime? startTime,
  }) async {
    final $query = <String, List<String>>{
      if (endTime != null) 'end-time': [_s.iso8601ToJson(endTime).toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (pageSize != null) 'page-size': [pageSize],
      if (startTime != null)
        'start-time': [_s.iso8601ToJson(startTime).toString()],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/kpis/daterange/${Uri.encodeComponent(kpiName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetApplicationDateRangeKpiResponse(
      applicationDateRangeKpiResponse:
          ApplicationDateRangeKpiResponse.fromJson($json),
    );
  }

  /// Retrieves information about the settings for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<GetApplicationSettingsResponse> getApplicationSettings({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/settings',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetApplicationSettingsResponse(
      applicationSettingsResource: ApplicationSettingsResource.fromJson($json),
    );
  }

  /// Retrieves information about all the applications that are associated with
  /// your Amazon Pinpoint account.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [token] :
  /// The NextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<GetAppsResponse> getApps({
    String? pageSize,
    String? token,
  }) async {
    final $query = <String, List<String>>{
      if (pageSize != null) 'page-size': [pageSize],
      if (token != null) 'token': [token],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apps',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetAppsResponse(
      applicationsResponse: ApplicationsResponse.fromJson($json),
    );
  }

  /// Retrieves information about the status and settings of the Baidu channel
  /// for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<GetBaiduChannelResponse> getBaiduChannel({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/baidu',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetBaiduChannelResponse(
      baiduChannelResponse: BaiduChannelResponse.fromJson($json),
    );
  }

  /// Retrieves information about the status, configuration, and other settings
  /// for a campaign.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [campaignId] :
  /// The unique identifier for the campaign.
  Future<GetCampaignResponse> getCampaign({
    required String applicationId,
    required String campaignId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/campaigns/${Uri.encodeComponent(campaignId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetCampaignResponse(
      campaignResponse: CampaignResponse.fromJson($json),
    );
  }

  /// Retrieves information about all the activities for a campaign.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [campaignId] :
  /// The unique identifier for the campaign.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [token] :
  /// The NextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<GetCampaignActivitiesResponse> getCampaignActivities({
    required String applicationId,
    required String campaignId,
    String? pageSize,
    String? token,
  }) async {
    final $query = <String, List<String>>{
      if (pageSize != null) 'page-size': [pageSize],
      if (token != null) 'token': [token],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/campaigns/${Uri.encodeComponent(campaignId)}/activities',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetCampaignActivitiesResponse(
      activitiesResponse: ActivitiesResponse.fromJson($json),
    );
  }

  /// Retrieves (queries) pre-aggregated data for a standard metric that applies
  /// to a campaign.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [campaignId] :
  /// The unique identifier for the campaign.
  ///
  /// Parameter [kpiName] :
  /// The name of the metric, also referred to as a <i>key performance indicator
  /// (KPI)</i>, to retrieve data for. This value describes the associated
  /// metric and consists of two or more terms, which are comprised of lowercase
  /// alphanumeric characters, separated by a hyphen. Examples are
  /// email-open-rate and successful-delivery-rate. For a list of valid values,
  /// see the <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/analytics-standard-metrics.html">Amazon
  /// Pinpoint Developer Guide</a>.
  ///
  /// Parameter [endTime] :
  /// The last date and time to retrieve data for, as part of an inclusive date
  /// range that filters the query results. This value should be in extended ISO
  /// 8601 format and use Coordinated Universal Time (UTC), for example:
  /// 2019-07-26T20:00:00Z for 8:00 PM UTC July 26, 2019.
  ///
  /// Parameter [nextToken] :
  /// The  string that specifies which page of results to return in a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [startTime] :
  /// The first date and time to retrieve data for, as part of an inclusive date
  /// range that filters the query results. This value should be in extended ISO
  /// 8601 format and use Coordinated Universal Time (UTC), for example:
  /// 2019-07-19T20:00:00Z for 8:00 PM UTC July 19, 2019. This value should also
  /// be fewer than 90 days from the current day.
  Future<GetCampaignDateRangeKpiResponse> getCampaignDateRangeKpi({
    required String applicationId,
    required String campaignId,
    required String kpiName,
    DateTime? endTime,
    String? nextToken,
    String? pageSize,
    DateTime? startTime,
  }) async {
    final $query = <String, List<String>>{
      if (endTime != null) 'end-time': [_s.iso8601ToJson(endTime).toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (pageSize != null) 'page-size': [pageSize],
      if (startTime != null)
        'start-time': [_s.iso8601ToJson(startTime).toString()],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/campaigns/${Uri.encodeComponent(campaignId)}/kpis/daterange/${Uri.encodeComponent(kpiName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetCampaignDateRangeKpiResponse(
      campaignDateRangeKpiResponse:
          CampaignDateRangeKpiResponse.fromJson($json),
    );
  }

  /// Retrieves information about the status, configuration, and other settings
  /// for a specific version of a campaign.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [campaignId] :
  /// The unique identifier for the campaign.
  ///
  /// Parameter [version] :
  /// The unique version number (Version property) for the campaign version.
  Future<GetCampaignVersionResponse> getCampaignVersion({
    required String applicationId,
    required String campaignId,
    required String version,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/campaigns/${Uri.encodeComponent(campaignId)}/versions/${Uri.encodeComponent(version)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetCampaignVersionResponse(
      campaignResponse: CampaignResponse.fromJson($json),
    );
  }

  /// Retrieves information about the status, configuration, and other settings
  /// for all versions of a campaign.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [campaignId] :
  /// The unique identifier for the campaign.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [token] :
  /// The NextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<GetCampaignVersionsResponse> getCampaignVersions({
    required String applicationId,
    required String campaignId,
    String? pageSize,
    String? token,
  }) async {
    final $query = <String, List<String>>{
      if (pageSize != null) 'page-size': [pageSize],
      if (token != null) 'token': [token],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/campaigns/${Uri.encodeComponent(campaignId)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetCampaignVersionsResponse(
      campaignsResponse: CampaignsResponse.fromJson($json),
    );
  }

  /// Retrieves information about the status, configuration, and other settings
  /// for all the campaigns that are associated with an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [token] :
  /// The NextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<GetCampaignsResponse> getCampaigns({
    required String applicationId,
    String? pageSize,
    String? token,
  }) async {
    final $query = <String, List<String>>{
      if (pageSize != null) 'page-size': [pageSize],
      if (token != null) 'token': [token],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/campaigns',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetCampaignsResponse(
      campaignsResponse: CampaignsResponse.fromJson($json),
    );
  }

  /// Retrieves information about the history and status of each channel for an
  /// application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<GetChannelsResponse> getChannels({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/channels',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetChannelsResponse(
      channelsResponse: ChannelsResponse.fromJson($json),
    );
  }

  /// Retrieves information about the status and settings of the email channel
  /// for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<GetEmailChannelResponse> getEmailChannel({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/email',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetEmailChannelResponse(
      emailChannelResponse: EmailChannelResponse.fromJson($json),
    );
  }

  /// Retrieves the content and settings of a message template for messages that
  /// are sent through the email channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  ///
  /// Parameter [version] :
  /// The unique identifier for the version of the message template to update,
  /// retrieve information about, or delete. To retrieve identifiers and other
  /// information for all the versions of a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  ///
  /// If specified, this value must match the identifier for an existing
  /// template version. If specified for an update operation, this value must
  /// match the identifier for the latest existing version of the template. This
  /// restriction helps ensure that race conditions don't occur.
  ///
  /// If you don't specify a value for this parameter, Amazon Pinpoint does the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// For a get operation, retrieves information about the active version of the
  /// template.
  /// </li>
  /// <li>
  /// For an update operation, saves the updates to (overwrites) the latest
  /// existing version of the template, if the create-new-version parameter
  /// isn't used or is set to false.
  /// </li>
  /// <li>
  /// For a delete operation, deletes the template, including all versions of
  /// the template.
  /// </li>
  /// </ul>
  Future<GetEmailTemplateResponse> getEmailTemplate({
    required String templateName,
    String? version,
  }) async {
    final $query = <String, List<String>>{
      if (version != null) 'version': [version],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/templates/${Uri.encodeComponent(templateName)}/email',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetEmailTemplateResponse(
      emailTemplateResponse: EmailTemplateResponse.fromJson($json),
    );
  }

  /// Retrieves information about the settings and attributes of a specific
  /// endpoint for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [endpointId] :
  /// The case insensitive unique identifier for the endpoint. The identifier
  /// can't contain <code>$</code>, <code>{</code> or <code>}</code>.
  Future<GetEndpointResponse> getEndpoint({
    required String applicationId,
    required String endpointId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/endpoints/${Uri.encodeComponent(endpointId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetEndpointResponse(
      endpointResponse: EndpointResponse.fromJson($json),
    );
  }

  /// Retrieves information about the event stream settings for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<GetEventStreamResponse> getEventStream({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/eventstream',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetEventStreamResponse(
      eventStream: EventStream.fromJson($json),
    );
  }

  /// Retrieves information about the status and settings of a specific export
  /// job for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [jobId] :
  /// The unique identifier for the job.
  Future<GetExportJobResponse> getExportJob({
    required String applicationId,
    required String jobId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/jobs/export/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetExportJobResponse(
      exportJobResponse: ExportJobResponse.fromJson($json),
    );
  }

  /// Retrieves information about the status and settings of all the export jobs
  /// for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [token] :
  /// The NextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<GetExportJobsResponse> getExportJobs({
    required String applicationId,
    String? pageSize,
    String? token,
  }) async {
    final $query = <String, List<String>>{
      if (pageSize != null) 'page-size': [pageSize],
      if (token != null) 'token': [token],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/jobs/export',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetExportJobsResponse(
      exportJobsResponse: ExportJobsResponse.fromJson($json),
    );
  }

  /// Retrieves information about the status and settings of the GCM channel for
  /// an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<GetGcmChannelResponse> getGcmChannel({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/gcm',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetGcmChannelResponse(
      gCMChannelResponse: GCMChannelResponse.fromJson($json),
    );
  }

  /// Retrieves information about the status and settings of a specific import
  /// job for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [jobId] :
  /// The unique identifier for the job.
  Future<GetImportJobResponse> getImportJob({
    required String applicationId,
    required String jobId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/jobs/import/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetImportJobResponse(
      importJobResponse: ImportJobResponse.fromJson($json),
    );
  }

  /// Retrieves information about the status and settings of all the import jobs
  /// for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [token] :
  /// The NextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<GetImportJobsResponse> getImportJobs({
    required String applicationId,
    String? pageSize,
    String? token,
  }) async {
    final $query = <String, List<String>>{
      if (pageSize != null) 'page-size': [pageSize],
      if (token != null) 'token': [token],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/jobs/import',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetImportJobsResponse(
      importJobsResponse: ImportJobsResponse.fromJson($json),
    );
  }

  /// Retrieves the in-app messages targeted for the provided endpoint ID.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [endpointId] :
  /// The unique identifier for the endpoint.
  Future<GetInAppMessagesResponse> getInAppMessages({
    required String applicationId,
    required String endpointId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/endpoints/${Uri.encodeComponent(endpointId)}/inappmessages',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetInAppMessagesResponse(
      inAppMessagesResponse: InAppMessagesResponse.fromJson($json),
    );
  }

  /// Retrieves the content and settings of a message template for messages sent
  /// through the in-app channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  ///
  /// Parameter [version] :
  /// The unique identifier for the version of the message template to update,
  /// retrieve information about, or delete. To retrieve identifiers and other
  /// information for all the versions of a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  ///
  /// If specified, this value must match the identifier for an existing
  /// template version. If specified for an update operation, this value must
  /// match the identifier for the latest existing version of the template. This
  /// restriction helps ensure that race conditions don't occur.
  ///
  /// If you don't specify a value for this parameter, Amazon Pinpoint does the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// For a get operation, retrieves information about the active version of the
  /// template.
  /// </li>
  /// <li>
  /// For an update operation, saves the updates to (overwrites) the latest
  /// existing version of the template, if the create-new-version parameter
  /// isn't used or is set to false.
  /// </li>
  /// <li>
  /// For a delete operation, deletes the template, including all versions of
  /// the template.
  /// </li>
  /// </ul>
  Future<GetInAppTemplateResponse> getInAppTemplate({
    required String templateName,
    String? version,
  }) async {
    final $query = <String, List<String>>{
      if (version != null) 'version': [version],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/templates/${Uri.encodeComponent(templateName)}/inapp',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetInAppTemplateResponse(
      inAppTemplateResponse: InAppTemplateResponse.fromJson($json),
    );
  }

  /// Retrieves information about the status, configuration, and other settings
  /// for a journey.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [journeyId] :
  /// The unique identifier for the journey.
  Future<GetJourneyResponse> getJourney({
    required String applicationId,
    required String journeyId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/journeys/${Uri.encodeComponent(journeyId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetJourneyResponse(
      journeyResponse: JourneyResponse.fromJson($json),
    );
  }

  /// Retrieves (queries) pre-aggregated data for a standard engagement metric
  /// that applies to a journey.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [journeyId] :
  /// The unique identifier for the journey.
  ///
  /// Parameter [kpiName] :
  /// The name of the metric, also referred to as a <i>key performance indicator
  /// (KPI)</i>, to retrieve data for. This value describes the associated
  /// metric and consists of two or more terms, which are comprised of lowercase
  /// alphanumeric characters, separated by a hyphen. Examples are
  /// email-open-rate and successful-delivery-rate. For a list of valid values,
  /// see the <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/analytics-standard-metrics.html">Amazon
  /// Pinpoint Developer Guide</a>.
  ///
  /// Parameter [endTime] :
  /// The last date and time to retrieve data for, as part of an inclusive date
  /// range that filters the query results. This value should be in extended ISO
  /// 8601 format and use Coordinated Universal Time (UTC), for example:
  /// 2019-07-26T20:00:00Z for 8:00 PM UTC July 26, 2019.
  ///
  /// Parameter [nextToken] :
  /// The  string that specifies which page of results to return in a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [startTime] :
  /// The first date and time to retrieve data for, as part of an inclusive date
  /// range that filters the query results. This value should be in extended ISO
  /// 8601 format and use Coordinated Universal Time (UTC), for example:
  /// 2019-07-19T20:00:00Z for 8:00 PM UTC July 19, 2019. This value should also
  /// be fewer than 90 days from the current day.
  Future<GetJourneyDateRangeKpiResponse> getJourneyDateRangeKpi({
    required String applicationId,
    required String journeyId,
    required String kpiName,
    DateTime? endTime,
    String? nextToken,
    String? pageSize,
    DateTime? startTime,
  }) async {
    final $query = <String, List<String>>{
      if (endTime != null) 'end-time': [_s.iso8601ToJson(endTime).toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (pageSize != null) 'page-size': [pageSize],
      if (startTime != null)
        'start-time': [_s.iso8601ToJson(startTime).toString()],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/journeys/${Uri.encodeComponent(journeyId)}/kpis/daterange/${Uri.encodeComponent(kpiName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetJourneyDateRangeKpiResponse(
      journeyDateRangeKpiResponse: JourneyDateRangeKpiResponse.fromJson($json),
    );
  }

  /// Retrieves (queries) pre-aggregated data for a standard execution metric
  /// that applies to a journey activity.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [journeyActivityId] :
  /// The unique identifier for the journey activity.
  ///
  /// Parameter [journeyId] :
  /// The unique identifier for the journey.
  ///
  /// Parameter [nextToken] :
  /// The <code/> string that specifies which page of results to return in a
  /// paginated response. This parameter is not supported for application,
  /// campaign, and journey metrics.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  Future<GetJourneyExecutionActivityMetricsResponse>
      getJourneyExecutionActivityMetrics({
    required String applicationId,
    required String journeyActivityId,
    required String journeyId,
    String? nextToken,
    String? pageSize,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'next-token': [nextToken],
      if (pageSize != null) 'page-size': [pageSize],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/journeys/${Uri.encodeComponent(journeyId)}/activities/${Uri.encodeComponent(journeyActivityId)}/execution-metrics',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetJourneyExecutionActivityMetricsResponse(
      journeyExecutionActivityMetricsResponse:
          JourneyExecutionActivityMetricsResponse.fromJson($json),
    );
  }

  /// Retrieves (queries) pre-aggregated data for a standard execution metric
  /// that applies to a journey.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [journeyId] :
  /// The unique identifier for the journey.
  ///
  /// Parameter [nextToken] :
  /// The <code/> string that specifies which page of results to return in a
  /// paginated response. This parameter is not supported for application,
  /// campaign, and journey metrics.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  Future<GetJourneyExecutionMetricsResponse> getJourneyExecutionMetrics({
    required String applicationId,
    required String journeyId,
    String? nextToken,
    String? pageSize,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'next-token': [nextToken],
      if (pageSize != null) 'page-size': [pageSize],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/journeys/${Uri.encodeComponent(journeyId)}/execution-metrics',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetJourneyExecutionMetricsResponse(
      journeyExecutionMetricsResponse:
          JourneyExecutionMetricsResponse.fromJson($json),
    );
  }

  /// Retrieves (queries) pre-aggregated data for a standard run execution
  /// metric that applies to a journey activity.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [journeyActivityId] :
  /// The unique identifier for the journey activity.
  ///
  /// Parameter [journeyId] :
  /// The unique identifier for the journey.
  ///
  /// Parameter [runId] :
  /// The unique identifier for the journey run.
  ///
  /// Parameter [nextToken] :
  /// The <code/> string that specifies which page of results to return in a
  /// paginated response. This parameter is not supported for application,
  /// campaign, and journey metrics.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  Future<GetJourneyRunExecutionActivityMetricsResponse>
      getJourneyRunExecutionActivityMetrics({
    required String applicationId,
    required String journeyActivityId,
    required String journeyId,
    required String runId,
    String? nextToken,
    String? pageSize,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'next-token': [nextToken],
      if (pageSize != null) 'page-size': [pageSize],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/journeys/${Uri.encodeComponent(journeyId)}/runs/${Uri.encodeComponent(runId)}/activities/${Uri.encodeComponent(journeyActivityId)}/execution-metrics',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetJourneyRunExecutionActivityMetricsResponse(
      journeyRunExecutionActivityMetricsResponse:
          JourneyRunExecutionActivityMetricsResponse.fromJson($json),
    );
  }

  /// Retrieves (queries) pre-aggregated data for a standard run execution
  /// metric that applies to a journey.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [journeyId] :
  /// The unique identifier for the journey.
  ///
  /// Parameter [runId] :
  /// The unique identifier for the journey run.
  ///
  /// Parameter [nextToken] :
  /// The <code/> string that specifies which page of results to return in a
  /// paginated response. This parameter is not supported for application,
  /// campaign, and journey metrics.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  Future<GetJourneyRunExecutionMetricsResponse> getJourneyRunExecutionMetrics({
    required String applicationId,
    required String journeyId,
    required String runId,
    String? nextToken,
    String? pageSize,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'next-token': [nextToken],
      if (pageSize != null) 'page-size': [pageSize],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/journeys/${Uri.encodeComponent(journeyId)}/runs/${Uri.encodeComponent(runId)}/execution-metrics',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetJourneyRunExecutionMetricsResponse(
      journeyRunExecutionMetricsResponse:
          JourneyRunExecutionMetricsResponse.fromJson($json),
    );
  }

  /// Provides information about the runs of a journey.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [journeyId] :
  /// The unique identifier for the journey.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [token] :
  /// The NextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<GetJourneyRunsResponse> getJourneyRuns({
    required String applicationId,
    required String journeyId,
    String? pageSize,
    String? token,
  }) async {
    final $query = <String, List<String>>{
      if (pageSize != null) 'page-size': [pageSize],
      if (token != null) 'token': [token],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/journeys/${Uri.encodeComponent(journeyId)}/runs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetJourneyRunsResponse(
      journeyRunsResponse: JourneyRunsResponse.fromJson($json),
    );
  }

  /// Retrieves the content and settings of a message template for messages that
  /// are sent through a push notification channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  ///
  /// Parameter [version] :
  /// The unique identifier for the version of the message template to update,
  /// retrieve information about, or delete. To retrieve identifiers and other
  /// information for all the versions of a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  ///
  /// If specified, this value must match the identifier for an existing
  /// template version. If specified for an update operation, this value must
  /// match the identifier for the latest existing version of the template. This
  /// restriction helps ensure that race conditions don't occur.
  ///
  /// If you don't specify a value for this parameter, Amazon Pinpoint does the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// For a get operation, retrieves information about the active version of the
  /// template.
  /// </li>
  /// <li>
  /// For an update operation, saves the updates to (overwrites) the latest
  /// existing version of the template, if the create-new-version parameter
  /// isn't used or is set to false.
  /// </li>
  /// <li>
  /// For a delete operation, deletes the template, including all versions of
  /// the template.
  /// </li>
  /// </ul>
  Future<GetPushTemplateResponse> getPushTemplate({
    required String templateName,
    String? version,
  }) async {
    final $query = <String, List<String>>{
      if (version != null) 'version': [version],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/templates/${Uri.encodeComponent(templateName)}/push',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetPushTemplateResponse(
      pushNotificationTemplateResponse:
          PushNotificationTemplateResponse.fromJson($json),
    );
  }

  /// Retrieves information about an Amazon Pinpoint configuration for a
  /// recommender model.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [recommenderId] :
  /// The unique identifier for the recommender model configuration. This
  /// identifier is displayed as the <b>Recommender ID</b> on the Amazon
  /// Pinpoint console.
  Future<GetRecommenderConfigurationResponse> getRecommenderConfiguration({
    required String recommenderId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/recommenders/${Uri.encodeComponent(recommenderId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetRecommenderConfigurationResponse(
      recommenderConfigurationResponse:
          RecommenderConfigurationResponse.fromJson($json),
    );
  }

  /// Retrieves information about all the recommender model configurations that
  /// are associated with your Amazon Pinpoint account.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [token] :
  /// The NextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<GetRecommenderConfigurationsResponse> getRecommenderConfigurations({
    String? pageSize,
    String? token,
  }) async {
    final $query = <String, List<String>>{
      if (pageSize != null) 'page-size': [pageSize],
      if (token != null) 'token': [token],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/recommenders',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetRecommenderConfigurationsResponse(
      listRecommenderConfigurationsResponse:
          ListRecommenderConfigurationsResponse.fromJson($json),
    );
  }

  /// Retrieves information about the configuration, dimension, and other
  /// settings for a specific segment that's associated with an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [segmentId] :
  /// The unique identifier for the segment.
  Future<GetSegmentResponse> getSegment({
    required String applicationId,
    required String segmentId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/segments/${Uri.encodeComponent(segmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetSegmentResponse(
      segmentResponse: SegmentResponse.fromJson($json),
    );
  }

  /// Retrieves information about the status and settings of the export jobs for
  /// a segment.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [segmentId] :
  /// The unique identifier for the segment.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [token] :
  /// The NextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<GetSegmentExportJobsResponse> getSegmentExportJobs({
    required String applicationId,
    required String segmentId,
    String? pageSize,
    String? token,
  }) async {
    final $query = <String, List<String>>{
      if (pageSize != null) 'page-size': [pageSize],
      if (token != null) 'token': [token],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/segments/${Uri.encodeComponent(segmentId)}/jobs/export',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetSegmentExportJobsResponse(
      exportJobsResponse: ExportJobsResponse.fromJson($json),
    );
  }

  /// Retrieves information about the status and settings of the import jobs for
  /// a segment.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [segmentId] :
  /// The unique identifier for the segment.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [token] :
  /// The NextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<GetSegmentImportJobsResponse> getSegmentImportJobs({
    required String applicationId,
    required String segmentId,
    String? pageSize,
    String? token,
  }) async {
    final $query = <String, List<String>>{
      if (pageSize != null) 'page-size': [pageSize],
      if (token != null) 'token': [token],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/segments/${Uri.encodeComponent(segmentId)}/jobs/import',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetSegmentImportJobsResponse(
      importJobsResponse: ImportJobsResponse.fromJson($json),
    );
  }

  /// Retrieves information about the configuration, dimension, and other
  /// settings for a specific version of a segment that's associated with an
  /// application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [segmentId] :
  /// The unique identifier for the segment.
  ///
  /// Parameter [version] :
  /// The unique version number (Version property) for the campaign version.
  Future<GetSegmentVersionResponse> getSegmentVersion({
    required String applicationId,
    required String segmentId,
    required String version,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/segments/${Uri.encodeComponent(segmentId)}/versions/${Uri.encodeComponent(version)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetSegmentVersionResponse(
      segmentResponse: SegmentResponse.fromJson($json),
    );
  }

  /// Retrieves information about the configuration, dimension, and other
  /// settings for all the versions of a specific segment that's associated with
  /// an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [segmentId] :
  /// The unique identifier for the segment.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [token] :
  /// The NextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<GetSegmentVersionsResponse> getSegmentVersions({
    required String applicationId,
    required String segmentId,
    String? pageSize,
    String? token,
  }) async {
    final $query = <String, List<String>>{
      if (pageSize != null) 'page-size': [pageSize],
      if (token != null) 'token': [token],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/segments/${Uri.encodeComponent(segmentId)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetSegmentVersionsResponse(
      segmentsResponse: SegmentsResponse.fromJson($json),
    );
  }

  /// Retrieves information about the configuration, dimension, and other
  /// settings for all the segments that are associated with an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [token] :
  /// The NextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<GetSegmentsResponse> getSegments({
    required String applicationId,
    String? pageSize,
    String? token,
  }) async {
    final $query = <String, List<String>>{
      if (pageSize != null) 'page-size': [pageSize],
      if (token != null) 'token': [token],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/segments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetSegmentsResponse(
      segmentsResponse: SegmentsResponse.fromJson($json),
    );
  }

  /// Retrieves information about the status and settings of the SMS channel for
  /// an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<GetSmsChannelResponse> getSmsChannel({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/sms',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetSmsChannelResponse(
      sMSChannelResponse: SMSChannelResponse.fromJson($json),
    );
  }

  /// Retrieves the content and settings of a message template for messages that
  /// are sent through the SMS channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  ///
  /// Parameter [version] :
  /// The unique identifier for the version of the message template to update,
  /// retrieve information about, or delete. To retrieve identifiers and other
  /// information for all the versions of a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  ///
  /// If specified, this value must match the identifier for an existing
  /// template version. If specified for an update operation, this value must
  /// match the identifier for the latest existing version of the template. This
  /// restriction helps ensure that race conditions don't occur.
  ///
  /// If you don't specify a value for this parameter, Amazon Pinpoint does the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// For a get operation, retrieves information about the active version of the
  /// template.
  /// </li>
  /// <li>
  /// For an update operation, saves the updates to (overwrites) the latest
  /// existing version of the template, if the create-new-version parameter
  /// isn't used or is set to false.
  /// </li>
  /// <li>
  /// For a delete operation, deletes the template, including all versions of
  /// the template.
  /// </li>
  /// </ul>
  Future<GetSmsTemplateResponse> getSmsTemplate({
    required String templateName,
    String? version,
  }) async {
    final $query = <String, List<String>>{
      if (version != null) 'version': [version],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/templates/${Uri.encodeComponent(templateName)}/sms',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetSmsTemplateResponse(
      sMSTemplateResponse: SMSTemplateResponse.fromJson($json),
    );
  }

  /// Retrieves information about all the endpoints that are associated with a
  /// specific user ID.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [userId] :
  /// The unique identifier for the user.
  Future<GetUserEndpointsResponse> getUserEndpoints({
    required String applicationId,
    required String userId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/users/${Uri.encodeComponent(userId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetUserEndpointsResponse(
      endpointsResponse: EndpointsResponse.fromJson($json),
    );
  }

  /// Retrieves information about the status and settings of the voice channel
  /// for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<GetVoiceChannelResponse> getVoiceChannel({
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/voice',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetVoiceChannelResponse(
      voiceChannelResponse: VoiceChannelResponse.fromJson($json),
    );
  }

  /// Retrieves the content and settings of a message template for messages that
  /// are sent through the voice channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  ///
  /// Parameter [version] :
  /// The unique identifier for the version of the message template to update,
  /// retrieve information about, or delete. To retrieve identifiers and other
  /// information for all the versions of a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  ///
  /// If specified, this value must match the identifier for an existing
  /// template version. If specified for an update operation, this value must
  /// match the identifier for the latest existing version of the template. This
  /// restriction helps ensure that race conditions don't occur.
  ///
  /// If you don't specify a value for this parameter, Amazon Pinpoint does the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// For a get operation, retrieves information about the active version of the
  /// template.
  /// </li>
  /// <li>
  /// For an update operation, saves the updates to (overwrites) the latest
  /// existing version of the template, if the create-new-version parameter
  /// isn't used or is set to false.
  /// </li>
  /// <li>
  /// For a delete operation, deletes the template, including all versions of
  /// the template.
  /// </li>
  /// </ul>
  Future<GetVoiceTemplateResponse> getVoiceTemplate({
    required String templateName,
    String? version,
  }) async {
    final $query = <String, List<String>>{
      if (version != null) 'version': [version],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/templates/${Uri.encodeComponent(templateName)}/voice',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetVoiceTemplateResponse(
      voiceTemplateResponse: VoiceTemplateResponse.fromJson($json),
    );
  }

  /// Retrieves information about the status, configuration, and other settings
  /// for all the journeys that are associated with an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [token] :
  /// The NextToken string that specifies which page of results to return in a
  /// paginated response.
  Future<ListJourneysResponse> listJourneys({
    required String applicationId,
    String? pageSize,
    String? token,
  }) async {
    final $query = <String, List<String>>{
      if (pageSize != null) 'page-size': [pageSize],
      if (token != null) 'token': [token],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/journeys',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return ListJourneysResponse(
      journeysResponse: JourneysResponse.fromJson($json),
    );
  }

  /// Retrieves all the tags (keys and values) that are associated with an
  /// application, campaign, message template, or segment.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return ListTagsForResourceResponse(
      tagsModel: TagsModel.fromJson($json),
    );
  }

  /// Retrieves information about all the versions of a specific message
  /// template.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  ///
  /// Parameter [templateType] :
  /// The type of channel that the message template is designed for. Valid
  /// values are: EMAIL, PUSH, SMS, and VOICE.
  ///
  /// Parameter [nextToken] :
  /// The  string that specifies which page of results to return in a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  Future<ListTemplateVersionsResponse> listTemplateVersions({
    required String templateName,
    required String templateType,
    String? nextToken,
    String? pageSize,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'next-token': [nextToken],
      if (pageSize != null) 'page-size': [pageSize],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/templates/${Uri.encodeComponent(templateName)}/${Uri.encodeComponent(templateType)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return ListTemplateVersionsResponse(
      templateVersionsResponse: TemplateVersionsResponse.fromJson($json),
    );
  }

  /// Retrieves information about all the message templates that are associated
  /// with your Amazon Pinpoint account.
  ///
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [nextToken] :
  /// The  string that specifies which page of results to return in a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [prefix] :
  /// The substring to match in the names of the message templates to include in
  /// the results. If you specify this value, Amazon Pinpoint returns only those
  /// templates whose names begin with the value that you specify.
  ///
  /// Parameter [templateType] :
  /// The type of message template to include in the results. Valid values are:
  /// EMAIL, PUSH, SMS, and VOICE. To include all types of templates in the
  /// results, don't include this parameter in your request.
  Future<ListTemplatesResponse> listTemplates({
    String? nextToken,
    String? pageSize,
    String? prefix,
    String? templateType,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'next-token': [nextToken],
      if (pageSize != null) 'page-size': [pageSize],
      if (prefix != null) 'prefix': [prefix],
      if (templateType != null) 'template-type': [templateType],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/v1/templates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return ListTemplatesResponse(
      templatesResponse: TemplatesResponse.fromJson($json),
    );
  }

  /// Retrieves information about a phone number.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  Future<PhoneNumberValidateResponse> phoneNumberValidate({
    required NumberValidateRequest numberValidateRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: numberValidateRequest,
      method: 'POST',
      requestUri: '/v1/phone/number/validate',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return PhoneNumberValidateResponse(
      numberValidateResponse: NumberValidateResponse.fromJson($json),
    );
  }

  /// Creates a new event stream for an application or updates the settings of
  /// an existing event stream for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<PutEventStreamResponse> putEventStream({
    required String applicationId,
    required WriteEventStream writeEventStream,
  }) async {
    final response = await _protocol.sendRaw(
      payload: writeEventStream,
      method: 'POST',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/eventstream',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return PutEventStreamResponse(
      eventStream: EventStream.fromJson($json),
    );
  }

  /// Creates a new event to record for endpoints, or creates or updates
  /// endpoint data that existing events are associated with.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<PutEventsResponse> putEvents({
    required String applicationId,
    required EventsRequest eventsRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: eventsRequest,
      method: 'POST',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/events',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return PutEventsResponse(
      eventsResponse: EventsResponse.fromJson($json),
    );
  }

  /// Removes one or more custom attributes, of the same attribute type, from
  /// the application. Existing endpoints still have the attributes but Amazon
  /// Pinpoint will stop capturing new or changed values for these attributes.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [attributeType] :
  /// The type of attribute or attributes to remove. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// endpoint-custom-attributes - Custom attributes that describe endpoints,
  /// such as the date when an associated user opted in or out of receiving
  /// communications from you through a specific type of channel.
  /// </li>
  /// <li>
  /// endpoint-metric-attributes - Custom metrics that your app reports to
  /// Amazon Pinpoint for endpoints, such as the number of app sessions or the
  /// number of items left in a cart.
  /// </li>
  /// <li>
  /// endpoint-user-attributes - Custom attributes that describe users, such as
  /// first name, last name, and age.
  /// </li>
  /// </ul>
  Future<RemoveAttributesResponse> removeAttributes({
    required String applicationId,
    required String attributeType,
    required UpdateAttributesRequest updateAttributesRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: updateAttributesRequest,
      method: 'PUT',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/attributes/${Uri.encodeComponent(attributeType)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return RemoveAttributesResponse(
      attributesResource: AttributesResource.fromJson($json),
    );
  }

  /// Creates and sends a direct message.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<SendMessagesResponse> sendMessages({
    required String applicationId,
    required MessageRequest messageRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: messageRequest,
      method: 'POST',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/messages',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return SendMessagesResponse(
      messageResponse: MessageResponse.fromJson($json),
    );
  }

  /// Send an OTP message
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique ID of your Amazon Pinpoint application.
  Future<SendOTPMessageResponse> sendOTPMessage({
    required String applicationId,
    required SendOTPMessageRequestParameters sendOTPMessageRequestParameters,
  }) async {
    final response = await _protocol.sendRaw(
      payload: sendOTPMessageRequestParameters,
      method: 'POST',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/otp',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return SendOTPMessageResponse(
      messageResponse: MessageResponse.fromJson($json),
    );
  }

  /// Creates and sends a message to a list of users.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<SendUsersMessagesResponse> sendUsersMessages({
    required String applicationId,
    required SendUsersMessageRequest sendUsersMessageRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: sendUsersMessageRequest,
      method: 'POST',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/users-messages',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return SendUsersMessagesResponse(
      sendUsersMessageResponse: SendUsersMessageResponse.fromJson($json),
    );
  }

  /// Adds one or more tags (keys and values) to an application, campaign,
  /// message template, or segment.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<void> tagResource({
    required String resourceArn,
    required TagsModel tagsModel,
  }) async {
    await _protocol.send(
      payload: tagsModel,
      method: 'POST',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags (keys and values) from an application, campaign,
  /// message template, or segment.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The key of the tag to remove from the resource. To remove multiple tags,
  /// append the tagKeys parameter and argument for each additional tag to
  /// remove, separated by an ampersand (&amp;).
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Enables the ADM channel for an application or updates the status and
  /// settings of the ADM channel for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<UpdateAdmChannelResponse> updateAdmChannel({
    required ADMChannelRequest aDMChannelRequest,
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: aDMChannelRequest,
      method: 'PUT',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/adm',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateAdmChannelResponse(
      aDMChannelResponse: ADMChannelResponse.fromJson($json),
    );
  }

  /// Enables the APNs channel for an application or updates the status and
  /// settings of the APNs channel for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<UpdateApnsChannelResponse> updateApnsChannel({
    required APNSChannelRequest aPNSChannelRequest,
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: aPNSChannelRequest,
      method: 'PUT',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/apns',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateApnsChannelResponse(
      aPNSChannelResponse: APNSChannelResponse.fromJson($json),
    );
  }

  /// Enables the APNs sandbox channel for an application or updates the status
  /// and settings of the APNs sandbox channel for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<UpdateApnsSandboxChannelResponse> updateApnsSandboxChannel({
    required APNSSandboxChannelRequest aPNSSandboxChannelRequest,
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: aPNSSandboxChannelRequest,
      method: 'PUT',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/apns_sandbox',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateApnsSandboxChannelResponse(
      aPNSSandboxChannelResponse: APNSSandboxChannelResponse.fromJson($json),
    );
  }

  /// Enables the APNs VoIP channel for an application or updates the status and
  /// settings of the APNs VoIP channel for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<UpdateApnsVoipChannelResponse> updateApnsVoipChannel({
    required APNSVoipChannelRequest aPNSVoipChannelRequest,
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: aPNSVoipChannelRequest,
      method: 'PUT',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/apns_voip',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateApnsVoipChannelResponse(
      aPNSVoipChannelResponse: APNSVoipChannelResponse.fromJson($json),
    );
  }

  /// Enables the APNs VoIP sandbox channel for an application or updates the
  /// status and settings of the APNs VoIP sandbox channel for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<UpdateApnsVoipSandboxChannelResponse> updateApnsVoipSandboxChannel({
    required APNSVoipSandboxChannelRequest aPNSVoipSandboxChannelRequest,
    required String applicationId,
  }) async {
    final response = await _protocol.sendRaw(
      payload: aPNSVoipSandboxChannelRequest,
      method: 'PUT',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/apns_voip_sandbox',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateApnsVoipSandboxChannelResponse(
      aPNSVoipSandboxChannelResponse:
          APNSVoipSandboxChannelResponse.fromJson($json),
    );
  }

  /// Updates the settings for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<UpdateApplicationSettingsResponse> updateApplicationSettings({
    required String applicationId,
    required WriteApplicationSettingsRequest writeApplicationSettingsRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: writeApplicationSettingsRequest,
      method: 'PUT',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/settings',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateApplicationSettingsResponse(
      applicationSettingsResource: ApplicationSettingsResource.fromJson($json),
    );
  }

  /// Enables the Baidu channel for an application or updates the status and
  /// settings of the Baidu channel for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<UpdateBaiduChannelResponse> updateBaiduChannel({
    required String applicationId,
    required BaiduChannelRequest baiduChannelRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: baiduChannelRequest,
      method: 'PUT',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/baidu',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateBaiduChannelResponse(
      baiduChannelResponse: BaiduChannelResponse.fromJson($json),
    );
  }

  /// Updates the configuration and other settings for a campaign.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [campaignId] :
  /// The unique identifier for the campaign.
  Future<UpdateCampaignResponse> updateCampaign({
    required String applicationId,
    required String campaignId,
    required WriteCampaignRequest writeCampaignRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: writeCampaignRequest,
      method: 'PUT',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/campaigns/${Uri.encodeComponent(campaignId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateCampaignResponse(
      campaignResponse: CampaignResponse.fromJson($json),
    );
  }

  /// Enables the email channel for an application or updates the status and
  /// settings of the email channel for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<UpdateEmailChannelResponse> updateEmailChannel({
    required String applicationId,
    required EmailChannelRequest emailChannelRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: emailChannelRequest,
      method: 'PUT',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/email',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateEmailChannelResponse(
      emailChannelResponse: EmailChannelResponse.fromJson($json),
    );
  }

  /// Updates an existing message template for messages that are sent through
  /// the email channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  ///
  /// Parameter [createNewVersion] :
  /// Specifies whether to save the updates as a new version of the message
  /// template. Valid values are: true, save the updates as a new version; and,
  /// false, save the updates to (overwrite) the latest existing version of the
  /// template.
  ///
  /// If you don't specify a value for this parameter, Amazon Pinpoint saves the
  /// updates to (overwrites) the latest existing version of the template. If
  /// you specify a value of true for this parameter, don't specify a value for
  /// the version parameter. Otherwise, an error will occur.
  ///
  /// Parameter [version] :
  /// The unique identifier for the version of the message template to update,
  /// retrieve information about, or delete. To retrieve identifiers and other
  /// information for all the versions of a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  ///
  /// If specified, this value must match the identifier for an existing
  /// template version. If specified for an update operation, this value must
  /// match the identifier for the latest existing version of the template. This
  /// restriction helps ensure that race conditions don't occur.
  ///
  /// If you don't specify a value for this parameter, Amazon Pinpoint does the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// For a get operation, retrieves information about the active version of the
  /// template.
  /// </li>
  /// <li>
  /// For an update operation, saves the updates to (overwrites) the latest
  /// existing version of the template, if the create-new-version parameter
  /// isn't used or is set to false.
  /// </li>
  /// <li>
  /// For a delete operation, deletes the template, including all versions of
  /// the template.
  /// </li>
  /// </ul>
  Future<UpdateEmailTemplateResponse> updateEmailTemplate({
    required EmailTemplateRequest emailTemplateRequest,
    required String templateName,
    bool? createNewVersion,
    String? version,
  }) async {
    final $query = <String, List<String>>{
      if (createNewVersion != null)
        'create-new-version': [createNewVersion.toString()],
      if (version != null) 'version': [version],
    };
    final response = await _protocol.sendRaw(
      payload: emailTemplateRequest,
      method: 'PUT',
      requestUri: '/v1/templates/${Uri.encodeComponent(templateName)}/email',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateEmailTemplateResponse(
      messageBody: MessageBody.fromJson($json),
    );
  }

  /// Creates a new endpoint for an application or updates the settings and
  /// attributes of an existing endpoint for an application. You can also use
  /// this operation to define custom attributes for an endpoint. If an update
  /// includes one or more values for a custom attribute, Amazon Pinpoint
  /// replaces (overwrites) any existing values with the new values.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [endpointId] :
  /// The case insensitive unique identifier for the endpoint. The identifier
  /// can't contain <code>$</code>, <code>{</code> or <code>}</code>.
  Future<UpdateEndpointResponse> updateEndpoint({
    required String applicationId,
    required String endpointId,
    required EndpointRequest endpointRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: endpointRequest,
      method: 'PUT',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/endpoints/${Uri.encodeComponent(endpointId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateEndpointResponse(
      messageBody: MessageBody.fromJson($json),
    );
  }

  /// Creates a new batch of endpoints for an application or updates the
  /// settings and attributes of a batch of existing endpoints for an
  /// application. You can also use this operation to define custom attributes
  /// for a batch of endpoints. If an update includes one or more values for a
  /// custom attribute, Amazon Pinpoint replaces (overwrites) any existing
  /// values with the new values.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<UpdateEndpointsBatchResponse> updateEndpointsBatch({
    required String applicationId,
    required EndpointBatchRequest endpointBatchRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: endpointBatchRequest,
      method: 'PUT',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/endpoints',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateEndpointsBatchResponse(
      messageBody: MessageBody.fromJson($json),
    );
  }

  /// Enables the GCM channel for an application or updates the status and
  /// settings of the GCM channel for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<UpdateGcmChannelResponse> updateGcmChannel({
    required String applicationId,
    required GCMChannelRequest gCMChannelRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: gCMChannelRequest,
      method: 'PUT',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/gcm',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateGcmChannelResponse(
      gCMChannelResponse: GCMChannelResponse.fromJson($json),
    );
  }

  /// Updates an existing message template for messages sent through the in-app
  /// message channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  ///
  /// Parameter [createNewVersion] :
  /// Specifies whether to save the updates as a new version of the message
  /// template. Valid values are: true, save the updates as a new version; and,
  /// false, save the updates to (overwrite) the latest existing version of the
  /// template.
  ///
  /// If you don't specify a value for this parameter, Amazon Pinpoint saves the
  /// updates to (overwrites) the latest existing version of the template. If
  /// you specify a value of true for this parameter, don't specify a value for
  /// the version parameter. Otherwise, an error will occur.
  ///
  /// Parameter [version] :
  /// The unique identifier for the version of the message template to update,
  /// retrieve information about, or delete. To retrieve identifiers and other
  /// information for all the versions of a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  ///
  /// If specified, this value must match the identifier for an existing
  /// template version. If specified for an update operation, this value must
  /// match the identifier for the latest existing version of the template. This
  /// restriction helps ensure that race conditions don't occur.
  ///
  /// If you don't specify a value for this parameter, Amazon Pinpoint does the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// For a get operation, retrieves information about the active version of the
  /// template.
  /// </li>
  /// <li>
  /// For an update operation, saves the updates to (overwrites) the latest
  /// existing version of the template, if the create-new-version parameter
  /// isn't used or is set to false.
  /// </li>
  /// <li>
  /// For a delete operation, deletes the template, including all versions of
  /// the template.
  /// </li>
  /// </ul>
  Future<UpdateInAppTemplateResponse> updateInAppTemplate({
    required InAppTemplateRequest inAppTemplateRequest,
    required String templateName,
    bool? createNewVersion,
    String? version,
  }) async {
    final $query = <String, List<String>>{
      if (createNewVersion != null)
        'create-new-version': [createNewVersion.toString()],
      if (version != null) 'version': [version],
    };
    final response = await _protocol.sendRaw(
      payload: inAppTemplateRequest,
      method: 'PUT',
      requestUri: '/v1/templates/${Uri.encodeComponent(templateName)}/inapp',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateInAppTemplateResponse(
      messageBody: MessageBody.fromJson($json),
    );
  }

  /// Updates the configuration and other settings for a journey.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [journeyId] :
  /// The unique identifier for the journey.
  Future<UpdateJourneyResponse> updateJourney({
    required String applicationId,
    required String journeyId,
    required WriteJourneyRequest writeJourneyRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: writeJourneyRequest,
      method: 'PUT',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/journeys/${Uri.encodeComponent(journeyId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateJourneyResponse(
      journeyResponse: JourneyResponse.fromJson($json),
    );
  }

  /// Cancels (stops) an active journey.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [journeyId] :
  /// The unique identifier for the journey.
  Future<UpdateJourneyStateResponse> updateJourneyState({
    required String applicationId,
    required String journeyId,
    required JourneyStateRequest journeyStateRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: journeyStateRequest,
      method: 'PUT',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/journeys/${Uri.encodeComponent(journeyId)}/state',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateJourneyStateResponse(
      journeyResponse: JourneyResponse.fromJson($json),
    );
  }

  /// Updates an existing message template for messages that are sent through a
  /// push notification channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  ///
  /// Parameter [createNewVersion] :
  /// Specifies whether to save the updates as a new version of the message
  /// template. Valid values are: true, save the updates as a new version; and,
  /// false, save the updates to (overwrite) the latest existing version of the
  /// template.
  ///
  /// If you don't specify a value for this parameter, Amazon Pinpoint saves the
  /// updates to (overwrites) the latest existing version of the template. If
  /// you specify a value of true for this parameter, don't specify a value for
  /// the version parameter. Otherwise, an error will occur.
  ///
  /// Parameter [version] :
  /// The unique identifier for the version of the message template to update,
  /// retrieve information about, or delete. To retrieve identifiers and other
  /// information for all the versions of a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  ///
  /// If specified, this value must match the identifier for an existing
  /// template version. If specified for an update operation, this value must
  /// match the identifier for the latest existing version of the template. This
  /// restriction helps ensure that race conditions don't occur.
  ///
  /// If you don't specify a value for this parameter, Amazon Pinpoint does the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// For a get operation, retrieves information about the active version of the
  /// template.
  /// </li>
  /// <li>
  /// For an update operation, saves the updates to (overwrites) the latest
  /// existing version of the template, if the create-new-version parameter
  /// isn't used or is set to false.
  /// </li>
  /// <li>
  /// For a delete operation, deletes the template, including all versions of
  /// the template.
  /// </li>
  /// </ul>
  Future<UpdatePushTemplateResponse> updatePushTemplate({
    required PushNotificationTemplateRequest pushNotificationTemplateRequest,
    required String templateName,
    bool? createNewVersion,
    String? version,
  }) async {
    final $query = <String, List<String>>{
      if (createNewVersion != null)
        'create-new-version': [createNewVersion.toString()],
      if (version != null) 'version': [version],
    };
    final response = await _protocol.sendRaw(
      payload: pushNotificationTemplateRequest,
      method: 'PUT',
      requestUri: '/v1/templates/${Uri.encodeComponent(templateName)}/push',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdatePushTemplateResponse(
      messageBody: MessageBody.fromJson($json),
    );
  }

  /// Updates an Amazon Pinpoint configuration for a recommender model.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [recommenderId] :
  /// The unique identifier for the recommender model configuration. This
  /// identifier is displayed as the <b>Recommender ID</b> on the Amazon
  /// Pinpoint console.
  Future<UpdateRecommenderConfigurationResponse>
      updateRecommenderConfiguration({
    required String recommenderId,
    required UpdateRecommenderConfiguration updateRecommenderConfiguration,
  }) async {
    final response = await _protocol.sendRaw(
      payload: updateRecommenderConfiguration,
      method: 'PUT',
      requestUri: '/v1/recommenders/${Uri.encodeComponent(recommenderId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateRecommenderConfigurationResponse(
      recommenderConfigurationResponse:
          RecommenderConfigurationResponse.fromJson($json),
    );
  }

  /// Creates a new segment for an application or updates the configuration,
  /// dimension, and other settings for an existing segment that's associated
  /// with an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  ///
  /// Parameter [segmentId] :
  /// The unique identifier for the segment.
  Future<UpdateSegmentResponse> updateSegment({
    required String applicationId,
    required String segmentId,
    required WriteSegmentRequest writeSegmentRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: writeSegmentRequest,
      method: 'PUT',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/segments/${Uri.encodeComponent(segmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateSegmentResponse(
      segmentResponse: SegmentResponse.fromJson($json),
    );
  }

  /// Enables the SMS channel for an application or updates the status and
  /// settings of the SMS channel for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<UpdateSmsChannelResponse> updateSmsChannel({
    required String applicationId,
    required SMSChannelRequest sMSChannelRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: sMSChannelRequest,
      method: 'PUT',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/sms',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateSmsChannelResponse(
      sMSChannelResponse: SMSChannelResponse.fromJson($json),
    );
  }

  /// Updates an existing message template for messages that are sent through
  /// the SMS channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  ///
  /// Parameter [createNewVersion] :
  /// Specifies whether to save the updates as a new version of the message
  /// template. Valid values are: true, save the updates as a new version; and,
  /// false, save the updates to (overwrite) the latest existing version of the
  /// template.
  ///
  /// If you don't specify a value for this parameter, Amazon Pinpoint saves the
  /// updates to (overwrites) the latest existing version of the template. If
  /// you specify a value of true for this parameter, don't specify a value for
  /// the version parameter. Otherwise, an error will occur.
  ///
  /// Parameter [version] :
  /// The unique identifier for the version of the message template to update,
  /// retrieve information about, or delete. To retrieve identifiers and other
  /// information for all the versions of a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  ///
  /// If specified, this value must match the identifier for an existing
  /// template version. If specified for an update operation, this value must
  /// match the identifier for the latest existing version of the template. This
  /// restriction helps ensure that race conditions don't occur.
  ///
  /// If you don't specify a value for this parameter, Amazon Pinpoint does the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// For a get operation, retrieves information about the active version of the
  /// template.
  /// </li>
  /// <li>
  /// For an update operation, saves the updates to (overwrites) the latest
  /// existing version of the template, if the create-new-version parameter
  /// isn't used or is set to false.
  /// </li>
  /// <li>
  /// For a delete operation, deletes the template, including all versions of
  /// the template.
  /// </li>
  /// </ul>
  Future<UpdateSmsTemplateResponse> updateSmsTemplate({
    required SMSTemplateRequest sMSTemplateRequest,
    required String templateName,
    bool? createNewVersion,
    String? version,
  }) async {
    final $query = <String, List<String>>{
      if (createNewVersion != null)
        'create-new-version': [createNewVersion.toString()],
      if (version != null) 'version': [version],
    };
    final response = await _protocol.sendRaw(
      payload: sMSTemplateRequest,
      method: 'PUT',
      requestUri: '/v1/templates/${Uri.encodeComponent(templateName)}/sms',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateSmsTemplateResponse(
      messageBody: MessageBody.fromJson($json),
    );
  }

  /// Changes the status of a specific version of a message template to
  /// <i>active</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  ///
  /// Parameter [templateType] :
  /// The type of channel that the message template is designed for. Valid
  /// values are: EMAIL, PUSH, SMS, and VOICE.
  Future<UpdateTemplateActiveVersionResponse> updateTemplateActiveVersion({
    required TemplateActiveVersionRequest templateActiveVersionRequest,
    required String templateName,
    required String templateType,
  }) async {
    final response = await _protocol.sendRaw(
      payload: templateActiveVersionRequest,
      method: 'PUT',
      requestUri:
          '/v1/templates/${Uri.encodeComponent(templateName)}/${Uri.encodeComponent(templateType)}/active-version',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateTemplateActiveVersionResponse(
      messageBody: MessageBody.fromJson($json),
    );
  }

  /// Enables the voice channel for an application or updates the status and
  /// settings of the voice channel for an application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  Future<UpdateVoiceChannelResponse> updateVoiceChannel({
    required String applicationId,
    required VoiceChannelRequest voiceChannelRequest,
  }) async {
    final response = await _protocol.sendRaw(
      payload: voiceChannelRequest,
      method: 'PUT',
      requestUri:
          '/v1/apps/${Uri.encodeComponent(applicationId)}/channels/voice',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateVoiceChannelResponse(
      voiceChannelResponse: VoiceChannelResponse.fromJson($json),
    );
  }

  /// Updates an existing message template for messages that are sent through
  /// the voice channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [templateName] :
  /// The name of the message template. A template name must start with an
  /// alphanumeric character and can contain a maximum of 128 characters. The
  /// characters can be alphanumeric characters, underscores (_), or hyphens
  /// (-). Template names are case sensitive.
  ///
  /// Parameter [createNewVersion] :
  /// Specifies whether to save the updates as a new version of the message
  /// template. Valid values are: true, save the updates as a new version; and,
  /// false, save the updates to (overwrite) the latest existing version of the
  /// template.
  ///
  /// If you don't specify a value for this parameter, Amazon Pinpoint saves the
  /// updates to (overwrites) the latest existing version of the template. If
  /// you specify a value of true for this parameter, don't specify a value for
  /// the version parameter. Otherwise, an error will occur.
  ///
  /// Parameter [version] :
  /// The unique identifier for the version of the message template to update,
  /// retrieve information about, or delete. To retrieve identifiers and other
  /// information for all the versions of a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  ///
  /// If specified, this value must match the identifier for an existing
  /// template version. If specified for an update operation, this value must
  /// match the identifier for the latest existing version of the template. This
  /// restriction helps ensure that race conditions don't occur.
  ///
  /// If you don't specify a value for this parameter, Amazon Pinpoint does the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// For a get operation, retrieves information about the active version of the
  /// template.
  /// </li>
  /// <li>
  /// For an update operation, saves the updates to (overwrites) the latest
  /// existing version of the template, if the create-new-version parameter
  /// isn't used or is set to false.
  /// </li>
  /// <li>
  /// For a delete operation, deletes the template, including all versions of
  /// the template.
  /// </li>
  /// </ul>
  Future<UpdateVoiceTemplateResponse> updateVoiceTemplate({
    required String templateName,
    required VoiceTemplateRequest voiceTemplateRequest,
    bool? createNewVersion,
    String? version,
  }) async {
    final $query = <String, List<String>>{
      if (createNewVersion != null)
        'create-new-version': [createNewVersion.toString()],
      if (version != null) 'version': [version],
    };
    final response = await _protocol.sendRaw(
      payload: voiceTemplateRequest,
      method: 'PUT',
      requestUri: '/v1/templates/${Uri.encodeComponent(templateName)}/voice',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateVoiceTemplateResponse(
      messageBody: MessageBody.fromJson($json),
    );
  }

  /// Verify an OTP
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [PayloadTooLargeException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [MethodNotAllowedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [applicationId] :
  /// The unique ID of your Amazon Pinpoint application.
  Future<VerifyOTPMessageResponse> verifyOTPMessage({
    required String applicationId,
    required VerifyOTPMessageRequestParameters
        verifyOTPMessageRequestParameters,
  }) async {
    final response = await _protocol.sendRaw(
      payload: verifyOTPMessageRequestParameters,
      method: 'POST',
      requestUri: '/v1/apps/${Uri.encodeComponent(applicationId)}/verify-otp',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return VerifyOTPMessageResponse(
      verificationResponse: VerificationResponse.fromJson($json),
    );
  }
}

/// Specifies the status and settings of the ADM (Amazon Device Messaging)
/// channel for an application.
class ADMChannelRequest {
  /// The Client ID that you received from Amazon to send messages by using ADM.
  final String clientId;

  /// The Client Secret that you received from Amazon to send messages by using
  /// ADM.
  final String clientSecret;

  /// Specifies whether to enable the ADM channel for the application.
  final bool? enabled;

  ADMChannelRequest({
    required this.clientId,
    required this.clientSecret,
    this.enabled,
  });

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final clientSecret = this.clientSecret;
    final enabled = this.enabled;
    return {
      'ClientId': clientId,
      'ClientSecret': clientSecret,
      if (enabled != null) 'Enabled': enabled,
    };
  }
}

/// Provides information about the status and settings of the ADM (Amazon Device
/// Messaging) channel for an application.
class ADMChannelResponse {
  /// The type of messaging or notification platform for the channel. For the ADM
  /// channel, this value is ADM.
  final String platform;

  /// The unique identifier for the application that the ADM channel applies to.
  final String? applicationId;

  /// The date and time when the ADM channel was enabled.
  final String? creationDate;

  /// Specifies whether the ADM channel is enabled for the application.
  final bool? enabled;

  /// (Not used) This property is retained only for backward compatibility.
  final bool? hasCredential;

  /// (Deprecated) An identifier for the ADM channel. This property is retained
  /// only for backward compatibility.
  final String? id;

  /// Specifies whether the ADM channel is archived.
  final bool? isArchived;

  /// The user who last modified the ADM channel.
  final String? lastModifiedBy;

  /// The date and time when the ADM channel was last modified.
  final String? lastModifiedDate;

  /// The current version of the ADM channel.
  final int? version;

  ADMChannelResponse({
    required this.platform,
    this.applicationId,
    this.creationDate,
    this.enabled,
    this.hasCredential,
    this.id,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.version,
  });

  factory ADMChannelResponse.fromJson(Map<String, dynamic> json) {
    return ADMChannelResponse(
      platform: json['Platform'] as String,
      applicationId: json['ApplicationId'] as String?,
      creationDate: json['CreationDate'] as String?,
      enabled: json['Enabled'] as bool?,
      hasCredential: json['HasCredential'] as bool?,
      id: json['Id'] as String?,
      isArchived: json['IsArchived'] as bool?,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: json['LastModifiedDate'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final platform = this.platform;
    final applicationId = this.applicationId;
    final creationDate = this.creationDate;
    final enabled = this.enabled;
    final hasCredential = this.hasCredential;
    final id = this.id;
    final isArchived = this.isArchived;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final version = this.version;
    return {
      'Platform': platform,
      if (applicationId != null) 'ApplicationId': applicationId,
      if (creationDate != null) 'CreationDate': creationDate,
      if (enabled != null) 'Enabled': enabled,
      if (hasCredential != null) 'HasCredential': hasCredential,
      if (id != null) 'Id': id,
      if (isArchived != null) 'IsArchived': isArchived,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (version != null) 'Version': version,
    };
  }
}

/// Specifies the settings for a one-time message that's sent directly to an
/// endpoint through the ADM (Amazon Device Messaging) channel.
class ADMMessage {
  /// The action to occur if the recipient taps the push notification. Valid
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// OPEN_APP - Your app opens or it becomes the foreground app if it was sent to
  /// the background. This is the default action.
  /// </li>
  /// <li>
  /// DEEP_LINK - Your app opens and displays a designated user interface in the
  /// app. This action uses the deep-linking features of the Android platform.
  /// </li>
  /// <li>
  /// URL - The default mobile browser on the recipient's device opens and loads
  /// the web page at a URL that you specify.
  /// </li>
  /// </ul>
  final Action? action;

  /// The body of the notification message.
  final String? body;

  /// An arbitrary string that indicates that multiple messages are logically the
  /// same and that Amazon Device Messaging (ADM) can drop previously enqueued
  /// messages in favor of this message.
  final String? consolidationKey;

  /// The JSON data payload to use for the push notification, if the notification
  /// is a silent push notification. This payload is added to the
  /// data.pinpoint.jsonBody object of the notification.
  final Map<String, String>? data;

  /// The amount of time, in seconds, that ADM should store the message if the
  /// recipient's device is offline. Amazon Pinpoint specifies this value in the
  /// expiresAfter parameter when it sends the notification message to ADM.
  final String? expiresAfter;

  /// The icon image name of the asset saved in your app.
  final String? iconReference;

  /// The URL of the large icon image to display in the content view of the push
  /// notification.
  final String? imageIconUrl;

  /// The URL of an image to display in the push notification.
  final String? imageUrl;

  /// The base64-encoded, MD5 checksum of the value specified by the Data
  /// property. ADM uses the MD5 value to verify the integrity of the data.
  final String? md5;

  /// The raw, JSON-formatted string to use as the payload for the notification
  /// message. If specified, this value overrides all other content for the
  /// message.
  final String? rawContent;

  /// Specifies whether the notification is a silent push notification, which is a
  /// push notification that doesn't display on a recipient's device. Silent push
  /// notifications can be used for cases such as updating an app's configuration
  /// or supporting phone home functionality.
  final bool? silentPush;

  /// The URL of the small icon image to display in the status bar and the content
  /// view of the push notification.
  final String? smallImageIconUrl;

  /// The sound to play when the recipient receives the push notification. You can
  /// use the default stream or specify the file name of a sound resource that's
  /// bundled in your app. On an Android platform, the sound file must reside in
  /// /res/raw/.
  final String? sound;

  /// The default message variables to use in the notification message. You can
  /// override the default variables with individual address variables.
  final Map<String, List<String>>? substitutions;

  /// The title to display above the notification message on the recipient's
  /// device.
  final String? title;

  /// The URL to open in the recipient's default mobile browser, if a recipient
  /// taps the push notification and the value of the Action property is URL.
  final String? url;

  ADMMessage({
    this.action,
    this.body,
    this.consolidationKey,
    this.data,
    this.expiresAfter,
    this.iconReference,
    this.imageIconUrl,
    this.imageUrl,
    this.md5,
    this.rawContent,
    this.silentPush,
    this.smallImageIconUrl,
    this.sound,
    this.substitutions,
    this.title,
    this.url,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final body = this.body;
    final consolidationKey = this.consolidationKey;
    final data = this.data;
    final expiresAfter = this.expiresAfter;
    final iconReference = this.iconReference;
    final imageIconUrl = this.imageIconUrl;
    final imageUrl = this.imageUrl;
    final md5 = this.md5;
    final rawContent = this.rawContent;
    final silentPush = this.silentPush;
    final smallImageIconUrl = this.smallImageIconUrl;
    final sound = this.sound;
    final substitutions = this.substitutions;
    final title = this.title;
    final url = this.url;
    return {
      if (action != null) 'Action': action.toValue(),
      if (body != null) 'Body': body,
      if (consolidationKey != null) 'ConsolidationKey': consolidationKey,
      if (data != null) 'Data': data,
      if (expiresAfter != null) 'ExpiresAfter': expiresAfter,
      if (iconReference != null) 'IconReference': iconReference,
      if (imageIconUrl != null) 'ImageIconUrl': imageIconUrl,
      if (imageUrl != null) 'ImageUrl': imageUrl,
      if (md5 != null) 'MD5': md5,
      if (rawContent != null) 'RawContent': rawContent,
      if (silentPush != null) 'SilentPush': silentPush,
      if (smallImageIconUrl != null) 'SmallImageIconUrl': smallImageIconUrl,
      if (sound != null) 'Sound': sound,
      if (substitutions != null) 'Substitutions': substitutions,
      if (title != null) 'Title': title,
      if (url != null) 'Url': url,
    };
  }
}

/// Specifies the status and settings of the APNs (Apple Push Notification
/// service) channel for an application.
class APNSChannelRequest {
  /// The bundle identifier that's assigned to your iOS app. This identifier is
  /// used for APNs tokens.
  final String? bundleId;

  /// The APNs client certificate that you received from Apple, if you want Amazon
  /// Pinpoint to communicate with APNs by using an APNs certificate.
  final String? certificate;

  /// The default authentication method that you want Amazon Pinpoint to use when
  /// authenticating with APNs, key or certificate.
  final String? defaultAuthenticationMethod;

  /// Specifies whether to enable the APNs channel for the application.
  final bool? enabled;

  /// The private key for the APNs client certificate that you want Amazon
  /// Pinpoint to use to communicate with APNs.
  final String? privateKey;

  /// The identifier that's assigned to your Apple developer account team. This
  /// identifier is used for APNs tokens.
  final String? teamId;

  /// The authentication key to use for APNs tokens.
  final String? tokenKey;

  /// The key identifier that's assigned to your APNs signing key, if you want
  /// Amazon Pinpoint to communicate with APNs by using APNs tokens.
  final String? tokenKeyId;

  APNSChannelRequest({
    this.bundleId,
    this.certificate,
    this.defaultAuthenticationMethod,
    this.enabled,
    this.privateKey,
    this.teamId,
    this.tokenKey,
    this.tokenKeyId,
  });

  Map<String, dynamic> toJson() {
    final bundleId = this.bundleId;
    final certificate = this.certificate;
    final defaultAuthenticationMethod = this.defaultAuthenticationMethod;
    final enabled = this.enabled;
    final privateKey = this.privateKey;
    final teamId = this.teamId;
    final tokenKey = this.tokenKey;
    final tokenKeyId = this.tokenKeyId;
    return {
      if (bundleId != null) 'BundleId': bundleId,
      if (certificate != null) 'Certificate': certificate,
      if (defaultAuthenticationMethod != null)
        'DefaultAuthenticationMethod': defaultAuthenticationMethod,
      if (enabled != null) 'Enabled': enabled,
      if (privateKey != null) 'PrivateKey': privateKey,
      if (teamId != null) 'TeamId': teamId,
      if (tokenKey != null) 'TokenKey': tokenKey,
      if (tokenKeyId != null) 'TokenKeyId': tokenKeyId,
    };
  }
}

/// Provides information about the status and settings of the APNs (Apple Push
/// Notification service) channel for an application.
class APNSChannelResponse {
  /// The type of messaging or notification platform for the channel. For the APNs
  /// channel, this value is APNS.
  final String platform;

  /// The unique identifier for the application that the APNs channel applies to.
  final String? applicationId;

  /// The date and time when the APNs channel was enabled.
  final String? creationDate;

  /// The default authentication method that Amazon Pinpoint uses to authenticate
  /// with APNs for this channel, key or certificate.
  final String? defaultAuthenticationMethod;

  /// Specifies whether the APNs channel is enabled for the application.
  final bool? enabled;

  /// (Not used) This property is retained only for backward compatibility.
  final bool? hasCredential;

  /// Specifies whether the APNs channel is configured to communicate with APNs by
  /// using APNs tokens. To provide an authentication key for APNs tokens, set the
  /// TokenKey property of the channel.
  final bool? hasTokenKey;

  /// (Deprecated) An identifier for the APNs channel. This property is retained
  /// only for backward compatibility.
  final String? id;

  /// Specifies whether the APNs channel is archived.
  final bool? isArchived;

  /// The user who last modified the APNs channel.
  final String? lastModifiedBy;

  /// The date and time when the APNs channel was last modified.
  final String? lastModifiedDate;

  /// The current version of the APNs channel.
  final int? version;

  APNSChannelResponse({
    required this.platform,
    this.applicationId,
    this.creationDate,
    this.defaultAuthenticationMethod,
    this.enabled,
    this.hasCredential,
    this.hasTokenKey,
    this.id,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.version,
  });

  factory APNSChannelResponse.fromJson(Map<String, dynamic> json) {
    return APNSChannelResponse(
      platform: json['Platform'] as String,
      applicationId: json['ApplicationId'] as String?,
      creationDate: json['CreationDate'] as String?,
      defaultAuthenticationMethod:
          json['DefaultAuthenticationMethod'] as String?,
      enabled: json['Enabled'] as bool?,
      hasCredential: json['HasCredential'] as bool?,
      hasTokenKey: json['HasTokenKey'] as bool?,
      id: json['Id'] as String?,
      isArchived: json['IsArchived'] as bool?,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: json['LastModifiedDate'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final platform = this.platform;
    final applicationId = this.applicationId;
    final creationDate = this.creationDate;
    final defaultAuthenticationMethod = this.defaultAuthenticationMethod;
    final enabled = this.enabled;
    final hasCredential = this.hasCredential;
    final hasTokenKey = this.hasTokenKey;
    final id = this.id;
    final isArchived = this.isArchived;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final version = this.version;
    return {
      'Platform': platform,
      if (applicationId != null) 'ApplicationId': applicationId,
      if (creationDate != null) 'CreationDate': creationDate,
      if (defaultAuthenticationMethod != null)
        'DefaultAuthenticationMethod': defaultAuthenticationMethod,
      if (enabled != null) 'Enabled': enabled,
      if (hasCredential != null) 'HasCredential': hasCredential,
      if (hasTokenKey != null) 'HasTokenKey': hasTokenKey,
      if (id != null) 'Id': id,
      if (isArchived != null) 'IsArchived': isArchived,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (version != null) 'Version': version,
    };
  }
}

/// Specifies the settings for a one-time message that's sent directly to an
/// endpoint through the APNs (Apple Push Notification service) channel.
class APNSMessage {
  /// The type of push notification to send. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// alert - For a standard notification that's displayed on recipients' devices
  /// and prompts a recipient to interact with the notification.
  /// </li>
  /// <li>
  /// background - For a silent notification that delivers content in the
  /// background and isn't displayed on recipients' devices.
  /// </li>
  /// <li>
  /// complication - For a notification that contains update information for an
  /// app’s complication timeline.
  /// </li>
  /// <li>
  /// fileprovider - For a notification that signals changes to a File Provider
  /// extension.
  /// </li>
  /// <li>
  /// mdm - For a notification that tells managed devices to contact the MDM
  /// server.
  /// </li>
  /// <li>
  /// voip - For a notification that provides information about an incoming VoIP
  /// call.
  /// </li>
  /// </ul>
  /// Amazon Pinpoint specifies this value in the apns-push-type request header
  /// when it sends the notification message to APNs. If you don't specify a value
  /// for this property, Amazon Pinpoint sets the value to alert or background
  /// automatically, based on the value that you specify for the SilentPush or
  /// RawContent property of the message.
  ///
  /// For more information about the apns-push-type request header, see <a
  /// href="https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/sending_notification_requests_to_apns">Sending
  /// Notification Requests to APNs</a> on the Apple Developer website.
  final String? aPNSPushType;

  /// The action to occur if the recipient taps the push notification. Valid
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// OPEN_APP - Your app opens or it becomes the foreground app if it was sent to
  /// the background. This is the default action.
  /// </li>
  /// <li>
  /// DEEP_LINK - Your app opens and displays a designated user interface in the
  /// app. This setting uses the deep-linking features of the iOS platform.
  /// </li>
  /// <li>
  /// URL - The default mobile browser on the recipient's device opens and loads
  /// the web page at a URL that you specify.
  /// </li>
  /// </ul>
  final Action? action;

  /// The key that indicates whether and how to modify the badge of your app's
  /// icon when the recipient receives the push notification. If this key isn't
  /// included in the dictionary, the badge doesn't change. To remove the badge,
  /// set this value to 0.
  final int? badge;

  /// The body of the notification message.
  final String? body;

  /// The key that indicates the notification type for the push notification. This
  /// key is a value that's defined by the identifier property of one of your
  /// app's registered categories.
  final String? category;

  /// An arbitrary identifier that, if assigned to multiple messages, APNs uses to
  /// coalesce the messages into a single push notification instead of delivering
  /// each message individually. This value can't exceed 64 bytes.
  ///
  /// Amazon Pinpoint specifies this value in the apns-collapse-id request header
  /// when it sends the notification message to APNs.
  final String? collapseId;

  /// The JSON payload to use for a silent push notification. This payload is
  /// added to the data.pinpoint.jsonBody object of the notification.
  final Map<String, String>? data;

  /// The URL of an image or video to display in the push notification.
  final String? mediaUrl;

  /// The authentication method that you want Amazon Pinpoint to use when
  /// authenticating with APNs, CERTIFICATE or TOKEN.
  final String? preferredAuthenticationMethod;

  /// para>5 - Low priority, the notification might be delayed, delivered as part
  /// of a group, or throttled.
  /// /listitem>
  /// <li>
  /// 10 - High priority, the notification is sent immediately. This is the
  /// default value. A high priority notification should trigger an alert, play a
  /// sound, or badge your app's icon on the recipient's device.
  /// </li>/para>
  /// Amazon Pinpoint specifies this value in the apns-priority request header
  /// when it sends the notification message to APNs.
  ///
  /// The equivalent values for Firebase Cloud Messaging (FCM), formerly Google
  /// Cloud Messaging (GCM), are normal, for 5, and high, for 10. If you specify
  /// an FCM value for this property, Amazon Pinpoint accepts and converts the
  /// value to the corresponding APNs value.
  final String? priority;

  /// The raw, JSON-formatted string to use as the payload for the notification
  /// message. If specified, this value overrides all other content for the
  /// message.
  /// <note>
  /// If you specify the raw content of an APNs push notification, the message
  /// payload has to include the content-available key. The value of the
  /// content-available key has to be an integer, and can only be 0 or 1. If
  /// you're sending a standard notification, set the value of content-available
  /// to 0. If you're sending a silent (background) notification, set the value of
  /// content-available to 1. Additionally, silent notification payloads can't
  /// include the alert, badge, or sound keys. For more information, see <a
  /// href="https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/generating_a_remote_notification">Generating
  /// a Remote Notification</a> and <a
  /// href="https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/pushing_background_updates_to_your_app">Pushing
  /// Background Updates to Your App</a> on the Apple Developer website.
  /// </note>
  final String? rawContent;

  /// Specifies whether the notification is a silent push notification. A silent
  /// (or background) push notification isn't displayed on recipients' devices.
  /// You can use silent push notifications to make small updates to your app, or
  /// to display messages in an in-app message center.
  ///
  /// Amazon Pinpoint uses this property to determine the correct value for the
  /// apns-push-type request header when it sends the notification message to
  /// APNs. If you specify a value of true for this property, Amazon Pinpoint sets
  /// the value for the apns-push-type header field to background.
  /// <note>
  /// If you specify the raw content of an APNs push notification, the message
  /// payload has to include the content-available key. For silent (background)
  /// notifications, set the value of content-available to 1. Additionally, the
  /// message payload for a silent notification can't include the alert, badge, or
  /// sound keys. For more information, see <a
  /// href="https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/generating_a_remote_notification">Generating
  /// a Remote Notification</a> and <a
  /// href="https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/pushing_background_updates_to_your_app">Pushing
  /// Background Updates to Your App</a> on the Apple Developer website.
  ///
  /// Apple has indicated that they will throttle "excessive" background
  /// notifications based on current traffic volumes. To prevent your
  /// notifications being throttled, Apple recommends that you send no more than 3
  /// silent push notifications to each recipient per hour.
  /// </note>
  final bool? silentPush;

  /// The key for the sound to play when the recipient receives the push
  /// notification. The value for this key is the name of a sound file in your
  /// app's main bundle or the Library/Sounds folder in your app's data container.
  /// If the sound file can't be found or you specify default for the value, the
  /// system plays the default alert sound.
  final String? sound;

  /// The default message variables to use in the notification message. You can
  /// override these default variables with individual address variables.
  final Map<String, List<String>>? substitutions;

  /// The key that represents your app-specific identifier for grouping
  /// notifications. If you provide a Notification Content app extension, you can
  /// use this value to group your notifications together.
  final String? threadId;

  /// The amount of time, in seconds, that APNs should store and attempt to
  /// deliver the push notification, if the service is unable to deliver the
  /// notification the first time. If this value is 0, APNs treats the
  /// notification as if it expires immediately and the service doesn't store or
  /// try to deliver the notification again.
  ///
  /// Amazon Pinpoint specifies this value in the apns-expiration request header
  /// when it sends the notification message to APNs.
  final int? timeToLive;

  /// The title to display above the notification message on the recipient's
  /// device.
  final String? title;

  /// The URL to open in the recipient's default mobile browser, if a recipient
  /// taps the push notification and the value of the Action property is URL.
  final String? url;

  APNSMessage({
    this.aPNSPushType,
    this.action,
    this.badge,
    this.body,
    this.category,
    this.collapseId,
    this.data,
    this.mediaUrl,
    this.preferredAuthenticationMethod,
    this.priority,
    this.rawContent,
    this.silentPush,
    this.sound,
    this.substitutions,
    this.threadId,
    this.timeToLive,
    this.title,
    this.url,
  });

  Map<String, dynamic> toJson() {
    final aPNSPushType = this.aPNSPushType;
    final action = this.action;
    final badge = this.badge;
    final body = this.body;
    final category = this.category;
    final collapseId = this.collapseId;
    final data = this.data;
    final mediaUrl = this.mediaUrl;
    final preferredAuthenticationMethod = this.preferredAuthenticationMethod;
    final priority = this.priority;
    final rawContent = this.rawContent;
    final silentPush = this.silentPush;
    final sound = this.sound;
    final substitutions = this.substitutions;
    final threadId = this.threadId;
    final timeToLive = this.timeToLive;
    final title = this.title;
    final url = this.url;
    return {
      if (aPNSPushType != null) 'APNSPushType': aPNSPushType,
      if (action != null) 'Action': action.toValue(),
      if (badge != null) 'Badge': badge,
      if (body != null) 'Body': body,
      if (category != null) 'Category': category,
      if (collapseId != null) 'CollapseId': collapseId,
      if (data != null) 'Data': data,
      if (mediaUrl != null) 'MediaUrl': mediaUrl,
      if (preferredAuthenticationMethod != null)
        'PreferredAuthenticationMethod': preferredAuthenticationMethod,
      if (priority != null) 'Priority': priority,
      if (rawContent != null) 'RawContent': rawContent,
      if (silentPush != null) 'SilentPush': silentPush,
      if (sound != null) 'Sound': sound,
      if (substitutions != null) 'Substitutions': substitutions,
      if (threadId != null) 'ThreadId': threadId,
      if (timeToLive != null) 'TimeToLive': timeToLive,
      if (title != null) 'Title': title,
      if (url != null) 'Url': url,
    };
  }
}

/// Specifies channel-specific content and settings for a message template that
/// can be used in push notifications that are sent through the APNs (Apple Push
/// Notification service) channel.
class APNSPushNotificationTemplate {
  /// The action to occur if a recipient taps a push notification that's based on
  /// the message template. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// OPEN_APP - Your app opens or it becomes the foreground app if it was sent to
  /// the background. This is the default action.
  /// </li>
  /// <li>
  /// DEEP_LINK - Your app opens and displays a designated user interface in the
  /// app. This setting uses the deep-linking features of the iOS platform.
  /// </li>
  /// <li>
  /// URL - The default mobile browser on the recipient's device opens and loads
  /// the web page at a URL that you specify.
  /// </li>
  /// </ul>
  final Action? action;

  /// The message body to use in push notifications that are based on the message
  /// template.
  final String? body;

  /// The URL of an image or video to display in push notifications that are based
  /// on the message template.
  final String? mediaUrl;

  /// The raw, JSON-formatted string to use as the payload for push notifications
  /// that are based on the message template. If specified, this value overrides
  /// all other content for the message template.
  final String? rawContent;

  /// The key for the sound to play when the recipient receives a push
  /// notification that's based on the message template. The value for this key is
  /// the name of a sound file in your app's main bundle or the Library/Sounds
  /// folder in your app's data container. If the sound file can't be found or you
  /// specify default for the value, the system plays the default alert sound.
  final String? sound;

  /// The title to use in push notifications that are based on the message
  /// template. This title appears above the notification message on a recipient's
  /// device.
  final String? title;

  /// The URL to open in the recipient's default mobile browser, if a recipient
  /// taps a push notification that's based on the message template and the value
  /// of the Action property is URL.
  final String? url;

  APNSPushNotificationTemplate({
    this.action,
    this.body,
    this.mediaUrl,
    this.rawContent,
    this.sound,
    this.title,
    this.url,
  });

  factory APNSPushNotificationTemplate.fromJson(Map<String, dynamic> json) {
    return APNSPushNotificationTemplate(
      action: (json['Action'] as String?)?.toAction(),
      body: json['Body'] as String?,
      mediaUrl: json['MediaUrl'] as String?,
      rawContent: json['RawContent'] as String?,
      sound: json['Sound'] as String?,
      title: json['Title'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final body = this.body;
    final mediaUrl = this.mediaUrl;
    final rawContent = this.rawContent;
    final sound = this.sound;
    final title = this.title;
    final url = this.url;
    return {
      if (action != null) 'Action': action.toValue(),
      if (body != null) 'Body': body,
      if (mediaUrl != null) 'MediaUrl': mediaUrl,
      if (rawContent != null) 'RawContent': rawContent,
      if (sound != null) 'Sound': sound,
      if (title != null) 'Title': title,
      if (url != null) 'Url': url,
    };
  }
}

/// Specifies the status and settings of the APNs (Apple Push Notification
/// service) sandbox channel for an application.
class APNSSandboxChannelRequest {
  /// The bundle identifier that's assigned to your iOS app. This identifier is
  /// used for APNs tokens.
  final String? bundleId;

  /// The APNs client certificate that you received from Apple, if you want Amazon
  /// Pinpoint to communicate with the APNs sandbox environment by using an APNs
  /// certificate.
  final String? certificate;

  /// The default authentication method that you want Amazon Pinpoint to use when
  /// authenticating with the APNs sandbox environment, key or certificate.
  final String? defaultAuthenticationMethod;

  /// Specifies whether to enable the APNs sandbox channel for the application.
  final bool? enabled;

  /// The private key for the APNs client certificate that you want Amazon
  /// Pinpoint to use to communicate with the APNs sandbox environment.
  final String? privateKey;

  /// The identifier that's assigned to your Apple developer account team. This
  /// identifier is used for APNs tokens.
  final String? teamId;

  /// The authentication key to use for APNs tokens.
  final String? tokenKey;

  /// The key identifier that's assigned to your APNs signing key, if you want
  /// Amazon Pinpoint to communicate with the APNs sandbox environment by using
  /// APNs tokens.
  final String? tokenKeyId;

  APNSSandboxChannelRequest({
    this.bundleId,
    this.certificate,
    this.defaultAuthenticationMethod,
    this.enabled,
    this.privateKey,
    this.teamId,
    this.tokenKey,
    this.tokenKeyId,
  });

  Map<String, dynamic> toJson() {
    final bundleId = this.bundleId;
    final certificate = this.certificate;
    final defaultAuthenticationMethod = this.defaultAuthenticationMethod;
    final enabled = this.enabled;
    final privateKey = this.privateKey;
    final teamId = this.teamId;
    final tokenKey = this.tokenKey;
    final tokenKeyId = this.tokenKeyId;
    return {
      if (bundleId != null) 'BundleId': bundleId,
      if (certificate != null) 'Certificate': certificate,
      if (defaultAuthenticationMethod != null)
        'DefaultAuthenticationMethod': defaultAuthenticationMethod,
      if (enabled != null) 'Enabled': enabled,
      if (privateKey != null) 'PrivateKey': privateKey,
      if (teamId != null) 'TeamId': teamId,
      if (tokenKey != null) 'TokenKey': tokenKey,
      if (tokenKeyId != null) 'TokenKeyId': tokenKeyId,
    };
  }
}

/// Provides information about the status and settings of the APNs (Apple Push
/// Notification service) sandbox channel for an application.
class APNSSandboxChannelResponse {
  /// The type of messaging or notification platform for the channel. For the APNs
  /// sandbox channel, this value is APNS_SANDBOX.
  final String platform;

  /// The unique identifier for the application that the APNs sandbox channel
  /// applies to.
  final String? applicationId;

  /// The date and time when the APNs sandbox channel was enabled.
  final String? creationDate;

  /// The default authentication method that Amazon Pinpoint uses to authenticate
  /// with the APNs sandbox environment for this channel, key or certificate.
  final String? defaultAuthenticationMethod;

  /// Specifies whether the APNs sandbox channel is enabled for the application.
  final bool? enabled;

  /// (Not used) This property is retained only for backward compatibility.
  final bool? hasCredential;

  /// Specifies whether the APNs sandbox channel is configured to communicate with
  /// APNs by using APNs tokens. To provide an authentication key for APNs tokens,
  /// set the TokenKey property of the channel.
  final bool? hasTokenKey;

  /// (Deprecated) An identifier for the APNs sandbox channel. This property is
  /// retained only for backward compatibility.
  final String? id;

  /// Specifies whether the APNs sandbox channel is archived.
  final bool? isArchived;

  /// The user who last modified the APNs sandbox channel.
  final String? lastModifiedBy;

  /// The date and time when the APNs sandbox channel was last modified.
  final String? lastModifiedDate;

  /// The current version of the APNs sandbox channel.
  final int? version;

  APNSSandboxChannelResponse({
    required this.platform,
    this.applicationId,
    this.creationDate,
    this.defaultAuthenticationMethod,
    this.enabled,
    this.hasCredential,
    this.hasTokenKey,
    this.id,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.version,
  });

  factory APNSSandboxChannelResponse.fromJson(Map<String, dynamic> json) {
    return APNSSandboxChannelResponse(
      platform: json['Platform'] as String,
      applicationId: json['ApplicationId'] as String?,
      creationDate: json['CreationDate'] as String?,
      defaultAuthenticationMethod:
          json['DefaultAuthenticationMethod'] as String?,
      enabled: json['Enabled'] as bool?,
      hasCredential: json['HasCredential'] as bool?,
      hasTokenKey: json['HasTokenKey'] as bool?,
      id: json['Id'] as String?,
      isArchived: json['IsArchived'] as bool?,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: json['LastModifiedDate'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final platform = this.platform;
    final applicationId = this.applicationId;
    final creationDate = this.creationDate;
    final defaultAuthenticationMethod = this.defaultAuthenticationMethod;
    final enabled = this.enabled;
    final hasCredential = this.hasCredential;
    final hasTokenKey = this.hasTokenKey;
    final id = this.id;
    final isArchived = this.isArchived;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final version = this.version;
    return {
      'Platform': platform,
      if (applicationId != null) 'ApplicationId': applicationId,
      if (creationDate != null) 'CreationDate': creationDate,
      if (defaultAuthenticationMethod != null)
        'DefaultAuthenticationMethod': defaultAuthenticationMethod,
      if (enabled != null) 'Enabled': enabled,
      if (hasCredential != null) 'HasCredential': hasCredential,
      if (hasTokenKey != null) 'HasTokenKey': hasTokenKey,
      if (id != null) 'Id': id,
      if (isArchived != null) 'IsArchived': isArchived,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (version != null) 'Version': version,
    };
  }
}

/// Specifies the status and settings of the APNs (Apple Push Notification
/// service) VoIP channel for an application.
class APNSVoipChannelRequest {
  /// The bundle identifier that's assigned to your iOS app. This identifier is
  /// used for APNs tokens.
  final String? bundleId;

  /// The APNs client certificate that you received from Apple, if you want Amazon
  /// Pinpoint to communicate with APNs by using an APNs certificate.
  final String? certificate;

  /// The default authentication method that you want Amazon Pinpoint to use when
  /// authenticating with APNs, key or certificate.
  final String? defaultAuthenticationMethod;

  /// Specifies whether to enable the APNs VoIP channel for the application.
  final bool? enabled;

  /// The private key for the APNs client certificate that you want Amazon
  /// Pinpoint to use to communicate with APNs.
  final String? privateKey;

  /// The identifier that's assigned to your Apple developer account team. This
  /// identifier is used for APNs tokens.
  final String? teamId;

  /// The authentication key to use for APNs tokens.
  final String? tokenKey;

  /// The key identifier that's assigned to your APNs signing key, if you want
  /// Amazon Pinpoint to communicate with APNs by using APNs tokens.
  final String? tokenKeyId;

  APNSVoipChannelRequest({
    this.bundleId,
    this.certificate,
    this.defaultAuthenticationMethod,
    this.enabled,
    this.privateKey,
    this.teamId,
    this.tokenKey,
    this.tokenKeyId,
  });

  Map<String, dynamic> toJson() {
    final bundleId = this.bundleId;
    final certificate = this.certificate;
    final defaultAuthenticationMethod = this.defaultAuthenticationMethod;
    final enabled = this.enabled;
    final privateKey = this.privateKey;
    final teamId = this.teamId;
    final tokenKey = this.tokenKey;
    final tokenKeyId = this.tokenKeyId;
    return {
      if (bundleId != null) 'BundleId': bundleId,
      if (certificate != null) 'Certificate': certificate,
      if (defaultAuthenticationMethod != null)
        'DefaultAuthenticationMethod': defaultAuthenticationMethod,
      if (enabled != null) 'Enabled': enabled,
      if (privateKey != null) 'PrivateKey': privateKey,
      if (teamId != null) 'TeamId': teamId,
      if (tokenKey != null) 'TokenKey': tokenKey,
      if (tokenKeyId != null) 'TokenKeyId': tokenKeyId,
    };
  }
}

/// Provides information about the status and settings of the APNs (Apple Push
/// Notification service) VoIP channel for an application.
class APNSVoipChannelResponse {
  /// The type of messaging or notification platform for the channel. For the APNs
  /// VoIP channel, this value is APNS_VOIP.
  final String platform;

  /// The unique identifier for the application that the APNs VoIP channel applies
  /// to.
  final String? applicationId;

  /// The date and time when the APNs VoIP channel was enabled.
  final String? creationDate;

  /// The default authentication method that Amazon Pinpoint uses to authenticate
  /// with APNs for this channel, key or certificate.
  final String? defaultAuthenticationMethod;

  /// Specifies whether the APNs VoIP channel is enabled for the application.
  final bool? enabled;

  /// (Not used) This property is retained only for backward compatibility.
  final bool? hasCredential;

  /// Specifies whether the APNs VoIP channel is configured to communicate with
  /// APNs by using APNs tokens. To provide an authentication key for APNs tokens,
  /// set the TokenKey property of the channel.
  final bool? hasTokenKey;

  /// (Deprecated) An identifier for the APNs VoIP channel. This property is
  /// retained only for backward compatibility.
  final String? id;

  /// Specifies whether the APNs VoIP channel is archived.
  final bool? isArchived;

  /// The user who last modified the APNs VoIP channel.
  final String? lastModifiedBy;

  /// The date and time when the APNs VoIP channel was last modified.
  final String? lastModifiedDate;

  /// The current version of the APNs VoIP channel.
  final int? version;

  APNSVoipChannelResponse({
    required this.platform,
    this.applicationId,
    this.creationDate,
    this.defaultAuthenticationMethod,
    this.enabled,
    this.hasCredential,
    this.hasTokenKey,
    this.id,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.version,
  });

  factory APNSVoipChannelResponse.fromJson(Map<String, dynamic> json) {
    return APNSVoipChannelResponse(
      platform: json['Platform'] as String,
      applicationId: json['ApplicationId'] as String?,
      creationDate: json['CreationDate'] as String?,
      defaultAuthenticationMethod:
          json['DefaultAuthenticationMethod'] as String?,
      enabled: json['Enabled'] as bool?,
      hasCredential: json['HasCredential'] as bool?,
      hasTokenKey: json['HasTokenKey'] as bool?,
      id: json['Id'] as String?,
      isArchived: json['IsArchived'] as bool?,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: json['LastModifiedDate'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final platform = this.platform;
    final applicationId = this.applicationId;
    final creationDate = this.creationDate;
    final defaultAuthenticationMethod = this.defaultAuthenticationMethod;
    final enabled = this.enabled;
    final hasCredential = this.hasCredential;
    final hasTokenKey = this.hasTokenKey;
    final id = this.id;
    final isArchived = this.isArchived;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final version = this.version;
    return {
      'Platform': platform,
      if (applicationId != null) 'ApplicationId': applicationId,
      if (creationDate != null) 'CreationDate': creationDate,
      if (defaultAuthenticationMethod != null)
        'DefaultAuthenticationMethod': defaultAuthenticationMethod,
      if (enabled != null) 'Enabled': enabled,
      if (hasCredential != null) 'HasCredential': hasCredential,
      if (hasTokenKey != null) 'HasTokenKey': hasTokenKey,
      if (id != null) 'Id': id,
      if (isArchived != null) 'IsArchived': isArchived,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (version != null) 'Version': version,
    };
  }
}

/// Specifies the status and settings of the APNs (Apple Push Notification
/// service) VoIP sandbox channel for an application.
class APNSVoipSandboxChannelRequest {
  /// The bundle identifier that's assigned to your iOS app. This identifier is
  /// used for APNs tokens.
  final String? bundleId;

  /// The APNs client certificate that you received from Apple, if you want Amazon
  /// Pinpoint to communicate with the APNs sandbox environment by using an APNs
  /// certificate.
  final String? certificate;

  /// The default authentication method that you want Amazon Pinpoint to use when
  /// authenticating with the APNs sandbox environment for this channel, key or
  /// certificate.
  final String? defaultAuthenticationMethod;

  /// Specifies whether the APNs VoIP sandbox channel is enabled for the
  /// application.
  final bool? enabled;

  /// The private key for the APNs client certificate that you want Amazon
  /// Pinpoint to use to communicate with the APNs sandbox environment.
  final String? privateKey;

  /// The identifier that's assigned to your Apple developer account team. This
  /// identifier is used for APNs tokens.
  final String? teamId;

  /// The authentication key to use for APNs tokens.
  final String? tokenKey;

  /// The key identifier that's assigned to your APNs signing key, if you want
  /// Amazon Pinpoint to communicate with the APNs sandbox environment by using
  /// APNs tokens.
  final String? tokenKeyId;

  APNSVoipSandboxChannelRequest({
    this.bundleId,
    this.certificate,
    this.defaultAuthenticationMethod,
    this.enabled,
    this.privateKey,
    this.teamId,
    this.tokenKey,
    this.tokenKeyId,
  });

  Map<String, dynamic> toJson() {
    final bundleId = this.bundleId;
    final certificate = this.certificate;
    final defaultAuthenticationMethod = this.defaultAuthenticationMethod;
    final enabled = this.enabled;
    final privateKey = this.privateKey;
    final teamId = this.teamId;
    final tokenKey = this.tokenKey;
    final tokenKeyId = this.tokenKeyId;
    return {
      if (bundleId != null) 'BundleId': bundleId,
      if (certificate != null) 'Certificate': certificate,
      if (defaultAuthenticationMethod != null)
        'DefaultAuthenticationMethod': defaultAuthenticationMethod,
      if (enabled != null) 'Enabled': enabled,
      if (privateKey != null) 'PrivateKey': privateKey,
      if (teamId != null) 'TeamId': teamId,
      if (tokenKey != null) 'TokenKey': tokenKey,
      if (tokenKeyId != null) 'TokenKeyId': tokenKeyId,
    };
  }
}

/// Provides information about the status and settings of the APNs (Apple Push
/// Notification service) VoIP sandbox channel for an application.
class APNSVoipSandboxChannelResponse {
  /// The type of messaging or notification platform for the channel. For the APNs
  /// VoIP sandbox channel, this value is APNS_VOIP_SANDBOX.
  final String platform;

  /// The unique identifier for the application that the APNs VoIP sandbox channel
  /// applies to.
  final String? applicationId;

  /// The date and time when the APNs VoIP sandbox channel was enabled.
  final String? creationDate;

  /// The default authentication method that Amazon Pinpoint uses to authenticate
  /// with the APNs sandbox environment for this channel, key or certificate.
  final String? defaultAuthenticationMethod;

  /// Specifies whether the APNs VoIP sandbox channel is enabled for the
  /// application.
  final bool? enabled;

  /// (Not used) This property is retained only for backward compatibility.
  final bool? hasCredential;

  /// Specifies whether the APNs VoIP sandbox channel is configured to communicate
  /// with APNs by using APNs tokens. To provide an authentication key for APNs
  /// tokens, set the TokenKey property of the channel.
  final bool? hasTokenKey;

  /// (Deprecated) An identifier for the APNs VoIP sandbox channel. This property
  /// is retained only for backward compatibility.
  final String? id;

  /// Specifies whether the APNs VoIP sandbox channel is archived.
  final bool? isArchived;

  /// The user who last modified the APNs VoIP sandbox channel.
  final String? lastModifiedBy;

  /// The date and time when the APNs VoIP sandbox channel was last modified.
  final String? lastModifiedDate;

  /// The current version of the APNs VoIP sandbox channel.
  final int? version;

  APNSVoipSandboxChannelResponse({
    required this.platform,
    this.applicationId,
    this.creationDate,
    this.defaultAuthenticationMethod,
    this.enabled,
    this.hasCredential,
    this.hasTokenKey,
    this.id,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.version,
  });

  factory APNSVoipSandboxChannelResponse.fromJson(Map<String, dynamic> json) {
    return APNSVoipSandboxChannelResponse(
      platform: json['Platform'] as String,
      applicationId: json['ApplicationId'] as String?,
      creationDate: json['CreationDate'] as String?,
      defaultAuthenticationMethod:
          json['DefaultAuthenticationMethod'] as String?,
      enabled: json['Enabled'] as bool?,
      hasCredential: json['HasCredential'] as bool?,
      hasTokenKey: json['HasTokenKey'] as bool?,
      id: json['Id'] as String?,
      isArchived: json['IsArchived'] as bool?,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: json['LastModifiedDate'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final platform = this.platform;
    final applicationId = this.applicationId;
    final creationDate = this.creationDate;
    final defaultAuthenticationMethod = this.defaultAuthenticationMethod;
    final enabled = this.enabled;
    final hasCredential = this.hasCredential;
    final hasTokenKey = this.hasTokenKey;
    final id = this.id;
    final isArchived = this.isArchived;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final version = this.version;
    return {
      'Platform': platform,
      if (applicationId != null) 'ApplicationId': applicationId,
      if (creationDate != null) 'CreationDate': creationDate,
      if (defaultAuthenticationMethod != null)
        'DefaultAuthenticationMethod': defaultAuthenticationMethod,
      if (enabled != null) 'Enabled': enabled,
      if (hasCredential != null) 'HasCredential': hasCredential,
      if (hasTokenKey != null) 'HasTokenKey': hasTokenKey,
      if (id != null) 'Id': id,
      if (isArchived != null) 'IsArchived': isArchived,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (version != null) 'Version': version,
    };
  }
}

enum Action {
  openApp,
  deepLink,
  url,
}

extension ActionValueExtension on Action {
  String toValue() {
    switch (this) {
      case Action.openApp:
        return 'OPEN_APP';
      case Action.deepLink:
        return 'DEEP_LINK';
      case Action.url:
        return 'URL';
    }
  }
}

extension ActionFromString on String {
  Action toAction() {
    switch (this) {
      case 'OPEN_APP':
        return Action.openApp;
      case 'DEEP_LINK':
        return Action.deepLink;
      case 'URL':
        return Action.url;
    }
    throw Exception('$this is not known in enum Action');
  }
}

/// Provides information about the activities that were performed by a campaign.
class ActivitiesResponse {
  /// An array of responses, one for each activity that was performed by the
  /// campaign.
  final List<ActivityResponse> item;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  ActivitiesResponse({
    required this.item,
    this.nextToken,
  });

  factory ActivitiesResponse.fromJson(Map<String, dynamic> json) {
    return ActivitiesResponse(
      item: (json['Item'] as List)
          .whereNotNull()
          .map((e) => ActivityResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final item = this.item;
    final nextToken = this.nextToken;
    return {
      'Item': item,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Specifies the configuration and other settings for an activity in a journey.
class Activity {
  /// The settings for a custom message activity. This type of activity calls an
  /// AWS Lambda function or web hook that sends messages to participants.
  final CustomMessageActivity? custom;

  /// The settings for a yes/no split activity. This type of activity sends
  /// participants down one of two paths in a journey, based on conditions that
  /// you specify.
  final ConditionalSplitActivity? conditionalSplit;

  /// The settings for a connect activity. This type of activity initiates a
  /// contact center call to participants.
  final ContactCenterActivity? contactCenter;

  /// The custom description of the activity.
  final String? description;

  /// The settings for an email activity. This type of activity sends an email
  /// message to participants.
  final EmailMessageActivity? email;

  /// The settings for a holdout activity. This type of activity stops a journey
  /// for a specified percentage of participants.
  final HoldoutActivity? holdout;

  /// The settings for a multivariate split activity. This type of activity sends
  /// participants down one of as many as five paths (including a default
  /// <i>Else</i> path) in a journey, based on conditions that you specify.
  final MultiConditionalSplitActivity? multiCondition;

  /// The settings for a push notification activity. This type of activity sends a
  /// push notification to participants.
  final PushMessageActivity? push;

  /// The settings for a random split activity. This type of activity randomly
  /// sends specified percentages of participants down one of as many as five
  /// paths in a journey, based on conditions that you specify.
  final RandomSplitActivity? randomSplit;

  /// The settings for an SMS activity. This type of activity sends a text message
  /// to participants.
  final SMSMessageActivity? sms;

  /// The settings for a wait activity. This type of activity waits for a certain
  /// amount of time or until a specific date and time before moving participants
  /// to the next activity in a journey.
  final WaitActivity? wait;

  Activity({
    this.custom,
    this.conditionalSplit,
    this.contactCenter,
    this.description,
    this.email,
    this.holdout,
    this.multiCondition,
    this.push,
    this.randomSplit,
    this.sms,
    this.wait,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      custom: json['CUSTOM'] != null
          ? CustomMessageActivity.fromJson(
              json['CUSTOM'] as Map<String, dynamic>)
          : null,
      conditionalSplit: json['ConditionalSplit'] != null
          ? ConditionalSplitActivity.fromJson(
              json['ConditionalSplit'] as Map<String, dynamic>)
          : null,
      contactCenter: json['ContactCenter'] != null
          ? ContactCenterActivity.fromJson(
              json['ContactCenter'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      email: json['EMAIL'] != null
          ? EmailMessageActivity.fromJson(json['EMAIL'] as Map<String, dynamic>)
          : null,
      holdout: json['Holdout'] != null
          ? HoldoutActivity.fromJson(json['Holdout'] as Map<String, dynamic>)
          : null,
      multiCondition: json['MultiCondition'] != null
          ? MultiConditionalSplitActivity.fromJson(
              json['MultiCondition'] as Map<String, dynamic>)
          : null,
      push: json['PUSH'] != null
          ? PushMessageActivity.fromJson(json['PUSH'] as Map<String, dynamic>)
          : null,
      randomSplit: json['RandomSplit'] != null
          ? RandomSplitActivity.fromJson(
              json['RandomSplit'] as Map<String, dynamic>)
          : null,
      sms: json['SMS'] != null
          ? SMSMessageActivity.fromJson(json['SMS'] as Map<String, dynamic>)
          : null,
      wait: json['Wait'] != null
          ? WaitActivity.fromJson(json['Wait'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final custom = this.custom;
    final conditionalSplit = this.conditionalSplit;
    final contactCenter = this.contactCenter;
    final description = this.description;
    final email = this.email;
    final holdout = this.holdout;
    final multiCondition = this.multiCondition;
    final push = this.push;
    final randomSplit = this.randomSplit;
    final sms = this.sms;
    final wait = this.wait;
    return {
      if (custom != null) 'CUSTOM': custom,
      if (conditionalSplit != null) 'ConditionalSplit': conditionalSplit,
      if (contactCenter != null) 'ContactCenter': contactCenter,
      if (description != null) 'Description': description,
      if (email != null) 'EMAIL': email,
      if (holdout != null) 'Holdout': holdout,
      if (multiCondition != null) 'MultiCondition': multiCondition,
      if (push != null) 'PUSH': push,
      if (randomSplit != null) 'RandomSplit': randomSplit,
      if (sms != null) 'SMS': sms,
      if (wait != null) 'Wait': wait,
    };
  }
}

/// Provides information about an activity that was performed by a campaign.
class ActivityResponse {
  /// The unique identifier for the application that the campaign applies to.
  final String applicationId;

  /// The unique identifier for the campaign that the activity applies to.
  final String campaignId;

  /// The unique identifier for the activity.
  final String id;

  /// The actual time, in ISO 8601 format, when the activity was marked CANCELLED
  /// or COMPLETED.
  final String? end;

  /// A JSON object that contains metrics relating to the campaign execution for
  /// this campaign activity. For information about the structure and contents of
  /// the results, see <a
  /// href="https://docs.aws.amazon.com//pinpoint/latest/developerguide/analytics-standard-metrics.html">Standard
  /// Amazon Pinpoint analytics metrics</a> in the <i>Amazon Pinpoint Developer
  /// Guide</i>.
  final Map<String, String>? executionMetrics;

  /// Specifies whether the activity succeeded. Possible values are SUCCESS and
  /// FAIL.
  final String? result;

  /// The scheduled start time, in ISO 8601 format, for the activity.
  final String? scheduledStart;

  /// The actual start time, in ISO 8601 format, of the activity.
  final String? start;

  /// The current status of the activity. Possible values are: PENDING,
  /// INITIALIZING, RUNNING, PAUSED, CANCELLED, and COMPLETED.
  final String? state;

  /// The total number of endpoints that the campaign successfully delivered
  /// messages to.
  final int? successfulEndpointCount;

  /// The total number of time zones that were completed.
  final int? timezonesCompletedCount;

  /// The total number of unique time zones that are in the segment for the
  /// campaign.
  final int? timezonesTotalCount;

  /// The total number of endpoints that the campaign attempted to deliver
  /// messages to.
  final int? totalEndpointCount;

  /// The unique identifier for the campaign treatment that the activity applies
  /// to. A treatment is a variation of a campaign that's used for A/B testing of
  /// a campaign.
  final String? treatmentId;

  ActivityResponse({
    required this.applicationId,
    required this.campaignId,
    required this.id,
    this.end,
    this.executionMetrics,
    this.result,
    this.scheduledStart,
    this.start,
    this.state,
    this.successfulEndpointCount,
    this.timezonesCompletedCount,
    this.timezonesTotalCount,
    this.totalEndpointCount,
    this.treatmentId,
  });

  factory ActivityResponse.fromJson(Map<String, dynamic> json) {
    return ActivityResponse(
      applicationId: json['ApplicationId'] as String,
      campaignId: json['CampaignId'] as String,
      id: json['Id'] as String,
      end: json['End'] as String?,
      executionMetrics: (json['ExecutionMetrics'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      result: json['Result'] as String?,
      scheduledStart: json['ScheduledStart'] as String?,
      start: json['Start'] as String?,
      state: json['State'] as String?,
      successfulEndpointCount: json['SuccessfulEndpointCount'] as int?,
      timezonesCompletedCount: json['TimezonesCompletedCount'] as int?,
      timezonesTotalCount: json['TimezonesTotalCount'] as int?,
      totalEndpointCount: json['TotalEndpointCount'] as int?,
      treatmentId: json['TreatmentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final campaignId = this.campaignId;
    final id = this.id;
    final end = this.end;
    final executionMetrics = this.executionMetrics;
    final result = this.result;
    final scheduledStart = this.scheduledStart;
    final start = this.start;
    final state = this.state;
    final successfulEndpointCount = this.successfulEndpointCount;
    final timezonesCompletedCount = this.timezonesCompletedCount;
    final timezonesTotalCount = this.timezonesTotalCount;
    final totalEndpointCount = this.totalEndpointCount;
    final treatmentId = this.treatmentId;
    return {
      'ApplicationId': applicationId,
      'CampaignId': campaignId,
      'Id': id,
      if (end != null) 'End': end,
      if (executionMetrics != null) 'ExecutionMetrics': executionMetrics,
      if (result != null) 'Result': result,
      if (scheduledStart != null) 'ScheduledStart': scheduledStart,
      if (start != null) 'Start': start,
      if (state != null) 'State': state,
      if (successfulEndpointCount != null)
        'SuccessfulEndpointCount': successfulEndpointCount,
      if (timezonesCompletedCount != null)
        'TimezonesCompletedCount': timezonesCompletedCount,
      if (timezonesTotalCount != null)
        'TimezonesTotalCount': timezonesTotalCount,
      if (totalEndpointCount != null) 'TotalEndpointCount': totalEndpointCount,
      if (treatmentId != null) 'TreatmentId': treatmentId,
    };
  }
}

/// Specifies address-based configuration settings for a message that's sent
/// directly to an endpoint.
class AddressConfiguration {
  /// The message body to use instead of the default message body. This value
  /// overrides the default message body.
  final String? bodyOverride;

  /// The channel to use when sending the message.
  final ChannelType? channelType;

  /// An object that maps custom attributes to attributes for the address and is
  /// attached to the message. Attribute names are case sensitive.
  ///
  /// For a push notification, this payload is added to the data.pinpoint object.
  /// For an email or text message, this payload is added to email/SMS delivery
  /// receipt event attributes.
  final Map<String, String>? context;

  /// The raw, JSON-formatted string to use as the payload for the message. If
  /// specified, this value overrides all other values for the message.
  final String? rawContent;

  /// A map of the message variables to merge with the variables specified by
  /// properties of the DefaultMessage object. The variables specified in this map
  /// take precedence over all other variables.
  final Map<String, List<String>>? substitutions;

  /// The message title to use instead of the default message title. This value
  /// overrides the default message title.
  final String? titleOverride;

  AddressConfiguration({
    this.bodyOverride,
    this.channelType,
    this.context,
    this.rawContent,
    this.substitutions,
    this.titleOverride,
  });

  Map<String, dynamic> toJson() {
    final bodyOverride = this.bodyOverride;
    final channelType = this.channelType;
    final context = this.context;
    final rawContent = this.rawContent;
    final substitutions = this.substitutions;
    final titleOverride = this.titleOverride;
    return {
      if (bodyOverride != null) 'BodyOverride': bodyOverride,
      if (channelType != null) 'ChannelType': channelType.toValue(),
      if (context != null) 'Context': context,
      if (rawContent != null) 'RawContent': rawContent,
      if (substitutions != null) 'Substitutions': substitutions,
      if (titleOverride != null) 'TitleOverride': titleOverride,
    };
  }
}

enum Alignment {
  left,
  center,
  right,
}

extension AlignmentValueExtension on Alignment {
  String toValue() {
    switch (this) {
      case Alignment.left:
        return 'LEFT';
      case Alignment.center:
        return 'CENTER';
      case Alignment.right:
        return 'RIGHT';
    }
  }
}

extension AlignmentFromString on String {
  Alignment toAlignment() {
    switch (this) {
      case 'LEFT':
        return Alignment.left;
      case 'CENTER':
        return Alignment.center;
      case 'RIGHT':
        return Alignment.right;
    }
    throw Exception('$this is not known in enum Alignment');
  }
}

/// Specifies channel-specific content and settings for a message template that
/// can be used in push notifications that are sent through the ADM (Amazon
/// Device Messaging), Baidu (Baidu Cloud Push), or GCM (Firebase Cloud
/// Messaging, formerly Google Cloud Messaging) channel.
class AndroidPushNotificationTemplate {
  /// The action to occur if a recipient taps a push notification that's based on
  /// the message template. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// OPEN_APP - Your app opens or it becomes the foreground app if it was sent to
  /// the background. This is the default action.
  /// </li>
  /// <li>
  /// DEEP_LINK - Your app opens and displays a designated user interface in the
  /// app. This action uses the deep-linking features of the Android platform.
  /// </li>
  /// <li>
  /// URL - The default mobile browser on the recipient's device opens and loads
  /// the web page at a URL that you specify.
  /// </li>
  /// </ul>
  final Action? action;

  /// The message body to use in a push notification that's based on the message
  /// template.
  final String? body;

  /// The URL of the large icon image to display in the content view of a push
  /// notification that's based on the message template.
  final String? imageIconUrl;

  /// The URL of an image to display in a push notification that's based on the
  /// message template.
  final String? imageUrl;

  /// The raw, JSON-formatted string to use as the payload for a push notification
  /// that's based on the message template. If specified, this value overrides all
  /// other content for the message template.
  final String? rawContent;

  /// The URL of the small icon image to display in the status bar and the content
  /// view of a push notification that's based on the message template.
  final String? smallImageIconUrl;

  /// The sound to play when a recipient receives a push notification that's based
  /// on the message template. You can use the default stream or specify the file
  /// name of a sound resource that's bundled in your app. On an Android platform,
  /// the sound file must reside in /res/raw/.
  final String? sound;

  /// The title to use in a push notification that's based on the message
  /// template. This title appears above the notification message on a recipient's
  /// device.
  final String? title;

  /// The URL to open in a recipient's default mobile browser, if a recipient taps
  /// a push notification that's based on the message template and the value of
  /// the Action property is URL.
  final String? url;

  AndroidPushNotificationTemplate({
    this.action,
    this.body,
    this.imageIconUrl,
    this.imageUrl,
    this.rawContent,
    this.smallImageIconUrl,
    this.sound,
    this.title,
    this.url,
  });

  factory AndroidPushNotificationTemplate.fromJson(Map<String, dynamic> json) {
    return AndroidPushNotificationTemplate(
      action: (json['Action'] as String?)?.toAction(),
      body: json['Body'] as String?,
      imageIconUrl: json['ImageIconUrl'] as String?,
      imageUrl: json['ImageUrl'] as String?,
      rawContent: json['RawContent'] as String?,
      smallImageIconUrl: json['SmallImageIconUrl'] as String?,
      sound: json['Sound'] as String?,
      title: json['Title'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final body = this.body;
    final imageIconUrl = this.imageIconUrl;
    final imageUrl = this.imageUrl;
    final rawContent = this.rawContent;
    final smallImageIconUrl = this.smallImageIconUrl;
    final sound = this.sound;
    final title = this.title;
    final url = this.url;
    return {
      if (action != null) 'Action': action.toValue(),
      if (body != null) 'Body': body,
      if (imageIconUrl != null) 'ImageIconUrl': imageIconUrl,
      if (imageUrl != null) 'ImageUrl': imageUrl,
      if (rawContent != null) 'RawContent': rawContent,
      if (smallImageIconUrl != null) 'SmallImageIconUrl': smallImageIconUrl,
      if (sound != null) 'Sound': sound,
      if (title != null) 'Title': title,
      if (url != null) 'Url': url,
    };
  }
}

/// Provides the results of a query that retrieved the data for a standard
/// metric that applies to an application, and provides information about that
/// query.
class ApplicationDateRangeKpiResponse {
  /// The unique identifier for the application that the metric applies to.
  final String applicationId;

  /// The last date and time of the date range that was used to filter the query
  /// results, in extended ISO 8601 format. The date range is inclusive.
  final DateTime endTime;

  /// The name of the metric, also referred to as a <i>key performance indicator
  /// (KPI)</i>, that the data was retrieved for. This value describes the
  /// associated metric and consists of two or more terms, which are comprised of
  /// lowercase alphanumeric characters, separated by a hyphen. For a list of
  /// possible values, see the <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/analytics-standard-metrics.html">Amazon
  /// Pinpoint Developer Guide</a>.
  final String kpiName;

  /// An array of objects that contains the results of the query. Each object
  /// contains the value for the metric and metadata about that value.
  final BaseKpiResult kpiResult;

  /// The first date and time of the date range that was used to filter the query
  /// results, in extended ISO 8601 format. The date range is inclusive.
  final DateTime startTime;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null for the Application Metrics
  /// resource because the resource returns all results in a single page.
  final String? nextToken;

  ApplicationDateRangeKpiResponse({
    required this.applicationId,
    required this.endTime,
    required this.kpiName,
    required this.kpiResult,
    required this.startTime,
    this.nextToken,
  });

  factory ApplicationDateRangeKpiResponse.fromJson(Map<String, dynamic> json) {
    return ApplicationDateRangeKpiResponse(
      applicationId: json['ApplicationId'] as String,
      endTime: nonNullableTimeStampFromJson(json['EndTime'] as Object),
      kpiName: json['KpiName'] as String,
      kpiResult:
          BaseKpiResult.fromJson(json['KpiResult'] as Map<String, dynamic>),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] as Object),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final endTime = this.endTime;
    final kpiName = this.kpiName;
    final kpiResult = this.kpiResult;
    final startTime = this.startTime;
    final nextToken = this.nextToken;
    return {
      'ApplicationId': applicationId,
      'EndTime': iso8601ToJson(endTime),
      'KpiName': kpiName,
      'KpiResult': kpiResult,
      'StartTime': iso8601ToJson(startTime),
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Provides information about an application.
class ApplicationResponse {
  /// The Amazon Resource Name (ARN) of the application.
  final String arn;

  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  final String id;

  /// The display name of the application. This name is displayed as the
  /// <b>Project name</b> on the Amazon Pinpoint console.
  final String name;

  /// The date and time when the Application was created.
  final String? creationDate;

  /// A string-to-string map of key-value pairs that identifies the tags that are
  /// associated with the application. Each tag consists of a required tag key and
  /// an associated tag value.
  final Map<String, String>? tags;

  ApplicationResponse({
    required this.arn,
    required this.id,
    required this.name,
    this.creationDate,
    this.tags,
  });

  factory ApplicationResponse.fromJson(Map<String, dynamic> json) {
    return ApplicationResponse(
      arn: json['Arn'] as String,
      id: json['Id'] as String,
      name: json['Name'] as String,
      creationDate: json['CreationDate'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final creationDate = this.creationDate;
    final tags = this.tags;
    return {
      'Arn': arn,
      'Id': id,
      'Name': name,
      if (creationDate != null) 'CreationDate': creationDate,
      if (tags != null) 'tags': tags,
    };
  }
}

/// The default sending limits for journeys in the application. To override
/// these limits and define custom limits for a specific journey, use the
/// Journey resource.
class ApplicationSettingsJourneyLimits {
  /// The daily number of messages that an endpoint can receive from all journeys.
  /// The maximum value is 100. If set to 0, this limit will not apply.
  final int? dailyCap;

  /// The default maximum number of messages that can be sent to an endpoint
  /// during the specified timeframe for all journeys.
  final JourneyTimeframeCap? timeframeCap;

  /// The default maximum number of messages that a single journey can sent to a
  /// single endpoint. The maximum value is 100. If set to 0, this limit will not
  /// apply.
  final int? totalCap;

  ApplicationSettingsJourneyLimits({
    this.dailyCap,
    this.timeframeCap,
    this.totalCap,
  });

  factory ApplicationSettingsJourneyLimits.fromJson(Map<String, dynamic> json) {
    return ApplicationSettingsJourneyLimits(
      dailyCap: json['DailyCap'] as int?,
      timeframeCap: json['TimeframeCap'] != null
          ? JourneyTimeframeCap.fromJson(
              json['TimeframeCap'] as Map<String, dynamic>)
          : null,
      totalCap: json['TotalCap'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dailyCap = this.dailyCap;
    final timeframeCap = this.timeframeCap;
    final totalCap = this.totalCap;
    return {
      if (dailyCap != null) 'DailyCap': dailyCap,
      if (timeframeCap != null) 'TimeframeCap': timeframeCap,
      if (totalCap != null) 'TotalCap': totalCap,
    };
  }
}

/// Provides information about an application, including the default settings
/// for an application.
class ApplicationSettingsResource {
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  final String applicationId;

  /// The settings for the AWS Lambda function to invoke by default as a code hook
  /// for campaigns in the application. You can use this hook to customize
  /// segments that are used by campaigns in the application.
  final CampaignHook? campaignHook;

  /// The default sending limits for journeys in the application. These limits
  /// apply to each journey for the application but can be overridden, on a per
  /// journey basis, with the JourneyLimits resource.
  final ApplicationSettingsJourneyLimits? journeyLimits;

  /// The date and time, in ISO 8601 format, when the application's settings were
  /// last modified.
  final String? lastModifiedDate;

  /// The default sending limits for campaigns in the application.
  final CampaignLimits? limits;

  /// The default quiet time for campaigns in the application. Quiet time is a
  /// specific time range when messages aren't sent to endpoints, if all the
  /// following conditions are met:
  ///
  /// <ul>
  /// <li>
  /// The EndpointDemographic.Timezone property of the endpoint is set to a valid
  /// value.
  /// </li>
  /// <li>
  /// The current time in the endpoint's time zone is later than or equal to the
  /// time specified by the QuietTime.Start property for the application (or a
  /// campaign or journey that has custom quiet time settings).
  /// </li>
  /// <li>
  /// The current time in the endpoint's time zone is earlier than or equal to the
  /// time specified by the QuietTime.End property for the application (or a
  /// campaign or journey that has custom quiet time settings).
  /// </li>
  /// </ul>
  /// If any of the preceding conditions isn't met, the endpoint will receive
  /// messages from a campaign or journey, even if quiet time is enabled.
  final QuietTime? quietTime;

  ApplicationSettingsResource({
    required this.applicationId,
    this.campaignHook,
    this.journeyLimits,
    this.lastModifiedDate,
    this.limits,
    this.quietTime,
  });

  factory ApplicationSettingsResource.fromJson(Map<String, dynamic> json) {
    return ApplicationSettingsResource(
      applicationId: json['ApplicationId'] as String,
      campaignHook: json['CampaignHook'] != null
          ? CampaignHook.fromJson(json['CampaignHook'] as Map<String, dynamic>)
          : null,
      journeyLimits: json['JourneyLimits'] != null
          ? ApplicationSettingsJourneyLimits.fromJson(
              json['JourneyLimits'] as Map<String, dynamic>)
          : null,
      lastModifiedDate: json['LastModifiedDate'] as String?,
      limits: json['Limits'] != null
          ? CampaignLimits.fromJson(json['Limits'] as Map<String, dynamic>)
          : null,
      quietTime: json['QuietTime'] != null
          ? QuietTime.fromJson(json['QuietTime'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final campaignHook = this.campaignHook;
    final journeyLimits = this.journeyLimits;
    final lastModifiedDate = this.lastModifiedDate;
    final limits = this.limits;
    final quietTime = this.quietTime;
    return {
      'ApplicationId': applicationId,
      if (campaignHook != null) 'CampaignHook': campaignHook,
      if (journeyLimits != null) 'JourneyLimits': journeyLimits,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (limits != null) 'Limits': limits,
      if (quietTime != null) 'QuietTime': quietTime,
    };
  }
}

/// Provides information about all of your applications.
class ApplicationsResponse {
  /// An array of responses, one for each application that was returned.
  final List<ApplicationResponse>? item;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  ApplicationsResponse({
    this.item,
    this.nextToken,
  });

  factory ApplicationsResponse.fromJson(Map<String, dynamic> json) {
    return ApplicationsResponse(
      item: (json['Item'] as List?)
          ?.whereNotNull()
          .map((e) => ApplicationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final item = this.item;
    final nextToken = this.nextToken;
    return {
      if (item != null) 'Item': item,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Specifies attribute-based criteria for including or excluding endpoints from
/// a segment.
class AttributeDimension {
  /// The criteria values to use for the segment dimension. Depending on the value
  /// of the AttributeType property, endpoints are included or excluded from the
  /// segment if their attribute values match the criteria values.
  final List<String> values;

  /// The type of segment dimension to use. Valid values are:
  /// <ul>
  /// <li>INCLUSIVE - endpoints that have attributes matching the values are
  /// included in the segment.</li>
  /// <li>EXCLUSIVE - endpoints that have attributes matching the values are
  /// excluded in the segment.</li>
  /// <li>CONTAINS - endpoints that have attributes' substrings match the values
  /// are included in the segment.</li>
  /// <li>BEFORE - endpoints with attributes read as ISO_INSTANT datetimes before
  /// the value are included in the segment.</li>
  /// <li>AFTER - endpoints with attributes read as ISO_INSTANT datetimes after
  /// the value are included in the segment.</li>
  /// <li>ON - endpoints with attributes read as ISO_INSTANT dates on the value
  /// are included in the segment. Time is ignored in this comparison.</li>
  /// <li>BETWEEN - endpoints with attributes read as ISO_INSTANT datetimes
  /// between the values are included in the segment.</li>
  final AttributeType? attributeType;

  AttributeDimension({
    required this.values,
    this.attributeType,
  });

  factory AttributeDimension.fromJson(Map<String, dynamic> json) {
    return AttributeDimension(
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      attributeType: (json['AttributeType'] as String?)?.toAttributeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final values = this.values;
    final attributeType = this.attributeType;
    return {
      'Values': values,
      if (attributeType != null) 'AttributeType': attributeType.toValue(),
    };
  }
}

enum AttributeType {
  inclusive,
  exclusive,
  contains,
  before,
  after,
  on,
  between,
}

extension AttributeTypeValueExtension on AttributeType {
  String toValue() {
    switch (this) {
      case AttributeType.inclusive:
        return 'INCLUSIVE';
      case AttributeType.exclusive:
        return 'EXCLUSIVE';
      case AttributeType.contains:
        return 'CONTAINS';
      case AttributeType.before:
        return 'BEFORE';
      case AttributeType.after:
        return 'AFTER';
      case AttributeType.on:
        return 'ON';
      case AttributeType.between:
        return 'BETWEEN';
    }
  }
}

extension AttributeTypeFromString on String {
  AttributeType toAttributeType() {
    switch (this) {
      case 'INCLUSIVE':
        return AttributeType.inclusive;
      case 'EXCLUSIVE':
        return AttributeType.exclusive;
      case 'CONTAINS':
        return AttributeType.contains;
      case 'BEFORE':
        return AttributeType.before;
      case 'AFTER':
        return AttributeType.after;
      case 'ON':
        return AttributeType.on;
      case 'BETWEEN':
        return AttributeType.between;
    }
    throw Exception('$this is not known in enum AttributeType');
  }
}

/// Provides information about the type and the names of attributes that were
/// removed from all the endpoints that are associated with an application.
class AttributesResource {
  /// The unique identifier for the application.
  final String applicationId;

  /// The type of attribute or attributes that were removed from the endpoints.
  /// Valid values are:
  ///
  /// <ul>
  /// <li>
  /// endpoint-custom-attributes - Custom attributes that describe endpoints.
  /// </li>
  /// <li>
  /// endpoint-metric-attributes - Custom metrics that your app reports to Amazon
  /// Pinpoint for endpoints.
  /// </li>
  /// <li>
  /// endpoint-user-attributes - Custom attributes that describe users.
  /// </li>
  /// </ul>
  final String attributeType;

  /// An array that specifies the names of the attributes that were removed from
  /// the endpoints.
  final List<String>? attributes;

  AttributesResource({
    required this.applicationId,
    required this.attributeType,
    this.attributes,
  });

  factory AttributesResource.fromJson(Map<String, dynamic> json) {
    return AttributesResource(
      applicationId: json['ApplicationId'] as String,
      attributeType: json['AttributeType'] as String,
      attributes: (json['Attributes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final attributeType = this.attributeType;
    final attributes = this.attributes;
    return {
      'ApplicationId': applicationId,
      'AttributeType': attributeType,
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

/// Specifies the status and settings of the Baidu (Baidu Cloud Push) channel
/// for an application.
class BaiduChannelRequest {
  /// The API key that you received from the Baidu Cloud Push service to
  /// communicate with the service.
  final String apiKey;

  /// The secret key that you received from the Baidu Cloud Push service to
  /// communicate with the service.
  final String secretKey;

  /// Specifies whether to enable the Baidu channel for the application.
  final bool? enabled;

  BaiduChannelRequest({
    required this.apiKey,
    required this.secretKey,
    this.enabled,
  });

  Map<String, dynamic> toJson() {
    final apiKey = this.apiKey;
    final secretKey = this.secretKey;
    final enabled = this.enabled;
    return {
      'ApiKey': apiKey,
      'SecretKey': secretKey,
      if (enabled != null) 'Enabled': enabled,
    };
  }
}

/// Provides information about the status and settings of the Baidu (Baidu Cloud
/// Push) channel for an application.
class BaiduChannelResponse {
  /// The API key that you received from the Baidu Cloud Push service to
  /// communicate with the service.
  final String credential;

  /// The type of messaging or notification platform for the channel. For the
  /// Baidu channel, this value is BAIDU.
  final String platform;

  /// The unique identifier for the application that the Baidu channel applies to.
  final String? applicationId;

  /// The date and time when the Baidu channel was enabled.
  final String? creationDate;

  /// Specifies whether the Baidu channel is enabled for the application.
  final bool? enabled;

  /// (Not used) This property is retained only for backward compatibility.
  final bool? hasCredential;

  /// (Deprecated) An identifier for the Baidu channel. This property is retained
  /// only for backward compatibility.
  final String? id;

  /// Specifies whether the Baidu channel is archived.
  final bool? isArchived;

  /// The user who last modified the Baidu channel.
  final String? lastModifiedBy;

  /// The date and time when the Baidu channel was last modified.
  final String? lastModifiedDate;

  /// The current version of the Baidu channel.
  final int? version;

  BaiduChannelResponse({
    required this.credential,
    required this.platform,
    this.applicationId,
    this.creationDate,
    this.enabled,
    this.hasCredential,
    this.id,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.version,
  });

  factory BaiduChannelResponse.fromJson(Map<String, dynamic> json) {
    return BaiduChannelResponse(
      credential: json['Credential'] as String,
      platform: json['Platform'] as String,
      applicationId: json['ApplicationId'] as String?,
      creationDate: json['CreationDate'] as String?,
      enabled: json['Enabled'] as bool?,
      hasCredential: json['HasCredential'] as bool?,
      id: json['Id'] as String?,
      isArchived: json['IsArchived'] as bool?,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: json['LastModifiedDate'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final credential = this.credential;
    final platform = this.platform;
    final applicationId = this.applicationId;
    final creationDate = this.creationDate;
    final enabled = this.enabled;
    final hasCredential = this.hasCredential;
    final id = this.id;
    final isArchived = this.isArchived;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final version = this.version;
    return {
      'Credential': credential,
      'Platform': platform,
      if (applicationId != null) 'ApplicationId': applicationId,
      if (creationDate != null) 'CreationDate': creationDate,
      if (enabled != null) 'Enabled': enabled,
      if (hasCredential != null) 'HasCredential': hasCredential,
      if (id != null) 'Id': id,
      if (isArchived != null) 'IsArchived': isArchived,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (version != null) 'Version': version,
    };
  }
}

/// Specifies the settings for a one-time message that's sent directly to an
/// endpoint through the Baidu (Baidu Cloud Push) channel.
class BaiduMessage {
  /// The action to occur if the recipient taps the push notification. Valid
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// OPEN_APP - Your app opens or it becomes the foreground app if it was sent to
  /// the background. This is the default action.
  /// </li>
  /// <li>
  /// DEEP_LINK - Your app opens and displays a designated user interface in the
  /// app. This action uses the deep-linking features of the Android platform.
  /// </li>
  /// <li>
  /// URL - The default mobile browser on the recipient's device opens and loads
  /// the web page at a URL that you specify.
  /// </li>
  /// </ul>
  final Action? action;

  /// The body of the notification message.
  final String? body;

  /// The JSON data payload to use for the push notification, if the notification
  /// is a silent push notification. This payload is added to the
  /// data.pinpoint.jsonBody object of the notification.
  final Map<String, String>? data;

  /// The icon image name of the asset saved in your app.
  final String? iconReference;

  /// The URL of the large icon image to display in the content view of the push
  /// notification.
  final String? imageIconUrl;

  /// The URL of an image to display in the push notification.
  final String? imageUrl;

  /// The raw, JSON-formatted string to use as the payload for the notification
  /// message. If specified, this value overrides all other content for the
  /// message.
  final String? rawContent;

  /// Specifies whether the notification is a silent push notification, which is a
  /// push notification that doesn't display on a recipient's device. Silent push
  /// notifications can be used for cases such as updating an app's configuration
  /// or supporting phone home functionality.
  final bool? silentPush;

  /// The URL of the small icon image to display in the status bar and the content
  /// view of the push notification.
  final String? smallImageIconUrl;

  /// The sound to play when the recipient receives the push notification. You can
  /// use the default stream or specify the file name of a sound resource that's
  /// bundled in your app. On an Android platform, the sound file must reside in
  /// /res/raw/.
  final String? sound;

  /// The default message variables to use in the notification message. You can
  /// override the default variables with individual address variables.
  final Map<String, List<String>>? substitutions;

  /// The amount of time, in seconds, that the Baidu Cloud Push service should
  /// store the message if the recipient's device is offline. The default value
  /// and maximum supported time is 604,800 seconds (7 days).
  final int? timeToLive;

  /// The title to display above the notification message on the recipient's
  /// device.
  final String? title;

  /// The URL to open in the recipient's default mobile browser, if a recipient
  /// taps the push notification and the value of the Action property is URL.
  final String? url;

  BaiduMessage({
    this.action,
    this.body,
    this.data,
    this.iconReference,
    this.imageIconUrl,
    this.imageUrl,
    this.rawContent,
    this.silentPush,
    this.smallImageIconUrl,
    this.sound,
    this.substitutions,
    this.timeToLive,
    this.title,
    this.url,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final body = this.body;
    final data = this.data;
    final iconReference = this.iconReference;
    final imageIconUrl = this.imageIconUrl;
    final imageUrl = this.imageUrl;
    final rawContent = this.rawContent;
    final silentPush = this.silentPush;
    final smallImageIconUrl = this.smallImageIconUrl;
    final sound = this.sound;
    final substitutions = this.substitutions;
    final timeToLive = this.timeToLive;
    final title = this.title;
    final url = this.url;
    return {
      if (action != null) 'Action': action.toValue(),
      if (body != null) 'Body': body,
      if (data != null) 'Data': data,
      if (iconReference != null) 'IconReference': iconReference,
      if (imageIconUrl != null) 'ImageIconUrl': imageIconUrl,
      if (imageUrl != null) 'ImageUrl': imageUrl,
      if (rawContent != null) 'RawContent': rawContent,
      if (silentPush != null) 'SilentPush': silentPush,
      if (smallImageIconUrl != null) 'SmallImageIconUrl': smallImageIconUrl,
      if (sound != null) 'Sound': sound,
      if (substitutions != null) 'Substitutions': substitutions,
      if (timeToLive != null) 'TimeToLive': timeToLive,
      if (title != null) 'Title': title,
      if (url != null) 'Url': url,
    };
  }
}

/// Provides the results of a query that retrieved the data for a standard
/// metric that applies to an application, campaign, or journey.
class BaseKpiResult {
  /// An array of objects that provides the results of a query that retrieved the
  /// data for a standard metric that applies to an application, campaign, or
  /// journey.
  final List<ResultRow> rows;

  BaseKpiResult({
    required this.rows,
  });

  factory BaseKpiResult.fromJson(Map<String, dynamic> json) {
    return BaseKpiResult(
      rows: (json['Rows'] as List)
          .whereNotNull()
          .map((e) => ResultRow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rows = this.rows;
    return {
      'Rows': rows,
    };
  }
}

enum ButtonAction {
  link,
  deepLink,
  close,
}

extension ButtonActionValueExtension on ButtonAction {
  String toValue() {
    switch (this) {
      case ButtonAction.link:
        return 'LINK';
      case ButtonAction.deepLink:
        return 'DEEP_LINK';
      case ButtonAction.close:
        return 'CLOSE';
    }
  }
}

extension ButtonActionFromString on String {
  ButtonAction toButtonAction() {
    switch (this) {
      case 'LINK':
        return ButtonAction.link;
      case 'DEEP_LINK':
        return ButtonAction.deepLink;
      case 'CLOSE':
        return ButtonAction.close;
    }
    throw Exception('$this is not known in enum ButtonAction');
  }
}

/// Specifies the contents of a message that's sent through a custom channel to
/// recipients of a campaign.
class CampaignCustomMessage {
  /// The raw, JSON-formatted string to use as the payload for the message. The
  /// maximum size is 5 KB.
  final String? data;

  CampaignCustomMessage({
    this.data,
  });

  factory CampaignCustomMessage.fromJson(Map<String, dynamic> json) {
    return CampaignCustomMessage(
      data: json['Data'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    return {
      if (data != null) 'Data': data,
    };
  }
}

/// Provides the results of a query that retrieved the data for a standard
/// metric that applies to a campaign, and provides information about that
/// query.
class CampaignDateRangeKpiResponse {
  /// The unique identifier for the application that the metric applies to.
  final String applicationId;

  /// The unique identifier for the campaign that the metric applies to.
  final String campaignId;

  /// The last date and time of the date range that was used to filter the query
  /// results, in extended ISO 8601 format. The date range is inclusive.
  final DateTime endTime;

  /// The name of the metric, also referred to as a <i>key performance indicator
  /// (KPI)</i>, that the data was retrieved for. This value describes the
  /// associated metric and consists of two or more terms, which are comprised of
  /// lowercase alphanumeric characters, separated by a hyphen. For a list of
  /// possible values, see the <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/analytics-standard-metrics.html">Amazon
  /// Pinpoint Developer Guide</a>.
  final String kpiName;

  /// An array of objects that contains the results of the query. Each object
  /// contains the value for the metric and metadata about that value.
  final BaseKpiResult kpiResult;

  /// The first date and time of the date range that was used to filter the query
  /// results, in extended ISO 8601 format. The date range is inclusive.
  final DateTime startTime;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null for the Campaign Metrics resource
  /// because the resource returns all results in a single page.
  final String? nextToken;

  CampaignDateRangeKpiResponse({
    required this.applicationId,
    required this.campaignId,
    required this.endTime,
    required this.kpiName,
    required this.kpiResult,
    required this.startTime,
    this.nextToken,
  });

  factory CampaignDateRangeKpiResponse.fromJson(Map<String, dynamic> json) {
    return CampaignDateRangeKpiResponse(
      applicationId: json['ApplicationId'] as String,
      campaignId: json['CampaignId'] as String,
      endTime: nonNullableTimeStampFromJson(json['EndTime'] as Object),
      kpiName: json['KpiName'] as String,
      kpiResult:
          BaseKpiResult.fromJson(json['KpiResult'] as Map<String, dynamic>),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] as Object),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final campaignId = this.campaignId;
    final endTime = this.endTime;
    final kpiName = this.kpiName;
    final kpiResult = this.kpiResult;
    final startTime = this.startTime;
    final nextToken = this.nextToken;
    return {
      'ApplicationId': applicationId,
      'CampaignId': campaignId,
      'EndTime': iso8601ToJson(endTime),
      'KpiName': kpiName,
      'KpiResult': kpiResult,
      'StartTime': iso8601ToJson(startTime),
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Specifies the content and "From" address for an email message that's sent to
/// recipients of a campaign.
class CampaignEmailMessage {
  /// The body of the email for recipients whose email clients don't render HTML
  /// content.
  final String? body;

  /// The verified email address to send the email from. The default address is
  /// the FromAddress specified for the email channel for the application.
  final String? fromAddress;

  /// The list of <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-campaigns-campaign-id.html#apps-application-id-campaigns-campaign-id-model-messageheader">MessageHeaders</a>
  /// for the email. You can have up to 15 MessageHeaders for each email.
  final List<MessageHeader>? headers;

  /// The body of the email, in HTML format, for recipients whose email clients
  /// render HTML content.
  final String? htmlBody;

  /// The subject line, or title, of the email.
  final String? title;

  CampaignEmailMessage({
    this.body,
    this.fromAddress,
    this.headers,
    this.htmlBody,
    this.title,
  });

  factory CampaignEmailMessage.fromJson(Map<String, dynamic> json) {
    return CampaignEmailMessage(
      body: json['Body'] as String?,
      fromAddress: json['FromAddress'] as String?,
      headers: (json['Headers'] as List?)
          ?.whereNotNull()
          .map((e) => MessageHeader.fromJson(e as Map<String, dynamic>))
          .toList(),
      htmlBody: json['HtmlBody'] as String?,
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final body = this.body;
    final fromAddress = this.fromAddress;
    final headers = this.headers;
    final htmlBody = this.htmlBody;
    final title = this.title;
    return {
      if (body != null) 'Body': body,
      if (fromAddress != null) 'FromAddress': fromAddress,
      if (headers != null) 'Headers': headers,
      if (htmlBody != null) 'HtmlBody': htmlBody,
      if (title != null) 'Title': title,
    };
  }
}

/// Specifies the settings for events that cause a campaign to be sent.
class CampaignEventFilter {
  /// The dimension settings of the event filter for the campaign.
  final EventDimensions dimensions;

  /// The type of event that causes the campaign to be sent. Valid values are:
  /// SYSTEM, sends the campaign when a system event occurs; and, ENDPOINT, sends
  /// the campaign when an endpoint event (<link
  /// linkend="apps-application-id-events">Events</link> resource) occurs.
  final FilterType filterType;

  CampaignEventFilter({
    required this.dimensions,
    required this.filterType,
  });

  factory CampaignEventFilter.fromJson(Map<String, dynamic> json) {
    return CampaignEventFilter(
      dimensions:
          EventDimensions.fromJson(json['Dimensions'] as Map<String, dynamic>),
      filterType: (json['FilterType'] as String).toFilterType(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final filterType = this.filterType;
    return {
      'Dimensions': dimensions,
      'FilterType': filterType.toValue(),
    };
  }
}

/// Specifies settings for invoking an AWS Lambda function that customizes a
/// segment for a campaign.
class CampaignHook {
  /// The name or Amazon Resource Name (ARN) of the AWS Lambda function that
  /// Amazon Pinpoint invokes to customize a segment for a campaign.
  final String? lambdaFunctionName;

  /// The mode that Amazon Pinpoint uses to invoke the AWS Lambda function.
  /// Possible values are:
  ///
  /// <ul>
  /// <li>
  /// FILTER - Invoke the function to customize the segment that's used by a
  /// campaign.
  /// </li>
  /// <li>
  /// DELIVERY - (Deprecated) Previously, invoked the function to send a campaign
  /// through a custom channel. This functionality is not supported anymore. To
  /// send a campaign through a custom channel, use the
  /// CustomDeliveryConfiguration and CampaignCustomMessage objects of the
  /// campaign.
  /// </li>
  /// </ul>
  final Mode? mode;

  /// The web URL that Amazon Pinpoint calls to invoke the AWS Lambda function
  /// over HTTPS.
  final String? webUrl;

  CampaignHook({
    this.lambdaFunctionName,
    this.mode,
    this.webUrl,
  });

  factory CampaignHook.fromJson(Map<String, dynamic> json) {
    return CampaignHook(
      lambdaFunctionName: json['LambdaFunctionName'] as String?,
      mode: (json['Mode'] as String?)?.toMode(),
      webUrl: json['WebUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaFunctionName = this.lambdaFunctionName;
    final mode = this.mode;
    final webUrl = this.webUrl;
    return {
      if (lambdaFunctionName != null) 'LambdaFunctionName': lambdaFunctionName,
      if (mode != null) 'Mode': mode.toValue(),
      if (webUrl != null) 'WebUrl': webUrl,
    };
  }
}

/// In-app message configuration.
class CampaignInAppMessage {
  /// The message body of the notification, the email body or the text message.
  final String? body;

  /// In-app message content.
  final List<InAppMessageContent>? content;

  /// Custom config to be sent to client.
  final Map<String, String>? customConfig;

  /// In-app message layout.
  final Layout? layout;

  CampaignInAppMessage({
    this.body,
    this.content,
    this.customConfig,
    this.layout,
  });

  factory CampaignInAppMessage.fromJson(Map<String, dynamic> json) {
    return CampaignInAppMessage(
      body: json['Body'] as String?,
      content: (json['Content'] as List?)
          ?.whereNotNull()
          .map((e) => InAppMessageContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      customConfig: (json['CustomConfig'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      layout: (json['Layout'] as String?)?.toLayout(),
    );
  }

  Map<String, dynamic> toJson() {
    final body = this.body;
    final content = this.content;
    final customConfig = this.customConfig;
    final layout = this.layout;
    return {
      if (body != null) 'Body': body,
      if (content != null) 'Content': content,
      if (customConfig != null) 'CustomConfig': customConfig,
      if (layout != null) 'Layout': layout.toValue(),
    };
  }
}

/// For a campaign, specifies limits on the messages that the campaign can send.
/// For an application, specifies the default limits for messages that campaigns
/// in the application can send.
class CampaignLimits {
  /// The maximum number of messages that a campaign can send to a single endpoint
  /// during a 24-hour period. For an application, this value specifies the
  /// default limit for the number of messages that campaigns and journeys can
  /// send to a single endpoint during a 24-hour period. The maximum value is 100.
  final int? daily;

  /// The maximum amount of time, in seconds, that a campaign can attempt to
  /// deliver a message after the scheduled start time for the campaign. The
  /// minimum value is 60 seconds.
  final int? maximumDuration;

  /// The maximum number of messages that a campaign can send each second. For an
  /// application, this value specifies the default limit for the number of
  /// messages that campaigns can send each second. The minimum value is 1. The
  /// maximum value is 20,000.
  final int? messagesPerSecond;

  /// The maximum total number of messages that the campaign can send per user
  /// session.
  final int? session;

  /// The maximum number of messages that a campaign can send to a single endpoint
  /// during the course of the campaign. If a campaign recurs, this setting
  /// applies to all runs of the campaign. The maximum value is 100.
  final int? total;

  CampaignLimits({
    this.daily,
    this.maximumDuration,
    this.messagesPerSecond,
    this.session,
    this.total,
  });

  factory CampaignLimits.fromJson(Map<String, dynamic> json) {
    return CampaignLimits(
      daily: json['Daily'] as int?,
      maximumDuration: json['MaximumDuration'] as int?,
      messagesPerSecond: json['MessagesPerSecond'] as int?,
      session: json['Session'] as int?,
      total: json['Total'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final daily = this.daily;
    final maximumDuration = this.maximumDuration;
    final messagesPerSecond = this.messagesPerSecond;
    final session = this.session;
    final total = this.total;
    return {
      if (daily != null) 'Daily': daily,
      if (maximumDuration != null) 'MaximumDuration': maximumDuration,
      if (messagesPerSecond != null) 'MessagesPerSecond': messagesPerSecond,
      if (session != null) 'Session': session,
      if (total != null) 'Total': total,
    };
  }
}

/// Provides information about the status, configuration, and other settings for
/// a campaign.
class CampaignResponse {
  /// The unique identifier for the application that the campaign applies to.
  final String applicationId;

  /// The Amazon Resource Name (ARN) of the campaign.
  final String arn;

  /// The date, in ISO 8601 format, when the campaign was created.
  final String creationDate;

  /// The unique identifier for the campaign.
  final String id;

  /// The date, in ISO 8601 format, when the campaign was last modified.
  final String lastModifiedDate;

  /// The unique identifier for the segment that's associated with the campaign.
  final String segmentId;

  /// The version number of the segment that's associated with the campaign.
  final int segmentVersion;

  /// An array of responses, one for each treatment that you defined for the
  /// campaign, in addition to the default treatment.
  final List<TreatmentResource>? additionalTreatments;

  /// The delivery configuration settings for sending the campaign through a
  /// custom channel.
  final CustomDeliveryConfiguration? customDeliveryConfiguration;

  /// The current status of the campaign's default treatment. This value exists
  /// only for campaigns that have more than one treatment.
  final CampaignState? defaultState;

  /// The custom description of the campaign.
  final String? description;

  /// The allocated percentage of users (segment members) who shouldn't receive
  /// messages from the campaign.
  final int? holdoutPercent;

  /// The settings for the AWS Lambda function to use as a code hook for the
  /// campaign. You can use this hook to customize the segment that's used by the
  /// campaign.
  final CampaignHook? hook;

  /// Specifies whether the campaign is paused. A paused campaign doesn't run
  /// unless you resume it by changing this value to false.
  final bool? isPaused;

  /// The messaging limits for the campaign.
  final CampaignLimits? limits;

  /// The message configuration settings for the campaign.
  final MessageConfiguration? messageConfiguration;

  /// The name of the campaign.
  final String? name;

  /// Defines the priority of the campaign, used to decide the order of messages
  /// displayed to user if there are multiple messages scheduled to be displayed
  /// at the same moment.
  final int? priority;

  /// The schedule settings for the campaign.
  final Schedule? schedule;

  /// The current status of the campaign.
  final CampaignState? state;

  /// The message template that’s used for the campaign.
  final TemplateConfiguration? templateConfiguration;

  /// The custom description of the default treatment for the campaign.
  final String? treatmentDescription;

  /// The custom name of the default treatment for the campaign, if the campaign
  /// has multiple treatments. A <i>treatment</i> is a variation of a campaign
  /// that's used for A/B testing.
  final String? treatmentName;

  /// The version number of the campaign.
  final int? version;

  /// A string-to-string map of key-value pairs that identifies the tags that are
  /// associated with the campaign. Each tag consists of a required tag key and an
  /// associated tag value.
  final Map<String, String>? tags;

  CampaignResponse({
    required this.applicationId,
    required this.arn,
    required this.creationDate,
    required this.id,
    required this.lastModifiedDate,
    required this.segmentId,
    required this.segmentVersion,
    this.additionalTreatments,
    this.customDeliveryConfiguration,
    this.defaultState,
    this.description,
    this.holdoutPercent,
    this.hook,
    this.isPaused,
    this.limits,
    this.messageConfiguration,
    this.name,
    this.priority,
    this.schedule,
    this.state,
    this.templateConfiguration,
    this.treatmentDescription,
    this.treatmentName,
    this.version,
    this.tags,
  });

  factory CampaignResponse.fromJson(Map<String, dynamic> json) {
    return CampaignResponse(
      applicationId: json['ApplicationId'] as String,
      arn: json['Arn'] as String,
      creationDate: json['CreationDate'] as String,
      id: json['Id'] as String,
      lastModifiedDate: json['LastModifiedDate'] as String,
      segmentId: json['SegmentId'] as String,
      segmentVersion: json['SegmentVersion'] as int,
      additionalTreatments: (json['AdditionalTreatments'] as List?)
          ?.whereNotNull()
          .map((e) => TreatmentResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      customDeliveryConfiguration: json['CustomDeliveryConfiguration'] != null
          ? CustomDeliveryConfiguration.fromJson(
              json['CustomDeliveryConfiguration'] as Map<String, dynamic>)
          : null,
      defaultState: json['DefaultState'] != null
          ? CampaignState.fromJson(json['DefaultState'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      holdoutPercent: json['HoldoutPercent'] as int?,
      hook: json['Hook'] != null
          ? CampaignHook.fromJson(json['Hook'] as Map<String, dynamic>)
          : null,
      isPaused: json['IsPaused'] as bool?,
      limits: json['Limits'] != null
          ? CampaignLimits.fromJson(json['Limits'] as Map<String, dynamic>)
          : null,
      messageConfiguration: json['MessageConfiguration'] != null
          ? MessageConfiguration.fromJson(
              json['MessageConfiguration'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      priority: json['Priority'] as int?,
      schedule: json['Schedule'] != null
          ? Schedule.fromJson(json['Schedule'] as Map<String, dynamic>)
          : null,
      state: json['State'] != null
          ? CampaignState.fromJson(json['State'] as Map<String, dynamic>)
          : null,
      templateConfiguration: json['TemplateConfiguration'] != null
          ? TemplateConfiguration.fromJson(
              json['TemplateConfiguration'] as Map<String, dynamic>)
          : null,
      treatmentDescription: json['TreatmentDescription'] as String?,
      treatmentName: json['TreatmentName'] as String?,
      version: json['Version'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final creationDate = this.creationDate;
    final id = this.id;
    final lastModifiedDate = this.lastModifiedDate;
    final segmentId = this.segmentId;
    final segmentVersion = this.segmentVersion;
    final additionalTreatments = this.additionalTreatments;
    final customDeliveryConfiguration = this.customDeliveryConfiguration;
    final defaultState = this.defaultState;
    final description = this.description;
    final holdoutPercent = this.holdoutPercent;
    final hook = this.hook;
    final isPaused = this.isPaused;
    final limits = this.limits;
    final messageConfiguration = this.messageConfiguration;
    final name = this.name;
    final priority = this.priority;
    final schedule = this.schedule;
    final state = this.state;
    final templateConfiguration = this.templateConfiguration;
    final treatmentDescription = this.treatmentDescription;
    final treatmentName = this.treatmentName;
    final version = this.version;
    final tags = this.tags;
    return {
      'ApplicationId': applicationId,
      'Arn': arn,
      'CreationDate': creationDate,
      'Id': id,
      'LastModifiedDate': lastModifiedDate,
      'SegmentId': segmentId,
      'SegmentVersion': segmentVersion,
      if (additionalTreatments != null)
        'AdditionalTreatments': additionalTreatments,
      if (customDeliveryConfiguration != null)
        'CustomDeliveryConfiguration': customDeliveryConfiguration,
      if (defaultState != null) 'DefaultState': defaultState,
      if (description != null) 'Description': description,
      if (holdoutPercent != null) 'HoldoutPercent': holdoutPercent,
      if (hook != null) 'Hook': hook,
      if (isPaused != null) 'IsPaused': isPaused,
      if (limits != null) 'Limits': limits,
      if (messageConfiguration != null)
        'MessageConfiguration': messageConfiguration,
      if (name != null) 'Name': name,
      if (priority != null) 'Priority': priority,
      if (schedule != null) 'Schedule': schedule,
      if (state != null) 'State': state,
      if (templateConfiguration != null)
        'TemplateConfiguration': templateConfiguration,
      if (treatmentDescription != null)
        'TreatmentDescription': treatmentDescription,
      if (treatmentName != null) 'TreatmentName': treatmentName,
      if (version != null) 'Version': version,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Specifies the content and settings for an SMS message that's sent to
/// recipients of a campaign.
class CampaignSmsMessage {
  /// The body of the SMS message.
  final String? body;

  /// The entity ID or Principal Entity (PE) id received from the regulatory body
  /// for sending SMS in your country.
  final String? entityId;

  /// The SMS message type. Valid values are TRANSACTIONAL (for messages that are
  /// critical or time-sensitive, such as a one-time passwords) and PROMOTIONAL
  /// (for messsages that aren't critical or time-sensitive, such as marketing
  /// messages).
  final MessageType? messageType;

  /// The long code to send the SMS message from. This value should be one of the
  /// dedicated long codes that's assigned to your AWS account. Although it isn't
  /// required, we recommend that you specify the long code using an E.164 format
  /// to ensure prompt and accurate delivery of the message. For example,
  /// +12065550100.
  final String? originationNumber;

  /// The sender ID to display on recipients' devices when they receive the SMS
  /// message.
  final String? senderId;

  /// The template ID received from the regulatory body for sending SMS in your
  /// country.
  final String? templateId;

  CampaignSmsMessage({
    this.body,
    this.entityId,
    this.messageType,
    this.originationNumber,
    this.senderId,
    this.templateId,
  });

  factory CampaignSmsMessage.fromJson(Map<String, dynamic> json) {
    return CampaignSmsMessage(
      body: json['Body'] as String?,
      entityId: json['EntityId'] as String?,
      messageType: (json['MessageType'] as String?)?.toMessageType(),
      originationNumber: json['OriginationNumber'] as String?,
      senderId: json['SenderId'] as String?,
      templateId: json['TemplateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final body = this.body;
    final entityId = this.entityId;
    final messageType = this.messageType;
    final originationNumber = this.originationNumber;
    final senderId = this.senderId;
    final templateId = this.templateId;
    return {
      if (body != null) 'Body': body,
      if (entityId != null) 'EntityId': entityId,
      if (messageType != null) 'MessageType': messageType.toValue(),
      if (originationNumber != null) 'OriginationNumber': originationNumber,
      if (senderId != null) 'SenderId': senderId,
      if (templateId != null) 'TemplateId': templateId,
    };
  }
}

/// Provides information about the status of a campaign.
class CampaignState {
  /// The current status of the campaign, or the current status of a treatment
  /// that belongs to an A/B test campaign.
  ///
  /// If a campaign uses A/B testing, the campaign has a status of COMPLETED only
  /// if all campaign treatments have a status of COMPLETED. If you delete the
  /// segment that's associated with a campaign, the campaign fails and has a
  /// status of DELETED.
  final CampaignStatus? campaignStatus;

  CampaignState({
    this.campaignStatus,
  });

  factory CampaignState.fromJson(Map<String, dynamic> json) {
    return CampaignState(
      campaignStatus: (json['CampaignStatus'] as String?)?.toCampaignStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final campaignStatus = this.campaignStatus;
    return {
      if (campaignStatus != null) 'CampaignStatus': campaignStatus.toValue(),
    };
  }
}

enum CampaignStatus {
  scheduled,
  executing,
  pendingNextRun,
  completed,
  paused,
  deleted,
  invalid,
}

extension CampaignStatusValueExtension on CampaignStatus {
  String toValue() {
    switch (this) {
      case CampaignStatus.scheduled:
        return 'SCHEDULED';
      case CampaignStatus.executing:
        return 'EXECUTING';
      case CampaignStatus.pendingNextRun:
        return 'PENDING_NEXT_RUN';
      case CampaignStatus.completed:
        return 'COMPLETED';
      case CampaignStatus.paused:
        return 'PAUSED';
      case CampaignStatus.deleted:
        return 'DELETED';
      case CampaignStatus.invalid:
        return 'INVALID';
    }
  }
}

extension CampaignStatusFromString on String {
  CampaignStatus toCampaignStatus() {
    switch (this) {
      case 'SCHEDULED':
        return CampaignStatus.scheduled;
      case 'EXECUTING':
        return CampaignStatus.executing;
      case 'PENDING_NEXT_RUN':
        return CampaignStatus.pendingNextRun;
      case 'COMPLETED':
        return CampaignStatus.completed;
      case 'PAUSED':
        return CampaignStatus.paused;
      case 'DELETED':
        return CampaignStatus.deleted;
      case 'INVALID':
        return CampaignStatus.invalid;
    }
    throw Exception('$this is not known in enum CampaignStatus');
  }
}

/// Provides information about the configuration and other settings for all the
/// campaigns that are associated with an application.
class CampaignsResponse {
  /// An array of responses, one for each campaign that's associated with the
  /// application.
  final List<CampaignResponse> item;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  CampaignsResponse({
    required this.item,
    this.nextToken,
  });

  factory CampaignsResponse.fromJson(Map<String, dynamic> json) {
    return CampaignsResponse(
      item: (json['Item'] as List)
          .whereNotNull()
          .map((e) => CampaignResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final item = this.item;
    final nextToken = this.nextToken;
    return {
      'Item': item,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Provides information about the general settings and status of a channel for
/// an application.
class ChannelResponse {
  /// The unique identifier for the application.
  final String? applicationId;

  /// The date and time, in ISO 8601 format, when the channel was enabled.
  final String? creationDate;

  /// Specifies whether the channel is enabled for the application.
  final bool? enabled;

  /// (Not used) This property is retained only for backward compatibility.
  final bool? hasCredential;

  /// (Deprecated) An identifier for the channel. This property is retained only
  /// for backward compatibility.
  final String? id;

  /// Specifies whether the channel is archived.
  final bool? isArchived;

  /// The user who last modified the channel.
  final String? lastModifiedBy;

  /// The date and time, in ISO 8601 format, when the channel was last modified.
  final String? lastModifiedDate;

  /// The current version of the channel.
  final int? version;

  ChannelResponse({
    this.applicationId,
    this.creationDate,
    this.enabled,
    this.hasCredential,
    this.id,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.version,
  });

  factory ChannelResponse.fromJson(Map<String, dynamic> json) {
    return ChannelResponse(
      applicationId: json['ApplicationId'] as String?,
      creationDate: json['CreationDate'] as String?,
      enabled: json['Enabled'] as bool?,
      hasCredential: json['HasCredential'] as bool?,
      id: json['Id'] as String?,
      isArchived: json['IsArchived'] as bool?,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: json['LastModifiedDate'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final creationDate = this.creationDate;
    final enabled = this.enabled;
    final hasCredential = this.hasCredential;
    final id = this.id;
    final isArchived = this.isArchived;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final version = this.version;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (creationDate != null) 'CreationDate': creationDate,
      if (enabled != null) 'Enabled': enabled,
      if (hasCredential != null) 'HasCredential': hasCredential,
      if (id != null) 'Id': id,
      if (isArchived != null) 'IsArchived': isArchived,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (version != null) 'Version': version,
    };
  }
}

enum ChannelType {
  push,
  gcm,
  apns,
  apnsSandbox,
  apnsVoip,
  apnsVoipSandbox,
  adm,
  sms,
  voice,
  email,
  baidu,
  custom,
  inApp,
}

extension ChannelTypeValueExtension on ChannelType {
  String toValue() {
    switch (this) {
      case ChannelType.push:
        return 'PUSH';
      case ChannelType.gcm:
        return 'GCM';
      case ChannelType.apns:
        return 'APNS';
      case ChannelType.apnsSandbox:
        return 'APNS_SANDBOX';
      case ChannelType.apnsVoip:
        return 'APNS_VOIP';
      case ChannelType.apnsVoipSandbox:
        return 'APNS_VOIP_SANDBOX';
      case ChannelType.adm:
        return 'ADM';
      case ChannelType.sms:
        return 'SMS';
      case ChannelType.voice:
        return 'VOICE';
      case ChannelType.email:
        return 'EMAIL';
      case ChannelType.baidu:
        return 'BAIDU';
      case ChannelType.custom:
        return 'CUSTOM';
      case ChannelType.inApp:
        return 'IN_APP';
    }
  }
}

extension ChannelTypeFromString on String {
  ChannelType toChannelType() {
    switch (this) {
      case 'PUSH':
        return ChannelType.push;
      case 'GCM':
        return ChannelType.gcm;
      case 'APNS':
        return ChannelType.apns;
      case 'APNS_SANDBOX':
        return ChannelType.apnsSandbox;
      case 'APNS_VOIP':
        return ChannelType.apnsVoip;
      case 'APNS_VOIP_SANDBOX':
        return ChannelType.apnsVoipSandbox;
      case 'ADM':
        return ChannelType.adm;
      case 'SMS':
        return ChannelType.sms;
      case 'VOICE':
        return ChannelType.voice;
      case 'EMAIL':
        return ChannelType.email;
      case 'BAIDU':
        return ChannelType.baidu;
      case 'CUSTOM':
        return ChannelType.custom;
      case 'IN_APP':
        return ChannelType.inApp;
    }
    throw Exception('$this is not known in enum ChannelType');
  }
}

/// Provides information about the general settings and status of all channels
/// for an application, including channels that aren't enabled for the
/// application.
class ChannelsResponse {
  /// A map that contains a multipart response for each channel. For each item in
  /// this object, the ChannelType is the key and the Channel is the value.
  final Map<String, ChannelResponse> channels;

  ChannelsResponse({
    required this.channels,
  });

  factory ChannelsResponse.fromJson(Map<String, dynamic> json) {
    return ChannelsResponse(
      channels: (json['Channels'] as Map<String, dynamic>).map((k, e) =>
          MapEntry(k, ChannelResponse.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final channels = this.channels;
    return {
      'Channels': channels,
    };
  }
}

/// Specifies the conditions to evaluate for an activity in a journey, and how
/// to evaluate those conditions.
class Condition {
  /// The conditions to evaluate for the activity.
  final List<SimpleCondition>? conditions;

  /// Specifies how to handle multiple conditions for the activity. For example,
  /// if you specify two conditions for an activity, whether both or only one of
  /// the conditions must be met for the activity to be performed.
  final Operator? operator;

  Condition({
    this.conditions,
    this.operator,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      conditions: (json['Conditions'] as List?)
          ?.whereNotNull()
          .map((e) => SimpleCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      operator: (json['Operator'] as String?)?.toOperator(),
    );
  }

  Map<String, dynamic> toJson() {
    final conditions = this.conditions;
    final operator = this.operator;
    return {
      if (conditions != null) 'Conditions': conditions,
      if (operator != null) 'Operator': operator.toValue(),
    };
  }
}

/// Specifies the settings for a yes/no split activity in a journey. This type
/// of activity sends participants down one of two paths in a journey, based on
/// conditions that you specify.
/// <note>
/// To create yes/no split activities that send participants down different
/// paths based on push notification events (such as Open or Received events),
/// your mobile app has to specify the User ID and Endpoint ID values. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/integrate.html">Integrating
/// Amazon Pinpoint with your application</a> in the <i>Amazon Pinpoint
/// Developer Guide</i>.
/// </note>
class ConditionalSplitActivity {
  /// The conditions that define the paths for the activity, and the relationship
  /// between the conditions.
  final Condition? condition;

  /// The amount of time to wait before determining whether the conditions are
  /// met, or the date and time when Amazon Pinpoint determines whether the
  /// conditions are met.
  final WaitTime? evaluationWaitTime;

  /// The unique identifier for the activity to perform if the conditions aren't
  /// met.
  final String? falseActivity;

  /// The unique identifier for the activity to perform if the conditions are met.
  final String? trueActivity;

  ConditionalSplitActivity({
    this.condition,
    this.evaluationWaitTime,
    this.falseActivity,
    this.trueActivity,
  });

  factory ConditionalSplitActivity.fromJson(Map<String, dynamic> json) {
    return ConditionalSplitActivity(
      condition: json['Condition'] != null
          ? Condition.fromJson(json['Condition'] as Map<String, dynamic>)
          : null,
      evaluationWaitTime: json['EvaluationWaitTime'] != null
          ? WaitTime.fromJson(
              json['EvaluationWaitTime'] as Map<String, dynamic>)
          : null,
      falseActivity: json['FalseActivity'] as String?,
      trueActivity: json['TrueActivity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    final evaluationWaitTime = this.evaluationWaitTime;
    final falseActivity = this.falseActivity;
    final trueActivity = this.trueActivity;
    return {
      if (condition != null) 'Condition': condition,
      if (evaluationWaitTime != null) 'EvaluationWaitTime': evaluationWaitTime,
      if (falseActivity != null) 'FalseActivity': falseActivity,
      if (trueActivity != null) 'TrueActivity': trueActivity,
    };
  }
}

class ContactCenterActivity {
  /// The unique identifier for the next activity to perform after the this
  /// activity.
  final String? nextActivity;

  ContactCenterActivity({
    this.nextActivity,
  });

  factory ContactCenterActivity.fromJson(Map<String, dynamic> json) {
    return ContactCenterActivity(
      nextActivity: json['NextActivity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nextActivity = this.nextActivity;
    return {
      if (nextActivity != null) 'NextActivity': nextActivity,
    };
  }
}

class CreateAppResponse {
  final ApplicationResponse applicationResponse;

  CreateAppResponse({
    required this.applicationResponse,
  });

  Map<String, dynamic> toJson() {
    final applicationResponse = this.applicationResponse;
    return {
      'ApplicationResponse': applicationResponse,
    };
  }
}

/// Specifies the display name of an application and the tags to associate with
/// the application.
class CreateApplicationRequest {
  /// The display name of the application. This name is displayed as the
  /// <b>Project name</b> on the Amazon Pinpoint console.
  final String name;

  /// A string-to-string map of key-value pairs that defines the tags to associate
  /// with the application. Each tag consists of a required tag key and an
  /// associated tag value.
  final Map<String, String>? tags;

  CreateApplicationRequest({
    required this.name,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final tags = this.tags;
    return {
      'Name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateCampaignResponse {
  final CampaignResponse campaignResponse;

  CreateCampaignResponse({
    required this.campaignResponse,
  });

  Map<String, dynamic> toJson() {
    final campaignResponse = this.campaignResponse;
    return {
      'CampaignResponse': campaignResponse,
    };
  }
}

class CreateEmailTemplateResponse {
  final CreateTemplateMessageBody createTemplateMessageBody;

  CreateEmailTemplateResponse({
    required this.createTemplateMessageBody,
  });

  Map<String, dynamic> toJson() {
    final createTemplateMessageBody = this.createTemplateMessageBody;
    return {
      'CreateTemplateMessageBody': createTemplateMessageBody,
    };
  }
}

class CreateExportJobResponse {
  final ExportJobResponse exportJobResponse;

  CreateExportJobResponse({
    required this.exportJobResponse,
  });

  Map<String, dynamic> toJson() {
    final exportJobResponse = this.exportJobResponse;
    return {
      'ExportJobResponse': exportJobResponse,
    };
  }
}

class CreateImportJobResponse {
  final ImportJobResponse importJobResponse;

  CreateImportJobResponse({
    required this.importJobResponse,
  });

  Map<String, dynamic> toJson() {
    final importJobResponse = this.importJobResponse;
    return {
      'ImportJobResponse': importJobResponse,
    };
  }
}

class CreateInAppTemplateResponse {
  final TemplateCreateMessageBody templateCreateMessageBody;

  CreateInAppTemplateResponse({
    required this.templateCreateMessageBody,
  });

  Map<String, dynamic> toJson() {
    final templateCreateMessageBody = this.templateCreateMessageBody;
    return {
      'TemplateCreateMessageBody': templateCreateMessageBody,
    };
  }
}

class CreateJourneyResponse {
  final JourneyResponse journeyResponse;

  CreateJourneyResponse({
    required this.journeyResponse,
  });

  Map<String, dynamic> toJson() {
    final journeyResponse = this.journeyResponse;
    return {
      'JourneyResponse': journeyResponse,
    };
  }
}

class CreatePushTemplateResponse {
  final CreateTemplateMessageBody createTemplateMessageBody;

  CreatePushTemplateResponse({
    required this.createTemplateMessageBody,
  });

  Map<String, dynamic> toJson() {
    final createTemplateMessageBody = this.createTemplateMessageBody;
    return {
      'CreateTemplateMessageBody': createTemplateMessageBody,
    };
  }
}

/// Specifies Amazon Pinpoint configuration settings for retrieving and
/// processing recommendation data from a recommender model.
class CreateRecommenderConfiguration {
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorizes Amazon Pinpoint to retrieve recommendation data
  /// from the recommender model.
  final String recommendationProviderRoleArn;

  /// The Amazon Resource Name (ARN) of the recommender model to retrieve
  /// recommendation data from. This value must match the ARN of an Amazon
  /// Personalize campaign.
  final String recommendationProviderUri;

  /// A map of key-value pairs that defines 1-10 custom endpoint or user
  /// attributes, depending on the value for the RecommendationProviderIdType
  /// property. Each of these attributes temporarily stores a recommended item
  /// that's retrieved from the recommender model and sent to an AWS Lambda
  /// function for additional processing. Each attribute can be used as a message
  /// variable in a message template.
  ///
  /// In the map, the key is the name of a custom attribute and the value is a
  /// custom display name for that attribute. The display name appears in the
  /// <b>Attribute finder</b> of the template editor on the Amazon Pinpoint
  /// console. The following restrictions apply to these names:
  ///
  /// <ul>
  /// <li>
  /// An attribute name must start with a letter or number and it can contain up
  /// to 50 characters. The characters can be letters, numbers, underscores (_),
  /// or hyphens (-). Attribute names are case sensitive and must be unique.
  /// </li>
  /// <li>
  /// An attribute display name must start with a letter or number and it can
  /// contain up to 25 characters. The characters can be letters, numbers, spaces,
  /// underscores (_), or hyphens (-).
  /// </li>
  /// </ul>
  /// This object is required if the configuration invokes an AWS Lambda function
  /// (RecommendationTransformerUri) to process recommendation data. Otherwise,
  /// don't include this object in your request.
  final Map<String, String>? attributes;

  /// A custom description of the configuration for the recommender model. The
  /// description can contain up to 128 characters. The characters can be letters,
  /// numbers, spaces, or the following symbols: _ ; () , ‐.
  final String? description;

  /// A custom name of the configuration for the recommender model. The name must
  /// start with a letter or number and it can contain up to 128 characters. The
  /// characters can be letters, numbers, spaces, underscores (_), or hyphens (-).
  final String? name;

  /// The type of Amazon Pinpoint ID to associate with unique user IDs in the
  /// recommender model. This value enables the model to use attribute and event
  /// data that’s specific to a particular endpoint or user in an Amazon Pinpoint
  /// application. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// PINPOINT_ENDPOINT_ID - Associate each user in the model with a particular
  /// endpoint in Amazon Pinpoint. The data is correlated based on endpoint IDs in
  /// Amazon Pinpoint. This is the default value.
  /// </li>
  /// <li>
  /// PINPOINT_USER_ID - Associate each user in the model with a particular user
  /// and endpoint in Amazon Pinpoint. The data is correlated based on user IDs in
  /// Amazon Pinpoint. If you specify this value, an endpoint definition in Amazon
  /// Pinpoint has to specify both a user ID (UserId) and an endpoint ID.
  /// Otherwise, messages won’t be sent to the user's endpoint.
  /// </li>
  /// </ul>
  final String? recommendationProviderIdType;

  /// The name or Amazon Resource Name (ARN) of the AWS Lambda function to invoke
  /// for additional processing of recommendation data that's retrieved from the
  /// recommender model.
  final String? recommendationTransformerUri;

  /// A custom display name for the standard endpoint or user attribute
  /// (RecommendationItems) that temporarily stores recommended items for each
  /// endpoint or user, depending on the value for the
  /// RecommendationProviderIdType property. This value is required if the
  /// configuration doesn't invoke an AWS Lambda function
  /// (RecommendationTransformerUri) to perform additional processing of
  /// recommendation data.
  ///
  /// This name appears in the <b>Attribute finder</b> of the template editor on
  /// the Amazon Pinpoint console. The name can contain up to 25 characters. The
  /// characters can be letters, numbers, spaces, underscores (_), or hyphens (-).
  /// These restrictions don't apply to attribute values.
  final String? recommendationsDisplayName;

  /// The number of recommended items to retrieve from the model for each endpoint
  /// or user, depending on the value for the RecommendationProviderIdType
  /// property. This number determines how many recommended items are available
  /// for use in message variables. The minimum value is 1. The maximum value is
  /// 5. The default value is 5.
  ///
  /// To use multiple recommended items and custom attributes with message
  /// variables, you have to use an AWS Lambda function
  /// (RecommendationTransformerUri) to perform additional processing of
  /// recommendation data.
  final int? recommendationsPerMessage;

  CreateRecommenderConfiguration({
    required this.recommendationProviderRoleArn,
    required this.recommendationProviderUri,
    this.attributes,
    this.description,
    this.name,
    this.recommendationProviderIdType,
    this.recommendationTransformerUri,
    this.recommendationsDisplayName,
    this.recommendationsPerMessage,
  });

  Map<String, dynamic> toJson() {
    final recommendationProviderRoleArn = this.recommendationProviderRoleArn;
    final recommendationProviderUri = this.recommendationProviderUri;
    final attributes = this.attributes;
    final description = this.description;
    final name = this.name;
    final recommendationProviderIdType = this.recommendationProviderIdType;
    final recommendationTransformerUri = this.recommendationTransformerUri;
    final recommendationsDisplayName = this.recommendationsDisplayName;
    final recommendationsPerMessage = this.recommendationsPerMessage;
    return {
      'RecommendationProviderRoleArn': recommendationProviderRoleArn,
      'RecommendationProviderUri': recommendationProviderUri,
      if (attributes != null) 'Attributes': attributes,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (recommendationProviderIdType != null)
        'RecommendationProviderIdType': recommendationProviderIdType,
      if (recommendationTransformerUri != null)
        'RecommendationTransformerUri': recommendationTransformerUri,
      if (recommendationsDisplayName != null)
        'RecommendationsDisplayName': recommendationsDisplayName,
      if (recommendationsPerMessage != null)
        'RecommendationsPerMessage': recommendationsPerMessage,
    };
  }
}

class CreateRecommenderConfigurationResponse {
  final RecommenderConfigurationResponse recommenderConfigurationResponse;

  CreateRecommenderConfigurationResponse({
    required this.recommenderConfigurationResponse,
  });

  Map<String, dynamic> toJson() {
    final recommenderConfigurationResponse =
        this.recommenderConfigurationResponse;
    return {
      'RecommenderConfigurationResponse': recommenderConfigurationResponse,
    };
  }
}

class CreateSegmentResponse {
  final SegmentResponse segmentResponse;

  CreateSegmentResponse({
    required this.segmentResponse,
  });

  Map<String, dynamic> toJson() {
    final segmentResponse = this.segmentResponse;
    return {
      'SegmentResponse': segmentResponse,
    };
  }
}

class CreateSmsTemplateResponse {
  final CreateTemplateMessageBody createTemplateMessageBody;

  CreateSmsTemplateResponse({
    required this.createTemplateMessageBody,
  });

  Map<String, dynamic> toJson() {
    final createTemplateMessageBody = this.createTemplateMessageBody;
    return {
      'CreateTemplateMessageBody': createTemplateMessageBody,
    };
  }
}

/// Provides information about a request to create a message template.
class CreateTemplateMessageBody {
  /// The Amazon Resource Name (ARN) of the message template that was created.
  final String? arn;

  /// The message that's returned from the API for the request to create the
  /// message template.
  final String? message;

  /// The unique identifier for the request to create the message template.
  final String? requestID;

  CreateTemplateMessageBody({
    this.arn,
    this.message,
    this.requestID,
  });

  factory CreateTemplateMessageBody.fromJson(Map<String, dynamic> json) {
    return CreateTemplateMessageBody(
      arn: json['Arn'] as String?,
      message: json['Message'] as String?,
      requestID: json['RequestID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final message = this.message;
    final requestID = this.requestID;
    return {
      if (arn != null) 'Arn': arn,
      if (message != null) 'Message': message,
      if (requestID != null) 'RequestID': requestID,
    };
  }
}

class CreateVoiceTemplateResponse {
  final CreateTemplateMessageBody createTemplateMessageBody;

  CreateVoiceTemplateResponse({
    required this.createTemplateMessageBody,
  });

  Map<String, dynamic> toJson() {
    final createTemplateMessageBody = this.createTemplateMessageBody;
    return {
      'CreateTemplateMessageBody': createTemplateMessageBody,
    };
  }
}

/// Specifies the delivery configuration settings for sending a campaign or
/// campaign treatment through a custom channel. This object is required if you
/// use the CampaignCustomMessage object to define the message to send for the
/// campaign or campaign treatment.
class CustomDeliveryConfiguration {
  /// The destination to send the campaign or treatment to. This value can be one
  /// of the following:
  ///
  /// <ul>
  /// <li>
  /// The name or Amazon Resource Name (ARN) of an AWS Lambda function to invoke
  /// to handle delivery of the campaign or treatment.
  /// </li>
  /// <li>
  /// The URL for a web application or service that supports HTTPS and can receive
  /// the message. The URL has to be a full URL, including the HTTPS protocol.
  /// </li>
  /// </ul>
  final String deliveryUri;

  /// The types of endpoints to send the campaign or treatment to. Each valid
  /// value maps to a type of channel that you can associate with an endpoint by
  /// using the ChannelType property of an endpoint.
  final List<EndpointTypesElement>? endpointTypes;

  CustomDeliveryConfiguration({
    required this.deliveryUri,
    this.endpointTypes,
  });

  factory CustomDeliveryConfiguration.fromJson(Map<String, dynamic> json) {
    return CustomDeliveryConfiguration(
      deliveryUri: json['DeliveryUri'] as String,
      endpointTypes: (json['EndpointTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toEndpointTypesElement())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryUri = this.deliveryUri;
    final endpointTypes = this.endpointTypes;
    return {
      'DeliveryUri': deliveryUri,
      if (endpointTypes != null)
        'EndpointTypes': endpointTypes.map((e) => e.toValue()).toList(),
    };
  }
}

/// The settings for a custom message activity. This type of activity calls an
/// AWS Lambda function or web hook that sends messages to participants.
class CustomMessageActivity {
  /// The destination to send the campaign or treatment to. This value can be one
  /// of the following:
  ///
  /// <ul>
  /// <li>
  /// The name or Amazon Resource Name (ARN) of an AWS Lambda function to invoke
  /// to handle delivery of the campaign or treatment.
  /// </li>
  /// <li>
  /// The URL for a web application or service that supports HTTPS and can receive
  /// the message. The URL has to be a full URL, including the HTTPS protocol.
  /// </li>
  /// </ul>
  final String? deliveryUri;

  /// The types of endpoints to send the custom message to. Each valid value maps
  /// to a type of channel that you can associate with an endpoint by using the
  /// ChannelType property of an endpoint.
  final List<EndpointTypesElement>? endpointTypes;

  /// Specifies the message data included in a custom channel message that's sent
  /// to participants in a journey.
  final JourneyCustomMessage? messageConfig;

  /// The unique identifier for the next activity to perform, after Amazon
  /// Pinpoint calls the AWS Lambda function or web hook.
  final String? nextActivity;

  /// The name of the custom message template to use for the message. If
  /// specified, this value must match the name of an existing message template.
  final String? templateName;

  /// The unique identifier for the version of the message template to use for the
  /// message. If specified, this value must match the identifier for an existing
  /// template version. To retrieve a list of versions and version identifiers for
  /// a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  ///
  /// If you don't specify a value for this property, Amazon Pinpoint uses the
  /// <i>active version</i> of the template. The <i>active version</i> is
  /// typically the version of a template that's been most recently reviewed and
  /// approved for use, depending on your workflow. It isn't necessarily the
  /// latest version of a template.
  final String? templateVersion;

  CustomMessageActivity({
    this.deliveryUri,
    this.endpointTypes,
    this.messageConfig,
    this.nextActivity,
    this.templateName,
    this.templateVersion,
  });

  factory CustomMessageActivity.fromJson(Map<String, dynamic> json) {
    return CustomMessageActivity(
      deliveryUri: json['DeliveryUri'] as String?,
      endpointTypes: (json['EndpointTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toEndpointTypesElement())
          .toList(),
      messageConfig: json['MessageConfig'] != null
          ? JourneyCustomMessage.fromJson(
              json['MessageConfig'] as Map<String, dynamic>)
          : null,
      nextActivity: json['NextActivity'] as String?,
      templateName: json['TemplateName'] as String?,
      templateVersion: json['TemplateVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryUri = this.deliveryUri;
    final endpointTypes = this.endpointTypes;
    final messageConfig = this.messageConfig;
    final nextActivity = this.nextActivity;
    final templateName = this.templateName;
    final templateVersion = this.templateVersion;
    return {
      if (deliveryUri != null) 'DeliveryUri': deliveryUri,
      if (endpointTypes != null)
        'EndpointTypes': endpointTypes.map((e) => e.toValue()).toList(),
      if (messageConfig != null) 'MessageConfig': messageConfig,
      if (nextActivity != null) 'NextActivity': nextActivity,
      if (templateName != null) 'TemplateName': templateName,
      if (templateVersion != null) 'TemplateVersion': templateVersion,
    };
  }
}

/// Default button configuration.
class DefaultButtonConfiguration {
  /// Action triggered by the button.
  final ButtonAction buttonAction;

  /// Button text.
  final String text;

  /// The background color of the button.
  final String? backgroundColor;

  /// The border radius of the button.
  final int? borderRadius;

  /// Button destination.
  final String? link;

  /// The text color of the button.
  final String? textColor;

  DefaultButtonConfiguration({
    required this.buttonAction,
    required this.text,
    this.backgroundColor,
    this.borderRadius,
    this.link,
    this.textColor,
  });

  factory DefaultButtonConfiguration.fromJson(Map<String, dynamic> json) {
    return DefaultButtonConfiguration(
      buttonAction: (json['ButtonAction'] as String).toButtonAction(),
      text: json['Text'] as String,
      backgroundColor: json['BackgroundColor'] as String?,
      borderRadius: json['BorderRadius'] as int?,
      link: json['Link'] as String?,
      textColor: json['TextColor'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final buttonAction = this.buttonAction;
    final text = this.text;
    final backgroundColor = this.backgroundColor;
    final borderRadius = this.borderRadius;
    final link = this.link;
    final textColor = this.textColor;
    return {
      'ButtonAction': buttonAction.toValue(),
      'Text': text,
      if (backgroundColor != null) 'BackgroundColor': backgroundColor,
      if (borderRadius != null) 'BorderRadius': borderRadius,
      if (link != null) 'Link': link,
      if (textColor != null) 'TextColor': textColor,
    };
  }
}

/// Specifies the default message for all channels.
class DefaultMessage {
  /// The default body of the message.
  final String? body;

  /// The default message variables to use in the message. You can override these
  /// default variables with individual address variables.
  final Map<String, List<String>>? substitutions;

  DefaultMessage({
    this.body,
    this.substitutions,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final substitutions = this.substitutions;
    return {
      if (body != null) 'Body': body,
      if (substitutions != null) 'Substitutions': substitutions,
    };
  }
}

/// Specifies the default settings and content for a push notification that's
/// sent directly to an endpoint.
class DefaultPushNotificationMessage {
  /// The default action to occur if a recipient taps the push notification. Valid
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// OPEN_APP - Your app opens or it becomes the foreground app if it was sent to
  /// the background. This is the default action.
  /// </li>
  /// <li>
  /// DEEP_LINK - Your app opens and displays a designated user interface in the
  /// app. This setting uses the deep-linking features of the iOS and Android
  /// platforms.
  /// </li>
  /// <li>
  /// URL - The default mobile browser on the recipient's device opens and loads
  /// the web page at a URL that you specify.
  /// </li>
  /// </ul>
  final Action? action;

  /// The default body of the notification message.
  final String? body;

  /// The JSON data payload to use for the default push notification, if the
  /// notification is a silent push notification. This payload is added to the
  /// data.pinpoint.jsonBody object of the notification.
  final Map<String, String>? data;

  /// Specifies whether the default notification is a silent push notification,
  /// which is a push notification that doesn't display on a recipient's device.
  /// Silent push notifications can be used for cases such as updating an app's
  /// configuration or delivering messages to an in-app notification center.
  final bool? silentPush;

  /// The default message variables to use in the notification message. You can
  /// override the default variables with individual address variables.
  final Map<String, List<String>>? substitutions;

  /// The default title to display above the notification message on a recipient's
  /// device.
  final String? title;

  /// The default URL to open in a recipient's default mobile browser, if a
  /// recipient taps the push notification and the value of the Action property is
  /// URL.
  final String? url;

  DefaultPushNotificationMessage({
    this.action,
    this.body,
    this.data,
    this.silentPush,
    this.substitutions,
    this.title,
    this.url,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final body = this.body;
    final data = this.data;
    final silentPush = this.silentPush;
    final substitutions = this.substitutions;
    final title = this.title;
    final url = this.url;
    return {
      if (action != null) 'Action': action.toValue(),
      if (body != null) 'Body': body,
      if (data != null) 'Data': data,
      if (silentPush != null) 'SilentPush': silentPush,
      if (substitutions != null) 'Substitutions': substitutions,
      if (title != null) 'Title': title,
      if (url != null) 'Url': url,
    };
  }
}

/// Specifies the default settings and content for a message template that can
/// be used in messages that are sent through a push notification channel.
class DefaultPushNotificationTemplate {
  /// The action to occur if a recipient taps a push notification that's based on
  /// the message template. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// OPEN_APP - Your app opens or it becomes the foreground app if it was sent to
  /// the background. This is the default action.
  /// </li>
  /// <li>
  /// DEEP_LINK - Your app opens and displays a designated user interface in the
  /// app. This setting uses the deep-linking features of the iOS and Android
  /// platforms.
  /// </li>
  /// <li>
  /// URL - The default mobile browser on the recipient's device opens and loads
  /// the web page at a URL that you specify.
  /// </li>
  /// </ul>
  final Action? action;

  /// The message body to use in push notifications that are based on the message
  /// template.
  final String? body;

  /// The sound to play when a recipient receives a push notification that's based
  /// on the message template. You can use the default stream or specify the file
  /// name of a sound resource that's bundled in your app. On an Android platform,
  /// the sound file must reside in /res/raw/.
  ///
  /// For an iOS platform, this value is the key for the name of a sound file in
  /// your app's main bundle or the Library/Sounds folder in your app's data
  /// container. If the sound file can't be found or you specify default for the
  /// value, the system plays the default alert sound.
  final String? sound;

  /// The title to use in push notifications that are based on the message
  /// template. This title appears above the notification message on a recipient's
  /// device.
  final String? title;

  /// The URL to open in a recipient's default mobile browser, if a recipient taps
  /// a push notification that's based on the message template and the value of
  /// the Action property is URL.
  final String? url;

  DefaultPushNotificationTemplate({
    this.action,
    this.body,
    this.sound,
    this.title,
    this.url,
  });

  factory DefaultPushNotificationTemplate.fromJson(Map<String, dynamic> json) {
    return DefaultPushNotificationTemplate(
      action: (json['Action'] as String?)?.toAction(),
      body: json['Body'] as String?,
      sound: json['Sound'] as String?,
      title: json['Title'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final body = this.body;
    final sound = this.sound;
    final title = this.title;
    final url = this.url;
    return {
      if (action != null) 'Action': action.toValue(),
      if (body != null) 'Body': body,
      if (sound != null) 'Sound': sound,
      if (title != null) 'Title': title,
      if (url != null) 'Url': url,
    };
  }
}

class DeleteAdmChannelResponse {
  final ADMChannelResponse aDMChannelResponse;

  DeleteAdmChannelResponse({
    required this.aDMChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final aDMChannelResponse = this.aDMChannelResponse;
    return {
      'ADMChannelResponse': aDMChannelResponse,
    };
  }
}

class DeleteApnsChannelResponse {
  final APNSChannelResponse aPNSChannelResponse;

  DeleteApnsChannelResponse({
    required this.aPNSChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final aPNSChannelResponse = this.aPNSChannelResponse;
    return {
      'APNSChannelResponse': aPNSChannelResponse,
    };
  }
}

class DeleteApnsSandboxChannelResponse {
  final APNSSandboxChannelResponse aPNSSandboxChannelResponse;

  DeleteApnsSandboxChannelResponse({
    required this.aPNSSandboxChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final aPNSSandboxChannelResponse = this.aPNSSandboxChannelResponse;
    return {
      'APNSSandboxChannelResponse': aPNSSandboxChannelResponse,
    };
  }
}

class DeleteApnsVoipChannelResponse {
  final APNSVoipChannelResponse aPNSVoipChannelResponse;

  DeleteApnsVoipChannelResponse({
    required this.aPNSVoipChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final aPNSVoipChannelResponse = this.aPNSVoipChannelResponse;
    return {
      'APNSVoipChannelResponse': aPNSVoipChannelResponse,
    };
  }
}

class DeleteApnsVoipSandboxChannelResponse {
  final APNSVoipSandboxChannelResponse aPNSVoipSandboxChannelResponse;

  DeleteApnsVoipSandboxChannelResponse({
    required this.aPNSVoipSandboxChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final aPNSVoipSandboxChannelResponse = this.aPNSVoipSandboxChannelResponse;
    return {
      'APNSVoipSandboxChannelResponse': aPNSVoipSandboxChannelResponse,
    };
  }
}

class DeleteAppResponse {
  final ApplicationResponse applicationResponse;

  DeleteAppResponse({
    required this.applicationResponse,
  });

  Map<String, dynamic> toJson() {
    final applicationResponse = this.applicationResponse;
    return {
      'ApplicationResponse': applicationResponse,
    };
  }
}

class DeleteBaiduChannelResponse {
  final BaiduChannelResponse baiduChannelResponse;

  DeleteBaiduChannelResponse({
    required this.baiduChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final baiduChannelResponse = this.baiduChannelResponse;
    return {
      'BaiduChannelResponse': baiduChannelResponse,
    };
  }
}

class DeleteCampaignResponse {
  final CampaignResponse campaignResponse;

  DeleteCampaignResponse({
    required this.campaignResponse,
  });

  Map<String, dynamic> toJson() {
    final campaignResponse = this.campaignResponse;
    return {
      'CampaignResponse': campaignResponse,
    };
  }
}

class DeleteEmailChannelResponse {
  final EmailChannelResponse emailChannelResponse;

  DeleteEmailChannelResponse({
    required this.emailChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final emailChannelResponse = this.emailChannelResponse;
    return {
      'EmailChannelResponse': emailChannelResponse,
    };
  }
}

class DeleteEmailTemplateResponse {
  final MessageBody messageBody;

  DeleteEmailTemplateResponse({
    required this.messageBody,
  });

  Map<String, dynamic> toJson() {
    final messageBody = this.messageBody;
    return {
      'MessageBody': messageBody,
    };
  }
}

class DeleteEndpointResponse {
  final EndpointResponse endpointResponse;

  DeleteEndpointResponse({
    required this.endpointResponse,
  });

  Map<String, dynamic> toJson() {
    final endpointResponse = this.endpointResponse;
    return {
      'EndpointResponse': endpointResponse,
    };
  }
}

class DeleteEventStreamResponse {
  final EventStream eventStream;

  DeleteEventStreamResponse({
    required this.eventStream,
  });

  Map<String, dynamic> toJson() {
    final eventStream = this.eventStream;
    return {
      'EventStream': eventStream,
    };
  }
}

class DeleteGcmChannelResponse {
  final GCMChannelResponse gCMChannelResponse;

  DeleteGcmChannelResponse({
    required this.gCMChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final gCMChannelResponse = this.gCMChannelResponse;
    return {
      'GCMChannelResponse': gCMChannelResponse,
    };
  }
}

class DeleteInAppTemplateResponse {
  final MessageBody messageBody;

  DeleteInAppTemplateResponse({
    required this.messageBody,
  });

  Map<String, dynamic> toJson() {
    final messageBody = this.messageBody;
    return {
      'MessageBody': messageBody,
    };
  }
}

class DeleteJourneyResponse {
  final JourneyResponse journeyResponse;

  DeleteJourneyResponse({
    required this.journeyResponse,
  });

  Map<String, dynamic> toJson() {
    final journeyResponse = this.journeyResponse;
    return {
      'JourneyResponse': journeyResponse,
    };
  }
}

class DeletePushTemplateResponse {
  final MessageBody messageBody;

  DeletePushTemplateResponse({
    required this.messageBody,
  });

  Map<String, dynamic> toJson() {
    final messageBody = this.messageBody;
    return {
      'MessageBody': messageBody,
    };
  }
}

class DeleteRecommenderConfigurationResponse {
  final RecommenderConfigurationResponse recommenderConfigurationResponse;

  DeleteRecommenderConfigurationResponse({
    required this.recommenderConfigurationResponse,
  });

  Map<String, dynamic> toJson() {
    final recommenderConfigurationResponse =
        this.recommenderConfigurationResponse;
    return {
      'RecommenderConfigurationResponse': recommenderConfigurationResponse,
    };
  }
}

class DeleteSegmentResponse {
  final SegmentResponse segmentResponse;

  DeleteSegmentResponse({
    required this.segmentResponse,
  });

  Map<String, dynamic> toJson() {
    final segmentResponse = this.segmentResponse;
    return {
      'SegmentResponse': segmentResponse,
    };
  }
}

class DeleteSmsChannelResponse {
  final SMSChannelResponse sMSChannelResponse;

  DeleteSmsChannelResponse({
    required this.sMSChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final sMSChannelResponse = this.sMSChannelResponse;
    return {
      'SMSChannelResponse': sMSChannelResponse,
    };
  }
}

class DeleteSmsTemplateResponse {
  final MessageBody messageBody;

  DeleteSmsTemplateResponse({
    required this.messageBody,
  });

  Map<String, dynamic> toJson() {
    final messageBody = this.messageBody;
    return {
      'MessageBody': messageBody,
    };
  }
}

class DeleteUserEndpointsResponse {
  final EndpointsResponse endpointsResponse;

  DeleteUserEndpointsResponse({
    required this.endpointsResponse,
  });

  Map<String, dynamic> toJson() {
    final endpointsResponse = this.endpointsResponse;
    return {
      'EndpointsResponse': endpointsResponse,
    };
  }
}

class DeleteVoiceChannelResponse {
  final VoiceChannelResponse voiceChannelResponse;

  DeleteVoiceChannelResponse({
    required this.voiceChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final voiceChannelResponse = this.voiceChannelResponse;
    return {
      'VoiceChannelResponse': voiceChannelResponse,
    };
  }
}

class DeleteVoiceTemplateResponse {
  final MessageBody messageBody;

  DeleteVoiceTemplateResponse({
    required this.messageBody,
  });

  Map<String, dynamic> toJson() {
    final messageBody = this.messageBody;
    return {
      'MessageBody': messageBody,
    };
  }
}

enum DeliveryStatus {
  successful,
  throttled,
  temporaryFailure,
  permanentFailure,
  unknownFailure,
  optOut,
  duplicate,
}

extension DeliveryStatusValueExtension on DeliveryStatus {
  String toValue() {
    switch (this) {
      case DeliveryStatus.successful:
        return 'SUCCESSFUL';
      case DeliveryStatus.throttled:
        return 'THROTTLED';
      case DeliveryStatus.temporaryFailure:
        return 'TEMPORARY_FAILURE';
      case DeliveryStatus.permanentFailure:
        return 'PERMANENT_FAILURE';
      case DeliveryStatus.unknownFailure:
        return 'UNKNOWN_FAILURE';
      case DeliveryStatus.optOut:
        return 'OPT_OUT';
      case DeliveryStatus.duplicate:
        return 'DUPLICATE';
    }
  }
}

extension DeliveryStatusFromString on String {
  DeliveryStatus toDeliveryStatus() {
    switch (this) {
      case 'SUCCESSFUL':
        return DeliveryStatus.successful;
      case 'THROTTLED':
        return DeliveryStatus.throttled;
      case 'TEMPORARY_FAILURE':
        return DeliveryStatus.temporaryFailure;
      case 'PERMANENT_FAILURE':
        return DeliveryStatus.permanentFailure;
      case 'UNKNOWN_FAILURE':
        return DeliveryStatus.unknownFailure;
      case 'OPT_OUT':
        return DeliveryStatus.optOut;
      case 'DUPLICATE':
        return DeliveryStatus.duplicate;
    }
    throw Exception('$this is not known in enum DeliveryStatus');
  }
}

enum DimensionType {
  inclusive,
  exclusive,
}

extension DimensionTypeValueExtension on DimensionType {
  String toValue() {
    switch (this) {
      case DimensionType.inclusive:
        return 'INCLUSIVE';
      case DimensionType.exclusive:
        return 'EXCLUSIVE';
    }
  }
}

extension DimensionTypeFromString on String {
  DimensionType toDimensionType() {
    switch (this) {
      case 'INCLUSIVE':
        return DimensionType.inclusive;
      case 'EXCLUSIVE':
        return DimensionType.exclusive;
    }
    throw Exception('$this is not known in enum DimensionType');
  }
}

/// Specifies the settings and content for the default message and any default
/// messages that you tailored for specific channels.
class DirectMessageConfiguration {
  /// The default push notification message for the ADM (Amazon Device Messaging)
  /// channel. This message overrides the default push notification message
  /// (DefaultPushNotificationMessage).
  final ADMMessage? aDMMessage;

  /// The default push notification message for the APNs (Apple Push Notification
  /// service) channel. This message overrides the default push notification
  /// message (DefaultPushNotificationMessage).
  final APNSMessage? aPNSMessage;

  /// The default push notification message for the Baidu (Baidu Cloud Push)
  /// channel. This message overrides the default push notification message
  /// (DefaultPushNotificationMessage).
  final BaiduMessage? baiduMessage;

  /// The default message for all channels.
  final DefaultMessage? defaultMessage;

  /// The default push notification message for all push notification channels.
  final DefaultPushNotificationMessage? defaultPushNotificationMessage;

  /// The default message for the email channel. This message overrides the
  /// default message (DefaultMessage).
  final EmailMessage? emailMessage;

  /// The default push notification message for the GCM channel, which is used to
  /// send notifications through the Firebase Cloud Messaging (FCM), formerly
  /// Google Cloud Messaging (GCM), service. This message overrides the default
  /// push notification message (DefaultPushNotificationMessage).
  final GCMMessage? gCMMessage;

  /// The default message for the SMS channel. This message overrides the default
  /// message (DefaultMessage).
  final SMSMessage? sMSMessage;

  /// The default message for the voice channel. This message overrides the
  /// default message (DefaultMessage).
  final VoiceMessage? voiceMessage;

  DirectMessageConfiguration({
    this.aDMMessage,
    this.aPNSMessage,
    this.baiduMessage,
    this.defaultMessage,
    this.defaultPushNotificationMessage,
    this.emailMessage,
    this.gCMMessage,
    this.sMSMessage,
    this.voiceMessage,
  });

  Map<String, dynamic> toJson() {
    final aDMMessage = this.aDMMessage;
    final aPNSMessage = this.aPNSMessage;
    final baiduMessage = this.baiduMessage;
    final defaultMessage = this.defaultMessage;
    final defaultPushNotificationMessage = this.defaultPushNotificationMessage;
    final emailMessage = this.emailMessage;
    final gCMMessage = this.gCMMessage;
    final sMSMessage = this.sMSMessage;
    final voiceMessage = this.voiceMessage;
    return {
      if (aDMMessage != null) 'ADMMessage': aDMMessage,
      if (aPNSMessage != null) 'APNSMessage': aPNSMessage,
      if (baiduMessage != null) 'BaiduMessage': baiduMessage,
      if (defaultMessage != null) 'DefaultMessage': defaultMessage,
      if (defaultPushNotificationMessage != null)
        'DefaultPushNotificationMessage': defaultPushNotificationMessage,
      if (emailMessage != null) 'EmailMessage': emailMessage,
      if (gCMMessage != null) 'GCMMessage': gCMMessage,
      if (sMSMessage != null) 'SMSMessage': sMSMessage,
      if (voiceMessage != null) 'VoiceMessage': voiceMessage,
    };
  }
}

enum Duration {
  hr_24,
  day_7,
  day_14,
  day_30,
}

extension DurationValueExtension on Duration {
  String toValue() {
    switch (this) {
      case Duration.hr_24:
        return 'HR_24';
      case Duration.day_7:
        return 'DAY_7';
      case Duration.day_14:
        return 'DAY_14';
      case Duration.day_30:
        return 'DAY_30';
    }
  }
}

extension DurationFromString on String {
  Duration toDuration() {
    switch (this) {
      case 'HR_24':
        return Duration.hr_24;
      case 'DAY_7':
        return Duration.day_7;
      case 'DAY_14':
        return Duration.day_14;
      case 'DAY_30':
        return Duration.day_30;
    }
    throw Exception('$this is not known in enum Duration');
  }
}

/// Specifies the status and settings of the email channel for an application.
class EmailChannelRequest {
  /// The verified email address that you want to send email from when you send
  /// email through the channel.
  final String fromAddress;

  /// The Amazon Resource Name (ARN) of the identity, verified with Amazon Simple
  /// Email Service (Amazon SES), that you want to use when you send email through
  /// the channel.
  final String identity;

  /// The <a
  /// href="https://docs.aws.amazon.com/ses/latest/APIReference/API_ConfigurationSet.html">Amazon
  /// SES configuration set</a> that you want to apply to messages that you send
  /// through the channel.
  final String? configurationSet;

  /// Specifies whether to enable the email channel for the application.
  final bool? enabled;

  /// The ARN of an IAM role for Amazon Pinpoint to use to send email from your
  /// campaigns or journeys through Amazon SES.
  final String? orchestrationSendingRoleArn;

  /// The ARN of the AWS Identity and Access Management (IAM) role that you want
  /// Amazon Pinpoint to use when it submits email-related event data for the
  /// channel.
  final String? roleArn;

  EmailChannelRequest({
    required this.fromAddress,
    required this.identity,
    this.configurationSet,
    this.enabled,
    this.orchestrationSendingRoleArn,
    this.roleArn,
  });

  Map<String, dynamic> toJson() {
    final fromAddress = this.fromAddress;
    final identity = this.identity;
    final configurationSet = this.configurationSet;
    final enabled = this.enabled;
    final orchestrationSendingRoleArn = this.orchestrationSendingRoleArn;
    final roleArn = this.roleArn;
    return {
      'FromAddress': fromAddress,
      'Identity': identity,
      if (configurationSet != null) 'ConfigurationSet': configurationSet,
      if (enabled != null) 'Enabled': enabled,
      if (orchestrationSendingRoleArn != null)
        'OrchestrationSendingRoleArn': orchestrationSendingRoleArn,
      if (roleArn != null) 'RoleArn': roleArn,
    };
  }
}

/// Provides information about the status and settings of the email channel for
/// an application.
class EmailChannelResponse {
  /// The type of messaging or notification platform for the channel. For the
  /// email channel, this value is EMAIL.
  final String platform;

  /// The unique identifier for the application that the email channel applies to.
  final String? applicationId;

  /// The <a
  /// href="https://docs.aws.amazon.com/ses/latest/APIReference/API_ConfigurationSet.html">Amazon
  /// SES configuration set</a> that's applied to messages that are sent through
  /// the channel.
  final String? configurationSet;

  /// The date and time, in ISO 8601 format, when the email channel was enabled.
  final String? creationDate;

  /// Specifies whether the email channel is enabled for the application.
  final bool? enabled;

  /// The verified email address that email is sent from when you send email
  /// through the channel.
  final String? fromAddress;

  /// (Not used) This property is retained only for backward compatibility.
  final bool? hasCredential;

  /// (Deprecated) An identifier for the email channel. This property is retained
  /// only for backward compatibility.
  final String? id;

  /// The Amazon Resource Name (ARN) of the identity, verified with Amazon Simple
  /// Email Service (Amazon SES), that's used when you send email through the
  /// channel.
  final String? identity;

  /// Specifies whether the email channel is archived.
  final bool? isArchived;

  /// The user who last modified the email channel.
  final String? lastModifiedBy;

  /// The date and time, in ISO 8601 format, when the email channel was last
  /// modified.
  final String? lastModifiedDate;

  /// The maximum number of emails that can be sent through the channel each
  /// second.
  final int? messagesPerSecond;

  /// The ARN of an IAM role for Amazon Pinpoint to use to send email from your
  /// campaigns or journeys through Amazon SES.
  final String? orchestrationSendingRoleArn;

  /// The ARN of the AWS Identity and Access Management (IAM) role that Amazon
  /// Pinpoint uses to submit email-related event data for the channel.
  final String? roleArn;

  /// The current version of the email channel.
  final int? version;

  EmailChannelResponse({
    required this.platform,
    this.applicationId,
    this.configurationSet,
    this.creationDate,
    this.enabled,
    this.fromAddress,
    this.hasCredential,
    this.id,
    this.identity,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.messagesPerSecond,
    this.orchestrationSendingRoleArn,
    this.roleArn,
    this.version,
  });

  factory EmailChannelResponse.fromJson(Map<String, dynamic> json) {
    return EmailChannelResponse(
      platform: json['Platform'] as String,
      applicationId: json['ApplicationId'] as String?,
      configurationSet: json['ConfigurationSet'] as String?,
      creationDate: json['CreationDate'] as String?,
      enabled: json['Enabled'] as bool?,
      fromAddress: json['FromAddress'] as String?,
      hasCredential: json['HasCredential'] as bool?,
      id: json['Id'] as String?,
      identity: json['Identity'] as String?,
      isArchived: json['IsArchived'] as bool?,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: json['LastModifiedDate'] as String?,
      messagesPerSecond: json['MessagesPerSecond'] as int?,
      orchestrationSendingRoleArn:
          json['OrchestrationSendingRoleArn'] as String?,
      roleArn: json['RoleArn'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final platform = this.platform;
    final applicationId = this.applicationId;
    final configurationSet = this.configurationSet;
    final creationDate = this.creationDate;
    final enabled = this.enabled;
    final fromAddress = this.fromAddress;
    final hasCredential = this.hasCredential;
    final id = this.id;
    final identity = this.identity;
    final isArchived = this.isArchived;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final messagesPerSecond = this.messagesPerSecond;
    final orchestrationSendingRoleArn = this.orchestrationSendingRoleArn;
    final roleArn = this.roleArn;
    final version = this.version;
    return {
      'Platform': platform,
      if (applicationId != null) 'ApplicationId': applicationId,
      if (configurationSet != null) 'ConfigurationSet': configurationSet,
      if (creationDate != null) 'CreationDate': creationDate,
      if (enabled != null) 'Enabled': enabled,
      if (fromAddress != null) 'FromAddress': fromAddress,
      if (hasCredential != null) 'HasCredential': hasCredential,
      if (id != null) 'Id': id,
      if (identity != null) 'Identity': identity,
      if (isArchived != null) 'IsArchived': isArchived,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (messagesPerSecond != null) 'MessagesPerSecond': messagesPerSecond,
      if (orchestrationSendingRoleArn != null)
        'OrchestrationSendingRoleArn': orchestrationSendingRoleArn,
      if (roleArn != null) 'RoleArn': roleArn,
      if (version != null) 'Version': version,
    };
  }
}

/// Specifies the default settings and content for a one-time email message
/// that's sent directly to an endpoint.
class EmailMessage {
  /// The body of the email message.
  final String? body;

  /// The email address to forward bounces and complaints to, if feedback
  /// forwarding is enabled.
  final String? feedbackForwardingAddress;

  /// The verified email address to send the email message from. The default value
  /// is the FromAddress specified for the email channel.
  final String? fromAddress;

  /// The email message, represented as a raw MIME message.
  final RawEmail? rawEmail;

  /// The reply-to email address(es) for the email message. If a recipient replies
  /// to the email, each reply-to address receives the reply.
  final List<String>? replyToAddresses;

  /// The email message, composed of a subject, a text part, and an HTML part.
  final SimpleEmail? simpleEmail;

  /// The default message variables to use in the email message. You can override
  /// the default variables with individual address variables.
  final Map<String, List<String>>? substitutions;

  EmailMessage({
    this.body,
    this.feedbackForwardingAddress,
    this.fromAddress,
    this.rawEmail,
    this.replyToAddresses,
    this.simpleEmail,
    this.substitutions,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final feedbackForwardingAddress = this.feedbackForwardingAddress;
    final fromAddress = this.fromAddress;
    final rawEmail = this.rawEmail;
    final replyToAddresses = this.replyToAddresses;
    final simpleEmail = this.simpleEmail;
    final substitutions = this.substitutions;
    return {
      if (body != null) 'Body': body,
      if (feedbackForwardingAddress != null)
        'FeedbackForwardingAddress': feedbackForwardingAddress,
      if (fromAddress != null) 'FromAddress': fromAddress,
      if (rawEmail != null) 'RawEmail': rawEmail,
      if (replyToAddresses != null) 'ReplyToAddresses': replyToAddresses,
      if (simpleEmail != null) 'SimpleEmail': simpleEmail,
      if (substitutions != null) 'Substitutions': substitutions,
    };
  }
}

/// Specifies the settings for an email activity in a journey. This type of
/// activity sends an email message to participants.
class EmailMessageActivity {
  /// Specifies the sender address for an email message that's sent to
  /// participants in the journey.
  final JourneyEmailMessage? messageConfig;

  /// The unique identifier for the next activity to perform, after the message is
  /// sent.
  final String? nextActivity;

  /// The name of the email message template to use for the message. If specified,
  /// this value must match the name of an existing message template.
  final String? templateName;

  /// The unique identifier for the version of the email template to use for the
  /// message. If specified, this value must match the identifier for an existing
  /// template version. To retrieve a list of versions and version identifiers for
  /// a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  ///
  /// If you don't specify a value for this property, Amazon Pinpoint uses the
  /// <i>active version</i> of the template. The <i>active version</i> is
  /// typically the version of a template that's been most recently reviewed and
  /// approved for use, depending on your workflow. It isn't necessarily the
  /// latest version of a template.
  final String? templateVersion;

  EmailMessageActivity({
    this.messageConfig,
    this.nextActivity,
    this.templateName,
    this.templateVersion,
  });

  factory EmailMessageActivity.fromJson(Map<String, dynamic> json) {
    return EmailMessageActivity(
      messageConfig: json['MessageConfig'] != null
          ? JourneyEmailMessage.fromJson(
              json['MessageConfig'] as Map<String, dynamic>)
          : null,
      nextActivity: json['NextActivity'] as String?,
      templateName: json['TemplateName'] as String?,
      templateVersion: json['TemplateVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messageConfig = this.messageConfig;
    final nextActivity = this.nextActivity;
    final templateName = this.templateName;
    final templateVersion = this.templateVersion;
    return {
      if (messageConfig != null) 'MessageConfig': messageConfig,
      if (nextActivity != null) 'NextActivity': nextActivity,
      if (templateName != null) 'TemplateName': templateName,
      if (templateVersion != null) 'TemplateVersion': templateVersion,
    };
  }
}

/// Specifies the content and settings for a message template that can be used
/// in messages that are sent through the email channel.
class EmailTemplateRequest {
  /// A JSON object that specifies the default values to use for message variables
  /// in the message template. This object is a set of key-value pairs. Each key
  /// defines a message variable in the template. The corresponding value defines
  /// the default value for that variable. When you create a message that's based
  /// on the template, you can override these defaults with message-specific and
  /// address-specific variables and values.
  final String? defaultSubstitutions;

  /// The list of <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/templates-template-name-email.html#templates-template-name-email-model-messageheader">MessageHeaders</a>
  /// for the email. You can have up to 15 Headers.
  final List<MessageHeader>? headers;

  /// The message body, in HTML format, to use in email messages that are based on
  /// the message template. We recommend using HTML format for email clients that
  /// render HTML content. You can include links, formatted text, and more in an
  /// HTML message.
  final String? htmlPart;

  /// The unique identifier for the recommender model to use for the message
  /// template. Amazon Pinpoint uses this value to determine how to retrieve and
  /// process data from a recommender model when it sends messages that use the
  /// template, if the template contains message variables for recommendation
  /// data.
  final String? recommenderId;

  /// The subject line, or title, to use in email messages that are based on the
  /// message template.
  final String? subject;

  /// A custom description of the message template.
  final String? templateDescription;

  /// The message body, in plain text format, to use in email messages that are
  /// based on the message template. We recommend using plain text format for
  /// email clients that don't render HTML content and clients that are connected
  /// to high-latency networks, such as mobile devices.
  final String? textPart;

  /// <note>
  /// As of <b>22-05-2023</b> tags has been deprecated for update operations.
  /// After this date any value in tags is not processed and an error code is not
  /// returned. To manage tags we recommend using either <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/tags-resource-arn.html">Tags</a>
  /// in the <i>API Reference for Amazon Pinpoint</i>, <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/resourcegroupstaggingapi/index.html">resourcegroupstaggingapi</a>
  /// commands in the <i>AWS Command Line Interface Documentation</i> or <a
  /// href="https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/services/resourcegroupstaggingapi/package-summary.html">resourcegroupstaggingapi</a>
  /// in the <i>AWS SDK</i>.
  /// </note>
  /// (Deprecated) A string-to-string map of key-value pairs that defines the tags
  /// to associate with the message template. Each tag consists of a required tag
  /// key and an associated tag value.
  final Map<String, String>? tags;

  EmailTemplateRequest({
    this.defaultSubstitutions,
    this.headers,
    this.htmlPart,
    this.recommenderId,
    this.subject,
    this.templateDescription,
    this.textPart,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final defaultSubstitutions = this.defaultSubstitutions;
    final headers = this.headers;
    final htmlPart = this.htmlPart;
    final recommenderId = this.recommenderId;
    final subject = this.subject;
    final templateDescription = this.templateDescription;
    final textPart = this.textPart;
    final tags = this.tags;
    return {
      if (defaultSubstitutions != null)
        'DefaultSubstitutions': defaultSubstitutions,
      if (headers != null) 'Headers': headers,
      if (htmlPart != null) 'HtmlPart': htmlPart,
      if (recommenderId != null) 'RecommenderId': recommenderId,
      if (subject != null) 'Subject': subject,
      if (templateDescription != null)
        'TemplateDescription': templateDescription,
      if (textPart != null) 'TextPart': textPart,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Provides information about the content and settings for a message template
/// that can be used in messages that are sent through the email channel.
class EmailTemplateResponse {
  /// The date, in ISO 8601 format, when the message template was created.
  final String creationDate;

  /// The date, in ISO 8601 format, when the message template was last modified.
  final String lastModifiedDate;

  /// The name of the message template.
  final String templateName;

  /// The type of channel that the message template is designed for. For an email
  /// template, this value is EMAIL.
  final TemplateType templateType;

  /// The Amazon Resource Name (ARN) of the message template.
  final String? arn;

  /// The JSON object that specifies the default values that are used for message
  /// variables in the message template. This object is a set of key-value pairs.
  /// Each key defines a message variable in the template. The corresponding value
  /// defines the default value for that variable.
  final String? defaultSubstitutions;

  /// The list of <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/templates-template-name-email.html#templates-template-name-email-model-messageheader">MessageHeaders</a>
  /// for the email. You can have up to 15 Headers.
  final List<MessageHeader>? headers;

  /// The message body, in HTML format, that's used in email messages that are
  /// based on the message template.
  final String? htmlPart;

  /// The unique identifier for the recommender model that's used by the message
  /// template.
  final String? recommenderId;

  /// The subject line, or title, that's used in email messages that are based on
  /// the message template.
  final String? subject;

  /// The custom description of the message template.
  final String? templateDescription;

  /// The message body, in plain text format, that's used in email messages that
  /// are based on the message template.
  final String? textPart;

  /// The unique identifier, as an integer, for the active version of the message
  /// template, or the version of the template that you specified by using the
  /// version parameter in your request.
  final String? version;

  /// A string-to-string map of key-value pairs that identifies the tags that are
  /// associated with the message template. Each tag consists of a required tag
  /// key and an associated tag value.
  final Map<String, String>? tags;

  EmailTemplateResponse({
    required this.creationDate,
    required this.lastModifiedDate,
    required this.templateName,
    required this.templateType,
    this.arn,
    this.defaultSubstitutions,
    this.headers,
    this.htmlPart,
    this.recommenderId,
    this.subject,
    this.templateDescription,
    this.textPart,
    this.version,
    this.tags,
  });

  factory EmailTemplateResponse.fromJson(Map<String, dynamic> json) {
    return EmailTemplateResponse(
      creationDate: json['CreationDate'] as String,
      lastModifiedDate: json['LastModifiedDate'] as String,
      templateName: json['TemplateName'] as String,
      templateType: (json['TemplateType'] as String).toTemplateType(),
      arn: json['Arn'] as String?,
      defaultSubstitutions: json['DefaultSubstitutions'] as String?,
      headers: (json['Headers'] as List?)
          ?.whereNotNull()
          .map((e) => MessageHeader.fromJson(e as Map<String, dynamic>))
          .toList(),
      htmlPart: json['HtmlPart'] as String?,
      recommenderId: json['RecommenderId'] as String?,
      subject: json['Subject'] as String?,
      templateDescription: json['TemplateDescription'] as String?,
      textPart: json['TextPart'] as String?,
      version: json['Version'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final lastModifiedDate = this.lastModifiedDate;
    final templateName = this.templateName;
    final templateType = this.templateType;
    final arn = this.arn;
    final defaultSubstitutions = this.defaultSubstitutions;
    final headers = this.headers;
    final htmlPart = this.htmlPart;
    final recommenderId = this.recommenderId;
    final subject = this.subject;
    final templateDescription = this.templateDescription;
    final textPart = this.textPart;
    final version = this.version;
    final tags = this.tags;
    return {
      'CreationDate': creationDate,
      'LastModifiedDate': lastModifiedDate,
      'TemplateName': templateName,
      'TemplateType': templateType.toValue(),
      if (arn != null) 'Arn': arn,
      if (defaultSubstitutions != null)
        'DefaultSubstitutions': defaultSubstitutions,
      if (headers != null) 'Headers': headers,
      if (htmlPart != null) 'HtmlPart': htmlPart,
      if (recommenderId != null) 'RecommenderId': recommenderId,
      if (subject != null) 'Subject': subject,
      if (templateDescription != null)
        'TemplateDescription': templateDescription,
      if (textPart != null) 'TextPart': textPart,
      if (version != null) 'Version': version,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Specifies an endpoint to create or update and the settings and attributes to
/// set or change for the endpoint.
class EndpointBatchItem {
  /// The destination address for messages or push notifications that you send to
  /// the endpoint. The address varies by channel. For a push-notification
  /// channel, use the token provided by the push notification service, such as an
  /// Apple Push Notification service (APNs) device token or a Firebase Cloud
  /// Messaging (FCM) registration token. For the SMS channel, use a phone number
  /// in E.164 format, such as +12065550100. For the email channel, use an email
  /// address.
  final String? address;

  /// One or more custom attributes that describe the endpoint by associating a
  /// name with an array of values. For example, the value of a custom attribute
  /// named Interests might be: ["Science", "Music", "Travel"]. You can use these
  /// attributes as filter criteria when you create segments. Attribute names are
  /// case sensitive.
  ///
  /// An attribute name can contain up to 50 characters. An attribute value can
  /// contain up to 100 characters. When you define the name of a custom
  /// attribute, avoid using the following characters: number sign (#), colon (:),
  /// question mark (?), backslash (\), and slash (/). The Amazon Pinpoint console
  /// can't display attribute names that contain these characters. This
  /// restriction doesn't apply to attribute values.
  final Map<String, List<String>>? attributes;

  /// The channel to use when sending messages or push notifications to the
  /// endpoint.
  final ChannelType? channelType;

  /// The demographic information for the endpoint, such as the time zone and
  /// platform.
  final EndpointDemographic? demographic;

  /// The date and time, in ISO 8601 format, when the endpoint was created or
  /// updated.
  final String? effectiveDate;

  /// Specifies whether to send messages or push notifications to the endpoint.
  /// Valid values are: ACTIVE, messages are sent to the endpoint; and, INACTIVE,
  /// messages aren’t sent to the endpoint.
  ///
  /// Amazon Pinpoint automatically sets this value to ACTIVE when you create an
  /// endpoint or update an existing endpoint. Amazon Pinpoint automatically sets
  /// this value to INACTIVE if you update another endpoint that has the same
  /// address specified by the Address property.
  final String? endpointStatus;

  /// The unique identifier for the endpoint in the context of the batch.
  final String? id;

  /// The geographic information for the endpoint.
  final EndpointLocation? location;

  /// One or more custom metrics that your app reports to Amazon Pinpoint for the
  /// endpoint.
  final Map<String, double>? metrics;

  /// Specifies whether the user who's associated with the endpoint has opted out
  /// of receiving messages and push notifications from you. Possible values are:
  /// ALL, the user has opted out and doesn't want to receive any messages or push
  /// notifications; and, NONE, the user hasn't opted out and wants to receive all
  /// messages and push notifications.
  final String? optOut;

  /// The unique identifier for the request to create or update the endpoint.
  final String? requestId;

  /// One or more custom attributes that describe the user who's associated with
  /// the endpoint.
  final EndpointUser? user;

  EndpointBatchItem({
    this.address,
    this.attributes,
    this.channelType,
    this.demographic,
    this.effectiveDate,
    this.endpointStatus,
    this.id,
    this.location,
    this.metrics,
    this.optOut,
    this.requestId,
    this.user,
  });

  Map<String, dynamic> toJson() {
    final address = this.address;
    final attributes = this.attributes;
    final channelType = this.channelType;
    final demographic = this.demographic;
    final effectiveDate = this.effectiveDate;
    final endpointStatus = this.endpointStatus;
    final id = this.id;
    final location = this.location;
    final metrics = this.metrics;
    final optOut = this.optOut;
    final requestId = this.requestId;
    final user = this.user;
    return {
      if (address != null) 'Address': address,
      if (attributes != null) 'Attributes': attributes,
      if (channelType != null) 'ChannelType': channelType.toValue(),
      if (demographic != null) 'Demographic': demographic,
      if (effectiveDate != null) 'EffectiveDate': effectiveDate,
      if (endpointStatus != null) 'EndpointStatus': endpointStatus,
      if (id != null) 'Id': id,
      if (location != null) 'Location': location,
      if (metrics != null) 'Metrics': metrics,
      if (optOut != null) 'OptOut': optOut,
      if (requestId != null) 'RequestId': requestId,
      if (user != null) 'User': user,
    };
  }
}

/// Specifies a batch of endpoints to create or update and the settings and
/// attributes to set or change for each endpoint.
class EndpointBatchRequest {
  /// An array that defines the endpoints to create or update and, for each
  /// endpoint, the property values to set or change. An array can contain a
  /// maximum of 100 items.
  final List<EndpointBatchItem> item;

  EndpointBatchRequest({
    required this.item,
  });

  Map<String, dynamic> toJson() {
    final item = this.item;
    return {
      'Item': item,
    };
  }
}

/// Specifies demographic information about an endpoint, such as the applicable
/// time zone and platform.
class EndpointDemographic {
  /// The version of the app that's associated with the endpoint.
  final String? appVersion;

  /// The locale of the endpoint, in the following format: the ISO 639-1 alpha-2
  /// code, followed by an underscore (_), followed by an ISO 3166-1 alpha-2
  /// value.
  final String? locale;

  /// The manufacturer of the endpoint device, such as apple or samsung.
  final String? make;

  /// The model name or number of the endpoint device, such as iPhone or SM-G900F.
  final String? model;

  /// The model version of the endpoint device.
  final String? modelVersion;

  /// The platform of the endpoint device, such as ios.
  final String? platform;

  /// The platform version of the endpoint device.
  final String? platformVersion;

  /// The time zone of the endpoint, specified as a tz database name value, such
  /// as America/Los_Angeles.
  final String? timezone;

  EndpointDemographic({
    this.appVersion,
    this.locale,
    this.make,
    this.model,
    this.modelVersion,
    this.platform,
    this.platformVersion,
    this.timezone,
  });

  factory EndpointDemographic.fromJson(Map<String, dynamic> json) {
    return EndpointDemographic(
      appVersion: json['AppVersion'] as String?,
      locale: json['Locale'] as String?,
      make: json['Make'] as String?,
      model: json['Model'] as String?,
      modelVersion: json['ModelVersion'] as String?,
      platform: json['Platform'] as String?,
      platformVersion: json['PlatformVersion'] as String?,
      timezone: json['Timezone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appVersion = this.appVersion;
    final locale = this.locale;
    final make = this.make;
    final model = this.model;
    final modelVersion = this.modelVersion;
    final platform = this.platform;
    final platformVersion = this.platformVersion;
    final timezone = this.timezone;
    return {
      if (appVersion != null) 'AppVersion': appVersion,
      if (locale != null) 'Locale': locale,
      if (make != null) 'Make': make,
      if (model != null) 'Model': model,
      if (modelVersion != null) 'ModelVersion': modelVersion,
      if (platform != null) 'Platform': platform,
      if (platformVersion != null) 'PlatformVersion': platformVersion,
      if (timezone != null) 'Timezone': timezone,
    };
  }
}

/// Provides the status code and message that result from processing data for an
/// endpoint.
class EndpointItemResponse {
  /// The custom message that's returned in the response as a result of processing
  /// the endpoint data.
  final String? message;

  /// The status code that's returned in the response as a result of processing
  /// the endpoint data.
  final int? statusCode;

  EndpointItemResponse({
    this.message,
    this.statusCode,
  });

  factory EndpointItemResponse.fromJson(Map<String, dynamic> json) {
    return EndpointItemResponse(
      message: json['Message'] as String?,
      statusCode: json['StatusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final statusCode = this.statusCode;
    return {
      if (message != null) 'Message': message,
      if (statusCode != null) 'StatusCode': statusCode,
    };
  }
}

/// Specifies geographic information about an endpoint.
class EndpointLocation {
  /// The name of the city where the endpoint is located.
  final String? city;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region where the endpoint is located. For example, US for the United States.
  final String? country;

  /// The latitude coordinate of the endpoint location, rounded to one decimal
  /// place.
  final double? latitude;

  /// The longitude coordinate of the endpoint location, rounded to one decimal
  /// place.
  final double? longitude;

  /// The postal or ZIP code for the area where the endpoint is located.
  final String? postalCode;

  /// The name of the region where the endpoint is located. For locations in the
  /// United States, this value is the name of a state.
  final String? region;

  EndpointLocation({
    this.city,
    this.country,
    this.latitude,
    this.longitude,
    this.postalCode,
    this.region,
  });

  factory EndpointLocation.fromJson(Map<String, dynamic> json) {
    return EndpointLocation(
      city: json['City'] as String?,
      country: json['Country'] as String?,
      latitude: json['Latitude'] as double?,
      longitude: json['Longitude'] as double?,
      postalCode: json['PostalCode'] as String?,
      region: json['Region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final city = this.city;
    final country = this.country;
    final latitude = this.latitude;
    final longitude = this.longitude;
    final postalCode = this.postalCode;
    final region = this.region;
    return {
      if (city != null) 'City': city,
      if (country != null) 'Country': country,
      if (latitude != null) 'Latitude': latitude,
      if (longitude != null) 'Longitude': longitude,
      if (postalCode != null) 'PostalCode': postalCode,
      if (region != null) 'Region': region,
    };
  }
}

/// Provides information about the delivery status and results of sending a
/// message directly to an endpoint.
class EndpointMessageResult {
  /// The delivery status of the message. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// DUPLICATE - The endpoint address is a duplicate of another endpoint address.
  /// Amazon Pinpoint won't attempt to send the message again.
  /// </li>
  /// <li>
  /// OPT_OUT - The user who's associated with the endpoint has opted out of
  /// receiving messages from you. Amazon Pinpoint won't attempt to send the
  /// message again.
  /// </li>
  /// <li>
  /// PERMANENT_FAILURE - An error occurred when delivering the message to the
  /// endpoint. Amazon Pinpoint won't attempt to send the message again.
  /// </li>
  /// <li>
  /// SUCCESSFUL - The message was successfully delivered to the endpoint.
  /// </li>
  /// <li>
  /// TEMPORARY_FAILURE - A temporary error occurred. Amazon Pinpoint won't
  /// attempt to send the message again.
  /// </li>
  /// <li>
  /// THROTTLED - Amazon Pinpoint throttled the operation to send the message to
  /// the endpoint.
  /// </li>
  /// <li>
  /// UNKNOWN_FAILURE - An unknown error occurred.
  /// </li>
  /// </ul>
  final DeliveryStatus deliveryStatus;

  /// The downstream service status code for delivering the message.
  final int statusCode;

  /// The endpoint address that the message was delivered to.
  final String? address;

  /// The unique identifier for the message that was sent.
  final String? messageId;

  /// The status message for delivering the message.
  final String? statusMessage;

  /// For push notifications that are sent through the GCM channel, specifies
  /// whether the endpoint's device registration token was updated as part of
  /// delivering the message.
  final String? updatedToken;

  EndpointMessageResult({
    required this.deliveryStatus,
    required this.statusCode,
    this.address,
    this.messageId,
    this.statusMessage,
    this.updatedToken,
  });

  factory EndpointMessageResult.fromJson(Map<String, dynamic> json) {
    return EndpointMessageResult(
      deliveryStatus: (json['DeliveryStatus'] as String).toDeliveryStatus(),
      statusCode: json['StatusCode'] as int,
      address: json['Address'] as String?,
      messageId: json['MessageId'] as String?,
      statusMessage: json['StatusMessage'] as String?,
      updatedToken: json['UpdatedToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryStatus = this.deliveryStatus;
    final statusCode = this.statusCode;
    final address = this.address;
    final messageId = this.messageId;
    final statusMessage = this.statusMessage;
    final updatedToken = this.updatedToken;
    return {
      'DeliveryStatus': deliveryStatus.toValue(),
      'StatusCode': statusCode,
      if (address != null) 'Address': address,
      if (messageId != null) 'MessageId': messageId,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (updatedToken != null) 'UpdatedToken': updatedToken,
    };
  }
}

/// Specifies the channel type and other settings for an endpoint.
class EndpointRequest {
  /// The destination address for messages or push notifications that you send to
  /// the endpoint. The address varies by channel. For a push-notification
  /// channel, use the token provided by the push notification service, such as an
  /// Apple Push Notification service (APNs) device token or a Firebase Cloud
  /// Messaging (FCM) registration token. For the SMS channel, use a phone number
  /// in E.164 format, such as +12065550100. For the email channel, use an email
  /// address.
  final String? address;

  /// One or more custom attributes that describe the endpoint by associating a
  /// name with an array of values. For example, the value of a custom attribute
  /// named Interests might be: ["Science", "Music", "Travel"]. You can use these
  /// attributes as filter criteria when you create segments. Attribute names are
  /// case sensitive.
  ///
  /// An attribute name can contain up to 50 characters. An attribute value can
  /// contain up to 100 characters. When you define the name of a custom
  /// attribute, avoid using the following characters: number sign (#), colon (:),
  /// question mark (?), backslash (\), and slash (/). The Amazon Pinpoint console
  /// can't display attribute names that contain these characters. This
  /// restriction doesn't apply to attribute values.
  final Map<String, List<String>>? attributes;

  /// The channel to use when sending messages or push notifications to the
  /// endpoint.
  final ChannelType? channelType;

  /// The demographic information for the endpoint, such as the time zone and
  /// platform.
  final EndpointDemographic? demographic;

  /// The date and time, in ISO 8601 format, when the endpoint is updated.
  final String? effectiveDate;

  /// Specifies whether to send messages or push notifications to the endpoint.
  /// Valid values are: ACTIVE, messages are sent to the endpoint; and, INACTIVE,
  /// messages aren’t sent to the endpoint.
  ///
  /// Amazon Pinpoint automatically sets this value to ACTIVE when you create an
  /// endpoint or update an existing endpoint. Amazon Pinpoint automatically sets
  /// this value to INACTIVE if you update another endpoint that has the same
  /// address specified by the Address property.
  final String? endpointStatus;

  /// The geographic information for the endpoint.
  final EndpointLocation? location;

  /// One or more custom metrics that your app reports to Amazon Pinpoint for the
  /// endpoint.
  final Map<String, double>? metrics;

  /// Specifies whether the user who's associated with the endpoint has opted out
  /// of receiving messages and push notifications from you. Possible values are:
  /// ALL, the user has opted out and doesn't want to receive any messages or push
  /// notifications; and, NONE, the user hasn't opted out and wants to receive all
  /// messages and push notifications.
  final String? optOut;

  /// The unique identifier for the most recent request to update the endpoint.
  final String? requestId;

  /// One or more custom attributes that describe the user who's associated with
  /// the endpoint.
  final EndpointUser? user;

  EndpointRequest({
    this.address,
    this.attributes,
    this.channelType,
    this.demographic,
    this.effectiveDate,
    this.endpointStatus,
    this.location,
    this.metrics,
    this.optOut,
    this.requestId,
    this.user,
  });

  Map<String, dynamic> toJson() {
    final address = this.address;
    final attributes = this.attributes;
    final channelType = this.channelType;
    final demographic = this.demographic;
    final effectiveDate = this.effectiveDate;
    final endpointStatus = this.endpointStatus;
    final location = this.location;
    final metrics = this.metrics;
    final optOut = this.optOut;
    final requestId = this.requestId;
    final user = this.user;
    return {
      if (address != null) 'Address': address,
      if (attributes != null) 'Attributes': attributes,
      if (channelType != null) 'ChannelType': channelType.toValue(),
      if (demographic != null) 'Demographic': demographic,
      if (effectiveDate != null) 'EffectiveDate': effectiveDate,
      if (endpointStatus != null) 'EndpointStatus': endpointStatus,
      if (location != null) 'Location': location,
      if (metrics != null) 'Metrics': metrics,
      if (optOut != null) 'OptOut': optOut,
      if (requestId != null) 'RequestId': requestId,
      if (user != null) 'User': user,
    };
  }
}

/// Provides information about the channel type and other settings for an
/// endpoint.
class EndpointResponse {
  /// The destination address for messages or push notifications that you send to
  /// the endpoint. The address varies by channel. For example, the address for a
  /// push-notification channel is typically the token provided by a push
  /// notification service, such as an Apple Push Notification service (APNs)
  /// device token or a Firebase Cloud Messaging (FCM) registration token. The
  /// address for the SMS channel is a phone number in E.164 format, such as
  /// +12065550100. The address for the email channel is an email address.
  final String? address;

  /// The unique identifier for the application that's associated with the
  /// endpoint.
  final String? applicationId;

  /// One or more custom attributes that describe the endpoint by associating a
  /// name with an array of values. For example, the value of a custom attribute
  /// named Interests might be: ["Science", "Music", "Travel"]. You can use these
  /// attributes as filter criteria when you create segments.
  final Map<String, List<String>>? attributes;

  /// The channel that's used when sending messages or push notifications to the
  /// endpoint.
  final ChannelType? channelType;

  /// A number from 0-99 that represents the cohort that the endpoint is assigned
  /// to. Endpoints are grouped into cohorts randomly, and each cohort contains
  /// approximately 1 percent of the endpoints for an application. Amazon Pinpoint
  /// assigns cohorts to the holdout or treatment allocations for campaigns.
  final String? cohortId;

  /// The date and time, in ISO 8601 format, when the endpoint was created.
  final String? creationDate;

  /// The demographic information for the endpoint, such as the time zone and
  /// platform.
  final EndpointDemographic? demographic;

  /// The date and time, in ISO 8601 format, when the endpoint was last updated.
  final String? effectiveDate;

  /// Specifies whether messages or push notifications are sent to the endpoint.
  /// Possible values are: ACTIVE, messages are sent to the endpoint; and,
  /// INACTIVE, messages aren’t sent to the endpoint.
  ///
  /// Amazon Pinpoint automatically sets this value to ACTIVE when you create an
  /// endpoint or update an existing endpoint. Amazon Pinpoint automatically sets
  /// this value to INACTIVE if you update another endpoint that has the same
  /// address specified by the Address property.
  final String? endpointStatus;

  /// The unique identifier that you assigned to the endpoint. The identifier
  /// should be a globally unique identifier (GUID) to ensure that it doesn't
  /// conflict with other endpoint identifiers that are associated with the
  /// application.
  final String? id;

  /// The geographic information for the endpoint.
  final EndpointLocation? location;

  /// One or more custom metrics that your app reports to Amazon Pinpoint for the
  /// endpoint.
  final Map<String, double>? metrics;

  /// Specifies whether the user who's associated with the endpoint has opted out
  /// of receiving messages and push notifications from you. Possible values are:
  /// ALL, the user has opted out and doesn't want to receive any messages or push
  /// notifications; and, NONE, the user hasn't opted out and wants to receive all
  /// messages and push notifications.
  final String? optOut;

  /// The unique identifier for the most recent request to update the endpoint.
  final String? requestId;

  /// One or more custom user attributes that your app reports to Amazon Pinpoint
  /// for the user who's associated with the endpoint.
  final EndpointUser? user;

  EndpointResponse({
    this.address,
    this.applicationId,
    this.attributes,
    this.channelType,
    this.cohortId,
    this.creationDate,
    this.demographic,
    this.effectiveDate,
    this.endpointStatus,
    this.id,
    this.location,
    this.metrics,
    this.optOut,
    this.requestId,
    this.user,
  });

  factory EndpointResponse.fromJson(Map<String, dynamic> json) {
    return EndpointResponse(
      address: json['Address'] as String?,
      applicationId: json['ApplicationId'] as String?,
      attributes: (json['Attributes'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
      channelType: (json['ChannelType'] as String?)?.toChannelType(),
      cohortId: json['CohortId'] as String?,
      creationDate: json['CreationDate'] as String?,
      demographic: json['Demographic'] != null
          ? EndpointDemographic.fromJson(
              json['Demographic'] as Map<String, dynamic>)
          : null,
      effectiveDate: json['EffectiveDate'] as String?,
      endpointStatus: json['EndpointStatus'] as String?,
      id: json['Id'] as String?,
      location: json['Location'] != null
          ? EndpointLocation.fromJson(json['Location'] as Map<String, dynamic>)
          : null,
      metrics: (json['Metrics'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as double)),
      optOut: json['OptOut'] as String?,
      requestId: json['RequestId'] as String?,
      user: json['User'] != null
          ? EndpointUser.fromJson(json['User'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final applicationId = this.applicationId;
    final attributes = this.attributes;
    final channelType = this.channelType;
    final cohortId = this.cohortId;
    final creationDate = this.creationDate;
    final demographic = this.demographic;
    final effectiveDate = this.effectiveDate;
    final endpointStatus = this.endpointStatus;
    final id = this.id;
    final location = this.location;
    final metrics = this.metrics;
    final optOut = this.optOut;
    final requestId = this.requestId;
    final user = this.user;
    return {
      if (address != null) 'Address': address,
      if (applicationId != null) 'ApplicationId': applicationId,
      if (attributes != null) 'Attributes': attributes,
      if (channelType != null) 'ChannelType': channelType.toValue(),
      if (cohortId != null) 'CohortId': cohortId,
      if (creationDate != null) 'CreationDate': creationDate,
      if (demographic != null) 'Demographic': demographic,
      if (effectiveDate != null) 'EffectiveDate': effectiveDate,
      if (endpointStatus != null) 'EndpointStatus': endpointStatus,
      if (id != null) 'Id': id,
      if (location != null) 'Location': location,
      if (metrics != null) 'Metrics': metrics,
      if (optOut != null) 'OptOut': optOut,
      if (requestId != null) 'RequestId': requestId,
      if (user != null) 'User': user,
    };
  }
}

/// Specifies the content, including message variables and attributes, to use in
/// a message that's sent directly to an endpoint.
class EndpointSendConfiguration {
  /// The body of the message. If specified, this value overrides the default
  /// message body.
  final String? bodyOverride;

  /// A map of custom attributes to attach to the message for the address.
  /// Attribute names are case sensitive.
  ///
  /// For a push notification, this payload is added to the data.pinpoint object.
  /// For an email or text message, this payload is added to email/SMS delivery
  /// receipt event attributes.
  final Map<String, String>? context;

  /// The raw, JSON-formatted string to use as the payload for the message. If
  /// specified, this value overrides all other values for the message.
  final String? rawContent;

  /// A map of the message variables to merge with the variables specified for the
  /// default message (DefaultMessage.Substitutions). The variables specified in
  /// this map take precedence over all other variables.
  final Map<String, List<String>>? substitutions;

  /// The title or subject line of the message. If specified, this value overrides
  /// the default message title or subject line.
  final String? titleOverride;

  EndpointSendConfiguration({
    this.bodyOverride,
    this.context,
    this.rawContent,
    this.substitutions,
    this.titleOverride,
  });

  Map<String, dynamic> toJson() {
    final bodyOverride = this.bodyOverride;
    final context = this.context;
    final rawContent = this.rawContent;
    final substitutions = this.substitutions;
    final titleOverride = this.titleOverride;
    return {
      if (bodyOverride != null) 'BodyOverride': bodyOverride,
      if (context != null) 'Context': context,
      if (rawContent != null) 'RawContent': rawContent,
      if (substitutions != null) 'Substitutions': substitutions,
      if (titleOverride != null) 'TitleOverride': titleOverride,
    };
  }
}

/// Specifies data for one or more attributes that describe the user who's
/// associated with an endpoint.
class EndpointUser {
  /// One or more custom attributes that describe the user by associating a name
  /// with an array of values. For example, the value of an attribute named
  /// Interests might be: ["Science", "Music", "Travel"]. You can use these
  /// attributes as filter criteria when you create segments. Attribute names are
  /// case sensitive.
  ///
  /// An attribute name can contain up to 50 characters. An attribute value can
  /// contain up to 100 characters. When you define the name of a custom
  /// attribute, avoid using the following characters: number sign (#), colon (:),
  /// question mark (?), backslash (\), and slash (/). The Amazon Pinpoint console
  /// can't display attribute names that contain these characters. This
  /// restriction doesn't apply to attribute values.
  final Map<String, List<String>>? userAttributes;

  /// The unique identifier for the user.
  final String? userId;

  EndpointUser({
    this.userAttributes,
    this.userId,
  });

  factory EndpointUser.fromJson(Map<String, dynamic> json) {
    return EndpointUser(
      userAttributes: (json['UserAttributes'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
      userId: json['UserId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final userAttributes = this.userAttributes;
    final userId = this.userId;
    return {
      if (userAttributes != null) 'UserAttributes': userAttributes,
      if (userId != null) 'UserId': userId,
    };
  }
}

/// Provides information about all the endpoints that are associated with a user
/// ID.
class EndpointsResponse {
  /// An array of responses, one for each endpoint that's associated with the user
  /// ID.
  final List<EndpointResponse> item;

  EndpointsResponse({
    required this.item,
  });

  factory EndpointsResponse.fromJson(Map<String, dynamic> json) {
    return EndpointsResponse(
      item: (json['Item'] as List)
          .whereNotNull()
          .map((e) => EndpointResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final item = this.item;
    return {
      'Item': item,
    };
  }
}

/// Specifies information about an event that reports data to Amazon Pinpoint.
class Event {
  /// The name of the event.
  final String eventType;

  /// The date and time, in ISO 8601 format, when the event occurred.
  final String timestamp;

  /// The package name of the app that's recording the event.
  final String? appPackageName;

  /// The title of the app that's recording the event.
  final String? appTitle;

  /// The version number of the app that's recording the event.
  final String? appVersionCode;

  /// One or more custom attributes that are associated with the event.
  final Map<String, String>? attributes;

  /// The version of the SDK that's running on the client device.
  final String? clientSdkVersion;

  /// One or more custom metrics that are associated with the event.
  final Map<String, double>? metrics;

  /// The name of the SDK that's being used to record the event.
  final String? sdkName;

  /// Information about the session in which the event occurred.
  final Session? session;

  Event({
    required this.eventType,
    required this.timestamp,
    this.appPackageName,
    this.appTitle,
    this.appVersionCode,
    this.attributes,
    this.clientSdkVersion,
    this.metrics,
    this.sdkName,
    this.session,
  });

  Map<String, dynamic> toJson() {
    final eventType = this.eventType;
    final timestamp = this.timestamp;
    final appPackageName = this.appPackageName;
    final appTitle = this.appTitle;
    final appVersionCode = this.appVersionCode;
    final attributes = this.attributes;
    final clientSdkVersion = this.clientSdkVersion;
    final metrics = this.metrics;
    final sdkName = this.sdkName;
    final session = this.session;
    return {
      'EventType': eventType,
      'Timestamp': timestamp,
      if (appPackageName != null) 'AppPackageName': appPackageName,
      if (appTitle != null) 'AppTitle': appTitle,
      if (appVersionCode != null) 'AppVersionCode': appVersionCode,
      if (attributes != null) 'Attributes': attributes,
      if (clientSdkVersion != null) 'ClientSdkVersion': clientSdkVersion,
      if (metrics != null) 'Metrics': metrics,
      if (sdkName != null) 'SdkName': sdkName,
      if (session != null) 'Session': session,
    };
  }
}

/// Specifies the conditions to evaluate for an event that applies to an
/// activity in a journey.
class EventCondition {
  /// The dimensions for the event filter to use for the activity.
  final EventDimensions? dimensions;

  /// The message identifier (message_id) for the message to use when determining
  /// whether message events meet the condition.
  final String? messageActivity;

  EventCondition({
    this.dimensions,
    this.messageActivity,
  });

  factory EventCondition.fromJson(Map<String, dynamic> json) {
    return EventCondition(
      dimensions: json['Dimensions'] != null
          ? EventDimensions.fromJson(json['Dimensions'] as Map<String, dynamic>)
          : null,
      messageActivity: json['MessageActivity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final messageActivity = this.messageActivity;
    return {
      if (dimensions != null) 'Dimensions': dimensions,
      if (messageActivity != null) 'MessageActivity': messageActivity,
    };
  }
}

/// Specifies the dimensions for an event filter that determines when a campaign
/// is sent or a journey activity is performed.
class EventDimensions {
  /// One or more custom attributes that your application reports to Amazon
  /// Pinpoint. You can use these attributes as selection criteria when you create
  /// an event filter.
  final Map<String, AttributeDimension>? attributes;

  /// The name of the event that causes the campaign to be sent or the journey
  /// activity to be performed. This can be a standard event that Amazon Pinpoint
  /// generates, such as _email.delivered. For campaigns, this can also be a
  /// custom event that's specific to your application. For information about
  /// standard events, see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/event-streams.html">Streaming
  /// Amazon Pinpoint Events</a> in the <i>Amazon Pinpoint Developer Guide</i>.
  final SetDimension? eventType;

  /// One or more custom metrics that your application reports to Amazon Pinpoint.
  /// You can use these metrics as selection criteria when you create an event
  /// filter.
  final Map<String, MetricDimension>? metrics;

  EventDimensions({
    this.attributes,
    this.eventType,
    this.metrics,
  });

  factory EventDimensions.fromJson(Map<String, dynamic> json) {
    return EventDimensions(
      attributes: (json['Attributes'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, AttributeDimension.fromJson(e as Map<String, dynamic>))),
      eventType: json['EventType'] != null
          ? SetDimension.fromJson(json['EventType'] as Map<String, dynamic>)
          : null,
      metrics: (json['Metrics'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, MetricDimension.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final eventType = this.eventType;
    final metrics = this.metrics;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (eventType != null) 'EventType': eventType,
      if (metrics != null) 'Metrics': metrics,
    };
  }
}

/// Specifies the settings for an event that causes a campaign to be sent or a
/// journey activity to be performed.
class EventFilter {
  /// The dimensions for the event filter to use for the campaign or the journey
  /// activity.
  final EventDimensions dimensions;

  /// The type of event that causes the campaign to be sent or the journey
  /// activity to be performed. Valid values are: SYSTEM, sends the campaign or
  /// performs the activity when a system event occurs; and, ENDPOINT, sends the
  /// campaign or performs the activity when an endpoint event (<link
  /// linkend="apps-application-id-events">Events resource</link>) occurs.
  final FilterType filterType;

  EventFilter({
    required this.dimensions,
    required this.filterType,
  });

  factory EventFilter.fromJson(Map<String, dynamic> json) {
    return EventFilter(
      dimensions:
          EventDimensions.fromJson(json['Dimensions'] as Map<String, dynamic>),
      filterType: (json['FilterType'] as String).toFilterType(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final filterType = this.filterType;
    return {
      'Dimensions': dimensions,
      'FilterType': filterType.toValue(),
    };
  }
}

/// Provides the status code and message that result from processing an event.
class EventItemResponse {
  /// A custom message that's returned in the response as a result of processing
  /// the event.
  final String? message;

  /// The status code that's returned in the response as a result of processing
  /// the event. Possible values are: 202, for events that were accepted; and,
  /// 400, for events that weren't valid.
  final int? statusCode;

  EventItemResponse({
    this.message,
    this.statusCode,
  });

  factory EventItemResponse.fromJson(Map<String, dynamic> json) {
    return EventItemResponse(
      message: json['Message'] as String?,
      statusCode: json['StatusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final statusCode = this.statusCode;
    return {
      if (message != null) 'Message': message,
      if (statusCode != null) 'StatusCode': statusCode,
    };
  }
}

/// Specifies the settings for an event that causes a journey activity to start.
class EventStartCondition {
  final EventFilter? eventFilter;
  final String? segmentId;

  EventStartCondition({
    this.eventFilter,
    this.segmentId,
  });

  factory EventStartCondition.fromJson(Map<String, dynamic> json) {
    return EventStartCondition(
      eventFilter: json['EventFilter'] != null
          ? EventFilter.fromJson(json['EventFilter'] as Map<String, dynamic>)
          : null,
      segmentId: json['SegmentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventFilter = this.eventFilter;
    final segmentId = this.segmentId;
    return {
      if (eventFilter != null) 'EventFilter': eventFilter,
      if (segmentId != null) 'SegmentId': segmentId,
    };
  }
}

/// Specifies settings for publishing event data to an Amazon Kinesis data
/// stream or an Amazon Kinesis Data Firehose delivery stream.
class EventStream {
  /// The unique identifier for the application to publish event data for.
  final String applicationId;

  /// The Amazon Resource Name (ARN) of the Amazon Kinesis data stream or Amazon
  /// Kinesis Data Firehose delivery stream to publish event data to.
  ///
  /// For a Kinesis data stream, the ARN format is:
  /// arn:aws:kinesis:<replaceable>region</replaceable>:<replaceable>account-id</replaceable>:stream/<replaceable>stream_name</replaceable>
  ///
  ///
  /// For a Kinesis Data Firehose delivery stream, the ARN format is:
  /// arn:aws:firehose:<replaceable>region</replaceable>:<replaceable>account-id</replaceable>:deliverystream/<replaceable>stream_name</replaceable>
  ///
  final String destinationStreamArn;

  /// The AWS Identity and Access Management (IAM) role that authorizes Amazon
  /// Pinpoint to publish event data to the stream in your AWS account.
  final String roleArn;

  /// (Deprecated) Your AWS account ID, which you assigned to an external ID key
  /// in an IAM trust policy. Amazon Pinpoint previously used this value to assume
  /// an IAM role when publishing event data, but we removed this requirement. We
  /// don't recommend use of external IDs for IAM roles that are assumed by Amazon
  /// Pinpoint.
  final String? externalId;

  /// The date, in ISO 8601 format, when the event stream was last modified.
  final String? lastModifiedDate;

  /// The IAM user who last modified the event stream.
  final String? lastUpdatedBy;

  EventStream({
    required this.applicationId,
    required this.destinationStreamArn,
    required this.roleArn,
    this.externalId,
    this.lastModifiedDate,
    this.lastUpdatedBy,
  });

  factory EventStream.fromJson(Map<String, dynamic> json) {
    return EventStream(
      applicationId: json['ApplicationId'] as String,
      destinationStreamArn: json['DestinationStreamArn'] as String,
      roleArn: json['RoleArn'] as String,
      externalId: json['ExternalId'] as String?,
      lastModifiedDate: json['LastModifiedDate'] as String?,
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final destinationStreamArn = this.destinationStreamArn;
    final roleArn = this.roleArn;
    final externalId = this.externalId;
    final lastModifiedDate = this.lastModifiedDate;
    final lastUpdatedBy = this.lastUpdatedBy;
    return {
      'ApplicationId': applicationId,
      'DestinationStreamArn': destinationStreamArn,
      'RoleArn': roleArn,
      if (externalId != null) 'ExternalId': externalId,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (lastUpdatedBy != null) 'LastUpdatedBy': lastUpdatedBy,
    };
  }
}

/// Specifies a batch of endpoints and events to process.
class EventsBatch {
  /// A set of properties and attributes that are associated with the endpoint.
  final PublicEndpoint endpoint;

  /// A set of properties that are associated with the event.
  final Map<String, Event> events;

  EventsBatch({
    required this.endpoint,
    required this.events,
  });

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final events = this.events;
    return {
      'Endpoint': endpoint,
      'Events': events,
    };
  }
}

/// Specifies a batch of events to process.
class EventsRequest {
  /// The batch of events to process. For each item in a batch, the endpoint ID
  /// acts as a key that has an EventsBatch object as its value.
  final Map<String, EventsBatch> batchItem;

  EventsRequest({
    required this.batchItem,
  });

  Map<String, dynamic> toJson() {
    final batchItem = this.batchItem;
    return {
      'BatchItem': batchItem,
    };
  }
}

/// Provides information about endpoints and the events that they're associated
/// with.
class EventsResponse {
  /// A map that contains a multipart response for each endpoint. For each item in
  /// this object, the endpoint ID is the key and the item response is the value.
  /// If no item response exists, the value can also be one of the following: 202,
  /// the request was processed successfully; or 400, the payload wasn't valid or
  /// required fields were missing.
  final Map<String, ItemResponse>? results;

  EventsResponse({
    this.results,
  });

  factory EventsResponse.fromJson(Map<String, dynamic> json) {
    return EventsResponse(
      results: (json['Results'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, ItemResponse.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    return {
      if (results != null) 'Results': results,
    };
  }
}

/// Specifies the settings for a job that exports endpoint definitions to an
/// Amazon Simple Storage Service (Amazon S3) bucket.
class ExportJobRequest {
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorizes Amazon Pinpoint to access the Amazon S3 location
  /// where you want to export endpoint definitions to.
  final String roleArn;

  /// The URL of the location in an Amazon Simple Storage Service (Amazon S3)
  /// bucket where you want to export endpoint definitions to. This location is
  /// typically a folder that contains multiple files. The URL should be in the
  /// following format:
  /// s3://<replaceable>bucket-name</replaceable>/<replaceable>folder-name</replaceable>/.
  final String s3UrlPrefix;

  /// The identifier for the segment to export endpoint definitions from. If you
  /// don't specify this value, Amazon Pinpoint exports definitions for all the
  /// endpoints that are associated with the application.
  final String? segmentId;

  /// The version of the segment to export endpoint definitions from, if
  /// specified.
  final int? segmentVersion;

  ExportJobRequest({
    required this.roleArn,
    required this.s3UrlPrefix,
    this.segmentId,
    this.segmentVersion,
  });

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final s3UrlPrefix = this.s3UrlPrefix;
    final segmentId = this.segmentId;
    final segmentVersion = this.segmentVersion;
    return {
      'RoleArn': roleArn,
      'S3UrlPrefix': s3UrlPrefix,
      if (segmentId != null) 'SegmentId': segmentId,
      if (segmentVersion != null) 'SegmentVersion': segmentVersion,
    };
  }
}

/// Provides information about the resource settings for a job that exports
/// endpoint definitions to a file. The file can be added directly to an Amazon
/// Simple Storage Service (Amazon S3) bucket by using the Amazon Pinpoint API
/// or downloaded directly to a computer by using the Amazon Pinpoint console.
class ExportJobResource {
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorized Amazon Pinpoint to access the Amazon S3 location
  /// where the endpoint definitions were exported to.
  final String roleArn;

  /// The URL of the location in an Amazon Simple Storage Service (Amazon S3)
  /// bucket where the endpoint definitions were exported to. This location is
  /// typically a folder that contains multiple files. The URL should be in the
  /// following format:
  /// s3://<replaceable>bucket-name</replaceable>/<replaceable>folder-name</replaceable>/.
  final String s3UrlPrefix;

  /// The identifier for the segment that the endpoint definitions were exported
  /// from. If this value isn't present, Amazon Pinpoint exported definitions for
  /// all the endpoints that are associated with the application.
  final String? segmentId;

  /// The version of the segment that the endpoint definitions were exported from.
  final int? segmentVersion;

  ExportJobResource({
    required this.roleArn,
    required this.s3UrlPrefix,
    this.segmentId,
    this.segmentVersion,
  });

  factory ExportJobResource.fromJson(Map<String, dynamic> json) {
    return ExportJobResource(
      roleArn: json['RoleArn'] as String,
      s3UrlPrefix: json['S3UrlPrefix'] as String,
      segmentId: json['SegmentId'] as String?,
      segmentVersion: json['SegmentVersion'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final s3UrlPrefix = this.s3UrlPrefix;
    final segmentId = this.segmentId;
    final segmentVersion = this.segmentVersion;
    return {
      'RoleArn': roleArn,
      'S3UrlPrefix': s3UrlPrefix,
      if (segmentId != null) 'SegmentId': segmentId,
      if (segmentVersion != null) 'SegmentVersion': segmentVersion,
    };
  }
}

/// Provides information about the status and settings of a job that exports
/// endpoint definitions to a file. The file can be added directly to an Amazon
/// Simple Storage Service (Amazon S3) bucket by using the Amazon Pinpoint API
/// or downloaded directly to a computer by using the Amazon Pinpoint console.
class ExportJobResponse {
  /// The unique identifier for the application that's associated with the export
  /// job.
  final String applicationId;

  /// The date, in ISO 8601 format, when the export job was created.
  final String creationDate;

  /// The resource settings that apply to the export job.
  final ExportJobResource definition;

  /// The unique identifier for the export job.
  final String id;

  /// The status of the export job. The job status is FAILED if Amazon Pinpoint
  /// wasn't able to process one or more pieces in the job.
  final JobStatus jobStatus;

  /// The job type. This value is EXPORT for export jobs.
  final String type;

  /// The number of pieces that were processed successfully (completed) by the
  /// export job, as of the time of the request.
  final int? completedPieces;

  /// The date, in ISO 8601 format, when the export job was completed.
  final String? completionDate;

  /// The number of pieces that weren't processed successfully (failed) by the
  /// export job, as of the time of the request.
  final int? failedPieces;

  /// An array of entries, one for each of the first 100 entries that weren't
  /// processed successfully (failed) by the export job, if any.
  final List<String>? failures;

  /// The total number of endpoint definitions that weren't processed successfully
  /// (failed) by the export job, typically because an error, such as a syntax
  /// error, occurred.
  final int? totalFailures;

  /// The total number of pieces that must be processed to complete the export
  /// job. Each piece consists of an approximately equal portion of the endpoint
  /// definitions that are part of the export job.
  final int? totalPieces;

  /// The total number of endpoint definitions that were processed by the export
  /// job.
  final int? totalProcessed;

  ExportJobResponse({
    required this.applicationId,
    required this.creationDate,
    required this.definition,
    required this.id,
    required this.jobStatus,
    required this.type,
    this.completedPieces,
    this.completionDate,
    this.failedPieces,
    this.failures,
    this.totalFailures,
    this.totalPieces,
    this.totalProcessed,
  });

  factory ExportJobResponse.fromJson(Map<String, dynamic> json) {
    return ExportJobResponse(
      applicationId: json['ApplicationId'] as String,
      creationDate: json['CreationDate'] as String,
      definition: ExportJobResource.fromJson(
          json['Definition'] as Map<String, dynamic>),
      id: json['Id'] as String,
      jobStatus: (json['JobStatus'] as String).toJobStatus(),
      type: json['Type'] as String,
      completedPieces: json['CompletedPieces'] as int?,
      completionDate: json['CompletionDate'] as String?,
      failedPieces: json['FailedPieces'] as int?,
      failures: (json['Failures'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      totalFailures: json['TotalFailures'] as int?,
      totalPieces: json['TotalPieces'] as int?,
      totalProcessed: json['TotalProcessed'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final creationDate = this.creationDate;
    final definition = this.definition;
    final id = this.id;
    final jobStatus = this.jobStatus;
    final type = this.type;
    final completedPieces = this.completedPieces;
    final completionDate = this.completionDate;
    final failedPieces = this.failedPieces;
    final failures = this.failures;
    final totalFailures = this.totalFailures;
    final totalPieces = this.totalPieces;
    final totalProcessed = this.totalProcessed;
    return {
      'ApplicationId': applicationId,
      'CreationDate': creationDate,
      'Definition': definition,
      'Id': id,
      'JobStatus': jobStatus.toValue(),
      'Type': type,
      if (completedPieces != null) 'CompletedPieces': completedPieces,
      if (completionDate != null) 'CompletionDate': completionDate,
      if (failedPieces != null) 'FailedPieces': failedPieces,
      if (failures != null) 'Failures': failures,
      if (totalFailures != null) 'TotalFailures': totalFailures,
      if (totalPieces != null) 'TotalPieces': totalPieces,
      if (totalProcessed != null) 'TotalProcessed': totalProcessed,
    };
  }
}

/// Provides information about all the export jobs that are associated with an
/// application or segment. An export job is a job that exports endpoint
/// definitions to a file.
class ExportJobsResponse {
  /// An array of responses, one for each export job that's associated with the
  /// application (Export Jobs resource) or segment (Segment Export Jobs
  /// resource).
  final List<ExportJobResponse> item;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  ExportJobsResponse({
    required this.item,
    this.nextToken,
  });

  factory ExportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ExportJobsResponse(
      item: (json['Item'] as List)
          .whereNotNull()
          .map((e) => ExportJobResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final item = this.item;
    final nextToken = this.nextToken;
    return {
      'Item': item,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

enum FilterType {
  system,
  endpoint,
}

extension FilterTypeValueExtension on FilterType {
  String toValue() {
    switch (this) {
      case FilterType.system:
        return 'SYSTEM';
      case FilterType.endpoint:
        return 'ENDPOINT';
    }
  }
}

extension FilterTypeFromString on String {
  FilterType toFilterType() {
    switch (this) {
      case 'SYSTEM':
        return FilterType.system;
      case 'ENDPOINT':
        return FilterType.endpoint;
    }
    throw Exception('$this is not known in enum FilterType');
  }
}

enum Format {
  csv,
  json,
}

extension FormatValueExtension on Format {
  String toValue() {
    switch (this) {
      case Format.csv:
        return 'CSV';
      case Format.json:
        return 'JSON';
    }
  }
}

extension FormatFromString on String {
  Format toFormat() {
    switch (this) {
      case 'CSV':
        return Format.csv;
      case 'JSON':
        return Format.json;
    }
    throw Exception('$this is not known in enum Format');
  }
}

enum Frequency {
  once,
  hourly,
  daily,
  weekly,
  monthly,
  event,
  inAppEvent,
}

extension FrequencyValueExtension on Frequency {
  String toValue() {
    switch (this) {
      case Frequency.once:
        return 'ONCE';
      case Frequency.hourly:
        return 'HOURLY';
      case Frequency.daily:
        return 'DAILY';
      case Frequency.weekly:
        return 'WEEKLY';
      case Frequency.monthly:
        return 'MONTHLY';
      case Frequency.event:
        return 'EVENT';
      case Frequency.inAppEvent:
        return 'IN_APP_EVENT';
    }
  }
}

extension FrequencyFromString on String {
  Frequency toFrequency() {
    switch (this) {
      case 'ONCE':
        return Frequency.once;
      case 'HOURLY':
        return Frequency.hourly;
      case 'DAILY':
        return Frequency.daily;
      case 'WEEKLY':
        return Frequency.weekly;
      case 'MONTHLY':
        return Frequency.monthly;
      case 'EVENT':
        return Frequency.event;
      case 'IN_APP_EVENT':
        return Frequency.inAppEvent;
    }
    throw Exception('$this is not known in enum Frequency');
  }
}

/// Specifies the status and settings of the GCM channel for an application.
/// This channel enables Amazon Pinpoint to send push notifications through the
/// Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM),
/// service.
class GCMChannelRequest {
  /// The Web API Key, also referred to as an <i>API_KEY</i> or <i>server key</i>,
  /// that you received from Google to communicate with Google services.
  final String? apiKey;

  /// The default authentication method used for GCM. Values are either "TOKEN" or
  /// "KEY". Defaults to "KEY".
  final String? defaultAuthenticationMethod;

  /// Specifies whether to enable the GCM channel for the application.
  final bool? enabled;

  /// The contents of the JSON file provided by Google during registration in
  /// order to generate an access token for authentication. For more information
  /// see <a
  /// href="https://firebase.google.com/docs/cloud-messaging/migrate-v1">Migrate
  /// from legacy FCM APIs to HTTP v1</a>.
  final String? serviceJson;

  GCMChannelRequest({
    this.apiKey,
    this.defaultAuthenticationMethod,
    this.enabled,
    this.serviceJson,
  });

  Map<String, dynamic> toJson() {
    final apiKey = this.apiKey;
    final defaultAuthenticationMethod = this.defaultAuthenticationMethod;
    final enabled = this.enabled;
    final serviceJson = this.serviceJson;
    return {
      if (apiKey != null) 'ApiKey': apiKey,
      if (defaultAuthenticationMethod != null)
        'DefaultAuthenticationMethod': defaultAuthenticationMethod,
      if (enabled != null) 'Enabled': enabled,
      if (serviceJson != null) 'ServiceJson': serviceJson,
    };
  }
}

/// Provides information about the status and settings of the GCM channel for an
/// application. The GCM channel enables Amazon Pinpoint to send push
/// notifications through the Firebase Cloud Messaging (FCM), formerly Google
/// Cloud Messaging (GCM), service.
class GCMChannelResponse {
  /// The type of messaging or notification platform for the channel. For the GCM
  /// channel, this value is GCM.
  final String platform;

  /// The unique identifier for the application that the GCM channel applies to.
  final String? applicationId;

  /// The date and time when the GCM channel was enabled.
  final String? creationDate;

  /// The Web API Key, also referred to as an <i>API_KEY</i> or <i>server key</i>,
  /// that you received from Google to communicate with Google services.
  final String? credential;

  /// The default authentication method used for GCM. Values are either "TOKEN" or
  /// "KEY". Defaults to "KEY".
  final String? defaultAuthenticationMethod;

  /// Specifies whether the GCM channel is enabled for the application.
  final bool? enabled;

  /// (Not used) This property is retained only for backward compatibility.
  final bool? hasCredential;

  /// Returns true if the JSON file provided by Google during registration process
  /// was used in the <b>ServiceJson</b> field of the request.
  final bool? hasFcmServiceCredentials;

  /// (Deprecated) An identifier for the GCM channel. This property is retained
  /// only for backward compatibility.
  final String? id;

  /// Specifies whether the GCM channel is archived.
  final bool? isArchived;

  /// The user who last modified the GCM channel.
  final String? lastModifiedBy;

  /// The date and time when the GCM channel was last modified.
  final String? lastModifiedDate;

  /// The current version of the GCM channel.
  final int? version;

  GCMChannelResponse({
    required this.platform,
    this.applicationId,
    this.creationDate,
    this.credential,
    this.defaultAuthenticationMethod,
    this.enabled,
    this.hasCredential,
    this.hasFcmServiceCredentials,
    this.id,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.version,
  });

  factory GCMChannelResponse.fromJson(Map<String, dynamic> json) {
    return GCMChannelResponse(
      platform: json['Platform'] as String,
      applicationId: json['ApplicationId'] as String?,
      creationDate: json['CreationDate'] as String?,
      credential: json['Credential'] as String?,
      defaultAuthenticationMethod:
          json['DefaultAuthenticationMethod'] as String?,
      enabled: json['Enabled'] as bool?,
      hasCredential: json['HasCredential'] as bool?,
      hasFcmServiceCredentials: json['HasFcmServiceCredentials'] as bool?,
      id: json['Id'] as String?,
      isArchived: json['IsArchived'] as bool?,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: json['LastModifiedDate'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final platform = this.platform;
    final applicationId = this.applicationId;
    final creationDate = this.creationDate;
    final credential = this.credential;
    final defaultAuthenticationMethod = this.defaultAuthenticationMethod;
    final enabled = this.enabled;
    final hasCredential = this.hasCredential;
    final hasFcmServiceCredentials = this.hasFcmServiceCredentials;
    final id = this.id;
    final isArchived = this.isArchived;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final version = this.version;
    return {
      'Platform': platform,
      if (applicationId != null) 'ApplicationId': applicationId,
      if (creationDate != null) 'CreationDate': creationDate,
      if (credential != null) 'Credential': credential,
      if (defaultAuthenticationMethod != null)
        'DefaultAuthenticationMethod': defaultAuthenticationMethod,
      if (enabled != null) 'Enabled': enabled,
      if (hasCredential != null) 'HasCredential': hasCredential,
      if (hasFcmServiceCredentials != null)
        'HasFcmServiceCredentials': hasFcmServiceCredentials,
      if (id != null) 'Id': id,
      if (isArchived != null) 'IsArchived': isArchived,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (version != null) 'Version': version,
    };
  }
}

/// Specifies the settings for a one-time message that's sent directly to an
/// endpoint through the GCM channel. The GCM channel enables Amazon Pinpoint to
/// send messages to the Firebase Cloud Messaging (FCM), formerly Google Cloud
/// Messaging (GCM), service.
class GCMMessage {
  /// The action to occur if the recipient taps the push notification. Valid
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// OPEN_APP - Your app opens or it becomes the foreground app if it was sent to
  /// the background. This is the default action.
  /// </li>
  /// <li>
  /// DEEP_LINK - Your app opens and displays a designated user interface in the
  /// app. This action uses the deep-linking features of the Android platform.
  /// </li>
  /// <li>
  /// URL - The default mobile browser on the recipient's device opens and loads
  /// the web page at a URL that you specify.
  /// </li>
  /// </ul>
  final Action? action;

  /// The body of the notification message.
  final String? body;

  /// An arbitrary string that identifies a group of messages that can be
  /// collapsed to ensure that only the last message is sent when delivery can
  /// resume. This helps avoid sending too many instances of the same messages
  /// when the recipient's device comes online again or becomes active.
  ///
  /// Amazon Pinpoint specifies this value in the Firebase Cloud Messaging (FCM)
  /// collapse_key parameter when it sends the notification message to FCM.
  final String? collapseKey;

  /// The JSON data payload to use for the push notification, if the notification
  /// is a silent push notification. This payload is added to the
  /// data.pinpoint.jsonBody object of the notification.
  final Map<String, String>? data;

  /// The icon image name of the asset saved in your app.
  final String? iconReference;

  /// The URL of the large icon image to display in the content view of the push
  /// notification.
  final String? imageIconUrl;

  /// The URL of an image to display in the push notification.
  final String? imageUrl;

  /// The preferred authentication method, with valid values "KEY" or "TOKEN". If
  /// a value isn't provided then the <b>DefaultAuthenticationMethod</b> is used.
  final String? preferredAuthenticationMethod;

  /// para>normal – The notification might be delayed. Delivery is optimized for
  /// battery usage on the recipient's device. Use this value unless immediate
  /// delivery is required.
  /// /listitem>
  /// <li>
  /// high – The notification is sent immediately and might wake a sleeping
  /// device.
  /// </li>/para>
  /// Amazon Pinpoint specifies this value in the FCM priority parameter when it
  /// sends the notification message to FCM.
  ///
  /// The equivalent values for Apple Push Notification service (APNs) are 5, for
  /// normal, and 10, for high. If you specify an APNs value for this property,
  /// Amazon Pinpoint accepts and converts the value to the corresponding FCM
  /// value.
  final String? priority;

  /// The raw, JSON-formatted string to use as the payload for the notification
  /// message. If specified, this value overrides all other content for the
  /// message.
  final String? rawContent;

  /// The package name of the application where registration tokens must match in
  /// order for the recipient to receive the message.
  final String? restrictedPackageName;

  /// Specifies whether the notification is a silent push notification, which is a
  /// push notification that doesn't display on a recipient's device. Silent push
  /// notifications can be used for cases such as updating an app's configuration
  /// or supporting phone home functionality.
  final bool? silentPush;

  /// The URL of the small icon image to display in the status bar and the content
  /// view of the push notification.
  final String? smallImageIconUrl;

  /// The sound to play when the recipient receives the push notification. You can
  /// use the default stream or specify the file name of a sound resource that's
  /// bundled in your app. On an Android platform, the sound file must reside in
  /// /res/raw/.
  final String? sound;

  /// The default message variables to use in the notification message. You can
  /// override the default variables with individual address variables.
  final Map<String, List<String>>? substitutions;

  /// The amount of time, in seconds, that FCM should store and attempt to deliver
  /// the push notification, if the service is unable to deliver the notification
  /// the first time. If you don't specify this value, FCM defaults to the maximum
  /// value, which is 2,419,200 seconds (28 days).
  ///
  /// Amazon Pinpoint specifies this value in the FCM time_to_live parameter when
  /// it sends the notification message to FCM.
  final int? timeToLive;

  /// The title to display above the notification message on the recipient's
  /// device.
  final String? title;

  /// The URL to open in the recipient's default mobile browser, if a recipient
  /// taps the push notification and the value of the Action property is URL.
  final String? url;

  GCMMessage({
    this.action,
    this.body,
    this.collapseKey,
    this.data,
    this.iconReference,
    this.imageIconUrl,
    this.imageUrl,
    this.preferredAuthenticationMethod,
    this.priority,
    this.rawContent,
    this.restrictedPackageName,
    this.silentPush,
    this.smallImageIconUrl,
    this.sound,
    this.substitutions,
    this.timeToLive,
    this.title,
    this.url,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final body = this.body;
    final collapseKey = this.collapseKey;
    final data = this.data;
    final iconReference = this.iconReference;
    final imageIconUrl = this.imageIconUrl;
    final imageUrl = this.imageUrl;
    final preferredAuthenticationMethod = this.preferredAuthenticationMethod;
    final priority = this.priority;
    final rawContent = this.rawContent;
    final restrictedPackageName = this.restrictedPackageName;
    final silentPush = this.silentPush;
    final smallImageIconUrl = this.smallImageIconUrl;
    final sound = this.sound;
    final substitutions = this.substitutions;
    final timeToLive = this.timeToLive;
    final title = this.title;
    final url = this.url;
    return {
      if (action != null) 'Action': action.toValue(),
      if (body != null) 'Body': body,
      if (collapseKey != null) 'CollapseKey': collapseKey,
      if (data != null) 'Data': data,
      if (iconReference != null) 'IconReference': iconReference,
      if (imageIconUrl != null) 'ImageIconUrl': imageIconUrl,
      if (imageUrl != null) 'ImageUrl': imageUrl,
      if (preferredAuthenticationMethod != null)
        'PreferredAuthenticationMethod': preferredAuthenticationMethod,
      if (priority != null) 'Priority': priority,
      if (rawContent != null) 'RawContent': rawContent,
      if (restrictedPackageName != null)
        'RestrictedPackageName': restrictedPackageName,
      if (silentPush != null) 'SilentPush': silentPush,
      if (smallImageIconUrl != null) 'SmallImageIconUrl': smallImageIconUrl,
      if (sound != null) 'Sound': sound,
      if (substitutions != null) 'Substitutions': substitutions,
      if (timeToLive != null) 'TimeToLive': timeToLive,
      if (title != null) 'Title': title,
      if (url != null) 'Url': url,
    };
  }
}

/// Specifies the GPS coordinates of a location.
class GPSCoordinates {
  /// The latitude coordinate of the location.
  final double latitude;

  /// The longitude coordinate of the location.
  final double longitude;

  GPSCoordinates({
    required this.latitude,
    required this.longitude,
  });

  factory GPSCoordinates.fromJson(Map<String, dynamic> json) {
    return GPSCoordinates(
      latitude: json['Latitude'] as double,
      longitude: json['Longitude'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final latitude = this.latitude;
    final longitude = this.longitude;
    return {
      'Latitude': latitude,
      'Longitude': longitude,
    };
  }
}

/// Specifies GPS-based criteria for including or excluding endpoints from a
/// segment.
class GPSPointDimension {
  /// The GPS coordinates to measure distance from.
  final GPSCoordinates coordinates;

  /// The range, in kilometers, from the GPS coordinates.
  final double? rangeInKilometers;

  GPSPointDimension({
    required this.coordinates,
    this.rangeInKilometers,
  });

  factory GPSPointDimension.fromJson(Map<String, dynamic> json) {
    return GPSPointDimension(
      coordinates:
          GPSCoordinates.fromJson(json['Coordinates'] as Map<String, dynamic>),
      rangeInKilometers: json['RangeInKilometers'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final coordinates = this.coordinates;
    final rangeInKilometers = this.rangeInKilometers;
    return {
      'Coordinates': coordinates,
      if (rangeInKilometers != null) 'RangeInKilometers': rangeInKilometers,
    };
  }
}

class GetAdmChannelResponse {
  final ADMChannelResponse aDMChannelResponse;

  GetAdmChannelResponse({
    required this.aDMChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final aDMChannelResponse = this.aDMChannelResponse;
    return {
      'ADMChannelResponse': aDMChannelResponse,
    };
  }
}

class GetApnsChannelResponse {
  final APNSChannelResponse aPNSChannelResponse;

  GetApnsChannelResponse({
    required this.aPNSChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final aPNSChannelResponse = this.aPNSChannelResponse;
    return {
      'APNSChannelResponse': aPNSChannelResponse,
    };
  }
}

class GetApnsSandboxChannelResponse {
  final APNSSandboxChannelResponse aPNSSandboxChannelResponse;

  GetApnsSandboxChannelResponse({
    required this.aPNSSandboxChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final aPNSSandboxChannelResponse = this.aPNSSandboxChannelResponse;
    return {
      'APNSSandboxChannelResponse': aPNSSandboxChannelResponse,
    };
  }
}

class GetApnsVoipChannelResponse {
  final APNSVoipChannelResponse aPNSVoipChannelResponse;

  GetApnsVoipChannelResponse({
    required this.aPNSVoipChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final aPNSVoipChannelResponse = this.aPNSVoipChannelResponse;
    return {
      'APNSVoipChannelResponse': aPNSVoipChannelResponse,
    };
  }
}

class GetApnsVoipSandboxChannelResponse {
  final APNSVoipSandboxChannelResponse aPNSVoipSandboxChannelResponse;

  GetApnsVoipSandboxChannelResponse({
    required this.aPNSVoipSandboxChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final aPNSVoipSandboxChannelResponse = this.aPNSVoipSandboxChannelResponse;
    return {
      'APNSVoipSandboxChannelResponse': aPNSVoipSandboxChannelResponse,
    };
  }
}

class GetAppResponse {
  final ApplicationResponse applicationResponse;

  GetAppResponse({
    required this.applicationResponse,
  });

  Map<String, dynamic> toJson() {
    final applicationResponse = this.applicationResponse;
    return {
      'ApplicationResponse': applicationResponse,
    };
  }
}

class GetApplicationDateRangeKpiResponse {
  final ApplicationDateRangeKpiResponse applicationDateRangeKpiResponse;

  GetApplicationDateRangeKpiResponse({
    required this.applicationDateRangeKpiResponse,
  });

  Map<String, dynamic> toJson() {
    final applicationDateRangeKpiResponse =
        this.applicationDateRangeKpiResponse;
    return {
      'ApplicationDateRangeKpiResponse': applicationDateRangeKpiResponse,
    };
  }
}

class GetApplicationSettingsResponse {
  final ApplicationSettingsResource applicationSettingsResource;

  GetApplicationSettingsResponse({
    required this.applicationSettingsResource,
  });

  Map<String, dynamic> toJson() {
    final applicationSettingsResource = this.applicationSettingsResource;
    return {
      'ApplicationSettingsResource': applicationSettingsResource,
    };
  }
}

class GetAppsResponse {
  final ApplicationsResponse applicationsResponse;

  GetAppsResponse({
    required this.applicationsResponse,
  });

  Map<String, dynamic> toJson() {
    final applicationsResponse = this.applicationsResponse;
    return {
      'ApplicationsResponse': applicationsResponse,
    };
  }
}

class GetBaiduChannelResponse {
  final BaiduChannelResponse baiduChannelResponse;

  GetBaiduChannelResponse({
    required this.baiduChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final baiduChannelResponse = this.baiduChannelResponse;
    return {
      'BaiduChannelResponse': baiduChannelResponse,
    };
  }
}

class GetCampaignActivitiesResponse {
  final ActivitiesResponse activitiesResponse;

  GetCampaignActivitiesResponse({
    required this.activitiesResponse,
  });

  Map<String, dynamic> toJson() {
    final activitiesResponse = this.activitiesResponse;
    return {
      'ActivitiesResponse': activitiesResponse,
    };
  }
}

class GetCampaignDateRangeKpiResponse {
  final CampaignDateRangeKpiResponse campaignDateRangeKpiResponse;

  GetCampaignDateRangeKpiResponse({
    required this.campaignDateRangeKpiResponse,
  });

  Map<String, dynamic> toJson() {
    final campaignDateRangeKpiResponse = this.campaignDateRangeKpiResponse;
    return {
      'CampaignDateRangeKpiResponse': campaignDateRangeKpiResponse,
    };
  }
}

class GetCampaignResponse {
  final CampaignResponse campaignResponse;

  GetCampaignResponse({
    required this.campaignResponse,
  });

  Map<String, dynamic> toJson() {
    final campaignResponse = this.campaignResponse;
    return {
      'CampaignResponse': campaignResponse,
    };
  }
}

class GetCampaignVersionResponse {
  final CampaignResponse campaignResponse;

  GetCampaignVersionResponse({
    required this.campaignResponse,
  });

  Map<String, dynamic> toJson() {
    final campaignResponse = this.campaignResponse;
    return {
      'CampaignResponse': campaignResponse,
    };
  }
}

class GetCampaignVersionsResponse {
  final CampaignsResponse campaignsResponse;

  GetCampaignVersionsResponse({
    required this.campaignsResponse,
  });

  Map<String, dynamic> toJson() {
    final campaignsResponse = this.campaignsResponse;
    return {
      'CampaignsResponse': campaignsResponse,
    };
  }
}

class GetCampaignsResponse {
  final CampaignsResponse campaignsResponse;

  GetCampaignsResponse({
    required this.campaignsResponse,
  });

  Map<String, dynamic> toJson() {
    final campaignsResponse = this.campaignsResponse;
    return {
      'CampaignsResponse': campaignsResponse,
    };
  }
}

class GetChannelsResponse {
  final ChannelsResponse channelsResponse;

  GetChannelsResponse({
    required this.channelsResponse,
  });

  Map<String, dynamic> toJson() {
    final channelsResponse = this.channelsResponse;
    return {
      'ChannelsResponse': channelsResponse,
    };
  }
}

class GetEmailChannelResponse {
  final EmailChannelResponse emailChannelResponse;

  GetEmailChannelResponse({
    required this.emailChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final emailChannelResponse = this.emailChannelResponse;
    return {
      'EmailChannelResponse': emailChannelResponse,
    };
  }
}

class GetEmailTemplateResponse {
  final EmailTemplateResponse emailTemplateResponse;

  GetEmailTemplateResponse({
    required this.emailTemplateResponse,
  });

  Map<String, dynamic> toJson() {
    final emailTemplateResponse = this.emailTemplateResponse;
    return {
      'EmailTemplateResponse': emailTemplateResponse,
    };
  }
}

class GetEndpointResponse {
  final EndpointResponse endpointResponse;

  GetEndpointResponse({
    required this.endpointResponse,
  });

  Map<String, dynamic> toJson() {
    final endpointResponse = this.endpointResponse;
    return {
      'EndpointResponse': endpointResponse,
    };
  }
}

class GetEventStreamResponse {
  final EventStream eventStream;

  GetEventStreamResponse({
    required this.eventStream,
  });

  Map<String, dynamic> toJson() {
    final eventStream = this.eventStream;
    return {
      'EventStream': eventStream,
    };
  }
}

class GetExportJobResponse {
  final ExportJobResponse exportJobResponse;

  GetExportJobResponse({
    required this.exportJobResponse,
  });

  Map<String, dynamic> toJson() {
    final exportJobResponse = this.exportJobResponse;
    return {
      'ExportJobResponse': exportJobResponse,
    };
  }
}

class GetExportJobsResponse {
  final ExportJobsResponse exportJobsResponse;

  GetExportJobsResponse({
    required this.exportJobsResponse,
  });

  Map<String, dynamic> toJson() {
    final exportJobsResponse = this.exportJobsResponse;
    return {
      'ExportJobsResponse': exportJobsResponse,
    };
  }
}

class GetGcmChannelResponse {
  final GCMChannelResponse gCMChannelResponse;

  GetGcmChannelResponse({
    required this.gCMChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final gCMChannelResponse = this.gCMChannelResponse;
    return {
      'GCMChannelResponse': gCMChannelResponse,
    };
  }
}

class GetImportJobResponse {
  final ImportJobResponse importJobResponse;

  GetImportJobResponse({
    required this.importJobResponse,
  });

  Map<String, dynamic> toJson() {
    final importJobResponse = this.importJobResponse;
    return {
      'ImportJobResponse': importJobResponse,
    };
  }
}

class GetImportJobsResponse {
  final ImportJobsResponse importJobsResponse;

  GetImportJobsResponse({
    required this.importJobsResponse,
  });

  Map<String, dynamic> toJson() {
    final importJobsResponse = this.importJobsResponse;
    return {
      'ImportJobsResponse': importJobsResponse,
    };
  }
}

class GetInAppMessagesResponse {
  final InAppMessagesResponse inAppMessagesResponse;

  GetInAppMessagesResponse({
    required this.inAppMessagesResponse,
  });

  Map<String, dynamic> toJson() {
    final inAppMessagesResponse = this.inAppMessagesResponse;
    return {
      'InAppMessagesResponse': inAppMessagesResponse,
    };
  }
}

class GetInAppTemplateResponse {
  final InAppTemplateResponse inAppTemplateResponse;

  GetInAppTemplateResponse({
    required this.inAppTemplateResponse,
  });

  Map<String, dynamic> toJson() {
    final inAppTemplateResponse = this.inAppTemplateResponse;
    return {
      'InAppTemplateResponse': inAppTemplateResponse,
    };
  }
}

class GetJourneyDateRangeKpiResponse {
  final JourneyDateRangeKpiResponse journeyDateRangeKpiResponse;

  GetJourneyDateRangeKpiResponse({
    required this.journeyDateRangeKpiResponse,
  });

  Map<String, dynamic> toJson() {
    final journeyDateRangeKpiResponse = this.journeyDateRangeKpiResponse;
    return {
      'JourneyDateRangeKpiResponse': journeyDateRangeKpiResponse,
    };
  }
}

class GetJourneyExecutionActivityMetricsResponse {
  final JourneyExecutionActivityMetricsResponse
      journeyExecutionActivityMetricsResponse;

  GetJourneyExecutionActivityMetricsResponse({
    required this.journeyExecutionActivityMetricsResponse,
  });

  Map<String, dynamic> toJson() {
    final journeyExecutionActivityMetricsResponse =
        this.journeyExecutionActivityMetricsResponse;
    return {
      'JourneyExecutionActivityMetricsResponse':
          journeyExecutionActivityMetricsResponse,
    };
  }
}

class GetJourneyExecutionMetricsResponse {
  final JourneyExecutionMetricsResponse journeyExecutionMetricsResponse;

  GetJourneyExecutionMetricsResponse({
    required this.journeyExecutionMetricsResponse,
  });

  Map<String, dynamic> toJson() {
    final journeyExecutionMetricsResponse =
        this.journeyExecutionMetricsResponse;
    return {
      'JourneyExecutionMetricsResponse': journeyExecutionMetricsResponse,
    };
  }
}

class GetJourneyResponse {
  final JourneyResponse journeyResponse;

  GetJourneyResponse({
    required this.journeyResponse,
  });

  Map<String, dynamic> toJson() {
    final journeyResponse = this.journeyResponse;
    return {
      'JourneyResponse': journeyResponse,
    };
  }
}

class GetJourneyRunExecutionActivityMetricsResponse {
  final JourneyRunExecutionActivityMetricsResponse
      journeyRunExecutionActivityMetricsResponse;

  GetJourneyRunExecutionActivityMetricsResponse({
    required this.journeyRunExecutionActivityMetricsResponse,
  });

  Map<String, dynamic> toJson() {
    final journeyRunExecutionActivityMetricsResponse =
        this.journeyRunExecutionActivityMetricsResponse;
    return {
      'JourneyRunExecutionActivityMetricsResponse':
          journeyRunExecutionActivityMetricsResponse,
    };
  }
}

class GetJourneyRunExecutionMetricsResponse {
  final JourneyRunExecutionMetricsResponse journeyRunExecutionMetricsResponse;

  GetJourneyRunExecutionMetricsResponse({
    required this.journeyRunExecutionMetricsResponse,
  });

  Map<String, dynamic> toJson() {
    final journeyRunExecutionMetricsResponse =
        this.journeyRunExecutionMetricsResponse;
    return {
      'JourneyRunExecutionMetricsResponse': journeyRunExecutionMetricsResponse,
    };
  }
}

class GetJourneyRunsResponse {
  final JourneyRunsResponse journeyRunsResponse;

  GetJourneyRunsResponse({
    required this.journeyRunsResponse,
  });

  Map<String, dynamic> toJson() {
    final journeyRunsResponse = this.journeyRunsResponse;
    return {
      'JourneyRunsResponse': journeyRunsResponse,
    };
  }
}

class GetPushTemplateResponse {
  final PushNotificationTemplateResponse pushNotificationTemplateResponse;

  GetPushTemplateResponse({
    required this.pushNotificationTemplateResponse,
  });

  Map<String, dynamic> toJson() {
    final pushNotificationTemplateResponse =
        this.pushNotificationTemplateResponse;
    return {
      'PushNotificationTemplateResponse': pushNotificationTemplateResponse,
    };
  }
}

class GetRecommenderConfigurationResponse {
  final RecommenderConfigurationResponse recommenderConfigurationResponse;

  GetRecommenderConfigurationResponse({
    required this.recommenderConfigurationResponse,
  });

  Map<String, dynamic> toJson() {
    final recommenderConfigurationResponse =
        this.recommenderConfigurationResponse;
    return {
      'RecommenderConfigurationResponse': recommenderConfigurationResponse,
    };
  }
}

class GetRecommenderConfigurationsResponse {
  final ListRecommenderConfigurationsResponse
      listRecommenderConfigurationsResponse;

  GetRecommenderConfigurationsResponse({
    required this.listRecommenderConfigurationsResponse,
  });

  Map<String, dynamic> toJson() {
    final listRecommenderConfigurationsResponse =
        this.listRecommenderConfigurationsResponse;
    return {
      'ListRecommenderConfigurationsResponse':
          listRecommenderConfigurationsResponse,
    };
  }
}

class GetSegmentExportJobsResponse {
  final ExportJobsResponse exportJobsResponse;

  GetSegmentExportJobsResponse({
    required this.exportJobsResponse,
  });

  Map<String, dynamic> toJson() {
    final exportJobsResponse = this.exportJobsResponse;
    return {
      'ExportJobsResponse': exportJobsResponse,
    };
  }
}

class GetSegmentImportJobsResponse {
  final ImportJobsResponse importJobsResponse;

  GetSegmentImportJobsResponse({
    required this.importJobsResponse,
  });

  Map<String, dynamic> toJson() {
    final importJobsResponse = this.importJobsResponse;
    return {
      'ImportJobsResponse': importJobsResponse,
    };
  }
}

class GetSegmentResponse {
  final SegmentResponse segmentResponse;

  GetSegmentResponse({
    required this.segmentResponse,
  });

  Map<String, dynamic> toJson() {
    final segmentResponse = this.segmentResponse;
    return {
      'SegmentResponse': segmentResponse,
    };
  }
}

class GetSegmentVersionResponse {
  final SegmentResponse segmentResponse;

  GetSegmentVersionResponse({
    required this.segmentResponse,
  });

  Map<String, dynamic> toJson() {
    final segmentResponse = this.segmentResponse;
    return {
      'SegmentResponse': segmentResponse,
    };
  }
}

class GetSegmentVersionsResponse {
  final SegmentsResponse segmentsResponse;

  GetSegmentVersionsResponse({
    required this.segmentsResponse,
  });

  Map<String, dynamic> toJson() {
    final segmentsResponse = this.segmentsResponse;
    return {
      'SegmentsResponse': segmentsResponse,
    };
  }
}

class GetSegmentsResponse {
  final SegmentsResponse segmentsResponse;

  GetSegmentsResponse({
    required this.segmentsResponse,
  });

  Map<String, dynamic> toJson() {
    final segmentsResponse = this.segmentsResponse;
    return {
      'SegmentsResponse': segmentsResponse,
    };
  }
}

class GetSmsChannelResponse {
  final SMSChannelResponse sMSChannelResponse;

  GetSmsChannelResponse({
    required this.sMSChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final sMSChannelResponse = this.sMSChannelResponse;
    return {
      'SMSChannelResponse': sMSChannelResponse,
    };
  }
}

class GetSmsTemplateResponse {
  final SMSTemplateResponse sMSTemplateResponse;

  GetSmsTemplateResponse({
    required this.sMSTemplateResponse,
  });

  Map<String, dynamic> toJson() {
    final sMSTemplateResponse = this.sMSTemplateResponse;
    return {
      'SMSTemplateResponse': sMSTemplateResponse,
    };
  }
}

class GetUserEndpointsResponse {
  final EndpointsResponse endpointsResponse;

  GetUserEndpointsResponse({
    required this.endpointsResponse,
  });

  Map<String, dynamic> toJson() {
    final endpointsResponse = this.endpointsResponse;
    return {
      'EndpointsResponse': endpointsResponse,
    };
  }
}

class GetVoiceChannelResponse {
  final VoiceChannelResponse voiceChannelResponse;

  GetVoiceChannelResponse({
    required this.voiceChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final voiceChannelResponse = this.voiceChannelResponse;
    return {
      'VoiceChannelResponse': voiceChannelResponse,
    };
  }
}

class GetVoiceTemplateResponse {
  final VoiceTemplateResponse voiceTemplateResponse;

  GetVoiceTemplateResponse({
    required this.voiceTemplateResponse,
  });

  Map<String, dynamic> toJson() {
    final voiceTemplateResponse = this.voiceTemplateResponse;
    return {
      'VoiceTemplateResponse': voiceTemplateResponse,
    };
  }
}

/// Specifies the settings for a holdout activity in a journey. This type of
/// activity stops a journey for a specified percentage of participants.
class HoldoutActivity {
  /// The percentage of participants who shouldn't continue the journey.
  ///
  /// To determine which participants are held out, Amazon Pinpoint applies a
  /// probability-based algorithm to the percentage that you specify. Therefore,
  /// the actual percentage of participants who are held out may not be equal to
  /// the percentage that you specify.
  final int percentage;

  /// The unique identifier for the next activity to perform, after performing the
  /// holdout activity.
  final String? nextActivity;

  HoldoutActivity({
    required this.percentage,
    this.nextActivity,
  });

  factory HoldoutActivity.fromJson(Map<String, dynamic> json) {
    return HoldoutActivity(
      percentage: json['Percentage'] as int,
      nextActivity: json['NextActivity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final percentage = this.percentage;
    final nextActivity = this.nextActivity;
    return {
      'Percentage': percentage,
      if (nextActivity != null) 'NextActivity': nextActivity,
    };
  }
}

/// Specifies the settings for a job that imports endpoint definitions from an
/// Amazon Simple Storage Service (Amazon S3) bucket.
class ImportJobRequest {
  /// The format of the files that contain the endpoint definitions to import.
  /// Valid values are: CSV, for comma-separated values format; and, JSON, for
  /// newline-delimited JSON format. If the Amazon S3 location stores multiple
  /// files that use different formats, Amazon Pinpoint imports data only from the
  /// files that use the specified format.
  final Format format;

  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorizes Amazon Pinpoint to access the Amazon S3 location
  /// to import endpoint definitions from.
  final String roleArn;

  /// The URL of the Amazon Simple Storage Service (Amazon S3) bucket that
  /// contains the endpoint definitions to import. This location can be a folder
  /// or a single file. If the location is a folder, Amazon Pinpoint imports
  /// endpoint definitions from the files in this location, including any
  /// subfolders that the folder contains.
  ///
  /// The URL should be in the following format:
  /// s3://<replaceable>bucket-name</replaceable>/<replaceable>folder-name</replaceable>/<replaceable>file-name</replaceable>.
  /// The location can end with the key for an individual object or a prefix that
  /// qualifies multiple objects.
  final String s3Url;

  /// Specifies whether to create a segment that contains the endpoints, when the
  /// endpoint definitions are imported.
  final bool? defineSegment;

  /// (Deprecated) Your AWS account ID, which you assigned to an external ID key
  /// in an IAM trust policy. Amazon Pinpoint previously used this value to assume
  /// an IAM role when importing endpoint definitions, but we removed this
  /// requirement. We don't recommend use of external IDs for IAM roles that are
  /// assumed by Amazon Pinpoint.
  final String? externalId;

  /// Specifies whether to register the endpoints with Amazon Pinpoint, when the
  /// endpoint definitions are imported.
  final bool? registerEndpoints;

  /// The identifier for the segment to update or add the imported endpoint
  /// definitions to, if the import job is meant to update an existing segment.
  final String? segmentId;

  /// A custom name for the segment that's created by the import job, if the value
  /// of the DefineSegment property is true.
  final String? segmentName;

  ImportJobRequest({
    required this.format,
    required this.roleArn,
    required this.s3Url,
    this.defineSegment,
    this.externalId,
    this.registerEndpoints,
    this.segmentId,
    this.segmentName,
  });

  Map<String, dynamic> toJson() {
    final format = this.format;
    final roleArn = this.roleArn;
    final s3Url = this.s3Url;
    final defineSegment = this.defineSegment;
    final externalId = this.externalId;
    final registerEndpoints = this.registerEndpoints;
    final segmentId = this.segmentId;
    final segmentName = this.segmentName;
    return {
      'Format': format.toValue(),
      'RoleArn': roleArn,
      'S3Url': s3Url,
      if (defineSegment != null) 'DefineSegment': defineSegment,
      if (externalId != null) 'ExternalId': externalId,
      if (registerEndpoints != null) 'RegisterEndpoints': registerEndpoints,
      if (segmentId != null) 'SegmentId': segmentId,
      if (segmentName != null) 'SegmentName': segmentName,
    };
  }
}

/// Provides information about the resource settings for a job that imports
/// endpoint definitions from one or more files. The files can be stored in an
/// Amazon Simple Storage Service (Amazon S3) bucket or uploaded directly from a
/// computer by using the Amazon Pinpoint console.
class ImportJobResource {
  /// The format of the files that contain the endpoint definitions to import.
  /// Valid values are: CSV, for comma-separated values format; and, JSON, for
  /// newline-delimited JSON format.
  ///
  /// If the files are stored in an Amazon S3 location and that location contains
  /// multiple files that use different formats, Amazon Pinpoint imports data only
  /// from the files that use the specified format.
  final Format format;

  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorizes Amazon Pinpoint to access the Amazon S3 location
  /// to import endpoint definitions from.
  final String roleArn;

  /// The URL of the Amazon Simple Storage Service (Amazon S3) bucket that
  /// contains the endpoint definitions to import. This location can be a folder
  /// or a single file. If the location is a folder, Amazon Pinpoint imports
  /// endpoint definitions from the files in this location, including any
  /// subfolders that the folder contains.
  ///
  /// The URL should be in the following format:
  /// s3://<replaceable>bucket-name</replaceable>/<replaceable>folder-name</replaceable>/<replaceable>file-name</replaceable>.
  /// The location can end with the key for an individual object or a prefix that
  /// qualifies multiple objects.
  final String s3Url;

  /// Specifies whether the import job creates a segment that contains the
  /// endpoints, when the endpoint definitions are imported.
  final bool? defineSegment;

  /// (Deprecated) Your AWS account ID, which you assigned to an external ID key
  /// in an IAM trust policy. Amazon Pinpoint previously used this value to assume
  /// an IAM role when importing endpoint definitions, but we removed this
  /// requirement. We don't recommend use of external IDs for IAM roles that are
  /// assumed by Amazon Pinpoint.
  final String? externalId;

  /// Specifies whether the import job registers the endpoints with Amazon
  /// Pinpoint, when the endpoint definitions are imported.
  final bool? registerEndpoints;

  /// The identifier for the segment that the import job updates or adds endpoint
  /// definitions to, if the import job updates an existing segment.
  final String? segmentId;

  /// The custom name for the segment that's created by the import job, if the
  /// value of the DefineSegment property is true.
  final String? segmentName;

  ImportJobResource({
    required this.format,
    required this.roleArn,
    required this.s3Url,
    this.defineSegment,
    this.externalId,
    this.registerEndpoints,
    this.segmentId,
    this.segmentName,
  });

  factory ImportJobResource.fromJson(Map<String, dynamic> json) {
    return ImportJobResource(
      format: (json['Format'] as String).toFormat(),
      roleArn: json['RoleArn'] as String,
      s3Url: json['S3Url'] as String,
      defineSegment: json['DefineSegment'] as bool?,
      externalId: json['ExternalId'] as String?,
      registerEndpoints: json['RegisterEndpoints'] as bool?,
      segmentId: json['SegmentId'] as String?,
      segmentName: json['SegmentName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final roleArn = this.roleArn;
    final s3Url = this.s3Url;
    final defineSegment = this.defineSegment;
    final externalId = this.externalId;
    final registerEndpoints = this.registerEndpoints;
    final segmentId = this.segmentId;
    final segmentName = this.segmentName;
    return {
      'Format': format.toValue(),
      'RoleArn': roleArn,
      'S3Url': s3Url,
      if (defineSegment != null) 'DefineSegment': defineSegment,
      if (externalId != null) 'ExternalId': externalId,
      if (registerEndpoints != null) 'RegisterEndpoints': registerEndpoints,
      if (segmentId != null) 'SegmentId': segmentId,
      if (segmentName != null) 'SegmentName': segmentName,
    };
  }
}

/// Provides information about the status and settings of a job that imports
/// endpoint definitions from one or more files. The files can be stored in an
/// Amazon Simple Storage Service (Amazon S3) bucket or uploaded directly from a
/// computer by using the Amazon Pinpoint console.
class ImportJobResponse {
  /// The unique identifier for the application that's associated with the import
  /// job.
  final String applicationId;

  /// The date, in ISO 8601 format, when the import job was created.
  final String creationDate;

  /// The resource settings that apply to the import job.
  final ImportJobResource definition;

  /// The unique identifier for the import job.
  final String id;

  /// The status of the import job. The job status is FAILED if Amazon Pinpoint
  /// wasn't able to process one or more pieces in the job.
  final JobStatus jobStatus;

  /// The job type. This value is IMPORT for import jobs.
  final String type;

  /// The number of pieces that were processed successfully (completed) by the
  /// import job, as of the time of the request.
  final int? completedPieces;

  /// The date, in ISO 8601 format, when the import job was completed.
  final String? completionDate;

  /// The number of pieces that weren't processed successfully (failed) by the
  /// import job, as of the time of the request.
  final int? failedPieces;

  /// An array of entries, one for each of the first 100 entries that weren't
  /// processed successfully (failed) by the import job, if any.
  final List<String>? failures;

  /// The total number of endpoint definitions that weren't processed successfully
  /// (failed) by the import job, typically because an error, such as a syntax
  /// error, occurred.
  final int? totalFailures;

  /// The total number of pieces that must be processed to complete the import
  /// job. Each piece consists of an approximately equal portion of the endpoint
  /// definitions that are part of the import job.
  final int? totalPieces;

  /// The total number of endpoint definitions that were processed by the import
  /// job.
  final int? totalProcessed;

  ImportJobResponse({
    required this.applicationId,
    required this.creationDate,
    required this.definition,
    required this.id,
    required this.jobStatus,
    required this.type,
    this.completedPieces,
    this.completionDate,
    this.failedPieces,
    this.failures,
    this.totalFailures,
    this.totalPieces,
    this.totalProcessed,
  });

  factory ImportJobResponse.fromJson(Map<String, dynamic> json) {
    return ImportJobResponse(
      applicationId: json['ApplicationId'] as String,
      creationDate: json['CreationDate'] as String,
      definition: ImportJobResource.fromJson(
          json['Definition'] as Map<String, dynamic>),
      id: json['Id'] as String,
      jobStatus: (json['JobStatus'] as String).toJobStatus(),
      type: json['Type'] as String,
      completedPieces: json['CompletedPieces'] as int?,
      completionDate: json['CompletionDate'] as String?,
      failedPieces: json['FailedPieces'] as int?,
      failures: (json['Failures'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      totalFailures: json['TotalFailures'] as int?,
      totalPieces: json['TotalPieces'] as int?,
      totalProcessed: json['TotalProcessed'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final creationDate = this.creationDate;
    final definition = this.definition;
    final id = this.id;
    final jobStatus = this.jobStatus;
    final type = this.type;
    final completedPieces = this.completedPieces;
    final completionDate = this.completionDate;
    final failedPieces = this.failedPieces;
    final failures = this.failures;
    final totalFailures = this.totalFailures;
    final totalPieces = this.totalPieces;
    final totalProcessed = this.totalProcessed;
    return {
      'ApplicationId': applicationId,
      'CreationDate': creationDate,
      'Definition': definition,
      'Id': id,
      'JobStatus': jobStatus.toValue(),
      'Type': type,
      if (completedPieces != null) 'CompletedPieces': completedPieces,
      if (completionDate != null) 'CompletionDate': completionDate,
      if (failedPieces != null) 'FailedPieces': failedPieces,
      if (failures != null) 'Failures': failures,
      if (totalFailures != null) 'TotalFailures': totalFailures,
      if (totalPieces != null) 'TotalPieces': totalPieces,
      if (totalProcessed != null) 'TotalProcessed': totalProcessed,
    };
  }
}

/// Provides information about the status and settings of all the import jobs
/// that are associated with an application or segment. An import job is a job
/// that imports endpoint definitions from one or more files.
class ImportJobsResponse {
  /// An array of responses, one for each import job that's associated with the
  /// application (Import Jobs resource) or segment (Segment Import Jobs
  /// resource).
  final List<ImportJobResponse> item;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  ImportJobsResponse({
    required this.item,
    this.nextToken,
  });

  factory ImportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ImportJobsResponse(
      item: (json['Item'] as List)
          .whereNotNull()
          .map((e) => ImportJobResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final item = this.item;
    final nextToken = this.nextToken;
    return {
      'Item': item,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Schedule of the campaign.
class InAppCampaignSchedule {
  /// The scheduled time after which the in-app message should not be shown.
  /// Timestamp is in ISO 8601 format.
  final String? endDate;

  /// The event filter the SDK has to use to show the in-app message in the
  /// application.
  final CampaignEventFilter? eventFilter;

  /// Time during which the in-app message should not be shown to the user.
  final QuietTime? quietTime;

  InAppCampaignSchedule({
    this.endDate,
    this.eventFilter,
    this.quietTime,
  });

  factory InAppCampaignSchedule.fromJson(Map<String, dynamic> json) {
    return InAppCampaignSchedule(
      endDate: json['EndDate'] as String?,
      eventFilter: json['EventFilter'] != null
          ? CampaignEventFilter.fromJson(
              json['EventFilter'] as Map<String, dynamic>)
          : null,
      quietTime: json['QuietTime'] != null
          ? QuietTime.fromJson(json['QuietTime'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final endDate = this.endDate;
    final eventFilter = this.eventFilter;
    final quietTime = this.quietTime;
    return {
      if (endDate != null) 'EndDate': endDate,
      if (eventFilter != null) 'EventFilter': eventFilter,
      if (quietTime != null) 'QuietTime': quietTime,
    };
  }
}

/// Provides all fields required for building an in-app message.
class InAppMessage {
  /// In-app message content.
  final List<InAppMessageContent>? content;

  /// Custom config to be sent to SDK.
  final Map<String, String>? customConfig;

  /// The layout of the message.
  final Layout? layout;

  InAppMessage({
    this.content,
    this.customConfig,
    this.layout,
  });

  factory InAppMessage.fromJson(Map<String, dynamic> json) {
    return InAppMessage(
      content: (json['Content'] as List?)
          ?.whereNotNull()
          .map((e) => InAppMessageContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      customConfig: (json['CustomConfig'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      layout: (json['Layout'] as String?)?.toLayout(),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final customConfig = this.customConfig;
    final layout = this.layout;
    return {
      if (content != null) 'Content': content,
      if (customConfig != null) 'CustomConfig': customConfig,
      if (layout != null) 'Layout': layout.toValue(),
    };
  }
}

/// Text config for Message Body.
class InAppMessageBodyConfig {
  /// The alignment of the text. Valid values: LEFT, CENTER, RIGHT.
  final Alignment alignment;

  /// Message Body.
  final String body;

  /// The text color.
  final String textColor;

  InAppMessageBodyConfig({
    required this.alignment,
    required this.body,
    required this.textColor,
  });

  factory InAppMessageBodyConfig.fromJson(Map<String, dynamic> json) {
    return InAppMessageBodyConfig(
      alignment: (json['Alignment'] as String).toAlignment(),
      body: json['Body'] as String,
      textColor: json['TextColor'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final alignment = this.alignment;
    final body = this.body;
    final textColor = this.textColor;
    return {
      'Alignment': alignment.toValue(),
      'Body': body,
      'TextColor': textColor,
    };
  }
}

/// Button Config for an in-app message.
class InAppMessageButton {
  /// Default button content.
  final OverrideButtonConfiguration? android;

  /// Default button content.
  final DefaultButtonConfiguration? defaultConfig;

  /// Default button content.
  final OverrideButtonConfiguration? ios;

  /// Default button content.
  final OverrideButtonConfiguration? web;

  InAppMessageButton({
    this.android,
    this.defaultConfig,
    this.ios,
    this.web,
  });

  factory InAppMessageButton.fromJson(Map<String, dynamic> json) {
    return InAppMessageButton(
      android: json['Android'] != null
          ? OverrideButtonConfiguration.fromJson(
              json['Android'] as Map<String, dynamic>)
          : null,
      defaultConfig: json['DefaultConfig'] != null
          ? DefaultButtonConfiguration.fromJson(
              json['DefaultConfig'] as Map<String, dynamic>)
          : null,
      ios: json['IOS'] != null
          ? OverrideButtonConfiguration.fromJson(
              json['IOS'] as Map<String, dynamic>)
          : null,
      web: json['Web'] != null
          ? OverrideButtonConfiguration.fromJson(
              json['Web'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final android = this.android;
    final defaultConfig = this.defaultConfig;
    final ios = this.ios;
    final web = this.web;
    return {
      if (android != null) 'Android': android,
      if (defaultConfig != null) 'DefaultConfig': defaultConfig,
      if (ios != null) 'IOS': ios,
      if (web != null) 'Web': web,
    };
  }
}

/// Targeted in-app message campaign.
class InAppMessageCampaign {
  /// Campaign id of the corresponding campaign.
  final String? campaignId;

  /// Daily cap which controls the number of times any in-app messages can be
  /// shown to the endpoint during a day.
  final int? dailyCap;

  /// In-app message content with all fields required for rendering an in-app
  /// message.
  final InAppMessage? inAppMessage;

  /// Priority of the in-app message.
  final int? priority;

  /// Schedule of the campaign.
  final InAppCampaignSchedule? schedule;

  /// Session cap which controls the number of times an in-app message can be
  /// shown to the endpoint during an application session.
  final int? sessionCap;

  /// Total cap which controls the number of times an in-app message can be shown
  /// to the endpoint.
  final int? totalCap;

  /// Treatment id of the campaign.
  final String? treatmentId;

  InAppMessageCampaign({
    this.campaignId,
    this.dailyCap,
    this.inAppMessage,
    this.priority,
    this.schedule,
    this.sessionCap,
    this.totalCap,
    this.treatmentId,
  });

  factory InAppMessageCampaign.fromJson(Map<String, dynamic> json) {
    return InAppMessageCampaign(
      campaignId: json['CampaignId'] as String?,
      dailyCap: json['DailyCap'] as int?,
      inAppMessage: json['InAppMessage'] != null
          ? InAppMessage.fromJson(json['InAppMessage'] as Map<String, dynamic>)
          : null,
      priority: json['Priority'] as int?,
      schedule: json['Schedule'] != null
          ? InAppCampaignSchedule.fromJson(
              json['Schedule'] as Map<String, dynamic>)
          : null,
      sessionCap: json['SessionCap'] as int?,
      totalCap: json['TotalCap'] as int?,
      treatmentId: json['TreatmentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final campaignId = this.campaignId;
    final dailyCap = this.dailyCap;
    final inAppMessage = this.inAppMessage;
    final priority = this.priority;
    final schedule = this.schedule;
    final sessionCap = this.sessionCap;
    final totalCap = this.totalCap;
    final treatmentId = this.treatmentId;
    return {
      if (campaignId != null) 'CampaignId': campaignId,
      if (dailyCap != null) 'DailyCap': dailyCap,
      if (inAppMessage != null) 'InAppMessage': inAppMessage,
      if (priority != null) 'Priority': priority,
      if (schedule != null) 'Schedule': schedule,
      if (sessionCap != null) 'SessionCap': sessionCap,
      if (totalCap != null) 'TotalCap': totalCap,
      if (treatmentId != null) 'TreatmentId': treatmentId,
    };
  }
}

/// The configuration for the message content.
class InAppMessageContent {
  /// The background color for the message.
  final String? backgroundColor;

  /// The configuration for the message body.
  final InAppMessageBodyConfig? bodyConfig;

  /// The configuration for the message header.
  final InAppMessageHeaderConfig? headerConfig;

  /// The image url for the background of message.
  final String? imageUrl;

  /// The first button inside the message.
  final InAppMessageButton? primaryBtn;

  /// The second button inside message.
  final InAppMessageButton? secondaryBtn;

  InAppMessageContent({
    this.backgroundColor,
    this.bodyConfig,
    this.headerConfig,
    this.imageUrl,
    this.primaryBtn,
    this.secondaryBtn,
  });

  factory InAppMessageContent.fromJson(Map<String, dynamic> json) {
    return InAppMessageContent(
      backgroundColor: json['BackgroundColor'] as String?,
      bodyConfig: json['BodyConfig'] != null
          ? InAppMessageBodyConfig.fromJson(
              json['BodyConfig'] as Map<String, dynamic>)
          : null,
      headerConfig: json['HeaderConfig'] != null
          ? InAppMessageHeaderConfig.fromJson(
              json['HeaderConfig'] as Map<String, dynamic>)
          : null,
      imageUrl: json['ImageUrl'] as String?,
      primaryBtn: json['PrimaryBtn'] != null
          ? InAppMessageButton.fromJson(
              json['PrimaryBtn'] as Map<String, dynamic>)
          : null,
      secondaryBtn: json['SecondaryBtn'] != null
          ? InAppMessageButton.fromJson(
              json['SecondaryBtn'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final backgroundColor = this.backgroundColor;
    final bodyConfig = this.bodyConfig;
    final headerConfig = this.headerConfig;
    final imageUrl = this.imageUrl;
    final primaryBtn = this.primaryBtn;
    final secondaryBtn = this.secondaryBtn;
    return {
      if (backgroundColor != null) 'BackgroundColor': backgroundColor,
      if (bodyConfig != null) 'BodyConfig': bodyConfig,
      if (headerConfig != null) 'HeaderConfig': headerConfig,
      if (imageUrl != null) 'ImageUrl': imageUrl,
      if (primaryBtn != null) 'PrimaryBtn': primaryBtn,
      if (secondaryBtn != null) 'SecondaryBtn': secondaryBtn,
    };
  }
}

/// Text config for Message Header.
class InAppMessageHeaderConfig {
  /// The alignment of the text. Valid values: LEFT, CENTER, RIGHT.
  final Alignment alignment;

  /// Message Header.
  final String header;

  /// The text color.
  final String textColor;

  InAppMessageHeaderConfig({
    required this.alignment,
    required this.header,
    required this.textColor,
  });

  factory InAppMessageHeaderConfig.fromJson(Map<String, dynamic> json) {
    return InAppMessageHeaderConfig(
      alignment: (json['Alignment'] as String).toAlignment(),
      header: json['Header'] as String,
      textColor: json['TextColor'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final alignment = this.alignment;
    final header = this.header;
    final textColor = this.textColor;
    return {
      'Alignment': alignment.toValue(),
      'Header': header,
      'TextColor': textColor,
    };
  }
}

/// Get in-app messages response object.
class InAppMessagesResponse {
  /// List of targeted in-app message campaigns.
  final List<InAppMessageCampaign>? inAppMessageCampaigns;

  InAppMessagesResponse({
    this.inAppMessageCampaigns,
  });

  factory InAppMessagesResponse.fromJson(Map<String, dynamic> json) {
    return InAppMessagesResponse(
      inAppMessageCampaigns: (json['InAppMessageCampaigns'] as List?)
          ?.whereNotNull()
          .map((e) => InAppMessageCampaign.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final inAppMessageCampaigns = this.inAppMessageCampaigns;
    return {
      if (inAppMessageCampaigns != null)
        'InAppMessageCampaigns': inAppMessageCampaigns,
    };
  }
}

/// InApp Template Request.
class InAppTemplateRequest {
  /// The content of the message, can include up to 5 modals. Each modal must
  /// contain a message, a header, and background color. ImageUrl and buttons are
  /// optional.
  final List<InAppMessageContent>? content;

  /// Custom config to be sent to client.
  final Map<String, String>? customConfig;

  /// The layout of the message.
  final Layout? layout;

  /// The description of the template.
  final String? templateDescription;

  /// <note>
  /// As of <b>22-05-2023</b> tags has been deprecated for update operations.
  /// After this date any value in tags is not processed and an error code is not
  /// returned. To manage tags we recommend using either <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/tags-resource-arn.html">Tags</a>
  /// in the <i>API Reference for Amazon Pinpoint</i>, <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/resourcegroupstaggingapi/index.html">resourcegroupstaggingapi</a>
  /// commands in the <i>AWS Command Line Interface Documentation</i> or <a
  /// href="https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/services/resourcegroupstaggingapi/package-summary.html">resourcegroupstaggingapi</a>
  /// in the <i>AWS SDK</i>.
  /// </note>
  /// (Deprecated) A string-to-string map of key-value pairs that defines the tags
  /// to associate with the message template. Each tag consists of a required tag
  /// key and an associated tag value.
  final Map<String, String>? tags;

  InAppTemplateRequest({
    this.content,
    this.customConfig,
    this.layout,
    this.templateDescription,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final content = this.content;
    final customConfig = this.customConfig;
    final layout = this.layout;
    final templateDescription = this.templateDescription;
    final tags = this.tags;
    return {
      if (content != null) 'Content': content,
      if (customConfig != null) 'CustomConfig': customConfig,
      if (layout != null) 'Layout': layout.toValue(),
      if (templateDescription != null)
        'TemplateDescription': templateDescription,
      if (tags != null) 'tags': tags,
    };
  }
}

/// In-App Template Response.
class InAppTemplateResponse {
  /// The creation date of the template.
  final String creationDate;

  /// The last modified date of the template.
  final String lastModifiedDate;

  /// The name of the template.
  final String templateName;

  /// The type of the template.
  final TemplateType templateType;

  /// The resource arn of the template.
  final String? arn;

  /// The content of the message, can include up to 5 modals. Each modal must
  /// contain a message, a header, and background color. ImageUrl and buttons are
  /// optional.
  final List<InAppMessageContent>? content;

  /// Custom config to be sent to client.
  final Map<String, String>? customConfig;

  /// The layout of the message.
  final Layout? layout;

  /// The description of the template.
  final String? templateDescription;

  /// The version id of the template.
  final String? version;

  /// A string-to-string map of key-value pairs that defines the tags to associate
  /// with the message template. Each tag consists of a required tag key and an
  /// associated tag value.
  final Map<String, String>? tags;

  InAppTemplateResponse({
    required this.creationDate,
    required this.lastModifiedDate,
    required this.templateName,
    required this.templateType,
    this.arn,
    this.content,
    this.customConfig,
    this.layout,
    this.templateDescription,
    this.version,
    this.tags,
  });

  factory InAppTemplateResponse.fromJson(Map<String, dynamic> json) {
    return InAppTemplateResponse(
      creationDate: json['CreationDate'] as String,
      lastModifiedDate: json['LastModifiedDate'] as String,
      templateName: json['TemplateName'] as String,
      templateType: (json['TemplateType'] as String).toTemplateType(),
      arn: json['Arn'] as String?,
      content: (json['Content'] as List?)
          ?.whereNotNull()
          .map((e) => InAppMessageContent.fromJson(e as Map<String, dynamic>))
          .toList(),
      customConfig: (json['CustomConfig'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      layout: (json['Layout'] as String?)?.toLayout(),
      templateDescription: json['TemplateDescription'] as String?,
      version: json['Version'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final lastModifiedDate = this.lastModifiedDate;
    final templateName = this.templateName;
    final templateType = this.templateType;
    final arn = this.arn;
    final content = this.content;
    final customConfig = this.customConfig;
    final layout = this.layout;
    final templateDescription = this.templateDescription;
    final version = this.version;
    final tags = this.tags;
    return {
      'CreationDate': creationDate,
      'LastModifiedDate': lastModifiedDate,
      'TemplateName': templateName,
      'TemplateType': templateType.toValue(),
      if (arn != null) 'Arn': arn,
      if (content != null) 'Content': content,
      if (customConfig != null) 'CustomConfig': customConfig,
      if (layout != null) 'Layout': layout.toValue(),
      if (templateDescription != null)
        'TemplateDescription': templateDescription,
      if (version != null) 'Version': version,
      if (tags != null) 'tags': tags,
    };
  }
}

enum Include {
  all,
  any,
  none,
}

extension IncludeValueExtension on Include {
  String toValue() {
    switch (this) {
      case Include.all:
        return 'ALL';
      case Include.any:
        return 'ANY';
      case Include.none:
        return 'NONE';
    }
  }
}

extension IncludeFromString on String {
  Include toInclude() {
    switch (this) {
      case 'ALL':
        return Include.all;
      case 'ANY':
        return Include.any;
      case 'NONE':
        return Include.none;
    }
    throw Exception('$this is not known in enum Include');
  }
}

/// Provides information about the results of a request to create or update an
/// endpoint that's associated with an event.
class ItemResponse {
  /// The response that was received after the endpoint data was accepted.
  final EndpointItemResponse? endpointItemResponse;

  /// A multipart response object that contains a key and a value for each event
  /// in the request. In each object, the event ID is the key and an
  /// EventItemResponse object is the value.
  final Map<String, EventItemResponse>? eventsItemResponse;

  ItemResponse({
    this.endpointItemResponse,
    this.eventsItemResponse,
  });

  factory ItemResponse.fromJson(Map<String, dynamic> json) {
    return ItemResponse(
      endpointItemResponse: json['EndpointItemResponse'] != null
          ? EndpointItemResponse.fromJson(
              json['EndpointItemResponse'] as Map<String, dynamic>)
          : null,
      eventsItemResponse: (json['EventsItemResponse'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, EventItemResponse.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final endpointItemResponse = this.endpointItemResponse;
    final eventsItemResponse = this.eventsItemResponse;
    return {
      if (endpointItemResponse != null)
        'EndpointItemResponse': endpointItemResponse,
      if (eventsItemResponse != null) 'EventsItemResponse': eventsItemResponse,
    };
  }
}

enum JobStatus {
  created,
  preparingForInitialization,
  initializing,
  processing,
  pendingJob,
  completing,
  completed,
  failing,
  failed,
}

extension JobStatusValueExtension on JobStatus {
  String toValue() {
    switch (this) {
      case JobStatus.created:
        return 'CREATED';
      case JobStatus.preparingForInitialization:
        return 'PREPARING_FOR_INITIALIZATION';
      case JobStatus.initializing:
        return 'INITIALIZING';
      case JobStatus.processing:
        return 'PROCESSING';
      case JobStatus.pendingJob:
        return 'PENDING_JOB';
      case JobStatus.completing:
        return 'COMPLETING';
      case JobStatus.completed:
        return 'COMPLETED';
      case JobStatus.failing:
        return 'FAILING';
      case JobStatus.failed:
        return 'FAILED';
    }
  }
}

extension JobStatusFromString on String {
  JobStatus toJobStatus() {
    switch (this) {
      case 'CREATED':
        return JobStatus.created;
      case 'PREPARING_FOR_INITIALIZATION':
        return JobStatus.preparingForInitialization;
      case 'INITIALIZING':
        return JobStatus.initializing;
      case 'PROCESSING':
        return JobStatus.processing;
      case 'PENDING_JOB':
        return JobStatus.pendingJob;
      case 'COMPLETING':
        return JobStatus.completing;
      case 'COMPLETED':
        return JobStatus.completed;
      case 'FAILING':
        return JobStatus.failing;
      case 'FAILED':
        return JobStatus.failed;
    }
    throw Exception('$this is not known in enum JobStatus');
  }
}

/// Specifies the message content for a custom channel message that's sent to
/// participants in a journey.
class JourneyCustomMessage {
  /// The message content that's passed to an AWS Lambda function or to a web
  /// hook.
  final String? data;

  JourneyCustomMessage({
    this.data,
  });

  factory JourneyCustomMessage.fromJson(Map<String, dynamic> json) {
    return JourneyCustomMessage(
      data: json['Data'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    return {
      if (data != null) 'Data': data,
    };
  }
}

/// Provides the results of a query that retrieved the data for a standard
/// engagement metric that applies to a journey, and provides information about
/// that query.
class JourneyDateRangeKpiResponse {
  /// The unique identifier for the application that the metric applies to.
  final String applicationId;

  /// The last date and time of the date range that was used to filter the query
  /// results, in extended ISO 8601 format. The date range is inclusive.
  final DateTime endTime;

  /// The unique identifier for the journey that the metric applies to.
  final String journeyId;

  /// The name of the metric, also referred to as a <i>key performance indicator
  /// (KPI)</i>, that the data was retrieved for. This value describes the
  /// associated metric and consists of two or more terms, which are comprised of
  /// lowercase alphanumeric characters, separated by a hyphen. For a list of
  /// possible values, see the <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/analytics-standard-metrics.html">Amazon
  /// Pinpoint Developer Guide</a>.
  final String kpiName;

  /// An array of objects that contains the results of the query. Each object
  /// contains the value for the metric and metadata about that value.
  final BaseKpiResult kpiResult;

  /// The first date and time of the date range that was used to filter the query
  /// results, in extended ISO 8601 format. The date range is inclusive.
  final DateTime startTime;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null for the Journey Engagement Metrics
  /// resource because the resource returns all results in a single page.
  final String? nextToken;

  JourneyDateRangeKpiResponse({
    required this.applicationId,
    required this.endTime,
    required this.journeyId,
    required this.kpiName,
    required this.kpiResult,
    required this.startTime,
    this.nextToken,
  });

  factory JourneyDateRangeKpiResponse.fromJson(Map<String, dynamic> json) {
    return JourneyDateRangeKpiResponse(
      applicationId: json['ApplicationId'] as String,
      endTime: nonNullableTimeStampFromJson(json['EndTime'] as Object),
      journeyId: json['JourneyId'] as String,
      kpiName: json['KpiName'] as String,
      kpiResult:
          BaseKpiResult.fromJson(json['KpiResult'] as Map<String, dynamic>),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] as Object),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final endTime = this.endTime;
    final journeyId = this.journeyId;
    final kpiName = this.kpiName;
    final kpiResult = this.kpiResult;
    final startTime = this.startTime;
    final nextToken = this.nextToken;
    return {
      'ApplicationId': applicationId,
      'EndTime': iso8601ToJson(endTime),
      'JourneyId': journeyId,
      'KpiName': kpiName,
      'KpiResult': kpiResult,
      'StartTime': iso8601ToJson(startTime),
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Specifies the "From" address for an email message that's sent to
/// participants in a journey.
class JourneyEmailMessage {
  /// The verified email address to send the email message from. The default
  /// address is the FromAddress specified for the email channel for the
  /// application.
  final String? fromAddress;

  JourneyEmailMessage({
    this.fromAddress,
  });

  factory JourneyEmailMessage.fromJson(Map<String, dynamic> json) {
    return JourneyEmailMessage(
      fromAddress: json['FromAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fromAddress = this.fromAddress;
    return {
      if (fromAddress != null) 'FromAddress': fromAddress,
    };
  }
}

/// Provides the results of a query that retrieved the data for a standard
/// execution metric that applies to a journey activity, and provides
/// information about that query.
class JourneyExecutionActivityMetricsResponse {
  /// The type of activity that the metric applies to. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// CONDITIONAL_SPLIT – For a yes/no split activity, which is an activity that
  /// sends participants down one of two paths in a journey.
  /// </li>
  /// <li>
  /// HOLDOUT – For a holdout activity, which is an activity that stops a journey
  /// for a specified percentage of participants.
  /// </li>
  /// <li>
  /// MESSAGE – For an email activity, which is an activity that sends an email
  /// message to participants.
  /// </li>
  /// <li>
  /// MULTI_CONDITIONAL_SPLIT – For a multivariate split activity, which is an
  /// activity that sends participants down one of as many as five paths in a
  /// journey.
  /// </li>
  /// <li>
  /// RANDOM_SPLIT – For a random split activity, which is an activity that sends
  /// specified percentages of participants down one of as many as five paths in a
  /// journey.
  /// </li>
  /// <li>
  /// WAIT – For a wait activity, which is an activity that waits for a certain
  /// amount of time or until a specific date and time before moving participants
  /// to the next activity in a journey.
  /// </li>
  /// </ul>
  final String activityType;

  /// The unique identifier for the application that the metric applies to.
  final String applicationId;

  /// The unique identifier for the activity that the metric applies to.
  final String journeyActivityId;

  /// The unique identifier for the journey that the metric applies to.
  final String journeyId;

  /// The date and time, in ISO 8601 format, when Amazon Pinpoint last evaluated
  /// the execution status of the activity and updated the data for the metric.
  final String lastEvaluatedTime;

  /// A JSON object that contains the results of the query. The results vary
  /// depending on the type of activity (ActivityType). For information about the
  /// structure and contents of the results, see the <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/analytics-standard-metrics.html">Amazon
  /// Pinpoint Developer Guide</a>.
  final Map<String, String> metrics;

  JourneyExecutionActivityMetricsResponse({
    required this.activityType,
    required this.applicationId,
    required this.journeyActivityId,
    required this.journeyId,
    required this.lastEvaluatedTime,
    required this.metrics,
  });

  factory JourneyExecutionActivityMetricsResponse.fromJson(
      Map<String, dynamic> json) {
    return JourneyExecutionActivityMetricsResponse(
      activityType: json['ActivityType'] as String,
      applicationId: json['ApplicationId'] as String,
      journeyActivityId: json['JourneyActivityId'] as String,
      journeyId: json['JourneyId'] as String,
      lastEvaluatedTime: json['LastEvaluatedTime'] as String,
      metrics: (json['Metrics'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final activityType = this.activityType;
    final applicationId = this.applicationId;
    final journeyActivityId = this.journeyActivityId;
    final journeyId = this.journeyId;
    final lastEvaluatedTime = this.lastEvaluatedTime;
    final metrics = this.metrics;
    return {
      'ActivityType': activityType,
      'ApplicationId': applicationId,
      'JourneyActivityId': journeyActivityId,
      'JourneyId': journeyId,
      'LastEvaluatedTime': lastEvaluatedTime,
      'Metrics': metrics,
    };
  }
}

/// Provides the results of a query that retrieved the data for a standard
/// execution metric that applies to a journey, and provides information about
/// that query.
class JourneyExecutionMetricsResponse {
  /// The unique identifier for the application that the metric applies to.
  final String applicationId;

  /// The unique identifier for the journey that the metric applies to.
  final String journeyId;

  /// The date and time, in ISO 8601 format, when Amazon Pinpoint last evaluated
  /// the journey and updated the data for the metric.
  final String lastEvaluatedTime;

  /// A JSON object that contains the results of the query. For information about
  /// the structure and contents of the results, see the <a
  /// href="https://docs.aws.amazon.com//pinpoint/latest/developerguide/analytics-standard-metrics.html">Amazon
  /// Pinpoint Developer Guide</a>.
  final Map<String, String> metrics;

  JourneyExecutionMetricsResponse({
    required this.applicationId,
    required this.journeyId,
    required this.lastEvaluatedTime,
    required this.metrics,
  });

  factory JourneyExecutionMetricsResponse.fromJson(Map<String, dynamic> json) {
    return JourneyExecutionMetricsResponse(
      applicationId: json['ApplicationId'] as String,
      journeyId: json['JourneyId'] as String,
      lastEvaluatedTime: json['LastEvaluatedTime'] as String,
      metrics: (json['Metrics'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final journeyId = this.journeyId;
    final lastEvaluatedTime = this.lastEvaluatedTime;
    final metrics = this.metrics;
    return {
      'ApplicationId': applicationId,
      'JourneyId': journeyId,
      'LastEvaluatedTime': lastEvaluatedTime,
      'Metrics': metrics,
    };
  }
}

/// Specifies limits on the messages that a journey can send and the number of
/// times participants can enter a journey.
class JourneyLimits {
  /// The maximum number of messages that the journey can send to a single
  /// participant during a 24-hour period. The maximum value is 100.
  final int? dailyCap;

  /// The maximum number of times that a participant can enter the journey. The
  /// maximum value is 100. To allow participants to enter the journey an
  /// unlimited number of times, set this value to 0.
  final int? endpointReentryCap;

  /// Minimum time that must pass before an endpoint can re-enter a given journey.
  /// The duration should use an ISO 8601 format, such as PT1H.
  final String? endpointReentryInterval;

  /// The maximum number of messages that the journey can send each second.
  final int? messagesPerSecond;

  /// The number of messages that an endpoint can receive during the specified
  /// timeframe.
  final JourneyTimeframeCap? timeframeCap;

  /// The maximum number of messages a journey can sent to a single endpoint. The
  /// maximum value is 100. If set to 0, this limit will not apply.
  final int? totalCap;

  JourneyLimits({
    this.dailyCap,
    this.endpointReentryCap,
    this.endpointReentryInterval,
    this.messagesPerSecond,
    this.timeframeCap,
    this.totalCap,
  });

  factory JourneyLimits.fromJson(Map<String, dynamic> json) {
    return JourneyLimits(
      dailyCap: json['DailyCap'] as int?,
      endpointReentryCap: json['EndpointReentryCap'] as int?,
      endpointReentryInterval: json['EndpointReentryInterval'] as String?,
      messagesPerSecond: json['MessagesPerSecond'] as int?,
      timeframeCap: json['TimeframeCap'] != null
          ? JourneyTimeframeCap.fromJson(
              json['TimeframeCap'] as Map<String, dynamic>)
          : null,
      totalCap: json['TotalCap'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dailyCap = this.dailyCap;
    final endpointReentryCap = this.endpointReentryCap;
    final endpointReentryInterval = this.endpointReentryInterval;
    final messagesPerSecond = this.messagesPerSecond;
    final timeframeCap = this.timeframeCap;
    final totalCap = this.totalCap;
    return {
      if (dailyCap != null) 'DailyCap': dailyCap,
      if (endpointReentryCap != null) 'EndpointReentryCap': endpointReentryCap,
      if (endpointReentryInterval != null)
        'EndpointReentryInterval': endpointReentryInterval,
      if (messagesPerSecond != null) 'MessagesPerSecond': messagesPerSecond,
      if (timeframeCap != null) 'TimeframeCap': timeframeCap,
      if (totalCap != null) 'TotalCap': totalCap,
    };
  }
}

/// Specifies the message configuration for a push notification that's sent to
/// participants in a journey.
class JourneyPushMessage {
  /// The number of seconds that the push notification service should keep the
  /// message, if the service is unable to deliver the notification the first
  /// time. This value is converted to an expiration value when it's sent to a
  /// push-notification service. If this value is 0, the service treats the
  /// notification as if it expires immediately and the service doesn't store or
  /// try to deliver the notification again.
  ///
  /// This value doesn't apply to messages that are sent through the Amazon Device
  /// Messaging (ADM) service.
  final String? timeToLive;

  JourneyPushMessage({
    this.timeToLive,
  });

  factory JourneyPushMessage.fromJson(Map<String, dynamic> json) {
    return JourneyPushMessage(
      timeToLive: json['TimeToLive'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final timeToLive = this.timeToLive;
    return {
      if (timeToLive != null) 'TimeToLive': timeToLive,
    };
  }
}

/// The channel-specific configurations for the journey.
class JourneyChannelSettings {
  /// Amazon Resource Name (ARN) of the Connect Campaign.
  final String? connectCampaignArn;

  /// IAM role ARN to be assumed when invoking Connect campaign execution APIs for
  /// dialing.
  final String? connectCampaignExecutionRoleArn;

  JourneyChannelSettings({
    this.connectCampaignArn,
    this.connectCampaignExecutionRoleArn,
  });

  factory JourneyChannelSettings.fromJson(Map<String, dynamic> json) {
    return JourneyChannelSettings(
      connectCampaignArn: json['ConnectCampaignArn'] as String?,
      connectCampaignExecutionRoleArn:
          json['ConnectCampaignExecutionRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectCampaignArn = this.connectCampaignArn;
    final connectCampaignExecutionRoleArn =
        this.connectCampaignExecutionRoleArn;
    return {
      if (connectCampaignArn != null) 'ConnectCampaignArn': connectCampaignArn,
      if (connectCampaignExecutionRoleArn != null)
        'ConnectCampaignExecutionRoleArn': connectCampaignExecutionRoleArn,
    };
  }
}

/// Provides information about the status, configuration, and other settings for
/// a journey.
class JourneyResponse {
  /// The unique identifier for the application that the journey applies to.
  final String applicationId;

  /// The unique identifier for the journey.
  final String id;

  /// The name of the journey.
  final String name;

  /// A map that contains a set of Activity objects, one object for each activity
  /// in the journey. For each Activity object, the key is the unique identifier
  /// (string) for an activity and the value is the settings for the activity.
  final Map<String, Activity>? activities;

  /// The time when a journey will not send messages. QuietTime should be
  /// configured first and SendingSchedule should be set to true.
  final ClosedDays? closedDays;

  /// The date, in ISO 8601 format, when the journey was created.
  final String? creationDate;

  /// The channel-specific configurations for the journey.
  final JourneyChannelSettings? journeyChannelSettings;

  /// The date, in ISO 8601 format, when the journey was last modified.
  final String? lastModifiedDate;

  /// The messaging and entry limits for the journey.
  final JourneyLimits? limits;

  /// Specifies whether the journey's scheduled start and end times use each
  /// participant's local time. If this value is true, the schedule uses each
  /// participant's local time.
  final bool? localTime;

  /// The time when a journey can send messages. QuietTime should be configured
  /// first and SendingSchedule should be set to true.
  final OpenHours? openHours;

  /// The quiet time settings for the journey. Quiet time is a specific time range
  /// when a journey doesn't send messages to participants, if all the following
  /// conditions are met:
  ///
  /// <ul>
  /// <li>
  /// The EndpointDemographic.Timezone property of the endpoint for the
  /// participant is set to a valid value.
  /// </li>
  /// <li>
  /// The current time in the participant's time zone is later than or equal to
  /// the time specified by the QuietTime.Start property for the journey.
  /// </li>
  /// <li>
  /// The current time in the participant's time zone is earlier than or equal to
  /// the time specified by the QuietTime.End property for the journey.
  /// </li>
  /// </ul>
  /// If any of the preceding conditions isn't met, the participant will receive
  /// messages from the journey, even if quiet time is enabled.
  final QuietTime? quietTime;

  /// The frequency with which Amazon Pinpoint evaluates segment and event data
  /// for the journey, as a duration in ISO 8601 format.
  final String? refreshFrequency;

  /// Indicates whether the journey participants should be refreshed when a
  /// segment is updated.
  final bool? refreshOnSegmentUpdate;

  /// The schedule settings for the journey.
  final JourneySchedule? schedule;

  /// Indicates if journey has Advance Quiet Time enabled. This flag should be set
  /// to true in order to allow using OpenHours and ClosedDays.
  final bool? sendingSchedule;

  /// The unique identifier for the first activity in the journey.
  final String? startActivity;

  /// The segment that defines which users are participants in the journey.
  final StartCondition? startCondition;

  /// The current status of the journey. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// DRAFT - The journey is being developed and hasn't been published yet.
  /// </li>
  /// <li>
  /// ACTIVE - The journey has been developed and published. Depending on the
  /// journey's schedule, the journey may currently be running or scheduled to
  /// start running at a later time. If a journey's status is ACTIVE, you can't
  /// add, change, or remove activities from it.
  /// </li>
  /// <li>
  /// COMPLETED - The journey has been published and has finished running. All
  /// participants have entered the journey and no participants are waiting to
  /// complete the journey or any activities in the journey.
  /// </li>
  /// <li>
  /// CANCELLED - The journey has been stopped. If a journey's status is
  /// CANCELLED, you can't add, change, or remove activities or segment settings
  /// from the journey.
  /// </li>
  /// <li>
  /// CLOSED - The journey has been published and has started running. It may have
  /// also passed its scheduled end time, or passed its scheduled start time and a
  /// refresh frequency hasn't been specified for it. If a journey's status is
  /// CLOSED, you can't add participants to it, and no existing participants can
  /// enter the journey for the first time. However, any existing participants who
  /// are currently waiting to start an activity may continue the journey.
  /// </li>
  /// </ul>
  final State? state;

  /// An array of time zone estimation methods, if any, to use for determining an
  /// <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-endpoints-endpoint-id.html">Endpoints</a>
  /// time zone if the Endpoint does not have a value for the Demographic.Timezone
  /// attribute.
  ///
  /// <ul>
  /// <li>
  /// PHONE_NUMBER - A time zone is determined based on the Endpoint.Address and
  /// Endpoint.Location.Country.
  /// </li>
  /// <li>
  /// POSTAL_CODE - A time zone is determined based on the
  /// Endpoint.Location.PostalCode and Endpoint.Location.Country.
  /// <note>
  /// POSTAL_CODE detection is only supported in the United States, United
  /// Kingdom, Australia, New Zealand, Canada, France, Italy, Spain, Germany and
  /// in regions where Amazon Pinpoint is available.
  /// </note></li>
  /// </ul>
  final List<TimezoneEstimationMethodsElement>? timezoneEstimationMethods;

  /// Indicates whether endpoints in quiet hours should enter a wait activity
  /// until quiet hours have elapsed.
  final bool? waitForQuietTime;

  /// This object is not used or supported.
  final Map<String, String>? tags;

  JourneyResponse({
    required this.applicationId,
    required this.id,
    required this.name,
    this.activities,
    this.closedDays,
    this.creationDate,
    this.journeyChannelSettings,
    this.lastModifiedDate,
    this.limits,
    this.localTime,
    this.openHours,
    this.quietTime,
    this.refreshFrequency,
    this.refreshOnSegmentUpdate,
    this.schedule,
    this.sendingSchedule,
    this.startActivity,
    this.startCondition,
    this.state,
    this.timezoneEstimationMethods,
    this.waitForQuietTime,
    this.tags,
  });

  factory JourneyResponse.fromJson(Map<String, dynamic> json) {
    return JourneyResponse(
      applicationId: json['ApplicationId'] as String,
      id: json['Id'] as String,
      name: json['Name'] as String,
      activities: (json['Activities'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, Activity.fromJson(e as Map<String, dynamic>))),
      closedDays: json['ClosedDays'] != null
          ? ClosedDays.fromJson(json['ClosedDays'] as Map<String, dynamic>)
          : null,
      creationDate: json['CreationDate'] as String?,
      journeyChannelSettings: json['JourneyChannelSettings'] != null
          ? JourneyChannelSettings.fromJson(
              json['JourneyChannelSettings'] as Map<String, dynamic>)
          : null,
      lastModifiedDate: json['LastModifiedDate'] as String?,
      limits: json['Limits'] != null
          ? JourneyLimits.fromJson(json['Limits'] as Map<String, dynamic>)
          : null,
      localTime: json['LocalTime'] as bool?,
      openHours: json['OpenHours'] != null
          ? OpenHours.fromJson(json['OpenHours'] as Map<String, dynamic>)
          : null,
      quietTime: json['QuietTime'] != null
          ? QuietTime.fromJson(json['QuietTime'] as Map<String, dynamic>)
          : null,
      refreshFrequency: json['RefreshFrequency'] as String?,
      refreshOnSegmentUpdate: json['RefreshOnSegmentUpdate'] as bool?,
      schedule: json['Schedule'] != null
          ? JourneySchedule.fromJson(json['Schedule'] as Map<String, dynamic>)
          : null,
      sendingSchedule: json['SendingSchedule'] as bool?,
      startActivity: json['StartActivity'] as String?,
      startCondition: json['StartCondition'] != null
          ? StartCondition.fromJson(
              json['StartCondition'] as Map<String, dynamic>)
          : null,
      state: (json['State'] as String?)?.toState(),
      timezoneEstimationMethods: (json['TimezoneEstimationMethods'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toTimezoneEstimationMethodsElement())
          .toList(),
      waitForQuietTime: json['WaitForQuietTime'] as bool?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final id = this.id;
    final name = this.name;
    final activities = this.activities;
    final closedDays = this.closedDays;
    final creationDate = this.creationDate;
    final journeyChannelSettings = this.journeyChannelSettings;
    final lastModifiedDate = this.lastModifiedDate;
    final limits = this.limits;
    final localTime = this.localTime;
    final openHours = this.openHours;
    final quietTime = this.quietTime;
    final refreshFrequency = this.refreshFrequency;
    final refreshOnSegmentUpdate = this.refreshOnSegmentUpdate;
    final schedule = this.schedule;
    final sendingSchedule = this.sendingSchedule;
    final startActivity = this.startActivity;
    final startCondition = this.startCondition;
    final state = this.state;
    final timezoneEstimationMethods = this.timezoneEstimationMethods;
    final waitForQuietTime = this.waitForQuietTime;
    final tags = this.tags;
    return {
      'ApplicationId': applicationId,
      'Id': id,
      'Name': name,
      if (activities != null) 'Activities': activities,
      if (closedDays != null) 'ClosedDays': closedDays,
      if (creationDate != null) 'CreationDate': creationDate,
      if (journeyChannelSettings != null)
        'JourneyChannelSettings': journeyChannelSettings,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (limits != null) 'Limits': limits,
      if (localTime != null) 'LocalTime': localTime,
      if (openHours != null) 'OpenHours': openHours,
      if (quietTime != null) 'QuietTime': quietTime,
      if (refreshFrequency != null) 'RefreshFrequency': refreshFrequency,
      if (refreshOnSegmentUpdate != null)
        'RefreshOnSegmentUpdate': refreshOnSegmentUpdate,
      if (schedule != null) 'Schedule': schedule,
      if (sendingSchedule != null) 'SendingSchedule': sendingSchedule,
      if (startActivity != null) 'StartActivity': startActivity,
      if (startCondition != null) 'StartCondition': startCondition,
      if (state != null) 'State': state.toValue(),
      if (timezoneEstimationMethods != null)
        'TimezoneEstimationMethods':
            timezoneEstimationMethods.map((e) => e.toValue()).toList(),
      if (waitForQuietTime != null) 'WaitForQuietTime': waitForQuietTime,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Provides the results of a query that retrieved the data for a standard
/// execution metric that applies to a journey activity for a particular journey
/// run, and provides information about that query.
class JourneyRunExecutionActivityMetricsResponse {
  /// The type of activity that the metric applies to. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// CONDITIONAL_SPLIT – For a yes/no split activity, which is an activity that
  /// sends participants down one of two paths in a journey.
  /// </li>
  /// <li>
  /// HOLDOUT – For a holdout activity, which is an activity that stops a journey
  /// for a specified percentage of participants.
  /// </li>
  /// <li>
  /// MESSAGE – For an email activity, which is an activity that sends an email
  /// message to participants.
  /// </li>
  /// <li>
  /// MULTI_CONDITIONAL_SPLIT – For a multivariate split activity, which is an
  /// activity that sends participants down one of as many as five paths in a
  /// journey.
  /// </li>
  /// <li>
  /// RANDOM_SPLIT – For a random split activity, which is an activity that sends
  /// specified percentages of participants down one of as many as five paths in a
  /// journey.
  /// </li>
  /// <li>
  /// WAIT – For a wait activity, which is an activity that waits for a certain
  /// amount of time or until a specific date and time before moving participants
  /// to the next activity in a journey.
  /// </li>
  /// </ul>
  final String activityType;

  /// The unique identifier for the application that the metric applies to.
  final String applicationId;

  /// The unique identifier for the activity that the metric applies to.
  final String journeyActivityId;

  /// The unique identifier for the journey that the metric applies to.
  final String journeyId;

  /// The date and time, in ISO 8601 format, when Amazon Pinpoint last evaluated
  /// the execution status of the activity for this journey run and updated the
  /// data for the metric.
  final String lastEvaluatedTime;

  /// A JSON object that contains the results of the query. For information about
  /// the structure and contents of the results, see see <a
  /// href="https://docs.aws.amazon.com//pinpoint/latest/developerguide/analytics-standard-metrics.html">Standard
  /// Amazon Pinpoint analytics metrics</a> in the <i>Amazon Pinpoint Developer
  /// Guide</i>.
  final Map<String, String> metrics;

  /// The unique identifier for the journey run that the metric applies to.
  final String runId;

  JourneyRunExecutionActivityMetricsResponse({
    required this.activityType,
    required this.applicationId,
    required this.journeyActivityId,
    required this.journeyId,
    required this.lastEvaluatedTime,
    required this.metrics,
    required this.runId,
  });

  factory JourneyRunExecutionActivityMetricsResponse.fromJson(
      Map<String, dynamic> json) {
    return JourneyRunExecutionActivityMetricsResponse(
      activityType: json['ActivityType'] as String,
      applicationId: json['ApplicationId'] as String,
      journeyActivityId: json['JourneyActivityId'] as String,
      journeyId: json['JourneyId'] as String,
      lastEvaluatedTime: json['LastEvaluatedTime'] as String,
      metrics: (json['Metrics'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      runId: json['RunId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final activityType = this.activityType;
    final applicationId = this.applicationId;
    final journeyActivityId = this.journeyActivityId;
    final journeyId = this.journeyId;
    final lastEvaluatedTime = this.lastEvaluatedTime;
    final metrics = this.metrics;
    final runId = this.runId;
    return {
      'ActivityType': activityType,
      'ApplicationId': applicationId,
      'JourneyActivityId': journeyActivityId,
      'JourneyId': journeyId,
      'LastEvaluatedTime': lastEvaluatedTime,
      'Metrics': metrics,
      'RunId': runId,
    };
  }
}

/// Provides the results of a query that retrieved the data for a standard
/// execution metric that applies to a journey run, and provides information
/// about that query.
class JourneyRunExecutionMetricsResponse {
  /// The unique identifier for the application that the metric applies to.
  final String applicationId;

  /// The unique identifier for the journey that the metric applies to.
  final String journeyId;

  /// The date and time, in ISO 8601 format, when Amazon Pinpoint last evaluated
  /// the journey run and updated the data for the metric.
  final String lastEvaluatedTime;

  /// A JSON object that contains the results of the query. For information about
  /// the structure and contents of the results, see the <a
  /// href="https://docs.aws.amazon.com//pinpoint/latest/developerguide/analytics-standard-metrics.html">Standard
  /// Amazon Pinpoint analytics metrics</a> in the <i>Amazon Pinpoint Developer
  /// Guide</i>.
  final Map<String, String> metrics;

  /// The unique identifier for the journey run that the metric applies to.
  final String runId;

  JourneyRunExecutionMetricsResponse({
    required this.applicationId,
    required this.journeyId,
    required this.lastEvaluatedTime,
    required this.metrics,
    required this.runId,
  });

  factory JourneyRunExecutionMetricsResponse.fromJson(
      Map<String, dynamic> json) {
    return JourneyRunExecutionMetricsResponse(
      applicationId: json['ApplicationId'] as String,
      journeyId: json['JourneyId'] as String,
      lastEvaluatedTime: json['LastEvaluatedTime'] as String,
      metrics: (json['Metrics'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      runId: json['RunId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final journeyId = this.journeyId;
    final lastEvaluatedTime = this.lastEvaluatedTime;
    final metrics = this.metrics;
    final runId = this.runId;
    return {
      'ApplicationId': applicationId,
      'JourneyId': journeyId,
      'LastEvaluatedTime': lastEvaluatedTime,
      'Metrics': metrics,
      'RunId': runId,
    };
  }
}

/// Provides information from a specified run of a journey.
class JourneyRunResponse {
  /// The time when the journey run was created or scheduled, in ISO 8601 format.
  final String creationTime;

  /// The last time the journey run was updated, in ISO 8601 format..
  final String lastUpdateTime;

  /// The unique identifier for the run.
  final String runId;

  /// The current status of the journey run.
  final JourneyRunStatus status;

  JourneyRunResponse({
    required this.creationTime,
    required this.lastUpdateTime,
    required this.runId,
    required this.status,
  });

  factory JourneyRunResponse.fromJson(Map<String, dynamic> json) {
    return JourneyRunResponse(
      creationTime: json['CreationTime'] as String,
      lastUpdateTime: json['LastUpdateTime'] as String,
      runId: json['RunId'] as String,
      status: (json['Status'] as String).toJourneyRunStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastUpdateTime = this.lastUpdateTime;
    final runId = this.runId;
    final status = this.status;
    return {
      'CreationTime': creationTime,
      'LastUpdateTime': lastUpdateTime,
      'RunId': runId,
      'Status': status.toValue(),
    };
  }
}

/// Provides information from all runs of a journey.
class JourneyRunsResponse {
  /// An array of responses, one for each run of the journey
  final List<JourneyRunResponse> item;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  JourneyRunsResponse({
    required this.item,
    this.nextToken,
  });

  factory JourneyRunsResponse.fromJson(Map<String, dynamic> json) {
    return JourneyRunsResponse(
      item: (json['Item'] as List)
          .whereNotNull()
          .map((e) => JourneyRunResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final item = this.item;
    final nextToken = this.nextToken;
    return {
      'Item': item,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

enum JourneyRunStatus {
  scheduled,
  running,
  completed,
  cancelled,
}

extension JourneyRunStatusValueExtension on JourneyRunStatus {
  String toValue() {
    switch (this) {
      case JourneyRunStatus.scheduled:
        return 'SCHEDULED';
      case JourneyRunStatus.running:
        return 'RUNNING';
      case JourneyRunStatus.completed:
        return 'COMPLETED';
      case JourneyRunStatus.cancelled:
        return 'CANCELLED';
    }
  }
}

extension JourneyRunStatusFromString on String {
  JourneyRunStatus toJourneyRunStatus() {
    switch (this) {
      case 'SCHEDULED':
        return JourneyRunStatus.scheduled;
      case 'RUNNING':
        return JourneyRunStatus.running;
      case 'COMPLETED':
        return JourneyRunStatus.completed;
      case 'CANCELLED':
        return JourneyRunStatus.cancelled;
    }
    throw Exception('$this is not known in enum JourneyRunStatus');
  }
}

/// Specifies the sender ID and message type for an SMS message that's sent to
/// participants in a journey.
class JourneySMSMessage {
  /// The entity ID or Principal Entity (PE) id received from the regulatory body
  /// for sending SMS in your country.
  final String? entityId;

  /// The SMS message type. Valid values are TRANSACTIONAL (for messages that are
  /// critical or time-sensitive, such as a one-time passwords) and PROMOTIONAL
  /// (for messsages that aren't critical or time-sensitive, such as marketing
  /// messages).
  final MessageType? messageType;

  /// The long code to send the SMS message from. This value should be one of the
  /// dedicated long codes that's assigned to your AWS account. Although it isn't
  /// required, we recommend that you specify the long code using an E.164 format
  /// to ensure prompt and accurate delivery of the message. For example,
  /// +12065550100.
  final String? originationNumber;

  /// The sender ID to display as the sender of the message on a recipient's
  /// device. Support for sender IDs varies by country or region. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-sms-countries.html">Supported
  /// Countries and Regions</a> in the Amazon Pinpoint User Guide.
  final String? senderId;

  /// The template ID received from the regulatory body for sending SMS in your
  /// country.
  final String? templateId;

  JourneySMSMessage({
    this.entityId,
    this.messageType,
    this.originationNumber,
    this.senderId,
    this.templateId,
  });

  factory JourneySMSMessage.fromJson(Map<String, dynamic> json) {
    return JourneySMSMessage(
      entityId: json['EntityId'] as String?,
      messageType: (json['MessageType'] as String?)?.toMessageType(),
      originationNumber: json['OriginationNumber'] as String?,
      senderId: json['SenderId'] as String?,
      templateId: json['TemplateId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entityId = this.entityId;
    final messageType = this.messageType;
    final originationNumber = this.originationNumber;
    final senderId = this.senderId;
    final templateId = this.templateId;
    return {
      if (entityId != null) 'EntityId': entityId,
      if (messageType != null) 'MessageType': messageType.toValue(),
      if (originationNumber != null) 'OriginationNumber': originationNumber,
      if (senderId != null) 'SenderId': senderId,
      if (templateId != null) 'TemplateId': templateId,
    };
  }
}

/// Specifies the schedule settings for a journey.
class JourneySchedule {
  /// The scheduled time, in ISO 8601 format, when the journey ended or will end.
  final DateTime? endTime;

  /// The scheduled time, in ISO 8601 format, when the journey began or will
  /// begin.
  final DateTime? startTime;

  /// The starting UTC offset for the journey schedule, if the value of the
  /// journey's LocalTime property is true. Valid values are: UTC,
  /// UTC+01, UTC+02, UTC+03, UTC+03:30, UTC+04, UTC+04:30, UTC+05, UTC+05:30,
  /// UTC+05:45, UTC+06, UTC+06:30, UTC+07, UTC+08, UTC+08:45, UTC+09, UTC+09:30,
  /// UTC+10, UTC+10:30, UTC+11, UTC+12, UTC+12:45, UTC+13, UTC+13:45, UTC-02,
  /// UTC-02:30, UTC-03, UTC-03:30, UTC-04, UTC-05, UTC-06, UTC-07, UTC-08,
  /// UTC-09,
  /// UTC-09:30, UTC-10, and UTC-11.
  final String? timezone;

  JourneySchedule({
    this.endTime,
    this.startTime,
    this.timezone,
  });

  factory JourneySchedule.fromJson(Map<String, dynamic> json) {
    return JourneySchedule(
      endTime: timeStampFromJson(json['EndTime']),
      startTime: timeStampFromJson(json['StartTime']),
      timezone: json['Timezone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    final timezone = this.timezone;
    return {
      if (endTime != null) 'EndTime': iso8601ToJson(endTime),
      if (startTime != null) 'StartTime': iso8601ToJson(startTime),
      if (timezone != null) 'Timezone': timezone,
    };
  }
}

/// Changes the status of a journey.
class JourneyStateRequest {
  /// The status of the journey. Currently, Supported values are ACTIVE, PAUSED,
  /// and CANCELLED
  ///
  /// If you cancel a journey, Amazon Pinpoint continues to perform activities
  /// that are currently in progress, until those activities are complete. Amazon
  /// Pinpoint also continues to collect and aggregate analytics data for those
  /// activities, until they are complete, and any activities that were complete
  /// when you cancelled the journey.
  ///
  /// After you cancel a journey, you can't add, change, or remove any activities
  /// from the journey. In addition, Amazon Pinpoint stops evaluating the journey
  /// and doesn't perform any activities that haven't started.
  ///
  /// When the journey is paused, Amazon Pinpoint continues to perform activities
  /// that are currently in progress, until those activities are complete.
  /// Endpoints will stop entering journeys when the journey is paused and will
  /// resume entering the journey after the journey is resumed. For wait
  /// activities, wait time is paused when the journey is paused. Currently,
  /// PAUSED only supports journeys with a segment refresh interval.
  final State? state;

  JourneyStateRequest({
    this.state,
  });

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      if (state != null) 'State': state.toValue(),
    };
  }
}

/// The number of messages that can be sent to an endpoint during the specified
/// timeframe for all journeys.
class JourneyTimeframeCap {
  /// The maximum number of messages that all journeys can send to an endpoint
  /// during the specified timeframe. The maximum value is 100. If set to 0, this
  /// limit will not apply.
  final int? cap;

  /// The length of the timeframe in days. The maximum value is 30. If set to 0,
  /// this limit will not apply.
  final int? days;

  JourneyTimeframeCap({
    this.cap,
    this.days,
  });

  factory JourneyTimeframeCap.fromJson(Map<String, dynamic> json) {
    return JourneyTimeframeCap(
      cap: json['Cap'] as int?,
      days: json['Days'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final cap = this.cap;
    final days = this.days;
    return {
      if (cap != null) 'Cap': cap,
      if (days != null) 'Days': days,
    };
  }
}

/// Provides information about the status, configuration, and other settings for
/// all the journeys that are associated with an application.
class JourneysResponse {
  /// An array of responses, one for each journey that's associated with the
  /// application.
  final List<JourneyResponse> item;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  JourneysResponse({
    required this.item,
    this.nextToken,
  });

  factory JourneysResponse.fromJson(Map<String, dynamic> json) {
    return JourneysResponse(
      item: (json['Item'] as List)
          .whereNotNull()
          .map((e) => JourneyResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final item = this.item;
    final nextToken = this.nextToken;
    return {
      'Item': item,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

enum Layout {
  bottomBanner,
  topBanner,
  overlays,
  mobileFeed,
  middleBanner,
  carousel,
}

extension LayoutValueExtension on Layout {
  String toValue() {
    switch (this) {
      case Layout.bottomBanner:
        return 'BOTTOM_BANNER';
      case Layout.topBanner:
        return 'TOP_BANNER';
      case Layout.overlays:
        return 'OVERLAYS';
      case Layout.mobileFeed:
        return 'MOBILE_FEED';
      case Layout.middleBanner:
        return 'MIDDLE_BANNER';
      case Layout.carousel:
        return 'CAROUSEL';
    }
  }
}

extension LayoutFromString on String {
  Layout toLayout() {
    switch (this) {
      case 'BOTTOM_BANNER':
        return Layout.bottomBanner;
      case 'TOP_BANNER':
        return Layout.topBanner;
      case 'OVERLAYS':
        return Layout.overlays;
      case 'MOBILE_FEED':
        return Layout.mobileFeed;
      case 'MIDDLE_BANNER':
        return Layout.middleBanner;
      case 'CAROUSEL':
        return Layout.carousel;
    }
    throw Exception('$this is not known in enum Layout');
  }
}

class ListJourneysResponse {
  final JourneysResponse journeysResponse;

  ListJourneysResponse({
    required this.journeysResponse,
  });

  Map<String, dynamic> toJson() {
    final journeysResponse = this.journeysResponse;
    return {
      'JourneysResponse': journeysResponse,
    };
  }
}

/// Provides information about all the recommender model configurations that are
/// associated with your Amazon Pinpoint account.
class ListRecommenderConfigurationsResponse {
  /// An array of responses, one for each recommender model configuration that's
  /// associated with your Amazon Pinpoint account.
  final List<RecommenderConfigurationResponse> item;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  ListRecommenderConfigurationsResponse({
    required this.item,
    this.nextToken,
  });

  factory ListRecommenderConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListRecommenderConfigurationsResponse(
      item: (json['Item'] as List)
          .whereNotNull()
          .map((e) => RecommenderConfigurationResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final item = this.item;
    final nextToken = this.nextToken;
    return {
      'Item': item,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  final TagsModel tagsModel;

  ListTagsForResourceResponse({
    required this.tagsModel,
  });

  Map<String, dynamic> toJson() {
    final tagsModel = this.tagsModel;
    return {
      'TagsModel': tagsModel,
    };
  }
}

class ListTemplateVersionsResponse {
  final TemplateVersionsResponse templateVersionsResponse;

  ListTemplateVersionsResponse({
    required this.templateVersionsResponse,
  });

  Map<String, dynamic> toJson() {
    final templateVersionsResponse = this.templateVersionsResponse;
    return {
      'TemplateVersionsResponse': templateVersionsResponse,
    };
  }
}

class ListTemplatesResponse {
  final TemplatesResponse templatesResponse;

  ListTemplatesResponse({
    required this.templatesResponse,
  });

  Map<String, dynamic> toJson() {
    final templatesResponse = this.templatesResponse;
    return {
      'TemplatesResponse': templatesResponse,
    };
  }
}

/// Specifies the content and settings for a push notification that's sent to
/// recipients of a campaign.
class Message {
  /// The action to occur if a recipient taps the push notification. Valid values
  /// are:
  ///
  /// <ul>
  /// <li>
  /// OPEN_APP - Your app opens or it becomes the foreground app if it was sent to
  /// the background. This is the default action.
  /// </li>
  /// <li>
  /// DEEP_LINK - Your app opens and displays a designated user interface in the
  /// app. This setting uses the deep-linking features of iOS and Android.
  /// </li>
  /// <li>
  /// URL - The default mobile browser on the recipient's device opens and loads
  /// the web page at a URL that you specify.
  /// </li>
  /// </ul>
  final Action? action;

  /// The body of the notification message. The maximum number of characters is
  /// 200.
  final String? body;

  /// The URL of the image to display as the push-notification icon, such as the
  /// icon for the app.
  final String? imageIconUrl;

  /// The URL of the image to display as the small, push-notification icon, such
  /// as a small version of the icon for the app.
  final String? imageSmallIconUrl;

  /// The URL of an image to display in the push notification.
  final String? imageUrl;

  /// The JSON payload to use for a silent push notification.
  final String? jsonBody;

  /// The URL of the image or video to display in the push notification.
  final String? mediaUrl;

  /// The raw, JSON-formatted string to use as the payload for the notification
  /// message. If specified, this value overrides all other content for the
  /// message.
  final String? rawContent;

  /// Specifies whether the notification is a silent push notification, which is a
  /// push notification that doesn't display on a recipient's device. Silent push
  /// notifications can be used for cases such as updating an app's configuration,
  /// displaying messages in an in-app message center, or supporting phone home
  /// functionality.
  final bool? silentPush;

  /// The number of seconds that the push-notification service should keep the
  /// message, if the service is unable to deliver the notification the first
  /// time. This value is converted to an expiration value when it's sent to a
  /// push-notification service. If this value is 0, the service treats the
  /// notification as if it expires immediately and the service doesn't store or
  /// try to deliver the notification again.
  ///
  /// This value doesn't apply to messages that are sent through the Amazon Device
  /// Messaging (ADM) service.
  final int? timeToLive;

  /// The title to display above the notification message on a recipient's device.
  final String? title;

  /// The URL to open in a recipient's default mobile browser, if a recipient taps
  /// the push notification and the value of the Action property is URL.
  final String? url;

  Message({
    this.action,
    this.body,
    this.imageIconUrl,
    this.imageSmallIconUrl,
    this.imageUrl,
    this.jsonBody,
    this.mediaUrl,
    this.rawContent,
    this.silentPush,
    this.timeToLive,
    this.title,
    this.url,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      action: (json['Action'] as String?)?.toAction(),
      body: json['Body'] as String?,
      imageIconUrl: json['ImageIconUrl'] as String?,
      imageSmallIconUrl: json['ImageSmallIconUrl'] as String?,
      imageUrl: json['ImageUrl'] as String?,
      jsonBody: json['JsonBody'] as String?,
      mediaUrl: json['MediaUrl'] as String?,
      rawContent: json['RawContent'] as String?,
      silentPush: json['SilentPush'] as bool?,
      timeToLive: json['TimeToLive'] as int?,
      title: json['Title'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final body = this.body;
    final imageIconUrl = this.imageIconUrl;
    final imageSmallIconUrl = this.imageSmallIconUrl;
    final imageUrl = this.imageUrl;
    final jsonBody = this.jsonBody;
    final mediaUrl = this.mediaUrl;
    final rawContent = this.rawContent;
    final silentPush = this.silentPush;
    final timeToLive = this.timeToLive;
    final title = this.title;
    final url = this.url;
    return {
      if (action != null) 'Action': action.toValue(),
      if (body != null) 'Body': body,
      if (imageIconUrl != null) 'ImageIconUrl': imageIconUrl,
      if (imageSmallIconUrl != null) 'ImageSmallIconUrl': imageSmallIconUrl,
      if (imageUrl != null) 'ImageUrl': imageUrl,
      if (jsonBody != null) 'JsonBody': jsonBody,
      if (mediaUrl != null) 'MediaUrl': mediaUrl,
      if (rawContent != null) 'RawContent': rawContent,
      if (silentPush != null) 'SilentPush': silentPush,
      if (timeToLive != null) 'TimeToLive': timeToLive,
      if (title != null) 'Title': title,
      if (url != null) 'Url': url,
    };
  }
}

/// Provides information about an API request or response.
class MessageBody {
  /// The message that's returned from the API.
  final String? message;

  /// The unique identifier for the request or response.
  final String? requestID;

  MessageBody({
    this.message,
    this.requestID,
  });

  factory MessageBody.fromJson(Map<String, dynamic> json) {
    return MessageBody(
      message: json['Message'] as String?,
      requestID: json['RequestID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final requestID = this.requestID;
    return {
      if (message != null) 'Message': message,
      if (requestID != null) 'RequestID': requestID,
    };
  }
}

/// Specifies the message configuration settings for a campaign.
class MessageConfiguration {
  /// The message that the campaign sends through the ADM (Amazon Device
  /// Messaging) channel. If specified, this message overrides the default
  /// message.
  final Message? aDMMessage;

  /// The message that the campaign sends through the APNs (Apple Push
  /// Notification service) channel. If specified, this message overrides the
  /// default message.
  final Message? aPNSMessage;

  /// The message that the campaign sends through the Baidu (Baidu Cloud Push)
  /// channel. If specified, this message overrides the default message.
  final Message? baiduMessage;

  /// The message that the campaign sends through a custom channel, as specified
  /// by the delivery configuration (CustomDeliveryConfiguration) settings for the
  /// campaign. If specified, this message overrides the default message.
  final CampaignCustomMessage? customMessage;

  /// The default message that the campaign sends through all the channels that
  /// are configured for the campaign.
  final Message? defaultMessage;

  /// The message that the campaign sends through the email channel. If specified,
  /// this message overrides the default message.
  final CampaignEmailMessage? emailMessage;

  /// The message that the campaign sends through the GCM channel, which enables
  /// Amazon Pinpoint to send push notifications through the Firebase Cloud
  /// Messaging (FCM), formerly Google Cloud Messaging (GCM), service. If
  /// specified, this message overrides the default message.
  final Message? gCMMessage;

  /// The in-app message configuration.
  final CampaignInAppMessage? inAppMessage;

  /// The message that the campaign sends through the SMS channel. If specified,
  /// this message overrides the default message.
  final CampaignSmsMessage? sMSMessage;

  MessageConfiguration({
    this.aDMMessage,
    this.aPNSMessage,
    this.baiduMessage,
    this.customMessage,
    this.defaultMessage,
    this.emailMessage,
    this.gCMMessage,
    this.inAppMessage,
    this.sMSMessage,
  });

  factory MessageConfiguration.fromJson(Map<String, dynamic> json) {
    return MessageConfiguration(
      aDMMessage: json['ADMMessage'] != null
          ? Message.fromJson(json['ADMMessage'] as Map<String, dynamic>)
          : null,
      aPNSMessage: json['APNSMessage'] != null
          ? Message.fromJson(json['APNSMessage'] as Map<String, dynamic>)
          : null,
      baiduMessage: json['BaiduMessage'] != null
          ? Message.fromJson(json['BaiduMessage'] as Map<String, dynamic>)
          : null,
      customMessage: json['CustomMessage'] != null
          ? CampaignCustomMessage.fromJson(
              json['CustomMessage'] as Map<String, dynamic>)
          : null,
      defaultMessage: json['DefaultMessage'] != null
          ? Message.fromJson(json['DefaultMessage'] as Map<String, dynamic>)
          : null,
      emailMessage: json['EmailMessage'] != null
          ? CampaignEmailMessage.fromJson(
              json['EmailMessage'] as Map<String, dynamic>)
          : null,
      gCMMessage: json['GCMMessage'] != null
          ? Message.fromJson(json['GCMMessage'] as Map<String, dynamic>)
          : null,
      inAppMessage: json['InAppMessage'] != null
          ? CampaignInAppMessage.fromJson(
              json['InAppMessage'] as Map<String, dynamic>)
          : null,
      sMSMessage: json['SMSMessage'] != null
          ? CampaignSmsMessage.fromJson(
              json['SMSMessage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aDMMessage = this.aDMMessage;
    final aPNSMessage = this.aPNSMessage;
    final baiduMessage = this.baiduMessage;
    final customMessage = this.customMessage;
    final defaultMessage = this.defaultMessage;
    final emailMessage = this.emailMessage;
    final gCMMessage = this.gCMMessage;
    final inAppMessage = this.inAppMessage;
    final sMSMessage = this.sMSMessage;
    return {
      if (aDMMessage != null) 'ADMMessage': aDMMessage,
      if (aPNSMessage != null) 'APNSMessage': aPNSMessage,
      if (baiduMessage != null) 'BaiduMessage': baiduMessage,
      if (customMessage != null) 'CustomMessage': customMessage,
      if (defaultMessage != null) 'DefaultMessage': defaultMessage,
      if (emailMessage != null) 'EmailMessage': emailMessage,
      if (gCMMessage != null) 'GCMMessage': gCMMessage,
      if (inAppMessage != null) 'InAppMessage': inAppMessage,
      if (sMSMessage != null) 'SMSMessage': sMSMessage,
    };
  }
}

/// Specifies the configuration and other settings for a message.
class MessageRequest {
  /// The settings and content for the default message and any default messages
  /// that you defined for specific channels.
  final DirectMessageConfiguration messageConfiguration;

  /// A map of key-value pairs, where each key is an address and each value is an
  /// <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-messages.html#apps-application-id-messages-model-addressconfiguration">AddressConfiguration</a>
  /// object. An address can be a push notification token, a phone number, or an
  /// email address. You can use an <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-messages.html#apps-application-id-messages-model-addressconfiguration">AddressConfiguration</a>
  /// object to tailor the message for an address by specifying settings such as
  /// content overrides and message variables.
  final Map<String, AddressConfiguration>? addresses;

  /// A map of custom attributes to attach to the message. For a push
  /// notification, this payload is added to the data.pinpoint object. For an
  /// email or text message, this payload is added to email/SMS delivery receipt
  /// event attributes.
  final Map<String, String>? context;

  /// A map of key-value pairs, where each key is an endpoint ID and each value is
  /// an <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-messages.html#apps-application-id-messages-model-endpointsendconfiguration">EndpointSendConfiguration</a>
  /// object. You can use an <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-messages.html#apps-application-id-messages-model-endpointsendconfiguration">EndpointSendConfiguration</a>
  /// object to tailor the message for an endpoint by specifying settings such as
  /// content overrides and message variables.
  final Map<String, EndpointSendConfiguration>? endpoints;

  /// The message template to use for the message.
  final TemplateConfiguration? templateConfiguration;

  /// The unique identifier for tracing the message. This identifier is visible to
  /// message recipients.
  final String? traceId;

  MessageRequest({
    required this.messageConfiguration,
    this.addresses,
    this.context,
    this.endpoints,
    this.templateConfiguration,
    this.traceId,
  });

  Map<String, dynamic> toJson() {
    final messageConfiguration = this.messageConfiguration;
    final addresses = this.addresses;
    final context = this.context;
    final endpoints = this.endpoints;
    final templateConfiguration = this.templateConfiguration;
    final traceId = this.traceId;
    return {
      'MessageConfiguration': messageConfiguration,
      if (addresses != null) 'Addresses': addresses,
      if (context != null) 'Context': context,
      if (endpoints != null) 'Endpoints': endpoints,
      if (templateConfiguration != null)
        'TemplateConfiguration': templateConfiguration,
      if (traceId != null) 'TraceId': traceId,
    };
  }
}

/// Provides information about the results of a request to send a message to an
/// endpoint address.
class MessageResponse {
  /// The unique identifier for the application that was used to send the message.
  final String applicationId;

  /// A map that contains a multipart response for each address that the message
  /// was sent to. In the map, the endpoint ID is the key and the result is the
  /// value.
  final Map<String, EndpointMessageResult>? endpointResult;

  /// The identifier for the original request that the message was delivered for.
  final String? requestId;

  /// A map that contains a multipart response for each address (email address,
  /// phone number, or push notification token) that the message was sent to. In
  /// the map, the address is the key and the result is the value.
  final Map<String, MessageResult>? result;

  MessageResponse({
    required this.applicationId,
    this.endpointResult,
    this.requestId,
    this.result,
  });

  factory MessageResponse.fromJson(Map<String, dynamic> json) {
    return MessageResponse(
      applicationId: json['ApplicationId'] as String,
      endpointResult: (json['EndpointResult'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, EndpointMessageResult.fromJson(e as Map<String, dynamic>))),
      requestId: json['RequestId'] as String?,
      result: (json['Result'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, MessageResult.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final endpointResult = this.endpointResult;
    final requestId = this.requestId;
    final result = this.result;
    return {
      'ApplicationId': applicationId,
      if (endpointResult != null) 'EndpointResult': endpointResult,
      if (requestId != null) 'RequestId': requestId,
      if (result != null) 'Result': result,
    };
  }
}

/// Provides information about the results of sending a message directly to an
/// endpoint address.
class MessageResult {
  /// The delivery status of the message. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// DUPLICATE - The endpoint address is a duplicate of another endpoint address.
  /// Amazon Pinpoint won't attempt to send the message again.
  /// </li>
  /// <li>
  /// OPT_OUT - The user who's associated with the endpoint address has opted out
  /// of receiving messages from you. Amazon Pinpoint won't attempt to send the
  /// message again.
  /// </li>
  /// <li>
  /// PERMANENT_FAILURE - An error occurred when delivering the message to the
  /// endpoint address. Amazon Pinpoint won't attempt to send the message again.
  /// </li>
  /// <li>
  /// SUCCESSFUL - The message was successfully delivered to the endpoint address.
  /// </li>
  /// <li>
  /// TEMPORARY_FAILURE - A temporary error occurred. Amazon Pinpoint won't
  /// attempt to send the message again.
  /// </li>
  /// <li>
  /// THROTTLED - Amazon Pinpoint throttled the operation to send the message to
  /// the endpoint address.
  /// </li>
  /// <li>
  /// UNKNOWN_FAILURE - An unknown error occurred.
  /// </li>
  /// </ul>
  final DeliveryStatus deliveryStatus;

  /// The downstream service status code for delivering the message.
  final int statusCode;

  /// The unique identifier for the message that was sent.
  final String? messageId;

  /// The status message for delivering the message.
  final String? statusMessage;

  /// For push notifications that are sent through the GCM channel, specifies
  /// whether the endpoint's device registration token was updated as part of
  /// delivering the message.
  final String? updatedToken;

  MessageResult({
    required this.deliveryStatus,
    required this.statusCode,
    this.messageId,
    this.statusMessage,
    this.updatedToken,
  });

  factory MessageResult.fromJson(Map<String, dynamic> json) {
    return MessageResult(
      deliveryStatus: (json['DeliveryStatus'] as String).toDeliveryStatus(),
      statusCode: json['StatusCode'] as int,
      messageId: json['MessageId'] as String?,
      statusMessage: json['StatusMessage'] as String?,
      updatedToken: json['UpdatedToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryStatus = this.deliveryStatus;
    final statusCode = this.statusCode;
    final messageId = this.messageId;
    final statusMessage = this.statusMessage;
    final updatedToken = this.updatedToken;
    return {
      'DeliveryStatus': deliveryStatus.toValue(),
      'StatusCode': statusCode,
      if (messageId != null) 'MessageId': messageId,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (updatedToken != null) 'UpdatedToken': updatedToken,
    };
  }
}

enum MessageType {
  transactional,
  promotional,
}

extension MessageTypeValueExtension on MessageType {
  String toValue() {
    switch (this) {
      case MessageType.transactional:
        return 'TRANSACTIONAL';
      case MessageType.promotional:
        return 'PROMOTIONAL';
    }
  }
}

extension MessageTypeFromString on String {
  MessageType toMessageType() {
    switch (this) {
      case 'TRANSACTIONAL':
        return MessageType.transactional;
      case 'PROMOTIONAL':
        return MessageType.promotional;
    }
    throw Exception('$this is not known in enum MessageType');
  }
}

/// Specifies metric-based criteria for including or excluding endpoints from a
/// segment. These criteria derive from custom metrics that you define for
/// endpoints.
class MetricDimension {
  /// The operator to use when comparing metric values. Valid values are:
  /// GREATER_THAN, LESS_THAN, GREATER_THAN_OR_EQUAL, LESS_THAN_OR_EQUAL, and
  /// EQUAL.
  final String comparisonOperator;

  /// The value to compare.
  final double value;

  MetricDimension({
    required this.comparisonOperator,
    required this.value,
  });

  factory MetricDimension.fromJson(Map<String, dynamic> json) {
    return MetricDimension(
      comparisonOperator: json['ComparisonOperator'] as String,
      value: json['Value'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final comparisonOperator = this.comparisonOperator;
    final value = this.value;
    return {
      'ComparisonOperator': comparisonOperator,
      'Value': value,
    };
  }
}

enum Mode {
  delivery,
  filter,
}

extension ModeValueExtension on Mode {
  String toValue() {
    switch (this) {
      case Mode.delivery:
        return 'DELIVERY';
      case Mode.filter:
        return 'FILTER';
    }
  }
}

extension ModeFromString on String {
  Mode toMode() {
    switch (this) {
      case 'DELIVERY':
        return Mode.delivery;
      case 'FILTER':
        return Mode.filter;
    }
    throw Exception('$this is not known in enum Mode');
  }
}

/// Specifies a condition to evaluate for an activity path in a journey.
class MultiConditionalBranch {
  /// The condition to evaluate for the activity path.
  final SimpleCondition? condition;

  /// The unique identifier for the next activity to perform, after completing the
  /// activity for the path.
  final String? nextActivity;

  MultiConditionalBranch({
    this.condition,
    this.nextActivity,
  });

  factory MultiConditionalBranch.fromJson(Map<String, dynamic> json) {
    return MultiConditionalBranch(
      condition: json['Condition'] != null
          ? SimpleCondition.fromJson(json['Condition'] as Map<String, dynamic>)
          : null,
      nextActivity: json['NextActivity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    final nextActivity = this.nextActivity;
    return {
      if (condition != null) 'Condition': condition,
      if (nextActivity != null) 'NextActivity': nextActivity,
    };
  }
}

/// Specifies the settings for a multivariate split activity in a journey. This
/// type of activity sends participants down one of as many as five paths
/// (including a default <i>Else</i> path) in a journey, based on conditions
/// that you specify.
/// <note>
/// To create multivariate split activities that send participants down
/// different paths based on push notification events (such as Open or Received
/// events), your mobile app has to specify the User ID and Endpoint ID values.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/integrate.html">Integrating
/// Amazon Pinpoint with your application</a> in the <i>Amazon Pinpoint
/// Developer Guide</i>.
/// </note>
class MultiConditionalSplitActivity {
  /// The paths for the activity, including the conditions for entering each path
  /// and the activity to perform for each path.
  final List<MultiConditionalBranch>? branches;

  /// The unique identifier for the activity to perform for participants who don't
  /// meet any of the conditions specified for other paths in the activity.
  final String? defaultActivity;

  /// The amount of time to wait or the date and time when Amazon Pinpoint
  /// determines whether the conditions are met.
  final WaitTime? evaluationWaitTime;

  MultiConditionalSplitActivity({
    this.branches,
    this.defaultActivity,
    this.evaluationWaitTime,
  });

  factory MultiConditionalSplitActivity.fromJson(Map<String, dynamic> json) {
    return MultiConditionalSplitActivity(
      branches: (json['Branches'] as List?)
          ?.whereNotNull()
          .map(
              (e) => MultiConditionalBranch.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultActivity: json['DefaultActivity'] as String?,
      evaluationWaitTime: json['EvaluationWaitTime'] != null
          ? WaitTime.fromJson(
              json['EvaluationWaitTime'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final branches = this.branches;
    final defaultActivity = this.defaultActivity;
    final evaluationWaitTime = this.evaluationWaitTime;
    return {
      if (branches != null) 'Branches': branches,
      if (defaultActivity != null) 'DefaultActivity': defaultActivity,
      if (evaluationWaitTime != null) 'EvaluationWaitTime': evaluationWaitTime,
    };
  }
}

/// Specifies a phone number to validate and retrieve information about.
class NumberValidateRequest {
  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region where the phone number was originally registered.
  final String? isoCountryCode;

  /// The phone number to retrieve information about. The phone number that you
  /// provide should include a valid numeric country code. Otherwise, the
  /// operation might result in an error.
  final String? phoneNumber;

  NumberValidateRequest({
    this.isoCountryCode,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    final isoCountryCode = this.isoCountryCode;
    final phoneNumber = this.phoneNumber;
    return {
      if (isoCountryCode != null) 'IsoCountryCode': isoCountryCode,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
    };
  }
}

/// Provides information about a phone number.
class NumberValidateResponse {
  /// The carrier or service provider that the phone number is currently
  /// registered with. In some countries and regions, this value may be the
  /// carrier or service provider that the phone number was originally registered
  /// with.
  final String? carrier;

  /// The name of the city where the phone number was originally registered.
  final String? city;

  /// The cleansed phone number, in E.164 format, for the location where the phone
  /// number was originally registered.
  final String? cleansedPhoneNumberE164;

  /// The cleansed phone number, in the format for the location where the phone
  /// number was originally registered.
  final String? cleansedPhoneNumberNational;

  /// The name of the country or region where the phone number was originally
  /// registered.
  final String? country;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region where the phone number was originally registered.
  final String? countryCodeIso2;

  /// The numeric code for the country or region where the phone number was
  /// originally registered.
  final String? countryCodeNumeric;

  /// The name of the county where the phone number was originally registered.
  final String? county;

  /// The two-character code, in ISO 3166-1 alpha-2 format, that was sent in the
  /// request body.
  final String? originalCountryCodeIso2;

  /// The phone number that was sent in the request body.
  final String? originalPhoneNumber;

  /// The description of the phone type. Valid values are: MOBILE, LANDLINE, VOIP,
  /// INVALID, PREPAID, and OTHER.
  final String? phoneType;

  /// The phone type, represented by an integer. Valid values are: 0 (mobile), 1
  /// (landline), 2 (VoIP), 3 (invalid), 4 (other), and 5 (prepaid).
  final int? phoneTypeCode;

  /// The time zone for the location where the phone number was originally
  /// registered.
  final String? timezone;

  /// The postal or ZIP code for the location where the phone number was
  /// originally registered.
  final String? zipCode;

  NumberValidateResponse({
    this.carrier,
    this.city,
    this.cleansedPhoneNumberE164,
    this.cleansedPhoneNumberNational,
    this.country,
    this.countryCodeIso2,
    this.countryCodeNumeric,
    this.county,
    this.originalCountryCodeIso2,
    this.originalPhoneNumber,
    this.phoneType,
    this.phoneTypeCode,
    this.timezone,
    this.zipCode,
  });

  factory NumberValidateResponse.fromJson(Map<String, dynamic> json) {
    return NumberValidateResponse(
      carrier: json['Carrier'] as String?,
      city: json['City'] as String?,
      cleansedPhoneNumberE164: json['CleansedPhoneNumberE164'] as String?,
      cleansedPhoneNumberNational:
          json['CleansedPhoneNumberNational'] as String?,
      country: json['Country'] as String?,
      countryCodeIso2: json['CountryCodeIso2'] as String?,
      countryCodeNumeric: json['CountryCodeNumeric'] as String?,
      county: json['County'] as String?,
      originalCountryCodeIso2: json['OriginalCountryCodeIso2'] as String?,
      originalPhoneNumber: json['OriginalPhoneNumber'] as String?,
      phoneType: json['PhoneType'] as String?,
      phoneTypeCode: json['PhoneTypeCode'] as int?,
      timezone: json['Timezone'] as String?,
      zipCode: json['ZipCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final carrier = this.carrier;
    final city = this.city;
    final cleansedPhoneNumberE164 = this.cleansedPhoneNumberE164;
    final cleansedPhoneNumberNational = this.cleansedPhoneNumberNational;
    final country = this.country;
    final countryCodeIso2 = this.countryCodeIso2;
    final countryCodeNumeric = this.countryCodeNumeric;
    final county = this.county;
    final originalCountryCodeIso2 = this.originalCountryCodeIso2;
    final originalPhoneNumber = this.originalPhoneNumber;
    final phoneType = this.phoneType;
    final phoneTypeCode = this.phoneTypeCode;
    final timezone = this.timezone;
    final zipCode = this.zipCode;
    return {
      if (carrier != null) 'Carrier': carrier,
      if (city != null) 'City': city,
      if (cleansedPhoneNumberE164 != null)
        'CleansedPhoneNumberE164': cleansedPhoneNumberE164,
      if (cleansedPhoneNumberNational != null)
        'CleansedPhoneNumberNational': cleansedPhoneNumberNational,
      if (country != null) 'Country': country,
      if (countryCodeIso2 != null) 'CountryCodeIso2': countryCodeIso2,
      if (countryCodeNumeric != null) 'CountryCodeNumeric': countryCodeNumeric,
      if (county != null) 'County': county,
      if (originalCountryCodeIso2 != null)
        'OriginalCountryCodeIso2': originalCountryCodeIso2,
      if (originalPhoneNumber != null)
        'OriginalPhoneNumber': originalPhoneNumber,
      if (phoneType != null) 'PhoneType': phoneType,
      if (phoneTypeCode != null) 'PhoneTypeCode': phoneTypeCode,
      if (timezone != null) 'Timezone': timezone,
      if (zipCode != null) 'ZipCode': zipCode,
    };
  }
}

enum Operator {
  all,
  any,
}

extension OperatorValueExtension on Operator {
  String toValue() {
    switch (this) {
      case Operator.all:
        return 'ALL';
      case Operator.any:
        return 'ANY';
    }
  }
}

extension OperatorFromString on String {
  Operator toOperator() {
    switch (this) {
      case 'ALL':
        return Operator.all;
      case 'ANY':
        return Operator.any;
    }
    throw Exception('$this is not known in enum Operator');
  }
}

/// Override button configuration.
class OverrideButtonConfiguration {
  /// Action triggered by the button.
  final ButtonAction buttonAction;

  /// Button destination.
  final String? link;

  OverrideButtonConfiguration({
    required this.buttonAction,
    this.link,
  });

  factory OverrideButtonConfiguration.fromJson(Map<String, dynamic> json) {
    return OverrideButtonConfiguration(
      buttonAction: (json['ButtonAction'] as String).toButtonAction(),
      link: json['Link'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final buttonAction = this.buttonAction;
    final link = this.link;
    return {
      'ButtonAction': buttonAction.toValue(),
      if (link != null) 'Link': link,
    };
  }
}

class PhoneNumberValidateResponse {
  final NumberValidateResponse numberValidateResponse;

  PhoneNumberValidateResponse({
    required this.numberValidateResponse,
  });

  Map<String, dynamic> toJson() {
    final numberValidateResponse = this.numberValidateResponse;
    return {
      'NumberValidateResponse': numberValidateResponse,
    };
  }
}

/// Specifies the properties and attributes of an endpoint that's associated
/// with an event.
class PublicEndpoint {
  /// The unique identifier for the recipient, such as a device token, email
  /// address, or mobile phone number.
  final String? address;

  /// One or more custom attributes that describe the endpoint by associating a
  /// name with an array of values. You can use these attributes as filter
  /// criteria when you create segments.
  final Map<String, List<String>>? attributes;

  /// The channel that's used when sending messages or push notifications to the
  /// endpoint.
  final ChannelType? channelType;

  /// The demographic information for the endpoint, such as the time zone and
  /// platform.
  final EndpointDemographic? demographic;

  /// The date and time, in ISO 8601 format, when the endpoint was last updated.
  final String? effectiveDate;

  /// Specifies whether to send messages or push notifications to the endpoint.
  /// Valid values are: ACTIVE, messages are sent to the endpoint; and, INACTIVE,
  /// messages aren’t sent to the endpoint.
  ///
  /// Amazon Pinpoint automatically sets this value to ACTIVE when you create an
  /// endpoint or update an existing endpoint. Amazon Pinpoint automatically sets
  /// this value to INACTIVE if you update another endpoint that has the same
  /// address specified by the Address property.
  final String? endpointStatus;

  /// The geographic information for the endpoint.
  final EndpointLocation? location;

  /// One or more custom metrics that your app reports to Amazon Pinpoint for the
  /// endpoint.
  final Map<String, double>? metrics;

  /// Specifies whether the user who's associated with the endpoint has opted out
  /// of receiving messages and push notifications from you. Possible values are:
  /// ALL, the user has opted out and doesn't want to receive any messages or push
  /// notifications; and, NONE, the user hasn't opted out and wants to receive all
  /// messages and push notifications.
  final String? optOut;

  /// A unique identifier that's generated each time the endpoint is updated.
  final String? requestId;

  /// One or more custom user attributes that your app reports to Amazon Pinpoint
  /// for the user who's associated with the endpoint.
  final EndpointUser? user;

  PublicEndpoint({
    this.address,
    this.attributes,
    this.channelType,
    this.demographic,
    this.effectiveDate,
    this.endpointStatus,
    this.location,
    this.metrics,
    this.optOut,
    this.requestId,
    this.user,
  });

  Map<String, dynamic> toJson() {
    final address = this.address;
    final attributes = this.attributes;
    final channelType = this.channelType;
    final demographic = this.demographic;
    final effectiveDate = this.effectiveDate;
    final endpointStatus = this.endpointStatus;
    final location = this.location;
    final metrics = this.metrics;
    final optOut = this.optOut;
    final requestId = this.requestId;
    final user = this.user;
    return {
      if (address != null) 'Address': address,
      if (attributes != null) 'Attributes': attributes,
      if (channelType != null) 'ChannelType': channelType.toValue(),
      if (demographic != null) 'Demographic': demographic,
      if (effectiveDate != null) 'EffectiveDate': effectiveDate,
      if (endpointStatus != null) 'EndpointStatus': endpointStatus,
      if (location != null) 'Location': location,
      if (metrics != null) 'Metrics': metrics,
      if (optOut != null) 'OptOut': optOut,
      if (requestId != null) 'RequestId': requestId,
      if (user != null) 'User': user,
    };
  }
}

/// Specifies the settings for a push notification activity in a journey. This
/// type of activity sends a push notification to participants.
class PushMessageActivity {
  /// Specifies the time to live (TTL) value for push notifications that are sent
  /// to participants in a journey.
  final JourneyPushMessage? messageConfig;

  /// The unique identifier for the next activity to perform, after the message is
  /// sent.
  final String? nextActivity;

  /// The name of the push notification template to use for the message. If
  /// specified, this value must match the name of an existing message template.
  final String? templateName;

  /// The unique identifier for the version of the push notification template to
  /// use for the message. If specified, this value must match the identifier for
  /// an existing template version. To retrieve a list of versions and version
  /// identifiers for a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  ///
  /// If you don't specify a value for this property, Amazon Pinpoint uses the
  /// <i>active version</i> of the template. The <i>active version</i> is
  /// typically the version of a template that's been most recently reviewed and
  /// approved for use, depending on your workflow. It isn't necessarily the
  /// latest version of a template.
  final String? templateVersion;

  PushMessageActivity({
    this.messageConfig,
    this.nextActivity,
    this.templateName,
    this.templateVersion,
  });

  factory PushMessageActivity.fromJson(Map<String, dynamic> json) {
    return PushMessageActivity(
      messageConfig: json['MessageConfig'] != null
          ? JourneyPushMessage.fromJson(
              json['MessageConfig'] as Map<String, dynamic>)
          : null,
      nextActivity: json['NextActivity'] as String?,
      templateName: json['TemplateName'] as String?,
      templateVersion: json['TemplateVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messageConfig = this.messageConfig;
    final nextActivity = this.nextActivity;
    final templateName = this.templateName;
    final templateVersion = this.templateVersion;
    return {
      if (messageConfig != null) 'MessageConfig': messageConfig,
      if (nextActivity != null) 'NextActivity': nextActivity,
      if (templateName != null) 'TemplateName': templateName,
      if (templateVersion != null) 'TemplateVersion': templateVersion,
    };
  }
}

/// Specifies the content and settings for a message template that can be used
/// in messages that are sent through a push notification channel.
class PushNotificationTemplateRequest {
  /// The message template to use for the ADM (Amazon Device Messaging) channel.
  /// This message template overrides the default template for push notification
  /// channels (DefaultPushNotificationTemplate).
  final AndroidPushNotificationTemplate? adm;

  /// The message template to use for the APNs (Apple Push Notification service)
  /// channel. This message template overrides the default template for push
  /// notification channels (DefaultPushNotificationTemplate).
  final APNSPushNotificationTemplate? apns;

  /// The message template to use for the Baidu (Baidu Cloud Push) channel. This
  /// message template overrides the default template for push notification
  /// channels (DefaultPushNotificationTemplate).
  final AndroidPushNotificationTemplate? baidu;

  /// The default message template to use for push notification channels.
  final DefaultPushNotificationTemplate? defaultValue;

  /// A JSON object that specifies the default values to use for message variables
  /// in the message template. This object is a set of key-value pairs. Each key
  /// defines a message variable in the template. The corresponding value defines
  /// the default value for that variable. When you create a message that's based
  /// on the template, you can override these defaults with message-specific and
  /// address-specific variables and values.
  final String? defaultSubstitutions;

  /// The message template to use for the GCM channel, which is used to send
  /// notifications through the Firebase Cloud Messaging (FCM), formerly Google
  /// Cloud Messaging (GCM), service. This message template overrides the default
  /// template for push notification channels (DefaultPushNotificationTemplate).
  final AndroidPushNotificationTemplate? gcm;

  /// The unique identifier for the recommender model to use for the message
  /// template. Amazon Pinpoint uses this value to determine how to retrieve and
  /// process data from a recommender model when it sends messages that use the
  /// template, if the template contains message variables for recommendation
  /// data.
  final String? recommenderId;

  /// A custom description of the message template.
  final String? templateDescription;

  /// <note>
  /// As of <b>22-05-2023</b> tags has been deprecated for update operations.
  /// After this date any value in tags is not processed and an error code is not
  /// returned. To manage tags we recommend using either <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/tags-resource-arn.html">Tags</a>
  /// in the <i>API Reference for Amazon Pinpoint</i>, <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/resourcegroupstaggingapi/index.html">resourcegroupstaggingapi</a>
  /// commands in the <i>AWS Command Line Interface Documentation</i> or <a
  /// href="https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/services/resourcegroupstaggingapi/package-summary.html">resourcegroupstaggingapi</a>
  /// in the <i>AWS SDK</i>.
  /// </note>
  /// (Deprecated) A string-to-string map of key-value pairs that defines the tags
  /// to associate with the message template. Each tag consists of a required tag
  /// key and an associated tag value.
  final Map<String, String>? tags;

  PushNotificationTemplateRequest({
    this.adm,
    this.apns,
    this.baidu,
    this.defaultValue,
    this.defaultSubstitutions,
    this.gcm,
    this.recommenderId,
    this.templateDescription,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final adm = this.adm;
    final apns = this.apns;
    final baidu = this.baidu;
    final defaultValue = this.defaultValue;
    final defaultSubstitutions = this.defaultSubstitutions;
    final gcm = this.gcm;
    final recommenderId = this.recommenderId;
    final templateDescription = this.templateDescription;
    final tags = this.tags;
    return {
      if (adm != null) 'ADM': adm,
      if (apns != null) 'APNS': apns,
      if (baidu != null) 'Baidu': baidu,
      if (defaultValue != null) 'Default': defaultValue,
      if (defaultSubstitutions != null)
        'DefaultSubstitutions': defaultSubstitutions,
      if (gcm != null) 'GCM': gcm,
      if (recommenderId != null) 'RecommenderId': recommenderId,
      if (templateDescription != null)
        'TemplateDescription': templateDescription,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Provides information about the content and settings for a message template
/// that can be used in messages that are sent through a push notification
/// channel.
class PushNotificationTemplateResponse {
  /// The date, in ISO 8601 format, when the message template was created.
  final String creationDate;

  /// The date, in ISO 8601 format, when the message template was last modified.
  final String lastModifiedDate;

  /// The name of the message template.
  final String templateName;

  /// The type of channel that the message template is designed for. For a push
  /// notification template, this value is PUSH.
  final TemplateType templateType;

  /// The message template that's used for the ADM (Amazon Device Messaging)
  /// channel. This message template overrides the default template for push
  /// notification channels (DefaultPushNotificationTemplate).
  final AndroidPushNotificationTemplate? adm;

  /// The message template that's used for the APNs (Apple Push Notification
  /// service) channel. This message template overrides the default template for
  /// push notification channels (DefaultPushNotificationTemplate).
  final APNSPushNotificationTemplate? apns;

  /// The Amazon Resource Name (ARN) of the message template.
  final String? arn;

  /// The message template that's used for the Baidu (Baidu Cloud Push) channel.
  /// This message template overrides the default template for push notification
  /// channels (DefaultPushNotificationTemplate).
  final AndroidPushNotificationTemplate? baidu;

  /// The default message template that's used for push notification channels.
  final DefaultPushNotificationTemplate? defaultValue;

  /// The JSON object that specifies the default values that are used for message
  /// variables in the message template. This object is a set of key-value pairs.
  /// Each key defines a message variable in the template. The corresponding value
  /// defines the default value for that variable.
  final String? defaultSubstitutions;

  /// The message template that's used for the GCM channel, which is used to send
  /// notifications through the Firebase Cloud Messaging (FCM), formerly Google
  /// Cloud Messaging (GCM), service. This message template overrides the default
  /// template for push notification channels (DefaultPushNotificationTemplate).
  final AndroidPushNotificationTemplate? gcm;

  /// The unique identifier for the recommender model that's used by the message
  /// template.
  final String? recommenderId;

  /// The custom description of the message template.
  final String? templateDescription;

  /// The unique identifier, as an integer, for the active version of the message
  /// template, or the version of the template that you specified by using the
  /// version parameter in your request.
  final String? version;

  /// A string-to-string map of key-value pairs that identifies the tags that are
  /// associated with the message template. Each tag consists of a required tag
  /// key and an associated tag value.
  final Map<String, String>? tags;

  PushNotificationTemplateResponse({
    required this.creationDate,
    required this.lastModifiedDate,
    required this.templateName,
    required this.templateType,
    this.adm,
    this.apns,
    this.arn,
    this.baidu,
    this.defaultValue,
    this.defaultSubstitutions,
    this.gcm,
    this.recommenderId,
    this.templateDescription,
    this.version,
    this.tags,
  });

  factory PushNotificationTemplateResponse.fromJson(Map<String, dynamic> json) {
    return PushNotificationTemplateResponse(
      creationDate: json['CreationDate'] as String,
      lastModifiedDate: json['LastModifiedDate'] as String,
      templateName: json['TemplateName'] as String,
      templateType: (json['TemplateType'] as String).toTemplateType(),
      adm: json['ADM'] != null
          ? AndroidPushNotificationTemplate.fromJson(
              json['ADM'] as Map<String, dynamic>)
          : null,
      apns: json['APNS'] != null
          ? APNSPushNotificationTemplate.fromJson(
              json['APNS'] as Map<String, dynamic>)
          : null,
      arn: json['Arn'] as String?,
      baidu: json['Baidu'] != null
          ? AndroidPushNotificationTemplate.fromJson(
              json['Baidu'] as Map<String, dynamic>)
          : null,
      defaultValue: json['Default'] != null
          ? DefaultPushNotificationTemplate.fromJson(
              json['Default'] as Map<String, dynamic>)
          : null,
      defaultSubstitutions: json['DefaultSubstitutions'] as String?,
      gcm: json['GCM'] != null
          ? AndroidPushNotificationTemplate.fromJson(
              json['GCM'] as Map<String, dynamic>)
          : null,
      recommenderId: json['RecommenderId'] as String?,
      templateDescription: json['TemplateDescription'] as String?,
      version: json['Version'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final lastModifiedDate = this.lastModifiedDate;
    final templateName = this.templateName;
    final templateType = this.templateType;
    final adm = this.adm;
    final apns = this.apns;
    final arn = this.arn;
    final baidu = this.baidu;
    final defaultValue = this.defaultValue;
    final defaultSubstitutions = this.defaultSubstitutions;
    final gcm = this.gcm;
    final recommenderId = this.recommenderId;
    final templateDescription = this.templateDescription;
    final version = this.version;
    final tags = this.tags;
    return {
      'CreationDate': creationDate,
      'LastModifiedDate': lastModifiedDate,
      'TemplateName': templateName,
      'TemplateType': templateType.toValue(),
      if (adm != null) 'ADM': adm,
      if (apns != null) 'APNS': apns,
      if (arn != null) 'Arn': arn,
      if (baidu != null) 'Baidu': baidu,
      if (defaultValue != null) 'Default': defaultValue,
      if (defaultSubstitutions != null)
        'DefaultSubstitutions': defaultSubstitutions,
      if (gcm != null) 'GCM': gcm,
      if (recommenderId != null) 'RecommenderId': recommenderId,
      if (templateDescription != null)
        'TemplateDescription': templateDescription,
      if (version != null) 'Version': version,
      if (tags != null) 'tags': tags,
    };
  }
}

class PutEventStreamResponse {
  final EventStream eventStream;

  PutEventStreamResponse({
    required this.eventStream,
  });

  Map<String, dynamic> toJson() {
    final eventStream = this.eventStream;
    return {
      'EventStream': eventStream,
    };
  }
}

class PutEventsResponse {
  final EventsResponse eventsResponse;

  PutEventsResponse({
    required this.eventsResponse,
  });

  Map<String, dynamic> toJson() {
    final eventsResponse = this.eventsResponse;
    return {
      'EventsResponse': eventsResponse,
    };
  }
}

/// Specifies the start and end times that define a time range when messages
/// aren't sent to endpoints.
class QuietTime {
  /// The specific time when quiet time ends. This value has to use 24-hour
  /// notation and be in HH:MM format, where HH is the hour (with a leading zero,
  /// if applicable) and MM is the minutes. For example, use 02:30 to represent
  /// 2:30 AM, or 14:30 to represent 2:30 PM.
  final String? end;

  /// The specific time when quiet time begins. This value has to use 24-hour
  /// notation and be in HH:MM format, where HH is the hour (with a leading zero,
  /// if applicable) and MM is the minutes. For example, use 02:30 to represent
  /// 2:30 AM, or 14:30 to represent 2:30 PM.
  final String? start;

  QuietTime({
    this.end,
    this.start,
  });

  factory QuietTime.fromJson(Map<String, dynamic> json) {
    return QuietTime(
      end: json['End'] as String?,
      start: json['Start'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final end = this.end;
    final start = this.start;
    return {
      if (end != null) 'End': end,
      if (start != null) 'Start': start,
    };
  }
}

/// Specifies the settings for a random split activity in a journey. This type
/// of activity randomly sends specified percentages of participants down one of
/// as many as five paths in a journey, based on conditions that you specify.
class RandomSplitActivity {
  /// The paths for the activity, including the percentage of participants to
  /// enter each path and the activity to perform for each path.
  final List<RandomSplitEntry>? branches;

  RandomSplitActivity({
    this.branches,
  });

  factory RandomSplitActivity.fromJson(Map<String, dynamic> json) {
    return RandomSplitActivity(
      branches: (json['Branches'] as List?)
          ?.whereNotNull()
          .map((e) => RandomSplitEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final branches = this.branches;
    return {
      if (branches != null) 'Branches': branches,
    };
  }
}

/// Specifies the settings for a path in a random split activity in a journey.
class RandomSplitEntry {
  /// The unique identifier for the next activity to perform, after completing the
  /// activity for the path.
  final String? nextActivity;

  /// The percentage of participants to send down the activity path.
  ///
  /// To determine which participants are sent down each path, Amazon Pinpoint
  /// applies a probability-based algorithm to the percentages that you specify
  /// for the paths. Therefore, the actual percentage of participants who are sent
  /// down a path may not be equal to the percentage that you specify.
  final int? percentage;

  RandomSplitEntry({
    this.nextActivity,
    this.percentage,
  });

  factory RandomSplitEntry.fromJson(Map<String, dynamic> json) {
    return RandomSplitEntry(
      nextActivity: json['NextActivity'] as String?,
      percentage: json['Percentage'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final nextActivity = this.nextActivity;
    final percentage = this.percentage;
    return {
      if (nextActivity != null) 'NextActivity': nextActivity,
      if (percentage != null) 'Percentage': percentage,
    };
  }
}

/// Specifies the contents of an email message, represented as a raw MIME
/// message.
class RawEmail {
  /// The email message, represented as a raw MIME message. The entire message
  /// must be base64 encoded.
  final Uint8List? data;

  RawEmail({
    this.data,
  });

  Map<String, dynamic> toJson() {
    final data = this.data;
    return {
      if (data != null) 'Data': base64Encode(data),
    };
  }
}

/// Specifies criteria for including or excluding endpoints from a segment based
/// on how recently an endpoint was active.
class RecencyDimension {
  /// The duration to use when determining whether an endpoint is active or
  /// inactive.
  final Duration duration;

  /// The type of recency dimension to use for the segment. Valid values are:
  /// ACTIVE, endpoints that were active within the specified duration are
  /// included in the segment; and, INACTIVE, endpoints that weren't active within
  /// the specified duration are included in the segment.
  final RecencyType recencyType;

  RecencyDimension({
    required this.duration,
    required this.recencyType,
  });

  factory RecencyDimension.fromJson(Map<String, dynamic> json) {
    return RecencyDimension(
      duration: (json['Duration'] as String).toDuration(),
      recencyType: (json['RecencyType'] as String).toRecencyType(),
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final recencyType = this.recencyType;
    return {
      'Duration': duration.toValue(),
      'RecencyType': recencyType.toValue(),
    };
  }
}

enum RecencyType {
  active,
  inactive,
}

extension RecencyTypeValueExtension on RecencyType {
  String toValue() {
    switch (this) {
      case RecencyType.active:
        return 'ACTIVE';
      case RecencyType.inactive:
        return 'INACTIVE';
    }
  }
}

extension RecencyTypeFromString on String {
  RecencyType toRecencyType() {
    switch (this) {
      case 'ACTIVE':
        return RecencyType.active;
      case 'INACTIVE':
        return RecencyType.inactive;
    }
    throw Exception('$this is not known in enum RecencyType');
  }
}

/// Provides information about Amazon Pinpoint configuration settings for
/// retrieving and processing data from a recommender model.
class RecommenderConfigurationResponse {
  /// The date, in extended ISO 8601 format, when the configuration was created
  /// for the recommender model.
  final String creationDate;

  /// The unique identifier for the recommender model configuration.
  final String id;

  /// The date, in extended ISO 8601 format, when the configuration for the
  /// recommender model was last modified.
  final String lastModifiedDate;

  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorizes Amazon Pinpoint to retrieve recommendation data
  /// from the recommender model.
  final String recommendationProviderRoleArn;

  /// The Amazon Resource Name (ARN) of the recommender model that Amazon Pinpoint
  /// retrieves the recommendation data from. This value is the ARN of an Amazon
  /// Personalize campaign.
  final String recommendationProviderUri;

  /// A map that defines 1-10 custom endpoint or user attributes, depending on the
  /// value for the RecommendationProviderIdType property. Each of these
  /// attributes temporarily stores a recommended item that's retrieved from the
  /// recommender model and sent to an AWS Lambda function for additional
  /// processing. Each attribute can be used as a message variable in a message
  /// template.
  ///
  /// This value is null if the configuration doesn't invoke an AWS Lambda
  /// function (RecommendationTransformerUri) to perform additional processing of
  /// recommendation data.
  final Map<String, String>? attributes;

  /// The custom description of the configuration for the recommender model.
  final String? description;

  /// The custom name of the configuration for the recommender model.
  final String? name;

  /// The type of Amazon Pinpoint ID that's associated with unique user IDs in the
  /// recommender model. This value enables the model to use attribute and event
  /// data that’s specific to a particular endpoint or user in an Amazon Pinpoint
  /// application. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// PINPOINT_ENDPOINT_ID - Each user in the model is associated with a
  /// particular endpoint in Amazon Pinpoint. The data is correlated based on
  /// endpoint IDs in Amazon Pinpoint. This is the default value.
  /// </li>
  /// <li>
  /// PINPOINT_USER_ID - Each user in the model is associated with a particular
  /// user and endpoint in Amazon Pinpoint. The data is correlated based on user
  /// IDs in Amazon Pinpoint. If this value is specified, an endpoint definition
  /// in Amazon Pinpoint has to specify both a user ID (UserId) and an endpoint
  /// ID. Otherwise, messages won’t be sent to the user's endpoint.
  /// </li>
  /// </ul>
  final String? recommendationProviderIdType;

  /// The name or Amazon Resource Name (ARN) of the AWS Lambda function that
  /// Amazon Pinpoint invokes to perform additional processing of recommendation
  /// data that it retrieves from the recommender model.
  final String? recommendationTransformerUri;

  /// The custom display name for the standard endpoint or user attribute
  /// (RecommendationItems) that temporarily stores recommended items for each
  /// endpoint or user, depending on the value for the
  /// RecommendationProviderIdType property. This name appears in the <b>Attribute
  /// finder</b> of the template editor on the Amazon Pinpoint console.
  ///
  /// This value is null if the configuration doesn't invoke an AWS Lambda
  /// function (RecommendationTransformerUri) to perform additional processing of
  /// recommendation data.
  final String? recommendationsDisplayName;

  /// The number of recommended items that are retrieved from the model for each
  /// endpoint or user, depending on the value for the
  /// RecommendationProviderIdType property. This number determines how many
  /// recommended items are available for use in message variables.
  final int? recommendationsPerMessage;

  RecommenderConfigurationResponse({
    required this.creationDate,
    required this.id,
    required this.lastModifiedDate,
    required this.recommendationProviderRoleArn,
    required this.recommendationProviderUri,
    this.attributes,
    this.description,
    this.name,
    this.recommendationProviderIdType,
    this.recommendationTransformerUri,
    this.recommendationsDisplayName,
    this.recommendationsPerMessage,
  });

  factory RecommenderConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return RecommenderConfigurationResponse(
      creationDate: json['CreationDate'] as String,
      id: json['Id'] as String,
      lastModifiedDate: json['LastModifiedDate'] as String,
      recommendationProviderRoleArn:
          json['RecommendationProviderRoleArn'] as String,
      recommendationProviderUri: json['RecommendationProviderUri'] as String,
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      recommendationProviderIdType:
          json['RecommendationProviderIdType'] as String?,
      recommendationTransformerUri:
          json['RecommendationTransformerUri'] as String?,
      recommendationsDisplayName: json['RecommendationsDisplayName'] as String?,
      recommendationsPerMessage: json['RecommendationsPerMessage'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final id = this.id;
    final lastModifiedDate = this.lastModifiedDate;
    final recommendationProviderRoleArn = this.recommendationProviderRoleArn;
    final recommendationProviderUri = this.recommendationProviderUri;
    final attributes = this.attributes;
    final description = this.description;
    final name = this.name;
    final recommendationProviderIdType = this.recommendationProviderIdType;
    final recommendationTransformerUri = this.recommendationTransformerUri;
    final recommendationsDisplayName = this.recommendationsDisplayName;
    final recommendationsPerMessage = this.recommendationsPerMessage;
    return {
      'CreationDate': creationDate,
      'Id': id,
      'LastModifiedDate': lastModifiedDate,
      'RecommendationProviderRoleArn': recommendationProviderRoleArn,
      'RecommendationProviderUri': recommendationProviderUri,
      if (attributes != null) 'Attributes': attributes,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (recommendationProviderIdType != null)
        'RecommendationProviderIdType': recommendationProviderIdType,
      if (recommendationTransformerUri != null)
        'RecommendationTransformerUri': recommendationTransformerUri,
      if (recommendationsDisplayName != null)
        'RecommendationsDisplayName': recommendationsDisplayName,
      if (recommendationsPerMessage != null)
        'RecommendationsPerMessage': recommendationsPerMessage,
    };
  }
}

class RemoveAttributesResponse {
  final AttributesResource attributesResource;

  RemoveAttributesResponse({
    required this.attributesResource,
  });

  Map<String, dynamic> toJson() {
    final attributesResource = this.attributesResource;
    return {
      'AttributesResource': attributesResource,
    };
  }
}

/// Provides the results of a query that retrieved the data for a standard
/// metric that applies to an application, campaign, or journey.
class ResultRow {
  /// An array of objects that defines the field and field values that were used
  /// to group data in a result set that contains multiple results. This value is
  /// null if the data in a result set isn’t grouped.
  final List<ResultRowValue> groupedBys;

  /// An array of objects that provides pre-aggregated values for a standard
  /// metric that applies to an application, campaign, or journey.
  final List<ResultRowValue> values;

  ResultRow({
    required this.groupedBys,
    required this.values,
  });

  factory ResultRow.fromJson(Map<String, dynamic> json) {
    return ResultRow(
      groupedBys: (json['GroupedBys'] as List)
          .whereNotNull()
          .map((e) => ResultRowValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => ResultRowValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final groupedBys = this.groupedBys;
    final values = this.values;
    return {
      'GroupedBys': groupedBys,
      'Values': values,
    };
  }
}

/// Provides a single value and metadata about that value as part of an array of
/// query results for a standard metric that applies to an application,
/// campaign, or journey.
class ResultRowValue {
  /// The friendly name of the metric whose value is specified by the Value
  /// property.
  final String key;

  /// The data type of the value specified by the Value property.
  final String type;

  /// In a Values object, the value for the metric that the query retrieved data
  /// for. In a GroupedBys object, the value for the field that was used to group
  /// data in a result set that contains multiple results (Values objects).
  final String value;

  ResultRowValue({
    required this.key,
    required this.type,
    required this.value,
  });

  factory ResultRowValue.fromJson(Map<String, dynamic> json) {
    return ResultRowValue(
      key: json['Key'] as String,
      type: json['Type'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final type = this.type;
    final value = this.value;
    return {
      'Key': key,
      'Type': type,
      'Value': value,
    };
  }
}

/// Specifies the status and settings of the SMS channel for an application.
class SMSChannelRequest {
  /// Specifies whether to enable the SMS channel for the application.
  final bool? enabled;

  /// The identity that you want to display on recipients' devices when they
  /// receive messages from the SMS channel.
  final String? senderId;

  /// The registered short code that you want to use when you send messages
  /// through the SMS channel.
  final String? shortCode;

  SMSChannelRequest({
    this.enabled,
    this.senderId,
    this.shortCode,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final senderId = this.senderId;
    final shortCode = this.shortCode;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (senderId != null) 'SenderId': senderId,
      if (shortCode != null) 'ShortCode': shortCode,
    };
  }
}

/// Provides information about the status and settings of the SMS channel for an
/// application.
class SMSChannelResponse {
  /// The type of messaging or notification platform for the channel. For the SMS
  /// channel, this value is SMS.
  final String platform;

  /// The unique identifier for the application that the SMS channel applies to.
  final String? applicationId;

  /// The date and time, in ISO 8601 format, when the SMS channel was enabled.
  final String? creationDate;

  /// Specifies whether the SMS channel is enabled for the application.
  final bool? enabled;

  /// (Not used) This property is retained only for backward compatibility.
  final bool? hasCredential;

  /// (Deprecated) An identifier for the SMS channel. This property is retained
  /// only for backward compatibility.
  final String? id;

  /// Specifies whether the SMS channel is archived.
  final bool? isArchived;

  /// The user who last modified the SMS channel.
  final String? lastModifiedBy;

  /// The date and time, in ISO 8601 format, when the SMS channel was last
  /// modified.
  final String? lastModifiedDate;

  /// The maximum number of promotional messages that you can send through the SMS
  /// channel each second.
  final int? promotionalMessagesPerSecond;

  /// The identity that displays on recipients' devices when they receive messages
  /// from the SMS channel.
  final String? senderId;

  /// The registered short code to use when you send messages through the SMS
  /// channel.
  final String? shortCode;

  /// The maximum number of transactional messages that you can send through the
  /// SMS channel each second.
  final int? transactionalMessagesPerSecond;

  /// The current version of the SMS channel.
  final int? version;

  SMSChannelResponse({
    required this.platform,
    this.applicationId,
    this.creationDate,
    this.enabled,
    this.hasCredential,
    this.id,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.promotionalMessagesPerSecond,
    this.senderId,
    this.shortCode,
    this.transactionalMessagesPerSecond,
    this.version,
  });

  factory SMSChannelResponse.fromJson(Map<String, dynamic> json) {
    return SMSChannelResponse(
      platform: json['Platform'] as String,
      applicationId: json['ApplicationId'] as String?,
      creationDate: json['CreationDate'] as String?,
      enabled: json['Enabled'] as bool?,
      hasCredential: json['HasCredential'] as bool?,
      id: json['Id'] as String?,
      isArchived: json['IsArchived'] as bool?,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: json['LastModifiedDate'] as String?,
      promotionalMessagesPerSecond:
          json['PromotionalMessagesPerSecond'] as int?,
      senderId: json['SenderId'] as String?,
      shortCode: json['ShortCode'] as String?,
      transactionalMessagesPerSecond:
          json['TransactionalMessagesPerSecond'] as int?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final platform = this.platform;
    final applicationId = this.applicationId;
    final creationDate = this.creationDate;
    final enabled = this.enabled;
    final hasCredential = this.hasCredential;
    final id = this.id;
    final isArchived = this.isArchived;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final promotionalMessagesPerSecond = this.promotionalMessagesPerSecond;
    final senderId = this.senderId;
    final shortCode = this.shortCode;
    final transactionalMessagesPerSecond = this.transactionalMessagesPerSecond;
    final version = this.version;
    return {
      'Platform': platform,
      if (applicationId != null) 'ApplicationId': applicationId,
      if (creationDate != null) 'CreationDate': creationDate,
      if (enabled != null) 'Enabled': enabled,
      if (hasCredential != null) 'HasCredential': hasCredential,
      if (id != null) 'Id': id,
      if (isArchived != null) 'IsArchived': isArchived,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (promotionalMessagesPerSecond != null)
        'PromotionalMessagesPerSecond': promotionalMessagesPerSecond,
      if (senderId != null) 'SenderId': senderId,
      if (shortCode != null) 'ShortCode': shortCode,
      if (transactionalMessagesPerSecond != null)
        'TransactionalMessagesPerSecond': transactionalMessagesPerSecond,
      if (version != null) 'Version': version,
    };
  }
}

/// Specifies the default settings for a one-time SMS message that's sent
/// directly to an endpoint.
class SMSMessage {
  /// The body of the SMS message.
  final String? body;

  /// The entity ID or Principal Entity (PE) id received from the regulatory body
  /// for sending SMS in your country.
  final String? entityId;

  /// The SMS program name that you provided to AWS Support when you requested
  /// your dedicated number.
  final String? keyword;

  /// This field is reserved for future use.
  final String? mediaUrl;

  /// The SMS message type. Valid values are TRANSACTIONAL (for messages that are
  /// critical or time-sensitive, such as a one-time passwords) and PROMOTIONAL
  /// (for messsages that aren't critical or time-sensitive, such as marketing
  /// messages).
  final MessageType? messageType;

  /// The number to send the SMS message from. This value should be one of the
  /// dedicated long or short codes that's assigned to your AWS account. If you
  /// don't specify a long or short code, Amazon Pinpoint assigns a random long
  /// code to the SMS message and sends the message from that code.
  final String? originationNumber;

  /// The sender ID to display as the sender of the message on a recipient's
  /// device. Support for sender IDs varies by country or region.
  final String? senderId;

  /// The message variables to use in the SMS message. You can override the
  /// default variables with individual address variables.
  final Map<String, List<String>>? substitutions;

  /// The template ID received from the regulatory body for sending SMS in your
  /// country.
  final String? templateId;

  SMSMessage({
    this.body,
    this.entityId,
    this.keyword,
    this.mediaUrl,
    this.messageType,
    this.originationNumber,
    this.senderId,
    this.substitutions,
    this.templateId,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final entityId = this.entityId;
    final keyword = this.keyword;
    final mediaUrl = this.mediaUrl;
    final messageType = this.messageType;
    final originationNumber = this.originationNumber;
    final senderId = this.senderId;
    final substitutions = this.substitutions;
    final templateId = this.templateId;
    return {
      if (body != null) 'Body': body,
      if (entityId != null) 'EntityId': entityId,
      if (keyword != null) 'Keyword': keyword,
      if (mediaUrl != null) 'MediaUrl': mediaUrl,
      if (messageType != null) 'MessageType': messageType.toValue(),
      if (originationNumber != null) 'OriginationNumber': originationNumber,
      if (senderId != null) 'SenderId': senderId,
      if (substitutions != null) 'Substitutions': substitutions,
      if (templateId != null) 'TemplateId': templateId,
    };
  }
}

/// Specifies the settings for an SMS activity in a journey. This type of
/// activity sends a text message to participants.
class SMSMessageActivity {
  /// Specifies the sender ID and message type for an SMS message that's sent to
  /// participants in a journey.
  final JourneySMSMessage? messageConfig;

  /// The unique identifier for the next activity to perform, after the message is
  /// sent.
  final String? nextActivity;

  /// The name of the SMS message template to use for the message. If specified,
  /// this value must match the name of an existing message template.
  final String? templateName;

  /// The unique identifier for the version of the SMS template to use for the
  /// message. If specified, this value must match the identifier for an existing
  /// template version. To retrieve a list of versions and version identifiers for
  /// a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  ///
  /// If you don't specify a value for this property, Amazon Pinpoint uses the
  /// <i>active version</i> of the template. The <i>active version</i> is
  /// typically the version of a template that's been most recently reviewed and
  /// approved for use, depending on your workflow. It isn't necessarily the
  /// latest version of a template.
  final String? templateVersion;

  SMSMessageActivity({
    this.messageConfig,
    this.nextActivity,
    this.templateName,
    this.templateVersion,
  });

  factory SMSMessageActivity.fromJson(Map<String, dynamic> json) {
    return SMSMessageActivity(
      messageConfig: json['MessageConfig'] != null
          ? JourneySMSMessage.fromJson(
              json['MessageConfig'] as Map<String, dynamic>)
          : null,
      nextActivity: json['NextActivity'] as String?,
      templateName: json['TemplateName'] as String?,
      templateVersion: json['TemplateVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messageConfig = this.messageConfig;
    final nextActivity = this.nextActivity;
    final templateName = this.templateName;
    final templateVersion = this.templateVersion;
    return {
      if (messageConfig != null) 'MessageConfig': messageConfig,
      if (nextActivity != null) 'NextActivity': nextActivity,
      if (templateName != null) 'TemplateName': templateName,
      if (templateVersion != null) 'TemplateVersion': templateVersion,
    };
  }
}

/// Specifies the content and settings for a message template that can be used
/// in text messages that are sent through the SMS channel.
class SMSTemplateRequest {
  /// The message body to use in text messages that are based on the message
  /// template.
  final String? body;

  /// A JSON object that specifies the default values to use for message variables
  /// in the message template. This object is a set of key-value pairs. Each key
  /// defines a message variable in the template. The corresponding value defines
  /// the default value for that variable. When you create a message that's based
  /// on the template, you can override these defaults with message-specific and
  /// address-specific variables and values.
  final String? defaultSubstitutions;

  /// The unique identifier for the recommender model to use for the message
  /// template. Amazon Pinpoint uses this value to determine how to retrieve and
  /// process data from a recommender model when it sends messages that use the
  /// template, if the template contains message variables for recommendation
  /// data.
  final String? recommenderId;

  /// A custom description of the message template.
  final String? templateDescription;

  /// <note>
  /// As of <b>22-05-2023</b> tags has been deprecated for update operations.
  /// After this date any value in tags is not processed and an error code is not
  /// returned. To manage tags we recommend using either <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/tags-resource-arn.html">Tags</a>
  /// in the <i>API Reference for Amazon Pinpoint</i>, <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/resourcegroupstaggingapi/index.html">resourcegroupstaggingapi</a>
  /// commands in the <i>AWS Command Line Interface Documentation</i> or <a
  /// href="https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/services/resourcegroupstaggingapi/package-summary.html">resourcegroupstaggingapi</a>
  /// in the <i>AWS SDK</i>.
  /// </note>
  /// (Deprecated) A string-to-string map of key-value pairs that defines the tags
  /// to associate with the message template. Each tag consists of a required tag
  /// key and an associated tag value.
  final Map<String, String>? tags;

  SMSTemplateRequest({
    this.body,
    this.defaultSubstitutions,
    this.recommenderId,
    this.templateDescription,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final defaultSubstitutions = this.defaultSubstitutions;
    final recommenderId = this.recommenderId;
    final templateDescription = this.templateDescription;
    final tags = this.tags;
    return {
      if (body != null) 'Body': body,
      if (defaultSubstitutions != null)
        'DefaultSubstitutions': defaultSubstitutions,
      if (recommenderId != null) 'RecommenderId': recommenderId,
      if (templateDescription != null)
        'TemplateDescription': templateDescription,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Provides information about the content and settings for a message template
/// that can be used in text messages that are sent through the SMS channel.
class SMSTemplateResponse {
  /// The date, in ISO 8601 format, when the message template was created.
  final String creationDate;

  /// The date, in ISO 8601 format, when the message template was last modified.
  final String lastModifiedDate;

  /// The name of the message template.
  final String templateName;

  /// The type of channel that the message template is designed for. For an SMS
  /// template, this value is SMS.
  final TemplateType templateType;

  /// The Amazon Resource Name (ARN) of the message template.
  final String? arn;

  /// The message body that's used in text messages that are based on the message
  /// template.
  final String? body;

  /// The JSON object that specifies the default values that are used for message
  /// variables in the message template. This object is a set of key-value pairs.
  /// Each key defines a message variable in the template. The corresponding value
  /// defines the default value for that variable.
  final String? defaultSubstitutions;

  /// The unique identifier for the recommender model that's used by the message
  /// template.
  final String? recommenderId;

  /// The custom description of the message template.
  final String? templateDescription;

  /// The unique identifier, as an integer, for the active version of the message
  /// template, or the version of the template that you specified by using the
  /// version parameter in your request.
  final String? version;

  /// A string-to-string map of key-value pairs that identifies the tags that are
  /// associated with the message template. Each tag consists of a required tag
  /// key and an associated tag value.
  final Map<String, String>? tags;

  SMSTemplateResponse({
    required this.creationDate,
    required this.lastModifiedDate,
    required this.templateName,
    required this.templateType,
    this.arn,
    this.body,
    this.defaultSubstitutions,
    this.recommenderId,
    this.templateDescription,
    this.version,
    this.tags,
  });

  factory SMSTemplateResponse.fromJson(Map<String, dynamic> json) {
    return SMSTemplateResponse(
      creationDate: json['CreationDate'] as String,
      lastModifiedDate: json['LastModifiedDate'] as String,
      templateName: json['TemplateName'] as String,
      templateType: (json['TemplateType'] as String).toTemplateType(),
      arn: json['Arn'] as String?,
      body: json['Body'] as String?,
      defaultSubstitutions: json['DefaultSubstitutions'] as String?,
      recommenderId: json['RecommenderId'] as String?,
      templateDescription: json['TemplateDescription'] as String?,
      version: json['Version'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final lastModifiedDate = this.lastModifiedDate;
    final templateName = this.templateName;
    final templateType = this.templateType;
    final arn = this.arn;
    final body = this.body;
    final defaultSubstitutions = this.defaultSubstitutions;
    final recommenderId = this.recommenderId;
    final templateDescription = this.templateDescription;
    final version = this.version;
    final tags = this.tags;
    return {
      'CreationDate': creationDate,
      'LastModifiedDate': lastModifiedDate,
      'TemplateName': templateName,
      'TemplateType': templateType.toValue(),
      if (arn != null) 'Arn': arn,
      if (body != null) 'Body': body,
      if (defaultSubstitutions != null)
        'DefaultSubstitutions': defaultSubstitutions,
      if (recommenderId != null) 'RecommenderId': recommenderId,
      if (templateDescription != null)
        'TemplateDescription': templateDescription,
      if (version != null) 'Version': version,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Specifies the schedule settings for a campaign.
class Schedule {
  /// The scheduled time when the campaign began or will begin. Valid values are:
  /// IMMEDIATE, to start the campaign immediately; or, a specific time in ISO
  /// 8601 format.
  final String startTime;

  /// The scheduled time, in ISO 8601 format, when the campaign ended or will end.
  final String? endTime;

  /// The type of event that causes the campaign to be sent, if the value of the
  /// Frequency property is EVENT.
  final CampaignEventFilter? eventFilter;

  /// Specifies how often the campaign is sent or whether the campaign is sent in
  /// response to a specific event.
  final Frequency? frequency;

  /// Specifies whether the start and end times for the campaign schedule use each
  /// recipient's local time. To base the schedule on each recipient's local time,
  /// set this value to true.
  final bool? isLocalTime;

  /// The default quiet time for the campaign. Quiet time is a specific time range
  /// when a campaign doesn't send messages to endpoints, if all the following
  /// conditions are met:
  ///
  /// <ul>
  /// <li>
  /// The EndpointDemographic.Timezone property of the endpoint is set to a valid
  /// value.
  /// </li>
  /// <li>
  /// The current time in the endpoint's time zone is later than or equal to the
  /// time specified by the QuietTime.Start property for the campaign.
  /// </li>
  /// <li>
  /// The current time in the endpoint's time zone is earlier than or equal to the
  /// time specified by the QuietTime.End property for the campaign.
  /// </li>
  /// </ul>
  /// If any of the preceding conditions isn't met, the endpoint will receive
  /// messages from the campaign, even if quiet time is enabled.
  final QuietTime? quietTime;

  /// The starting UTC offset for the campaign schedule, if the value of the
  /// IsLocalTime property is true. Valid values are: UTC, UTC+01, UTC+02, UTC+03,
  /// UTC+03:30, UTC+04, UTC+04:30, UTC+05,
  /// UTC+05:30, UTC+05:45, UTC+06, UTC+06:30, UTC+07, UTC+08, UTC+09, UTC+09:30,
  /// UTC+10, UTC+10:30, UTC+11, UTC+12, UTC+13, UTC-02, UTC-03, UTC-04, UTC-05,
  /// UTC-06,
  /// UTC-07, UTC-08, UTC-09, UTC-10, and UTC-11.
  final String? timezone;

  Schedule({
    required this.startTime,
    this.endTime,
    this.eventFilter,
    this.frequency,
    this.isLocalTime,
    this.quietTime,
    this.timezone,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      startTime: json['StartTime'] as String,
      endTime: json['EndTime'] as String?,
      eventFilter: json['EventFilter'] != null
          ? CampaignEventFilter.fromJson(
              json['EventFilter'] as Map<String, dynamic>)
          : null,
      frequency: (json['Frequency'] as String?)?.toFrequency(),
      isLocalTime: json['IsLocalTime'] as bool?,
      quietTime: json['QuietTime'] != null
          ? QuietTime.fromJson(json['QuietTime'] as Map<String, dynamic>)
          : null,
      timezone: json['Timezone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final startTime = this.startTime;
    final endTime = this.endTime;
    final eventFilter = this.eventFilter;
    final frequency = this.frequency;
    final isLocalTime = this.isLocalTime;
    final quietTime = this.quietTime;
    final timezone = this.timezone;
    return {
      'StartTime': startTime,
      if (endTime != null) 'EndTime': endTime,
      if (eventFilter != null) 'EventFilter': eventFilter,
      if (frequency != null) 'Frequency': frequency.toValue(),
      if (isLocalTime != null) 'IsLocalTime': isLocalTime,
      if (quietTime != null) 'QuietTime': quietTime,
      if (timezone != null) 'Timezone': timezone,
    };
  }
}

/// Specifies dimension settings for including or excluding endpoints from a
/// segment based on how recently an endpoint was active.
class SegmentBehaviors {
  /// The dimension settings that are based on how recently an endpoint was
  /// active.
  final RecencyDimension? recency;

  SegmentBehaviors({
    this.recency,
  });

  factory SegmentBehaviors.fromJson(Map<String, dynamic> json) {
    return SegmentBehaviors(
      recency: json['Recency'] != null
          ? RecencyDimension.fromJson(json['Recency'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final recency = this.recency;
    return {
      if (recency != null) 'Recency': recency,
    };
  }
}

/// Specifies a segment to associate with an activity in a journey.
class SegmentCondition {
  /// The unique identifier for the segment to associate with the activity.
  final String segmentId;

  SegmentCondition({
    required this.segmentId,
  });

  factory SegmentCondition.fromJson(Map<String, dynamic> json) {
    return SegmentCondition(
      segmentId: json['SegmentId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final segmentId = this.segmentId;
    return {
      'SegmentId': segmentId,
    };
  }
}

/// Specifies demographic-based dimension settings for including or excluding
/// endpoints from a segment. These settings derive from characteristics of
/// endpoint devices, such as platform, make, and model.
class SegmentDemographics {
  /// The app version criteria for the segment.
  final SetDimension? appVersion;

  /// The channel criteria for the segment.
  final SetDimension? channel;

  /// The device type criteria for the segment.
  final SetDimension? deviceType;

  /// The device make criteria for the segment.
  final SetDimension? make;

  /// The device model criteria for the segment.
  final SetDimension? model;

  /// The device platform criteria for the segment.
  final SetDimension? platform;

  SegmentDemographics({
    this.appVersion,
    this.channel,
    this.deviceType,
    this.make,
    this.model,
    this.platform,
  });

  factory SegmentDemographics.fromJson(Map<String, dynamic> json) {
    return SegmentDemographics(
      appVersion: json['AppVersion'] != null
          ? SetDimension.fromJson(json['AppVersion'] as Map<String, dynamic>)
          : null,
      channel: json['Channel'] != null
          ? SetDimension.fromJson(json['Channel'] as Map<String, dynamic>)
          : null,
      deviceType: json['DeviceType'] != null
          ? SetDimension.fromJson(json['DeviceType'] as Map<String, dynamic>)
          : null,
      make: json['Make'] != null
          ? SetDimension.fromJson(json['Make'] as Map<String, dynamic>)
          : null,
      model: json['Model'] != null
          ? SetDimension.fromJson(json['Model'] as Map<String, dynamic>)
          : null,
      platform: json['Platform'] != null
          ? SetDimension.fromJson(json['Platform'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appVersion = this.appVersion;
    final channel = this.channel;
    final deviceType = this.deviceType;
    final make = this.make;
    final model = this.model;
    final platform = this.platform;
    return {
      if (appVersion != null) 'AppVersion': appVersion,
      if (channel != null) 'Channel': channel,
      if (deviceType != null) 'DeviceType': deviceType,
      if (make != null) 'Make': make,
      if (model != null) 'Model': model,
      if (platform != null) 'Platform': platform,
    };
  }
}

/// Specifies the dimension settings for a segment.
class SegmentDimensions {
  /// One or more custom attributes to use as criteria for the segment.
  final Map<String, AttributeDimension>? attributes;

  /// The behavior-based criteria, such as how recently users have used your app,
  /// for the segment.
  final SegmentBehaviors? behavior;

  /// The demographic-based criteria, such as device platform, for the segment.
  final SegmentDemographics? demographic;

  /// The location-based criteria, such as region or GPS coordinates, for the
  /// segment.
  final SegmentLocation? location;

  /// One or more custom metrics to use as criteria for the segment.
  final Map<String, MetricDimension>? metrics;

  /// One or more custom user attributes to use as criteria for the segment.
  final Map<String, AttributeDimension>? userAttributes;

  SegmentDimensions({
    this.attributes,
    this.behavior,
    this.demographic,
    this.location,
    this.metrics,
    this.userAttributes,
  });

  factory SegmentDimensions.fromJson(Map<String, dynamic> json) {
    return SegmentDimensions(
      attributes: (json['Attributes'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, AttributeDimension.fromJson(e as Map<String, dynamic>))),
      behavior: json['Behavior'] != null
          ? SegmentBehaviors.fromJson(json['Behavior'] as Map<String, dynamic>)
          : null,
      demographic: json['Demographic'] != null
          ? SegmentDemographics.fromJson(
              json['Demographic'] as Map<String, dynamic>)
          : null,
      location: json['Location'] != null
          ? SegmentLocation.fromJson(json['Location'] as Map<String, dynamic>)
          : null,
      metrics: (json['Metrics'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, MetricDimension.fromJson(e as Map<String, dynamic>))),
      userAttributes: (json['UserAttributes'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, AttributeDimension.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final behavior = this.behavior;
    final demographic = this.demographic;
    final location = this.location;
    final metrics = this.metrics;
    final userAttributes = this.userAttributes;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (behavior != null) 'Behavior': behavior,
      if (demographic != null) 'Demographic': demographic,
      if (location != null) 'Location': location,
      if (metrics != null) 'Metrics': metrics,
      if (userAttributes != null) 'UserAttributes': userAttributes,
    };
  }
}

/// Specifies the base segments and dimensions for a segment, and the
/// relationships between these base segments and dimensions.
class SegmentGroup {
  /// An array that defines the dimensions for the segment.
  final List<SegmentDimensions>? dimensions;

  /// The base segment to build the segment on. A base segment, also referred to
  /// as a <i>source segment</i>, defines the initial population of endpoints for
  /// a segment. When you add dimensions to a segment, Amazon Pinpoint filters the
  /// base segment by using the dimensions that you specify.
  ///
  /// You can specify more than one dimensional segment or only one imported
  /// segment. If you specify an imported segment, the Amazon Pinpoint console
  /// displays a segment size estimate that indicates the size of the imported
  /// segment without any filters applied to it.
  final List<SegmentReference>? sourceSegments;

  /// Specifies how to handle multiple base segments for the segment. For example,
  /// if you specify three base segments for the segment, whether the resulting
  /// segment is based on all, any, or none of the base segments.
  final SourceType? sourceType;

  /// Specifies how to handle multiple dimensions for the segment. For example, if
  /// you specify three dimensions for the segment, whether the resulting segment
  /// includes endpoints that match all, any, or none of the dimensions.
  final Type? type;

  SegmentGroup({
    this.dimensions,
    this.sourceSegments,
    this.sourceType,
    this.type,
  });

  factory SegmentGroup.fromJson(Map<String, dynamic> json) {
    return SegmentGroup(
      dimensions: (json['Dimensions'] as List?)
          ?.whereNotNull()
          .map((e) => SegmentDimensions.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceSegments: (json['SourceSegments'] as List?)
          ?.whereNotNull()
          .map((e) => SegmentReference.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceType: (json['SourceType'] as String?)?.toSourceType(),
      type: (json['Type'] as String?)?.toType(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final sourceSegments = this.sourceSegments;
    final sourceType = this.sourceType;
    final type = this.type;
    return {
      if (dimensions != null) 'Dimensions': dimensions,
      if (sourceSegments != null) 'SourceSegments': sourceSegments,
      if (sourceType != null) 'SourceType': sourceType.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Specifies the settings that define the relationships between segment groups
/// for a segment.
class SegmentGroupList {
  /// An array that defines the set of segment criteria to evaluate when handling
  /// segment groups for the segment.
  final List<SegmentGroup>? groups;

  /// Specifies how to handle multiple segment groups for the segment. For
  /// example, if the segment includes three segment groups, whether the resulting
  /// segment includes endpoints that match all, any, or none of the segment
  /// groups.
  final Include? include;

  SegmentGroupList({
    this.groups,
    this.include,
  });

  factory SegmentGroupList.fromJson(Map<String, dynamic> json) {
    return SegmentGroupList(
      groups: (json['Groups'] as List?)
          ?.whereNotNull()
          .map((e) => SegmentGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      include: (json['Include'] as String?)?.toInclude(),
    );
  }

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final include = this.include;
    return {
      if (groups != null) 'Groups': groups,
      if (include != null) 'Include': include.toValue(),
    };
  }
}

/// Provides information about the import job that created a segment. An import
/// job is a job that creates a user segment by importing endpoint definitions.
class SegmentImportResource {
  /// (Deprecated) Your AWS account ID, which you assigned to an external ID key
  /// in an IAM trust policy. Amazon Pinpoint previously used this value to assume
  /// an IAM role when importing endpoint definitions, but we removed this
  /// requirement. We don't recommend use of external IDs for IAM roles that are
  /// assumed by Amazon Pinpoint.
  final String externalId;

  /// The format of the files that were imported to create the segment. Valid
  /// values are: CSV, for comma-separated values format; and, JSON, for
  /// newline-delimited JSON format.
  final Format format;

  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorized Amazon Pinpoint to access the Amazon S3 location
  /// to import endpoint definitions from.
  final String roleArn;

  /// The URL of the Amazon Simple Storage Service (Amazon S3) bucket that the
  /// endpoint definitions were imported from to create the segment.
  final String s3Url;

  /// The number of endpoint definitions that were imported successfully to create
  /// the segment.
  final int size;

  /// The number of channel types in the endpoint definitions that were imported
  /// to create the segment.
  final Map<String, int>? channelCounts;

  SegmentImportResource({
    required this.externalId,
    required this.format,
    required this.roleArn,
    required this.s3Url,
    required this.size,
    this.channelCounts,
  });

  factory SegmentImportResource.fromJson(Map<String, dynamic> json) {
    return SegmentImportResource(
      externalId: json['ExternalId'] as String,
      format: (json['Format'] as String).toFormat(),
      roleArn: json['RoleArn'] as String,
      s3Url: json['S3Url'] as String,
      size: json['Size'] as int,
      channelCounts: (json['ChannelCounts'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as int)),
    );
  }

  Map<String, dynamic> toJson() {
    final externalId = this.externalId;
    final format = this.format;
    final roleArn = this.roleArn;
    final s3Url = this.s3Url;
    final size = this.size;
    final channelCounts = this.channelCounts;
    return {
      'ExternalId': externalId,
      'Format': format.toValue(),
      'RoleArn': roleArn,
      'S3Url': s3Url,
      'Size': size,
      if (channelCounts != null) 'ChannelCounts': channelCounts,
    };
  }
}

/// Specifies geographical dimension settings for a segment.
class SegmentLocation {
  /// The country or region code, in ISO 3166-1 alpha-2 format, for the segment.
  final SetDimension? country;

  /// The GPS location and range for the segment.
  final GPSPointDimension? gPSPoint;

  SegmentLocation({
    this.country,
    this.gPSPoint,
  });

  factory SegmentLocation.fromJson(Map<String, dynamic> json) {
    return SegmentLocation(
      country: json['Country'] != null
          ? SetDimension.fromJson(json['Country'] as Map<String, dynamic>)
          : null,
      gPSPoint: json['GPSPoint'] != null
          ? GPSPointDimension.fromJson(json['GPSPoint'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final country = this.country;
    final gPSPoint = this.gPSPoint;
    return {
      if (country != null) 'Country': country,
      if (gPSPoint != null) 'GPSPoint': gPSPoint,
    };
  }
}

/// Specifies the segment identifier and version of a segment.
class SegmentReference {
  /// The unique identifier for the segment.
  final String id;

  /// The version number of the segment.
  final int? version;

  SegmentReference({
    required this.id,
    this.version,
  });

  factory SegmentReference.fromJson(Map<String, dynamic> json) {
    return SegmentReference(
      id: json['Id'] as String,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final version = this.version;
    return {
      'Id': id,
      if (version != null) 'Version': version,
    };
  }
}

/// Provides information about the configuration, dimension, and other settings
/// for a segment.
class SegmentResponse {
  /// The unique identifier for the application that the segment is associated
  /// with.
  final String applicationId;

  /// The Amazon Resource Name (ARN) of the segment.
  final String arn;

  /// The date and time when the segment was created.
  final String creationDate;

  /// The unique identifier for the segment.
  final String id;

  /// The segment type. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// DIMENSIONAL - A dynamic segment, which is a segment that uses selection
  /// criteria that you specify and is based on endpoint data that's reported by
  /// your app. Dynamic segments can change over time.
  /// </li>
  /// <li>
  /// IMPORT - A static segment, which is a segment that uses selection criteria
  /// that you specify and is based on endpoint definitions that you import from a
  /// file. Imported segments are static; they don't change over time.
  /// </li>
  /// </ul>
  final SegmentType segmentType;

  /// The dimension settings for the segment.
  final SegmentDimensions? dimensions;

  /// The settings for the import job that's associated with the segment.
  final SegmentImportResource? importDefinition;

  /// The date and time when the segment was last modified.
  final String? lastModifiedDate;

  /// The name of the segment.
  final String? name;

  /// A list of one or more segment groups that apply to the segment. Each segment
  /// group consists of zero or more base segments and the dimensions that are
  /// applied to those base segments.
  final SegmentGroupList? segmentGroups;

  /// The version number of the segment.
  final int? version;

  /// A string-to-string map of key-value pairs that identifies the tags that are
  /// associated with the segment. Each tag consists of a required tag key and an
  /// associated tag value.
  final Map<String, String>? tags;

  SegmentResponse({
    required this.applicationId,
    required this.arn,
    required this.creationDate,
    required this.id,
    required this.segmentType,
    this.dimensions,
    this.importDefinition,
    this.lastModifiedDate,
    this.name,
    this.segmentGroups,
    this.version,
    this.tags,
  });

  factory SegmentResponse.fromJson(Map<String, dynamic> json) {
    return SegmentResponse(
      applicationId: json['ApplicationId'] as String,
      arn: json['Arn'] as String,
      creationDate: json['CreationDate'] as String,
      id: json['Id'] as String,
      segmentType: (json['SegmentType'] as String).toSegmentType(),
      dimensions: json['Dimensions'] != null
          ? SegmentDimensions.fromJson(
              json['Dimensions'] as Map<String, dynamic>)
          : null,
      importDefinition: json['ImportDefinition'] != null
          ? SegmentImportResource.fromJson(
              json['ImportDefinition'] as Map<String, dynamic>)
          : null,
      lastModifiedDate: json['LastModifiedDate'] as String?,
      name: json['Name'] as String?,
      segmentGroups: json['SegmentGroups'] != null
          ? SegmentGroupList.fromJson(
              json['SegmentGroups'] as Map<String, dynamic>)
          : null,
      version: json['Version'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final creationDate = this.creationDate;
    final id = this.id;
    final segmentType = this.segmentType;
    final dimensions = this.dimensions;
    final importDefinition = this.importDefinition;
    final lastModifiedDate = this.lastModifiedDate;
    final name = this.name;
    final segmentGroups = this.segmentGroups;
    final version = this.version;
    final tags = this.tags;
    return {
      'ApplicationId': applicationId,
      'Arn': arn,
      'CreationDate': creationDate,
      'Id': id,
      'SegmentType': segmentType.toValue(),
      if (dimensions != null) 'Dimensions': dimensions,
      if (importDefinition != null) 'ImportDefinition': importDefinition,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (name != null) 'Name': name,
      if (segmentGroups != null) 'SegmentGroups': segmentGroups,
      if (version != null) 'Version': version,
      if (tags != null) 'tags': tags,
    };
  }
}

enum SegmentType {
  dimensional,
  import,
}

extension SegmentTypeValueExtension on SegmentType {
  String toValue() {
    switch (this) {
      case SegmentType.dimensional:
        return 'DIMENSIONAL';
      case SegmentType.import:
        return 'IMPORT';
    }
  }
}

extension SegmentTypeFromString on String {
  SegmentType toSegmentType() {
    switch (this) {
      case 'DIMENSIONAL':
        return SegmentType.dimensional;
      case 'IMPORT':
        return SegmentType.import;
    }
    throw Exception('$this is not known in enum SegmentType');
  }
}

/// Provides information about all the segments that are associated with an
/// application.
class SegmentsResponse {
  /// An array of responses, one for each segment that's associated with the
  /// application (Segments resource) or each version of a segment that's
  /// associated with the application (Segment Versions resource).
  final List<SegmentResponse> item;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  SegmentsResponse({
    required this.item,
    this.nextToken,
  });

  factory SegmentsResponse.fromJson(Map<String, dynamic> json) {
    return SegmentsResponse(
      item: (json['Item'] as List)
          .whereNotNull()
          .map((e) => SegmentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final item = this.item;
    final nextToken = this.nextToken;
    return {
      'Item': item,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class SendMessagesResponse {
  final MessageResponse messageResponse;

  SendMessagesResponse({
    required this.messageResponse,
  });

  Map<String, dynamic> toJson() {
    final messageResponse = this.messageResponse;
    return {
      'MessageResponse': messageResponse,
    };
  }
}

/// Send OTP message request parameters.
class SendOTPMessageRequestParameters {
  /// The brand name that will be substituted into the OTP message body. Should be
  /// owned by calling AWS account.
  final String brandName;

  /// Channel type for the OTP message. Supported values: [SMS].
  final String channel;

  /// The destination identity to send OTP to.
  final String destinationIdentity;

  /// The origination identity used to send OTP from.
  final String originationIdentity;

  /// Developer-specified reference identifier. Required to match during OTP
  /// verification.
  final String referenceId;

  /// The attempts allowed to validate an OTP.
  final int? allowedAttempts;

  /// The number of characters in the generated OTP.
  final int? codeLength;

  /// A unique Entity ID received from DLT after entity registration is approved.
  final String? entityId;

  /// The language to be used for the outgoing message body containing the OTP.
  final String? language;

  /// A unique Template ID received from DLT after entity registration is
  /// approved.
  final String? templateId;

  /// The time in minutes before the OTP is no longer valid.
  final int? validityPeriod;

  SendOTPMessageRequestParameters({
    required this.brandName,
    required this.channel,
    required this.destinationIdentity,
    required this.originationIdentity,
    required this.referenceId,
    this.allowedAttempts,
    this.codeLength,
    this.entityId,
    this.language,
    this.templateId,
    this.validityPeriod,
  });

  Map<String, dynamic> toJson() {
    final brandName = this.brandName;
    final channel = this.channel;
    final destinationIdentity = this.destinationIdentity;
    final originationIdentity = this.originationIdentity;
    final referenceId = this.referenceId;
    final allowedAttempts = this.allowedAttempts;
    final codeLength = this.codeLength;
    final entityId = this.entityId;
    final language = this.language;
    final templateId = this.templateId;
    final validityPeriod = this.validityPeriod;
    return {
      'BrandName': brandName,
      'Channel': channel,
      'DestinationIdentity': destinationIdentity,
      'OriginationIdentity': originationIdentity,
      'ReferenceId': referenceId,
      if (allowedAttempts != null) 'AllowedAttempts': allowedAttempts,
      if (codeLength != null) 'CodeLength': codeLength,
      if (entityId != null) 'EntityId': entityId,
      if (language != null) 'Language': language,
      if (templateId != null) 'TemplateId': templateId,
      if (validityPeriod != null) 'ValidityPeriod': validityPeriod,
    };
  }
}

class SendOTPMessageResponse {
  final MessageResponse messageResponse;

  SendOTPMessageResponse({
    required this.messageResponse,
  });

  Map<String, dynamic> toJson() {
    final messageResponse = this.messageResponse;
    return {
      'MessageResponse': messageResponse,
    };
  }
}

/// Specifies the configuration and other settings for a message to send to all
/// the endpoints that are associated with a list of users.
class SendUsersMessageRequest {
  /// The settings and content for the default message and any default messages
  /// that you defined for specific channels.
  final DirectMessageConfiguration messageConfiguration;

  /// A map that associates user IDs with <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-messages.html#apps-application-id-messages-model-endpointsendconfiguration">EndpointSendConfiguration</a>
  /// objects. You can use an <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-messages.html#apps-application-id-messages-model-endpointsendconfiguration">EndpointSendConfiguration</a>
  /// object to tailor the message for a user by specifying settings such as
  /// content overrides and message variables.
  final Map<String, EndpointSendConfiguration> users;

  /// A map of custom attribute-value pairs. For a push notification, Amazon
  /// Pinpoint adds these attributes to the data.pinpoint object in the body of
  /// the notification payload. Amazon Pinpoint also provides these attributes in
  /// the events that it generates for users-messages deliveries.
  final Map<String, String>? context;

  /// The message template to use for the message.
  final TemplateConfiguration? templateConfiguration;

  /// The unique identifier for tracing the message. This identifier is visible to
  /// message recipients.
  final String? traceId;

  SendUsersMessageRequest({
    required this.messageConfiguration,
    required this.users,
    this.context,
    this.templateConfiguration,
    this.traceId,
  });

  Map<String, dynamic> toJson() {
    final messageConfiguration = this.messageConfiguration;
    final users = this.users;
    final context = this.context;
    final templateConfiguration = this.templateConfiguration;
    final traceId = this.traceId;
    return {
      'MessageConfiguration': messageConfiguration,
      'Users': users,
      if (context != null) 'Context': context,
      if (templateConfiguration != null)
        'TemplateConfiguration': templateConfiguration,
      if (traceId != null) 'TraceId': traceId,
    };
  }
}

/// Provides information about which users and endpoints a message was sent to.
class SendUsersMessageResponse {
  /// The unique identifier for the application that was used to send the message.
  final String applicationId;

  /// The unique identifier that was assigned to the message request.
  final String? requestId;

  /// An object that indicates which endpoints the message was sent to, for each
  /// user. The object lists user IDs and, for each user ID, provides the endpoint
  /// IDs that the message was sent to. For each endpoint ID, it provides an
  /// EndpointMessageResult object.
  final Map<String, Map<String, EndpointMessageResult>>? result;

  SendUsersMessageResponse({
    required this.applicationId,
    this.requestId,
    this.result,
  });

  factory SendUsersMessageResponse.fromJson(Map<String, dynamic> json) {
    return SendUsersMessageResponse(
      applicationId: json['ApplicationId'] as String,
      requestId: json['RequestId'] as String?,
      result: (json['Result'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k,
          (e as Map<String, dynamic>).map((k, e) => MapEntry(
              k, EndpointMessageResult.fromJson(e as Map<String, dynamic>))))),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final requestId = this.requestId;
    final result = this.result;
    return {
      'ApplicationId': applicationId,
      if (requestId != null) 'RequestId': requestId,
      if (result != null) 'Result': result,
    };
  }
}

class SendUsersMessagesResponse {
  final SendUsersMessageResponse sendUsersMessageResponse;

  SendUsersMessagesResponse({
    required this.sendUsersMessageResponse,
  });

  Map<String, dynamic> toJson() {
    final sendUsersMessageResponse = this.sendUsersMessageResponse;
    return {
      'SendUsersMessageResponse': sendUsersMessageResponse,
    };
  }
}

/// Provides information about a session.
class Session {
  /// The unique identifier for the session.
  final String id;

  /// The date and time when the session began.
  final String startTimestamp;

  /// The duration of the session, in milliseconds.
  final int? duration;

  /// The date and time when the session ended.
  final String? stopTimestamp;

  Session({
    required this.id,
    required this.startTimestamp,
    this.duration,
    this.stopTimestamp,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final startTimestamp = this.startTimestamp;
    final duration = this.duration;
    final stopTimestamp = this.stopTimestamp;
    return {
      'Id': id,
      'StartTimestamp': startTimestamp,
      if (duration != null) 'Duration': duration,
      if (stopTimestamp != null) 'StopTimestamp': stopTimestamp,
    };
  }
}

/// Specifies the dimension type and values for a segment dimension.
class SetDimension {
  /// The criteria values to use for the segment dimension. Depending on the value
  /// of the DimensionType property, endpoints are included or excluded from the
  /// segment if their values match the criteria values.
  final List<String> values;

  /// The type of segment dimension to use. Valid values are: INCLUSIVE, endpoints
  /// that match the criteria are included in the segment; and, EXCLUSIVE,
  /// endpoints that match the criteria are excluded from the segment.
  final DimensionType? dimensionType;

  SetDimension({
    required this.values,
    this.dimensionType,
  });

  factory SetDimension.fromJson(Map<String, dynamic> json) {
    return SetDimension(
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      dimensionType: (json['DimensionType'] as String?)?.toDimensionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final values = this.values;
    final dimensionType = this.dimensionType;
    return {
      'Values': values,
      if (dimensionType != null) 'DimensionType': dimensionType.toValue(),
    };
  }
}

/// Specifies a condition to evaluate for an activity in a journey.
class SimpleCondition {
  /// The dimension settings for the event that's associated with the activity.
  final EventCondition? eventCondition;

  /// The segment that's associated with the activity.
  final SegmentCondition? segmentCondition;

  /// The dimension settings for the segment that's associated with the activity.
  final SegmentDimensions? segmentDimensions;

  SimpleCondition({
    this.eventCondition,
    this.segmentCondition,
    this.segmentDimensions,
  });

  factory SimpleCondition.fromJson(Map<String, dynamic> json) {
    return SimpleCondition(
      eventCondition: json['EventCondition'] != null
          ? EventCondition.fromJson(
              json['EventCondition'] as Map<String, dynamic>)
          : null,
      segmentCondition: json['SegmentCondition'] != null
          ? SegmentCondition.fromJson(
              json['SegmentCondition'] as Map<String, dynamic>)
          : null,
      segmentDimensions: json['segmentDimensions'] != null
          ? SegmentDimensions.fromJson(
              json['segmentDimensions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eventCondition = this.eventCondition;
    final segmentCondition = this.segmentCondition;
    final segmentDimensions = this.segmentDimensions;
    return {
      if (eventCondition != null) 'EventCondition': eventCondition,
      if (segmentCondition != null) 'SegmentCondition': segmentCondition,
      if (segmentDimensions != null) 'segmentDimensions': segmentDimensions,
    };
  }
}

/// Specifies the contents of an email message, composed of a subject, a text
/// part, and an HTML part.
class SimpleEmail {
  /// The list of MessageHeaders for the email. You can have up to 15 Headers.
  final List<MessageHeader>? headers;

  /// The body of the email message, in HTML format. We recommend using HTML
  /// format for email clients that render HTML content. You can include links,
  /// formatted text, and more in an HTML message.
  final SimpleEmailPart? htmlPart;

  /// The subject line, or title, of the email.
  final SimpleEmailPart? subject;

  /// The body of the email message, in plain text format. We recommend using
  /// plain text format for email clients that don't render HTML content and
  /// clients that are connected to high-latency networks, such as mobile devices.
  final SimpleEmailPart? textPart;

  SimpleEmail({
    this.headers,
    this.htmlPart,
    this.subject,
    this.textPart,
  });

  Map<String, dynamic> toJson() {
    final headers = this.headers;
    final htmlPart = this.htmlPart;
    final subject = this.subject;
    final textPart = this.textPart;
    return {
      if (headers != null) 'Headers': headers,
      if (htmlPart != null) 'HtmlPart': htmlPart,
      if (subject != null) 'Subject': subject,
      if (textPart != null) 'TextPart': textPart,
    };
  }
}

/// Contains the name and value pair of an email header to add to your email.
/// You can have up to 15 MessageHeaders. A header can contain information such
/// as the sender, receiver, route, or timestamp.
class MessageHeader {
  /// The name of the message header. The header name can contain up to 126
  /// characters.
  final String? name;

  /// The value of the message header. The header value can contain up to 870
  /// characters, including the length of any rendered attributes. For example if
  /// you add the {CreationDate} attribute, it renders as YYYY-MM-DDTHH:MM:SS.SSSZ
  /// and is 24 characters in length.
  final String? value;

  MessageHeader({
    this.name,
    this.value,
  });

  factory MessageHeader.fromJson(Map<String, dynamic> json) {
    return MessageHeader(
      name: json['Name'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }
}

/// Specifies the subject or body of an email message, represented as textual
/// email data and the applicable character set.
class SimpleEmailPart {
  /// The applicable character set for the message content.
  final String? charset;

  /// The textual data of the message content.
  final String? data;

  SimpleEmailPart({
    this.charset,
    this.data,
  });

  Map<String, dynamic> toJson() {
    final charset = this.charset;
    final data = this.data;
    return {
      if (charset != null) 'Charset': charset,
      if (data != null) 'Data': data,
    };
  }
}

enum SourceType {
  all,
  any,
  none,
}

extension SourceTypeValueExtension on SourceType {
  String toValue() {
    switch (this) {
      case SourceType.all:
        return 'ALL';
      case SourceType.any:
        return 'ANY';
      case SourceType.none:
        return 'NONE';
    }
  }
}

extension SourceTypeFromString on String {
  SourceType toSourceType() {
    switch (this) {
      case 'ALL':
        return SourceType.all;
      case 'ANY':
        return SourceType.any;
      case 'NONE':
        return SourceType.none;
    }
    throw Exception('$this is not known in enum SourceType');
  }
}

/// Specifies the conditions for the first activity in a journey. This activity
/// and its conditions determine which users are participants in a journey.
class StartCondition {
  /// The custom description of the condition.
  final String? description;
  final EventStartCondition? eventStartCondition;

  /// The segment that's associated with the first activity in the journey. This
  /// segment determines which users are participants in the journey.
  final SegmentCondition? segmentStartCondition;

  StartCondition({
    this.description,
    this.eventStartCondition,
    this.segmentStartCondition,
  });

  factory StartCondition.fromJson(Map<String, dynamic> json) {
    return StartCondition(
      description: json['Description'] as String?,
      eventStartCondition: json['EventStartCondition'] != null
          ? EventStartCondition.fromJson(
              json['EventStartCondition'] as Map<String, dynamic>)
          : null,
      segmentStartCondition: json['SegmentStartCondition'] != null
          ? SegmentCondition.fromJson(
              json['SegmentStartCondition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final eventStartCondition = this.eventStartCondition;
    final segmentStartCondition = this.segmentStartCondition;
    return {
      if (description != null) 'Description': description,
      if (eventStartCondition != null)
        'EventStartCondition': eventStartCondition,
      if (segmentStartCondition != null)
        'SegmentStartCondition': segmentStartCondition,
    };
  }
}

enum State {
  draft,
  active,
  completed,
  cancelled,
  closed,
  paused,
}

extension StateValueExtension on State {
  String toValue() {
    switch (this) {
      case State.draft:
        return 'DRAFT';
      case State.active:
        return 'ACTIVE';
      case State.completed:
        return 'COMPLETED';
      case State.cancelled:
        return 'CANCELLED';
      case State.closed:
        return 'CLOSED';
      case State.paused:
        return 'PAUSED';
    }
  }
}

extension StateFromString on String {
  State toState() {
    switch (this) {
      case 'DRAFT':
        return State.draft;
      case 'ACTIVE':
        return State.active;
      case 'COMPLETED':
        return State.completed;
      case 'CANCELLED':
        return State.cancelled;
      case 'CLOSED':
        return State.closed;
      case 'PAUSED':
        return State.paused;
    }
    throw Exception('$this is not known in enum State');
  }
}

/// Specifies the tags (keys and values) for an application, campaign, message
/// template, or segment.
class TagsModel {
  /// A string-to-string map of key-value pairs that defines the tags for an
  /// application, campaign, message template, or segment. Each of these resources
  /// can have a maximum of 50 tags.
  ///
  /// Each tag consists of a required tag key and an associated tag value. The
  /// maximum length of a tag key is 128 characters. The maximum length of a tag
  /// value is 256 characters.
  final Map<String, String> tags;

  TagsModel({
    required this.tags,
  });

  factory TagsModel.fromJson(Map<String, dynamic> json) {
    return TagsModel(
      tags: (json['tags'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'tags': tags,
    };
  }
}

/// Specifies the name and version of the message template to use for the
/// message.
class Template {
  /// The name of the message template to use for the message. If specified, this
  /// value must match the name of an existing message template.
  final String? name;

  /// The unique identifier for the version of the message template to use for the
  /// message. If specified, this value must match the identifier for an existing
  /// template version. To retrieve a list of versions and version identifiers for
  /// a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  ///
  /// If you don't specify a value for this property, Amazon Pinpoint uses the
  /// <i>active version</i> of the template. The <i>active version</i> is
  /// typically the version of a template that's been most recently reviewed and
  /// approved for use, depending on your workflow. It isn't necessarily the
  /// latest version of a template.
  final String? version;

  Template({
    this.name,
    this.version,
  });

  factory Template.fromJson(Map<String, dynamic> json) {
    return Template(
      name: json['Name'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final version = this.version;
    return {
      if (name != null) 'Name': name,
      if (version != null) 'Version': version,
    };
  }
}

/// Specifies which version of a message template to use as the active version
/// of the template.
class TemplateActiveVersionRequest {
  /// The version of the message template to use as the active version of the
  /// template. Valid values are: latest, for the most recent version of the
  /// template; or, the unique identifier for any existing version of the
  /// template. If you specify an identifier, the value must match the identifier
  /// for an existing template version. To retrieve a list of versions and version
  /// identifiers for a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  final String? version;

  TemplateActiveVersionRequest({
    this.version,
  });

  Map<String, dynamic> toJson() {
    final version = this.version;
    return {
      if (version != null) 'Version': version,
    };
  }
}

/// Specifies the message template to use for the message, for each type of
/// channel.
class TemplateConfiguration {
  /// The email template to use for the message.
  final Template? emailTemplate;

  /// The InApp template to use for the message. The InApp template object is not
  /// supported for SendMessages.
  final Template? inAppTemplate;

  /// The push notification template to use for the message.
  final Template? pushTemplate;

  /// The SMS template to use for the message.
  final Template? sMSTemplate;

  /// The voice template to use for the message. This object isn't supported for
  /// campaigns.
  final Template? voiceTemplate;

  TemplateConfiguration({
    this.emailTemplate,
    this.inAppTemplate,
    this.pushTemplate,
    this.sMSTemplate,
    this.voiceTemplate,
  });

  factory TemplateConfiguration.fromJson(Map<String, dynamic> json) {
    return TemplateConfiguration(
      emailTemplate: json['EmailTemplate'] != null
          ? Template.fromJson(json['EmailTemplate'] as Map<String, dynamic>)
          : null,
      inAppTemplate: json['InAppTemplate'] != null
          ? Template.fromJson(json['InAppTemplate'] as Map<String, dynamic>)
          : null,
      pushTemplate: json['PushTemplate'] != null
          ? Template.fromJson(json['PushTemplate'] as Map<String, dynamic>)
          : null,
      sMSTemplate: json['SMSTemplate'] != null
          ? Template.fromJson(json['SMSTemplate'] as Map<String, dynamic>)
          : null,
      voiceTemplate: json['VoiceTemplate'] != null
          ? Template.fromJson(json['VoiceTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final emailTemplate = this.emailTemplate;
    final inAppTemplate = this.inAppTemplate;
    final pushTemplate = this.pushTemplate;
    final sMSTemplate = this.sMSTemplate;
    final voiceTemplate = this.voiceTemplate;
    return {
      if (emailTemplate != null) 'EmailTemplate': emailTemplate,
      if (inAppTemplate != null) 'InAppTemplate': inAppTemplate,
      if (pushTemplate != null) 'PushTemplate': pushTemplate,
      if (sMSTemplate != null) 'SMSTemplate': sMSTemplate,
      if (voiceTemplate != null) 'VoiceTemplate': voiceTemplate,
    };
  }
}

/// Provides information about a request to create a message template.
class TemplateCreateMessageBody {
  /// The Amazon Resource Name (ARN) of the message template that was created.
  final String? arn;

  /// The message that's returned from the API for the request to create the
  /// message template.
  final String? message;

  /// The unique identifier for the request to create the message template.
  final String? requestID;

  TemplateCreateMessageBody({
    this.arn,
    this.message,
    this.requestID,
  });

  factory TemplateCreateMessageBody.fromJson(Map<String, dynamic> json) {
    return TemplateCreateMessageBody(
      arn: json['Arn'] as String?,
      message: json['Message'] as String?,
      requestID: json['RequestID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final message = this.message;
    final requestID = this.requestID;
    return {
      if (arn != null) 'Arn': arn,
      if (message != null) 'Message': message,
      if (requestID != null) 'RequestID': requestID,
    };
  }
}

/// Provides information about a message template that's associated with your
/// Amazon Pinpoint account.
class TemplateResponse {
  /// The date, in ISO 8601 format, when the message template was created.
  final String creationDate;

  /// The date, in ISO 8601 format, when the message template was last modified.
  final String lastModifiedDate;

  /// The name of the message template.
  final String templateName;

  /// The type of channel that the message template is designed for. Possible
  /// values are: EMAIL, PUSH, SMS, INAPP, and VOICE.
  final TemplateType templateType;

  /// The Amazon Resource Name (ARN) of the message template. This value isn't
  /// included in a TemplateResponse object. To retrieve the ARN of a template,
  /// use the GetEmailTemplate, GetPushTemplate, GetSmsTemplate, or
  /// GetVoiceTemplate operation, depending on the type of template that you want
  /// to retrieve the ARN for.
  final String? arn;

  /// The JSON object that specifies the default values that are used for message
  /// variables in the message template. This object isn't included in a
  /// TemplateResponse object. To retrieve this object for a template, use the
  /// GetEmailTemplate, GetPushTemplate, GetSmsTemplate, or GetVoiceTemplate
  /// operation, depending on the type of template that you want to retrieve the
  /// object for.
  final String? defaultSubstitutions;

  /// The custom description of the message template. This value isn't included in
  /// a TemplateResponse object. To retrieve the description of a template, use
  /// the GetEmailTemplate, GetPushTemplate, GetSmsTemplate, or GetVoiceTemplate
  /// operation, depending on the type of template that you want to retrieve the
  /// description for.
  final String? templateDescription;

  /// The unique identifier, as an integer, for the active version of the message
  /// template.
  final String? version;

  /// A map of key-value pairs that identifies the tags that are associated with
  /// the message template. This object isn't included in a TemplateResponse
  /// object. To retrieve this object for a template, use the GetEmailTemplate,
  /// GetPushTemplate, GetSmsTemplate, or GetVoiceTemplate operation, depending on
  /// the type of template that you want to retrieve the object for.
  final Map<String, String>? tags;

  TemplateResponse({
    required this.creationDate,
    required this.lastModifiedDate,
    required this.templateName,
    required this.templateType,
    this.arn,
    this.defaultSubstitutions,
    this.templateDescription,
    this.version,
    this.tags,
  });

  factory TemplateResponse.fromJson(Map<String, dynamic> json) {
    return TemplateResponse(
      creationDate: json['CreationDate'] as String,
      lastModifiedDate: json['LastModifiedDate'] as String,
      templateName: json['TemplateName'] as String,
      templateType: (json['TemplateType'] as String).toTemplateType(),
      arn: json['Arn'] as String?,
      defaultSubstitutions: json['DefaultSubstitutions'] as String?,
      templateDescription: json['TemplateDescription'] as String?,
      version: json['Version'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final lastModifiedDate = this.lastModifiedDate;
    final templateName = this.templateName;
    final templateType = this.templateType;
    final arn = this.arn;
    final defaultSubstitutions = this.defaultSubstitutions;
    final templateDescription = this.templateDescription;
    final version = this.version;
    final tags = this.tags;
    return {
      'CreationDate': creationDate,
      'LastModifiedDate': lastModifiedDate,
      'TemplateName': templateName,
      'TemplateType': templateType.toValue(),
      if (arn != null) 'Arn': arn,
      if (defaultSubstitutions != null)
        'DefaultSubstitutions': defaultSubstitutions,
      if (templateDescription != null)
        'TemplateDescription': templateDescription,
      if (version != null) 'Version': version,
      if (tags != null) 'tags': tags,
    };
  }
}

enum TemplateType {
  email,
  sms,
  voice,
  push,
  inapp,
}

extension TemplateTypeValueExtension on TemplateType {
  String toValue() {
    switch (this) {
      case TemplateType.email:
        return 'EMAIL';
      case TemplateType.sms:
        return 'SMS';
      case TemplateType.voice:
        return 'VOICE';
      case TemplateType.push:
        return 'PUSH';
      case TemplateType.inapp:
        return 'INAPP';
    }
  }
}

extension TemplateTypeFromString on String {
  TemplateType toTemplateType() {
    switch (this) {
      case 'EMAIL':
        return TemplateType.email;
      case 'SMS':
        return TemplateType.sms;
      case 'VOICE':
        return TemplateType.voice;
      case 'PUSH':
        return TemplateType.push;
      case 'INAPP':
        return TemplateType.inapp;
    }
    throw Exception('$this is not known in enum TemplateType');
  }
}

/// Provides information about a specific version of a message template.
class TemplateVersionResponse {
  /// The date, in ISO 8601 format, when the version of the message template was
  /// created.
  final String creationDate;

  /// The date, in ISO 8601 format, when the version of the message template was
  /// last modified.
  final String lastModifiedDate;

  /// The name of the message template.
  final String templateName;

  /// The type of channel that the message template is designed for. Possible
  /// values are: EMAIL, PUSH, SMS, INAPP, and VOICE.
  final String templateType;

  /// A JSON object that specifies the default values that are used for message
  /// variables in the version of the message template. This object is a set of
  /// key-value pairs. Each key defines a message variable in the template. The
  /// corresponding value defines the default value for that variable.
  final String? defaultSubstitutions;

  /// The custom description of the version of the message template.
  final String? templateDescription;

  /// The unique identifier for the version of the message template. This value is
  /// an integer that Amazon Pinpoint automatically increments and assigns to each
  /// new version of a template.
  final String? version;

  TemplateVersionResponse({
    required this.creationDate,
    required this.lastModifiedDate,
    required this.templateName,
    required this.templateType,
    this.defaultSubstitutions,
    this.templateDescription,
    this.version,
  });

  factory TemplateVersionResponse.fromJson(Map<String, dynamic> json) {
    return TemplateVersionResponse(
      creationDate: json['CreationDate'] as String,
      lastModifiedDate: json['LastModifiedDate'] as String,
      templateName: json['TemplateName'] as String,
      templateType: json['TemplateType'] as String,
      defaultSubstitutions: json['DefaultSubstitutions'] as String?,
      templateDescription: json['TemplateDescription'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final lastModifiedDate = this.lastModifiedDate;
    final templateName = this.templateName;
    final templateType = this.templateType;
    final defaultSubstitutions = this.defaultSubstitutions;
    final templateDescription = this.templateDescription;
    final version = this.version;
    return {
      'CreationDate': creationDate,
      'LastModifiedDate': lastModifiedDate,
      'TemplateName': templateName,
      'TemplateType': templateType,
      if (defaultSubstitutions != null)
        'DefaultSubstitutions': defaultSubstitutions,
      if (templateDescription != null)
        'TemplateDescription': templateDescription,
      if (version != null) 'Version': version,
    };
  }
}

/// Provides information about all the versions of a specific message template.
class TemplateVersionsResponse {
  /// An array of responses, one for each version of the message template.
  final List<TemplateVersionResponse> item;

  /// The message that's returned from the API for the request to retrieve
  /// information about all the versions of the message template.
  final String? message;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  /// The unique identifier for the request to retrieve information about all the
  /// versions of the message template.
  final String? requestID;

  TemplateVersionsResponse({
    required this.item,
    this.message,
    this.nextToken,
    this.requestID,
  });

  factory TemplateVersionsResponse.fromJson(Map<String, dynamic> json) {
    return TemplateVersionsResponse(
      item: (json['Item'] as List)
          .whereNotNull()
          .map((e) =>
              TemplateVersionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['Message'] as String?,
      nextToken: json['NextToken'] as String?,
      requestID: json['RequestID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final item = this.item;
    final message = this.message;
    final nextToken = this.nextToken;
    final requestID = this.requestID;
    return {
      'Item': item,
      if (message != null) 'Message': message,
      if (nextToken != null) 'NextToken': nextToken,
      if (requestID != null) 'RequestID': requestID,
    };
  }
}

/// Provides information about all the message templates that are associated
/// with your Amazon Pinpoint account.
class TemplatesResponse {
  /// An array of responses, one for each message template that's associated with
  /// your Amazon Pinpoint account and meets any filter criteria that you
  /// specified in the request.
  final List<TemplateResponse> item;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  final String? nextToken;

  TemplatesResponse({
    required this.item,
    this.nextToken,
  });

  factory TemplatesResponse.fromJson(Map<String, dynamic> json) {
    return TemplatesResponse(
      item: (json['Item'] as List)
          .whereNotNull()
          .map((e) => TemplateResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final item = this.item;
    final nextToken = this.nextToken;
    return {
      'Item': item,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Specifies the settings for a campaign treatment. A <i>treatment</i> is a
/// variation of a campaign that's used for A/B testing of a campaign.
class TreatmentResource {
  /// The unique identifier for the treatment.
  final String id;

  /// The allocated percentage of users (segment members) that the treatment is
  /// sent to.
  final int sizePercent;

  /// The delivery configuration settings for sending the treatment through a
  /// custom channel. This object is required if the MessageConfiguration object
  /// for the treatment specifies a CustomMessage object.
  final CustomDeliveryConfiguration? customDeliveryConfiguration;

  /// The message configuration settings for the treatment.
  final MessageConfiguration? messageConfiguration;

  /// The schedule settings for the treatment.
  final Schedule? schedule;

  /// The current status of the treatment.
  final CampaignState? state;

  /// The message template to use for the treatment.
  final TemplateConfiguration? templateConfiguration;

  /// The custom description of the treatment.
  final String? treatmentDescription;

  /// The custom name of the treatment.
  final String? treatmentName;

  TreatmentResource({
    required this.id,
    required this.sizePercent,
    this.customDeliveryConfiguration,
    this.messageConfiguration,
    this.schedule,
    this.state,
    this.templateConfiguration,
    this.treatmentDescription,
    this.treatmentName,
  });

  factory TreatmentResource.fromJson(Map<String, dynamic> json) {
    return TreatmentResource(
      id: json['Id'] as String,
      sizePercent: json['SizePercent'] as int,
      customDeliveryConfiguration: json['CustomDeliveryConfiguration'] != null
          ? CustomDeliveryConfiguration.fromJson(
              json['CustomDeliveryConfiguration'] as Map<String, dynamic>)
          : null,
      messageConfiguration: json['MessageConfiguration'] != null
          ? MessageConfiguration.fromJson(
              json['MessageConfiguration'] as Map<String, dynamic>)
          : null,
      schedule: json['Schedule'] != null
          ? Schedule.fromJson(json['Schedule'] as Map<String, dynamic>)
          : null,
      state: json['State'] != null
          ? CampaignState.fromJson(json['State'] as Map<String, dynamic>)
          : null,
      templateConfiguration: json['TemplateConfiguration'] != null
          ? TemplateConfiguration.fromJson(
              json['TemplateConfiguration'] as Map<String, dynamic>)
          : null,
      treatmentDescription: json['TreatmentDescription'] as String?,
      treatmentName: json['TreatmentName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final sizePercent = this.sizePercent;
    final customDeliveryConfiguration = this.customDeliveryConfiguration;
    final messageConfiguration = this.messageConfiguration;
    final schedule = this.schedule;
    final state = this.state;
    final templateConfiguration = this.templateConfiguration;
    final treatmentDescription = this.treatmentDescription;
    final treatmentName = this.treatmentName;
    return {
      'Id': id,
      'SizePercent': sizePercent,
      if (customDeliveryConfiguration != null)
        'CustomDeliveryConfiguration': customDeliveryConfiguration,
      if (messageConfiguration != null)
        'MessageConfiguration': messageConfiguration,
      if (schedule != null) 'Schedule': schedule,
      if (state != null) 'State': state,
      if (templateConfiguration != null)
        'TemplateConfiguration': templateConfiguration,
      if (treatmentDescription != null)
        'TreatmentDescription': treatmentDescription,
      if (treatmentName != null) 'TreatmentName': treatmentName,
    };
  }
}

enum Type {
  all,
  any,
  none,
}

extension TypeValueExtension on Type {
  String toValue() {
    switch (this) {
      case Type.all:
        return 'ALL';
      case Type.any:
        return 'ANY';
      case Type.none:
        return 'NONE';
    }
  }
}

extension TypeFromString on String {
  Type toType() {
    switch (this) {
      case 'ALL':
        return Type.all;
      case 'ANY':
        return Type.any;
      case 'NONE':
        return Type.none;
    }
    throw Exception('$this is not known in enum Type');
  }
}

class UpdateAdmChannelResponse {
  final ADMChannelResponse aDMChannelResponse;

  UpdateAdmChannelResponse({
    required this.aDMChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final aDMChannelResponse = this.aDMChannelResponse;
    return {
      'ADMChannelResponse': aDMChannelResponse,
    };
  }
}

class UpdateApnsChannelResponse {
  final APNSChannelResponse aPNSChannelResponse;

  UpdateApnsChannelResponse({
    required this.aPNSChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final aPNSChannelResponse = this.aPNSChannelResponse;
    return {
      'APNSChannelResponse': aPNSChannelResponse,
    };
  }
}

class UpdateApnsSandboxChannelResponse {
  final APNSSandboxChannelResponse aPNSSandboxChannelResponse;

  UpdateApnsSandboxChannelResponse({
    required this.aPNSSandboxChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final aPNSSandboxChannelResponse = this.aPNSSandboxChannelResponse;
    return {
      'APNSSandboxChannelResponse': aPNSSandboxChannelResponse,
    };
  }
}

class UpdateApnsVoipChannelResponse {
  final APNSVoipChannelResponse aPNSVoipChannelResponse;

  UpdateApnsVoipChannelResponse({
    required this.aPNSVoipChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final aPNSVoipChannelResponse = this.aPNSVoipChannelResponse;
    return {
      'APNSVoipChannelResponse': aPNSVoipChannelResponse,
    };
  }
}

class UpdateApnsVoipSandboxChannelResponse {
  final APNSVoipSandboxChannelResponse aPNSVoipSandboxChannelResponse;

  UpdateApnsVoipSandboxChannelResponse({
    required this.aPNSVoipSandboxChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final aPNSVoipSandboxChannelResponse = this.aPNSVoipSandboxChannelResponse;
    return {
      'APNSVoipSandboxChannelResponse': aPNSVoipSandboxChannelResponse,
    };
  }
}

class UpdateApplicationSettingsResponse {
  final ApplicationSettingsResource applicationSettingsResource;

  UpdateApplicationSettingsResponse({
    required this.applicationSettingsResource,
  });

  Map<String, dynamic> toJson() {
    final applicationSettingsResource = this.applicationSettingsResource;
    return {
      'ApplicationSettingsResource': applicationSettingsResource,
    };
  }
}

/// Specifies one or more attributes to remove from all the endpoints that are
/// associated with an application.
class UpdateAttributesRequest {
  /// An array of the attributes to remove from all the endpoints that are
  /// associated with the application. The array can specify the complete, exact
  /// name of each attribute to remove or it can specify a glob pattern that an
  /// attribute name must match in order for the attribute to be removed.
  final List<String>? blacklist;

  UpdateAttributesRequest({
    this.blacklist,
  });

  Map<String, dynamic> toJson() {
    final blacklist = this.blacklist;
    return {
      if (blacklist != null) 'Blacklist': blacklist,
    };
  }
}

class UpdateBaiduChannelResponse {
  final BaiduChannelResponse baiduChannelResponse;

  UpdateBaiduChannelResponse({
    required this.baiduChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final baiduChannelResponse = this.baiduChannelResponse;
    return {
      'BaiduChannelResponse': baiduChannelResponse,
    };
  }
}

class UpdateCampaignResponse {
  final CampaignResponse campaignResponse;

  UpdateCampaignResponse({
    required this.campaignResponse,
  });

  Map<String, dynamic> toJson() {
    final campaignResponse = this.campaignResponse;
    return {
      'CampaignResponse': campaignResponse,
    };
  }
}

class UpdateEmailChannelResponse {
  final EmailChannelResponse emailChannelResponse;

  UpdateEmailChannelResponse({
    required this.emailChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final emailChannelResponse = this.emailChannelResponse;
    return {
      'EmailChannelResponse': emailChannelResponse,
    };
  }
}

class UpdateEmailTemplateResponse {
  final MessageBody messageBody;

  UpdateEmailTemplateResponse({
    required this.messageBody,
  });

  Map<String, dynamic> toJson() {
    final messageBody = this.messageBody;
    return {
      'MessageBody': messageBody,
    };
  }
}

class UpdateEndpointResponse {
  final MessageBody messageBody;

  UpdateEndpointResponse({
    required this.messageBody,
  });

  Map<String, dynamic> toJson() {
    final messageBody = this.messageBody;
    return {
      'MessageBody': messageBody,
    };
  }
}

class UpdateEndpointsBatchResponse {
  final MessageBody messageBody;

  UpdateEndpointsBatchResponse({
    required this.messageBody,
  });

  Map<String, dynamic> toJson() {
    final messageBody = this.messageBody;
    return {
      'MessageBody': messageBody,
    };
  }
}

class UpdateGcmChannelResponse {
  final GCMChannelResponse gCMChannelResponse;

  UpdateGcmChannelResponse({
    required this.gCMChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final gCMChannelResponse = this.gCMChannelResponse;
    return {
      'GCMChannelResponse': gCMChannelResponse,
    };
  }
}

class UpdateInAppTemplateResponse {
  final MessageBody messageBody;

  UpdateInAppTemplateResponse({
    required this.messageBody,
  });

  Map<String, dynamic> toJson() {
    final messageBody = this.messageBody;
    return {
      'MessageBody': messageBody,
    };
  }
}

class UpdateJourneyResponse {
  final JourneyResponse journeyResponse;

  UpdateJourneyResponse({
    required this.journeyResponse,
  });

  Map<String, dynamic> toJson() {
    final journeyResponse = this.journeyResponse;
    return {
      'JourneyResponse': journeyResponse,
    };
  }
}

class UpdateJourneyStateResponse {
  final JourneyResponse journeyResponse;

  UpdateJourneyStateResponse({
    required this.journeyResponse,
  });

  Map<String, dynamic> toJson() {
    final journeyResponse = this.journeyResponse;
    return {
      'JourneyResponse': journeyResponse,
    };
  }
}

class UpdatePushTemplateResponse {
  final MessageBody messageBody;

  UpdatePushTemplateResponse({
    required this.messageBody,
  });

  Map<String, dynamic> toJson() {
    final messageBody = this.messageBody;
    return {
      'MessageBody': messageBody,
    };
  }
}

/// Specifies Amazon Pinpoint configuration settings for retrieving and
/// processing recommendation data from a recommender model.
class UpdateRecommenderConfiguration {
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorizes Amazon Pinpoint to retrieve recommendation data
  /// from the recommender model.
  final String recommendationProviderRoleArn;

  /// The Amazon Resource Name (ARN) of the recommender model to retrieve
  /// recommendation data from. This value must match the ARN of an Amazon
  /// Personalize campaign.
  final String recommendationProviderUri;

  /// A map of key-value pairs that defines 1-10 custom endpoint or user
  /// attributes, depending on the value for the RecommendationProviderIdType
  /// property. Each of these attributes temporarily stores a recommended item
  /// that's retrieved from the recommender model and sent to an AWS Lambda
  /// function for additional processing. Each attribute can be used as a message
  /// variable in a message template.
  ///
  /// In the map, the key is the name of a custom attribute and the value is a
  /// custom display name for that attribute. The display name appears in the
  /// <b>Attribute finder</b> of the template editor on the Amazon Pinpoint
  /// console. The following restrictions apply to these names:
  ///
  /// <ul>
  /// <li>
  /// An attribute name must start with a letter or number and it can contain up
  /// to 50 characters. The characters can be letters, numbers, underscores (_),
  /// or hyphens (-). Attribute names are case sensitive and must be unique.
  /// </li>
  /// <li>
  /// An attribute display name must start with a letter or number and it can
  /// contain up to 25 characters. The characters can be letters, numbers, spaces,
  /// underscores (_), or hyphens (-).
  /// </li>
  /// </ul>
  /// This object is required if the configuration invokes an AWS Lambda function
  /// (RecommendationTransformerUri) to process recommendation data. Otherwise,
  /// don't include this object in your request.
  final Map<String, String>? attributes;

  /// A custom description of the configuration for the recommender model. The
  /// description can contain up to 128 characters. The characters can be letters,
  /// numbers, spaces, or the following symbols: _ ; () , ‐.
  final String? description;

  /// A custom name of the configuration for the recommender model. The name must
  /// start with a letter or number and it can contain up to 128 characters. The
  /// characters can be letters, numbers, spaces, underscores (_), or hyphens (-).
  final String? name;

  /// The type of Amazon Pinpoint ID to associate with unique user IDs in the
  /// recommender model. This value enables the model to use attribute and event
  /// data that’s specific to a particular endpoint or user in an Amazon Pinpoint
  /// application. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// PINPOINT_ENDPOINT_ID - Associate each user in the model with a particular
  /// endpoint in Amazon Pinpoint. The data is correlated based on endpoint IDs in
  /// Amazon Pinpoint. This is the default value.
  /// </li>
  /// <li>
  /// PINPOINT_USER_ID - Associate each user in the model with a particular user
  /// and endpoint in Amazon Pinpoint. The data is correlated based on user IDs in
  /// Amazon Pinpoint. If you specify this value, an endpoint definition in Amazon
  /// Pinpoint has to specify both a user ID (UserId) and an endpoint ID.
  /// Otherwise, messages won’t be sent to the user's endpoint.
  /// </li>
  /// </ul>
  final String? recommendationProviderIdType;

  /// The name or Amazon Resource Name (ARN) of the AWS Lambda function to invoke
  /// for additional processing of recommendation data that's retrieved from the
  /// recommender model.
  final String? recommendationTransformerUri;

  /// A custom display name for the standard endpoint or user attribute
  /// (RecommendationItems) that temporarily stores recommended items for each
  /// endpoint or user, depending on the value for the
  /// RecommendationProviderIdType property. This value is required if the
  /// configuration doesn't invoke an AWS Lambda function
  /// (RecommendationTransformerUri) to perform additional processing of
  /// recommendation data.
  ///
  /// This name appears in the <b>Attribute finder</b> of the template editor on
  /// the Amazon Pinpoint console. The name can contain up to 25 characters. The
  /// characters can be letters, numbers, spaces, underscores (_), or hyphens (-).
  /// These restrictions don't apply to attribute values.
  final String? recommendationsDisplayName;

  /// The number of recommended items to retrieve from the model for each endpoint
  /// or user, depending on the value for the RecommendationProviderIdType
  /// property. This number determines how many recommended items are available
  /// for use in message variables. The minimum value is 1. The maximum value is
  /// 5. The default value is 5.
  ///
  /// To use multiple recommended items and custom attributes with message
  /// variables, you have to use an AWS Lambda function
  /// (RecommendationTransformerUri) to perform additional processing of
  /// recommendation data.
  final int? recommendationsPerMessage;

  UpdateRecommenderConfiguration({
    required this.recommendationProviderRoleArn,
    required this.recommendationProviderUri,
    this.attributes,
    this.description,
    this.name,
    this.recommendationProviderIdType,
    this.recommendationTransformerUri,
    this.recommendationsDisplayName,
    this.recommendationsPerMessage,
  });

  Map<String, dynamic> toJson() {
    final recommendationProviderRoleArn = this.recommendationProviderRoleArn;
    final recommendationProviderUri = this.recommendationProviderUri;
    final attributes = this.attributes;
    final description = this.description;
    final name = this.name;
    final recommendationProviderIdType = this.recommendationProviderIdType;
    final recommendationTransformerUri = this.recommendationTransformerUri;
    final recommendationsDisplayName = this.recommendationsDisplayName;
    final recommendationsPerMessage = this.recommendationsPerMessage;
    return {
      'RecommendationProviderRoleArn': recommendationProviderRoleArn,
      'RecommendationProviderUri': recommendationProviderUri,
      if (attributes != null) 'Attributes': attributes,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (recommendationProviderIdType != null)
        'RecommendationProviderIdType': recommendationProviderIdType,
      if (recommendationTransformerUri != null)
        'RecommendationTransformerUri': recommendationTransformerUri,
      if (recommendationsDisplayName != null)
        'RecommendationsDisplayName': recommendationsDisplayName,
      if (recommendationsPerMessage != null)
        'RecommendationsPerMessage': recommendationsPerMessage,
    };
  }
}

class UpdateRecommenderConfigurationResponse {
  final RecommenderConfigurationResponse recommenderConfigurationResponse;

  UpdateRecommenderConfigurationResponse({
    required this.recommenderConfigurationResponse,
  });

  Map<String, dynamic> toJson() {
    final recommenderConfigurationResponse =
        this.recommenderConfigurationResponse;
    return {
      'RecommenderConfigurationResponse': recommenderConfigurationResponse,
    };
  }
}

class UpdateSegmentResponse {
  final SegmentResponse segmentResponse;

  UpdateSegmentResponse({
    required this.segmentResponse,
  });

  Map<String, dynamic> toJson() {
    final segmentResponse = this.segmentResponse;
    return {
      'SegmentResponse': segmentResponse,
    };
  }
}

class UpdateSmsChannelResponse {
  final SMSChannelResponse sMSChannelResponse;

  UpdateSmsChannelResponse({
    required this.sMSChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final sMSChannelResponse = this.sMSChannelResponse;
    return {
      'SMSChannelResponse': sMSChannelResponse,
    };
  }
}

class UpdateSmsTemplateResponse {
  final MessageBody messageBody;

  UpdateSmsTemplateResponse({
    required this.messageBody,
  });

  Map<String, dynamic> toJson() {
    final messageBody = this.messageBody;
    return {
      'MessageBody': messageBody,
    };
  }
}

class UpdateTemplateActiveVersionResponse {
  final MessageBody messageBody;

  UpdateTemplateActiveVersionResponse({
    required this.messageBody,
  });

  Map<String, dynamic> toJson() {
    final messageBody = this.messageBody;
    return {
      'MessageBody': messageBody,
    };
  }
}

class UpdateVoiceChannelResponse {
  final VoiceChannelResponse voiceChannelResponse;

  UpdateVoiceChannelResponse({
    required this.voiceChannelResponse,
  });

  Map<String, dynamic> toJson() {
    final voiceChannelResponse = this.voiceChannelResponse;
    return {
      'VoiceChannelResponse': voiceChannelResponse,
    };
  }
}

class UpdateVoiceTemplateResponse {
  final MessageBody messageBody;

  UpdateVoiceTemplateResponse({
    required this.messageBody,
  });

  Map<String, dynamic> toJson() {
    final messageBody = this.messageBody;
    return {
      'MessageBody': messageBody,
    };
  }
}

/// Verify OTP Message Response.
class VerificationResponse {
  /// Specifies whether the OTP is valid or not.
  final bool? valid;

  VerificationResponse({
    this.valid,
  });

  factory VerificationResponse.fromJson(Map<String, dynamic> json) {
    return VerificationResponse(
      valid: json['Valid'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final valid = this.valid;
    return {
      if (valid != null) 'Valid': valid,
    };
  }
}

/// Verify OTP message request.
class VerifyOTPMessageRequestParameters {
  /// The destination identity to send OTP to.
  final String destinationIdentity;

  /// The OTP the end user provided for verification.
  final String otp;

  /// The reference identifier provided when the OTP was previously sent.
  final String referenceId;

  VerifyOTPMessageRequestParameters({
    required this.destinationIdentity,
    required this.otp,
    required this.referenceId,
  });

  Map<String, dynamic> toJson() {
    final destinationIdentity = this.destinationIdentity;
    final otp = this.otp;
    final referenceId = this.referenceId;
    return {
      'DestinationIdentity': destinationIdentity,
      'Otp': otp,
      'ReferenceId': referenceId,
    };
  }
}

class VerifyOTPMessageResponse {
  final VerificationResponse verificationResponse;

  VerifyOTPMessageResponse({
    required this.verificationResponse,
  });

  Map<String, dynamic> toJson() {
    final verificationResponse = this.verificationResponse;
    return {
      'VerificationResponse': verificationResponse,
    };
  }
}

/// Specifies the status and settings of the voice channel for an application.
class VoiceChannelRequest {
  /// Specifies whether to enable the voice channel for the application.
  final bool? enabled;

  VoiceChannelRequest({
    this.enabled,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'Enabled': enabled,
    };
  }
}

/// Provides information about the status and settings of the voice channel for
/// an application.
class VoiceChannelResponse {
  /// The type of messaging or notification platform for the channel. For the
  /// voice channel, this value is VOICE.
  final String platform;

  /// The unique identifier for the application that the voice channel applies to.
  final String? applicationId;

  /// The date and time, in ISO 8601 format, when the voice channel was enabled.
  final String? creationDate;

  /// Specifies whether the voice channel is enabled for the application.
  final bool? enabled;

  /// (Not used) This property is retained only for backward compatibility.
  final bool? hasCredential;

  /// (Deprecated) An identifier for the voice channel. This property is retained
  /// only for backward compatibility.
  final String? id;

  /// Specifies whether the voice channel is archived.
  final bool? isArchived;

  /// The user who last modified the voice channel.
  final String? lastModifiedBy;

  /// The date and time, in ISO 8601 format, when the voice channel was last
  /// modified.
  final String? lastModifiedDate;

  /// The current version of the voice channel.
  final int? version;

  VoiceChannelResponse({
    required this.platform,
    this.applicationId,
    this.creationDate,
    this.enabled,
    this.hasCredential,
    this.id,
    this.isArchived,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.version,
  });

  factory VoiceChannelResponse.fromJson(Map<String, dynamic> json) {
    return VoiceChannelResponse(
      platform: json['Platform'] as String,
      applicationId: json['ApplicationId'] as String?,
      creationDate: json['CreationDate'] as String?,
      enabled: json['Enabled'] as bool?,
      hasCredential: json['HasCredential'] as bool?,
      id: json['Id'] as String?,
      isArchived: json['IsArchived'] as bool?,
      lastModifiedBy: json['LastModifiedBy'] as String?,
      lastModifiedDate: json['LastModifiedDate'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final platform = this.platform;
    final applicationId = this.applicationId;
    final creationDate = this.creationDate;
    final enabled = this.enabled;
    final hasCredential = this.hasCredential;
    final id = this.id;
    final isArchived = this.isArchived;
    final lastModifiedBy = this.lastModifiedBy;
    final lastModifiedDate = this.lastModifiedDate;
    final version = this.version;
    return {
      'Platform': platform,
      if (applicationId != null) 'ApplicationId': applicationId,
      if (creationDate != null) 'CreationDate': creationDate,
      if (enabled != null) 'Enabled': enabled,
      if (hasCredential != null) 'HasCredential': hasCredential,
      if (id != null) 'Id': id,
      if (isArchived != null) 'IsArchived': isArchived,
      if (lastModifiedBy != null) 'LastModifiedBy': lastModifiedBy,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (version != null) 'Version': version,
    };
  }
}

/// Specifies the settings for a one-time voice message that's sent directly to
/// an endpoint through the voice channel.
class VoiceMessage {
  /// The text of the script to use for the voice message.
  final String? body;

  /// The code for the language to use when synthesizing the text of the message
  /// script. For a list of supported languages and the code for each one, see the
  /// <a href="https://docs.aws.amazon.com/polly/latest/dg/what-is.html">Amazon
  /// Polly Developer Guide</a>.
  final String? languageCode;

  /// The long code to send the voice message from. This value should be one of
  /// the dedicated long codes that's assigned to your AWS account. Although it
  /// isn't required, we recommend that you specify the long code in E.164 format,
  /// for example +12065550100, to ensure prompt and accurate delivery of the
  /// message.
  final String? originationNumber;

  /// The default message variables to use in the voice message. You can override
  /// the default variables with individual address variables.
  final Map<String, List<String>>? substitutions;

  /// The name of the voice to use when delivering the message. For a list of
  /// supported voices, see the <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/what-is.html">Amazon Polly
  /// Developer Guide</a>.
  final String? voiceId;

  VoiceMessage({
    this.body,
    this.languageCode,
    this.originationNumber,
    this.substitutions,
    this.voiceId,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final languageCode = this.languageCode;
    final originationNumber = this.originationNumber;
    final substitutions = this.substitutions;
    final voiceId = this.voiceId;
    return {
      if (body != null) 'Body': body,
      if (languageCode != null) 'LanguageCode': languageCode,
      if (originationNumber != null) 'OriginationNumber': originationNumber,
      if (substitutions != null) 'Substitutions': substitutions,
      if (voiceId != null) 'VoiceId': voiceId,
    };
  }
}

/// Specifies the content and settings for a message template that can be used
/// in messages that are sent through the voice channel.
class VoiceTemplateRequest {
  /// The text of the script to use in messages that are based on the message
  /// template, in plain text format.
  final String? body;

  /// A JSON object that specifies the default values to use for message variables
  /// in the message template. This object is a set of key-value pairs. Each key
  /// defines a message variable in the template. The corresponding value defines
  /// the default value for that variable. When you create a message that's based
  /// on the template, you can override these defaults with message-specific and
  /// address-specific variables and values.
  final String? defaultSubstitutions;

  /// The code for the language to use when synthesizing the text of the script in
  /// messages that are based on the message template. For a list of supported
  /// languages and the code for each one, see the <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/what-is.html">Amazon Polly
  /// Developer Guide</a>.
  final String? languageCode;

  /// A custom description of the message template.
  final String? templateDescription;

  /// The name of the voice to use when delivering messages that are based on the
  /// message template. For a list of supported voices, see the <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/what-is.html">Amazon Polly
  /// Developer Guide</a>.
  final String? voiceId;

  /// <note>
  /// As of <b>22-05-2023</b> tags has been deprecated for update operations.
  /// After this date any value in tags is not processed and an error code is not
  /// returned. To manage tags we recommend using either <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/tags-resource-arn.html">Tags</a>
  /// in the <i>API Reference for Amazon Pinpoint</i>, <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/resourcegroupstaggingapi/index.html">resourcegroupstaggingapi</a>
  /// commands in the <i>AWS Command Line Interface Documentation</i> or <a
  /// href="https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/services/resourcegroupstaggingapi/package-summary.html">resourcegroupstaggingapi</a>
  /// in the <i>AWS SDK</i>.
  /// </note>
  /// (Deprecated) A string-to-string map of key-value pairs that defines the tags
  /// to associate with the message template. Each tag consists of a required tag
  /// key and an associated tag value.
  final Map<String, String>? tags;

  VoiceTemplateRequest({
    this.body,
    this.defaultSubstitutions,
    this.languageCode,
    this.templateDescription,
    this.voiceId,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final defaultSubstitutions = this.defaultSubstitutions;
    final languageCode = this.languageCode;
    final templateDescription = this.templateDescription;
    final voiceId = this.voiceId;
    final tags = this.tags;
    return {
      if (body != null) 'Body': body,
      if (defaultSubstitutions != null)
        'DefaultSubstitutions': defaultSubstitutions,
      if (languageCode != null) 'LanguageCode': languageCode,
      if (templateDescription != null)
        'TemplateDescription': templateDescription,
      if (voiceId != null) 'VoiceId': voiceId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Provides information about the content and settings for a message template
/// that can be used in messages that are sent through the voice channel.
class VoiceTemplateResponse {
  /// The date, in ISO 8601 format, when the message template was created.
  final String creationDate;

  /// The date, in ISO 8601 format, when the message template was last modified.
  final String lastModifiedDate;

  /// The name of the message template.
  final String templateName;

  /// The type of channel that the message template is designed for. For a voice
  /// template, this value is VOICE.
  final TemplateType templateType;

  /// The Amazon Resource Name (ARN) of the message template.
  final String? arn;

  /// The text of the script that's used in messages that are based on the message
  /// template, in plain text format.
  final String? body;

  /// The JSON object that specifies the default values that are used for message
  /// variables in the message template. This object is a set of key-value pairs.
  /// Each key defines a message variable in the template. The corresponding value
  /// defines the default value for that variable.
  final String? defaultSubstitutions;

  /// The code for the language that's used when synthesizing the text of the
  /// script in messages that are based on the message template. For a list of
  /// supported languages and the code for each one, see the <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/what-is.html">Amazon Polly
  /// Developer Guide</a>.
  final String? languageCode;

  /// The custom description of the message template.
  final String? templateDescription;

  /// The unique identifier, as an integer, for the active version of the message
  /// template, or the version of the template that you specified by using the
  /// version parameter in your request.
  final String? version;

  /// The name of the voice that's used when delivering messages that are based on
  /// the message template. For a list of supported voices, see the <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/what-is.html">Amazon Polly
  /// Developer Guide</a>.
  final String? voiceId;

  /// A string-to-string map of key-value pairs that identifies the tags that are
  /// associated with the message template. Each tag consists of a required tag
  /// key and an associated tag value.
  final Map<String, String>? tags;

  VoiceTemplateResponse({
    required this.creationDate,
    required this.lastModifiedDate,
    required this.templateName,
    required this.templateType,
    this.arn,
    this.body,
    this.defaultSubstitutions,
    this.languageCode,
    this.templateDescription,
    this.version,
    this.voiceId,
    this.tags,
  });

  factory VoiceTemplateResponse.fromJson(Map<String, dynamic> json) {
    return VoiceTemplateResponse(
      creationDate: json['CreationDate'] as String,
      lastModifiedDate: json['LastModifiedDate'] as String,
      templateName: json['TemplateName'] as String,
      templateType: (json['TemplateType'] as String).toTemplateType(),
      arn: json['Arn'] as String?,
      body: json['Body'] as String?,
      defaultSubstitutions: json['DefaultSubstitutions'] as String?,
      languageCode: json['LanguageCode'] as String?,
      templateDescription: json['TemplateDescription'] as String?,
      version: json['Version'] as String?,
      voiceId: json['VoiceId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final lastModifiedDate = this.lastModifiedDate;
    final templateName = this.templateName;
    final templateType = this.templateType;
    final arn = this.arn;
    final body = this.body;
    final defaultSubstitutions = this.defaultSubstitutions;
    final languageCode = this.languageCode;
    final templateDescription = this.templateDescription;
    final version = this.version;
    final voiceId = this.voiceId;
    final tags = this.tags;
    return {
      'CreationDate': creationDate,
      'LastModifiedDate': lastModifiedDate,
      'TemplateName': templateName,
      'TemplateType': templateType.toValue(),
      if (arn != null) 'Arn': arn,
      if (body != null) 'Body': body,
      if (defaultSubstitutions != null)
        'DefaultSubstitutions': defaultSubstitutions,
      if (languageCode != null) 'LanguageCode': languageCode,
      if (templateDescription != null)
        'TemplateDescription': templateDescription,
      if (version != null) 'Version': version,
      if (voiceId != null) 'VoiceId': voiceId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Specifies the settings for a wait activity in a journey. This type of
/// activity waits for a certain amount of time or until a specific date and
/// time before moving participants to the next activity in a journey.
class WaitActivity {
  /// The unique identifier for the next activity to perform, after performing the
  /// wait activity.
  final String? nextActivity;

  /// The amount of time to wait or the date and time when the activity moves
  /// participants to the next activity in the journey.
  final WaitTime? waitTime;

  WaitActivity({
    this.nextActivity,
    this.waitTime,
  });

  factory WaitActivity.fromJson(Map<String, dynamic> json) {
    return WaitActivity(
      nextActivity: json['NextActivity'] as String?,
      waitTime: json['WaitTime'] != null
          ? WaitTime.fromJson(json['WaitTime'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nextActivity = this.nextActivity;
    final waitTime = this.waitTime;
    return {
      if (nextActivity != null) 'NextActivity': nextActivity,
      if (waitTime != null) 'WaitTime': waitTime,
    };
  }
}

/// Specifies a duration or a date and time that indicates when Amazon Pinpoint
/// determines whether an activity's conditions have been met or an activity
/// moves participants to the next activity in a journey.
class WaitTime {
  /// The amount of time to wait, as a duration in ISO 8601 format, before
  /// determining whether the activity's conditions have been met or moving
  /// participants to the next activity in the journey.
  final String? waitFor;

  /// The date and time, in ISO 8601 format, when Amazon Pinpoint determines
  /// whether the activity's conditions have been met or the activity moves
  /// participants to the next activity in the journey.
  final String? waitUntil;

  WaitTime({
    this.waitFor,
    this.waitUntil,
  });

  factory WaitTime.fromJson(Map<String, dynamic> json) {
    return WaitTime(
      waitFor: json['WaitFor'] as String?,
      waitUntil: json['WaitUntil'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final waitFor = this.waitFor;
    final waitUntil = this.waitUntil;
    return {
      if (waitFor != null) 'WaitFor': waitFor,
      if (waitUntil != null) 'WaitUntil': waitUntil,
    };
  }
}

/// Specifies the default settings for an application.
class WriteApplicationSettingsRequest {
  /// The settings for the AWS Lambda function to invoke by default as a code hook
  /// for campaigns in the application. You can use this hook to customize
  /// segments that are used by campaigns in the application.
  ///
  /// To override these settings and define custom settings for a specific
  /// campaign, use the CampaignHook object of the <link
  /// linkend="apps-application-id-campaigns-campaign-id">Campaign</link>
  /// resource.
  final CampaignHook? campaignHook;

  /// Specifies whether to enable application-related alarms in Amazon CloudWatch.
  final bool? cloudWatchMetricsEnabled;
  final bool? eventTaggingEnabled;

  /// The default sending limits for journeys in the application. These limits
  /// apply to each journey for the application but can be overridden, on a per
  /// journey basis, with the JourneyLimits resource.
  final ApplicationSettingsJourneyLimits? journeyLimits;

  /// The default sending limits for campaigns in the application. To override
  /// these limits and define custom limits for a specific campaign or journey,
  /// use the <link
  /// linkend="apps-application-id-campaigns-campaign-id">Campaign</link> resource
  /// or the <link
  /// linkend="apps-application-id-journeys-journey-id">Journey</link> resource,
  /// respectively.
  final CampaignLimits? limits;

  /// The default quiet time for campaigns in the application. Quiet time is a
  /// specific time range when messages aren't sent to endpoints, if all the
  /// following conditions are met:
  ///
  /// <ul>
  /// <li>
  /// The EndpointDemographic.Timezone property of the endpoint is set to a valid
  /// value.
  /// </li>
  /// <li>
  /// The current time in the endpoint's time zone is later than or equal to the
  /// time specified by the QuietTime.Start property for the application (or a
  /// campaign or journey that has custom quiet time settings).
  /// </li>
  /// <li>
  /// The current time in the endpoint's time zone is earlier than or equal to the
  /// time specified by the QuietTime.End property for the application (or a
  /// campaign or journey that has custom quiet time settings).
  /// </li>
  /// </ul>
  /// If any of the preceding conditions isn't met, the endpoint will receive
  /// messages from a campaign or journey, even if quiet time is enabled.
  ///
  /// To override the default quiet time settings for a specific campaign or
  /// journey, use the <link
  /// linkend="apps-application-id-campaigns-campaign-id">Campaign</link> resource
  /// or the <link
  /// linkend="apps-application-id-journeys-journey-id">Journey</link> resource to
  /// define a custom quiet time for the campaign or journey.
  final QuietTime? quietTime;

  WriteApplicationSettingsRequest({
    this.campaignHook,
    this.cloudWatchMetricsEnabled,
    this.eventTaggingEnabled,
    this.journeyLimits,
    this.limits,
    this.quietTime,
  });

  Map<String, dynamic> toJson() {
    final campaignHook = this.campaignHook;
    final cloudWatchMetricsEnabled = this.cloudWatchMetricsEnabled;
    final eventTaggingEnabled = this.eventTaggingEnabled;
    final journeyLimits = this.journeyLimits;
    final limits = this.limits;
    final quietTime = this.quietTime;
    return {
      if (campaignHook != null) 'CampaignHook': campaignHook,
      if (cloudWatchMetricsEnabled != null)
        'CloudWatchMetricsEnabled': cloudWatchMetricsEnabled,
      if (eventTaggingEnabled != null)
        'EventTaggingEnabled': eventTaggingEnabled,
      if (journeyLimits != null) 'JourneyLimits': journeyLimits,
      if (limits != null) 'Limits': limits,
      if (quietTime != null) 'QuietTime': quietTime,
    };
  }
}

/// Specifies the configuration and other settings for a campaign.
class WriteCampaignRequest {
  /// An array of requests that defines additional treatments for the campaign, in
  /// addition to the default treatment for the campaign.
  final List<WriteTreatmentResource>? additionalTreatments;

  /// The delivery configuration settings for sending the campaign through a
  /// custom channel. This object is required if the MessageConfiguration object
  /// for the campaign specifies a CustomMessage object.
  final CustomDeliveryConfiguration? customDeliveryConfiguration;

  /// A custom description of the campaign.
  final String? description;

  /// The allocated percentage of users (segment members) who shouldn't receive
  /// messages from the campaign.
  final int? holdoutPercent;

  /// The settings for the AWS Lambda function to invoke as a code hook for the
  /// campaign. You can use this hook to customize the segment that's used by the
  /// campaign.
  final CampaignHook? hook;

  /// Specifies whether to pause the campaign. A paused campaign doesn't run
  /// unless you resume it by changing this value to false.
  final bool? isPaused;

  /// The messaging limits for the campaign.
  final CampaignLimits? limits;

  /// The message configuration settings for the campaign.
  final MessageConfiguration? messageConfiguration;

  /// A custom name for the campaign.
  final String? name;

  /// Defines the priority of the campaign, used to decide the order of messages
  /// displayed to user if there are multiple messages scheduled to be displayed
  /// at the same moment.
  final int? priority;

  /// The schedule settings for the campaign.
  final Schedule? schedule;

  /// The unique identifier for the segment to associate with the campaign.
  final String? segmentId;

  /// The version of the segment to associate with the campaign.
  final int? segmentVersion;

  /// The message template to use for the campaign.
  final TemplateConfiguration? templateConfiguration;

  /// A custom description of the default treatment for the campaign.
  final String? treatmentDescription;

  /// A custom name of the default treatment for the campaign, if the campaign has
  /// multiple treatments. A <i>treatment</i> is a variation of a campaign that's
  /// used for A/B testing.
  final String? treatmentName;

  /// <note>
  /// As of <b>22-05-2023</b> tags has been deprecated for update operations.
  /// After this date any value in tags is not processed and an error code is not
  /// returned. To manage tags we recommend using either <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/tags-resource-arn.html">Tags</a>
  /// in the <i>API Reference for Amazon Pinpoint</i>, <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/resourcegroupstaggingapi/index.html">resourcegroupstaggingapi</a>
  /// commands in the <i>AWS Command Line Interface Documentation</i> or <a
  /// href="https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/services/resourcegroupstaggingapi/package-summary.html">resourcegroupstaggingapi</a>
  /// in the <i>AWS SDK</i>.
  /// </note>
  /// (Deprecated) A string-to-string map of key-value pairs that defines the tags
  /// to associate with the campaign. Each tag consists of a required tag key and
  /// an associated tag value.
  final Map<String, String>? tags;

  WriteCampaignRequest({
    this.additionalTreatments,
    this.customDeliveryConfiguration,
    this.description,
    this.holdoutPercent,
    this.hook,
    this.isPaused,
    this.limits,
    this.messageConfiguration,
    this.name,
    this.priority,
    this.schedule,
    this.segmentId,
    this.segmentVersion,
    this.templateConfiguration,
    this.treatmentDescription,
    this.treatmentName,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final additionalTreatments = this.additionalTreatments;
    final customDeliveryConfiguration = this.customDeliveryConfiguration;
    final description = this.description;
    final holdoutPercent = this.holdoutPercent;
    final hook = this.hook;
    final isPaused = this.isPaused;
    final limits = this.limits;
    final messageConfiguration = this.messageConfiguration;
    final name = this.name;
    final priority = this.priority;
    final schedule = this.schedule;
    final segmentId = this.segmentId;
    final segmentVersion = this.segmentVersion;
    final templateConfiguration = this.templateConfiguration;
    final treatmentDescription = this.treatmentDescription;
    final treatmentName = this.treatmentName;
    final tags = this.tags;
    return {
      if (additionalTreatments != null)
        'AdditionalTreatments': additionalTreatments,
      if (customDeliveryConfiguration != null)
        'CustomDeliveryConfiguration': customDeliveryConfiguration,
      if (description != null) 'Description': description,
      if (holdoutPercent != null) 'HoldoutPercent': holdoutPercent,
      if (hook != null) 'Hook': hook,
      if (isPaused != null) 'IsPaused': isPaused,
      if (limits != null) 'Limits': limits,
      if (messageConfiguration != null)
        'MessageConfiguration': messageConfiguration,
      if (name != null) 'Name': name,
      if (priority != null) 'Priority': priority,
      if (schedule != null) 'Schedule': schedule,
      if (segmentId != null) 'SegmentId': segmentId,
      if (segmentVersion != null) 'SegmentVersion': segmentVersion,
      if (templateConfiguration != null)
        'TemplateConfiguration': templateConfiguration,
      if (treatmentDescription != null)
        'TreatmentDescription': treatmentDescription,
      if (treatmentName != null) 'TreatmentName': treatmentName,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Specifies the Amazon Resource Name (ARN) of an event stream to publish
/// events to and the AWS Identity and Access Management (IAM) role to use when
/// publishing those events.
class WriteEventStream {
  /// The Amazon Resource Name (ARN) of the Amazon Kinesis data stream or Amazon
  /// Kinesis Data Firehose delivery stream that you want to publish event data
  /// to.
  ///
  /// For a Kinesis data stream, the ARN format is:
  /// arn:aws:kinesis:<replaceable>region</replaceable>:<replaceable>account-id</replaceable>:stream/<replaceable>stream_name</replaceable>
  ///
  ///
  /// For a Kinesis Data Firehose delivery stream, the ARN format is:
  /// arn:aws:firehose:<replaceable>region</replaceable>:<replaceable>account-id</replaceable>:deliverystream/<replaceable>stream_name</replaceable>
  ///
  final String destinationStreamArn;

  /// The AWS Identity and Access Management (IAM) role that authorizes Amazon
  /// Pinpoint to publish event data to the stream in your AWS account.
  final String roleArn;

  WriteEventStream({
    required this.destinationStreamArn,
    required this.roleArn,
  });

  Map<String, dynamic> toJson() {
    final destinationStreamArn = this.destinationStreamArn;
    final roleArn = this.roleArn;
    return {
      'DestinationStreamArn': destinationStreamArn,
      'RoleArn': roleArn,
    };
  }
}

/// Specifies the configuration and other settings for a journey.
class WriteJourneyRequest {
  /// The name of the journey. A journey name can contain a maximum of 150
  /// characters. The characters can be alphanumeric characters or symbols, such
  /// as underscores (_) or hyphens (-). A journey name can't contain any spaces.
  final String name;

  /// A map that contains a set of Activity objects, one object for each activity
  /// in the journey. For each Activity object, the key is the unique identifier
  /// (string) for an activity and the value is the settings for the activity. An
  /// activity identifier can contain a maximum of 100 characters. The characters
  /// must be alphanumeric characters.
  final Map<String, Activity>? activities;

  /// The time when journey will stop sending messages. QuietTime should be
  /// configured first and SendingSchedule should be set to true.
  final ClosedDays? closedDays;

  /// The date, in ISO 8601 format, when the journey was created.
  final String? creationDate;

  /// The channel-specific configurations for the journey.
  final JourneyChannelSettings? journeyChannelSettings;

  /// The date, in ISO 8601 format, when the journey was last modified.
  final String? lastModifiedDate;

  /// The messaging and entry limits for the journey.
  final JourneyLimits? limits;

  /// Specifies whether the journey's scheduled start and end times use each
  /// participant's local time. To base the schedule on each participant's local
  /// time, set this value to true.
  final bool? localTime;

  /// The time when journey allow to send messages. QuietTime should be configured
  /// first and SendingSchedule should be set to true.
  final OpenHours? openHours;

  /// The quiet time settings for the journey. Quiet time is a specific time range
  /// when a journey doesn't send messages to participants, if all the following
  /// conditions are met:
  ///
  /// <ul>
  /// <li>
  /// The EndpointDemographic.Timezone property of the endpoint for the
  /// participant is set to a valid value.
  /// </li>
  /// <li>
  /// The current time in the participant's time zone is later than or equal to
  /// the time specified by the QuietTime.Start property for the journey.
  /// </li>
  /// <li>
  /// The current time in the participant's time zone is earlier than or equal to
  /// the time specified by the QuietTime.End property for the journey.
  /// </li>
  /// </ul>
  /// If any of the preceding conditions isn't met, the participant will receive
  /// messages from the journey, even if quiet time is enabled.
  final QuietTime? quietTime;

  /// The frequency with which Amazon Pinpoint evaluates segment and event data
  /// for the journey, as a duration in ISO 8601 format.
  final String? refreshFrequency;

  /// Indicates whether the journey participants should be refreshed when a
  /// segment is updated.
  final bool? refreshOnSegmentUpdate;

  /// The schedule settings for the journey.
  final JourneySchedule? schedule;

  /// Indicates if journey has Advance Quiet Time enabled. This flag should be set
  /// to true in order to allow using OpenHours and ClosedDays.
  final bool? sendingSchedule;

  /// The unique identifier for the first activity in the journey. The identifier
  /// for this activity can contain a maximum of 128 characters. The characters
  /// must be alphanumeric characters.
  final String? startActivity;

  /// The segment that defines which users are participants in the journey.
  final StartCondition? startCondition;

  /// The status of the journey. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// DRAFT - Saves the journey and doesn't publish it.
  /// </li>
  /// <li>
  /// ACTIVE - Saves and publishes the journey. Depending on the journey's
  /// schedule, the journey starts running immediately or at the scheduled start
  /// time. If a journey's status is ACTIVE, you can't add, change, or remove
  /// activities from it.
  /// </li>
  /// </ul>
  /// PAUSED, CANCELLED, COMPLETED, and CLOSED states are not supported in
  /// requests to create or update a journey. To cancel, pause, or resume a
  /// journey, use the <link
  /// linkend="apps-application-id-journeys-journey-id-state">Journey State</link>
  /// resource.
  final State? state;

  /// An array of time zone estimation methods, if any, to use for determining an
  /// <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-endpoints-endpoint-id.html">Endpoints</a>
  /// time zone if the Endpoint does not have a value for the Demographic.Timezone
  /// attribute.
  ///
  /// <ul>
  /// <li>
  /// PHONE_NUMBER - A time zone is determined based on the Endpoint.Address and
  /// Endpoint.Location.Country.
  /// </li>
  /// <li>
  /// POSTAL_CODE - A time zone is determined based on the
  /// Endpoint.Location.PostalCode and Endpoint.Location.Country.
  /// <note>
  /// POSTAL_CODE detection is only supported in the United States, United
  /// Kingdom, Australia, New Zealand, Canada, France, Italy, Spain, Germany and
  /// in regions where Amazon Pinpoint is available.
  /// </note></li>
  /// </ul>
  final List<TimezoneEstimationMethodsElement>? timezoneEstimationMethods;

  /// Specifies whether endpoints in quiet hours should enter a wait till the end
  /// of their quiet hours.
  final bool? waitForQuietTime;

  WriteJourneyRequest({
    required this.name,
    this.activities,
    this.closedDays,
    this.creationDate,
    this.journeyChannelSettings,
    this.lastModifiedDate,
    this.limits,
    this.localTime,
    this.openHours,
    this.quietTime,
    this.refreshFrequency,
    this.refreshOnSegmentUpdate,
    this.schedule,
    this.sendingSchedule,
    this.startActivity,
    this.startCondition,
    this.state,
    this.timezoneEstimationMethods,
    this.waitForQuietTime,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final activities = this.activities;
    final closedDays = this.closedDays;
    final creationDate = this.creationDate;
    final journeyChannelSettings = this.journeyChannelSettings;
    final lastModifiedDate = this.lastModifiedDate;
    final limits = this.limits;
    final localTime = this.localTime;
    final openHours = this.openHours;
    final quietTime = this.quietTime;
    final refreshFrequency = this.refreshFrequency;
    final refreshOnSegmentUpdate = this.refreshOnSegmentUpdate;
    final schedule = this.schedule;
    final sendingSchedule = this.sendingSchedule;
    final startActivity = this.startActivity;
    final startCondition = this.startCondition;
    final state = this.state;
    final timezoneEstimationMethods = this.timezoneEstimationMethods;
    final waitForQuietTime = this.waitForQuietTime;
    return {
      'Name': name,
      if (activities != null) 'Activities': activities,
      if (closedDays != null) 'ClosedDays': closedDays,
      if (creationDate != null) 'CreationDate': creationDate,
      if (journeyChannelSettings != null)
        'JourneyChannelSettings': journeyChannelSettings,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (limits != null) 'Limits': limits,
      if (localTime != null) 'LocalTime': localTime,
      if (openHours != null) 'OpenHours': openHours,
      if (quietTime != null) 'QuietTime': quietTime,
      if (refreshFrequency != null) 'RefreshFrequency': refreshFrequency,
      if (refreshOnSegmentUpdate != null)
        'RefreshOnSegmentUpdate': refreshOnSegmentUpdate,
      if (schedule != null) 'Schedule': schedule,
      if (sendingSchedule != null) 'SendingSchedule': sendingSchedule,
      if (startActivity != null) 'StartActivity': startActivity,
      if (startCondition != null) 'StartCondition': startCondition,
      if (state != null) 'State': state.toValue(),
      if (timezoneEstimationMethods != null)
        'TimezoneEstimationMethods':
            timezoneEstimationMethods.map((e) => e.toValue()).toList(),
      if (waitForQuietTime != null) 'WaitForQuietTime': waitForQuietTime,
    };
  }
}

/// Specifies the configuration, dimension, and other settings for a segment. A
/// WriteSegmentRequest object can include a Dimensions object or a
/// SegmentGroups object, but not both.
class WriteSegmentRequest {
  /// The criteria that define the dimensions for the segment.
  final SegmentDimensions? dimensions;

  /// The name of the segment.
  final String? name;

  /// The segment group to use and the dimensions to apply to the group's base
  /// segments in order to build the segment. A segment group can consist of zero
  /// or more base segments. Your request can include only one segment group.
  final SegmentGroupList? segmentGroups;

  /// <note>
  /// As of <b>22-05-2023</b> tags has been deprecated for update operations.
  /// After this date any value in tags is not processed and an error code is not
  /// returned. To manage tags we recommend using either <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/tags-resource-arn.html">Tags</a>
  /// in the <i>API Reference for Amazon Pinpoint</i>, <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/resourcegroupstaggingapi/index.html">resourcegroupstaggingapi</a>
  /// commands in the <i>AWS Command Line Interface Documentation</i> or <a
  /// href="https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/services/resourcegroupstaggingapi/package-summary.html">resourcegroupstaggingapi</a>
  /// in the <i>AWS SDK</i>.
  /// </note>
  /// (Deprecated) A string-to-string map of key-value pairs that defines the tags
  /// to associate with the segment. Each tag consists of a required tag key and
  /// an associated tag value.
  final Map<String, String>? tags;

  WriteSegmentRequest({
    this.dimensions,
    this.name,
    this.segmentGroups,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final name = this.name;
    final segmentGroups = this.segmentGroups;
    final tags = this.tags;
    return {
      if (dimensions != null) 'Dimensions': dimensions,
      if (name != null) 'Name': name,
      if (segmentGroups != null) 'SegmentGroups': segmentGroups,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Specifies the settings for a campaign treatment. A <i>treatment</i> is a
/// variation of a campaign that's used for A/B testing of a campaign.
class WriteTreatmentResource {
  /// The allocated percentage of users (segment members) to send the treatment
  /// to.
  final int sizePercent;

  /// The delivery configuration settings for sending the treatment through a
  /// custom channel. This object is required if the MessageConfiguration object
  /// for the treatment specifies a CustomMessage object.
  final CustomDeliveryConfiguration? customDeliveryConfiguration;

  /// The message configuration settings for the treatment.
  final MessageConfiguration? messageConfiguration;

  /// The schedule settings for the treatment.
  final Schedule? schedule;

  /// The message template to use for the treatment.
  final TemplateConfiguration? templateConfiguration;

  /// A custom description of the treatment.
  final String? treatmentDescription;

  /// A custom name for the treatment.
  final String? treatmentName;

  WriteTreatmentResource({
    required this.sizePercent,
    this.customDeliveryConfiguration,
    this.messageConfiguration,
    this.schedule,
    this.templateConfiguration,
    this.treatmentDescription,
    this.treatmentName,
  });

  Map<String, dynamic> toJson() {
    final sizePercent = this.sizePercent;
    final customDeliveryConfiguration = this.customDeliveryConfiguration;
    final messageConfiguration = this.messageConfiguration;
    final schedule = this.schedule;
    final templateConfiguration = this.templateConfiguration;
    final treatmentDescription = this.treatmentDescription;
    final treatmentName = this.treatmentName;
    return {
      'SizePercent': sizePercent,
      if (customDeliveryConfiguration != null)
        'CustomDeliveryConfiguration': customDeliveryConfiguration,
      if (messageConfiguration != null)
        'MessageConfiguration': messageConfiguration,
      if (schedule != null) 'Schedule': schedule,
      if (templateConfiguration != null)
        'TemplateConfiguration': templateConfiguration,
      if (treatmentDescription != null)
        'TreatmentDescription': treatmentDescription,
      if (treatmentName != null) 'TreatmentName': treatmentName,
    };
  }
}

enum EndpointTypesElement {
  push,
  gcm,
  apns,
  apnsSandbox,
  apnsVoip,
  apnsVoipSandbox,
  adm,
  sms,
  voice,
  email,
  baidu,
  custom,
  inApp,
}

extension EndpointTypesElementValueExtension on EndpointTypesElement {
  String toValue() {
    switch (this) {
      case EndpointTypesElement.push:
        return 'PUSH';
      case EndpointTypesElement.gcm:
        return 'GCM';
      case EndpointTypesElement.apns:
        return 'APNS';
      case EndpointTypesElement.apnsSandbox:
        return 'APNS_SANDBOX';
      case EndpointTypesElement.apnsVoip:
        return 'APNS_VOIP';
      case EndpointTypesElement.apnsVoipSandbox:
        return 'APNS_VOIP_SANDBOX';
      case EndpointTypesElement.adm:
        return 'ADM';
      case EndpointTypesElement.sms:
        return 'SMS';
      case EndpointTypesElement.voice:
        return 'VOICE';
      case EndpointTypesElement.email:
        return 'EMAIL';
      case EndpointTypesElement.baidu:
        return 'BAIDU';
      case EndpointTypesElement.custom:
        return 'CUSTOM';
      case EndpointTypesElement.inApp:
        return 'IN_APP';
    }
  }
}

extension EndpointTypesElementFromString on String {
  EndpointTypesElement toEndpointTypesElement() {
    switch (this) {
      case 'PUSH':
        return EndpointTypesElement.push;
      case 'GCM':
        return EndpointTypesElement.gcm;
      case 'APNS':
        return EndpointTypesElement.apns;
      case 'APNS_SANDBOX':
        return EndpointTypesElement.apnsSandbox;
      case 'APNS_VOIP':
        return EndpointTypesElement.apnsVoip;
      case 'APNS_VOIP_SANDBOX':
        return EndpointTypesElement.apnsVoipSandbox;
      case 'ADM':
        return EndpointTypesElement.adm;
      case 'SMS':
        return EndpointTypesElement.sms;
      case 'VOICE':
        return EndpointTypesElement.voice;
      case 'EMAIL':
        return EndpointTypesElement.email;
      case 'BAIDU':
        return EndpointTypesElement.baidu;
      case 'CUSTOM':
        return EndpointTypesElement.custom;
      case 'IN_APP':
        return EndpointTypesElement.inApp;
    }
    throw Exception('$this is not known in enum EndpointTypesElement');
  }
}

enum TimezoneEstimationMethodsElement {
  phoneNumber,
  postalCode,
}

extension TimezoneEstimationMethodsElementValueExtension
    on TimezoneEstimationMethodsElement {
  String toValue() {
    switch (this) {
      case TimezoneEstimationMethodsElement.phoneNumber:
        return 'PHONE_NUMBER';
      case TimezoneEstimationMethodsElement.postalCode:
        return 'POSTAL_CODE';
    }
  }
}

extension TimezoneEstimationMethodsElementFromString on String {
  TimezoneEstimationMethodsElement toTimezoneEstimationMethodsElement() {
    switch (this) {
      case 'PHONE_NUMBER':
        return TimezoneEstimationMethodsElement.phoneNumber;
      case 'POSTAL_CODE':
        return TimezoneEstimationMethodsElement.postalCode;
    }
    throw Exception(
        '$this is not known in enum TimezoneEstimationMethodsElement');
  }
}

enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

extension DayOfWeekValueExtension on DayOfWeek {
  String toValue() {
    switch (this) {
      case DayOfWeek.monday:
        return 'MONDAY';
      case DayOfWeek.tuesday:
        return 'TUESDAY';
      case DayOfWeek.wednesday:
        return 'WEDNESDAY';
      case DayOfWeek.thursday:
        return 'THURSDAY';
      case DayOfWeek.friday:
        return 'FRIDAY';
      case DayOfWeek.saturday:
        return 'SATURDAY';
      case DayOfWeek.sunday:
        return 'SUNDAY';
    }
  }
}

extension DayOfWeekFromString on String {
  DayOfWeek toDayOfWeek() {
    switch (this) {
      case 'MONDAY':
        return DayOfWeek.monday;
      case 'TUESDAY':
        return DayOfWeek.tuesday;
      case 'WEDNESDAY':
        return DayOfWeek.wednesday;
      case 'THURSDAY':
        return DayOfWeek.thursday;
      case 'FRIDAY':
        return DayOfWeek.friday;
      case 'SATURDAY':
        return DayOfWeek.saturday;
      case 'SUNDAY':
        return DayOfWeek.sunday;
    }
    throw Exception('$this is not known in enum DayOfWeek');
  }
}

/// Specifies the start and end time for OpenHours.
class OpenHoursRule {
  /// The end of the scheduled time, in ISO 8601 format, when the channel can't
  /// send messages.
  final String? endTime;

  /// The start of the scheduled time, in ISO 8601 format, when the channel can
  /// send messages.
  final String? startTime;

  OpenHoursRule({
    this.endTime,
    this.startTime,
  });

  factory OpenHoursRule.fromJson(Map<String, dynamic> json) {
    return OpenHoursRule(
      endTime: json['EndTime'] as String?,
      startTime: json['StartTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      if (endTime != null) 'EndTime': endTime,
      if (startTime != null) 'StartTime': startTime,
    };
  }
}

/// Specifies the times when message are allowed to be sent to endpoints.
class OpenHours {
  /// Specifies the schedule settings for the custom channel.
  final Map<DayOfWeek, List<OpenHoursRule>>? custom;

  /// Specifies the schedule settings for the email channel.
  final Map<DayOfWeek, List<OpenHoursRule>>? email;

  /// Specifies the schedule settings for the push channel.
  final Map<DayOfWeek, List<OpenHoursRule>>? push;

  /// Specifies the schedule settings for the SMS channel.
  final Map<DayOfWeek, List<OpenHoursRule>>? sms;

  /// Specifies the schedule settings for the voice channel.
  final Map<DayOfWeek, List<OpenHoursRule>>? voice;

  OpenHours({
    this.custom,
    this.email,
    this.push,
    this.sms,
    this.voice,
  });

  factory OpenHours.fromJson(Map<String, dynamic> json) {
    return OpenHours(
      custom: (json['CUSTOM'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k.toDayOfWeek(),
          (e as List)
              .whereNotNull()
              .map((e) => OpenHoursRule.fromJson(e as Map<String, dynamic>))
              .toList())),
      email: (json['EMAIL'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k.toDayOfWeek(),
          (e as List)
              .whereNotNull()
              .map((e) => OpenHoursRule.fromJson(e as Map<String, dynamic>))
              .toList())),
      push: (json['PUSH'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k.toDayOfWeek(),
          (e as List)
              .whereNotNull()
              .map((e) => OpenHoursRule.fromJson(e as Map<String, dynamic>))
              .toList())),
      sms: (json['SMS'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k.toDayOfWeek(),
          (e as List)
              .whereNotNull()
              .map((e) => OpenHoursRule.fromJson(e as Map<String, dynamic>))
              .toList())),
      voice: (json['VOICE'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k.toDayOfWeek(),
          (e as List)
              .whereNotNull()
              .map((e) => OpenHoursRule.fromJson(e as Map<String, dynamic>))
              .toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final custom = this.custom;
    final email = this.email;
    final push = this.push;
    final sms = this.sms;
    final voice = this.voice;
    return {
      if (custom != null)
        'CUSTOM': custom.map((k, e) => MapEntry(k.toValue(), e)),
      if (email != null) 'EMAIL': email.map((k, e) => MapEntry(k.toValue(), e)),
      if (push != null) 'PUSH': push.map((k, e) => MapEntry(k.toValue(), e)),
      if (sms != null) 'SMS': sms.map((k, e) => MapEntry(k.toValue(), e)),
      if (voice != null) 'VOICE': voice.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

/// Specifies the rule settings for when messages can't be sent.
class ClosedDaysRule {
  /// End DateTime ISO 8601 format
  final String? endDateTime;

  /// The name of the closed day rule.
  final String? name;

  /// Start DateTime ISO 8601 format
  final String? startDateTime;

  ClosedDaysRule({
    this.endDateTime,
    this.name,
    this.startDateTime,
  });

  factory ClosedDaysRule.fromJson(Map<String, dynamic> json) {
    return ClosedDaysRule(
      endDateTime: json['EndDateTime'] as String?,
      name: json['Name'] as String?,
      startDateTime: json['StartDateTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endDateTime = this.endDateTime;
    final name = this.name;
    final startDateTime = this.startDateTime;
    return {
      if (endDateTime != null) 'EndDateTime': endDateTime,
      if (name != null) 'Name': name,
      if (startDateTime != null) 'StartDateTime': startDateTime,
    };
  }
}

/// The time when a journey will not send messages. QuietTime should be
/// configured first and SendingSchedule should be set to true.
class ClosedDays {
  /// Rules for the Custom channel.
  final List<ClosedDaysRule>? custom;

  /// Rules for the Email channel.
  final List<ClosedDaysRule>? email;

  /// Rules for the Push channel.
  final List<ClosedDaysRule>? push;

  /// Rules for the SMS channel.
  final List<ClosedDaysRule>? sms;

  /// Rules for the Voice channel.
  final List<ClosedDaysRule>? voice;

  ClosedDays({
    this.custom,
    this.email,
    this.push,
    this.sms,
    this.voice,
  });

  factory ClosedDays.fromJson(Map<String, dynamic> json) {
    return ClosedDays(
      custom: (json['CUSTOM'] as List?)
          ?.whereNotNull()
          .map((e) => ClosedDaysRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      email: (json['EMAIL'] as List?)
          ?.whereNotNull()
          .map((e) => ClosedDaysRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      push: (json['PUSH'] as List?)
          ?.whereNotNull()
          .map((e) => ClosedDaysRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      sms: (json['SMS'] as List?)
          ?.whereNotNull()
          .map((e) => ClosedDaysRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      voice: (json['VOICE'] as List?)
          ?.whereNotNull()
          .map((e) => ClosedDaysRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final custom = this.custom;
    final email = this.email;
    final push = this.push;
    final sms = this.sms;
    final voice = this.voice;
    return {
      if (custom != null) 'CUSTOM': custom,
      if (email != null) 'EMAIL': email,
      if (push != null) 'PUSH': push,
      if (sms != null) 'SMS': sms,
      if (voice != null) 'VOICE': voice,
    };
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class MethodNotAllowedException extends _s.GenericAwsException {
  MethodNotAllowedException({String? type, String? message})
      : super(type: type, code: 'MethodNotAllowedException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class PayloadTooLargeException extends _s.GenericAwsException {
  PayloadTooLargeException({String? type, String? message})
      : super(type: type, code: 'PayloadTooLargeException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'MethodNotAllowedException': (type, message) =>
      MethodNotAllowedException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'PayloadTooLargeException': (type, message) =>
      PayloadTooLargeException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
};

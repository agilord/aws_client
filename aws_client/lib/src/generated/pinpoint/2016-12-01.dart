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

part '2016-12-01.g.dart';

/// Doc Engage API - Amazon Pinpoint API
class Pinpoint {
  final _s.RestJsonProtocol _protocol;
  Pinpoint({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'pinpoint',
            signingName: 'mobiletargeting',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required CreateApplicationRequest createApplicationRequest,
  }) async {
    ArgumentError.checkNotNull(
        createApplicationRequest, 'createApplicationRequest');
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
    @_s.required String applicationId,
    @_s.required WriteCampaignRequest writeCampaignRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(writeCampaignRequest, 'writeCampaignRequest');
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
    @_s.required EmailTemplateRequest emailTemplateRequest,
    @_s.required String templateName,
  }) async {
    ArgumentError.checkNotNull(emailTemplateRequest, 'emailTemplateRequest');
    ArgumentError.checkNotNull(templateName, 'templateName');
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
    @_s.required String applicationId,
    @_s.required ExportJobRequest exportJobRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(exportJobRequest, 'exportJobRequest');
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
    @_s.required String applicationId,
    @_s.required ImportJobRequest importJobRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(importJobRequest, 'importJobRequest');
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
    @_s.required String applicationId,
    @_s.required WriteJourneyRequest writeJourneyRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(writeJourneyRequest, 'writeJourneyRequest');
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
    @_s.required
        PushNotificationTemplateRequest pushNotificationTemplateRequest,
    @_s.required String templateName,
  }) async {
    ArgumentError.checkNotNull(
        pushNotificationTemplateRequest, 'pushNotificationTemplateRequest');
    ArgumentError.checkNotNull(templateName, 'templateName');
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
    @_s.required CreateRecommenderConfiguration createRecommenderConfiguration,
  }) async {
    ArgumentError.checkNotNull(
        createRecommenderConfiguration, 'createRecommenderConfiguration');
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
    @_s.required String applicationId,
    @_s.required WriteSegmentRequest writeSegmentRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(writeSegmentRequest, 'writeSegmentRequest');
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
    @_s.required SMSTemplateRequest sMSTemplateRequest,
    @_s.required String templateName,
  }) async {
    ArgumentError.checkNotNull(sMSTemplateRequest, 'sMSTemplateRequest');
    ArgumentError.checkNotNull(templateName, 'templateName');
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
    @_s.required String templateName,
    @_s.required VoiceTemplateRequest voiceTemplateRequest,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
    ArgumentError.checkNotNull(voiceTemplateRequest, 'voiceTemplateRequest');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
    @_s.required String campaignId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(campaignId, 'campaignId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String templateName,
    String version,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
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
  /// The unique identifier for the endpoint.
  Future<DeleteEndpointResponse> deleteEndpoint({
    @_s.required String applicationId,
    @_s.required String endpointId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(endpointId, 'endpointId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
    @_s.required String journeyId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(journeyId, 'journeyId');
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
    @_s.required String templateName,
    String version,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
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
    @_s.required String recommenderId,
  }) async {
    ArgumentError.checkNotNull(recommenderId, 'recommenderId');
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
    @_s.required String applicationId,
    @_s.required String segmentId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(segmentId, 'segmentId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String templateName,
    String version,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
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
    @_s.required String applicationId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(userId, 'userId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String templateName,
    String version,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
    @_s.required String kpiName,
    DateTime endTime,
    String nextToken,
    String pageSize,
    DateTime startTime,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(kpiName, 'kpiName');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    String pageSize,
    String token,
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
    @_s.required String campaignId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(campaignId, 'campaignId');
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
    @_s.required String applicationId,
    @_s.required String campaignId,
    String pageSize,
    String token,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(campaignId, 'campaignId');
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
    @_s.required String applicationId,
    @_s.required String campaignId,
    @_s.required String kpiName,
    DateTime endTime,
    String nextToken,
    String pageSize,
    DateTime startTime,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(campaignId, 'campaignId');
    ArgumentError.checkNotNull(kpiName, 'kpiName');
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
    @_s.required String applicationId,
    @_s.required String campaignId,
    @_s.required String version,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(campaignId, 'campaignId');
    ArgumentError.checkNotNull(version, 'version');
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
    @_s.required String applicationId,
    @_s.required String campaignId,
    String pageSize,
    String token,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(campaignId, 'campaignId');
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
    @_s.required String applicationId,
    String pageSize,
    String token,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String templateName,
    String version,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
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
  /// The unique identifier for the endpoint.
  Future<GetEndpointResponse> getEndpoint({
    @_s.required String applicationId,
    @_s.required String endpointId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(endpointId, 'endpointId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(jobId, 'jobId');
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
    @_s.required String applicationId,
    String pageSize,
    String token,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(jobId, 'jobId');
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
    @_s.required String applicationId,
    String pageSize,
    String token,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
    @_s.required String journeyId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(journeyId, 'journeyId');
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
    @_s.required String applicationId,
    @_s.required String journeyId,
    @_s.required String kpiName,
    DateTime endTime,
    String nextToken,
    String pageSize,
    DateTime startTime,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(journeyId, 'journeyId');
    ArgumentError.checkNotNull(kpiName, 'kpiName');
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
  /// The  string that specifies which page of results to return in a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  Future<GetJourneyExecutionActivityMetricsResponse>
      getJourneyExecutionActivityMetrics({
    @_s.required String applicationId,
    @_s.required String journeyActivityId,
    @_s.required String journeyId,
    String nextToken,
    String pageSize,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(journeyActivityId, 'journeyActivityId');
    ArgumentError.checkNotNull(journeyId, 'journeyId');
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
  /// The  string that specifies which page of results to return in a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of items to include in each page of a paginated
  /// response. This parameter is not supported for application, campaign, and
  /// journey metrics.
  Future<GetJourneyExecutionMetricsResponse> getJourneyExecutionMetrics({
    @_s.required String applicationId,
    @_s.required String journeyId,
    String nextToken,
    String pageSize,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(journeyId, 'journeyId');
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
    @_s.required String templateName,
    String version,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
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
    @_s.required String recommenderId,
  }) async {
    ArgumentError.checkNotNull(recommenderId, 'recommenderId');
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
    String pageSize,
    String token,
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
    @_s.required String applicationId,
    @_s.required String segmentId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(segmentId, 'segmentId');
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
    @_s.required String applicationId,
    @_s.required String segmentId,
    String pageSize,
    String token,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(segmentId, 'segmentId');
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
    @_s.required String applicationId,
    @_s.required String segmentId,
    String pageSize,
    String token,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(segmentId, 'segmentId');
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
    @_s.required String applicationId,
    @_s.required String segmentId,
    @_s.required String version,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(segmentId, 'segmentId');
    ArgumentError.checkNotNull(version, 'version');
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
    @_s.required String applicationId,
    @_s.required String segmentId,
    String pageSize,
    String token,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(segmentId, 'segmentId');
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
    @_s.required String applicationId,
    String pageSize,
    String token,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String templateName,
    String version,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
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
    @_s.required String applicationId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(userId, 'userId');
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
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String templateName,
    String version,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
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
    @_s.required String applicationId,
    String pageSize,
    String token,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
    @_s.required String templateName,
    @_s.required String templateType,
    String nextToken,
    String pageSize,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
    ArgumentError.checkNotNull(templateType, 'templateType');
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
    String nextToken,
    String pageSize,
    String prefix,
    String templateType,
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
    @_s.required NumberValidateRequest numberValidateRequest,
  }) async {
    ArgumentError.checkNotNull(numberValidateRequest, 'numberValidateRequest');
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
    @_s.required String applicationId,
    @_s.required WriteEventStream writeEventStream,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(writeEventStream, 'writeEventStream');
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
    @_s.required String applicationId,
    @_s.required EventsRequest eventsRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(eventsRequest, 'eventsRequest');
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

  /// Removes one or more attributes, of the same attribute type, from all the
  /// endpoints that are associated with an application.
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
    @_s.required String applicationId,
    @_s.required String attributeType,
    @_s.required UpdateAttributesRequest updateAttributesRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(attributeType, 'attributeType');
    ArgumentError.checkNotNull(
        updateAttributesRequest, 'updateAttributesRequest');
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
    @_s.required String applicationId,
    @_s.required MessageRequest messageRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(messageRequest, 'messageRequest');
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
    @_s.required String applicationId,
    @_s.required SendUsersMessageRequest sendUsersMessageRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(
        sendUsersMessageRequest, 'sendUsersMessageRequest');
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
    @_s.required String resourceArn,
    @_s.required TagsModel tagsModel,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagsModel, 'tagsModel');
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
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
    @_s.required ADMChannelRequest aDMChannelRequest,
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(aDMChannelRequest, 'aDMChannelRequest');
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required APNSChannelRequest aPNSChannelRequest,
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(aPNSChannelRequest, 'aPNSChannelRequest');
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required APNSSandboxChannelRequest aPNSSandboxChannelRequest,
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(
        aPNSSandboxChannelRequest, 'aPNSSandboxChannelRequest');
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required APNSVoipChannelRequest aPNSVoipChannelRequest,
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(
        aPNSVoipChannelRequest, 'aPNSVoipChannelRequest');
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required APNSVoipSandboxChannelRequest aPNSVoipSandboxChannelRequest,
    @_s.required String applicationId,
  }) async {
    ArgumentError.checkNotNull(
        aPNSVoipSandboxChannelRequest, 'aPNSVoipSandboxChannelRequest');
    ArgumentError.checkNotNull(applicationId, 'applicationId');
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
    @_s.required String applicationId,
    @_s.required
        WriteApplicationSettingsRequest writeApplicationSettingsRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(
        writeApplicationSettingsRequest, 'writeApplicationSettingsRequest');
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
    @_s.required String applicationId,
    @_s.required BaiduChannelRequest baiduChannelRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(baiduChannelRequest, 'baiduChannelRequest');
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
    @_s.required String applicationId,
    @_s.required String campaignId,
    @_s.required WriteCampaignRequest writeCampaignRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(campaignId, 'campaignId');
    ArgumentError.checkNotNull(writeCampaignRequest, 'writeCampaignRequest');
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
    @_s.required String applicationId,
    @_s.required EmailChannelRequest emailChannelRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(emailChannelRequest, 'emailChannelRequest');
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
    @_s.required EmailTemplateRequest emailTemplateRequest,
    @_s.required String templateName,
    bool createNewVersion,
    String version,
  }) async {
    ArgumentError.checkNotNull(emailTemplateRequest, 'emailTemplateRequest');
    ArgumentError.checkNotNull(templateName, 'templateName');
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
  /// The unique identifier for the endpoint.
  Future<UpdateEndpointResponse> updateEndpoint({
    @_s.required String applicationId,
    @_s.required String endpointId,
    @_s.required EndpointRequest endpointRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(endpointId, 'endpointId');
    ArgumentError.checkNotNull(endpointRequest, 'endpointRequest');
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
    @_s.required String applicationId,
    @_s.required EndpointBatchRequest endpointBatchRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(endpointBatchRequest, 'endpointBatchRequest');
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
    @_s.required String applicationId,
    @_s.required GCMChannelRequest gCMChannelRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(gCMChannelRequest, 'gCMChannelRequest');
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
    @_s.required String applicationId,
    @_s.required String journeyId,
    @_s.required WriteJourneyRequest writeJourneyRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(journeyId, 'journeyId');
    ArgumentError.checkNotNull(writeJourneyRequest, 'writeJourneyRequest');
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
    @_s.required String applicationId,
    @_s.required String journeyId,
    @_s.required JourneyStateRequest journeyStateRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(journeyId, 'journeyId');
    ArgumentError.checkNotNull(journeyStateRequest, 'journeyStateRequest');
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
    @_s.required
        PushNotificationTemplateRequest pushNotificationTemplateRequest,
    @_s.required String templateName,
    bool createNewVersion,
    String version,
  }) async {
    ArgumentError.checkNotNull(
        pushNotificationTemplateRequest, 'pushNotificationTemplateRequest');
    ArgumentError.checkNotNull(templateName, 'templateName');
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
    @_s.required String recommenderId,
    @_s.required UpdateRecommenderConfiguration updateRecommenderConfiguration,
  }) async {
    ArgumentError.checkNotNull(recommenderId, 'recommenderId');
    ArgumentError.checkNotNull(
        updateRecommenderConfiguration, 'updateRecommenderConfiguration');
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
    @_s.required String applicationId,
    @_s.required String segmentId,
    @_s.required WriteSegmentRequest writeSegmentRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(segmentId, 'segmentId');
    ArgumentError.checkNotNull(writeSegmentRequest, 'writeSegmentRequest');
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
    @_s.required String applicationId,
    @_s.required SMSChannelRequest sMSChannelRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(sMSChannelRequest, 'sMSChannelRequest');
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
    @_s.required SMSTemplateRequest sMSTemplateRequest,
    @_s.required String templateName,
    bool createNewVersion,
    String version,
  }) async {
    ArgumentError.checkNotNull(sMSTemplateRequest, 'sMSTemplateRequest');
    ArgumentError.checkNotNull(templateName, 'templateName');
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
    @_s.required TemplateActiveVersionRequest templateActiveVersionRequest,
    @_s.required String templateName,
    @_s.required String templateType,
  }) async {
    ArgumentError.checkNotNull(
        templateActiveVersionRequest, 'templateActiveVersionRequest');
    ArgumentError.checkNotNull(templateName, 'templateName');
    ArgumentError.checkNotNull(templateType, 'templateType');
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
    @_s.required String applicationId,
    @_s.required VoiceChannelRequest voiceChannelRequest,
  }) async {
    ArgumentError.checkNotNull(applicationId, 'applicationId');
    ArgumentError.checkNotNull(voiceChannelRequest, 'voiceChannelRequest');
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
    @_s.required String templateName,
    @_s.required VoiceTemplateRequest voiceTemplateRequest,
    bool createNewVersion,
    String version,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
    ArgumentError.checkNotNull(voiceTemplateRequest, 'voiceTemplateRequest');
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
}

/// Specifies the status and settings of the ADM (Amazon Device Messaging)
/// channel for an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ADMChannelRequest {
  /// The Client ID that you received from Amazon to send messages by using ADM.
  @_s.JsonKey(name: 'ClientId')
  final String clientId;

  /// The Client Secret that you received from Amazon to send messages by using
  /// ADM.
  @_s.JsonKey(name: 'ClientSecret')
  final String clientSecret;

  /// Specifies whether to enable the ADM channel for the application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  ADMChannelRequest({
    @_s.required this.clientId,
    @_s.required this.clientSecret,
    this.enabled,
  });
  Map<String, dynamic> toJson() => _$ADMChannelRequestToJson(this);
}

/// Provides information about the status and settings of the ADM (Amazon Device
/// Messaging) channel for an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ADMChannelResponse {
  /// The type of messaging or notification platform for the channel. For the ADM
  /// channel, this value is ADM.
  @_s.JsonKey(name: 'Platform')
  final String platform;

  /// The unique identifier for the application that the ADM channel applies to.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The date and time when the ADM channel was enabled.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// Specifies whether the ADM channel is enabled for the application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// (Not used) This property is retained only for backward compatibility.
  @_s.JsonKey(name: 'HasCredential')
  final bool hasCredential;

  /// (Deprecated) An identifier for the ADM channel. This property is retained
  /// only for backward compatibility.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Specifies whether the ADM channel is archived.
  @_s.JsonKey(name: 'IsArchived')
  final bool isArchived;

  /// The user who last modified the ADM channel.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The date and time when the ADM channel was last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The current version of the ADM channel.
  @_s.JsonKey(name: 'Version')
  final int version;

  ADMChannelResponse({
    @_s.required this.platform,
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
  factory ADMChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$ADMChannelResponseFromJson(json);
}

/// Specifies the settings for a one-time message that's sent directly to an
/// endpoint through the ADM (Amazon Device Messaging) channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @_s.JsonKey(name: 'Action')
  final Action action;

  /// The body of the notification message.
  @_s.JsonKey(name: 'Body')
  final String body;

  /// An arbitrary string that indicates that multiple messages are logically the
  /// same and that Amazon Device Messaging (ADM) can drop previously enqueued
  /// messages in favor of this message.
  @_s.JsonKey(name: 'ConsolidationKey')
  final String consolidationKey;

  /// The JSON data payload to use for the push notification, if the notification
  /// is a silent push notification. This payload is added to the
  /// data.pinpoint.jsonBody object of the notification.
  @_s.JsonKey(name: 'Data')
  final Map<String, String> data;

  /// The amount of time, in seconds, that ADM should store the message if the
  /// recipient's device is offline. Amazon Pinpoint specifies this value in the
  /// expiresAfter parameter when it sends the notification message to ADM.
  @_s.JsonKey(name: 'ExpiresAfter')
  final String expiresAfter;

  /// The icon image name of the asset saved in your app.
  @_s.JsonKey(name: 'IconReference')
  final String iconReference;

  /// The URL of the large icon image to display in the content view of the push
  /// notification.
  @_s.JsonKey(name: 'ImageIconUrl')
  final String imageIconUrl;

  /// The URL of an image to display in the push notification.
  @_s.JsonKey(name: 'ImageUrl')
  final String imageUrl;

  /// The base64-encoded, MD5 checksum of the value specified by the Data
  /// property. ADM uses the MD5 value to verify the integrity of the data.
  @_s.JsonKey(name: 'MD5')
  final String md5;

  /// The raw, JSON-formatted string to use as the payload for the notification
  /// message. If specified, this value overrides all other content for the
  /// message.
  @_s.JsonKey(name: 'RawContent')
  final String rawContent;

  /// Specifies whether the notification is a silent push notification, which is a
  /// push notification that doesn't display on a recipient's device. Silent push
  /// notifications can be used for cases such as updating an app's configuration
  /// or supporting phone home functionality.
  @_s.JsonKey(name: 'SilentPush')
  final bool silentPush;

  /// The URL of the small icon image to display in the status bar and the content
  /// view of the push notification.
  @_s.JsonKey(name: 'SmallImageIconUrl')
  final String smallImageIconUrl;

  /// The sound to play when the recipient receives the push notification. You can
  /// use the default stream or specify the file name of a sound resource that's
  /// bundled in your app. On an Android platform, the sound file must reside in
  /// /res/raw/.
  @_s.JsonKey(name: 'Sound')
  final String sound;

  /// The default message variables to use in the notification message. You can
  /// override the default variables with individual address variables.
  @_s.JsonKey(name: 'Substitutions')
  final Map<String, List<String>> substitutions;

  /// The title to display above the notification message on the recipient's
  /// device.
  @_s.JsonKey(name: 'Title')
  final String title;

  /// The URL to open in the recipient's default mobile browser, if a recipient
  /// taps the push notification and the value of the Action property is URL.
  @_s.JsonKey(name: 'Url')
  final String url;

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
  Map<String, dynamic> toJson() => _$ADMMessageToJson(this);
}

/// Specifies the status and settings of the APNs (Apple Push Notification
/// service) channel for an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class APNSChannelRequest {
  /// The bundle identifier that's assigned to your iOS app. This identifier is
  /// used for APNs tokens.
  @_s.JsonKey(name: 'BundleId')
  final String bundleId;

  /// The APNs client certificate that you received from Apple, if you want Amazon
  /// Pinpoint to communicate with APNs by using an APNs certificate.
  @_s.JsonKey(name: 'Certificate')
  final String certificate;

  /// The default authentication method that you want Amazon Pinpoint to use when
  /// authenticating with APNs, key or certificate.
  @_s.JsonKey(name: 'DefaultAuthenticationMethod')
  final String defaultAuthenticationMethod;

  /// Specifies whether to enable the APNs channel for the application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The private key for the APNs client certificate that you want Amazon
  /// Pinpoint to use to communicate with APNs.
  @_s.JsonKey(name: 'PrivateKey')
  final String privateKey;

  /// The identifier that's assigned to your Apple developer account team. This
  /// identifier is used for APNs tokens.
  @_s.JsonKey(name: 'TeamId')
  final String teamId;

  /// The authentication key to use for APNs tokens.
  @_s.JsonKey(name: 'TokenKey')
  final String tokenKey;

  /// The key identifier that's assigned to your APNs signing key, if you want
  /// Amazon Pinpoint to communicate with APNs by using APNs tokens.
  @_s.JsonKey(name: 'TokenKeyId')
  final String tokenKeyId;

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
  Map<String, dynamic> toJson() => _$APNSChannelRequestToJson(this);
}

/// Provides information about the status and settings of the APNs (Apple Push
/// Notification service) channel for an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class APNSChannelResponse {
  /// The type of messaging or notification platform for the channel. For the APNs
  /// channel, this value is APNS.
  @_s.JsonKey(name: 'Platform')
  final String platform;

  /// The unique identifier for the application that the APNs channel applies to.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The date and time when the APNs channel was enabled.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The default authentication method that Amazon Pinpoint uses to authenticate
  /// with APNs for this channel, key or certificate.
  @_s.JsonKey(name: 'DefaultAuthenticationMethod')
  final String defaultAuthenticationMethod;

  /// Specifies whether the APNs channel is enabled for the application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// (Not used) This property is retained only for backward compatibility.
  @_s.JsonKey(name: 'HasCredential')
  final bool hasCredential;

  /// Specifies whether the APNs channel is configured to communicate with APNs by
  /// using APNs tokens. To provide an authentication key for APNs tokens, set the
  /// TokenKey property of the channel.
  @_s.JsonKey(name: 'HasTokenKey')
  final bool hasTokenKey;

  /// (Deprecated) An identifier for the APNs channel. This property is retained
  /// only for backward compatibility.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Specifies whether the APNs channel is archived.
  @_s.JsonKey(name: 'IsArchived')
  final bool isArchived;

  /// The user who last modified the APNs channel.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The date and time when the APNs channel was last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The current version of the APNs channel.
  @_s.JsonKey(name: 'Version')
  final int version;

  APNSChannelResponse({
    @_s.required this.platform,
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
  factory APNSChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$APNSChannelResponseFromJson(json);
}

/// Specifies the settings for a one-time message that's sent directly to an
/// endpoint through the APNs (Apple Push Notification service) channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @_s.JsonKey(name: 'APNSPushType')
  final String aPNSPushType;

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
  @_s.JsonKey(name: 'Action')
  final Action action;

  /// The key that indicates whether and how to modify the badge of your app's
  /// icon when the recipient receives the push notification. If this key isn't
  /// included in the dictionary, the badge doesn't change. To remove the badge,
  /// set this value to 0.
  @_s.JsonKey(name: 'Badge')
  final int badge;

  /// The body of the notification message.
  @_s.JsonKey(name: 'Body')
  final String body;

  /// The key that indicates the notification type for the push notification. This
  /// key is a value that's defined by the identifier property of one of your
  /// app's registered categories.
  @_s.JsonKey(name: 'Category')
  final String category;

  /// An arbitrary identifier that, if assigned to multiple messages, APNs uses to
  /// coalesce the messages into a single push notification instead of delivering
  /// each message individually. This value can't exceed 64 bytes.
  ///
  /// Amazon Pinpoint specifies this value in the apns-collapse-id request header
  /// when it sends the notification message to APNs.
  @_s.JsonKey(name: 'CollapseId')
  final String collapseId;

  /// The JSON payload to use for a silent push notification. This payload is
  /// added to the data.pinpoint.jsonBody object of the notification.
  @_s.JsonKey(name: 'Data')
  final Map<String, String> data;

  /// The URL of an image or video to display in the push notification.
  @_s.JsonKey(name: 'MediaUrl')
  final String mediaUrl;

  /// The authentication method that you want Amazon Pinpoint to use when
  /// authenticating with APNs, CERTIFICATE or TOKEN.
  @_s.JsonKey(name: 'PreferredAuthenticationMethod')
  final String preferredAuthenticationMethod;

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
  @_s.JsonKey(name: 'Priority')
  final String priority;

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
  @_s.JsonKey(name: 'RawContent')
  final String rawContent;

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
  @_s.JsonKey(name: 'SilentPush')
  final bool silentPush;

  /// The key for the sound to play when the recipient receives the push
  /// notification. The value for this key is the name of a sound file in your
  /// app's main bundle or the Library/Sounds folder in your app's data container.
  /// If the sound file can't be found or you specify default for the value, the
  /// system plays the default alert sound.
  @_s.JsonKey(name: 'Sound')
  final String sound;

  /// The default message variables to use in the notification message. You can
  /// override these default variables with individual address variables.
  @_s.JsonKey(name: 'Substitutions')
  final Map<String, List<String>> substitutions;

  /// The key that represents your app-specific identifier for grouping
  /// notifications. If you provide a Notification Content app extension, you can
  /// use this value to group your notifications together.
  @_s.JsonKey(name: 'ThreadId')
  final String threadId;

  /// The amount of time, in seconds, that APNs should store and attempt to
  /// deliver the push notification, if the service is unable to deliver the
  /// notification the first time. If this value is 0, APNs treats the
  /// notification as if it expires immediately and the service doesn't store or
  /// try to deliver the notification again.
  ///
  /// Amazon Pinpoint specifies this value in the apns-expiration request header
  /// when it sends the notification message to APNs.
  @_s.JsonKey(name: 'TimeToLive')
  final int timeToLive;

  /// The title to display above the notification message on the recipient's
  /// device.
  @_s.JsonKey(name: 'Title')
  final String title;

  /// The URL to open in the recipient's default mobile browser, if a recipient
  /// taps the push notification and the value of the Action property is URL.
  @_s.JsonKey(name: 'Url')
  final String url;

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
  Map<String, dynamic> toJson() => _$APNSMessageToJson(this);
}

/// Specifies channel-specific content and settings for a message template that
/// can be used in push notifications that are sent through the APNs (Apple Push
/// Notification service) channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'Action')
  final Action action;

  /// The message body to use in push notifications that are based on the message
  /// template.
  @_s.JsonKey(name: 'Body')
  final String body;

  /// The URL of an image or video to display in push notifications that are based
  /// on the message template.
  @_s.JsonKey(name: 'MediaUrl')
  final String mediaUrl;

  /// The raw, JSON-formatted string to use as the payload for push notifications
  /// that are based on the message template. If specified, this value overrides
  /// all other content for the message template.
  @_s.JsonKey(name: 'RawContent')
  final String rawContent;

  /// The key for the sound to play when the recipient receives a push
  /// notification that's based on the message template. The value for this key is
  /// the name of a sound file in your app's main bundle or the Library/Sounds
  /// folder in your app's data container. If the sound file can't be found or you
  /// specify default for the value, the system plays the default alert sound.
  @_s.JsonKey(name: 'Sound')
  final String sound;

  /// The title to use in push notifications that are based on the message
  /// template. This title appears above the notification message on a recipient's
  /// device.
  @_s.JsonKey(name: 'Title')
  final String title;

  /// The URL to open in the recipient's default mobile browser, if a recipient
  /// taps a push notification that's based on the message template and the value
  /// of the Action property is URL.
  @_s.JsonKey(name: 'Url')
  final String url;

  APNSPushNotificationTemplate({
    this.action,
    this.body,
    this.mediaUrl,
    this.rawContent,
    this.sound,
    this.title,
    this.url,
  });
  factory APNSPushNotificationTemplate.fromJson(Map<String, dynamic> json) =>
      _$APNSPushNotificationTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$APNSPushNotificationTemplateToJson(this);
}

/// Specifies the status and settings of the APNs (Apple Push Notification
/// service) sandbox channel for an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class APNSSandboxChannelRequest {
  /// The bundle identifier that's assigned to your iOS app. This identifier is
  /// used for APNs tokens.
  @_s.JsonKey(name: 'BundleId')
  final String bundleId;

  /// The APNs client certificate that you received from Apple, if you want Amazon
  /// Pinpoint to communicate with the APNs sandbox environment by using an APNs
  /// certificate.
  @_s.JsonKey(name: 'Certificate')
  final String certificate;

  /// The default authentication method that you want Amazon Pinpoint to use when
  /// authenticating with the APNs sandbox environment, key or certificate.
  @_s.JsonKey(name: 'DefaultAuthenticationMethod')
  final String defaultAuthenticationMethod;

  /// Specifies whether to enable the APNs sandbox channel for the application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The private key for the APNs client certificate that you want Amazon
  /// Pinpoint to use to communicate with the APNs sandbox environment.
  @_s.JsonKey(name: 'PrivateKey')
  final String privateKey;

  /// The identifier that's assigned to your Apple developer account team. This
  /// identifier is used for APNs tokens.
  @_s.JsonKey(name: 'TeamId')
  final String teamId;

  /// The authentication key to use for APNs tokens.
  @_s.JsonKey(name: 'TokenKey')
  final String tokenKey;

  /// The key identifier that's assigned to your APNs signing key, if you want
  /// Amazon Pinpoint to communicate with the APNs sandbox environment by using
  /// APNs tokens.
  @_s.JsonKey(name: 'TokenKeyId')
  final String tokenKeyId;

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
  Map<String, dynamic> toJson() => _$APNSSandboxChannelRequestToJson(this);
}

/// Provides information about the status and settings of the APNs (Apple Push
/// Notification service) sandbox channel for an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class APNSSandboxChannelResponse {
  /// The type of messaging or notification platform for the channel. For the APNs
  /// sandbox channel, this value is APNS_SANDBOX.
  @_s.JsonKey(name: 'Platform')
  final String platform;

  /// The unique identifier for the application that the APNs sandbox channel
  /// applies to.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The date and time when the APNs sandbox channel was enabled.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The default authentication method that Amazon Pinpoint uses to authenticate
  /// with the APNs sandbox environment for this channel, key or certificate.
  @_s.JsonKey(name: 'DefaultAuthenticationMethod')
  final String defaultAuthenticationMethod;

  /// Specifies whether the APNs sandbox channel is enabled for the application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// (Not used) This property is retained only for backward compatibility.
  @_s.JsonKey(name: 'HasCredential')
  final bool hasCredential;

  /// Specifies whether the APNs sandbox channel is configured to communicate with
  /// APNs by using APNs tokens. To provide an authentication key for APNs tokens,
  /// set the TokenKey property of the channel.
  @_s.JsonKey(name: 'HasTokenKey')
  final bool hasTokenKey;

  /// (Deprecated) An identifier for the APNs sandbox channel. This property is
  /// retained only for backward compatibility.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Specifies whether the APNs sandbox channel is archived.
  @_s.JsonKey(name: 'IsArchived')
  final bool isArchived;

  /// The user who last modified the APNs sandbox channel.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The date and time when the APNs sandbox channel was last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The current version of the APNs sandbox channel.
  @_s.JsonKey(name: 'Version')
  final int version;

  APNSSandboxChannelResponse({
    @_s.required this.platform,
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
  factory APNSSandboxChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$APNSSandboxChannelResponseFromJson(json);
}

/// Specifies the status and settings of the APNs (Apple Push Notification
/// service) VoIP channel for an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class APNSVoipChannelRequest {
  /// The bundle identifier that's assigned to your iOS app. This identifier is
  /// used for APNs tokens.
  @_s.JsonKey(name: 'BundleId')
  final String bundleId;

  /// The APNs client certificate that you received from Apple, if you want Amazon
  /// Pinpoint to communicate with APNs by using an APNs certificate.
  @_s.JsonKey(name: 'Certificate')
  final String certificate;

  /// The default authentication method that you want Amazon Pinpoint to use when
  /// authenticating with APNs, key or certificate.
  @_s.JsonKey(name: 'DefaultAuthenticationMethod')
  final String defaultAuthenticationMethod;

  /// Specifies whether to enable the APNs VoIP channel for the application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The private key for the APNs client certificate that you want Amazon
  /// Pinpoint to use to communicate with APNs.
  @_s.JsonKey(name: 'PrivateKey')
  final String privateKey;

  /// The identifier that's assigned to your Apple developer account team. This
  /// identifier is used for APNs tokens.
  @_s.JsonKey(name: 'TeamId')
  final String teamId;

  /// The authentication key to use for APNs tokens.
  @_s.JsonKey(name: 'TokenKey')
  final String tokenKey;

  /// The key identifier that's assigned to your APNs signing key, if you want
  /// Amazon Pinpoint to communicate with APNs by using APNs tokens.
  @_s.JsonKey(name: 'TokenKeyId')
  final String tokenKeyId;

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
  Map<String, dynamic> toJson() => _$APNSVoipChannelRequestToJson(this);
}

/// Provides information about the status and settings of the APNs (Apple Push
/// Notification service) VoIP channel for an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class APNSVoipChannelResponse {
  /// The type of messaging or notification platform for the channel. For the APNs
  /// VoIP channel, this value is APNS_VOIP.
  @_s.JsonKey(name: 'Platform')
  final String platform;

  /// The unique identifier for the application that the APNs VoIP channel applies
  /// to.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The date and time when the APNs VoIP channel was enabled.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The default authentication method that Amazon Pinpoint uses to authenticate
  /// with APNs for this channel, key or certificate.
  @_s.JsonKey(name: 'DefaultAuthenticationMethod')
  final String defaultAuthenticationMethod;

  /// Specifies whether the APNs VoIP channel is enabled for the application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// (Not used) This property is retained only for backward compatibility.
  @_s.JsonKey(name: 'HasCredential')
  final bool hasCredential;

  /// Specifies whether the APNs VoIP channel is configured to communicate with
  /// APNs by using APNs tokens. To provide an authentication key for APNs tokens,
  /// set the TokenKey property of the channel.
  @_s.JsonKey(name: 'HasTokenKey')
  final bool hasTokenKey;

  /// (Deprecated) An identifier for the APNs VoIP channel. This property is
  /// retained only for backward compatibility.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Specifies whether the APNs VoIP channel is archived.
  @_s.JsonKey(name: 'IsArchived')
  final bool isArchived;

  /// The user who last modified the APNs VoIP channel.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The date and time when the APNs VoIP channel was last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The current version of the APNs VoIP channel.
  @_s.JsonKey(name: 'Version')
  final int version;

  APNSVoipChannelResponse({
    @_s.required this.platform,
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
  factory APNSVoipChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$APNSVoipChannelResponseFromJson(json);
}

/// Specifies the status and settings of the APNs (Apple Push Notification
/// service) VoIP sandbox channel for an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class APNSVoipSandboxChannelRequest {
  /// The bundle identifier that's assigned to your iOS app. This identifier is
  /// used for APNs tokens.
  @_s.JsonKey(name: 'BundleId')
  final String bundleId;

  /// The APNs client certificate that you received from Apple, if you want Amazon
  /// Pinpoint to communicate with the APNs sandbox environment by using an APNs
  /// certificate.
  @_s.JsonKey(name: 'Certificate')
  final String certificate;

  /// The default authentication method that you want Amazon Pinpoint to use when
  /// authenticating with the APNs sandbox environment for this channel, key or
  /// certificate.
  @_s.JsonKey(name: 'DefaultAuthenticationMethod')
  final String defaultAuthenticationMethod;

  /// Specifies whether the APNs VoIP sandbox channel is enabled for the
  /// application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The private key for the APNs client certificate that you want Amazon
  /// Pinpoint to use to communicate with the APNs sandbox environment.
  @_s.JsonKey(name: 'PrivateKey')
  final String privateKey;

  /// The identifier that's assigned to your Apple developer account team. This
  /// identifier is used for APNs tokens.
  @_s.JsonKey(name: 'TeamId')
  final String teamId;

  /// The authentication key to use for APNs tokens.
  @_s.JsonKey(name: 'TokenKey')
  final String tokenKey;

  /// The key identifier that's assigned to your APNs signing key, if you want
  /// Amazon Pinpoint to communicate with the APNs sandbox environment by using
  /// APNs tokens.
  @_s.JsonKey(name: 'TokenKeyId')
  final String tokenKeyId;

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
  Map<String, dynamic> toJson() => _$APNSVoipSandboxChannelRequestToJson(this);
}

/// Provides information about the status and settings of the APNs (Apple Push
/// Notification service) VoIP sandbox channel for an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class APNSVoipSandboxChannelResponse {
  /// The type of messaging or notification platform for the channel. For the APNs
  /// VoIP sandbox channel, this value is APNS_VOIP_SANDBOX.
  @_s.JsonKey(name: 'Platform')
  final String platform;

  /// The unique identifier for the application that the APNs VoIP sandbox channel
  /// applies to.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The date and time when the APNs VoIP sandbox channel was enabled.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The default authentication method that Amazon Pinpoint uses to authenticate
  /// with the APNs sandbox environment for this channel, key or certificate.
  @_s.JsonKey(name: 'DefaultAuthenticationMethod')
  final String defaultAuthenticationMethod;

  /// Specifies whether the APNs VoIP sandbox channel is enabled for the
  /// application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// (Not used) This property is retained only for backward compatibility.
  @_s.JsonKey(name: 'HasCredential')
  final bool hasCredential;

  /// Specifies whether the APNs VoIP sandbox channel is configured to communicate
  /// with APNs by using APNs tokens. To provide an authentication key for APNs
  /// tokens, set the TokenKey property of the channel.
  @_s.JsonKey(name: 'HasTokenKey')
  final bool hasTokenKey;

  /// (Deprecated) An identifier for the APNs VoIP sandbox channel. This property
  /// is retained only for backward compatibility.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Specifies whether the APNs VoIP sandbox channel is archived.
  @_s.JsonKey(name: 'IsArchived')
  final bool isArchived;

  /// The user who last modified the APNs VoIP sandbox channel.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The date and time when the APNs VoIP sandbox channel was last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The current version of the APNs VoIP sandbox channel.
  @_s.JsonKey(name: 'Version')
  final int version;

  APNSVoipSandboxChannelResponse({
    @_s.required this.platform,
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
  factory APNSVoipSandboxChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$APNSVoipSandboxChannelResponseFromJson(json);
}

enum Action {
  @_s.JsonValue('OPEN_APP')
  openApp,
  @_s.JsonValue('DEEP_LINK')
  deepLink,
  @_s.JsonValue('URL')
  url,
}

/// Provides information about the activities that were performed by a campaign.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActivitiesResponse {
  /// An array of responses, one for each activity that was performed by the
  /// campaign.
  @_s.JsonKey(name: 'Item')
  final List<ActivityResponse> item;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ActivitiesResponse({
    @_s.required this.item,
    this.nextToken,
  });
  factory ActivitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivitiesResponseFromJson(json);
}

/// Specifies the configuration and other settings for an activity in a journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Activity {
  /// The settings for a custom message activity. This type of activity calls an
  /// AWS Lambda function or web hook that sends messages to participants.
  @_s.JsonKey(name: 'CUSTOM')
  final CustomMessageActivity custom;

  /// The settings for a yes/no split activity. This type of activity sends
  /// participants down one of two paths in a journey, based on conditions that
  /// you specify.
  @_s.JsonKey(name: 'ConditionalSplit')
  final ConditionalSplitActivity conditionalSplit;

  /// The custom description of the activity.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The settings for an email activity. This type of activity sends an email
  /// message to participants.
  @_s.JsonKey(name: 'EMAIL')
  final EmailMessageActivity email;

  /// The settings for a holdout activity. This type of activity stops a journey
  /// for a specified percentage of participants.
  @_s.JsonKey(name: 'Holdout')
  final HoldoutActivity holdout;

  /// The settings for a multivariate split activity. This type of activity sends
  /// participants down one of as many as five paths (including a default
  /// <i>Else</i> path) in a journey, based on conditions that you specify.
  @_s.JsonKey(name: 'MultiCondition')
  final MultiConditionalSplitActivity multiCondition;

  /// The settings for a push notification activity. This type of activity sends a
  /// push notification to participants.
  @_s.JsonKey(name: 'PUSH')
  final PushMessageActivity push;

  /// The settings for a random split activity. This type of activity randomly
  /// sends specified percentages of participants down one of as many as five
  /// paths in a journey, based on conditions that you specify.
  @_s.JsonKey(name: 'RandomSplit')
  final RandomSplitActivity randomSplit;

  /// The settings for an SMS activity. This type of activity sends a text message
  /// to participants.
  @_s.JsonKey(name: 'SMS')
  final SMSMessageActivity sms;

  /// The settings for a wait activity. This type of activity waits for a certain
  /// amount of time or until a specific date and time before moving participants
  /// to the next activity in a journey.
  @_s.JsonKey(name: 'Wait')
  final WaitActivity wait;

  Activity({
    this.custom,
    this.conditionalSplit,
    this.description,
    this.email,
    this.holdout,
    this.multiCondition,
    this.push,
    this.randomSplit,
    this.sms,
    this.wait,
  });
  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}

/// Provides information about an activity that was performed by a campaign.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActivityResponse {
  /// The unique identifier for the application that the campaign applies to.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The unique identifier for the campaign that the activity applies to.
  @_s.JsonKey(name: 'CampaignId')
  final String campaignId;

  /// The unique identifier for the activity.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The actual time, in ISO 8601 format, when the activity was marked CANCELLED
  /// or COMPLETED.
  @_s.JsonKey(name: 'End')
  final String end;

  /// Specifies whether the activity succeeded. Possible values are SUCCESS and
  /// FAIL.
  @_s.JsonKey(name: 'Result')
  final String result;

  /// The scheduled start time, in ISO 8601 format, for the activity.
  @_s.JsonKey(name: 'ScheduledStart')
  final String scheduledStart;

  /// The actual start time, in ISO 8601 format, of the activity.
  @_s.JsonKey(name: 'Start')
  final String start;

  /// The current status of the activity. Possible values are: PENDING,
  /// INITIALIZING, RUNNING, PAUSED, CANCELLED, and COMPLETED.
  @_s.JsonKey(name: 'State')
  final String state;

  /// The total number of endpoints that the campaign successfully delivered
  /// messages to.
  @_s.JsonKey(name: 'SuccessfulEndpointCount')
  final int successfulEndpointCount;

  /// The total number of time zones that were completed.
  @_s.JsonKey(name: 'TimezonesCompletedCount')
  final int timezonesCompletedCount;

  /// The total number of unique time zones that are in the segment for the
  /// campaign.
  @_s.JsonKey(name: 'TimezonesTotalCount')
  final int timezonesTotalCount;

  /// The total number of endpoints that the campaign attempted to deliver
  /// messages to.
  @_s.JsonKey(name: 'TotalEndpointCount')
  final int totalEndpointCount;

  /// The unique identifier for the campaign treatment that the activity applies
  /// to. A treatment is a variation of a campaign that's used for A/B testing of
  /// a campaign.
  @_s.JsonKey(name: 'TreatmentId')
  final String treatmentId;

  ActivityResponse({
    @_s.required this.applicationId,
    @_s.required this.campaignId,
    @_s.required this.id,
    this.end,
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
  factory ActivityResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityResponseFromJson(json);
}

/// Specifies address-based configuration settings for a message that's sent
/// directly to an endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AddressConfiguration {
  /// The message body to use instead of the default message body. This value
  /// overrides the default message body.
  @_s.JsonKey(name: 'BodyOverride')
  final String bodyOverride;

  /// The channel to use when sending the message.
  @_s.JsonKey(name: 'ChannelType')
  final ChannelType channelType;

  /// An object that maps custom attributes to attributes for the address and is
  /// attached to the message. Attribute names are case sensitive.
  ///
  /// For a push notification, this payload is added to the data.pinpoint object.
  /// For an email or text message, this payload is added to email/SMS delivery
  /// receipt event attributes.
  @_s.JsonKey(name: 'Context')
  final Map<String, String> context;

  /// The raw, JSON-formatted string to use as the payload for the message. If
  /// specified, this value overrides all other values for the message.
  @_s.JsonKey(name: 'RawContent')
  final String rawContent;

  /// A map of the message variables to merge with the variables specified by
  /// properties of the DefaultMessage object. The variables specified in this map
  /// take precedence over all other variables.
  @_s.JsonKey(name: 'Substitutions')
  final Map<String, List<String>> substitutions;

  /// The message title to use instead of the default message title. This value
  /// overrides the default message title.
  @_s.JsonKey(name: 'TitleOverride')
  final String titleOverride;

  AddressConfiguration({
    this.bodyOverride,
    this.channelType,
    this.context,
    this.rawContent,
    this.substitutions,
    this.titleOverride,
  });
  Map<String, dynamic> toJson() => _$AddressConfigurationToJson(this);
}

/// Specifies channel-specific content and settings for a message template that
/// can be used in push notifications that are sent through the ADM (Amazon
/// Device Messaging), Baidu (Baidu Cloud Push), or GCM (Firebase Cloud
/// Messaging, formerly Google Cloud Messaging) channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'Action')
  final Action action;

  /// The message body to use in a push notification that's based on the message
  /// template.
  @_s.JsonKey(name: 'Body')
  final String body;

  /// The URL of the large icon image to display in the content view of a push
  /// notification that's based on the message template.
  @_s.JsonKey(name: 'ImageIconUrl')
  final String imageIconUrl;

  /// The URL of an image to display in a push notification that's based on the
  /// message template.
  @_s.JsonKey(name: 'ImageUrl')
  final String imageUrl;

  /// The raw, JSON-formatted string to use as the payload for a push notification
  /// that's based on the message template. If specified, this value overrides all
  /// other content for the message template.
  @_s.JsonKey(name: 'RawContent')
  final String rawContent;

  /// The URL of the small icon image to display in the status bar and the content
  /// view of a push notification that's based on the message template.
  @_s.JsonKey(name: 'SmallImageIconUrl')
  final String smallImageIconUrl;

  /// The sound to play when a recipient receives a push notification that's based
  /// on the message template. You can use the default stream or specify the file
  /// name of a sound resource that's bundled in your app. On an Android platform,
  /// the sound file must reside in /res/raw/.
  @_s.JsonKey(name: 'Sound')
  final String sound;

  /// The title to use in a push notification that's based on the message
  /// template. This title appears above the notification message on a recipient's
  /// device.
  @_s.JsonKey(name: 'Title')
  final String title;

  /// The URL to open in a recipient's default mobile browser, if a recipient taps
  /// a push notification that's based on the message template and the value of
  /// the Action property is URL.
  @_s.JsonKey(name: 'Url')
  final String url;

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
  factory AndroidPushNotificationTemplate.fromJson(Map<String, dynamic> json) =>
      _$AndroidPushNotificationTemplateFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AndroidPushNotificationTemplateToJson(this);
}

/// Provides the results of a query that retrieved the data for a standard
/// metric that applies to an application, and provides information about that
/// query.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApplicationDateRangeKpiResponse {
  /// The unique identifier for the application that the metric applies to.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The last date and time of the date range that was used to filter the query
  /// results, in extended ISO 8601 format. The date range is inclusive.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The name of the metric, also referred to as a <i>key performance indicator
  /// (KPI)</i>, that the data was retrieved for. This value describes the
  /// associated metric and consists of two or more terms, which are comprised of
  /// lowercase alphanumeric characters, separated by a hyphen. For a list of
  /// possible values, see the <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/analytics-standard-metrics.html">Amazon
  /// Pinpoint Developer Guide</a>.
  @_s.JsonKey(name: 'KpiName')
  final String kpiName;

  /// An array of objects that contains the results of the query. Each object
  /// contains the value for the metric and metadata about that value.
  @_s.JsonKey(name: 'KpiResult')
  final BaseKpiResult kpiResult;

  /// The first date and time of the date range that was used to filter the query
  /// results, in extended ISO 8601 format. The date range is inclusive.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null for the Application Metrics
  /// resource because the resource returns all results in a single page.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ApplicationDateRangeKpiResponse({
    @_s.required this.applicationId,
    @_s.required this.endTime,
    @_s.required this.kpiName,
    @_s.required this.kpiResult,
    @_s.required this.startTime,
    this.nextToken,
  });
  factory ApplicationDateRangeKpiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApplicationDateRangeKpiResponseFromJson(json);
}

/// Provides information about an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApplicationResponse {
  /// The Amazon Resource Name (ARN) of the application.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The display name of the application. This name is displayed as the
  /// <b>Project name</b> on the Amazon Pinpoint console.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A string-to-string map of key-value pairs that identifies the tags that are
  /// associated with the application. Each tag consists of a required tag key and
  /// an associated tag value.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ApplicationResponse({
    @_s.required this.arn,
    @_s.required this.id,
    @_s.required this.name,
    this.tags,
  });
  factory ApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$ApplicationResponseFromJson(json);
}

/// Provides information about an application, including the default settings
/// for an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApplicationSettingsResource {
  /// The unique identifier for the application. This identifier is displayed as
  /// the <b>Project ID</b> on the Amazon Pinpoint console.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The settings for the AWS Lambda function to invoke by default as a code hook
  /// for campaigns in the application. You can use this hook to customize
  /// segments that are used by campaigns in the application.
  @_s.JsonKey(name: 'CampaignHook')
  final CampaignHook campaignHook;

  /// The date and time, in ISO 8601 format, when the application's settings were
  /// last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The default sending limits for campaigns in the application.
  @_s.JsonKey(name: 'Limits')
  final CampaignLimits limits;

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
  @_s.JsonKey(name: 'QuietTime')
  final QuietTime quietTime;

  ApplicationSettingsResource({
    @_s.required this.applicationId,
    this.campaignHook,
    this.lastModifiedDate,
    this.limits,
    this.quietTime,
  });
  factory ApplicationSettingsResource.fromJson(Map<String, dynamic> json) =>
      _$ApplicationSettingsResourceFromJson(json);
}

/// Provides information about all of your applications.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ApplicationsResponse {
  /// An array of responses, one for each application that was returned.
  @_s.JsonKey(name: 'Item')
  final List<ApplicationResponse> item;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ApplicationsResponse({
    this.item,
    this.nextToken,
  });
  factory ApplicationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ApplicationsResponseFromJson(json);
}

/// Specifies attribute-based criteria for including or excluding endpoints from
/// a segment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AttributeDimension {
  /// The criteria values to use for the segment dimension. Depending on the value
  /// of the AttributeType property, endpoints are included or excluded from the
  /// segment if their attribute values match the criteria values.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  /// The type of segment dimension to use. Valid values are: INCLUSIVE, endpoints
  /// that match the criteria are included in the segment; and, EXCLUSIVE,
  /// endpoints that match the criteria are excluded from the segment.
  @_s.JsonKey(name: 'AttributeType')
  final AttributeType attributeType;

  AttributeDimension({
    @_s.required this.values,
    this.attributeType,
  });
  factory AttributeDimension.fromJson(Map<String, dynamic> json) =>
      _$AttributeDimensionFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeDimensionToJson(this);
}

enum AttributeType {
  @_s.JsonValue('INCLUSIVE')
  inclusive,
  @_s.JsonValue('EXCLUSIVE')
  exclusive,
}

/// Provides information about the type and the names of attributes that were
/// removed from all the endpoints that are associated with an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttributesResource {
  /// The unique identifier for the application.
  @_s.JsonKey(name: 'ApplicationId')
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
  @_s.JsonKey(name: 'AttributeType')
  final String attributeType;

  /// An array that specifies the names of the attributes that were removed from
  /// the endpoints.
  @_s.JsonKey(name: 'Attributes')
  final List<String> attributes;

  AttributesResource({
    @_s.required this.applicationId,
    @_s.required this.attributeType,
    this.attributes,
  });
  factory AttributesResource.fromJson(Map<String, dynamic> json) =>
      _$AttributesResourceFromJson(json);
}

/// Specifies the status and settings of the Baidu (Baidu Cloud Push) channel
/// for an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BaiduChannelRequest {
  /// The API key that you received from the Baidu Cloud Push service to
  /// communicate with the service.
  @_s.JsonKey(name: 'ApiKey')
  final String apiKey;

  /// The secret key that you received from the Baidu Cloud Push service to
  /// communicate with the service.
  @_s.JsonKey(name: 'SecretKey')
  final String secretKey;

  /// Specifies whether to enable the Baidu channel for the application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  BaiduChannelRequest({
    @_s.required this.apiKey,
    @_s.required this.secretKey,
    this.enabled,
  });
  Map<String, dynamic> toJson() => _$BaiduChannelRequestToJson(this);
}

/// Provides information about the status and settings of the Baidu (Baidu Cloud
/// Push) channel for an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BaiduChannelResponse {
  /// The API key that you received from the Baidu Cloud Push service to
  /// communicate with the service.
  @_s.JsonKey(name: 'Credential')
  final String credential;

  /// The type of messaging or notification platform for the channel. For the
  /// Baidu channel, this value is BAIDU.
  @_s.JsonKey(name: 'Platform')
  final String platform;

  /// The unique identifier for the application that the Baidu channel applies to.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The date and time when the Baidu channel was enabled.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// Specifies whether the Baidu channel is enabled for the application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// (Not used) This property is retained only for backward compatibility.
  @_s.JsonKey(name: 'HasCredential')
  final bool hasCredential;

  /// (Deprecated) An identifier for the Baidu channel. This property is retained
  /// only for backward compatibility.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Specifies whether the Baidu channel is archived.
  @_s.JsonKey(name: 'IsArchived')
  final bool isArchived;

  /// The user who last modified the Baidu channel.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The date and time when the Baidu channel was last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The current version of the Baidu channel.
  @_s.JsonKey(name: 'Version')
  final int version;

  BaiduChannelResponse({
    @_s.required this.credential,
    @_s.required this.platform,
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
  factory BaiduChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$BaiduChannelResponseFromJson(json);
}

/// Specifies the settings for a one-time message that's sent directly to an
/// endpoint through the Baidu (Baidu Cloud Push) channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @_s.JsonKey(name: 'Action')
  final Action action;

  /// The body of the notification message.
  @_s.JsonKey(name: 'Body')
  final String body;

  /// The JSON data payload to use for the push notification, if the notification
  /// is a silent push notification. This payload is added to the
  /// data.pinpoint.jsonBody object of the notification.
  @_s.JsonKey(name: 'Data')
  final Map<String, String> data;

  /// The icon image name of the asset saved in your app.
  @_s.JsonKey(name: 'IconReference')
  final String iconReference;

  /// The URL of the large icon image to display in the content view of the push
  /// notification.
  @_s.JsonKey(name: 'ImageIconUrl')
  final String imageIconUrl;

  /// The URL of an image to display in the push notification.
  @_s.JsonKey(name: 'ImageUrl')
  final String imageUrl;

  /// The raw, JSON-formatted string to use as the payload for the notification
  /// message. If specified, this value overrides all other content for the
  /// message.
  @_s.JsonKey(name: 'RawContent')
  final String rawContent;

  /// Specifies whether the notification is a silent push notification, which is a
  /// push notification that doesn't display on a recipient's device. Silent push
  /// notifications can be used for cases such as updating an app's configuration
  /// or supporting phone home functionality.
  @_s.JsonKey(name: 'SilentPush')
  final bool silentPush;

  /// The URL of the small icon image to display in the status bar and the content
  /// view of the push notification.
  @_s.JsonKey(name: 'SmallImageIconUrl')
  final String smallImageIconUrl;

  /// The sound to play when the recipient receives the push notification. You can
  /// use the default stream or specify the file name of a sound resource that's
  /// bundled in your app. On an Android platform, the sound file must reside in
  /// /res/raw/.
  @_s.JsonKey(name: 'Sound')
  final String sound;

  /// The default message variables to use in the notification message. You can
  /// override the default variables with individual address variables.
  @_s.JsonKey(name: 'Substitutions')
  final Map<String, List<String>> substitutions;

  /// The amount of time, in seconds, that the Baidu Cloud Push service should
  /// store the message if the recipient's device is offline. The default value
  /// and maximum supported time is 604,800 seconds (7 days).
  @_s.JsonKey(name: 'TimeToLive')
  final int timeToLive;

  /// The title to display above the notification message on the recipient's
  /// device.
  @_s.JsonKey(name: 'Title')
  final String title;

  /// The URL to open in the recipient's default mobile browser, if a recipient
  /// taps the push notification and the value of the Action property is URL.
  @_s.JsonKey(name: 'Url')
  final String url;

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
  Map<String, dynamic> toJson() => _$BaiduMessageToJson(this);
}

/// Provides the results of a query that retrieved the data for a standard
/// metric that applies to an application, campaign, or journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BaseKpiResult {
  /// An array of objects that provides the results of a query that retrieved the
  /// data for a standard metric that applies to an application, campaign, or
  /// journey.
  @_s.JsonKey(name: 'Rows')
  final List<ResultRow> rows;

  BaseKpiResult({
    @_s.required this.rows,
  });
  factory BaseKpiResult.fromJson(Map<String, dynamic> json) =>
      _$BaseKpiResultFromJson(json);
}

/// Specifies the contents of a message that's sent through a custom channel to
/// recipients of a campaign.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CampaignCustomMessage {
  /// The raw, JSON-formatted string to use as the payload for the message. The
  /// maximum size is 5 KB.
  @_s.JsonKey(name: 'Data')
  final String data;

  CampaignCustomMessage({
    this.data,
  });
  factory CampaignCustomMessage.fromJson(Map<String, dynamic> json) =>
      _$CampaignCustomMessageFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignCustomMessageToJson(this);
}

/// Provides the results of a query that retrieved the data for a standard
/// metric that applies to a campaign, and provides information about that
/// query.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CampaignDateRangeKpiResponse {
  /// The unique identifier for the application that the metric applies to.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The unique identifier for the campaign that the metric applies to.
  @_s.JsonKey(name: 'CampaignId')
  final String campaignId;

  /// The last date and time of the date range that was used to filter the query
  /// results, in extended ISO 8601 format. The date range is inclusive.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The name of the metric, also referred to as a <i>key performance indicator
  /// (KPI)</i>, that the data was retrieved for. This value describes the
  /// associated metric and consists of two or more terms, which are comprised of
  /// lowercase alphanumeric characters, separated by a hyphen. For a list of
  /// possible values, see the <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/analytics-standard-metrics.html">Amazon
  /// Pinpoint Developer Guide</a>.
  @_s.JsonKey(name: 'KpiName')
  final String kpiName;

  /// An array of objects that contains the results of the query. Each object
  /// contains the value for the metric and metadata about that value.
  @_s.JsonKey(name: 'KpiResult')
  final BaseKpiResult kpiResult;

  /// The first date and time of the date range that was used to filter the query
  /// results, in extended ISO 8601 format. The date range is inclusive.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null for the Campaign Metrics resource
  /// because the resource returns all results in a single page.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  CampaignDateRangeKpiResponse({
    @_s.required this.applicationId,
    @_s.required this.campaignId,
    @_s.required this.endTime,
    @_s.required this.kpiName,
    @_s.required this.kpiResult,
    @_s.required this.startTime,
    this.nextToken,
  });
  factory CampaignDateRangeKpiResponse.fromJson(Map<String, dynamic> json) =>
      _$CampaignDateRangeKpiResponseFromJson(json);
}

/// Specifies the content and "From" address for an email message that's sent to
/// recipients of a campaign.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CampaignEmailMessage {
  /// The body of the email for recipients whose email clients don't render HTML
  /// content.
  @_s.JsonKey(name: 'Body')
  final String body;

  /// The verified email address to send the email from. The default address is
  /// the FromAddress specified for the email channel for the application.
  @_s.JsonKey(name: 'FromAddress')
  final String fromAddress;

  /// The body of the email, in HTML format, for recipients whose email clients
  /// render HTML content.
  @_s.JsonKey(name: 'HtmlBody')
  final String htmlBody;

  /// The subject line, or title, of the email.
  @_s.JsonKey(name: 'Title')
  final String title;

  CampaignEmailMessage({
    this.body,
    this.fromAddress,
    this.htmlBody,
    this.title,
  });
  factory CampaignEmailMessage.fromJson(Map<String, dynamic> json) =>
      _$CampaignEmailMessageFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignEmailMessageToJson(this);
}

/// Specifies the settings for events that cause a campaign to be sent.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CampaignEventFilter {
  /// The dimension settings of the event filter for the campaign.
  @_s.JsonKey(name: 'Dimensions')
  final EventDimensions dimensions;

  /// The type of event that causes the campaign to be sent. Valid values are:
  /// SYSTEM, sends the campaign when a system event occurs; and, ENDPOINT, sends
  /// the campaign when an endpoint event (<link
  /// linkend="apps-application-id-events">Events</link> resource) occurs.
  @_s.JsonKey(name: 'FilterType')
  final FilterType filterType;

  CampaignEventFilter({
    @_s.required this.dimensions,
    @_s.required this.filterType,
  });
  factory CampaignEventFilter.fromJson(Map<String, dynamic> json) =>
      _$CampaignEventFilterFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignEventFilterToJson(this);
}

/// Specifies settings for invoking an AWS Lambda function that customizes a
/// segment for a campaign.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CampaignHook {
  /// The name or Amazon Resource Name (ARN) of the AWS Lambda function that
  /// Amazon Pinpoint invokes to customize a segment for a campaign.
  @_s.JsonKey(name: 'LambdaFunctionName')
  final String lambdaFunctionName;

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
  @_s.JsonKey(name: 'Mode')
  final Mode mode;

  /// The web URL that Amazon Pinpoint calls to invoke the AWS Lambda function
  /// over HTTPS.
  @_s.JsonKey(name: 'WebUrl')
  final String webUrl;

  CampaignHook({
    this.lambdaFunctionName,
    this.mode,
    this.webUrl,
  });
  factory CampaignHook.fromJson(Map<String, dynamic> json) =>
      _$CampaignHookFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignHookToJson(this);
}

/// For a campaign, specifies limits on the messages that the campaign can send.
/// For an application, specifies the default limits for messages that campaigns
/// in the application can send.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CampaignLimits {
  /// The maximum number of messages that a campaign can send to a single endpoint
  /// during a 24-hour period. For an application, this value specifies the
  /// default limit for the number of messages that campaigns and journeys can
  /// send to a single endpoint during a 24-hour period. The maximum value is 100.
  @_s.JsonKey(name: 'Daily')
  final int daily;

  /// The maximum amount of time, in seconds, that a campaign can attempt to
  /// deliver a message after the scheduled start time for the campaign. The
  /// minimum value is 60 seconds.
  @_s.JsonKey(name: 'MaximumDuration')
  final int maximumDuration;

  /// The maximum number of messages that a campaign can send each second. For an
  /// application, this value specifies the default limit for the number of
  /// messages that campaigns can send each second. The minimum value is 50. The
  /// maximum value is 20,000.
  @_s.JsonKey(name: 'MessagesPerSecond')
  final int messagesPerSecond;

  /// The maximum number of messages that a campaign can send to a single endpoint
  /// during the course of the campaign. If a campaign recurs, this setting
  /// applies to all runs of the campaign. The maximum value is 100.
  @_s.JsonKey(name: 'Total')
  final int total;

  CampaignLimits({
    this.daily,
    this.maximumDuration,
    this.messagesPerSecond,
    this.total,
  });
  factory CampaignLimits.fromJson(Map<String, dynamic> json) =>
      _$CampaignLimitsFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignLimitsToJson(this);
}

/// Provides information about the status, configuration, and other settings for
/// a campaign.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CampaignResponse {
  /// The unique identifier for the application that the campaign applies to.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The Amazon Resource Name (ARN) of the campaign.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date, in ISO 8601 format, when the campaign was created.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The unique identifier for the campaign.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The date, in ISO 8601 format, when the campaign was last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The unique identifier for the segment that's associated with the campaign.
  @_s.JsonKey(name: 'SegmentId')
  final String segmentId;

  /// The version number of the segment that's associated with the campaign.
  @_s.JsonKey(name: 'SegmentVersion')
  final int segmentVersion;

  /// An array of responses, one for each treatment that you defined for the
  /// campaign, in addition to the default treatment.
  @_s.JsonKey(name: 'AdditionalTreatments')
  final List<TreatmentResource> additionalTreatments;

  /// The delivery configuration settings for sending the campaign through a
  /// custom channel.
  @_s.JsonKey(name: 'CustomDeliveryConfiguration')
  final CustomDeliveryConfiguration customDeliveryConfiguration;

  /// The current status of the campaign's default treatment. This value exists
  /// only for campaigns that have more than one treatment.
  @_s.JsonKey(name: 'DefaultState')
  final CampaignState defaultState;

  /// The custom description of the campaign.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The allocated percentage of users (segment members) who shouldn't receive
  /// messages from the campaign.
  @_s.JsonKey(name: 'HoldoutPercent')
  final int holdoutPercent;

  /// The settings for the AWS Lambda function to use as a code hook for the
  /// campaign. You can use this hook to customize the segment that's used by the
  /// campaign.
  @_s.JsonKey(name: 'Hook')
  final CampaignHook hook;

  /// Specifies whether the campaign is paused. A paused campaign doesn't run
  /// unless you resume it by changing this value to false.
  @_s.JsonKey(name: 'IsPaused')
  final bool isPaused;

  /// The messaging limits for the campaign.
  @_s.JsonKey(name: 'Limits')
  final CampaignLimits limits;

  /// The message configuration settings for the campaign.
  @_s.JsonKey(name: 'MessageConfiguration')
  final MessageConfiguration messageConfiguration;

  /// The name of the campaign.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The schedule settings for the campaign.
  @_s.JsonKey(name: 'Schedule')
  final Schedule schedule;

  /// The current status of the campaign.
  @_s.JsonKey(name: 'State')
  final CampaignState state;

  /// The message template that’s used for the campaign.
  @_s.JsonKey(name: 'TemplateConfiguration')
  final TemplateConfiguration templateConfiguration;

  /// The custom description of the default treatment for the campaign.
  @_s.JsonKey(name: 'TreatmentDescription')
  final String treatmentDescription;

  /// The custom name of the default treatment for the campaign, if the campaign
  /// has multiple treatments. A <i>treatment</i> is a variation of a campaign
  /// that's used for A/B testing.
  @_s.JsonKey(name: 'TreatmentName')
  final String treatmentName;

  /// The version number of the campaign.
  @_s.JsonKey(name: 'Version')
  final int version;

  /// A string-to-string map of key-value pairs that identifies the tags that are
  /// associated with the campaign. Each tag consists of a required tag key and an
  /// associated tag value.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  CampaignResponse({
    @_s.required this.applicationId,
    @_s.required this.arn,
    @_s.required this.creationDate,
    @_s.required this.id,
    @_s.required this.lastModifiedDate,
    @_s.required this.segmentId,
    @_s.required this.segmentVersion,
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
    this.schedule,
    this.state,
    this.templateConfiguration,
    this.treatmentDescription,
    this.treatmentName,
    this.version,
    this.tags,
  });
  factory CampaignResponse.fromJson(Map<String, dynamic> json) =>
      _$CampaignResponseFromJson(json);
}

/// Specifies the content and settings for an SMS message that's sent to
/// recipients of a campaign.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CampaignSmsMessage {
  /// The body of the SMS message.
  @_s.JsonKey(name: 'Body')
  final String body;

  /// The SMS message type. Valid values are TRANSACTIONAL (for messages that are
  /// critical or time-sensitive, such as a one-time passwords) and PROMOTIONAL
  /// (for messsages that aren't critical or time-sensitive, such as marketing
  /// messages).
  @_s.JsonKey(name: 'MessageType')
  final MessageType messageType;

  /// The sender ID to display on recipients' devices when they receive the SMS
  /// message.
  @_s.JsonKey(name: 'SenderId')
  final String senderId;

  CampaignSmsMessage({
    this.body,
    this.messageType,
    this.senderId,
  });
  factory CampaignSmsMessage.fromJson(Map<String, dynamic> json) =>
      _$CampaignSmsMessageFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignSmsMessageToJson(this);
}

/// Provides information about the status of a campaign.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CampaignState {
  /// The current status of the campaign, or the current status of a treatment
  /// that belongs to an A/B test campaign.
  ///
  /// If a campaign uses A/B testing, the campaign has a status of COMPLETED only
  /// if all campaign treatments have a status of COMPLETED. If you delete the
  /// segment that's associated with a campaign, the campaign fails and has a
  /// status of DELETED.
  @_s.JsonKey(name: 'CampaignStatus')
  final CampaignStatus campaignStatus;

  CampaignState({
    this.campaignStatus,
  });
  factory CampaignState.fromJson(Map<String, dynamic> json) =>
      _$CampaignStateFromJson(json);
}

enum CampaignStatus {
  @_s.JsonValue('SCHEDULED')
  scheduled,
  @_s.JsonValue('EXECUTING')
  executing,
  @_s.JsonValue('PENDING_NEXT_RUN')
  pendingNextRun,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('PAUSED')
  paused,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('INVALID')
  invalid,
}

/// Provides information about the configuration and other settings for all the
/// campaigns that are associated with an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CampaignsResponse {
  /// An array of responses, one for each campaign that's associated with the
  /// application.
  @_s.JsonKey(name: 'Item')
  final List<CampaignResponse> item;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  CampaignsResponse({
    @_s.required this.item,
    this.nextToken,
  });
  factory CampaignsResponse.fromJson(Map<String, dynamic> json) =>
      _$CampaignsResponseFromJson(json);
}

/// Provides information about the general settings and status of a channel for
/// an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChannelResponse {
  /// The unique identifier for the application.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The date and time, in ISO 8601 format, when the channel was enabled.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// Specifies whether the channel is enabled for the application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// (Not used) This property is retained only for backward compatibility.
  @_s.JsonKey(name: 'HasCredential')
  final bool hasCredential;

  /// (Deprecated) An identifier for the channel. This property is retained only
  /// for backward compatibility.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Specifies whether the channel is archived.
  @_s.JsonKey(name: 'IsArchived')
  final bool isArchived;

  /// The user who last modified the channel.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The date and time, in ISO 8601 format, when the channel was last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The current version of the channel.
  @_s.JsonKey(name: 'Version')
  final int version;

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
  factory ChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$ChannelResponseFromJson(json);
}

enum ChannelType {
  @_s.JsonValue('PUSH')
  push,
  @_s.JsonValue('GCM')
  gcm,
  @_s.JsonValue('APNS')
  apns,
  @_s.JsonValue('APNS_SANDBOX')
  apnsSandbox,
  @_s.JsonValue('APNS_VOIP')
  apnsVoip,
  @_s.JsonValue('APNS_VOIP_SANDBOX')
  apnsVoipSandbox,
  @_s.JsonValue('ADM')
  adm,
  @_s.JsonValue('SMS')
  sms,
  @_s.JsonValue('VOICE')
  voice,
  @_s.JsonValue('EMAIL')
  email,
  @_s.JsonValue('BAIDU')
  baidu,
  @_s.JsonValue('CUSTOM')
  custom,
}

/// Provides information about the general settings and status of all channels
/// for an application, including channels that aren't enabled for the
/// application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChannelsResponse {
  /// A map that contains a multipart response for each channel. For each item in
  /// this object, the ChannelType is the key and the Channel is the value.
  @_s.JsonKey(name: 'Channels')
  final Map<String, ChannelResponse> channels;

  ChannelsResponse({
    @_s.required this.channels,
  });
  factory ChannelsResponse.fromJson(Map<String, dynamic> json) =>
      _$ChannelsResponseFromJson(json);
}

/// Specifies the conditions to evaluate for an activity in a journey, and how
/// to evaluate those conditions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Condition {
  /// The conditions to evaluate for the activity.
  @_s.JsonKey(name: 'Conditions')
  final List<SimpleCondition> conditions;

  /// Specifies how to handle multiple conditions for the activity. For example,
  /// if you specify two conditions for an activity, whether both or only one of
  /// the conditions must be met for the activity to be performed.
  @_s.JsonKey(name: 'Operator')
  final Operator operator;

  Condition({
    this.conditions,
    this.operator,
  });
  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConditionalSplitActivity {
  /// The conditions that define the paths for the activity, and the relationship
  /// between the conditions.
  @_s.JsonKey(name: 'Condition')
  final Condition condition;

  /// The amount of time to wait before determining whether the conditions are
  /// met, or the date and time when Amazon Pinpoint determines whether the
  /// conditions are met.
  @_s.JsonKey(name: 'EvaluationWaitTime')
  final WaitTime evaluationWaitTime;

  /// The unique identifier for the activity to perform if the conditions aren't
  /// met.
  @_s.JsonKey(name: 'FalseActivity')
  final String falseActivity;

  /// The unique identifier for the activity to perform if the conditions are met.
  @_s.JsonKey(name: 'TrueActivity')
  final String trueActivity;

  ConditionalSplitActivity({
    this.condition,
    this.evaluationWaitTime,
    this.falseActivity,
    this.trueActivity,
  });
  factory ConditionalSplitActivity.fromJson(Map<String, dynamic> json) =>
      _$ConditionalSplitActivityFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionalSplitActivityToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAppResponse {
  @_s.JsonKey(name: 'ApplicationResponse')
  final ApplicationResponse applicationResponse;

  CreateAppResponse({
    @_s.required this.applicationResponse,
  });
  factory CreateAppResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAppResponseFromJson(json);
}

/// Specifies the display name of an application and the tags to associate with
/// the application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateApplicationRequest {
  /// The display name of the application. This name is displayed as the
  /// <b>Project name</b> on the Amazon Pinpoint console.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A string-to-string map of key-value pairs that defines the tags to associate
  /// with the application. Each tag consists of a required tag key and an
  /// associated tag value.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  CreateApplicationRequest({
    @_s.required this.name,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$CreateApplicationRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCampaignResponse {
  @_s.JsonKey(name: 'CampaignResponse')
  final CampaignResponse campaignResponse;

  CreateCampaignResponse({
    @_s.required this.campaignResponse,
  });
  factory CreateCampaignResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCampaignResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateEmailTemplateResponse {
  @_s.JsonKey(name: 'CreateTemplateMessageBody')
  final CreateTemplateMessageBody createTemplateMessageBody;

  CreateEmailTemplateResponse({
    @_s.required this.createTemplateMessageBody,
  });
  factory CreateEmailTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateEmailTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateExportJobResponse {
  @_s.JsonKey(name: 'ExportJobResponse')
  final ExportJobResponse exportJobResponse;

  CreateExportJobResponse({
    @_s.required this.exportJobResponse,
  });
  factory CreateExportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateExportJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateImportJobResponse {
  @_s.JsonKey(name: 'ImportJobResponse')
  final ImportJobResponse importJobResponse;

  CreateImportJobResponse({
    @_s.required this.importJobResponse,
  });
  factory CreateImportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateImportJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateJourneyResponse {
  @_s.JsonKey(name: 'JourneyResponse')
  final JourneyResponse journeyResponse;

  CreateJourneyResponse({
    @_s.required this.journeyResponse,
  });
  factory CreateJourneyResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateJourneyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePushTemplateResponse {
  @_s.JsonKey(name: 'CreateTemplateMessageBody')
  final CreateTemplateMessageBody createTemplateMessageBody;

  CreatePushTemplateResponse({
    @_s.required this.createTemplateMessageBody,
  });
  factory CreatePushTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePushTemplateResponseFromJson(json);
}

/// Specifies Amazon Pinpoint configuration settings for retrieving and
/// processing recommendation data from a recommender model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateRecommenderConfiguration {
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorizes Amazon Pinpoint to retrieve recommendation data
  /// from the recommender model.
  @_s.JsonKey(name: 'RecommendationProviderRoleArn')
  final String recommendationProviderRoleArn;

  /// The Amazon Resource Name (ARN) of the recommender model to retrieve
  /// recommendation data from. This value must match the ARN of an Amazon
  /// Personalize campaign.
  @_s.JsonKey(name: 'RecommendationProviderUri')
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
  @_s.JsonKey(name: 'Attributes')
  final Map<String, String> attributes;

  /// A custom description of the configuration for the recommender model. The
  /// description can contain up to 128 characters. The characters can be letters,
  /// numbers, spaces, or the following symbols: _ ; () , ‐.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A custom name of the configuration for the recommender model. The name must
  /// start with a letter or number and it can contain up to 128 characters. The
  /// characters can be letters, numbers, spaces, underscores (_), or hyphens (-).
  @_s.JsonKey(name: 'Name')
  final String name;

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
  @_s.JsonKey(name: 'RecommendationProviderIdType')
  final String recommendationProviderIdType;

  /// The name or Amazon Resource Name (ARN) of the AWS Lambda function to invoke
  /// for additional processing of recommendation data that's retrieved from the
  /// recommender model.
  @_s.JsonKey(name: 'RecommendationTransformerUri')
  final String recommendationTransformerUri;

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
  @_s.JsonKey(name: 'RecommendationsDisplayName')
  final String recommendationsDisplayName;

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
  @_s.JsonKey(name: 'RecommendationsPerMessage')
  final int recommendationsPerMessage;

  CreateRecommenderConfiguration({
    @_s.required this.recommendationProviderRoleArn,
    @_s.required this.recommendationProviderUri,
    this.attributes,
    this.description,
    this.name,
    this.recommendationProviderIdType,
    this.recommendationTransformerUri,
    this.recommendationsDisplayName,
    this.recommendationsPerMessage,
  });
  Map<String, dynamic> toJson() => _$CreateRecommenderConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRecommenderConfigurationResponse {
  @_s.JsonKey(name: 'RecommenderConfigurationResponse')
  final RecommenderConfigurationResponse recommenderConfigurationResponse;

  CreateRecommenderConfigurationResponse({
    @_s.required this.recommenderConfigurationResponse,
  });
  factory CreateRecommenderConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateRecommenderConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSegmentResponse {
  @_s.JsonKey(name: 'SegmentResponse')
  final SegmentResponse segmentResponse;

  CreateSegmentResponse({
    @_s.required this.segmentResponse,
  });
  factory CreateSegmentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSegmentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSmsTemplateResponse {
  @_s.JsonKey(name: 'CreateTemplateMessageBody')
  final CreateTemplateMessageBody createTemplateMessageBody;

  CreateSmsTemplateResponse({
    @_s.required this.createTemplateMessageBody,
  });
  factory CreateSmsTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSmsTemplateResponseFromJson(json);
}

/// Provides information about a request to create a message template.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTemplateMessageBody {
  /// The Amazon Resource Name (ARN) of the message template that was created.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The message that's returned from the API for the request to create the
  /// message template.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The unique identifier for the request to create the message template.
  @_s.JsonKey(name: 'RequestID')
  final String requestID;

  CreateTemplateMessageBody({
    this.arn,
    this.message,
    this.requestID,
  });
  factory CreateTemplateMessageBody.fromJson(Map<String, dynamic> json) =>
      _$CreateTemplateMessageBodyFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateVoiceTemplateResponse {
  @_s.JsonKey(name: 'CreateTemplateMessageBody')
  final CreateTemplateMessageBody createTemplateMessageBody;

  CreateVoiceTemplateResponse({
    @_s.required this.createTemplateMessageBody,
  });
  factory CreateVoiceTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateVoiceTemplateResponseFromJson(json);
}

/// Specifies the delivery configuration settings for sending a campaign or
/// campaign treatment through a custom channel. This object is required if you
/// use the CampaignCustomMessage object to define the message to send for the
/// campaign or campaign treatment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'DeliveryUri')
  final String deliveryUri;

  /// The types of endpoints to send the campaign or treatment to. Each valid
  /// value maps to a type of channel that you can associate with an endpoint by
  /// using the ChannelType property of an endpoint.
  @_s.JsonKey(name: 'EndpointTypes')
  final List<EndpointTypesElement> endpointTypes;

  CustomDeliveryConfiguration({
    @_s.required this.deliveryUri,
    this.endpointTypes,
  });
  factory CustomDeliveryConfiguration.fromJson(Map<String, dynamic> json) =>
      _$CustomDeliveryConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$CustomDeliveryConfigurationToJson(this);
}

/// The settings for a custom message activity. This type of activity calls an
/// AWS Lambda function or web hook that sends messages to participants.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'DeliveryUri')
  final String deliveryUri;

  /// The types of endpoints to send the custom message to. Each valid value maps
  /// to a type of channel that you can associate with an endpoint by using the
  /// ChannelType property of an endpoint.
  @_s.JsonKey(name: 'EndpointTypes')
  final List<EndpointTypesElement> endpointTypes;

  /// Specifies the message data included in a custom channel message that's sent
  /// to participants in a journey.
  @_s.JsonKey(name: 'MessageConfig')
  final JourneyCustomMessage messageConfig;

  /// The unique identifier for the next activity to perform, after Amazon
  /// Pinpoint calls the AWS Lambda function or web hook.
  @_s.JsonKey(name: 'NextActivity')
  final String nextActivity;

  /// The name of the custom message template to use for the message. If
  /// specified, this value must match the name of an existing message template.
  @_s.JsonKey(name: 'TemplateName')
  final String templateName;

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
  @_s.JsonKey(name: 'TemplateVersion')
  final String templateVersion;

  CustomMessageActivity({
    this.deliveryUri,
    this.endpointTypes,
    this.messageConfig,
    this.nextActivity,
    this.templateName,
    this.templateVersion,
  });
  factory CustomMessageActivity.fromJson(Map<String, dynamic> json) =>
      _$CustomMessageActivityFromJson(json);

  Map<String, dynamic> toJson() => _$CustomMessageActivityToJson(this);
}

/// Specifies the default message for all channels.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DefaultMessage {
  /// The default body of the message.
  @_s.JsonKey(name: 'Body')
  final String body;

  /// The default message variables to use in the message. You can override these
  /// default variables with individual address variables.
  @_s.JsonKey(name: 'Substitutions')
  final Map<String, List<String>> substitutions;

  DefaultMessage({
    this.body,
    this.substitutions,
  });
  Map<String, dynamic> toJson() => _$DefaultMessageToJson(this);
}

/// Specifies the default settings and content for a push notification that's
/// sent directly to an endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @_s.JsonKey(name: 'Action')
  final Action action;

  /// The default body of the notification message.
  @_s.JsonKey(name: 'Body')
  final String body;

  /// The JSON data payload to use for the default push notification, if the
  /// notification is a silent push notification. This payload is added to the
  /// data.pinpoint.jsonBody object of the notification.
  @_s.JsonKey(name: 'Data')
  final Map<String, String> data;

  /// Specifies whether the default notification is a silent push notification,
  /// which is a push notification that doesn't display on a recipient's device.
  /// Silent push notifications can be used for cases such as updating an app's
  /// configuration or delivering messages to an in-app notification center.
  @_s.JsonKey(name: 'SilentPush')
  final bool silentPush;

  /// The default message variables to use in the notification message. You can
  /// override the default variables with individual address variables.
  @_s.JsonKey(name: 'Substitutions')
  final Map<String, List<String>> substitutions;

  /// The default title to display above the notification message on a recipient's
  /// device.
  @_s.JsonKey(name: 'Title')
  final String title;

  /// The default URL to open in a recipient's default mobile browser, if a
  /// recipient taps the push notification and the value of the Action property is
  /// URL.
  @_s.JsonKey(name: 'Url')
  final String url;

  DefaultPushNotificationMessage({
    this.action,
    this.body,
    this.data,
    this.silentPush,
    this.substitutions,
    this.title,
    this.url,
  });
  Map<String, dynamic> toJson() => _$DefaultPushNotificationMessageToJson(this);
}

/// Specifies the default settings and content for a message template that can
/// be used in messages that are sent through a push notification channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'Action')
  final Action action;

  /// The message body to use in push notifications that are based on the message
  /// template.
  @_s.JsonKey(name: 'Body')
  final String body;

  /// The sound to play when a recipient receives a push notification that's based
  /// on the message template. You can use the default stream or specify the file
  /// name of a sound resource that's bundled in your app. On an Android platform,
  /// the sound file must reside in /res/raw/.
  ///
  /// For an iOS platform, this value is the key for the name of a sound file in
  /// your app's main bundle or the Library/Sounds folder in your app's data
  /// container. If the sound file can't be found or you specify default for the
  /// value, the system plays the default alert sound.
  @_s.JsonKey(name: 'Sound')
  final String sound;

  /// The title to use in push notifications that are based on the message
  /// template. This title appears above the notification message on a recipient's
  /// device.
  @_s.JsonKey(name: 'Title')
  final String title;

  /// The URL to open in a recipient's default mobile browser, if a recipient taps
  /// a push notification that's based on the message template and the value of
  /// the Action property is URL.
  @_s.JsonKey(name: 'Url')
  final String url;

  DefaultPushNotificationTemplate({
    this.action,
    this.body,
    this.sound,
    this.title,
    this.url,
  });
  factory DefaultPushNotificationTemplate.fromJson(Map<String, dynamic> json) =>
      _$DefaultPushNotificationTemplateFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DefaultPushNotificationTemplateToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAdmChannelResponse {
  @_s.JsonKey(name: 'ADMChannelResponse')
  final ADMChannelResponse aDMChannelResponse;

  DeleteAdmChannelResponse({
    @_s.required this.aDMChannelResponse,
  });
  factory DeleteAdmChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAdmChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteApnsChannelResponse {
  @_s.JsonKey(name: 'APNSChannelResponse')
  final APNSChannelResponse aPNSChannelResponse;

  DeleteApnsChannelResponse({
    @_s.required this.aPNSChannelResponse,
  });
  factory DeleteApnsChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteApnsChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteApnsSandboxChannelResponse {
  @_s.JsonKey(name: 'APNSSandboxChannelResponse')
  final APNSSandboxChannelResponse aPNSSandboxChannelResponse;

  DeleteApnsSandboxChannelResponse({
    @_s.required this.aPNSSandboxChannelResponse,
  });
  factory DeleteApnsSandboxChannelResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteApnsSandboxChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteApnsVoipChannelResponse {
  @_s.JsonKey(name: 'APNSVoipChannelResponse')
  final APNSVoipChannelResponse aPNSVoipChannelResponse;

  DeleteApnsVoipChannelResponse({
    @_s.required this.aPNSVoipChannelResponse,
  });
  factory DeleteApnsVoipChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteApnsVoipChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteApnsVoipSandboxChannelResponse {
  @_s.JsonKey(name: 'APNSVoipSandboxChannelResponse')
  final APNSVoipSandboxChannelResponse aPNSVoipSandboxChannelResponse;

  DeleteApnsVoipSandboxChannelResponse({
    @_s.required this.aPNSVoipSandboxChannelResponse,
  });
  factory DeleteApnsVoipSandboxChannelResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteApnsVoipSandboxChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAppResponse {
  @_s.JsonKey(name: 'ApplicationResponse')
  final ApplicationResponse applicationResponse;

  DeleteAppResponse({
    @_s.required this.applicationResponse,
  });
  factory DeleteAppResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAppResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBaiduChannelResponse {
  @_s.JsonKey(name: 'BaiduChannelResponse')
  final BaiduChannelResponse baiduChannelResponse;

  DeleteBaiduChannelResponse({
    @_s.required this.baiduChannelResponse,
  });
  factory DeleteBaiduChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteBaiduChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteCampaignResponse {
  @_s.JsonKey(name: 'CampaignResponse')
  final CampaignResponse campaignResponse;

  DeleteCampaignResponse({
    @_s.required this.campaignResponse,
  });
  factory DeleteCampaignResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteCampaignResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteEmailChannelResponse {
  @_s.JsonKey(name: 'EmailChannelResponse')
  final EmailChannelResponse emailChannelResponse;

  DeleteEmailChannelResponse({
    @_s.required this.emailChannelResponse,
  });
  factory DeleteEmailChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteEmailChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteEmailTemplateResponse {
  @_s.JsonKey(name: 'MessageBody')
  final MessageBody messageBody;

  DeleteEmailTemplateResponse({
    @_s.required this.messageBody,
  });
  factory DeleteEmailTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteEmailTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteEndpointResponse {
  @_s.JsonKey(name: 'EndpointResponse')
  final EndpointResponse endpointResponse;

  DeleteEndpointResponse({
    @_s.required this.endpointResponse,
  });
  factory DeleteEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteEndpointResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteEventStreamResponse {
  @_s.JsonKey(name: 'EventStream')
  final EventStream eventStream;

  DeleteEventStreamResponse({
    @_s.required this.eventStream,
  });
  factory DeleteEventStreamResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteEventStreamResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteGcmChannelResponse {
  @_s.JsonKey(name: 'GCMChannelResponse')
  final GCMChannelResponse gCMChannelResponse;

  DeleteGcmChannelResponse({
    @_s.required this.gCMChannelResponse,
  });
  factory DeleteGcmChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteGcmChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteJourneyResponse {
  @_s.JsonKey(name: 'JourneyResponse')
  final JourneyResponse journeyResponse;

  DeleteJourneyResponse({
    @_s.required this.journeyResponse,
  });
  factory DeleteJourneyResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteJourneyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeletePushTemplateResponse {
  @_s.JsonKey(name: 'MessageBody')
  final MessageBody messageBody;

  DeletePushTemplateResponse({
    @_s.required this.messageBody,
  });
  factory DeletePushTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$DeletePushTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRecommenderConfigurationResponse {
  @_s.JsonKey(name: 'RecommenderConfigurationResponse')
  final RecommenderConfigurationResponse recommenderConfigurationResponse;

  DeleteRecommenderConfigurationResponse({
    @_s.required this.recommenderConfigurationResponse,
  });
  factory DeleteRecommenderConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteRecommenderConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSegmentResponse {
  @_s.JsonKey(name: 'SegmentResponse')
  final SegmentResponse segmentResponse;

  DeleteSegmentResponse({
    @_s.required this.segmentResponse,
  });
  factory DeleteSegmentResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteSegmentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSmsChannelResponse {
  @_s.JsonKey(name: 'SMSChannelResponse')
  final SMSChannelResponse sMSChannelResponse;

  DeleteSmsChannelResponse({
    @_s.required this.sMSChannelResponse,
  });
  factory DeleteSmsChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteSmsChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSmsTemplateResponse {
  @_s.JsonKey(name: 'MessageBody')
  final MessageBody messageBody;

  DeleteSmsTemplateResponse({
    @_s.required this.messageBody,
  });
  factory DeleteSmsTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteSmsTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteUserEndpointsResponse {
  @_s.JsonKey(name: 'EndpointsResponse')
  final EndpointsResponse endpointsResponse;

  DeleteUserEndpointsResponse({
    @_s.required this.endpointsResponse,
  });
  factory DeleteUserEndpointsResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserEndpointsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteVoiceChannelResponse {
  @_s.JsonKey(name: 'VoiceChannelResponse')
  final VoiceChannelResponse voiceChannelResponse;

  DeleteVoiceChannelResponse({
    @_s.required this.voiceChannelResponse,
  });
  factory DeleteVoiceChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteVoiceChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteVoiceTemplateResponse {
  @_s.JsonKey(name: 'MessageBody')
  final MessageBody messageBody;

  DeleteVoiceTemplateResponse({
    @_s.required this.messageBody,
  });
  factory DeleteVoiceTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteVoiceTemplateResponseFromJson(json);
}

enum DeliveryStatus {
  @_s.JsonValue('SUCCESSFUL')
  successful,
  @_s.JsonValue('THROTTLED')
  throttled,
  @_s.JsonValue('TEMPORARY_FAILURE')
  temporaryFailure,
  @_s.JsonValue('PERMANENT_FAILURE')
  permanentFailure,
  @_s.JsonValue('UNKNOWN_FAILURE')
  unknownFailure,
  @_s.JsonValue('OPT_OUT')
  optOut,
  @_s.JsonValue('DUPLICATE')
  duplicate,
}

enum DimensionType {
  @_s.JsonValue('INCLUSIVE')
  inclusive,
  @_s.JsonValue('EXCLUSIVE')
  exclusive,
}

/// Specifies the settings and content for the default message and any default
/// messages that you tailored for specific channels.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DirectMessageConfiguration {
  /// The default push notification message for the ADM (Amazon Device Messaging)
  /// channel. This message overrides the default push notification message
  /// (DefaultPushNotificationMessage).
  @_s.JsonKey(name: 'ADMMessage')
  final ADMMessage aDMMessage;

  /// The default push notification message for the APNs (Apple Push Notification
  /// service) channel. This message overrides the default push notification
  /// message (DefaultPushNotificationMessage).
  @_s.JsonKey(name: 'APNSMessage')
  final APNSMessage aPNSMessage;

  /// The default push notification message for the Baidu (Baidu Cloud Push)
  /// channel. This message overrides the default push notification message
  /// (DefaultPushNotificationMessage).
  @_s.JsonKey(name: 'BaiduMessage')
  final BaiduMessage baiduMessage;

  /// The default message for all channels.
  @_s.JsonKey(name: 'DefaultMessage')
  final DefaultMessage defaultMessage;

  /// The default push notification message for all push notification channels.
  @_s.JsonKey(name: 'DefaultPushNotificationMessage')
  final DefaultPushNotificationMessage defaultPushNotificationMessage;

  /// The default message for the email channel. This message overrides the
  /// default message (DefaultMessage).
  @_s.JsonKey(name: 'EmailMessage')
  final EmailMessage emailMessage;

  /// The default push notification message for the GCM channel, which is used to
  /// send notifications through the Firebase Cloud Messaging (FCM), formerly
  /// Google Cloud Messaging (GCM), service. This message overrides the default
  /// push notification message (DefaultPushNotificationMessage).
  @_s.JsonKey(name: 'GCMMessage')
  final GCMMessage gCMMessage;

  /// The default message for the SMS channel. This message overrides the default
  /// message (DefaultMessage).
  @_s.JsonKey(name: 'SMSMessage')
  final SMSMessage sMSMessage;

  /// The default message for the voice channel. This message overrides the
  /// default message (DefaultMessage).
  @_s.JsonKey(name: 'VoiceMessage')
  final VoiceMessage voiceMessage;

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
  Map<String, dynamic> toJson() => _$DirectMessageConfigurationToJson(this);
}

enum Duration {
  @_s.JsonValue('HR_24')
  hr_24,
  @_s.JsonValue('DAY_7')
  day_7,
  @_s.JsonValue('DAY_14')
  day_14,
  @_s.JsonValue('DAY_30')
  day_30,
}

/// Specifies the status and settings of the email channel for an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EmailChannelRequest {
  /// The verified email address that you want to send email from when you send
  /// email through the channel.
  @_s.JsonKey(name: 'FromAddress')
  final String fromAddress;

  /// The Amazon Resource Name (ARN) of the identity, verified with Amazon Simple
  /// Email Service (Amazon SES), that you want to use when you send email through
  /// the channel.
  @_s.JsonKey(name: 'Identity')
  final String identity;

  /// The <a
  /// href="https://docs.aws.amazon.com/ses/latest/APIReference/API_ConfigurationSet.html">Amazon
  /// SES configuration set</a> that you want to apply to messages that you send
  /// through the channel.
  @_s.JsonKey(name: 'ConfigurationSet')
  final String configurationSet;

  /// Specifies whether to enable the email channel for the application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The ARN of the AWS Identity and Access Management (IAM) role that you want
  /// Amazon Pinpoint to use when it submits email-related event data for the
  /// channel.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  EmailChannelRequest({
    @_s.required this.fromAddress,
    @_s.required this.identity,
    this.configurationSet,
    this.enabled,
    this.roleArn,
  });
  Map<String, dynamic> toJson() => _$EmailChannelRequestToJson(this);
}

/// Provides information about the status and settings of the email channel for
/// an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EmailChannelResponse {
  /// The type of messaging or notification platform for the channel. For the
  /// email channel, this value is EMAIL.
  @_s.JsonKey(name: 'Platform')
  final String platform;

  /// The unique identifier for the application that the email channel applies to.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The <a
  /// href="https://docs.aws.amazon.com/ses/latest/APIReference/API_ConfigurationSet.html">Amazon
  /// SES configuration set</a> that's applied to messages that are sent through
  /// the channel.
  @_s.JsonKey(name: 'ConfigurationSet')
  final String configurationSet;

  /// The date and time, in ISO 8601 format, when the email channel was enabled.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// Specifies whether the email channel is enabled for the application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The verified email address that email is sent from when you send email
  /// through the channel.
  @_s.JsonKey(name: 'FromAddress')
  final String fromAddress;

  /// (Not used) This property is retained only for backward compatibility.
  @_s.JsonKey(name: 'HasCredential')
  final bool hasCredential;

  /// (Deprecated) An identifier for the email channel. This property is retained
  /// only for backward compatibility.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The Amazon Resource Name (ARN) of the identity, verified with Amazon Simple
  /// Email Service (Amazon SES), that's used when you send email through the
  /// channel.
  @_s.JsonKey(name: 'Identity')
  final String identity;

  /// Specifies whether the email channel is archived.
  @_s.JsonKey(name: 'IsArchived')
  final bool isArchived;

  /// The user who last modified the email channel.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The date and time, in ISO 8601 format, when the email channel was last
  /// modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The maximum number of emails that can be sent through the channel each
  /// second.
  @_s.JsonKey(name: 'MessagesPerSecond')
  final int messagesPerSecond;

  /// The ARN of the AWS Identity and Access Management (IAM) role that Amazon
  /// Pinpoint uses to submit email-related event data for the channel.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// The current version of the email channel.
  @_s.JsonKey(name: 'Version')
  final int version;

  EmailChannelResponse({
    @_s.required this.platform,
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
    this.roleArn,
    this.version,
  });
  factory EmailChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailChannelResponseFromJson(json);
}

/// Specifies the default settings and content for a one-time email message
/// that's sent directly to an endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EmailMessage {
  /// The body of the email message.
  @_s.JsonKey(name: 'Body')
  final String body;

  /// The email address to forward bounces and complaints to, if feedback
  /// forwarding is enabled.
  @_s.JsonKey(name: 'FeedbackForwardingAddress')
  final String feedbackForwardingAddress;

  /// The verified email address to send the email message from. The default value
  /// is the FromAddress specified for the email channel.
  @_s.JsonKey(name: 'FromAddress')
  final String fromAddress;

  /// The email message, represented as a raw MIME message.
  @_s.JsonKey(name: 'RawEmail')
  final RawEmail rawEmail;

  /// The reply-to email address(es) for the email message. If a recipient replies
  /// to the email, each reply-to address receives the reply.
  @_s.JsonKey(name: 'ReplyToAddresses')
  final List<String> replyToAddresses;

  /// The email message, composed of a subject, a text part, and an HTML part.
  @_s.JsonKey(name: 'SimpleEmail')
  final SimpleEmail simpleEmail;

  /// The default message variables to use in the email message. You can override
  /// the default variables with individual address variables.
  @_s.JsonKey(name: 'Substitutions')
  final Map<String, List<String>> substitutions;

  EmailMessage({
    this.body,
    this.feedbackForwardingAddress,
    this.fromAddress,
    this.rawEmail,
    this.replyToAddresses,
    this.simpleEmail,
    this.substitutions,
  });
  Map<String, dynamic> toJson() => _$EmailMessageToJson(this);
}

/// Specifies the settings for an email activity in a journey. This type of
/// activity sends an email message to participants.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EmailMessageActivity {
  /// Specifies the sender address for an email message that's sent to
  /// participants in the journey.
  @_s.JsonKey(name: 'MessageConfig')
  final JourneyEmailMessage messageConfig;

  /// The unique identifier for the next activity to perform, after the message is
  /// sent.
  @_s.JsonKey(name: 'NextActivity')
  final String nextActivity;

  /// The name of the email message template to use for the message. If specified,
  /// this value must match the name of an existing message template.
  @_s.JsonKey(name: 'TemplateName')
  final String templateName;

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
  @_s.JsonKey(name: 'TemplateVersion')
  final String templateVersion;

  EmailMessageActivity({
    this.messageConfig,
    this.nextActivity,
    this.templateName,
    this.templateVersion,
  });
  factory EmailMessageActivity.fromJson(Map<String, dynamic> json) =>
      _$EmailMessageActivityFromJson(json);

  Map<String, dynamic> toJson() => _$EmailMessageActivityToJson(this);
}

/// Specifies the content and settings for a message template that can be used
/// in messages that are sent through the email channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EmailTemplateRequest {
  /// A JSON object that specifies the default values to use for message variables
  /// in the message template. This object is a set of key-value pairs. Each key
  /// defines a message variable in the template. The corresponding value defines
  /// the default value for that variable. When you create a message that's based
  /// on the template, you can override these defaults with message-specific and
  /// address-specific variables and values.
  @_s.JsonKey(name: 'DefaultSubstitutions')
  final String defaultSubstitutions;

  /// The message body, in HTML format, to use in email messages that are based on
  /// the message template. We recommend using HTML format for email clients that
  /// render HTML content. You can include links, formatted text, and more in an
  /// HTML message.
  @_s.JsonKey(name: 'HtmlPart')
  final String htmlPart;

  /// The unique identifier for the recommender model to use for the message
  /// template. Amazon Pinpoint uses this value to determine how to retrieve and
  /// process data from a recommender model when it sends messages that use the
  /// template, if the template contains message variables for recommendation
  /// data.
  @_s.JsonKey(name: 'RecommenderId')
  final String recommenderId;

  /// The subject line, or title, to use in email messages that are based on the
  /// message template.
  @_s.JsonKey(name: 'Subject')
  final String subject;

  /// A custom description of the message template.
  @_s.JsonKey(name: 'TemplateDescription')
  final String templateDescription;

  /// The message body, in plain text format, to use in email messages that are
  /// based on the message template. We recommend using plain text format for
  /// email clients that don't render HTML content and clients that are connected
  /// to high-latency networks, such as mobile devices.
  @_s.JsonKey(name: 'TextPart')
  final String textPart;

  /// A string-to-string map of key-value pairs that defines the tags to associate
  /// with the message template. Each tag consists of a required tag key and an
  /// associated tag value.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  EmailTemplateRequest({
    this.defaultSubstitutions,
    this.htmlPart,
    this.recommenderId,
    this.subject,
    this.templateDescription,
    this.textPart,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$EmailTemplateRequestToJson(this);
}

/// Provides information about the content and settings for a message template
/// that can be used in messages that are sent through the email channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EmailTemplateResponse {
  /// The date, in ISO 8601 format, when the message template was created.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The date, in ISO 8601 format, when the message template was last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The name of the message template.
  @_s.JsonKey(name: 'TemplateName')
  final String templateName;

  /// The type of channel that the message template is designed for. For an email
  /// template, this value is EMAIL.
  @_s.JsonKey(name: 'TemplateType')
  final TemplateType templateType;

  /// The Amazon Resource Name (ARN) of the message template.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The JSON object that specifies the default values that are used for message
  /// variables in the message template. This object is a set of key-value pairs.
  /// Each key defines a message variable in the template. The corresponding value
  /// defines the default value for that variable.
  @_s.JsonKey(name: 'DefaultSubstitutions')
  final String defaultSubstitutions;

  /// The message body, in HTML format, that's used in email messages that are
  /// based on the message template.
  @_s.JsonKey(name: 'HtmlPart')
  final String htmlPart;

  /// The unique identifier for the recommender model that's used by the message
  /// template.
  @_s.JsonKey(name: 'RecommenderId')
  final String recommenderId;

  /// The subject line, or title, that's used in email messages that are based on
  /// the message template.
  @_s.JsonKey(name: 'Subject')
  final String subject;

  /// The custom description of the message template.
  @_s.JsonKey(name: 'TemplateDescription')
  final String templateDescription;

  /// The message body, in plain text format, that's used in email messages that
  /// are based on the message template.
  @_s.JsonKey(name: 'TextPart')
  final String textPart;

  /// The unique identifier, as an integer, for the active version of the message
  /// template, or the version of the template that you specified by using the
  /// version parameter in your request.
  @_s.JsonKey(name: 'Version')
  final String version;

  /// A string-to-string map of key-value pairs that identifies the tags that are
  /// associated with the message template. Each tag consists of a required tag
  /// key and an associated tag value.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  EmailTemplateResponse({
    @_s.required this.creationDate,
    @_s.required this.lastModifiedDate,
    @_s.required this.templateName,
    @_s.required this.templateType,
    this.arn,
    this.defaultSubstitutions,
    this.htmlPart,
    this.recommenderId,
    this.subject,
    this.templateDescription,
    this.textPart,
    this.version,
    this.tags,
  });
  factory EmailTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailTemplateResponseFromJson(json);
}

/// Specifies an endpoint to create or update and the settings and attributes to
/// set or change for the endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EndpointBatchItem {
  /// The destination address for messages or push notifications that you send to
  /// the endpoint. The address varies by channel. For a push-notification
  /// channel, use the token provided by the push notification service, such as an
  /// Apple Push Notification service (APNs) device token or a Firebase Cloud
  /// Messaging (FCM) registration token. For the SMS channel, use a phone number
  /// in E.164 format, such as +12065550100. For the email channel, use an email
  /// address.
  @_s.JsonKey(name: 'Address')
  final String address;

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
  @_s.JsonKey(name: 'Attributes')
  final Map<String, List<String>> attributes;

  /// The channel to use when sending messages or push notifications to the
  /// endpoint.
  @_s.JsonKey(name: 'ChannelType')
  final ChannelType channelType;

  /// The demographic information for the endpoint, such as the time zone and
  /// platform.
  @_s.JsonKey(name: 'Demographic')
  final EndpointDemographic demographic;

  /// The date and time, in ISO 8601 format, when the endpoint was created or
  /// updated.
  @_s.JsonKey(name: 'EffectiveDate')
  final String effectiveDate;

  /// Specifies whether to send messages or push notifications to the endpoint.
  /// Valid values are: ACTIVE, messages are sent to the endpoint; and, INACTIVE,
  /// messages aren’t sent to the endpoint.
  ///
  /// Amazon Pinpoint automatically sets this value to ACTIVE when you create an
  /// endpoint or update an existing endpoint. Amazon Pinpoint automatically sets
  /// this value to INACTIVE if you update another endpoint that has the same
  /// address specified by the Address property.
  @_s.JsonKey(name: 'EndpointStatus')
  final String endpointStatus;

  /// The unique identifier for the endpoint in the context of the batch.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The geographic information for the endpoint.
  @_s.JsonKey(name: 'Location')
  final EndpointLocation location;

  /// One or more custom metrics that your app reports to Amazon Pinpoint for the
  /// endpoint.
  @_s.JsonKey(name: 'Metrics')
  final Map<String, double> metrics;

  /// Specifies whether the user who's associated with the endpoint has opted out
  /// of receiving messages and push notifications from you. Possible values are:
  /// ALL, the user has opted out and doesn't want to receive any messages or push
  /// notifications; and, NONE, the user hasn't opted out and wants to receive all
  /// messages and push notifications.
  @_s.JsonKey(name: 'OptOut')
  final String optOut;

  /// The unique identifier for the request to create or update the endpoint.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// One or more custom attributes that describe the user who's associated with
  /// the endpoint.
  @_s.JsonKey(name: 'User')
  final EndpointUser user;

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
  Map<String, dynamic> toJson() => _$EndpointBatchItemToJson(this);
}

/// Specifies a batch of endpoints to create or update and the settings and
/// attributes to set or change for each endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EndpointBatchRequest {
  /// An array that defines the endpoints to create or update and, for each
  /// endpoint, the property values to set or change. An array can contain a
  /// maximum of 100 items.
  @_s.JsonKey(name: 'Item')
  final List<EndpointBatchItem> item;

  EndpointBatchRequest({
    @_s.required this.item,
  });
  Map<String, dynamic> toJson() => _$EndpointBatchRequestToJson(this);
}

/// Specifies demographic information about an endpoint, such as the applicable
/// time zone and platform.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EndpointDemographic {
  /// The version of the app that's associated with the endpoint.
  @_s.JsonKey(name: 'AppVersion')
  final String appVersion;

  /// The locale of the endpoint, in the following format: the ISO 639-1 alpha-2
  /// code, followed by an underscore (_), followed by an ISO 3166-1 alpha-2
  /// value.
  @_s.JsonKey(name: 'Locale')
  final String locale;

  /// The manufacturer of the endpoint device, such as apple or samsung.
  @_s.JsonKey(name: 'Make')
  final String make;

  /// The model name or number of the endpoint device, such as iPhone or SM-G900F.
  @_s.JsonKey(name: 'Model')
  final String model;

  /// The model version of the endpoint device.
  @_s.JsonKey(name: 'ModelVersion')
  final String modelVersion;

  /// The platform of the endpoint device, such as ios.
  @_s.JsonKey(name: 'Platform')
  final String platform;

  /// The platform version of the endpoint device.
  @_s.JsonKey(name: 'PlatformVersion')
  final String platformVersion;

  /// The time zone of the endpoint, specified as a tz database name value, such
  /// as America/Los_Angeles.
  @_s.JsonKey(name: 'Timezone')
  final String timezone;

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
  factory EndpointDemographic.fromJson(Map<String, dynamic> json) =>
      _$EndpointDemographicFromJson(json);

  Map<String, dynamic> toJson() => _$EndpointDemographicToJson(this);
}

/// Provides the status code and message that result from processing data for an
/// endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EndpointItemResponse {
  /// The custom message that's returned in the response as a result of processing
  /// the endpoint data.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The status code that's returned in the response as a result of processing
  /// the endpoint data.
  @_s.JsonKey(name: 'StatusCode')
  final int statusCode;

  EndpointItemResponse({
    this.message,
    this.statusCode,
  });
  factory EndpointItemResponse.fromJson(Map<String, dynamic> json) =>
      _$EndpointItemResponseFromJson(json);
}

/// Specifies geographic information about an endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EndpointLocation {
  /// The name of the city where the endpoint is located.
  @_s.JsonKey(name: 'City')
  final String city;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region where the endpoint is located. For example, US for the United States.
  @_s.JsonKey(name: 'Country')
  final String country;

  /// The latitude coordinate of the endpoint location, rounded to one decimal
  /// place.
  @_s.JsonKey(name: 'Latitude')
  final double latitude;

  /// The longitude coordinate of the endpoint location, rounded to one decimal
  /// place.
  @_s.JsonKey(name: 'Longitude')
  final double longitude;

  /// The postal or ZIP code for the area where the endpoint is located.
  @_s.JsonKey(name: 'PostalCode')
  final String postalCode;

  /// The name of the region where the endpoint is located. For locations in the
  /// United States, this value is the name of a state.
  @_s.JsonKey(name: 'Region')
  final String region;

  EndpointLocation({
    this.city,
    this.country,
    this.latitude,
    this.longitude,
    this.postalCode,
    this.region,
  });
  factory EndpointLocation.fromJson(Map<String, dynamic> json) =>
      _$EndpointLocationFromJson(json);

  Map<String, dynamic> toJson() => _$EndpointLocationToJson(this);
}

/// Provides information about the delivery status and results of sending a
/// message directly to an endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  /// TIMEOUT - The message couldn't be sent within the timeout period.
  /// </li>
  /// <li>
  /// UNKNOWN_FAILURE - An unknown error occurred.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'DeliveryStatus')
  final DeliveryStatus deliveryStatus;

  /// The downstream service status code for delivering the message.
  @_s.JsonKey(name: 'StatusCode')
  final int statusCode;

  /// The endpoint address that the message was delivered to.
  @_s.JsonKey(name: 'Address')
  final String address;

  /// The unique identifier for the message that was sent.
  @_s.JsonKey(name: 'MessageId')
  final String messageId;

  /// The status message for delivering the message.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// For push notifications that are sent through the GCM channel, specifies
  /// whether the endpoint's device registration token was updated as part of
  /// delivering the message.
  @_s.JsonKey(name: 'UpdatedToken')
  final String updatedToken;

  EndpointMessageResult({
    @_s.required this.deliveryStatus,
    @_s.required this.statusCode,
    this.address,
    this.messageId,
    this.statusMessage,
    this.updatedToken,
  });
  factory EndpointMessageResult.fromJson(Map<String, dynamic> json) =>
      _$EndpointMessageResultFromJson(json);
}

/// Specifies the channel type and other settings for an endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EndpointRequest {
  /// The destination address for messages or push notifications that you send to
  /// the endpoint. The address varies by channel. For a push-notification
  /// channel, use the token provided by the push notification service, such as an
  /// Apple Push Notification service (APNs) device token or a Firebase Cloud
  /// Messaging (FCM) registration token. For the SMS channel, use a phone number
  /// in E.164 format, such as +12065550100. For the email channel, use an email
  /// address.
  @_s.JsonKey(name: 'Address')
  final String address;

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
  @_s.JsonKey(name: 'Attributes')
  final Map<String, List<String>> attributes;

  /// The channel to use when sending messages or push notifications to the
  /// endpoint.
  @_s.JsonKey(name: 'ChannelType')
  final ChannelType channelType;

  /// The demographic information for the endpoint, such as the time zone and
  /// platform.
  @_s.JsonKey(name: 'Demographic')
  final EndpointDemographic demographic;

  /// The date and time, in ISO 8601 format, when the endpoint is updated.
  @_s.JsonKey(name: 'EffectiveDate')
  final String effectiveDate;

  /// Specifies whether to send messages or push notifications to the endpoint.
  /// Valid values are: ACTIVE, messages are sent to the endpoint; and, INACTIVE,
  /// messages aren’t sent to the endpoint.
  ///
  /// Amazon Pinpoint automatically sets this value to ACTIVE when you create an
  /// endpoint or update an existing endpoint. Amazon Pinpoint automatically sets
  /// this value to INACTIVE if you update another endpoint that has the same
  /// address specified by the Address property.
  @_s.JsonKey(name: 'EndpointStatus')
  final String endpointStatus;

  /// The geographic information for the endpoint.
  @_s.JsonKey(name: 'Location')
  final EndpointLocation location;

  /// One or more custom metrics that your app reports to Amazon Pinpoint for the
  /// endpoint.
  @_s.JsonKey(name: 'Metrics')
  final Map<String, double> metrics;

  /// Specifies whether the user who's associated with the endpoint has opted out
  /// of receiving messages and push notifications from you. Possible values are:
  /// ALL, the user has opted out and doesn't want to receive any messages or push
  /// notifications; and, NONE, the user hasn't opted out and wants to receive all
  /// messages and push notifications.
  @_s.JsonKey(name: 'OptOut')
  final String optOut;

  /// The unique identifier for the most recent request to update the endpoint.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// One or more custom attributes that describe the user who's associated with
  /// the endpoint.
  @_s.JsonKey(name: 'User')
  final EndpointUser user;

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
  Map<String, dynamic> toJson() => _$EndpointRequestToJson(this);
}

/// Provides information about the channel type and other settings for an
/// endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EndpointResponse {
  /// The destination address for messages or push notifications that you send to
  /// the endpoint. The address varies by channel. For example, the address for a
  /// push-notification channel is typically the token provided by a push
  /// notification service, such as an Apple Push Notification service (APNs)
  /// device token or a Firebase Cloud Messaging (FCM) registration token. The
  /// address for the SMS channel is a phone number in E.164 format, such as
  /// +12065550100. The address for the email channel is an email address.
  @_s.JsonKey(name: 'Address')
  final String address;

  /// The unique identifier for the application that's associated with the
  /// endpoint.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// One or more custom attributes that describe the endpoint by associating a
  /// name with an array of values. For example, the value of a custom attribute
  /// named Interests might be: ["Science", "Music", "Travel"]. You can use these
  /// attributes as filter criteria when you create segments.
  @_s.JsonKey(name: 'Attributes')
  final Map<String, List<String>> attributes;

  /// The channel that's used when sending messages or push notifications to the
  /// endpoint.
  @_s.JsonKey(name: 'ChannelType')
  final ChannelType channelType;

  /// A number from 0-99 that represents the cohort that the endpoint is assigned
  /// to. Endpoints are grouped into cohorts randomly, and each cohort contains
  /// approximately 1 percent of the endpoints for an application. Amazon Pinpoint
  /// assigns cohorts to the holdout or treatment allocations for campaigns.
  @_s.JsonKey(name: 'CohortId')
  final String cohortId;

  /// The date and time, in ISO 8601 format, when the endpoint was created.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The demographic information for the endpoint, such as the time zone and
  /// platform.
  @_s.JsonKey(name: 'Demographic')
  final EndpointDemographic demographic;

  /// The date and time, in ISO 8601 format, when the endpoint was last updated.
  @_s.JsonKey(name: 'EffectiveDate')
  final String effectiveDate;

  /// Specifies whether messages or push notifications are sent to the endpoint.
  /// Possible values are: ACTIVE, messages are sent to the endpoint; and,
  /// INACTIVE, messages aren’t sent to the endpoint.
  ///
  /// Amazon Pinpoint automatically sets this value to ACTIVE when you create an
  /// endpoint or update an existing endpoint. Amazon Pinpoint automatically sets
  /// this value to INACTIVE if you update another endpoint that has the same
  /// address specified by the Address property.
  @_s.JsonKey(name: 'EndpointStatus')
  final String endpointStatus;

  /// The unique identifier that you assigned to the endpoint. The identifier
  /// should be a globally unique identifier (GUID) to ensure that it doesn't
  /// conflict with other endpoint identifiers that are associated with the
  /// application.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The geographic information for the endpoint.
  @_s.JsonKey(name: 'Location')
  final EndpointLocation location;

  /// One or more custom metrics that your app reports to Amazon Pinpoint for the
  /// endpoint.
  @_s.JsonKey(name: 'Metrics')
  final Map<String, double> metrics;

  /// Specifies whether the user who's associated with the endpoint has opted out
  /// of receiving messages and push notifications from you. Possible values are:
  /// ALL, the user has opted out and doesn't want to receive any messages or push
  /// notifications; and, NONE, the user hasn't opted out and wants to receive all
  /// messages and push notifications.
  @_s.JsonKey(name: 'OptOut')
  final String optOut;

  /// The unique identifier for the most recent request to update the endpoint.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// One or more custom user attributes that your app reports to Amazon Pinpoint
  /// for the user who's associated with the endpoint.
  @_s.JsonKey(name: 'User')
  final EndpointUser user;

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
  factory EndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$EndpointResponseFromJson(json);
}

/// Specifies the content, including message variables and attributes, to use in
/// a message that's sent directly to an endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EndpointSendConfiguration {
  /// The body of the message. If specified, this value overrides the default
  /// message body.
  @_s.JsonKey(name: 'BodyOverride')
  final String bodyOverride;

  /// A map of custom attributes to attach to the message for the address.
  /// Attribute names are case sensitive.
  ///
  /// For a push notification, this payload is added to the data.pinpoint object.
  /// For an email or text message, this payload is added to email/SMS delivery
  /// receipt event attributes.
  @_s.JsonKey(name: 'Context')
  final Map<String, String> context;

  /// The raw, JSON-formatted string to use as the payload for the message. If
  /// specified, this value overrides all other values for the message.
  @_s.JsonKey(name: 'RawContent')
  final String rawContent;

  /// A map of the message variables to merge with the variables specified for the
  /// default message (DefaultMessage.Substitutions). The variables specified in
  /// this map take precedence over all other variables.
  @_s.JsonKey(name: 'Substitutions')
  final Map<String, List<String>> substitutions;

  /// The title or subject line of the message. If specified, this value overrides
  /// the default message title or subject line.
  @_s.JsonKey(name: 'TitleOverride')
  final String titleOverride;

  EndpointSendConfiguration({
    this.bodyOverride,
    this.context,
    this.rawContent,
    this.substitutions,
    this.titleOverride,
  });
  Map<String, dynamic> toJson() => _$EndpointSendConfigurationToJson(this);
}

/// Specifies data for one or more attributes that describe the user who's
/// associated with an endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'UserAttributes')
  final Map<String, List<String>> userAttributes;

  /// The unique identifier for the user.
  @_s.JsonKey(name: 'UserId')
  final String userId;

  EndpointUser({
    this.userAttributes,
    this.userId,
  });
  factory EndpointUser.fromJson(Map<String, dynamic> json) =>
      _$EndpointUserFromJson(json);

  Map<String, dynamic> toJson() => _$EndpointUserToJson(this);
}

/// Provides information about all the endpoints that are associated with a user
/// ID.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EndpointsResponse {
  /// An array of responses, one for each endpoint that's associated with the user
  /// ID.
  @_s.JsonKey(name: 'Item')
  final List<EndpointResponse> item;

  EndpointsResponse({
    @_s.required this.item,
  });
  factory EndpointsResponse.fromJson(Map<String, dynamic> json) =>
      _$EndpointsResponseFromJson(json);
}

/// Specifies information about an event that reports data to Amazon Pinpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Event {
  /// The name of the event.
  @_s.JsonKey(name: 'EventType')
  final String eventType;

  /// The date and time, in ISO 8601 format, when the event occurred.
  @_s.JsonKey(name: 'Timestamp')
  final String timestamp;

  /// The package name of the app that's recording the event.
  @_s.JsonKey(name: 'AppPackageName')
  final String appPackageName;

  /// The title of the app that's recording the event.
  @_s.JsonKey(name: 'AppTitle')
  final String appTitle;

  /// The version number of the app that's recording the event.
  @_s.JsonKey(name: 'AppVersionCode')
  final String appVersionCode;

  /// One or more custom attributes that are associated with the event.
  @_s.JsonKey(name: 'Attributes')
  final Map<String, String> attributes;

  /// The version of the SDK that's running on the client device.
  @_s.JsonKey(name: 'ClientSdkVersion')
  final String clientSdkVersion;

  /// One or more custom metrics that are associated with the event.
  @_s.JsonKey(name: 'Metrics')
  final Map<String, double> metrics;

  /// The name of the SDK that's being used to record the event.
  @_s.JsonKey(name: 'SdkName')
  final String sdkName;

  /// Information about the session in which the event occurred.
  @_s.JsonKey(name: 'Session')
  final Session session;

  Event({
    @_s.required this.eventType,
    @_s.required this.timestamp,
    this.appPackageName,
    this.appTitle,
    this.appVersionCode,
    this.attributes,
    this.clientSdkVersion,
    this.metrics,
    this.sdkName,
    this.session,
  });
  Map<String, dynamic> toJson() => _$EventToJson(this);
}

/// Specifies the conditions to evaluate for an event that applies to an
/// activity in a journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EventCondition {
  /// The dimensions for the event filter to use for the activity.
  @_s.JsonKey(name: 'Dimensions')
  final EventDimensions dimensions;

  /// The message identifier (message_id) for the message to use when determining
  /// whether message events meet the condition.
  @_s.JsonKey(name: 'MessageActivity')
  final String messageActivity;

  EventCondition({
    this.dimensions,
    this.messageActivity,
  });
  factory EventCondition.fromJson(Map<String, dynamic> json) =>
      _$EventConditionFromJson(json);

  Map<String, dynamic> toJson() => _$EventConditionToJson(this);
}

/// Specifies the dimensions for an event filter that determines when a campaign
/// is sent or a journey activity is performed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EventDimensions {
  /// One or more custom attributes that your application reports to Amazon
  /// Pinpoint. You can use these attributes as selection criteria when you create
  /// an event filter.
  @_s.JsonKey(name: 'Attributes')
  final Map<String, AttributeDimension> attributes;

  /// The name of the event that causes the campaign to be sent or the journey
  /// activity to be performed. This can be a standard event that Amazon Pinpoint
  /// generates, such as _email.delivered. For campaigns, this can also be a
  /// custom event that's specific to your application. For information about
  /// standard events, see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/event-streams.html">Streaming
  /// Amazon Pinpoint Events</a> in the <i>Amazon Pinpoint Developer Guide</i>.
  @_s.JsonKey(name: 'EventType')
  final SetDimension eventType;

  /// One or more custom metrics that your application reports to Amazon Pinpoint.
  /// You can use these metrics as selection criteria when you create an event
  /// filter.
  @_s.JsonKey(name: 'Metrics')
  final Map<String, MetricDimension> metrics;

  EventDimensions({
    this.attributes,
    this.eventType,
    this.metrics,
  });
  factory EventDimensions.fromJson(Map<String, dynamic> json) =>
      _$EventDimensionsFromJson(json);

  Map<String, dynamic> toJson() => _$EventDimensionsToJson(this);
}

/// Specifies the settings for an event that causes a campaign to be sent or a
/// journey activity to be performed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EventFilter {
  /// The dimensions for the event filter to use for the campaign or the journey
  /// activity.
  @_s.JsonKey(name: 'Dimensions')
  final EventDimensions dimensions;

  /// The type of event that causes the campaign to be sent or the journey
  /// activity to be performed. Valid values are: SYSTEM, sends the campaign or
  /// performs the activity when a system event occurs; and, ENDPOINT, sends the
  /// campaign or performs the activity when an endpoint event (<link
  /// linkend="apps-application-id-events">Events resource</link>) occurs.
  @_s.JsonKey(name: 'FilterType')
  final FilterType filterType;

  EventFilter({
    @_s.required this.dimensions,
    @_s.required this.filterType,
  });
  factory EventFilter.fromJson(Map<String, dynamic> json) =>
      _$EventFilterFromJson(json);

  Map<String, dynamic> toJson() => _$EventFilterToJson(this);
}

/// Provides the status code and message that result from processing an event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventItemResponse {
  /// A custom message that's returned in the response as a result of processing
  /// the event.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The status code that's returned in the response as a result of processing
  /// the event. Possible values are: 202, for events that were accepted; and,
  /// 400, for events that weren't valid.
  @_s.JsonKey(name: 'StatusCode')
  final int statusCode;

  EventItemResponse({
    this.message,
    this.statusCode,
  });
  factory EventItemResponse.fromJson(Map<String, dynamic> json) =>
      _$EventItemResponseFromJson(json);
}

/// Specifies the settings for an event that causes a journey activity to start.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EventStartCondition {
  @_s.JsonKey(name: 'EventFilter')
  final EventFilter eventFilter;
  @_s.JsonKey(name: 'SegmentId')
  final String segmentId;

  EventStartCondition({
    this.eventFilter,
    this.segmentId,
  });
  factory EventStartCondition.fromJson(Map<String, dynamic> json) =>
      _$EventStartConditionFromJson(json);

  Map<String, dynamic> toJson() => _$EventStartConditionToJson(this);
}

/// Specifies settings for publishing event data to an Amazon Kinesis data
/// stream or an Amazon Kinesis Data Firehose delivery stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventStream {
  /// The unique identifier for the application to publish event data for.
  @_s.JsonKey(name: 'ApplicationId')
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
  @_s.JsonKey(name: 'DestinationStreamArn')
  final String destinationStreamArn;

  /// The AWS Identity and Access Management (IAM) role that authorizes Amazon
  /// Pinpoint to publish event data to the stream in your AWS account.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// (Deprecated) Your AWS account ID, which you assigned to an external ID key
  /// in an IAM trust policy. Amazon Pinpoint previously used this value to assume
  /// an IAM role when publishing event data, but we removed this requirement. We
  /// don't recommend use of external IDs for IAM roles that are assumed by Amazon
  /// Pinpoint.
  @_s.JsonKey(name: 'ExternalId')
  final String externalId;

  /// The date, in ISO 8601 format, when the event stream was last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The IAM user who last modified the event stream.
  @_s.JsonKey(name: 'LastUpdatedBy')
  final String lastUpdatedBy;

  EventStream({
    @_s.required this.applicationId,
    @_s.required this.destinationStreamArn,
    @_s.required this.roleArn,
    this.externalId,
    this.lastModifiedDate,
    this.lastUpdatedBy,
  });
  factory EventStream.fromJson(Map<String, dynamic> json) =>
      _$EventStreamFromJson(json);
}

/// Specifies a batch of endpoints and events to process.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EventsBatch {
  /// A set of properties and attributes that are associated with the endpoint.
  @_s.JsonKey(name: 'Endpoint')
  final PublicEndpoint endpoint;

  /// A set of properties that are associated with the event.
  @_s.JsonKey(name: 'Events')
  final Map<String, Event> events;

  EventsBatch({
    @_s.required this.endpoint,
    @_s.required this.events,
  });
  Map<String, dynamic> toJson() => _$EventsBatchToJson(this);
}

/// Specifies a batch of events to process.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EventsRequest {
  /// The batch of events to process. For each item in a batch, the endpoint ID
  /// acts as a key that has an EventsBatch object as its value.
  @_s.JsonKey(name: 'BatchItem')
  final Map<String, EventsBatch> batchItem;

  EventsRequest({
    @_s.required this.batchItem,
  });
  Map<String, dynamic> toJson() => _$EventsRequestToJson(this);
}

/// Provides information about endpoints and the events that they're associated
/// with.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventsResponse {
  /// A map that contains a multipart response for each endpoint. For each item in
  /// this object, the endpoint ID is the key and the item response is the value.
  /// If no item response exists, the value can also be one of the following: 202,
  /// the request was processed successfully; or 400, the payload wasn't valid or
  /// required fields were missing.
  @_s.JsonKey(name: 'Results')
  final Map<String, ItemResponse> results;

  EventsResponse({
    this.results,
  });
  factory EventsResponse.fromJson(Map<String, dynamic> json) =>
      _$EventsResponseFromJson(json);
}

/// Specifies the settings for a job that exports endpoint definitions to an
/// Amazon Simple Storage Service (Amazon S3) bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ExportJobRequest {
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorizes Amazon Pinpoint to access the Amazon S3 location
  /// where you want to export endpoint definitions to.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// The URL of the location in an Amazon Simple Storage Service (Amazon S3)
  /// bucket where you want to export endpoint definitions to. This location is
  /// typically a folder that contains multiple files. The URL should be in the
  /// following format:
  /// s3://<replaceable>bucket-name</replaceable>/<replaceable>folder-name</replaceable>/.
  @_s.JsonKey(name: 'S3UrlPrefix')
  final String s3UrlPrefix;

  /// The identifier for the segment to export endpoint definitions from. If you
  /// don't specify this value, Amazon Pinpoint exports definitions for all the
  /// endpoints that are associated with the application.
  @_s.JsonKey(name: 'SegmentId')
  final String segmentId;

  /// The version of the segment to export endpoint definitions from, if
  /// specified.
  @_s.JsonKey(name: 'SegmentVersion')
  final int segmentVersion;

  ExportJobRequest({
    @_s.required this.roleArn,
    @_s.required this.s3UrlPrefix,
    this.segmentId,
    this.segmentVersion,
  });
  Map<String, dynamic> toJson() => _$ExportJobRequestToJson(this);
}

/// Provides information about the resource settings for a job that exports
/// endpoint definitions to a file. The file can be added directly to an Amazon
/// Simple Storage Service (Amazon S3) bucket by using the Amazon Pinpoint API
/// or downloaded directly to a computer by using the Amazon Pinpoint console.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportJobResource {
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorized Amazon Pinpoint to access the Amazon S3 location
  /// where the endpoint definitions were exported to.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// The URL of the location in an Amazon Simple Storage Service (Amazon S3)
  /// bucket where the endpoint definitions were exported to. This location is
  /// typically a folder that contains multiple files. The URL should be in the
  /// following format:
  /// s3://<replaceable>bucket-name</replaceable>/<replaceable>folder-name</replaceable>/.
  @_s.JsonKey(name: 'S3UrlPrefix')
  final String s3UrlPrefix;

  /// The identifier for the segment that the endpoint definitions were exported
  /// from. If this value isn't present, Amazon Pinpoint exported definitions for
  /// all the endpoints that are associated with the application.
  @_s.JsonKey(name: 'SegmentId')
  final String segmentId;

  /// The version of the segment that the endpoint definitions were exported from.
  @_s.JsonKey(name: 'SegmentVersion')
  final int segmentVersion;

  ExportJobResource({
    @_s.required this.roleArn,
    @_s.required this.s3UrlPrefix,
    this.segmentId,
    this.segmentVersion,
  });
  factory ExportJobResource.fromJson(Map<String, dynamic> json) =>
      _$ExportJobResourceFromJson(json);
}

/// Provides information about the status and settings of a job that exports
/// endpoint definitions to a file. The file can be added directly to an Amazon
/// Simple Storage Service (Amazon S3) bucket by using the Amazon Pinpoint API
/// or downloaded directly to a computer by using the Amazon Pinpoint console.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportJobResponse {
  /// The unique identifier for the application that's associated with the export
  /// job.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The date, in ISO 8601 format, when the export job was created.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The resource settings that apply to the export job.
  @_s.JsonKey(name: 'Definition')
  final ExportJobResource definition;

  /// The unique identifier for the export job.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The status of the export job. The job status is FAILED if Amazon Pinpoint
  /// wasn't able to process one or more pieces in the job.
  @_s.JsonKey(name: 'JobStatus')
  final JobStatus jobStatus;

  /// The job type. This value is EXPORT for export jobs.
  @_s.JsonKey(name: 'Type')
  final String type;

  /// The number of pieces that were processed successfully (completed) by the
  /// export job, as of the time of the request.
  @_s.JsonKey(name: 'CompletedPieces')
  final int completedPieces;

  /// The date, in ISO 8601 format, when the export job was completed.
  @_s.JsonKey(name: 'CompletionDate')
  final String completionDate;

  /// The number of pieces that weren't processed successfully (failed) by the
  /// export job, as of the time of the request.
  @_s.JsonKey(name: 'FailedPieces')
  final int failedPieces;

  /// An array of entries, one for each of the first 100 entries that weren't
  /// processed successfully (failed) by the export job, if any.
  @_s.JsonKey(name: 'Failures')
  final List<String> failures;

  /// The total number of endpoint definitions that weren't processed successfully
  /// (failed) by the export job, typically because an error, such as a syntax
  /// error, occurred.
  @_s.JsonKey(name: 'TotalFailures')
  final int totalFailures;

  /// The total number of pieces that must be processed to complete the export
  /// job. Each piece consists of an approximately equal portion of the endpoint
  /// definitions that are part of the export job.
  @_s.JsonKey(name: 'TotalPieces')
  final int totalPieces;

  /// The total number of endpoint definitions that were processed by the export
  /// job.
  @_s.JsonKey(name: 'TotalProcessed')
  final int totalProcessed;

  ExportJobResponse({
    @_s.required this.applicationId,
    @_s.required this.creationDate,
    @_s.required this.definition,
    @_s.required this.id,
    @_s.required this.jobStatus,
    @_s.required this.type,
    this.completedPieces,
    this.completionDate,
    this.failedPieces,
    this.failures,
    this.totalFailures,
    this.totalPieces,
    this.totalProcessed,
  });
  factory ExportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$ExportJobResponseFromJson(json);
}

/// Provides information about all the export jobs that are associated with an
/// application or segment. An export job is a job that exports endpoint
/// definitions to a file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportJobsResponse {
  /// An array of responses, one for each export job that's associated with the
  /// application (Export Jobs resource) or segment (Segment Export Jobs
  /// resource).
  @_s.JsonKey(name: 'Item')
  final List<ExportJobResponse> item;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ExportJobsResponse({
    @_s.required this.item,
    this.nextToken,
  });
  factory ExportJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ExportJobsResponseFromJson(json);
}

enum FilterType {
  @_s.JsonValue('SYSTEM')
  system,
  @_s.JsonValue('ENDPOINT')
  endpoint,
}

enum Format {
  @_s.JsonValue('CSV')
  csv,
  @_s.JsonValue('JSON')
  json,
}

enum Frequency {
  @_s.JsonValue('ONCE')
  once,
  @_s.JsonValue('HOURLY')
  hourly,
  @_s.JsonValue('DAILY')
  daily,
  @_s.JsonValue('WEEKLY')
  weekly,
  @_s.JsonValue('MONTHLY')
  monthly,
  @_s.JsonValue('EVENT')
  event,
}

/// Specifies the status and settings of the GCM channel for an application.
/// This channel enables Amazon Pinpoint to send push notifications through the
/// Firebase Cloud Messaging (FCM), formerly Google Cloud Messaging (GCM),
/// service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GCMChannelRequest {
  /// The Web API Key, also referred to as an <i>API_KEY</i> or <i>server key</i>,
  /// that you received from Google to communicate with Google services.
  @_s.JsonKey(name: 'ApiKey')
  final String apiKey;

  /// Specifies whether to enable the GCM channel for the application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  GCMChannelRequest({
    @_s.required this.apiKey,
    this.enabled,
  });
  Map<String, dynamic> toJson() => _$GCMChannelRequestToJson(this);
}

/// Provides information about the status and settings of the GCM channel for an
/// application. The GCM channel enables Amazon Pinpoint to send push
/// notifications through the Firebase Cloud Messaging (FCM), formerly Google
/// Cloud Messaging (GCM), service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GCMChannelResponse {
  /// The Web API Key, also referred to as an <i>API_KEY</i> or <i>server key</i>,
  /// that you received from Google to communicate with Google services.
  @_s.JsonKey(name: 'Credential')
  final String credential;

  /// The type of messaging or notification platform for the channel. For the GCM
  /// channel, this value is GCM.
  @_s.JsonKey(name: 'Platform')
  final String platform;

  /// The unique identifier for the application that the GCM channel applies to.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The date and time when the GCM channel was enabled.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// Specifies whether the GCM channel is enabled for the application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// (Not used) This property is retained only for backward compatibility.
  @_s.JsonKey(name: 'HasCredential')
  final bool hasCredential;

  /// (Deprecated) An identifier for the GCM channel. This property is retained
  /// only for backward compatibility.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Specifies whether the GCM channel is archived.
  @_s.JsonKey(name: 'IsArchived')
  final bool isArchived;

  /// The user who last modified the GCM channel.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The date and time when the GCM channel was last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The current version of the GCM channel.
  @_s.JsonKey(name: 'Version')
  final int version;

  GCMChannelResponse({
    @_s.required this.credential,
    @_s.required this.platform,
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
  factory GCMChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$GCMChannelResponseFromJson(json);
}

/// Specifies the settings for a one-time message that's sent directly to an
/// endpoint through the GCM channel. The GCM channel enables Amazon Pinpoint to
/// send messages to the Firebase Cloud Messaging (FCM), formerly Google Cloud
/// Messaging (GCM), service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @_s.JsonKey(name: 'Action')
  final Action action;

  /// The body of the notification message.
  @_s.JsonKey(name: 'Body')
  final String body;

  /// An arbitrary string that identifies a group of messages that can be
  /// collapsed to ensure that only the last message is sent when delivery can
  /// resume. This helps avoid sending too many instances of the same messages
  /// when the recipient's device comes online again or becomes active.
  ///
  /// Amazon Pinpoint specifies this value in the Firebase Cloud Messaging (FCM)
  /// collapse_key parameter when it sends the notification message to FCM.
  @_s.JsonKey(name: 'CollapseKey')
  final String collapseKey;

  /// The JSON data payload to use for the push notification, if the notification
  /// is a silent push notification. This payload is added to the
  /// data.pinpoint.jsonBody object of the notification.
  @_s.JsonKey(name: 'Data')
  final Map<String, String> data;

  /// The icon image name of the asset saved in your app.
  @_s.JsonKey(name: 'IconReference')
  final String iconReference;

  /// The URL of the large icon image to display in the content view of the push
  /// notification.
  @_s.JsonKey(name: 'ImageIconUrl')
  final String imageIconUrl;

  /// The URL of an image to display in the push notification.
  @_s.JsonKey(name: 'ImageUrl')
  final String imageUrl;

  /// para>normal - The notification might be delayed. Delivery is optimized for
  /// battery usage on the recipient's device. Use this value unless immediate
  /// delivery is required.
  /// /listitem>
  /// <li>
  /// high - The notification is sent immediately and might wake a sleeping
  /// device.
  /// </li>/para>
  /// Amazon Pinpoint specifies this value in the FCM priority parameter when it
  /// sends the notification message to FCM.
  ///
  /// The equivalent values for Apple Push Notification service (APNs) are 5, for
  /// normal, and 10, for high. If you specify an APNs value for this property,
  /// Amazon Pinpoint accepts and converts the value to the corresponding FCM
  /// value.
  @_s.JsonKey(name: 'Priority')
  final String priority;

  /// The raw, JSON-formatted string to use as the payload for the notification
  /// message. If specified, this value overrides all other content for the
  /// message.
  @_s.JsonKey(name: 'RawContent')
  final String rawContent;

  /// The package name of the application where registration tokens must match in
  /// order for the recipient to receive the message.
  @_s.JsonKey(name: 'RestrictedPackageName')
  final String restrictedPackageName;

  /// Specifies whether the notification is a silent push notification, which is a
  /// push notification that doesn't display on a recipient's device. Silent push
  /// notifications can be used for cases such as updating an app's configuration
  /// or supporting phone home functionality.
  @_s.JsonKey(name: 'SilentPush')
  final bool silentPush;

  /// The URL of the small icon image to display in the status bar and the content
  /// view of the push notification.
  @_s.JsonKey(name: 'SmallImageIconUrl')
  final String smallImageIconUrl;

  /// The sound to play when the recipient receives the push notification. You can
  /// use the default stream or specify the file name of a sound resource that's
  /// bundled in your app. On an Android platform, the sound file must reside in
  /// /res/raw/.
  @_s.JsonKey(name: 'Sound')
  final String sound;

  /// The default message variables to use in the notification message. You can
  /// override the default variables with individual address variables.
  @_s.JsonKey(name: 'Substitutions')
  final Map<String, List<String>> substitutions;

  /// The amount of time, in seconds, that FCM should store and attempt to deliver
  /// the push notification, if the service is unable to deliver the notification
  /// the first time. If you don't specify this value, FCM defaults to the maximum
  /// value, which is 2,419,200 seconds (28 days).
  ///
  /// Amazon Pinpoint specifies this value in the FCM time_to_live parameter when
  /// it sends the notification message to FCM.
  @_s.JsonKey(name: 'TimeToLive')
  final int timeToLive;

  /// The title to display above the notification message on the recipient's
  /// device.
  @_s.JsonKey(name: 'Title')
  final String title;

  /// The URL to open in the recipient's default mobile browser, if a recipient
  /// taps the push notification and the value of the Action property is URL.
  @_s.JsonKey(name: 'Url')
  final String url;

  GCMMessage({
    this.action,
    this.body,
    this.collapseKey,
    this.data,
    this.iconReference,
    this.imageIconUrl,
    this.imageUrl,
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
  Map<String, dynamic> toJson() => _$GCMMessageToJson(this);
}

/// Specifies the GPS coordinates of a location.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GPSCoordinates {
  /// The latitude coordinate of the location.
  @_s.JsonKey(name: 'Latitude')
  final double latitude;

  /// The longitude coordinate of the location.
  @_s.JsonKey(name: 'Longitude')
  final double longitude;

  GPSCoordinates({
    @_s.required this.latitude,
    @_s.required this.longitude,
  });
  factory GPSCoordinates.fromJson(Map<String, dynamic> json) =>
      _$GPSCoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$GPSCoordinatesToJson(this);
}

/// Specifies GPS-based criteria for including or excluding endpoints from a
/// segment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GPSPointDimension {
  /// The GPS coordinates to measure distance from.
  @_s.JsonKey(name: 'Coordinates')
  final GPSCoordinates coordinates;

  /// The range, in kilometers, from the GPS coordinates.
  @_s.JsonKey(name: 'RangeInKilometers')
  final double rangeInKilometers;

  GPSPointDimension({
    @_s.required this.coordinates,
    this.rangeInKilometers,
  });
  factory GPSPointDimension.fromJson(Map<String, dynamic> json) =>
      _$GPSPointDimensionFromJson(json);

  Map<String, dynamic> toJson() => _$GPSPointDimensionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAdmChannelResponse {
  @_s.JsonKey(name: 'ADMChannelResponse')
  final ADMChannelResponse aDMChannelResponse;

  GetAdmChannelResponse({
    @_s.required this.aDMChannelResponse,
  });
  factory GetAdmChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAdmChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetApnsChannelResponse {
  @_s.JsonKey(name: 'APNSChannelResponse')
  final APNSChannelResponse aPNSChannelResponse;

  GetApnsChannelResponse({
    @_s.required this.aPNSChannelResponse,
  });
  factory GetApnsChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$GetApnsChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetApnsSandboxChannelResponse {
  @_s.JsonKey(name: 'APNSSandboxChannelResponse')
  final APNSSandboxChannelResponse aPNSSandboxChannelResponse;

  GetApnsSandboxChannelResponse({
    @_s.required this.aPNSSandboxChannelResponse,
  });
  factory GetApnsSandboxChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$GetApnsSandboxChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetApnsVoipChannelResponse {
  @_s.JsonKey(name: 'APNSVoipChannelResponse')
  final APNSVoipChannelResponse aPNSVoipChannelResponse;

  GetApnsVoipChannelResponse({
    @_s.required this.aPNSVoipChannelResponse,
  });
  factory GetApnsVoipChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$GetApnsVoipChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetApnsVoipSandboxChannelResponse {
  @_s.JsonKey(name: 'APNSVoipSandboxChannelResponse')
  final APNSVoipSandboxChannelResponse aPNSVoipSandboxChannelResponse;

  GetApnsVoipSandboxChannelResponse({
    @_s.required this.aPNSVoipSandboxChannelResponse,
  });
  factory GetApnsVoipSandboxChannelResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetApnsVoipSandboxChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAppResponse {
  @_s.JsonKey(name: 'ApplicationResponse')
  final ApplicationResponse applicationResponse;

  GetAppResponse({
    @_s.required this.applicationResponse,
  });
  factory GetAppResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAppResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetApplicationDateRangeKpiResponse {
  @_s.JsonKey(name: 'ApplicationDateRangeKpiResponse')
  final ApplicationDateRangeKpiResponse applicationDateRangeKpiResponse;

  GetApplicationDateRangeKpiResponse({
    @_s.required this.applicationDateRangeKpiResponse,
  });
  factory GetApplicationDateRangeKpiResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetApplicationDateRangeKpiResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetApplicationSettingsResponse {
  @_s.JsonKey(name: 'ApplicationSettingsResource')
  final ApplicationSettingsResource applicationSettingsResource;

  GetApplicationSettingsResponse({
    @_s.required this.applicationSettingsResource,
  });
  factory GetApplicationSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetApplicationSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAppsResponse {
  @_s.JsonKey(name: 'ApplicationsResponse')
  final ApplicationsResponse applicationsResponse;

  GetAppsResponse({
    @_s.required this.applicationsResponse,
  });
  factory GetAppsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAppsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBaiduChannelResponse {
  @_s.JsonKey(name: 'BaiduChannelResponse')
  final BaiduChannelResponse baiduChannelResponse;

  GetBaiduChannelResponse({
    @_s.required this.baiduChannelResponse,
  });
  factory GetBaiduChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBaiduChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCampaignActivitiesResponse {
  @_s.JsonKey(name: 'ActivitiesResponse')
  final ActivitiesResponse activitiesResponse;

  GetCampaignActivitiesResponse({
    @_s.required this.activitiesResponse,
  });
  factory GetCampaignActivitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCampaignActivitiesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCampaignDateRangeKpiResponse {
  @_s.JsonKey(name: 'CampaignDateRangeKpiResponse')
  final CampaignDateRangeKpiResponse campaignDateRangeKpiResponse;

  GetCampaignDateRangeKpiResponse({
    @_s.required this.campaignDateRangeKpiResponse,
  });
  factory GetCampaignDateRangeKpiResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCampaignDateRangeKpiResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCampaignResponse {
  @_s.JsonKey(name: 'CampaignResponse')
  final CampaignResponse campaignResponse;

  GetCampaignResponse({
    @_s.required this.campaignResponse,
  });
  factory GetCampaignResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCampaignResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCampaignVersionResponse {
  @_s.JsonKey(name: 'CampaignResponse')
  final CampaignResponse campaignResponse;

  GetCampaignVersionResponse({
    @_s.required this.campaignResponse,
  });
  factory GetCampaignVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCampaignVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCampaignVersionsResponse {
  @_s.JsonKey(name: 'CampaignsResponse')
  final CampaignsResponse campaignsResponse;

  GetCampaignVersionsResponse({
    @_s.required this.campaignsResponse,
  });
  factory GetCampaignVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCampaignVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCampaignsResponse {
  @_s.JsonKey(name: 'CampaignsResponse')
  final CampaignsResponse campaignsResponse;

  GetCampaignsResponse({
    @_s.required this.campaignsResponse,
  });
  factory GetCampaignsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCampaignsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetChannelsResponse {
  @_s.JsonKey(name: 'ChannelsResponse')
  final ChannelsResponse channelsResponse;

  GetChannelsResponse({
    @_s.required this.channelsResponse,
  });
  factory GetChannelsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetChannelsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEmailChannelResponse {
  @_s.JsonKey(name: 'EmailChannelResponse')
  final EmailChannelResponse emailChannelResponse;

  GetEmailChannelResponse({
    @_s.required this.emailChannelResponse,
  });
  factory GetEmailChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$GetEmailChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEmailTemplateResponse {
  @_s.JsonKey(name: 'EmailTemplateResponse')
  final EmailTemplateResponse emailTemplateResponse;

  GetEmailTemplateResponse({
    @_s.required this.emailTemplateResponse,
  });
  factory GetEmailTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$GetEmailTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEndpointResponse {
  @_s.JsonKey(name: 'EndpointResponse')
  final EndpointResponse endpointResponse;

  GetEndpointResponse({
    @_s.required this.endpointResponse,
  });
  factory GetEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$GetEndpointResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEventStreamResponse {
  @_s.JsonKey(name: 'EventStream')
  final EventStream eventStream;

  GetEventStreamResponse({
    @_s.required this.eventStream,
  });
  factory GetEventStreamResponse.fromJson(Map<String, dynamic> json) =>
      _$GetEventStreamResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetExportJobResponse {
  @_s.JsonKey(name: 'ExportJobResponse')
  final ExportJobResponse exportJobResponse;

  GetExportJobResponse({
    @_s.required this.exportJobResponse,
  });
  factory GetExportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$GetExportJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetExportJobsResponse {
  @_s.JsonKey(name: 'ExportJobsResponse')
  final ExportJobsResponse exportJobsResponse;

  GetExportJobsResponse({
    @_s.required this.exportJobsResponse,
  });
  factory GetExportJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetExportJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetGcmChannelResponse {
  @_s.JsonKey(name: 'GCMChannelResponse')
  final GCMChannelResponse gCMChannelResponse;

  GetGcmChannelResponse({
    @_s.required this.gCMChannelResponse,
  });
  factory GetGcmChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$GetGcmChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetImportJobResponse {
  @_s.JsonKey(name: 'ImportJobResponse')
  final ImportJobResponse importJobResponse;

  GetImportJobResponse({
    @_s.required this.importJobResponse,
  });
  factory GetImportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$GetImportJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetImportJobsResponse {
  @_s.JsonKey(name: 'ImportJobsResponse')
  final ImportJobsResponse importJobsResponse;

  GetImportJobsResponse({
    @_s.required this.importJobsResponse,
  });
  factory GetImportJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetImportJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetJourneyDateRangeKpiResponse {
  @_s.JsonKey(name: 'JourneyDateRangeKpiResponse')
  final JourneyDateRangeKpiResponse journeyDateRangeKpiResponse;

  GetJourneyDateRangeKpiResponse({
    @_s.required this.journeyDateRangeKpiResponse,
  });
  factory GetJourneyDateRangeKpiResponse.fromJson(Map<String, dynamic> json) =>
      _$GetJourneyDateRangeKpiResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetJourneyExecutionActivityMetricsResponse {
  @_s.JsonKey(name: 'JourneyExecutionActivityMetricsResponse')
  final JourneyExecutionActivityMetricsResponse
      journeyExecutionActivityMetricsResponse;

  GetJourneyExecutionActivityMetricsResponse({
    @_s.required this.journeyExecutionActivityMetricsResponse,
  });
  factory GetJourneyExecutionActivityMetricsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetJourneyExecutionActivityMetricsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetJourneyExecutionMetricsResponse {
  @_s.JsonKey(name: 'JourneyExecutionMetricsResponse')
  final JourneyExecutionMetricsResponse journeyExecutionMetricsResponse;

  GetJourneyExecutionMetricsResponse({
    @_s.required this.journeyExecutionMetricsResponse,
  });
  factory GetJourneyExecutionMetricsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetJourneyExecutionMetricsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetJourneyResponse {
  @_s.JsonKey(name: 'JourneyResponse')
  final JourneyResponse journeyResponse;

  GetJourneyResponse({
    @_s.required this.journeyResponse,
  });
  factory GetJourneyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetJourneyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPushTemplateResponse {
  @_s.JsonKey(name: 'PushNotificationTemplateResponse')
  final PushNotificationTemplateResponse pushNotificationTemplateResponse;

  GetPushTemplateResponse({
    @_s.required this.pushNotificationTemplateResponse,
  });
  factory GetPushTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPushTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRecommenderConfigurationResponse {
  @_s.JsonKey(name: 'RecommenderConfigurationResponse')
  final RecommenderConfigurationResponse recommenderConfigurationResponse;

  GetRecommenderConfigurationResponse({
    @_s.required this.recommenderConfigurationResponse,
  });
  factory GetRecommenderConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetRecommenderConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRecommenderConfigurationsResponse {
  @_s.JsonKey(name: 'ListRecommenderConfigurationsResponse')
  final ListRecommenderConfigurationsResponse
      listRecommenderConfigurationsResponse;

  GetRecommenderConfigurationsResponse({
    @_s.required this.listRecommenderConfigurationsResponse,
  });
  factory GetRecommenderConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetRecommenderConfigurationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSegmentExportJobsResponse {
  @_s.JsonKey(name: 'ExportJobsResponse')
  final ExportJobsResponse exportJobsResponse;

  GetSegmentExportJobsResponse({
    @_s.required this.exportJobsResponse,
  });
  factory GetSegmentExportJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSegmentExportJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSegmentImportJobsResponse {
  @_s.JsonKey(name: 'ImportJobsResponse')
  final ImportJobsResponse importJobsResponse;

  GetSegmentImportJobsResponse({
    @_s.required this.importJobsResponse,
  });
  factory GetSegmentImportJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSegmentImportJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSegmentResponse {
  @_s.JsonKey(name: 'SegmentResponse')
  final SegmentResponse segmentResponse;

  GetSegmentResponse({
    @_s.required this.segmentResponse,
  });
  factory GetSegmentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSegmentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSegmentVersionResponse {
  @_s.JsonKey(name: 'SegmentResponse')
  final SegmentResponse segmentResponse;

  GetSegmentVersionResponse({
    @_s.required this.segmentResponse,
  });
  factory GetSegmentVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSegmentVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSegmentVersionsResponse {
  @_s.JsonKey(name: 'SegmentsResponse')
  final SegmentsResponse segmentsResponse;

  GetSegmentVersionsResponse({
    @_s.required this.segmentsResponse,
  });
  factory GetSegmentVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSegmentVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSegmentsResponse {
  @_s.JsonKey(name: 'SegmentsResponse')
  final SegmentsResponse segmentsResponse;

  GetSegmentsResponse({
    @_s.required this.segmentsResponse,
  });
  factory GetSegmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSegmentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSmsChannelResponse {
  @_s.JsonKey(name: 'SMSChannelResponse')
  final SMSChannelResponse sMSChannelResponse;

  GetSmsChannelResponse({
    @_s.required this.sMSChannelResponse,
  });
  factory GetSmsChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSmsChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSmsTemplateResponse {
  @_s.JsonKey(name: 'SMSTemplateResponse')
  final SMSTemplateResponse sMSTemplateResponse;

  GetSmsTemplateResponse({
    @_s.required this.sMSTemplateResponse,
  });
  factory GetSmsTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSmsTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetUserEndpointsResponse {
  @_s.JsonKey(name: 'EndpointsResponse')
  final EndpointsResponse endpointsResponse;

  GetUserEndpointsResponse({
    @_s.required this.endpointsResponse,
  });
  factory GetUserEndpointsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserEndpointsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetVoiceChannelResponse {
  @_s.JsonKey(name: 'VoiceChannelResponse')
  final VoiceChannelResponse voiceChannelResponse;

  GetVoiceChannelResponse({
    @_s.required this.voiceChannelResponse,
  });
  factory GetVoiceChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVoiceChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetVoiceTemplateResponse {
  @_s.JsonKey(name: 'VoiceTemplateResponse')
  final VoiceTemplateResponse voiceTemplateResponse;

  GetVoiceTemplateResponse({
    @_s.required this.voiceTemplateResponse,
  });
  factory GetVoiceTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVoiceTemplateResponseFromJson(json);
}

/// Specifies the settings for a holdout activity in a journey. This type of
/// activity stops a journey for a specified percentage of participants.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HoldoutActivity {
  /// The percentage of participants who shouldn't continue the journey.
  ///
  /// To determine which participants are held out, Amazon Pinpoint applies a
  /// probability-based algorithm to the percentage that you specify. Therefore,
  /// the actual percentage of participants who are held out may not be equal to
  /// the percentage that you specify.
  @_s.JsonKey(name: 'Percentage')
  final int percentage;

  /// The unique identifier for the next activity to perform, after performing the
  /// holdout activity.
  @_s.JsonKey(name: 'NextActivity')
  final String nextActivity;

  HoldoutActivity({
    @_s.required this.percentage,
    this.nextActivity,
  });
  factory HoldoutActivity.fromJson(Map<String, dynamic> json) =>
      _$HoldoutActivityFromJson(json);

  Map<String, dynamic> toJson() => _$HoldoutActivityToJson(this);
}

/// Specifies the settings for a job that imports endpoint definitions from an
/// Amazon Simple Storage Service (Amazon S3) bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ImportJobRequest {
  /// The format of the files that contain the endpoint definitions to import.
  /// Valid values are: CSV, for comma-separated values format; and, JSON, for
  /// newline-delimited JSON format. If the Amazon S3 location stores multiple
  /// files that use different formats, Amazon Pinpoint imports data only from the
  /// files that use the specified format.
  @_s.JsonKey(name: 'Format')
  final Format format;

  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorizes Amazon Pinpoint to access the Amazon S3 location
  /// to import endpoint definitions from.
  @_s.JsonKey(name: 'RoleArn')
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
  @_s.JsonKey(name: 'S3Url')
  final String s3Url;

  /// Specifies whether to create a segment that contains the endpoints, when the
  /// endpoint definitions are imported.
  @_s.JsonKey(name: 'DefineSegment')
  final bool defineSegment;

  /// (Deprecated) Your AWS account ID, which you assigned to an external ID key
  /// in an IAM trust policy. Amazon Pinpoint previously used this value to assume
  /// an IAM role when importing endpoint definitions, but we removed this
  /// requirement. We don't recommend use of external IDs for IAM roles that are
  /// assumed by Amazon Pinpoint.
  @_s.JsonKey(name: 'ExternalId')
  final String externalId;

  /// Specifies whether to register the endpoints with Amazon Pinpoint, when the
  /// endpoint definitions are imported.
  @_s.JsonKey(name: 'RegisterEndpoints')
  final bool registerEndpoints;

  /// The identifier for the segment to update or add the imported endpoint
  /// definitions to, if the import job is meant to update an existing segment.
  @_s.JsonKey(name: 'SegmentId')
  final String segmentId;

  /// A custom name for the segment that's created by the import job, if the value
  /// of the DefineSegment property is true.
  @_s.JsonKey(name: 'SegmentName')
  final String segmentName;

  ImportJobRequest({
    @_s.required this.format,
    @_s.required this.roleArn,
    @_s.required this.s3Url,
    this.defineSegment,
    this.externalId,
    this.registerEndpoints,
    this.segmentId,
    this.segmentName,
  });
  Map<String, dynamic> toJson() => _$ImportJobRequestToJson(this);
}

/// Provides information about the resource settings for a job that imports
/// endpoint definitions from one or more files. The files can be stored in an
/// Amazon Simple Storage Service (Amazon S3) bucket or uploaded directly from a
/// computer by using the Amazon Pinpoint console.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportJobResource {
  /// The format of the files that contain the endpoint definitions to import.
  /// Valid values are: CSV, for comma-separated values format; and, JSON, for
  /// newline-delimited JSON format.
  ///
  /// If the files are stored in an Amazon S3 location and that location contains
  /// multiple files that use different formats, Amazon Pinpoint imports data only
  /// from the files that use the specified format.
  @_s.JsonKey(name: 'Format')
  final Format format;

  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorizes Amazon Pinpoint to access the Amazon S3 location
  /// to import endpoint definitions from.
  @_s.JsonKey(name: 'RoleArn')
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
  @_s.JsonKey(name: 'S3Url')
  final String s3Url;

  /// Specifies whether the import job creates a segment that contains the
  /// endpoints, when the endpoint definitions are imported.
  @_s.JsonKey(name: 'DefineSegment')
  final bool defineSegment;

  /// (Deprecated) Your AWS account ID, which you assigned to an external ID key
  /// in an IAM trust policy. Amazon Pinpoint previously used this value to assume
  /// an IAM role when importing endpoint definitions, but we removed this
  /// requirement. We don't recommend use of external IDs for IAM roles that are
  /// assumed by Amazon Pinpoint.
  @_s.JsonKey(name: 'ExternalId')
  final String externalId;

  /// Specifies whether the import job registers the endpoints with Amazon
  /// Pinpoint, when the endpoint definitions are imported.
  @_s.JsonKey(name: 'RegisterEndpoints')
  final bool registerEndpoints;

  /// The identifier for the segment that the import job updates or adds endpoint
  /// definitions to, if the import job updates an existing segment.
  @_s.JsonKey(name: 'SegmentId')
  final String segmentId;

  /// The custom name for the segment that's created by the import job, if the
  /// value of the DefineSegment property is true.
  @_s.JsonKey(name: 'SegmentName')
  final String segmentName;

  ImportJobResource({
    @_s.required this.format,
    @_s.required this.roleArn,
    @_s.required this.s3Url,
    this.defineSegment,
    this.externalId,
    this.registerEndpoints,
    this.segmentId,
    this.segmentName,
  });
  factory ImportJobResource.fromJson(Map<String, dynamic> json) =>
      _$ImportJobResourceFromJson(json);
}

/// Provides information about the status and settings of a job that imports
/// endpoint definitions from one or more files. The files can be stored in an
/// Amazon Simple Storage Service (Amazon S3) bucket or uploaded directly from a
/// computer by using the Amazon Pinpoint console.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportJobResponse {
  /// The unique identifier for the application that's associated with the import
  /// job.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The date, in ISO 8601 format, when the import job was created.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The resource settings that apply to the import job.
  @_s.JsonKey(name: 'Definition')
  final ImportJobResource definition;

  /// The unique identifier for the import job.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The status of the import job. The job status is FAILED if Amazon Pinpoint
  /// wasn't able to process one or more pieces in the job.
  @_s.JsonKey(name: 'JobStatus')
  final JobStatus jobStatus;

  /// The job type. This value is IMPORT for import jobs.
  @_s.JsonKey(name: 'Type')
  final String type;

  /// The number of pieces that were processed successfully (completed) by the
  /// import job, as of the time of the request.
  @_s.JsonKey(name: 'CompletedPieces')
  final int completedPieces;

  /// The date, in ISO 8601 format, when the import job was completed.
  @_s.JsonKey(name: 'CompletionDate')
  final String completionDate;

  /// The number of pieces that weren't processed successfully (failed) by the
  /// import job, as of the time of the request.
  @_s.JsonKey(name: 'FailedPieces')
  final int failedPieces;

  /// An array of entries, one for each of the first 100 entries that weren't
  /// processed successfully (failed) by the import job, if any.
  @_s.JsonKey(name: 'Failures')
  final List<String> failures;

  /// The total number of endpoint definitions that weren't processed successfully
  /// (failed) by the import job, typically because an error, such as a syntax
  /// error, occurred.
  @_s.JsonKey(name: 'TotalFailures')
  final int totalFailures;

  /// The total number of pieces that must be processed to complete the import
  /// job. Each piece consists of an approximately equal portion of the endpoint
  /// definitions that are part of the import job.
  @_s.JsonKey(name: 'TotalPieces')
  final int totalPieces;

  /// The total number of endpoint definitions that were processed by the import
  /// job.
  @_s.JsonKey(name: 'TotalProcessed')
  final int totalProcessed;

  ImportJobResponse({
    @_s.required this.applicationId,
    @_s.required this.creationDate,
    @_s.required this.definition,
    @_s.required this.id,
    @_s.required this.jobStatus,
    @_s.required this.type,
    this.completedPieces,
    this.completionDate,
    this.failedPieces,
    this.failures,
    this.totalFailures,
    this.totalPieces,
    this.totalProcessed,
  });
  factory ImportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$ImportJobResponseFromJson(json);
}

/// Provides information about the status and settings of all the import jobs
/// that are associated with an application or segment. An import job is a job
/// that imports endpoint definitions from one or more files.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportJobsResponse {
  /// An array of responses, one for each import job that's associated with the
  /// application (Import Jobs resource) or segment (Segment Import Jobs
  /// resource).
  @_s.JsonKey(name: 'Item')
  final List<ImportJobResponse> item;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ImportJobsResponse({
    @_s.required this.item,
    this.nextToken,
  });
  factory ImportJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ImportJobsResponseFromJson(json);
}

enum Include {
  @_s.JsonValue('ALL')
  all,
  @_s.JsonValue('ANY')
  any,
  @_s.JsonValue('NONE')
  none,
}

/// Provides information about the results of a request to create or update an
/// endpoint that's associated with an event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ItemResponse {
  /// The response that was received after the endpoint data was accepted.
  @_s.JsonKey(name: 'EndpointItemResponse')
  final EndpointItemResponse endpointItemResponse;

  /// A multipart response object that contains a key and a value for each event
  /// in the request. In each object, the event ID is the key and an
  /// EventItemResponse object is the value.
  @_s.JsonKey(name: 'EventsItemResponse')
  final Map<String, EventItemResponse> eventsItemResponse;

  ItemResponse({
    this.endpointItemResponse,
    this.eventsItemResponse,
  });
  factory ItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemResponseFromJson(json);
}

enum JobStatus {
  @_s.JsonValue('CREATED')
  created,
  @_s.JsonValue('PREPARING_FOR_INITIALIZATION')
  preparingForInitialization,
  @_s.JsonValue('INITIALIZING')
  initializing,
  @_s.JsonValue('PROCESSING')
  processing,
  @_s.JsonValue('PENDING_JOB')
  pendingJob,
  @_s.JsonValue('COMPLETING')
  completing,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('FAILING')
  failing,
  @_s.JsonValue('FAILED')
  failed,
}

/// Specifies the message content for a custom channel message that's sent to
/// participants in a journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JourneyCustomMessage {
  /// The message content that's passed to an AWS Lambda function or to a web
  /// hook.
  @_s.JsonKey(name: 'Data')
  final String data;

  JourneyCustomMessage({
    this.data,
  });
  factory JourneyCustomMessage.fromJson(Map<String, dynamic> json) =>
      _$JourneyCustomMessageFromJson(json);

  Map<String, dynamic> toJson() => _$JourneyCustomMessageToJson(this);
}

/// Provides the results of a query that retrieved the data for a standard
/// engagement metric that applies to a journey, and provides information about
/// that query.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JourneyDateRangeKpiResponse {
  /// The unique identifier for the application that the metric applies to.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The last date and time of the date range that was used to filter the query
  /// results, in extended ISO 8601 format. The date range is inclusive.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The unique identifier for the journey that the metric applies to.
  @_s.JsonKey(name: 'JourneyId')
  final String journeyId;

  /// The name of the metric, also referred to as a <i>key performance indicator
  /// (KPI)</i>, that the data was retrieved for. This value describes the
  /// associated metric and consists of two or more terms, which are comprised of
  /// lowercase alphanumeric characters, separated by a hyphen. For a list of
  /// possible values, see the <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/analytics-standard-metrics.html">Amazon
  /// Pinpoint Developer Guide</a>.
  @_s.JsonKey(name: 'KpiName')
  final String kpiName;

  /// An array of objects that contains the results of the query. Each object
  /// contains the value for the metric and metadata about that value.
  @_s.JsonKey(name: 'KpiResult')
  final BaseKpiResult kpiResult;

  /// The first date and time of the date range that was used to filter the query
  /// results, in extended ISO 8601 format. The date range is inclusive.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null for the Journey Engagement Metrics
  /// resource because the resource returns all results in a single page.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  JourneyDateRangeKpiResponse({
    @_s.required this.applicationId,
    @_s.required this.endTime,
    @_s.required this.journeyId,
    @_s.required this.kpiName,
    @_s.required this.kpiResult,
    @_s.required this.startTime,
    this.nextToken,
  });
  factory JourneyDateRangeKpiResponse.fromJson(Map<String, dynamic> json) =>
      _$JourneyDateRangeKpiResponseFromJson(json);
}

/// Specifies the "From" address for an email message that's sent to
/// participants in a journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JourneyEmailMessage {
  /// The verified email address to send the email message from. The default
  /// address is the FromAddress specified for the email channel for the
  /// application.
  @_s.JsonKey(name: 'FromAddress')
  final String fromAddress;

  JourneyEmailMessage({
    this.fromAddress,
  });
  factory JourneyEmailMessage.fromJson(Map<String, dynamic> json) =>
      _$JourneyEmailMessageFromJson(json);

  Map<String, dynamic> toJson() => _$JourneyEmailMessageToJson(this);
}

/// Provides the results of a query that retrieved the data for a standard
/// execution metric that applies to a journey activity, and provides
/// information about that query.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JourneyExecutionActivityMetricsResponse {
  /// The type of activity that the metric applies to. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// CONDITIONAL_SPLIT - For a yes/no split activity, which is an activity that
  /// sends participants down one of two paths in a journey.
  /// </li>
  /// <li>
  /// HOLDOUT - For a holdout activity, which is an activity that stops a journey
  /// for a specified percentage of participants.
  /// </li>
  /// <li>
  /// MESSAGE - For an email activity, which is an activity that sends an email
  /// message to participants.
  /// </li>
  /// <li>
  /// MULTI_CONDITIONAL_SPLIT - For a multivariate split activity, which is an
  /// activity that sends participants down one of as many as five paths in a
  /// journey.
  /// </li>
  /// <li>
  /// RANDOM_SPLIT - For a random split activity, which is an activity that sends
  /// specified percentages of participants down one of as many as five paths in a
  /// journey.
  /// </li>
  /// <li>
  /// WAIT - For a wait activity, which is an activity that waits for a certain
  /// amount of time or until a specific date and time before moving participants
  /// to the next activity in a journey.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ActivityType')
  final String activityType;

  /// The unique identifier for the application that the metric applies to.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The unique identifier for the activity that the metric applies to.
  @_s.JsonKey(name: 'JourneyActivityId')
  final String journeyActivityId;

  /// The unique identifier for the journey that the metric applies to.
  @_s.JsonKey(name: 'JourneyId')
  final String journeyId;

  /// The date and time, in ISO 8601 format, when Amazon Pinpoint last evaluated
  /// the execution status of the activity and updated the data for the metric.
  @_s.JsonKey(name: 'LastEvaluatedTime')
  final String lastEvaluatedTime;

  /// A JSON object that contains the results of the query. The results vary
  /// depending on the type of activity (ActivityType). For information about the
  /// structure and contents of the results, see the <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/analytics-standard-metrics.html">Amazon
  /// Pinpoint Developer Guide</a>.
  @_s.JsonKey(name: 'Metrics')
  final Map<String, String> metrics;

  JourneyExecutionActivityMetricsResponse({
    @_s.required this.activityType,
    @_s.required this.applicationId,
    @_s.required this.journeyActivityId,
    @_s.required this.journeyId,
    @_s.required this.lastEvaluatedTime,
    @_s.required this.metrics,
  });
  factory JourneyExecutionActivityMetricsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$JourneyExecutionActivityMetricsResponseFromJson(json);
}

/// Provides the results of a query that retrieved the data for a standard
/// execution metric that applies to a journey, and provides information about
/// that query.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JourneyExecutionMetricsResponse {
  /// The unique identifier for the application that the metric applies to.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The unique identifier for the journey that the metric applies to.
  @_s.JsonKey(name: 'JourneyId')
  final String journeyId;

  /// The date and time, in ISO 8601 format, when Amazon Pinpoint last evaluated
  /// the journey and updated the data for the metric.
  @_s.JsonKey(name: 'LastEvaluatedTime')
  final String lastEvaluatedTime;

  /// A JSON object that contains the results of the query. For information about
  /// the structure and contents of the results, see the <a
  /// href="https://docs.aws.amazon.com//pinpoint/latest/developerguide/analytics-standard-metrics.html">Amazon
  /// Pinpoint Developer Guide</a>.
  @_s.JsonKey(name: 'Metrics')
  final Map<String, String> metrics;

  JourneyExecutionMetricsResponse({
    @_s.required this.applicationId,
    @_s.required this.journeyId,
    @_s.required this.lastEvaluatedTime,
    @_s.required this.metrics,
  });
  factory JourneyExecutionMetricsResponse.fromJson(Map<String, dynamic> json) =>
      _$JourneyExecutionMetricsResponseFromJson(json);
}

/// Specifies limits on the messages that a journey can send and the number of
/// times participants can enter a journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JourneyLimits {
  /// The maximum number of messages that the journey can send to a single
  /// participant during a 24-hour period. The maximum value is 100.
  @_s.JsonKey(name: 'DailyCap')
  final int dailyCap;

  /// The maximum number of times that a participant can enter the journey. The
  /// maximum value is 100. To allow participants to enter the journey an
  /// unlimited number of times, set this value to 0.
  @_s.JsonKey(name: 'EndpointReentryCap')
  final int endpointReentryCap;

  /// The maximum number of messages that the journey can send each second.
  @_s.JsonKey(name: 'MessagesPerSecond')
  final int messagesPerSecond;

  JourneyLimits({
    this.dailyCap,
    this.endpointReentryCap,
    this.messagesPerSecond,
  });
  factory JourneyLimits.fromJson(Map<String, dynamic> json) =>
      _$JourneyLimitsFromJson(json);

  Map<String, dynamic> toJson() => _$JourneyLimitsToJson(this);
}

/// Specifies the message configuration for a push notification that's sent to
/// participants in a journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'TimeToLive')
  final String timeToLive;

  JourneyPushMessage({
    this.timeToLive,
  });
  factory JourneyPushMessage.fromJson(Map<String, dynamic> json) =>
      _$JourneyPushMessageFromJson(json);

  Map<String, dynamic> toJson() => _$JourneyPushMessageToJson(this);
}

/// Provides information about the status, configuration, and other settings for
/// a journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JourneyResponse {
  /// The unique identifier for the application that the journey applies to.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The unique identifier for the journey.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the journey.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A map that contains a set of Activity objects, one object for each activity
  /// in the journey. For each Activity object, the key is the unique identifier
  /// (string) for an activity and the value is the settings for the activity.
  @_s.JsonKey(name: 'Activities')
  final Map<String, Activity> activities;

  /// The date, in ISO 8601 format, when the journey was created.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The date, in ISO 8601 format, when the journey was last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The messaging and entry limits for the journey.
  @_s.JsonKey(name: 'Limits')
  final JourneyLimits limits;

  /// Specifies whether the journey's scheduled start and end times use each
  /// participant's local time. If this value is true, the schedule uses each
  /// participant's local time.
  @_s.JsonKey(name: 'LocalTime')
  final bool localTime;

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
  @_s.JsonKey(name: 'QuietTime')
  final QuietTime quietTime;

  /// The frequency with which Amazon Pinpoint evaluates segment and event data
  /// for the journey, as a duration in ISO 8601 format.
  @_s.JsonKey(name: 'RefreshFrequency')
  final String refreshFrequency;

  /// The schedule settings for the journey.
  @_s.JsonKey(name: 'Schedule')
  final JourneySchedule schedule;

  /// The unique identifier for the first activity in the journey.
  @_s.JsonKey(name: 'StartActivity')
  final String startActivity;

  /// The segment that defines which users are participants in the journey.
  @_s.JsonKey(name: 'StartCondition')
  final StartCondition startCondition;

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
  @_s.JsonKey(name: 'State')
  final State state;

  /// This object is not used or supported.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  JourneyResponse({
    @_s.required this.applicationId,
    @_s.required this.id,
    @_s.required this.name,
    this.activities,
    this.creationDate,
    this.lastModifiedDate,
    this.limits,
    this.localTime,
    this.quietTime,
    this.refreshFrequency,
    this.schedule,
    this.startActivity,
    this.startCondition,
    this.state,
    this.tags,
  });
  factory JourneyResponse.fromJson(Map<String, dynamic> json) =>
      _$JourneyResponseFromJson(json);
}

/// Specifies the sender ID and message type for an SMS message that's sent to
/// participants in a journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JourneySMSMessage {
  /// The SMS message type. Valid values are TRANSACTIONAL (for messages that are
  /// critical or time-sensitive, such as a one-time passwords) and PROMOTIONAL
  /// (for messsages that aren't critical or time-sensitive, such as marketing
  /// messages).
  @_s.JsonKey(name: 'MessageType')
  final MessageType messageType;

  /// The sender ID to display as the sender of the message on a recipient's
  /// device. Support for sender IDs varies by country or region. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-sms-countries.html">Supported
  /// Countries and Regions</a> in the Amazon Pinpoint User Guide.
  @_s.JsonKey(name: 'SenderId')
  final String senderId;

  JourneySMSMessage({
    this.messageType,
    this.senderId,
  });
  factory JourneySMSMessage.fromJson(Map<String, dynamic> json) =>
      _$JourneySMSMessageFromJson(json);

  Map<String, dynamic> toJson() => _$JourneySMSMessageToJson(this);
}

/// Specifies the schedule settings for a journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JourneySchedule {
  /// The scheduled time, in ISO 8601 format, when the journey ended or will end.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The scheduled time, in ISO 8601 format, when the journey began or will
  /// begin.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The starting UTC offset for the journey schedule, if the value of the
  /// journey's LocalTime property is true. Valid values are: UTC,
  /// UTC+01, UTC+02, UTC+03, UTC+03:30, UTC+04, UTC+04:30, UTC+05, UTC+05:30,
  /// UTC+05:45, UTC+06, UTC+06:30, UTC+07, UTC+08, UTC+08:45, UTC+09, UTC+09:30,
  /// UTC+10, UTC+10:30, UTC+11, UTC+12, UTC+12:45, UTC+13, UTC+13:45, UTC-02,
  /// UTC-02:30, UTC-03, UTC-03:30, UTC-04, UTC-05, UTC-06, UTC-07, UTC-08,
  /// UTC-09,
  /// UTC-09:30, UTC-10, and UTC-11.
  @_s.JsonKey(name: 'Timezone')
  final String timezone;

  JourneySchedule({
    this.endTime,
    this.startTime,
    this.timezone,
  });
  factory JourneySchedule.fromJson(Map<String, dynamic> json) =>
      _$JourneyScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$JourneyScheduleToJson(this);
}

/// Changes the status of a journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class JourneyStateRequest {
  /// The status of the journey. Currently, the only supported value is CANCELLED.
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
  @_s.JsonKey(name: 'State')
  final State state;

  JourneyStateRequest({
    this.state,
  });
  Map<String, dynamic> toJson() => _$JourneyStateRequestToJson(this);
}

/// Provides information about the status, configuration, and other settings for
/// all the journeys that are associated with an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JourneysResponse {
  /// An array of responses, one for each journey that's associated with the
  /// application.
  @_s.JsonKey(name: 'Item')
  final List<JourneyResponse> item;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  JourneysResponse({
    @_s.required this.item,
    this.nextToken,
  });
  factory JourneysResponse.fromJson(Map<String, dynamic> json) =>
      _$JourneysResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJourneysResponse {
  @_s.JsonKey(name: 'JourneysResponse')
  final JourneysResponse journeysResponse;

  ListJourneysResponse({
    @_s.required this.journeysResponse,
  });
  factory ListJourneysResponse.fromJson(Map<String, dynamic> json) =>
      _$ListJourneysResponseFromJson(json);
}

/// Provides information about all the recommender model configurations that are
/// associated with your Amazon Pinpoint account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRecommenderConfigurationsResponse {
  /// An array of responses, one for each recommender model configuration that's
  /// associated with your Amazon Pinpoint account.
  @_s.JsonKey(name: 'Item')
  final List<RecommenderConfigurationResponse> item;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListRecommenderConfigurationsResponse({
    @_s.required this.item,
    this.nextToken,
  });
  factory ListRecommenderConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListRecommenderConfigurationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  @_s.JsonKey(name: 'TagsModel')
  final TagsModel tagsModel;

  ListTagsForResourceResponse({
    @_s.required this.tagsModel,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTemplateVersionsResponse {
  @_s.JsonKey(name: 'TemplateVersionsResponse')
  final TemplateVersionsResponse templateVersionsResponse;

  ListTemplateVersionsResponse({
    @_s.required this.templateVersionsResponse,
  });
  factory ListTemplateVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTemplateVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTemplatesResponse {
  @_s.JsonKey(name: 'TemplatesResponse')
  final TemplatesResponse templatesResponse;

  ListTemplatesResponse({
    @_s.required this.templatesResponse,
  });
  factory ListTemplatesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTemplatesResponseFromJson(json);
}

/// Specifies the content and settings for a push notification that's sent to
/// recipients of a campaign.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'Action')
  final Action action;

  /// The body of the notification message. The maximum number of characters is
  /// 200.
  @_s.JsonKey(name: 'Body')
  final String body;

  /// The URL of the image to display as the push-notification icon, such as the
  /// icon for the app.
  @_s.JsonKey(name: 'ImageIconUrl')
  final String imageIconUrl;

  /// The URL of the image to display as the small, push-notification icon, such
  /// as a small version of the icon for the app.
  @_s.JsonKey(name: 'ImageSmallIconUrl')
  final String imageSmallIconUrl;

  /// The URL of an image to display in the push notification.
  @_s.JsonKey(name: 'ImageUrl')
  final String imageUrl;

  /// The JSON payload to use for a silent push notification.
  @_s.JsonKey(name: 'JsonBody')
  final String jsonBody;

  /// The URL of the image or video to display in the push notification.
  @_s.JsonKey(name: 'MediaUrl')
  final String mediaUrl;

  /// The raw, JSON-formatted string to use as the payload for the notification
  /// message. If specified, this value overrides all other content for the
  /// message.
  @_s.JsonKey(name: 'RawContent')
  final String rawContent;

  /// Specifies whether the notification is a silent push notification, which is a
  /// push notification that doesn't display on a recipient's device. Silent push
  /// notifications can be used for cases such as updating an app's configuration,
  /// displaying messages in an in-app message center, or supporting phone home
  /// functionality.
  @_s.JsonKey(name: 'SilentPush')
  final bool silentPush;

  /// The number of seconds that the push-notification service should keep the
  /// message, if the service is unable to deliver the notification the first
  /// time. This value is converted to an expiration value when it's sent to a
  /// push-notification service. If this value is 0, the service treats the
  /// notification as if it expires immediately and the service doesn't store or
  /// try to deliver the notification again.
  ///
  /// This value doesn't apply to messages that are sent through the Amazon Device
  /// Messaging (ADM) service.
  @_s.JsonKey(name: 'TimeToLive')
  final int timeToLive;

  /// The title to display above the notification message on a recipient's device.
  @_s.JsonKey(name: 'Title')
  final String title;

  /// The URL to open in a recipient's default mobile browser, if a recipient taps
  /// the push notification and the value of the Action property is URL.
  @_s.JsonKey(name: 'Url')
  final String url;

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
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

/// Provides information about an API request or response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MessageBody {
  /// The message that's returned from the API.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The unique identifier for the request or response.
  @_s.JsonKey(name: 'RequestID')
  final String requestID;

  MessageBody({
    this.message,
    this.requestID,
  });
  factory MessageBody.fromJson(Map<String, dynamic> json) =>
      _$MessageBodyFromJson(json);
}

/// Specifies the message configuration settings for a campaign.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MessageConfiguration {
  /// The message that the campaign sends through the ADM (Amazon Device
  /// Messaging) channel. If specified, this message overrides the default
  /// message.
  @_s.JsonKey(name: 'ADMMessage')
  final Message aDMMessage;

  /// The message that the campaign sends through the APNs (Apple Push
  /// Notification service) channel. If specified, this message overrides the
  /// default message.
  @_s.JsonKey(name: 'APNSMessage')
  final Message aPNSMessage;

  /// The message that the campaign sends through the Baidu (Baidu Cloud Push)
  /// channel. If specified, this message overrides the default message.
  @_s.JsonKey(name: 'BaiduMessage')
  final Message baiduMessage;

  /// The message that the campaign sends through a custom channel, as specified
  /// by the delivery configuration (CustomDeliveryConfiguration) settings for the
  /// campaign. If specified, this message overrides the default message.
  @_s.JsonKey(name: 'CustomMessage')
  final CampaignCustomMessage customMessage;

  /// The default message that the campaign sends through all the channels that
  /// are configured for the campaign.
  @_s.JsonKey(name: 'DefaultMessage')
  final Message defaultMessage;

  /// The message that the campaign sends through the email channel. If specified,
  /// this message overrides the default message.
  @_s.JsonKey(name: 'EmailMessage')
  final CampaignEmailMessage emailMessage;

  /// The message that the campaign sends through the GCM channel, which enables
  /// Amazon Pinpoint to send push notifications through the Firebase Cloud
  /// Messaging (FCM), formerly Google Cloud Messaging (GCM), service. If
  /// specified, this message overrides the default message.
  @_s.JsonKey(name: 'GCMMessage')
  final Message gCMMessage;

  /// The message that the campaign sends through the SMS channel. If specified,
  /// this message overrides the default message.
  @_s.JsonKey(name: 'SMSMessage')
  final CampaignSmsMessage sMSMessage;

  MessageConfiguration({
    this.aDMMessage,
    this.aPNSMessage,
    this.baiduMessage,
    this.customMessage,
    this.defaultMessage,
    this.emailMessage,
    this.gCMMessage,
    this.sMSMessage,
  });
  factory MessageConfiguration.fromJson(Map<String, dynamic> json) =>
      _$MessageConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$MessageConfigurationToJson(this);
}

/// Specifies the configuration and other settings for a message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MessageRequest {
  /// The settings and content for the default message and any default messages
  /// that you defined for specific channels.
  @_s.JsonKey(name: 'MessageConfiguration')
  final DirectMessageConfiguration messageConfiguration;

  /// A map of key-value pairs, where each key is an address and each value is an
  /// <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-messages.html#apps-application-id-messages-model-addressconfiguration">AddressConfiguration</a>
  /// object. An address can be a push notification token, a phone number, or an
  /// email address. You can use an <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-messages.html#apps-application-id-messages-model-addressconfiguration">AddressConfiguration</a>
  /// object to tailor the message for an address by specifying settings such as
  /// content overrides and message variables.
  @_s.JsonKey(name: 'Addresses')
  final Map<String, AddressConfiguration> addresses;

  /// A map of custom attributes to attach to the message. For a push
  /// notification, this payload is added to the data.pinpoint object. For an
  /// email or text message, this payload is added to email/SMS delivery receipt
  /// event attributes.
  @_s.JsonKey(name: 'Context')
  final Map<String, String> context;

  /// A map of key-value pairs, where each key is an endpoint ID and each value is
  /// an <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-messages.html#apps-application-id-messages-model-endpointsendconfiguration">EndpointSendConfiguration</a>
  /// object. You can use an <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-messages.html#apps-application-id-messages-model-endpointsendconfiguration">EndpointSendConfiguration</a>
  /// object to tailor the message for an endpoint by specifying settings such as
  /// content overrides and message variables.
  @_s.JsonKey(name: 'Endpoints')
  final Map<String, EndpointSendConfiguration> endpoints;

  /// The message template to use for the message.
  @_s.JsonKey(name: 'TemplateConfiguration')
  final TemplateConfiguration templateConfiguration;

  /// The unique identifier for tracing the message. This identifier is visible to
  /// message recipients.
  @_s.JsonKey(name: 'TraceId')
  final String traceId;

  MessageRequest({
    @_s.required this.messageConfiguration,
    this.addresses,
    this.context,
    this.endpoints,
    this.templateConfiguration,
    this.traceId,
  });
  Map<String, dynamic> toJson() => _$MessageRequestToJson(this);
}

/// Provides information about the results of a request to send a message to an
/// endpoint address.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MessageResponse {
  /// The unique identifier for the application that was used to send the message.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// A map that contains a multipart response for each address that the message
  /// was sent to. In the map, the endpoint ID is the key and the result is the
  /// value.
  @_s.JsonKey(name: 'EndpointResult')
  final Map<String, EndpointMessageResult> endpointResult;

  /// The identifier for the original request that the message was delivered for.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// A map that contains a multipart response for each address (email address,
  /// phone number, or push notification token) that the message was sent to. In
  /// the map, the address is the key and the result is the value.
  @_s.JsonKey(name: 'Result')
  final Map<String, MessageResult> result;

  MessageResponse({
    @_s.required this.applicationId,
    this.endpointResult,
    this.requestId,
    this.result,
  });
  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);
}

/// Provides information about the results of sending a message directly to an
/// endpoint address.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  /// TIMEOUT - The message couldn't be sent within the timeout period.
  /// </li>
  /// <li>
  /// UNKNOWN_FAILURE - An unknown error occurred.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'DeliveryStatus')
  final DeliveryStatus deliveryStatus;

  /// The downstream service status code for delivering the message.
  @_s.JsonKey(name: 'StatusCode')
  final int statusCode;

  /// The unique identifier for the message that was sent.
  @_s.JsonKey(name: 'MessageId')
  final String messageId;

  /// The status message for delivering the message.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// For push notifications that are sent through the GCM channel, specifies
  /// whether the endpoint's device registration token was updated as part of
  /// delivering the message.
  @_s.JsonKey(name: 'UpdatedToken')
  final String updatedToken;

  MessageResult({
    @_s.required this.deliveryStatus,
    @_s.required this.statusCode,
    this.messageId,
    this.statusMessage,
    this.updatedToken,
  });
  factory MessageResult.fromJson(Map<String, dynamic> json) =>
      _$MessageResultFromJson(json);
}

enum MessageType {
  @_s.JsonValue('TRANSACTIONAL')
  transactional,
  @_s.JsonValue('PROMOTIONAL')
  promotional,
}

/// Specifies metric-based criteria for including or excluding endpoints from a
/// segment. These criteria derive from custom metrics that you define for
/// endpoints.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MetricDimension {
  /// The operator to use when comparing metric values. Valid values are:
  /// GREATER_THAN, LESS_THAN, GREATER_THAN_OR_EQUAL, LESS_THAN_OR_EQUAL, and
  /// EQUAL.
  @_s.JsonKey(name: 'ComparisonOperator')
  final String comparisonOperator;

  /// The value to compare.
  @_s.JsonKey(name: 'Value')
  final double value;

  MetricDimension({
    @_s.required this.comparisonOperator,
    @_s.required this.value,
  });
  factory MetricDimension.fromJson(Map<String, dynamic> json) =>
      _$MetricDimensionFromJson(json);

  Map<String, dynamic> toJson() => _$MetricDimensionToJson(this);
}

enum Mode {
  @_s.JsonValue('DELIVERY')
  delivery,
  @_s.JsonValue('FILTER')
  filter,
}

/// Specifies a condition to evaluate for an activity path in a journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MultiConditionalBranch {
  /// The condition to evaluate for the activity path.
  @_s.JsonKey(name: 'Condition')
  final SimpleCondition condition;

  /// The unique identifier for the next activity to perform, after completing the
  /// activity for the path.
  @_s.JsonKey(name: 'NextActivity')
  final String nextActivity;

  MultiConditionalBranch({
    this.condition,
    this.nextActivity,
  });
  factory MultiConditionalBranch.fromJson(Map<String, dynamic> json) =>
      _$MultiConditionalBranchFromJson(json);

  Map<String, dynamic> toJson() => _$MultiConditionalBranchToJson(this);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MultiConditionalSplitActivity {
  /// The paths for the activity, including the conditions for entering each path
  /// and the activity to perform for each path.
  @_s.JsonKey(name: 'Branches')
  final List<MultiConditionalBranch> branches;

  /// The unique identifier for the activity to perform for participants who don't
  /// meet any of the conditions specified for other paths in the activity.
  @_s.JsonKey(name: 'DefaultActivity')
  final String defaultActivity;

  /// The amount of time to wait or the date and time when Amazon Pinpoint
  /// determines whether the conditions are met.
  @_s.JsonKey(name: 'EvaluationWaitTime')
  final WaitTime evaluationWaitTime;

  MultiConditionalSplitActivity({
    this.branches,
    this.defaultActivity,
    this.evaluationWaitTime,
  });
  factory MultiConditionalSplitActivity.fromJson(Map<String, dynamic> json) =>
      _$MultiConditionalSplitActivityFromJson(json);

  Map<String, dynamic> toJson() => _$MultiConditionalSplitActivityToJson(this);
}

/// Specifies a phone number to validate and retrieve information about.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NumberValidateRequest {
  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region where the phone number was originally registered.
  @_s.JsonKey(name: 'IsoCountryCode')
  final String isoCountryCode;

  /// The phone number to retrieve information about. The phone number that you
  /// provide should include a valid numeric country code. Otherwise, the
  /// operation might result in an error.
  @_s.JsonKey(name: 'PhoneNumber')
  final String phoneNumber;

  NumberValidateRequest({
    this.isoCountryCode,
    this.phoneNumber,
  });
  Map<String, dynamic> toJson() => _$NumberValidateRequestToJson(this);
}

/// Provides information about a phone number.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NumberValidateResponse {
  /// The carrier or service provider that the phone number is currently
  /// registered with. In some countries and regions, this value may be the
  /// carrier or service provider that the phone number was originally registered
  /// with.
  @_s.JsonKey(name: 'Carrier')
  final String carrier;

  /// The name of the city where the phone number was originally registered.
  @_s.JsonKey(name: 'City')
  final String city;

  /// The cleansed phone number, in E.164 format, for the location where the phone
  /// number was originally registered.
  @_s.JsonKey(name: 'CleansedPhoneNumberE164')
  final String cleansedPhoneNumberE164;

  /// The cleansed phone number, in the format for the location where the phone
  /// number was originally registered.
  @_s.JsonKey(name: 'CleansedPhoneNumberNational')
  final String cleansedPhoneNumberNational;

  /// The name of the country or region where the phone number was originally
  /// registered.
  @_s.JsonKey(name: 'Country')
  final String country;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region where the phone number was originally registered.
  @_s.JsonKey(name: 'CountryCodeIso2')
  final String countryCodeIso2;

  /// The numeric code for the country or region where the phone number was
  /// originally registered.
  @_s.JsonKey(name: 'CountryCodeNumeric')
  final String countryCodeNumeric;

  /// The name of the county where the phone number was originally registered.
  @_s.JsonKey(name: 'County')
  final String county;

  /// The two-character code, in ISO 3166-1 alpha-2 format, that was sent in the
  /// request body.
  @_s.JsonKey(name: 'OriginalCountryCodeIso2')
  final String originalCountryCodeIso2;

  /// The phone number that was sent in the request body.
  @_s.JsonKey(name: 'OriginalPhoneNumber')
  final String originalPhoneNumber;

  /// The description of the phone type. Valid values are: MOBILE, LANDLINE, VOIP,
  /// INVALID, PREPAID, and OTHER.
  @_s.JsonKey(name: 'PhoneType')
  final String phoneType;

  /// The phone type, represented by an integer. Valid values are: 0 (mobile), 1
  /// (landline), 2 (VoIP), 3 (invalid), 4 (other), and 5 (prepaid).
  @_s.JsonKey(name: 'PhoneTypeCode')
  final int phoneTypeCode;

  /// The time zone for the location where the phone number was originally
  /// registered.
  @_s.JsonKey(name: 'Timezone')
  final String timezone;

  /// The postal or ZIP code for the location where the phone number was
  /// originally registered.
  @_s.JsonKey(name: 'ZipCode')
  final String zipCode;

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
  factory NumberValidateResponse.fromJson(Map<String, dynamic> json) =>
      _$NumberValidateResponseFromJson(json);
}

enum Operator {
  @_s.JsonValue('ALL')
  all,
  @_s.JsonValue('ANY')
  any,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PhoneNumberValidateResponse {
  @_s.JsonKey(name: 'NumberValidateResponse')
  final NumberValidateResponse numberValidateResponse;

  PhoneNumberValidateResponse({
    @_s.required this.numberValidateResponse,
  });
  factory PhoneNumberValidateResponse.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberValidateResponseFromJson(json);
}

/// Specifies the properties and attributes of an endpoint that's associated
/// with an event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PublicEndpoint {
  /// The unique identifier for the recipient, such as a device token, email
  /// address, or mobile phone number.
  @_s.JsonKey(name: 'Address')
  final String address;

  /// One or more custom attributes that describe the endpoint by associating a
  /// name with an array of values. You can use these attributes as filter
  /// criteria when you create segments.
  @_s.JsonKey(name: 'Attributes')
  final Map<String, List<String>> attributes;

  /// The channel that's used when sending messages or push notifications to the
  /// endpoint.
  @_s.JsonKey(name: 'ChannelType')
  final ChannelType channelType;

  /// The demographic information for the endpoint, such as the time zone and
  /// platform.
  @_s.JsonKey(name: 'Demographic')
  final EndpointDemographic demographic;

  /// The date and time, in ISO 8601 format, when the endpoint was last updated.
  @_s.JsonKey(name: 'EffectiveDate')
  final String effectiveDate;

  /// Specifies whether to send messages or push notifications to the endpoint.
  /// Valid values are: ACTIVE, messages are sent to the endpoint; and, INACTIVE,
  /// messages aren’t sent to the endpoint.
  ///
  /// Amazon Pinpoint automatically sets this value to ACTIVE when you create an
  /// endpoint or update an existing endpoint. Amazon Pinpoint automatically sets
  /// this value to INACTIVE if you update another endpoint that has the same
  /// address specified by the Address property.
  @_s.JsonKey(name: 'EndpointStatus')
  final String endpointStatus;

  /// The geographic information for the endpoint.
  @_s.JsonKey(name: 'Location')
  final EndpointLocation location;

  /// One or more custom metrics that your app reports to Amazon Pinpoint for the
  /// endpoint.
  @_s.JsonKey(name: 'Metrics')
  final Map<String, double> metrics;

  /// Specifies whether the user who's associated with the endpoint has opted out
  /// of receiving messages and push notifications from you. Possible values are:
  /// ALL, the user has opted out and doesn't want to receive any messages or push
  /// notifications; and, NONE, the user hasn't opted out and wants to receive all
  /// messages and push notifications.
  @_s.JsonKey(name: 'OptOut')
  final String optOut;

  /// A unique identifier that's generated each time the endpoint is updated.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// One or more custom user attributes that your app reports to Amazon Pinpoint
  /// for the user who's associated with the endpoint.
  @_s.JsonKey(name: 'User')
  final EndpointUser user;

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
  Map<String, dynamic> toJson() => _$PublicEndpointToJson(this);
}

/// Specifies the settings for a push notification activity in a journey. This
/// type of activity sends a push notification to participants.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PushMessageActivity {
  /// Specifies the time to live (TTL) value for push notifications that are sent
  /// to participants in a journey.
  @_s.JsonKey(name: 'MessageConfig')
  final JourneyPushMessage messageConfig;

  /// The unique identifier for the next activity to perform, after the message is
  /// sent.
  @_s.JsonKey(name: 'NextActivity')
  final String nextActivity;

  /// The name of the push notification template to use for the message. If
  /// specified, this value must match the name of an existing message template.
  @_s.JsonKey(name: 'TemplateName')
  final String templateName;

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
  @_s.JsonKey(name: 'TemplateVersion')
  final String templateVersion;

  PushMessageActivity({
    this.messageConfig,
    this.nextActivity,
    this.templateName,
    this.templateVersion,
  });
  factory PushMessageActivity.fromJson(Map<String, dynamic> json) =>
      _$PushMessageActivityFromJson(json);

  Map<String, dynamic> toJson() => _$PushMessageActivityToJson(this);
}

/// Specifies the content and settings for a message template that can be used
/// in messages that are sent through a push notification channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PushNotificationTemplateRequest {
  /// The message template to use for the ADM (Amazon Device Messaging) channel.
  /// This message template overrides the default template for push notification
  /// channels (DefaultPushNotificationTemplate).
  @_s.JsonKey(name: 'ADM')
  final AndroidPushNotificationTemplate adm;

  /// The message template to use for the APNs (Apple Push Notification service)
  /// channel. This message template overrides the default template for push
  /// notification channels (DefaultPushNotificationTemplate).
  @_s.JsonKey(name: 'APNS')
  final APNSPushNotificationTemplate apns;

  /// The message template to use for the Baidu (Baidu Cloud Push) channel. This
  /// message template overrides the default template for push notification
  /// channels (DefaultPushNotificationTemplate).
  @_s.JsonKey(name: 'Baidu')
  final AndroidPushNotificationTemplate baidu;

  /// The default message template to use for push notification channels.
  @_s.JsonKey(name: 'Default')
  final DefaultPushNotificationTemplate defaultValue;

  /// A JSON object that specifies the default values to use for message variables
  /// in the message template. This object is a set of key-value pairs. Each key
  /// defines a message variable in the template. The corresponding value defines
  /// the default value for that variable. When you create a message that's based
  /// on the template, you can override these defaults with message-specific and
  /// address-specific variables and values.
  @_s.JsonKey(name: 'DefaultSubstitutions')
  final String defaultSubstitutions;

  /// The message template to use for the GCM channel, which is used to send
  /// notifications through the Firebase Cloud Messaging (FCM), formerly Google
  /// Cloud Messaging (GCM), service. This message template overrides the default
  /// template for push notification channels (DefaultPushNotificationTemplate).
  @_s.JsonKey(name: 'GCM')
  final AndroidPushNotificationTemplate gcm;

  /// The unique identifier for the recommender model to use for the message
  /// template. Amazon Pinpoint uses this value to determine how to retrieve and
  /// process data from a recommender model when it sends messages that use the
  /// template, if the template contains message variables for recommendation
  /// data.
  @_s.JsonKey(name: 'RecommenderId')
  final String recommenderId;

  /// A custom description of the message template.
  @_s.JsonKey(name: 'TemplateDescription')
  final String templateDescription;

  /// A string-to-string map of key-value pairs that defines the tags to associate
  /// with the message template. Each tag consists of a required tag key and an
  /// associated tag value.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  Map<String, dynamic> toJson() =>
      _$PushNotificationTemplateRequestToJson(this);
}

/// Provides information about the content and settings for a message template
/// that can be used in messages that are sent through a push notification
/// channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PushNotificationTemplateResponse {
  /// The date, in ISO 8601 format, when the message template was created.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The date, in ISO 8601 format, when the message template was last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The name of the message template.
  @_s.JsonKey(name: 'TemplateName')
  final String templateName;

  /// The type of channel that the message template is designed for. For a push
  /// notification template, this value is PUSH.
  @_s.JsonKey(name: 'TemplateType')
  final TemplateType templateType;

  /// The message template that's used for the ADM (Amazon Device Messaging)
  /// channel. This message template overrides the default template for push
  /// notification channels (DefaultPushNotificationTemplate).
  @_s.JsonKey(name: 'ADM')
  final AndroidPushNotificationTemplate adm;

  /// The message template that's used for the APNs (Apple Push Notification
  /// service) channel. This message template overrides the default template for
  /// push notification channels (DefaultPushNotificationTemplate).
  @_s.JsonKey(name: 'APNS')
  final APNSPushNotificationTemplate apns;

  /// The Amazon Resource Name (ARN) of the message template.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The message template that's used for the Baidu (Baidu Cloud Push) channel.
  /// This message template overrides the default template for push notification
  /// channels (DefaultPushNotificationTemplate).
  @_s.JsonKey(name: 'Baidu')
  final AndroidPushNotificationTemplate baidu;

  /// The default message template that's used for push notification channels.
  @_s.JsonKey(name: 'Default')
  final DefaultPushNotificationTemplate defaultValue;

  /// The JSON object that specifies the default values that are used for message
  /// variables in the message template. This object is a set of key-value pairs.
  /// Each key defines a message variable in the template. The corresponding value
  /// defines the default value for that variable.
  @_s.JsonKey(name: 'DefaultSubstitutions')
  final String defaultSubstitutions;

  /// The message template that's used for the GCM channel, which is used to send
  /// notifications through the Firebase Cloud Messaging (FCM), formerly Google
  /// Cloud Messaging (GCM), service. This message template overrides the default
  /// template for push notification channels (DefaultPushNotificationTemplate).
  @_s.JsonKey(name: 'GCM')
  final AndroidPushNotificationTemplate gcm;

  /// The unique identifier for the recommender model that's used by the message
  /// template.
  @_s.JsonKey(name: 'RecommenderId')
  final String recommenderId;

  /// The custom description of the message template.
  @_s.JsonKey(name: 'TemplateDescription')
  final String templateDescription;

  /// The unique identifier, as an integer, for the active version of the message
  /// template, or the version of the template that you specified by using the
  /// version parameter in your request.
  @_s.JsonKey(name: 'Version')
  final String version;

  /// A string-to-string map of key-value pairs that identifies the tags that are
  /// associated with the message template. Each tag consists of a required tag
  /// key and an associated tag value.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  PushNotificationTemplateResponse({
    @_s.required this.creationDate,
    @_s.required this.lastModifiedDate,
    @_s.required this.templateName,
    @_s.required this.templateType,
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
  factory PushNotificationTemplateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PushNotificationTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutEventStreamResponse {
  @_s.JsonKey(name: 'EventStream')
  final EventStream eventStream;

  PutEventStreamResponse({
    @_s.required this.eventStream,
  });
  factory PutEventStreamResponse.fromJson(Map<String, dynamic> json) =>
      _$PutEventStreamResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutEventsResponse {
  @_s.JsonKey(name: 'EventsResponse')
  final EventsResponse eventsResponse;

  PutEventsResponse({
    @_s.required this.eventsResponse,
  });
  factory PutEventsResponse.fromJson(Map<String, dynamic> json) =>
      _$PutEventsResponseFromJson(json);
}

/// Specifies the start and end times that define a time range when messages
/// aren't sent to endpoints.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class QuietTime {
  /// The specific time when quiet time ends. This value has to use 24-hour
  /// notation and be in HH:MM format, where HH is the hour (with a leading zero,
  /// if applicable) and MM is the minutes. For example, use 02:30 to represent
  /// 2:30 AM, or 14:30 to represent 2:30 PM.
  @_s.JsonKey(name: 'End')
  final String end;

  /// The specific time when quiet time begins. This value has to use 24-hour
  /// notation and be in HH:MM format, where HH is the hour (with a leading zero,
  /// if applicable) and MM is the minutes. For example, use 02:30 to represent
  /// 2:30 AM, or 14:30 to represent 2:30 PM.
  @_s.JsonKey(name: 'Start')
  final String start;

  QuietTime({
    this.end,
    this.start,
  });
  factory QuietTime.fromJson(Map<String, dynamic> json) =>
      _$QuietTimeFromJson(json);

  Map<String, dynamic> toJson() => _$QuietTimeToJson(this);
}

/// Specifies the settings for a random split activity in a journey. This type
/// of activity randomly sends specified percentages of participants down one of
/// as many as five paths in a journey, based on conditions that you specify.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RandomSplitActivity {
  /// The paths for the activity, including the percentage of participants to
  /// enter each path and the activity to perform for each path.
  @_s.JsonKey(name: 'Branches')
  final List<RandomSplitEntry> branches;

  RandomSplitActivity({
    this.branches,
  });
  factory RandomSplitActivity.fromJson(Map<String, dynamic> json) =>
      _$RandomSplitActivityFromJson(json);

  Map<String, dynamic> toJson() => _$RandomSplitActivityToJson(this);
}

/// Specifies the settings for a path in a random split activity in a journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RandomSplitEntry {
  /// The unique identifier for the next activity to perform, after completing the
  /// activity for the path.
  @_s.JsonKey(name: 'NextActivity')
  final String nextActivity;

  /// The percentage of participants to send down the activity path.
  ///
  /// To determine which participants are sent down each path, Amazon Pinpoint
  /// applies a probability-based algorithm to the percentages that you specify
  /// for the paths. Therefore, the actual percentage of participants who are sent
  /// down a path may not be equal to the percentage that you specify.
  @_s.JsonKey(name: 'Percentage')
  final int percentage;

  RandomSplitEntry({
    this.nextActivity,
    this.percentage,
  });
  factory RandomSplitEntry.fromJson(Map<String, dynamic> json) =>
      _$RandomSplitEntryFromJson(json);

  Map<String, dynamic> toJson() => _$RandomSplitEntryToJson(this);
}

/// Specifies the contents of an email message, represented as a raw MIME
/// message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RawEmail {
  /// The email message, represented as a raw MIME message. The entire message
  /// must be base64 encoded.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Data')
  final Uint8List data;

  RawEmail({
    this.data,
  });
  Map<String, dynamic> toJson() => _$RawEmailToJson(this);
}

/// Specifies criteria for including or excluding endpoints from a segment based
/// on how recently an endpoint was active.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RecencyDimension {
  /// The duration to use when determining whether an endpoint is active or
  /// inactive.
  @_s.JsonKey(name: 'Duration')
  final Duration duration;

  /// The type of recency dimension to use for the segment. Valid values are:
  /// ACTIVE, endpoints that were active within the specified duration are
  /// included in the segment; and, INACTIVE, endpoints that weren't active within
  /// the specified duration are included in the segment.
  @_s.JsonKey(name: 'RecencyType')
  final RecencyType recencyType;

  RecencyDimension({
    @_s.required this.duration,
    @_s.required this.recencyType,
  });
  factory RecencyDimension.fromJson(Map<String, dynamic> json) =>
      _$RecencyDimensionFromJson(json);

  Map<String, dynamic> toJson() => _$RecencyDimensionToJson(this);
}

enum RecencyType {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVE')
  inactive,
}

/// Provides information about Amazon Pinpoint configuration settings for
/// retrieving and processing data from a recommender model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecommenderConfigurationResponse {
  /// The date, in extended ISO 8601 format, when the configuration was created
  /// for the recommender model.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The unique identifier for the recommender model configuration.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The date, in extended ISO 8601 format, when the configuration for the
  /// recommender model was last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorizes Amazon Pinpoint to retrieve recommendation data
  /// from the recommender model.
  @_s.JsonKey(name: 'RecommendationProviderRoleArn')
  final String recommendationProviderRoleArn;

  /// The Amazon Resource Name (ARN) of the recommender model that Amazon Pinpoint
  /// retrieves the recommendation data from. This value is the ARN of an Amazon
  /// Personalize campaign.
  @_s.JsonKey(name: 'RecommendationProviderUri')
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
  @_s.JsonKey(name: 'Attributes')
  final Map<String, String> attributes;

  /// The custom description of the configuration for the recommender model.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The custom name of the configuration for the recommender model.
  @_s.JsonKey(name: 'Name')
  final String name;

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
  @_s.JsonKey(name: 'RecommendationProviderIdType')
  final String recommendationProviderIdType;

  /// The name or Amazon Resource Name (ARN) of the AWS Lambda function that
  /// Amazon Pinpoint invokes to perform additional processing of recommendation
  /// data that it retrieves from the recommender model.
  @_s.JsonKey(name: 'RecommendationTransformerUri')
  final String recommendationTransformerUri;

  /// The custom display name for the standard endpoint or user attribute
  /// (RecommendationItems) that temporarily stores recommended items for each
  /// endpoint or user, depending on the value for the
  /// RecommendationProviderIdType property. This name appears in the <b>Attribute
  /// finder</b> of the template editor on the Amazon Pinpoint console.
  ///
  /// This value is null if the configuration doesn't invoke an AWS Lambda
  /// function (RecommendationTransformerUri) to perform additional processing of
  /// recommendation data.
  @_s.JsonKey(name: 'RecommendationsDisplayName')
  final String recommendationsDisplayName;

  /// The number of recommended items that are retrieved from the model for each
  /// endpoint or user, depending on the value for the
  /// RecommendationProviderIdType property. This number determines how many
  /// recommended items are available for use in message variables.
  @_s.JsonKey(name: 'RecommendationsPerMessage')
  final int recommendationsPerMessage;

  RecommenderConfigurationResponse({
    @_s.required this.creationDate,
    @_s.required this.id,
    @_s.required this.lastModifiedDate,
    @_s.required this.recommendationProviderRoleArn,
    @_s.required this.recommendationProviderUri,
    this.attributes,
    this.description,
    this.name,
    this.recommendationProviderIdType,
    this.recommendationTransformerUri,
    this.recommendationsDisplayName,
    this.recommendationsPerMessage,
  });
  factory RecommenderConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RecommenderConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveAttributesResponse {
  @_s.JsonKey(name: 'AttributesResource')
  final AttributesResource attributesResource;

  RemoveAttributesResponse({
    @_s.required this.attributesResource,
  });
  factory RemoveAttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveAttributesResponseFromJson(json);
}

/// Provides the results of a query that retrieved the data for a standard
/// metric that applies to an application, campaign, or journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResultRow {
  /// An array of objects that defines the field and field values that were used
  /// to group data in a result set that contains multiple results. This value is
  /// null if the data in a result set isn’t grouped.
  @_s.JsonKey(name: 'GroupedBys')
  final List<ResultRowValue> groupedBys;

  /// An array of objects that provides pre-aggregated values for a standard
  /// metric that applies to an application, campaign, or journey.
  @_s.JsonKey(name: 'Values')
  final List<ResultRowValue> values;

  ResultRow({
    @_s.required this.groupedBys,
    @_s.required this.values,
  });
  factory ResultRow.fromJson(Map<String, dynamic> json) =>
      _$ResultRowFromJson(json);
}

/// Provides a single value and metadata about that value as part of an array of
/// query results for a standard metric that applies to an application,
/// campaign, or journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResultRowValue {
  /// The friendly name of the metric whose value is specified by the Value
  /// property.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The data type of the value specified by the Value property.
  @_s.JsonKey(name: 'Type')
  final String type;

  /// In a Values object, the value for the metric that the query retrieved data
  /// for. In a GroupedBys object, the value for the field that was used to group
  /// data in a result set that contains multiple results (Values objects).
  @_s.JsonKey(name: 'Value')
  final String value;

  ResultRowValue({
    @_s.required this.key,
    @_s.required this.type,
    @_s.required this.value,
  });
  factory ResultRowValue.fromJson(Map<String, dynamic> json) =>
      _$ResultRowValueFromJson(json);
}

/// Specifies the status and settings of the SMS channel for an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SMSChannelRequest {
  /// Specifies whether to enable the SMS channel for the application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The identity that you want to display on recipients' devices when they
  /// receive messages from the SMS channel.
  @_s.JsonKey(name: 'SenderId')
  final String senderId;

  /// The registered short code that you want to use when you send messages
  /// through the SMS channel.
  @_s.JsonKey(name: 'ShortCode')
  final String shortCode;

  SMSChannelRequest({
    this.enabled,
    this.senderId,
    this.shortCode,
  });
  Map<String, dynamic> toJson() => _$SMSChannelRequestToJson(this);
}

/// Provides information about the status and settings of the SMS channel for an
/// application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SMSChannelResponse {
  /// The type of messaging or notification platform for the channel. For the SMS
  /// channel, this value is SMS.
  @_s.JsonKey(name: 'Platform')
  final String platform;

  /// The unique identifier for the application that the SMS channel applies to.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The date and time, in ISO 8601 format, when the SMS channel was enabled.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// Specifies whether the SMS channel is enabled for the application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// (Not used) This property is retained only for backward compatibility.
  @_s.JsonKey(name: 'HasCredential')
  final bool hasCredential;

  /// (Deprecated) An identifier for the SMS channel. This property is retained
  /// only for backward compatibility.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Specifies whether the SMS channel is archived.
  @_s.JsonKey(name: 'IsArchived')
  final bool isArchived;

  /// The user who last modified the SMS channel.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The date and time, in ISO 8601 format, when the SMS channel was last
  /// modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The maximum number of promotional messages that you can send through the SMS
  /// channel each second.
  @_s.JsonKey(name: 'PromotionalMessagesPerSecond')
  final int promotionalMessagesPerSecond;

  /// The identity that displays on recipients' devices when they receive messages
  /// from the SMS channel.
  @_s.JsonKey(name: 'SenderId')
  final String senderId;

  /// The registered short code to use when you send messages through the SMS
  /// channel.
  @_s.JsonKey(name: 'ShortCode')
  final String shortCode;

  /// The maximum number of transactional messages that you can send through the
  /// SMS channel each second.
  @_s.JsonKey(name: 'TransactionalMessagesPerSecond')
  final int transactionalMessagesPerSecond;

  /// The current version of the SMS channel.
  @_s.JsonKey(name: 'Version')
  final int version;

  SMSChannelResponse({
    @_s.required this.platform,
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
  factory SMSChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$SMSChannelResponseFromJson(json);
}

/// Specifies the default settings for a one-time SMS message that's sent
/// directly to an endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SMSMessage {
  /// The body of the SMS message.
  @_s.JsonKey(name: 'Body')
  final String body;

  /// The SMS program name that you provided to AWS Support when you requested
  /// your dedicated number.
  @_s.JsonKey(name: 'Keyword')
  final String keyword;

  /// This field is reserved for future use.
  @_s.JsonKey(name: 'MediaUrl')
  final String mediaUrl;

  /// The SMS message type. Valid values are TRANSACTIONAL (for messages that are
  /// critical or time-sensitive, such as a one-time passwords) and PROMOTIONAL
  /// (for messsages that aren't critical or time-sensitive, such as marketing
  /// messages).
  @_s.JsonKey(name: 'MessageType')
  final MessageType messageType;

  /// The number to send the SMS message from. This value should be one of the
  /// dedicated long or short codes that's assigned to your AWS account. If you
  /// don't specify a long or short code, Amazon Pinpoint assigns a random long
  /// code to the SMS message and sends the message from that code.
  @_s.JsonKey(name: 'OriginationNumber')
  final String originationNumber;

  /// The sender ID to display as the sender of the message on a recipient's
  /// device. Support for sender IDs varies by country or region.
  @_s.JsonKey(name: 'SenderId')
  final String senderId;

  /// The message variables to use in the SMS message. You can override the
  /// default variables with individual address variables.
  @_s.JsonKey(name: 'Substitutions')
  final Map<String, List<String>> substitutions;

  SMSMessage({
    this.body,
    this.keyword,
    this.mediaUrl,
    this.messageType,
    this.originationNumber,
    this.senderId,
    this.substitutions,
  });
  Map<String, dynamic> toJson() => _$SMSMessageToJson(this);
}

/// Specifies the settings for an SMS activity in a journey. This type of
/// activity sends a text message to participants.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SMSMessageActivity {
  /// Specifies the sender ID and message type for an SMS message that's sent to
  /// participants in a journey.
  @_s.JsonKey(name: 'MessageConfig')
  final JourneySMSMessage messageConfig;

  /// The unique identifier for the next activity to perform, after the message is
  /// sent.
  @_s.JsonKey(name: 'NextActivity')
  final String nextActivity;

  /// The name of the SMS message template to use for the message. If specified,
  /// this value must match the name of an existing message template.
  @_s.JsonKey(name: 'TemplateName')
  final String templateName;

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
  @_s.JsonKey(name: 'TemplateVersion')
  final String templateVersion;

  SMSMessageActivity({
    this.messageConfig,
    this.nextActivity,
    this.templateName,
    this.templateVersion,
  });
  factory SMSMessageActivity.fromJson(Map<String, dynamic> json) =>
      _$SMSMessageActivityFromJson(json);

  Map<String, dynamic> toJson() => _$SMSMessageActivityToJson(this);
}

/// Specifies the content and settings for a message template that can be used
/// in text messages that are sent through the SMS channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SMSTemplateRequest {
  /// The message body to use in text messages that are based on the message
  /// template.
  @_s.JsonKey(name: 'Body')
  final String body;

  /// A JSON object that specifies the default values to use for message variables
  /// in the message template. This object is a set of key-value pairs. Each key
  /// defines a message variable in the template. The corresponding value defines
  /// the default value for that variable. When you create a message that's based
  /// on the template, you can override these defaults with message-specific and
  /// address-specific variables and values.
  @_s.JsonKey(name: 'DefaultSubstitutions')
  final String defaultSubstitutions;

  /// The unique identifier for the recommender model to use for the message
  /// template. Amazon Pinpoint uses this value to determine how to retrieve and
  /// process data from a recommender model when it sends messages that use the
  /// template, if the template contains message variables for recommendation
  /// data.
  @_s.JsonKey(name: 'RecommenderId')
  final String recommenderId;

  /// A custom description of the message template.
  @_s.JsonKey(name: 'TemplateDescription')
  final String templateDescription;

  /// A string-to-string map of key-value pairs that defines the tags to associate
  /// with the message template. Each tag consists of a required tag key and an
  /// associated tag value.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  SMSTemplateRequest({
    this.body,
    this.defaultSubstitutions,
    this.recommenderId,
    this.templateDescription,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$SMSTemplateRequestToJson(this);
}

/// Provides information about the content and settings for a message template
/// that can be used in text messages that are sent through the SMS channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SMSTemplateResponse {
  /// The date, in ISO 8601 format, when the message template was created.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The date, in ISO 8601 format, when the message template was last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The name of the message template.
  @_s.JsonKey(name: 'TemplateName')
  final String templateName;

  /// The type of channel that the message template is designed for. For an SMS
  /// template, this value is SMS.
  @_s.JsonKey(name: 'TemplateType')
  final TemplateType templateType;

  /// The Amazon Resource Name (ARN) of the message template.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The message body that's used in text messages that are based on the message
  /// template.
  @_s.JsonKey(name: 'Body')
  final String body;

  /// The JSON object that specifies the default values that are used for message
  /// variables in the message template. This object is a set of key-value pairs.
  /// Each key defines a message variable in the template. The corresponding value
  /// defines the default value for that variable.
  @_s.JsonKey(name: 'DefaultSubstitutions')
  final String defaultSubstitutions;

  /// The unique identifier for the recommender model that's used by the message
  /// template.
  @_s.JsonKey(name: 'RecommenderId')
  final String recommenderId;

  /// The custom description of the message template.
  @_s.JsonKey(name: 'TemplateDescription')
  final String templateDescription;

  /// The unique identifier, as an integer, for the active version of the message
  /// template, or the version of the template that you specified by using the
  /// version parameter in your request.
  @_s.JsonKey(name: 'Version')
  final String version;

  /// A string-to-string map of key-value pairs that identifies the tags that are
  /// associated with the message template. Each tag consists of a required tag
  /// key and an associated tag value.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  SMSTemplateResponse({
    @_s.required this.creationDate,
    @_s.required this.lastModifiedDate,
    @_s.required this.templateName,
    @_s.required this.templateType,
    this.arn,
    this.body,
    this.defaultSubstitutions,
    this.recommenderId,
    this.templateDescription,
    this.version,
    this.tags,
  });
  factory SMSTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$SMSTemplateResponseFromJson(json);
}

/// Specifies the schedule settings for a campaign.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Schedule {
  /// The scheduled time when the campaign began or will begin. Valid values are:
  /// IMMEDIATE, to start the campaign immediately; or, a specific time in ISO
  /// 8601 format.
  @_s.JsonKey(name: 'StartTime')
  final String startTime;

  /// The scheduled time, in ISO 8601 format, when the campaign ended or will end.
  @_s.JsonKey(name: 'EndTime')
  final String endTime;

  /// The type of event that causes the campaign to be sent, if the value of the
  /// Frequency property is EVENT.
  @_s.JsonKey(name: 'EventFilter')
  final CampaignEventFilter eventFilter;

  /// Specifies how often the campaign is sent or whether the campaign is sent in
  /// response to a specific event.
  @_s.JsonKey(name: 'Frequency')
  final Frequency frequency;

  /// Specifies whether the start and end times for the campaign schedule use each
  /// recipient's local time. To base the schedule on each recipient's local time,
  /// set this value to true.
  @_s.JsonKey(name: 'IsLocalTime')
  final bool isLocalTime;

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
  @_s.JsonKey(name: 'QuietTime')
  final QuietTime quietTime;

  /// The starting UTC offset for the campaign schedule, if the value of the
  /// IsLocalTime property is true. Valid values are: UTC, UTC+01, UTC+02, UTC+03,
  /// UTC+03:30, UTC+04, UTC+04:30, UTC+05,
  /// UTC+05:30, UTC+05:45, UTC+06, UTC+06:30, UTC+07, UTC+08, UTC+09, UTC+09:30,
  /// UTC+10, UTC+10:30, UTC+11, UTC+12, UTC+13, UTC-02, UTC-03, UTC-04, UTC-05,
  /// UTC-06,
  /// UTC-07, UTC-08, UTC-09, UTC-10, and UTC-11.
  @_s.JsonKey(name: 'Timezone')
  final String timezone;

  Schedule({
    @_s.required this.startTime,
    this.endTime,
    this.eventFilter,
    this.frequency,
    this.isLocalTime,
    this.quietTime,
    this.timezone,
  });
  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}

/// Specifies dimension settings for including or excluding endpoints from a
/// segment based on how recently an endpoint was active.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SegmentBehaviors {
  /// The dimension settings that are based on how recently an endpoint was
  /// active.
  @_s.JsonKey(name: 'Recency')
  final RecencyDimension recency;

  SegmentBehaviors({
    this.recency,
  });
  factory SegmentBehaviors.fromJson(Map<String, dynamic> json) =>
      _$SegmentBehaviorsFromJson(json);

  Map<String, dynamic> toJson() => _$SegmentBehaviorsToJson(this);
}

/// Specifies a segment to associate with an activity in a journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SegmentCondition {
  /// The unique identifier for the segment to associate with the activity.
  @_s.JsonKey(name: 'SegmentId')
  final String segmentId;

  SegmentCondition({
    @_s.required this.segmentId,
  });
  factory SegmentCondition.fromJson(Map<String, dynamic> json) =>
      _$SegmentConditionFromJson(json);

  Map<String, dynamic> toJson() => _$SegmentConditionToJson(this);
}

/// Specifies demographic-based dimension settings for including or excluding
/// endpoints from a segment. These settings derive from characteristics of
/// endpoint devices, such as platform, make, and model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SegmentDemographics {
  /// The app version criteria for the segment.
  @_s.JsonKey(name: 'AppVersion')
  final SetDimension appVersion;

  /// The channel criteria for the segment.
  @_s.JsonKey(name: 'Channel')
  final SetDimension channel;

  /// The device type criteria for the segment.
  @_s.JsonKey(name: 'DeviceType')
  final SetDimension deviceType;

  /// The device make criteria for the segment.
  @_s.JsonKey(name: 'Make')
  final SetDimension make;

  /// The device model criteria for the segment.
  @_s.JsonKey(name: 'Model')
  final SetDimension model;

  /// The device platform criteria for the segment.
  @_s.JsonKey(name: 'Platform')
  final SetDimension platform;

  SegmentDemographics({
    this.appVersion,
    this.channel,
    this.deviceType,
    this.make,
    this.model,
    this.platform,
  });
  factory SegmentDemographics.fromJson(Map<String, dynamic> json) =>
      _$SegmentDemographicsFromJson(json);

  Map<String, dynamic> toJson() => _$SegmentDemographicsToJson(this);
}

/// Specifies the dimension settings for a segment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SegmentDimensions {
  /// One or more custom attributes to use as criteria for the segment.
  @_s.JsonKey(name: 'Attributes')
  final Map<String, AttributeDimension> attributes;

  /// The behavior-based criteria, such as how recently users have used your app,
  /// for the segment.
  @_s.JsonKey(name: 'Behavior')
  final SegmentBehaviors behavior;

  /// The demographic-based criteria, such as device platform, for the segment.
  @_s.JsonKey(name: 'Demographic')
  final SegmentDemographics demographic;

  /// The location-based criteria, such as region or GPS coordinates, for the
  /// segment.
  @_s.JsonKey(name: 'Location')
  final SegmentLocation location;

  /// One or more custom metrics to use as criteria for the segment.
  @_s.JsonKey(name: 'Metrics')
  final Map<String, MetricDimension> metrics;

  /// One or more custom user attributes to use as criteria for the segment.
  @_s.JsonKey(name: 'UserAttributes')
  final Map<String, AttributeDimension> userAttributes;

  SegmentDimensions({
    this.attributes,
    this.behavior,
    this.demographic,
    this.location,
    this.metrics,
    this.userAttributes,
  });
  factory SegmentDimensions.fromJson(Map<String, dynamic> json) =>
      _$SegmentDimensionsFromJson(json);

  Map<String, dynamic> toJson() => _$SegmentDimensionsToJson(this);
}

/// Specifies the base segments and dimensions for a segment, and the
/// relationships between these base segments and dimensions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SegmentGroup {
  /// An array that defines the dimensions for the segment.
  @_s.JsonKey(name: 'Dimensions')
  final List<SegmentDimensions> dimensions;

  /// The base segment to build the segment on. A base segment, also referred to
  /// as a <i>source segment</i>, defines the initial population of endpoints for
  /// a segment. When you add dimensions to a segment, Amazon Pinpoint filters the
  /// base segment by using the dimensions that you specify.
  ///
  /// You can specify more than one dimensional segment or only one imported
  /// segment. If you specify an imported segment, the Amazon Pinpoint console
  /// displays a segment size estimate that indicates the size of the imported
  /// segment without any filters applied to it.
  @_s.JsonKey(name: 'SourceSegments')
  final List<SegmentReference> sourceSegments;

  /// Specifies how to handle multiple base segments for the segment. For example,
  /// if you specify three base segments for the segment, whether the resulting
  /// segment is based on all, any, or none of the base segments.
  @_s.JsonKey(name: 'SourceType')
  final SourceType sourceType;

  /// Specifies how to handle multiple dimensions for the segment. For example, if
  /// you specify three dimensions for the segment, whether the resulting segment
  /// includes endpoints that match all, any, or none of the dimensions.
  @_s.JsonKey(name: 'Type')
  final Type type;

  SegmentGroup({
    this.dimensions,
    this.sourceSegments,
    this.sourceType,
    this.type,
  });
  factory SegmentGroup.fromJson(Map<String, dynamic> json) =>
      _$SegmentGroupFromJson(json);

  Map<String, dynamic> toJson() => _$SegmentGroupToJson(this);
}

/// Specifies the settings that define the relationships between segment groups
/// for a segment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SegmentGroupList {
  /// An array that defines the set of segment criteria to evaluate when handling
  /// segment groups for the segment.
  @_s.JsonKey(name: 'Groups')
  final List<SegmentGroup> groups;

  /// Specifies how to handle multiple segment groups for the segment. For
  /// example, if the segment includes three segment groups, whether the resulting
  /// segment includes endpoints that match all, any, or none of the segment
  /// groups.
  @_s.JsonKey(name: 'Include')
  final Include include;

  SegmentGroupList({
    this.groups,
    this.include,
  });
  factory SegmentGroupList.fromJson(Map<String, dynamic> json) =>
      _$SegmentGroupListFromJson(json);

  Map<String, dynamic> toJson() => _$SegmentGroupListToJson(this);
}

/// Provides information about the import job that created a segment. An import
/// job is a job that creates a user segment by importing endpoint definitions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SegmentImportResource {
  /// (Deprecated) Your AWS account ID, which you assigned to an external ID key
  /// in an IAM trust policy. Amazon Pinpoint previously used this value to assume
  /// an IAM role when importing endpoint definitions, but we removed this
  /// requirement. We don't recommend use of external IDs for IAM roles that are
  /// assumed by Amazon Pinpoint.
  @_s.JsonKey(name: 'ExternalId')
  final String externalId;

  /// The format of the files that were imported to create the segment. Valid
  /// values are: CSV, for comma-separated values format; and, JSON, for
  /// newline-delimited JSON format.
  @_s.JsonKey(name: 'Format')
  final Format format;

  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorized Amazon Pinpoint to access the Amazon S3 location
  /// to import endpoint definitions from.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// The URL of the Amazon Simple Storage Service (Amazon S3) bucket that the
  /// endpoint definitions were imported from to create the segment.
  @_s.JsonKey(name: 'S3Url')
  final String s3Url;

  /// The number of endpoint definitions that were imported successfully to create
  /// the segment.
  @_s.JsonKey(name: 'Size')
  final int size;

  /// The number of channel types in the endpoint definitions that were imported
  /// to create the segment.
  @_s.JsonKey(name: 'ChannelCounts')
  final Map<String, int> channelCounts;

  SegmentImportResource({
    @_s.required this.externalId,
    @_s.required this.format,
    @_s.required this.roleArn,
    @_s.required this.s3Url,
    @_s.required this.size,
    this.channelCounts,
  });
  factory SegmentImportResource.fromJson(Map<String, dynamic> json) =>
      _$SegmentImportResourceFromJson(json);
}

/// Specifies geographical dimension settings for a segment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SegmentLocation {
  /// The country or region code, in ISO 3166-1 alpha-2 format, for the segment.
  @_s.JsonKey(name: 'Country')
  final SetDimension country;

  /// The GPS location and range for the segment.
  @_s.JsonKey(name: 'GPSPoint')
  final GPSPointDimension gPSPoint;

  SegmentLocation({
    this.country,
    this.gPSPoint,
  });
  factory SegmentLocation.fromJson(Map<String, dynamic> json) =>
      _$SegmentLocationFromJson(json);

  Map<String, dynamic> toJson() => _$SegmentLocationToJson(this);
}

/// Specifies the segment identifier and version of a segment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SegmentReference {
  /// The unique identifier for the segment.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The version number of the segment.
  @_s.JsonKey(name: 'Version')
  final int version;

  SegmentReference({
    @_s.required this.id,
    this.version,
  });
  factory SegmentReference.fromJson(Map<String, dynamic> json) =>
      _$SegmentReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$SegmentReferenceToJson(this);
}

/// Provides information about the configuration, dimension, and other settings
/// for a segment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SegmentResponse {
  /// The unique identifier for the application that the segment is associated
  /// with.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The Amazon Resource Name (ARN) of the segment.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The date and time when the segment was created.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The unique identifier for the segment.
  @_s.JsonKey(name: 'Id')
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
  @_s.JsonKey(name: 'SegmentType')
  final SegmentType segmentType;

  /// The dimension settings for the segment.
  @_s.JsonKey(name: 'Dimensions')
  final SegmentDimensions dimensions;

  /// The settings for the import job that's associated with the segment.
  @_s.JsonKey(name: 'ImportDefinition')
  final SegmentImportResource importDefinition;

  /// The date and time when the segment was last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The name of the segment.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A list of one or more segment groups that apply to the segment. Each segment
  /// group consists of zero or more base segments and the dimensions that are
  /// applied to those base segments.
  @_s.JsonKey(name: 'SegmentGroups')
  final SegmentGroupList segmentGroups;

  /// The version number of the segment.
  @_s.JsonKey(name: 'Version')
  final int version;

  /// A string-to-string map of key-value pairs that identifies the tags that are
  /// associated with the segment. Each tag consists of a required tag key and an
  /// associated tag value.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  SegmentResponse({
    @_s.required this.applicationId,
    @_s.required this.arn,
    @_s.required this.creationDate,
    @_s.required this.id,
    @_s.required this.segmentType,
    this.dimensions,
    this.importDefinition,
    this.lastModifiedDate,
    this.name,
    this.segmentGroups,
    this.version,
    this.tags,
  });
  factory SegmentResponse.fromJson(Map<String, dynamic> json) =>
      _$SegmentResponseFromJson(json);
}

enum SegmentType {
  @_s.JsonValue('DIMENSIONAL')
  dimensional,
  @_s.JsonValue('IMPORT')
  import,
}

/// Provides information about all the segments that are associated with an
/// application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SegmentsResponse {
  /// An array of responses, one for each segment that's associated with the
  /// application (Segments resource) or each version of a segment that's
  /// associated with the application (Segment Versions resource).
  @_s.JsonKey(name: 'Item')
  final List<SegmentResponse> item;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  SegmentsResponse({
    @_s.required this.item,
    this.nextToken,
  });
  factory SegmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$SegmentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendMessagesResponse {
  @_s.JsonKey(name: 'MessageResponse')
  final MessageResponse messageResponse;

  SendMessagesResponse({
    @_s.required this.messageResponse,
  });
  factory SendMessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$SendMessagesResponseFromJson(json);
}

/// Specifies the configuration and other settings for a message to send to all
/// the endpoints that are associated with a list of users.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SendUsersMessageRequest {
  /// The settings and content for the default message and any default messages
  /// that you defined for specific channels.
  @_s.JsonKey(name: 'MessageConfiguration')
  final DirectMessageConfiguration messageConfiguration;

  /// A map that associates user IDs with <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-messages.html#apps-application-id-messages-model-endpointsendconfiguration">EndpointSendConfiguration</a>
  /// objects. You can use an <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/apireference/apps-application-id-messages.html#apps-application-id-messages-model-endpointsendconfiguration">EndpointSendConfiguration</a>
  /// object to tailor the message for a user by specifying settings such as
  /// content overrides and message variables.
  @_s.JsonKey(name: 'Users')
  final Map<String, EndpointSendConfiguration> users;

  /// A map of custom attribute-value pairs. For a push notification, Amazon
  /// Pinpoint adds these attributes to the data.pinpoint object in the body of
  /// the notification payload. Amazon Pinpoint also provides these attributes in
  /// the events that it generates for users-messages deliveries.
  @_s.JsonKey(name: 'Context')
  final Map<String, String> context;

  /// The message template to use for the message.
  @_s.JsonKey(name: 'TemplateConfiguration')
  final TemplateConfiguration templateConfiguration;

  /// The unique identifier for tracing the message. This identifier is visible to
  /// message recipients.
  @_s.JsonKey(name: 'TraceId')
  final String traceId;

  SendUsersMessageRequest({
    @_s.required this.messageConfiguration,
    @_s.required this.users,
    this.context,
    this.templateConfiguration,
    this.traceId,
  });
  Map<String, dynamic> toJson() => _$SendUsersMessageRequestToJson(this);
}

/// Provides information about which users and endpoints a message was sent to.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendUsersMessageResponse {
  /// The unique identifier for the application that was used to send the message.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The unique identifier that was assigned to the message request.
  @_s.JsonKey(name: 'RequestId')
  final String requestId;

  /// An object that indicates which endpoints the message was sent to, for each
  /// user. The object lists user IDs and, for each user ID, provides the endpoint
  /// IDs that the message was sent to. For each endpoint ID, it provides an
  /// EndpointMessageResult object.
  @_s.JsonKey(name: 'Result')
  final Map<String, Map<String, EndpointMessageResult>> result;

  SendUsersMessageResponse({
    @_s.required this.applicationId,
    this.requestId,
    this.result,
  });
  factory SendUsersMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$SendUsersMessageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendUsersMessagesResponse {
  @_s.JsonKey(name: 'SendUsersMessageResponse')
  final SendUsersMessageResponse sendUsersMessageResponse;

  SendUsersMessagesResponse({
    @_s.required this.sendUsersMessageResponse,
  });
  factory SendUsersMessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$SendUsersMessagesResponseFromJson(json);
}

/// Provides information about a session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Session {
  /// The unique identifier for the session.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The date and time when the session began.
  @_s.JsonKey(name: 'StartTimestamp')
  final String startTimestamp;

  /// The duration of the session, in milliseconds.
  @_s.JsonKey(name: 'Duration')
  final int duration;

  /// The date and time when the session ended.
  @_s.JsonKey(name: 'StopTimestamp')
  final String stopTimestamp;

  Session({
    @_s.required this.id,
    @_s.required this.startTimestamp,
    this.duration,
    this.stopTimestamp,
  });
  Map<String, dynamic> toJson() => _$SessionToJson(this);
}

/// Specifies the dimension type and values for a segment dimension.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SetDimension {
  /// The criteria values to use for the segment dimension. Depending on the value
  /// of the DimensionType property, endpoints are included or excluded from the
  /// segment if their values match the criteria values.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  /// The type of segment dimension to use. Valid values are: INCLUSIVE, endpoints
  /// that match the criteria are included in the segment; and, EXCLUSIVE,
  /// endpoints that match the criteria are excluded from the segment.
  @_s.JsonKey(name: 'DimensionType')
  final DimensionType dimensionType;

  SetDimension({
    @_s.required this.values,
    this.dimensionType,
  });
  factory SetDimension.fromJson(Map<String, dynamic> json) =>
      _$SetDimensionFromJson(json);

  Map<String, dynamic> toJson() => _$SetDimensionToJson(this);
}

/// Specifies a condition to evaluate for an activity in a journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SimpleCondition {
  /// The dimension settings for the event that's associated with the activity.
  @_s.JsonKey(name: 'EventCondition')
  final EventCondition eventCondition;

  /// The segment that's associated with the activity.
  @_s.JsonKey(name: 'SegmentCondition')
  final SegmentCondition segmentCondition;

  /// The dimension settings for the segment that's associated with the activity.
  @_s.JsonKey(name: 'segmentDimensions')
  final SegmentDimensions segmentDimensions;

  SimpleCondition({
    this.eventCondition,
    this.segmentCondition,
    this.segmentDimensions,
  });
  factory SimpleCondition.fromJson(Map<String, dynamic> json) =>
      _$SimpleConditionFromJson(json);

  Map<String, dynamic> toJson() => _$SimpleConditionToJson(this);
}

/// Specifies the contents of an email message, composed of a subject, a text
/// part, and an HTML part.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SimpleEmail {
  /// The body of the email message, in HTML format. We recommend using HTML
  /// format for email clients that render HTML content. You can include links,
  /// formatted text, and more in an HTML message.
  @_s.JsonKey(name: 'HtmlPart')
  final SimpleEmailPart htmlPart;

  /// The subject line, or title, of the email.
  @_s.JsonKey(name: 'Subject')
  final SimpleEmailPart subject;

  /// The body of the email message, in plain text format. We recommend using
  /// plain text format for email clients that don't render HTML content and
  /// clients that are connected to high-latency networks, such as mobile devices.
  @_s.JsonKey(name: 'TextPart')
  final SimpleEmailPart textPart;

  SimpleEmail({
    this.htmlPart,
    this.subject,
    this.textPart,
  });
  Map<String, dynamic> toJson() => _$SimpleEmailToJson(this);
}

/// Specifies the subject or body of an email message, represented as textual
/// email data and the applicable character set.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SimpleEmailPart {
  /// The applicable character set for the message content.
  @_s.JsonKey(name: 'Charset')
  final String charset;

  /// The textual data of the message content.
  @_s.JsonKey(name: 'Data')
  final String data;

  SimpleEmailPart({
    this.charset,
    this.data,
  });
  Map<String, dynamic> toJson() => _$SimpleEmailPartToJson(this);
}

enum SourceType {
  @_s.JsonValue('ALL')
  all,
  @_s.JsonValue('ANY')
  any,
  @_s.JsonValue('NONE')
  none,
}

/// Specifies the conditions for the first activity in a journey. This activity
/// and its conditions determine which users are participants in a journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StartCondition {
  /// The custom description of the condition.
  @_s.JsonKey(name: 'Description')
  final String description;
  @_s.JsonKey(name: 'EventStartCondition')
  final EventStartCondition eventStartCondition;

  /// The segment that's associated with the first activity in the journey. This
  /// segment determines which users are participants in the journey.
  @_s.JsonKey(name: 'SegmentStartCondition')
  final SegmentCondition segmentStartCondition;

  StartCondition({
    this.description,
    this.eventStartCondition,
    this.segmentStartCondition,
  });
  factory StartCondition.fromJson(Map<String, dynamic> json) =>
      _$StartConditionFromJson(json);

  Map<String, dynamic> toJson() => _$StartConditionToJson(this);
}

enum State {
  @_s.JsonValue('DRAFT')
  draft,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('CANCELLED')
  cancelled,
  @_s.JsonValue('CLOSED')
  closed,
}

/// Specifies the tags (keys and values) for an application, campaign, message
/// template, or segment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TagsModel {
  /// A string-to-string map of key-value pairs that defines the tags for an
  /// application, campaign, message template, or segment. Each of these resources
  /// can have a maximum of 50 tags.
  ///
  /// Each tag consists of a required tag key and an associated tag value. The
  /// maximum length of a tag key is 128 characters. The maximum length of a tag
  /// value is 256 characters.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  TagsModel({
    @_s.required this.tags,
  });
  factory TagsModel.fromJson(Map<String, dynamic> json) =>
      _$TagsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TagsModelToJson(this);
}

/// Specifies the name and version of the message template to use for the
/// message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Template {
  /// The name of the message template to use for the message. If specified, this
  /// value must match the name of an existing message template.
  @_s.JsonKey(name: 'Name')
  final String name;

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
  @_s.JsonKey(name: 'Version')
  final String version;

  Template({
    this.name,
    this.version,
  });
  factory Template.fromJson(Map<String, dynamic> json) =>
      _$TemplateFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateToJson(this);
}

/// Specifies which version of a message template to use as the active version
/// of the template.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TemplateActiveVersionRequest {
  /// The version of the message template to use as the active version of the
  /// template. Valid values are: latest, for the most recent version of the
  /// template; or, the unique identifier for any existing version of the
  /// template. If you specify an identifier, the value must match the identifier
  /// for an existing template version. To retrieve a list of versions and version
  /// identifiers for a template, use the <link
  /// linkend="templates-template-name-template-type-versions">Template
  /// Versions</link> resource.
  @_s.JsonKey(name: 'Version')
  final String version;

  TemplateActiveVersionRequest({
    this.version,
  });
  Map<String, dynamic> toJson() => _$TemplateActiveVersionRequestToJson(this);
}

/// Specifies the message template to use for the message, for each type of
/// channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TemplateConfiguration {
  /// The email template to use for the message.
  @_s.JsonKey(name: 'EmailTemplate')
  final Template emailTemplate;

  /// The push notification template to use for the message.
  @_s.JsonKey(name: 'PushTemplate')
  final Template pushTemplate;

  /// The SMS template to use for the message.
  @_s.JsonKey(name: 'SMSTemplate')
  final Template sMSTemplate;

  /// The voice template to use for the message. This object isn't supported for
  /// campaigns.
  @_s.JsonKey(name: 'VoiceTemplate')
  final Template voiceTemplate;

  TemplateConfiguration({
    this.emailTemplate,
    this.pushTemplate,
    this.sMSTemplate,
    this.voiceTemplate,
  });
  factory TemplateConfiguration.fromJson(Map<String, dynamic> json) =>
      _$TemplateConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateConfigurationToJson(this);
}

/// Provides information about a message template that's associated with your
/// Amazon Pinpoint account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TemplateResponse {
  /// The date, in ISO 8601 format, when the message template was created.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The date, in ISO 8601 format, when the message template was last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The name of the message template.
  @_s.JsonKey(name: 'TemplateName')
  final String templateName;

  /// The type of channel that the message template is designed for. Possible
  /// values are: EMAIL, PUSH, SMS, and VOICE.
  @_s.JsonKey(name: 'TemplateType')
  final TemplateType templateType;

  /// The Amazon Resource Name (ARN) of the message template. This value isn't
  /// included in a TemplateResponse object. To retrieve the ARN of a template,
  /// use the GetEmailTemplate, GetPushTemplate, GetSmsTemplate, or
  /// GetVoiceTemplate operation, depending on the type of template that you want
  /// to retrieve the ARN for.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The JSON object that specifies the default values that are used for message
  /// variables in the message template. This object isn't included in a
  /// TemplateResponse object. To retrieve this object for a template, use the
  /// GetEmailTemplate, GetPushTemplate, GetSmsTemplate, or GetVoiceTemplate
  /// operation, depending on the type of template that you want to retrieve the
  /// object for.
  @_s.JsonKey(name: 'DefaultSubstitutions')
  final String defaultSubstitutions;

  /// The custom description of the message template. This value isn't included in
  /// a TemplateResponse object. To retrieve the description of a template, use
  /// the GetEmailTemplate, GetPushTemplate, GetSmsTemplate, or GetVoiceTemplate
  /// operation, depending on the type of template that you want to retrieve the
  /// description for.
  @_s.JsonKey(name: 'TemplateDescription')
  final String templateDescription;

  /// The unique identifier, as an integer, for the active version of the message
  /// template.
  @_s.JsonKey(name: 'Version')
  final String version;

  /// A map of key-value pairs that identifies the tags that are associated with
  /// the message template. This object isn't included in a TemplateResponse
  /// object. To retrieve this object for a template, use the GetEmailTemplate,
  /// GetPushTemplate, GetSmsTemplate, or GetVoiceTemplate operation, depending on
  /// the type of template that you want to retrieve the object for.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  TemplateResponse({
    @_s.required this.creationDate,
    @_s.required this.lastModifiedDate,
    @_s.required this.templateName,
    @_s.required this.templateType,
    this.arn,
    this.defaultSubstitutions,
    this.templateDescription,
    this.version,
    this.tags,
  });
  factory TemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$TemplateResponseFromJson(json);
}

enum TemplateType {
  @_s.JsonValue('EMAIL')
  email,
  @_s.JsonValue('SMS')
  sms,
  @_s.JsonValue('VOICE')
  voice,
  @_s.JsonValue('PUSH')
  push,
}

/// Provides information about a specific version of a message template.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TemplateVersionResponse {
  /// The date, in ISO 8601 format, when the version of the message template was
  /// created.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The date, in ISO 8601 format, when the version of the message template was
  /// last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The name of the message template.
  @_s.JsonKey(name: 'TemplateName')
  final String templateName;

  /// The type of channel that the message template is designed for. Possible
  /// values are: EMAIL, PUSH, SMS, and VOICE.
  @_s.JsonKey(name: 'TemplateType')
  final String templateType;

  /// A JSON object that specifies the default values that are used for message
  /// variables in the version of the message template. This object is a set of
  /// key-value pairs. Each key defines a message variable in the template. The
  /// corresponding value defines the default value for that variable.
  @_s.JsonKey(name: 'DefaultSubstitutions')
  final String defaultSubstitutions;

  /// The custom description of the version of the message template.
  @_s.JsonKey(name: 'TemplateDescription')
  final String templateDescription;

  /// The unique identifier for the version of the message template. This value is
  /// an integer that Amazon Pinpoint automatically increments and assigns to each
  /// new version of a template.
  @_s.JsonKey(name: 'Version')
  final String version;

  TemplateVersionResponse({
    @_s.required this.creationDate,
    @_s.required this.lastModifiedDate,
    @_s.required this.templateName,
    @_s.required this.templateType,
    this.defaultSubstitutions,
    this.templateDescription,
    this.version,
  });
  factory TemplateVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$TemplateVersionResponseFromJson(json);
}

/// Provides information about all the versions of a specific message template.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TemplateVersionsResponse {
  /// An array of responses, one for each version of the message template.
  @_s.JsonKey(name: 'Item')
  final List<TemplateVersionResponse> item;

  /// The message that's returned from the API for the request to retrieve
  /// information about all the versions of the message template.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The unique identifier for the request to retrieve information about all the
  /// versions of the message template.
  @_s.JsonKey(name: 'RequestID')
  final String requestID;

  TemplateVersionsResponse({
    @_s.required this.item,
    this.message,
    this.nextToken,
    this.requestID,
  });
  factory TemplateVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$TemplateVersionsResponseFromJson(json);
}

/// Provides information about all the message templates that are associated
/// with your Amazon Pinpoint account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TemplatesResponse {
  /// An array of responses, one for each message template that's associated with
  /// your Amazon Pinpoint account and meets any filter criteria that you
  /// specified in the request.
  @_s.JsonKey(name: 'Item')
  final List<TemplateResponse> item;

  /// The string to use in a subsequent request to get the next page of results in
  /// a paginated response. This value is null if there are no additional pages.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  TemplatesResponse({
    @_s.required this.item,
    this.nextToken,
  });
  factory TemplatesResponse.fromJson(Map<String, dynamic> json) =>
      _$TemplatesResponseFromJson(json);
}

/// Specifies the settings for a campaign treatment. A <i>treatment</i> is a
/// variation of a campaign that's used for A/B testing of a campaign.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TreatmentResource {
  /// The unique identifier for the treatment.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The allocated percentage of users (segment members) that the treatment is
  /// sent to.
  @_s.JsonKey(name: 'SizePercent')
  final int sizePercent;

  /// The delivery configuration settings for sending the treatment through a
  /// custom channel. This object is required if the MessageConfiguration object
  /// for the treatment specifies a CustomMessage object.
  @_s.JsonKey(name: 'CustomDeliveryConfiguration')
  final CustomDeliveryConfiguration customDeliveryConfiguration;

  /// The message configuration settings for the treatment.
  @_s.JsonKey(name: 'MessageConfiguration')
  final MessageConfiguration messageConfiguration;

  /// The schedule settings for the treatment.
  @_s.JsonKey(name: 'Schedule')
  final Schedule schedule;

  /// The current status of the treatment.
  @_s.JsonKey(name: 'State')
  final CampaignState state;

  /// The message template to use for the treatment.
  @_s.JsonKey(name: 'TemplateConfiguration')
  final TemplateConfiguration templateConfiguration;

  /// The custom description of the treatment.
  @_s.JsonKey(name: 'TreatmentDescription')
  final String treatmentDescription;

  /// The custom name of the treatment.
  @_s.JsonKey(name: 'TreatmentName')
  final String treatmentName;

  TreatmentResource({
    @_s.required this.id,
    @_s.required this.sizePercent,
    this.customDeliveryConfiguration,
    this.messageConfiguration,
    this.schedule,
    this.state,
    this.templateConfiguration,
    this.treatmentDescription,
    this.treatmentName,
  });
  factory TreatmentResource.fromJson(Map<String, dynamic> json) =>
      _$TreatmentResourceFromJson(json);
}

enum Type {
  @_s.JsonValue('ALL')
  all,
  @_s.JsonValue('ANY')
  any,
  @_s.JsonValue('NONE')
  none,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAdmChannelResponse {
  @_s.JsonKey(name: 'ADMChannelResponse')
  final ADMChannelResponse aDMChannelResponse;

  UpdateAdmChannelResponse({
    @_s.required this.aDMChannelResponse,
  });
  factory UpdateAdmChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAdmChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateApnsChannelResponse {
  @_s.JsonKey(name: 'APNSChannelResponse')
  final APNSChannelResponse aPNSChannelResponse;

  UpdateApnsChannelResponse({
    @_s.required this.aPNSChannelResponse,
  });
  factory UpdateApnsChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateApnsChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateApnsSandboxChannelResponse {
  @_s.JsonKey(name: 'APNSSandboxChannelResponse')
  final APNSSandboxChannelResponse aPNSSandboxChannelResponse;

  UpdateApnsSandboxChannelResponse({
    @_s.required this.aPNSSandboxChannelResponse,
  });
  factory UpdateApnsSandboxChannelResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateApnsSandboxChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateApnsVoipChannelResponse {
  @_s.JsonKey(name: 'APNSVoipChannelResponse')
  final APNSVoipChannelResponse aPNSVoipChannelResponse;

  UpdateApnsVoipChannelResponse({
    @_s.required this.aPNSVoipChannelResponse,
  });
  factory UpdateApnsVoipChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateApnsVoipChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateApnsVoipSandboxChannelResponse {
  @_s.JsonKey(name: 'APNSVoipSandboxChannelResponse')
  final APNSVoipSandboxChannelResponse aPNSVoipSandboxChannelResponse;

  UpdateApnsVoipSandboxChannelResponse({
    @_s.required this.aPNSVoipSandboxChannelResponse,
  });
  factory UpdateApnsVoipSandboxChannelResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateApnsVoipSandboxChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateApplicationSettingsResponse {
  @_s.JsonKey(name: 'ApplicationSettingsResource')
  final ApplicationSettingsResource applicationSettingsResource;

  UpdateApplicationSettingsResponse({
    @_s.required this.applicationSettingsResource,
  });
  factory UpdateApplicationSettingsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateApplicationSettingsResponseFromJson(json);
}

/// Specifies one or more attributes to remove from all the endpoints that are
/// associated with an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateAttributesRequest {
  /// An array of the attributes to remove from all the endpoints that are
  /// associated with the application. The array can specify the complete, exact
  /// name of each attribute to remove or it can specify a glob pattern that an
  /// attribute name must match in order for the attribute to be removed.
  @_s.JsonKey(name: 'Blacklist')
  final List<String> blacklist;

  UpdateAttributesRequest({
    this.blacklist,
  });
  Map<String, dynamic> toJson() => _$UpdateAttributesRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateBaiduChannelResponse {
  @_s.JsonKey(name: 'BaiduChannelResponse')
  final BaiduChannelResponse baiduChannelResponse;

  UpdateBaiduChannelResponse({
    @_s.required this.baiduChannelResponse,
  });
  factory UpdateBaiduChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateBaiduChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateCampaignResponse {
  @_s.JsonKey(name: 'CampaignResponse')
  final CampaignResponse campaignResponse;

  UpdateCampaignResponse({
    @_s.required this.campaignResponse,
  });
  factory UpdateCampaignResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateCampaignResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateEmailChannelResponse {
  @_s.JsonKey(name: 'EmailChannelResponse')
  final EmailChannelResponse emailChannelResponse;

  UpdateEmailChannelResponse({
    @_s.required this.emailChannelResponse,
  });
  factory UpdateEmailChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmailChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateEmailTemplateResponse {
  @_s.JsonKey(name: 'MessageBody')
  final MessageBody messageBody;

  UpdateEmailTemplateResponse({
    @_s.required this.messageBody,
  });
  factory UpdateEmailTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmailTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateEndpointResponse {
  @_s.JsonKey(name: 'MessageBody')
  final MessageBody messageBody;

  UpdateEndpointResponse({
    @_s.required this.messageBody,
  });
  factory UpdateEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateEndpointResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateEndpointsBatchResponse {
  @_s.JsonKey(name: 'MessageBody')
  final MessageBody messageBody;

  UpdateEndpointsBatchResponse({
    @_s.required this.messageBody,
  });
  factory UpdateEndpointsBatchResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateEndpointsBatchResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGcmChannelResponse {
  @_s.JsonKey(name: 'GCMChannelResponse')
  final GCMChannelResponse gCMChannelResponse;

  UpdateGcmChannelResponse({
    @_s.required this.gCMChannelResponse,
  });
  factory UpdateGcmChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateGcmChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateJourneyResponse {
  @_s.JsonKey(name: 'JourneyResponse')
  final JourneyResponse journeyResponse;

  UpdateJourneyResponse({
    @_s.required this.journeyResponse,
  });
  factory UpdateJourneyResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateJourneyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateJourneyStateResponse {
  @_s.JsonKey(name: 'JourneyResponse')
  final JourneyResponse journeyResponse;

  UpdateJourneyStateResponse({
    @_s.required this.journeyResponse,
  });
  factory UpdateJourneyStateResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateJourneyStateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePushTemplateResponse {
  @_s.JsonKey(name: 'MessageBody')
  final MessageBody messageBody;

  UpdatePushTemplateResponse({
    @_s.required this.messageBody,
  });
  factory UpdatePushTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePushTemplateResponseFromJson(json);
}

/// Specifies Amazon Pinpoint configuration settings for retrieving and
/// processing recommendation data from a recommender model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateRecommenderConfiguration {
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that authorizes Amazon Pinpoint to retrieve recommendation data
  /// from the recommender model.
  @_s.JsonKey(name: 'RecommendationProviderRoleArn')
  final String recommendationProviderRoleArn;

  /// The Amazon Resource Name (ARN) of the recommender model to retrieve
  /// recommendation data from. This value must match the ARN of an Amazon
  /// Personalize campaign.
  @_s.JsonKey(name: 'RecommendationProviderUri')
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
  @_s.JsonKey(name: 'Attributes')
  final Map<String, String> attributes;

  /// A custom description of the configuration for the recommender model. The
  /// description can contain up to 128 characters. The characters can be letters,
  /// numbers, spaces, or the following symbols: _ ; () , ‐.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A custom name of the configuration for the recommender model. The name must
  /// start with a letter or number and it can contain up to 128 characters. The
  /// characters can be letters, numbers, spaces, underscores (_), or hyphens (-).
  @_s.JsonKey(name: 'Name')
  final String name;

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
  @_s.JsonKey(name: 'RecommendationProviderIdType')
  final String recommendationProviderIdType;

  /// The name or Amazon Resource Name (ARN) of the AWS Lambda function to invoke
  /// for additional processing of recommendation data that's retrieved from the
  /// recommender model.
  @_s.JsonKey(name: 'RecommendationTransformerUri')
  final String recommendationTransformerUri;

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
  @_s.JsonKey(name: 'RecommendationsDisplayName')
  final String recommendationsDisplayName;

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
  @_s.JsonKey(name: 'RecommendationsPerMessage')
  final int recommendationsPerMessage;

  UpdateRecommenderConfiguration({
    @_s.required this.recommendationProviderRoleArn,
    @_s.required this.recommendationProviderUri,
    this.attributes,
    this.description,
    this.name,
    this.recommendationProviderIdType,
    this.recommendationTransformerUri,
    this.recommendationsDisplayName,
    this.recommendationsPerMessage,
  });
  Map<String, dynamic> toJson() => _$UpdateRecommenderConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRecommenderConfigurationResponse {
  @_s.JsonKey(name: 'RecommenderConfigurationResponse')
  final RecommenderConfigurationResponse recommenderConfigurationResponse;

  UpdateRecommenderConfigurationResponse({
    @_s.required this.recommenderConfigurationResponse,
  });
  factory UpdateRecommenderConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateRecommenderConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSegmentResponse {
  @_s.JsonKey(name: 'SegmentResponse')
  final SegmentResponse segmentResponse;

  UpdateSegmentResponse({
    @_s.required this.segmentResponse,
  });
  factory UpdateSegmentResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSegmentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSmsChannelResponse {
  @_s.JsonKey(name: 'SMSChannelResponse')
  final SMSChannelResponse sMSChannelResponse;

  UpdateSmsChannelResponse({
    @_s.required this.sMSChannelResponse,
  });
  factory UpdateSmsChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSmsChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSmsTemplateResponse {
  @_s.JsonKey(name: 'MessageBody')
  final MessageBody messageBody;

  UpdateSmsTemplateResponse({
    @_s.required this.messageBody,
  });
  factory UpdateSmsTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSmsTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTemplateActiveVersionResponse {
  @_s.JsonKey(name: 'MessageBody')
  final MessageBody messageBody;

  UpdateTemplateActiveVersionResponse({
    @_s.required this.messageBody,
  });
  factory UpdateTemplateActiveVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateTemplateActiveVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateVoiceChannelResponse {
  @_s.JsonKey(name: 'VoiceChannelResponse')
  final VoiceChannelResponse voiceChannelResponse;

  UpdateVoiceChannelResponse({
    @_s.required this.voiceChannelResponse,
  });
  factory UpdateVoiceChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateVoiceChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateVoiceTemplateResponse {
  @_s.JsonKey(name: 'MessageBody')
  final MessageBody messageBody;

  UpdateVoiceTemplateResponse({
    @_s.required this.messageBody,
  });
  factory UpdateVoiceTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateVoiceTemplateResponseFromJson(json);
}

/// Specifies the status and settings of the voice channel for an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VoiceChannelRequest {
  /// Specifies whether to enable the voice channel for the application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  VoiceChannelRequest({
    this.enabled,
  });
  Map<String, dynamic> toJson() => _$VoiceChannelRequestToJson(this);
}

/// Provides information about the status and settings of the voice channel for
/// an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VoiceChannelResponse {
  /// The type of messaging or notification platform for the channel. For the
  /// voice channel, this value is VOICE.
  @_s.JsonKey(name: 'Platform')
  final String platform;

  /// The unique identifier for the application that the voice channel applies to.
  @_s.JsonKey(name: 'ApplicationId')
  final String applicationId;

  /// The date and time, in ISO 8601 format, when the voice channel was enabled.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// Specifies whether the voice channel is enabled for the application.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// (Not used) This property is retained only for backward compatibility.
  @_s.JsonKey(name: 'HasCredential')
  final bool hasCredential;

  /// (Deprecated) An identifier for the voice channel. This property is retained
  /// only for backward compatibility.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Specifies whether the voice channel is archived.
  @_s.JsonKey(name: 'IsArchived')
  final bool isArchived;

  /// The user who last modified the voice channel.
  @_s.JsonKey(name: 'LastModifiedBy')
  final String lastModifiedBy;

  /// The date and time, in ISO 8601 format, when the voice channel was last
  /// modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The current version of the voice channel.
  @_s.JsonKey(name: 'Version')
  final int version;

  VoiceChannelResponse({
    @_s.required this.platform,
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
  factory VoiceChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$VoiceChannelResponseFromJson(json);
}

/// Specifies the settings for a one-time voice message that's sent directly to
/// an endpoint through the voice channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VoiceMessage {
  /// The text of the script to use for the voice message.
  @_s.JsonKey(name: 'Body')
  final String body;

  /// The code for the language to use when synthesizing the text of the message
  /// script. For a list of supported languages and the code for each one, see the
  /// <a href="https://docs.aws.amazon.com/polly/latest/dg/what-is.html">Amazon
  /// Polly Developer Guide</a>.
  @_s.JsonKey(name: 'LanguageCode')
  final String languageCode;

  /// The long code to send the voice message from. This value should be one of
  /// the dedicated long codes that's assigned to your AWS account. Although it
  /// isn't required, we recommend that you specify the long code in E.164 format,
  /// for example +12065550100, to ensure prompt and accurate delivery of the
  /// message.
  @_s.JsonKey(name: 'OriginationNumber')
  final String originationNumber;

  /// The default message variables to use in the voice message. You can override
  /// the default variables with individual address variables.
  @_s.JsonKey(name: 'Substitutions')
  final Map<String, List<String>> substitutions;

  /// The name of the voice to use when delivering the message. For a list of
  /// supported voices, see the <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/what-is.html">Amazon Polly
  /// Developer Guide</a>.
  @_s.JsonKey(name: 'VoiceId')
  final String voiceId;

  VoiceMessage({
    this.body,
    this.languageCode,
    this.originationNumber,
    this.substitutions,
    this.voiceId,
  });
  Map<String, dynamic> toJson() => _$VoiceMessageToJson(this);
}

/// Specifies the content and settings for a message template that can be used
/// in messages that are sent through the voice channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VoiceTemplateRequest {
  /// The text of the script to use in messages that are based on the message
  /// template, in plain text format.
  @_s.JsonKey(name: 'Body')
  final String body;

  /// A JSON object that specifies the default values to use for message variables
  /// in the message template. This object is a set of key-value pairs. Each key
  /// defines a message variable in the template. The corresponding value defines
  /// the default value for that variable. When you create a message that's based
  /// on the template, you can override these defaults with message-specific and
  /// address-specific variables and values.
  @_s.JsonKey(name: 'DefaultSubstitutions')
  final String defaultSubstitutions;

  /// The code for the language to use when synthesizing the text of the script in
  /// messages that are based on the message template. For a list of supported
  /// languages and the code for each one, see the <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/what-is.html">Amazon Polly
  /// Developer Guide</a>.
  @_s.JsonKey(name: 'LanguageCode')
  final String languageCode;

  /// A custom description of the message template.
  @_s.JsonKey(name: 'TemplateDescription')
  final String templateDescription;

  /// The name of the voice to use when delivering messages that are based on the
  /// message template. For a list of supported voices, see the <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/what-is.html">Amazon Polly
  /// Developer Guide</a>.
  @_s.JsonKey(name: 'VoiceId')
  final String voiceId;

  /// A string-to-string map of key-value pairs that defines the tags to associate
  /// with the message template. Each tag consists of a required tag key and an
  /// associated tag value.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  VoiceTemplateRequest({
    this.body,
    this.defaultSubstitutions,
    this.languageCode,
    this.templateDescription,
    this.voiceId,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$VoiceTemplateRequestToJson(this);
}

/// Provides information about the content and settings for a message template
/// that can be used in messages that are sent through the voice channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VoiceTemplateResponse {
  /// The date, in ISO 8601 format, when the message template was created.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The date, in ISO 8601 format, when the message template was last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The name of the message template.
  @_s.JsonKey(name: 'TemplateName')
  final String templateName;

  /// The type of channel that the message template is designed for. For a voice
  /// template, this value is VOICE.
  @_s.JsonKey(name: 'TemplateType')
  final TemplateType templateType;

  /// The Amazon Resource Name (ARN) of the message template.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The text of the script that's used in messages that are based on the message
  /// template, in plain text format.
  @_s.JsonKey(name: 'Body')
  final String body;

  /// The JSON object that specifies the default values that are used for message
  /// variables in the message template. This object is a set of key-value pairs.
  /// Each key defines a message variable in the template. The corresponding value
  /// defines the default value for that variable.
  @_s.JsonKey(name: 'DefaultSubstitutions')
  final String defaultSubstitutions;

  /// The code for the language that's used when synthesizing the text of the
  /// script in messages that are based on the message template. For a list of
  /// supported languages and the code for each one, see the <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/what-is.html">Amazon Polly
  /// Developer Guide</a>.
  @_s.JsonKey(name: 'LanguageCode')
  final String languageCode;

  /// The custom description of the message template.
  @_s.JsonKey(name: 'TemplateDescription')
  final String templateDescription;

  /// The unique identifier, as an integer, for the active version of the message
  /// template, or the version of the template that you specified by using the
  /// version parameter in your request.
  @_s.JsonKey(name: 'Version')
  final String version;

  /// The name of the voice that's used when delivering messages that are based on
  /// the message template. For a list of supported voices, see the <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/what-is.html">Amazon Polly
  /// Developer Guide</a>.
  @_s.JsonKey(name: 'VoiceId')
  final String voiceId;

  /// A string-to-string map of key-value pairs that identifies the tags that are
  /// associated with the message template. Each tag consists of a required tag
  /// key and an associated tag value.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  VoiceTemplateResponse({
    @_s.required this.creationDate,
    @_s.required this.lastModifiedDate,
    @_s.required this.templateName,
    @_s.required this.templateType,
    this.arn,
    this.body,
    this.defaultSubstitutions,
    this.languageCode,
    this.templateDescription,
    this.version,
    this.voiceId,
    this.tags,
  });
  factory VoiceTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$VoiceTemplateResponseFromJson(json);
}

/// Specifies the settings for a wait activity in a journey. This type of
/// activity waits for a certain amount of time or until a specific date and
/// time before moving participants to the next activity in a journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WaitActivity {
  /// The unique identifier for the next activity to perform, after performing the
  /// wait activity.
  @_s.JsonKey(name: 'NextActivity')
  final String nextActivity;

  /// The amount of time to wait or the date and time when the activity moves
  /// participants to the next activity in the journey.
  @_s.JsonKey(name: 'WaitTime')
  final WaitTime waitTime;

  WaitActivity({
    this.nextActivity,
    this.waitTime,
  });
  factory WaitActivity.fromJson(Map<String, dynamic> json) =>
      _$WaitActivityFromJson(json);

  Map<String, dynamic> toJson() => _$WaitActivityToJson(this);
}

/// Specifies a duration or a date and time that indicates when Amazon Pinpoint
/// determines whether an activity's conditions have been met or an activity
/// moves participants to the next activity in a journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WaitTime {
  /// The amount of time to wait, as a duration in ISO 8601 format, before
  /// determining whether the activity's conditions have been met or moving
  /// participants to the next activity in the journey.
  @_s.JsonKey(name: 'WaitFor')
  final String waitFor;

  /// The date and time, in ISO 8601 format, when Amazon Pinpoint determines
  /// whether the activity's conditions have been met or the activity moves
  /// participants to the next activity in the journey.
  @_s.JsonKey(name: 'WaitUntil')
  final String waitUntil;

  WaitTime({
    this.waitFor,
    this.waitUntil,
  });
  factory WaitTime.fromJson(Map<String, dynamic> json) =>
      _$WaitTimeFromJson(json);

  Map<String, dynamic> toJson() => _$WaitTimeToJson(this);
}

/// Specifies the default settings for an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class WriteApplicationSettingsRequest {
  /// The settings for the AWS Lambda function to invoke by default as a code hook
  /// for campaigns in the application. You can use this hook to customize
  /// segments that are used by campaigns in the application.
  ///
  /// To override these settings and define custom settings for a specific
  /// campaign, use the CampaignHook object of the <link
  /// linkend="apps-application-id-campaigns-campaign-id">Campaign</link>
  /// resource.
  @_s.JsonKey(name: 'CampaignHook')
  final CampaignHook campaignHook;

  /// Specifies whether to enable application-related alarms in Amazon CloudWatch.
  @_s.JsonKey(name: 'CloudWatchMetricsEnabled')
  final bool cloudWatchMetricsEnabled;
  @_s.JsonKey(name: 'EventTaggingEnabled')
  final bool eventTaggingEnabled;

  /// The default sending limits for campaigns in the application. To override
  /// these limits and define custom limits for a specific campaign or journey,
  /// use the <link
  /// linkend="apps-application-id-campaigns-campaign-id">Campaign</link> resource
  /// or the <link
  /// linkend="apps-application-id-journeys-journey-id">Journey</link> resource,
  /// respectively.
  @_s.JsonKey(name: 'Limits')
  final CampaignLimits limits;

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
  @_s.JsonKey(name: 'QuietTime')
  final QuietTime quietTime;

  WriteApplicationSettingsRequest({
    this.campaignHook,
    this.cloudWatchMetricsEnabled,
    this.eventTaggingEnabled,
    this.limits,
    this.quietTime,
  });
  Map<String, dynamic> toJson() =>
      _$WriteApplicationSettingsRequestToJson(this);
}

/// Specifies the configuration and other settings for a campaign.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class WriteCampaignRequest {
  /// An array of requests that defines additional treatments for the campaign, in
  /// addition to the default treatment for the campaign.
  @_s.JsonKey(name: 'AdditionalTreatments')
  final List<WriteTreatmentResource> additionalTreatments;

  /// The delivery configuration settings for sending the campaign through a
  /// custom channel. This object is required if the MessageConfiguration object
  /// for the campaign specifies a CustomMessage object.
  @_s.JsonKey(name: 'CustomDeliveryConfiguration')
  final CustomDeliveryConfiguration customDeliveryConfiguration;

  /// A custom description of the campaign.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The allocated percentage of users (segment members) who shouldn't receive
  /// messages from the campaign.
  @_s.JsonKey(name: 'HoldoutPercent')
  final int holdoutPercent;

  /// The settings for the AWS Lambda function to invoke as a code hook for the
  /// campaign. You can use this hook to customize the segment that's used by the
  /// campaign.
  @_s.JsonKey(name: 'Hook')
  final CampaignHook hook;

  /// Specifies whether to pause the campaign. A paused campaign doesn't run
  /// unless you resume it by changing this value to false.
  @_s.JsonKey(name: 'IsPaused')
  final bool isPaused;

  /// The messaging limits for the campaign.
  @_s.JsonKey(name: 'Limits')
  final CampaignLimits limits;

  /// The message configuration settings for the campaign.
  @_s.JsonKey(name: 'MessageConfiguration')
  final MessageConfiguration messageConfiguration;

  /// A custom name for the campaign.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The schedule settings for the campaign.
  @_s.JsonKey(name: 'Schedule')
  final Schedule schedule;

  /// The unique identifier for the segment to associate with the campaign.
  @_s.JsonKey(name: 'SegmentId')
  final String segmentId;

  /// The version of the segment to associate with the campaign.
  @_s.JsonKey(name: 'SegmentVersion')
  final int segmentVersion;

  /// The message template to use for the campaign.
  @_s.JsonKey(name: 'TemplateConfiguration')
  final TemplateConfiguration templateConfiguration;

  /// A custom description of the default treatment for the campaign.
  @_s.JsonKey(name: 'TreatmentDescription')
  final String treatmentDescription;

  /// A custom name of the default treatment for the campaign, if the campaign has
  /// multiple treatments. A <i>treatment</i> is a variation of a campaign that's
  /// used for A/B testing.
  @_s.JsonKey(name: 'TreatmentName')
  final String treatmentName;

  /// A string-to-string map of key-value pairs that defines the tags to associate
  /// with the campaign. Each tag consists of a required tag key and an associated
  /// tag value.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
    this.schedule,
    this.segmentId,
    this.segmentVersion,
    this.templateConfiguration,
    this.treatmentDescription,
    this.treatmentName,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$WriteCampaignRequestToJson(this);
}

/// Specifies the Amazon Resource Name (ARN) of an event stream to publish
/// events to and the AWS Identity and Access Management (IAM) role to use when
/// publishing those events.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @_s.JsonKey(name: 'DestinationStreamArn')
  final String destinationStreamArn;

  /// The AWS Identity and Access Management (IAM) role that authorizes Amazon
  /// Pinpoint to publish event data to the stream in your AWS account.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  WriteEventStream({
    @_s.required this.destinationStreamArn,
    @_s.required this.roleArn,
  });
  Map<String, dynamic> toJson() => _$WriteEventStreamToJson(this);
}

/// Specifies the configuration and other settings for a journey.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class WriteJourneyRequest {
  /// The name of the journey. A journey name can contain a maximum of 150
  /// characters. The characters can be alphanumeric characters or symbols, such
  /// as underscores (_) or hyphens (-). A journey name can't contain any spaces.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A map that contains a set of Activity objects, one object for each activity
  /// in the journey. For each Activity object, the key is the unique identifier
  /// (string) for an activity and the value is the settings for the activity. An
  /// activity identifier can contain a maximum of 100 characters. The characters
  /// must be alphanumeric characters.
  @_s.JsonKey(name: 'Activities')
  final Map<String, Activity> activities;

  /// The date, in ISO 8601 format, when the journey was created.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The date, in ISO 8601 format, when the journey was last modified.
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The messaging and entry limits for the journey.
  @_s.JsonKey(name: 'Limits')
  final JourneyLimits limits;

  /// Specifies whether the journey's scheduled start and end times use each
  /// participant's local time. To base the schedule on each participant's local
  /// time, set this value to true.
  @_s.JsonKey(name: 'LocalTime')
  final bool localTime;

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
  @_s.JsonKey(name: 'QuietTime')
  final QuietTime quietTime;

  /// The frequency with which Amazon Pinpoint evaluates segment and event data
  /// for the journey, as a duration in ISO 8601 format.
  @_s.JsonKey(name: 'RefreshFrequency')
  final String refreshFrequency;

  /// The schedule settings for the journey.
  @_s.JsonKey(name: 'Schedule')
  final JourneySchedule schedule;

  /// The unique identifier for the first activity in the journey. The identifier
  /// for this activity can contain a maximum of 128 characters. The characters
  /// must be alphanumeric characters.
  @_s.JsonKey(name: 'StartActivity')
  final String startActivity;

  /// The segment that defines which users are participants in the journey.
  @_s.JsonKey(name: 'StartCondition')
  final StartCondition startCondition;

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
  /// The CANCELLED, COMPLETED, and CLOSED values are not supported in requests to
  /// create or update a journey. To cancel a journey, use the <link
  /// linkend="apps-application-id-journeys-journey-id-state">Journey State</link>
  /// resource.
  @_s.JsonKey(name: 'State')
  final State state;

  WriteJourneyRequest({
    @_s.required this.name,
    this.activities,
    this.creationDate,
    this.lastModifiedDate,
    this.limits,
    this.localTime,
    this.quietTime,
    this.refreshFrequency,
    this.schedule,
    this.startActivity,
    this.startCondition,
    this.state,
  });
  Map<String, dynamic> toJson() => _$WriteJourneyRequestToJson(this);
}

/// Specifies the configuration, dimension, and other settings for a segment. A
/// WriteSegmentRequest object can include a Dimensions object or a
/// SegmentGroups object, but not both.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class WriteSegmentRequest {
  /// The criteria that define the dimensions for the segment.
  @_s.JsonKey(name: 'Dimensions')
  final SegmentDimensions dimensions;

  /// The name of the segment.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The segment group to use and the dimensions to apply to the group's base
  /// segments in order to build the segment. A segment group can consist of zero
  /// or more base segments. Your request can include only one segment group.
  @_s.JsonKey(name: 'SegmentGroups')
  final SegmentGroupList segmentGroups;

  /// A string-to-string map of key-value pairs that defines the tags to associate
  /// with the segment. Each tag consists of a required tag key and an associated
  /// tag value.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  WriteSegmentRequest({
    this.dimensions,
    this.name,
    this.segmentGroups,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$WriteSegmentRequestToJson(this);
}

/// Specifies the settings for a campaign treatment. A <i>treatment</i> is a
/// variation of a campaign that's used for A/B testing of a campaign.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class WriteTreatmentResource {
  /// The allocated percentage of users (segment members) to send the treatment
  /// to.
  @_s.JsonKey(name: 'SizePercent')
  final int sizePercent;

  /// The delivery configuration settings for sending the treatment through a
  /// custom channel. This object is required if the MessageConfiguration object
  /// for the treatment specifies a CustomMessage object.
  @_s.JsonKey(name: 'CustomDeliveryConfiguration')
  final CustomDeliveryConfiguration customDeliveryConfiguration;

  /// The message configuration settings for the treatment.
  @_s.JsonKey(name: 'MessageConfiguration')
  final MessageConfiguration messageConfiguration;

  /// The schedule settings for the treatment.
  @_s.JsonKey(name: 'Schedule')
  final Schedule schedule;

  /// The message template to use for the treatment.
  @_s.JsonKey(name: 'TemplateConfiguration')
  final TemplateConfiguration templateConfiguration;

  /// A custom description of the treatment.
  @_s.JsonKey(name: 'TreatmentDescription')
  final String treatmentDescription;

  /// A custom name for the treatment.
  @_s.JsonKey(name: 'TreatmentName')
  final String treatmentName;

  WriteTreatmentResource({
    @_s.required this.sizePercent,
    this.customDeliveryConfiguration,
    this.messageConfiguration,
    this.schedule,
    this.templateConfiguration,
    this.treatmentDescription,
    this.treatmentName,
  });
  Map<String, dynamic> toJson() => _$WriteTreatmentResourceToJson(this);
}

enum EndpointTypesElement {
  @_s.JsonValue('PUSH')
  push,
  @_s.JsonValue('GCM')
  gcm,
  @_s.JsonValue('APNS')
  apns,
  @_s.JsonValue('APNS_SANDBOX')
  apnsSandbox,
  @_s.JsonValue('APNS_VOIP')
  apnsVoip,
  @_s.JsonValue('APNS_VOIP_SANDBOX')
  apnsVoipSandbox,
  @_s.JsonValue('ADM')
  adm,
  @_s.JsonValue('SMS')
  sms,
  @_s.JsonValue('VOICE')
  voice,
  @_s.JsonValue('EMAIL')
  email,
  @_s.JsonValue('BAIDU')
  baidu,
  @_s.JsonValue('CUSTOM')
  custom,
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String type, String message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String type, String message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class MethodNotAllowedException extends _s.GenericAwsException {
  MethodNotAllowedException({String type, String message})
      : super(type: type, code: 'MethodNotAllowedException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class PayloadTooLargeException extends _s.GenericAwsException {
  PayloadTooLargeException({String type, String message})
      : super(type: type, code: 'PayloadTooLargeException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
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

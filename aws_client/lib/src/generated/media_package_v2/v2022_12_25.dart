// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2022_12_25.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// <note>
/// This guide is intended for creating AWS Elemental MediaPackage resources in
/// MediaPackage Version 2 (v2) starting from May 2023. To get started with
/// MediaPackage v2, create your MediaPackage resources. There isn't an
/// automated process to migrate your resources from MediaPackage v1 to
/// MediaPackage v2.
///
/// The names of the entities that you use to access this API, like URLs and
/// ARNs, all have the versioning information added, like "v2", to distinguish
/// from the prior version. If you used MediaPackage prior to this release, you
/// can't use the MediaPackage v2 CLI or the MediaPackage v2 API to access any
/// MediaPackage v1 resources.
///
/// If you created resources in MediaPackage v1, use video on demand (VOD)
/// workflows, and aren't looking to migrate to MediaPackage v2 yet, see the <a
/// href="https://docs.aws.amazon.com/mediapackage/latest/apireference/what-is.html">MediaPackage
/// v1 Live API Reference</a>.
/// </note>
/// This is the AWS Elemental MediaPackage v2 Live REST API Reference. It
/// describes all the MediaPackage API operations for live content in detail,
/// and provides sample requests, responses, and errors for the supported web
/// services protocols.
///
/// We assume that you have the IAM permissions that you need to use
/// MediaPackage via the REST API. We also assume that you are familiar with the
/// features and operations of MediaPackage, as described in the AWS Elemental
/// MediaPackage User Guide.
class MediaPackageV2 {
  final _s.RestJsonProtocol _protocol;
  factory MediaPackageV2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'mediapackagev2',
    );
    return MediaPackageV2._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  MediaPackageV2._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Lists the tags assigned to a resource.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the CloudWatch resource that you want to view tags for.
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

  /// Assigns one of more tags (key-value pairs) to the specified MediaPackage
  /// resource.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions, by granting a user permission to access or
  /// change only resources with certain tag values. You can use the TagResource
  /// operation with a resource that already has tags. If you specify a new tag
  /// key for the resource, this tag is appended to the list of tags associated
  /// with the resource. If you specify a tag key that is already associated
  /// with the resource, the new tag value that you specify replaces the
  /// previous value for that tag.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the MediaPackage resource that you're adding tags to.
  ///
  /// Parameter [tags] :
  /// Contains a map of the key-value pairs for the resource tag or tags
  /// assigned to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from the specified resource.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the MediaPackage resource that you're removing tags from.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the resource.
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
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Create a channel group to group your channels and origin endpoints. A
  /// channel group is the top-level resource that consists of channels and
  /// origin endpoints that are associated with it and that provides predictable
  /// URLs for stream delivery. All channels and origin endpoints within the
  /// channel group are guaranteed to share the DNS. You can create only one
  /// channel group with each request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region. You can't use spaces in the name. You can't change the
  /// name after you create the channel group.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive token that you provide to ensure the idempotency
  /// of the request.
  ///
  /// Parameter [description] :
  /// Enter any descriptive text that helps you to identify the channel group.
  ///
  /// Parameter [tags] :
  /// A comma-separated list of tag key:value pairs that you define. For
  /// example:
  ///
  /// <code>"Key1": "Value1",</code>
  ///
  /// <code>"Key2": "Value2"</code>
  Future<CreateChannelGroupResponse> createChannelGroup({
    required String channelGroupName,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'x-amzn-client-token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'ChannelGroupName': channelGroupName,
      if (description != null) 'Description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/channelGroup',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateChannelGroupResponse.fromJson(response);
  }

  /// Retrieves the specified channel group that's configured in AWS Elemental
  /// MediaPackage.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  Future<GetChannelGroupResponse> getChannelGroup({
    required String channelGroupName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channelGroup/${Uri.encodeComponent(channelGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetChannelGroupResponse.fromJson(response);
  }

  /// Update the specified channel group. You can edit the description on a
  /// channel group for easier identification later from the AWS Elemental
  /// MediaPackage console. You can't edit the name of the channel group.
  ///
  /// Any edits you make that impact the video output may not be reflected for a
  /// few minutes.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [description] :
  /// Any descriptive information that you want to add to the channel group for
  /// future identification purposes.
  ///
  /// Parameter [eTag] :
  /// The expected current Entity Tag (ETag) for the resource. If the specified
  /// ETag does not match the resource's current entity tag, the update request
  /// will be rejected.
  Future<UpdateChannelGroupResponse> updateChannelGroup({
    required String channelGroupName,
    String? description,
    String? eTag,
  }) async {
    final headers = <String, String>{
      if (eTag != null) 'x-amzn-update-if-match': eTag.toString(),
    };
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/channelGroup/${Uri.encodeComponent(channelGroupName)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateChannelGroupResponse.fromJson(response);
  }

  /// Delete a channel group. You must delete the channel group's channels and
  /// origin endpoints before you can delete the channel group. If you delete a
  /// channel group, you'll lose access to the egress domain and will have to
  /// create a new channel group to replace it.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  Future<void> deleteChannelGroup({
    required String channelGroupName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/channelGroup/${Uri.encodeComponent(channelGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves all channel groups that are configured in Elemental
  /// MediaPackage.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the GET list request. Use the token to fetch the
  /// next page of results.
  Future<ListChannelGroupsResponse> listChannelGroups({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channelGroup',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelGroupsResponse.fromJson(response);
  }

  /// Create a channel to start receiving content streams. The channel
  /// represents the input to MediaPackage for incoming live content from an
  /// encoder such as AWS Elemental MediaLive. The channel receives content, and
  /// after packaging it, outputs it through an origin endpoint to downstream
  /// devices (such as video players or CDNs) that request the content. You can
  /// create only one channel with each request. We recommend that you spread
  /// out channels between channel groups, such as putting redundant channels in
  /// the same AWS Region in different channel groups.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group. You can't change the name after you create the channel.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive token that you provide to ensure the idempotency
  /// of the request.
  ///
  /// Parameter [description] :
  /// Enter any descriptive text that helps you to identify the channel.
  ///
  /// Parameter [inputSwitchConfiguration] :
  /// The configuration for input switching based on the media quality
  /// confidence score (MQCS) as provided from AWS Elemental MediaLive. This
  /// setting is valid only when <code>InputType</code> is <code>CMAF</code>.
  ///
  /// Parameter [inputType] :
  /// The input type will be an immutable field which will be used to define
  /// whether the channel will allow CMAF ingest or HLS ingest. If unprovided,
  /// it will default to HLS to preserve current behavior.
  ///
  /// The allowed values are:
  ///
  /// <ul>
  /// <li>
  /// <code>HLS</code> - The HLS streaming specification (which defines M3U8
  /// manifests and TS segments).
  /// </li>
  /// <li>
  /// <code>CMAF</code> - The DASH-IF CMAF Ingest specification (which defines
  /// CMAF segments with optional DASH manifests).
  /// </li>
  /// </ul>
  ///
  /// Parameter [outputHeaderConfiguration] :
  /// The settings for what common media server data (CMSD) headers AWS
  /// Elemental MediaPackage includes in responses to the CDN. This setting is
  /// valid only when <code>InputType</code> is <code>CMAF</code>.
  ///
  /// Parameter [tags] :
  /// A comma-separated list of tag key:value pairs that you define. For
  /// example:
  ///
  /// <code>"Key1": "Value1",</code>
  ///
  /// <code>"Key2": "Value2"</code>
  Future<CreateChannelResponse> createChannel({
    required String channelGroupName,
    required String channelName,
    String? clientToken,
    String? description,
    InputSwitchConfiguration? inputSwitchConfiguration,
    InputType? inputType,
    OutputHeaderConfiguration? outputHeaderConfiguration,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'x-amzn-client-token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'ChannelName': channelName,
      if (description != null) 'Description': description,
      if (inputSwitchConfiguration != null)
        'InputSwitchConfiguration': inputSwitchConfiguration,
      if (inputType != null) 'InputType': inputType.value,
      if (outputHeaderConfiguration != null)
        'OutputHeaderConfiguration': outputHeaderConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateChannelResponse.fromJson(response);
  }

  /// Retrieves the specified channel that's configured in AWS Elemental
  /// MediaPackage.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  Future<GetChannelResponse> getChannel({
    required String channelGroupName,
    required String channelName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel/${Uri.encodeComponent(channelName)}/',
      exceptionFnMap: _exceptionFns,
    );
    return GetChannelResponse.fromJson(response);
  }

  /// Update the specified channel. You can edit if MediaPackage sends ingest or
  /// egress access logs to the CloudWatch log group, if content will be
  /// encrypted, the description on a channel, and your channel's policy
  /// settings. You can't edit the name of the channel or CloudFront
  /// distribution details.
  ///
  /// Any edits you make that impact the video output may not be reflected for a
  /// few minutes.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  ///
  /// Parameter [description] :
  /// Any descriptive information that you want to add to the channel for future
  /// identification purposes.
  ///
  /// Parameter [eTag] :
  /// The expected current Entity Tag (ETag) for the resource. If the specified
  /// ETag does not match the resource's current entity tag, the update request
  /// will be rejected.
  ///
  /// Parameter [inputSwitchConfiguration] :
  /// The configuration for input switching based on the media quality
  /// confidence score (MQCS) as provided from AWS Elemental MediaLive. This
  /// setting is valid only when <code>InputType</code> is <code>CMAF</code>.
  ///
  /// Parameter [outputHeaderConfiguration] :
  /// The settings for what common media server data (CMSD) headers AWS
  /// Elemental MediaPackage includes in responses to the CDN. This setting is
  /// valid only when <code>InputType</code> is <code>CMAF</code>.
  Future<UpdateChannelResponse> updateChannel({
    required String channelGroupName,
    required String channelName,
    String? description,
    String? eTag,
    InputSwitchConfiguration? inputSwitchConfiguration,
    OutputHeaderConfiguration? outputHeaderConfiguration,
  }) async {
    final headers = <String, String>{
      if (eTag != null) 'x-amzn-update-if-match': eTag.toString(),
    };
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (inputSwitchConfiguration != null)
        'InputSwitchConfiguration': inputSwitchConfiguration,
      if (outputHeaderConfiguration != null)
        'OutputHeaderConfiguration': outputHeaderConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel/${Uri.encodeComponent(channelName)}/',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateChannelResponse.fromJson(response);
  }

  /// Delete a channel to stop AWS Elemental MediaPackage from receiving further
  /// content. You must delete the channel's origin endpoints before you can
  /// delete the channel.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  Future<void> deleteChannel({
    required String channelGroupName,
    required String channelName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel/${Uri.encodeComponent(channelName)}/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves all channels in a specific channel group that are configured in
  /// AWS Elemental MediaPackage.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the GET list request. Use the token to fetch the
  /// next page of results.
  Future<ListChannelsResponse> listChannels({
    required String channelGroupName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelsResponse.fromJson(response);
  }

  /// Resetting the channel can help to clear errors from misconfigurations in
  /// the encoder. A reset refreshes the ingest stream and removes previous
  /// content.
  ///
  /// Be sure to stop the encoder before you reset the channel, and wait at
  /// least 30 seconds before you restart the encoder.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name of the channel group that contains the channel that you are
  /// resetting.
  ///
  /// Parameter [channelName] :
  /// The name of the channel that you are resetting.
  Future<ResetChannelStateResponse> resetChannelState({
    required String channelGroupName,
    required String channelName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel/${Uri.encodeComponent(channelName)}/reset',
      exceptionFnMap: _exceptionFns,
    );
    return ResetChannelStateResponse.fromJson(response);
  }

  /// Attaches an IAM policy to the specified channel. With policies, you can
  /// specify who has access to AWS resources and what actions they can perform
  /// on those resources. You can attach only one policy with each request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  ///
  /// Parameter [policy] :
  /// The policy to attach to the specified channel.
  Future<void> putChannelPolicy({
    required String channelGroupName,
    required String channelName,
    required String policy,
  }) async {
    final $payload = <String, dynamic>{
      'Policy': policy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel/${Uri.encodeComponent(channelName)}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the specified channel policy that's configured in AWS Elemental
  /// MediaPackage. With policies, you can specify who has access to AWS
  /// resources and what actions they can perform on those resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  Future<GetChannelPolicyResponse> getChannelPolicy({
    required String channelGroupName,
    required String channelName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel/${Uri.encodeComponent(channelName)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetChannelPolicyResponse.fromJson(response);
  }

  /// Delete a channel policy.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  Future<void> deleteChannelPolicy({
    required String channelGroupName,
    required String channelName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel/${Uri.encodeComponent(channelName)}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The endpoint is attached to a channel, and represents the output of the
  /// live content. You can associate multiple endpoints to a single channel.
  /// Each endpoint gives players and downstream CDNs (such as Amazon
  /// CloudFront) access to the content for playback. Content can't be served
  /// from a channel until it has an endpoint. You can create only one endpoint
  /// with each request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  ///
  /// Parameter [containerType] :
  /// The type of container to attach to this origin endpoint. A container type
  /// is a file format that encapsulates one or more media streams, such as
  /// audio and video, into a single file. You can't change the container type
  /// after you create the endpoint.
  ///
  /// Parameter [originEndpointName] :
  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and must be unique for your account in
  /// the AWS Region and channel. You can't use spaces in the name. You can't
  /// change the name after you create the endpoint.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive token that you provide to ensure the idempotency
  /// of the request.
  ///
  /// Parameter [dashManifests] :
  /// A DASH manifest configuration.
  ///
  /// Parameter [description] :
  /// Enter any descriptive text that helps you to identify the origin endpoint.
  ///
  /// Parameter [forceEndpointErrorConfiguration] :
  /// The failover settings for the endpoint.
  ///
  /// Parameter [hlsManifests] :
  /// An HTTP live streaming (HLS) manifest configuration.
  ///
  /// Parameter [lowLatencyHlsManifests] :
  /// A low-latency HLS manifest configuration.
  ///
  /// Parameter [mssManifests] :
  /// A list of Microsoft Smooth Streaming (MSS) manifest configurations for the
  /// origin endpoint. You can configure multiple MSS manifests to provide
  /// different streaming experiences or to support different client
  /// requirements.
  ///
  /// Parameter [segment] :
  /// The segment configuration, including the segment name, duration, and other
  /// configuration values.
  ///
  /// Parameter [startoverWindowSeconds] :
  /// The size of the window (in seconds) to create a window of the live stream
  /// that's available for on-demand viewing. Viewers can start-over or catch-up
  /// on content that falls within the window. The maximum startover window is
  /// 1,209,600 seconds (14 days).
  ///
  /// Parameter [tags] :
  /// A comma-separated list of tag key:value pairs that you define. For
  /// example:
  ///
  /// <code>"Key1": "Value1",</code>
  ///
  /// <code>"Key2": "Value2"</code>
  ///
  /// Parameter [uriSeparator] :
  /// The separator character to use in generated URIs for this origin endpoint.
  /// This setting applies to all manifest types on the endpoint. If you don't
  /// specify a value, the default is <code>UNDERSCORE</code>.
  Future<CreateOriginEndpointResponse> createOriginEndpoint({
    required String channelGroupName,
    required String channelName,
    required ContainerType containerType,
    required String originEndpointName,
    String? clientToken,
    List<CreateDashManifestConfiguration>? dashManifests,
    String? description,
    ForceEndpointErrorConfiguration? forceEndpointErrorConfiguration,
    List<CreateHlsManifestConfiguration>? hlsManifests,
    List<CreateLowLatencyHlsManifestConfiguration>? lowLatencyHlsManifests,
    List<CreateMssManifestConfiguration>? mssManifests,
    Segment? segment,
    int? startoverWindowSeconds,
    Map<String, String>? tags,
    UriSeparator? uriSeparator,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'x-amzn-client-token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'ContainerType': containerType.value,
      'OriginEndpointName': originEndpointName,
      if (dashManifests != null) 'DashManifests': dashManifests,
      if (description != null) 'Description': description,
      if (forceEndpointErrorConfiguration != null)
        'ForceEndpointErrorConfiguration': forceEndpointErrorConfiguration,
      if (hlsManifests != null) 'HlsManifests': hlsManifests,
      if (lowLatencyHlsManifests != null)
        'LowLatencyHlsManifests': lowLatencyHlsManifests,
      if (mssManifests != null) 'MssManifests': mssManifests,
      if (segment != null) 'Segment': segment,
      if (startoverWindowSeconds != null)
        'StartoverWindowSeconds': startoverWindowSeconds,
      if (tags != null) 'Tags': tags,
      if (uriSeparator != null) 'UriSeparator': uriSeparator.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel/${Uri.encodeComponent(channelName)}/originEndpoint',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateOriginEndpointResponse.fromJson(response);
  }

  /// Retrieves the specified origin endpoint that's configured in AWS Elemental
  /// MediaPackage to obtain its playback URL and to view the packaging settings
  /// that it's currently using.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  ///
  /// Parameter [originEndpointName] :
  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your
  /// account in the AWS Region and channel.
  Future<GetOriginEndpointResponse> getOriginEndpoint({
    required String channelGroupName,
    required String channelName,
    required String originEndpointName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel/${Uri.encodeComponent(channelName)}/originEndpoint/${Uri.encodeComponent(originEndpointName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetOriginEndpointResponse.fromJson(response);
  }

  /// Update the specified origin endpoint. Edit the packaging preferences on an
  /// endpoint to optimize the viewing experience. You can't edit the name of
  /// the endpoint.
  ///
  /// Any edits you make that impact the video output may not be reflected for a
  /// few minutes.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  ///
  /// Parameter [containerType] :
  /// The type of container attached to this origin endpoint. A container type
  /// is a file format that encapsulates one or more media streams, such as
  /// audio and video, into a single file.
  ///
  /// Parameter [originEndpointName] :
  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your
  /// account in the AWS Region and channel.
  ///
  /// Parameter [dashManifests] :
  /// A DASH manifest configuration.
  ///
  /// Parameter [description] :
  /// Any descriptive information that you want to add to the origin endpoint
  /// for future identification purposes.
  ///
  /// Parameter [eTag] :
  /// The expected current Entity Tag (ETag) for the resource. If the specified
  /// ETag does not match the resource's current entity tag, the update request
  /// will be rejected.
  ///
  /// Parameter [forceEndpointErrorConfiguration] :
  /// The failover settings for the endpoint.
  ///
  /// Parameter [hlsManifests] :
  /// An HTTP live streaming (HLS) manifest configuration.
  ///
  /// Parameter [lowLatencyHlsManifests] :
  /// A low-latency HLS manifest configuration.
  ///
  /// Parameter [mssManifests] :
  /// A list of Microsoft Smooth Streaming (MSS) manifest configurations to
  /// update for the origin endpoint. This replaces the existing MSS manifest
  /// configurations.
  ///
  /// Parameter [segment] :
  /// The segment configuration, including the segment name, duration, and other
  /// configuration values.
  ///
  /// Parameter [startoverWindowSeconds] :
  /// The size of the window (in seconds) to create a window of the live stream
  /// that's available for on-demand viewing. Viewers can start-over or catch-up
  /// on content that falls within the window. The maximum startover window is
  /// 1,209,600 seconds (14 days).
  ///
  /// Parameter [uriSeparator] :
  /// The separator character to use in generated URIs for this origin endpoint.
  /// This setting applies to all manifest types on the endpoint. If you don't
  /// specify a value in the update request, the current value is preserved.
  Future<UpdateOriginEndpointResponse> updateOriginEndpoint({
    required String channelGroupName,
    required String channelName,
    required ContainerType containerType,
    required String originEndpointName,
    List<CreateDashManifestConfiguration>? dashManifests,
    String? description,
    String? eTag,
    ForceEndpointErrorConfiguration? forceEndpointErrorConfiguration,
    List<CreateHlsManifestConfiguration>? hlsManifests,
    List<CreateLowLatencyHlsManifestConfiguration>? lowLatencyHlsManifests,
    List<CreateMssManifestConfiguration>? mssManifests,
    Segment? segment,
    int? startoverWindowSeconds,
    UriSeparator? uriSeparator,
  }) async {
    final headers = <String, String>{
      if (eTag != null) 'x-amzn-update-if-match': eTag.toString(),
    };
    final $payload = <String, dynamic>{
      'ContainerType': containerType.value,
      if (dashManifests != null) 'DashManifests': dashManifests,
      if (description != null) 'Description': description,
      if (forceEndpointErrorConfiguration != null)
        'ForceEndpointErrorConfiguration': forceEndpointErrorConfiguration,
      if (hlsManifests != null) 'HlsManifests': hlsManifests,
      if (lowLatencyHlsManifests != null)
        'LowLatencyHlsManifests': lowLatencyHlsManifests,
      if (mssManifests != null) 'MssManifests': mssManifests,
      if (segment != null) 'Segment': segment,
      if (startoverWindowSeconds != null)
        'StartoverWindowSeconds': startoverWindowSeconds,
      if (uriSeparator != null) 'UriSeparator': uriSeparator.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel/${Uri.encodeComponent(channelName)}/originEndpoint/${Uri.encodeComponent(originEndpointName)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateOriginEndpointResponse.fromJson(response);
  }

  /// Origin endpoints can serve content until they're deleted. Delete the
  /// endpoint if it should no longer respond to playback requests. You must
  /// delete all endpoints from a channel before you can delete the channel.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  ///
  /// Parameter [originEndpointName] :
  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your
  /// account in the AWS Region and channel.
  Future<void> deleteOriginEndpoint({
    required String channelGroupName,
    required String channelName,
    required String originEndpointName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel/${Uri.encodeComponent(channelName)}/originEndpoint/${Uri.encodeComponent(originEndpointName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves all origin endpoints in a specific channel that are configured
  /// in AWS Elemental MediaPackage.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from the GET list request. Use the token to fetch the
  /// next page of results.
  Future<ListOriginEndpointsResponse> listOriginEndpoints({
    required String channelGroupName,
    required String channelName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel/${Uri.encodeComponent(channelName)}/originEndpoint',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOriginEndpointsResponse.fromJson(response);
  }

  /// Resetting the origin endpoint can help to resolve unexpected behavior and
  /// other content packaging issues. It also helps to preserve special events
  /// when you don't want the previous content to be available for viewing. A
  /// reset clears out all previous content from the origin endpoint.
  ///
  /// MediaPackage might return old content from this endpoint in the first 30
  /// seconds after the endpoint reset. For best results, when possible, wait 30
  /// seconds from endpoint reset to send playback requests to this endpoint.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name of the channel group that contains the channel with the origin
  /// endpoint that you are resetting.
  ///
  /// Parameter [channelName] :
  /// The name of the channel with the origin endpoint that you are resetting.
  ///
  /// Parameter [originEndpointName] :
  /// The name of the origin endpoint that you are resetting.
  Future<ResetOriginEndpointStateResponse> resetOriginEndpointState({
    required String channelGroupName,
    required String channelName,
    required String originEndpointName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel/${Uri.encodeComponent(channelName)}/originEndpoint/${Uri.encodeComponent(originEndpointName)}/reset',
      exceptionFnMap: _exceptionFns,
    );
    return ResetOriginEndpointStateResponse.fromJson(response);
  }

  /// Attaches an IAM policy to the specified origin endpoint. You can attach
  /// only one policy with each request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  ///
  /// Parameter [originEndpointName] :
  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your
  /// account in the AWS Region and channel.
  ///
  /// Parameter [policy] :
  /// The policy to attach to the specified origin endpoint.
  ///
  /// Parameter [cdnAuthConfiguration] :
  /// The settings for using authorization headers between the MediaPackage
  /// endpoint and your CDN.
  ///
  /// For information about CDN authorization, see <a
  /// href="https://docs.aws.amazon.com/mediapackage/latest/userguide/cdn-auth.html">CDN
  /// authorization in Elemental MediaPackage</a> in the MediaPackage user
  /// guide.
  Future<void> putOriginEndpointPolicy({
    required String channelGroupName,
    required String channelName,
    required String originEndpointName,
    required String policy,
    CdnAuthConfiguration? cdnAuthConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'Policy': policy,
      if (cdnAuthConfiguration != null)
        'CdnAuthConfiguration': cdnAuthConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel/${Uri.encodeComponent(channelName)}/originEndpoint/${Uri.encodeComponent(originEndpointName)}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the specified origin endpoint policy that's configured in AWS
  /// Elemental MediaPackage.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  ///
  /// Parameter [originEndpointName] :
  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your
  /// account in the AWS Region and channel.
  Future<GetOriginEndpointPolicyResponse> getOriginEndpointPolicy({
    required String channelGroupName,
    required String channelName,
    required String originEndpointName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel/${Uri.encodeComponent(channelName)}/originEndpoint/${Uri.encodeComponent(originEndpointName)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetOriginEndpointPolicyResponse.fromJson(response);
  }

  /// Delete an origin endpoint policy.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in
  /// the AWS Region.
  ///
  /// Parameter [channelName] :
  /// The name that describes the channel. The name is the primary identifier
  /// for the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  ///
  /// Parameter [originEndpointName] :
  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your
  /// account in the AWS Region and channel.
  Future<void> deleteOriginEndpointPolicy({
    required String channelGroupName,
    required String channelName,
    required String originEndpointName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel/${Uri.encodeComponent(channelName)}/originEndpoint/${Uri.encodeComponent(originEndpointName)}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a new harvest job to export content from a MediaPackage v2 channel
  /// to an S3 bucket.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name of the channel group containing the channel from which to harvest
  /// content.
  ///
  /// Parameter [channelName] :
  /// The name of the channel from which to harvest content.
  ///
  /// Parameter [destination] :
  /// The S3 destination where the harvested content will be placed.
  ///
  /// Parameter [harvestedManifests] :
  /// A list of manifests to be harvested.
  ///
  /// Parameter [originEndpointName] :
  /// The name of the origin endpoint from which to harvest content.
  ///
  /// Parameter [scheduleConfiguration] :
  /// The configuration for when the harvest job should run, including start and
  /// end times.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [description] :
  /// An optional description for the harvest job.
  ///
  /// Parameter [harvestJobName] :
  /// A name for the harvest job. This name must be unique within the channel.
  ///
  /// Parameter [tags] :
  /// A collection of tags associated with the harvest job.
  Future<CreateHarvestJobResponse> createHarvestJob({
    required String channelGroupName,
    required String channelName,
    required Destination destination,
    required HarvestedManifests harvestedManifests,
    required String originEndpointName,
    required HarvesterScheduleConfiguration scheduleConfiguration,
    String? clientToken,
    String? description,
    String? harvestJobName,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'x-amzn-client-token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'Destination': destination,
      'HarvestedManifests': harvestedManifests,
      'ScheduleConfiguration': scheduleConfiguration,
      if (description != null) 'Description': description,
      if (harvestJobName != null) 'HarvestJobName': harvestJobName,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel/${Uri.encodeComponent(channelName)}/originEndpoint/${Uri.encodeComponent(originEndpointName)}/harvestJob',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateHarvestJobResponse.fromJson(response);
  }

  /// Retrieves the details of a specific harvest job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name of the channel group containing the channel associated with the
  /// harvest job.
  ///
  /// Parameter [channelName] :
  /// The name of the channel associated with the harvest job.
  ///
  /// Parameter [harvestJobName] :
  /// The name of the harvest job to retrieve.
  ///
  /// Parameter [originEndpointName] :
  /// The name of the origin endpoint associated with the harvest job.
  Future<GetHarvestJobResponse> getHarvestJob({
    required String channelGroupName,
    required String channelName,
    required String harvestJobName,
    required String originEndpointName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel/${Uri.encodeComponent(channelName)}/originEndpoint/${Uri.encodeComponent(originEndpointName)}/harvestJob/${Uri.encodeComponent(harvestJobName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetHarvestJobResponse.fromJson(response);
  }

  /// Cancels an in-progress harvest job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name of the channel group containing the channel from which the
  /// harvest job is running.
  ///
  /// Parameter [channelName] :
  /// The name of the channel from which the harvest job is running.
  ///
  /// Parameter [harvestJobName] :
  /// The name of the harvest job to cancel. This name must be unique within the
  /// channel and cannot be changed after the harvest job is submitted.
  ///
  /// Parameter [originEndpointName] :
  /// The name of the origin endpoint that the harvest job is harvesting from.
  /// This cannot be changed after the harvest job is submitted.
  ///
  /// Parameter [eTag] :
  /// The current Entity Tag (ETag) associated with the harvest job. Used for
  /// concurrency control.
  Future<void> cancelHarvestJob({
    required String channelGroupName,
    required String channelName,
    required String harvestJobName,
    required String originEndpointName,
    String? eTag,
  }) async {
    final headers = <String, String>{
      if (eTag != null) 'x-amzn-update-if-match': eTag.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/channel/${Uri.encodeComponent(channelName)}/originEndpoint/${Uri.encodeComponent(originEndpointName)}/harvestJob/${Uri.encodeComponent(harvestJobName)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves a list of harvest jobs that match the specified criteria.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelGroupName] :
  /// The name of the channel group to filter the harvest jobs by. If specified,
  /// only harvest jobs associated with channels in this group will be returned.
  ///
  /// Parameter [channelName] :
  /// The name of the channel to filter the harvest jobs by. If specified, only
  /// harvest jobs associated with this channel will be returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of harvest jobs to return in a single request. If not
  /// specified, a default value will be used.
  ///
  /// Parameter [nextToken] :
  /// A token used for pagination. Provide this value in subsequent requests to
  /// retrieve the next set of results.
  ///
  /// Parameter [originEndpointName] :
  /// The name of the origin endpoint to filter the harvest jobs by. If
  /// specified, only harvest jobs associated with this origin endpoint will be
  /// returned.
  ///
  /// Parameter [status] :
  /// The status to filter the harvest jobs by. If specified, only harvest jobs
  /// with this status will be returned.
  Future<ListHarvestJobsResponse> listHarvestJobs({
    required String channelGroupName,
    String? channelName,
    int? maxResults,
    String? nextToken,
    String? originEndpointName,
    HarvestJobStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (channelName != null) 'channelName': [channelName],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (originEndpointName != null)
        'originEndpointName': [originEndpointName],
      if (status != null) 'includeStatus': [status.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channelGroup/${Uri.encodeComponent(channelGroupName)}/harvestJob',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListHarvestJobsResponse.fromJson(response);
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// Contains a map of the key-value pairs for the resource tag or tags assigned
  /// to the resource.
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

/// @nodoc
class CreateChannelGroupResponse {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The date and time the channel group was created.
  final DateTime createdAt;

  /// The output domain where the source stream should be sent. Integrate the
  /// egress domain with a downstream CDN (such as Amazon CloudFront) or playback
  /// device.
  final String egressDomain;

  /// The date and time the channel group was modified.
  final DateTime modifiedAt;

  /// The description for your channel group.
  final String? description;

  /// The current Entity Tag (ETag) associated with this resource. The entity tag
  /// can be used to safely make concurrent updates to the resource.
  final String? eTag;

  /// The comma-separated list of tag key:value pairs assigned to the channel
  /// group.
  final Map<String, String>? tags;

  CreateChannelGroupResponse({
    required this.arn,
    required this.channelGroupName,
    required this.createdAt,
    required this.egressDomain,
    required this.modifiedAt,
    this.description,
    this.eTag,
    this.tags,
  });

  factory CreateChannelGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateChannelGroupResponse(
      arn: (json['Arn'] as String?) ?? '',
      channelGroupName: (json['ChannelGroupName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      egressDomain: (json['EgressDomain'] as String?) ?? '',
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] ?? 0),
      description: json['Description'] as String?,
      eTag: json['ETag'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final createdAt = this.createdAt;
    final egressDomain = this.egressDomain;
    final modifiedAt = this.modifiedAt;
    final description = this.description;
    final eTag = this.eTag;
    final tags = this.tags;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'CreatedAt': unixTimestampToJson(createdAt),
      'EgressDomain': egressDomain,
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      if (description != null) 'Description': description,
      if (eTag != null) 'ETag': eTag,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class GetChannelGroupResponse {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The date and time the channel group was created.
  final DateTime createdAt;

  /// The output domain where the source stream should be sent. Integrate the
  /// domain with a downstream CDN (such as Amazon CloudFront) or playback device.
  final String egressDomain;

  /// The date and time the channel group was modified.
  final DateTime modifiedAt;

  /// The description for your channel group.
  final String? description;

  /// The current Entity Tag (ETag) associated with this resource. The entity tag
  /// can be used to safely make concurrent updates to the resource.
  final String? eTag;

  /// The comma-separated list of tag key:value pairs assigned to the channel
  /// group.
  final Map<String, String>? tags;

  GetChannelGroupResponse({
    required this.arn,
    required this.channelGroupName,
    required this.createdAt,
    required this.egressDomain,
    required this.modifiedAt,
    this.description,
    this.eTag,
    this.tags,
  });

  factory GetChannelGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetChannelGroupResponse(
      arn: (json['Arn'] as String?) ?? '',
      channelGroupName: (json['ChannelGroupName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      egressDomain: (json['EgressDomain'] as String?) ?? '',
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] ?? 0),
      description: json['Description'] as String?,
      eTag: json['ETag'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final createdAt = this.createdAt;
    final egressDomain = this.egressDomain;
    final modifiedAt = this.modifiedAt;
    final description = this.description;
    final eTag = this.eTag;
    final tags = this.tags;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'CreatedAt': unixTimestampToJson(createdAt),
      'EgressDomain': egressDomain,
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      if (description != null) 'Description': description,
      if (eTag != null) 'ETag': eTag,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class UpdateChannelGroupResponse {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The date and time the channel group was created.
  final DateTime createdAt;

  /// The output domain where the source stream is sent. Integrate the domain with
  /// a downstream CDN (such as Amazon CloudFront) or playback device.
  final String egressDomain;

  /// The date and time the channel group was modified.
  final DateTime modifiedAt;

  /// The description for your channel group.
  final String? description;

  /// The current Entity Tag (ETag) associated with this resource. The entity tag
  /// can be used to safely make concurrent updates to the resource.
  final String? eTag;

  /// The comma-separated list of tag key:value pairs assigned to the channel
  /// group.
  final Map<String, String>? tags;

  UpdateChannelGroupResponse({
    required this.arn,
    required this.channelGroupName,
    required this.createdAt,
    required this.egressDomain,
    required this.modifiedAt,
    this.description,
    this.eTag,
    this.tags,
  });

  factory UpdateChannelGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateChannelGroupResponse(
      arn: (json['Arn'] as String?) ?? '',
      channelGroupName: (json['ChannelGroupName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      egressDomain: (json['EgressDomain'] as String?) ?? '',
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] ?? 0),
      description: json['Description'] as String?,
      eTag: json['ETag'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final createdAt = this.createdAt;
    final egressDomain = this.egressDomain;
    final modifiedAt = this.modifiedAt;
    final description = this.description;
    final eTag = this.eTag;
    final tags = this.tags;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'CreatedAt': unixTimestampToJson(createdAt),
      'EgressDomain': egressDomain,
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      if (description != null) 'Description': description,
      if (eTag != null) 'ETag': eTag,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class DeleteChannelGroupResponse {
  DeleteChannelGroupResponse();

  factory DeleteChannelGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteChannelGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListChannelGroupsResponse {
  /// The objects being returned.
  final List<ChannelGroupListConfiguration>? items;

  /// The pagination token from the GET list request. Use the token to fetch the
  /// next page of results.
  final String? nextToken;

  ListChannelGroupsResponse({
    this.items,
    this.nextToken,
  });

  factory ListChannelGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListChannelGroupsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) =>
              ChannelGroupListConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateChannelResponse {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The name that describes the channel. The name is the primary identifier for
  /// the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  final String channelName;

  /// The date and time the channel was created.
  final DateTime createdAt;

  /// The date and time the channel was modified.
  final DateTime modifiedAt;

  /// The description for your channel.
  final String? description;

  /// The current Entity Tag (ETag) associated with this resource. The entity tag
  /// can be used to safely make concurrent updates to the resource.
  final String? eTag;
  final List<IngestEndpoint>? ingestEndpoints;

  /// The configuration for input switching based on the media quality confidence
  /// score (MQCS) as provided from AWS Elemental MediaLive. This setting is valid
  /// only when <code>InputType</code> is <code>CMAF</code>.
  final InputSwitchConfiguration? inputSwitchConfiguration;

  /// The input type will be an immutable field which will be used to define
  /// whether the channel will allow CMAF ingest or HLS ingest. If unprovided, it
  /// will default to HLS to preserve current behavior.
  ///
  /// The allowed values are:
  ///
  /// <ul>
  /// <li>
  /// <code>HLS</code> - The HLS streaming specification (which defines M3U8
  /// manifests and TS segments).
  /// </li>
  /// <li>
  /// <code>CMAF</code> - The DASH-IF CMAF Ingest specification (which defines
  /// CMAF segments with optional DASH manifests).
  /// </li>
  /// </ul>
  final InputType? inputType;

  /// The settings for what common media server data (CMSD) headers AWS Elemental
  /// MediaPackage includes in responses to the CDN. This setting is valid only
  /// when <code>InputType</code> is <code>CMAF</code>.
  final OutputHeaderConfiguration? outputHeaderConfiguration;

  /// The comma-separated list of tag key:value pairs assigned to the channel.
  final Map<String, String>? tags;

  CreateChannelResponse({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.createdAt,
    required this.modifiedAt,
    this.description,
    this.eTag,
    this.ingestEndpoints,
    this.inputSwitchConfiguration,
    this.inputType,
    this.outputHeaderConfiguration,
    this.tags,
  });

  factory CreateChannelResponse.fromJson(Map<String, dynamic> json) {
    return CreateChannelResponse(
      arn: (json['Arn'] as String?) ?? '',
      channelGroupName: (json['ChannelGroupName'] as String?) ?? '',
      channelName: (json['ChannelName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] ?? 0),
      description: json['Description'] as String?,
      eTag: json['ETag'] as String?,
      ingestEndpoints: (json['IngestEndpoints'] as List?)
          ?.nonNulls
          .map((e) => IngestEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      inputSwitchConfiguration: json['InputSwitchConfiguration'] != null
          ? InputSwitchConfiguration.fromJson(
              json['InputSwitchConfiguration'] as Map<String, dynamic>)
          : null,
      inputType: (json['InputType'] as String?)?.let(InputType.fromString),
      outputHeaderConfiguration: json['OutputHeaderConfiguration'] != null
          ? OutputHeaderConfiguration.fromJson(
              json['OutputHeaderConfiguration'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final description = this.description;
    final eTag = this.eTag;
    final ingestEndpoints = this.ingestEndpoints;
    final inputSwitchConfiguration = this.inputSwitchConfiguration;
    final inputType = this.inputType;
    final outputHeaderConfiguration = this.outputHeaderConfiguration;
    final tags = this.tags;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'CreatedAt': unixTimestampToJson(createdAt),
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      if (description != null) 'Description': description,
      if (eTag != null) 'ETag': eTag,
      if (ingestEndpoints != null) 'IngestEndpoints': ingestEndpoints,
      if (inputSwitchConfiguration != null)
        'InputSwitchConfiguration': inputSwitchConfiguration,
      if (inputType != null) 'InputType': inputType.value,
      if (outputHeaderConfiguration != null)
        'OutputHeaderConfiguration': outputHeaderConfiguration,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class GetChannelResponse {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The name that describes the channel. The name is the primary identifier for
  /// the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  final String channelName;

  /// The date and time the channel was created.
  final DateTime createdAt;

  /// The date and time the channel was modified.
  final DateTime modifiedAt;

  /// The description for your channel.
  final String? description;

  /// The current Entity Tag (ETag) associated with this resource. The entity tag
  /// can be used to safely make concurrent updates to the resource.
  final String? eTag;
  final List<IngestEndpoint>? ingestEndpoints;

  /// The configuration for input switching based on the media quality confidence
  /// score (MQCS) as provided from AWS Elemental MediaLive. This setting is valid
  /// only when <code>InputType</code> is <code>CMAF</code>.
  final InputSwitchConfiguration? inputSwitchConfiguration;

  /// The input type will be an immutable field which will be used to define
  /// whether the channel will allow CMAF ingest or HLS ingest. If unprovided, it
  /// will default to HLS to preserve current behavior.
  ///
  /// The allowed values are:
  ///
  /// <ul>
  /// <li>
  /// <code>HLS</code> - The HLS streaming specification (which defines M3U8
  /// manifests and TS segments).
  /// </li>
  /// <li>
  /// <code>CMAF</code> - The DASH-IF CMAF Ingest specification (which defines
  /// CMAF segments with optional DASH manifests).
  /// </li>
  /// </ul>
  final InputType? inputType;

  /// The settings for what common media server data (CMSD) headers AWS Elemental
  /// MediaPackage includes in responses to the CDN. This setting is valid only
  /// when <code>InputType</code> is <code>CMAF</code>.
  final OutputHeaderConfiguration? outputHeaderConfiguration;

  /// The time that the channel was last reset.
  final DateTime? resetAt;

  /// The comma-separated list of tag key:value pairs assigned to the channel.
  final Map<String, String>? tags;

  GetChannelResponse({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.createdAt,
    required this.modifiedAt,
    this.description,
    this.eTag,
    this.ingestEndpoints,
    this.inputSwitchConfiguration,
    this.inputType,
    this.outputHeaderConfiguration,
    this.resetAt,
    this.tags,
  });

  factory GetChannelResponse.fromJson(Map<String, dynamic> json) {
    return GetChannelResponse(
      arn: (json['Arn'] as String?) ?? '',
      channelGroupName: (json['ChannelGroupName'] as String?) ?? '',
      channelName: (json['ChannelName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] ?? 0),
      description: json['Description'] as String?,
      eTag: json['ETag'] as String?,
      ingestEndpoints: (json['IngestEndpoints'] as List?)
          ?.nonNulls
          .map((e) => IngestEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      inputSwitchConfiguration: json['InputSwitchConfiguration'] != null
          ? InputSwitchConfiguration.fromJson(
              json['InputSwitchConfiguration'] as Map<String, dynamic>)
          : null,
      inputType: (json['InputType'] as String?)?.let(InputType.fromString),
      outputHeaderConfiguration: json['OutputHeaderConfiguration'] != null
          ? OutputHeaderConfiguration.fromJson(
              json['OutputHeaderConfiguration'] as Map<String, dynamic>)
          : null,
      resetAt: timeStampFromJson(json['ResetAt']),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final description = this.description;
    final eTag = this.eTag;
    final ingestEndpoints = this.ingestEndpoints;
    final inputSwitchConfiguration = this.inputSwitchConfiguration;
    final inputType = this.inputType;
    final outputHeaderConfiguration = this.outputHeaderConfiguration;
    final resetAt = this.resetAt;
    final tags = this.tags;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'CreatedAt': unixTimestampToJson(createdAt),
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      if (description != null) 'Description': description,
      if (eTag != null) 'ETag': eTag,
      if (ingestEndpoints != null) 'IngestEndpoints': ingestEndpoints,
      if (inputSwitchConfiguration != null)
        'InputSwitchConfiguration': inputSwitchConfiguration,
      if (inputType != null) 'InputType': inputType.value,
      if (outputHeaderConfiguration != null)
        'OutputHeaderConfiguration': outputHeaderConfiguration,
      if (resetAt != null) 'ResetAt': unixTimestampToJson(resetAt),
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class UpdateChannelResponse {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The name that describes the channel. The name is the primary identifier for
  /// the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  final String channelName;

  /// The date and time the channel was created.
  final DateTime createdAt;

  /// The date and time the channel was modified.
  final DateTime modifiedAt;

  /// The description for your channel.
  final String? description;

  /// The current Entity Tag (ETag) associated with this resource. The entity tag
  /// can be used to safely make concurrent updates to the resource.
  final String? eTag;
  final List<IngestEndpoint>? ingestEndpoints;

  /// The configuration for input switching based on the media quality confidence
  /// score (MQCS) as provided from AWS Elemental MediaLive. This setting is valid
  /// only when <code>InputType</code> is <code>CMAF</code>.
  final InputSwitchConfiguration? inputSwitchConfiguration;

  /// The input type will be an immutable field which will be used to define
  /// whether the channel will allow CMAF ingest or HLS ingest. If unprovided, it
  /// will default to HLS to preserve current behavior.
  ///
  /// The allowed values are:
  ///
  /// <ul>
  /// <li>
  /// <code>HLS</code> - The HLS streaming specification (which defines M3U8
  /// manifests and TS segments).
  /// </li>
  /// <li>
  /// <code>CMAF</code> - The DASH-IF CMAF Ingest specification (which defines
  /// CMAF segments with optional DASH manifests).
  /// </li>
  /// </ul>
  final InputType? inputType;

  /// The settings for what common media server data (CMSD) headers AWS Elemental
  /// MediaPackage includes in responses to the CDN. This setting is valid only
  /// when <code>InputType</code> is <code>CMAF</code>.
  final OutputHeaderConfiguration? outputHeaderConfiguration;

  /// The comma-separated list of tag key:value pairs assigned to the channel.
  final Map<String, String>? tags;

  UpdateChannelResponse({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.createdAt,
    required this.modifiedAt,
    this.description,
    this.eTag,
    this.ingestEndpoints,
    this.inputSwitchConfiguration,
    this.inputType,
    this.outputHeaderConfiguration,
    this.tags,
  });

  factory UpdateChannelResponse.fromJson(Map<String, dynamic> json) {
    return UpdateChannelResponse(
      arn: (json['Arn'] as String?) ?? '',
      channelGroupName: (json['ChannelGroupName'] as String?) ?? '',
      channelName: (json['ChannelName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] ?? 0),
      description: json['Description'] as String?,
      eTag: json['ETag'] as String?,
      ingestEndpoints: (json['IngestEndpoints'] as List?)
          ?.nonNulls
          .map((e) => IngestEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      inputSwitchConfiguration: json['InputSwitchConfiguration'] != null
          ? InputSwitchConfiguration.fromJson(
              json['InputSwitchConfiguration'] as Map<String, dynamic>)
          : null,
      inputType: (json['InputType'] as String?)?.let(InputType.fromString),
      outputHeaderConfiguration: json['OutputHeaderConfiguration'] != null
          ? OutputHeaderConfiguration.fromJson(
              json['OutputHeaderConfiguration'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final description = this.description;
    final eTag = this.eTag;
    final ingestEndpoints = this.ingestEndpoints;
    final inputSwitchConfiguration = this.inputSwitchConfiguration;
    final inputType = this.inputType;
    final outputHeaderConfiguration = this.outputHeaderConfiguration;
    final tags = this.tags;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'CreatedAt': unixTimestampToJson(createdAt),
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      if (description != null) 'Description': description,
      if (eTag != null) 'ETag': eTag,
      if (ingestEndpoints != null) 'IngestEndpoints': ingestEndpoints,
      if (inputSwitchConfiguration != null)
        'InputSwitchConfiguration': inputSwitchConfiguration,
      if (inputType != null) 'InputType': inputType.value,
      if (outputHeaderConfiguration != null)
        'OutputHeaderConfiguration': outputHeaderConfiguration,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class DeleteChannelResponse {
  DeleteChannelResponse();

  factory DeleteChannelResponse.fromJson(Map<String, dynamic> _) {
    return DeleteChannelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListChannelsResponse {
  /// The objects being returned.
  final List<ChannelListConfiguration>? items;

  /// The pagination token from the GET list request.
  final String? nextToken;

  ListChannelsResponse({
    this.items,
    this.nextToken,
  });

  factory ListChannelsResponse.fromJson(Map<String, dynamic> json) {
    return ListChannelsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) =>
              ChannelListConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ResetChannelStateResponse {
  /// The Amazon Resource Name (ARN) associated with the channel that you just
  /// reset.
  final String arn;

  /// The name of the channel group that contains the channel that you just reset.
  final String channelGroupName;

  /// The name of the channel that you just reset.
  final String channelName;

  /// The time that the channel was last reset.
  final DateTime resetAt;

  ResetChannelStateResponse({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.resetAt,
  });

  factory ResetChannelStateResponse.fromJson(Map<String, dynamic> json) {
    return ResetChannelStateResponse(
      arn: (json['Arn'] as String?) ?? '',
      channelGroupName: (json['ChannelGroupName'] as String?) ?? '',
      channelName: (json['ChannelName'] as String?) ?? '',
      resetAt: nonNullableTimeStampFromJson(json['ResetAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final resetAt = this.resetAt;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'ResetAt': unixTimestampToJson(resetAt),
    };
  }
}

/// @nodoc
class PutChannelPolicyResponse {
  PutChannelPolicyResponse();

  factory PutChannelPolicyResponse.fromJson(Map<String, dynamic> _) {
    return PutChannelPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetChannelPolicyResponse {
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The name that describes the channel. The name is the primary identifier for
  /// the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  final String channelName;

  /// The policy assigned to the channel.
  final String policy;

  GetChannelPolicyResponse({
    required this.channelGroupName,
    required this.channelName,
    required this.policy,
  });

  factory GetChannelPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetChannelPolicyResponse(
      channelGroupName: (json['ChannelGroupName'] as String?) ?? '',
      channelName: (json['ChannelName'] as String?) ?? '',
      policy: (json['Policy'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final policy = this.policy;
    return {
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'Policy': policy,
    };
  }
}

/// @nodoc
class DeleteChannelPolicyResponse {
  DeleteChannelPolicyResponse();

  factory DeleteChannelPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteChannelPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateOriginEndpointResponse {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The name that describes the channel. The name is the primary identifier for
  /// the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  final String channelName;

  /// The type of container attached to this origin endpoint.
  final ContainerType containerType;

  /// The date and time the origin endpoint was created.
  final DateTime createdAt;

  /// The date and time the origin endpoint was modified.
  final DateTime modifiedAt;

  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your account
  /// in the AWS Region and channel.
  final String originEndpointName;

  /// The segment configuration, including the segment name, duration, and other
  /// configuration values.
  final Segment segment;

  /// A DASH manifest configuration.
  final List<GetDashManifestConfiguration>? dashManifests;

  /// The description for your origin endpoint.
  final String? description;

  /// The current Entity Tag (ETag) associated with this resource. The entity tag
  /// can be used to safely make concurrent updates to the resource.
  final String? eTag;

  /// The failover settings for the endpoint.
  final ForceEndpointErrorConfiguration? forceEndpointErrorConfiguration;

  /// An HTTP live streaming (HLS) manifest configuration.
  final List<GetHlsManifestConfiguration>? hlsManifests;

  /// A low-latency HLS manifest configuration.
  final List<GetLowLatencyHlsManifestConfiguration>? lowLatencyHlsManifests;

  /// The Microsoft Smooth Streaming (MSS) manifest configurations that were
  /// created for this origin endpoint.
  final List<GetMssManifestConfiguration>? mssManifests;

  /// The size of the window (in seconds) to create a window of the live stream
  /// that's available for on-demand viewing. Viewers can start-over or catch-up
  /// on content that falls within the window.
  final int? startoverWindowSeconds;

  /// The comma-separated list of tag key:value pairs assigned to the origin
  /// endpoint.
  final Map<String, String>? tags;

  /// The separator character used in generated URIs for this origin endpoint.
  final UriSeparator? uriSeparator;

  CreateOriginEndpointResponse({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.containerType,
    required this.createdAt,
    required this.modifiedAt,
    required this.originEndpointName,
    required this.segment,
    this.dashManifests,
    this.description,
    this.eTag,
    this.forceEndpointErrorConfiguration,
    this.hlsManifests,
    this.lowLatencyHlsManifests,
    this.mssManifests,
    this.startoverWindowSeconds,
    this.tags,
    this.uriSeparator,
  });

  factory CreateOriginEndpointResponse.fromJson(Map<String, dynamic> json) {
    return CreateOriginEndpointResponse(
      arn: (json['Arn'] as String?) ?? '',
      channelGroupName: (json['ChannelGroupName'] as String?) ?? '',
      channelName: (json['ChannelName'] as String?) ?? '',
      containerType:
          ContainerType.fromString((json['ContainerType'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] ?? 0),
      originEndpointName: (json['OriginEndpointName'] as String?) ?? '',
      segment: Segment.fromJson((json['Segment'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      dashManifests: (json['DashManifests'] as List?)
          ?.nonNulls
          .map((e) =>
              GetDashManifestConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['Description'] as String?,
      eTag: json['ETag'] as String?,
      forceEndpointErrorConfiguration:
          json['ForceEndpointErrorConfiguration'] != null
              ? ForceEndpointErrorConfiguration.fromJson(
                  json['ForceEndpointErrorConfiguration']
                      as Map<String, dynamic>)
              : null,
      hlsManifests: (json['HlsManifests'] as List?)
          ?.nonNulls
          .map((e) =>
              GetHlsManifestConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      lowLatencyHlsManifests: (json['LowLatencyHlsManifests'] as List?)
          ?.nonNulls
          .map((e) => GetLowLatencyHlsManifestConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      mssManifests: (json['MssManifests'] as List?)
          ?.nonNulls
          .map((e) =>
              GetMssManifestConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      startoverWindowSeconds: json['StartoverWindowSeconds'] as int?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      uriSeparator:
          (json['UriSeparator'] as String?)?.let(UriSeparator.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final containerType = this.containerType;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final originEndpointName = this.originEndpointName;
    final segment = this.segment;
    final dashManifests = this.dashManifests;
    final description = this.description;
    final eTag = this.eTag;
    final forceEndpointErrorConfiguration =
        this.forceEndpointErrorConfiguration;
    final hlsManifests = this.hlsManifests;
    final lowLatencyHlsManifests = this.lowLatencyHlsManifests;
    final mssManifests = this.mssManifests;
    final startoverWindowSeconds = this.startoverWindowSeconds;
    final tags = this.tags;
    final uriSeparator = this.uriSeparator;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'ContainerType': containerType.value,
      'CreatedAt': unixTimestampToJson(createdAt),
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      'OriginEndpointName': originEndpointName,
      'Segment': segment,
      if (dashManifests != null) 'DashManifests': dashManifests,
      if (description != null) 'Description': description,
      if (eTag != null) 'ETag': eTag,
      if (forceEndpointErrorConfiguration != null)
        'ForceEndpointErrorConfiguration': forceEndpointErrorConfiguration,
      if (hlsManifests != null) 'HlsManifests': hlsManifests,
      if (lowLatencyHlsManifests != null)
        'LowLatencyHlsManifests': lowLatencyHlsManifests,
      if (mssManifests != null) 'MssManifests': mssManifests,
      if (startoverWindowSeconds != null)
        'StartoverWindowSeconds': startoverWindowSeconds,
      if (tags != null) 'Tags': tags,
      if (uriSeparator != null) 'UriSeparator': uriSeparator.value,
    };
  }
}

/// @nodoc
class GetOriginEndpointResponse {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The name that describes the channel. The name is the primary identifier for
  /// the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  final String channelName;

  /// The type of container attached to this origin endpoint.
  final ContainerType containerType;

  /// The date and time the origin endpoint was created.
  final DateTime createdAt;

  /// The date and time the origin endpoint was modified.
  final DateTime modifiedAt;

  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your account
  /// in the AWS Region and channel.
  final String originEndpointName;
  final Segment segment;

  /// A DASH manifest configuration.
  final List<GetDashManifestConfiguration>? dashManifests;

  /// The description for your origin endpoint.
  final String? description;

  /// The current Entity Tag (ETag) associated with this resource. The entity tag
  /// can be used to safely make concurrent updates to the resource.
  final String? eTag;

  /// The failover settings for the endpoint.
  final ForceEndpointErrorConfiguration? forceEndpointErrorConfiguration;

  /// An HTTP live streaming (HLS) manifest configuration.
  final List<GetHlsManifestConfiguration>? hlsManifests;

  /// A low-latency HLS manifest configuration.
  final List<GetLowLatencyHlsManifestConfiguration>? lowLatencyHlsManifests;

  /// The Microsoft Smooth Streaming (MSS) manifest configurations associated with
  /// this origin endpoint.
  final List<GetMssManifestConfiguration>? mssManifests;

  /// The time that the origin endpoint was last reset.
  final DateTime? resetAt;

  /// The size of the window (in seconds) to create a window of the live stream
  /// that's available for on-demand viewing. Viewers can start-over or catch-up
  /// on content that falls within the window.
  final int? startoverWindowSeconds;

  /// The comma-separated list of tag key:value pairs assigned to the origin
  /// endpoint.
  final Map<String, String>? tags;

  /// The separator character used in generated URIs for this origin endpoint.
  final UriSeparator? uriSeparator;

  GetOriginEndpointResponse({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.containerType,
    required this.createdAt,
    required this.modifiedAt,
    required this.originEndpointName,
    required this.segment,
    this.dashManifests,
    this.description,
    this.eTag,
    this.forceEndpointErrorConfiguration,
    this.hlsManifests,
    this.lowLatencyHlsManifests,
    this.mssManifests,
    this.resetAt,
    this.startoverWindowSeconds,
    this.tags,
    this.uriSeparator,
  });

  factory GetOriginEndpointResponse.fromJson(Map<String, dynamic> json) {
    return GetOriginEndpointResponse(
      arn: (json['Arn'] as String?) ?? '',
      channelGroupName: (json['ChannelGroupName'] as String?) ?? '',
      channelName: (json['ChannelName'] as String?) ?? '',
      containerType:
          ContainerType.fromString((json['ContainerType'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] ?? 0),
      originEndpointName: (json['OriginEndpointName'] as String?) ?? '',
      segment: Segment.fromJson((json['Segment'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      dashManifests: (json['DashManifests'] as List?)
          ?.nonNulls
          .map((e) =>
              GetDashManifestConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['Description'] as String?,
      eTag: json['ETag'] as String?,
      forceEndpointErrorConfiguration:
          json['ForceEndpointErrorConfiguration'] != null
              ? ForceEndpointErrorConfiguration.fromJson(
                  json['ForceEndpointErrorConfiguration']
                      as Map<String, dynamic>)
              : null,
      hlsManifests: (json['HlsManifests'] as List?)
          ?.nonNulls
          .map((e) =>
              GetHlsManifestConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      lowLatencyHlsManifests: (json['LowLatencyHlsManifests'] as List?)
          ?.nonNulls
          .map((e) => GetLowLatencyHlsManifestConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      mssManifests: (json['MssManifests'] as List?)
          ?.nonNulls
          .map((e) =>
              GetMssManifestConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      resetAt: timeStampFromJson(json['ResetAt']),
      startoverWindowSeconds: json['StartoverWindowSeconds'] as int?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      uriSeparator:
          (json['UriSeparator'] as String?)?.let(UriSeparator.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final containerType = this.containerType;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final originEndpointName = this.originEndpointName;
    final segment = this.segment;
    final dashManifests = this.dashManifests;
    final description = this.description;
    final eTag = this.eTag;
    final forceEndpointErrorConfiguration =
        this.forceEndpointErrorConfiguration;
    final hlsManifests = this.hlsManifests;
    final lowLatencyHlsManifests = this.lowLatencyHlsManifests;
    final mssManifests = this.mssManifests;
    final resetAt = this.resetAt;
    final startoverWindowSeconds = this.startoverWindowSeconds;
    final tags = this.tags;
    final uriSeparator = this.uriSeparator;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'ContainerType': containerType.value,
      'CreatedAt': unixTimestampToJson(createdAt),
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      'OriginEndpointName': originEndpointName,
      'Segment': segment,
      if (dashManifests != null) 'DashManifests': dashManifests,
      if (description != null) 'Description': description,
      if (eTag != null) 'ETag': eTag,
      if (forceEndpointErrorConfiguration != null)
        'ForceEndpointErrorConfiguration': forceEndpointErrorConfiguration,
      if (hlsManifests != null) 'HlsManifests': hlsManifests,
      if (lowLatencyHlsManifests != null)
        'LowLatencyHlsManifests': lowLatencyHlsManifests,
      if (mssManifests != null) 'MssManifests': mssManifests,
      if (resetAt != null) 'ResetAt': unixTimestampToJson(resetAt),
      if (startoverWindowSeconds != null)
        'StartoverWindowSeconds': startoverWindowSeconds,
      if (tags != null) 'Tags': tags,
      if (uriSeparator != null) 'UriSeparator': uriSeparator.value,
    };
  }
}

/// @nodoc
class UpdateOriginEndpointResponse {
  /// The ARN associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The name that describes the channel. The name is the primary identifier for
  /// the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  final String channelName;

  /// The type of container attached to this origin endpoint.
  final ContainerType containerType;

  /// The date and time the origin endpoint was created.
  final DateTime createdAt;

  /// The date and time the origin endpoint was modified.
  final DateTime modifiedAt;

  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your account
  /// in the AWS Region and channel.
  final String originEndpointName;

  /// The segment configuration, including the segment name, duration, and other
  /// configuration values.
  final Segment segment;

  /// A DASH manifest configuration.
  final List<GetDashManifestConfiguration>? dashManifests;

  /// The description of the origin endpoint.
  final String? description;

  /// The current Entity Tag (ETag) associated with this resource. The entity tag
  /// can be used to safely make concurrent updates to the resource.
  final String? eTag;

  /// The failover settings for the endpoint.
  final ForceEndpointErrorConfiguration? forceEndpointErrorConfiguration;

  /// An HTTP live streaming (HLS) manifest configuration.
  final List<GetHlsManifestConfiguration>? hlsManifests;

  /// A low-latency HLS manifest configuration.
  final List<GetLowLatencyHlsManifestConfiguration>? lowLatencyHlsManifests;

  /// The updated Microsoft Smooth Streaming (MSS) manifest configurations for
  /// this origin endpoint.
  final List<GetMssManifestConfiguration>? mssManifests;

  /// The size of the window (in seconds) to create a window of the live stream
  /// that's available for on-demand viewing. Viewers can start-over or catch-up
  /// on content that falls within the window.
  final int? startoverWindowSeconds;

  /// The comma-separated list of tag key:value pairs assigned to the origin
  /// endpoint.
  final Map<String, String>? tags;

  /// The separator character used in generated URIs for this origin endpoint.
  final UriSeparator? uriSeparator;

  UpdateOriginEndpointResponse({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.containerType,
    required this.createdAt,
    required this.modifiedAt,
    required this.originEndpointName,
    required this.segment,
    this.dashManifests,
    this.description,
    this.eTag,
    this.forceEndpointErrorConfiguration,
    this.hlsManifests,
    this.lowLatencyHlsManifests,
    this.mssManifests,
    this.startoverWindowSeconds,
    this.tags,
    this.uriSeparator,
  });

  factory UpdateOriginEndpointResponse.fromJson(Map<String, dynamic> json) {
    return UpdateOriginEndpointResponse(
      arn: (json['Arn'] as String?) ?? '',
      channelGroupName: (json['ChannelGroupName'] as String?) ?? '',
      channelName: (json['ChannelName'] as String?) ?? '',
      containerType:
          ContainerType.fromString((json['ContainerType'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] ?? 0),
      originEndpointName: (json['OriginEndpointName'] as String?) ?? '',
      segment: Segment.fromJson((json['Segment'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      dashManifests: (json['DashManifests'] as List?)
          ?.nonNulls
          .map((e) =>
              GetDashManifestConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['Description'] as String?,
      eTag: json['ETag'] as String?,
      forceEndpointErrorConfiguration:
          json['ForceEndpointErrorConfiguration'] != null
              ? ForceEndpointErrorConfiguration.fromJson(
                  json['ForceEndpointErrorConfiguration']
                      as Map<String, dynamic>)
              : null,
      hlsManifests: (json['HlsManifests'] as List?)
          ?.nonNulls
          .map((e) =>
              GetHlsManifestConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      lowLatencyHlsManifests: (json['LowLatencyHlsManifests'] as List?)
          ?.nonNulls
          .map((e) => GetLowLatencyHlsManifestConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      mssManifests: (json['MssManifests'] as List?)
          ?.nonNulls
          .map((e) =>
              GetMssManifestConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      startoverWindowSeconds: json['StartoverWindowSeconds'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      uriSeparator:
          (json['UriSeparator'] as String?)?.let(UriSeparator.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final containerType = this.containerType;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final originEndpointName = this.originEndpointName;
    final segment = this.segment;
    final dashManifests = this.dashManifests;
    final description = this.description;
    final eTag = this.eTag;
    final forceEndpointErrorConfiguration =
        this.forceEndpointErrorConfiguration;
    final hlsManifests = this.hlsManifests;
    final lowLatencyHlsManifests = this.lowLatencyHlsManifests;
    final mssManifests = this.mssManifests;
    final startoverWindowSeconds = this.startoverWindowSeconds;
    final tags = this.tags;
    final uriSeparator = this.uriSeparator;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'ContainerType': containerType.value,
      'CreatedAt': unixTimestampToJson(createdAt),
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      'OriginEndpointName': originEndpointName,
      'Segment': segment,
      if (dashManifests != null) 'DashManifests': dashManifests,
      if (description != null) 'Description': description,
      if (eTag != null) 'ETag': eTag,
      if (forceEndpointErrorConfiguration != null)
        'ForceEndpointErrorConfiguration': forceEndpointErrorConfiguration,
      if (hlsManifests != null) 'HlsManifests': hlsManifests,
      if (lowLatencyHlsManifests != null)
        'LowLatencyHlsManifests': lowLatencyHlsManifests,
      if (mssManifests != null) 'MssManifests': mssManifests,
      if (startoverWindowSeconds != null)
        'StartoverWindowSeconds': startoverWindowSeconds,
      if (tags != null) 'tags': tags,
      if (uriSeparator != null) 'UriSeparator': uriSeparator.value,
    };
  }
}

/// @nodoc
class DeleteOriginEndpointResponse {
  DeleteOriginEndpointResponse();

  factory DeleteOriginEndpointResponse.fromJson(Map<String, dynamic> _) {
    return DeleteOriginEndpointResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListOriginEndpointsResponse {
  /// The objects being returned.
  final List<OriginEndpointListConfiguration>? items;

  /// The pagination token from the GET list request. Use the token to fetch the
  /// next page of results.
  final String? nextToken;

  ListOriginEndpointsResponse({
    this.items,
    this.nextToken,
  });

  factory ListOriginEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return ListOriginEndpointsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => OriginEndpointListConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ResetOriginEndpointStateResponse {
  /// The Amazon Resource Name (ARN) associated with the endpoint that you just
  /// reset.
  final String arn;

  /// The name of the channel group that contains the channel with the origin
  /// endpoint that you just reset.
  final String channelGroupName;

  /// The name of the channel with the origin endpoint that you just reset.
  final String channelName;

  /// The name of the origin endpoint that you just reset.
  final String originEndpointName;

  /// The time that the origin endpoint was last reset.
  final DateTime resetAt;

  ResetOriginEndpointStateResponse({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.originEndpointName,
    required this.resetAt,
  });

  factory ResetOriginEndpointStateResponse.fromJson(Map<String, dynamic> json) {
    return ResetOriginEndpointStateResponse(
      arn: (json['Arn'] as String?) ?? '',
      channelGroupName: (json['ChannelGroupName'] as String?) ?? '',
      channelName: (json['ChannelName'] as String?) ?? '',
      originEndpointName: (json['OriginEndpointName'] as String?) ?? '',
      resetAt: nonNullableTimeStampFromJson(json['ResetAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final originEndpointName = this.originEndpointName;
    final resetAt = this.resetAt;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'OriginEndpointName': originEndpointName,
      'ResetAt': unixTimestampToJson(resetAt),
    };
  }
}

/// @nodoc
class PutOriginEndpointPolicyResponse {
  PutOriginEndpointPolicyResponse();

  factory PutOriginEndpointPolicyResponse.fromJson(Map<String, dynamic> _) {
    return PutOriginEndpointPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetOriginEndpointPolicyResponse {
  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The name that describes the channel. The name is the primary identifier for
  /// the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  final String channelName;

  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your account
  /// in the AWS Region and channel.
  final String originEndpointName;

  /// The policy assigned to the origin endpoint.
  final String policy;

  /// The settings for using authorization headers between the MediaPackage
  /// endpoint and your CDN.
  ///
  /// For information about CDN authorization, see <a
  /// href="https://docs.aws.amazon.com/mediapackage/latest/userguide/cdn-auth.html">CDN
  /// authorization in Elemental MediaPackage</a> in the MediaPackage user guide.
  final CdnAuthConfiguration? cdnAuthConfiguration;

  GetOriginEndpointPolicyResponse({
    required this.channelGroupName,
    required this.channelName,
    required this.originEndpointName,
    required this.policy,
    this.cdnAuthConfiguration,
  });

  factory GetOriginEndpointPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetOriginEndpointPolicyResponse(
      channelGroupName: (json['ChannelGroupName'] as String?) ?? '',
      channelName: (json['ChannelName'] as String?) ?? '',
      originEndpointName: (json['OriginEndpointName'] as String?) ?? '',
      policy: (json['Policy'] as String?) ?? '',
      cdnAuthConfiguration: json['CdnAuthConfiguration'] != null
          ? CdnAuthConfiguration.fromJson(
              json['CdnAuthConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final originEndpointName = this.originEndpointName;
    final policy = this.policy;
    final cdnAuthConfiguration = this.cdnAuthConfiguration;
    return {
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'OriginEndpointName': originEndpointName,
      'Policy': policy,
      if (cdnAuthConfiguration != null)
        'CdnAuthConfiguration': cdnAuthConfiguration,
    };
  }
}

/// @nodoc
class DeleteOriginEndpointPolicyResponse {
  DeleteOriginEndpointPolicyResponse();

  factory DeleteOriginEndpointPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteOriginEndpointPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The response object returned after creating a harvest job.
///
/// @nodoc
class CreateHarvestJobResponse {
  /// The Amazon Resource Name (ARN) of the created harvest job.
  final String arn;

  /// The name of the channel group containing the channel from which content is
  /// being harvested.
  final String channelGroupName;

  /// The name of the channel from which content is being harvested.
  final String channelName;

  /// The date and time the harvest job was created.
  final DateTime createdAt;

  /// The S3 destination where the harvested content will be placed.
  final Destination destination;

  /// The name of the created harvest job.
  final String harvestJobName;

  /// A list of manifests that will be harvested.
  final HarvestedManifests harvestedManifests;

  /// The date and time the harvest job was last modified.
  final DateTime modifiedAt;

  /// The name of the origin endpoint from which content is being harvested.
  final String originEndpointName;

  /// The configuration for when the harvest job will run, including start and end
  /// times.
  final HarvesterScheduleConfiguration scheduleConfiguration;

  /// The current status of the harvest job (e.g., CREATED, IN_PROGRESS, ABORTED,
  /// COMPLETED, FAILED).
  final HarvestJobStatus status;

  /// The description of the harvest job, if provided.
  final String? description;

  /// The current version of the harvest job. Used for concurrency control.
  final String? eTag;

  /// An error message if the harvest job creation failed.
  final String? errorMessage;

  /// A collection of tags associated with the harvest job.
  final Map<String, String>? tags;

  CreateHarvestJobResponse({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.createdAt,
    required this.destination,
    required this.harvestJobName,
    required this.harvestedManifests,
    required this.modifiedAt,
    required this.originEndpointName,
    required this.scheduleConfiguration,
    required this.status,
    this.description,
    this.eTag,
    this.errorMessage,
    this.tags,
  });

  factory CreateHarvestJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateHarvestJobResponse(
      arn: (json['Arn'] as String?) ?? '',
      channelGroupName: (json['ChannelGroupName'] as String?) ?? '',
      channelName: (json['ChannelName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      destination: Destination.fromJson(
          (json['Destination'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      harvestJobName: (json['HarvestJobName'] as String?) ?? '',
      harvestedManifests: HarvestedManifests.fromJson(
          (json['HarvestedManifests'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] ?? 0),
      originEndpointName: (json['OriginEndpointName'] as String?) ?? '',
      scheduleConfiguration: HarvesterScheduleConfiguration.fromJson(
          (json['ScheduleConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: HarvestJobStatus.fromString((json['Status'] as String?) ?? ''),
      description: json['Description'] as String?,
      eTag: json['ETag'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final createdAt = this.createdAt;
    final destination = this.destination;
    final harvestJobName = this.harvestJobName;
    final harvestedManifests = this.harvestedManifests;
    final modifiedAt = this.modifiedAt;
    final originEndpointName = this.originEndpointName;
    final scheduleConfiguration = this.scheduleConfiguration;
    final status = this.status;
    final description = this.description;
    final eTag = this.eTag;
    final errorMessage = this.errorMessage;
    final tags = this.tags;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'CreatedAt': unixTimestampToJson(createdAt),
      'Destination': destination,
      'HarvestJobName': harvestJobName,
      'HarvestedManifests': harvestedManifests,
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      'OriginEndpointName': originEndpointName,
      'ScheduleConfiguration': scheduleConfiguration,
      'Status': status.value,
      if (description != null) 'Description': description,
      if (eTag != null) 'ETag': eTag,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// The response object containing the details of the requested harvest job.
///
/// @nodoc
class GetHarvestJobResponse {
  /// The Amazon Resource Name (ARN) of the harvest job.
  final String arn;

  /// The name of the channel group containing the channel associated with the
  /// harvest job.
  final String channelGroupName;

  /// The name of the channel associated with the harvest job.
  final String channelName;

  /// The date and time when the harvest job was created.
  final DateTime createdAt;

  /// The S3 destination where the harvested content is being placed.
  final Destination destination;

  /// The name of the harvest job.
  final String harvestJobName;

  /// A list of manifests that are being or have been harvested.
  final HarvestedManifests harvestedManifests;

  /// The date and time when the harvest job was last modified.
  final DateTime modifiedAt;

  /// The name of the origin endpoint associated with the harvest job.
  final String originEndpointName;

  /// The configuration for when the harvest job is scheduled to run, including
  /// start and end times.
  final HarvesterScheduleConfiguration scheduleConfiguration;

  /// The current status of the harvest job (e.g., QUEUED, IN_PROGRESS, CANCELLED,
  /// COMPLETED, FAILED).
  final HarvestJobStatus status;

  /// The description of the harvest job, if provided.
  final String? description;

  /// The current version of the harvest job. Used for concurrency control.
  final String? eTag;

  /// An error message if the harvest job encountered any issues.
  final String? errorMessage;

  /// A collection of tags associated with the harvest job.
  final Map<String, String>? tags;

  GetHarvestJobResponse({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.createdAt,
    required this.destination,
    required this.harvestJobName,
    required this.harvestedManifests,
    required this.modifiedAt,
    required this.originEndpointName,
    required this.scheduleConfiguration,
    required this.status,
    this.description,
    this.eTag,
    this.errorMessage,
    this.tags,
  });

  factory GetHarvestJobResponse.fromJson(Map<String, dynamic> json) {
    return GetHarvestJobResponse(
      arn: (json['Arn'] as String?) ?? '',
      channelGroupName: (json['ChannelGroupName'] as String?) ?? '',
      channelName: (json['ChannelName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      destination: Destination.fromJson(
          (json['Destination'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      harvestJobName: (json['HarvestJobName'] as String?) ?? '',
      harvestedManifests: HarvestedManifests.fromJson(
          (json['HarvestedManifests'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] ?? 0),
      originEndpointName: (json['OriginEndpointName'] as String?) ?? '',
      scheduleConfiguration: HarvesterScheduleConfiguration.fromJson(
          (json['ScheduleConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: HarvestJobStatus.fromString((json['Status'] as String?) ?? ''),
      description: json['Description'] as String?,
      eTag: json['ETag'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final createdAt = this.createdAt;
    final destination = this.destination;
    final harvestJobName = this.harvestJobName;
    final harvestedManifests = this.harvestedManifests;
    final modifiedAt = this.modifiedAt;
    final originEndpointName = this.originEndpointName;
    final scheduleConfiguration = this.scheduleConfiguration;
    final status = this.status;
    final description = this.description;
    final eTag = this.eTag;
    final errorMessage = this.errorMessage;
    final tags = this.tags;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'CreatedAt': unixTimestampToJson(createdAt),
      'Destination': destination,
      'HarvestJobName': harvestJobName,
      'HarvestedManifests': harvestedManifests,
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      'OriginEndpointName': originEndpointName,
      'ScheduleConfiguration': scheduleConfiguration,
      'Status': status.value,
      if (description != null) 'Description': description,
      if (eTag != null) 'ETag': eTag,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class CancelHarvestJobResponse {
  CancelHarvestJobResponse();

  factory CancelHarvestJobResponse.fromJson(Map<String, dynamic> _) {
    return CancelHarvestJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The response object containing the list of harvest jobs that match the
/// specified criteria.
///
/// @nodoc
class ListHarvestJobsResponse {
  /// An array of harvest job objects that match the specified criteria.
  final List<HarvestJob>? items;

  /// A token used for pagination. Include this value in subsequent requests to
  /// retrieve the next set of results. If null, there are no more results to
  /// retrieve.
  final String? nextToken;

  ListHarvestJobsResponse({
    this.items,
    this.nextToken,
  });

  factory ListHarvestJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListHarvestJobsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => HarvestJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents a harvest job resource in MediaPackage v2, which is used to
/// export content from an origin endpoint to an S3 bucket.
///
/// @nodoc
class HarvestJob {
  /// The Amazon Resource Name (ARN) of the harvest job.
  final String arn;

  /// The name of the channel group containing the channel associated with this
  /// harvest job.
  final String channelGroupName;

  /// The name of the channel associated with this harvest job.
  final String channelName;

  /// The date and time when the harvest job was created.
  final DateTime createdAt;

  /// The S3 destination where the harvested content will be placed.
  final Destination destination;

  /// The name of the harvest job.
  final String harvestJobName;

  /// A list of manifests that are being or have been harvested.
  final HarvestedManifests harvestedManifests;

  /// The date and time when the harvest job was last modified.
  final DateTime modifiedAt;

  /// The name of the origin endpoint associated with this harvest job.
  final String originEndpointName;

  /// The configuration for when the harvest job is scheduled to run.
  final HarvesterScheduleConfiguration scheduleConfiguration;

  /// The current status of the harvest job (e.g., QUEUED, IN_PROGRESS, CANCELLED,
  /// COMPLETED, FAILED).
  final HarvestJobStatus status;

  /// An optional description of the harvest job.
  final String? description;

  /// The current version of the harvest job. Used for concurrency control.
  final String? eTag;

  /// An error message if the harvest job encountered any issues.
  final String? errorMessage;

  HarvestJob({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.createdAt,
    required this.destination,
    required this.harvestJobName,
    required this.harvestedManifests,
    required this.modifiedAt,
    required this.originEndpointName,
    required this.scheduleConfiguration,
    required this.status,
    this.description,
    this.eTag,
    this.errorMessage,
  });

  factory HarvestJob.fromJson(Map<String, dynamic> json) {
    return HarvestJob(
      arn: (json['Arn'] as String?) ?? '',
      channelGroupName: (json['ChannelGroupName'] as String?) ?? '',
      channelName: (json['ChannelName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      destination: Destination.fromJson(
          (json['Destination'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      harvestJobName: (json['HarvestJobName'] as String?) ?? '',
      harvestedManifests: HarvestedManifests.fromJson(
          (json['HarvestedManifests'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] ?? 0),
      originEndpointName: (json['OriginEndpointName'] as String?) ?? '',
      scheduleConfiguration: HarvesterScheduleConfiguration.fromJson(
          (json['ScheduleConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: HarvestJobStatus.fromString((json['Status'] as String?) ?? ''),
      description: json['Description'] as String?,
      eTag: json['ETag'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final createdAt = this.createdAt;
    final destination = this.destination;
    final harvestJobName = this.harvestJobName;
    final harvestedManifests = this.harvestedManifests;
    final modifiedAt = this.modifiedAt;
    final originEndpointName = this.originEndpointName;
    final scheduleConfiguration = this.scheduleConfiguration;
    final status = this.status;
    final description = this.description;
    final eTag = this.eTag;
    final errorMessage = this.errorMessage;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'CreatedAt': unixTimestampToJson(createdAt),
      'Destination': destination,
      'HarvestJobName': harvestJobName,
      'HarvestedManifests': harvestedManifests,
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      'OriginEndpointName': originEndpointName,
      'ScheduleConfiguration': scheduleConfiguration,
      'Status': status.value,
      if (description != null) 'Description': description,
      if (eTag != null) 'ETag': eTag,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

/// The configuration for the destination where the harvested content will be
/// exported.
///
/// @nodoc
class Destination {
  /// The configuration for exporting harvested content to an S3 bucket. This
  /// includes details such as the bucket name and destination path within the
  /// bucket.
  final S3DestinationConfig s3Destination;

  Destination({
    required this.s3Destination,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      s3Destination: S3DestinationConfig.fromJson(
          (json['S3Destination'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Destination = this.s3Destination;
    return {
      'S3Destination': s3Destination,
    };
  }
}

/// A collection of harvested manifests of different types.
///
/// @nodoc
class HarvestedManifests {
  /// A list of harvested DASH manifests.
  final List<HarvestedDashManifest>? dashManifests;

  /// A list of harvested HLS manifests.
  final List<HarvestedHlsManifest>? hlsManifests;

  /// A list of harvested Low-Latency HLS manifests.
  final List<HarvestedLowLatencyHlsManifest>? lowLatencyHlsManifests;

  HarvestedManifests({
    this.dashManifests,
    this.hlsManifests,
    this.lowLatencyHlsManifests,
  });

  factory HarvestedManifests.fromJson(Map<String, dynamic> json) {
    return HarvestedManifests(
      dashManifests: (json['DashManifests'] as List?)
          ?.nonNulls
          .map((e) => HarvestedDashManifest.fromJson(e as Map<String, dynamic>))
          .toList(),
      hlsManifests: (json['HlsManifests'] as List?)
          ?.nonNulls
          .map((e) => HarvestedHlsManifest.fromJson(e as Map<String, dynamic>))
          .toList(),
      lowLatencyHlsManifests: (json['LowLatencyHlsManifests'] as List?)
          ?.nonNulls
          .map((e) => HarvestedLowLatencyHlsManifest.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dashManifests = this.dashManifests;
    final hlsManifests = this.hlsManifests;
    final lowLatencyHlsManifests = this.lowLatencyHlsManifests;
    return {
      if (dashManifests != null) 'DashManifests': dashManifests,
      if (hlsManifests != null) 'HlsManifests': hlsManifests,
      if (lowLatencyHlsManifests != null)
        'LowLatencyHlsManifests': lowLatencyHlsManifests,
    };
  }
}

/// Defines the schedule configuration for a harvest job.
///
/// @nodoc
class HarvesterScheduleConfiguration {
  /// The end time for the harvest job.
  final DateTime endTime;

  /// The start time for the harvest job.
  final DateTime startTime;

  HarvesterScheduleConfiguration({
    required this.endTime,
    required this.startTime,
  });

  factory HarvesterScheduleConfiguration.fromJson(Map<String, dynamic> json) {
    return HarvesterScheduleConfiguration(
      endTime: nonNullableTimeStampFromJson(json['EndTime'] ?? 0),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      'EndTime': unixTimestampToJson(endTime),
      'StartTime': unixTimestampToJson(startTime),
    };
  }
}

/// @nodoc
class HarvestJobStatus {
  static const queued = HarvestJobStatus._('QUEUED');
  static const inProgress = HarvestJobStatus._('IN_PROGRESS');
  static const cancelled = HarvestJobStatus._('CANCELLED');
  static const completed = HarvestJobStatus._('COMPLETED');
  static const failed = HarvestJobStatus._('FAILED');

  final String value;

  const HarvestJobStatus._(this.value);

  static const values = [queued, inProgress, cancelled, completed, failed];

  static HarvestJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => HarvestJobStatus._(value));

  @override
  bool operator ==(other) => other is HarvestJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about a harvested Low-Latency HLS manifest.
///
/// @nodoc
class HarvestedLowLatencyHlsManifest {
  /// The name of the harvested Low-Latency HLS manifest.
  final String manifestName;

  HarvestedLowLatencyHlsManifest({
    required this.manifestName,
  });

  factory HarvestedLowLatencyHlsManifest.fromJson(Map<String, dynamic> json) {
    return HarvestedLowLatencyHlsManifest(
      manifestName: (json['ManifestName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    return {
      'ManifestName': manifestName,
    };
  }
}

/// Information about a harvested DASH manifest.
///
/// @nodoc
class HarvestedDashManifest {
  /// The name of the harvested DASH manifest.
  final String manifestName;

  HarvestedDashManifest({
    required this.manifestName,
  });

  factory HarvestedDashManifest.fromJson(Map<String, dynamic> json) {
    return HarvestedDashManifest(
      manifestName: (json['ManifestName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    return {
      'ManifestName': manifestName,
    };
  }
}

/// Information about a harvested HLS manifest.
///
/// @nodoc
class HarvestedHlsManifest {
  /// The name of the harvested HLS manifest.
  final String manifestName;

  HarvestedHlsManifest({
    required this.manifestName,
  });

  factory HarvestedHlsManifest.fromJson(Map<String, dynamic> json) {
    return HarvestedHlsManifest(
      manifestName: (json['ManifestName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    return {
      'ManifestName': manifestName,
    };
  }
}

/// Configuration parameters for where in an S3 bucket to place the harvested
/// content.
///
/// @nodoc
class S3DestinationConfig {
  /// The name of an S3 bucket within which harvested content will be exported.
  final String bucketName;

  /// The path within the specified S3 bucket where the harvested content will be
  /// placed.
  final String destinationPath;

  S3DestinationConfig({
    required this.bucketName,
    required this.destinationPath,
  });

  factory S3DestinationConfig.fromJson(Map<String, dynamic> json) {
    return S3DestinationConfig(
      bucketName: (json['BucketName'] as String?) ?? '',
      destinationPath: (json['DestinationPath'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final destinationPath = this.destinationPath;
    return {
      'BucketName': bucketName,
      'DestinationPath': destinationPath,
    };
  }
}

/// The settings to enable CDN authorization headers in MediaPackage.
///
/// @nodoc
class CdnAuthConfiguration {
  /// The ARN for the secret in Secrets Manager that your CDN uses for
  /// authorization to access the endpoint.
  final List<String> cdnIdentifierSecretArns;

  /// The ARN for the IAM role that gives MediaPackage read access to Secrets
  /// Manager and KMS for CDN authorization.
  final String secretsRoleArn;

  CdnAuthConfiguration({
    required this.cdnIdentifierSecretArns,
    required this.secretsRoleArn,
  });

  factory CdnAuthConfiguration.fromJson(Map<String, dynamic> json) {
    return CdnAuthConfiguration(
      cdnIdentifierSecretArns:
          ((json['CdnIdentifierSecretArns'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
      secretsRoleArn: (json['SecretsRoleArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final cdnIdentifierSecretArns = this.cdnIdentifierSecretArns;
    final secretsRoleArn = this.secretsRoleArn;
    return {
      'CdnIdentifierSecretArns': cdnIdentifierSecretArns,
      'SecretsRoleArn': secretsRoleArn,
    };
  }
}

/// The configuration of the origin endpoint.
///
/// @nodoc
class OriginEndpointListConfiguration {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The name that describes the channel. The name is the primary identifier for
  /// the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  final String channelName;

  /// The type of container attached to this origin endpoint. A container type is
  /// a file format that encapsulates one or more media streams, such as audio and
  /// video, into a single file.
  final ContainerType containerType;

  /// The name that describes the origin endpoint. The name is the primary
  /// identifier for the origin endpoint, and and must be unique for your account
  /// in the AWS Region and channel.
  final String originEndpointName;

  /// The date and time the origin endpoint was created.
  final DateTime? createdAt;

  /// A DASH manifest configuration.
  final List<ListDashManifestConfiguration>? dashManifests;

  /// Any descriptive information that you want to add to the origin endpoint for
  /// future identification purposes.
  final String? description;

  /// The failover settings for the endpoint.
  final ForceEndpointErrorConfiguration? forceEndpointErrorConfiguration;

  /// An HTTP live streaming (HLS) manifest configuration.
  final List<ListHlsManifestConfiguration>? hlsManifests;

  /// A low-latency HLS manifest configuration.
  final List<ListLowLatencyHlsManifestConfiguration>? lowLatencyHlsManifests;

  /// The date and time the origin endpoint was modified.
  final DateTime? modifiedAt;

  /// A list of Microsoft Smooth Streaming (MSS) manifest configurations
  /// associated with the origin endpoint. Each configuration represents a
  /// different MSS streaming option available from this endpoint.
  final List<ListMssManifestConfiguration>? mssManifests;

  /// The separator character used in generated URIs for this origin endpoint.
  final UriSeparator? uriSeparator;

  OriginEndpointListConfiguration({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.containerType,
    required this.originEndpointName,
    this.createdAt,
    this.dashManifests,
    this.description,
    this.forceEndpointErrorConfiguration,
    this.hlsManifests,
    this.lowLatencyHlsManifests,
    this.modifiedAt,
    this.mssManifests,
    this.uriSeparator,
  });

  factory OriginEndpointListConfiguration.fromJson(Map<String, dynamic> json) {
    return OriginEndpointListConfiguration(
      arn: (json['Arn'] as String?) ?? '',
      channelGroupName: (json['ChannelGroupName'] as String?) ?? '',
      channelName: (json['ChannelName'] as String?) ?? '',
      containerType:
          ContainerType.fromString((json['ContainerType'] as String?) ?? ''),
      originEndpointName: (json['OriginEndpointName'] as String?) ?? '',
      createdAt: timeStampFromJson(json['CreatedAt']),
      dashManifests: (json['DashManifests'] as List?)
          ?.nonNulls
          .map((e) =>
              ListDashManifestConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['Description'] as String?,
      forceEndpointErrorConfiguration:
          json['ForceEndpointErrorConfiguration'] != null
              ? ForceEndpointErrorConfiguration.fromJson(
                  json['ForceEndpointErrorConfiguration']
                      as Map<String, dynamic>)
              : null,
      hlsManifests: (json['HlsManifests'] as List?)
          ?.nonNulls
          .map((e) =>
              ListHlsManifestConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      lowLatencyHlsManifests: (json['LowLatencyHlsManifests'] as List?)
          ?.nonNulls
          .map((e) => ListLowLatencyHlsManifestConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      modifiedAt: timeStampFromJson(json['ModifiedAt']),
      mssManifests: (json['MssManifests'] as List?)
          ?.nonNulls
          .map((e) =>
              ListMssManifestConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      uriSeparator:
          (json['UriSeparator'] as String?)?.let(UriSeparator.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final containerType = this.containerType;
    final originEndpointName = this.originEndpointName;
    final createdAt = this.createdAt;
    final dashManifests = this.dashManifests;
    final description = this.description;
    final forceEndpointErrorConfiguration =
        this.forceEndpointErrorConfiguration;
    final hlsManifests = this.hlsManifests;
    final lowLatencyHlsManifests = this.lowLatencyHlsManifests;
    final modifiedAt = this.modifiedAt;
    final mssManifests = this.mssManifests;
    final uriSeparator = this.uriSeparator;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'ContainerType': containerType.value,
      'OriginEndpointName': originEndpointName,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (dashManifests != null) 'DashManifests': dashManifests,
      if (description != null) 'Description': description,
      if (forceEndpointErrorConfiguration != null)
        'ForceEndpointErrorConfiguration': forceEndpointErrorConfiguration,
      if (hlsManifests != null) 'HlsManifests': hlsManifests,
      if (lowLatencyHlsManifests != null)
        'LowLatencyHlsManifests': lowLatencyHlsManifests,
      if (modifiedAt != null) 'ModifiedAt': unixTimestampToJson(modifiedAt),
      if (mssManifests != null) 'MssManifests': mssManifests,
      if (uriSeparator != null) 'UriSeparator': uriSeparator.value,
    };
  }
}

/// @nodoc
class ContainerType {
  static const ts = ContainerType._('TS');
  static const cmaf = ContainerType._('CMAF');
  static const ism = ContainerType._('ISM');

  final String value;

  const ContainerType._(this.value);

  static const values = [ts, cmaf, ism];

  static ContainerType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ContainerType._(value));

  @override
  bool operator ==(other) => other is ContainerType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The failover settings for the endpoint.
///
/// @nodoc
class ForceEndpointErrorConfiguration {
  /// The failover conditions for the endpoint. The options are:
  ///
  /// <ul>
  /// <li>
  /// <code>STALE_MANIFEST</code> - The manifest stalled and there are no new
  /// segments or parts.
  /// </li>
  /// <li>
  /// <code>INCOMPLETE_MANIFEST</code> - There is a gap in the manifest.
  /// </li>
  /// <li>
  /// <code>MISSING_DRM_KEY</code> - Key rotation is enabled but we're unable to
  /// fetch the key for the current key period.
  /// </li>
  /// <li>
  /// <code>SLATE_INPUT</code> - The segments which contain slate content are
  /// considered to be missing content.
  /// </li>
  /// </ul>
  final List<EndpointErrorCondition>? endpointErrorConditions;

  ForceEndpointErrorConfiguration({
    this.endpointErrorConditions,
  });

  factory ForceEndpointErrorConfiguration.fromJson(Map<String, dynamic> json) {
    return ForceEndpointErrorConfiguration(
      endpointErrorConditions: (json['EndpointErrorConditions'] as List?)
          ?.nonNulls
          .map((e) => EndpointErrorCondition.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final endpointErrorConditions = this.endpointErrorConditions;
    return {
      if (endpointErrorConditions != null)
        'EndpointErrorConditions':
            endpointErrorConditions.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class UriSeparator {
  static const underscore = UriSeparator._('UNDERSCORE');
  static const hyphen = UriSeparator._('HYPHEN');

  final String value;

  const UriSeparator._(this.value);

  static const values = [underscore, hyphen];

  static UriSeparator fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => UriSeparator._(value));

  @override
  bool operator ==(other) => other is UriSeparator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EndpointErrorCondition {
  static const staleManifest = EndpointErrorCondition._('STALE_MANIFEST');
  static const incompleteManifest =
      EndpointErrorCondition._('INCOMPLETE_MANIFEST');
  static const missingDrmKey = EndpointErrorCondition._('MISSING_DRM_KEY');
  static const slateInput = EndpointErrorCondition._('SLATE_INPUT');

  final String value;

  const EndpointErrorCondition._(this.value);

  static const values = [
    staleManifest,
    incompleteManifest,
    missingDrmKey,
    slateInput
  ];

  static EndpointErrorCondition fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EndpointErrorCondition._(value));

  @override
  bool operator ==(other) =>
      other is EndpointErrorCondition && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about a Microsoft Smooth Streaming (MSS) manifest
/// configuration. This provides key details about the MSS manifest without
/// including all configuration parameters.
///
/// @nodoc
class ListMssManifestConfiguration {
  /// The name of the MSS manifest configuration.
  final String manifestName;

  /// The URL for accessing the MSS manifest.
  final String? url;

  ListMssManifestConfiguration({
    required this.manifestName,
    this.url,
  });

  factory ListMssManifestConfiguration.fromJson(Map<String, dynamic> json) {
    return ListMssManifestConfiguration(
      manifestName: (json['ManifestName'] as String?) ?? '',
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final url = this.url;
    return {
      'ManifestName': manifestName,
      if (url != null) 'Url': url,
    };
  }
}

/// List the DASH manifest configuration.
///
/// @nodoc
class ListDashManifestConfiguration {
  /// A short string that's appended to the endpoint URL. The manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default manifest name, index.
  final String manifestName;

  /// The egress domain URL for stream delivery from MediaPackage.
  final String? url;

  ListDashManifestConfiguration({
    required this.manifestName,
    this.url,
  });

  factory ListDashManifestConfiguration.fromJson(Map<String, dynamic> json) {
    return ListDashManifestConfiguration(
      manifestName: (json['ManifestName'] as String?) ?? '',
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final url = this.url;
    return {
      'ManifestName': manifestName,
      if (url != null) 'Url': url,
    };
  }
}

/// List the low-latency HTTP live streaming (HLS) manifest configuration.
///
/// @nodoc
class ListLowLatencyHlsManifestConfiguration {
  /// A short short string that's appended to the endpoint URL. The manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default manifest name, index. MediaPackage
  /// automatically inserts the format extension, such as .m3u8. You can't use the
  /// same manifest name if you use HLS manifest and low-latency HLS manifest. The
  /// manifestName on the HLSManifest object overrides the manifestName you
  /// provided on the originEndpoint object.
  final String manifestName;

  /// A short string that's appended to the endpoint URL. The child manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default child manifest name, index_1. The manifestName
  /// on the HLSManifest object overrides the manifestName you provided on the
  /// originEndpoint object.
  final String? childManifestName;

  /// The egress domain URL for stream delivery from MediaPackage.
  final String? url;

  ListLowLatencyHlsManifestConfiguration({
    required this.manifestName,
    this.childManifestName,
    this.url,
  });

  factory ListLowLatencyHlsManifestConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ListLowLatencyHlsManifestConfiguration(
      manifestName: (json['ManifestName'] as String?) ?? '',
      childManifestName: json['ChildManifestName'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final childManifestName = this.childManifestName;
    final url = this.url;
    return {
      'ManifestName': manifestName,
      if (childManifestName != null) 'ChildManifestName': childManifestName,
      if (url != null) 'Url': url,
    };
  }
}

/// List the HTTP live streaming (HLS) manifest configuration.
///
/// @nodoc
class ListHlsManifestConfiguration {
  /// A short short string that's appended to the endpoint URL. The manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default manifest name, index. MediaPackage
  /// automatically inserts the format extension, such as .m3u8. You can't use the
  /// same manifest name if you use HLS manifest and low-latency HLS manifest. The
  /// manifestName on the HLSManifest object overrides the manifestName you
  /// provided on the originEndpoint object.
  final String manifestName;

  /// A short string that's appended to the endpoint URL. The child manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default child manifest name, index_1. The manifestName
  /// on the HLSManifest object overrides the manifestName you provided on the
  /// originEndpoint object.
  final String? childManifestName;

  /// The egress domain URL for stream delivery from MediaPackage.
  final String? url;

  ListHlsManifestConfiguration({
    required this.manifestName,
    this.childManifestName,
    this.url,
  });

  factory ListHlsManifestConfiguration.fromJson(Map<String, dynamic> json) {
    return ListHlsManifestConfiguration(
      manifestName: (json['ManifestName'] as String?) ?? '',
      childManifestName: json['ChildManifestName'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final childManifestName = this.childManifestName;
    final url = this.url;
    return {
      'ManifestName': manifestName,
      if (childManifestName != null) 'ChildManifestName': childManifestName,
      if (url != null) 'Url': url,
    };
  }
}

/// The segment configuration, including the segment name, duration, and other
/// configuration values.
///
/// @nodoc
class Segment {
  final Encryption? encryption;

  /// When selected, the stream set includes an additional I-frame only stream,
  /// along with the other tracks. If false, this extra stream is not included.
  /// MediaPackage generates an I-frame only stream from the first rendition in
  /// the manifest. The service inserts EXT-I-FRAMES-ONLY tags in the output
  /// manifest, and then generates and includes an I-frames only playlist in the
  /// stream. This playlist permits player functionality like fast forward and
  /// rewind.
  final bool? includeIframeOnlyStreams;

  /// The SCTE configuration options in the segment settings.
  final Scte? scte;

  /// The duration (in seconds) of each segment. Enter a value equal to, or a
  /// multiple of, the input segment duration. If the value that you enter is
  /// different from the input segment duration, MediaPackage rounds segments to
  /// the nearest multiple of the input segment duration.
  final int? segmentDurationSeconds;

  /// The name that describes the segment. The name is the base name of the
  /// segment used in all content manifests inside of the endpoint. You can't use
  /// spaces in the name.
  final String? segmentName;

  /// By default, MediaPackage excludes all digital video broadcasting (DVB)
  /// subtitles from the output. When selected, MediaPackage passes through DVB
  /// subtitles into the output.
  final bool? tsIncludeDvbSubtitles;

  /// When selected, MediaPackage bundles all audio tracks in a rendition group.
  /// All other tracks in the stream can be used with any audio rendition from the
  /// group.
  final bool? tsUseAudioRenditionGroup;

  Segment({
    this.encryption,
    this.includeIframeOnlyStreams,
    this.scte,
    this.segmentDurationSeconds,
    this.segmentName,
    this.tsIncludeDvbSubtitles,
    this.tsUseAudioRenditionGroup,
  });

  factory Segment.fromJson(Map<String, dynamic> json) {
    return Segment(
      encryption: json['Encryption'] != null
          ? Encryption.fromJson(json['Encryption'] as Map<String, dynamic>)
          : null,
      includeIframeOnlyStreams: json['IncludeIframeOnlyStreams'] as bool?,
      scte: json['Scte'] != null
          ? Scte.fromJson(json['Scte'] as Map<String, dynamic>)
          : null,
      segmentDurationSeconds: json['SegmentDurationSeconds'] as int?,
      segmentName: json['SegmentName'] as String?,
      tsIncludeDvbSubtitles: json['TsIncludeDvbSubtitles'] as bool?,
      tsUseAudioRenditionGroup: json['TsUseAudioRenditionGroup'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryption = this.encryption;
    final includeIframeOnlyStreams = this.includeIframeOnlyStreams;
    final scte = this.scte;
    final segmentDurationSeconds = this.segmentDurationSeconds;
    final segmentName = this.segmentName;
    final tsIncludeDvbSubtitles = this.tsIncludeDvbSubtitles;
    final tsUseAudioRenditionGroup = this.tsUseAudioRenditionGroup;
    return {
      if (encryption != null) 'Encryption': encryption,
      if (includeIframeOnlyStreams != null)
        'IncludeIframeOnlyStreams': includeIframeOnlyStreams,
      if (scte != null) 'Scte': scte,
      if (segmentDurationSeconds != null)
        'SegmentDurationSeconds': segmentDurationSeconds,
      if (segmentName != null) 'SegmentName': segmentName,
      if (tsIncludeDvbSubtitles != null)
        'TsIncludeDvbSubtitles': tsIncludeDvbSubtitles,
      if (tsUseAudioRenditionGroup != null)
        'TsUseAudioRenditionGroup': tsUseAudioRenditionGroup,
    };
  }
}

/// Retrieve the DASH manifest configuration.
///
/// @nodoc
class GetDashManifestConfiguration {
  /// A short string that's appended to the endpoint URL. The manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default manifest name, index.
  final String manifestName;

  /// The egress domain URL for stream delivery from MediaPackage.
  final String url;

  /// The configuration for the DASH <code>availabilityStartTime</code> attribute
  /// of the Media Presentation Description (MPD).
  final DashAvailabilityStartTimeConfiguration?
      availabilityStartTimeConfiguration;

  /// The base URL to use for retrieving segments.
  final List<DashBaseUrl>? baseUrls;

  /// The layout of the DASH manifest that MediaPackage produces.
  /// <code>STANDARD</code> indicates a default manifest, which is compacted.
  /// <code>NONE</code> indicates a full manifest.
  final DashCompactness? compactness;

  /// Determines how the DASH manifest signals the DRM content.
  final DashDrmSignaling? drmSignaling;

  /// For endpoints that use the DVB-DASH profile only. The font download and
  /// error reporting information that you want MediaPackage to pass through to
  /// the manifest.
  final DashDvbSettings? dvbSettings;
  final FilterConfiguration? filterConfiguration;

  /// The total duration (in seconds) of the manifest's content.
  final int? manifestWindowSeconds;

  /// Minimum amount of content (in seconds) that a player must keep available in
  /// the buffer.
  final int? minBufferTimeSeconds;

  /// Minimum amount of time (in seconds) that the player should wait before
  /// requesting updates to the manifest.
  final int? minUpdatePeriodSeconds;

  /// A list of triggers that controls when AWS Elemental MediaPackage separates
  /// the MPEG-DASH manifest into multiple periods. Leave this value empty to
  /// indicate that the manifest is contained all in one period. For more
  /// information about periods in the DASH manifest, see <a
  /// href="https://docs.aws.amazon.com/mediapackage/latest/userguide/multi-period.html">Multi-period
  /// DASH in AWS Elemental MediaPackage</a>.
  final List<DashPeriodTrigger>? periodTriggers;

  /// The profile that the output is compliant with.
  final List<DashProfile>? profiles;

  /// Details about the content that you want MediaPackage to pass through in the
  /// manifest to the playback device.
  final DashProgramInformation? programInformation;

  /// The SCTE configuration.
  final ScteDash? scteDash;

  /// Determines the type of variable used in the <code>media</code> URL of the
  /// <code>SegmentTemplate</code> tag in the manifest. Also specifies if segment
  /// timeline information is included in <code>SegmentTimeline</code> or
  /// <code>SegmentTemplate</code>.
  ///
  /// Value description:
  ///
  /// <ul>
  /// <li>
  /// <code>NUMBER_WITH_TIMELINE</code> - The <code>$Number$</code> variable is
  /// used in the <code>media</code> URL. The value of this variable is the
  /// sequential number of the segment. A full <code>SegmentTimeline</code> object
  /// is presented in each <code>SegmentTemplate</code>.
  /// </li>
  /// </ul>
  final DashSegmentTemplateFormat? segmentTemplateFormat;

  /// The configuration for DASH subtitles.
  final DashSubtitleConfiguration? subtitleConfiguration;

  /// The amount of time (in seconds) that the player should be from the end of
  /// the manifest.
  final int? suggestedPresentationDelaySeconds;

  /// The type of path used in manifest URIs. <code>LEAF</code> indicates
  /// leaf-relative paths. <code>ROOT</code> indicates root-relative paths that
  /// include the full path from root.
  final UriPathType? uriPathType;

  /// Determines the type of UTC timing included in the DASH Media Presentation
  /// Description (MPD).
  final DashUtcTiming? utcTiming;

  GetDashManifestConfiguration({
    required this.manifestName,
    required this.url,
    this.availabilityStartTimeConfiguration,
    this.baseUrls,
    this.compactness,
    this.drmSignaling,
    this.dvbSettings,
    this.filterConfiguration,
    this.manifestWindowSeconds,
    this.minBufferTimeSeconds,
    this.minUpdatePeriodSeconds,
    this.periodTriggers,
    this.profiles,
    this.programInformation,
    this.scteDash,
    this.segmentTemplateFormat,
    this.subtitleConfiguration,
    this.suggestedPresentationDelaySeconds,
    this.uriPathType,
    this.utcTiming,
  });

  factory GetDashManifestConfiguration.fromJson(Map<String, dynamic> json) {
    return GetDashManifestConfiguration(
      manifestName: (json['ManifestName'] as String?) ?? '',
      url: (json['Url'] as String?) ?? '',
      availabilityStartTimeConfiguration:
          json['AvailabilityStartTimeConfiguration'] != null
              ? DashAvailabilityStartTimeConfiguration.fromJson(
                  json['AvailabilityStartTimeConfiguration']
                      as Map<String, dynamic>)
              : null,
      baseUrls: (json['BaseUrls'] as List?)
          ?.nonNulls
          .map((e) => DashBaseUrl.fromJson(e as Map<String, dynamic>))
          .toList(),
      compactness:
          (json['Compactness'] as String?)?.let(DashCompactness.fromString),
      drmSignaling:
          (json['DrmSignaling'] as String?)?.let(DashDrmSignaling.fromString),
      dvbSettings: json['DvbSettings'] != null
          ? DashDvbSettings.fromJson(
              json['DvbSettings'] as Map<String, dynamic>)
          : null,
      filterConfiguration: json['FilterConfiguration'] != null
          ? FilterConfiguration.fromJson(
              json['FilterConfiguration'] as Map<String, dynamic>)
          : null,
      manifestWindowSeconds: json['ManifestWindowSeconds'] as int?,
      minBufferTimeSeconds: json['MinBufferTimeSeconds'] as int?,
      minUpdatePeriodSeconds: json['MinUpdatePeriodSeconds'] as int?,
      periodTriggers: (json['PeriodTriggers'] as List?)
          ?.nonNulls
          .map((e) => DashPeriodTrigger.fromString((e as String)))
          .toList(),
      profiles: (json['Profiles'] as List?)
          ?.nonNulls
          .map((e) => DashProfile.fromString((e as String)))
          .toList(),
      programInformation: json['ProgramInformation'] != null
          ? DashProgramInformation.fromJson(
              json['ProgramInformation'] as Map<String, dynamic>)
          : null,
      scteDash: json['ScteDash'] != null
          ? ScteDash.fromJson(json['ScteDash'] as Map<String, dynamic>)
          : null,
      segmentTemplateFormat: (json['SegmentTemplateFormat'] as String?)
          ?.let(DashSegmentTemplateFormat.fromString),
      subtitleConfiguration: json['SubtitleConfiguration'] != null
          ? DashSubtitleConfiguration.fromJson(
              json['SubtitleConfiguration'] as Map<String, dynamic>)
          : null,
      suggestedPresentationDelaySeconds:
          json['SuggestedPresentationDelaySeconds'] as int?,
      uriPathType:
          (json['UriPathType'] as String?)?.let(UriPathType.fromString),
      utcTiming: json['UtcTiming'] != null
          ? DashUtcTiming.fromJson(json['UtcTiming'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final url = this.url;
    final availabilityStartTimeConfiguration =
        this.availabilityStartTimeConfiguration;
    final baseUrls = this.baseUrls;
    final compactness = this.compactness;
    final drmSignaling = this.drmSignaling;
    final dvbSettings = this.dvbSettings;
    final filterConfiguration = this.filterConfiguration;
    final manifestWindowSeconds = this.manifestWindowSeconds;
    final minBufferTimeSeconds = this.minBufferTimeSeconds;
    final minUpdatePeriodSeconds = this.minUpdatePeriodSeconds;
    final periodTriggers = this.periodTriggers;
    final profiles = this.profiles;
    final programInformation = this.programInformation;
    final scteDash = this.scteDash;
    final segmentTemplateFormat = this.segmentTemplateFormat;
    final subtitleConfiguration = this.subtitleConfiguration;
    final suggestedPresentationDelaySeconds =
        this.suggestedPresentationDelaySeconds;
    final uriPathType = this.uriPathType;
    final utcTiming = this.utcTiming;
    return {
      'ManifestName': manifestName,
      'Url': url,
      if (availabilityStartTimeConfiguration != null)
        'AvailabilityStartTimeConfiguration':
            availabilityStartTimeConfiguration,
      if (baseUrls != null) 'BaseUrls': baseUrls,
      if (compactness != null) 'Compactness': compactness.value,
      if (drmSignaling != null) 'DrmSignaling': drmSignaling.value,
      if (dvbSettings != null) 'DvbSettings': dvbSettings,
      if (filterConfiguration != null)
        'FilterConfiguration': filterConfiguration,
      if (manifestWindowSeconds != null)
        'ManifestWindowSeconds': manifestWindowSeconds,
      if (minBufferTimeSeconds != null)
        'MinBufferTimeSeconds': minBufferTimeSeconds,
      if (minUpdatePeriodSeconds != null)
        'MinUpdatePeriodSeconds': minUpdatePeriodSeconds,
      if (periodTriggers != null)
        'PeriodTriggers': periodTriggers.map((e) => e.value).toList(),
      if (profiles != null) 'Profiles': profiles.map((e) => e.value).toList(),
      if (programInformation != null) 'ProgramInformation': programInformation,
      if (scteDash != null) 'ScteDash': scteDash,
      if (segmentTemplateFormat != null)
        'SegmentTemplateFormat': segmentTemplateFormat.value,
      if (subtitleConfiguration != null)
        'SubtitleConfiguration': subtitleConfiguration,
      if (suggestedPresentationDelaySeconds != null)
        'SuggestedPresentationDelaySeconds': suggestedPresentationDelaySeconds,
      if (uriPathType != null) 'UriPathType': uriPathType.value,
      if (utcTiming != null) 'UtcTiming': utcTiming,
    };
  }
}

/// Filter configuration includes settings for manifest filtering, start and end
/// times, and time delay that apply to all of your egress requests for this
/// manifest.
///
/// @nodoc
class FilterConfiguration {
  /// Optionally specify the clip start time for all of your manifest egress
  /// requests. When you include clip start time, note that you cannot use clip
  /// start time query parameters for this manifest's endpoint URL.
  final DateTime? clipStartTime;

  /// Optionally specify one or more DRM settings for all of your manifest egress
  /// requests. When you include a DRM setting, note that you cannot use an
  /// identical DRM setting query parameter for this manifest's endpoint URL.
  final String? drmSettings;

  /// Optionally specify the end time for all of your manifest egress requests.
  /// When you include end time, note that you cannot use end time query
  /// parameters for this manifest's endpoint URL.
  final DateTime? end;

  /// Optionally specify one or more manifest filters for all of your manifest
  /// egress requests. When you include a manifest filter, note that you cannot
  /// use an identical manifest filter query parameter for this manifest's
  /// endpoint URL.
  final String? manifestFilter;

  /// Optionally specify the start time for all of your manifest egress requests.
  /// When you include start time, note that you cannot use start time query
  /// parameters for this manifest's endpoint URL.
  final DateTime? start;

  /// Optionally specify the time delay for all of your manifest egress requests.
  /// Enter a value that is smaller than your endpoint's startover window. When
  /// you include time delay, note that you cannot use time delay query parameters
  /// for this manifest's endpoint URL.
  final int? timeDelaySeconds;

  FilterConfiguration({
    this.clipStartTime,
    this.drmSettings,
    this.end,
    this.manifestFilter,
    this.start,
    this.timeDelaySeconds,
  });

  factory FilterConfiguration.fromJson(Map<String, dynamic> json) {
    return FilterConfiguration(
      clipStartTime: timeStampFromJson(json['ClipStartTime']),
      drmSettings: json['DrmSettings'] as String?,
      end: timeStampFromJson(json['End']),
      manifestFilter: json['ManifestFilter'] as String?,
      start: timeStampFromJson(json['Start']),
      timeDelaySeconds: json['TimeDelaySeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final clipStartTime = this.clipStartTime;
    final drmSettings = this.drmSettings;
    final end = this.end;
    final manifestFilter = this.manifestFilter;
    final start = this.start;
    final timeDelaySeconds = this.timeDelaySeconds;
    return {
      if (clipStartTime != null)
        'ClipStartTime': unixTimestampToJson(clipStartTime),
      if (drmSettings != null) 'DrmSettings': drmSettings,
      if (end != null) 'End': unixTimestampToJson(end),
      if (manifestFilter != null) 'ManifestFilter': manifestFilter,
      if (start != null) 'Start': unixTimestampToJson(start),
      if (timeDelaySeconds != null) 'TimeDelaySeconds': timeDelaySeconds,
    };
  }
}

/// @nodoc
class DashSegmentTemplateFormat {
  static const numberWithTimeline =
      DashSegmentTemplateFormat._('NUMBER_WITH_TIMELINE');

  final String value;

  const DashSegmentTemplateFormat._(this.value);

  static const values = [numberWithTimeline];

  static DashSegmentTemplateFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DashSegmentTemplateFormat._(value));

  @override
  bool operator ==(other) =>
      other is DashSegmentTemplateFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The SCTE configuration.
///
/// @nodoc
class ScteDash {
  /// Choose how ad markers are included in the packaged content. If you include
  /// ad markers in the content stream in your upstream encoders, then you need to
  /// inform MediaPackage what to do with the ad markers in the output.
  ///
  /// Value description:
  ///
  /// <ul>
  /// <li>
  /// <code>Binary</code> - The SCTE-35 marker is expressed as a hex-string
  /// (Base64 string) rather than full XML.
  /// </li>
  /// <li>
  /// <code>XML</code> - The SCTE marker is expressed fully in XML.
  /// </li>
  /// </ul>
  final AdMarkerDash? adMarkerDash;

  /// Controls which SCTE-35 events appear in DASH manifests. <code>ALL</code>
  /// includes all non-implicit SCTE-35 events. <code>MATCHES_FILTER</code>
  /// includes only events whose type matches the configured
  /// <code>ScteFilter</code>.
  ///
  /// If you don't specify a value, the default is <code>ALL</code>.
  final ScteInManifests? scteInManifests;

  ScteDash({
    this.adMarkerDash,
    this.scteInManifests,
  });

  factory ScteDash.fromJson(Map<String, dynamic> json) {
    return ScteDash(
      adMarkerDash:
          (json['AdMarkerDash'] as String?)?.let(AdMarkerDash.fromString),
      scteInManifests:
          (json['ScteInManifests'] as String?)?.let(ScteInManifests.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final adMarkerDash = this.adMarkerDash;
    final scteInManifests = this.scteInManifests;
    return {
      if (adMarkerDash != null) 'AdMarkerDash': adMarkerDash.value,
      if (scteInManifests != null) 'ScteInManifests': scteInManifests.value,
    };
  }
}

/// @nodoc
class DashDrmSignaling {
  static const individual = DashDrmSignaling._('INDIVIDUAL');
  static const referenced = DashDrmSignaling._('REFERENCED');

  final String value;

  const DashDrmSignaling._(this.value);

  static const values = [individual, referenced];

  static DashDrmSignaling fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DashDrmSignaling._(value));

  @override
  bool operator ==(other) => other is DashDrmSignaling && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Determines the type of UTC timing included in the DASH Media Presentation
/// Description (MPD).
///
/// @nodoc
class DashUtcTiming {
  /// The UTC timing mode.
  final DashUtcTimingMode? timingMode;

  /// The the method that the player uses to synchronize to coordinated universal
  /// time (UTC) wall clock time.
  final String? timingSource;

  DashUtcTiming({
    this.timingMode,
    this.timingSource,
  });

  factory DashUtcTiming.fromJson(Map<String, dynamic> json) {
    return DashUtcTiming(
      timingMode:
          (json['TimingMode'] as String?)?.let(DashUtcTimingMode.fromString),
      timingSource: json['TimingSource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final timingMode = this.timingMode;
    final timingSource = this.timingSource;
    return {
      if (timingMode != null) 'TimingMode': timingMode.value,
      if (timingSource != null) 'TimingSource': timingSource,
    };
  }
}

/// Details about the content that you want MediaPackage to pass through in the
/// manifest to the playback device.
///
/// @nodoc
class DashProgramInformation {
  /// A copyright statement about the content.
  final String? copyright;

  /// The language code for this manifest.
  final String? languageCode;

  /// An absolute URL that contains more information about this content.
  final String? moreInformationUrl;

  /// Information about the content provider.
  final String? source;

  /// The title for the manifest.
  final String? title;

  DashProgramInformation({
    this.copyright,
    this.languageCode,
    this.moreInformationUrl,
    this.source,
    this.title,
  });

  factory DashProgramInformation.fromJson(Map<String, dynamic> json) {
    return DashProgramInformation(
      copyright: json['Copyright'] as String?,
      languageCode: json['LanguageCode'] as String?,
      moreInformationUrl: json['MoreInformationUrl'] as String?,
      source: json['Source'] as String?,
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final copyright = this.copyright;
    final languageCode = this.languageCode;
    final moreInformationUrl = this.moreInformationUrl;
    final source = this.source;
    final title = this.title;
    return {
      if (copyright != null) 'Copyright': copyright,
      if (languageCode != null) 'LanguageCode': languageCode,
      if (moreInformationUrl != null) 'MoreInformationUrl': moreInformationUrl,
      if (source != null) 'Source': source,
      if (title != null) 'Title': title,
    };
  }
}

/// For endpoints that use the DVB-DASH profile only. The font download and
/// error reporting information that you want MediaPackage to pass through to
/// the manifest.
///
/// @nodoc
class DashDvbSettings {
  /// Playback device error reporting settings.
  final List<DashDvbMetricsReporting>? errorMetrics;

  /// Subtitle font settings.
  final DashDvbFontDownload? fontDownload;

  DashDvbSettings({
    this.errorMetrics,
    this.fontDownload,
  });

  factory DashDvbSettings.fromJson(Map<String, dynamic> json) {
    return DashDvbSettings(
      errorMetrics: (json['ErrorMetrics'] as List?)
          ?.nonNulls
          .map((e) =>
              DashDvbMetricsReporting.fromJson(e as Map<String, dynamic>))
          .toList(),
      fontDownload: json['FontDownload'] != null
          ? DashDvbFontDownload.fromJson(
              json['FontDownload'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final errorMetrics = this.errorMetrics;
    final fontDownload = this.fontDownload;
    return {
      if (errorMetrics != null) 'ErrorMetrics': errorMetrics,
      if (fontDownload != null) 'FontDownload': fontDownload,
    };
  }
}

/// @nodoc
class DashCompactness {
  static const standard = DashCompactness._('STANDARD');
  static const none = DashCompactness._('NONE');

  final String value;

  const DashCompactness._(this.value);

  static const values = [standard, none];

  static DashCompactness fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DashCompactness._(value));

  @override
  bool operator ==(other) => other is DashCompactness && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration for DASH subtitles.
///
/// @nodoc
class DashSubtitleConfiguration {
  /// Settings for TTML subtitles.
  final DashTtmlConfiguration? ttmlConfiguration;

  DashSubtitleConfiguration({
    this.ttmlConfiguration,
  });

  factory DashSubtitleConfiguration.fromJson(Map<String, dynamic> json) {
    return DashSubtitleConfiguration(
      ttmlConfiguration: json['TtmlConfiguration'] != null
          ? DashTtmlConfiguration.fromJson(
              json['TtmlConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ttmlConfiguration = this.ttmlConfiguration;
    return {
      if (ttmlConfiguration != null) 'TtmlConfiguration': ttmlConfiguration,
    };
  }
}

/// @nodoc
class UriPathType {
  static const leaf = UriPathType._('LEAF');
  static const root = UriPathType._('ROOT');

  final String value;

  const UriPathType._(this.value);

  static const values = [leaf, root];

  static UriPathType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => UriPathType._(value));

  @override
  bool operator ==(other) => other is UriPathType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration for the DASH <code>availabilityStartTime</code> attribute
/// of the Media Presentation Description (MPD). Use this configuration to set a
/// custom availability start time for your DASH manifest.
///
/// @nodoc
class DashAvailabilityStartTimeConfiguration {
  /// The fixed availability start time for the DASH manifest, in ISO 8601
  /// date-time format. The value must have hourly granularity, meaning that the
  /// minutes, seconds, and fractional seconds must be zero. The value must be on
  /// or after <code>2024-01-01T00:00:00Z</code> and must be at least 14 days
  /// before the current time.
  final DateTime? fixedAvailabilityStartTime;

  DashAvailabilityStartTimeConfiguration({
    this.fixedAvailabilityStartTime,
  });

  factory DashAvailabilityStartTimeConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DashAvailabilityStartTimeConfiguration(
      fixedAvailabilityStartTime:
          timeStampFromJson(json['FixedAvailabilityStartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final fixedAvailabilityStartTime = this.fixedAvailabilityStartTime;
    return {
      if (fixedAvailabilityStartTime != null)
        'FixedAvailabilityStartTime': iso8601ToJson(fixedAvailabilityStartTime),
    };
  }
}

/// The settings for TTML subtitles.
///
/// @nodoc
class DashTtmlConfiguration {
  /// The profile that MediaPackage uses when signaling subtitles in the manifest.
  /// <code>IMSC</code> is the default profile. <code>EBU-TT-D</code> produces
  /// subtitles that are compliant with the EBU-TT-D TTML profile. MediaPackage
  /// passes through subtitle styles to the manifest. For more information about
  /// EBU-TT-D subtitles, see <a
  /// href="https://tech.ebu.ch/publications/tech3380">EBU-TT-D Subtitling
  /// Distribution Format</a>.
  final DashTtmlProfile ttmlProfile;

  DashTtmlConfiguration({
    required this.ttmlProfile,
  });

  factory DashTtmlConfiguration.fromJson(Map<String, dynamic> json) {
    return DashTtmlConfiguration(
      ttmlProfile:
          DashTtmlProfile.fromString((json['TtmlProfile'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final ttmlProfile = this.ttmlProfile;
    return {
      'TtmlProfile': ttmlProfile.value,
    };
  }
}

/// @nodoc
class DashTtmlProfile {
  static const imsc_1 = DashTtmlProfile._('IMSC_1');
  static const ebuTtD_101 = DashTtmlProfile._('EBU_TT_D_101');

  final String value;

  const DashTtmlProfile._(this.value);

  static const values = [imsc_1, ebuTtD_101];

  static DashTtmlProfile fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DashTtmlProfile._(value));

  @override
  bool operator ==(other) => other is DashTtmlProfile && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// For use with DVB-DASH profiles only. The settings for font downloads that
/// you want Elemental MediaPackage to pass through to the manifest.
///
/// @nodoc
class DashDvbFontDownload {
  /// The <code>fontFamily</code> name for subtitles, as described in <a
  /// href="https://tech.ebu.ch/publications/tech3380">EBU-TT-D Subtitling
  /// Distribution Format</a>.
  final String? fontFamily;

  /// The <code>mimeType</code> of the resource that's at the font download URL.
  ///
  /// For information about font MIME types, see the <a
  /// href="https://dvb.org/wp-content/uploads/2021/06/A168r4_MPEG-DASH-Profile-for-Transport-of-ISO-BMFF-Based-DVB-Services_Draft-ts_103-285-v140_November_2021.pdf">MPEG-DASH
  /// Profile for Transport of ISO BMFF Based DVB Services over IP Based
  /// Networks</a> document.
  final String? mimeType;

  /// The URL for downloading fonts for subtitles.
  final String? url;

  DashDvbFontDownload({
    this.fontFamily,
    this.mimeType,
    this.url,
  });

  factory DashDvbFontDownload.fromJson(Map<String, dynamic> json) {
    return DashDvbFontDownload(
      fontFamily: json['FontFamily'] as String?,
      mimeType: json['MimeType'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fontFamily = this.fontFamily;
    final mimeType = this.mimeType;
    final url = this.url;
    return {
      if (fontFamily != null) 'FontFamily': fontFamily,
      if (mimeType != null) 'MimeType': mimeType,
      if (url != null) 'Url': url,
    };
  }
}

/// For use with DVB-DASH profiles only. The settings for error reporting from
/// the playback device that you want Elemental MediaPackage to pass through to
/// the manifest.
///
/// @nodoc
class DashDvbMetricsReporting {
  /// The URL where playback devices send error reports.
  final String reportingUrl;

  /// The number of playback devices per 1000 that will send error reports to the
  /// reporting URL. This represents the probability that a playback device will
  /// be a reporting player for this session.
  final int? probability;

  DashDvbMetricsReporting({
    required this.reportingUrl,
    this.probability,
  });

  factory DashDvbMetricsReporting.fromJson(Map<String, dynamic> json) {
    return DashDvbMetricsReporting(
      reportingUrl: (json['ReportingUrl'] as String?) ?? '',
      probability: json['Probability'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final reportingUrl = this.reportingUrl;
    final probability = this.probability;
    return {
      'ReportingUrl': reportingUrl,
      if (probability != null) 'Probability': probability,
    };
  }
}

/// The base URLs to use for retrieving segments. You can specify multiple
/// locations and indicate the priority and weight for when each should be used,
/// for use in mutli-CDN workflows.
///
/// @nodoc
class DashBaseUrl {
  /// A source location for segments.
  final String url;

  /// For use with DVB-DASH profiles only. The priority of this location for
  /// servings segments. The lower the number, the higher the priority.
  final int? dvbPriority;

  /// For use with DVB-DASH profiles only. The weighting for source locations that
  /// have the same priority.
  final int? dvbWeight;

  /// The name of the source location.
  final String? serviceLocation;

  DashBaseUrl({
    required this.url,
    this.dvbPriority,
    this.dvbWeight,
    this.serviceLocation,
  });

  factory DashBaseUrl.fromJson(Map<String, dynamic> json) {
    return DashBaseUrl(
      url: (json['Url'] as String?) ?? '',
      dvbPriority: json['DvbPriority'] as int?,
      dvbWeight: json['DvbWeight'] as int?,
      serviceLocation: json['ServiceLocation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final url = this.url;
    final dvbPriority = this.dvbPriority;
    final dvbWeight = this.dvbWeight;
    final serviceLocation = this.serviceLocation;
    return {
      'Url': url,
      if (dvbPriority != null) 'DvbPriority': dvbPriority,
      if (dvbWeight != null) 'DvbWeight': dvbWeight,
      if (serviceLocation != null) 'ServiceLocation': serviceLocation,
    };
  }
}

/// @nodoc
class DashProfile {
  static const dvbDash = DashProfile._('DVB_DASH');

  final String value;

  const DashProfile._(this.value);

  static const values = [dvbDash];

  static DashProfile fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DashProfile._(value));

  @override
  bool operator ==(other) => other is DashProfile && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DashUtcTimingMode {
  static const httpHead = DashUtcTimingMode._('HTTP_HEAD');
  static const httpIso = DashUtcTimingMode._('HTTP_ISO');
  static const httpXsdate = DashUtcTimingMode._('HTTP_XSDATE');
  static const utcDirect = DashUtcTimingMode._('UTC_DIRECT');

  final String value;

  const DashUtcTimingMode._(this.value);

  static const values = [httpHead, httpIso, httpXsdate, utcDirect];

  static DashUtcTimingMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DashUtcTimingMode._(value));

  @override
  bool operator ==(other) => other is DashUtcTimingMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AdMarkerDash {
  static const binary = AdMarkerDash._('BINARY');
  static const xml = AdMarkerDash._('XML');

  final String value;

  const AdMarkerDash._(this.value);

  static const values = [binary, xml];

  static AdMarkerDash fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AdMarkerDash._(value));

  @override
  bool operator ==(other) => other is AdMarkerDash && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ScteInManifests {
  static const all = ScteInManifests._('ALL');
  static const matchesFilter = ScteInManifests._('MATCHES_FILTER');

  final String value;

  const ScteInManifests._(this.value);

  static const values = [all, matchesFilter];

  static ScteInManifests fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScteInManifests._(value));

  @override
  bool operator ==(other) => other is ScteInManifests && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class DashPeriodTrigger {
  static const avails = DashPeriodTrigger._('AVAILS');
  static const drmKeyRotation = DashPeriodTrigger._('DRM_KEY_ROTATION');
  static const sourceChanges = DashPeriodTrigger._('SOURCE_CHANGES');
  static const sourceDisruptions = DashPeriodTrigger._('SOURCE_DISRUPTIONS');
  static const none = DashPeriodTrigger._('NONE');

  final String value;

  const DashPeriodTrigger._(this.value);

  static const values = [
    avails,
    drmKeyRotation,
    sourceChanges,
    sourceDisruptions,
    none
  ];

  static DashPeriodTrigger fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DashPeriodTrigger._(value));

  @override
  bool operator ==(other) => other is DashPeriodTrigger && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration details for a Microsoft Smooth Streaming (MSS) manifest
/// associated with an origin endpoint. This includes all the settings and
/// properties that define how the MSS content is packaged and delivered.
///
/// @nodoc
class GetMssManifestConfiguration {
  /// The name of the MSS manifest. This name is appended to the origin endpoint
  /// URL to create the unique path for accessing this specific MSS manifest.
  final String manifestName;

  /// The complete URL for accessing the MSS manifest. Client players use this URL
  /// to retrieve the manifest and begin streaming the Microsoft Smooth Streaming
  /// content.
  final String url;
  final FilterConfiguration? filterConfiguration;

  /// The layout format of the MSS manifest, which determines how the manifest is
  /// structured for client compatibility.
  final MssManifestLayout? manifestLayout;

  /// The duration (in seconds) of the manifest window. This represents the total
  /// amount of content available in the manifest at any given time.
  final int? manifestWindowSeconds;

  GetMssManifestConfiguration({
    required this.manifestName,
    required this.url,
    this.filterConfiguration,
    this.manifestLayout,
    this.manifestWindowSeconds,
  });

  factory GetMssManifestConfiguration.fromJson(Map<String, dynamic> json) {
    return GetMssManifestConfiguration(
      manifestName: (json['ManifestName'] as String?) ?? '',
      url: (json['Url'] as String?) ?? '',
      filterConfiguration: json['FilterConfiguration'] != null
          ? FilterConfiguration.fromJson(
              json['FilterConfiguration'] as Map<String, dynamic>)
          : null,
      manifestLayout: (json['ManifestLayout'] as String?)
          ?.let(MssManifestLayout.fromString),
      manifestWindowSeconds: json['ManifestWindowSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final url = this.url;
    final filterConfiguration = this.filterConfiguration;
    final manifestLayout = this.manifestLayout;
    final manifestWindowSeconds = this.manifestWindowSeconds;
    return {
      'ManifestName': manifestName,
      'Url': url,
      if (filterConfiguration != null)
        'FilterConfiguration': filterConfiguration,
      if (manifestLayout != null) 'ManifestLayout': manifestLayout.value,
      if (manifestWindowSeconds != null)
        'ManifestWindowSeconds': manifestWindowSeconds,
    };
  }
}

/// @nodoc
class MssManifestLayout {
  static const full = MssManifestLayout._('FULL');
  static const compact = MssManifestLayout._('COMPACT');

  final String value;

  const MssManifestLayout._(this.value);

  static const values = [full, compact];

  static MssManifestLayout fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MssManifestLayout._(value));

  @override
  bool operator ==(other) => other is MssManifestLayout && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Retrieve the low-latency HTTP live streaming (HLS) manifest configuration.
///
/// @nodoc
class GetLowLatencyHlsManifestConfiguration {
  /// A short short string that's appended to the endpoint URL. The manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default manifest name, index. MediaPackage
  /// automatically inserts the format extension, such as .m3u8. You can't use the
  /// same manifest name if you use HLS manifest and low-latency HLS manifest. The
  /// manifestName on the HLSManifest object overrides the manifestName you
  /// provided on the originEndpoint object.
  final String manifestName;

  /// The egress domain URL for stream delivery from MediaPackage.
  final String url;

  /// A short string that's appended to the endpoint URL. The child manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default child manifest name, index_1. The manifestName
  /// on the HLSManifest object overrides the manifestName you provided on the
  /// originEndpoint object.
  final String? childManifestName;
  final FilterConfiguration? filterConfiguration;

  /// The total duration (in seconds) of the manifest's content.
  final int? manifestWindowSeconds;

  /// Inserts EXT-X-PROGRAM-DATE-TIME tags in the output manifest at the interval
  /// that you specify. If you don't enter an interval, EXT-X-PROGRAM-DATE-TIME
  /// tags aren't included in the manifest. The tags sync the stream to the wall
  /// clock so that viewers can seek to a specific time in the playback timeline
  /// on the player.
  ///
  /// Irrespective of this parameter, if any ID3Timed metadata is in the HLS
  /// input, it is passed through to the HLS output.
  final int? programDateTimeIntervalSeconds;
  final ScteHls? scteHls;
  final StartTag? startTag;

  /// The type of path used in manifest URIs. <code>LEAF</code> indicates
  /// leaf-relative paths. <code>ROOT</code> indicates root-relative paths that
  /// include the full path from root.
  final UriPathType? uriPathType;

  /// When enabled, MediaPackage URL-encodes the query string for API requests for
  /// LL-HLS child manifests to comply with Amazon Web Services Signature Version
  /// 4 (SigV4) signature signing protocol. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_sigv.html">Amazon
  /// Web Services Signature Version 4 for API requests</a> in <i>Identity and
  /// Access Management User Guide</i>.
  final bool? urlEncodeChildManifest;

  GetLowLatencyHlsManifestConfiguration({
    required this.manifestName,
    required this.url,
    this.childManifestName,
    this.filterConfiguration,
    this.manifestWindowSeconds,
    this.programDateTimeIntervalSeconds,
    this.scteHls,
    this.startTag,
    this.uriPathType,
    this.urlEncodeChildManifest,
  });

  factory GetLowLatencyHlsManifestConfiguration.fromJson(
      Map<String, dynamic> json) {
    return GetLowLatencyHlsManifestConfiguration(
      manifestName: (json['ManifestName'] as String?) ?? '',
      url: (json['Url'] as String?) ?? '',
      childManifestName: json['ChildManifestName'] as String?,
      filterConfiguration: json['FilterConfiguration'] != null
          ? FilterConfiguration.fromJson(
              json['FilterConfiguration'] as Map<String, dynamic>)
          : null,
      manifestWindowSeconds: json['ManifestWindowSeconds'] as int?,
      programDateTimeIntervalSeconds:
          json['ProgramDateTimeIntervalSeconds'] as int?,
      scteHls: json['ScteHls'] != null
          ? ScteHls.fromJson(json['ScteHls'] as Map<String, dynamic>)
          : null,
      startTag: json['StartTag'] != null
          ? StartTag.fromJson(json['StartTag'] as Map<String, dynamic>)
          : null,
      uriPathType:
          (json['UriPathType'] as String?)?.let(UriPathType.fromString),
      urlEncodeChildManifest: json['UrlEncodeChildManifest'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final url = this.url;
    final childManifestName = this.childManifestName;
    final filterConfiguration = this.filterConfiguration;
    final manifestWindowSeconds = this.manifestWindowSeconds;
    final programDateTimeIntervalSeconds = this.programDateTimeIntervalSeconds;
    final scteHls = this.scteHls;
    final startTag = this.startTag;
    final uriPathType = this.uriPathType;
    final urlEncodeChildManifest = this.urlEncodeChildManifest;
    return {
      'ManifestName': manifestName,
      'Url': url,
      if (childManifestName != null) 'ChildManifestName': childManifestName,
      if (filterConfiguration != null)
        'FilterConfiguration': filterConfiguration,
      if (manifestWindowSeconds != null)
        'ManifestWindowSeconds': manifestWindowSeconds,
      if (programDateTimeIntervalSeconds != null)
        'ProgramDateTimeIntervalSeconds': programDateTimeIntervalSeconds,
      if (scteHls != null) 'ScteHls': scteHls,
      if (startTag != null) 'StartTag': startTag,
      if (uriPathType != null) 'UriPathType': uriPathType.value,
      if (urlEncodeChildManifest != null)
        'UrlEncodeChildManifest': urlEncodeChildManifest,
    };
  }
}

/// The SCTE configuration.
///
/// @nodoc
class ScteHls {
  /// Ad markers indicate when ads should be inserted during playback. If you
  /// include ad markers in the content stream in your upstream encoders, then you
  /// need to inform MediaPackage what to do with the ad markers in the output.
  /// Choose what you want MediaPackage to do with the ad markers.
  ///
  /// Value description:
  ///
  /// <ul>
  /// <li>
  /// SCTE35_ENHANCED - Generate industry-standard CUE tag ad markers in HLS
  /// manifests based on SCTE-35 input messages from the input stream.
  /// </li>
  /// <li>
  /// DATERANGE - Insert EXT-X-DATERANGE tags to signal ad and program transition
  /// events in TS and CMAF manifests. If you use DATERANGE, you must set a
  /// programDateTimeIntervalSeconds value of 1 or higher. To learn more about
  /// DATERANGE, see <a
  /// href="http://docs.aws.amazon.com/mediapackage/latest/ug/scte-35-ad-marker-ext-x-daterange.html">SCTE-35
  /// Ad Marker EXT-X-DATERANGE</a>.
  /// </li>
  /// </ul>
  final AdMarkerHls? adMarkerHls;

  /// Controls which SCTE-35 events appear in HLS manifests. <code>ALL</code>
  /// includes all non-implicit SCTE-35 events. <code>MATCHES_FILTER</code>
  /// includes only events whose type matches the configured
  /// <code>ScteFilter</code>.
  ///
  /// If you don't specify a value, the default is <code>ALL</code>.
  final ScteInManifests? scteInManifests;

  ScteHls({
    this.adMarkerHls,
    this.scteInManifests,
  });

  factory ScteHls.fromJson(Map<String, dynamic> json) {
    return ScteHls(
      adMarkerHls:
          (json['AdMarkerHls'] as String?)?.let(AdMarkerHls.fromString),
      scteInManifests:
          (json['ScteInManifests'] as String?)?.let(ScteInManifests.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final adMarkerHls = this.adMarkerHls;
    final scteInManifests = this.scteInManifests;
    return {
      if (adMarkerHls != null) 'AdMarkerHls': adMarkerHls.value,
      if (scteInManifests != null) 'ScteInManifests': scteInManifests.value,
    };
  }
}

/// To insert an EXT-X-START tag in your HLS playlist, specify a StartTag
/// configuration object with a valid TimeOffset. When you do, you can also
/// optionally specify whether to include a PRECISE value in the EXT-X-START
/// tag.
///
/// @nodoc
class StartTag {
  /// Specify the value for TIME-OFFSET within your EXT-X-START tag. Enter a
  /// signed floating point value which, if positive, must be less than the
  /// configured manifest duration minus three times the configured segment target
  /// duration. If negative, the absolute value must be larger than three times
  /// the configured segment target duration, and the absolute value must be
  /// smaller than the configured manifest duration.
  final double timeOffset;

  /// Specify the value for PRECISE within your EXT-X-START tag. Leave blank, or
  /// choose false, to use the default value NO. Choose yes to use the value YES.
  final bool? precise;

  StartTag({
    required this.timeOffset,
    this.precise,
  });

  factory StartTag.fromJson(Map<String, dynamic> json) {
    return StartTag(
      timeOffset: (json['TimeOffset'] as double?) ?? 0,
      precise: json['Precise'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final timeOffset = this.timeOffset;
    final precise = this.precise;
    return {
      'TimeOffset': timeOffset,
      if (precise != null) 'Precise': precise,
    };
  }
}

/// @nodoc
class AdMarkerHls {
  static const daterange = AdMarkerHls._('DATERANGE');
  static const scte35Enhanced = AdMarkerHls._('SCTE35_ENHANCED');

  final String value;

  const AdMarkerHls._(this.value);

  static const values = [daterange, scte35Enhanced];

  static AdMarkerHls fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AdMarkerHls._(value));

  @override
  bool operator ==(other) => other is AdMarkerHls && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Retrieve the HTTP live streaming (HLS) manifest configuration.
///
/// @nodoc
class GetHlsManifestConfiguration {
  /// A short short string that's appended to the endpoint URL. The manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default manifest name, index. MediaPackage
  /// automatically inserts the format extension, such as .m3u8. You can't use the
  /// same manifest name if you use HLS manifest and low-latency HLS manifest. The
  /// manifestName on the HLSManifest object overrides the manifestName you
  /// provided on the originEndpoint object.
  final String manifestName;

  /// The egress domain URL for stream delivery from MediaPackage.
  final String url;

  /// A short string that's appended to the endpoint URL. The child manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default child manifest name, index_1. The manifestName
  /// on the HLSManifest object overrides the manifestName you provided on the
  /// originEndpoint object.
  final String? childManifestName;
  final FilterConfiguration? filterConfiguration;

  /// The total duration (in seconds) of the manifest's content.
  final int? manifestWindowSeconds;

  /// Inserts EXT-X-PROGRAM-DATE-TIME tags in the output manifest at the interval
  /// that you specify. If you don't enter an interval, EXT-X-PROGRAM-DATE-TIME
  /// tags aren't included in the manifest. The tags sync the stream to the wall
  /// clock so that viewers can seek to a specific time in the playback timeline
  /// on the player.
  ///
  /// Irrespective of this parameter, if any ID3Timed metadata is in the HLS
  /// input, it is passed through to the HLS output.
  final int? programDateTimeIntervalSeconds;
  final ScteHls? scteHls;
  final StartTag? startTag;

  /// The type of path used in manifest URIs. <code>LEAF</code> indicates
  /// leaf-relative paths. <code>ROOT</code> indicates root-relative paths that
  /// include the full path from root.
  final UriPathType? uriPathType;

  /// When enabled, MediaPackage URL-encodes the query string for API requests for
  /// HLS child manifests to comply with Amazon Web Services Signature Version 4
  /// (SigV4) signature signing protocol. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_sigv.html">Amazon
  /// Web Services Signature Version 4 for API requests</a> in <i>Identity and
  /// Access Management User Guide</i>.
  final bool? urlEncodeChildManifest;

  GetHlsManifestConfiguration({
    required this.manifestName,
    required this.url,
    this.childManifestName,
    this.filterConfiguration,
    this.manifestWindowSeconds,
    this.programDateTimeIntervalSeconds,
    this.scteHls,
    this.startTag,
    this.uriPathType,
    this.urlEncodeChildManifest,
  });

  factory GetHlsManifestConfiguration.fromJson(Map<String, dynamic> json) {
    return GetHlsManifestConfiguration(
      manifestName: (json['ManifestName'] as String?) ?? '',
      url: (json['Url'] as String?) ?? '',
      childManifestName: json['ChildManifestName'] as String?,
      filterConfiguration: json['FilterConfiguration'] != null
          ? FilterConfiguration.fromJson(
              json['FilterConfiguration'] as Map<String, dynamic>)
          : null,
      manifestWindowSeconds: json['ManifestWindowSeconds'] as int?,
      programDateTimeIntervalSeconds:
          json['ProgramDateTimeIntervalSeconds'] as int?,
      scteHls: json['ScteHls'] != null
          ? ScteHls.fromJson(json['ScteHls'] as Map<String, dynamic>)
          : null,
      startTag: json['StartTag'] != null
          ? StartTag.fromJson(json['StartTag'] as Map<String, dynamic>)
          : null,
      uriPathType:
          (json['UriPathType'] as String?)?.let(UriPathType.fromString),
      urlEncodeChildManifest: json['UrlEncodeChildManifest'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final url = this.url;
    final childManifestName = this.childManifestName;
    final filterConfiguration = this.filterConfiguration;
    final manifestWindowSeconds = this.manifestWindowSeconds;
    final programDateTimeIntervalSeconds = this.programDateTimeIntervalSeconds;
    final scteHls = this.scteHls;
    final startTag = this.startTag;
    final uriPathType = this.uriPathType;
    final urlEncodeChildManifest = this.urlEncodeChildManifest;
    return {
      'ManifestName': manifestName,
      'Url': url,
      if (childManifestName != null) 'ChildManifestName': childManifestName,
      if (filterConfiguration != null)
        'FilterConfiguration': filterConfiguration,
      if (manifestWindowSeconds != null)
        'ManifestWindowSeconds': manifestWindowSeconds,
      if (programDateTimeIntervalSeconds != null)
        'ProgramDateTimeIntervalSeconds': programDateTimeIntervalSeconds,
      if (scteHls != null) 'ScteHls': scteHls,
      if (startTag != null) 'StartTag': startTag,
      if (uriPathType != null) 'UriPathType': uriPathType.value,
      if (urlEncodeChildManifest != null)
        'UrlEncodeChildManifest': urlEncodeChildManifest,
    };
  }
}

/// The SCTE configuration.
///
/// @nodoc
class Scte {
  /// A list of additional non-Ad SCTE-35 event types to treat as advertisements.
  /// When configured, events matching these types produce ad markers (such as
  /// <code>SCTE35-OUT</code> and <code>SCTE35-IN</code> in HLS DATERANGE tags) in
  /// manifests.
  ///
  /// Valid values: <code>PROGRAM</code> | <code>CHAPTER</code> |
  /// <code>UNSCHEDULED_EVENT</code> | <code>ALTERNATE_CONTENT_OPPORTUNITY</code>
  /// | <code>NETWORK</code>
  ///
  /// If you don't specify any values, the default is empty (only default ad types
  /// are used).
  final List<CustomAdType>? customAdTypes;

  /// The SCTE-35 message types that you want to be treated as ad markers in the
  /// output.
  final List<ScteFilter>? scteFilter;

  /// Controls whether SCTE-35 messages are included in segment files.
  ///
  /// <ul>
  /// <li>
  /// None – SCTE-35 messages are not included in segments (default)
  /// </li>
  /// <li>
  /// All – SCTE-35 messages are embedded in segment data
  /// </li>
  /// <li>
  /// MatchesFilter – SCTE-35 messages which match the ScteFilter are embedded in
  /// segment data
  /// </li>
  /// </ul>
  /// For DASH manifests, when set to <code>All</code> or
  /// <code>MatchesFilter</code>, an <code>InbandEventStream</code> tag signals
  /// that SCTE messages are present in segments. This setting works independently
  /// of manifest ad markers.
  final ScteInSegments? scteInSegments;

  Scte({
    this.customAdTypes,
    this.scteFilter,
    this.scteInSegments,
  });

  factory Scte.fromJson(Map<String, dynamic> json) {
    return Scte(
      customAdTypes: (json['CustomAdTypes'] as List?)
          ?.nonNulls
          .map((e) => CustomAdType.fromString((e as String)))
          .toList(),
      scteFilter: (json['ScteFilter'] as List?)
          ?.nonNulls
          .map((e) => ScteFilter.fromString((e as String)))
          .toList(),
      scteInSegments:
          (json['ScteInSegments'] as String?)?.let(ScteInSegments.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final customAdTypes = this.customAdTypes;
    final scteFilter = this.scteFilter;
    final scteInSegments = this.scteInSegments;
    return {
      if (customAdTypes != null)
        'CustomAdTypes': customAdTypes.map((e) => e.value).toList(),
      if (scteFilter != null)
        'ScteFilter': scteFilter.map((e) => e.value).toList(),
      if (scteInSegments != null) 'ScteInSegments': scteInSegments.value,
    };
  }
}

/// The parameters for encrypting content.
///
/// @nodoc
class Encryption {
  /// The encryption method to use.
  final EncryptionMethod encryptionMethod;

  /// The parameters for the SPEKE key provider.
  final SpekeKeyProvider spekeKeyProvider;

  /// Excludes SEIG and SGPD boxes from segment metadata in CMAF containers.
  ///
  /// When set to <code>true</code>, MediaPackage omits these DRM metadata boxes
  /// from CMAF segments, which can improve compatibility with certain devices and
  /// players that don't support these boxes.
  ///
  /// Important considerations:
  ///
  /// <ul>
  /// <li>
  /// This setting only affects CMAF container formats
  /// </li>
  /// <li>
  /// Key rotation can still be handled through media playlist signaling
  /// </li>
  /// <li>
  /// PSSH and TENC boxes remain unaffected
  /// </li>
  /// <li>
  /// Default behavior is preserved when this setting is disabled
  /// </li>
  /// </ul>
  /// Valid values: <code>true</code> | <code>false</code>
  ///
  /// Default: <code>false</code>
  final bool? cmafExcludeSegmentDrmMetadata;

  /// A 128-bit, 16-byte hex value represented by a 32-character string, used in
  /// conjunction with the key for encrypting content. If you don't specify a
  /// value, then MediaPackage creates the constant initialization vector (IV).
  final String? constantInitializationVector;

  /// The frequency (in seconds) of key changes for live workflows, in which
  /// content is streamed real time. The service retrieves content keys before the
  /// live content begins streaming, and then retrieves them as needed over the
  /// lifetime of the workflow. By default, key rotation is set to 300 seconds (5
  /// minutes), the minimum rotation interval, which is equivalent to setting it
  /// to 300. If you don't enter an interval, content keys aren't rotated.
  ///
  /// The following example setting causes the service to rotate keys every thirty
  /// minutes: <code>1800</code>
  final int? keyRotationIntervalSeconds;

  Encryption({
    required this.encryptionMethod,
    required this.spekeKeyProvider,
    this.cmafExcludeSegmentDrmMetadata,
    this.constantInitializationVector,
    this.keyRotationIntervalSeconds,
  });

  factory Encryption.fromJson(Map<String, dynamic> json) {
    return Encryption(
      encryptionMethod: EncryptionMethod.fromJson(
          (json['EncryptionMethod'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      spekeKeyProvider: SpekeKeyProvider.fromJson(
          (json['SpekeKeyProvider'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      cmafExcludeSegmentDrmMetadata:
          json['CmafExcludeSegmentDrmMetadata'] as bool?,
      constantInitializationVector:
          json['ConstantInitializationVector'] as String?,
      keyRotationIntervalSeconds: json['KeyRotationIntervalSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionMethod = this.encryptionMethod;
    final spekeKeyProvider = this.spekeKeyProvider;
    final cmafExcludeSegmentDrmMetadata = this.cmafExcludeSegmentDrmMetadata;
    final constantInitializationVector = this.constantInitializationVector;
    final keyRotationIntervalSeconds = this.keyRotationIntervalSeconds;
    return {
      'EncryptionMethod': encryptionMethod,
      'SpekeKeyProvider': spekeKeyProvider,
      if (cmafExcludeSegmentDrmMetadata != null)
        'CmafExcludeSegmentDrmMetadata': cmafExcludeSegmentDrmMetadata,
      if (constantInitializationVector != null)
        'ConstantInitializationVector': constantInitializationVector,
      if (keyRotationIntervalSeconds != null)
        'KeyRotationIntervalSeconds': keyRotationIntervalSeconds,
    };
  }
}

/// The encryption type.
///
/// @nodoc
class EncryptionMethod {
  /// The encryption method to use.
  final CmafEncryptionMethod? cmafEncryptionMethod;

  /// The encryption method used for Microsoft Smooth Streaming (MSS) content.
  /// This specifies how the MSS segments are encrypted to protect the content
  /// during delivery to client players.
  final IsmEncryptionMethod? ismEncryptionMethod;

  /// The encryption method to use.
  final TsEncryptionMethod? tsEncryptionMethod;

  EncryptionMethod({
    this.cmafEncryptionMethod,
    this.ismEncryptionMethod,
    this.tsEncryptionMethod,
  });

  factory EncryptionMethod.fromJson(Map<String, dynamic> json) {
    return EncryptionMethod(
      cmafEncryptionMethod: (json['CmafEncryptionMethod'] as String?)
          ?.let(CmafEncryptionMethod.fromString),
      ismEncryptionMethod: (json['IsmEncryptionMethod'] as String?)
          ?.let(IsmEncryptionMethod.fromString),
      tsEncryptionMethod: (json['TsEncryptionMethod'] as String?)
          ?.let(TsEncryptionMethod.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final cmafEncryptionMethod = this.cmafEncryptionMethod;
    final ismEncryptionMethod = this.ismEncryptionMethod;
    final tsEncryptionMethod = this.tsEncryptionMethod;
    return {
      if (cmafEncryptionMethod != null)
        'CmafEncryptionMethod': cmafEncryptionMethod.value,
      if (ismEncryptionMethod != null)
        'IsmEncryptionMethod': ismEncryptionMethod.value,
      if (tsEncryptionMethod != null)
        'TsEncryptionMethod': tsEncryptionMethod.value,
    };
  }
}

/// The parameters for the SPEKE key provider.
///
/// @nodoc
class SpekeKeyProvider {
  /// The DRM solution provider you're using to protect your content during
  /// distribution.
  final List<DrmSystem> drmSystems;

  /// Configure one or more content encryption keys for your endpoints that use
  /// SPEKE Version 2.0. The encryption contract defines which content keys are
  /// used to encrypt the audio and video tracks in your stream. To configure the
  /// encryption contract, specify which audio and video encryption presets to
  /// use.
  final EncryptionContractConfiguration encryptionContractConfiguration;

  /// The unique identifier for the content. The service sends this to the key
  /// server to identify the current endpoint. How unique you make this depends on
  /// how fine-grained you want access controls to be. The service does not permit
  /// you to use the same ID for two simultaneous encryption processes. The
  /// resource ID is also known as the content ID.
  ///
  /// The following example shows a resource ID:
  /// <code>MovieNight20171126093045</code>
  final String resourceId;

  /// The ARN for the IAM role granted by the key provider that provides access to
  /// the key provider API. This role must have a trust policy that allows
  /// MediaPackage to assume the role, and it must have a sufficient permissions
  /// policy to allow access to the specific key retrieval URL. Get this from your
  /// DRM solution provider.
  ///
  /// Valid format: <code>arn:aws:iam::{accountID}:role/{name}</code>. The
  /// following example shows a role ARN:
  /// <code>arn:aws:iam::444455556666:role/SpekeAccess</code>
  final String roleArn;

  /// The URL of the API Gateway proxy that you set up to talk to your key server.
  /// The API Gateway proxy must reside in the same AWS Region as MediaPackage and
  /// must start with https://.
  ///
  /// The following example shows a URL:
  /// <code>https://1wm2dx1f33.execute-api.us-west-2.amazonaws.com/SpekeSample/copyProtection</code>
  final String url;

  /// The ARN for the certificate that you imported to Amazon Web Services
  /// Certificate Manager to add content key encryption to this endpoint. For this
  /// feature to work, your DRM key provider must support content key encryption.
  final String? certificateArn;

  SpekeKeyProvider({
    required this.drmSystems,
    required this.encryptionContractConfiguration,
    required this.resourceId,
    required this.roleArn,
    required this.url,
    this.certificateArn,
  });

  factory SpekeKeyProvider.fromJson(Map<String, dynamic> json) {
    return SpekeKeyProvider(
      drmSystems: ((json['DrmSystems'] as List?) ?? const [])
          .nonNulls
          .map((e) => DrmSystem.fromString((e as String)))
          .toList(),
      encryptionContractConfiguration: EncryptionContractConfiguration.fromJson(
          (json['EncryptionContractConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      resourceId: (json['ResourceId'] as String?) ?? '',
      roleArn: (json['RoleArn'] as String?) ?? '',
      url: (json['Url'] as String?) ?? '',
      certificateArn: json['CertificateArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final drmSystems = this.drmSystems;
    final encryptionContractConfiguration =
        this.encryptionContractConfiguration;
    final resourceId = this.resourceId;
    final roleArn = this.roleArn;
    final url = this.url;
    final certificateArn = this.certificateArn;
    return {
      'DrmSystems': drmSystems.map((e) => e.value).toList(),
      'EncryptionContractConfiguration': encryptionContractConfiguration,
      'ResourceId': resourceId,
      'RoleArn': roleArn,
      'Url': url,
      if (certificateArn != null) 'CertificateArn': certificateArn,
    };
  }
}

/// Configure one or more content encryption keys for your endpoints that use
/// SPEKE Version 2.0. The encryption contract defines which content keys are
/// used to encrypt the audio and video tracks in your stream. To configure the
/// encryption contract, specify which audio and video encryption presets to
/// use.
///
/// @nodoc
class EncryptionContractConfiguration {
  /// A collection of audio encryption presets.
  ///
  /// Value description:
  ///
  /// <ul>
  /// <li>
  /// PRESET-AUDIO-1 - Use one content key to encrypt all of the audio tracks in
  /// your stream.
  /// </li>
  /// <li>
  /// PRESET-AUDIO-2 - Use one content key to encrypt all of the stereo audio
  /// tracks and one content key to encrypt all of the multichannel audio tracks.
  /// </li>
  /// <li>
  /// PRESET-AUDIO-3 - Use one content key to encrypt all of the stereo audio
  /// tracks, one content key to encrypt all of the multichannel audio tracks with
  /// 3 to 6 channels, and one content key to encrypt all of the multichannel
  /// audio tracks with more than 6 channels.
  /// </li>
  /// <li>
  /// SHARED - Use the same content key for all of the audio and video tracks in
  /// your stream.
  /// </li>
  /// <li>
  /// UNENCRYPTED - Don't encrypt any of the audio tracks in your stream.
  /// </li>
  /// </ul>
  final PresetSpeke20Audio presetSpeke20Audio;

  /// A collection of video encryption presets.
  ///
  /// Value description:
  ///
  /// <ul>
  /// <li>
  /// PRESET-VIDEO-1 - Use one content key to encrypt all of the video tracks in
  /// your stream.
  /// </li>
  /// <li>
  /// PRESET-VIDEO-2 - Use one content key to encrypt all of the SD video tracks
  /// and one content key for all HD and higher resolutions video tracks.
  /// </li>
  /// <li>
  /// PRESET-VIDEO-3 - Use one content key to encrypt all of the SD video tracks,
  /// one content key for HD video tracks and one content key for all UHD video
  /// tracks.
  /// </li>
  /// <li>
  /// PRESET-VIDEO-4 - Use one content key to encrypt all of the SD video tracks,
  /// one content key for HD video tracks, one content key for all UHD1 video
  /// tracks and one content key for all UHD2 video tracks.
  /// </li>
  /// <li>
  /// PRESET-VIDEO-5 - Use one content key to encrypt all of the SD video tracks,
  /// one content key for HD1 video tracks, one content key for HD2 video tracks,
  /// one content key for all UHD1 video tracks and one content key for all UHD2
  /// video tracks.
  /// </li>
  /// <li>
  /// PRESET-VIDEO-6 - Use one content key to encrypt all of the SD video tracks,
  /// one content key for HD1 video tracks, one content key for HD2 video tracks
  /// and one content key for all UHD video tracks.
  /// </li>
  /// <li>
  /// PRESET-VIDEO-7 - Use one content key to encrypt all of the SD+HD1 video
  /// tracks, one content key for HD2 video tracks and one content key for all UHD
  /// video tracks.
  /// </li>
  /// <li>
  /// PRESET-VIDEO-8 - Use one content key to encrypt all of the SD+HD1 video
  /// tracks, one content key for HD2 video tracks, one content key for all UHD1
  /// video tracks and one content key for all UHD2 video tracks.
  /// </li>
  /// <li>
  /// SHARED - Use the same content key for all of the video and audio tracks in
  /// your stream.
  /// </li>
  /// <li>
  /// UNENCRYPTED - Don't encrypt any of the video tracks in your stream.
  /// </li>
  /// </ul>
  final PresetSpeke20Video presetSpeke20Video;

  EncryptionContractConfiguration({
    required this.presetSpeke20Audio,
    required this.presetSpeke20Video,
  });

  factory EncryptionContractConfiguration.fromJson(Map<String, dynamic> json) {
    return EncryptionContractConfiguration(
      presetSpeke20Audio: PresetSpeke20Audio.fromString(
          (json['PresetSpeke20Audio'] as String?) ?? ''),
      presetSpeke20Video: PresetSpeke20Video.fromString(
          (json['PresetSpeke20Video'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final presetSpeke20Audio = this.presetSpeke20Audio;
    final presetSpeke20Video = this.presetSpeke20Video;
    return {
      'PresetSpeke20Audio': presetSpeke20Audio.value,
      'PresetSpeke20Video': presetSpeke20Video.value,
    };
  }
}

/// @nodoc
class DrmSystem {
  static const clearKeyAes_128 = DrmSystem._('CLEAR_KEY_AES_128');
  static const fairplay = DrmSystem._('FAIRPLAY');
  static const playready = DrmSystem._('PLAYREADY');
  static const widevine = DrmSystem._('WIDEVINE');
  static const irdeto = DrmSystem._('IRDETO');

  final String value;

  const DrmSystem._(this.value);

  static const values = [
    clearKeyAes_128,
    fairplay,
    playready,
    widevine,
    irdeto
  ];

  static DrmSystem fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DrmSystem._(value));

  @override
  bool operator ==(other) => other is DrmSystem && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PresetSpeke20Audio {
  static const presetAudio_1 = PresetSpeke20Audio._('PRESET_AUDIO_1');
  static const presetAudio_2 = PresetSpeke20Audio._('PRESET_AUDIO_2');
  static const presetAudio_3 = PresetSpeke20Audio._('PRESET_AUDIO_3');
  static const shared = PresetSpeke20Audio._('SHARED');
  static const unencrypted = PresetSpeke20Audio._('UNENCRYPTED');

  final String value;

  const PresetSpeke20Audio._(this.value);

  static const values = [
    presetAudio_1,
    presetAudio_2,
    presetAudio_3,
    shared,
    unencrypted
  ];

  static PresetSpeke20Audio fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PresetSpeke20Audio._(value));

  @override
  bool operator ==(other) =>
      other is PresetSpeke20Audio && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PresetSpeke20Video {
  static const presetVideo_1 = PresetSpeke20Video._('PRESET_VIDEO_1');
  static const presetVideo_2 = PresetSpeke20Video._('PRESET_VIDEO_2');
  static const presetVideo_3 = PresetSpeke20Video._('PRESET_VIDEO_3');
  static const presetVideo_4 = PresetSpeke20Video._('PRESET_VIDEO_4');
  static const presetVideo_5 = PresetSpeke20Video._('PRESET_VIDEO_5');
  static const presetVideo_6 = PresetSpeke20Video._('PRESET_VIDEO_6');
  static const presetVideo_7 = PresetSpeke20Video._('PRESET_VIDEO_7');
  static const presetVideo_8 = PresetSpeke20Video._('PRESET_VIDEO_8');
  static const shared = PresetSpeke20Video._('SHARED');
  static const unencrypted = PresetSpeke20Video._('UNENCRYPTED');

  final String value;

  const PresetSpeke20Video._(this.value);

  static const values = [
    presetVideo_1,
    presetVideo_2,
    presetVideo_3,
    presetVideo_4,
    presetVideo_5,
    presetVideo_6,
    presetVideo_7,
    presetVideo_8,
    shared,
    unencrypted
  ];

  static PresetSpeke20Video fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PresetSpeke20Video._(value));

  @override
  bool operator ==(other) =>
      other is PresetSpeke20Video && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TsEncryptionMethod {
  static const aes_128 = TsEncryptionMethod._('AES_128');
  static const sampleAes = TsEncryptionMethod._('SAMPLE_AES');

  final String value;

  const TsEncryptionMethod._(this.value);

  static const values = [aes_128, sampleAes];

  static TsEncryptionMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TsEncryptionMethod._(value));

  @override
  bool operator ==(other) =>
      other is TsEncryptionMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CmafEncryptionMethod {
  static const cenc = CmafEncryptionMethod._('CENC');
  static const cbcs = CmafEncryptionMethod._('CBCS');

  final String value;

  const CmafEncryptionMethod._(this.value);

  static const values = [cenc, cbcs];

  static CmafEncryptionMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CmafEncryptionMethod._(value));

  @override
  bool operator ==(other) =>
      other is CmafEncryptionMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class IsmEncryptionMethod {
  static const cenc = IsmEncryptionMethod._('CENC');

  final String value;

  const IsmEncryptionMethod._(this.value);

  static const values = [cenc];

  static IsmEncryptionMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IsmEncryptionMethod._(value));

  @override
  bool operator ==(other) =>
      other is IsmEncryptionMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ScteInSegments {
  static const none = ScteInSegments._('NONE');
  static const all = ScteInSegments._('ALL');
  static const matchesFilter = ScteInSegments._('MATCHES_FILTER');

  final String value;

  const ScteInSegments._(this.value);

  static const values = [none, all, matchesFilter];

  static ScteInSegments fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScteInSegments._(value));

  @override
  bool operator ==(other) => other is ScteInSegments && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CustomAdType {
  static const program = CustomAdType._('PROGRAM');
  static const chapter = CustomAdType._('CHAPTER');
  static const unscheduledEvent = CustomAdType._('UNSCHEDULED_EVENT');
  static const alternateContentOpportunity =
      CustomAdType._('ALTERNATE_CONTENT_OPPORTUNITY');
  static const network = CustomAdType._('NETWORK');

  final String value;

  const CustomAdType._(this.value);

  static const values = [
    program,
    chapter,
    unscheduledEvent,
    alternateContentOpportunity,
    network
  ];

  static CustomAdType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CustomAdType._(value));

  @override
  bool operator ==(other) => other is CustomAdType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ScteFilter {
  static const spliceInsert = ScteFilter._('SPLICE_INSERT');
  static const $break = ScteFilter._('BREAK');
  static const providerAdvertisement = ScteFilter._('PROVIDER_ADVERTISEMENT');
  static const distributorAdvertisement =
      ScteFilter._('DISTRIBUTOR_ADVERTISEMENT');
  static const providerPlacementOpportunity =
      ScteFilter._('PROVIDER_PLACEMENT_OPPORTUNITY');
  static const distributorPlacementOpportunity =
      ScteFilter._('DISTRIBUTOR_PLACEMENT_OPPORTUNITY');
  static const providerOverlayPlacementOpportunity =
      ScteFilter._('PROVIDER_OVERLAY_PLACEMENT_OPPORTUNITY');
  static const distributorOverlayPlacementOpportunity =
      ScteFilter._('DISTRIBUTOR_OVERLAY_PLACEMENT_OPPORTUNITY');
  static const program = ScteFilter._('PROGRAM');
  static const chapter = ScteFilter._('CHAPTER');
  static const unscheduledEvent = ScteFilter._('UNSCHEDULED_EVENT');
  static const alternateContentOpportunity =
      ScteFilter._('ALTERNATE_CONTENT_OPPORTUNITY');
  static const network = ScteFilter._('NETWORK');
  static const providerPromo = ScteFilter._('PROVIDER_PROMO');
  static const distributorPromo = ScteFilter._('DISTRIBUTOR_PROMO');
  static const providerAdBlock = ScteFilter._('PROVIDER_AD_BLOCK');
  static const distributorAdBlock = ScteFilter._('DISTRIBUTOR_AD_BLOCK');

  final String value;

  const ScteFilter._(this.value);

  static const values = [
    spliceInsert,
    $break,
    providerAdvertisement,
    distributorAdvertisement,
    providerPlacementOpportunity,
    distributorPlacementOpportunity,
    providerOverlayPlacementOpportunity,
    distributorOverlayPlacementOpportunity,
    program,
    chapter,
    unscheduledEvent,
    alternateContentOpportunity,
    network,
    providerPromo,
    distributorPromo,
    providerAdBlock,
    distributorAdBlock
  ];

  static ScteFilter fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ScteFilter._(value));

  @override
  bool operator ==(other) => other is ScteFilter && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration parameters for creating a Microsoft Smooth Streaming (MSS)
/// manifest. MSS is a streaming media format developed by Microsoft that
/// delivers adaptive bitrate streaming content to compatible players and
/// devices.
///
/// @nodoc
class CreateMssManifestConfiguration {
  /// A short string that's appended to the endpoint URL to create a unique path
  /// to this MSS manifest. The manifest name must be unique within the origin
  /// endpoint and can contain letters, numbers, hyphens, and underscores.
  final String manifestName;
  final FilterConfiguration? filterConfiguration;

  /// Determines the layout format of the MSS manifest. This controls how the
  /// manifest is structured and presented to client players, affecting
  /// compatibility with different MSS-compatible devices and applications.
  final MssManifestLayout? manifestLayout;

  /// The total duration (in seconds) of the manifest window. This determines how
  /// much content is available in the manifest at any given time. The manifest
  /// window slides forward as new segments become available, maintaining a
  /// consistent duration of content. The minimum value is 30 seconds.
  final int? manifestWindowSeconds;

  CreateMssManifestConfiguration({
    required this.manifestName,
    this.filterConfiguration,
    this.manifestLayout,
    this.manifestWindowSeconds,
  });

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final filterConfiguration = this.filterConfiguration;
    final manifestLayout = this.manifestLayout;
    final manifestWindowSeconds = this.manifestWindowSeconds;
    return {
      'ManifestName': manifestName,
      if (filterConfiguration != null)
        'FilterConfiguration': filterConfiguration,
      if (manifestLayout != null) 'ManifestLayout': manifestLayout.value,
      if (manifestWindowSeconds != null)
        'ManifestWindowSeconds': manifestWindowSeconds,
    };
  }
}

/// Create a DASH manifest configuration.
///
/// @nodoc
class CreateDashManifestConfiguration {
  /// A short string that's appended to the endpoint URL. The child manifest name
  /// creates a unique path to this endpoint.
  final String manifestName;

  /// The configuration for the DASH <code>availabilityStartTime</code> attribute
  /// of the Media Presentation Description (MPD). If you don't specify a value,
  /// MediaPackage uses the default availability start time of
  /// <code>2024-01-01T00:00:00Z</code>.
  final DashAvailabilityStartTimeConfiguration?
      availabilityStartTimeConfiguration;

  /// The base URLs to use for retrieving segments.
  final List<DashBaseUrl>? baseUrls;

  /// The layout of the DASH manifest that MediaPackage produces.
  /// <code>STANDARD</code> indicates a default manifest, which is compacted.
  /// <code>NONE</code> indicates a full manifest.
  ///
  /// For information about compactness, see <a
  /// href="https://docs.aws.amazon.com/mediapackage/latest/userguide/compacted.html">DASH
  /// manifest compactness</a> in the <i>Elemental MediaPackage v2 User Guide</i>.
  final DashCompactness? compactness;

  /// Determines how the DASH manifest signals the DRM content.
  final DashDrmSignaling? drmSignaling;

  /// For endpoints that use the DVB-DASH profile only. The font download and
  /// error reporting information that you want MediaPackage to pass through to
  /// the manifest.
  final DashDvbSettings? dvbSettings;
  final FilterConfiguration? filterConfiguration;

  /// The total duration (in seconds) of the manifest's content.
  final int? manifestWindowSeconds;

  /// Minimum amount of content (in seconds) that a player must keep available in
  /// the buffer.
  final int? minBufferTimeSeconds;

  /// Minimum amount of time (in seconds) that the player should wait before
  /// requesting updates to the manifest.
  final int? minUpdatePeriodSeconds;

  /// A list of triggers that controls when AWS Elemental MediaPackage separates
  /// the MPEG-DASH manifest into multiple periods. Type <code>ADS</code> to
  /// indicate that AWS Elemental MediaPackage must create periods in the output
  /// manifest that correspond to SCTE-35 ad markers in the input source. Leave
  /// this value empty to indicate that the manifest is contained all in one
  /// period. For more information about periods in the DASH manifest, see <a
  /// href="https://docs.aws.amazon.com/mediapackage/latest/userguide/multi-period.html">Multi-period
  /// DASH in AWS Elemental MediaPackage</a>.
  final List<DashPeriodTrigger>? periodTriggers;

  /// The profile that the output is compliant with.
  final List<DashProfile>? profiles;

  /// Details about the content that you want MediaPackage to pass through in the
  /// manifest to the playback device.
  final DashProgramInformation? programInformation;

  /// The SCTE configuration.
  final ScteDash? scteDash;

  /// Determines the type of variable used in the <code>media</code> URL of the
  /// <code>SegmentTemplate</code> tag in the manifest. Also specifies if segment
  /// timeline information is included in <code>SegmentTimeline</code> or
  /// <code>SegmentTemplate</code>.
  ///
  /// Value description:
  ///
  /// <ul>
  /// <li>
  /// <code>NUMBER_WITH_TIMELINE</code> - The <code>$Number$</code> variable is
  /// used in the <code>media</code> URL. The value of this variable is the
  /// sequential number of the segment. A full <code>SegmentTimeline</code> object
  /// is presented in each <code>SegmentTemplate</code>.
  /// </li>
  /// </ul>
  final DashSegmentTemplateFormat? segmentTemplateFormat;

  /// The configuration for DASH subtitles.
  final DashSubtitleConfiguration? subtitleConfiguration;

  /// The amount of time (in seconds) that the player should be from the end of
  /// the manifest.
  final int? suggestedPresentationDelaySeconds;

  /// The type of path to use in manifest URIs. <code>LEAF</code> uses
  /// leaf-relative paths (for example, <code>index_1.mpd</code>).
  /// <code>ROOT</code> uses root-relative paths that include the full path from
  /// root (for example,
  /// <code>/out/v1/channel-group/channel/endpoint/index_1.mpd</code>). If you
  /// don't specify a value, the default is <code>LEAF</code>.
  final UriPathType? uriPathType;

  /// Determines the type of UTC timing included in the DASH Media Presentation
  /// Description (MPD).
  final DashUtcTiming? utcTiming;

  CreateDashManifestConfiguration({
    required this.manifestName,
    this.availabilityStartTimeConfiguration,
    this.baseUrls,
    this.compactness,
    this.drmSignaling,
    this.dvbSettings,
    this.filterConfiguration,
    this.manifestWindowSeconds,
    this.minBufferTimeSeconds,
    this.minUpdatePeriodSeconds,
    this.periodTriggers,
    this.profiles,
    this.programInformation,
    this.scteDash,
    this.segmentTemplateFormat,
    this.subtitleConfiguration,
    this.suggestedPresentationDelaySeconds,
    this.uriPathType,
    this.utcTiming,
  });

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final availabilityStartTimeConfiguration =
        this.availabilityStartTimeConfiguration;
    final baseUrls = this.baseUrls;
    final compactness = this.compactness;
    final drmSignaling = this.drmSignaling;
    final dvbSettings = this.dvbSettings;
    final filterConfiguration = this.filterConfiguration;
    final manifestWindowSeconds = this.manifestWindowSeconds;
    final minBufferTimeSeconds = this.minBufferTimeSeconds;
    final minUpdatePeriodSeconds = this.minUpdatePeriodSeconds;
    final periodTriggers = this.periodTriggers;
    final profiles = this.profiles;
    final programInformation = this.programInformation;
    final scteDash = this.scteDash;
    final segmentTemplateFormat = this.segmentTemplateFormat;
    final subtitleConfiguration = this.subtitleConfiguration;
    final suggestedPresentationDelaySeconds =
        this.suggestedPresentationDelaySeconds;
    final uriPathType = this.uriPathType;
    final utcTiming = this.utcTiming;
    return {
      'ManifestName': manifestName,
      if (availabilityStartTimeConfiguration != null)
        'AvailabilityStartTimeConfiguration':
            availabilityStartTimeConfiguration,
      if (baseUrls != null) 'BaseUrls': baseUrls,
      if (compactness != null) 'Compactness': compactness.value,
      if (drmSignaling != null) 'DrmSignaling': drmSignaling.value,
      if (dvbSettings != null) 'DvbSettings': dvbSettings,
      if (filterConfiguration != null)
        'FilterConfiguration': filterConfiguration,
      if (manifestWindowSeconds != null)
        'ManifestWindowSeconds': manifestWindowSeconds,
      if (minBufferTimeSeconds != null)
        'MinBufferTimeSeconds': minBufferTimeSeconds,
      if (minUpdatePeriodSeconds != null)
        'MinUpdatePeriodSeconds': minUpdatePeriodSeconds,
      if (periodTriggers != null)
        'PeriodTriggers': periodTriggers.map((e) => e.value).toList(),
      if (profiles != null) 'Profiles': profiles.map((e) => e.value).toList(),
      if (programInformation != null) 'ProgramInformation': programInformation,
      if (scteDash != null) 'ScteDash': scteDash,
      if (segmentTemplateFormat != null)
        'SegmentTemplateFormat': segmentTemplateFormat.value,
      if (subtitleConfiguration != null)
        'SubtitleConfiguration': subtitleConfiguration,
      if (suggestedPresentationDelaySeconds != null)
        'SuggestedPresentationDelaySeconds': suggestedPresentationDelaySeconds,
      if (uriPathType != null) 'UriPathType': uriPathType.value,
      if (utcTiming != null) 'UtcTiming': utcTiming,
    };
  }
}

/// Create a low-latency HTTP live streaming (HLS) manifest configuration.
///
/// @nodoc
class CreateLowLatencyHlsManifestConfiguration {
  /// A short short string that's appended to the endpoint URL. The manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default manifest name, index. MediaPackage
  /// automatically inserts the format extension, such as .m3u8. You can't use the
  /// same manifest name if you use HLS manifest and low-latency HLS manifest. The
  /// manifestName on the HLSManifest object overrides the manifestName you
  /// provided on the originEndpoint object.
  final String manifestName;

  /// A short string that's appended to the endpoint URL. The child manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default manifest name, index, with an added suffix to
  /// distinguish it from the manifest name. The manifestName on the HLSManifest
  /// object overrides the manifestName you provided on the originEndpoint object.
  final String? childManifestName;
  final FilterConfiguration? filterConfiguration;

  /// The total duration (in seconds) of the manifest's content.
  final int? manifestWindowSeconds;

  /// Inserts EXT-X-PROGRAM-DATE-TIME tags in the output manifest at the interval
  /// that you specify. If you don't enter an interval, EXT-X-PROGRAM-DATE-TIME
  /// tags aren't included in the manifest. The tags sync the stream to the wall
  /// clock so that viewers can seek to a specific time in the playback timeline
  /// on the player.
  ///
  /// Irrespective of this parameter, if any ID3Timed metadata is in the HLS
  /// input, it is passed through to the HLS output.
  final int? programDateTimeIntervalSeconds;
  final ScteHls? scteHls;
  final StartTag? startTag;

  /// The type of path to use in manifest URIs. <code>LEAF</code> uses
  /// leaf-relative paths (for example, <code>index_1.m3u8</code>).
  /// <code>ROOT</code> uses root-relative paths that include the full path from
  /// root (for example,
  /// <code>/out/v1/channel-group/channel/endpoint/index_1.m3u8</code>). If you
  /// don't specify a value, the default is <code>LEAF</code>.
  final UriPathType? uriPathType;

  /// When enabled, MediaPackage URL-encodes the query string for API requests for
  /// LL-HLS child manifests to comply with Amazon Web Services Signature Version
  /// 4 (SigV4) signature signing protocol. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_sigv.html">Amazon
  /// Web Services Signature Version 4 for API requests</a> in <i>Identity and
  /// Access Management User Guide</i>.
  final bool? urlEncodeChildManifest;

  CreateLowLatencyHlsManifestConfiguration({
    required this.manifestName,
    this.childManifestName,
    this.filterConfiguration,
    this.manifestWindowSeconds,
    this.programDateTimeIntervalSeconds,
    this.scteHls,
    this.startTag,
    this.uriPathType,
    this.urlEncodeChildManifest,
  });

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final childManifestName = this.childManifestName;
    final filterConfiguration = this.filterConfiguration;
    final manifestWindowSeconds = this.manifestWindowSeconds;
    final programDateTimeIntervalSeconds = this.programDateTimeIntervalSeconds;
    final scteHls = this.scteHls;
    final startTag = this.startTag;
    final uriPathType = this.uriPathType;
    final urlEncodeChildManifest = this.urlEncodeChildManifest;
    return {
      'ManifestName': manifestName,
      if (childManifestName != null) 'ChildManifestName': childManifestName,
      if (filterConfiguration != null)
        'FilterConfiguration': filterConfiguration,
      if (manifestWindowSeconds != null)
        'ManifestWindowSeconds': manifestWindowSeconds,
      if (programDateTimeIntervalSeconds != null)
        'ProgramDateTimeIntervalSeconds': programDateTimeIntervalSeconds,
      if (scteHls != null) 'ScteHls': scteHls,
      if (startTag != null) 'StartTag': startTag,
      if (uriPathType != null) 'UriPathType': uriPathType.value,
      if (urlEncodeChildManifest != null)
        'UrlEncodeChildManifest': urlEncodeChildManifest,
    };
  }
}

/// Create an HTTP live streaming (HLS) manifest configuration.
///
/// @nodoc
class CreateHlsManifestConfiguration {
  /// A short short string that's appended to the endpoint URL. The manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default manifest name, index. MediaPackage
  /// automatically inserts the format extension, such as .m3u8. You can't use the
  /// same manifest name if you use HLS manifest and low-latency HLS manifest. The
  /// manifestName on the HLSManifest object overrides the manifestName you
  /// provided on the originEndpoint object.
  final String manifestName;

  /// A short string that's appended to the endpoint URL. The child manifest name
  /// creates a unique path to this endpoint. If you don't enter a value,
  /// MediaPackage uses the default manifest name, index, with an added suffix to
  /// distinguish it from the manifest name. The manifestName on the HLSManifest
  /// object overrides the manifestName you provided on the originEndpoint object.
  final String? childManifestName;
  final FilterConfiguration? filterConfiguration;

  /// The total duration (in seconds) of the manifest's content.
  final int? manifestWindowSeconds;

  /// Inserts EXT-X-PROGRAM-DATE-TIME tags in the output manifest at the interval
  /// that you specify. If you don't enter an interval, EXT-X-PROGRAM-DATE-TIME
  /// tags aren't included in the manifest. The tags sync the stream to the wall
  /// clock so that viewers can seek to a specific time in the playback timeline
  /// on the player.
  ///
  /// Irrespective of this parameter, if any ID3Timed metadata is in the HLS
  /// input, it is passed through to the HLS output.
  final int? programDateTimeIntervalSeconds;
  final ScteHls? scteHls;
  final StartTag? startTag;

  /// The type of path to use in manifest URIs. <code>LEAF</code> uses
  /// leaf-relative paths (for example, <code>index_1.m3u8</code>).
  /// <code>ROOT</code> uses root-relative paths that include the full path from
  /// root (for example,
  /// <code>/out/v1/channel-group/channel/endpoint/index_1.m3u8</code>). If you
  /// don't specify a value, the default is <code>LEAF</code>.
  final UriPathType? uriPathType;

  /// When enabled, MediaPackage URL-encodes the query string for API requests for
  /// HLS child manifests to comply with Amazon Web Services Signature Version 4
  /// (SigV4) signature signing protocol. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_sigv.html">Amazon
  /// Web Services Signature Version 4 for API requests</a> in <i>Identity and
  /// Access Management User Guide</i>.
  final bool? urlEncodeChildManifest;

  CreateHlsManifestConfiguration({
    required this.manifestName,
    this.childManifestName,
    this.filterConfiguration,
    this.manifestWindowSeconds,
    this.programDateTimeIntervalSeconds,
    this.scteHls,
    this.startTag,
    this.uriPathType,
    this.urlEncodeChildManifest,
  });

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final childManifestName = this.childManifestName;
    final filterConfiguration = this.filterConfiguration;
    final manifestWindowSeconds = this.manifestWindowSeconds;
    final programDateTimeIntervalSeconds = this.programDateTimeIntervalSeconds;
    final scteHls = this.scteHls;
    final startTag = this.startTag;
    final uriPathType = this.uriPathType;
    final urlEncodeChildManifest = this.urlEncodeChildManifest;
    return {
      'ManifestName': manifestName,
      if (childManifestName != null) 'ChildManifestName': childManifestName,
      if (filterConfiguration != null)
        'FilterConfiguration': filterConfiguration,
      if (manifestWindowSeconds != null)
        'ManifestWindowSeconds': manifestWindowSeconds,
      if (programDateTimeIntervalSeconds != null)
        'ProgramDateTimeIntervalSeconds': programDateTimeIntervalSeconds,
      if (scteHls != null) 'ScteHls': scteHls,
      if (startTag != null) 'StartTag': startTag,
      if (uriPathType != null) 'UriPathType': uriPathType.value,
      if (urlEncodeChildManifest != null)
        'UrlEncodeChildManifest': urlEncodeChildManifest,
    };
  }
}

/// The configuration of the channel.
///
/// @nodoc
class ChannelListConfiguration {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The name that describes the channel. The name is the primary identifier for
  /// the channel, and must be unique for your account in the AWS Region and
  /// channel group.
  final String channelName;

  /// The date and time the channel was created.
  final DateTime createdAt;

  /// The date and time the channel was modified.
  final DateTime modifiedAt;

  /// Any descriptive information that you want to add to the channel for future
  /// identification purposes.
  final String? description;

  /// The input type will be an immutable field which will be used to define
  /// whether the channel will allow CMAF ingest or HLS ingest. If unprovided, it
  /// will default to HLS to preserve current behavior.
  ///
  /// The allowed values are:
  ///
  /// <ul>
  /// <li>
  /// <code>HLS</code> - The HLS streaming specification (which defines M3U8
  /// manifests and TS segments).
  /// </li>
  /// <li>
  /// <code>CMAF</code> - The DASH-IF CMAF Ingest specification (which defines
  /// CMAF segments with optional DASH manifests).
  /// </li>
  /// </ul>
  final InputType? inputType;

  ChannelListConfiguration({
    required this.arn,
    required this.channelGroupName,
    required this.channelName,
    required this.createdAt,
    required this.modifiedAt,
    this.description,
    this.inputType,
  });

  factory ChannelListConfiguration.fromJson(Map<String, dynamic> json) {
    return ChannelListConfiguration(
      arn: (json['Arn'] as String?) ?? '',
      channelGroupName: (json['ChannelGroupName'] as String?) ?? '',
      channelName: (json['ChannelName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] ?? 0),
      description: json['Description'] as String?,
      inputType: (json['InputType'] as String?)?.let(InputType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final channelName = this.channelName;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final description = this.description;
    final inputType = this.inputType;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'ChannelName': channelName,
      'CreatedAt': unixTimestampToJson(createdAt),
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      if (description != null) 'Description': description,
      if (inputType != null) 'InputType': inputType.value,
    };
  }
}

/// @nodoc
class InputType {
  static const hls = InputType._('HLS');
  static const cmaf = InputType._('CMAF');

  final String value;

  const InputType._(this.value);

  static const values = [hls, cmaf];

  static InputType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => InputType._(value));

  @override
  bool operator ==(other) => other is InputType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration for input switching based on the media quality confidence
/// score (MQCS) as provided from AWS Elemental MediaLive.
///
/// @nodoc
class InputSwitchConfiguration {
  /// When true, AWS Elemental MediaPackage performs input switching based on the
  /// MQCS. Default is false. This setting is valid only when
  /// <code>InputType</code> is <code>CMAF</code>.
  final bool? mQCSInputSwitching;

  /// For CMAF inputs, indicates which input MediaPackage should prefer when both
  /// inputs have equal MQCS scores. Select <code>1</code> to prefer the first
  /// ingest endpoint, or <code>2</code> to prefer the second ingest endpoint. If
  /// you don't specify a preferred input, MediaPackage uses its default switching
  /// behavior when MQCS scores are equal.
  final int? preferredInput;

  InputSwitchConfiguration({
    this.mQCSInputSwitching,
    this.preferredInput,
  });

  factory InputSwitchConfiguration.fromJson(Map<String, dynamic> json) {
    return InputSwitchConfiguration(
      mQCSInputSwitching: json['MQCSInputSwitching'] as bool?,
      preferredInput: json['PreferredInput'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final mQCSInputSwitching = this.mQCSInputSwitching;
    final preferredInput = this.preferredInput;
    return {
      if (mQCSInputSwitching != null) 'MQCSInputSwitching': mQCSInputSwitching,
      if (preferredInput != null) 'PreferredInput': preferredInput,
    };
  }
}

/// The settings for what common media server data (CMSD) headers AWS Elemental
/// MediaPackage includes in responses to the CDN.
///
/// @nodoc
class OutputHeaderConfiguration {
  /// When true, AWS Elemental MediaPackage includes the MQCS in responses to the
  /// CDN. This setting is valid only when <code>InputType</code> is
  /// <code>CMAF</code>.
  final bool? publishMQCS;

  OutputHeaderConfiguration({
    this.publishMQCS,
  });

  factory OutputHeaderConfiguration.fromJson(Map<String, dynamic> json) {
    return OutputHeaderConfiguration(
      publishMQCS: json['PublishMQCS'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final publishMQCS = this.publishMQCS;
    return {
      if (publishMQCS != null) 'PublishMQCS': publishMQCS,
    };
  }
}

/// The ingest domain URL where the source stream should be sent.
///
/// @nodoc
class IngestEndpoint {
  /// The system-generated unique identifier for the IngestEndpoint.
  final String? id;

  /// The ingest domain URL where the source stream should be sent.
  final String? url;

  IngestEndpoint({
    this.id,
    this.url,
  });

  factory IngestEndpoint.fromJson(Map<String, dynamic> json) {
    return IngestEndpoint(
      id: json['Id'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final url = this.url;
    return {
      if (id != null) 'Id': id,
      if (url != null) 'Url': url,
    };
  }
}

/// The configuration of the channel group.
///
/// @nodoc
class ChannelGroupListConfiguration {
  /// The Amazon Resource Name (ARN) associated with the resource.
  final String arn;

  /// The name that describes the channel group. The name is the primary
  /// identifier for the channel group, and must be unique for your account in the
  /// AWS Region.
  final String channelGroupName;

  /// The date and time the channel group was created.
  final DateTime createdAt;

  /// The date and time the channel group was modified.
  final DateTime modifiedAt;

  /// Any descriptive information that you want to add to the channel group for
  /// future identification purposes.
  final String? description;

  ChannelGroupListConfiguration({
    required this.arn,
    required this.channelGroupName,
    required this.createdAt,
    required this.modifiedAt,
    this.description,
  });

  factory ChannelGroupListConfiguration.fromJson(Map<String, dynamic> json) {
    return ChannelGroupListConfiguration(
      arn: (json['Arn'] as String?) ?? '',
      channelGroupName: (json['ChannelGroupName'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] ?? 0),
      modifiedAt: nonNullableTimeStampFromJson(json['ModifiedAt'] ?? 0),
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelGroupName = this.channelGroupName;
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final description = this.description;
    return {
      'Arn': arn,
      'ChannelGroupName': channelGroupName,
      'CreatedAt': unixTimestampToJson(createdAt),
      'ModifiedAt': unixTimestampToJson(modifiedAt),
      if (description != null) 'Description': description,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};

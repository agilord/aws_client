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

/// Use the AWS Elemental MediaTailor SDK to configure scalable ad insertion for
/// your live and VOD content. With AWS Elemental MediaTailor, you can serve
/// targeted ads to viewers while maintaining broadcast quality in over-the-top
/// (OTT) video applications. For information about using the service, including
/// detailed information about the settings covered in this guide, see the AWS
/// Elemental MediaTailor User Guide.
/// Through the SDK, you manage AWS Elemental MediaTailor configurations the
/// same as you do through the console. For example, you specify ad insertion
/// behavior and mapping information for the origin server and the ad decision
/// server (ADS).
class MediaTailor {
  final _s.RestJsonProtocol _protocol;
  MediaTailor({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'api.mediatailor',
            signingName: 'mediatailor',
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

  /// Deletes the playback configuration for the specified name.
  ///
  /// Parameter [name] :
  /// The identifier for the playback configuration.
  Future<void> deletePlaybackConfiguration({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/playbackConfiguration/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns the playback configuration for the specified name.
  ///
  /// Parameter [name] :
  /// The identifier for the playback configuration.
  Future<GetPlaybackConfigurationResponse> getPlaybackConfiguration({
    required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/playbackConfiguration/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPlaybackConfigurationResponse.fromJson(response);
  }

  /// Returns a list of the playback configurations defined in AWS Elemental
  /// MediaTailor. You can specify a maximum number of configurations to return
  /// at a time. The default maximum is 50. Results are returned in pagefuls. If
  /// MediaTailor has more configurations than the specified maximum, it
  /// provides parameters in the response that you can use to retrieve the next
  /// pageful.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of records to return.
  ///
  /// Parameter [nextToken] :
  /// Pagination token returned by the GET list request when results exceed the
  /// maximum allowed. Use the token to fetch the next page of results.
  Future<ListPlaybackConfigurationsResponse> listPlaybackConfigurations({
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
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/playbackConfigurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPlaybackConfigurationsResponse.fromJson(response);
  }

  /// Returns a list of the tags assigned to the specified playback
  /// configuration resource.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the playback configuration. You can get
  /// this from the response to any playback configuration request.
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

  /// Adds a new playback configuration to AWS Elemental MediaTailor.
  ///
  /// Parameter [adDecisionServerUrl] :
  /// The URL for the ad decision server (ADS). This includes the specification
  /// of static parameters and placeholders for dynamic parameters. AWS
  /// Elemental MediaTailor substitutes player-specific and session-specific
  /// parameters as needed when calling the ADS. Alternately, for testing you
  /// can provide a static VAST URL. The maximum length is 25,000 characters.
  ///
  /// Parameter [availSuppression] :
  /// The configuration for Avail Suppression. Ad suppression can be used to
  /// turn off ad personalization in a long manifest, or if a viewer joins
  /// mid-break.
  ///
  /// Parameter [bumper] :
  /// The configuration for bumpers. Bumpers are short audio or video clips that
  /// play at the start or before the end of an ad break.
  ///
  /// Parameter [cdnConfiguration] :
  /// The configuration for using a content delivery network (CDN), like Amazon
  /// CloudFront, for content and ad segment management.
  ///
  /// Parameter [dashConfiguration] :
  /// The configuration for DASH content.
  ///
  /// Parameter [livePreRollConfiguration] :
  /// The configuration for pre-roll ad insertion.
  ///
  /// Parameter [manifestProcessingRules] :
  /// The configuration for manifest processing rules. Manifest processing rules
  /// enable customization of the personalized manifests created by MediaTailor.
  ///
  /// Parameter [name] :
  /// The identifier for the playback configuration.
  ///
  /// Parameter [personalizationThresholdSeconds] :
  /// The maximum duration of underfilled ad time (in seconds) allowed in an ad
  /// break.
  ///
  /// Parameter [slateAdUrl] :
  /// The URL for a high-quality video asset to transcode and use to fill in
  /// time that's not used by ads. AWS Elemental MediaTailor shows the slate to
  /// fill in gaps in media content. Configuring the slate is optional for
  /// non-VPAID configurations. For VPAID, the slate is required because
  /// MediaTailor provides it in the slots that are designated for dynamic ad
  /// content. The slate must be a high-quality asset that contains both audio
  /// and video.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the playback configuration.
  ///
  /// Parameter [transcodeProfileName] :
  /// The name that is used to associate this playback configuration with a
  /// custom transcode profile. This overrides the dynamic transcoding defaults
  /// of MediaTailor. Use this only if you have already set up custom profiles
  /// with the help of AWS Support.
  ///
  /// Parameter [videoContentSourceUrl] :
  /// The URL prefix for the master playlist for the stream, minus the asset ID.
  /// The maximum length is 512 characters.
  Future<PutPlaybackConfigurationResponse> putPlaybackConfiguration({
    String? adDecisionServerUrl,
    AvailSuppression? availSuppression,
    Bumper? bumper,
    CdnConfiguration? cdnConfiguration,
    DashConfigurationForPut? dashConfiguration,
    LivePreRollConfiguration? livePreRollConfiguration,
    ManifestProcessingRules? manifestProcessingRules,
    String? name,
    int? personalizationThresholdSeconds,
    String? slateAdUrl,
    Map<String, String>? tags,
    String? transcodeProfileName,
    String? videoContentSourceUrl,
  }) async {
    _s.validateNumRange(
      'personalizationThresholdSeconds',
      personalizationThresholdSeconds,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (adDecisionServerUrl != null)
        'AdDecisionServerUrl': adDecisionServerUrl,
      if (availSuppression != null) 'AvailSuppression': availSuppression,
      if (bumper != null) 'Bumper': bumper,
      if (cdnConfiguration != null) 'CdnConfiguration': cdnConfiguration,
      if (dashConfiguration != null) 'DashConfiguration': dashConfiguration,
      if (livePreRollConfiguration != null)
        'LivePreRollConfiguration': livePreRollConfiguration,
      if (manifestProcessingRules != null)
        'ManifestProcessingRules': manifestProcessingRules,
      if (name != null) 'Name': name,
      if (personalizationThresholdSeconds != null)
        'PersonalizationThresholdSeconds': personalizationThresholdSeconds,
      if (slateAdUrl != null) 'SlateAdUrl': slateAdUrl,
      if (tags != null) 'tags': tags,
      if (transcodeProfileName != null)
        'TranscodeProfileName': transcodeProfileName,
      if (videoContentSourceUrl != null)
        'VideoContentSourceUrl': videoContentSourceUrl,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/playbackConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return PutPlaybackConfigurationResponse.fromJson(response);
  }

  /// Adds tags to the specified playback configuration resource. You can
  /// specify one or more tags to add.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the playback configuration. You can get
  /// this from the response to any playback configuration request.
  ///
  /// Parameter [tags] :
  /// A comma-separated list of tag key:value pairs. For example:
  /// {
  /// "Key1": "Value1",
  /// "Key2": "Value2"
  /// }
  ///
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
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

  /// Removes tags from the specified playback configuration resource. You can
  /// specify one or more tags to remove.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the playback configuration. You can get
  /// this from the response to any playback configuration request.
  ///
  /// Parameter [tagKeys] :
  /// A comma-separated list of the tag keys to remove from the playback
  /// configuration.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
}

/// The configuration for Ad Marker Passthrough. Ad marker passthrough can be
/// used to pass ad markers from the origin to the customized manifest.
class AdMarkerPassthrough {
  /// For HLS, when set to true, MediaTailor passes through EXT-X-CUE-IN,
  /// EXT-X-CUE-OUT, and EXT-X-SPLICEPOINT-SCTE35 ad markers from the origin
  /// manifest to the MediaTailor personalized manifest.
  ///
  /// No logic is applied to these ad markers. For example, if EXT-X-CUE-OUT has a
  /// value of 60, but no ads are filled for that ad break, MediaTailor will not
  /// set the value to 0.
  final bool? enabled;

  AdMarkerPassthrough({
    this.enabled,
  });
  factory AdMarkerPassthrough.fromJson(Map<String, dynamic> json) {
    return AdMarkerPassthrough(
      enabled: json['Enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'Enabled': enabled,
    };
  }
}

/// The configuration for Avail Suppression. Ad suppression can be used to turn
/// off ad personalization in a long manifest, or if a viewer joins mid-break.
class AvailSuppression {
  /// Sets the mode for avail suppression, also known as ad suppression. By
  /// default, ad suppression is off and all ad breaks are filled by MediaTailor
  /// with ads or slate.
  final Mode? mode;

  /// The avail suppression value is a live edge offset time in HH:MM:SS.
  /// MediaTailor won't fill ad breaks on or behind this time in the manifest
  /// lookback window.
  final String? value;

  AvailSuppression({
    this.mode,
    this.value,
  });
  factory AvailSuppression.fromJson(Map<String, dynamic> json) {
    return AvailSuppression(
      mode: (json['Mode'] as String?)?.toMode(),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    final value = this.value;
    return {
      if (mode != null) 'Mode': mode.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

/// The configuration for bumpers. Bumpers are short audio or video clips that
/// play at the start or before the end of an ad break.
class Bumper {
  /// The URL for the end bumper asset.
  final String? endUrl;

  /// The URL for the start bumper asset.
  final String? startUrl;

  Bumper({
    this.endUrl,
    this.startUrl,
  });
  factory Bumper.fromJson(Map<String, dynamic> json) {
    return Bumper(
      endUrl: json['EndUrl'] as String?,
      startUrl: json['StartUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endUrl = this.endUrl;
    final startUrl = this.startUrl;
    return {
      if (endUrl != null) 'EndUrl': endUrl,
      if (startUrl != null) 'StartUrl': startUrl,
    };
  }
}

/// The configuration for using a content delivery network (CDN), like Amazon
/// CloudFront, for content and ad segment management.
class CdnConfiguration {
  /// A non-default content delivery network (CDN) to serve ad segments. By
  /// default, AWS Elemental MediaTailor uses Amazon CloudFront with default cache
  /// settings as its CDN for ad segments. To set up an alternate CDN, create a
  /// rule in your CDN for the following origin:
  /// ads.mediatailor.&lt;region>.amazonaws.com. Then specify the rule's name in
  /// this AdSegmentUrlPrefix. When AWS Elemental MediaTailor serves a manifest,
  /// it reports your CDN as the source for ad segments.
  final String? adSegmentUrlPrefix;

  /// A content delivery network (CDN) to cache content segments, so that content
  /// requests don’t always have to go to the origin server. First, create a rule
  /// in your CDN for the content segment origin server. Then specify the rule's
  /// name in this ContentSegmentUrlPrefix. When AWS Elemental MediaTailor serves
  /// a manifest, it reports your CDN as the source for content segments.
  final String? contentSegmentUrlPrefix;

  CdnConfiguration({
    this.adSegmentUrlPrefix,
    this.contentSegmentUrlPrefix,
  });
  factory CdnConfiguration.fromJson(Map<String, dynamic> json) {
    return CdnConfiguration(
      adSegmentUrlPrefix: json['AdSegmentUrlPrefix'] as String?,
      contentSegmentUrlPrefix: json['ContentSegmentUrlPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adSegmentUrlPrefix = this.adSegmentUrlPrefix;
    final contentSegmentUrlPrefix = this.contentSegmentUrlPrefix;
    return {
      if (adSegmentUrlPrefix != null) 'AdSegmentUrlPrefix': adSegmentUrlPrefix,
      if (contentSegmentUrlPrefix != null)
        'ContentSegmentUrlPrefix': contentSegmentUrlPrefix,
    };
  }
}

/// The configuration for DASH content.
class DashConfiguration {
  /// The URL generated by MediaTailor to initiate a playback session. The session
  /// uses server-side reporting. This setting is ignored in PUT operations.
  final String? manifestEndpointPrefix;

  /// The setting that controls whether MediaTailor includes the Location tag in
  /// DASH manifests. MediaTailor populates the Location tag with the URL for
  /// manifest update requests, to be used by players that don't support sticky
  /// redirects. Disable this if you have CDN routing rules set up for accessing
  /// MediaTailor manifests, and you are either using client-side reporting or
  /// your players support sticky HTTP redirects. Valid values are DISABLED and
  /// EMT_DEFAULT. The EMT_DEFAULT setting enables the inclusion of the tag and is
  /// the default value.
  final String? mpdLocation;

  /// The setting that controls whether MediaTailor handles manifests from the
  /// origin server as multi-period manifests or single-period manifests. If your
  /// origin server produces single-period manifests, set this to SINGLE_PERIOD.
  /// The default setting is MULTI_PERIOD. For multi-period manifests, omit this
  /// setting or set it to MULTI_PERIOD.
  final OriginManifestType? originManifestType;

  DashConfiguration({
    this.manifestEndpointPrefix,
    this.mpdLocation,
    this.originManifestType,
  });
  factory DashConfiguration.fromJson(Map<String, dynamic> json) {
    return DashConfiguration(
      manifestEndpointPrefix: json['ManifestEndpointPrefix'] as String?,
      mpdLocation: json['MpdLocation'] as String?,
      originManifestType:
          (json['OriginManifestType'] as String?)?.toOriginManifestType(),
    );
  }
}

/// The configuration for DASH PUT operations.
class DashConfigurationForPut {
  /// The setting that controls whether MediaTailor includes the Location tag in
  /// DASH manifests. MediaTailor populates the Location tag with the URL for
  /// manifest update requests, to be used by players that don't support sticky
  /// redirects. Disable this if you have CDN routing rules set up for accessing
  /// MediaTailor manifests, and you are either using client-side reporting or
  /// your players support sticky HTTP redirects. Valid values are DISABLED and
  /// EMT_DEFAULT. The EMT_DEFAULT setting enables the inclusion of the tag and is
  /// the default value.
  final String? mpdLocation;

  /// The setting that controls whether MediaTailor handles manifests from the
  /// origin server as multi-period manifests or single-period manifests. If your
  /// origin server produces single-period manifests, set this to SINGLE_PERIOD.
  /// The default setting is MULTI_PERIOD. For multi-period manifests, omit this
  /// setting or set it to MULTI_PERIOD.
  final OriginManifestType? originManifestType;

  DashConfigurationForPut({
    this.mpdLocation,
    this.originManifestType,
  });
  Map<String, dynamic> toJson() {
    final mpdLocation = this.mpdLocation;
    final originManifestType = this.originManifestType;
    return {
      if (mpdLocation != null) 'MpdLocation': mpdLocation,
      if (originManifestType != null)
        'OriginManifestType': originManifestType.toValue(),
    };
  }
}

class DeletePlaybackConfigurationResponse {
  DeletePlaybackConfigurationResponse();
  factory DeletePlaybackConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return DeletePlaybackConfigurationResponse();
  }
}

class GetPlaybackConfigurationResponse {
  /// The URL for the ad decision server (ADS). This includes the specification of
  /// static parameters and placeholders for dynamic parameters. AWS Elemental
  /// MediaTailor substitutes player-specific and session-specific parameters as
  /// needed when calling the ADS. Alternately, for testing, you can provide a
  /// static VAST URL. The maximum length is 25,000 characters.
  final String? adDecisionServerUrl;

  /// The configuration for Avail Suppression. Ad suppression can be used to turn
  /// off ad personalization in a long manifest, or if a viewer joins mid-break.
  final AvailSuppression? availSuppression;

  /// The configuration for bumpers. Bumpers are short audio or video clips that
  /// play at the start or before the end of an ad break.
  final Bumper? bumper;

  /// The configuration for using a content delivery network (CDN), like Amazon
  /// CloudFront, for content and ad segment management.
  final CdnConfiguration? cdnConfiguration;

  /// The configuration for DASH content.
  final DashConfiguration? dashConfiguration;

  /// The configuration for HLS content.
  final HlsConfiguration? hlsConfiguration;

  /// The configuration for pre-roll ad insertion.
  final LivePreRollConfiguration? livePreRollConfiguration;

  /// The configuration for manifest processing rules. Manifest processing rules
  /// enable customization of the personalized manifests created by MediaTailor.
  final ManifestProcessingRules? manifestProcessingRules;

  /// The identifier for the playback configuration.
  final String? name;

  /// The maximum duration of underfilled ad time (in seconds) allowed in an ad
  /// break.
  final int? personalizationThresholdSeconds;

  /// The Amazon Resource Name (ARN) for the playback configuration.
  final String? playbackConfigurationArn;

  /// The URL that the player accesses to get a manifest from AWS Elemental
  /// MediaTailor. This session will use server-side reporting.
  final String? playbackEndpointPrefix;

  /// The URL that the player uses to initialize a session that uses client-side
  /// reporting.
  final String? sessionInitializationEndpointPrefix;

  /// The URL for a high-quality video asset to transcode and use to fill in time
  /// that's not used by ads. AWS Elemental MediaTailor shows the slate to fill in
  /// gaps in media content. Configuring the slate is optional for non-VPAID
  /// playback configurations. For VPAID, the slate is required because
  /// MediaTailor provides it in the slots designated for dynamic ad content. The
  /// slate must be a high-quality asset that contains both audio and video.
  final String? slateAdUrl;

  /// The tags assigned to the playback configuration.
  final Map<String, String>? tags;

  /// The name that is used to associate this playback configuration with a custom
  /// transcode profile. This overrides the dynamic transcoding defaults of
  /// MediaTailor. Use this only if you have already set up custom profiles with
  /// the help of AWS Support.
  final String? transcodeProfileName;

  /// The URL prefix for the master playlist for the stream, minus the asset ID.
  /// The maximum length is 512 characters.
  final String? videoContentSourceUrl;

  GetPlaybackConfigurationResponse({
    this.adDecisionServerUrl,
    this.availSuppression,
    this.bumper,
    this.cdnConfiguration,
    this.dashConfiguration,
    this.hlsConfiguration,
    this.livePreRollConfiguration,
    this.manifestProcessingRules,
    this.name,
    this.personalizationThresholdSeconds,
    this.playbackConfigurationArn,
    this.playbackEndpointPrefix,
    this.sessionInitializationEndpointPrefix,
    this.slateAdUrl,
    this.tags,
    this.transcodeProfileName,
    this.videoContentSourceUrl,
  });
  factory GetPlaybackConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetPlaybackConfigurationResponse(
      adDecisionServerUrl: json['AdDecisionServerUrl'] as String?,
      availSuppression: json['AvailSuppression'] != null
          ? AvailSuppression.fromJson(
              json['AvailSuppression'] as Map<String, dynamic>)
          : null,
      bumper: json['Bumper'] != null
          ? Bumper.fromJson(json['Bumper'] as Map<String, dynamic>)
          : null,
      cdnConfiguration: json['CdnConfiguration'] != null
          ? CdnConfiguration.fromJson(
              json['CdnConfiguration'] as Map<String, dynamic>)
          : null,
      dashConfiguration: json['DashConfiguration'] != null
          ? DashConfiguration.fromJson(
              json['DashConfiguration'] as Map<String, dynamic>)
          : null,
      hlsConfiguration: json['HlsConfiguration'] != null
          ? HlsConfiguration.fromJson(
              json['HlsConfiguration'] as Map<String, dynamic>)
          : null,
      livePreRollConfiguration: json['LivePreRollConfiguration'] != null
          ? LivePreRollConfiguration.fromJson(
              json['LivePreRollConfiguration'] as Map<String, dynamic>)
          : null,
      manifestProcessingRules: json['ManifestProcessingRules'] != null
          ? ManifestProcessingRules.fromJson(
              json['ManifestProcessingRules'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      personalizationThresholdSeconds:
          json['PersonalizationThresholdSeconds'] as int?,
      playbackConfigurationArn: json['PlaybackConfigurationArn'] as String?,
      playbackEndpointPrefix: json['PlaybackEndpointPrefix'] as String?,
      sessionInitializationEndpointPrefix:
          json['SessionInitializationEndpointPrefix'] as String?,
      slateAdUrl: json['SlateAdUrl'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      transcodeProfileName: json['TranscodeProfileName'] as String?,
      videoContentSourceUrl: json['VideoContentSourceUrl'] as String?,
    );
  }
}

/// The configuration for HLS content.
class HlsConfiguration {
  /// The URL that is used to initiate a playback session for devices that support
  /// Apple HLS. The session uses server-side reporting.
  final String? manifestEndpointPrefix;

  HlsConfiguration({
    this.manifestEndpointPrefix,
  });
  factory HlsConfiguration.fromJson(Map<String, dynamic> json) {
    return HlsConfiguration(
      manifestEndpointPrefix: json['ManifestEndpointPrefix'] as String?,
    );
  }
}

class ListPlaybackConfigurationsResponse {
  /// Array of playback configurations. This might be all the available
  /// configurations or a subset, depending on the settings that you provide and
  /// the total number of configurations stored.
  final List<PlaybackConfiguration>? items;

  /// Pagination token returned by the GET list request when results exceed the
  /// maximum allowed. Use the token to fetch the next page of results.
  final String? nextToken;

  ListPlaybackConfigurationsResponse({
    this.items,
    this.nextToken,
  });
  factory ListPlaybackConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListPlaybackConfigurationsResponse(
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => PlaybackConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListTagsForResourceResponse {
  /// A comma-separated list of tag key:value pairs. For example:
  /// {
  /// "Key1": "Value1",
  /// "Key2": "Value2"
  /// }
  ///
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

enum OriginManifestType {
  singlePeriod,
  multiPeriod,
}

extension OriginManifestTypeValueExtension on OriginManifestType {
  String toValue() {
    switch (this) {
      case OriginManifestType.singlePeriod:
        return 'SINGLE_PERIOD';
      case OriginManifestType.multiPeriod:
        return 'MULTI_PERIOD';
    }
  }
}

extension OriginManifestTypeFromString on String {
  OriginManifestType toOriginManifestType() {
    switch (this) {
      case 'SINGLE_PERIOD':
        return OriginManifestType.singlePeriod;
      case 'MULTI_PERIOD':
        return OriginManifestType.multiPeriod;
    }
    throw Exception('$this is not known in enum OriginManifestType');
  }
}

/// The configuration for manifest processing rules. Manifest processing rules
/// enable customization of the personalized manifests created by MediaTailor.
class ManifestProcessingRules {
  final AdMarkerPassthrough? adMarkerPassthrough;

  ManifestProcessingRules({
    this.adMarkerPassthrough,
  });
  factory ManifestProcessingRules.fromJson(Map<String, dynamic> json) {
    return ManifestProcessingRules(
      adMarkerPassthrough: json['AdMarkerPassthrough'] != null
          ? AdMarkerPassthrough.fromJson(
              json['AdMarkerPassthrough'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final adMarkerPassthrough = this.adMarkerPassthrough;
    return {
      if (adMarkerPassthrough != null)
        'AdMarkerPassthrough': adMarkerPassthrough,
    };
  }
}

enum Mode {
  off,
  behindLiveEdge,
}

extension ModeValueExtension on Mode {
  String toValue() {
    switch (this) {
      case Mode.off:
        return 'OFF';
      case Mode.behindLiveEdge:
        return 'BEHIND_LIVE_EDGE';
    }
  }
}

extension ModeFromString on String {
  Mode toMode() {
    switch (this) {
      case 'OFF':
        return Mode.off;
      case 'BEHIND_LIVE_EDGE':
        return Mode.behindLiveEdge;
    }
    throw Exception('$this is not known in enum Mode');
  }
}

/// The AWSMediaTailor configuration.
class PlaybackConfiguration {
  /// The URL for the ad decision server (ADS). This includes the specification of
  /// static parameters and placeholders for dynamic parameters. AWS Elemental
  /// MediaTailor substitutes player-specific and session-specific parameters as
  /// needed when calling the ADS. Alternately, for testing, you can provide a
  /// static VAST URL. The maximum length is 25,000 characters.
  final String? adDecisionServerUrl;

  /// The configuration for Avail Suppression. Ad suppression can be used to turn
  /// off ad personalization in a long manifest, or if a viewer joins mid-break.
  final AvailSuppression? availSuppression;

  /// The configuration for bumpers. Bumpers are short audio or video clips that
  /// play at the start or before the end of an ad break.
  final Bumper? bumper;

  /// The configuration for using a content delivery network (CDN), like Amazon
  /// CloudFront, for content and ad segment management.
  final CdnConfiguration? cdnConfiguration;

  /// The configuration for DASH content.
  final DashConfiguration? dashConfiguration;

  /// The configuration for HLS content.
  final HlsConfiguration? hlsConfiguration;

  /// The configuration for manifest processing rules. Manifest processing rules
  /// enable customization of the personalized manifests created by MediaTailor.
  final ManifestProcessingRules? manifestProcessingRules;

  /// The identifier for the playback configuration.
  final String? name;

  /// The maximum duration of underfilled ad time (in seconds) allowed in an ad
  /// break.
  final int? personalizationThresholdSeconds;

  /// The Amazon Resource Name (ARN) for the playback configuration.
  final String? playbackConfigurationArn;

  /// The URL that the player accesses to get a manifest from AWS Elemental
  /// MediaTailor. This session will use server-side reporting.
  final String? playbackEndpointPrefix;

  /// The URL that the player uses to initialize a session that uses client-side
  /// reporting.
  final String? sessionInitializationEndpointPrefix;

  /// The URL for a high-quality video asset to transcode and use to fill in time
  /// that's not used by ads. AWS Elemental MediaTailor shows the slate to fill in
  /// gaps in media content. Configuring the slate is optional for non-VPAID
  /// playback configurations. For VPAID, the slate is required because
  /// MediaTailor provides it in the slots designated for dynamic ad content. The
  /// slate must be a high-quality asset that contains both audio and video.
  final String? slateAdUrl;

  /// The tags assigned to the playback configuration.
  final Map<String, String>? tags;

  /// The name that is used to associate this playback configuration with a custom
  /// transcode profile. This overrides the dynamic transcoding defaults of
  /// MediaTailor. Use this only if you have already set up custom profiles with
  /// the help of AWS Support.
  final String? transcodeProfileName;

  /// The URL prefix for the master playlist for the stream, minus the asset ID.
  /// The maximum length is 512 characters.
  final String? videoContentSourceUrl;

  PlaybackConfiguration({
    this.adDecisionServerUrl,
    this.availSuppression,
    this.bumper,
    this.cdnConfiguration,
    this.dashConfiguration,
    this.hlsConfiguration,
    this.manifestProcessingRules,
    this.name,
    this.personalizationThresholdSeconds,
    this.playbackConfigurationArn,
    this.playbackEndpointPrefix,
    this.sessionInitializationEndpointPrefix,
    this.slateAdUrl,
    this.tags,
    this.transcodeProfileName,
    this.videoContentSourceUrl,
  });
  factory PlaybackConfiguration.fromJson(Map<String, dynamic> json) {
    return PlaybackConfiguration(
      adDecisionServerUrl: json['AdDecisionServerUrl'] as String?,
      availSuppression: json['AvailSuppression'] != null
          ? AvailSuppression.fromJson(
              json['AvailSuppression'] as Map<String, dynamic>)
          : null,
      bumper: json['Bumper'] != null
          ? Bumper.fromJson(json['Bumper'] as Map<String, dynamic>)
          : null,
      cdnConfiguration: json['CdnConfiguration'] != null
          ? CdnConfiguration.fromJson(
              json['CdnConfiguration'] as Map<String, dynamic>)
          : null,
      dashConfiguration: json['DashConfiguration'] != null
          ? DashConfiguration.fromJson(
              json['DashConfiguration'] as Map<String, dynamic>)
          : null,
      hlsConfiguration: json['HlsConfiguration'] != null
          ? HlsConfiguration.fromJson(
              json['HlsConfiguration'] as Map<String, dynamic>)
          : null,
      manifestProcessingRules: json['ManifestProcessingRules'] != null
          ? ManifestProcessingRules.fromJson(
              json['ManifestProcessingRules'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      personalizationThresholdSeconds:
          json['PersonalizationThresholdSeconds'] as int?,
      playbackConfigurationArn: json['PlaybackConfigurationArn'] as String?,
      playbackEndpointPrefix: json['PlaybackEndpointPrefix'] as String?,
      sessionInitializationEndpointPrefix:
          json['SessionInitializationEndpointPrefix'] as String?,
      slateAdUrl: json['SlateAdUrl'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      transcodeProfileName: json['TranscodeProfileName'] as String?,
      videoContentSourceUrl: json['VideoContentSourceUrl'] as String?,
    );
  }
}

/// The configuration for pre-roll ad insertion.
class LivePreRollConfiguration {
  /// The URL for the ad decision server (ADS) for pre-roll ads. This includes the
  /// specification of static parameters and placeholders for dynamic parameters.
  /// AWS Elemental MediaTailor substitutes player-specific and session-specific
  /// parameters as needed when calling the ADS. Alternately, for testing, you can
  /// provide a static VAST URL. The maximum length is 25,000 characters.
  final String? adDecisionServerUrl;

  /// The maximum allowed duration for the pre-roll ad avail. AWS Elemental
  /// MediaTailor won't play pre-roll ads to exceed this duration, regardless of
  /// the total duration of ads that the ADS returns.
  final int? maxDurationSeconds;

  LivePreRollConfiguration({
    this.adDecisionServerUrl,
    this.maxDurationSeconds,
  });
  factory LivePreRollConfiguration.fromJson(Map<String, dynamic> json) {
    return LivePreRollConfiguration(
      adDecisionServerUrl: json['AdDecisionServerUrl'] as String?,
      maxDurationSeconds: json['MaxDurationSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final adDecisionServerUrl = this.adDecisionServerUrl;
    final maxDurationSeconds = this.maxDurationSeconds;
    return {
      if (adDecisionServerUrl != null)
        'AdDecisionServerUrl': adDecisionServerUrl,
      if (maxDurationSeconds != null) 'MaxDurationSeconds': maxDurationSeconds,
    };
  }
}

class PutPlaybackConfigurationResponse {
  /// The URL for the ad decision server (ADS). This includes the specification of
  /// static parameters and placeholders for dynamic parameters. AWS Elemental
  /// MediaTailor substitutes player-specific and session-specific parameters as
  /// needed when calling the ADS. Alternately, for testing, you can provide a
  /// static VAST URL. The maximum length is 25,000 characters.
  final String? adDecisionServerUrl;

  /// The configuration for Avail Suppression. Ad suppression can be used to turn
  /// off ad personalization in a long manifest, or if a viewer joins mid-break.
  final AvailSuppression? availSuppression;

  /// The configuration for bumpers. Bumpers are short audio or video clips that
  /// play at the start or before the end of an ad break.
  final Bumper? bumper;

  /// The configuration for using a content delivery network (CDN), like Amazon
  /// CloudFront, for content and ad segment management.
  final CdnConfiguration? cdnConfiguration;

  /// The configuration for DASH content.
  final DashConfiguration? dashConfiguration;

  /// The configuration for HLS content.
  final HlsConfiguration? hlsConfiguration;

  /// The configuration for pre-roll ad insertion.
  final LivePreRollConfiguration? livePreRollConfiguration;

  /// The configuration for manifest processing rules. Manifest processing rules
  /// enable customization of the personalized manifests created by MediaTailor.
  final ManifestProcessingRules? manifestProcessingRules;

  /// The identifier for the playback configuration.
  final String? name;

  /// The maximum duration of underfilled ad time (in seconds) allowed in an ad
  /// break.
  final int? personalizationThresholdSeconds;

  /// The Amazon Resource Name (ARN) for the playback configuration.
  final String? playbackConfigurationArn;

  /// The URL that the player accesses to get a manifest from AWS Elemental
  /// MediaTailor. This session will use server-side reporting.
  final String? playbackEndpointPrefix;

  /// The URL that the player uses to initialize a session that uses client-side
  /// reporting.
  final String? sessionInitializationEndpointPrefix;

  /// The URL for a high-quality video asset to transcode and use to fill in time
  /// that's not used by ads. AWS Elemental MediaTailor shows the slate to fill in
  /// gaps in media content. Configuring the slate is optional for non-VPAID
  /// playback configurations. For VPAID, the slate is required because
  /// MediaTailor provides it in the slots designated for dynamic ad content. The
  /// slate must be a high-quality asset that contains both audio and video.
  final String? slateAdUrl;

  /// The tags assigned to the playback configuration.
  final Map<String, String>? tags;

  /// The name that is used to associate this playback configuration with a custom
  /// transcode profile. This overrides the dynamic transcoding defaults of
  /// MediaTailor. Use this only if you have already set up custom profiles with
  /// the help of AWS Support.
  final String? transcodeProfileName;

  /// The URL prefix for the master playlist for the stream, minus the asset ID.
  /// The maximum length is 512 characters.
  final String? videoContentSourceUrl;

  PutPlaybackConfigurationResponse({
    this.adDecisionServerUrl,
    this.availSuppression,
    this.bumper,
    this.cdnConfiguration,
    this.dashConfiguration,
    this.hlsConfiguration,
    this.livePreRollConfiguration,
    this.manifestProcessingRules,
    this.name,
    this.personalizationThresholdSeconds,
    this.playbackConfigurationArn,
    this.playbackEndpointPrefix,
    this.sessionInitializationEndpointPrefix,
    this.slateAdUrl,
    this.tags,
    this.transcodeProfileName,
    this.videoContentSourceUrl,
  });
  factory PutPlaybackConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return PutPlaybackConfigurationResponse(
      adDecisionServerUrl: json['AdDecisionServerUrl'] as String?,
      availSuppression: json['AvailSuppression'] != null
          ? AvailSuppression.fromJson(
              json['AvailSuppression'] as Map<String, dynamic>)
          : null,
      bumper: json['Bumper'] != null
          ? Bumper.fromJson(json['Bumper'] as Map<String, dynamic>)
          : null,
      cdnConfiguration: json['CdnConfiguration'] != null
          ? CdnConfiguration.fromJson(
              json['CdnConfiguration'] as Map<String, dynamic>)
          : null,
      dashConfiguration: json['DashConfiguration'] != null
          ? DashConfiguration.fromJson(
              json['DashConfiguration'] as Map<String, dynamic>)
          : null,
      hlsConfiguration: json['HlsConfiguration'] != null
          ? HlsConfiguration.fromJson(
              json['HlsConfiguration'] as Map<String, dynamic>)
          : null,
      livePreRollConfiguration: json['LivePreRollConfiguration'] != null
          ? LivePreRollConfiguration.fromJson(
              json['LivePreRollConfiguration'] as Map<String, dynamic>)
          : null,
      manifestProcessingRules: json['ManifestProcessingRules'] != null
          ? ManifestProcessingRules.fromJson(
              json['ManifestProcessingRules'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      personalizationThresholdSeconds:
          json['PersonalizationThresholdSeconds'] as int?,
      playbackConfigurationArn: json['PlaybackConfigurationArn'] as String?,
      playbackEndpointPrefix: json['PlaybackEndpointPrefix'] as String?,
      sessionInitializationEndpointPrefix:
          json['SessionInitializationEndpointPrefix'] as String?,
      slateAdUrl: json['SlateAdUrl'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      transcodeProfileName: json['TranscodeProfileName'] as String?,
      videoContentSourceUrl: json['VideoContentSourceUrl'] as String?,
    );
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
};

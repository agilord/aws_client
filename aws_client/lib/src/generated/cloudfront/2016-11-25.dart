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

/// This is the <i>Amazon CloudFront API Reference</i>. This guide is for
/// developers who need detailed information about the CloudFront API actions,
/// data types, and errors. For detailed information about CloudFront features
/// and their associated API calls, see the <i>Amazon CloudFront Developer
/// Guide</i>.
class CloudFront {
  final _s.RestXmlProtocol _protocol;
  CloudFront({
    String? region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cloudfront',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a new origin access identity. If you're using Amazon S3 for your
  /// origin, you can use an origin access identity to require users to access
  /// your content using a CloudFront URL instead of the Amazon S3 URL. For more
  /// information about how to use origin access identities, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving
  /// Private Content through CloudFront</a> in the <i>Amazon CloudFront
  /// Developer Guide</i>.
  ///
  /// May throw [CloudFrontOriginAccessIdentityAlreadyExists].
  /// May throw [MissingBody].
  /// May throw [TooManyCloudFrontOriginAccessIdentities].
  /// May throw [InvalidArgument].
  /// May throw [InconsistentQuantities].
  ///
  /// Parameter [cloudFrontOriginAccessIdentityConfig] :
  /// The current configuration information for the identity.
  Future<CreateCloudFrontOriginAccessIdentityResult>
      createCloudFrontOriginAccessIdentity2016_11_25({
    required CloudFrontOriginAccessIdentityConfig
        cloudFrontOriginAccessIdentityConfig,
  }) async {
    ArgumentError.checkNotNull(cloudFrontOriginAccessIdentityConfig,
        'cloudFrontOriginAccessIdentityConfig');
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2016-11-25/origin-access-identity/cloudfront',
      payload: cloudFrontOriginAccessIdentityConfig
          .toXml('CloudFrontOriginAccessIdentityConfig'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateCloudFrontOriginAccessIdentityResult(
      cloudFrontOriginAccessIdentity:
          CloudFrontOriginAccessIdentity.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
      location: _s.extractHeaderStringValue($result.headers, 'Location'),
    );
  }

  /// Creates a new web distribution. Send a <code>GET</code> request to the
  /// <code>/<i>CloudFront API
  /// version</i>/distribution</code>/<code>distribution ID</code> resource.
  ///
  /// May throw [CNAMEAlreadyExists].
  /// May throw [DistributionAlreadyExists].
  /// May throw [InvalidOrigin].
  /// May throw [InvalidOriginAccessIdentity].
  /// May throw [AccessDenied].
  /// May throw [TooManyTrustedSigners].
  /// May throw [TrustedSignerDoesNotExist].
  /// May throw [InvalidViewerCertificate].
  /// May throw [InvalidMinimumProtocolVersion].
  /// May throw [MissingBody].
  /// May throw [TooManyDistributionCNAMEs].
  /// May throw [TooManyDistributions].
  /// May throw [InvalidDefaultRootObject].
  /// May throw [InvalidRelativePath].
  /// May throw [InvalidErrorCode].
  /// May throw [InvalidResponseCode].
  /// May throw [InvalidArgument].
  /// May throw [InvalidRequiredProtocol].
  /// May throw [NoSuchOrigin].
  /// May throw [TooManyOrigins].
  /// May throw [TooManyCacheBehaviors].
  /// May throw [TooManyCookieNamesInWhiteList].
  /// May throw [InvalidForwardCookies].
  /// May throw [TooManyHeadersInForwardedValues].
  /// May throw [InvalidHeadersForS3Origin].
  /// May throw [InconsistentQuantities].
  /// May throw [TooManyCertificates].
  /// May throw [InvalidLocationCode].
  /// May throw [InvalidGeoRestrictionParameter].
  /// May throw [InvalidProtocolSettings].
  /// May throw [InvalidTTLOrder].
  /// May throw [InvalidWebACLId].
  /// May throw [TooManyOriginCustomHeaders].
  /// May throw [TooManyQueryStringParameters].
  /// May throw [InvalidQueryStringParameters].
  /// May throw [TooManyDistributionsWithLambdaAssociations].
  /// May throw [TooManyLambdaFunctionAssociations].
  /// May throw [InvalidLambdaFunctionAssociation].
  ///
  /// Parameter [distributionConfig] :
  /// The distribution's configuration information.
  Future<CreateDistributionResult> createDistribution2016_11_25({
    required DistributionConfig distributionConfig,
  }) async {
    ArgumentError.checkNotNull(distributionConfig, 'distributionConfig');
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2016-11-25/distribution',
      payload: distributionConfig.toXml('DistributionConfig'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateDistributionResult(
      distribution: Distribution.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
      location: _s.extractHeaderStringValue($result.headers, 'Location'),
    );
  }

  /// Create a new distribution with tags.
  ///
  /// May throw [CNAMEAlreadyExists].
  /// May throw [DistributionAlreadyExists].
  /// May throw [InvalidOrigin].
  /// May throw [InvalidOriginAccessIdentity].
  /// May throw [AccessDenied].
  /// May throw [TooManyTrustedSigners].
  /// May throw [TrustedSignerDoesNotExist].
  /// May throw [InvalidViewerCertificate].
  /// May throw [InvalidMinimumProtocolVersion].
  /// May throw [MissingBody].
  /// May throw [TooManyDistributionCNAMEs].
  /// May throw [TooManyDistributions].
  /// May throw [InvalidDefaultRootObject].
  /// May throw [InvalidRelativePath].
  /// May throw [InvalidErrorCode].
  /// May throw [InvalidResponseCode].
  /// May throw [InvalidArgument].
  /// May throw [InvalidRequiredProtocol].
  /// May throw [NoSuchOrigin].
  /// May throw [TooManyOrigins].
  /// May throw [TooManyCacheBehaviors].
  /// May throw [TooManyCookieNamesInWhiteList].
  /// May throw [InvalidForwardCookies].
  /// May throw [TooManyHeadersInForwardedValues].
  /// May throw [InvalidHeadersForS3Origin].
  /// May throw [InconsistentQuantities].
  /// May throw [TooManyCertificates].
  /// May throw [InvalidLocationCode].
  /// May throw [InvalidGeoRestrictionParameter].
  /// May throw [InvalidProtocolSettings].
  /// May throw [InvalidTTLOrder].
  /// May throw [InvalidWebACLId].
  /// May throw [TooManyOriginCustomHeaders].
  /// May throw [InvalidTagging].
  /// May throw [TooManyQueryStringParameters].
  /// May throw [InvalidQueryStringParameters].
  /// May throw [TooManyDistributionsWithLambdaAssociations].
  /// May throw [TooManyLambdaFunctionAssociations].
  /// May throw [InvalidLambdaFunctionAssociation].
  ///
  /// Parameter [distributionConfigWithTags] :
  /// The distribution's configuration information.
  Future<CreateDistributionWithTagsResult>
      createDistributionWithTags2016_11_25({
    required DistributionConfigWithTags distributionConfigWithTags,
  }) async {
    ArgumentError.checkNotNull(
        distributionConfigWithTags, 'distributionConfigWithTags');
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2016-11-25/distribution?WithTags',
      payload: distributionConfigWithTags.toXml('DistributionConfigWithTags'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateDistributionWithTagsResult(
      distribution: Distribution.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
      location: _s.extractHeaderStringValue($result.headers, 'Location'),
    );
  }

  /// Create a new invalidation.
  ///
  /// May throw [AccessDenied].
  /// May throw [MissingBody].
  /// May throw [InvalidArgument].
  /// May throw [NoSuchDistribution].
  /// May throw [BatchTooLarge].
  /// May throw [TooManyInvalidationsInProgress].
  /// May throw [InconsistentQuantities].
  ///
  /// Parameter [distributionId] :
  /// The distribution's id.
  ///
  /// Parameter [invalidationBatch] :
  /// The batch information for the invalidation.
  Future<CreateInvalidationResult> createInvalidation2016_11_25({
    required String distributionId,
    required InvalidationBatch invalidationBatch,
  }) async {
    ArgumentError.checkNotNull(distributionId, 'distributionId');
    ArgumentError.checkNotNull(invalidationBatch, 'invalidationBatch');
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri:
          '/2016-11-25/distribution/${Uri.encodeComponent(distributionId)}/invalidation',
      payload: invalidationBatch.toXml('InvalidationBatch'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateInvalidationResult(
      invalidation: Invalidation.fromXml($elem),
      location: _s.extractHeaderStringValue($result.headers, 'Location'),
    );
  }

  /// Creates a new RMTP distribution. An RTMP distribution is similar to a web
  /// distribution, but an RTMP distribution streams media files using the Adobe
  /// Real-Time Messaging Protocol (RTMP) instead of serving files using HTTP.
  ///
  /// To create a new web distribution, submit a <code>POST</code> request to
  /// the <i>CloudFront API version</i>/distribution resource. The request body
  /// must include a document with a <i>StreamingDistributionConfig</i> element.
  /// The response echoes the <code>StreamingDistributionConfig</code> element
  /// and returns other information about the RTMP distribution.
  ///
  /// To get the status of your request, use the <i>GET
  /// StreamingDistribution</i> API action. When the value of
  /// <code>Enabled</code> is <code>true</code> and the value of
  /// <code>Status</code> is <code>Deployed</code>, your distribution is ready.
  /// A distribution usually deploys in less than 15 minutes.
  ///
  /// For more information about web distributions, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-rtmp.html">Working
  /// with RTMP Distributions</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  /// <important>
  /// Beginning with the 2012-05-05 version of the CloudFront API, we made
  /// substantial changes to the format of the XML document that you include in
  /// the request body when you create or update a web distribution or an RTMP
  /// distribution, and when you invalidate objects. With previous versions of
  /// the API, we discovered that it was too easy to accidentally delete one or
  /// more values for an element that accepts multiple values, for example,
  /// CNAMEs and trusted signers. Our changes for the 2012-05-05 release are
  /// intended to prevent these accidental deletions and to notify you when
  /// there's a mismatch between the number of values you say you're specifying
  /// in the <code>Quantity</code> element and the number of values specified.
  /// </important>
  ///
  /// May throw [CNAMEAlreadyExists].
  /// May throw [StreamingDistributionAlreadyExists].
  /// May throw [InvalidOrigin].
  /// May throw [InvalidOriginAccessIdentity].
  /// May throw [AccessDenied].
  /// May throw [TooManyTrustedSigners].
  /// May throw [TrustedSignerDoesNotExist].
  /// May throw [MissingBody].
  /// May throw [TooManyStreamingDistributionCNAMEs].
  /// May throw [TooManyStreamingDistributions].
  /// May throw [InvalidArgument].
  /// May throw [InconsistentQuantities].
  ///
  /// Parameter [streamingDistributionConfig] :
  /// The streaming distribution's configuration information.
  Future<CreateStreamingDistributionResult>
      createStreamingDistribution2016_11_25({
    required StreamingDistributionConfig streamingDistributionConfig,
  }) async {
    ArgumentError.checkNotNull(
        streamingDistributionConfig, 'streamingDistributionConfig');
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2016-11-25/streaming-distribution',
      payload: streamingDistributionConfig.toXml('StreamingDistributionConfig'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateStreamingDistributionResult(
      streamingDistribution: StreamingDistribution.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
      location: _s.extractHeaderStringValue($result.headers, 'Location'),
    );
  }

  /// Create a new streaming distribution with tags.
  ///
  /// May throw [CNAMEAlreadyExists].
  /// May throw [StreamingDistributionAlreadyExists].
  /// May throw [InvalidOrigin].
  /// May throw [InvalidOriginAccessIdentity].
  /// May throw [AccessDenied].
  /// May throw [TooManyTrustedSigners].
  /// May throw [TrustedSignerDoesNotExist].
  /// May throw [MissingBody].
  /// May throw [TooManyStreamingDistributionCNAMEs].
  /// May throw [TooManyStreamingDistributions].
  /// May throw [InvalidArgument].
  /// May throw [InconsistentQuantities].
  /// May throw [InvalidTagging].
  ///
  /// Parameter [streamingDistributionConfigWithTags] :
  /// The streaming distribution's configuration information.
  Future<CreateStreamingDistributionWithTagsResult>
      createStreamingDistributionWithTags2016_11_25({
    required StreamingDistributionConfigWithTags
        streamingDistributionConfigWithTags,
  }) async {
    ArgumentError.checkNotNull(streamingDistributionConfigWithTags,
        'streamingDistributionConfigWithTags');
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2016-11-25/streaming-distribution?WithTags',
      payload: streamingDistributionConfigWithTags
          .toXml('StreamingDistributionConfigWithTags'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateStreamingDistributionWithTagsResult(
      streamingDistribution: StreamingDistribution.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
      location: _s.extractHeaderStringValue($result.headers, 'Location'),
    );
  }

  /// Delete an origin access identity.
  ///
  /// May throw [AccessDenied].
  /// May throw [InvalidIfMatchVersion].
  /// May throw [NoSuchCloudFrontOriginAccessIdentity].
  /// May throw [PreconditionFailed].
  /// May throw [CloudFrontOriginAccessIdentityInUse].
  ///
  /// Parameter [id] :
  /// The origin access identity's ID.
  ///
  /// Parameter [ifMatch] :
  /// The value of the <code>ETag</code> header you received from a previous
  /// <code>GET</code> or <code>PUT</code> request. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  Future<void> deleteCloudFrontOriginAccessIdentity2016_11_25({
    required String id,
    String? ifMatch,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{
      if (ifMatch != null) 'If-Match': ifMatch.toString(),
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/2016-11-25/origin-access-identity/cloudfront/${Uri.encodeComponent(id)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete a distribution.
  ///
  /// May throw [AccessDenied].
  /// May throw [DistributionNotDisabled].
  /// May throw [InvalidIfMatchVersion].
  /// May throw [NoSuchDistribution].
  /// May throw [PreconditionFailed].
  ///
  /// Parameter [id] :
  /// The distribution ID.
  ///
  /// Parameter [ifMatch] :
  /// The value of the <code>ETag</code> header that you received when you
  /// disabled the distribution. For example: <code>E2QWRUHAPOMQZL</code>.
  Future<void> deleteDistribution2016_11_25({
    required String id,
    String? ifMatch,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{
      if (ifMatch != null) 'If-Match': ifMatch.toString(),
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/2016-11-25/distribution/${Uri.encodeComponent(id)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete a streaming distribution. To delete an RTMP distribution using the
  /// CloudFront API, perform the following steps.
  ///
  /// <b>To delete an RTMP distribution using the CloudFront API</b>:
  /// <ol>
  /// <li>
  /// Disable the RTMP distribution.
  /// </li>
  /// <li>
  /// Submit a <code>GET Streaming Distribution Config</code> request to get the
  /// current configuration and the <code>Etag</code> header for the
  /// distribution.
  /// </li>
  /// <li>
  /// Update the XML document that was returned in the response to your
  /// <code>GET Streaming Distribution Config</code> request to change the value
  /// of <code>Enabled</code> to <code>false</code>.
  /// </li>
  /// <li>
  /// Submit a <code>PUT Streaming Distribution Config</code> request to update
  /// the configuration for your distribution. In the request body, include the
  /// XML document that you updated in Step 3. Then set the value of the HTTP
  /// <code>If-Match</code> header to the value of the <code>ETag</code> header
  /// that CloudFront returned when you submitted the <code>GET Streaming
  /// Distribution Config</code> request in Step 2.
  /// </li>
  /// <li>
  /// Review the response to the <code>PUT Streaming Distribution Config</code>
  /// request to confirm that the distribution was successfully disabled.
  /// </li>
  /// <li>
  /// Submit a <code>GET Streaming Distribution Config</code> request to confirm
  /// that your changes have propagated. When propagation is complete, the value
  /// of <code>Status</code> is <code>Deployed</code>.
  /// </li>
  /// <li>
  /// Submit a <code>DELETE Streaming Distribution</code> request. Set the value
  /// of the HTTP <code>If-Match</code> header to the value of the
  /// <code>ETag</code> header that CloudFront returned when you submitted the
  /// <code>GET Streaming Distribution Config</code> request in Step 2.
  /// </li>
  /// <li>
  /// Review the response to your <code>DELETE Streaming Distribution</code>
  /// request to confirm that the distribution was successfully deleted.
  /// </li> </ol>
  /// For information about deleting a distribution using the CloudFront
  /// console, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/HowToDeleteDistribution.html">Deleting
  /// a Distribution</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// May throw [AccessDenied].
  /// May throw [StreamingDistributionNotDisabled].
  /// May throw [InvalidIfMatchVersion].
  /// May throw [NoSuchStreamingDistribution].
  /// May throw [PreconditionFailed].
  ///
  /// Parameter [id] :
  /// The distribution ID.
  ///
  /// Parameter [ifMatch] :
  /// The value of the <code>ETag</code> header that you received when you
  /// disabled the streaming distribution. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  Future<void> deleteStreamingDistribution2016_11_25({
    required String id,
    String? ifMatch,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{
      if (ifMatch != null) 'If-Match': ifMatch.toString(),
    };
    await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/2016-11-25/streaming-distribution/${Uri.encodeComponent(id)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get the information about an origin access identity.
  ///
  /// May throw [NoSuchCloudFrontOriginAccessIdentity].
  /// May throw [AccessDenied].
  ///
  /// Parameter [id] :
  /// The identity's ID.
  Future<GetCloudFrontOriginAccessIdentityResult>
      getCloudFrontOriginAccessIdentity2016_11_25({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2016-11-25/origin-access-identity/cloudfront/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetCloudFrontOriginAccessIdentityResult(
      cloudFrontOriginAccessIdentity:
          CloudFrontOriginAccessIdentity.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Get the configuration information about an origin access identity.
  ///
  /// May throw [NoSuchCloudFrontOriginAccessIdentity].
  /// May throw [AccessDenied].
  ///
  /// Parameter [id] :
  /// The identity's ID.
  Future<GetCloudFrontOriginAccessIdentityConfigResult>
      getCloudFrontOriginAccessIdentityConfig2016_11_25({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2016-11-25/origin-access-identity/cloudfront/${Uri.encodeComponent(id)}/config',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetCloudFrontOriginAccessIdentityConfigResult(
      cloudFrontOriginAccessIdentityConfig:
          CloudFrontOriginAccessIdentityConfig.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Get the information about a distribution.
  ///
  /// May throw [NoSuchDistribution].
  /// May throw [AccessDenied].
  ///
  /// Parameter [id] :
  /// The distribution's ID.
  Future<GetDistributionResult> getDistribution2016_11_25({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2016-11-25/distribution/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetDistributionResult(
      distribution: Distribution.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Get the configuration information about a distribution.
  ///
  /// May throw [NoSuchDistribution].
  /// May throw [AccessDenied].
  ///
  /// Parameter [id] :
  /// The distribution's ID.
  Future<GetDistributionConfigResult> getDistributionConfig2016_11_25({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2016-11-25/distribution/${Uri.encodeComponent(id)}/config',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetDistributionConfigResult(
      distributionConfig: DistributionConfig.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Get the information about an invalidation.
  ///
  /// May throw [NoSuchInvalidation].
  /// May throw [NoSuchDistribution].
  /// May throw [AccessDenied].
  ///
  /// Parameter [distributionId] :
  /// The distribution's ID.
  ///
  /// Parameter [id] :
  /// The identifier for the invalidation request, for example,
  /// <code>IDFDVBD632BHDS5</code>.
  Future<GetInvalidationResult> getInvalidation2016_11_25({
    required String distributionId,
    required String id,
  }) async {
    ArgumentError.checkNotNull(distributionId, 'distributionId');
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2016-11-25/distribution/${Uri.encodeComponent(distributionId)}/invalidation/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetInvalidationResult(
      invalidation: Invalidation.fromXml($elem),
    );
  }

  /// Gets information about a specified RTMP distribution, including the
  /// distribution configuration.
  ///
  /// May throw [NoSuchStreamingDistribution].
  /// May throw [AccessDenied].
  ///
  /// Parameter [id] :
  /// The streaming distribution's ID.
  Future<GetStreamingDistributionResult> getStreamingDistribution2016_11_25({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2016-11-25/streaming-distribution/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetStreamingDistributionResult(
      streamingDistribution: StreamingDistribution.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Get the configuration information about a streaming distribution.
  ///
  /// May throw [NoSuchStreamingDistribution].
  /// May throw [AccessDenied].
  ///
  /// Parameter [id] :
  /// The streaming distribution's ID.
  Future<GetStreamingDistributionConfigResult>
      getStreamingDistributionConfig2016_11_25({
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2016-11-25/streaming-distribution/${Uri.encodeComponent(id)}/config',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetStreamingDistributionConfigResult(
      streamingDistributionConfig: StreamingDistributionConfig.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Lists origin access identities.
  ///
  /// May throw [InvalidArgument].
  ///
  /// Parameter [marker] :
  /// Use this when paginating results to indicate where to begin in your list
  /// of origin access identities. The results include identities in the list
  /// that occur after the marker. To get the next page of results, set the
  /// <code>Marker</code> to the value of the <code>NextMarker</code> from the
  /// current page's response (which is also the ID of the last identity on that
  /// page).
  ///
  /// Parameter [maxItems] :
  /// The maximum number of origin access identities you want in the response
  /// body.
  Future<ListCloudFrontOriginAccessIdentitiesResult>
      listCloudFrontOriginAccessIdentities2016_11_25({
    String? marker,
    String? maxItems,
  }) async {
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2016-11-25/origin-access-identity/cloudfront',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListCloudFrontOriginAccessIdentitiesResult(
      cloudFrontOriginAccessIdentityList:
          CloudFrontOriginAccessIdentityList.fromXml($elem),
    );
  }

  /// List distributions.
  ///
  /// May throw [InvalidArgument].
  ///
  /// Parameter [marker] :
  /// Use this when paginating results to indicate where to begin in your list
  /// of distributions. The results include distributions in the list that occur
  /// after the marker. To get the next page of results, set the
  /// <code>Marker</code> to the value of the <code>NextMarker</code> from the
  /// current page's response (which is also the ID of the last distribution on
  /// that page).
  ///
  /// Parameter [maxItems] :
  /// The maximum number of distributions you want in the response body.
  Future<ListDistributionsResult> listDistributions2016_11_25({
    String? marker,
    String? maxItems,
  }) async {
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2016-11-25/distribution',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListDistributionsResult(
      distributionList: DistributionList.fromXml($elem),
    );
  }

  /// List the distributions that are associated with a specified AWS WAF web
  /// ACL.
  ///
  /// May throw [InvalidArgument].
  /// May throw [InvalidWebACLId].
  ///
  /// Parameter [webACLId] :
  /// The ID of the AWS WAF web ACL that you want to list the associated
  /// distributions. If you specify "null" for the ID, the request returns a
  /// list of the distributions that aren't associated with a web ACL.
  ///
  /// Parameter [marker] :
  /// Use <code>Marker</code> and <code>MaxItems</code> to control pagination of
  /// results. If you have more than <code>MaxItems</code> distributions that
  /// satisfy the request, the response includes a <code>NextMarker</code>
  /// element. To get the next page of results, submit another request. For the
  /// value of <code>Marker</code>, specify the value of <code>NextMarker</code>
  /// from the last response. (For the first request, omit <code>Marker</code>.)
  ///
  /// Parameter [maxItems] :
  /// The maximum number of distributions that you want CloudFront to return in
  /// the response body. The maximum and default values are both 100.
  Future<ListDistributionsByWebACLIdResult>
      listDistributionsByWebACLId2016_11_25({
    required String webACLId,
    String? marker,
    String? maxItems,
  }) async {
    ArgumentError.checkNotNull(webACLId, 'webACLId');
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2016-11-25/distributionsByWebACLId/${Uri.encodeComponent(webACLId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListDistributionsByWebACLIdResult(
      distributionList: DistributionList.fromXml($elem),
    );
  }

  /// Lists invalidation batches.
  ///
  /// May throw [InvalidArgument].
  /// May throw [NoSuchDistribution].
  /// May throw [AccessDenied].
  ///
  /// Parameter [distributionId] :
  /// The distribution's ID.
  ///
  /// Parameter [marker] :
  /// Use this parameter when paginating results to indicate where to begin in
  /// your list of invalidation batches. Because the results are returned in
  /// decreasing order from most recent to oldest, the most recent results are
  /// on the first page, the second page will contain earlier results, and so
  /// on. To get the next page of results, set <code>Marker</code> to the value
  /// of the <code>NextMarker</code> from the current page's response. This
  /// value is the same as the ID of the last invalidation batch on that page.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of invalidation batches that you want in the response
  /// body.
  Future<ListInvalidationsResult> listInvalidations2016_11_25({
    required String distributionId,
    String? marker,
    String? maxItems,
  }) async {
    ArgumentError.checkNotNull(distributionId, 'distributionId');
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2016-11-25/distribution/${Uri.encodeComponent(distributionId)}/invalidation',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListInvalidationsResult(
      invalidationList: InvalidationList.fromXml($elem),
    );
  }

  /// List streaming distributions.
  ///
  /// May throw [InvalidArgument].
  ///
  /// Parameter [marker] :
  /// The value that you provided for the <code>Marker</code> request parameter.
  ///
  /// Parameter [maxItems] :
  /// The value that you provided for the <code>MaxItems</code> request
  /// parameter.
  Future<ListStreamingDistributionsResult>
      listStreamingDistributions2016_11_25({
    String? marker,
    String? maxItems,
  }) async {
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2016-11-25/streaming-distribution',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListStreamingDistributionsResult(
      streamingDistributionList: StreamingDistributionList.fromXml($elem),
    );
  }

  /// List tags for a CloudFront resource.
  ///
  /// May throw [AccessDenied].
  /// May throw [InvalidArgument].
  /// May throw [InvalidTagging].
  /// May throw [NoSuchResource].
  ///
  /// Parameter [resource] :
  /// An ARN of a CloudFront resource.
  Future<ListTagsForResourceResult> listTagsForResource2016_11_25({
    required String resource,
  }) async {
    ArgumentError.checkNotNull(resource, 'resource');
    final $query = <String, List<String>>{
      'Resource': [resource],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2016-11-25/tagging',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListTagsForResourceResult(
      tags: Tags.fromXml($elem),
    );
  }

  /// Add tags to a CloudFront resource.
  ///
  /// May throw [AccessDenied].
  /// May throw [InvalidArgument].
  /// May throw [InvalidTagging].
  /// May throw [NoSuchResource].
  ///
  /// Parameter [resource] :
  /// An ARN of a CloudFront resource.
  ///
  /// Parameter [tags] :
  /// A complex type that contains zero or more <code>Tag</code> elements.
  Future<void> tagResource2016_11_25({
    required String resource,
    required Tags tags,
  }) async {
    ArgumentError.checkNotNull(resource, 'resource');
    ArgumentError.checkNotNull(tags, 'tags');
    final $query = <String, List<String>>{
      'Resource': [resource],
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/2016-11-25/tagging?Operation=Tag',
      queryParams: $query,
      payload: tags.toXml('Tags'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Remove tags from a CloudFront resource.
  ///
  /// May throw [AccessDenied].
  /// May throw [InvalidArgument].
  /// May throw [InvalidTagging].
  /// May throw [NoSuchResource].
  ///
  /// Parameter [resource] :
  /// An ARN of a CloudFront resource.
  ///
  /// Parameter [tagKeys] :
  /// A complex type that contains zero or more <code>Tag</code> key elements.
  Future<void> untagResource2016_11_25({
    required String resource,
    required TagKeys tagKeys,
  }) async {
    ArgumentError.checkNotNull(resource, 'resource');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      'Resource': [resource],
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/2016-11-25/tagging?Operation=Untag',
      queryParams: $query,
      payload: tagKeys.toXml('TagKeys'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update an origin access identity.
  ///
  /// May throw [AccessDenied].
  /// May throw [IllegalUpdate].
  /// May throw [InvalidIfMatchVersion].
  /// May throw [MissingBody].
  /// May throw [NoSuchCloudFrontOriginAccessIdentity].
  /// May throw [PreconditionFailed].
  /// May throw [InvalidArgument].
  /// May throw [InconsistentQuantities].
  ///
  /// Parameter [cloudFrontOriginAccessIdentityConfig] :
  /// The identity's configuration information.
  ///
  /// Parameter [id] :
  /// The identity's id.
  ///
  /// Parameter [ifMatch] :
  /// The value of the <code>ETag</code> header that you received when
  /// retrieving the identity's configuration. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  Future<UpdateCloudFrontOriginAccessIdentityResult>
      updateCloudFrontOriginAccessIdentity2016_11_25({
    required CloudFrontOriginAccessIdentityConfig
        cloudFrontOriginAccessIdentityConfig,
    required String id,
    String? ifMatch,
  }) async {
    ArgumentError.checkNotNull(cloudFrontOriginAccessIdentityConfig,
        'cloudFrontOriginAccessIdentityConfig');
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{
      if (ifMatch != null) 'If-Match': ifMatch.toString(),
    };
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri:
          '/2016-11-25/origin-access-identity/cloudfront/${Uri.encodeComponent(id)}/config',
      headers: headers,
      payload: cloudFrontOriginAccessIdentityConfig
          .toXml('CloudFrontOriginAccessIdentityConfig'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return UpdateCloudFrontOriginAccessIdentityResult(
      cloudFrontOriginAccessIdentity:
          CloudFrontOriginAccessIdentity.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Update a distribution.
  ///
  /// May throw [AccessDenied].
  /// May throw [CNAMEAlreadyExists].
  /// May throw [IllegalUpdate].
  /// May throw [InvalidIfMatchVersion].
  /// May throw [MissingBody].
  /// May throw [NoSuchDistribution].
  /// May throw [PreconditionFailed].
  /// May throw [TooManyDistributionCNAMEs].
  /// May throw [InvalidDefaultRootObject].
  /// May throw [InvalidRelativePath].
  /// May throw [InvalidErrorCode].
  /// May throw [InvalidResponseCode].
  /// May throw [InvalidArgument].
  /// May throw [InvalidOriginAccessIdentity].
  /// May throw [TooManyTrustedSigners].
  /// May throw [TrustedSignerDoesNotExist].
  /// May throw [InvalidViewerCertificate].
  /// May throw [InvalidMinimumProtocolVersion].
  /// May throw [InvalidRequiredProtocol].
  /// May throw [NoSuchOrigin].
  /// May throw [TooManyOrigins].
  /// May throw [TooManyCacheBehaviors].
  /// May throw [TooManyCookieNamesInWhiteList].
  /// May throw [InvalidForwardCookies].
  /// May throw [TooManyHeadersInForwardedValues].
  /// May throw [InvalidHeadersForS3Origin].
  /// May throw [InconsistentQuantities].
  /// May throw [TooManyCertificates].
  /// May throw [InvalidLocationCode].
  /// May throw [InvalidGeoRestrictionParameter].
  /// May throw [InvalidTTLOrder].
  /// May throw [InvalidWebACLId].
  /// May throw [TooManyOriginCustomHeaders].
  /// May throw [TooManyQueryStringParameters].
  /// May throw [InvalidQueryStringParameters].
  /// May throw [TooManyDistributionsWithLambdaAssociations].
  /// May throw [TooManyLambdaFunctionAssociations].
  /// May throw [InvalidLambdaFunctionAssociation].
  ///
  /// Parameter [distributionConfig] :
  /// The distribution's configuration information.
  ///
  /// Parameter [id] :
  /// The distribution's id.
  ///
  /// Parameter [ifMatch] :
  /// The value of the <code>ETag</code> header that you received when
  /// retrieving the distribution's configuration. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  Future<UpdateDistributionResult> updateDistribution2016_11_25({
    required DistributionConfig distributionConfig,
    required String id,
    String? ifMatch,
  }) async {
    ArgumentError.checkNotNull(distributionConfig, 'distributionConfig');
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{
      if (ifMatch != null) 'If-Match': ifMatch.toString(),
    };
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri: '/2016-11-25/distribution/${Uri.encodeComponent(id)}/config',
      headers: headers,
      payload: distributionConfig.toXml('DistributionConfig'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return UpdateDistributionResult(
      distribution: Distribution.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Update a streaming distribution.
  ///
  /// May throw [AccessDenied].
  /// May throw [CNAMEAlreadyExists].
  /// May throw [IllegalUpdate].
  /// May throw [InvalidIfMatchVersion].
  /// May throw [MissingBody].
  /// May throw [NoSuchStreamingDistribution].
  /// May throw [PreconditionFailed].
  /// May throw [TooManyStreamingDistributionCNAMEs].
  /// May throw [InvalidArgument].
  /// May throw [InvalidOriginAccessIdentity].
  /// May throw [TooManyTrustedSigners].
  /// May throw [TrustedSignerDoesNotExist].
  /// May throw [InconsistentQuantities].
  ///
  /// Parameter [id] :
  /// The streaming distribution's id.
  ///
  /// Parameter [streamingDistributionConfig] :
  /// The streaming distribution's configuration information.
  ///
  /// Parameter [ifMatch] :
  /// The value of the <code>ETag</code> header that you received when
  /// retrieving the streaming distribution's configuration. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  Future<UpdateStreamingDistributionResult>
      updateStreamingDistribution2016_11_25({
    required String id,
    required StreamingDistributionConfig streamingDistributionConfig,
    String? ifMatch,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(
        streamingDistributionConfig, 'streamingDistributionConfig');
    final headers = <String, String>{
      if (ifMatch != null) 'If-Match': ifMatch.toString(),
    };
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri:
          '/2016-11-25/streaming-distribution/${Uri.encodeComponent(id)}/config',
      headers: headers,
      payload: streamingDistributionConfig.toXml('StreamingDistributionConfig'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return UpdateStreamingDistributionResult(
      streamingDistribution: StreamingDistribution.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }
}

/// Access denied.
class AccessDenied implements _s.AwsException {
  final String? message;

  AccessDenied({
    this.message,
  });

  factory AccessDenied.fromJson(Map<String, dynamic> json) {
    return AccessDenied(
      message: json['Message'] as String?,
    );
  }

  factory AccessDenied.fromXml(_s.XmlElement elem) {
    return AccessDenied(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// A complex type that lists the AWS accounts, if any, that you included in the
/// <code>TrustedSigners</code> complex type for this distribution. These are
/// the accounts that you want to allow to create signed URLs for private
/// content.
///
/// The <code>Signer</code> complex type lists the AWS account number of the
/// trusted signer or <code>self</code> if the signer is the AWS account that
/// created the distribution. The <code>Signer</code> element also includes the
/// IDs of any active CloudFront key pairs that are associated with the trusted
/// signer's AWS account. If no <code>KeyPairId</code> element appears for a
/// <code>Signer</code>, that signer can't create signed URLs.
///
/// For more information, see <a
/// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving
/// Private Content through CloudFront</a> in the <i>Amazon CloudFront Developer
/// Guide</i>.
class ActiveTrustedSigners {
  /// Enabled is <code>true</code> if any of the AWS accounts listed in the
  /// <code>TrustedSigners</code> complex type for this RTMP distribution have
  /// active CloudFront key pairs. If not, <code>Enabled</code> is
  /// <code>false</code>.
  ///
  /// For more information, see <a>ActiveTrustedSigners</a>.
  final bool enabled;

  /// A complex type that contains one <code>Signer</code> complex type for each
  /// trusted signer specified in the <code>TrustedSigners</code> complex type.
  ///
  /// For more information, see <a>ActiveTrustedSigners</a>.
  final int quantity;

  /// A complex type that contains one <code>Signer</code> complex type for each
  /// trusted signer that is specified in the <code>TrustedSigners</code> complex
  /// type.
  ///
  /// For more information, see <a>ActiveTrustedSigners</a>.
  final List<Signer>? items;

  ActiveTrustedSigners({
    required this.enabled,
    required this.quantity,
    this.items,
  });

  factory ActiveTrustedSigners.fromJson(Map<String, dynamic> json) {
    return ActiveTrustedSigners(
      enabled: json['Enabled'] as bool,
      quantity: json['Quantity'] as int,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => Signer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory ActiveTrustedSigners.fromXml(_s.XmlElement elem) {
    return ActiveTrustedSigners(
      enabled: _s.extractXmlBoolValue(elem, 'Enabled')!,
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) =>
          elem.findElements('Signer').map((c) => Signer.fromXml(c)).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final quantity = this.quantity;
    final items = this.items;
    return {
      'Enabled': enabled,
      'Quantity': quantity,
      if (items != null) 'Items': items,
    };
  }
}

/// A complex type that contains information about CNAMEs (alternate domain
/// names), if any, for this distribution.
class Aliases {
  /// The number of CNAME aliases, if any, that you want to associate with this
  /// distribution.
  final int quantity;

  /// A complex type that contains the CNAME aliases, if any, that you want to
  /// associate with this distribution.
  final List<String>? items;

  Aliases({
    required this.quantity,
    this.items,
  });

  factory Aliases.fromJson(Map<String, dynamic> json) {
    return Aliases(
      quantity: json['Quantity'] as int,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  factory Aliases.fromXml(_s.XmlElement elem) {
    return Aliases(
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
      items: _s
          .extractXmlChild(elem, 'Items')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'CNAME')),
    );
  }

  Map<String, dynamic> toJson() {
    final quantity = this.quantity;
    final items = this.items;
    return {
      'Quantity': quantity,
      if (items != null) 'Items': items,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final quantity = this.quantity;
    final items = this.items;
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => _s.encodeXmlStringValue('CNAME', e))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that controls which HTTP methods CloudFront processes and
/// forwards to your Amazon S3 bucket or your custom origin. There are three
/// choices:
///
/// <ul>
/// <li>
/// CloudFront forwards only <code>GET</code> and <code>HEAD</code> requests.
/// </li>
/// <li>
/// CloudFront forwards only <code>GET</code>, <code>HEAD</code>, and
/// <code>OPTIONS</code> requests.
/// </li>
/// <li>
/// CloudFront forwards <code>GET, HEAD, OPTIONS, PUT, PATCH, POST</code>, and
/// <code>DELETE</code> requests.
/// </li>
/// </ul>
/// If you pick the third choice, you may need to restrict access to your Amazon
/// S3 bucket or to your custom origin so users can't perform operations that
/// you don't want them to. For example, you might not want users to have
/// permissions to delete objects from your origin.
class AllowedMethods {
  /// A complex type that contains the HTTP methods that you want CloudFront to
  /// process and forward to your origin.
  final List<Method> items;

  /// The number of HTTP methods that you want CloudFront to forward to your
  /// origin. Valid values are 2 (for <code>GET</code> and <code>HEAD</code>
  /// requests), 3 (for <code>GET</code>, <code>HEAD</code>, and
  /// <code>OPTIONS</code> requests) and 7 (for <code>GET, HEAD, OPTIONS, PUT,
  /// PATCH, POST</code>, and <code>DELETE</code> requests).
  final int quantity;
  final CachedMethods? cachedMethods;

  AllowedMethods({
    required this.items,
    required this.quantity,
    this.cachedMethods,
  });

  factory AllowedMethods.fromJson(Map<String, dynamic> json) {
    return AllowedMethods(
      items: (json['Items'] as List)
          .whereNotNull()
          .map((e) => (e as String).toMethod())
          .toList(),
      quantity: json['Quantity'] as int,
      cachedMethods: json['CachedMethods'] != null
          ? CachedMethods.fromJson(
              json['CachedMethods'] as Map<String, dynamic>)
          : null,
    );
  }

  factory AllowedMethods.fromXml(_s.XmlElement elem) {
    return AllowedMethods(
      items: _s
          .extractXmlStringListValues(
              _s.extractXmlChild(elem, 'Items')!, 'Method')
          .map((s) => s.toMethod())
          .toList(),
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
      cachedMethods: _s
          .extractXmlChild(elem, 'CachedMethods')
          ?.let((e) => CachedMethods.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final quantity = this.quantity;
    final cachedMethods = this.cachedMethods;
    return {
      'Items': items.map((e) => e.toValue()).toList(),
      'Quantity': quantity,
      if (cachedMethods != null) 'CachedMethods': cachedMethods,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final items = this.items;
    final quantity = this.quantity;
    final cachedMethods = this.cachedMethods;
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      _s.XmlElement(_s.XmlName('Items'), [],
          items.map((e) => _s.encodeXmlStringValue('Method', e.toValue()))),
      if (cachedMethods != null) cachedMethods.toXml('CachedMethods'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

class BatchTooLarge implements _s.AwsException {
  final String? message;

  BatchTooLarge({
    this.message,
  });

  factory BatchTooLarge.fromJson(Map<String, dynamic> json) {
    return BatchTooLarge(
      message: json['Message'] as String?,
    );
  }

  factory BatchTooLarge.fromXml(_s.XmlElement elem) {
    return BatchTooLarge(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class CNAMEAlreadyExists implements _s.AwsException {
  final String? message;

  CNAMEAlreadyExists({
    this.message,
  });

  factory CNAMEAlreadyExists.fromJson(Map<String, dynamic> json) {
    return CNAMEAlreadyExists(
      message: json['Message'] as String?,
    );
  }

  factory CNAMEAlreadyExists.fromXml(_s.XmlElement elem) {
    return CNAMEAlreadyExists(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// A complex type that describes how CloudFront processes requests.
///
/// You must create at least as many cache behaviors (including the default
/// cache behavior) as you have origins if you want CloudFront to distribute
/// objects from all of the origins. Each cache behavior specifies the one
/// origin from which you want CloudFront to get objects. If you have two
/// origins and only the default cache behavior, the default cache behavior will
/// cause CloudFront to get objects from one of the origins, but the other
/// origin is never used.
///
/// For the current limit on the number of cache behaviors that you can add to a
/// distribution, see <a
/// href="http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_cloudfront">Amazon
/// CloudFront Limits</a> in the <i>AWS General Reference</i>.
///
/// If you don't want to specify any cache behaviors, include only an empty
/// <code>CacheBehaviors</code> element. Don't include an empty
/// <code>CacheBehavior</code> element, or CloudFront returns a
/// <code>MalformedXML</code> error.
///
/// To delete all cache behaviors in an existing distribution, update the
/// distribution configuration and include only an empty
/// <code>CacheBehaviors</code> element.
///
/// To add, change, or remove one or more cache behaviors, update the
/// distribution configuration and specify all of the cache behaviors that you
/// want to include in the updated distribution.
///
/// For more information about cache behaviors, see <a
/// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesCacheBehavior">Cache
/// Behaviors</a> in the <i>Amazon CloudFront Developer Guide</i>.
class CacheBehavior {
  /// A complex type that specifies how CloudFront handles query strings and
  /// cookies.
  final ForwardedValues forwardedValues;

  /// The minimum amount of time that you want objects to stay in CloudFront
  /// caches before CloudFront forwards another request to your origin to
  /// determine whether the object has been updated. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Specifying
  /// How Long Objects and Errors Stay in a CloudFront Edge Cache (Expiration)</a>
  /// in the <i>Amazon Amazon CloudFront Developer Guide</i>.
  ///
  /// You must specify <code>0</code> for <code>MinTTL</code> if you configure
  /// CloudFront to forward all headers to your origin (under
  /// <code>Headers</code>, if you specify <code>1</code> for
  /// <code>Quantity</code> and <code>*</code> for <code>Name</code>).
  final int minTTL;

  /// The pattern (for example, <code>images/*.jpg</code>) that specifies which
  /// requests to apply the behavior to. When CloudFront receives a viewer
  /// request, the requested path is compared with path patterns in the order in
  /// which cache behaviors are listed in the distribution.
  /// <note>
  /// You can optionally include a slash (<code>/</code>) at the beginning of the
  /// path pattern. For example, <code>/images/*.jpg</code>. CloudFront behavior
  /// is the same with or without the leading <code>/</code>.
  /// </note>
  /// The path pattern for the default cache behavior is <code>*</code> and cannot
  /// be changed. If the request for an object does not match the path pattern for
  /// any cache behaviors, CloudFront applies the behavior in the default cache
  /// behavior.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesPathPattern">Path
  /// Pattern</a> in the <i> Amazon CloudFront Developer Guide</i>.
  final String pathPattern;

  /// The value of <code>ID</code> for the origin that you want CloudFront to
  /// route requests to when a request matches the path pattern either for a cache
  /// behavior or for the default cache behavior.
  final String targetOriginId;

  /// A complex type that specifies the AWS accounts, if any, that you want to
  /// allow to create signed URLs for private content.
  ///
  /// If you want to require signed URLs in requests for objects in the target
  /// origin that match the <code>PathPattern</code> for this cache behavior,
  /// specify <code>true</code> for <code>Enabled</code>, and specify the
  /// applicable values for <code>Quantity</code> and <code>Items</code>. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving
  /// Private Content through CloudFront</a> in the <i>Amazon Amazon CloudFront
  /// Developer Guide</i>.
  ///
  /// If you don't want to require signed URLs in requests for objects that match
  /// <code>PathPattern</code>, specify <code>false</code> for
  /// <code>Enabled</code> and <code>0</code> for <code>Quantity</code>. Omit
  /// <code>Items</code>.
  ///
  /// To add, change, or remove one or more trusted signers, change
  /// <code>Enabled</code> to <code>true</code> (if it's currently
  /// <code>false</code>), change <code>Quantity</code> as applicable, and specify
  /// all of the trusted signers that you want to include in the updated
  /// distribution.
  final TrustedSigners trustedSigners;

  /// The protocol that viewers can use to access the files in the origin
  /// specified by <code>TargetOriginId</code> when a request matches the path
  /// pattern in <code>PathPattern</code>. You can specify the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>allow-all</code>: Viewers can use HTTP or HTTPS.
  /// </li>
  /// <li>
  /// <code>redirect-to-https</code>: If a viewer submits an HTTP request,
  /// CloudFront returns an HTTP status code of 301 (Moved Permanently) to the
  /// viewer along with the HTTPS URL. The viewer then resubmits the request using
  /// the new URL.
  /// </li>
  /// <li>
  /// <code>https-only</code>: If a viewer sends an HTTP request, CloudFront
  /// returns an HTTP status code of 403 (Forbidden).
  /// </li>
  /// </ul>
  /// For more information about requiring the HTTPS protocol, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/SecureConnections.html">Using
  /// an HTTPS Connection to Access Your Objects</a> in the <i>Amazon CloudFront
  /// Developer Guide</i>.
  /// <note>
  /// The only way to guarantee that viewers retrieve an object that was fetched
  /// from the origin using HTTPS is never to use any other protocol to fetch the
  /// object. If you have recently changed from HTTP to HTTPS, we recommend that
  /// you clear your objects' cache because cached objects are protocol agnostic.
  /// That means that an edge location will return an object from the cache
  /// regardless of whether the current request protocol matches the protocol used
  /// previously. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Specifying
  /// How Long Objects and Errors Stay in a CloudFront Edge Cache (Expiration)</a>
  /// in the <i>Amazon CloudFront Developer Guide</i>.
  /// </note>
  final ViewerProtocolPolicy viewerProtocolPolicy;
  final AllowedMethods? allowedMethods;

  /// Whether you want CloudFront to automatically compress certain files for this
  /// cache behavior. If so, specify true; if not, specify false. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/ServingCompressedFiles.html">Serving
  /// Compressed Files</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final bool? compress;

  /// The default amount of time that you want objects to stay in CloudFront
  /// caches before CloudFront forwards another request to your origin to
  /// determine whether the object has been updated. The value that you specify
  /// applies only when your origin does not add HTTP headers such as
  /// <code>Cache-Control max-age</code>, <code>Cache-Control s-maxage</code>, and
  /// <code>Expires</code> to objects. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Specifying
  /// How Long Objects and Errors Stay in a CloudFront Edge Cache (Expiration)</a>
  /// in the <i>Amazon CloudFront Developer Guide</i>.
  final int? defaultTTL;

  /// A complex type that contains zero or more Lambda function associations for a
  /// cache behavior.
  final LambdaFunctionAssociations? lambdaFunctionAssociations;

  /// The maximum amount of time that you want objects to stay in CloudFront
  /// caches before CloudFront forwards another request to your origin to
  /// determine whether the object has been updated. The value that you specify
  /// applies only when your origin adds HTTP headers such as <code>Cache-Control
  /// max-age</code>, <code>Cache-Control s-maxage</code>, and
  /// <code>Expires</code> to objects. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Specifying
  /// How Long Objects and Errors Stay in a CloudFront Edge Cache (Expiration)</a>
  /// in the <i>Amazon CloudFront Developer Guide</i>.
  final int? maxTTL;

  /// Indicates whether you want to distribute media files in the Microsoft Smooth
  /// Streaming format using the origin that is associated with this cache
  /// behavior. If so, specify <code>true</code>; if not, specify
  /// <code>false</code>. If you specify <code>true</code> for
  /// <code>SmoothStreaming</code>, you can still distribute other content using
  /// this cache behavior if the content matches the value of
  /// <code>PathPattern</code>.
  final bool? smoothStreaming;

  CacheBehavior({
    required this.forwardedValues,
    required this.minTTL,
    required this.pathPattern,
    required this.targetOriginId,
    required this.trustedSigners,
    required this.viewerProtocolPolicy,
    this.allowedMethods,
    this.compress,
    this.defaultTTL,
    this.lambdaFunctionAssociations,
    this.maxTTL,
    this.smoothStreaming,
  });

  factory CacheBehavior.fromJson(Map<String, dynamic> json) {
    return CacheBehavior(
      forwardedValues: ForwardedValues.fromJson(
          json['ForwardedValues'] as Map<String, dynamic>),
      minTTL: json['MinTTL'] as int,
      pathPattern: json['PathPattern'] as String,
      targetOriginId: json['TargetOriginId'] as String,
      trustedSigners: TrustedSigners.fromJson(
          json['TrustedSigners'] as Map<String, dynamic>),
      viewerProtocolPolicy:
          (json['ViewerProtocolPolicy'] as String).toViewerProtocolPolicy(),
      allowedMethods: json['AllowedMethods'] != null
          ? AllowedMethods.fromJson(
              json['AllowedMethods'] as Map<String, dynamic>)
          : null,
      compress: json['Compress'] as bool?,
      defaultTTL: json['DefaultTTL'] as int?,
      lambdaFunctionAssociations: json['LambdaFunctionAssociations'] != null
          ? LambdaFunctionAssociations.fromJson(
              json['LambdaFunctionAssociations'] as Map<String, dynamic>)
          : null,
      maxTTL: json['MaxTTL'] as int?,
      smoothStreaming: json['SmoothStreaming'] as bool?,
    );
  }

  factory CacheBehavior.fromXml(_s.XmlElement elem) {
    return CacheBehavior(
      forwardedValues:
          ForwardedValues.fromXml(_s.extractXmlChild(elem, 'ForwardedValues')!),
      minTTL: _s.extractXmlIntValue(elem, 'MinTTL')!,
      pathPattern: _s.extractXmlStringValue(elem, 'PathPattern')!,
      targetOriginId: _s.extractXmlStringValue(elem, 'TargetOriginId')!,
      trustedSigners:
          TrustedSigners.fromXml(_s.extractXmlChild(elem, 'TrustedSigners')!),
      viewerProtocolPolicy: _s
          .extractXmlStringValue(elem, 'ViewerProtocolPolicy')!
          .toViewerProtocolPolicy(),
      allowedMethods: _s
          .extractXmlChild(elem, 'AllowedMethods')
          ?.let((e) => AllowedMethods.fromXml(e)),
      compress: _s.extractXmlBoolValue(elem, 'Compress'),
      defaultTTL: _s.extractXmlIntValue(elem, 'DefaultTTL'),
      lambdaFunctionAssociations: _s
          .extractXmlChild(elem, 'LambdaFunctionAssociations')
          ?.let((e) => LambdaFunctionAssociations.fromXml(e)),
      maxTTL: _s.extractXmlIntValue(elem, 'MaxTTL'),
      smoothStreaming: _s.extractXmlBoolValue(elem, 'SmoothStreaming'),
    );
  }

  Map<String, dynamic> toJson() {
    final forwardedValues = this.forwardedValues;
    final minTTL = this.minTTL;
    final pathPattern = this.pathPattern;
    final targetOriginId = this.targetOriginId;
    final trustedSigners = this.trustedSigners;
    final viewerProtocolPolicy = this.viewerProtocolPolicy;
    final allowedMethods = this.allowedMethods;
    final compress = this.compress;
    final defaultTTL = this.defaultTTL;
    final lambdaFunctionAssociations = this.lambdaFunctionAssociations;
    final maxTTL = this.maxTTL;
    final smoothStreaming = this.smoothStreaming;
    return {
      'ForwardedValues': forwardedValues,
      'MinTTL': minTTL,
      'PathPattern': pathPattern,
      'TargetOriginId': targetOriginId,
      'TrustedSigners': trustedSigners,
      'ViewerProtocolPolicy': viewerProtocolPolicy.toValue(),
      if (allowedMethods != null) 'AllowedMethods': allowedMethods,
      if (compress != null) 'Compress': compress,
      if (defaultTTL != null) 'DefaultTTL': defaultTTL,
      if (lambdaFunctionAssociations != null)
        'LambdaFunctionAssociations': lambdaFunctionAssociations,
      if (maxTTL != null) 'MaxTTL': maxTTL,
      if (smoothStreaming != null) 'SmoothStreaming': smoothStreaming,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final forwardedValues = this.forwardedValues;
    final minTTL = this.minTTL;
    final pathPattern = this.pathPattern;
    final targetOriginId = this.targetOriginId;
    final trustedSigners = this.trustedSigners;
    final viewerProtocolPolicy = this.viewerProtocolPolicy;
    final allowedMethods = this.allowedMethods;
    final compress = this.compress;
    final defaultTTL = this.defaultTTL;
    final lambdaFunctionAssociations = this.lambdaFunctionAssociations;
    final maxTTL = this.maxTTL;
    final smoothStreaming = this.smoothStreaming;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('PathPattern', pathPattern),
      _s.encodeXmlStringValue('TargetOriginId', targetOriginId),
      forwardedValues.toXml('ForwardedValues'),
      trustedSigners.toXml('TrustedSigners'),
      _s.encodeXmlStringValue(
          'ViewerProtocolPolicy', viewerProtocolPolicy.toValue()),
      _s.encodeXmlIntValue('MinTTL', minTTL),
      if (allowedMethods != null) allowedMethods.toXml('AllowedMethods'),
      if (smoothStreaming != null)
        _s.encodeXmlBoolValue('SmoothStreaming', smoothStreaming),
      if (defaultTTL != null) _s.encodeXmlIntValue('DefaultTTL', defaultTTL),
      if (maxTTL != null) _s.encodeXmlIntValue('MaxTTL', maxTTL),
      if (compress != null) _s.encodeXmlBoolValue('Compress', compress),
      if (lambdaFunctionAssociations != null)
        lambdaFunctionAssociations.toXml('LambdaFunctionAssociations'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains zero or more <code>CacheBehavior</code>
/// elements.
class CacheBehaviors {
  /// The number of cache behaviors for this distribution.
  final int quantity;

  /// Optional: A complex type that contains cache behaviors for this
  /// distribution. If <code>Quantity</code> is <code>0</code>, you can omit
  /// <code>Items</code>.
  final List<CacheBehavior>? items;

  CacheBehaviors({
    required this.quantity,
    this.items,
  });

  factory CacheBehaviors.fromJson(Map<String, dynamic> json) {
    return CacheBehaviors(
      quantity: json['Quantity'] as int,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => CacheBehavior.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory CacheBehaviors.fromXml(_s.XmlElement elem) {
    return CacheBehaviors(
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('CacheBehavior')
          .map((c) => CacheBehavior.fromXml(c))
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final quantity = this.quantity;
    final items = this.items;
    return {
      'Quantity': quantity,
      if (items != null) 'Items': items,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final quantity = this.quantity;
    final items = this.items;
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => e.toXml('CacheBehavior'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that controls whether CloudFront caches the response to
/// requests using the specified HTTP methods. There are two choices:
///
/// <ul>
/// <li>
/// CloudFront caches responses to <code>GET</code> and <code>HEAD</code>
/// requests.
/// </li>
/// <li>
/// CloudFront caches responses to <code>GET</code>, <code>HEAD</code>, and
/// <code>OPTIONS</code> requests.
/// </li>
/// </ul>
/// If you pick the second choice for your Amazon S3 Origin, you may need to
/// forward Access-Control-Request-Method, Access-Control-Request-Headers, and
/// Origin headers for the responses to be cached correctly.
class CachedMethods {
  /// A complex type that contains the HTTP methods that you want CloudFront to
  /// cache responses to.
  final List<Method> items;

  /// The number of HTTP methods for which you want CloudFront to cache responses.
  /// Valid values are <code>2</code> (for caching responses to <code>GET</code>
  /// and <code>HEAD</code> requests) and <code>3</code> (for caching responses to
  /// <code>GET</code>, <code>HEAD</code>, and <code>OPTIONS</code> requests).
  final int quantity;

  CachedMethods({
    required this.items,
    required this.quantity,
  });

  factory CachedMethods.fromJson(Map<String, dynamic> json) {
    return CachedMethods(
      items: (json['Items'] as List)
          .whereNotNull()
          .map((e) => (e as String).toMethod())
          .toList(),
      quantity: json['Quantity'] as int,
    );
  }

  factory CachedMethods.fromXml(_s.XmlElement elem) {
    return CachedMethods(
      items: _s
          .extractXmlStringListValues(
              _s.extractXmlChild(elem, 'Items')!, 'Method')
          .map((s) => s.toMethod())
          .toList(),
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final quantity = this.quantity;
    return {
      'Items': items.map((e) => e.toValue()).toList(),
      'Quantity': quantity,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final items = this.items;
    final quantity = this.quantity;
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      _s.XmlElement(_s.XmlName('Items'), [],
          items.map((e) => _s.encodeXmlStringValue('Method', e.toValue()))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

enum CertificateSource {
  cloudfront,
  iam,
  acm,
}

extension on CertificateSource {
  String toValue() {
    switch (this) {
      case CertificateSource.cloudfront:
        return 'cloudfront';
      case CertificateSource.iam:
        return 'iam';
      case CertificateSource.acm:
        return 'acm';
    }
  }
}

extension on String {
  CertificateSource toCertificateSource() {
    switch (this) {
      case 'cloudfront':
        return CertificateSource.cloudfront;
      case 'iam':
        return CertificateSource.iam;
      case 'acm':
        return CertificateSource.acm;
    }
    throw Exception('$this is not known in enum CertificateSource');
  }
}

/// CloudFront origin access identity.
class CloudFrontOriginAccessIdentity {
  /// The ID for the origin access identity. For example:
  /// <code>E74FTE3AJFJ256A</code>.
  final String id;

  /// The Amazon S3 canonical user ID for the origin access identity, used when
  /// giving the origin access identity read permission to an object in Amazon S3.
  final String s3CanonicalUserId;

  /// The current configuration information for the identity.
  final CloudFrontOriginAccessIdentityConfig?
      cloudFrontOriginAccessIdentityConfig;

  CloudFrontOriginAccessIdentity({
    required this.id,
    required this.s3CanonicalUserId,
    this.cloudFrontOriginAccessIdentityConfig,
  });

  factory CloudFrontOriginAccessIdentity.fromJson(Map<String, dynamic> json) {
    return CloudFrontOriginAccessIdentity(
      id: json['Id'] as String,
      s3CanonicalUserId: json['S3CanonicalUserId'] as String,
      cloudFrontOriginAccessIdentityConfig:
          json['CloudFrontOriginAccessIdentityConfig'] != null
              ? CloudFrontOriginAccessIdentityConfig.fromJson(
                  json['CloudFrontOriginAccessIdentityConfig']
                      as Map<String, dynamic>)
              : null,
    );
  }

  factory CloudFrontOriginAccessIdentity.fromXml(_s.XmlElement elem) {
    return CloudFrontOriginAccessIdentity(
      id: _s.extractXmlStringValue(elem, 'Id')!,
      s3CanonicalUserId: _s.extractXmlStringValue(elem, 'S3CanonicalUserId')!,
      cloudFrontOriginAccessIdentityConfig: _s
          .extractXmlChild(elem, 'CloudFrontOriginAccessIdentityConfig')
          ?.let((e) => CloudFrontOriginAccessIdentityConfig.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final s3CanonicalUserId = this.s3CanonicalUserId;
    final cloudFrontOriginAccessIdentityConfig =
        this.cloudFrontOriginAccessIdentityConfig;
    return {
      'Id': id,
      'S3CanonicalUserId': s3CanonicalUserId,
      if (cloudFrontOriginAccessIdentityConfig != null)
        'CloudFrontOriginAccessIdentityConfig':
            cloudFrontOriginAccessIdentityConfig,
    };
  }
}

/// If the <code>CallerReference</code> is a value you already sent in a
/// previous request to create an identity but the content of the
/// <code>CloudFrontOriginAccessIdentityConfig</code> is different from the
/// original request, CloudFront returns a
/// <code>CloudFrontOriginAccessIdentityAlreadyExists</code> error.
class CloudFrontOriginAccessIdentityAlreadyExists implements _s.AwsException {
  final String? message;

  CloudFrontOriginAccessIdentityAlreadyExists({
    this.message,
  });

  factory CloudFrontOriginAccessIdentityAlreadyExists.fromJson(
      Map<String, dynamic> json) {
    return CloudFrontOriginAccessIdentityAlreadyExists(
      message: json['Message'] as String?,
    );
  }

  factory CloudFrontOriginAccessIdentityAlreadyExists.fromXml(
      _s.XmlElement elem) {
    return CloudFrontOriginAccessIdentityAlreadyExists(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// Origin access identity configuration. Send a <code>GET</code> request to the
/// <code>/<i>CloudFront API version</i>/CloudFront/identity ID/config</code>
/// resource.
class CloudFrontOriginAccessIdentityConfig {
  /// A unique number that ensures the request can't be replayed.
  ///
  /// If the <code>CallerReference</code> is new (no matter the content of the
  /// <code>CloudFrontOriginAccessIdentityConfig</code> object), a new origin
  /// access identity is created.
  ///
  /// If the <code>CallerReference</code> is a value already sent in a previous
  /// identity request, and the content of the
  /// <code>CloudFrontOriginAccessIdentityConfig</code> is identical to the
  /// original request (ignoring white space), the response includes the same
  /// information returned to the original request.
  ///
  /// If the <code>CallerReference</code> is a value you already sent in a
  /// previous request to create an identity, but the content of the
  /// <code>CloudFrontOriginAccessIdentityConfig</code> is different from the
  /// original request, CloudFront returns a
  /// <code>CloudFrontOriginAccessIdentityAlreadyExists</code> error.
  final String callerReference;

  /// Any comments you want to include about the origin access identity.
  final String comment;

  CloudFrontOriginAccessIdentityConfig({
    required this.callerReference,
    required this.comment,
  });

  factory CloudFrontOriginAccessIdentityConfig.fromJson(
      Map<String, dynamic> json) {
    return CloudFrontOriginAccessIdentityConfig(
      callerReference: json['CallerReference'] as String,
      comment: json['Comment'] as String,
    );
  }

  factory CloudFrontOriginAccessIdentityConfig.fromXml(_s.XmlElement elem) {
    return CloudFrontOriginAccessIdentityConfig(
      callerReference: _s.extractXmlStringValue(elem, 'CallerReference')!,
      comment: _s.extractXmlStringValue(elem, 'Comment')!,
    );
  }

  Map<String, dynamic> toJson() {
    final callerReference = this.callerReference;
    final comment = this.comment;
    return {
      'CallerReference': callerReference,
      'Comment': comment,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final callerReference = this.callerReference;
    final comment = this.comment;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('CallerReference', callerReference),
      _s.encodeXmlStringValue('Comment', comment),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

class CloudFrontOriginAccessIdentityInUse implements _s.AwsException {
  final String? message;

  CloudFrontOriginAccessIdentityInUse({
    this.message,
  });

  factory CloudFrontOriginAccessIdentityInUse.fromJson(
      Map<String, dynamic> json) {
    return CloudFrontOriginAccessIdentityInUse(
      message: json['Message'] as String?,
    );
  }

  factory CloudFrontOriginAccessIdentityInUse.fromXml(_s.XmlElement elem) {
    return CloudFrontOriginAccessIdentityInUse(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// Lists the origin access identities for CloudFront.Send a <code>GET</code>
/// request to the <code>/<i>CloudFront API
/// version</i>/origin-access-identity/cloudfront</code> resource. The response
/// includes a <code>CloudFrontOriginAccessIdentityList</code> element with zero
/// or more <code>CloudFrontOriginAccessIdentitySummary</code> child elements.
/// By default, your entire list of origin access identities is returned in one
/// single page. If the list is long, you can paginate it using the
/// <code>MaxItems</code> and <code>Marker</code> parameters.
class CloudFrontOriginAccessIdentityList {
  /// A flag that indicates whether more origin access identities remain to be
  /// listed. If your results were truncated, you can make a follow-up pagination
  /// request using the <code>Marker</code> request parameter to retrieve more
  /// items in the list.
  final bool isTruncated;

  /// Use this when paginating results to indicate where to begin in your list of
  /// origin access identities. The results include identities in the list that
  /// occur after the marker. To get the next page of results, set the
  /// <code>Marker</code> to the value of the <code>NextMarker</code> from the
  /// current page's response (which is also the ID of the last identity on that
  /// page).
  final String marker;

  /// The maximum number of origin access identities you want in the response
  /// body.
  final int maxItems;

  /// The number of CloudFront origin access identities that were created by the
  /// current AWS account.
  final int quantity;

  /// A complex type that contains one
  /// <code>CloudFrontOriginAccessIdentitySummary</code> element for each origin
  /// access identity that was created by the current AWS account.
  final List<CloudFrontOriginAccessIdentitySummary>? items;

  /// If <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value you can use for the <code>Marker</code> request
  /// parameter to continue listing your origin access identities where they left
  /// off.
  final String? nextMarker;

  CloudFrontOriginAccessIdentityList({
    required this.isTruncated,
    required this.marker,
    required this.maxItems,
    required this.quantity,
    this.items,
    this.nextMarker,
  });

  factory CloudFrontOriginAccessIdentityList.fromJson(
      Map<String, dynamic> json) {
    return CloudFrontOriginAccessIdentityList(
      isTruncated: json['IsTruncated'] as bool,
      marker: json['Marker'] as String,
      maxItems: json['MaxItems'] as int,
      quantity: json['Quantity'] as int,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => CloudFrontOriginAccessIdentitySummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  factory CloudFrontOriginAccessIdentityList.fromXml(_s.XmlElement elem) {
    return CloudFrontOriginAccessIdentityList(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated')!,
      marker: _s.extractXmlStringValue(elem, 'Marker')!,
      maxItems: _s.extractXmlIntValue(elem, 'MaxItems')!,
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('CloudFrontOriginAccessIdentitySummary')
          .map((c) => CloudFrontOriginAccessIdentitySummary.fromXml(c))
          .toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }

  Map<String, dynamic> toJson() {
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    final maxItems = this.maxItems;
    final quantity = this.quantity;
    final items = this.items;
    final nextMarker = this.nextMarker;
    return {
      'IsTruncated': isTruncated,
      'Marker': marker,
      'MaxItems': maxItems,
      'Quantity': quantity,
      if (items != null) 'Items': items,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// Summary of the information about a CloudFront origin access identity.
class CloudFrontOriginAccessIdentitySummary {
  /// The comment for this origin access identity, as originally specified when
  /// created.
  final String comment;

  /// The ID for the origin access identity. For example:
  /// <code>E74FTE3AJFJ256A</code>.
  final String id;

  /// The Amazon S3 canonical user ID for the origin access identity, which you
  /// use when giving the origin access identity read permission to an object in
  /// Amazon S3.
  final String s3CanonicalUserId;

  CloudFrontOriginAccessIdentitySummary({
    required this.comment,
    required this.id,
    required this.s3CanonicalUserId,
  });

  factory CloudFrontOriginAccessIdentitySummary.fromJson(
      Map<String, dynamic> json) {
    return CloudFrontOriginAccessIdentitySummary(
      comment: json['Comment'] as String,
      id: json['Id'] as String,
      s3CanonicalUserId: json['S3CanonicalUserId'] as String,
    );
  }

  factory CloudFrontOriginAccessIdentitySummary.fromXml(_s.XmlElement elem) {
    return CloudFrontOriginAccessIdentitySummary(
      comment: _s.extractXmlStringValue(elem, 'Comment')!,
      id: _s.extractXmlStringValue(elem, 'Id')!,
      s3CanonicalUserId: _s.extractXmlStringValue(elem, 'S3CanonicalUserId')!,
    );
  }

  Map<String, dynamic> toJson() {
    final comment = this.comment;
    final id = this.id;
    final s3CanonicalUserId = this.s3CanonicalUserId;
    return {
      'Comment': comment,
      'Id': id,
      'S3CanonicalUserId': s3CanonicalUserId,
    };
  }
}

/// A complex type that specifies whether you want CloudFront to forward cookies
/// to the origin and, if so, which ones. For more information about forwarding
/// cookies to the origin, see <a
/// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Cookies.html">How
/// CloudFront Forwards, Caches, and Logs Cookies</a> in the <i>Amazon
/// CloudFront Developer Guide</i>.
class CookieNames {
  /// The number of different cookies that you want CloudFront to forward to the
  /// origin for this cache behavior.
  final int quantity;

  /// A complex type that contains one <code>Name</code> element for each cookie
  /// that you want CloudFront to forward to the origin for this cache behavior.
  final List<String>? items;

  CookieNames({
    required this.quantity,
    this.items,
  });

  factory CookieNames.fromJson(Map<String, dynamic> json) {
    return CookieNames(
      quantity: json['Quantity'] as int,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  factory CookieNames.fromXml(_s.XmlElement elem) {
    return CookieNames(
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
      items: _s
          .extractXmlChild(elem, 'Items')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Name')),
    );
  }

  Map<String, dynamic> toJson() {
    final quantity = this.quantity;
    final items = this.items;
    return {
      'Quantity': quantity,
      if (items != null) 'Items': items,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final quantity = this.quantity;
    final items = this.items;
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => _s.encodeXmlStringValue('Name', e))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that specifies whether you want CloudFront to forward cookies
/// to the origin and, if so, which ones. For more information about forwarding
/// cookies to the origin, see <a
/// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Cookies.html">How
/// CloudFront Forwards, Caches, and Logs Cookies</a> in the <i>Amazon
/// CloudFront Developer Guide</i>.
class CookiePreference {
  /// Specifies which cookies to forward to the origin for this cache behavior:
  /// all, none, or the list of cookies specified in the
  /// <code>WhitelistedNames</code> complex type.
  ///
  /// Amazon S3 doesn't process cookies. When the cache behavior is forwarding
  /// requests to an Amazon S3 origin, specify none for the <code>Forward</code>
  /// element.
  final ItemSelection forward;

  /// Required if you specify <code>whitelist</code> for the value of
  /// <code>Forward:</code>. A complex type that specifies how many different
  /// cookies you want CloudFront to forward to the origin for this cache behavior
  /// and, if you want to forward selected cookies, the names of those cookies.
  ///
  /// If you specify <code>all</code> or none for the value of
  /// <code>Forward</code>, omit <code>WhitelistedNames</code>. If you change the
  /// value of <code>Forward</code> from <code>whitelist</code> to all or none and
  /// you don't delete the <code>WhitelistedNames</code> element and its child
  /// elements, CloudFront deletes them automatically.
  ///
  /// For the current limit on the number of cookie names that you can whitelist
  /// for each cache behavior, see <a
  /// href="http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_cloudfront">Amazon
  /// CloudFront Limits</a> in the <i>AWS General Reference</i>.
  final CookieNames? whitelistedNames;

  CookiePreference({
    required this.forward,
    this.whitelistedNames,
  });

  factory CookiePreference.fromJson(Map<String, dynamic> json) {
    return CookiePreference(
      forward: (json['Forward'] as String).toItemSelection(),
      whitelistedNames: json['WhitelistedNames'] != null
          ? CookieNames.fromJson(
              json['WhitelistedNames'] as Map<String, dynamic>)
          : null,
    );
  }

  factory CookiePreference.fromXml(_s.XmlElement elem) {
    return CookiePreference(
      forward: _s.extractXmlStringValue(elem, 'Forward')!.toItemSelection(),
      whitelistedNames: _s
          .extractXmlChild(elem, 'WhitelistedNames')
          ?.let((e) => CookieNames.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final forward = this.forward;
    final whitelistedNames = this.whitelistedNames;
    return {
      'Forward': forward.toValue(),
      if (whitelistedNames != null) 'WhitelistedNames': whitelistedNames,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final forward = this.forward;
    final whitelistedNames = this.whitelistedNames;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Forward', forward.toValue()),
      if (whitelistedNames != null) whitelistedNames.toXml('WhitelistedNames'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// The returned result of the corresponding request.
class CreateCloudFrontOriginAccessIdentityResult {
  /// The origin access identity's information.
  final CloudFrontOriginAccessIdentity? cloudFrontOriginAccessIdentity;

  /// The current version of the origin access identity created.
  final String? eTag;

  /// The fully qualified URI of the new origin access identity just created. For
  /// example:
  /// <code>https://cloudfront.amazonaws.com/2010-11-01/origin-access-identity/cloudfront/E74FTE3AJFJ256A</code>.
  final String? location;

  CreateCloudFrontOriginAccessIdentityResult({
    this.cloudFrontOriginAccessIdentity,
    this.eTag,
    this.location,
  });

  factory CreateCloudFrontOriginAccessIdentityResult.fromJson(
      Map<String, dynamic> json) {
    return CreateCloudFrontOriginAccessIdentityResult(
      cloudFrontOriginAccessIdentity: json['CloudFrontOriginAccessIdentity'] !=
              null
          ? CloudFrontOriginAccessIdentity.fromJson(
              json['CloudFrontOriginAccessIdentity'] as Map<String, dynamic>)
          : null,
      eTag: json['ETag'] as String?,
      location: json['Location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFrontOriginAccessIdentity = this.cloudFrontOriginAccessIdentity;
    final eTag = this.eTag;
    final location = this.location;
    return {
      if (cloudFrontOriginAccessIdentity != null)
        'CloudFrontOriginAccessIdentity': cloudFrontOriginAccessIdentity,
    };
  }
}

/// The returned result of the corresponding request.
class CreateDistributionResult {
  /// The distribution's information.
  final Distribution? distribution;

  /// The current version of the distribution created.
  final String? eTag;

  /// The fully qualified URI of the new distribution resource just created. For
  /// example:
  /// <code>https://cloudfront.amazonaws.com/2010-11-01/distribution/EDFDVBD632BHDS5</code>.
  final String? location;

  CreateDistributionResult({
    this.distribution,
    this.eTag,
    this.location,
  });

  factory CreateDistributionResult.fromJson(Map<String, dynamic> json) {
    return CreateDistributionResult(
      distribution: json['Distribution'] != null
          ? Distribution.fromJson(json['Distribution'] as Map<String, dynamic>)
          : null,
      eTag: json['ETag'] as String?,
      location: json['Location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final distribution = this.distribution;
    final eTag = this.eTag;
    final location = this.location;
    return {
      if (distribution != null) 'Distribution': distribution,
    };
  }
}

/// The returned result of the corresponding request.
class CreateDistributionWithTagsResult {
  /// The distribution's information.
  final Distribution? distribution;

  /// The current version of the distribution created.
  final String? eTag;

  /// The fully qualified URI of the new distribution resource just created. For
  /// example:
  /// <code>https://cloudfront.amazonaws.com/2010-11-01/distribution/EDFDVBD632BHDS5</code>.
  final String? location;

  CreateDistributionWithTagsResult({
    this.distribution,
    this.eTag,
    this.location,
  });

  factory CreateDistributionWithTagsResult.fromJson(Map<String, dynamic> json) {
    return CreateDistributionWithTagsResult(
      distribution: json['Distribution'] != null
          ? Distribution.fromJson(json['Distribution'] as Map<String, dynamic>)
          : null,
      eTag: json['ETag'] as String?,
      location: json['Location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final distribution = this.distribution;
    final eTag = this.eTag;
    final location = this.location;
    return {
      if (distribution != null) 'Distribution': distribution,
    };
  }
}

/// The returned result of the corresponding request.
class CreateInvalidationResult {
  /// The invalidation's information.
  final Invalidation? invalidation;

  /// The fully qualified URI of the distribution and invalidation batch request,
  /// including the <code>Invalidation ID</code>.
  final String? location;

  CreateInvalidationResult({
    this.invalidation,
    this.location,
  });

  factory CreateInvalidationResult.fromJson(Map<String, dynamic> json) {
    return CreateInvalidationResult(
      invalidation: json['Invalidation'] != null
          ? Invalidation.fromJson(json['Invalidation'] as Map<String, dynamic>)
          : null,
      location: json['Location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final invalidation = this.invalidation;
    final location = this.location;
    return {
      if (invalidation != null) 'Invalidation': invalidation,
    };
  }
}

/// The returned result of the corresponding request.
class CreateStreamingDistributionResult {
  /// The current version of the streaming distribution created.
  final String? eTag;

  /// The fully qualified URI of the new streaming distribution resource just
  /// created. For example:
  /// <code>https://cloudfront.amazonaws.com/2010-11-01/streaming-distribution/EGTXBD79H29TRA8</code>.
  final String? location;

  /// The streaming distribution's information.
  final StreamingDistribution? streamingDistribution;

  CreateStreamingDistributionResult({
    this.eTag,
    this.location,
    this.streamingDistribution,
  });

  factory CreateStreamingDistributionResult.fromJson(
      Map<String, dynamic> json) {
    return CreateStreamingDistributionResult(
      eTag: json['ETag'] as String?,
      location: json['Location'] as String?,
      streamingDistribution: json['StreamingDistribution'] != null
          ? StreamingDistribution.fromJson(
              json['StreamingDistribution'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eTag = this.eTag;
    final location = this.location;
    final streamingDistribution = this.streamingDistribution;
    return {
      if (streamingDistribution != null)
        'StreamingDistribution': streamingDistribution,
    };
  }
}

/// The returned result of the corresponding request.
class CreateStreamingDistributionWithTagsResult {
  final String? eTag;

  /// The fully qualified URI of the new streaming distribution resource just
  /// created. For example:<code>
  /// https://cloudfront.amazonaws.com/2010-11-01/streaming-distribution/EGTXBD79H29TRA8</code>.
  final String? location;

  /// The streaming distribution's information.
  final StreamingDistribution? streamingDistribution;

  CreateStreamingDistributionWithTagsResult({
    this.eTag,
    this.location,
    this.streamingDistribution,
  });

  factory CreateStreamingDistributionWithTagsResult.fromJson(
      Map<String, dynamic> json) {
    return CreateStreamingDistributionWithTagsResult(
      eTag: json['ETag'] as String?,
      location: json['Location'] as String?,
      streamingDistribution: json['StreamingDistribution'] != null
          ? StreamingDistribution.fromJson(
              json['StreamingDistribution'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eTag = this.eTag;
    final location = this.location;
    final streamingDistribution = this.streamingDistribution;
    return {
      if (streamingDistribution != null)
        'StreamingDistribution': streamingDistribution,
    };
  }
}

/// A complex type that controls:
///
/// <ul>
/// <li>
/// Whether CloudFront replaces HTTP status codes in the 4xx and 5xx range with
/// custom error messages before returning the response to the viewer.
/// </li>
/// <li>
/// How long CloudFront caches HTTP status codes in the 4xx and 5xx range.
/// </li>
/// </ul>
/// For more information about custom error pages, see <a
/// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html">Customizing
/// Error Responses</a> in the <i>Amazon CloudFront Developer Guide</i>.
class CustomErrorResponse {
  /// The HTTP status code for which you want to specify a custom error page
  /// and/or a caching duration.
  final int errorCode;

  /// The minimum amount of time, in seconds, that you want CloudFront to cache
  /// the HTTP status code specified in <code>ErrorCode</code>. When this time
  /// period has elapsed, CloudFront queries your origin to see whether the
  /// problem that caused the error has been resolved and the requested object is
  /// now available.
  ///
  /// If you don't want to specify a value, include an empty element,
  /// <code>&lt;ErrorCachingMinTTL&gt;</code>, in the XML document.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html">Customizing
  /// Error Responses</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final int? errorCachingMinTTL;

  /// The HTTP status code that you want CloudFront to return to the viewer along
  /// with the custom error page. There are a variety of reasons that you might
  /// want CloudFront to return a status code different from the status code that
  /// your origin returned to CloudFront, for example:
  ///
  /// <ul>
  /// <li>
  /// Some Internet devices (some firewalls and corporate proxies, for example)
  /// intercept HTTP 4xx and 5xx and prevent the response from being returned to
  /// the viewer. If you substitute <code>200</code>, the response typically won't
  /// be intercepted.
  /// </li>
  /// <li>
  /// If you don't care about distinguishing among different client errors or
  /// server errors, you can specify <code>400</code> or <code>500</code> as the
  /// <code>ResponseCode</code> for all 4xx or 5xx errors.
  /// </li>
  /// <li>
  /// You might want to return a <code>200</code> status code (OK) and static
  /// website so your customers don't know that your website is down.
  /// </li>
  /// </ul>
  /// If you specify a value for <code>ResponseCode</code>, you must also specify
  /// a value for <code>ResponsePagePath</code>. If you don't want to specify a
  /// value, include an empty element, <code>&lt;ResponseCode&gt;</code>, in the
  /// XML document.
  final String? responseCode;

  /// The path to the custom error page that you want CloudFront to return to a
  /// viewer when your origin returns the HTTP status code specified by
  /// <code>ErrorCode</code>, for example,
  /// <code>/4xx-errors/403-forbidden.html</code>. If you want to store your
  /// objects and your custom error pages in different locations, your
  /// distribution must include a cache behavior for which the following is true:
  ///
  /// <ul>
  /// <li>
  /// The value of <code>PathPattern</code> matches the path to your custom error
  /// messages. For example, suppose you saved custom error pages for 4xx errors
  /// in an Amazon S3 bucket in a directory named <code>/4xx-errors</code>. Your
  /// distribution must include a cache behavior for which the path pattern routes
  /// requests for your custom error pages to that location, for example,
  /// <code>/4xx-errors/*</code>.
  /// </li>
  /// <li>
  /// The value of <code>TargetOriginId</code> specifies the value of the
  /// <code>ID</code> element for the origin that contains your custom error
  /// pages.
  /// </li>
  /// </ul>
  /// If you specify a value for <code>ResponsePagePath</code>, you must also
  /// specify a value for <code>ResponseCode</code>. If you don't want to specify
  /// a value, include an empty element, <code>&lt;ResponsePagePath&gt;</code>, in
  /// the XML document.
  ///
  /// We recommend that you store custom error pages in an Amazon S3 bucket. If
  /// you store custom error pages on an HTTP server and the server starts to
  /// return 5xx errors, CloudFront can't get the files that you want to return to
  /// viewers because the origin server is unavailable.
  final String? responsePagePath;

  CustomErrorResponse({
    required this.errorCode,
    this.errorCachingMinTTL,
    this.responseCode,
    this.responsePagePath,
  });

  factory CustomErrorResponse.fromJson(Map<String, dynamic> json) {
    return CustomErrorResponse(
      errorCode: json['ErrorCode'] as int,
      errorCachingMinTTL: json['ErrorCachingMinTTL'] as int?,
      responseCode: json['ResponseCode'] as String?,
      responsePagePath: json['ResponsePagePath'] as String?,
    );
  }

  factory CustomErrorResponse.fromXml(_s.XmlElement elem) {
    return CustomErrorResponse(
      errorCode: _s.extractXmlIntValue(elem, 'ErrorCode')!,
      errorCachingMinTTL: _s.extractXmlIntValue(elem, 'ErrorCachingMinTTL'),
      responseCode: _s.extractXmlStringValue(elem, 'ResponseCode'),
      responsePagePath: _s.extractXmlStringValue(elem, 'ResponsePagePath'),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorCachingMinTTL = this.errorCachingMinTTL;
    final responseCode = this.responseCode;
    final responsePagePath = this.responsePagePath;
    return {
      'ErrorCode': errorCode,
      if (errorCachingMinTTL != null) 'ErrorCachingMinTTL': errorCachingMinTTL,
      if (responseCode != null) 'ResponseCode': responseCode,
      if (responsePagePath != null) 'ResponsePagePath': responsePagePath,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final errorCode = this.errorCode;
    final errorCachingMinTTL = this.errorCachingMinTTL;
    final responseCode = this.responseCode;
    final responsePagePath = this.responsePagePath;
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('ErrorCode', errorCode),
      if (responsePagePath != null)
        _s.encodeXmlStringValue('ResponsePagePath', responsePagePath),
      if (responseCode != null)
        _s.encodeXmlStringValue('ResponseCode', responseCode),
      if (errorCachingMinTTL != null)
        _s.encodeXmlIntValue('ErrorCachingMinTTL', errorCachingMinTTL),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that controls:
///
/// <ul>
/// <li>
/// Whether CloudFront replaces HTTP status codes in the 4xx and 5xx range with
/// custom error messages before returning the response to the viewer.
/// </li>
/// <li>
/// How long CloudFront caches HTTP status codes in the 4xx and 5xx range.
/// </li>
/// </ul>
/// For more information about custom error pages, see <a
/// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html">Customizing
/// Error Responses</a> in the <i>Amazon CloudFront Developer Guide</i>.
class CustomErrorResponses {
  /// The number of HTTP status codes for which you want to specify a custom error
  /// page and/or a caching duration. If <code>Quantity</code> is <code>0</code>,
  /// you can omit <code>Items</code>.
  final int quantity;

  /// A complex type that contains a <code>CustomErrorResponse</code> element for
  /// each HTTP status code for which you want to specify a custom error page
  /// and/or a caching duration.
  final List<CustomErrorResponse>? items;

  CustomErrorResponses({
    required this.quantity,
    this.items,
  });

  factory CustomErrorResponses.fromJson(Map<String, dynamic> json) {
    return CustomErrorResponses(
      quantity: json['Quantity'] as int,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => CustomErrorResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory CustomErrorResponses.fromXml(_s.XmlElement elem) {
    return CustomErrorResponses(
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('CustomErrorResponse')
          .map((c) => CustomErrorResponse.fromXml(c))
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final quantity = this.quantity;
    final items = this.items;
    return {
      'Quantity': quantity,
      if (items != null) 'Items': items,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final quantity = this.quantity;
    final items = this.items;
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => e.toXml('CustomErrorResponse'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains the list of Custom Headers for each origin.
class CustomHeaders {
  /// The number of custom headers, if any, for this distribution.
  final int quantity;

  /// <b>Optional</b>: A list that contains one <code>OriginCustomHeader</code>
  /// element for each custom header that you want CloudFront to forward to the
  /// origin. If Quantity is <code>0</code>, omit <code>Items</code>.
  final List<OriginCustomHeader>? items;

  CustomHeaders({
    required this.quantity,
    this.items,
  });

  factory CustomHeaders.fromJson(Map<String, dynamic> json) {
    return CustomHeaders(
      quantity: json['Quantity'] as int,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => OriginCustomHeader.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory CustomHeaders.fromXml(_s.XmlElement elem) {
    return CustomHeaders(
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('OriginCustomHeader')
          .map((c) => OriginCustomHeader.fromXml(c))
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final quantity = this.quantity;
    final items = this.items;
    return {
      'Quantity': quantity,
      if (items != null) 'Items': items,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final quantity = this.quantity;
    final items = this.items;
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => e.toXml('OriginCustomHeader'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A customer origin.
class CustomOriginConfig {
  /// The HTTP port the custom origin listens on.
  final int hTTPPort;

  /// The HTTPS port the custom origin listens on.
  final int hTTPSPort;

  /// The origin protocol policy to apply to your origin.
  final OriginProtocolPolicy originProtocolPolicy;

  /// The SSL/TLS protocols that you want CloudFront to use when communicating
  /// with your origin over HTTPS.
  final OriginSslProtocols? originSslProtocols;

  CustomOriginConfig({
    required this.hTTPPort,
    required this.hTTPSPort,
    required this.originProtocolPolicy,
    this.originSslProtocols,
  });

  factory CustomOriginConfig.fromJson(Map<String, dynamic> json) {
    return CustomOriginConfig(
      hTTPPort: json['HTTPPort'] as int,
      hTTPSPort: json['HTTPSPort'] as int,
      originProtocolPolicy:
          (json['OriginProtocolPolicy'] as String).toOriginProtocolPolicy(),
      originSslProtocols: json['OriginSslProtocols'] != null
          ? OriginSslProtocols.fromJson(
              json['OriginSslProtocols'] as Map<String, dynamic>)
          : null,
    );
  }

  factory CustomOriginConfig.fromXml(_s.XmlElement elem) {
    return CustomOriginConfig(
      hTTPPort: _s.extractXmlIntValue(elem, 'HTTPPort')!,
      hTTPSPort: _s.extractXmlIntValue(elem, 'HTTPSPort')!,
      originProtocolPolicy: _s
          .extractXmlStringValue(elem, 'OriginProtocolPolicy')!
          .toOriginProtocolPolicy(),
      originSslProtocols: _s
          .extractXmlChild(elem, 'OriginSslProtocols')
          ?.let((e) => OriginSslProtocols.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final hTTPPort = this.hTTPPort;
    final hTTPSPort = this.hTTPSPort;
    final originProtocolPolicy = this.originProtocolPolicy;
    final originSslProtocols = this.originSslProtocols;
    return {
      'HTTPPort': hTTPPort,
      'HTTPSPort': hTTPSPort,
      'OriginProtocolPolicy': originProtocolPolicy.toValue(),
      if (originSslProtocols != null) 'OriginSslProtocols': originSslProtocols,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final hTTPPort = this.hTTPPort;
    final hTTPSPort = this.hTTPSPort;
    final originProtocolPolicy = this.originProtocolPolicy;
    final originSslProtocols = this.originSslProtocols;
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('HTTPPort', hTTPPort),
      _s.encodeXmlIntValue('HTTPSPort', hTTPSPort),
      _s.encodeXmlStringValue(
          'OriginProtocolPolicy', originProtocolPolicy.toValue()),
      if (originSslProtocols != null)
        originSslProtocols.toXml('OriginSslProtocols'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that describes the default cache behavior if you do not
/// specify a <code>CacheBehavior</code> element or if files don't match any of
/// the values of <code>PathPattern</code> in <code>CacheBehavior</code>
/// elements. You must create exactly one default cache behavior.
class DefaultCacheBehavior {
  /// A complex type that specifies how CloudFront handles query strings and
  /// cookies.
  final ForwardedValues forwardedValues;

  /// The minimum amount of time that you want objects to stay in CloudFront
  /// caches before CloudFront forwards another request to your origin to
  /// determine whether the object has been updated. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Specifying
  /// How Long Objects and Errors Stay in a CloudFront Edge Cache (Expiration)</a>
  /// in the <i>Amazon Amazon CloudFront Developer Guide</i>.
  ///
  /// You must specify <code>0</code> for <code>MinTTL</code> if you configure
  /// CloudFront to forward all headers to your origin (under
  /// <code>Headers</code>, if you specify <code>1</code> for
  /// <code>Quantity</code> and <code>*</code> for <code>Name</code>).
  final int minTTL;

  /// The value of <code>ID</code> for the origin that you want CloudFront to
  /// route requests to when a request matches the path pattern either for a cache
  /// behavior or for the default cache behavior.
  final String targetOriginId;

  /// A complex type that specifies the AWS accounts, if any, that you want to
  /// allow to create signed URLs for private content.
  ///
  /// If you want to require signed URLs in requests for objects in the target
  /// origin that match the <code>PathPattern</code> for this cache behavior,
  /// specify <code>true</code> for <code>Enabled</code>, and specify the
  /// applicable values for <code>Quantity</code> and <code>Items</code>. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving
  /// Private Content through CloudFront</a> in the <i>Amazon Amazon CloudFront
  /// Developer Guide</i>.
  ///
  /// If you don't want to require signed URLs in requests for objects that match
  /// <code>PathPattern</code>, specify <code>false</code> for
  /// <code>Enabled</code> and <code>0</code> for <code>Quantity</code>. Omit
  /// <code>Items</code>.
  ///
  /// To add, change, or remove one or more trusted signers, change
  /// <code>Enabled</code> to <code>true</code> (if it's currently
  /// <code>false</code>), change <code>Quantity</code> as applicable, and specify
  /// all of the trusted signers that you want to include in the updated
  /// distribution.
  final TrustedSigners trustedSigners;

  /// The protocol that viewers can use to access the files in the origin
  /// specified by <code>TargetOriginId</code> when a request matches the path
  /// pattern in <code>PathPattern</code>. You can specify the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>allow-all</code>: Viewers can use HTTP or HTTPS.
  /// </li>
  /// <li>
  /// <code>redirect-to-https</code>: If a viewer submits an HTTP request,
  /// CloudFront returns an HTTP status code of 301 (Moved Permanently) to the
  /// viewer along with the HTTPS URL. The viewer then resubmits the request using
  /// the new URL.
  /// </li>
  /// <li>
  /// <code>https-only</code>: If a viewer sends an HTTP request, CloudFront
  /// returns an HTTP status code of 403 (Forbidden).
  /// </li>
  /// </ul>
  /// For more information about requiring the HTTPS protocol, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/SecureConnections.html">Using
  /// an HTTPS Connection to Access Your Objects</a> in the <i>Amazon CloudFront
  /// Developer Guide</i>.
  /// <note>
  /// The only way to guarantee that viewers retrieve an object that was fetched
  /// from the origin using HTTPS is never to use any other protocol to fetch the
  /// object. If you have recently changed from HTTP to HTTPS, we recommend that
  /// you clear your objects' cache because cached objects are protocol agnostic.
  /// That means that an edge location will return an object from the cache
  /// regardless of whether the current request protocol matches the protocol used
  /// previously. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Specifying
  /// How Long Objects and Errors Stay in a CloudFront Edge Cache (Expiration)</a>
  /// in the <i>Amazon CloudFront Developer Guide</i>.
  /// </note>
  final ViewerProtocolPolicy viewerProtocolPolicy;
  final AllowedMethods? allowedMethods;

  /// Whether you want CloudFront to automatically compress certain files for this
  /// cache behavior. If so, specify <code>true</code>; if not, specify
  /// <code>false</code>. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/ServingCompressedFiles.html">Serving
  /// Compressed Files</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final bool? compress;

  /// The default amount of time that you want objects to stay in CloudFront
  /// caches before CloudFront forwards another request to your origin to
  /// determine whether the object has been updated. The value that you specify
  /// applies only when your origin does not add HTTP headers such as
  /// <code>Cache-Control max-age</code>, <code>Cache-Control s-maxage</code>, and
  /// <code>Expires</code> to objects. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Specifying
  /// How Long Objects and Errors Stay in a CloudFront Edge Cache (Expiration)</a>
  /// in the <i>Amazon CloudFront Developer Guide</i>.
  final int? defaultTTL;

  /// A complex type that contains zero or more Lambda function associations for a
  /// cache behavior.
  final LambdaFunctionAssociations? lambdaFunctionAssociations;
  final int? maxTTL;

  /// Indicates whether you want to distribute media files in the Microsoft Smooth
  /// Streaming format using the origin that is associated with this cache
  /// behavior. If so, specify <code>true</code>; if not, specify
  /// <code>false</code>. If you specify <code>true</code> for
  /// <code>SmoothStreaming</code>, you can still distribute other content using
  /// this cache behavior if the content matches the value of
  /// <code>PathPattern</code>.
  final bool? smoothStreaming;

  DefaultCacheBehavior({
    required this.forwardedValues,
    required this.minTTL,
    required this.targetOriginId,
    required this.trustedSigners,
    required this.viewerProtocolPolicy,
    this.allowedMethods,
    this.compress,
    this.defaultTTL,
    this.lambdaFunctionAssociations,
    this.maxTTL,
    this.smoothStreaming,
  });

  factory DefaultCacheBehavior.fromJson(Map<String, dynamic> json) {
    return DefaultCacheBehavior(
      forwardedValues: ForwardedValues.fromJson(
          json['ForwardedValues'] as Map<String, dynamic>),
      minTTL: json['MinTTL'] as int,
      targetOriginId: json['TargetOriginId'] as String,
      trustedSigners: TrustedSigners.fromJson(
          json['TrustedSigners'] as Map<String, dynamic>),
      viewerProtocolPolicy:
          (json['ViewerProtocolPolicy'] as String).toViewerProtocolPolicy(),
      allowedMethods: json['AllowedMethods'] != null
          ? AllowedMethods.fromJson(
              json['AllowedMethods'] as Map<String, dynamic>)
          : null,
      compress: json['Compress'] as bool?,
      defaultTTL: json['DefaultTTL'] as int?,
      lambdaFunctionAssociations: json['LambdaFunctionAssociations'] != null
          ? LambdaFunctionAssociations.fromJson(
              json['LambdaFunctionAssociations'] as Map<String, dynamic>)
          : null,
      maxTTL: json['MaxTTL'] as int?,
      smoothStreaming: json['SmoothStreaming'] as bool?,
    );
  }

  factory DefaultCacheBehavior.fromXml(_s.XmlElement elem) {
    return DefaultCacheBehavior(
      forwardedValues:
          ForwardedValues.fromXml(_s.extractXmlChild(elem, 'ForwardedValues')!),
      minTTL: _s.extractXmlIntValue(elem, 'MinTTL')!,
      targetOriginId: _s.extractXmlStringValue(elem, 'TargetOriginId')!,
      trustedSigners:
          TrustedSigners.fromXml(_s.extractXmlChild(elem, 'TrustedSigners')!),
      viewerProtocolPolicy: _s
          .extractXmlStringValue(elem, 'ViewerProtocolPolicy')!
          .toViewerProtocolPolicy(),
      allowedMethods: _s
          .extractXmlChild(elem, 'AllowedMethods')
          ?.let((e) => AllowedMethods.fromXml(e)),
      compress: _s.extractXmlBoolValue(elem, 'Compress'),
      defaultTTL: _s.extractXmlIntValue(elem, 'DefaultTTL'),
      lambdaFunctionAssociations: _s
          .extractXmlChild(elem, 'LambdaFunctionAssociations')
          ?.let((e) => LambdaFunctionAssociations.fromXml(e)),
      maxTTL: _s.extractXmlIntValue(elem, 'MaxTTL'),
      smoothStreaming: _s.extractXmlBoolValue(elem, 'SmoothStreaming'),
    );
  }

  Map<String, dynamic> toJson() {
    final forwardedValues = this.forwardedValues;
    final minTTL = this.minTTL;
    final targetOriginId = this.targetOriginId;
    final trustedSigners = this.trustedSigners;
    final viewerProtocolPolicy = this.viewerProtocolPolicy;
    final allowedMethods = this.allowedMethods;
    final compress = this.compress;
    final defaultTTL = this.defaultTTL;
    final lambdaFunctionAssociations = this.lambdaFunctionAssociations;
    final maxTTL = this.maxTTL;
    final smoothStreaming = this.smoothStreaming;
    return {
      'ForwardedValues': forwardedValues,
      'MinTTL': minTTL,
      'TargetOriginId': targetOriginId,
      'TrustedSigners': trustedSigners,
      'ViewerProtocolPolicy': viewerProtocolPolicy.toValue(),
      if (allowedMethods != null) 'AllowedMethods': allowedMethods,
      if (compress != null) 'Compress': compress,
      if (defaultTTL != null) 'DefaultTTL': defaultTTL,
      if (lambdaFunctionAssociations != null)
        'LambdaFunctionAssociations': lambdaFunctionAssociations,
      if (maxTTL != null) 'MaxTTL': maxTTL,
      if (smoothStreaming != null) 'SmoothStreaming': smoothStreaming,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final forwardedValues = this.forwardedValues;
    final minTTL = this.minTTL;
    final targetOriginId = this.targetOriginId;
    final trustedSigners = this.trustedSigners;
    final viewerProtocolPolicy = this.viewerProtocolPolicy;
    final allowedMethods = this.allowedMethods;
    final compress = this.compress;
    final defaultTTL = this.defaultTTL;
    final lambdaFunctionAssociations = this.lambdaFunctionAssociations;
    final maxTTL = this.maxTTL;
    final smoothStreaming = this.smoothStreaming;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('TargetOriginId', targetOriginId),
      forwardedValues.toXml('ForwardedValues'),
      trustedSigners.toXml('TrustedSigners'),
      _s.encodeXmlStringValue(
          'ViewerProtocolPolicy', viewerProtocolPolicy.toValue()),
      _s.encodeXmlIntValue('MinTTL', minTTL),
      if (allowedMethods != null) allowedMethods.toXml('AllowedMethods'),
      if (smoothStreaming != null)
        _s.encodeXmlBoolValue('SmoothStreaming', smoothStreaming),
      if (defaultTTL != null) _s.encodeXmlIntValue('DefaultTTL', defaultTTL),
      if (maxTTL != null) _s.encodeXmlIntValue('MaxTTL', maxTTL),
      if (compress != null) _s.encodeXmlBoolValue('Compress', compress),
      if (lambdaFunctionAssociations != null)
        lambdaFunctionAssociations.toXml('LambdaFunctionAssociations'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// The distribution's information.
class Distribution {
  /// The ARN (Amazon Resource Name) for the distribution. For example:
  /// <code>arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5</code>,
  /// where <code>123456789012</code> is your AWS account ID.
  final String arn;

  /// CloudFront automatically adds this element to the response only if you've
  /// set up the distribution to serve private content with signed URLs. The
  /// element lists the key pair IDs that CloudFront is aware of for each trusted
  /// signer. The <code>Signer</code> child element lists the AWS account number
  /// of the trusted signer (or an empty <code>Self</code> element if the signer
  /// is you). The <code>Signer</code> element also includes the IDs of any active
  /// key pairs associated with the trusted signer's AWS account. If no
  /// <code>KeyPairId</code> element appears for a <code>Signer</code>, that
  /// signer can't create working signed URLs.
  final ActiveTrustedSigners activeTrustedSigners;

  /// The current configuration information for the distribution. Send a
  /// <code>GET</code> request to the <code>/<i>CloudFront API
  /// version</i>/distribution ID/config</code> resource.
  final DistributionConfig distributionConfig;

  /// The domain name corresponding to the distribution. For example:
  /// <code>d604721fxaaqy9.cloudfront.net</code>.
  final String domainName;

  /// The identifier for the distribution. For example:
  /// <code>EDFDVBD632BHDS5</code>.
  final String id;

  /// The number of invalidation batches currently in progress.
  final int inProgressInvalidationBatches;

  /// The date and time the distribution was last modified.
  final DateTime lastModifiedTime;

  /// This response element indicates the current status of the distribution. When
  /// the status is <code>Deployed</code>, the distribution's information is fully
  /// propagated to all CloudFront edge locations.
  final String status;

  Distribution({
    required this.arn,
    required this.activeTrustedSigners,
    required this.distributionConfig,
    required this.domainName,
    required this.id,
    required this.inProgressInvalidationBatches,
    required this.lastModifiedTime,
    required this.status,
  });

  factory Distribution.fromJson(Map<String, dynamic> json) {
    return Distribution(
      arn: json['ARN'] as String,
      activeTrustedSigners: ActiveTrustedSigners.fromJson(
          json['ActiveTrustedSigners'] as Map<String, dynamic>),
      distributionConfig: DistributionConfig.fromJson(
          json['DistributionConfig'] as Map<String, dynamic>),
      domainName: json['DomainName'] as String,
      id: json['Id'] as String,
      inProgressInvalidationBatches:
          json['InProgressInvalidationBatches'] as int,
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['LastModifiedTime'] as Object),
      status: json['Status'] as String,
    );
  }

  factory Distribution.fromXml(_s.XmlElement elem) {
    return Distribution(
      arn: _s.extractXmlStringValue(elem, 'ARN')!,
      activeTrustedSigners: ActiveTrustedSigners.fromXml(
          _s.extractXmlChild(elem, 'ActiveTrustedSigners')!),
      distributionConfig: DistributionConfig.fromXml(
          _s.extractXmlChild(elem, 'DistributionConfig')!),
      domainName: _s.extractXmlStringValue(elem, 'DomainName')!,
      id: _s.extractXmlStringValue(elem, 'Id')!,
      inProgressInvalidationBatches:
          _s.extractXmlIntValue(elem, 'InProgressInvalidationBatches')!,
      lastModifiedTime: _s.extractXmlDateTimeValue(elem, 'LastModifiedTime')!,
      status: _s.extractXmlStringValue(elem, 'Status')!,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final activeTrustedSigners = this.activeTrustedSigners;
    final distributionConfig = this.distributionConfig;
    final domainName = this.domainName;
    final id = this.id;
    final inProgressInvalidationBatches = this.inProgressInvalidationBatches;
    final lastModifiedTime = this.lastModifiedTime;
    final status = this.status;
    return {
      'ARN': arn,
      'ActiveTrustedSigners': activeTrustedSigners,
      'DistributionConfig': distributionConfig,
      'DomainName': domainName,
      'Id': id,
      'InProgressInvalidationBatches': inProgressInvalidationBatches,
      'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      'Status': status,
    };
  }
}

/// The caller reference you attempted to create the distribution with is
/// associated with another distribution.
class DistributionAlreadyExists implements _s.AwsException {
  final String? message;

  DistributionAlreadyExists({
    this.message,
  });

  factory DistributionAlreadyExists.fromJson(Map<String, dynamic> json) {
    return DistributionAlreadyExists(
      message: json['Message'] as String?,
    );
  }

  factory DistributionAlreadyExists.fromXml(_s.XmlElement elem) {
    return DistributionAlreadyExists(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// A distribution configuration.
class DistributionConfig {
  /// A unique value (for example, a date-time stamp) that ensures that the
  /// request can't be replayed.
  ///
  /// If the value of <code>CallerReference</code> is new (regardless of the
  /// content of the <code>DistributionConfig</code> object), CloudFront creates a
  /// new distribution.
  ///
  /// If <code>CallerReference</code> is a value you already sent in a previous
  /// request to create a distribution, and if the content of the
  /// <code>DistributionConfig</code> is identical to the original request
  /// (ignoring white space), CloudFront returns the same the response that it
  /// returned to the original request.
  ///
  /// If <code>CallerReference</code> is a value you already sent in a previous
  /// request to create a distribution but the content of the
  /// <code>DistributionConfig</code> is different from the original request,
  /// CloudFront returns a <code>DistributionAlreadyExists</code> error.
  final String callerReference;

  /// Any comments you want to include about the distribution.
  ///
  /// If you don't want to specify a comment, include an empty
  /// <code>Comment</code> element.
  ///
  /// To delete an existing comment, update the distribution configuration and
  /// include an empty <code>Comment</code> element.
  ///
  /// To add or change a comment, update the distribution configuration and
  /// specify the new comment.
  final String comment;

  /// A complex type that describes the default cache behavior if you do not
  /// specify a <code>CacheBehavior</code> element or if files don't match any of
  /// the values of <code>PathPattern</code> in <code>CacheBehavior</code>
  /// elements. You must create exactly one default cache behavior.
  final DefaultCacheBehavior defaultCacheBehavior;

  /// Specifies whether you want CloudFront to save access logs to an Amazon S3
  /// bucket.
  ///
  /// If you do not want to enable logging when you create a distribution, or if
  /// you want to disable logging for an existing distribution, specify
  /// <code>false</code> for <code>Enabled</code>, and specify empty
  /// <code>Bucket</code> and <code>Prefix</code> elements.
  ///
  /// If you specify <code>false</code> for <code>Enabled</code> but you specify
  /// values for <code>Bucket</code> and <code>Prefix</code>, the values are
  /// automatically deleted.
  final bool enabled;

  /// A complex type that contains information about origins for this
  /// distribution.
  final Origins origins;

  /// A complex type that contains information about CNAMEs (alternate domain
  /// names), if any, for this distribution.
  final Aliases? aliases;

  /// A complex type that contains zero or more <code>CacheBehavior</code>
  /// elements.
  final CacheBehaviors? cacheBehaviors;

  /// A complex type that controls the following:
  ///
  /// <ul>
  /// <li>
  /// Whether CloudFront replaces HTTP status codes in the 4xx and 5xx range with
  /// custom error messages before returning the response to the viewer.
  /// </li>
  /// <li>
  /// How long CloudFront caches HTTP status codes in the 4xx and 5xx range.
  /// </li>
  /// </ul>
  /// For more information about custom error pages, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html">Customizing
  /// Error Responses</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final CustomErrorResponses? customErrorResponses;

  /// The object that you want CloudFront to request from your origin (for
  /// example, <code>index.html</code>) when a viewer requests the root URL for
  /// your distribution (<code>http://www.example.com</code>) instead of an object
  /// in your distribution
  /// (<code>http://www.example.com/product-description.html</code>). Specifying a
  /// default root object avoids exposing the contents of your distribution.
  ///
  /// Specify only the object name, for example, <code>index.html</code>. Do not
  /// add a <code>/</code> before the object name.
  ///
  /// If you don't want to specify a default root object when you create a
  /// distribution, include an empty <code>DefaultRootObject</code> element.
  ///
  /// To delete the default root object from an existing distribution, update the
  /// distribution configuration and include an empty
  /// <code>DefaultRootObject</code> element.
  ///
  /// To replace the default root object, update the distribution configuration
  /// and specify the new object.
  ///
  /// For more information about the default root object, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/DefaultRootObject.html">Creating
  /// a Default Root Object</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final String? defaultRootObject;

  /// (Optional) Specify the maximum HTTP version that you want viewers to use to
  /// communicate with CloudFront. The default value for new web distributions is
  /// http2. Viewers that don't support HTTP/2 automatically use an earlier HTTP
  /// version.
  ///
  /// For viewers and CloudFront to use HTTP/2, viewers must support TLS 1.2 or
  /// later, and must support Server Name Identification (SNI).
  ///
  /// In general, configuring CloudFront to communicate with viewers using HTTP/2
  /// reduces latency. You can improve performance by optimizing for HTTP/2. For
  /// more information, do an Internet search for "http/2 optimization."
  final HttpVersion? httpVersion;

  /// If you want CloudFront to respond to IPv6 DNS requests with an IPv6 address
  /// for your distribution, specify <code>true</code>. If you specify
  /// <code>false</code>, CloudFront responds to IPv6 DNS requests with the DNS
  /// response code <code>NOERROR</code> and with no IP addresses. This allows
  /// viewers to submit a second request, for an IPv4 address for your
  /// distribution.
  ///
  /// In general, you should enable IPv6 if you have users on IPv6 networks who
  /// want to access your content. However, if you're using signed URLs or signed
  /// cookies to restrict access to your content, and if you're using a custom
  /// policy that includes the <code>IpAddress</code> parameter to restrict the IP
  /// addresses that can access your content, do not enable IPv6. If you want to
  /// restrict access to some content by IP address and not restrict access to
  /// other content (or restrict access but not by IP address), you can create two
  /// distributions. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-creating-signed-url-custom-policy.html">Creating
  /// a Signed URL Using a Custom Policy</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  ///
  /// If you're using an Amazon Route 53 alias resource record set to route
  /// traffic to your CloudFront distribution, you need to create a second alias
  /// resource record set when both of the following are true:
  ///
  /// <ul>
  /// <li>
  /// You enable IPv6 for the distribution
  /// </li>
  /// <li>
  /// You're using alternate domain names in the URLs for your objects
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-to-cloudfront-distribution.html">Routing
  /// Traffic to an Amazon CloudFront Web Distribution by Using Your Domain
  /// Name</a> in the <i>Amazon Route 53 Developer Guide</i>.
  ///
  /// If you created a CNAME resource record set, either with Amazon Route 53 or
  /// with another DNS service, you don't need to make any changes. A CNAME record
  /// will route traffic to your distribution regardless of the IP address format
  /// of the viewer request.
  final bool? isIPV6Enabled;

  /// A complex type that controls whether access logs are written for the
  /// distribution.
  ///
  /// For more information about logging, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/AccessLogs.html">Access
  /// Logs</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final LoggingConfig? logging;

  /// The price class that corresponds with the maximum price that you want to pay
  /// for CloudFront service. If you specify <code>PriceClass_All</code>,
  /// CloudFront responds to requests for your objects from all CloudFront edge
  /// locations.
  ///
  /// If you specify a price class other than <code>PriceClass_All</code>,
  /// CloudFront serves your objects from the CloudFront edge location that has
  /// the lowest latency among the edge locations in your price class. Viewers who
  /// are in or near regions that are excluded from your specified price class may
  /// encounter slower performance.
  ///
  /// For more information about price classes, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PriceClass.html">Choosing
  /// the Price Class for a CloudFront Distribution</a> in the <i>Amazon
  /// CloudFront Developer Guide</i>. For information about CloudFront pricing,
  /// including how price classes map to CloudFront regions, see <a
  /// href="https://aws.amazon.com/cloudfront/pricing/">Amazon CloudFront
  /// Pricing</a>.
  final PriceClass? priceClass;
  final Restrictions? restrictions;
  final ViewerCertificate? viewerCertificate;

  /// A unique identifier that specifies the AWS WAF web ACL, if any, to associate
  /// with this distribution.
  ///
  /// AWS WAF is a web application firewall that lets you monitor the HTTP and
  /// HTTPS requests that are forwarded to CloudFront, and lets you control access
  /// to your content. Based on conditions that you specify, such as the IP
  /// addresses that requests originate from or the values of query strings,
  /// CloudFront responds to requests either with the requested content or with an
  /// HTTP 403 status code (Forbidden). You can also configure CloudFront to
  /// return a custom error page when a request is blocked. For more information
  /// about AWS WAF, see the <a
  /// href="http://docs.aws.amazon.com/waf/latest/developerguide/what-is-aws-waf.html">AWS
  /// WAF Developer Guide</a>.
  final String? webACLId;

  DistributionConfig({
    required this.callerReference,
    required this.comment,
    required this.defaultCacheBehavior,
    required this.enabled,
    required this.origins,
    this.aliases,
    this.cacheBehaviors,
    this.customErrorResponses,
    this.defaultRootObject,
    this.httpVersion,
    this.isIPV6Enabled,
    this.logging,
    this.priceClass,
    this.restrictions,
    this.viewerCertificate,
    this.webACLId,
  });

  factory DistributionConfig.fromJson(Map<String, dynamic> json) {
    return DistributionConfig(
      callerReference: json['CallerReference'] as String,
      comment: json['Comment'] as String,
      defaultCacheBehavior: DefaultCacheBehavior.fromJson(
          json['DefaultCacheBehavior'] as Map<String, dynamic>),
      enabled: json['Enabled'] as bool,
      origins: Origins.fromJson(json['Origins'] as Map<String, dynamic>),
      aliases: json['Aliases'] != null
          ? Aliases.fromJson(json['Aliases'] as Map<String, dynamic>)
          : null,
      cacheBehaviors: json['CacheBehaviors'] != null
          ? CacheBehaviors.fromJson(
              json['CacheBehaviors'] as Map<String, dynamic>)
          : null,
      customErrorResponses: json['CustomErrorResponses'] != null
          ? CustomErrorResponses.fromJson(
              json['CustomErrorResponses'] as Map<String, dynamic>)
          : null,
      defaultRootObject: json['DefaultRootObject'] as String?,
      httpVersion: (json['HttpVersion'] as String?)?.toHttpVersion(),
      isIPV6Enabled: json['IsIPV6Enabled'] as bool?,
      logging: json['Logging'] != null
          ? LoggingConfig.fromJson(json['Logging'] as Map<String, dynamic>)
          : null,
      priceClass: (json['PriceClass'] as String?)?.toPriceClass(),
      restrictions: json['Restrictions'] != null
          ? Restrictions.fromJson(json['Restrictions'] as Map<String, dynamic>)
          : null,
      viewerCertificate: json['ViewerCertificate'] != null
          ? ViewerCertificate.fromJson(
              json['ViewerCertificate'] as Map<String, dynamic>)
          : null,
      webACLId: json['WebACLId'] as String?,
    );
  }

  factory DistributionConfig.fromXml(_s.XmlElement elem) {
    return DistributionConfig(
      callerReference: _s.extractXmlStringValue(elem, 'CallerReference')!,
      comment: _s.extractXmlStringValue(elem, 'Comment')!,
      defaultCacheBehavior: DefaultCacheBehavior.fromXml(
          _s.extractXmlChild(elem, 'DefaultCacheBehavior')!),
      enabled: _s.extractXmlBoolValue(elem, 'Enabled')!,
      origins: Origins.fromXml(_s.extractXmlChild(elem, 'Origins')!),
      aliases:
          _s.extractXmlChild(elem, 'Aliases')?.let((e) => Aliases.fromXml(e)),
      cacheBehaviors: _s
          .extractXmlChild(elem, 'CacheBehaviors')
          ?.let((e) => CacheBehaviors.fromXml(e)),
      customErrorResponses: _s
          .extractXmlChild(elem, 'CustomErrorResponses')
          ?.let((e) => CustomErrorResponses.fromXml(e)),
      defaultRootObject: _s.extractXmlStringValue(elem, 'DefaultRootObject'),
      httpVersion:
          _s.extractXmlStringValue(elem, 'HttpVersion')?.toHttpVersion(),
      isIPV6Enabled: _s.extractXmlBoolValue(elem, 'IsIPV6Enabled'),
      logging: _s
          .extractXmlChild(elem, 'Logging')
          ?.let((e) => LoggingConfig.fromXml(e)),
      priceClass: _s.extractXmlStringValue(elem, 'PriceClass')?.toPriceClass(),
      restrictions: _s
          .extractXmlChild(elem, 'Restrictions')
          ?.let((e) => Restrictions.fromXml(e)),
      viewerCertificate: _s
          .extractXmlChild(elem, 'ViewerCertificate')
          ?.let((e) => ViewerCertificate.fromXml(e)),
      webACLId: _s.extractXmlStringValue(elem, 'WebACLId'),
    );
  }

  Map<String, dynamic> toJson() {
    final callerReference = this.callerReference;
    final comment = this.comment;
    final defaultCacheBehavior = this.defaultCacheBehavior;
    final enabled = this.enabled;
    final origins = this.origins;
    final aliases = this.aliases;
    final cacheBehaviors = this.cacheBehaviors;
    final customErrorResponses = this.customErrorResponses;
    final defaultRootObject = this.defaultRootObject;
    final httpVersion = this.httpVersion;
    final isIPV6Enabled = this.isIPV6Enabled;
    final logging = this.logging;
    final priceClass = this.priceClass;
    final restrictions = this.restrictions;
    final viewerCertificate = this.viewerCertificate;
    final webACLId = this.webACLId;
    return {
      'CallerReference': callerReference,
      'Comment': comment,
      'DefaultCacheBehavior': defaultCacheBehavior,
      'Enabled': enabled,
      'Origins': origins,
      if (aliases != null) 'Aliases': aliases,
      if (cacheBehaviors != null) 'CacheBehaviors': cacheBehaviors,
      if (customErrorResponses != null)
        'CustomErrorResponses': customErrorResponses,
      if (defaultRootObject != null) 'DefaultRootObject': defaultRootObject,
      if (httpVersion != null) 'HttpVersion': httpVersion.toValue(),
      if (isIPV6Enabled != null) 'IsIPV6Enabled': isIPV6Enabled,
      if (logging != null) 'Logging': logging,
      if (priceClass != null) 'PriceClass': priceClass.toValue(),
      if (restrictions != null) 'Restrictions': restrictions,
      if (viewerCertificate != null) 'ViewerCertificate': viewerCertificate,
      if (webACLId != null) 'WebACLId': webACLId,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final callerReference = this.callerReference;
    final comment = this.comment;
    final defaultCacheBehavior = this.defaultCacheBehavior;
    final enabled = this.enabled;
    final origins = this.origins;
    final aliases = this.aliases;
    final cacheBehaviors = this.cacheBehaviors;
    final customErrorResponses = this.customErrorResponses;
    final defaultRootObject = this.defaultRootObject;
    final httpVersion = this.httpVersion;
    final isIPV6Enabled = this.isIPV6Enabled;
    final logging = this.logging;
    final priceClass = this.priceClass;
    final restrictions = this.restrictions;
    final viewerCertificate = this.viewerCertificate;
    final webACLId = this.webACLId;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('CallerReference', callerReference),
      if (aliases != null) aliases.toXml('Aliases'),
      if (defaultRootObject != null)
        _s.encodeXmlStringValue('DefaultRootObject', defaultRootObject),
      origins.toXml('Origins'),
      defaultCacheBehavior.toXml('DefaultCacheBehavior'),
      if (cacheBehaviors != null) cacheBehaviors.toXml('CacheBehaviors'),
      if (customErrorResponses != null)
        customErrorResponses.toXml('CustomErrorResponses'),
      _s.encodeXmlStringValue('Comment', comment),
      if (logging != null) logging.toXml('Logging'),
      if (priceClass != null)
        _s.encodeXmlStringValue('PriceClass', priceClass.toValue()),
      _s.encodeXmlBoolValue('Enabled', enabled),
      if (viewerCertificate != null)
        viewerCertificate.toXml('ViewerCertificate'),
      if (restrictions != null) restrictions.toXml('Restrictions'),
      if (webACLId != null) _s.encodeXmlStringValue('WebACLId', webACLId),
      if (httpVersion != null)
        _s.encodeXmlStringValue('HttpVersion', httpVersion.toValue()),
      if (isIPV6Enabled != null)
        _s.encodeXmlBoolValue('IsIPV6Enabled', isIPV6Enabled),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A distribution Configuration and a list of tags to be associated with the
/// distribution.
class DistributionConfigWithTags {
  /// A distribution configuration.
  final DistributionConfig distributionConfig;

  /// A complex type that contains zero or more <code>Tag</code> elements.
  final Tags tags;

  DistributionConfigWithTags({
    required this.distributionConfig,
    required this.tags,
  });

  factory DistributionConfigWithTags.fromJson(Map<String, dynamic> json) {
    return DistributionConfigWithTags(
      distributionConfig: DistributionConfig.fromJson(
          json['DistributionConfig'] as Map<String, dynamic>),
      tags: Tags.fromJson(json['Tags'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final distributionConfig = this.distributionConfig;
    final tags = this.tags;
    return {
      'DistributionConfig': distributionConfig,
      'Tags': tags,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final distributionConfig = this.distributionConfig;
    final tags = this.tags;
    final $children = <_s.XmlNode>[
      distributionConfig.toXml('DistributionConfig'),
      tags.toXml('Tags'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A distribution list.
class DistributionList {
  /// A flag that indicates whether more distributions remain to be listed. If
  /// your results were truncated, you can make a follow-up pagination request
  /// using the <code>Marker</code> request parameter to retrieve more
  /// distributions in the list.
  final bool isTruncated;

  /// The value you provided for the <code>Marker</code> request parameter.
  final String marker;

  /// The value you provided for the <code>MaxItems</code> request parameter.
  final int maxItems;

  /// The number of distributions that were created by the current AWS account.
  final int quantity;

  /// A complex type that contains one <code>DistributionSummary</code> element
  /// for each distribution that was created by the current AWS account.
  final List<DistributionSummary>? items;

  /// If <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value you can use for the <code>Marker</code> request
  /// parameter to continue listing your distributions where they left off.
  final String? nextMarker;

  DistributionList({
    required this.isTruncated,
    required this.marker,
    required this.maxItems,
    required this.quantity,
    this.items,
    this.nextMarker,
  });

  factory DistributionList.fromJson(Map<String, dynamic> json) {
    return DistributionList(
      isTruncated: json['IsTruncated'] as bool,
      marker: json['Marker'] as String,
      maxItems: json['MaxItems'] as int,
      quantity: json['Quantity'] as int,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => DistributionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  factory DistributionList.fromXml(_s.XmlElement elem) {
    return DistributionList(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated')!,
      marker: _s.extractXmlStringValue(elem, 'Marker')!,
      maxItems: _s.extractXmlIntValue(elem, 'MaxItems')!,
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('DistributionSummary')
          .map((c) => DistributionSummary.fromXml(c))
          .toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }

  Map<String, dynamic> toJson() {
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    final maxItems = this.maxItems;
    final quantity = this.quantity;
    final items = this.items;
    final nextMarker = this.nextMarker;
    return {
      'IsTruncated': isTruncated,
      'Marker': marker,
      'MaxItems': maxItems,
      'Quantity': quantity,
      if (items != null) 'Items': items,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class DistributionNotDisabled implements _s.AwsException {
  final String? message;

  DistributionNotDisabled({
    this.message,
  });

  factory DistributionNotDisabled.fromJson(Map<String, dynamic> json) {
    return DistributionNotDisabled(
      message: json['Message'] as String?,
    );
  }

  factory DistributionNotDisabled.fromXml(_s.XmlElement elem) {
    return DistributionNotDisabled(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// A summary of the information about a CloudFront distribution.
class DistributionSummary {
  /// The ARN (Amazon Resource Name) for the distribution. For example:
  /// <code>arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5</code>,
  /// where <code>123456789012</code> is your AWS account ID.
  final String arn;

  /// A complex type that contains information about CNAMEs (alternate domain
  /// names), if any, for this distribution.
  final Aliases aliases;

  /// A complex type that contains zero or more <code>CacheBehavior</code>
  /// elements.
  final CacheBehaviors cacheBehaviors;

  /// The comment originally specified when this distribution was created.
  final String comment;

  /// A complex type that contains zero or more <code>CustomErrorResponses</code>
  /// elements.
  final CustomErrorResponses customErrorResponses;

  /// A complex type that describes the default cache behavior if you do not
  /// specify a <code>CacheBehavior</code> element or if files don't match any of
  /// the values of <code>PathPattern</code> in <code>CacheBehavior</code>
  /// elements. You must create exactly one default cache behavior.
  final DefaultCacheBehavior defaultCacheBehavior;

  /// The domain name that corresponds to the distribution. For example:
  /// <code>d604721fxaaqy9.cloudfront.net</code>.
  final String domainName;

  /// Whether the distribution is enabled to accept user requests for content.
  final bool enabled;

  /// Specify the maximum HTTP version that you want viewers to use to communicate
  /// with CloudFront. The default value for new web distributions is
  /// <code>http2</code>. Viewers that don't support <code>HTTP/2</code> will
  /// automatically use an earlier version.
  final HttpVersion httpVersion;

  /// The identifier for the distribution. For example:
  /// <code>EDFDVBD632BHDS5</code>.
  final String id;

  /// Whether CloudFront responds to IPv6 DNS requests with an IPv6 address for
  /// your distribution.
  final bool isIPV6Enabled;

  /// The date and time the distribution was last modified.
  final DateTime lastModifiedTime;

  /// A complex type that contains information about origins for this
  /// distribution.
  final Origins origins;
  final PriceClass priceClass;
  final Restrictions restrictions;

  /// The current status of the distribution. When the status is
  /// <code>Deployed</code>, the distribution's information is propagated to all
  /// CloudFront edge locations.
  final String status;
  final ViewerCertificate viewerCertificate;

  /// The Web ACL Id (if any) associated with the distribution.
  final String webACLId;

  DistributionSummary({
    required this.arn,
    required this.aliases,
    required this.cacheBehaviors,
    required this.comment,
    required this.customErrorResponses,
    required this.defaultCacheBehavior,
    required this.domainName,
    required this.enabled,
    required this.httpVersion,
    required this.id,
    required this.isIPV6Enabled,
    required this.lastModifiedTime,
    required this.origins,
    required this.priceClass,
    required this.restrictions,
    required this.status,
    required this.viewerCertificate,
    required this.webACLId,
  });

  factory DistributionSummary.fromJson(Map<String, dynamic> json) {
    return DistributionSummary(
      arn: json['ARN'] as String,
      aliases: Aliases.fromJson(json['Aliases'] as Map<String, dynamic>),
      cacheBehaviors: CacheBehaviors.fromJson(
          json['CacheBehaviors'] as Map<String, dynamic>),
      comment: json['Comment'] as String,
      customErrorResponses: CustomErrorResponses.fromJson(
          json['CustomErrorResponses'] as Map<String, dynamic>),
      defaultCacheBehavior: DefaultCacheBehavior.fromJson(
          json['DefaultCacheBehavior'] as Map<String, dynamic>),
      domainName: json['DomainName'] as String,
      enabled: json['Enabled'] as bool,
      httpVersion: (json['HttpVersion'] as String).toHttpVersion(),
      id: json['Id'] as String,
      isIPV6Enabled: json['IsIPV6Enabled'] as bool,
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['LastModifiedTime'] as Object),
      origins: Origins.fromJson(json['Origins'] as Map<String, dynamic>),
      priceClass: (json['PriceClass'] as String).toPriceClass(),
      restrictions:
          Restrictions.fromJson(json['Restrictions'] as Map<String, dynamic>),
      status: json['Status'] as String,
      viewerCertificate: ViewerCertificate.fromJson(
          json['ViewerCertificate'] as Map<String, dynamic>),
      webACLId: json['WebACLId'] as String,
    );
  }

  factory DistributionSummary.fromXml(_s.XmlElement elem) {
    return DistributionSummary(
      arn: _s.extractXmlStringValue(elem, 'ARN')!,
      aliases: Aliases.fromXml(_s.extractXmlChild(elem, 'Aliases')!),
      cacheBehaviors:
          CacheBehaviors.fromXml(_s.extractXmlChild(elem, 'CacheBehaviors')!),
      comment: _s.extractXmlStringValue(elem, 'Comment')!,
      customErrorResponses: CustomErrorResponses.fromXml(
          _s.extractXmlChild(elem, 'CustomErrorResponses')!),
      defaultCacheBehavior: DefaultCacheBehavior.fromXml(
          _s.extractXmlChild(elem, 'DefaultCacheBehavior')!),
      domainName: _s.extractXmlStringValue(elem, 'DomainName')!,
      enabled: _s.extractXmlBoolValue(elem, 'Enabled')!,
      httpVersion:
          _s.extractXmlStringValue(elem, 'HttpVersion')!.toHttpVersion(),
      id: _s.extractXmlStringValue(elem, 'Id')!,
      isIPV6Enabled: _s.extractXmlBoolValue(elem, 'IsIPV6Enabled')!,
      lastModifiedTime: _s.extractXmlDateTimeValue(elem, 'LastModifiedTime')!,
      origins: Origins.fromXml(_s.extractXmlChild(elem, 'Origins')!),
      priceClass: _s.extractXmlStringValue(elem, 'PriceClass')!.toPriceClass(),
      restrictions:
          Restrictions.fromXml(_s.extractXmlChild(elem, 'Restrictions')!),
      status: _s.extractXmlStringValue(elem, 'Status')!,
      viewerCertificate: ViewerCertificate.fromXml(
          _s.extractXmlChild(elem, 'ViewerCertificate')!),
      webACLId: _s.extractXmlStringValue(elem, 'WebACLId')!,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final aliases = this.aliases;
    final cacheBehaviors = this.cacheBehaviors;
    final comment = this.comment;
    final customErrorResponses = this.customErrorResponses;
    final defaultCacheBehavior = this.defaultCacheBehavior;
    final domainName = this.domainName;
    final enabled = this.enabled;
    final httpVersion = this.httpVersion;
    final id = this.id;
    final isIPV6Enabled = this.isIPV6Enabled;
    final lastModifiedTime = this.lastModifiedTime;
    final origins = this.origins;
    final priceClass = this.priceClass;
    final restrictions = this.restrictions;
    final status = this.status;
    final viewerCertificate = this.viewerCertificate;
    final webACLId = this.webACLId;
    return {
      'ARN': arn,
      'Aliases': aliases,
      'CacheBehaviors': cacheBehaviors,
      'Comment': comment,
      'CustomErrorResponses': customErrorResponses,
      'DefaultCacheBehavior': defaultCacheBehavior,
      'DomainName': domainName,
      'Enabled': enabled,
      'HttpVersion': httpVersion.toValue(),
      'Id': id,
      'IsIPV6Enabled': isIPV6Enabled,
      'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      'Origins': origins,
      'PriceClass': priceClass.toValue(),
      'Restrictions': restrictions,
      'Status': status,
      'ViewerCertificate': viewerCertificate,
      'WebACLId': webACLId,
    };
  }
}

enum EventType {
  viewerRequest,
  viewerResponse,
  originRequest,
  originResponse,
}

extension on EventType {
  String toValue() {
    switch (this) {
      case EventType.viewerRequest:
        return 'viewer-request';
      case EventType.viewerResponse:
        return 'viewer-response';
      case EventType.originRequest:
        return 'origin-request';
      case EventType.originResponse:
        return 'origin-response';
    }
  }
}

extension on String {
  EventType toEventType() {
    switch (this) {
      case 'viewer-request':
        return EventType.viewerRequest;
      case 'viewer-response':
        return EventType.viewerResponse;
      case 'origin-request':
        return EventType.originRequest;
      case 'origin-response':
        return EventType.originResponse;
    }
    throw Exception('$this is not known in enum EventType');
  }
}

/// A complex type that specifies how CloudFront handles query strings and
/// cookies.
class ForwardedValues {
  /// A complex type that specifies whether you want CloudFront to forward cookies
  /// to the origin and, if so, which ones. For more information about forwarding
  /// cookies to the origin, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Cookies.html">How
  /// CloudFront Forwards, Caches, and Logs Cookies</a> in the <i>Amazon
  /// CloudFront Developer Guide</i>.
  final CookiePreference cookies;

  /// Indicates whether you want CloudFront to forward query strings to the origin
  /// that is associated with this cache behavior and cache based on the query
  /// string parameters. CloudFront behavior depends on the value of
  /// <code>QueryString</code> and on the values that you specify for
  /// <code>QueryStringCacheKeys</code>, if any:
  ///
  /// If you specify true for <code>QueryString</code> and you don't specify any
  /// values for <code>QueryStringCacheKeys</code>, CloudFront forwards all query
  /// string parameters to the origin and caches based on all query string
  /// parameters. Depending on how many query string parameters and values you
  /// have, this can adversely affect performance because CloudFront must forward
  /// more requests to the origin.
  ///
  /// If you specify true for <code>QueryString</code> and you specify one or more
  /// values for <code>QueryStringCacheKeys</code>, CloudFront forwards all query
  /// string parameters to the origin, but it only caches based on the query
  /// string parameters that you specify.
  ///
  /// If you specify false for <code>QueryString</code>, CloudFront doesn't
  /// forward any query string parameters to the origin, and doesn't cache based
  /// on query string parameters.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/QueryStringParameters.html">Configuring
  /// CloudFront to Cache Based on Query String Parameters</a> in the <i>Amazon
  /// CloudFront Developer Guide</i>.
  final bool queryString;

  /// A complex type that specifies the <code>Headers</code>, if any, that you
  /// want CloudFront to vary upon for this cache behavior.
  final Headers? headers;

  /// A complex type that contains information about the query string parameters
  /// that you want CloudFront to use for caching for this cache behavior.
  final QueryStringCacheKeys? queryStringCacheKeys;

  ForwardedValues({
    required this.cookies,
    required this.queryString,
    this.headers,
    this.queryStringCacheKeys,
  });

  factory ForwardedValues.fromJson(Map<String, dynamic> json) {
    return ForwardedValues(
      cookies:
          CookiePreference.fromJson(json['Cookies'] as Map<String, dynamic>),
      queryString: json['QueryString'] as bool,
      headers: json['Headers'] != null
          ? Headers.fromJson(json['Headers'] as Map<String, dynamic>)
          : null,
      queryStringCacheKeys: json['QueryStringCacheKeys'] != null
          ? QueryStringCacheKeys.fromJson(
              json['QueryStringCacheKeys'] as Map<String, dynamic>)
          : null,
    );
  }

  factory ForwardedValues.fromXml(_s.XmlElement elem) {
    return ForwardedValues(
      cookies: CookiePreference.fromXml(_s.extractXmlChild(elem, 'Cookies')!),
      queryString: _s.extractXmlBoolValue(elem, 'QueryString')!,
      headers:
          _s.extractXmlChild(elem, 'Headers')?.let((e) => Headers.fromXml(e)),
      queryStringCacheKeys: _s
          .extractXmlChild(elem, 'QueryStringCacheKeys')
          ?.let((e) => QueryStringCacheKeys.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final cookies = this.cookies;
    final queryString = this.queryString;
    final headers = this.headers;
    final queryStringCacheKeys = this.queryStringCacheKeys;
    return {
      'Cookies': cookies,
      'QueryString': queryString,
      if (headers != null) 'Headers': headers,
      if (queryStringCacheKeys != null)
        'QueryStringCacheKeys': queryStringCacheKeys,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final cookies = this.cookies;
    final queryString = this.queryString;
    final headers = this.headers;
    final queryStringCacheKeys = this.queryStringCacheKeys;
    final $children = <_s.XmlNode>[
      _s.encodeXmlBoolValue('QueryString', queryString),
      cookies.toXml('Cookies'),
      if (headers != null) headers.toXml('Headers'),
      if (queryStringCacheKeys != null)
        queryStringCacheKeys.toXml('QueryStringCacheKeys'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that controls the countries in which your content is
/// distributed. CloudFront determines the location of your users using
/// <code>MaxMind</code> GeoIP databases.
class GeoRestriction {
  /// When geo restriction is <code>enabled</code>, this is the number of
  /// countries in your <code>whitelist</code> or <code>blacklist</code>.
  /// Otherwise, when it is not enabled, <code>Quantity</code> is <code>0</code>,
  /// and you can omit <code>Items</code>.
  final int quantity;

  /// The method that you want to use to restrict distribution of your content by
  /// country:
  ///
  /// <ul>
  /// <li>
  /// <code>none</code>: No geo restriction is enabled, meaning access to content
  /// is not restricted by client geo location.
  /// </li>
  /// <li>
  /// <code>blacklist</code>: The <code>Location</code> elements specify the
  /// countries in which you do not want CloudFront to distribute your content.
  /// </li>
  /// <li>
  /// <code>whitelist</code>: The <code>Location</code> elements specify the
  /// countries in which you want CloudFront to distribute your content.
  /// </li>
  /// </ul>
  final GeoRestrictionType restrictionType;

  /// A complex type that contains a <code>Location</code> element for each
  /// country in which you want CloudFront either to distribute your content
  /// (<code>whitelist</code>) or not distribute your content
  /// (<code>blacklist</code>).
  ///
  /// The <code>Location</code> element is a two-letter, uppercase country code
  /// for a country that you want to include in your <code>blacklist</code> or
  /// <code>whitelist</code>. Include one <code>Location</code> element for each
  /// country.
  ///
  /// CloudFront and <code>MaxMind</code> both use <code>ISO 3166</code> country
  /// codes. For the current list of countries and the corresponding codes, see
  /// <code>ISO 3166-1-alpha-2</code> code on the <i>International Organization
  /// for Standardization</i> website. You can also refer to the country list in
  /// the CloudFront console, which includes both country names and codes.
  final List<String>? items;

  GeoRestriction({
    required this.quantity,
    required this.restrictionType,
    this.items,
  });

  factory GeoRestriction.fromJson(Map<String, dynamic> json) {
    return GeoRestriction(
      quantity: json['Quantity'] as int,
      restrictionType:
          (json['RestrictionType'] as String).toGeoRestrictionType(),
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  factory GeoRestriction.fromXml(_s.XmlElement elem) {
    return GeoRestriction(
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
      restrictionType: _s
          .extractXmlStringValue(elem, 'RestrictionType')!
          .toGeoRestrictionType(),
      items: _s
          .extractXmlChild(elem, 'Items')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Location')),
    );
  }

  Map<String, dynamic> toJson() {
    final quantity = this.quantity;
    final restrictionType = this.restrictionType;
    final items = this.items;
    return {
      'Quantity': quantity,
      'RestrictionType': restrictionType.toValue(),
      if (items != null) 'Items': items,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final quantity = this.quantity;
    final restrictionType = this.restrictionType;
    final items = this.items;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('RestrictionType', restrictionType.toValue()),
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => _s.encodeXmlStringValue('Location', e))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

enum GeoRestrictionType {
  blacklist,
  whitelist,
  none,
}

extension on GeoRestrictionType {
  String toValue() {
    switch (this) {
      case GeoRestrictionType.blacklist:
        return 'blacklist';
      case GeoRestrictionType.whitelist:
        return 'whitelist';
      case GeoRestrictionType.none:
        return 'none';
    }
  }
}

extension on String {
  GeoRestrictionType toGeoRestrictionType() {
    switch (this) {
      case 'blacklist':
        return GeoRestrictionType.blacklist;
      case 'whitelist':
        return GeoRestrictionType.whitelist;
      case 'none':
        return GeoRestrictionType.none;
    }
    throw Exception('$this is not known in enum GeoRestrictionType');
  }
}

/// The returned result of the corresponding request.
class GetCloudFrontOriginAccessIdentityConfigResult {
  /// The origin access identity's configuration information.
  final CloudFrontOriginAccessIdentityConfig?
      cloudFrontOriginAccessIdentityConfig;

  /// The current version of the configuration. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  final String? eTag;

  GetCloudFrontOriginAccessIdentityConfigResult({
    this.cloudFrontOriginAccessIdentityConfig,
    this.eTag,
  });

  factory GetCloudFrontOriginAccessIdentityConfigResult.fromJson(
      Map<String, dynamic> json) {
    return GetCloudFrontOriginAccessIdentityConfigResult(
      cloudFrontOriginAccessIdentityConfig:
          json['CloudFrontOriginAccessIdentityConfig'] != null
              ? CloudFrontOriginAccessIdentityConfig.fromJson(
                  json['CloudFrontOriginAccessIdentityConfig']
                      as Map<String, dynamic>)
              : null,
      eTag: json['ETag'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFrontOriginAccessIdentityConfig =
        this.cloudFrontOriginAccessIdentityConfig;
    final eTag = this.eTag;
    return {
      if (cloudFrontOriginAccessIdentityConfig != null)
        'CloudFrontOriginAccessIdentityConfig':
            cloudFrontOriginAccessIdentityConfig,
    };
  }
}

/// The returned result of the corresponding request.
class GetCloudFrontOriginAccessIdentityResult {
  /// The origin access identity's information.
  final CloudFrontOriginAccessIdentity? cloudFrontOriginAccessIdentity;

  /// The current version of the origin access identity's information. For
  /// example: <code>E2QWRUHAPOMQZL</code>.
  final String? eTag;

  GetCloudFrontOriginAccessIdentityResult({
    this.cloudFrontOriginAccessIdentity,
    this.eTag,
  });

  factory GetCloudFrontOriginAccessIdentityResult.fromJson(
      Map<String, dynamic> json) {
    return GetCloudFrontOriginAccessIdentityResult(
      cloudFrontOriginAccessIdentity: json['CloudFrontOriginAccessIdentity'] !=
              null
          ? CloudFrontOriginAccessIdentity.fromJson(
              json['CloudFrontOriginAccessIdentity'] as Map<String, dynamic>)
          : null,
      eTag: json['ETag'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFrontOriginAccessIdentity = this.cloudFrontOriginAccessIdentity;
    final eTag = this.eTag;
    return {
      if (cloudFrontOriginAccessIdentity != null)
        'CloudFrontOriginAccessIdentity': cloudFrontOriginAccessIdentity,
    };
  }
}

/// The returned result of the corresponding request.
class GetDistributionConfigResult {
  /// The distribution's configuration information.
  final DistributionConfig? distributionConfig;

  /// The current version of the configuration. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  final String? eTag;

  GetDistributionConfigResult({
    this.distributionConfig,
    this.eTag,
  });

  factory GetDistributionConfigResult.fromJson(Map<String, dynamic> json) {
    return GetDistributionConfigResult(
      distributionConfig: json['DistributionConfig'] != null
          ? DistributionConfig.fromJson(
              json['DistributionConfig'] as Map<String, dynamic>)
          : null,
      eTag: json['ETag'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final distributionConfig = this.distributionConfig;
    final eTag = this.eTag;
    return {
      if (distributionConfig != null) 'DistributionConfig': distributionConfig,
    };
  }
}

/// The returned result of the corresponding request.
class GetDistributionResult {
  /// The distribution's information.
  final Distribution? distribution;

  /// The current version of the distribution's information. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  final String? eTag;

  GetDistributionResult({
    this.distribution,
    this.eTag,
  });

  factory GetDistributionResult.fromJson(Map<String, dynamic> json) {
    return GetDistributionResult(
      distribution: json['Distribution'] != null
          ? Distribution.fromJson(json['Distribution'] as Map<String, dynamic>)
          : null,
      eTag: json['ETag'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final distribution = this.distribution;
    final eTag = this.eTag;
    return {
      if (distribution != null) 'Distribution': distribution,
    };
  }
}

/// The returned result of the corresponding request.
class GetInvalidationResult {
  /// The invalidation's information. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/InvalidationDatatype.html">Invalidation
  /// Complex Type</a>.
  final Invalidation? invalidation;

  GetInvalidationResult({
    this.invalidation,
  });

  factory GetInvalidationResult.fromJson(Map<String, dynamic> json) {
    return GetInvalidationResult(
      invalidation: json['Invalidation'] != null
          ? Invalidation.fromJson(json['Invalidation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final invalidation = this.invalidation;
    return {
      if (invalidation != null) 'Invalidation': invalidation,
    };
  }
}

/// The returned result of the corresponding request.
class GetStreamingDistributionConfigResult {
  /// The current version of the configuration. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  final String? eTag;

  /// The streaming distribution's configuration information.
  final StreamingDistributionConfig? streamingDistributionConfig;

  GetStreamingDistributionConfigResult({
    this.eTag,
    this.streamingDistributionConfig,
  });

  factory GetStreamingDistributionConfigResult.fromJson(
      Map<String, dynamic> json) {
    return GetStreamingDistributionConfigResult(
      eTag: json['ETag'] as String?,
      streamingDistributionConfig: json['StreamingDistributionConfig'] != null
          ? StreamingDistributionConfig.fromJson(
              json['StreamingDistributionConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eTag = this.eTag;
    final streamingDistributionConfig = this.streamingDistributionConfig;
    return {
      if (streamingDistributionConfig != null)
        'StreamingDistributionConfig': streamingDistributionConfig,
    };
  }
}

/// The returned result of the corresponding request.
class GetStreamingDistributionResult {
  /// The current version of the streaming distribution's information. For
  /// example: <code>E2QWRUHAPOMQZL</code>.
  final String? eTag;

  /// The streaming distribution's information.
  final StreamingDistribution? streamingDistribution;

  GetStreamingDistributionResult({
    this.eTag,
    this.streamingDistribution,
  });

  factory GetStreamingDistributionResult.fromJson(Map<String, dynamic> json) {
    return GetStreamingDistributionResult(
      eTag: json['ETag'] as String?,
      streamingDistribution: json['StreamingDistribution'] != null
          ? StreamingDistribution.fromJson(
              json['StreamingDistribution'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eTag = this.eTag;
    final streamingDistribution = this.streamingDistribution;
    return {
      if (streamingDistribution != null)
        'StreamingDistribution': streamingDistribution,
    };
  }
}

/// A complex type that specifies the headers that you want CloudFront to
/// forward to the origin for this cache behavior.
///
/// For the headers that you specify, CloudFront also caches separate versions
/// of a specified object based on the header values in viewer requests. For
/// example, suppose viewer requests for <code>logo.jpg</code> contain a custom
/// <code>Product</code> header that has a value of either <code>Acme</code> or
/// <code>Apex</code>, and you configure CloudFront to cache your content based
/// on values in the <code>Product</code> header. CloudFront forwards the
/// <code>Product</code> header to the origin and caches the response from the
/// origin once for each header value. For more information about caching based
/// on header values, see <a
/// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/header-caching.html">How
/// CloudFront Forwards and Caches Headers</a> in the <i>Amazon CloudFront
/// Developer Guide</i>.
class Headers {
  /// The number of different headers that you want CloudFront to forward to the
  /// origin for this cache behavior. You can configure each cache behavior in a
  /// web distribution to do one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b>Forward all headers to your origin</b>: Specify <code>1</code> for
  /// <code>Quantity</code> and <code>*</code> for <code>Name</code>.
  /// <important>
  /// If you configure CloudFront to forward all headers to your origin,
  /// CloudFront doesn't cache the objects associated with this cache behavior.
  /// Instead, it sends every request to the origin.
  /// </important> </li>
  /// <li>
  /// <i>Forward a whitelist of headers you specify</i>: Specify the number of
  /// headers that you want to forward, and specify the header names in
  /// <code>Name</code> elements. CloudFront caches your objects based on the
  /// values in all of the specified headers. CloudFront also forwards the headers
  /// that it forwards by default, but it caches your objects based only on the
  /// headers that you specify.
  /// </li>
  /// <li>
  /// <b>Forward only the default headers</b>: Specify <code>0</code> for
  /// <code>Quantity</code> and omit <code>Items</code>. In this configuration,
  /// CloudFront doesn't cache based on the values in the request headers.
  /// </li>
  /// </ul>
  final int quantity;

  /// A complex type that contains one <code>Name</code> element for each header
  /// that you want CloudFront to forward to the origin and to vary on for this
  /// cache behavior. If <code>Quantity</code> is <code>0</code>, omit
  /// <code>Items</code>.
  final List<String>? items;

  Headers({
    required this.quantity,
    this.items,
  });

  factory Headers.fromJson(Map<String, dynamic> json) {
    return Headers(
      quantity: json['Quantity'] as int,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  factory Headers.fromXml(_s.XmlElement elem) {
    return Headers(
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
      items: _s
          .extractXmlChild(elem, 'Items')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Name')),
    );
  }

  Map<String, dynamic> toJson() {
    final quantity = this.quantity;
    final items = this.items;
    return {
      'Quantity': quantity,
      if (items != null) 'Items': items,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final quantity = this.quantity;
    final items = this.items;
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => _s.encodeXmlStringValue('Name', e))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

enum HttpVersion {
  http1_1,
  http2,
}

extension on HttpVersion {
  String toValue() {
    switch (this) {
      case HttpVersion.http1_1:
        return 'http1.1';
      case HttpVersion.http2:
        return 'http2';
    }
  }
}

extension on String {
  HttpVersion toHttpVersion() {
    switch (this) {
      case 'http1.1':
        return HttpVersion.http1_1;
      case 'http2':
        return HttpVersion.http2;
    }
    throw Exception('$this is not known in enum HttpVersion');
  }
}

/// Origin and <code>CallerReference</code> cannot be updated.
class IllegalUpdate implements _s.AwsException {
  final String? message;

  IllegalUpdate({
    this.message,
  });

  factory IllegalUpdate.fromJson(Map<String, dynamic> json) {
    return IllegalUpdate(
      message: json['Message'] as String?,
    );
  }

  factory IllegalUpdate.fromXml(_s.XmlElement elem) {
    return IllegalUpdate(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// The value of <code>Quantity</code> and the size of <code>Items</code> do not
/// match.
class InconsistentQuantities implements _s.AwsException {
  final String? message;

  InconsistentQuantities({
    this.message,
  });

  factory InconsistentQuantities.fromJson(Map<String, dynamic> json) {
    return InconsistentQuantities(
      message: json['Message'] as String?,
    );
  }

  factory InconsistentQuantities.fromXml(_s.XmlElement elem) {
    return InconsistentQuantities(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// The argument is invalid.
class InvalidArgument implements _s.AwsException {
  final String? message;

  InvalidArgument({
    this.message,
  });

  factory InvalidArgument.fromJson(Map<String, dynamic> json) {
    return InvalidArgument(
      message: json['Message'] as String?,
    );
  }

  factory InvalidArgument.fromXml(_s.XmlElement elem) {
    return InvalidArgument(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// The default root object file name is too big or contains an invalid
/// character.
class InvalidDefaultRootObject implements _s.AwsException {
  final String? message;

  InvalidDefaultRootObject({
    this.message,
  });

  factory InvalidDefaultRootObject.fromJson(Map<String, dynamic> json) {
    return InvalidDefaultRootObject(
      message: json['Message'] as String?,
    );
  }

  factory InvalidDefaultRootObject.fromXml(_s.XmlElement elem) {
    return InvalidDefaultRootObject(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class InvalidErrorCode implements _s.AwsException {
  final String? message;

  InvalidErrorCode({
    this.message,
  });

  factory InvalidErrorCode.fromJson(Map<String, dynamic> json) {
    return InvalidErrorCode(
      message: json['Message'] as String?,
    );
  }

  factory InvalidErrorCode.fromXml(_s.XmlElement elem) {
    return InvalidErrorCode(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// Your request contains forward cookies option which doesn't match with the
/// expectation for the <code>whitelisted</code> list of cookie names. Either
/// list of cookie names has been specified when not allowed or list of cookie
/// names is missing when expected.
class InvalidForwardCookies implements _s.AwsException {
  final String? message;

  InvalidForwardCookies({
    this.message,
  });

  factory InvalidForwardCookies.fromJson(Map<String, dynamic> json) {
    return InvalidForwardCookies(
      message: json['Message'] as String?,
    );
  }

  factory InvalidForwardCookies.fromXml(_s.XmlElement elem) {
    return InvalidForwardCookies(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class InvalidGeoRestrictionParameter implements _s.AwsException {
  final String? message;

  InvalidGeoRestrictionParameter({
    this.message,
  });

  factory InvalidGeoRestrictionParameter.fromJson(Map<String, dynamic> json) {
    return InvalidGeoRestrictionParameter(
      message: json['Message'] as String?,
    );
  }

  factory InvalidGeoRestrictionParameter.fromXml(_s.XmlElement elem) {
    return InvalidGeoRestrictionParameter(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class InvalidHeadersForS3Origin implements _s.AwsException {
  final String? message;

  InvalidHeadersForS3Origin({
    this.message,
  });

  factory InvalidHeadersForS3Origin.fromJson(Map<String, dynamic> json) {
    return InvalidHeadersForS3Origin(
      message: json['Message'] as String?,
    );
  }

  factory InvalidHeadersForS3Origin.fromXml(_s.XmlElement elem) {
    return InvalidHeadersForS3Origin(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// The <code>If-Match</code> version is missing or not valid for the
/// distribution.
class InvalidIfMatchVersion implements _s.AwsException {
  final String? message;

  InvalidIfMatchVersion({
    this.message,
  });

  factory InvalidIfMatchVersion.fromJson(Map<String, dynamic> json) {
    return InvalidIfMatchVersion(
      message: json['Message'] as String?,
    );
  }

  factory InvalidIfMatchVersion.fromXml(_s.XmlElement elem) {
    return InvalidIfMatchVersion(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// The specified Lambda function association is invalid.
class InvalidLambdaFunctionAssociation implements _s.AwsException {
  final String? message;

  InvalidLambdaFunctionAssociation({
    this.message,
  });

  factory InvalidLambdaFunctionAssociation.fromJson(Map<String, dynamic> json) {
    return InvalidLambdaFunctionAssociation(
      message: json['Message'] as String?,
    );
  }

  factory InvalidLambdaFunctionAssociation.fromXml(_s.XmlElement elem) {
    return InvalidLambdaFunctionAssociation(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class InvalidLocationCode implements _s.AwsException {
  final String? message;

  InvalidLocationCode({
    this.message,
  });

  factory InvalidLocationCode.fromJson(Map<String, dynamic> json) {
    return InvalidLocationCode(
      message: json['Message'] as String?,
    );
  }

  factory InvalidLocationCode.fromXml(_s.XmlElement elem) {
    return InvalidLocationCode(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class InvalidMinimumProtocolVersion implements _s.AwsException {
  final String? message;

  InvalidMinimumProtocolVersion({
    this.message,
  });

  factory InvalidMinimumProtocolVersion.fromJson(Map<String, dynamic> json) {
    return InvalidMinimumProtocolVersion(
      message: json['Message'] as String?,
    );
  }

  factory InvalidMinimumProtocolVersion.fromXml(_s.XmlElement elem) {
    return InvalidMinimumProtocolVersion(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// The Amazon S3 origin server specified does not refer to a valid Amazon S3
/// bucket.
class InvalidOrigin implements _s.AwsException {
  final String? message;

  InvalidOrigin({
    this.message,
  });

  factory InvalidOrigin.fromJson(Map<String, dynamic> json) {
    return InvalidOrigin(
      message: json['Message'] as String?,
    );
  }

  factory InvalidOrigin.fromXml(_s.XmlElement elem) {
    return InvalidOrigin(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// The origin access identity is not valid or doesn't exist.
class InvalidOriginAccessIdentity implements _s.AwsException {
  final String? message;

  InvalidOriginAccessIdentity({
    this.message,
  });

  factory InvalidOriginAccessIdentity.fromJson(Map<String, dynamic> json) {
    return InvalidOriginAccessIdentity(
      message: json['Message'] as String?,
    );
  }

  factory InvalidOriginAccessIdentity.fromXml(_s.XmlElement elem) {
    return InvalidOriginAccessIdentity(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// You cannot specify SSLv3 as the minimum protocol version if you only want to
/// support only clients that support Server Name Indication (SNI).
class InvalidProtocolSettings implements _s.AwsException {
  final String? message;

  InvalidProtocolSettings({
    this.message,
  });

  factory InvalidProtocolSettings.fromJson(Map<String, dynamic> json) {
    return InvalidProtocolSettings(
      message: json['Message'] as String?,
    );
  }

  factory InvalidProtocolSettings.fromXml(_s.XmlElement elem) {
    return InvalidProtocolSettings(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class InvalidQueryStringParameters implements _s.AwsException {
  final String? message;

  InvalidQueryStringParameters({
    this.message,
  });

  factory InvalidQueryStringParameters.fromJson(Map<String, dynamic> json) {
    return InvalidQueryStringParameters(
      message: json['Message'] as String?,
    );
  }

  factory InvalidQueryStringParameters.fromXml(_s.XmlElement elem) {
    return InvalidQueryStringParameters(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// The relative path is too big, is not URL-encoded, or does not begin with a
/// slash (/).
class InvalidRelativePath implements _s.AwsException {
  final String? message;

  InvalidRelativePath({
    this.message,
  });

  factory InvalidRelativePath.fromJson(Map<String, dynamic> json) {
    return InvalidRelativePath(
      message: json['Message'] as String?,
    );
  }

  factory InvalidRelativePath.fromXml(_s.XmlElement elem) {
    return InvalidRelativePath(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// This operation requires the HTTPS protocol. Ensure that you specify the
/// HTTPS protocol in your request, or omit the <code>RequiredProtocols</code>
/// element from your distribution configuration.
class InvalidRequiredProtocol implements _s.AwsException {
  final String? message;

  InvalidRequiredProtocol({
    this.message,
  });

  factory InvalidRequiredProtocol.fromJson(Map<String, dynamic> json) {
    return InvalidRequiredProtocol(
      message: json['Message'] as String?,
    );
  }

  factory InvalidRequiredProtocol.fromXml(_s.XmlElement elem) {
    return InvalidRequiredProtocol(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class InvalidResponseCode implements _s.AwsException {
  final String? message;

  InvalidResponseCode({
    this.message,
  });

  factory InvalidResponseCode.fromJson(Map<String, dynamic> json) {
    return InvalidResponseCode(
      message: json['Message'] as String?,
    );
  }

  factory InvalidResponseCode.fromXml(_s.XmlElement elem) {
    return InvalidResponseCode(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class InvalidTTLOrder implements _s.AwsException {
  final String? message;

  InvalidTTLOrder({
    this.message,
  });

  factory InvalidTTLOrder.fromJson(Map<String, dynamic> json) {
    return InvalidTTLOrder(
      message: json['Message'] as String?,
    );
  }

  factory InvalidTTLOrder.fromXml(_s.XmlElement elem) {
    return InvalidTTLOrder(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class InvalidTagging implements _s.AwsException {
  final String? message;

  InvalidTagging({
    this.message,
  });

  factory InvalidTagging.fromJson(Map<String, dynamic> json) {
    return InvalidTagging(
      message: json['Message'] as String?,
    );
  }

  factory InvalidTagging.fromXml(_s.XmlElement elem) {
    return InvalidTagging(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class InvalidViewerCertificate implements _s.AwsException {
  final String? message;

  InvalidViewerCertificate({
    this.message,
  });

  factory InvalidViewerCertificate.fromJson(Map<String, dynamic> json) {
    return InvalidViewerCertificate(
      message: json['Message'] as String?,
    );
  }

  factory InvalidViewerCertificate.fromXml(_s.XmlElement elem) {
    return InvalidViewerCertificate(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class InvalidWebACLId implements _s.AwsException {
  final String? message;

  InvalidWebACLId({
    this.message,
  });

  factory InvalidWebACLId.fromJson(Map<String, dynamic> json) {
    return InvalidWebACLId(
      message: json['Message'] as String?,
    );
  }

  factory InvalidWebACLId.fromXml(_s.XmlElement elem) {
    return InvalidWebACLId(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// An invalidation.
class Invalidation {
  /// The date and time the invalidation request was first made.
  final DateTime createTime;

  /// The identifier for the invalidation request. For example:
  /// <code>IDFDVBD632BHDS5</code>.
  final String id;

  /// The current invalidation information for the batch request.
  final InvalidationBatch invalidationBatch;

  /// The status of the invalidation request. When the invalidation batch is
  /// finished, the status is <code>Completed</code>.
  final String status;

  Invalidation({
    required this.createTime,
    required this.id,
    required this.invalidationBatch,
    required this.status,
  });

  factory Invalidation.fromJson(Map<String, dynamic> json) {
    return Invalidation(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      id: json['Id'] as String,
      invalidationBatch: InvalidationBatch.fromJson(
          json['InvalidationBatch'] as Map<String, dynamic>),
      status: json['Status'] as String,
    );
  }

  factory Invalidation.fromXml(_s.XmlElement elem) {
    return Invalidation(
      createTime: _s.extractXmlDateTimeValue(elem, 'CreateTime')!,
      id: _s.extractXmlStringValue(elem, 'Id')!,
      invalidationBatch: InvalidationBatch.fromXml(
          _s.extractXmlChild(elem, 'InvalidationBatch')!),
      status: _s.extractXmlStringValue(elem, 'Status')!,
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final id = this.id;
    final invalidationBatch = this.invalidationBatch;
    final status = this.status;
    return {
      'CreateTime': unixTimestampToJson(createTime),
      'Id': id,
      'InvalidationBatch': invalidationBatch,
      'Status': status,
    };
  }
}

/// An invalidation batch.
class InvalidationBatch {
  /// A value that you specify to uniquely identify an invalidation request.
  /// CloudFront uses the value to prevent you from accidentally resubmitting an
  /// identical request. Whenever you create a new invalidation request, you must
  /// specify a new value for <code>CallerReference</code> and change other values
  /// in the request as applicable. One way to ensure that the value of
  /// <code>CallerReference</code> is unique is to use a <code>timestamp</code>,
  /// for example, <code>20120301090000</code>.
  ///
  /// If you make a second invalidation request with the same value for
  /// <code>CallerReference</code>, and if the rest of the request is the same,
  /// CloudFront doesn't create a new invalidation request. Instead, CloudFront
  /// returns information about the invalidation request that you previously
  /// created with the same <code>CallerReference</code>.
  ///
  /// If <code>CallerReference</code> is a value you already sent in a previous
  /// invalidation batch request but the content of any <code>Path</code> is
  /// different from the original request, CloudFront returns an
  /// <code>InvalidationBatchAlreadyExists</code> error.
  final String callerReference;

  /// A complex type that contains information about the objects that you want to
  /// invalidate. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Invalidation.html#invalidation-specifying-objects">Specifying
  /// the Objects to Invalidate</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  final Paths paths;

  InvalidationBatch({
    required this.callerReference,
    required this.paths,
  });

  factory InvalidationBatch.fromJson(Map<String, dynamic> json) {
    return InvalidationBatch(
      callerReference: json['CallerReference'] as String,
      paths: Paths.fromJson(json['Paths'] as Map<String, dynamic>),
    );
  }

  factory InvalidationBatch.fromXml(_s.XmlElement elem) {
    return InvalidationBatch(
      callerReference: _s.extractXmlStringValue(elem, 'CallerReference')!,
      paths: Paths.fromXml(_s.extractXmlChild(elem, 'Paths')!),
    );
  }

  Map<String, dynamic> toJson() {
    final callerReference = this.callerReference;
    final paths = this.paths;
    return {
      'CallerReference': callerReference,
      'Paths': paths,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final callerReference = this.callerReference;
    final paths = this.paths;
    final $children = <_s.XmlNode>[
      paths.toXml('Paths'),
      _s.encodeXmlStringValue('CallerReference', callerReference),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// The <code>InvalidationList</code> complex type describes the list of
/// invalidation objects. For more information about invalidation, see <a
/// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Invalidation.html">Invalidating
/// Objects (Web Distributions Only)</a> in the <i>Amazon CloudFront Developer
/// Guide</i>.
class InvalidationList {
  /// A flag that indicates whether more invalidation batch requests remain to be
  /// listed. If your results were truncated, you can make a follow-up pagination
  /// request using the <code>Marker</code> request parameter to retrieve more
  /// invalidation batches in the list.
  final bool isTruncated;

  /// The value that you provided for the <code>Marker</code> request parameter.
  final String marker;

  /// The value that you provided for the <code>MaxItems</code> request parameter.
  final int maxItems;

  /// The number of invalidation batches that were created by the current AWS
  /// account.
  final int quantity;

  /// A complex type that contains one <code>InvalidationSummary</code> element
  /// for each invalidation batch created by the current AWS account.
  final List<InvalidationSummary>? items;

  /// If <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value that you can use for the <code>Marker</code> request
  /// parameter to continue listing your invalidation batches where they left off.
  final String? nextMarker;

  InvalidationList({
    required this.isTruncated,
    required this.marker,
    required this.maxItems,
    required this.quantity,
    this.items,
    this.nextMarker,
  });

  factory InvalidationList.fromJson(Map<String, dynamic> json) {
    return InvalidationList(
      isTruncated: json['IsTruncated'] as bool,
      marker: json['Marker'] as String,
      maxItems: json['MaxItems'] as int,
      quantity: json['Quantity'] as int,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => InvalidationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  factory InvalidationList.fromXml(_s.XmlElement elem) {
    return InvalidationList(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated')!,
      marker: _s.extractXmlStringValue(elem, 'Marker')!,
      maxItems: _s.extractXmlIntValue(elem, 'MaxItems')!,
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('InvalidationSummary')
          .map((c) => InvalidationSummary.fromXml(c))
          .toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }

  Map<String, dynamic> toJson() {
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    final maxItems = this.maxItems;
    final quantity = this.quantity;
    final items = this.items;
    final nextMarker = this.nextMarker;
    return {
      'IsTruncated': isTruncated,
      'Marker': marker,
      'MaxItems': maxItems,
      'Quantity': quantity,
      if (items != null) 'Items': items,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// A summary of an invalidation request.
class InvalidationSummary {
  final DateTime createTime;

  /// The unique ID for an invalidation request.
  final String id;

  /// The status of an invalidation request.
  final String status;

  InvalidationSummary({
    required this.createTime,
    required this.id,
    required this.status,
  });

  factory InvalidationSummary.fromJson(Map<String, dynamic> json) {
    return InvalidationSummary(
      createTime: nonNullableTimeStampFromJson(json['CreateTime'] as Object),
      id: json['Id'] as String,
      status: json['Status'] as String,
    );
  }

  factory InvalidationSummary.fromXml(_s.XmlElement elem) {
    return InvalidationSummary(
      createTime: _s.extractXmlDateTimeValue(elem, 'CreateTime')!,
      id: _s.extractXmlStringValue(elem, 'Id')!,
      status: _s.extractXmlStringValue(elem, 'Status')!,
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final id = this.id;
    final status = this.status;
    return {
      'CreateTime': unixTimestampToJson(createTime),
      'Id': id,
      'Status': status,
    };
  }
}

enum ItemSelection {
  none,
  whitelist,
  all,
}

extension on ItemSelection {
  String toValue() {
    switch (this) {
      case ItemSelection.none:
        return 'none';
      case ItemSelection.whitelist:
        return 'whitelist';
      case ItemSelection.all:
        return 'all';
    }
  }
}

extension on String {
  ItemSelection toItemSelection() {
    switch (this) {
      case 'none':
        return ItemSelection.none;
      case 'whitelist':
        return ItemSelection.whitelist;
      case 'all':
        return ItemSelection.all;
    }
    throw Exception('$this is not known in enum ItemSelection');
  }
}

/// A complex type that lists the active CloudFront key pairs, if any, that are
/// associated with <code>AwsAccountNumber</code>.
///
/// For more information, see <a>ActiveTrustedSigners</a>.
class KeyPairIds {
  /// The number of active CloudFront key pairs for <code>AwsAccountNumber</code>.
  ///
  /// For more information, see <a>ActiveTrustedSigners</a>.
  final int quantity;

  /// A complex type that lists the active CloudFront key pairs, if any, that are
  /// associated with <code>AwsAccountNumber</code>.
  ///
  /// For more information, see <a>ActiveTrustedSigners</a>.
  final List<String>? items;

  KeyPairIds({
    required this.quantity,
    this.items,
  });

  factory KeyPairIds.fromJson(Map<String, dynamic> json) {
    return KeyPairIds(
      quantity: json['Quantity'] as int,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  factory KeyPairIds.fromXml(_s.XmlElement elem) {
    return KeyPairIds(
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
      items: _s
          .extractXmlChild(elem, 'Items')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'KeyPairId')),
    );
  }

  Map<String, dynamic> toJson() {
    final quantity = this.quantity;
    final items = this.items;
    return {
      'Quantity': quantity,
      if (items != null) 'Items': items,
    };
  }
}

/// A complex type that contains a Lambda function association.
class LambdaFunctionAssociation {
  /// Specifies the event type that triggers a Lambda function invocation. Valid
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// <code>viewer-request</code>
  /// </li>
  /// <li>
  /// <code>origin-request</code>
  /// </li>
  /// <li>
  /// <code>viewer-response</code>
  /// </li>
  /// <li>
  /// <code>origin-response</code>
  /// </li>
  /// </ul>
  final EventType? eventType;

  /// The ARN of the Lambda function.
  final String? lambdaFunctionARN;

  LambdaFunctionAssociation({
    this.eventType,
    this.lambdaFunctionARN,
  });

  factory LambdaFunctionAssociation.fromJson(Map<String, dynamic> json) {
    return LambdaFunctionAssociation(
      eventType: (json['EventType'] as String?)?.toEventType(),
      lambdaFunctionARN: json['LambdaFunctionARN'] as String?,
    );
  }

  factory LambdaFunctionAssociation.fromXml(_s.XmlElement elem) {
    return LambdaFunctionAssociation(
      eventType: _s.extractXmlStringValue(elem, 'EventType')?.toEventType(),
      lambdaFunctionARN: _s.extractXmlStringValue(elem, 'LambdaFunctionARN'),
    );
  }

  Map<String, dynamic> toJson() {
    final eventType = this.eventType;
    final lambdaFunctionARN = this.lambdaFunctionARN;
    return {
      if (eventType != null) 'EventType': eventType.toValue(),
      if (lambdaFunctionARN != null) 'LambdaFunctionARN': lambdaFunctionARN,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final eventType = this.eventType;
    final lambdaFunctionARN = this.lambdaFunctionARN;
    final $children = <_s.XmlNode>[
      if (lambdaFunctionARN != null)
        _s.encodeXmlStringValue('LambdaFunctionARN', lambdaFunctionARN),
      if (eventType != null)
        _s.encodeXmlStringValue('EventType', eventType.toValue()),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that specifies a list of Lambda functions associations for a
/// cache behavior.
///
/// If you want to invoke one or more Lambda functions triggered by requests
/// that match the <code>PathPattern</code> of the cache behavior, specify the
/// applicable values for <code>Quantity</code> and <code>Items</code>. Note
/// that there can be up to 4 <code>LambdaFunctionAssociation</code> items in
/// this list (one for each possible value of <code>EventType</code>) and each
/// <code>EventType</code> can be associated with the Lambda function only once.
///
/// If you don't want to invoke any Lambda functions for the requests that match
/// <code>PathPattern</code>, specify <code>0</code> for <code>Quantity</code>
/// and omit <code>Items</code>.
class LambdaFunctionAssociations {
  /// The number of Lambda function associations for this cache behavior.
  final int quantity;

  /// <b>Optional</b>: A complex type that contains
  /// <code>LambdaFunctionAssociation</code> items for this cache behavior. If
  /// <code>Quantity</code> is <code>0</code>, you can omit <code>Items</code>.
  final List<LambdaFunctionAssociation>? items;

  LambdaFunctionAssociations({
    required this.quantity,
    this.items,
  });

  factory LambdaFunctionAssociations.fromJson(Map<String, dynamic> json) {
    return LambdaFunctionAssociations(
      quantity: json['Quantity'] as int,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) =>
              LambdaFunctionAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory LambdaFunctionAssociations.fromXml(_s.XmlElement elem) {
    return LambdaFunctionAssociations(
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('LambdaFunctionAssociation')
          .map((c) => LambdaFunctionAssociation.fromXml(c))
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final quantity = this.quantity;
    final items = this.items;
    return {
      'Quantity': quantity,
      if (items != null) 'Items': items,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final quantity = this.quantity;
    final items = this.items;
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => e.toXml('LambdaFunctionAssociation'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// The returned result of the corresponding request.
class ListCloudFrontOriginAccessIdentitiesResult {
  /// The <code>CloudFrontOriginAccessIdentityList</code> type.
  final CloudFrontOriginAccessIdentityList? cloudFrontOriginAccessIdentityList;

  ListCloudFrontOriginAccessIdentitiesResult({
    this.cloudFrontOriginAccessIdentityList,
  });

  factory ListCloudFrontOriginAccessIdentitiesResult.fromJson(
      Map<String, dynamic> json) {
    return ListCloudFrontOriginAccessIdentitiesResult(
      cloudFrontOriginAccessIdentityList:
          json['CloudFrontOriginAccessIdentityList'] != null
              ? CloudFrontOriginAccessIdentityList.fromJson(
                  json['CloudFrontOriginAccessIdentityList']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFrontOriginAccessIdentityList =
        this.cloudFrontOriginAccessIdentityList;
    return {
      if (cloudFrontOriginAccessIdentityList != null)
        'CloudFrontOriginAccessIdentityList':
            cloudFrontOriginAccessIdentityList,
    };
  }
}

/// The response to a request to list the distributions that are associated with
/// a specified AWS WAF web ACL.
class ListDistributionsByWebACLIdResult {
  /// The <code>DistributionList</code> type.
  final DistributionList? distributionList;

  ListDistributionsByWebACLIdResult({
    this.distributionList,
  });

  factory ListDistributionsByWebACLIdResult.fromJson(
      Map<String, dynamic> json) {
    return ListDistributionsByWebACLIdResult(
      distributionList: json['DistributionList'] != null
          ? DistributionList.fromJson(
              json['DistributionList'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final distributionList = this.distributionList;
    return {
      if (distributionList != null) 'DistributionList': distributionList,
    };
  }
}

/// The returned result of the corresponding request.
class ListDistributionsResult {
  /// The <code>DistributionList</code> type.
  final DistributionList? distributionList;

  ListDistributionsResult({
    this.distributionList,
  });

  factory ListDistributionsResult.fromJson(Map<String, dynamic> json) {
    return ListDistributionsResult(
      distributionList: json['DistributionList'] != null
          ? DistributionList.fromJson(
              json['DistributionList'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final distributionList = this.distributionList;
    return {
      if (distributionList != null) 'DistributionList': distributionList,
    };
  }
}

/// The returned result of the corresponding request.
class ListInvalidationsResult {
  /// Information about invalidation batches.
  final InvalidationList? invalidationList;

  ListInvalidationsResult({
    this.invalidationList,
  });

  factory ListInvalidationsResult.fromJson(Map<String, dynamic> json) {
    return ListInvalidationsResult(
      invalidationList: json['InvalidationList'] != null
          ? InvalidationList.fromJson(
              json['InvalidationList'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final invalidationList = this.invalidationList;
    return {
      if (invalidationList != null) 'InvalidationList': invalidationList,
    };
  }
}

/// The returned result of the corresponding request.
class ListStreamingDistributionsResult {
  /// The <code>StreamingDistributionList</code> type.
  final StreamingDistributionList? streamingDistributionList;

  ListStreamingDistributionsResult({
    this.streamingDistributionList,
  });

  factory ListStreamingDistributionsResult.fromJson(Map<String, dynamic> json) {
    return ListStreamingDistributionsResult(
      streamingDistributionList: json['StreamingDistributionList'] != null
          ? StreamingDistributionList.fromJson(
              json['StreamingDistributionList'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final streamingDistributionList = this.streamingDistributionList;
    return {
      if (streamingDistributionList != null)
        'StreamingDistributionList': streamingDistributionList,
    };
  }
}

/// The returned result of the corresponding request.
class ListTagsForResourceResult {
  /// A complex type that contains zero or more <code>Tag</code> elements.
  final Tags tags;

  ListTagsForResourceResult({
    required this.tags,
  });

  factory ListTagsForResourceResult.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResult(
      tags: Tags.fromJson(json['Tags'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'Tags': tags,
    };
  }
}

/// A complex type that controls whether access logs are written for the
/// distribution.
class LoggingConfig {
  /// The Amazon S3 bucket to store the access logs in, for example,
  /// <code>myawslogbucket.s3.amazonaws.com</code>.
  final String bucket;

  /// Specifies whether you want CloudFront to save access logs to an Amazon S3
  /// bucket. If you do not want to enable logging when you create a distribution
  /// or if you want to disable logging for an existing distribution, specify
  /// <code>false</code> for <code>Enabled</code>, and specify empty
  /// <code>Bucket</code> and <code>Prefix</code> elements. If you specify
  /// <code>false</code> for <code>Enabled</code> but you specify values for
  /// <code>Bucket</code>, <code>prefix</code>, and <code>IncludeCookies</code>,
  /// the values are automatically deleted.
  final bool enabled;

  /// Specifies whether you want CloudFront to include cookies in access logs,
  /// specify <code>true</code> for <code>IncludeCookies</code>. If you choose to
  /// include cookies in logs, CloudFront logs all cookies regardless of how you
  /// configure the cache behaviors for this distribution. If you do not want to
  /// include cookies when you create a distribution or if you want to disable
  /// include cookies for an existing distribution, specify <code>false</code> for
  /// <code>IncludeCookies</code>.
  final bool includeCookies;

  /// An optional string that you want CloudFront to prefix to the access log
  /// <code>filenames</code> for this distribution, for example,
  /// <code>myprefix/</code>. If you want to enable logging, but you do not want
  /// to specify a prefix, you still must include an empty <code>Prefix</code>
  /// element in the <code>Logging</code> element.
  final String prefix;

  LoggingConfig({
    required this.bucket,
    required this.enabled,
    required this.includeCookies,
    required this.prefix,
  });

  factory LoggingConfig.fromJson(Map<String, dynamic> json) {
    return LoggingConfig(
      bucket: json['Bucket'] as String,
      enabled: json['Enabled'] as bool,
      includeCookies: json['IncludeCookies'] as bool,
      prefix: json['Prefix'] as String,
    );
  }

  factory LoggingConfig.fromXml(_s.XmlElement elem) {
    return LoggingConfig(
      bucket: _s.extractXmlStringValue(elem, 'Bucket')!,
      enabled: _s.extractXmlBoolValue(elem, 'Enabled')!,
      includeCookies: _s.extractXmlBoolValue(elem, 'IncludeCookies')!,
      prefix: _s.extractXmlStringValue(elem, 'Prefix')!,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final enabled = this.enabled;
    final includeCookies = this.includeCookies;
    final prefix = this.prefix;
    return {
      'Bucket': bucket,
      'Enabled': enabled,
      'IncludeCookies': includeCookies,
      'Prefix': prefix,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final bucket = this.bucket;
    final enabled = this.enabled;
    final includeCookies = this.includeCookies;
    final prefix = this.prefix;
    final $children = <_s.XmlNode>[
      _s.encodeXmlBoolValue('Enabled', enabled),
      _s.encodeXmlBoolValue('IncludeCookies', includeCookies),
      _s.encodeXmlStringValue('Bucket', bucket),
      _s.encodeXmlStringValue('Prefix', prefix),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

enum Method {
  get,
  head,
  post,
  put,
  patch,
  options,
  delete,
}

extension on Method {
  String toValue() {
    switch (this) {
      case Method.get:
        return 'GET';
      case Method.head:
        return 'HEAD';
      case Method.post:
        return 'POST';
      case Method.put:
        return 'PUT';
      case Method.patch:
        return 'PATCH';
      case Method.options:
        return 'OPTIONS';
      case Method.delete:
        return 'DELETE';
    }
  }
}

extension on String {
  Method toMethod() {
    switch (this) {
      case 'GET':
        return Method.get;
      case 'HEAD':
        return Method.head;
      case 'POST':
        return Method.post;
      case 'PUT':
        return Method.put;
      case 'PATCH':
        return Method.patch;
      case 'OPTIONS':
        return Method.options;
      case 'DELETE':
        return Method.delete;
    }
    throw Exception('$this is not known in enum Method');
  }
}

enum MinimumProtocolVersion {
  sSLv3,
  tLSv1,
}

extension on MinimumProtocolVersion {
  String toValue() {
    switch (this) {
      case MinimumProtocolVersion.sSLv3:
        return 'SSLv3';
      case MinimumProtocolVersion.tLSv1:
        return 'TLSv1';
    }
  }
}

extension on String {
  MinimumProtocolVersion toMinimumProtocolVersion() {
    switch (this) {
      case 'SSLv3':
        return MinimumProtocolVersion.sSLv3;
      case 'TLSv1':
        return MinimumProtocolVersion.tLSv1;
    }
    throw Exception('$this is not known in enum MinimumProtocolVersion');
  }
}

/// This operation requires a body. Ensure that the body is present and the
/// Content-Type header is set.
class MissingBody implements _s.AwsException {
  final String? message;

  MissingBody({
    this.message,
  });

  factory MissingBody.fromJson(Map<String, dynamic> json) {
    return MissingBody(
      message: json['Message'] as String?,
    );
  }

  factory MissingBody.fromXml(_s.XmlElement elem) {
    return MissingBody(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// The specified origin access identity does not exist.
class NoSuchCloudFrontOriginAccessIdentity implements _s.AwsException {
  final String? message;

  NoSuchCloudFrontOriginAccessIdentity({
    this.message,
  });

  factory NoSuchCloudFrontOriginAccessIdentity.fromJson(
      Map<String, dynamic> json) {
    return NoSuchCloudFrontOriginAccessIdentity(
      message: json['Message'] as String?,
    );
  }

  factory NoSuchCloudFrontOriginAccessIdentity.fromXml(_s.XmlElement elem) {
    return NoSuchCloudFrontOriginAccessIdentity(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// The specified distribution does not exist.
class NoSuchDistribution implements _s.AwsException {
  final String? message;

  NoSuchDistribution({
    this.message,
  });

  factory NoSuchDistribution.fromJson(Map<String, dynamic> json) {
    return NoSuchDistribution(
      message: json['Message'] as String?,
    );
  }

  factory NoSuchDistribution.fromXml(_s.XmlElement elem) {
    return NoSuchDistribution(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// The specified invalidation does not exist.
class NoSuchInvalidation implements _s.AwsException {
  final String? message;

  NoSuchInvalidation({
    this.message,
  });

  factory NoSuchInvalidation.fromJson(Map<String, dynamic> json) {
    return NoSuchInvalidation(
      message: json['Message'] as String?,
    );
  }

  factory NoSuchInvalidation.fromXml(_s.XmlElement elem) {
    return NoSuchInvalidation(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// No origin exists with the specified <code>Origin Id</code>.
class NoSuchOrigin implements _s.AwsException {
  final String? message;

  NoSuchOrigin({
    this.message,
  });

  factory NoSuchOrigin.fromJson(Map<String, dynamic> json) {
    return NoSuchOrigin(
      message: json['Message'] as String?,
    );
  }

  factory NoSuchOrigin.fromXml(_s.XmlElement elem) {
    return NoSuchOrigin(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class NoSuchResource implements _s.AwsException {
  final String? message;

  NoSuchResource({
    this.message,
  });

  factory NoSuchResource.fromJson(Map<String, dynamic> json) {
    return NoSuchResource(
      message: json['Message'] as String?,
    );
  }

  factory NoSuchResource.fromXml(_s.XmlElement elem) {
    return NoSuchResource(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// The specified streaming distribution does not exist.
class NoSuchStreamingDistribution implements _s.AwsException {
  final String? message;

  NoSuchStreamingDistribution({
    this.message,
  });

  factory NoSuchStreamingDistribution.fromJson(Map<String, dynamic> json) {
    return NoSuchStreamingDistribution(
      message: json['Message'] as String?,
    );
  }

  factory NoSuchStreamingDistribution.fromXml(_s.XmlElement elem) {
    return NoSuchStreamingDistribution(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// A complex type that describes the Amazon S3 bucket or the HTTP server (for
/// example, a web server) from which CloudFront gets your files. You must
/// create at least one origin.
///
/// For the current limit on the number of origins that you can create for a
/// distribution, see <a
/// href="http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_cloudfront">Amazon
/// CloudFront Limits</a> in the <i>AWS General Reference</i>.
class Origin {
  /// <b>Amazon S3 origins</b>: The DNS name of the Amazon S3 bucket from which
  /// you want CloudFront to get objects for this origin, for example,
  /// <code>myawsbucket.s3.amazonaws.com</code>.
  ///
  /// Constraints for Amazon S3 origins:
  ///
  /// <ul>
  /// <li>
  /// If you configured Amazon S3 Transfer Acceleration for your bucket, do not
  /// specify the <code>s3-accelerate</code> endpoint for <code>DomainName</code>.
  /// </li>
  /// <li>
  /// The bucket name must be between 3 and 63 characters long (inclusive).
  /// </li>
  /// <li>
  /// The bucket name must contain only lowercase characters, numbers, periods,
  /// underscores, and dashes.
  /// </li>
  /// <li>
  /// The bucket name must not contain adjacent periods.
  /// </li>
  /// </ul>
  /// <b>Custom Origins</b>: The DNS domain name for the HTTP server from which
  /// you want CloudFront to get objects for this origin, for example,
  /// <code>www.example.com</code>.
  ///
  /// Constraints for custom origins:
  ///
  /// <ul>
  /// <li>
  /// <code>DomainName</code> must be a valid DNS name that contains only a-z,
  /// A-Z, 0-9, dot (.), hyphen (-), or underscore (_) characters.
  /// </li>
  /// <li>
  /// The name cannot exceed 128 characters.
  /// </li>
  /// </ul>
  final String domainName;

  /// A unique identifier for the origin. The value of <code>Id</code> must be
  /// unique within the distribution.
  ///
  /// When you specify the value of <code>TargetOriginId</code> for the default
  /// cache behavior or for another cache behavior, you indicate the origin to
  /// which you want the cache behavior to route requests by specifying the value
  /// of the <code>Id</code> element for that origin. When a request matches the
  /// path pattern for that cache behavior, CloudFront routes the request to the
  /// specified origin. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesCacheBehavior">Cache
  /// Behavior Settings</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final String id;

  /// A complex type that contains names and values for the custom headers that
  /// you want.
  final CustomHeaders? customHeaders;

  /// A complex type that contains information about a custom origin. If the
  /// origin is an Amazon S3 bucket, use the <code>S3OriginConfig</code> element
  /// instead.
  final CustomOriginConfig? customOriginConfig;

  /// An optional element that causes CloudFront to request your content from a
  /// directory in your Amazon S3 bucket or your custom origin. When you include
  /// the <code>OriginPath</code> element, specify the directory name, beginning
  /// with a <code>/</code>. CloudFront appends the directory name to the value of
  /// <code>DomainName</code>, for example, <code>example.com/production</code>.
  /// Do not include a <code>/</code> at the end of the directory name.
  ///
  /// For example, suppose you've specified the following values for your
  /// distribution:
  ///
  /// <ul>
  /// <li>
  /// <code>DomainName</code>: An Amazon S3 bucket named <code>myawsbucket</code>.
  /// </li>
  /// <li>
  /// <code>OriginPath</code>: <code>/production</code>
  /// </li>
  /// <li>
  /// <code>CNAME</code>: <code>example.com</code>
  /// </li>
  /// </ul>
  /// When a user enters <code>example.com/index.html</code> in a browser,
  /// CloudFront sends a request to Amazon S3 for
  /// <code>myawsbucket/production/index.html</code>.
  ///
  /// When a user enters <code>example.com/acme/index.html</code> in a browser,
  /// CloudFront sends a request to Amazon S3 for
  /// <code>myawsbucket/production/acme/index.html</code>.
  final String? originPath;

  /// A complex type that contains information about the Amazon S3 origin. If the
  /// origin is a custom origin, use the <code>CustomOriginConfig</code> element
  /// instead.
  final S3OriginConfig? s3OriginConfig;

  Origin({
    required this.domainName,
    required this.id,
    this.customHeaders,
    this.customOriginConfig,
    this.originPath,
    this.s3OriginConfig,
  });

  factory Origin.fromJson(Map<String, dynamic> json) {
    return Origin(
      domainName: json['DomainName'] as String,
      id: json['Id'] as String,
      customHeaders: json['CustomHeaders'] != null
          ? CustomHeaders.fromJson(
              json['CustomHeaders'] as Map<String, dynamic>)
          : null,
      customOriginConfig: json['CustomOriginConfig'] != null
          ? CustomOriginConfig.fromJson(
              json['CustomOriginConfig'] as Map<String, dynamic>)
          : null,
      originPath: json['OriginPath'] as String?,
      s3OriginConfig: json['S3OriginConfig'] != null
          ? S3OriginConfig.fromJson(
              json['S3OriginConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  factory Origin.fromXml(_s.XmlElement elem) {
    return Origin(
      domainName: _s.extractXmlStringValue(elem, 'DomainName')!,
      id: _s.extractXmlStringValue(elem, 'Id')!,
      customHeaders: _s
          .extractXmlChild(elem, 'CustomHeaders')
          ?.let((e) => CustomHeaders.fromXml(e)),
      customOriginConfig: _s
          .extractXmlChild(elem, 'CustomOriginConfig')
          ?.let((e) => CustomOriginConfig.fromXml(e)),
      originPath: _s.extractXmlStringValue(elem, 'OriginPath'),
      s3OriginConfig: _s
          .extractXmlChild(elem, 'S3OriginConfig')
          ?.let((e) => S3OriginConfig.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final id = this.id;
    final customHeaders = this.customHeaders;
    final customOriginConfig = this.customOriginConfig;
    final originPath = this.originPath;
    final s3OriginConfig = this.s3OriginConfig;
    return {
      'DomainName': domainName,
      'Id': id,
      if (customHeaders != null) 'CustomHeaders': customHeaders,
      if (customOriginConfig != null) 'CustomOriginConfig': customOriginConfig,
      if (originPath != null) 'OriginPath': originPath,
      if (s3OriginConfig != null) 'S3OriginConfig': s3OriginConfig,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final domainName = this.domainName;
    final id = this.id;
    final customHeaders = this.customHeaders;
    final customOriginConfig = this.customOriginConfig;
    final originPath = this.originPath;
    final s3OriginConfig = this.s3OriginConfig;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Id', id),
      _s.encodeXmlStringValue('DomainName', domainName),
      if (originPath != null) _s.encodeXmlStringValue('OriginPath', originPath),
      if (customHeaders != null) customHeaders.toXml('CustomHeaders'),
      if (s3OriginConfig != null) s3OriginConfig.toXml('S3OriginConfig'),
      if (customOriginConfig != null)
        customOriginConfig.toXml('CustomOriginConfig'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains <code>HeaderName</code> and
/// <code>HeaderValue</code> elements, if any, for this distribution.
class OriginCustomHeader {
  /// The name of a header that you want CloudFront to forward to your origin. For
  /// more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/forward-custom-headers.html">Forwarding
  /// Custom Headers to Your Origin (Web Distributions Only)</a> in the <i>Amazon
  /// Amazon CloudFront Developer Guide</i>.
  final String headerName;

  /// The value for the header that you specified in the <code>HeaderName</code>
  /// field.
  final String headerValue;

  OriginCustomHeader({
    required this.headerName,
    required this.headerValue,
  });

  factory OriginCustomHeader.fromJson(Map<String, dynamic> json) {
    return OriginCustomHeader(
      headerName: json['HeaderName'] as String,
      headerValue: json['HeaderValue'] as String,
    );
  }

  factory OriginCustomHeader.fromXml(_s.XmlElement elem) {
    return OriginCustomHeader(
      headerName: _s.extractXmlStringValue(elem, 'HeaderName')!,
      headerValue: _s.extractXmlStringValue(elem, 'HeaderValue')!,
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final headerName = this.headerName;
    final headerValue = this.headerValue;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('HeaderName', headerName),
      _s.encodeXmlStringValue('HeaderValue', headerValue),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

enum OriginProtocolPolicy {
  httpOnly,
  matchViewer,
  httpsOnly,
}

extension on OriginProtocolPolicy {
  String toValue() {
    switch (this) {
      case OriginProtocolPolicy.httpOnly:
        return 'http-only';
      case OriginProtocolPolicy.matchViewer:
        return 'match-viewer';
      case OriginProtocolPolicy.httpsOnly:
        return 'https-only';
    }
  }
}

extension on String {
  OriginProtocolPolicy toOriginProtocolPolicy() {
    switch (this) {
      case 'http-only':
        return OriginProtocolPolicy.httpOnly;
      case 'match-viewer':
        return OriginProtocolPolicy.matchViewer;
      case 'https-only':
        return OriginProtocolPolicy.httpsOnly;
    }
    throw Exception('$this is not known in enum OriginProtocolPolicy');
  }
}

/// A complex type that contains information about the SSL/TLS protocols that
/// CloudFront can use when establishing an HTTPS connection with your origin.
class OriginSslProtocols {
  /// A list that contains allowed SSL/TLS protocols for this distribution.
  final List<SslProtocol> items;

  /// The number of SSL/TLS protocols that you want to allow CloudFront to use
  /// when establishing an HTTPS connection with this origin.
  final int quantity;

  OriginSslProtocols({
    required this.items,
    required this.quantity,
  });

  factory OriginSslProtocols.fromJson(Map<String, dynamic> json) {
    return OriginSslProtocols(
      items: (json['Items'] as List)
          .whereNotNull()
          .map((e) => (e as String).toSslProtocol())
          .toList(),
      quantity: json['Quantity'] as int,
    );
  }

  factory OriginSslProtocols.fromXml(_s.XmlElement elem) {
    return OriginSslProtocols(
      items: _s
          .extractXmlStringListValues(
              _s.extractXmlChild(elem, 'Items')!, 'SslProtocol')
          .map((s) => s.toSslProtocol())
          .toList(),
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final quantity = this.quantity;
    return {
      'Items': items.map((e) => e.toValue()).toList(),
      'Quantity': quantity,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final items = this.items;
    final quantity = this.quantity;
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      _s.XmlElement(
          _s.XmlName('Items'),
          [],
          items
              .map((e) => _s.encodeXmlStringValue('SslProtocol', e.toValue()))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains information about origins for this
/// distribution.
class Origins {
  /// The number of origins for this distribution.
  final int quantity;

  /// A complex type that contains origins for this distribution.
  final List<Origin>? items;

  Origins({
    required this.quantity,
    this.items,
  });

  factory Origins.fromJson(Map<String, dynamic> json) {
    return Origins(
      quantity: json['Quantity'] as int,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => Origin.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory Origins.fromXml(_s.XmlElement elem) {
    return Origins(
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) =>
          elem.findElements('Origin').map((c) => Origin.fromXml(c)).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final quantity = this.quantity;
    final items = this.items;
    return {
      'Quantity': quantity,
      if (items != null) 'Items': items,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final quantity = this.quantity;
    final items = this.items;
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(
            _s.XmlName('Items'), [], items.map((e) => e.toXml('Origin'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains information about the objects that you want to
/// invalidate. For more information, see <a
/// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Invalidation.html#invalidation-specifying-objects">Specifying
/// the Objects to Invalidate</a> in the <i>Amazon CloudFront Developer
/// Guide</i>.
class Paths {
  /// The number of objects that you want to invalidate.
  final int quantity;

  /// A complex type that contains a list of the paths that you want to
  /// invalidate.
  final List<String>? items;

  Paths({
    required this.quantity,
    this.items,
  });

  factory Paths.fromJson(Map<String, dynamic> json) {
    return Paths(
      quantity: json['Quantity'] as int,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  factory Paths.fromXml(_s.XmlElement elem) {
    return Paths(
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
      items: _s
          .extractXmlChild(elem, 'Items')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Path')),
    );
  }

  Map<String, dynamic> toJson() {
    final quantity = this.quantity;
    final items = this.items;
    return {
      'Quantity': quantity,
      if (items != null) 'Items': items,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final quantity = this.quantity;
    final items = this.items;
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => _s.encodeXmlStringValue('Path', e))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// The precondition given in one or more of the request-header fields evaluated
/// to <code>false</code>.
class PreconditionFailed implements _s.AwsException {
  final String? message;

  PreconditionFailed({
    this.message,
  });

  factory PreconditionFailed.fromJson(Map<String, dynamic> json) {
    return PreconditionFailed(
      message: json['Message'] as String?,
    );
  }

  factory PreconditionFailed.fromXml(_s.XmlElement elem) {
    return PreconditionFailed(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

enum PriceClass {
  priceClass_100,
  priceClass_200,
  priceClassAll,
}

extension on PriceClass {
  String toValue() {
    switch (this) {
      case PriceClass.priceClass_100:
        return 'PriceClass_100';
      case PriceClass.priceClass_200:
        return 'PriceClass_200';
      case PriceClass.priceClassAll:
        return 'PriceClass_All';
    }
  }
}

extension on String {
  PriceClass toPriceClass() {
    switch (this) {
      case 'PriceClass_100':
        return PriceClass.priceClass_100;
      case 'PriceClass_200':
        return PriceClass.priceClass_200;
      case 'PriceClass_All':
        return PriceClass.priceClassAll;
    }
    throw Exception('$this is not known in enum PriceClass');
  }
}

class QueryStringCacheKeys {
  /// The number of <code>whitelisted</code> query string parameters for this
  /// cache behavior.
  final int quantity;

  /// (Optional) A list that contains the query string parameters that you want
  /// CloudFront to use as a basis for caching for this cache behavior. If
  /// <code>Quantity</code> is 0, you can omit <code>Items</code>.
  final List<String>? items;

  QueryStringCacheKeys({
    required this.quantity,
    this.items,
  });

  factory QueryStringCacheKeys.fromJson(Map<String, dynamic> json) {
    return QueryStringCacheKeys(
      quantity: json['Quantity'] as int,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  factory QueryStringCacheKeys.fromXml(_s.XmlElement elem) {
    return QueryStringCacheKeys(
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
      items: _s
          .extractXmlChild(elem, 'Items')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Name')),
    );
  }

  Map<String, dynamic> toJson() {
    final quantity = this.quantity;
    final items = this.items;
    return {
      'Quantity': quantity,
      if (items != null) 'Items': items,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final quantity = this.quantity;
    final items = this.items;
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => _s.encodeXmlStringValue('Name', e))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that identifies ways in which you want to restrict
/// distribution of your content.
class Restrictions {
  final GeoRestriction geoRestriction;

  Restrictions({
    required this.geoRestriction,
  });

  factory Restrictions.fromJson(Map<String, dynamic> json) {
    return Restrictions(
      geoRestriction: GeoRestriction.fromJson(
          json['GeoRestriction'] as Map<String, dynamic>),
    );
  }

  factory Restrictions.fromXml(_s.XmlElement elem) {
    return Restrictions(
      geoRestriction:
          GeoRestriction.fromXml(_s.extractXmlChild(elem, 'GeoRestriction')!),
    );
  }

  Map<String, dynamic> toJson() {
    final geoRestriction = this.geoRestriction;
    return {
      'GeoRestriction': geoRestriction,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final geoRestriction = this.geoRestriction;
    final $children = <_s.XmlNode>[
      geoRestriction.toXml('GeoRestriction'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains information about the Amazon S3 bucket from
/// which you want CloudFront to get your media files for distribution.
class S3Origin {
  /// The DNS name of the Amazon S3 origin.
  final String domainName;

  /// The CloudFront origin access identity to associate with the RTMP
  /// distribution. Use an origin access identity to configure the distribution so
  /// that end users can only access objects in an Amazon S3 bucket through
  /// CloudFront.
  ///
  /// If you want end users to be able to access objects using either the
  /// CloudFront URL or the Amazon S3 URL, specify an empty
  /// <code>OriginAccessIdentity</code> element.
  ///
  /// To delete the origin access identity from an existing distribution, update
  /// the distribution configuration and include an empty
  /// <code>OriginAccessIdentity</code> element.
  ///
  /// To replace the origin access identity, update the distribution configuration
  /// and specify the new origin access identity.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html">Using
  /// an Origin Access Identity to Restrict Access to Your Amazon S3 Content</a>
  /// in the <i>Amazon Amazon CloudFront Developer Guide</i>.
  final String originAccessIdentity;

  S3Origin({
    required this.domainName,
    required this.originAccessIdentity,
  });

  factory S3Origin.fromJson(Map<String, dynamic> json) {
    return S3Origin(
      domainName: json['DomainName'] as String,
      originAccessIdentity: json['OriginAccessIdentity'] as String,
    );
  }

  factory S3Origin.fromXml(_s.XmlElement elem) {
    return S3Origin(
      domainName: _s.extractXmlStringValue(elem, 'DomainName')!,
      originAccessIdentity:
          _s.extractXmlStringValue(elem, 'OriginAccessIdentity')!,
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final originAccessIdentity = this.originAccessIdentity;
    return {
      'DomainName': domainName,
      'OriginAccessIdentity': originAccessIdentity,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final domainName = this.domainName;
    final originAccessIdentity = this.originAccessIdentity;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('DomainName', domainName),
      _s.encodeXmlStringValue('OriginAccessIdentity', originAccessIdentity),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains information about the Amazon S3 origin. If the
/// origin is a custom origin, use the <code>CustomOriginConfig</code> element
/// instead.
class S3OriginConfig {
  /// The CloudFront origin access identity to associate with the origin. Use an
  /// origin access identity to configure the origin so that viewers can
  /// <i>only</i> access objects in an Amazon S3 bucket through CloudFront. The
  /// format of the value is:
  ///
  /// origin-access-identity/CloudFront/<i>ID-of-origin-access-identity</i>
  ///
  /// where <code> <i>ID-of-origin-access-identity</i> </code> is the value that
  /// CloudFront returned in the <code>ID</code> element when you created the
  /// origin access identity.
  ///
  /// If you want viewers to be able to access objects using either the CloudFront
  /// URL or the Amazon S3 URL, specify an empty <code>OriginAccessIdentity</code>
  /// element.
  ///
  /// To delete the origin access identity from an existing distribution, update
  /// the distribution configuration and include an empty
  /// <code>OriginAccessIdentity</code> element.
  ///
  /// To replace the origin access identity, update the distribution configuration
  /// and specify the new origin access identity.
  ///
  /// For more information about the origin access identity, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving
  /// Private Content through CloudFront</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  final String originAccessIdentity;

  S3OriginConfig({
    required this.originAccessIdentity,
  });

  factory S3OriginConfig.fromJson(Map<String, dynamic> json) {
    return S3OriginConfig(
      originAccessIdentity: json['OriginAccessIdentity'] as String,
    );
  }

  factory S3OriginConfig.fromXml(_s.XmlElement elem) {
    return S3OriginConfig(
      originAccessIdentity:
          _s.extractXmlStringValue(elem, 'OriginAccessIdentity')!,
    );
  }

  Map<String, dynamic> toJson() {
    final originAccessIdentity = this.originAccessIdentity;
    return {
      'OriginAccessIdentity': originAccessIdentity,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final originAccessIdentity = this.originAccessIdentity;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('OriginAccessIdentity', originAccessIdentity),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

enum SSLSupportMethod {
  sniOnly,
  vip,
}

extension on SSLSupportMethod {
  String toValue() {
    switch (this) {
      case SSLSupportMethod.sniOnly:
        return 'sni-only';
      case SSLSupportMethod.vip:
        return 'vip';
    }
  }
}

extension on String {
  SSLSupportMethod toSSLSupportMethod() {
    switch (this) {
      case 'sni-only':
        return SSLSupportMethod.sniOnly;
      case 'vip':
        return SSLSupportMethod.vip;
    }
    throw Exception('$this is not known in enum SSLSupportMethod');
  }
}

/// A complex type that lists the AWS accounts that were included in the
/// <code>TrustedSigners</code> complex type, as well as their active CloudFront
/// key pair IDs, if any.
class Signer {
  /// An AWS account that is included in the <code>TrustedSigners</code> complex
  /// type for this RTMP distribution. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>self</code>, which is the AWS account used to create the distribution.
  /// </li>
  /// <li>
  /// An AWS account number.
  /// </li>
  /// </ul>
  final String? awsAccountNumber;

  /// A complex type that lists the active CloudFront key pairs, if any, that are
  /// associated with <code>AwsAccountNumber</code>.
  final KeyPairIds? keyPairIds;

  Signer({
    this.awsAccountNumber,
    this.keyPairIds,
  });

  factory Signer.fromJson(Map<String, dynamic> json) {
    return Signer(
      awsAccountNumber: json['AwsAccountNumber'] as String?,
      keyPairIds: json['KeyPairIds'] != null
          ? KeyPairIds.fromJson(json['KeyPairIds'] as Map<String, dynamic>)
          : null,
    );
  }

  factory Signer.fromXml(_s.XmlElement elem) {
    return Signer(
      awsAccountNumber: _s.extractXmlStringValue(elem, 'AwsAccountNumber'),
      keyPairIds: _s
          .extractXmlChild(elem, 'KeyPairIds')
          ?.let((e) => KeyPairIds.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountNumber = this.awsAccountNumber;
    final keyPairIds = this.keyPairIds;
    return {
      if (awsAccountNumber != null) 'AwsAccountNumber': awsAccountNumber,
      if (keyPairIds != null) 'KeyPairIds': keyPairIds,
    };
  }
}

enum SslProtocol {
  sSLv3,
  tLSv1,
  tLSv1_1,
  tLSv1_2,
}

extension on SslProtocol {
  String toValue() {
    switch (this) {
      case SslProtocol.sSLv3:
        return 'SSLv3';
      case SslProtocol.tLSv1:
        return 'TLSv1';
      case SslProtocol.tLSv1_1:
        return 'TLSv1.1';
      case SslProtocol.tLSv1_2:
        return 'TLSv1.2';
    }
  }
}

extension on String {
  SslProtocol toSslProtocol() {
    switch (this) {
      case 'SSLv3':
        return SslProtocol.sSLv3;
      case 'TLSv1':
        return SslProtocol.tLSv1;
      case 'TLSv1.1':
        return SslProtocol.tLSv1_1;
      case 'TLSv1.2':
        return SslProtocol.tLSv1_2;
    }
    throw Exception('$this is not known in enum SslProtocol');
  }
}

/// A streaming distribution.
class StreamingDistribution {
  final String arn;

  /// A complex type that lists the AWS accounts, if any, that you included in the
  /// <code>TrustedSigners</code> complex type for this distribution. These are
  /// the accounts that you want to allow to create signed URLs for private
  /// content.
  ///
  /// The <code>Signer</code> complex type lists the AWS account number of the
  /// trusted signer or <code>self</code> if the signer is the AWS account that
  /// created the distribution. The <code>Signer</code> element also includes the
  /// IDs of any active CloudFront key pairs that are associated with the trusted
  /// signer's AWS account. If no <code>KeyPairId</code> element appears for a
  /// <code>Signer</code>, that signer can't create signed URLs.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving
  /// Private Content through CloudFront</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  final ActiveTrustedSigners activeTrustedSigners;

  /// The domain name that corresponds to the streaming distribution. For example:
  /// <code>s5c39gqb8ow64r.cloudfront.net</code>.
  final String domainName;

  /// The identifier for the RTMP distribution. For example:
  /// <code>EGTXBD79EXAMPLE</code>.
  final String id;

  /// The current status of the RTMP distribution. When the status is
  /// <code>Deployed</code>, the distribution's information is propagated to all
  /// CloudFront edge locations.
  final String status;

  /// The current configuration information for the RTMP distribution.
  final StreamingDistributionConfig streamingDistributionConfig;

  /// The date and time that the distribution was last modified.
  final DateTime? lastModifiedTime;

  StreamingDistribution({
    required this.arn,
    required this.activeTrustedSigners,
    required this.domainName,
    required this.id,
    required this.status,
    required this.streamingDistributionConfig,
    this.lastModifiedTime,
  });

  factory StreamingDistribution.fromJson(Map<String, dynamic> json) {
    return StreamingDistribution(
      arn: json['ARN'] as String,
      activeTrustedSigners: ActiveTrustedSigners.fromJson(
          json['ActiveTrustedSigners'] as Map<String, dynamic>),
      domainName: json['DomainName'] as String,
      id: json['Id'] as String,
      status: json['Status'] as String,
      streamingDistributionConfig: StreamingDistributionConfig.fromJson(
          json['StreamingDistributionConfig'] as Map<String, dynamic>),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
    );
  }

  factory StreamingDistribution.fromXml(_s.XmlElement elem) {
    return StreamingDistribution(
      arn: _s.extractXmlStringValue(elem, 'ARN')!,
      activeTrustedSigners: ActiveTrustedSigners.fromXml(
          _s.extractXmlChild(elem, 'ActiveTrustedSigners')!),
      domainName: _s.extractXmlStringValue(elem, 'DomainName')!,
      id: _s.extractXmlStringValue(elem, 'Id')!,
      status: _s.extractXmlStringValue(elem, 'Status')!,
      streamingDistributionConfig: StreamingDistributionConfig.fromXml(
          _s.extractXmlChild(elem, 'StreamingDistributionConfig')!),
      lastModifiedTime: _s.extractXmlDateTimeValue(elem, 'LastModifiedTime'),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final activeTrustedSigners = this.activeTrustedSigners;
    final domainName = this.domainName;
    final id = this.id;
    final status = this.status;
    final streamingDistributionConfig = this.streamingDistributionConfig;
    final lastModifiedTime = this.lastModifiedTime;
    return {
      'ARN': arn,
      'ActiveTrustedSigners': activeTrustedSigners,
      'DomainName': domainName,
      'Id': id,
      'Status': status,
      'StreamingDistributionConfig': streamingDistributionConfig,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
    };
  }
}

class StreamingDistributionAlreadyExists implements _s.AwsException {
  final String? message;

  StreamingDistributionAlreadyExists({
    this.message,
  });

  factory StreamingDistributionAlreadyExists.fromJson(
      Map<String, dynamic> json) {
    return StreamingDistributionAlreadyExists(
      message: json['Message'] as String?,
    );
  }

  factory StreamingDistributionAlreadyExists.fromXml(_s.XmlElement elem) {
    return StreamingDistributionAlreadyExists(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// The RTMP distribution's configuration information.
class StreamingDistributionConfig {
  /// A unique number that ensures that the request can't be replayed. If the
  /// <code>CallerReference</code> is new (no matter the content of the
  /// <code>StreamingDistributionConfig</code> object), a new streaming
  /// distribution is created. If the <code>CallerReference</code> is a value that
  /// you already sent in a previous request to create a streaming distribution,
  /// and the content of the <code>StreamingDistributionConfig</code> is identical
  /// to the original request (ignoring white space), the response includes the
  /// same information returned to the original request. If the
  /// <code>CallerReference</code> is a value that you already sent in a previous
  /// request to create a streaming distribution but the content of the
  /// <code>StreamingDistributionConfig</code> is different from the original
  /// request, CloudFront returns a <code>DistributionAlreadyExists</code> error.
  final String callerReference;

  /// Any comments you want to include about the streaming distribution.
  final String comment;

  /// Whether the streaming distribution is enabled to accept user requests for
  /// content.
  final bool enabled;

  /// A complex type that contains information about the Amazon S3 bucket from
  /// which you want CloudFront to get your media files for distribution.
  final S3Origin s3Origin;

  /// A complex type that specifies any AWS accounts that you want to permit to
  /// create signed URLs for private content. If you want the distribution to use
  /// signed URLs, include this element; if you want the distribution to use
  /// public URLs, remove this element. For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving
  /// Private Content through CloudFront</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  final TrustedSigners trustedSigners;

  /// A complex type that contains information about CNAMEs (alternate domain
  /// names), if any, for this streaming distribution.
  final Aliases? aliases;

  /// A complex type that controls whether access logs are written for the
  /// streaming distribution.
  final StreamingLoggingConfig? logging;

  /// A complex type that contains information about price class for this
  /// streaming distribution.
  final PriceClass? priceClass;

  StreamingDistributionConfig({
    required this.callerReference,
    required this.comment,
    required this.enabled,
    required this.s3Origin,
    required this.trustedSigners,
    this.aliases,
    this.logging,
    this.priceClass,
  });

  factory StreamingDistributionConfig.fromJson(Map<String, dynamic> json) {
    return StreamingDistributionConfig(
      callerReference: json['CallerReference'] as String,
      comment: json['Comment'] as String,
      enabled: json['Enabled'] as bool,
      s3Origin: S3Origin.fromJson(json['S3Origin'] as Map<String, dynamic>),
      trustedSigners: TrustedSigners.fromJson(
          json['TrustedSigners'] as Map<String, dynamic>),
      aliases: json['Aliases'] != null
          ? Aliases.fromJson(json['Aliases'] as Map<String, dynamic>)
          : null,
      logging: json['Logging'] != null
          ? StreamingLoggingConfig.fromJson(
              json['Logging'] as Map<String, dynamic>)
          : null,
      priceClass: (json['PriceClass'] as String?)?.toPriceClass(),
    );
  }

  factory StreamingDistributionConfig.fromXml(_s.XmlElement elem) {
    return StreamingDistributionConfig(
      callerReference: _s.extractXmlStringValue(elem, 'CallerReference')!,
      comment: _s.extractXmlStringValue(elem, 'Comment')!,
      enabled: _s.extractXmlBoolValue(elem, 'Enabled')!,
      s3Origin: S3Origin.fromXml(_s.extractXmlChild(elem, 'S3Origin')!),
      trustedSigners:
          TrustedSigners.fromXml(_s.extractXmlChild(elem, 'TrustedSigners')!),
      aliases:
          _s.extractXmlChild(elem, 'Aliases')?.let((e) => Aliases.fromXml(e)),
      logging: _s
          .extractXmlChild(elem, 'Logging')
          ?.let((e) => StreamingLoggingConfig.fromXml(e)),
      priceClass: _s.extractXmlStringValue(elem, 'PriceClass')?.toPriceClass(),
    );
  }

  Map<String, dynamic> toJson() {
    final callerReference = this.callerReference;
    final comment = this.comment;
    final enabled = this.enabled;
    final s3Origin = this.s3Origin;
    final trustedSigners = this.trustedSigners;
    final aliases = this.aliases;
    final logging = this.logging;
    final priceClass = this.priceClass;
    return {
      'CallerReference': callerReference,
      'Comment': comment,
      'Enabled': enabled,
      'S3Origin': s3Origin,
      'TrustedSigners': trustedSigners,
      if (aliases != null) 'Aliases': aliases,
      if (logging != null) 'Logging': logging,
      if (priceClass != null) 'PriceClass': priceClass.toValue(),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final callerReference = this.callerReference;
    final comment = this.comment;
    final enabled = this.enabled;
    final s3Origin = this.s3Origin;
    final trustedSigners = this.trustedSigners;
    final aliases = this.aliases;
    final logging = this.logging;
    final priceClass = this.priceClass;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('CallerReference', callerReference),
      s3Origin.toXml('S3Origin'),
      if (aliases != null) aliases.toXml('Aliases'),
      _s.encodeXmlStringValue('Comment', comment),
      if (logging != null) logging.toXml('Logging'),
      trustedSigners.toXml('TrustedSigners'),
      if (priceClass != null)
        _s.encodeXmlStringValue('PriceClass', priceClass.toValue()),
      _s.encodeXmlBoolValue('Enabled', enabled),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A streaming distribution Configuration and a list of tags to be associated
/// with the streaming distribution.
class StreamingDistributionConfigWithTags {
  /// A streaming distribution Configuration.
  final StreamingDistributionConfig streamingDistributionConfig;

  /// A complex type that contains zero or more <code>Tag</code> elements.
  final Tags tags;

  StreamingDistributionConfigWithTags({
    required this.streamingDistributionConfig,
    required this.tags,
  });

  factory StreamingDistributionConfigWithTags.fromJson(
      Map<String, dynamic> json) {
    return StreamingDistributionConfigWithTags(
      streamingDistributionConfig: StreamingDistributionConfig.fromJson(
          json['StreamingDistributionConfig'] as Map<String, dynamic>),
      tags: Tags.fromJson(json['Tags'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final streamingDistributionConfig = this.streamingDistributionConfig;
    final tags = this.tags;
    return {
      'StreamingDistributionConfig': streamingDistributionConfig,
      'Tags': tags,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final streamingDistributionConfig = this.streamingDistributionConfig;
    final tags = this.tags;
    final $children = <_s.XmlNode>[
      streamingDistributionConfig.toXml('StreamingDistributionConfig'),
      tags.toXml('Tags'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A streaming distribution list.
class StreamingDistributionList {
  /// A flag that indicates whether more streaming distributions remain to be
  /// listed. If your results were truncated, you can make a follow-up pagination
  /// request using the <code>Marker</code> request parameter to retrieve more
  /// distributions in the list.
  final bool isTruncated;

  /// The value you provided for the <code>Marker</code> request parameter.
  final String marker;

  /// The value you provided for the <code>MaxItems</code> request parameter.
  final int maxItems;

  /// The number of streaming distributions that were created by the current AWS
  /// account.
  final int quantity;

  /// A complex type that contains one <code>StreamingDistributionSummary</code>
  /// element for each distribution that was created by the current AWS account.
  final List<StreamingDistributionSummary>? items;

  /// If <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value you can use for the <code>Marker</code> request
  /// parameter to continue listing your RTMP distributions where they left off.
  final String? nextMarker;

  StreamingDistributionList({
    required this.isTruncated,
    required this.marker,
    required this.maxItems,
    required this.quantity,
    this.items,
    this.nextMarker,
  });

  factory StreamingDistributionList.fromJson(Map<String, dynamic> json) {
    return StreamingDistributionList(
      isTruncated: json['IsTruncated'] as bool,
      marker: json['Marker'] as String,
      maxItems: json['MaxItems'] as int,
      quantity: json['Quantity'] as int,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) =>
              StreamingDistributionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  factory StreamingDistributionList.fromXml(_s.XmlElement elem) {
    return StreamingDistributionList(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated')!,
      marker: _s.extractXmlStringValue(elem, 'Marker')!,
      maxItems: _s.extractXmlIntValue(elem, 'MaxItems')!,
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('StreamingDistributionSummary')
          .map((c) => StreamingDistributionSummary.fromXml(c))
          .toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }

  Map<String, dynamic> toJson() {
    final isTruncated = this.isTruncated;
    final marker = this.marker;
    final maxItems = this.maxItems;
    final quantity = this.quantity;
    final items = this.items;
    final nextMarker = this.nextMarker;
    return {
      'IsTruncated': isTruncated,
      'Marker': marker,
      'MaxItems': maxItems,
      'Quantity': quantity,
      if (items != null) 'Items': items,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class StreamingDistributionNotDisabled implements _s.AwsException {
  final String? message;

  StreamingDistributionNotDisabled({
    this.message,
  });

  factory StreamingDistributionNotDisabled.fromJson(Map<String, dynamic> json) {
    return StreamingDistributionNotDisabled(
      message: json['Message'] as String?,
    );
  }

  factory StreamingDistributionNotDisabled.fromXml(_s.XmlElement elem) {
    return StreamingDistributionNotDisabled(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// A summary of the information for an Amazon CloudFront streaming
/// distribution.
class StreamingDistributionSummary {
  /// The ARN (Amazon Resource Name) for the streaming distribution. For example:
  /// <code>arn:aws:cloudfront::123456789012:streaming-distribution/EDFDVBD632BHDS5</code>,
  /// where <code>123456789012</code> is your AWS account ID.
  final String arn;

  /// A complex type that contains information about CNAMEs (alternate domain
  /// names), if any, for this streaming distribution.
  final Aliases aliases;

  /// The comment originally specified when this distribution was created.
  final String comment;

  /// The domain name corresponding to the distribution. For example:
  /// <code>d604721fxaaqy9.cloudfront.net</code>.
  final String domainName;

  /// Whether the distribution is enabled to accept end user requests for content.
  final bool enabled;

  /// The identifier for the distribution. For example:
  /// <code>EDFDVBD632BHDS5</code>.
  final String id;

  /// The date and time the distribution was last modified.
  final DateTime lastModifiedTime;
  final PriceClass priceClass;

  /// A complex type that contains information about the Amazon S3 bucket from
  /// which you want CloudFront to get your media files for distribution.
  final S3Origin s3Origin;

  /// Indicates the current status of the distribution. When the status is
  /// <code>Deployed</code>, the distribution's information is fully propagated
  /// throughout the Amazon CloudFront system.
  final String status;

  /// A complex type that specifies the AWS accounts, if any, that you want to
  /// allow to create signed URLs for private content. If you want to require
  /// signed URLs in requests for objects in the target origin that match the
  /// <code>PathPattern</code> for this cache behavior, specify <code>true</code>
  /// for <code>Enabled</code>, and specify the applicable values for
  /// <code>Quantity</code> and <code>Items</code>.If you don't want to require
  /// signed URLs in requests for objects that match <code>PathPattern</code>,
  /// specify <code>false</code> for <code>Enabled</code> and <code>0</code> for
  /// <code>Quantity</code>. Omit <code>Items</code>. To add, change, or remove
  /// one or more trusted signers, change <code>Enabled</code> to
  /// <code>true</code> (if it's currently <code>false</code>), change
  /// <code>Quantity</code> as applicable, and specify all of the trusted signers
  /// that you want to include in the updated distribution.
  final TrustedSigners trustedSigners;

  StreamingDistributionSummary({
    required this.arn,
    required this.aliases,
    required this.comment,
    required this.domainName,
    required this.enabled,
    required this.id,
    required this.lastModifiedTime,
    required this.priceClass,
    required this.s3Origin,
    required this.status,
    required this.trustedSigners,
  });

  factory StreamingDistributionSummary.fromJson(Map<String, dynamic> json) {
    return StreamingDistributionSummary(
      arn: json['ARN'] as String,
      aliases: Aliases.fromJson(json['Aliases'] as Map<String, dynamic>),
      comment: json['Comment'] as String,
      domainName: json['DomainName'] as String,
      enabled: json['Enabled'] as bool,
      id: json['Id'] as String,
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['LastModifiedTime'] as Object),
      priceClass: (json['PriceClass'] as String).toPriceClass(),
      s3Origin: S3Origin.fromJson(json['S3Origin'] as Map<String, dynamic>),
      status: json['Status'] as String,
      trustedSigners: TrustedSigners.fromJson(
          json['TrustedSigners'] as Map<String, dynamic>),
    );
  }

  factory StreamingDistributionSummary.fromXml(_s.XmlElement elem) {
    return StreamingDistributionSummary(
      arn: _s.extractXmlStringValue(elem, 'ARN')!,
      aliases: Aliases.fromXml(_s.extractXmlChild(elem, 'Aliases')!),
      comment: _s.extractXmlStringValue(elem, 'Comment')!,
      domainName: _s.extractXmlStringValue(elem, 'DomainName')!,
      enabled: _s.extractXmlBoolValue(elem, 'Enabled')!,
      id: _s.extractXmlStringValue(elem, 'Id')!,
      lastModifiedTime: _s.extractXmlDateTimeValue(elem, 'LastModifiedTime')!,
      priceClass: _s.extractXmlStringValue(elem, 'PriceClass')!.toPriceClass(),
      s3Origin: S3Origin.fromXml(_s.extractXmlChild(elem, 'S3Origin')!),
      status: _s.extractXmlStringValue(elem, 'Status')!,
      trustedSigners:
          TrustedSigners.fromXml(_s.extractXmlChild(elem, 'TrustedSigners')!),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final aliases = this.aliases;
    final comment = this.comment;
    final domainName = this.domainName;
    final enabled = this.enabled;
    final id = this.id;
    final lastModifiedTime = this.lastModifiedTime;
    final priceClass = this.priceClass;
    final s3Origin = this.s3Origin;
    final status = this.status;
    final trustedSigners = this.trustedSigners;
    return {
      'ARN': arn,
      'Aliases': aliases,
      'Comment': comment,
      'DomainName': domainName,
      'Enabled': enabled,
      'Id': id,
      'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      'PriceClass': priceClass.toValue(),
      'S3Origin': s3Origin,
      'Status': status,
      'TrustedSigners': trustedSigners,
    };
  }
}

/// A complex type that controls whether access logs are written for this
/// streaming distribution.
class StreamingLoggingConfig {
  /// The Amazon S3 bucket to store the access logs in, for example,
  /// <code>myawslogbucket.s3.amazonaws.com</code>.
  final String bucket;

  /// Specifies whether you want CloudFront to save access logs to an Amazon S3
  /// bucket. If you do not want to enable logging when you create a streaming
  /// distribution or if you want to disable logging for an existing streaming
  /// distribution, specify <code>false</code> for <code>Enabled</code>, and
  /// specify <code>empty Bucket</code> and <code>Prefix</code> elements. If you
  /// specify <code>false</code> for <code>Enabled</code> but you specify values
  /// for <code>Bucket</code> and <code>Prefix</code>, the values are
  /// automatically deleted.
  final bool enabled;

  /// An optional string that you want CloudFront to prefix to the access log
  /// <code>filenames</code> for this streaming distribution, for example,
  /// <code>myprefix/</code>. If you want to enable logging, but you do not want
  /// to specify a prefix, you still must include an empty <code>Prefix</code>
  /// element in the <code>Logging</code> element.
  final String prefix;

  StreamingLoggingConfig({
    required this.bucket,
    required this.enabled,
    required this.prefix,
  });

  factory StreamingLoggingConfig.fromJson(Map<String, dynamic> json) {
    return StreamingLoggingConfig(
      bucket: json['Bucket'] as String,
      enabled: json['Enabled'] as bool,
      prefix: json['Prefix'] as String,
    );
  }

  factory StreamingLoggingConfig.fromXml(_s.XmlElement elem) {
    return StreamingLoggingConfig(
      bucket: _s.extractXmlStringValue(elem, 'Bucket')!,
      enabled: _s.extractXmlBoolValue(elem, 'Enabled')!,
      prefix: _s.extractXmlStringValue(elem, 'Prefix')!,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final enabled = this.enabled;
    final prefix = this.prefix;
    return {
      'Bucket': bucket,
      'Enabled': enabled,
      'Prefix': prefix,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final bucket = this.bucket;
    final enabled = this.enabled;
    final prefix = this.prefix;
    final $children = <_s.XmlNode>[
      _s.encodeXmlBoolValue('Enabled', enabled),
      _s.encodeXmlStringValue('Bucket', bucket),
      _s.encodeXmlStringValue('Prefix', prefix),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains <code>Tag</code> key and <code>Tag</code>
/// value.
class Tag {
  /// A string that contains <code>Tag</code> key.
  ///
  /// The string length should be between 1 and 128 characters. Valid characters
  /// include <code>a-z</code>, <code>A-Z</code>, <code>0-9</code>, space, and the
  /// special characters <code>_ - . : / = + @</code>.
  final String key;

  /// A string that contains an optional <code>Tag</code> value.
  ///
  /// The string length should be between 0 and 256 characters. Valid characters
  /// include <code>a-z</code>, <code>A-Z</code>, <code>0-9</code>, space, and the
  /// special characters <code>_ - . : / = + @</code>.
  final String? value;

  Tag({
    required this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String?,
    );
  }

  factory Tag.fromXml(_s.XmlElement elem) {
    return Tag(
      key: _s.extractXmlStringValue(elem, 'Key')!,
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      if (value != null) 'Value': value,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final key = this.key;
    final value = this.value;
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Key', key),
      if (value != null) _s.encodeXmlStringValue('Value', value),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains zero or more <code>Tag</code> elements.
class TagKeys {
  /// A complex type that contains <code>Tag</code> key elements.
  final List<String>? items;

  TagKeys({
    this.items,
  });

  factory TagKeys.fromJson(Map<String, dynamic> json) {
    return TagKeys(
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    return {
      if (items != null) 'Items': items,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final items = this.items;
    final $children = <_s.XmlNode>[
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => _s.encodeXmlStringValue('Key', e))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// A complex type that contains zero or more <code>Tag</code> elements.
class Tags {
  /// A complex type that contains <code>Tag</code> elements.
  final List<Tag>? items;

  Tags({
    this.items,
  });

  factory Tags.fromJson(Map<String, dynamic> json) {
    return Tags(
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory Tags.fromXml(_s.XmlElement elem) {
    return Tags(
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) =>
          elem.findElements('Tag').map((c) => Tag.fromXml(c)).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    return {
      if (items != null) 'Items': items,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final items = this.items;
    final $children = <_s.XmlNode>[
      if (items != null)
        _s.XmlElement(
            _s.XmlName('Items'), [], items.map((e) => e.toXml('Tag'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// You cannot create more cache behaviors for the distribution.
class TooManyCacheBehaviors implements _s.AwsException {
  final String? message;

  TooManyCacheBehaviors({
    this.message,
  });

  factory TooManyCacheBehaviors.fromJson(Map<String, dynamic> json) {
    return TooManyCacheBehaviors(
      message: json['Message'] as String?,
    );
  }

  factory TooManyCacheBehaviors.fromXml(_s.XmlElement elem) {
    return TooManyCacheBehaviors(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// You cannot create anymore custom SSL/TLS certificates.
class TooManyCertificates implements _s.AwsException {
  final String? message;

  TooManyCertificates({
    this.message,
  });

  factory TooManyCertificates.fromJson(Map<String, dynamic> json) {
    return TooManyCertificates(
      message: json['Message'] as String?,
    );
  }

  factory TooManyCertificates.fromXml(_s.XmlElement elem) {
    return TooManyCertificates(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// Processing your request would cause you to exceed the maximum number of
/// origin access identities allowed.
class TooManyCloudFrontOriginAccessIdentities implements _s.AwsException {
  final String? message;

  TooManyCloudFrontOriginAccessIdentities({
    this.message,
  });

  factory TooManyCloudFrontOriginAccessIdentities.fromJson(
      Map<String, dynamic> json) {
    return TooManyCloudFrontOriginAccessIdentities(
      message: json['Message'] as String?,
    );
  }

  factory TooManyCloudFrontOriginAccessIdentities.fromXml(_s.XmlElement elem) {
    return TooManyCloudFrontOriginAccessIdentities(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// Your request contains more cookie names in the whitelist than are allowed
/// per cache behavior.
class TooManyCookieNamesInWhiteList implements _s.AwsException {
  final String? message;

  TooManyCookieNamesInWhiteList({
    this.message,
  });

  factory TooManyCookieNamesInWhiteList.fromJson(Map<String, dynamic> json) {
    return TooManyCookieNamesInWhiteList(
      message: json['Message'] as String?,
    );
  }

  factory TooManyCookieNamesInWhiteList.fromXml(_s.XmlElement elem) {
    return TooManyCookieNamesInWhiteList(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// Your request contains more CNAMEs than are allowed per distribution.
class TooManyDistributionCNAMEs implements _s.AwsException {
  final String? message;

  TooManyDistributionCNAMEs({
    this.message,
  });

  factory TooManyDistributionCNAMEs.fromJson(Map<String, dynamic> json) {
    return TooManyDistributionCNAMEs(
      message: json['Message'] as String?,
    );
  }

  factory TooManyDistributionCNAMEs.fromXml(_s.XmlElement elem) {
    return TooManyDistributionCNAMEs(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// Processing your request would cause you to exceed the maximum number of
/// distributions allowed.
class TooManyDistributions implements _s.AwsException {
  final String? message;

  TooManyDistributions({
    this.message,
  });

  factory TooManyDistributions.fromJson(Map<String, dynamic> json) {
    return TooManyDistributions(
      message: json['Message'] as String?,
    );
  }

  factory TooManyDistributions.fromXml(_s.XmlElement elem) {
    return TooManyDistributions(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// Processing your request would cause the maximum number of distributions with
/// Lambda function associations per owner to be exceeded.
class TooManyDistributionsWithLambdaAssociations implements _s.AwsException {
  final String? message;

  TooManyDistributionsWithLambdaAssociations({
    this.message,
  });

  factory TooManyDistributionsWithLambdaAssociations.fromJson(
      Map<String, dynamic> json) {
    return TooManyDistributionsWithLambdaAssociations(
      message: json['Message'] as String?,
    );
  }

  factory TooManyDistributionsWithLambdaAssociations.fromXml(
      _s.XmlElement elem) {
    return TooManyDistributionsWithLambdaAssociations(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class TooManyHeadersInForwardedValues implements _s.AwsException {
  final String? message;

  TooManyHeadersInForwardedValues({
    this.message,
  });

  factory TooManyHeadersInForwardedValues.fromJson(Map<String, dynamic> json) {
    return TooManyHeadersInForwardedValues(
      message: json['Message'] as String?,
    );
  }

  factory TooManyHeadersInForwardedValues.fromXml(_s.XmlElement elem) {
    return TooManyHeadersInForwardedValues(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// You have exceeded the maximum number of allowable InProgress invalidation
/// batch requests, or invalidation objects.
class TooManyInvalidationsInProgress implements _s.AwsException {
  final String? message;

  TooManyInvalidationsInProgress({
    this.message,
  });

  factory TooManyInvalidationsInProgress.fromJson(Map<String, dynamic> json) {
    return TooManyInvalidationsInProgress(
      message: json['Message'] as String?,
    );
  }

  factory TooManyInvalidationsInProgress.fromXml(_s.XmlElement elem) {
    return TooManyInvalidationsInProgress(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// Your request contains more Lambda function associations than are allowed per
/// distribution.
class TooManyLambdaFunctionAssociations implements _s.AwsException {
  final String? message;

  TooManyLambdaFunctionAssociations({
    this.message,
  });

  factory TooManyLambdaFunctionAssociations.fromJson(
      Map<String, dynamic> json) {
    return TooManyLambdaFunctionAssociations(
      message: json['Message'] as String?,
    );
  }

  factory TooManyLambdaFunctionAssociations.fromXml(_s.XmlElement elem) {
    return TooManyLambdaFunctionAssociations(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class TooManyOriginCustomHeaders implements _s.AwsException {
  final String? message;

  TooManyOriginCustomHeaders({
    this.message,
  });

  factory TooManyOriginCustomHeaders.fromJson(Map<String, dynamic> json) {
    return TooManyOriginCustomHeaders(
      message: json['Message'] as String?,
    );
  }

  factory TooManyOriginCustomHeaders.fromXml(_s.XmlElement elem) {
    return TooManyOriginCustomHeaders(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// You cannot create more origins for the distribution.
class TooManyOrigins implements _s.AwsException {
  final String? message;

  TooManyOrigins({
    this.message,
  });

  factory TooManyOrigins.fromJson(Map<String, dynamic> json) {
    return TooManyOrigins(
      message: json['Message'] as String?,
    );
  }

  factory TooManyOrigins.fromXml(_s.XmlElement elem) {
    return TooManyOrigins(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class TooManyQueryStringParameters implements _s.AwsException {
  final String? message;

  TooManyQueryStringParameters({
    this.message,
  });

  factory TooManyQueryStringParameters.fromJson(Map<String, dynamic> json) {
    return TooManyQueryStringParameters(
      message: json['Message'] as String?,
    );
  }

  factory TooManyQueryStringParameters.fromXml(_s.XmlElement elem) {
    return TooManyQueryStringParameters(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

class TooManyStreamingDistributionCNAMEs implements _s.AwsException {
  final String? message;

  TooManyStreamingDistributionCNAMEs({
    this.message,
  });

  factory TooManyStreamingDistributionCNAMEs.fromJson(
      Map<String, dynamic> json) {
    return TooManyStreamingDistributionCNAMEs(
      message: json['Message'] as String?,
    );
  }

  factory TooManyStreamingDistributionCNAMEs.fromXml(_s.XmlElement elem) {
    return TooManyStreamingDistributionCNAMEs(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// Processing your request would cause you to exceed the maximum number of
/// streaming distributions allowed.
class TooManyStreamingDistributions implements _s.AwsException {
  final String? message;

  TooManyStreamingDistributions({
    this.message,
  });

  factory TooManyStreamingDistributions.fromJson(Map<String, dynamic> json) {
    return TooManyStreamingDistributions(
      message: json['Message'] as String?,
    );
  }

  factory TooManyStreamingDistributions.fromXml(_s.XmlElement elem) {
    return TooManyStreamingDistributions(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// Your request contains more trusted signers than are allowed per
/// distribution.
class TooManyTrustedSigners implements _s.AwsException {
  final String? message;

  TooManyTrustedSigners({
    this.message,
  });

  factory TooManyTrustedSigners.fromJson(Map<String, dynamic> json) {
    return TooManyTrustedSigners(
      message: json['Message'] as String?,
    );
  }

  factory TooManyTrustedSigners.fromXml(_s.XmlElement elem) {
    return TooManyTrustedSigners(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// One or more of your trusted signers do not exist.
class TrustedSignerDoesNotExist implements _s.AwsException {
  final String? message;

  TrustedSignerDoesNotExist({
    this.message,
  });

  factory TrustedSignerDoesNotExist.fromJson(Map<String, dynamic> json) {
    return TrustedSignerDoesNotExist(
      message: json['Message'] as String?,
    );
  }

  factory TrustedSignerDoesNotExist.fromXml(_s.XmlElement elem) {
    return TrustedSignerDoesNotExist(
      message: _s.extractXmlStringValue(elem, 'Message'),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// A complex type that specifies the AWS accounts, if any, that you want to
/// allow to create signed URLs for private content.
///
/// If you want to require signed URLs in requests for objects in the target
/// origin that match the <code>PathPattern</code> for this cache behavior,
/// specify <code>true</code> for <code>Enabled</code>, and specify the
/// applicable values for <code>Quantity</code> and <code>Items</code>. For more
/// information, see <a
/// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving
/// Private Content through CloudFront</a> in the <i>Amazon Amazon CloudFront
/// Developer Guide</i>.
///
/// If you don't want to require signed URLs in requests for objects that match
/// <code>PathPattern</code>, specify <code>false</code> for
/// <code>Enabled</code> and <code>0</code> for <code>Quantity</code>. Omit
/// <code>Items</code>.
///
/// To add, change, or remove one or more trusted signers, change
/// <code>Enabled</code> to <code>true</code> (if it's currently
/// <code>false</code>), change <code>Quantity</code> as applicable, and specify
/// all of the trusted signers that you want to include in the updated
/// distribution.
///
/// For more information about updating the distribution configuration, see
/// <a>DistributionConfig</a> .
class TrustedSigners {
  /// Specifies whether you want to require viewers to use signed URLs to access
  /// the files specified by <code>PathPattern</code> and
  /// <code>TargetOriginId</code>.
  final bool enabled;

  /// The number of trusted signers for this cache behavior.
  final int quantity;

  /// <b>Optional</b>: A complex type that contains trusted signers for this cache
  /// behavior. If <code>Quantity</code> is <code>0</code>, you can omit
  /// <code>Items</code>.
  final List<String>? items;

  TrustedSigners({
    required this.enabled,
    required this.quantity,
    this.items,
  });

  factory TrustedSigners.fromJson(Map<String, dynamic> json) {
    return TrustedSigners(
      enabled: json['Enabled'] as bool,
      quantity: json['Quantity'] as int,
      items: (json['Items'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  factory TrustedSigners.fromXml(_s.XmlElement elem) {
    return TrustedSigners(
      enabled: _s.extractXmlBoolValue(elem, 'Enabled')!,
      quantity: _s.extractXmlIntValue(elem, 'Quantity')!,
      items: _s.extractXmlChild(elem, 'Items')?.let(
          (elem) => _s.extractXmlStringListValues(elem, 'AwsAccountNumber')),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final quantity = this.quantity;
    final items = this.items;
    return {
      'Enabled': enabled,
      'Quantity': quantity,
      if (items != null) 'Items': items,
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final enabled = this.enabled;
    final quantity = this.quantity;
    final items = this.items;
    final $children = <_s.XmlNode>[
      _s.encodeXmlBoolValue('Enabled', enabled),
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => _s.encodeXmlStringValue('AwsAccountNumber', e))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

/// The returned result of the corresponding request.
class UpdateCloudFrontOriginAccessIdentityResult {
  /// The origin access identity's information.
  final CloudFrontOriginAccessIdentity? cloudFrontOriginAccessIdentity;

  /// The current version of the configuration. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  final String? eTag;

  UpdateCloudFrontOriginAccessIdentityResult({
    this.cloudFrontOriginAccessIdentity,
    this.eTag,
  });

  factory UpdateCloudFrontOriginAccessIdentityResult.fromJson(
      Map<String, dynamic> json) {
    return UpdateCloudFrontOriginAccessIdentityResult(
      cloudFrontOriginAccessIdentity: json['CloudFrontOriginAccessIdentity'] !=
              null
          ? CloudFrontOriginAccessIdentity.fromJson(
              json['CloudFrontOriginAccessIdentity'] as Map<String, dynamic>)
          : null,
      eTag: json['ETag'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFrontOriginAccessIdentity = this.cloudFrontOriginAccessIdentity;
    final eTag = this.eTag;
    return {
      if (cloudFrontOriginAccessIdentity != null)
        'CloudFrontOriginAccessIdentity': cloudFrontOriginAccessIdentity,
    };
  }
}

/// The returned result of the corresponding request.
class UpdateDistributionResult {
  /// The distribution's information.
  final Distribution? distribution;

  /// The current version of the configuration. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  final String? eTag;

  UpdateDistributionResult({
    this.distribution,
    this.eTag,
  });

  factory UpdateDistributionResult.fromJson(Map<String, dynamic> json) {
    return UpdateDistributionResult(
      distribution: json['Distribution'] != null
          ? Distribution.fromJson(json['Distribution'] as Map<String, dynamic>)
          : null,
      eTag: json['ETag'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final distribution = this.distribution;
    final eTag = this.eTag;
    return {
      if (distribution != null) 'Distribution': distribution,
    };
  }
}

/// The returned result of the corresponding request.
class UpdateStreamingDistributionResult {
  /// The current version of the configuration. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  final String? eTag;

  /// The streaming distribution's information.
  final StreamingDistribution? streamingDistribution;

  UpdateStreamingDistributionResult({
    this.eTag,
    this.streamingDistribution,
  });

  factory UpdateStreamingDistributionResult.fromJson(
      Map<String, dynamic> json) {
    return UpdateStreamingDistributionResult(
      eTag: json['ETag'] as String?,
      streamingDistribution: json['StreamingDistribution'] != null
          ? StreamingDistribution.fromJson(
              json['StreamingDistribution'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eTag = this.eTag;
    final streamingDistribution = this.streamingDistribution;
    return {
      if (streamingDistribution != null)
        'StreamingDistribution': streamingDistribution,
    };
  }
}

/// A complex type that specifies the following:
///
/// <ul>
/// <li>
/// Which SSL/TLS certificate to use when viewers request objects using HTTPS
/// </li>
/// <li>
/// Whether you want CloudFront to use dedicated IP addresses or SNI when you're
/// using alternate domain names in your object names
/// </li>
/// <li>
/// The minimum protocol version that you want CloudFront to use when
/// communicating with viewers
/// </li>
/// </ul>
/// For more information, see <a
/// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/SecureConnections.html">Using
/// an HTTPS Connection to Access Your Objects</a> in the <i>Amazon Amazon
/// CloudFront Developer Guide</i>.
class ViewerCertificate {
  final String? aCMCertificateArn;

  /// Include one of these values to specify the following:
  ///
  /// <ul>
  /// <li>
  /// Whether you want viewers to use HTTP or HTTPS to request your objects.
  /// </li>
  /// <li>
  /// If you want viewers to use HTTPS, whether you're using an alternate domain
  /// name such as example.com or the CloudFront domain name for your
  /// distribution, such as <code>d111111abcdef8.cloudfront.net</code>.
  /// </li>
  /// <li>
  /// If you're using an alternate domain name, whether AWS Certificate Manager
  /// (ACM) provided the certificate, or you purchased a certificate from a
  /// third-party certificate authority and imported it into ACM or uploaded it to
  /// the IAM certificate store.
  /// </li>
  /// </ul>
  /// You must specify one (and only one) of the three values. Do not specify
  /// <code>false</code> for <code>CloudFrontDefaultCertificate</code>.
  ///
  /// <b>If you want viewers to use HTTP to request your objects</b>: Specify the
  /// following value:
  ///
  /// <code>&lt;CloudFrontDefaultCertificate&gt;true&lt;CloudFrontDefaultCertificate&gt;</code>
  ///
  /// In addition, specify <code>allow-all</code> for
  /// <code>ViewerProtocolPolicy</code> for all of your cache behaviors.
  ///
  /// <b>If you want viewers to use HTTPS to request your objects</b>: Choose the
  /// type of certificate that you want to use based on whether you're using an
  /// alternate domain name for your objects or the CloudFront domain name:
  ///
  /// <ul>
  /// <li>
  /// <b>If you're using an alternate domain name, such as example.com</b>:
  /// Specify one of the following values, depending on whether ACM provided your
  /// certificate or you purchased your certificate from third-party certificate
  /// authority:
  ///
  /// <ul>
  /// <li>
  /// <code>&lt;ACMCertificateArn&gt;ARN for ACM SSL/TLS
  /// certificate&lt;ACMCertificateArn&gt;</code> where ARN for ACM SSL/TLS
  /// certificate is the ARN for the ACM SSL/TLS certificate that you want to use
  /// for this distribution.
  /// </li>
  /// <li>
  /// <code>&lt;IAMCertificateId&gt;IAM certificate
  /// ID&lt;IAMCertificateId&gt;</code> where IAM certificate ID is the ID that
  /// IAM returned when you added the certificate to the IAM certificate store.
  /// </li>
  /// </ul>
  /// If you specify <code>ACMCertificateArn</code> or
  /// <code>IAMCertificateId</code>, you must also specify a value for
  /// <code>SSLSupportMethod</code>.
  ///
  /// If you choose to use an ACM certificate or a certificate in the IAM
  /// certificate store, we recommend that you use only an alternate domain name
  /// in your object URLs (<code>https://example.com/logo.jpg</code>). If you use
  /// the domain name that is associated with your CloudFront distribution
  /// (<code>https://d111111abcdef8.cloudfront.net/logo.jpg</code>) and the viewer
  /// supports <code>SNI</code>, then CloudFront behaves normally. However, if the
  /// browser does not support SNI, the user's experience depends on the value
  /// that you choose for <code>SSLSupportMethod</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>vip</code>: The viewer displays a warning because there is a mismatch
  /// between the CloudFront domain name and the domain name in your SSL/TLS
  /// certificate.
  /// </li>
  /// <li>
  /// <code>sni-only</code>: CloudFront drops the connection with the browser
  /// without returning the object.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>If you're using the CloudFront domain name for your distribution, such as
  /// <code>d111111abcdef8.cloudfront.net</code> </b>: Specify the following
  /// value:
  ///
  /// <code>
  /// &lt;CloudFrontDefaultCertificate&gt;true&lt;CloudFrontDefaultCertificate&gt;
  /// </code>
  ///
  /// If you want viewers to use HTTPS, you must also specify one of the following
  /// values in your cache behaviors:
  ///
  /// <ul>
  /// <li>
  /// <code> &lt;ViewerProtocolPolicy&gt;https-only&lt;ViewerProtocolPolicy&gt;
  /// </code>
  /// </li>
  /// <li>
  /// <code>
  /// &lt;ViewerProtocolPolicy&gt;redirect-to-https&lt;ViewerProtocolPolicy&gt;
  /// </code>
  /// </li>
  /// </ul>
  /// You can also optionally require that CloudFront use HTTPS to communicate
  /// with your origin by specifying one of the following values for the
  /// applicable origins:
  ///
  /// <ul>
  /// <li>
  /// <code> &lt;OriginProtocolPolicy&gt;https-only&lt;OriginProtocolPolicy&gt;
  /// </code>
  /// </li>
  /// <li>
  /// <code> &lt;OriginProtocolPolicy&gt;match-viewer&lt;OriginProtocolPolicy&gt;
  /// </code>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/SecureConnections.html#CNAMEsAndHTTPS">Using
  /// Alternate Domain Names and HTTPS</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  /// </li>
  /// </ul>
  final String? certificate;

  /// <note>
  /// This field is deprecated. You can use one of the following:
  /// <code>[ACMCertificateArn</code>, <code>IAMCertificateId</code>, or
  /// <code>CloudFrontDefaultCertificate]</code>.
  /// </note>
  final CertificateSource? certificateSource;
  final bool? cloudFrontDefaultCertificate;
  final String? iAMCertificateId;

  /// Specify the minimum version of the SSL/TLS protocol that you want CloudFront
  /// to use for HTTPS connections between viewers and CloudFront:
  /// <code>SSLv3</code> or <code>TLSv1</code>. CloudFront serves your objects
  /// only to viewers that support SSL/TLS version that you specify and later
  /// versions. The <code>TLSv1</code> protocol is more secure, so we recommend
  /// that you specify <code>SSLv3</code> only if your users are using browsers or
  /// devices that don't support <code>TLSv1</code>. Note the following:
  ///
  /// <ul>
  /// <li>
  /// If you specify
  /// &lt;CloudFrontDefaultCertificate&gt;true&lt;CloudFrontDefaultCertificate&gt;,
  /// the minimum SSL protocol version is <code>TLSv1</code> and can't be changed.
  /// </li>
  /// <li>
  /// If you're using a custom certificate (if you specify a value for
  /// <code>ACMCertificateArn</code> or for <code>IAMCertificateId</code>) and if
  /// you're using SNI (if you specify <code>sni-only</code> for
  /// <code>SSLSupportMethod</code>), you must specify <code>TLSv1</code> for
  /// <code>MinimumProtocolVersion</code>.
  /// </li>
  /// </ul>
  final MinimumProtocolVersion? minimumProtocolVersion;

  /// If you specify a value for <code>ACMCertificateArn</code> or for
  /// <code>IAMCertificateId</code>, you must also specify how you want CloudFront
  /// to serve HTTPS requests: using a method that works for all clients or one
  /// that works for most clients:
  ///
  /// <ul>
  /// <li>
  /// <code>vip</code>: CloudFront uses dedicated IP addresses for your content
  /// and can respond to HTTPS requests from any viewer. However, you must request
  /// permission to use this feature, and you incur additional monthly charges.
  /// </li>
  /// <li>
  /// <code>sni-only</code>: CloudFront can respond to HTTPS requests from viewers
  /// that support Server Name Indication (SNI). All modern browsers support SNI,
  /// but some browsers still in use don't support SNI. If some of your users'
  /// browsers don't support SNI, we recommend that you do one of the following:
  ///
  /// <ul>
  /// <li>
  /// Use the <code>vip</code> option (dedicated IP addresses) instead of
  /// <code>sni-only</code>.
  /// </li>
  /// <li>
  /// Use the CloudFront SSL/TLS certificate instead of a custom certificate. This
  /// requires that you use the CloudFront domain name of your distribution in the
  /// URLs for your objects, for example,
  /// <code>https://d111111abcdef8.cloudfront.net/logo.png</code>.
  /// </li>
  /// <li>
  /// If you can control which browser your users use, upgrade the browser to one
  /// that supports SNI.
  /// </li>
  /// <li>
  /// Use HTTP instead of HTTPS.
  /// </li>
  /// </ul> </li>
  /// </ul>
  /// Do not specify a value for <code>SSLSupportMethod</code> if you specified
  /// <code>&lt;CloudFrontDefaultCertificate&gt;true&lt;CloudFrontDefaultCertificate&gt;</code>.
  ///
  /// For more information, see <a
  /// href="http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/SecureConnections.html#CNAMEsAndHTTPS.html">Using
  /// Alternate Domain Names and HTTPS</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  final SSLSupportMethod? sSLSupportMethod;

  ViewerCertificate({
    this.aCMCertificateArn,
    this.certificate,
    this.certificateSource,
    this.cloudFrontDefaultCertificate,
    this.iAMCertificateId,
    this.minimumProtocolVersion,
    this.sSLSupportMethod,
  });

  factory ViewerCertificate.fromJson(Map<String, dynamic> json) {
    return ViewerCertificate(
      aCMCertificateArn: json['ACMCertificateArn'] as String?,
      certificate: json['Certificate'] as String?,
      certificateSource:
          (json['CertificateSource'] as String?)?.toCertificateSource(),
      cloudFrontDefaultCertificate:
          json['CloudFrontDefaultCertificate'] as bool?,
      iAMCertificateId: json['IAMCertificateId'] as String?,
      minimumProtocolVersion: (json['MinimumProtocolVersion'] as String?)
          ?.toMinimumProtocolVersion(),
      sSLSupportMethod:
          (json['SSLSupportMethod'] as String?)?.toSSLSupportMethod(),
    );
  }

  factory ViewerCertificate.fromXml(_s.XmlElement elem) {
    return ViewerCertificate(
      aCMCertificateArn: _s.extractXmlStringValue(elem, 'ACMCertificateArn'),
      certificate: _s.extractXmlStringValue(elem, 'Certificate'),
      certificateSource: _s
          .extractXmlStringValue(elem, 'CertificateSource')
          ?.toCertificateSource(),
      cloudFrontDefaultCertificate:
          _s.extractXmlBoolValue(elem, 'CloudFrontDefaultCertificate'),
      iAMCertificateId: _s.extractXmlStringValue(elem, 'IAMCertificateId'),
      minimumProtocolVersion: _s
          .extractXmlStringValue(elem, 'MinimumProtocolVersion')
          ?.toMinimumProtocolVersion(),
      sSLSupportMethod: _s
          .extractXmlStringValue(elem, 'SSLSupportMethod')
          ?.toSSLSupportMethod(),
    );
  }

  Map<String, dynamic> toJson() {
    final aCMCertificateArn = this.aCMCertificateArn;
    final certificate = this.certificate;
    final certificateSource = this.certificateSource;
    final cloudFrontDefaultCertificate = this.cloudFrontDefaultCertificate;
    final iAMCertificateId = this.iAMCertificateId;
    final minimumProtocolVersion = this.minimumProtocolVersion;
    final sSLSupportMethod = this.sSLSupportMethod;
    return {
      if (aCMCertificateArn != null) 'ACMCertificateArn': aCMCertificateArn,
      if (certificate != null) 'Certificate': certificate,
      if (certificateSource != null)
        'CertificateSource': certificateSource.toValue(),
      if (cloudFrontDefaultCertificate != null)
        'CloudFrontDefaultCertificate': cloudFrontDefaultCertificate,
      if (iAMCertificateId != null) 'IAMCertificateId': iAMCertificateId,
      if (minimumProtocolVersion != null)
        'MinimumProtocolVersion': minimumProtocolVersion.toValue(),
      if (sSLSupportMethod != null)
        'SSLSupportMethod': sSLSupportMethod.toValue(),
    };
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute>? attributes}) {
    final aCMCertificateArn = this.aCMCertificateArn;
    final certificate = this.certificate;
    final certificateSource = this.certificateSource;
    final cloudFrontDefaultCertificate = this.cloudFrontDefaultCertificate;
    final iAMCertificateId = this.iAMCertificateId;
    final minimumProtocolVersion = this.minimumProtocolVersion;
    final sSLSupportMethod = this.sSLSupportMethod;
    final $children = <_s.XmlNode>[
      if (cloudFrontDefaultCertificate != null)
        _s.encodeXmlBoolValue(
            'CloudFrontDefaultCertificate', cloudFrontDefaultCertificate),
      if (iAMCertificateId != null)
        _s.encodeXmlStringValue('IAMCertificateId', iAMCertificateId),
      if (aCMCertificateArn != null)
        _s.encodeXmlStringValue('ACMCertificateArn', aCMCertificateArn),
      if (sSLSupportMethod != null)
        _s.encodeXmlStringValue('SSLSupportMethod', sSLSupportMethod.toValue()),
      if (minimumProtocolVersion != null)
        _s.encodeXmlStringValue(
            'MinimumProtocolVersion', minimumProtocolVersion.toValue()),
      if (certificate != null)
        _s.encodeXmlStringValue('Certificate', certificate),
      if (certificateSource != null)
        _s.encodeXmlStringValue(
            'CertificateSource', certificateSource.toValue()),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children,
    );
  }
}

enum ViewerProtocolPolicy {
  allowAll,
  httpsOnly,
  redirectToHttps,
}

extension on ViewerProtocolPolicy {
  String toValue() {
    switch (this) {
      case ViewerProtocolPolicy.allowAll:
        return 'allow-all';
      case ViewerProtocolPolicy.httpsOnly:
        return 'https-only';
      case ViewerProtocolPolicy.redirectToHttps:
        return 'redirect-to-https';
    }
  }
}

extension on String {
  ViewerProtocolPolicy toViewerProtocolPolicy() {
    switch (this) {
      case 'allow-all':
        return ViewerProtocolPolicy.allowAll;
      case 'https-only':
        return ViewerProtocolPolicy.httpsOnly;
      case 'redirect-to-https':
        return ViewerProtocolPolicy.redirectToHttps;
    }
    throw Exception('$this is not known in enum ViewerProtocolPolicy');
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDenied': (type, message) => AccessDenied(message: message),
  'BatchTooLarge': (type, message) => BatchTooLarge(message: message),
  'CNAMEAlreadyExists': (type, message) => CNAMEAlreadyExists(message: message),
  'CloudFrontOriginAccessIdentityAlreadyExists': (type, message) =>
      CloudFrontOriginAccessIdentityAlreadyExists(message: message),
  'CloudFrontOriginAccessIdentityInUse': (type, message) =>
      CloudFrontOriginAccessIdentityInUse(message: message),
  'DistributionAlreadyExists': (type, message) =>
      DistributionAlreadyExists(message: message),
  'DistributionNotDisabled': (type, message) =>
      DistributionNotDisabled(message: message),
  'IllegalUpdate': (type, message) => IllegalUpdate(message: message),
  'InconsistentQuantities': (type, message) =>
      InconsistentQuantities(message: message),
  'InvalidArgument': (type, message) => InvalidArgument(message: message),
  'InvalidDefaultRootObject': (type, message) =>
      InvalidDefaultRootObject(message: message),
  'InvalidErrorCode': (type, message) => InvalidErrorCode(message: message),
  'InvalidForwardCookies': (type, message) =>
      InvalidForwardCookies(message: message),
  'InvalidGeoRestrictionParameter': (type, message) =>
      InvalidGeoRestrictionParameter(message: message),
  'InvalidHeadersForS3Origin': (type, message) =>
      InvalidHeadersForS3Origin(message: message),
  'InvalidIfMatchVersion': (type, message) =>
      InvalidIfMatchVersion(message: message),
  'InvalidLambdaFunctionAssociation': (type, message) =>
      InvalidLambdaFunctionAssociation(message: message),
  'InvalidLocationCode': (type, message) =>
      InvalidLocationCode(message: message),
  'InvalidMinimumProtocolVersion': (type, message) =>
      InvalidMinimumProtocolVersion(message: message),
  'InvalidOrigin': (type, message) => InvalidOrigin(message: message),
  'InvalidOriginAccessIdentity': (type, message) =>
      InvalidOriginAccessIdentity(message: message),
  'InvalidProtocolSettings': (type, message) =>
      InvalidProtocolSettings(message: message),
  'InvalidQueryStringParameters': (type, message) =>
      InvalidQueryStringParameters(message: message),
  'InvalidRelativePath': (type, message) =>
      InvalidRelativePath(message: message),
  'InvalidRequiredProtocol': (type, message) =>
      InvalidRequiredProtocol(message: message),
  'InvalidResponseCode': (type, message) =>
      InvalidResponseCode(message: message),
  'InvalidTTLOrder': (type, message) => InvalidTTLOrder(message: message),
  'InvalidTagging': (type, message) => InvalidTagging(message: message),
  'InvalidViewerCertificate': (type, message) =>
      InvalidViewerCertificate(message: message),
  'InvalidWebACLId': (type, message) => InvalidWebACLId(message: message),
  'MissingBody': (type, message) => MissingBody(message: message),
  'NoSuchCloudFrontOriginAccessIdentity': (type, message) =>
      NoSuchCloudFrontOriginAccessIdentity(message: message),
  'NoSuchDistribution': (type, message) => NoSuchDistribution(message: message),
  'NoSuchInvalidation': (type, message) => NoSuchInvalidation(message: message),
  'NoSuchOrigin': (type, message) => NoSuchOrigin(message: message),
  'NoSuchResource': (type, message) => NoSuchResource(message: message),
  'NoSuchStreamingDistribution': (type, message) =>
      NoSuchStreamingDistribution(message: message),
  'PreconditionFailed': (type, message) => PreconditionFailed(message: message),
  'StreamingDistributionAlreadyExists': (type, message) =>
      StreamingDistributionAlreadyExists(message: message),
  'StreamingDistributionNotDisabled': (type, message) =>
      StreamingDistributionNotDisabled(message: message),
  'TooManyCacheBehaviors': (type, message) =>
      TooManyCacheBehaviors(message: message),
  'TooManyCertificates': (type, message) =>
      TooManyCertificates(message: message),
  'TooManyCloudFrontOriginAccessIdentities': (type, message) =>
      TooManyCloudFrontOriginAccessIdentities(message: message),
  'TooManyCookieNamesInWhiteList': (type, message) =>
      TooManyCookieNamesInWhiteList(message: message),
  'TooManyDistributionCNAMEs': (type, message) =>
      TooManyDistributionCNAMEs(message: message),
  'TooManyDistributions': (type, message) =>
      TooManyDistributions(message: message),
  'TooManyDistributionsWithLambdaAssociations': (type, message) =>
      TooManyDistributionsWithLambdaAssociations(message: message),
  'TooManyHeadersInForwardedValues': (type, message) =>
      TooManyHeadersInForwardedValues(message: message),
  'TooManyInvalidationsInProgress': (type, message) =>
      TooManyInvalidationsInProgress(message: message),
  'TooManyLambdaFunctionAssociations': (type, message) =>
      TooManyLambdaFunctionAssociations(message: message),
  'TooManyOriginCustomHeaders': (type, message) =>
      TooManyOriginCustomHeaders(message: message),
  'TooManyOrigins': (type, message) => TooManyOrigins(message: message),
  'TooManyQueryStringParameters': (type, message) =>
      TooManyQueryStringParameters(message: message),
  'TooManyStreamingDistributionCNAMEs': (type, message) =>
      TooManyStreamingDistributionCNAMEs(message: message),
  'TooManyStreamingDistributions': (type, message) =>
      TooManyStreamingDistributions(message: message),
  'TooManyTrustedSigners': (type, message) =>
      TooManyTrustedSigners(message: message),
  'TrustedSignerDoesNotExist': (type, message) =>
      TrustedSignerDoesNotExist(message: message),
};

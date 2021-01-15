// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import '../../shared/shared.dart' as _s;
import '../../shared/shared.dart'
    show Uint8ListConverter, Uint8ListListConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

/// This is the <i>Amazon CloudFront API Reference</i>. This guide is for
/// developers who need detailed information about CloudFront API actions, data
/// types, and errors. For detailed information about CloudFront features, see
/// the <i>Amazon CloudFront Developer Guide</i>.
class CloudFront {
  final _s.RestXmlProtocol _protocol;
  CloudFront({
    String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestXmlProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'cloudfront',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a cache policy.
  ///
  /// After you create a cache policy, you can attach it to one or more cache
  /// behaviors. When it’s attached to a cache behavior, the cache policy
  /// determines the following:
  ///
  /// <ul>
  /// <li>
  /// The values that CloudFront includes in the <i>cache key</i>. These values
  /// can include HTTP headers, cookies, and URL query strings. CloudFront uses
  /// the cache key to find an object in its cache that it can return to the
  /// viewer.
  /// </li>
  /// <li>
  /// The default, minimum, and maximum time to live (TTL) values that you want
  /// objects to stay in the CloudFront cache.
  /// </li>
  /// </ul>
  /// The headers, cookies, and query strings that are included in the cache key
  /// are automatically included in requests that CloudFront sends to the
  /// origin. CloudFront sends a request when it can’t find an object in its
  /// cache that matches the request’s cache key. If you want to send values to
  /// the origin but <i>not</i> include them in the cache key, use
  /// <code>OriginRequestPolicy</code>.
  ///
  /// For more information about cache policies, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html">Controlling
  /// the cache key</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// May throw [AccessDenied].
  /// May throw [InconsistentQuantities].
  /// May throw [InvalidArgument].
  /// May throw [CachePolicyAlreadyExists].
  /// May throw [TooManyCachePolicies].
  /// May throw [TooManyHeadersInCachePolicy].
  /// May throw [TooManyCookiesInCachePolicy].
  /// May throw [TooManyQueryStringsInCachePolicy].
  ///
  /// Parameter [cachePolicyConfig] :
  /// A cache policy configuration.
  Future<CreateCachePolicyResult> createCachePolicy2020_05_31({
    @_s.required CachePolicyConfig cachePolicyConfig,
  }) async {
    ArgumentError.checkNotNull(cachePolicyConfig, 'cachePolicyConfig');
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2020-05-31/cache-policy',
      payload: cachePolicyConfig.toXml('CachePolicyConfig'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateCachePolicyResult(
      cachePolicy: CachePolicy.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
      location: _s.extractHeaderStringValue($result.headers, 'Location'),
    );
  }

  /// Creates a new origin access identity. If you're using Amazon S3 for your
  /// origin, you can use an origin access identity to require users to access
  /// your content using a CloudFront URL instead of the Amazon S3 URL. For more
  /// information about how to use origin access identities, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving
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
      createCloudFrontOriginAccessIdentity2020_05_31({
    @_s.required
        CloudFrontOriginAccessIdentityConfig
            cloudFrontOriginAccessIdentityConfig,
  }) async {
    ArgumentError.checkNotNull(cloudFrontOriginAccessIdentityConfig,
        'cloudFrontOriginAccessIdentityConfig');
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2020-05-31/origin-access-identity/cloudfront',
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

  /// Creates a new web distribution. You create a CloudFront distribution to
  /// tell CloudFront where you want content to be delivered from, and the
  /// details about how to track and manage content delivery. Send a
  /// <code>POST</code> request to the <code>/<i>CloudFront API
  /// version</i>/distribution</code>/<code>distribution ID</code> resource.
  /// <important>
  /// When you update a distribution, there are more required fields than when
  /// you create a distribution. When you update your distribution by using <a
  /// href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html">UpdateDistribution</a>,
  /// follow the steps included in the documentation to get the current
  /// configuration and then make your updates. This helps to make sure that you
  /// include all of the required fields. To view a summary, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-overview-required-fields.html">Required
  /// Fields for Create Distribution and Update Distribution</a> in the
  /// <i>Amazon CloudFront Developer Guide</i>.
  /// </important>
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
  /// May throw [TooManyOriginGroupsPerDistribution].
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
  /// May throw [TooManyDistributionsWithSingleFunctionARN].
  /// May throw [TooManyLambdaFunctionAssociations].
  /// May throw [InvalidLambdaFunctionAssociation].
  /// May throw [InvalidOriginReadTimeout].
  /// May throw [InvalidOriginKeepaliveTimeout].
  /// May throw [NoSuchFieldLevelEncryptionConfig].
  /// May throw [IllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior].
  /// May throw [TooManyDistributionsAssociatedToFieldLevelEncryptionConfig].
  /// May throw [NoSuchCachePolicy].
  /// May throw [TooManyDistributionsAssociatedToCachePolicy].
  /// May throw [NoSuchOriginRequestPolicy].
  /// May throw [TooManyDistributionsAssociatedToOriginRequestPolicy].
  /// May throw [TooManyDistributionsAssociatedToKeyGroup].
  /// May throw [TooManyKeyGroupsAssociatedToDistribution].
  /// May throw [TrustedKeyGroupDoesNotExist].
  ///
  /// Parameter [distributionConfig] :
  /// The distribution's configuration information.
  Future<CreateDistributionResult> createDistribution2020_05_31({
    @_s.required DistributionConfig distributionConfig,
  }) async {
    ArgumentError.checkNotNull(distributionConfig, 'distributionConfig');
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2020-05-31/distribution',
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
  /// May throw [TooManyOriginGroupsPerDistribution].
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
  /// May throw [TooManyDistributionsWithSingleFunctionARN].
  /// May throw [TooManyLambdaFunctionAssociations].
  /// May throw [InvalidLambdaFunctionAssociation].
  /// May throw [InvalidOriginReadTimeout].
  /// May throw [InvalidOriginKeepaliveTimeout].
  /// May throw [NoSuchFieldLevelEncryptionConfig].
  /// May throw [IllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior].
  /// May throw [TooManyDistributionsAssociatedToFieldLevelEncryptionConfig].
  /// May throw [NoSuchCachePolicy].
  /// May throw [TooManyDistributionsAssociatedToCachePolicy].
  /// May throw [NoSuchOriginRequestPolicy].
  /// May throw [TooManyDistributionsAssociatedToOriginRequestPolicy].
  /// May throw [TooManyDistributionsAssociatedToKeyGroup].
  /// May throw [TooManyKeyGroupsAssociatedToDistribution].
  /// May throw [TrustedKeyGroupDoesNotExist].
  ///
  /// Parameter [distributionConfigWithTags] :
  /// The distribution's configuration information.
  Future<CreateDistributionWithTagsResult>
      createDistributionWithTags2020_05_31({
    @_s.required DistributionConfigWithTags distributionConfigWithTags,
  }) async {
    ArgumentError.checkNotNull(
        distributionConfigWithTags, 'distributionConfigWithTags');
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2020-05-31/distribution?WithTags',
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

  /// Create a new field-level encryption configuration.
  ///
  /// May throw [InconsistentQuantities].
  /// May throw [InvalidArgument].
  /// May throw [NoSuchFieldLevelEncryptionProfile].
  /// May throw [FieldLevelEncryptionConfigAlreadyExists].
  /// May throw [TooManyFieldLevelEncryptionConfigs].
  /// May throw [TooManyFieldLevelEncryptionQueryArgProfiles].
  /// May throw [TooManyFieldLevelEncryptionContentTypeProfiles].
  /// May throw [QueryArgProfileEmpty].
  ///
  /// Parameter [fieldLevelEncryptionConfig] :
  /// The request to create a new field-level encryption configuration.
  Future<CreateFieldLevelEncryptionConfigResult>
      createFieldLevelEncryptionConfig2020_05_31({
    @_s.required FieldLevelEncryptionConfig fieldLevelEncryptionConfig,
  }) async {
    ArgumentError.checkNotNull(
        fieldLevelEncryptionConfig, 'fieldLevelEncryptionConfig');
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2020-05-31/field-level-encryption',
      payload: fieldLevelEncryptionConfig.toXml('FieldLevelEncryptionConfig'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateFieldLevelEncryptionConfigResult(
      fieldLevelEncryption: FieldLevelEncryption.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
      location: _s.extractHeaderStringValue($result.headers, 'Location'),
    );
  }

  /// Create a field-level encryption profile.
  ///
  /// May throw [InconsistentQuantities].
  /// May throw [InvalidArgument].
  /// May throw [NoSuchPublicKey].
  /// May throw [FieldLevelEncryptionProfileAlreadyExists].
  /// May throw [FieldLevelEncryptionProfileSizeExceeded].
  /// May throw [TooManyFieldLevelEncryptionProfiles].
  /// May throw [TooManyFieldLevelEncryptionEncryptionEntities].
  /// May throw [TooManyFieldLevelEncryptionFieldPatterns].
  ///
  /// Parameter [fieldLevelEncryptionProfileConfig] :
  /// The request to create a field-level encryption profile.
  Future<CreateFieldLevelEncryptionProfileResult>
      createFieldLevelEncryptionProfile2020_05_31({
    @_s.required
        FieldLevelEncryptionProfileConfig fieldLevelEncryptionProfileConfig,
  }) async {
    ArgumentError.checkNotNull(
        fieldLevelEncryptionProfileConfig, 'fieldLevelEncryptionProfileConfig');
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2020-05-31/field-level-encryption-profile',
      payload: fieldLevelEncryptionProfileConfig
          .toXml('FieldLevelEncryptionProfileConfig'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateFieldLevelEncryptionProfileResult(
      fieldLevelEncryptionProfile: FieldLevelEncryptionProfile.fromXml($elem),
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
  Future<CreateInvalidationResult> createInvalidation2020_05_31({
    @_s.required String distributionId,
    @_s.required InvalidationBatch invalidationBatch,
  }) async {
    ArgumentError.checkNotNull(distributionId, 'distributionId');
    ArgumentError.checkNotNull(invalidationBatch, 'invalidationBatch');
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri:
          '/2020-05-31/distribution/${Uri.encodeComponent(distributionId)}/invalidation',
      payload: invalidationBatch.toXml('InvalidationBatch'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateInvalidationResult(
      invalidation: Invalidation.fromXml($elem),
      location: _s.extractHeaderStringValue($result.headers, 'Location'),
    );
  }

  /// Creates a key group that you can use with <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">CloudFront
  /// signed URLs and signed cookies</a>.
  ///
  /// To create a key group, you must specify at least one public key for the
  /// key group. After you create a key group, you can reference it from one or
  /// more cache behaviors. When you reference a key group in a cache behavior,
  /// CloudFront requires signed URLs or signed cookies for all requests that
  /// match the cache behavior. The URLs or cookies must be signed with a
  /// private key whose corresponding public key is in the key group. The signed
  /// URL or cookie contains information about which public key CloudFront
  /// should use to verify the signature. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving
  /// private content</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// May throw [InvalidArgument].
  /// May throw [KeyGroupAlreadyExists].
  /// May throw [TooManyKeyGroups].
  /// May throw [TooManyPublicKeysInKeyGroup].
  ///
  /// Parameter [keyGroupConfig] :
  /// A key group configuration.
  Future<CreateKeyGroupResult> createKeyGroup2020_05_31({
    @_s.required KeyGroupConfig keyGroupConfig,
  }) async {
    ArgumentError.checkNotNull(keyGroupConfig, 'keyGroupConfig');
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2020-05-31/key-group',
      payload: keyGroupConfig.toXml('KeyGroupConfig'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateKeyGroupResult(
      keyGroup: KeyGroup.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
      location: _s.extractHeaderStringValue($result.headers, 'Location'),
    );
  }

  /// Enables additional CloudWatch metrics for the specified CloudFront
  /// distribution. The additional metrics incur an additional cost.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/viewing-cloudfront-metrics.html#monitoring-console.distributions-additional">Viewing
  /// additional CloudFront distribution metrics</a> in the <i>Amazon CloudFront
  /// Developer Guide</i>.
  ///
  /// May throw [AccessDenied].
  /// May throw [NoSuchDistribution].
  ///
  /// Parameter [distributionId] :
  /// The ID of the distribution that you are enabling metrics for.
  ///
  /// Parameter [monitoringSubscription] :
  /// A monitoring subscription. This structure contains information about
  /// whether additional CloudWatch metrics are enabled for a given CloudFront
  /// distribution.
  Future<CreateMonitoringSubscriptionResult>
      createMonitoringSubscription2020_05_31({
    @_s.required String distributionId,
    @_s.required MonitoringSubscription monitoringSubscription,
  }) async {
    ArgumentError.checkNotNull(distributionId, 'distributionId');
    ArgumentError.checkNotNull(
        monitoringSubscription, 'monitoringSubscription');
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri:
          '/2020-05-31/distributions/${Uri.encodeComponent(distributionId)}/monitoring-subscription',
      payload: monitoringSubscription.toXml('MonitoringSubscription'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateMonitoringSubscriptionResult(
      monitoringSubscription: MonitoringSubscription.fromXml($elem),
    );
  }

  /// Creates an origin request policy.
  ///
  /// After you create an origin request policy, you can attach it to one or
  /// more cache behaviors. When it’s attached to a cache behavior, the origin
  /// request policy determines the values that CloudFront includes in requests
  /// that it sends to the origin. Each request that CloudFront sends to the
  /// origin includes the following:
  ///
  /// <ul>
  /// <li>
  /// The request body and the URL path (without the domain name) from the
  /// viewer request.
  /// </li>
  /// <li>
  /// The headers that CloudFront automatically includes in every origin
  /// request, including <code>Host</code>, <code>User-Agent</code>, and
  /// <code>X-Amz-Cf-Id</code>.
  /// </li>
  /// <li>
  /// All HTTP headers, cookies, and URL query strings that are specified in the
  /// cache policy or the origin request policy. These can include items from
  /// the viewer request and, in the case of headers, additional ones that are
  /// added by CloudFront.
  /// </li>
  /// </ul>
  /// CloudFront sends a request when it can’t find a valid object in its cache
  /// that matches the request. If you want to send values to the origin and
  /// also include them in the cache key, use <code>CachePolicy</code>.
  ///
  /// For more information about origin request policies, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-origin-requests.html">Controlling
  /// origin requests</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// May throw [AccessDenied].
  /// May throw [InconsistentQuantities].
  /// May throw [InvalidArgument].
  /// May throw [OriginRequestPolicyAlreadyExists].
  /// May throw [TooManyOriginRequestPolicies].
  /// May throw [TooManyHeadersInOriginRequestPolicy].
  /// May throw [TooManyCookiesInOriginRequestPolicy].
  /// May throw [TooManyQueryStringsInOriginRequestPolicy].
  ///
  /// Parameter [originRequestPolicyConfig] :
  /// An origin request policy configuration.
  Future<CreateOriginRequestPolicyResult> createOriginRequestPolicy2020_05_31({
    @_s.required OriginRequestPolicyConfig originRequestPolicyConfig,
  }) async {
    ArgumentError.checkNotNull(
        originRequestPolicyConfig, 'originRequestPolicyConfig');
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2020-05-31/origin-request-policy',
      payload: originRequestPolicyConfig.toXml('OriginRequestPolicyConfig'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreateOriginRequestPolicyResult(
      originRequestPolicy: OriginRequestPolicy.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
      location: _s.extractHeaderStringValue($result.headers, 'Location'),
    );
  }

  /// Uploads a public key to CloudFront that you can use with <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">signed
  /// URLs and signed cookies</a>, or with <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/field-level-encryption.html">field-level
  /// encryption</a>.
  ///
  /// May throw [PublicKeyAlreadyExists].
  /// May throw [InvalidArgument].
  /// May throw [TooManyPublicKeys].
  ///
  /// Parameter [publicKeyConfig] :
  /// A CloudFront public key configuration.
  Future<CreatePublicKeyResult> createPublicKey2020_05_31({
    @_s.required PublicKeyConfig publicKeyConfig,
  }) async {
    ArgumentError.checkNotNull(publicKeyConfig, 'publicKeyConfig');
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2020-05-31/public-key',
      payload: publicKeyConfig.toXml('PublicKeyConfig'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return CreatePublicKeyResult(
      publicKey: PublicKey.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
      location: _s.extractHeaderStringValue($result.headers, 'Location'),
    );
  }

  /// Creates a real-time log configuration.
  ///
  /// After you create a real-time log configuration, you can attach it to one
  /// or more cache behaviors to send real-time log data to the specified Amazon
  /// Kinesis data stream.
  ///
  /// For more information about real-time log configurations, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/real-time-logs.html">Real-time
  /// logs</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// May throw [RealtimeLogConfigAlreadyExists].
  /// May throw [TooManyRealtimeLogConfigs].
  /// May throw [InvalidArgument].
  /// May throw [AccessDenied].
  ///
  /// Parameter [endPoints] :
  /// Contains information about the Amazon Kinesis data stream where you are
  /// sending real-time log data.
  ///
  /// Parameter [fields] :
  /// A list of fields to include in each real-time log record.
  ///
  /// For more information about fields, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/real-time-logs.html#understand-real-time-log-config-fields">Real-time
  /// log configuration fields</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  ///
  /// Parameter [name] :
  /// A unique name to identify this real-time log configuration.
  ///
  /// Parameter [samplingRate] :
  /// The sampling rate for this real-time log configuration. The sampling rate
  /// determines the percentage of viewer requests that are represented in the
  /// real-time log data. You must provide an integer between 1 and 100,
  /// inclusive.
  Future<CreateRealtimeLogConfigResult> createRealtimeLogConfig2020_05_31({
    @_s.required List<EndPoint> endPoints,
    @_s.required List<String> fields,
    @_s.required String name,
    @_s.required int samplingRate,
  }) async {
    ArgumentError.checkNotNull(endPoints, 'endPoints');
    ArgumentError.checkNotNull(fields, 'fields');
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(samplingRate, 'samplingRate');
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/2020-05-31/realtime-log-config',
      payload: CreateRealtimeLogConfigRequest(
              endPoints: endPoints,
              fields: fields,
              name: name,
              samplingRate: samplingRate)
          .toXml(
        'CreateRealtimeLogConfigRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://cloudfront.amazonaws.com/doc/2020-05-31/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return CreateRealtimeLogConfigResult.fromXml($result.body);
  }

  /// This API is deprecated. Amazon CloudFront is deprecating real-time
  /// messaging protocol (RTMP) distributions on December 31, 2020. For more
  /// information, <a
  /// href="http://forums.aws.amazon.com/ann.jspa?annID=7356">read the
  /// announcement</a> on the Amazon CloudFront discussion forum.
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
      createStreamingDistribution2020_05_31({
    @_s.required StreamingDistributionConfig streamingDistributionConfig,
  }) async {
    ArgumentError.checkNotNull(
        streamingDistributionConfig, 'streamingDistributionConfig');
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2020-05-31/streaming-distribution',
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

  /// This API is deprecated. Amazon CloudFront is deprecating real-time
  /// messaging protocol (RTMP) distributions on December 31, 2020. For more
  /// information, <a
  /// href="http://forums.aws.amazon.com/ann.jspa?annID=7356">read the
  /// announcement</a> on the Amazon CloudFront discussion forum.
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
      createStreamingDistributionWithTags2020_05_31({
    @_s.required
        StreamingDistributionConfigWithTags streamingDistributionConfigWithTags,
  }) async {
    ArgumentError.checkNotNull(streamingDistributionConfigWithTags,
        'streamingDistributionConfigWithTags');
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2020-05-31/streaming-distribution?WithTags',
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

  /// Deletes a cache policy.
  ///
  /// You cannot delete a cache policy if it’s attached to a cache behavior.
  /// First update your distributions to remove the cache policy from all cache
  /// behaviors, then delete the cache policy.
  ///
  /// To delete a cache policy, you must provide the policy’s identifier and
  /// version. To get these values, you can use <code>ListCachePolicies</code>
  /// or <code>GetCachePolicy</code>.
  ///
  /// May throw [AccessDenied].
  /// May throw [InvalidIfMatchVersion].
  /// May throw [NoSuchCachePolicy].
  /// May throw [PreconditionFailed].
  /// May throw [IllegalDelete].
  /// May throw [CachePolicyInUse].
  ///
  /// Parameter [id] :
  /// The unique identifier for the cache policy that you are deleting. To get
  /// the identifier, you can use <code>ListCachePolicies</code>.
  ///
  /// Parameter [ifMatch] :
  /// The version of the cache policy that you are deleting. The version is the
  /// cache policy’s <code>ETag</code> value, which you can get using
  /// <code>ListCachePolicies</code>, <code>GetCachePolicy</code>, or
  /// <code>GetCachePolicyConfig</code>.
  Future<void> deleteCachePolicy2020_05_31({
    @_s.required String id,
    String ifMatch,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    ifMatch?.let((v) => headers['If-Match'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/2020-05-31/cache-policy/${Uri.encodeComponent(id)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
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
  Future<void> deleteCloudFrontOriginAccessIdentity2020_05_31({
    @_s.required String id,
    String ifMatch,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    ifMatch?.let((v) => headers['If-Match'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/2020-05-31/origin-access-identity/cloudfront/${Uri.encodeComponent(id)}',
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
  Future<void> deleteDistribution2020_05_31({
    @_s.required String id,
    String ifMatch,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    ifMatch?.let((v) => headers['If-Match'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/2020-05-31/distribution/${Uri.encodeComponent(id)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Remove a field-level encryption configuration.
  ///
  /// May throw [AccessDenied].
  /// May throw [InvalidIfMatchVersion].
  /// May throw [NoSuchFieldLevelEncryptionConfig].
  /// May throw [PreconditionFailed].
  /// May throw [FieldLevelEncryptionConfigInUse].
  ///
  /// Parameter [id] :
  /// The ID of the configuration you want to delete from CloudFront.
  ///
  /// Parameter [ifMatch] :
  /// The value of the <code>ETag</code> header that you received when
  /// retrieving the configuration identity to delete. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  Future<void> deleteFieldLevelEncryptionConfig2020_05_31({
    @_s.required String id,
    String ifMatch,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    ifMatch?.let((v) => headers['If-Match'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/2020-05-31/field-level-encryption/${Uri.encodeComponent(id)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Remove a field-level encryption profile.
  ///
  /// May throw [AccessDenied].
  /// May throw [InvalidIfMatchVersion].
  /// May throw [NoSuchFieldLevelEncryptionProfile].
  /// May throw [PreconditionFailed].
  /// May throw [FieldLevelEncryptionProfileInUse].
  ///
  /// Parameter [id] :
  /// Request the ID of the profile you want to delete from CloudFront.
  ///
  /// Parameter [ifMatch] :
  /// The value of the <code>ETag</code> header that you received when
  /// retrieving the profile to delete. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  Future<void> deleteFieldLevelEncryptionProfile2020_05_31({
    @_s.required String id,
    String ifMatch,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    ifMatch?.let((v) => headers['If-Match'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/2020-05-31/field-level-encryption-profile/${Uri.encodeComponent(id)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a key group.
  ///
  /// You cannot delete a key group that is referenced in a cache behavior.
  /// First update your distributions to remove the key group from all cache
  /// behaviors, then delete the key group.
  ///
  /// To delete a key group, you must provide the key group’s identifier and
  /// version. To get these values, use <code>ListKeyGroups</code> followed by
  /// <code>GetKeyGroup</code> or <code>GetKeyGroupConfig</code>.
  ///
  /// May throw [InvalidIfMatchVersion].
  /// May throw [NoSuchResource].
  /// May throw [PreconditionFailed].
  /// May throw [ResourceInUse].
  ///
  /// Parameter [id] :
  /// The identifier of the key group that you are deleting. To get the
  /// identifier, use <code>ListKeyGroups</code>.
  ///
  /// Parameter [ifMatch] :
  /// The version of the key group that you are deleting. The version is the key
  /// group’s <code>ETag</code> value. To get the <code>ETag</code>, use
  /// <code>GetKeyGroup</code> or <code>GetKeyGroupConfig</code>.
  Future<void> deleteKeyGroup2020_05_31({
    @_s.required String id,
    String ifMatch,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    ifMatch?.let((v) => headers['If-Match'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/2020-05-31/key-group/${Uri.encodeComponent(id)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disables additional CloudWatch metrics for the specified CloudFront
  /// distribution.
  ///
  /// May throw [AccessDenied].
  /// May throw [NoSuchDistribution].
  ///
  /// Parameter [distributionId] :
  /// The ID of the distribution that you are disabling metrics for.
  Future<void> deleteMonitoringSubscription2020_05_31({
    @_s.required String distributionId,
  }) async {
    ArgumentError.checkNotNull(distributionId, 'distributionId');
    await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/2020-05-31/distributions/${Uri.encodeComponent(distributionId)}/monitoring-subscription',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an origin request policy.
  ///
  /// You cannot delete an origin request policy if it’s attached to any cache
  /// behaviors. First update your distributions to remove the origin request
  /// policy from all cache behaviors, then delete the origin request policy.
  ///
  /// To delete an origin request policy, you must provide the policy’s
  /// identifier and version. To get the identifier, you can use
  /// <code>ListOriginRequestPolicies</code> or
  /// <code>GetOriginRequestPolicy</code>.
  ///
  /// May throw [AccessDenied].
  /// May throw [InvalidIfMatchVersion].
  /// May throw [NoSuchOriginRequestPolicy].
  /// May throw [PreconditionFailed].
  /// May throw [IllegalDelete].
  /// May throw [OriginRequestPolicyInUse].
  ///
  /// Parameter [id] :
  /// The unique identifier for the origin request policy that you are deleting.
  /// To get the identifier, you can use <code>ListOriginRequestPolicies</code>.
  ///
  /// Parameter [ifMatch] :
  /// The version of the origin request policy that you are deleting. The
  /// version is the origin request policy’s <code>ETag</code> value, which you
  /// can get using <code>ListOriginRequestPolicies</code>,
  /// <code>GetOriginRequestPolicy</code>, or
  /// <code>GetOriginRequestPolicyConfig</code>.
  Future<void> deleteOriginRequestPolicy2020_05_31({
    @_s.required String id,
    String ifMatch,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    ifMatch?.let((v) => headers['If-Match'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/2020-05-31/origin-request-policy/${Uri.encodeComponent(id)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Remove a public key you previously added to CloudFront.
  ///
  /// May throw [AccessDenied].
  /// May throw [PublicKeyInUse].
  /// May throw [InvalidIfMatchVersion].
  /// May throw [NoSuchPublicKey].
  /// May throw [PreconditionFailed].
  ///
  /// Parameter [id] :
  /// The ID of the public key you want to remove from CloudFront.
  ///
  /// Parameter [ifMatch] :
  /// The value of the <code>ETag</code> header that you received when
  /// retrieving the public key identity to delete. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  Future<void> deletePublicKey2020_05_31({
    @_s.required String id,
    String ifMatch,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    ifMatch?.let((v) => headers['If-Match'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri: '/2020-05-31/public-key/${Uri.encodeComponent(id)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a real-time log configuration.
  ///
  /// You cannot delete a real-time log configuration if it’s attached to a
  /// cache behavior. First update your distributions to remove the real-time
  /// log configuration from all cache behaviors, then delete the real-time log
  /// configuration.
  ///
  /// To delete a real-time log configuration, you can provide the
  /// configuration’s name or its Amazon Resource Name (ARN). You must provide
  /// at least one. If you provide both, CloudFront uses the name to identify
  /// the real-time log configuration to delete.
  ///
  /// May throw [NoSuchRealtimeLogConfig].
  /// May throw [RealtimeLogConfigInUse].
  /// May throw [InvalidArgument].
  /// May throw [AccessDenied].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the real-time log configuration to
  /// delete.
  ///
  /// Parameter [name] :
  /// The name of the real-time log configuration to delete.
  Future<void> deleteRealtimeLogConfig2020_05_31({
    String arn,
    String name,
  }) async {
    await _protocol.send(
      method: 'POST',
      requestUri: '/2020-05-31/delete-realtime-log-config/',
      payload: DeleteRealtimeLogConfigRequest(arn: arn, name: name).toXml(
        'DeleteRealtimeLogConfigRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://cloudfront.amazonaws.com/doc/2020-05-31/'),
        ],
      ),
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
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/HowToDeleteDistribution.html">Deleting
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
  Future<void> deleteStreamingDistribution2020_05_31({
    @_s.required String id,
    String ifMatch,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    ifMatch?.let((v) => headers['If-Match'] = v.toString());
    await _protocol.send(
      method: 'DELETE',
      requestUri:
          '/2020-05-31/streaming-distribution/${Uri.encodeComponent(id)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets a cache policy, including the following metadata:
  ///
  /// <ul>
  /// <li>
  /// The policy’s identifier.
  /// </li>
  /// <li>
  /// The date and time when the policy was last modified.
  /// </li>
  /// </ul>
  /// To get a cache policy, you must provide the policy’s identifier. If the
  /// cache policy is attached to a distribution’s cache behavior, you can get
  /// the policy’s identifier using <code>ListDistributions</code> or
  /// <code>GetDistribution</code>. If the cache policy is not attached to a
  /// cache behavior, you can get the identifier using
  /// <code>ListCachePolicies</code>.
  ///
  /// May throw [AccessDenied].
  /// May throw [NoSuchCachePolicy].
  ///
  /// Parameter [id] :
  /// The unique identifier for the cache policy. If the cache policy is
  /// attached to a distribution’s cache behavior, you can get the policy’s
  /// identifier using <code>ListDistributions</code> or
  /// <code>GetDistribution</code>. If the cache policy is not attached to a
  /// cache behavior, you can get the identifier using
  /// <code>ListCachePolicies</code>.
  Future<GetCachePolicyResult> getCachePolicy2020_05_31({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2020-05-31/cache-policy/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetCachePolicyResult(
      cachePolicy: CachePolicy.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Gets a cache policy configuration.
  ///
  /// To get a cache policy configuration, you must provide the policy’s
  /// identifier. If the cache policy is attached to a distribution’s cache
  /// behavior, you can get the policy’s identifier using
  /// <code>ListDistributions</code> or <code>GetDistribution</code>. If the
  /// cache policy is not attached to a cache behavior, you can get the
  /// identifier using <code>ListCachePolicies</code>.
  ///
  /// May throw [AccessDenied].
  /// May throw [NoSuchCachePolicy].
  ///
  /// Parameter [id] :
  /// The unique identifier for the cache policy. If the cache policy is
  /// attached to a distribution’s cache behavior, you can get the policy’s
  /// identifier using <code>ListDistributions</code> or
  /// <code>GetDistribution</code>. If the cache policy is not attached to a
  /// cache behavior, you can get the identifier using
  /// <code>ListCachePolicies</code>.
  Future<GetCachePolicyConfigResult> getCachePolicyConfig2020_05_31({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2020-05-31/cache-policy/${Uri.encodeComponent(id)}/config',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetCachePolicyConfigResult(
      cachePolicyConfig: CachePolicyConfig.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
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
      getCloudFrontOriginAccessIdentity2020_05_31({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2020-05-31/origin-access-identity/cloudfront/${Uri.encodeComponent(id)}',
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
      getCloudFrontOriginAccessIdentityConfig2020_05_31({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2020-05-31/origin-access-identity/cloudfront/${Uri.encodeComponent(id)}/config',
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
  /// The distribution's ID. If the ID is empty, an empty distribution
  /// configuration is returned.
  Future<GetDistributionResult> getDistribution2020_05_31({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2020-05-31/distribution/${Uri.encodeComponent(id)}',
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
  /// The distribution's ID. If the ID is empty, an empty distribution
  /// configuration is returned.
  Future<GetDistributionConfigResult> getDistributionConfig2020_05_31({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2020-05-31/distribution/${Uri.encodeComponent(id)}/config',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetDistributionConfigResult(
      distributionConfig: DistributionConfig.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Get the field-level encryption configuration information.
  ///
  /// May throw [AccessDenied].
  /// May throw [NoSuchFieldLevelEncryptionConfig].
  ///
  /// Parameter [id] :
  /// Request the ID for the field-level encryption configuration information.
  Future<GetFieldLevelEncryptionResult> getFieldLevelEncryption2020_05_31({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2020-05-31/field-level-encryption/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetFieldLevelEncryptionResult(
      fieldLevelEncryption: FieldLevelEncryption.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Get the field-level encryption configuration information.
  ///
  /// May throw [AccessDenied].
  /// May throw [NoSuchFieldLevelEncryptionConfig].
  ///
  /// Parameter [id] :
  /// Request the ID for the field-level encryption configuration information.
  Future<GetFieldLevelEncryptionConfigResult>
      getFieldLevelEncryptionConfig2020_05_31({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2020-05-31/field-level-encryption/${Uri.encodeComponent(id)}/config',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetFieldLevelEncryptionConfigResult(
      fieldLevelEncryptionConfig: FieldLevelEncryptionConfig.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Get the field-level encryption profile information.
  ///
  /// May throw [AccessDenied].
  /// May throw [NoSuchFieldLevelEncryptionProfile].
  ///
  /// Parameter [id] :
  /// Get the ID for the field-level encryption profile information.
  Future<GetFieldLevelEncryptionProfileResult>
      getFieldLevelEncryptionProfile2020_05_31({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2020-05-31/field-level-encryption-profile/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetFieldLevelEncryptionProfileResult(
      fieldLevelEncryptionProfile: FieldLevelEncryptionProfile.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Get the field-level encryption profile configuration information.
  ///
  /// May throw [AccessDenied].
  /// May throw [NoSuchFieldLevelEncryptionProfile].
  ///
  /// Parameter [id] :
  /// Get the ID for the field-level encryption profile configuration
  /// information.
  Future<GetFieldLevelEncryptionProfileConfigResult>
      getFieldLevelEncryptionProfileConfig2020_05_31({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2020-05-31/field-level-encryption-profile/${Uri.encodeComponent(id)}/config',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetFieldLevelEncryptionProfileConfigResult(
      fieldLevelEncryptionProfileConfig:
          FieldLevelEncryptionProfileConfig.fromXml($elem),
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
  Future<GetInvalidationResult> getInvalidation2020_05_31({
    @_s.required String distributionId,
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(distributionId, 'distributionId');
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2020-05-31/distribution/${Uri.encodeComponent(distributionId)}/invalidation/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetInvalidationResult(
      invalidation: Invalidation.fromXml($elem),
    );
  }

  /// Gets a key group, including the date and time when the key group was last
  /// modified.
  ///
  /// To get a key group, you must provide the key group’s identifier. If the
  /// key group is referenced in a distribution’s cache behavior, you can get
  /// the key group’s identifier using <code>ListDistributions</code> or
  /// <code>GetDistribution</code>. If the key group is not referenced in a
  /// cache behavior, you can get the identifier using
  /// <code>ListKeyGroups</code>.
  ///
  /// May throw [NoSuchResource].
  ///
  /// Parameter [id] :
  /// The identifier of the key group that you are getting. To get the
  /// identifier, use <code>ListKeyGroups</code>.
  Future<GetKeyGroupResult> getKeyGroup2020_05_31({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2020-05-31/key-group/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetKeyGroupResult(
      keyGroup: KeyGroup.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Gets a key group configuration.
  ///
  /// To get a key group configuration, you must provide the key group’s
  /// identifier. If the key group is referenced in a distribution’s cache
  /// behavior, you can get the key group’s identifier using
  /// <code>ListDistributions</code> or <code>GetDistribution</code>. If the key
  /// group is not referenced in a cache behavior, you can get the identifier
  /// using <code>ListKeyGroups</code>.
  ///
  /// May throw [NoSuchResource].
  ///
  /// Parameter [id] :
  /// The identifier of the key group whose configuration you are getting. To
  /// get the identifier, use <code>ListKeyGroups</code>.
  Future<GetKeyGroupConfigResult> getKeyGroupConfig2020_05_31({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2020-05-31/key-group/${Uri.encodeComponent(id)}/config',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetKeyGroupConfigResult(
      keyGroupConfig: KeyGroupConfig.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Gets information about whether additional CloudWatch metrics are enabled
  /// for the specified CloudFront distribution.
  ///
  /// May throw [AccessDenied].
  /// May throw [NoSuchDistribution].
  ///
  /// Parameter [distributionId] :
  /// The ID of the distribution that you are getting metrics information for.
  Future<GetMonitoringSubscriptionResult> getMonitoringSubscription2020_05_31({
    @_s.required String distributionId,
  }) async {
    ArgumentError.checkNotNull(distributionId, 'distributionId');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2020-05-31/distributions/${Uri.encodeComponent(distributionId)}/monitoring-subscription',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetMonitoringSubscriptionResult(
      monitoringSubscription: MonitoringSubscription.fromXml($elem),
    );
  }

  /// Gets an origin request policy, including the following metadata:
  ///
  /// <ul>
  /// <li>
  /// The policy’s identifier.
  /// </li>
  /// <li>
  /// The date and time when the policy was last modified.
  /// </li>
  /// </ul>
  /// To get an origin request policy, you must provide the policy’s identifier.
  /// If the origin request policy is attached to a distribution’s cache
  /// behavior, you can get the policy’s identifier using
  /// <code>ListDistributions</code> or <code>GetDistribution</code>. If the
  /// origin request policy is not attached to a cache behavior, you can get the
  /// identifier using <code>ListOriginRequestPolicies</code>.
  ///
  /// May throw [AccessDenied].
  /// May throw [NoSuchOriginRequestPolicy].
  ///
  /// Parameter [id] :
  /// The unique identifier for the origin request policy. If the origin request
  /// policy is attached to a distribution’s cache behavior, you can get the
  /// policy’s identifier using <code>ListDistributions</code> or
  /// <code>GetDistribution</code>. If the origin request policy is not attached
  /// to a cache behavior, you can get the identifier using
  /// <code>ListOriginRequestPolicies</code>.
  Future<GetOriginRequestPolicyResult> getOriginRequestPolicy2020_05_31({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2020-05-31/origin-request-policy/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetOriginRequestPolicyResult(
      originRequestPolicy: OriginRequestPolicy.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Gets an origin request policy configuration.
  ///
  /// To get an origin request policy configuration, you must provide the
  /// policy’s identifier. If the origin request policy is attached to a
  /// distribution’s cache behavior, you can get the policy’s identifier using
  /// <code>ListDistributions</code> or <code>GetDistribution</code>. If the
  /// origin request policy is not attached to a cache behavior, you can get the
  /// identifier using <code>ListOriginRequestPolicies</code>.
  ///
  /// May throw [AccessDenied].
  /// May throw [NoSuchOriginRequestPolicy].
  ///
  /// Parameter [id] :
  /// The unique identifier for the origin request policy. If the origin request
  /// policy is attached to a distribution’s cache behavior, you can get the
  /// policy’s identifier using <code>ListDistributions</code> or
  /// <code>GetDistribution</code>. If the origin request policy is not attached
  /// to a cache behavior, you can get the identifier using
  /// <code>ListOriginRequestPolicies</code>.
  Future<GetOriginRequestPolicyConfigResult>
      getOriginRequestPolicyConfig2020_05_31({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2020-05-31/origin-request-policy/${Uri.encodeComponent(id)}/config',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetOriginRequestPolicyConfigResult(
      originRequestPolicyConfig: OriginRequestPolicyConfig.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Gets a public key.
  ///
  /// May throw [AccessDenied].
  /// May throw [NoSuchPublicKey].
  ///
  /// Parameter [id] :
  /// The identifier of the public key you are getting.
  Future<GetPublicKeyResult> getPublicKey2020_05_31({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2020-05-31/public-key/${Uri.encodeComponent(id)}',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetPublicKeyResult(
      publicKey: PublicKey.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Gets a public key configuration.
  ///
  /// May throw [AccessDenied].
  /// May throw [NoSuchPublicKey].
  ///
  /// Parameter [id] :
  /// The identifier of the public key whose configuration you are getting.
  Future<GetPublicKeyConfigResult> getPublicKeyConfig2020_05_31({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2020-05-31/public-key/${Uri.encodeComponent(id)}/config',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetPublicKeyConfigResult(
      publicKeyConfig: PublicKeyConfig.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Gets a real-time log configuration.
  ///
  /// To get a real-time log configuration, you can provide the configuration’s
  /// name or its Amazon Resource Name (ARN). You must provide at least one. If
  /// you provide both, CloudFront uses the name to identify the real-time log
  /// configuration to get.
  ///
  /// May throw [NoSuchRealtimeLogConfig].
  /// May throw [InvalidArgument].
  /// May throw [AccessDenied].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the real-time log configuration to get.
  ///
  /// Parameter [name] :
  /// The name of the real-time log configuration to get.
  Future<GetRealtimeLogConfigResult> getRealtimeLogConfig2020_05_31({
    String arn,
    String name,
  }) async {
    final $result = await _protocol.send(
      method: 'POST',
      requestUri: '/2020-05-31/get-realtime-log-config/',
      payload: GetRealtimeLogConfigRequest(arn: arn, name: name).toXml(
        'GetRealtimeLogConfigRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://cloudfront.amazonaws.com/doc/2020-05-31/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return GetRealtimeLogConfigResult.fromXml($result.body);
  }

  /// Gets information about a specified RTMP distribution, including the
  /// distribution configuration.
  ///
  /// May throw [NoSuchStreamingDistribution].
  /// May throw [AccessDenied].
  ///
  /// Parameter [id] :
  /// The streaming distribution's ID.
  Future<GetStreamingDistributionResult> getStreamingDistribution2020_05_31({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2020-05-31/streaming-distribution/${Uri.encodeComponent(id)}',
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
      getStreamingDistributionConfig2020_05_31({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2020-05-31/streaming-distribution/${Uri.encodeComponent(id)}/config',
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return GetStreamingDistributionConfigResult(
      streamingDistributionConfig: StreamingDistributionConfig.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Gets a list of cache policies.
  ///
  /// You can optionally apply a filter to return only the managed policies
  /// created by AWS, or only the custom policies created in your AWS account.
  ///
  /// You can optionally specify the maximum number of items to receive in the
  /// response. If the total number of items in the list exceeds the maximum
  /// that you specify, or the default maximum, the response is paginated. To
  /// get the next page of items, send a subsequent request that specifies the
  /// <code>NextMarker</code> value from the current response as the
  /// <code>Marker</code> value in the subsequent request.
  ///
  /// May throw [AccessDenied].
  /// May throw [NoSuchCachePolicy].
  /// May throw [InvalidArgument].
  ///
  /// Parameter [marker] :
  /// Use this field when paginating results to indicate where to begin in your
  /// list of cache policies. The response includes cache policies in the list
  /// that occur after the marker. To get the next page of the list, set this
  /// field’s value to the value of <code>NextMarker</code> from the current
  /// page’s response.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of cache policies that you want in the response.
  ///
  /// Parameter [type] :
  /// A filter to return only the specified kinds of cache policies. Valid
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// <code>managed</code> – Returns only the managed policies created by AWS.
  /// </li>
  /// <li>
  /// <code>custom</code> – Returns only the custom policies created in your AWS
  /// account.
  /// </li>
  /// </ul>
  Future<ListCachePoliciesResult> listCachePolicies2020_05_31({
    String marker,
    String maxItems,
    CachePolicyType type,
  }) async {
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems],
      if (type != null) 'Type': [type.toValue()],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2020-05-31/cache-policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListCachePoliciesResult(
      cachePolicyList: CachePolicyList.fromXml($elem),
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
      listCloudFrontOriginAccessIdentities2020_05_31({
    String marker,
    String maxItems,
  }) async {
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2020-05-31/origin-access-identity/cloudfront',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListCloudFrontOriginAccessIdentitiesResult(
      cloudFrontOriginAccessIdentityList:
          CloudFrontOriginAccessIdentityList.fromXml($elem),
    );
  }

  /// List CloudFront distributions.
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
  Future<ListDistributionsResult> listDistributions2020_05_31({
    String marker,
    String maxItems,
  }) async {
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2020-05-31/distribution',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListDistributionsResult(
      distributionList: DistributionList.fromXml($elem),
    );
  }

  /// Gets a list of distribution IDs for distributions that have a cache
  /// behavior that’s associated with the specified cache policy.
  ///
  /// You can optionally specify the maximum number of items to receive in the
  /// response. If the total number of items in the list exceeds the maximum
  /// that you specify, or the default maximum, the response is paginated. To
  /// get the next page of items, send a subsequent request that specifies the
  /// <code>NextMarker</code> value from the current response as the
  /// <code>Marker</code> value in the subsequent request.
  ///
  /// May throw [NoSuchCachePolicy].
  /// May throw [InvalidArgument].
  /// May throw [AccessDenied].
  ///
  /// Parameter [cachePolicyId] :
  /// The ID of the cache policy whose associated distribution IDs you want to
  /// list.
  ///
  /// Parameter [marker] :
  /// Use this field when paginating results to indicate where to begin in your
  /// list of distribution IDs. The response includes distribution IDs in the
  /// list that occur after the marker. To get the next page of the list, set
  /// this field’s value to the value of <code>NextMarker</code> from the
  /// current page’s response.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of distribution IDs that you want in the response.
  Future<ListDistributionsByCachePolicyIdResult>
      listDistributionsByCachePolicyId2020_05_31({
    @_s.required String cachePolicyId,
    String marker,
    String maxItems,
  }) async {
    ArgumentError.checkNotNull(cachePolicyId, 'cachePolicyId');
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2020-05-31/distributionsByCachePolicyId/${Uri.encodeComponent(cachePolicyId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListDistributionsByCachePolicyIdResult(
      distributionIdList: DistributionIdList.fromXml($elem),
    );
  }

  /// Gets a list of distribution IDs for distributions that have a cache
  /// behavior that references the specified key group.
  ///
  /// You can optionally specify the maximum number of items to receive in the
  /// response. If the total number of items in the list exceeds the maximum
  /// that you specify, or the default maximum, the response is paginated. To
  /// get the next page of items, send a subsequent request that specifies the
  /// <code>NextMarker</code> value from the current response as the
  /// <code>Marker</code> value in the subsequent request.
  ///
  /// May throw [NoSuchResource].
  /// May throw [InvalidArgument].
  ///
  /// Parameter [keyGroupId] :
  /// The ID of the key group whose associated distribution IDs you are listing.
  ///
  /// Parameter [marker] :
  /// Use this field when paginating results to indicate where to begin in your
  /// list of distribution IDs. The response includes distribution IDs in the
  /// list that occur after the marker. To get the next page of the list, set
  /// this field’s value to the value of <code>NextMarker</code> from the
  /// current page’s response.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of distribution IDs that you want in the response.
  Future<ListDistributionsByKeyGroupResult>
      listDistributionsByKeyGroup2020_05_31({
    @_s.required String keyGroupId,
    String marker,
    String maxItems,
  }) async {
    ArgumentError.checkNotNull(keyGroupId, 'keyGroupId');
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2020-05-31/distributionsByKeyGroupId/${Uri.encodeComponent(keyGroupId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListDistributionsByKeyGroupResult(
      distributionIdList: DistributionIdList.fromXml($elem),
    );
  }

  /// Gets a list of distribution IDs for distributions that have a cache
  /// behavior that’s associated with the specified origin request policy.
  ///
  /// You can optionally specify the maximum number of items to receive in the
  /// response. If the total number of items in the list exceeds the maximum
  /// that you specify, or the default maximum, the response is paginated. To
  /// get the next page of items, send a subsequent request that specifies the
  /// <code>NextMarker</code> value from the current response as the
  /// <code>Marker</code> value in the subsequent request.
  ///
  /// May throw [NoSuchOriginRequestPolicy].
  /// May throw [InvalidArgument].
  /// May throw [AccessDenied].
  ///
  /// Parameter [originRequestPolicyId] :
  /// The ID of the origin request policy whose associated distribution IDs you
  /// want to list.
  ///
  /// Parameter [marker] :
  /// Use this field when paginating results to indicate where to begin in your
  /// list of distribution IDs. The response includes distribution IDs in the
  /// list that occur after the marker. To get the next page of the list, set
  /// this field’s value to the value of <code>NextMarker</code> from the
  /// current page’s response.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of distribution IDs that you want in the response.
  Future<ListDistributionsByOriginRequestPolicyIdResult>
      listDistributionsByOriginRequestPolicyId2020_05_31({
    @_s.required String originRequestPolicyId,
    String marker,
    String maxItems,
  }) async {
    ArgumentError.checkNotNull(originRequestPolicyId, 'originRequestPolicyId');
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2020-05-31/distributionsByOriginRequestPolicyId/${Uri.encodeComponent(originRequestPolicyId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListDistributionsByOriginRequestPolicyIdResult(
      distributionIdList: DistributionIdList.fromXml($elem),
    );
  }

  /// Gets a list of distributions that have a cache behavior that’s associated
  /// with the specified real-time log configuration.
  ///
  /// You can specify the real-time log configuration by its name or its Amazon
  /// Resource Name (ARN). You must provide at least one. If you provide both,
  /// CloudFront uses the name to identify the real-time log configuration to
  /// list distributions for.
  ///
  /// You can optionally specify the maximum number of items to receive in the
  /// response. If the total number of items in the list exceeds the maximum
  /// that you specify, or the default maximum, the response is paginated. To
  /// get the next page of items, send a subsequent request that specifies the
  /// <code>NextMarker</code> value from the current response as the
  /// <code>Marker</code> value in the subsequent request.
  ///
  /// May throw [InvalidArgument].
  ///
  /// Parameter [marker] :
  /// Use this field when paginating results to indicate where to begin in your
  /// list of distributions. The response includes distributions in the list
  /// that occur after the marker. To get the next page of the list, set this
  /// field’s value to the value of <code>NextMarker</code> from the current
  /// page’s response.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of distributions that you want in the response.
  ///
  /// Parameter [realtimeLogConfigArn] :
  /// The Amazon Resource Name (ARN) of the real-time log configuration whose
  /// associated distributions you want to list.
  ///
  /// Parameter [realtimeLogConfigName] :
  /// The name of the real-time log configuration whose associated distributions
  /// you want to list.
  Future<ListDistributionsByRealtimeLogConfigResult>
      listDistributionsByRealtimeLogConfig2020_05_31({
    String marker,
    String maxItems,
    String realtimeLogConfigArn,
    String realtimeLogConfigName,
  }) async {
    final $result = await _protocol.sendRaw(
      method: 'POST',
      requestUri: '/2020-05-31/distributionsByRealtimeLogConfig/',
      payload: ListDistributionsByRealtimeLogConfigRequest(
              marker: marker,
              maxItems: maxItems,
              realtimeLogConfigArn: realtimeLogConfigArn,
              realtimeLogConfigName: realtimeLogConfigName)
          .toXml(
        'ListDistributionsByRealtimeLogConfigRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://cloudfront.amazonaws.com/doc/2020-05-31/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListDistributionsByRealtimeLogConfigResult(
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
      listDistributionsByWebACLId2020_05_31({
    @_s.required String webACLId,
    String marker,
    String maxItems,
  }) async {
    ArgumentError.checkNotNull(webACLId, 'webACLId');
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2020-05-31/distributionsByWebACLId/${Uri.encodeComponent(webACLId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListDistributionsByWebACLIdResult(
      distributionList: DistributionList.fromXml($elem),
    );
  }

  /// List all field-level encryption configurations that have been created in
  /// CloudFront for this account.
  ///
  /// May throw [InvalidArgument].
  ///
  /// Parameter [marker] :
  /// Use this when paginating results to indicate where to begin in your list
  /// of configurations. The results include configurations in the list that
  /// occur after the marker. To get the next page of results, set the
  /// <code>Marker</code> to the value of the <code>NextMarker</code> from the
  /// current page's response (which is also the ID of the last configuration on
  /// that page).
  ///
  /// Parameter [maxItems] :
  /// The maximum number of field-level encryption configurations you want in
  /// the response body.
  Future<ListFieldLevelEncryptionConfigsResult>
      listFieldLevelEncryptionConfigs2020_05_31({
    String marker,
    String maxItems,
  }) async {
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2020-05-31/field-level-encryption',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListFieldLevelEncryptionConfigsResult(
      fieldLevelEncryptionList: FieldLevelEncryptionList.fromXml($elem),
    );
  }

  /// Request a list of field-level encryption profiles that have been created
  /// in CloudFront for this account.
  ///
  /// May throw [InvalidArgument].
  ///
  /// Parameter [marker] :
  /// Use this when paginating results to indicate where to begin in your list
  /// of profiles. The results include profiles in the list that occur after the
  /// marker. To get the next page of results, set the <code>Marker</code> to
  /// the value of the <code>NextMarker</code> from the current page's response
  /// (which is also the ID of the last profile on that page).
  ///
  /// Parameter [maxItems] :
  /// The maximum number of field-level encryption profiles you want in the
  /// response body.
  Future<ListFieldLevelEncryptionProfilesResult>
      listFieldLevelEncryptionProfiles2020_05_31({
    String marker,
    String maxItems,
  }) async {
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2020-05-31/field-level-encryption-profile',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListFieldLevelEncryptionProfilesResult(
      fieldLevelEncryptionProfileList:
          FieldLevelEncryptionProfileList.fromXml($elem),
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
  Future<ListInvalidationsResult> listInvalidations2020_05_31({
    @_s.required String distributionId,
    String marker,
    String maxItems,
  }) async {
    ArgumentError.checkNotNull(distributionId, 'distributionId');
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri:
          '/2020-05-31/distribution/${Uri.encodeComponent(distributionId)}/invalidation',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListInvalidationsResult(
      invalidationList: InvalidationList.fromXml($elem),
    );
  }

  /// Gets a list of key groups.
  ///
  /// You can optionally specify the maximum number of items to receive in the
  /// response. If the total number of items in the list exceeds the maximum
  /// that you specify, or the default maximum, the response is paginated. To
  /// get the next page of items, send a subsequent request that specifies the
  /// <code>NextMarker</code> value from the current response as the
  /// <code>Marker</code> value in the subsequent request.
  ///
  /// May throw [InvalidArgument].
  ///
  /// Parameter [marker] :
  /// Use this field when paginating results to indicate where to begin in your
  /// list of key groups. The response includes key groups in the list that
  /// occur after the marker. To get the next page of the list, set this field’s
  /// value to the value of <code>NextMarker</code> from the current page’s
  /// response.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of key groups that you want in the response.
  Future<ListKeyGroupsResult> listKeyGroups2020_05_31({
    String marker,
    String maxItems,
  }) async {
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2020-05-31/key-group',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListKeyGroupsResult(
      keyGroupList: KeyGroupList.fromXml($elem),
    );
  }

  /// Gets a list of origin request policies.
  ///
  /// You can optionally apply a filter to return only the managed policies
  /// created by AWS, or only the custom policies created in your AWS account.
  ///
  /// You can optionally specify the maximum number of items to receive in the
  /// response. If the total number of items in the list exceeds the maximum
  /// that you specify, or the default maximum, the response is paginated. To
  /// get the next page of items, send a subsequent request that specifies the
  /// <code>NextMarker</code> value from the current response as the
  /// <code>Marker</code> value in the subsequent request.
  ///
  /// May throw [AccessDenied].
  /// May throw [NoSuchOriginRequestPolicy].
  /// May throw [InvalidArgument].
  ///
  /// Parameter [marker] :
  /// Use this field when paginating results to indicate where to begin in your
  /// list of origin request policies. The response includes origin request
  /// policies in the list that occur after the marker. To get the next page of
  /// the list, set this field’s value to the value of <code>NextMarker</code>
  /// from the current page’s response.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of origin request policies that you want in the
  /// response.
  ///
  /// Parameter [type] :
  /// A filter to return only the specified kinds of origin request policies.
  /// Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>managed</code> – Returns only the managed policies created by AWS.
  /// </li>
  /// <li>
  /// <code>custom</code> – Returns only the custom policies created in your AWS
  /// account.
  /// </li>
  /// </ul>
  Future<ListOriginRequestPoliciesResult> listOriginRequestPolicies2020_05_31({
    String marker,
    String maxItems,
    OriginRequestPolicyType type,
  }) async {
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems],
      if (type != null) 'Type': [type.toValue()],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2020-05-31/origin-request-policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListOriginRequestPoliciesResult(
      originRequestPolicyList: OriginRequestPolicyList.fromXml($elem),
    );
  }

  /// List all public keys that have been added to CloudFront for this account.
  ///
  /// May throw [InvalidArgument].
  ///
  /// Parameter [marker] :
  /// Use this when paginating results to indicate where to begin in your list
  /// of public keys. The results include public keys in the list that occur
  /// after the marker. To get the next page of results, set the
  /// <code>Marker</code> to the value of the <code>NextMarker</code> from the
  /// current page's response (which is also the ID of the last public key on
  /// that page).
  ///
  /// Parameter [maxItems] :
  /// The maximum number of public keys you want in the response body.
  Future<ListPublicKeysResult> listPublicKeys2020_05_31({
    String marker,
    String maxItems,
  }) async {
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2020-05-31/public-key',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListPublicKeysResult(
      publicKeyList: PublicKeyList.fromXml($elem),
    );
  }

  /// Gets a list of real-time log configurations.
  ///
  /// You can optionally specify the maximum number of items to receive in the
  /// response. If the total number of items in the list exceeds the maximum
  /// that you specify, or the default maximum, the response is paginated. To
  /// get the next page of items, send a subsequent request that specifies the
  /// <code>NextMarker</code> value from the current response as the
  /// <code>Marker</code> value in the subsequent request.
  ///
  /// May throw [InvalidArgument].
  /// May throw [AccessDenied].
  /// May throw [NoSuchRealtimeLogConfig].
  ///
  /// Parameter [marker] :
  /// Use this field when paginating results to indicate where to begin in your
  /// list of real-time log configurations. The response includes real-time log
  /// configurations in the list that occur after the marker. To get the next
  /// page of the list, set this field’s value to the value of
  /// <code>NextMarker</code> from the current page’s response.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of real-time log configurations that you want in the
  /// response.
  Future<ListRealtimeLogConfigsResult> listRealtimeLogConfigs2020_05_31({
    String marker,
    String maxItems,
  }) async {
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2020-05-31/realtime-log-config',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return ListRealtimeLogConfigsResult(
      realtimeLogConfigs: RealtimeLogConfigs.fromXml($elem),
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
      listStreamingDistributions2020_05_31({
    String marker,
    String maxItems,
  }) async {
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2020-05-31/streaming-distribution',
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
  Future<ListTagsForResourceResult> listTagsForResource2020_05_31({
    @_s.required String resource,
  }) async {
    ArgumentError.checkNotNull(resource, 'resource');
    _s.validateStringPattern(
      'resource',
      resource,
      r'''arn:aws(-cn)?:cloudfront::[0-9]+:.*''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (resource != null) 'Resource': [resource],
    };
    final $result = await _protocol.sendRaw(
      method: 'GET',
      requestUri: '/2020-05-31/tagging',
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
  Future<void> tagResource2020_05_31({
    @_s.required String resource,
    @_s.required Tags tags,
  }) async {
    ArgumentError.checkNotNull(resource, 'resource');
    _s.validateStringPattern(
      'resource',
      resource,
      r'''arn:aws(-cn)?:cloudfront::[0-9]+:.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $query = <String, List<String>>{
      if (resource != null) 'Resource': [resource],
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/2020-05-31/tagging?Operation=Tag',
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
  Future<void> untagResource2020_05_31({
    @_s.required String resource,
    @_s.required TagKeys tagKeys,
  }) async {
    ArgumentError.checkNotNull(resource, 'resource');
    _s.validateStringPattern(
      'resource',
      resource,
      r'''arn:aws(-cn)?:cloudfront::[0-9]+:.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (resource != null) 'Resource': [resource],
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/2020-05-31/tagging?Operation=Untag',
      queryParams: $query,
      payload: tagKeys.toXml('TagKeys'),
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a cache policy configuration.
  ///
  /// When you update a cache policy configuration, all the fields are updated
  /// with the values provided in the request. You cannot update some fields
  /// independent of others. To update a cache policy configuration:
  /// <ol>
  /// <li>
  /// Use <code>GetCachePolicyConfig</code> to get the current configuration.
  /// </li>
  /// <li>
  /// Locally modify the fields in the cache policy configuration that you want
  /// to update.
  /// </li>
  /// <li>
  /// Call <code>UpdateCachePolicy</code> by providing the entire cache policy
  /// configuration, including the fields that you modified and those that you
  /// didn’t.
  /// </li> </ol>
  ///
  /// May throw [AccessDenied].
  /// May throw [IllegalUpdate].
  /// May throw [InconsistentQuantities].
  /// May throw [InvalidArgument].
  /// May throw [InvalidIfMatchVersion].
  /// May throw [NoSuchCachePolicy].
  /// May throw [PreconditionFailed].
  /// May throw [CachePolicyAlreadyExists].
  /// May throw [TooManyHeadersInCachePolicy].
  /// May throw [TooManyCookiesInCachePolicy].
  /// May throw [TooManyQueryStringsInCachePolicy].
  ///
  /// Parameter [cachePolicyConfig] :
  /// A cache policy configuration.
  ///
  /// Parameter [id] :
  /// The unique identifier for the cache policy that you are updating. The
  /// identifier is returned in a cache behavior’s <code>CachePolicyId</code>
  /// field in the response to <code>GetDistributionConfig</code>.
  ///
  /// Parameter [ifMatch] :
  /// The version of the cache policy that you are updating. The version is
  /// returned in the cache policy’s <code>ETag</code> field in the response to
  /// <code>GetCachePolicyConfig</code>.
  Future<UpdateCachePolicyResult> updateCachePolicy2020_05_31({
    @_s.required CachePolicyConfig cachePolicyConfig,
    @_s.required String id,
    String ifMatch,
  }) async {
    ArgumentError.checkNotNull(cachePolicyConfig, 'cachePolicyConfig');
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    ifMatch?.let((v) => headers['If-Match'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri: '/2020-05-31/cache-policy/${Uri.encodeComponent(id)}',
      headers: headers,
      payload: cachePolicyConfig.toXml('CachePolicyConfig'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return UpdateCachePolicyResult(
      cachePolicy: CachePolicy.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
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
      updateCloudFrontOriginAccessIdentity2020_05_31({
    @_s.required
        CloudFrontOriginAccessIdentityConfig
            cloudFrontOriginAccessIdentityConfig,
    @_s.required String id,
    String ifMatch,
  }) async {
    ArgumentError.checkNotNull(cloudFrontOriginAccessIdentityConfig,
        'cloudFrontOriginAccessIdentityConfig');
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    ifMatch?.let((v) => headers['If-Match'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri:
          '/2020-05-31/origin-access-identity/cloudfront/${Uri.encodeComponent(id)}/config',
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

  /// Updates the configuration for a web distribution.
  /// <important>
  /// When you update a distribution, there are more required fields than when
  /// you create a distribution. When you update your distribution by using this
  /// API action, follow the steps here to get the current configuration and
  /// then make your updates, to make sure that you include all of the required
  /// fields. To view a summary, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-overview-required-fields.html">Required
  /// Fields for Create Distribution and Update Distribution</a> in the
  /// <i>Amazon CloudFront Developer Guide</i>.
  /// </important>
  /// The update process includes getting the current distribution
  /// configuration, updating the XML document that is returned to make your
  /// changes, and then submitting an <code>UpdateDistribution</code> request to
  /// make the updates.
  ///
  /// For information about updating a distribution using the CloudFront console
  /// instead, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-creating-console.html">Creating
  /// a Distribution</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// <b>To update a web distribution using the CloudFront API</b>
  /// <ol>
  /// <li>
  /// Submit a <a
  /// href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_GetDistributionConfig.html">GetDistributionConfig</a>
  /// request to get the current configuration and an <code>Etag</code> header
  /// for the distribution.
  /// <note>
  /// If you update the distribution again, you must get a new <code>Etag</code>
  /// header.
  /// </note> </li>
  /// <li>
  /// Update the XML document that was returned in the response to your
  /// <code>GetDistributionConfig</code> request to include your changes.
  /// <important>
  /// When you edit the XML file, be aware of the following:
  ///
  /// <ul>
  /// <li>
  /// You must strip out the ETag parameter that is returned.
  /// </li>
  /// <li>
  /// Additional fields are required when you update a distribution. There may
  /// be fields included in the XML file for features that you haven't
  /// configured for your distribution. This is expected and required to
  /// successfully update the distribution.
  /// </li>
  /// <li>
  /// You can't change the value of <code>CallerReference</code>. If you try to
  /// change this value, CloudFront returns an <code>IllegalUpdate</code> error.
  /// </li>
  /// <li>
  /// The new configuration replaces the existing configuration; the values that
  /// you specify in an <code>UpdateDistribution</code> request are not merged
  /// into your existing configuration. When you add, delete, or replace values
  /// in an element that allows multiple values (for example,
  /// <code>CNAME</code>), you must specify all of the values that you want to
  /// appear in the updated distribution. In addition, you must update the
  /// corresponding <code>Quantity</code> element.
  /// </li>
  /// </ul> </important> </li>
  /// <li>
  /// Submit an <code>UpdateDistribution</code> request to update the
  /// configuration for your distribution:
  ///
  /// <ul>
  /// <li>
  /// In the request body, include the XML document that you updated in Step 2.
  /// The request body must include an XML document with a
  /// <code>DistributionConfig</code> element.
  /// </li>
  /// <li>
  /// Set the value of the HTTP <code>If-Match</code> header to the value of the
  /// <code>ETag</code> header that CloudFront returned when you submitted the
  /// <code>GetDistributionConfig</code> request in Step 1.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Review the response to the <code>UpdateDistribution</code> request to
  /// confirm that the configuration was successfully updated.
  /// </li>
  /// <li>
  /// Optional: Submit a <a
  /// href="https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_GetDistribution.html">GetDistribution</a>
  /// request to confirm that your changes have propagated. When propagation is
  /// complete, the value of <code>Status</code> is <code>Deployed</code>.
  /// </li> </ol>
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
  /// May throw [TooManyOriginGroupsPerDistribution].
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
  /// May throw [TooManyDistributionsWithSingleFunctionARN].
  /// May throw [TooManyLambdaFunctionAssociations].
  /// May throw [InvalidLambdaFunctionAssociation].
  /// May throw [InvalidOriginReadTimeout].
  /// May throw [InvalidOriginKeepaliveTimeout].
  /// May throw [NoSuchFieldLevelEncryptionConfig].
  /// May throw [IllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior].
  /// May throw [TooManyDistributionsAssociatedToFieldLevelEncryptionConfig].
  /// May throw [NoSuchCachePolicy].
  /// May throw [TooManyDistributionsAssociatedToCachePolicy].
  /// May throw [NoSuchOriginRequestPolicy].
  /// May throw [TooManyDistributionsAssociatedToOriginRequestPolicy].
  /// May throw [TooManyDistributionsAssociatedToKeyGroup].
  /// May throw [TooManyKeyGroupsAssociatedToDistribution].
  /// May throw [TrustedKeyGroupDoesNotExist].
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
  Future<UpdateDistributionResult> updateDistribution2020_05_31({
    @_s.required DistributionConfig distributionConfig,
    @_s.required String id,
    String ifMatch,
  }) async {
    ArgumentError.checkNotNull(distributionConfig, 'distributionConfig');
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    ifMatch?.let((v) => headers['If-Match'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri: '/2020-05-31/distribution/${Uri.encodeComponent(id)}/config',
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

  /// Update a field-level encryption configuration.
  ///
  /// May throw [AccessDenied].
  /// May throw [IllegalUpdate].
  /// May throw [InconsistentQuantities].
  /// May throw [InvalidArgument].
  /// May throw [InvalidIfMatchVersion].
  /// May throw [NoSuchFieldLevelEncryptionProfile].
  /// May throw [NoSuchFieldLevelEncryptionConfig].
  /// May throw [PreconditionFailed].
  /// May throw [TooManyFieldLevelEncryptionQueryArgProfiles].
  /// May throw [TooManyFieldLevelEncryptionContentTypeProfiles].
  /// May throw [QueryArgProfileEmpty].
  ///
  /// Parameter [fieldLevelEncryptionConfig] :
  /// Request to update a field-level encryption configuration.
  ///
  /// Parameter [id] :
  /// The ID of the configuration you want to update.
  ///
  /// Parameter [ifMatch] :
  /// The value of the <code>ETag</code> header that you received when
  /// retrieving the configuration identity to update. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  Future<UpdateFieldLevelEncryptionConfigResult>
      updateFieldLevelEncryptionConfig2020_05_31({
    @_s.required FieldLevelEncryptionConfig fieldLevelEncryptionConfig,
    @_s.required String id,
    String ifMatch,
  }) async {
    ArgumentError.checkNotNull(
        fieldLevelEncryptionConfig, 'fieldLevelEncryptionConfig');
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    ifMatch?.let((v) => headers['If-Match'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri:
          '/2020-05-31/field-level-encryption/${Uri.encodeComponent(id)}/config',
      headers: headers,
      payload: fieldLevelEncryptionConfig.toXml('FieldLevelEncryptionConfig'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return UpdateFieldLevelEncryptionConfigResult(
      fieldLevelEncryption: FieldLevelEncryption.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Update a field-level encryption profile.
  ///
  /// May throw [AccessDenied].
  /// May throw [FieldLevelEncryptionProfileAlreadyExists].
  /// May throw [IllegalUpdate].
  /// May throw [InconsistentQuantities].
  /// May throw [InvalidArgument].
  /// May throw [InvalidIfMatchVersion].
  /// May throw [NoSuchPublicKey].
  /// May throw [NoSuchFieldLevelEncryptionProfile].
  /// May throw [PreconditionFailed].
  /// May throw [FieldLevelEncryptionProfileSizeExceeded].
  /// May throw [TooManyFieldLevelEncryptionEncryptionEntities].
  /// May throw [TooManyFieldLevelEncryptionFieldPatterns].
  ///
  /// Parameter [fieldLevelEncryptionProfileConfig] :
  /// Request to update a field-level encryption profile.
  ///
  /// Parameter [id] :
  /// The ID of the field-level encryption profile request.
  ///
  /// Parameter [ifMatch] :
  /// The value of the <code>ETag</code> header that you received when
  /// retrieving the profile identity to update. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  Future<UpdateFieldLevelEncryptionProfileResult>
      updateFieldLevelEncryptionProfile2020_05_31({
    @_s.required
        FieldLevelEncryptionProfileConfig fieldLevelEncryptionProfileConfig,
    @_s.required String id,
    String ifMatch,
  }) async {
    ArgumentError.checkNotNull(
        fieldLevelEncryptionProfileConfig, 'fieldLevelEncryptionProfileConfig');
    ArgumentError.checkNotNull(id, 'id');
    final headers = <String, String>{};
    ifMatch?.let((v) => headers['If-Match'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri:
          '/2020-05-31/field-level-encryption-profile/${Uri.encodeComponent(id)}/config',
      headers: headers,
      payload: fieldLevelEncryptionProfileConfig
          .toXml('FieldLevelEncryptionProfileConfig'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return UpdateFieldLevelEncryptionProfileResult(
      fieldLevelEncryptionProfile: FieldLevelEncryptionProfile.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Updates a key group.
  ///
  /// When you update a key group, all the fields are updated with the values
  /// provided in the request. You cannot update some fields independent of
  /// others. To update a key group:
  /// <ol>
  /// <li>
  /// Get the current key group with <code>GetKeyGroup</code> or
  /// <code>GetKeyGroupConfig</code>.
  /// </li>
  /// <li>
  /// Locally modify the fields in the key group that you want to update. For
  /// example, add or remove public key IDs.
  /// </li>
  /// <li>
  /// Call <code>UpdateKeyGroup</code> with the entire key group object,
  /// including the fields that you modified and those that you didn’t.
  /// </li> </ol>
  ///
  /// May throw [InvalidIfMatchVersion].
  /// May throw [NoSuchResource].
  /// May throw [PreconditionFailed].
  /// May throw [KeyGroupAlreadyExists].
  /// May throw [InvalidArgument].
  /// May throw [TooManyPublicKeysInKeyGroup].
  ///
  /// Parameter [id] :
  /// The identifier of the key group that you are updating.
  ///
  /// Parameter [keyGroupConfig] :
  /// The key group configuration.
  ///
  /// Parameter [ifMatch] :
  /// The version of the key group that you are updating. The version is the key
  /// group’s <code>ETag</code> value.
  Future<UpdateKeyGroupResult> updateKeyGroup2020_05_31({
    @_s.required String id,
    @_s.required KeyGroupConfig keyGroupConfig,
    String ifMatch,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(keyGroupConfig, 'keyGroupConfig');
    final headers = <String, String>{};
    ifMatch?.let((v) => headers['If-Match'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri: '/2020-05-31/key-group/${Uri.encodeComponent(id)}',
      headers: headers,
      payload: keyGroupConfig.toXml('KeyGroupConfig'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return UpdateKeyGroupResult(
      keyGroup: KeyGroup.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Updates an origin request policy configuration.
  ///
  /// When you update an origin request policy configuration, all the fields are
  /// updated with the values provided in the request. You cannot update some
  /// fields independent of others. To update an origin request policy
  /// configuration:
  /// <ol>
  /// <li>
  /// Use <code>GetOriginRequestPolicyConfig</code> to get the current
  /// configuration.
  /// </li>
  /// <li>
  /// Locally modify the fields in the origin request policy configuration that
  /// you want to update.
  /// </li>
  /// <li>
  /// Call <code>UpdateOriginRequestPolicy</code> by providing the entire origin
  /// request policy configuration, including the fields that you modified and
  /// those that you didn’t.
  /// </li> </ol>
  ///
  /// May throw [AccessDenied].
  /// May throw [IllegalUpdate].
  /// May throw [InconsistentQuantities].
  /// May throw [InvalidArgument].
  /// May throw [InvalidIfMatchVersion].
  /// May throw [NoSuchOriginRequestPolicy].
  /// May throw [PreconditionFailed].
  /// May throw [OriginRequestPolicyAlreadyExists].
  /// May throw [TooManyHeadersInOriginRequestPolicy].
  /// May throw [TooManyCookiesInOriginRequestPolicy].
  /// May throw [TooManyQueryStringsInOriginRequestPolicy].
  ///
  /// Parameter [id] :
  /// The unique identifier for the origin request policy that you are updating.
  /// The identifier is returned in a cache behavior’s
  /// <code>OriginRequestPolicyId</code> field in the response to
  /// <code>GetDistributionConfig</code>.
  ///
  /// Parameter [originRequestPolicyConfig] :
  /// An origin request policy configuration.
  ///
  /// Parameter [ifMatch] :
  /// The version of the origin request policy that you are updating. The
  /// version is returned in the origin request policy’s <code>ETag</code> field
  /// in the response to <code>GetOriginRequestPolicyConfig</code>.
  Future<UpdateOriginRequestPolicyResult> updateOriginRequestPolicy2020_05_31({
    @_s.required String id,
    @_s.required OriginRequestPolicyConfig originRequestPolicyConfig,
    String ifMatch,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(
        originRequestPolicyConfig, 'originRequestPolicyConfig');
    final headers = <String, String>{};
    ifMatch?.let((v) => headers['If-Match'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri:
          '/2020-05-31/origin-request-policy/${Uri.encodeComponent(id)}',
      headers: headers,
      payload: originRequestPolicyConfig.toXml('OriginRequestPolicyConfig'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return UpdateOriginRequestPolicyResult(
      originRequestPolicy: OriginRequestPolicy.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Update public key information. Note that the only value you can change is
  /// the comment.
  ///
  /// May throw [AccessDenied].
  /// May throw [CannotChangeImmutablePublicKeyFields].
  /// May throw [InvalidArgument].
  /// May throw [InvalidIfMatchVersion].
  /// May throw [IllegalUpdate].
  /// May throw [NoSuchPublicKey].
  /// May throw [PreconditionFailed].
  ///
  /// Parameter [id] :
  /// The identifier of the public key that you are updating.
  ///
  /// Parameter [publicKeyConfig] :
  /// A public key configuration.
  ///
  /// Parameter [ifMatch] :
  /// The value of the <code>ETag</code> header that you received when
  /// retrieving the public key to update. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  Future<UpdatePublicKeyResult> updatePublicKey2020_05_31({
    @_s.required String id,
    @_s.required PublicKeyConfig publicKeyConfig,
    String ifMatch,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(publicKeyConfig, 'publicKeyConfig');
    final headers = <String, String>{};
    ifMatch?.let((v) => headers['If-Match'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri: '/2020-05-31/public-key/${Uri.encodeComponent(id)}/config',
      headers: headers,
      payload: publicKeyConfig.toXml('PublicKeyConfig'),
      exceptionFnMap: _exceptionFns,
    );
    final $elem = await _s.xmlFromResponse($result);
    return UpdatePublicKeyResult(
      publicKey: PublicKey.fromXml($elem),
      eTag: _s.extractHeaderStringValue($result.headers, 'ETag'),
    );
  }

  /// Updates a real-time log configuration.
  ///
  /// When you update a real-time log configuration, all the parameters are
  /// updated with the values provided in the request. You cannot update some
  /// parameters independent of others. To update a real-time log configuration:
  /// <ol>
  /// <li>
  /// Call <code>GetRealtimeLogConfig</code> to get the current real-time log
  /// configuration.
  /// </li>
  /// <li>
  /// Locally modify the parameters in the real-time log configuration that you
  /// want to update.
  /// </li>
  /// <li>
  /// Call this API (<code>UpdateRealtimeLogConfig</code>) by providing the
  /// entire real-time log configuration, including the parameters that you
  /// modified and those that you didn’t.
  /// </li> </ol>
  /// You cannot update a real-time log configuration’s <code>Name</code> or
  /// <code>ARN</code>.
  ///
  /// May throw [NoSuchRealtimeLogConfig].
  /// May throw [InvalidArgument].
  /// May throw [AccessDenied].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) for this real-time log configuration.
  ///
  /// Parameter [endPoints] :
  /// Contains information about the Amazon Kinesis data stream where you are
  /// sending real-time log data.
  ///
  /// Parameter [fields] :
  /// A list of fields to include in each real-time log record.
  ///
  /// For more information about fields, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/real-time-logs.html#understand-real-time-log-config-fields">Real-time
  /// log configuration fields</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  ///
  /// Parameter [name] :
  /// The name for this real-time log configuration.
  ///
  /// Parameter [samplingRate] :
  /// The sampling rate for this real-time log configuration. The sampling rate
  /// determines the percentage of viewer requests that are represented in the
  /// real-time log data. You must provide an integer between 1 and 100,
  /// inclusive.
  Future<UpdateRealtimeLogConfigResult> updateRealtimeLogConfig2020_05_31({
    String arn,
    List<EndPoint> endPoints,
    List<String> fields,
    String name,
    int samplingRate,
  }) async {
    final $result = await _protocol.send(
      method: 'PUT',
      requestUri: '/2020-05-31/realtime-log-config/',
      payload: UpdateRealtimeLogConfigRequest(
              arn: arn,
              endPoints: endPoints,
              fields: fields,
              name: name,
              samplingRate: samplingRate)
          .toXml(
        'UpdateRealtimeLogConfigRequest',
        attributes: [
          _s.XmlAttribute(_s.XmlName('xmlns'),
              'http://cloudfront.amazonaws.com/doc/2020-05-31/'),
        ],
      ),
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRealtimeLogConfigResult.fromXml($result.body);
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
      updateStreamingDistribution2020_05_31({
    @_s.required String id,
    @_s.required StreamingDistributionConfig streamingDistributionConfig,
    String ifMatch,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(
        streamingDistributionConfig, 'streamingDistributionConfig');
    final headers = <String, String>{};
    ifMatch?.let((v) => headers['If-Match'] = v.toString());
    final $result = await _protocol.sendRaw(
      method: 'PUT',
      requestUri:
          '/2020-05-31/streaming-distribution/${Uri.encodeComponent(id)}/config',
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

/// A list of key groups, and the public keys in each key group, that CloudFront
/// can use to verify the signatures of signed URLs and signed cookies.
class ActiveTrustedKeyGroups {
  /// This field is <code>true</code> if any of the key groups have public keys
  /// that CloudFront can use to verify the signatures of signed URLs and signed
  /// cookies. If not, this field is <code>false</code>.
  final bool enabled;

  /// The number of key groups in the list.
  final int quantity;

  /// A list of key groups, including the identifiers of the public keys in each
  /// key group that CloudFront can use to verify the signatures of signed URLs
  /// and signed cookies.
  final List<KGKeyPairIds> items;

  ActiveTrustedKeyGroups({
    @_s.required this.enabled,
    @_s.required this.quantity,
    this.items,
  });
  factory ActiveTrustedKeyGroups.fromXml(_s.XmlElement elem) {
    return ActiveTrustedKeyGroups(
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('KeyGroup')
          .map((c) => KGKeyPairIds.fromXml(c))
          .toList()),
    );
  }
}

/// A list of AWS accounts and the active CloudFront key pairs in each account
/// that CloudFront can use to verify the signatures of signed URLs and signed
/// cookies.
class ActiveTrustedSigners {
  /// This field is <code>true</code> if any of the AWS accounts in the list have
  /// active CloudFront key pairs that CloudFront can use to verify the signatures
  /// of signed URLs and signed cookies. If not, this field is <code>false</code>.
  final bool enabled;

  /// The number of AWS accounts in the list.
  final int quantity;

  /// A list of AWS accounts and the identifiers of active CloudFront key pairs in
  /// each account that CloudFront can use to verify the signatures of signed URLs
  /// and signed cookies.
  final List<Signer> items;

  ActiveTrustedSigners({
    @_s.required this.enabled,
    @_s.required this.quantity,
    this.items,
  });
  factory ActiveTrustedSigners.fromXml(_s.XmlElement elem) {
    return ActiveTrustedSigners(
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) =>
          elem.findElements('Signer').map((c) => Signer.fromXml(c)).toList()),
    );
  }
}

/// AWS services in China customers must file for an Internet Content Provider
/// (ICP) recordal if they want to serve content publicly on an alternate domain
/// name, also known as a CNAME, that they've added to CloudFront.
/// AliasICPRecordal provides the ICP recordal status for CNAMEs associated with
/// distributions. The status is returned in the CloudFront response; you can't
/// configure it yourself.
///
/// For more information about ICP recordals, see <a
/// href="https://docs.amazonaws.cn/en_us/aws/latest/userguide/accounts-and-credentials.html">
/// Signup, Accounts, and Credentials</a> in <i>Getting Started with AWS
/// services in China</i>.
class AliasICPRecordal {
  /// A domain name associated with a distribution.
  final String cname;

  /// The Internet Content Provider (ICP) recordal status for a CNAME. The
  /// ICPRecordalStatus is set to APPROVED for all CNAMEs (aliases) in regions
  /// outside of China.
  ///
  /// The status values returned are the following:
  ///
  /// <ul>
  /// <li>
  /// <b>APPROVED</b> indicates that the associated CNAME has a valid ICP recordal
  /// number. Multiple CNAMEs can be associated with a distribution, and CNAMEs
  /// can correspond to different ICP recordals. To be marked as APPROVED, that
  /// is, valid to use with China region, a CNAME must have one ICP recordal
  /// number associated with it.
  /// </li>
  /// <li>
  /// <b>SUSPENDED</b> indicates that the associated CNAME does not have a valid
  /// ICP recordal number.
  /// </li>
  /// <li>
  /// <b>PENDING</b> indicates that CloudFront can't determine the ICP recordal
  /// status of the CNAME associated with the distribution because there was an
  /// error in trying to determine the status. You can try again to see if the
  /// error is resolved in which case CloudFront returns an APPROVED or SUSPENDED
  /// status.
  /// </li>
  /// </ul>
  final ICPRecordalStatus iCPRecordalStatus;

  AliasICPRecordal({
    this.cname,
    this.iCPRecordalStatus,
  });
  factory AliasICPRecordal.fromXml(_s.XmlElement elem) {
    return AliasICPRecordal(
      cname: _s.extractXmlStringValue(elem, 'CNAME'),
      iCPRecordalStatus: _s
          .extractXmlStringValue(elem, 'ICPRecordalStatus')
          ?.toICPRecordalStatus(),
    );
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
  final List<String> items;

  Aliases({
    @_s.required this.quantity,
    this.items,
  });
  factory Aliases.fromXml(_s.XmlElement elem) {
    return Aliases(
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s
          .extractXmlChild(elem, 'Items')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'CNAME')),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
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
      $children.where((e) => e != null),
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
  final CachedMethods cachedMethods;

  AllowedMethods({
    @_s.required this.items,
    @_s.required this.quantity,
    this.cachedMethods,
  });
  factory AllowedMethods.fromXml(_s.XmlElement elem) {
    return AllowedMethods(
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => _s
          .extractXmlStringListValues(elem, 'Method')
          .map((s) => s.toMethod())
          .toList()),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      cachedMethods: _s
          .extractXmlChild(elem, 'CachedMethods')
          ?.let((e) => CachedMethods.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      _s.XmlElement(
          _s.XmlName('Items'),
          [],
          items?.map(
              (e) => _s.encodeXmlStringValue('Method', e?.toValue() ?? ''))),
      if (cachedMethods != null) cachedMethods?.toXml('CachedMethods'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A complex type that describes how CloudFront processes requests.
///
/// You must create at least as many cache behaviors (including the default
/// cache behavior) as you have origins if you want CloudFront to serve objects
/// from all of the origins. Each cache behavior specifies the one origin from
/// which you want CloudFront to get objects. If you have two origins and only
/// the default cache behavior, the default cache behavior will cause CloudFront
/// to get objects from one of the origins, but the other origin is never used.
///
/// For the current quota (formerly known as limit) on the number of cache
/// behaviors that you can add to a distribution, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/cloudfront-limits.html">Quotas</a>
/// in the <i>Amazon CloudFront Developer Guide</i>.
///
/// If you don’t want to specify any cache behaviors, include only an empty
/// <code>CacheBehaviors</code> element. Don’t include an empty
/// <code>CacheBehavior</code> element because this is invalid.
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
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesCacheBehavior">Cache
/// Behavior Settings</a> in the <i>Amazon CloudFront Developer Guide</i>.
class CacheBehavior {
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
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesPathPattern">Path
  /// Pattern</a> in the <i> Amazon CloudFront Developer Guide</i>.
  final String pathPattern;

  /// The value of <code>ID</code> for the origin that you want CloudFront to
  /// route requests to when they match this cache behavior.
  final String targetOriginId;

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
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-https-viewers-to-cloudfront.html">Requiring
  /// HTTPS Between Viewers and CloudFront</a> in the <i>Amazon CloudFront
  /// Developer Guide</i>.
  /// <note>
  /// The only way to guarantee that viewers retrieve an object that was fetched
  /// from the origin using HTTPS is never to use any other protocol to fetch the
  /// object. If you have recently changed from HTTP to HTTPS, we recommend that
  /// you clear your objects’ cache because cached objects are protocol agnostic.
  /// That means that an edge location will return an object from the cache
  /// regardless of whether the current request protocol matches the protocol used
  /// previously. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Managing
  /// Cache Expiration</a> in the <i>Amazon CloudFront Developer Guide</i>.
  /// </note>
  final ViewerProtocolPolicy viewerProtocolPolicy;
  final AllowedMethods allowedMethods;

  /// The unique identifier of the cache policy that is attached to this cache
  /// behavior. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html#cache-key-create-cache-policy">Creating
  /// cache policies</a> or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html">Using
  /// the managed cache policies</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  final String cachePolicyId;

  /// Whether you want CloudFront to automatically compress certain files for this
  /// cache behavior. If so, specify true; if not, specify false. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/ServingCompressedFiles.html">Serving
  /// Compressed Files</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final bool compress;

  /// This field is deprecated. We recommend that you use the
  /// <code>DefaultTTL</code> field in a cache policy instead of this field. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html#cache-key-create-cache-policy">Creating
  /// cache policies</a> or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html">Using
  /// the managed cache policies</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  ///
  /// The default amount of time that you want objects to stay in CloudFront
  /// caches before CloudFront forwards another request to your origin to
  /// determine whether the object has been updated. The value that you specify
  /// applies only when your origin does not add HTTP headers such as
  /// <code>Cache-Control max-age</code>, <code>Cache-Control s-maxage</code>, and
  /// <code>Expires</code> to objects. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Managing
  /// How Long Content Stays in an Edge Cache (Expiration)</a> in the <i>Amazon
  /// CloudFront Developer Guide</i>.
  final int defaultTTL;

  /// The value of <code>ID</code> for the field-level encryption configuration
  /// that you want CloudFront to use for encrypting specific fields of data for
  /// this cache behavior.
  final String fieldLevelEncryptionId;

  /// This field is deprecated. We recommend that you use a cache policy or an
  /// origin request policy instead of this field. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/working-with-policies.html">Working
  /// with policies</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// If you want to include values in the cache key, use a cache policy. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html#cache-key-create-cache-policy">Creating
  /// cache policies</a> or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html">Using
  /// the managed cache policies</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  ///
  /// If you want to send values to the origin but not include them in the cache
  /// key, use an origin request policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-origin-requests.html#origin-request-create-origin-request-policy">Creating
  /// origin request policies</a> or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-origin-request-policies.html">Using
  /// the managed origin request policies</a> in the <i>Amazon CloudFront
  /// Developer Guide</i>.
  ///
  /// A complex type that specifies how CloudFront handles query strings, cookies,
  /// and HTTP headers.
  final ForwardedValues forwardedValues;

  /// A complex type that contains zero or more Lambda function associations for a
  /// cache behavior.
  final LambdaFunctionAssociations lambdaFunctionAssociations;

  /// This field is deprecated. We recommend that you use the <code>MaxTTL</code>
  /// field in a cache policy instead of this field. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html#cache-key-create-cache-policy">Creating
  /// cache policies</a> or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html">Using
  /// the managed cache policies</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  ///
  /// The maximum amount of time that you want objects to stay in CloudFront
  /// caches before CloudFront forwards another request to your origin to
  /// determine whether the object has been updated. The value that you specify
  /// applies only when your origin adds HTTP headers such as <code>Cache-Control
  /// max-age</code>, <code>Cache-Control s-maxage</code>, and
  /// <code>Expires</code> to objects. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Managing
  /// How Long Content Stays in an Edge Cache (Expiration)</a> in the <i>Amazon
  /// CloudFront Developer Guide</i>.
  final int maxTTL;

  /// This field is deprecated. We recommend that you use the <code>MinTTL</code>
  /// field in a cache policy instead of this field. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html#cache-key-create-cache-policy">Creating
  /// cache policies</a> or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html">Using
  /// the managed cache policies</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  ///
  /// The minimum amount of time that you want objects to stay in CloudFront
  /// caches before CloudFront forwards another request to your origin to
  /// determine whether the object has been updated. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">
  /// Managing How Long Content Stays in an Edge Cache (Expiration)</a> in the <i>
  /// Amazon CloudFront Developer Guide</i>.
  ///
  /// You must specify <code>0</code> for <code>MinTTL</code> if you configure
  /// CloudFront to forward all headers to your origin (under
  /// <code>Headers</code>, if you specify <code>1</code> for
  /// <code>Quantity</code> and <code>*</code> for <code>Name</code>).
  final int minTTL;

  /// The unique identifier of the origin request policy that is attached to this
  /// cache behavior. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-origin-requests.html#origin-request-create-origin-request-policy">Creating
  /// origin request policies</a> or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-origin-request-policies.html">Using
  /// the managed origin request policies</a> in the <i>Amazon CloudFront
  /// Developer Guide</i>.
  final String originRequestPolicyId;

  /// The Amazon Resource Name (ARN) of the real-time log configuration that is
  /// attached to this cache behavior. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/real-time-logs.html">Real-time
  /// logs</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final String realtimeLogConfigArn;

  /// Indicates whether you want to distribute media files in the Microsoft Smooth
  /// Streaming format using the origin that is associated with this cache
  /// behavior. If so, specify <code>true</code>; if not, specify
  /// <code>false</code>. If you specify <code>true</code> for
  /// <code>SmoothStreaming</code>, you can still distribute other content using
  /// this cache behavior if the content matches the value of
  /// <code>PathPattern</code>.
  final bool smoothStreaming;

  /// A list of key groups that CloudFront can use to validate signed URLs or
  /// signed cookies.
  ///
  /// When a cache behavior contains trusted key groups, CloudFront requires
  /// signed URLs or signed cookies for all requests that match the cache
  /// behavior. The URLs or cookies must be signed with a private key whose
  /// corresponding public key is in the key group. The signed URL or cookie
  /// contains information about which public key CloudFront should use to verify
  /// the signature. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving
  /// private content</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final TrustedKeyGroups trustedKeyGroups;

  /// <important>
  /// We recommend using <code>TrustedKeyGroups</code> instead of
  /// <code>TrustedSigners</code>.
  /// </important>
  /// A list of AWS account IDs whose public keys CloudFront can use to validate
  /// signed URLs or signed cookies.
  ///
  /// When a cache behavior contains trusted signers, CloudFront requires signed
  /// URLs or signed cookies for all requests that match the cache behavior. The
  /// URLs or cookies must be signed with the private key of a CloudFront key pair
  /// in the trusted signer’s AWS account. The signed URL or cookie contains
  /// information about which public key CloudFront should use to verify the
  /// signature. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving
  /// private content</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final TrustedSigners trustedSigners;

  CacheBehavior({
    @_s.required this.pathPattern,
    @_s.required this.targetOriginId,
    @_s.required this.viewerProtocolPolicy,
    this.allowedMethods,
    this.cachePolicyId,
    this.compress,
    this.defaultTTL,
    this.fieldLevelEncryptionId,
    this.forwardedValues,
    this.lambdaFunctionAssociations,
    this.maxTTL,
    this.minTTL,
    this.originRequestPolicyId,
    this.realtimeLogConfigArn,
    this.smoothStreaming,
    this.trustedKeyGroups,
    this.trustedSigners,
  });
  factory CacheBehavior.fromXml(_s.XmlElement elem) {
    return CacheBehavior(
      pathPattern: _s.extractXmlStringValue(elem, 'PathPattern'),
      targetOriginId: _s.extractXmlStringValue(elem, 'TargetOriginId'),
      viewerProtocolPolicy: _s
          .extractXmlStringValue(elem, 'ViewerProtocolPolicy')
          ?.toViewerProtocolPolicy(),
      allowedMethods: _s
          .extractXmlChild(elem, 'AllowedMethods')
          ?.let((e) => AllowedMethods.fromXml(e)),
      cachePolicyId: _s.extractXmlStringValue(elem, 'CachePolicyId'),
      compress: _s.extractXmlBoolValue(elem, 'Compress'),
      defaultTTL: _s.extractXmlIntValue(elem, 'DefaultTTL'),
      fieldLevelEncryptionId:
          _s.extractXmlStringValue(elem, 'FieldLevelEncryptionId'),
      forwardedValues: _s
          .extractXmlChild(elem, 'ForwardedValues')
          ?.let((e) => ForwardedValues.fromXml(e)),
      lambdaFunctionAssociations: _s
          .extractXmlChild(elem, 'LambdaFunctionAssociations')
          ?.let((e) => LambdaFunctionAssociations.fromXml(e)),
      maxTTL: _s.extractXmlIntValue(elem, 'MaxTTL'),
      minTTL: _s.extractXmlIntValue(elem, 'MinTTL'),
      originRequestPolicyId:
          _s.extractXmlStringValue(elem, 'OriginRequestPolicyId'),
      realtimeLogConfigArn:
          _s.extractXmlStringValue(elem, 'RealtimeLogConfigArn'),
      smoothStreaming: _s.extractXmlBoolValue(elem, 'SmoothStreaming'),
      trustedKeyGroups: _s
          .extractXmlChild(elem, 'TrustedKeyGroups')
          ?.let((e) => TrustedKeyGroups.fromXml(e)),
      trustedSigners: _s
          .extractXmlChild(elem, 'TrustedSigners')
          ?.let((e) => TrustedSigners.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('PathPattern', pathPattern),
      _s.encodeXmlStringValue('TargetOriginId', targetOriginId),
      if (trustedSigners != null) trustedSigners?.toXml('TrustedSigners'),
      if (trustedKeyGroups != null) trustedKeyGroups?.toXml('TrustedKeyGroups'),
      _s.encodeXmlStringValue(
          'ViewerProtocolPolicy', viewerProtocolPolicy?.toValue() ?? ''),
      if (allowedMethods != null) allowedMethods?.toXml('AllowedMethods'),
      if (smoothStreaming != null)
        _s.encodeXmlBoolValue('SmoothStreaming', smoothStreaming),
      if (compress != null) _s.encodeXmlBoolValue('Compress', compress),
      if (lambdaFunctionAssociations != null)
        lambdaFunctionAssociations?.toXml('LambdaFunctionAssociations'),
      if (fieldLevelEncryptionId != null)
        _s.encodeXmlStringValue(
            'FieldLevelEncryptionId', fieldLevelEncryptionId),
      if (realtimeLogConfigArn != null)
        _s.encodeXmlStringValue('RealtimeLogConfigArn', realtimeLogConfigArn),
      if (cachePolicyId != null)
        _s.encodeXmlStringValue('CachePolicyId', cachePolicyId),
      if (originRequestPolicyId != null)
        _s.encodeXmlStringValue('OriginRequestPolicyId', originRequestPolicyId),
      if (forwardedValues != null) forwardedValues?.toXml('ForwardedValues'),
      if (minTTL != null) _s.encodeXmlIntValue('MinTTL', minTTL),
      if (defaultTTL != null) _s.encodeXmlIntValue('DefaultTTL', defaultTTL),
      if (maxTTL != null) _s.encodeXmlIntValue('MaxTTL', maxTTL),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
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
  final List<CacheBehavior> items;

  CacheBehaviors({
    @_s.required this.quantity,
    this.items,
  });
  factory CacheBehaviors.fromXml(_s.XmlElement elem) {
    return CacheBehaviors(
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('CacheBehavior')
          .map((c) => CacheBehavior.fromXml(c))
          .toList()),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => e?.toXml('CacheBehavior'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A cache policy.
///
/// When it’s attached to a cache behavior, the cache policy determines the
/// following:
///
/// <ul>
/// <li>
/// The values that CloudFront includes in the cache key. These values can
/// include HTTP headers, cookies, and URL query strings. CloudFront uses the
/// cache key to find an object in its cache that it can return to the viewer.
/// </li>
/// <li>
/// The default, minimum, and maximum time to live (TTL) values that you want
/// objects to stay in the CloudFront cache.
/// </li>
/// </ul>
/// The headers, cookies, and query strings that are included in the cache key
/// are automatically included in requests that CloudFront sends to the origin.
/// CloudFront sends a request when it can’t find a valid object in its cache
/// that matches the request’s cache key. If you want to send values to the
/// origin but <i>not</i> include them in the cache key, use
/// <code>OriginRequestPolicy</code>.
class CachePolicy {
  /// The cache policy configuration.
  final CachePolicyConfig cachePolicyConfig;

  /// The unique identifier for the cache policy.
  final String id;

  /// The date and time when the cache policy was last modified.
  final DateTime lastModifiedTime;

  CachePolicy({
    @_s.required this.cachePolicyConfig,
    @_s.required this.id,
    @_s.required this.lastModifiedTime,
  });
  factory CachePolicy.fromXml(_s.XmlElement elem) {
    return CachePolicy(
      cachePolicyConfig: _s
          .extractXmlChild(elem, 'CachePolicyConfig')
          ?.let((e) => CachePolicyConfig.fromXml(e)),
      id: _s.extractXmlStringValue(elem, 'Id'),
      lastModifiedTime: _s.extractXmlDateTimeValue(elem, 'LastModifiedTime'),
    );
  }
}

/// A cache policy configuration.
///
/// This configuration determines the following:
///
/// <ul>
/// <li>
/// The values that CloudFront includes in the cache key. These values can
/// include HTTP headers, cookies, and URL query strings. CloudFront uses the
/// cache key to find an object in its cache that it can return to the viewer.
/// </li>
/// <li>
/// The default, minimum, and maximum time to live (TTL) values that you want
/// objects to stay in the CloudFront cache.
/// </li>
/// </ul>
/// The headers, cookies, and query strings that are included in the cache key
/// are automatically included in requests that CloudFront sends to the origin.
/// CloudFront sends a request when it can’t find a valid object in its cache
/// that matches the request’s cache key. If you want to send values to the
/// origin but <i>not</i> include them in the cache key, use
/// <code>OriginRequestPolicy</code>.
class CachePolicyConfig {
  /// The minimum amount of time, in seconds, that you want objects to stay in the
  /// CloudFront cache before CloudFront sends another request to the origin to
  /// see if the object has been updated. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Managing
  /// How Long Content Stays in an Edge Cache (Expiration)</a> in the <i>Amazon
  /// CloudFront Developer Guide</i>.
  final int minTTL;

  /// A unique name to identify the cache policy.
  final String name;

  /// A comment to describe the cache policy.
  final String comment;

  /// The default amount of time, in seconds, that you want objects to stay in the
  /// CloudFront cache before CloudFront sends another request to the origin to
  /// see if the object has been updated. CloudFront uses this value as the
  /// object’s time to live (TTL) only when the origin does <i>not</i> send
  /// <code>Cache-Control</code> or <code>Expires</code> headers with the object.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Managing
  /// How Long Content Stays in an Edge Cache (Expiration)</a> in the <i>Amazon
  /// CloudFront Developer Guide</i>.
  ///
  /// The default value for this field is 86400 seconds (one day). If the value of
  /// <code>MinTTL</code> is more than 86400 seconds, then the default value for
  /// this field is the same as the value of <code>MinTTL</code>.
  final int defaultTTL;

  /// The maximum amount of time, in seconds, that objects stay in the CloudFront
  /// cache before CloudFront sends another request to the origin to see if the
  /// object has been updated. CloudFront uses this value only when the origin
  /// sends <code>Cache-Control</code> or <code>Expires</code> headers with the
  /// object. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Managing
  /// How Long Content Stays in an Edge Cache (Expiration)</a> in the <i>Amazon
  /// CloudFront Developer Guide</i>.
  ///
  /// The default value for this field is 31536000 seconds (one year). If the
  /// value of <code>MinTTL</code> or <code>DefaultTTL</code> is more than
  /// 31536000 seconds, then the default value for this field is the same as the
  /// value of <code>DefaultTTL</code>.
  final int maxTTL;

  /// The HTTP headers, cookies, and URL query strings to include in the cache
  /// key. The values included in the cache key are automatically included in
  /// requests that CloudFront sends to the origin.
  final ParametersInCacheKeyAndForwardedToOrigin
      parametersInCacheKeyAndForwardedToOrigin;

  CachePolicyConfig({
    @_s.required this.minTTL,
    @_s.required this.name,
    this.comment,
    this.defaultTTL,
    this.maxTTL,
    this.parametersInCacheKeyAndForwardedToOrigin,
  });
  factory CachePolicyConfig.fromXml(_s.XmlElement elem) {
    return CachePolicyConfig(
      minTTL: _s.extractXmlIntValue(elem, 'MinTTL'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      comment: _s.extractXmlStringValue(elem, 'Comment'),
      defaultTTL: _s.extractXmlIntValue(elem, 'DefaultTTL'),
      maxTTL: _s.extractXmlIntValue(elem, 'MaxTTL'),
      parametersInCacheKeyAndForwardedToOrigin: _s
          .extractXmlChild(elem, 'ParametersInCacheKeyAndForwardedToOrigin')
          ?.let((e) => ParametersInCacheKeyAndForwardedToOrigin.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (comment != null) _s.encodeXmlStringValue('Comment', comment),
      _s.encodeXmlStringValue('Name', name),
      if (defaultTTL != null) _s.encodeXmlIntValue('DefaultTTL', defaultTTL),
      if (maxTTL != null) _s.encodeXmlIntValue('MaxTTL', maxTTL),
      _s.encodeXmlIntValue('MinTTL', minTTL),
      if (parametersInCacheKeyAndForwardedToOrigin != null)
        parametersInCacheKeyAndForwardedToOrigin
            ?.toXml('ParametersInCacheKeyAndForwardedToOrigin'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

enum CachePolicyCookieBehavior {
  none,
  whitelist,
  allExcept,
  all,
}

extension on CachePolicyCookieBehavior {
  String toValue() {
    switch (this) {
      case CachePolicyCookieBehavior.none:
        return 'none';
      case CachePolicyCookieBehavior.whitelist:
        return 'whitelist';
      case CachePolicyCookieBehavior.allExcept:
        return 'allExcept';
      case CachePolicyCookieBehavior.all:
        return 'all';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  CachePolicyCookieBehavior toCachePolicyCookieBehavior() {
    switch (this) {
      case 'none':
        return CachePolicyCookieBehavior.none;
      case 'whitelist':
        return CachePolicyCookieBehavior.whitelist;
      case 'allExcept':
        return CachePolicyCookieBehavior.allExcept;
      case 'all':
        return CachePolicyCookieBehavior.all;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// An object that determines whether any cookies in viewer requests (and if so,
/// which cookies) are included in the cache key and automatically included in
/// requests that CloudFront sends to the origin.
class CachePolicyCookiesConfig {
  /// Determines whether any cookies in viewer requests are included in the cache
  /// key and automatically included in requests that CloudFront sends to the
  /// origin. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>none</code> – Cookies in viewer requests are not included in the cache
  /// key and are not automatically included in requests that CloudFront sends to
  /// the origin. Even when this field is set to <code>none</code>, any cookies
  /// that are listed in an <code>OriginRequestPolicy</code> <i>are</i> included
  /// in origin requests.
  /// </li>
  /// <li>
  /// <code>whitelist</code> – The cookies in viewer requests that are listed in
  /// the <code>CookieNames</code> type are included in the cache key and
  /// automatically included in requests that CloudFront sends to the origin.
  /// </li>
  /// <li>
  /// <code>allExcept</code> – All cookies in viewer requests that are <i>
  /// <b>not</b> </i> listed in the <code>CookieNames</code> type are included in
  /// the cache key and automatically included in requests that CloudFront sends
  /// to the origin.
  /// </li>
  /// <li>
  /// <code>all</code> – All cookies in viewer requests are included in the cache
  /// key and are automatically included in requests that CloudFront sends to the
  /// origin.
  /// </li>
  /// </ul>
  final CachePolicyCookieBehavior cookieBehavior;
  final CookieNames cookies;

  CachePolicyCookiesConfig({
    @_s.required this.cookieBehavior,
    this.cookies,
  });
  factory CachePolicyCookiesConfig.fromXml(_s.XmlElement elem) {
    return CachePolicyCookiesConfig(
      cookieBehavior: _s
          .extractXmlStringValue(elem, 'CookieBehavior')
          ?.toCachePolicyCookieBehavior(),
      cookies: _s
          .extractXmlChild(elem, 'Cookies')
          ?.let((e) => CookieNames.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue(
          'CookieBehavior', cookieBehavior?.toValue() ?? ''),
      if (cookies != null) cookies?.toXml('Cookies'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

enum CachePolicyHeaderBehavior {
  none,
  whitelist,
}

extension on CachePolicyHeaderBehavior {
  String toValue() {
    switch (this) {
      case CachePolicyHeaderBehavior.none:
        return 'none';
      case CachePolicyHeaderBehavior.whitelist:
        return 'whitelist';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  CachePolicyHeaderBehavior toCachePolicyHeaderBehavior() {
    switch (this) {
      case 'none':
        return CachePolicyHeaderBehavior.none;
      case 'whitelist':
        return CachePolicyHeaderBehavior.whitelist;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// An object that determines whether any HTTP headers (and if so, which
/// headers) are included in the cache key and automatically included in
/// requests that CloudFront sends to the origin.
class CachePolicyHeadersConfig {
  /// Determines whether any HTTP headers are included in the cache key and
  /// automatically included in requests that CloudFront sends to the origin.
  /// Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>none</code> – HTTP headers are not included in the cache key and are
  /// not automatically included in requests that CloudFront sends to the origin.
  /// Even when this field is set to <code>none</code>, any headers that are
  /// listed in an <code>OriginRequestPolicy</code> <i>are</i> included in origin
  /// requests.
  /// </li>
  /// <li>
  /// <code>whitelist</code> – The HTTP headers that are listed in the
  /// <code>Headers</code> type are included in the cache key and are
  /// automatically included in requests that CloudFront sends to the origin.
  /// </li>
  /// </ul>
  final CachePolicyHeaderBehavior headerBehavior;
  final Headers headers;

  CachePolicyHeadersConfig({
    @_s.required this.headerBehavior,
    this.headers,
  });
  factory CachePolicyHeadersConfig.fromXml(_s.XmlElement elem) {
    return CachePolicyHeadersConfig(
      headerBehavior: _s
          .extractXmlStringValue(elem, 'HeaderBehavior')
          ?.toCachePolicyHeaderBehavior(),
      headers:
          _s.extractXmlChild(elem, 'Headers')?.let((e) => Headers.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue(
          'HeaderBehavior', headerBehavior?.toValue() ?? ''),
      if (headers != null) headers?.toXml('Headers'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A list of cache policies.
class CachePolicyList {
  /// The maximum number of cache policies requested.
  final int maxItems;

  /// The total number of cache policies returned in the response.
  final int quantity;

  /// Contains the cache policies in the list.
  final List<CachePolicySummary> items;

  /// If there are more items in the list than are in this response, this element
  /// is present. It contains the value that you should use in the
  /// <code>Marker</code> field of a subsequent request to continue listing cache
  /// policies where you left off.
  final String nextMarker;

  CachePolicyList({
    @_s.required this.maxItems,
    @_s.required this.quantity,
    this.items,
    this.nextMarker,
  });
  factory CachePolicyList.fromXml(_s.XmlElement elem) {
    return CachePolicyList(
      maxItems: _s.extractXmlIntValue(elem, 'MaxItems'),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('CachePolicySummary')
          .map((c) => CachePolicySummary.fromXml(c))
          .toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }
}

enum CachePolicyQueryStringBehavior {
  none,
  whitelist,
  allExcept,
  all,
}

extension on CachePolicyQueryStringBehavior {
  String toValue() {
    switch (this) {
      case CachePolicyQueryStringBehavior.none:
        return 'none';
      case CachePolicyQueryStringBehavior.whitelist:
        return 'whitelist';
      case CachePolicyQueryStringBehavior.allExcept:
        return 'allExcept';
      case CachePolicyQueryStringBehavior.all:
        return 'all';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  CachePolicyQueryStringBehavior toCachePolicyQueryStringBehavior() {
    switch (this) {
      case 'none':
        return CachePolicyQueryStringBehavior.none;
      case 'whitelist':
        return CachePolicyQueryStringBehavior.whitelist;
      case 'allExcept':
        return CachePolicyQueryStringBehavior.allExcept;
      case 'all':
        return CachePolicyQueryStringBehavior.all;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// An object that determines whether any URL query strings in viewer requests
/// (and if so, which query strings) are included in the cache key and
/// automatically included in requests that CloudFront sends to the origin.
class CachePolicyQueryStringsConfig {
  /// Determines whether any URL query strings in viewer requests are included in
  /// the cache key and automatically included in requests that CloudFront sends
  /// to the origin. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>none</code> – Query strings in viewer requests are not included in the
  /// cache key and are not automatically included in requests that CloudFront
  /// sends to the origin. Even when this field is set to <code>none</code>, any
  /// query strings that are listed in an <code>OriginRequestPolicy</code>
  /// <i>are</i> included in origin requests.
  /// </li>
  /// <li>
  /// <code>whitelist</code> – The query strings in viewer requests that are
  /// listed in the <code>QueryStringNames</code> type are included in the cache
  /// key and automatically included in requests that CloudFront sends to the
  /// origin.
  /// </li>
  /// <li>
  /// <code>allExcept</code> – All query strings in viewer requests that are <i>
  /// <b>not</b> </i> listed in the <code>QueryStringNames</code> type are
  /// included in the cache key and automatically included in requests that
  /// CloudFront sends to the origin.
  /// </li>
  /// <li>
  /// <code>all</code> – All query strings in viewer requests are included in the
  /// cache key and are automatically included in requests that CloudFront sends
  /// to the origin.
  /// </li>
  /// </ul>
  final CachePolicyQueryStringBehavior queryStringBehavior;

  /// Contains the specific query strings in viewer requests that either <i>
  /// <b>are</b> </i> or <i> <b>are not</b> </i> included in the cache key and
  /// automatically included in requests that CloudFront sends to the origin. The
  /// behavior depends on whether the <code>QueryStringBehavior</code> field in
  /// the <code>CachePolicyQueryStringsConfig</code> type is set to
  /// <code>whitelist</code> (the listed query strings <i> <b>are</b> </i>
  /// included) or <code>allExcept</code> (the listed query strings <i> <b>are
  /// not</b> </i> included, but all other query strings are).
  final QueryStringNames queryStrings;

  CachePolicyQueryStringsConfig({
    @_s.required this.queryStringBehavior,
    this.queryStrings,
  });
  factory CachePolicyQueryStringsConfig.fromXml(_s.XmlElement elem) {
    return CachePolicyQueryStringsConfig(
      queryStringBehavior: _s
          .extractXmlStringValue(elem, 'QueryStringBehavior')
          ?.toCachePolicyQueryStringBehavior(),
      queryStrings: _s
          .extractXmlChild(elem, 'QueryStrings')
          ?.let((e) => QueryStringNames.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue(
          'QueryStringBehavior', queryStringBehavior?.toValue() ?? ''),
      if (queryStrings != null) queryStrings?.toXml('QueryStrings'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// Contains a cache policy.
class CachePolicySummary {
  /// The cache policy.
  final CachePolicy cachePolicy;

  /// The type of cache policy, either <code>managed</code> (created by AWS) or
  /// <code>custom</code> (created in this AWS account).
  final CachePolicyType type;

  CachePolicySummary({
    @_s.required this.cachePolicy,
    @_s.required this.type,
  });
  factory CachePolicySummary.fromXml(_s.XmlElement elem) {
    return CachePolicySummary(
      cachePolicy: _s
          .extractXmlChild(elem, 'CachePolicy')
          ?.let((e) => CachePolicy.fromXml(e)),
      type: _s.extractXmlStringValue(elem, 'Type')?.toCachePolicyType(),
    );
  }
}

enum CachePolicyType {
  managed,
  custom,
}

extension on CachePolicyType {
  String toValue() {
    switch (this) {
      case CachePolicyType.managed:
        return 'managed';
      case CachePolicyType.custom:
        return 'custom';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  CachePolicyType toCachePolicyType() {
    switch (this) {
      case 'managed':
        return CachePolicyType.managed;
      case 'custom':
        return CachePolicyType.custom;
    }
    throw Exception('Unknown enum value: $this');
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
    @_s.required this.items,
    @_s.required this.quantity,
  });
  factory CachedMethods.fromXml(_s.XmlElement elem) {
    return CachedMethods(
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => _s
          .extractXmlStringListValues(elem, 'Method')
          .map((s) => s.toMethod())
          .toList()),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      _s.XmlElement(
          _s.XmlName('Items'),
          [],
          items?.map(
              (e) => _s.encodeXmlStringValue('Method', e?.toValue() ?? ''))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
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
    throw Exception('Unknown enum value: $this');
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
    throw Exception('Unknown enum value: $this');
  }
}

/// CloudFront origin access identity.
class CloudFrontOriginAccessIdentity {
  /// The ID for the origin access identity, for example,
  /// <code>E74FTE3AJFJ256A</code>.
  final String id;

  /// The Amazon S3 canonical user ID for the origin access identity, used when
  /// giving the origin access identity read permission to an object in Amazon S3.
  final String s3CanonicalUserId;

  /// The current configuration information for the identity.
  final CloudFrontOriginAccessIdentityConfig
      cloudFrontOriginAccessIdentityConfig;

  CloudFrontOriginAccessIdentity({
    @_s.required this.id,
    @_s.required this.s3CanonicalUserId,
    this.cloudFrontOriginAccessIdentityConfig,
  });
  factory CloudFrontOriginAccessIdentity.fromXml(_s.XmlElement elem) {
    return CloudFrontOriginAccessIdentity(
      id: _s.extractXmlStringValue(elem, 'Id'),
      s3CanonicalUserId: _s.extractXmlStringValue(elem, 'S3CanonicalUserId'),
      cloudFrontOriginAccessIdentityConfig: _s
          .extractXmlChild(elem, 'CloudFrontOriginAccessIdentityConfig')
          ?.let((e) => CloudFrontOriginAccessIdentityConfig.fromXml(e)),
    );
  }
}

/// Origin access identity configuration. Send a <code>GET</code> request to the
/// <code>/<i>CloudFront API version</i>/CloudFront/identity ID/config</code>
/// resource.
class CloudFrontOriginAccessIdentityConfig {
  /// A unique value (for example, a date-time stamp) that ensures that the
  /// request can't be replayed.
  ///
  /// If the value of <code>CallerReference</code> is new (regardless of the
  /// content of the <code>CloudFrontOriginAccessIdentityConfig</code> object), a
  /// new origin access identity is created.
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
    @_s.required this.callerReference,
    @_s.required this.comment,
  });
  factory CloudFrontOriginAccessIdentityConfig.fromXml(_s.XmlElement elem) {
    return CloudFrontOriginAccessIdentityConfig(
      callerReference: _s.extractXmlStringValue(elem, 'CallerReference'),
      comment: _s.extractXmlStringValue(elem, 'Comment'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
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
      $children.where((e) => e != null),
    );
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
  final List<CloudFrontOriginAccessIdentitySummary> items;

  /// If <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value you can use for the <code>Marker</code> request
  /// parameter to continue listing your origin access identities where they left
  /// off.
  final String nextMarker;

  CloudFrontOriginAccessIdentityList({
    @_s.required this.isTruncated,
    @_s.required this.marker,
    @_s.required this.maxItems,
    @_s.required this.quantity,
    this.items,
    this.nextMarker,
  });
  factory CloudFrontOriginAccessIdentityList.fromXml(_s.XmlElement elem) {
    return CloudFrontOriginAccessIdentityList(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      maxItems: _s.extractXmlIntValue(elem, 'MaxItems'),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('CloudFrontOriginAccessIdentitySummary')
          .map((c) => CloudFrontOriginAccessIdentitySummary.fromXml(c))
          .toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
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
    @_s.required this.comment,
    @_s.required this.id,
    @_s.required this.s3CanonicalUserId,
  });
  factory CloudFrontOriginAccessIdentitySummary.fromXml(_s.XmlElement elem) {
    return CloudFrontOriginAccessIdentitySummary(
      comment: _s.extractXmlStringValue(elem, 'Comment'),
      id: _s.extractXmlStringValue(elem, 'Id'),
      s3CanonicalUserId: _s.extractXmlStringValue(elem, 'S3CanonicalUserId'),
    );
  }
}

/// A field-level encryption content type profile.
class ContentTypeProfile {
  /// The content type for a field-level encryption content type-profile mapping.
  final String contentType;

  /// The format for a field-level encryption content type-profile mapping.
  final Format format;

  /// The profile ID for a field-level encryption content type-profile mapping.
  final String profileId;

  ContentTypeProfile({
    @_s.required this.contentType,
    @_s.required this.format,
    this.profileId,
  });
  factory ContentTypeProfile.fromXml(_s.XmlElement elem) {
    return ContentTypeProfile(
      contentType: _s.extractXmlStringValue(elem, 'ContentType'),
      format: _s.extractXmlStringValue(elem, 'Format')?.toFormat(),
      profileId: _s.extractXmlStringValue(elem, 'ProfileId'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Format', format?.toValue() ?? ''),
      if (profileId != null) _s.encodeXmlStringValue('ProfileId', profileId),
      _s.encodeXmlStringValue('ContentType', contentType),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// The configuration for a field-level encryption content type-profile mapping.
class ContentTypeProfileConfig {
  /// The setting in a field-level encryption content type-profile mapping that
  /// specifies what to do when an unknown content type is provided for the
  /// profile. If true, content is forwarded without being encrypted when the
  /// content type is unknown. If false (the default), an error is returned when
  /// the content type is unknown.
  final bool forwardWhenContentTypeIsUnknown;

  /// The configuration for a field-level encryption content type-profile.
  final ContentTypeProfiles contentTypeProfiles;

  ContentTypeProfileConfig({
    @_s.required this.forwardWhenContentTypeIsUnknown,
    this.contentTypeProfiles,
  });
  factory ContentTypeProfileConfig.fromXml(_s.XmlElement elem) {
    return ContentTypeProfileConfig(
      forwardWhenContentTypeIsUnknown:
          _s.extractXmlBoolValue(elem, 'ForwardWhenContentTypeIsUnknown'),
      contentTypeProfiles: _s
          .extractXmlChild(elem, 'ContentTypeProfiles')
          ?.let((e) => ContentTypeProfiles.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlBoolValue(
          'ForwardWhenContentTypeIsUnknown', forwardWhenContentTypeIsUnknown),
      if (contentTypeProfiles != null)
        contentTypeProfiles?.toXml('ContentTypeProfiles'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// Field-level encryption content type-profile.
class ContentTypeProfiles {
  /// The number of field-level encryption content type-profile mappings.
  final int quantity;

  /// Items in a field-level encryption content type-profile mapping.
  final List<ContentTypeProfile> items;

  ContentTypeProfiles({
    @_s.required this.quantity,
    this.items,
  });
  factory ContentTypeProfiles.fromXml(_s.XmlElement elem) {
    return ContentTypeProfiles(
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('ContentTypeProfile')
          .map((c) => ContentTypeProfile.fromXml(c))
          .toList()),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => e?.toXml('ContentTypeProfile'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// Contains a list of cookie names.
class CookieNames {
  /// The number of cookie names in the <code>Items</code> list.
  final int quantity;

  /// A list of cookie names.
  final List<String> items;

  CookieNames({
    @_s.required this.quantity,
    this.items,
  });
  factory CookieNames.fromXml(_s.XmlElement elem) {
    return CookieNames(
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s
          .extractXmlChild(elem, 'Items')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Name')),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
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
      $children.where((e) => e != null),
    );
  }
}

/// This field is deprecated. We recommend that you use a cache policy or an
/// origin request policy instead of this field.
///
/// If you want to include cookies in the cache key, use
/// <code>CookiesConfig</code> in a cache policy. See <code>CachePolicy</code>.
///
/// If you want to send cookies to the origin but not include them in the cache
/// key, use <code>CookiesConfig</code> in an origin request policy. See
/// <code>OriginRequestPolicy</code>.
///
/// A complex type that specifies whether you want CloudFront to forward cookies
/// to the origin and, if so, which ones. For more information about forwarding
/// cookies to the origin, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Cookies.html">Caching
/// Content Based on Cookies</a> in the <i>Amazon CloudFront Developer
/// Guide</i>.
class CookiePreference {
  /// This field is deprecated. We recommend that you use a cache policy or an
  /// origin request policy instead of this field.
  ///
  /// If you want to include cookies in the cache key, use a cache policy. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html#cache-key-create-cache-policy">Creating
  /// cache policies</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// If you want to send cookies to the origin but not include them in the cache
  /// key, use origin request policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-origin-requests.html#origin-request-create-origin-request-policy">Creating
  /// origin request policies</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// Specifies which cookies to forward to the origin for this cache behavior:
  /// all, none, or the list of cookies specified in the
  /// <code>WhitelistedNames</code> complex type.
  ///
  /// Amazon S3 doesn't process cookies. When the cache behavior is forwarding
  /// requests to an Amazon S3 origin, specify none for the <code>Forward</code>
  /// element.
  final ItemSelection forward;

  /// This field is deprecated. We recommend that you use a cache policy or an
  /// origin request policy instead of this field.
  ///
  /// If you want to include cookies in the cache key, use a cache policy. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html#cache-key-create-cache-policy">Creating
  /// cache policies</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// If you want to send cookies to the origin but not include them in the cache
  /// key, use an origin request policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-origin-requests.html#origin-request-create-origin-request-policy">Creating
  /// origin request policies</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// Required if you specify <code>whitelist</code> for the value of
  /// <code>Forward</code>. A complex type that specifies how many different
  /// cookies you want CloudFront to forward to the origin for this cache behavior
  /// and, if you want to forward selected cookies, the names of those cookies.
  ///
  /// If you specify <code>all</code> or <code>none</code> for the value of
  /// <code>Forward</code>, omit <code>WhitelistedNames</code>. If you change the
  /// value of <code>Forward</code> from <code>whitelist</code> to
  /// <code>all</code> or <code>none</code> and you don't delete the
  /// <code>WhitelistedNames</code> element and its child elements, CloudFront
  /// deletes them automatically.
  ///
  /// For the current limit on the number of cookie names that you can whitelist
  /// for each cache behavior, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/xrefaws_service_limits.html#limits_cloudfront">
  /// CloudFront Limits</a> in the <i>AWS General Reference</i>.
  final CookieNames whitelistedNames;

  CookiePreference({
    @_s.required this.forward,
    this.whitelistedNames,
  });
  factory CookiePreference.fromXml(_s.XmlElement elem) {
    return CookiePreference(
      forward: _s.extractXmlStringValue(elem, 'Forward')?.toItemSelection(),
      whitelistedNames: _s
          .extractXmlChild(elem, 'WhitelistedNames')
          ?.let((e) => CookieNames.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Forward', forward?.toValue() ?? ''),
      if (whitelistedNames != null) whitelistedNames?.toXml('WhitelistedNames'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

class CreateCachePolicyResult {
  /// A cache policy.
  final CachePolicy cachePolicy;

  /// The current version of the cache policy.
  final String eTag;

  /// The fully qualified URI of the cache policy just created.
  final String location;

  CreateCachePolicyResult({
    this.cachePolicy,
    this.eTag,
    this.location,
  });
}

/// The returned result of the corresponding request.
class CreateCloudFrontOriginAccessIdentityResult {
  /// The origin access identity's information.
  final CloudFrontOriginAccessIdentity cloudFrontOriginAccessIdentity;

  /// The current version of the origin access identity created.
  final String eTag;

  /// The fully qualified URI of the new origin access identity just created.
  final String location;

  CreateCloudFrontOriginAccessIdentityResult({
    this.cloudFrontOriginAccessIdentity,
    this.eTag,
    this.location,
  });
}

/// The returned result of the corresponding request.
class CreateDistributionResult {
  /// The distribution's information.
  final Distribution distribution;

  /// The current version of the distribution created.
  final String eTag;

  /// The fully qualified URI of the new distribution resource just created.
  final String location;

  CreateDistributionResult({
    this.distribution,
    this.eTag,
    this.location,
  });
}

/// The returned result of the corresponding request.
class CreateDistributionWithTagsResult {
  /// The distribution's information.
  final Distribution distribution;

  /// The current version of the distribution created.
  final String eTag;

  /// The fully qualified URI of the new distribution resource just created.
  final String location;

  CreateDistributionWithTagsResult({
    this.distribution,
    this.eTag,
    this.location,
  });
}

class CreateFieldLevelEncryptionConfigResult {
  /// The current version of the field level encryption configuration. For
  /// example: <code>E2QWRUHAPOMQZL</code>.
  final String eTag;

  /// Returned when you create a new field-level encryption configuration.
  final FieldLevelEncryption fieldLevelEncryption;

  /// The fully qualified URI of the new configuration resource just created.
  final String location;

  CreateFieldLevelEncryptionConfigResult({
    this.eTag,
    this.fieldLevelEncryption,
    this.location,
  });
}

class CreateFieldLevelEncryptionProfileResult {
  /// The current version of the field level encryption profile. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  final String eTag;

  /// Returned when you create a new field-level encryption profile.
  final FieldLevelEncryptionProfile fieldLevelEncryptionProfile;

  /// The fully qualified URI of the new profile resource just created.
  final String location;

  CreateFieldLevelEncryptionProfileResult({
    this.eTag,
    this.fieldLevelEncryptionProfile,
    this.location,
  });
}

/// The returned result of the corresponding request.
class CreateInvalidationResult {
  /// The invalidation's information.
  final Invalidation invalidation;

  /// The fully qualified URI of the distribution and invalidation batch request,
  /// including the <code>Invalidation ID</code>.
  final String location;

  CreateInvalidationResult({
    this.invalidation,
    this.location,
  });
}

class CreateKeyGroupResult {
  /// The identifier for this version of the key group.
  final String eTag;

  /// The key group that was just created.
  final KeyGroup keyGroup;

  /// The URL of the key group.
  final String location;

  CreateKeyGroupResult({
    this.eTag,
    this.keyGroup,
    this.location,
  });
}

class CreateMonitoringSubscriptionResult {
  /// A monitoring subscription. This structure contains information about whether
  /// additional CloudWatch metrics are enabled for a given CloudFront
  /// distribution.
  final MonitoringSubscription monitoringSubscription;

  CreateMonitoringSubscriptionResult({
    this.monitoringSubscription,
  });
  factory CreateMonitoringSubscriptionResult.fromXml(_s.XmlElement elem) {
    return CreateMonitoringSubscriptionResult(
      monitoringSubscription:
          elem?.let((e) => MonitoringSubscription.fromXml(e)),
    );
  }
}

class CreateOriginRequestPolicyResult {
  /// The current version of the origin request policy.
  final String eTag;

  /// The fully qualified URI of the origin request policy just created.
  final String location;

  /// An origin request policy.
  final OriginRequestPolicy originRequestPolicy;

  CreateOriginRequestPolicyResult({
    this.eTag,
    this.location,
    this.originRequestPolicy,
  });
}

class CreatePublicKeyResult {
  /// The identifier for this version of the public key.
  final String eTag;

  /// The URL of the public key.
  final String location;

  /// The public key.
  final PublicKey publicKey;

  CreatePublicKeyResult({
    this.eTag,
    this.location,
    this.publicKey,
  });
}

class CreateRealtimeLogConfigRequest {
  /// Contains information about the Amazon Kinesis data stream where you are
  /// sending real-time log data.
  final List<EndPoint> endPoints;

  /// A list of fields to include in each real-time log record.
  ///
  /// For more information about fields, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/real-time-logs.html#understand-real-time-log-config-fields">Real-time
  /// log configuration fields</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  final List<String> fields;

  /// A unique name to identify this real-time log configuration.
  final String name;

  /// The sampling rate for this real-time log configuration. The sampling rate
  /// determines the percentage of viewer requests that are represented in the
  /// real-time log data. You must provide an integer between 1 and 100,
  /// inclusive.
  final int samplingRate;

  CreateRealtimeLogConfigRequest({
    @_s.required this.endPoints,
    @_s.required this.fields,
    @_s.required this.name,
    @_s.required this.samplingRate,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.XmlElement(_s.XmlName('EndPoints'), [],
          endPoints?.map((e) => e?.toXml('member'))),
      _s.XmlElement(_s.XmlName('Fields'), [],
          fields?.map((e) => _s.encodeXmlStringValue('Field', e))),
      _s.encodeXmlStringValue('Name', name),
      _s.encodeXmlIntValue('SamplingRate', samplingRate),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

class CreateRealtimeLogConfigResult {
  /// A real-time log configuration.
  final RealtimeLogConfig realtimeLogConfig;

  CreateRealtimeLogConfigResult({
    this.realtimeLogConfig,
  });
  factory CreateRealtimeLogConfigResult.fromXml(_s.XmlElement elem) {
    return CreateRealtimeLogConfigResult(
      realtimeLogConfig: _s
          .extractXmlChild(elem, 'RealtimeLogConfig')
          ?.let((e) => RealtimeLogConfig.fromXml(e)),
    );
  }
}

/// The returned result of the corresponding request.
class CreateStreamingDistributionResult {
  /// The current version of the streaming distribution created.
  final String eTag;

  /// The fully qualified URI of the new streaming distribution resource just
  /// created.
  final String location;

  /// The streaming distribution's information.
  final StreamingDistribution streamingDistribution;

  CreateStreamingDistributionResult({
    this.eTag,
    this.location,
    this.streamingDistribution,
  });
}

/// The returned result of the corresponding request.
class CreateStreamingDistributionWithTagsResult {
  /// The current version of the distribution created.
  final String eTag;

  /// The fully qualified URI of the new streaming distribution resource just
  /// created.
  final String location;

  /// The streaming distribution's information.
  final StreamingDistribution streamingDistribution;

  CreateStreamingDistributionWithTagsResult({
    this.eTag,
    this.location,
    this.streamingDistribution,
  });
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
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html">Customizing
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
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html">Customizing
  /// Error Responses</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final int errorCachingMinTTL;

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
  /// a value for <code>ResponsePagePath</code>.
  final String responseCode;

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
  /// specify a value for <code>ResponseCode</code>.
  ///
  /// We recommend that you store custom error pages in an Amazon S3 bucket. If
  /// you store custom error pages on an HTTP server and the server starts to
  /// return 5xx errors, CloudFront can't get the files that you want to return to
  /// viewers because the origin server is unavailable.
  final String responsePagePath;

  CustomErrorResponse({
    @_s.required this.errorCode,
    this.errorCachingMinTTL,
    this.responseCode,
    this.responsePagePath,
  });
  factory CustomErrorResponse.fromXml(_s.XmlElement elem) {
    return CustomErrorResponse(
      errorCode: _s.extractXmlIntValue(elem, 'ErrorCode'),
      errorCachingMinTTL: _s.extractXmlIntValue(elem, 'ErrorCachingMinTTL'),
      responseCode: _s.extractXmlStringValue(elem, 'ResponseCode'),
      responsePagePath: _s.extractXmlStringValue(elem, 'ResponsePagePath'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
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
      $children.where((e) => e != null),
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
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html">Customizing
/// Error Responses</a> in the <i>Amazon CloudFront Developer Guide</i>.
class CustomErrorResponses {
  /// The number of HTTP status codes for which you want to specify a custom error
  /// page and/or a caching duration. If <code>Quantity</code> is <code>0</code>,
  /// you can omit <code>Items</code>.
  final int quantity;

  /// A complex type that contains a <code>CustomErrorResponse</code> element for
  /// each HTTP status code for which you want to specify a custom error page
  /// and/or a caching duration.
  final List<CustomErrorResponse> items;

  CustomErrorResponses({
    @_s.required this.quantity,
    this.items,
  });
  factory CustomErrorResponses.fromXml(_s.XmlElement elem) {
    return CustomErrorResponses(
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('CustomErrorResponse')
          .map((c) => CustomErrorResponse.fromXml(c))
          .toList()),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => e?.toXml('CustomErrorResponse'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
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
  final List<OriginCustomHeader> items;

  CustomHeaders({
    @_s.required this.quantity,
    this.items,
  });
  factory CustomHeaders.fromXml(_s.XmlElement elem) {
    return CustomHeaders(
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('OriginCustomHeader')
          .map((c) => OriginCustomHeader.fromXml(c))
          .toList()),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => e?.toXml('OriginCustomHeader'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A custom origin. A custom origin is any origin that is <i>not</i> an Amazon
/// S3 bucket, with one exception. An Amazon S3 bucket that is <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html">configured
/// with static website hosting</a> <i>is</i> a custom origin.
class CustomOriginConfig {
  /// The HTTP port that CloudFront uses to connect to the origin. Specify the
  /// HTTP port that the origin listens on.
  final int hTTPPort;

  /// The HTTPS port that CloudFront uses to connect to the origin. Specify the
  /// HTTPS port that the origin listens on.
  final int hTTPSPort;

  /// Specifies the protocol (HTTP or HTTPS) that CloudFront uses to connect to
  /// the origin. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>http-only</code> – CloudFront always uses HTTP to connect to the
  /// origin.
  /// </li>
  /// <li>
  /// <code>match-viewer</code> – CloudFront connects to the origin using the same
  /// protocol that the viewer used to connect to CloudFront.
  /// </li>
  /// <li>
  /// <code>https-only</code> – CloudFront always uses HTTPS to connect to the
  /// origin.
  /// </li>
  /// </ul>
  final OriginProtocolPolicy originProtocolPolicy;

  /// Specifies how long, in seconds, CloudFront persists its connection to the
  /// origin. The minimum timeout is 1 second, the maximum is 60 seconds, and the
  /// default (if you don’t specify otherwise) is 5 seconds.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesOriginKeepaliveTimeout">Origin
  /// Keep-alive Timeout</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final int originKeepaliveTimeout;

  /// Specifies how long, in seconds, CloudFront waits for a response from the
  /// origin. This is also known as the <i>origin response timeout</i>. The
  /// minimum timeout is 1 second, the maximum is 60 seconds, and the default (if
  /// you don’t specify otherwise) is 30 seconds.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesOriginResponseTimeout">Origin
  /// Response Timeout</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final int originReadTimeout;

  /// Specifies the minimum SSL/TLS protocol that CloudFront uses when connecting
  /// to your origin over HTTPS. Valid values include <code>SSLv3</code>,
  /// <code>TLSv1</code>, <code>TLSv1.1</code>, and <code>TLSv1.2</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesOriginSSLProtocols">Minimum
  /// Origin SSL Protocol</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final OriginSslProtocols originSslProtocols;

  CustomOriginConfig({
    @_s.required this.hTTPPort,
    @_s.required this.hTTPSPort,
    @_s.required this.originProtocolPolicy,
    this.originKeepaliveTimeout,
    this.originReadTimeout,
    this.originSslProtocols,
  });
  factory CustomOriginConfig.fromXml(_s.XmlElement elem) {
    return CustomOriginConfig(
      hTTPPort: _s.extractXmlIntValue(elem, 'HTTPPort'),
      hTTPSPort: _s.extractXmlIntValue(elem, 'HTTPSPort'),
      originProtocolPolicy: _s
          .extractXmlStringValue(elem, 'OriginProtocolPolicy')
          ?.toOriginProtocolPolicy(),
      originKeepaliveTimeout:
          _s.extractXmlIntValue(elem, 'OriginKeepaliveTimeout'),
      originReadTimeout: _s.extractXmlIntValue(elem, 'OriginReadTimeout'),
      originSslProtocols: _s
          .extractXmlChild(elem, 'OriginSslProtocols')
          ?.let((e) => OriginSslProtocols.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('HTTPPort', hTTPPort),
      _s.encodeXmlIntValue('HTTPSPort', hTTPSPort),
      _s.encodeXmlStringValue(
          'OriginProtocolPolicy', originProtocolPolicy?.toValue() ?? ''),
      if (originSslProtocols != null)
        originSslProtocols?.toXml('OriginSslProtocols'),
      if (originReadTimeout != null)
        _s.encodeXmlIntValue('OriginReadTimeout', originReadTimeout),
      if (originKeepaliveTimeout != null)
        _s.encodeXmlIntValue('OriginKeepaliveTimeout', originKeepaliveTimeout),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A complex type that describes the default cache behavior if you don’t
/// specify a <code>CacheBehavior</code> element or if request URLs don’t match
/// any of the values of <code>PathPattern</code> in <code>CacheBehavior</code>
/// elements. You must create exactly one default cache behavior.
class DefaultCacheBehavior {
  /// The value of <code>ID</code> for the origin that you want CloudFront to
  /// route requests to when they use the default cache behavior.
  final String targetOriginId;

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
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-https-viewers-to-cloudfront.html">Requiring
  /// HTTPS Between Viewers and CloudFront</a> in the <i>Amazon CloudFront
  /// Developer Guide</i>.
  /// <note>
  /// The only way to guarantee that viewers retrieve an object that was fetched
  /// from the origin using HTTPS is never to use any other protocol to fetch the
  /// object. If you have recently changed from HTTP to HTTPS, we recommend that
  /// you clear your objects’ cache because cached objects are protocol agnostic.
  /// That means that an edge location will return an object from the cache
  /// regardless of whether the current request protocol matches the protocol used
  /// previously. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Managing
  /// Cache Expiration</a> in the <i>Amazon CloudFront Developer Guide</i>.
  /// </note>
  final ViewerProtocolPolicy viewerProtocolPolicy;
  final AllowedMethods allowedMethods;

  /// The unique identifier of the cache policy that is attached to the default
  /// cache behavior. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html#cache-key-create-cache-policy">Creating
  /// cache policies</a> or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html">Using
  /// the managed cache policies</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  final String cachePolicyId;

  /// Whether you want CloudFront to automatically compress certain files for this
  /// cache behavior. If so, specify <code>true</code>; if not, specify
  /// <code>false</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/ServingCompressedFiles.html">Serving
  /// Compressed Files</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final bool compress;

  /// This field is deprecated. We recommend that you use the
  /// <code>DefaultTTL</code> field in a cache policy instead of this field. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html#cache-key-create-cache-policy">Creating
  /// cache policies</a> or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html">Using
  /// the managed cache policies</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  ///
  /// The default amount of time that you want objects to stay in CloudFront
  /// caches before CloudFront forwards another request to your origin to
  /// determine whether the object has been updated. The value that you specify
  /// applies only when your origin does not add HTTP headers such as
  /// <code>Cache-Control max-age</code>, <code>Cache-Control s-maxage</code>, and
  /// <code>Expires</code> to objects. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Managing
  /// How Long Content Stays in an Edge Cache (Expiration)</a> in the <i>Amazon
  /// CloudFront Developer Guide</i>.
  final int defaultTTL;

  /// The value of <code>ID</code> for the field-level encryption configuration
  /// that you want CloudFront to use for encrypting specific fields of data for
  /// the default cache behavior.
  final String fieldLevelEncryptionId;

  /// This field is deprecated. We recommend that you use a cache policy or an
  /// origin request policy instead of this field. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/working-with-policies.html">Working
  /// with policies</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// If you want to include values in the cache key, use a cache policy. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html#cache-key-create-cache-policy">Creating
  /// cache policies</a> or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html">Using
  /// the managed cache policies</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  ///
  /// If you want to send values to the origin but not include them in the cache
  /// key, use an origin request policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-origin-requests.html#origin-request-create-origin-request-policy">Creating
  /// origin request policies</a> or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-origin-request-policies.html">Using
  /// the managed origin request policies</a> in the <i>Amazon CloudFront
  /// Developer Guide</i>.
  ///
  /// A complex type that specifies how CloudFront handles query strings, cookies,
  /// and HTTP headers.
  final ForwardedValues forwardedValues;

  /// A complex type that contains zero or more Lambda function associations for a
  /// cache behavior.
  final LambdaFunctionAssociations lambdaFunctionAssociations;

  /// This field is deprecated. We recommend that you use the <code>MaxTTL</code>
  /// field in a cache policy instead of this field. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html#cache-key-create-cache-policy">Creating
  /// cache policies</a> or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html">Using
  /// the managed cache policies</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  ///
  /// The maximum amount of time that you want objects to stay in CloudFront
  /// caches before CloudFront forwards another request to your origin to
  /// determine whether the object has been updated. The value that you specify
  /// applies only when your origin adds HTTP headers such as <code>Cache-Control
  /// max-age</code>, <code>Cache-Control s-maxage</code>, and
  /// <code>Expires</code> to objects. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Managing
  /// How Long Content Stays in an Edge Cache (Expiration)</a> in the <i>Amazon
  /// CloudFront Developer Guide</i>.
  final int maxTTL;

  /// This field is deprecated. We recommend that you use the <code>MinTTL</code>
  /// field in a cache policy instead of this field. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html#cache-key-create-cache-policy">Creating
  /// cache policies</a> or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html">Using
  /// the managed cache policies</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  ///
  /// The minimum amount of time that you want objects to stay in CloudFront
  /// caches before CloudFront forwards another request to your origin to
  /// determine whether the object has been updated. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Expiration.html">Managing
  /// How Long Content Stays in an Edge Cache (Expiration)</a> in the <i>Amazon
  /// CloudFront Developer Guide</i>.
  ///
  /// You must specify <code>0</code> for <code>MinTTL</code> if you configure
  /// CloudFront to forward all headers to your origin (under
  /// <code>Headers</code>, if you specify <code>1</code> for
  /// <code>Quantity</code> and <code>*</code> for <code>Name</code>).
  final int minTTL;

  /// The unique identifier of the origin request policy that is attached to the
  /// default cache behavior. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-origin-requests.html#origin-request-create-origin-request-policy">Creating
  /// origin request policies</a> or <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-origin-request-policies.html">Using
  /// the managed origin request policies</a> in the <i>Amazon CloudFront
  /// Developer Guide</i>.
  final String originRequestPolicyId;

  /// The Amazon Resource Name (ARN) of the real-time log configuration that is
  /// attached to this cache behavior. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/real-time-logs.html">Real-time
  /// logs</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final String realtimeLogConfigArn;

  /// Indicates whether you want to distribute media files in the Microsoft Smooth
  /// Streaming format using the origin that is associated with this cache
  /// behavior. If so, specify <code>true</code>; if not, specify
  /// <code>false</code>. If you specify <code>true</code> for
  /// <code>SmoothStreaming</code>, you can still distribute other content using
  /// this cache behavior if the content matches the value of
  /// <code>PathPattern</code>.
  final bool smoothStreaming;

  /// A list of key groups that CloudFront can use to validate signed URLs or
  /// signed cookies.
  ///
  /// When a cache behavior contains trusted key groups, CloudFront requires
  /// signed URLs or signed cookies for all requests that match the cache
  /// behavior. The URLs or cookies must be signed with a private key whose
  /// corresponding public key is in the key group. The signed URL or cookie
  /// contains information about which public key CloudFront should use to verify
  /// the signature. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving
  /// private content</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final TrustedKeyGroups trustedKeyGroups;

  /// <important>
  /// We recommend using <code>TrustedKeyGroups</code> instead of
  /// <code>TrustedSigners</code>.
  /// </important>
  /// A list of AWS account IDs whose public keys CloudFront can use to validate
  /// signed URLs or signed cookies.
  ///
  /// When a cache behavior contains trusted signers, CloudFront requires signed
  /// URLs or signed cookies for all requests that match the cache behavior. The
  /// URLs or cookies must be signed with the private key of a CloudFront key pair
  /// in a trusted signer’s AWS account. The signed URL or cookie contains
  /// information about which public key CloudFront should use to verify the
  /// signature. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving
  /// private content</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final TrustedSigners trustedSigners;

  DefaultCacheBehavior({
    @_s.required this.targetOriginId,
    @_s.required this.viewerProtocolPolicy,
    this.allowedMethods,
    this.cachePolicyId,
    this.compress,
    this.defaultTTL,
    this.fieldLevelEncryptionId,
    this.forwardedValues,
    this.lambdaFunctionAssociations,
    this.maxTTL,
    this.minTTL,
    this.originRequestPolicyId,
    this.realtimeLogConfigArn,
    this.smoothStreaming,
    this.trustedKeyGroups,
    this.trustedSigners,
  });
  factory DefaultCacheBehavior.fromXml(_s.XmlElement elem) {
    return DefaultCacheBehavior(
      targetOriginId: _s.extractXmlStringValue(elem, 'TargetOriginId'),
      viewerProtocolPolicy: _s
          .extractXmlStringValue(elem, 'ViewerProtocolPolicy')
          ?.toViewerProtocolPolicy(),
      allowedMethods: _s
          .extractXmlChild(elem, 'AllowedMethods')
          ?.let((e) => AllowedMethods.fromXml(e)),
      cachePolicyId: _s.extractXmlStringValue(elem, 'CachePolicyId'),
      compress: _s.extractXmlBoolValue(elem, 'Compress'),
      defaultTTL: _s.extractXmlIntValue(elem, 'DefaultTTL'),
      fieldLevelEncryptionId:
          _s.extractXmlStringValue(elem, 'FieldLevelEncryptionId'),
      forwardedValues: _s
          .extractXmlChild(elem, 'ForwardedValues')
          ?.let((e) => ForwardedValues.fromXml(e)),
      lambdaFunctionAssociations: _s
          .extractXmlChild(elem, 'LambdaFunctionAssociations')
          ?.let((e) => LambdaFunctionAssociations.fromXml(e)),
      maxTTL: _s.extractXmlIntValue(elem, 'MaxTTL'),
      minTTL: _s.extractXmlIntValue(elem, 'MinTTL'),
      originRequestPolicyId:
          _s.extractXmlStringValue(elem, 'OriginRequestPolicyId'),
      realtimeLogConfigArn:
          _s.extractXmlStringValue(elem, 'RealtimeLogConfigArn'),
      smoothStreaming: _s.extractXmlBoolValue(elem, 'SmoothStreaming'),
      trustedKeyGroups: _s
          .extractXmlChild(elem, 'TrustedKeyGroups')
          ?.let((e) => TrustedKeyGroups.fromXml(e)),
      trustedSigners: _s
          .extractXmlChild(elem, 'TrustedSigners')
          ?.let((e) => TrustedSigners.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('TargetOriginId', targetOriginId),
      if (trustedSigners != null) trustedSigners?.toXml('TrustedSigners'),
      if (trustedKeyGroups != null) trustedKeyGroups?.toXml('TrustedKeyGroups'),
      _s.encodeXmlStringValue(
          'ViewerProtocolPolicy', viewerProtocolPolicy?.toValue() ?? ''),
      if (allowedMethods != null) allowedMethods?.toXml('AllowedMethods'),
      if (smoothStreaming != null)
        _s.encodeXmlBoolValue('SmoothStreaming', smoothStreaming),
      if (compress != null) _s.encodeXmlBoolValue('Compress', compress),
      if (lambdaFunctionAssociations != null)
        lambdaFunctionAssociations?.toXml('LambdaFunctionAssociations'),
      if (fieldLevelEncryptionId != null)
        _s.encodeXmlStringValue(
            'FieldLevelEncryptionId', fieldLevelEncryptionId),
      if (realtimeLogConfigArn != null)
        _s.encodeXmlStringValue('RealtimeLogConfigArn', realtimeLogConfigArn),
      if (cachePolicyId != null)
        _s.encodeXmlStringValue('CachePolicyId', cachePolicyId),
      if (originRequestPolicyId != null)
        _s.encodeXmlStringValue('OriginRequestPolicyId', originRequestPolicyId),
      if (forwardedValues != null) forwardedValues?.toXml('ForwardedValues'),
      if (minTTL != null) _s.encodeXmlIntValue('MinTTL', minTTL),
      if (defaultTTL != null) _s.encodeXmlIntValue('DefaultTTL', defaultTTL),
      if (maxTTL != null) _s.encodeXmlIntValue('MaxTTL', maxTTL),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

class DeleteMonitoringSubscriptionResult {
  DeleteMonitoringSubscriptionResult();
  factory DeleteMonitoringSubscriptionResult.fromXml(
      // ignore: avoid_unused_constructor_parameters
      _s.XmlElement elem) {
    return DeleteMonitoringSubscriptionResult();
  }
}

class DeleteRealtimeLogConfigRequest {
  /// The Amazon Resource Name (ARN) of the real-time log configuration to delete.
  final String arn;

  /// The name of the real-time log configuration to delete.
  final String name;

  DeleteRealtimeLogConfigRequest({
    this.arn,
    this.name,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (name != null) _s.encodeXmlStringValue('Name', name),
      if (arn != null) _s.encodeXmlStringValue('ARN', arn),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A distribution tells CloudFront where you want content to be delivered from,
/// and the details about how to track and manage content delivery.
class Distribution {
  /// The ARN (Amazon Resource Name) for the distribution. For example:
  /// <code>arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5</code>,
  /// where <code>123456789012</code> is your AWS account ID.
  final String arn;

  /// The current configuration information for the distribution. Send a
  /// <code>GET</code> request to the <code>/<i>CloudFront API
  /// version</i>/distribution ID/config</code> resource.
  final DistributionConfig distributionConfig;

  /// The domain name corresponding to the distribution, for example,
  /// <code>d111111abcdef8.cloudfront.net</code>.
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

  /// CloudFront automatically adds this field to the response if you’ve
  /// configured a cache behavior in this distribution to serve private content
  /// using key groups. This field contains a list of key groups and the public
  /// keys in each key group that CloudFront can use to verify the signatures of
  /// signed URLs or signed cookies.
  final ActiveTrustedKeyGroups activeTrustedKeyGroups;

  /// <important>
  /// We recommend using <code>TrustedKeyGroups</code> instead of
  /// <code>TrustedSigners</code>.
  /// </important>
  /// CloudFront automatically adds this field to the response if you’ve
  /// configured a cache behavior in this distribution to serve private content
  /// using trusted signers. This field contains a list of AWS account IDs and the
  /// active CloudFront key pairs in each account that CloudFront can use to
  /// verify the signatures of signed URLs or signed cookies.
  final ActiveTrustedSigners activeTrustedSigners;

  /// AWS services in China customers must file for an Internet Content Provider
  /// (ICP) recordal if they want to serve content publicly on an alternate domain
  /// name, also known as a CNAME, that they've added to CloudFront.
  /// AliasICPRecordal provides the ICP recordal status for CNAMEs associated with
  /// distributions.
  ///
  /// For more information about ICP recordals, see <a
  /// href="https://docs.amazonaws.cn/en_us/aws/latest/userguide/accounts-and-credentials.html">
  /// Signup, Accounts, and Credentials</a> in <i>Getting Started with AWS
  /// services in China</i>.
  final List<AliasICPRecordal> aliasICPRecordals;

  Distribution({
    @_s.required this.arn,
    @_s.required this.distributionConfig,
    @_s.required this.domainName,
    @_s.required this.id,
    @_s.required this.inProgressInvalidationBatches,
    @_s.required this.lastModifiedTime,
    @_s.required this.status,
    this.activeTrustedKeyGroups,
    this.activeTrustedSigners,
    this.aliasICPRecordals,
  });
  factory Distribution.fromXml(_s.XmlElement elem) {
    return Distribution(
      arn: _s.extractXmlStringValue(elem, 'ARN'),
      distributionConfig: _s
          .extractXmlChild(elem, 'DistributionConfig')
          ?.let((e) => DistributionConfig.fromXml(e)),
      domainName: _s.extractXmlStringValue(elem, 'DomainName'),
      id: _s.extractXmlStringValue(elem, 'Id'),
      inProgressInvalidationBatches:
          _s.extractXmlIntValue(elem, 'InProgressInvalidationBatches'),
      lastModifiedTime: _s.extractXmlDateTimeValue(elem, 'LastModifiedTime'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      activeTrustedKeyGroups: _s
          .extractXmlChild(elem, 'ActiveTrustedKeyGroups')
          ?.let((e) => ActiveTrustedKeyGroups.fromXml(e)),
      activeTrustedSigners: _s
          .extractXmlChild(elem, 'ActiveTrustedSigners')
          ?.let((e) => ActiveTrustedSigners.fromXml(e)),
      aliasICPRecordals: _s.extractXmlChild(elem, 'AliasICPRecordals')?.let(
          (elem) => elem
              .findElements('AliasICPRecordal')
              .map((c) => AliasICPRecordal.fromXml(c))
              .toList()),
    );
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
  /// If <code>CallerReference</code> is a value that you already sent in a
  /// previous request to create a distribution, CloudFront returns a
  /// <code>DistributionAlreadyExists</code> error.
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

  /// A complex type that describes the default cache behavior if you don't
  /// specify a <code>CacheBehavior</code> element or if files don't match any of
  /// the values of <code>PathPattern</code> in <code>CacheBehavior</code>
  /// elements. You must create exactly one default cache behavior.
  final DefaultCacheBehavior defaultCacheBehavior;

  /// From this field, you can enable or disable the selected distribution.
  final bool enabled;

  /// A complex type that contains information about origins for this
  /// distribution.
  final Origins origins;

  /// A complex type that contains information about CNAMEs (alternate domain
  /// names), if any, for this distribution.
  final Aliases aliases;

  /// A complex type that contains zero or more <code>CacheBehavior</code>
  /// elements.
  final CacheBehaviors cacheBehaviors;

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
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html">Customizing
  /// Error Responses</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final CustomErrorResponses customErrorResponses;

  /// The object that you want CloudFront to request from your origin (for
  /// example, <code>index.html</code>) when a viewer requests the root URL for
  /// your distribution (<code>http://www.example.com</code>) instead of an object
  /// in your distribution
  /// (<code>http://www.example.com/product-description.html</code>). Specifying a
  /// default root object avoids exposing the contents of your distribution.
  ///
  /// Specify only the object name, for example, <code>index.html</code>. Don't
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
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/DefaultRootObject.html">Creating
  /// a Default Root Object</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final String defaultRootObject;

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
  final HttpVersion httpVersion;

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
  /// addresses that can access your content, don't enable IPv6. If you want to
  /// restrict access to some content by IP address and not restrict access to
  /// other content (or restrict access but not by IP address), you can create two
  /// distributions. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-creating-signed-url-custom-policy.html">Creating
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
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-to-cloudfront-distribution.html">Routing
  /// Traffic to an Amazon CloudFront Web Distribution by Using Your Domain
  /// Name</a> in the <i>Amazon Route 53 Developer Guide</i>.
  ///
  /// If you created a CNAME resource record set, either with Amazon Route 53 or
  /// with another DNS service, you don't need to make any changes. A CNAME record
  /// will route traffic to your distribution regardless of the IP address format
  /// of the viewer request.
  final bool isIPV6Enabled;

  /// A complex type that controls whether access logs are written for the
  /// distribution.
  ///
  /// For more information about logging, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/AccessLogs.html">Access
  /// Logs</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final LoggingConfig logging;

  /// A complex type that contains information about origin groups for this
  /// distribution.
  final OriginGroups originGroups;

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
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PriceClass.html">Choosing
  /// the Price Class for a CloudFront Distribution</a> in the <i>Amazon
  /// CloudFront Developer Guide</i>. For information about CloudFront pricing,
  /// including how price classes (such as Price Class 100) map to CloudFront
  /// regions, see <a href="http://aws.amazon.com/cloudfront/pricing/">Amazon
  /// CloudFront Pricing</a>.
  final PriceClass priceClass;

  /// A complex type that identifies ways in which you want to restrict
  /// distribution of your content.
  final Restrictions restrictions;

  /// A complex type that determines the distribution’s SSL/TLS configuration for
  /// communicating with viewers.
  final ViewerCertificate viewerCertificate;

  /// A unique identifier that specifies the AWS WAF web ACL, if any, to associate
  /// with this distribution. To specify a web ACL created using the latest
  /// version of AWS WAF, use the ACL ARN, for example
  /// <code>arn:aws:wafv2:us-east-1:123456789012:global/webacl/ExampleWebACL/473e64fd-f30b-4765-81a0-62ad96dd167a</code>.
  /// To specify a web ACL created using AWS WAF Classic, use the ACL ID, for
  /// example <code>473e64fd-f30b-4765-81a0-62ad96dd167a</code>.
  ///
  /// AWS WAF is a web application firewall that lets you monitor the HTTP and
  /// HTTPS requests that are forwarded to CloudFront, and lets you control access
  /// to your content. Based on conditions that you specify, such as the IP
  /// addresses that requests originate from or the values of query strings,
  /// CloudFront responds to requests either with the requested content or with an
  /// HTTP 403 status code (Forbidden). You can also configure CloudFront to
  /// return a custom error page when a request is blocked. For more information
  /// about AWS WAF, see the <a
  /// href="https://docs.aws.amazon.com/waf/latest/developerguide/what-is-aws-waf.html">AWS
  /// WAF Developer Guide</a>.
  final String webACLId;

  DistributionConfig({
    @_s.required this.callerReference,
    @_s.required this.comment,
    @_s.required this.defaultCacheBehavior,
    @_s.required this.enabled,
    @_s.required this.origins,
    this.aliases,
    this.cacheBehaviors,
    this.customErrorResponses,
    this.defaultRootObject,
    this.httpVersion,
    this.isIPV6Enabled,
    this.logging,
    this.originGroups,
    this.priceClass,
    this.restrictions,
    this.viewerCertificate,
    this.webACLId,
  });
  factory DistributionConfig.fromXml(_s.XmlElement elem) {
    return DistributionConfig(
      callerReference: _s.extractXmlStringValue(elem, 'CallerReference'),
      comment: _s.extractXmlStringValue(elem, 'Comment'),
      defaultCacheBehavior: _s
          .extractXmlChild(elem, 'DefaultCacheBehavior')
          ?.let((e) => DefaultCacheBehavior.fromXml(e)),
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      origins:
          _s.extractXmlChild(elem, 'Origins')?.let((e) => Origins.fromXml(e)),
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
      originGroups: _s
          .extractXmlChild(elem, 'OriginGroups')
          ?.let((e) => OriginGroups.fromXml(e)),
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('CallerReference', callerReference),
      if (aliases != null) aliases?.toXml('Aliases'),
      if (defaultRootObject != null)
        _s.encodeXmlStringValue('DefaultRootObject', defaultRootObject),
      origins?.toXml('Origins'),
      if (originGroups != null) originGroups?.toXml('OriginGroups'),
      defaultCacheBehavior?.toXml('DefaultCacheBehavior'),
      if (cacheBehaviors != null) cacheBehaviors?.toXml('CacheBehaviors'),
      if (customErrorResponses != null)
        customErrorResponses?.toXml('CustomErrorResponses'),
      _s.encodeXmlStringValue('Comment', comment),
      if (logging != null) logging?.toXml('Logging'),
      if (priceClass != null)
        _s.encodeXmlStringValue('PriceClass', priceClass.toValue()),
      _s.encodeXmlBoolValue('Enabled', enabled),
      if (viewerCertificate != null)
        viewerCertificate?.toXml('ViewerCertificate'),
      if (restrictions != null) restrictions?.toXml('Restrictions'),
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
      $children.where((e) => e != null),
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
    @_s.required this.distributionConfig,
    @_s.required this.tags,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      distributionConfig?.toXml('DistributionConfig'),
      tags?.toXml('Tags'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A list of distribution IDs.
class DistributionIdList {
  /// A flag that indicates whether more distribution IDs remain to be listed. If
  /// your results were truncated, you can make a subsequent request using the
  /// <code>Marker</code> request field to retrieve more distribution IDs in the
  /// list.
  final bool isTruncated;

  /// The value provided in the <code>Marker</code> request field.
  final String marker;

  /// The maximum number of distribution IDs requested.
  final int maxItems;

  /// The total number of distribution IDs returned in the response.
  final int quantity;

  /// Contains the distribution IDs in the list.
  final List<String> items;

  /// Contains the value that you should use in the <code>Marker</code> field of a
  /// subsequent request to continue listing distribution IDs where you left off.
  final String nextMarker;

  DistributionIdList({
    @_s.required this.isTruncated,
    @_s.required this.marker,
    @_s.required this.maxItems,
    @_s.required this.quantity,
    this.items,
    this.nextMarker,
  });
  factory DistributionIdList.fromXml(_s.XmlElement elem) {
    return DistributionIdList(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      maxItems: _s.extractXmlIntValue(elem, 'MaxItems'),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let(
          (elem) => _s.extractXmlStringListValues(elem, 'DistributionId')),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
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
  final List<DistributionSummary> items;

  /// If <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value you can use for the <code>Marker</code> request
  /// parameter to continue listing your distributions where they left off.
  final String nextMarker;

  DistributionList({
    @_s.required this.isTruncated,
    @_s.required this.marker,
    @_s.required this.maxItems,
    @_s.required this.quantity,
    this.items,
    this.nextMarker,
  });
  factory DistributionList.fromXml(_s.XmlElement elem) {
    return DistributionList(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      maxItems: _s.extractXmlIntValue(elem, 'MaxItems'),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('DistributionSummary')
          .map((c) => DistributionSummary.fromXml(c))
          .toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
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

  /// A complex type that describes the default cache behavior if you don't
  /// specify a <code>CacheBehavior</code> element or if files don't match any of
  /// the values of <code>PathPattern</code> in <code>CacheBehavior</code>
  /// elements. You must create exactly one default cache behavior.
  final DefaultCacheBehavior defaultCacheBehavior;

  /// The domain name that corresponds to the distribution, for example,
  /// <code>d111111abcdef8.cloudfront.net</code>.
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

  /// A complex type that contains information about price class for this
  /// streaming distribution.
  final PriceClass priceClass;

  /// A complex type that identifies ways in which you want to restrict
  /// distribution of your content.
  final Restrictions restrictions;

  /// The current status of the distribution. When the status is
  /// <code>Deployed</code>, the distribution's information is propagated to all
  /// CloudFront edge locations.
  final String status;

  /// A complex type that determines the distribution’s SSL/TLS configuration for
  /// communicating with viewers.
  final ViewerCertificate viewerCertificate;

  /// The Web ACL Id (if any) associated with the distribution.
  final String webACLId;

  /// AWS services in China customers must file for an Internet Content Provider
  /// (ICP) recordal if they want to serve content publicly on an alternate domain
  /// name, also known as a CNAME, that they've added to CloudFront.
  /// AliasICPRecordal provides the ICP recordal status for CNAMEs associated with
  /// distributions.
  ///
  /// For more information about ICP recordals, see <a
  /// href="https://docs.amazonaws.cn/en_us/aws/latest/userguide/accounts-and-credentials.html">
  /// Signup, Accounts, and Credentials</a> in <i>Getting Started with AWS
  /// services in China</i>.
  final List<AliasICPRecordal> aliasICPRecordals;

  /// A complex type that contains information about origin groups for this
  /// distribution.
  final OriginGroups originGroups;

  DistributionSummary({
    @_s.required this.arn,
    @_s.required this.aliases,
    @_s.required this.cacheBehaviors,
    @_s.required this.comment,
    @_s.required this.customErrorResponses,
    @_s.required this.defaultCacheBehavior,
    @_s.required this.domainName,
    @_s.required this.enabled,
    @_s.required this.httpVersion,
    @_s.required this.id,
    @_s.required this.isIPV6Enabled,
    @_s.required this.lastModifiedTime,
    @_s.required this.origins,
    @_s.required this.priceClass,
    @_s.required this.restrictions,
    @_s.required this.status,
    @_s.required this.viewerCertificate,
    @_s.required this.webACLId,
    this.aliasICPRecordals,
    this.originGroups,
  });
  factory DistributionSummary.fromXml(_s.XmlElement elem) {
    return DistributionSummary(
      arn: _s.extractXmlStringValue(elem, 'ARN'),
      aliases:
          _s.extractXmlChild(elem, 'Aliases')?.let((e) => Aliases.fromXml(e)),
      cacheBehaviors: _s
          .extractXmlChild(elem, 'CacheBehaviors')
          ?.let((e) => CacheBehaviors.fromXml(e)),
      comment: _s.extractXmlStringValue(elem, 'Comment'),
      customErrorResponses: _s
          .extractXmlChild(elem, 'CustomErrorResponses')
          ?.let((e) => CustomErrorResponses.fromXml(e)),
      defaultCacheBehavior: _s
          .extractXmlChild(elem, 'DefaultCacheBehavior')
          ?.let((e) => DefaultCacheBehavior.fromXml(e)),
      domainName: _s.extractXmlStringValue(elem, 'DomainName'),
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      httpVersion:
          _s.extractXmlStringValue(elem, 'HttpVersion')?.toHttpVersion(),
      id: _s.extractXmlStringValue(elem, 'Id'),
      isIPV6Enabled: _s.extractXmlBoolValue(elem, 'IsIPV6Enabled'),
      lastModifiedTime: _s.extractXmlDateTimeValue(elem, 'LastModifiedTime'),
      origins:
          _s.extractXmlChild(elem, 'Origins')?.let((e) => Origins.fromXml(e)),
      priceClass: _s.extractXmlStringValue(elem, 'PriceClass')?.toPriceClass(),
      restrictions: _s
          .extractXmlChild(elem, 'Restrictions')
          ?.let((e) => Restrictions.fromXml(e)),
      status: _s.extractXmlStringValue(elem, 'Status'),
      viewerCertificate: _s
          .extractXmlChild(elem, 'ViewerCertificate')
          ?.let((e) => ViewerCertificate.fromXml(e)),
      webACLId: _s.extractXmlStringValue(elem, 'WebACLId'),
      aliasICPRecordals: _s.extractXmlChild(elem, 'AliasICPRecordals')?.let(
          (elem) => elem
              .findElements('AliasICPRecordal')
              .map((c) => AliasICPRecordal.fromXml(c))
              .toList()),
      originGroups: _s
          .extractXmlChild(elem, 'OriginGroups')
          ?.let((e) => OriginGroups.fromXml(e)),
    );
  }
}

/// Complex data type for field-level encryption profiles that includes all of
/// the encryption entities.
class EncryptionEntities {
  /// Number of field pattern items in a field-level encryption content
  /// type-profile mapping.
  final int quantity;

  /// An array of field patterns in a field-level encryption content type-profile
  /// mapping.
  final List<EncryptionEntity> items;

  EncryptionEntities({
    @_s.required this.quantity,
    this.items,
  });
  factory EncryptionEntities.fromXml(_s.XmlElement elem) {
    return EncryptionEntities(
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('EncryptionEntity')
          .map((c) => EncryptionEntity.fromXml(c))
          .toList()),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => e?.toXml('EncryptionEntity'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// Complex data type for field-level encryption profiles that includes the
/// encryption key and field pattern specifications.
class EncryptionEntity {
  /// Field patterns in a field-level encryption content type profile specify the
  /// fields that you want to be encrypted. You can provide the full field name,
  /// or any beginning characters followed by a wildcard (*). You can't overlap
  /// field patterns. For example, you can't have both ABC* and AB*. Note that
  /// field patterns are case-sensitive.
  final FieldPatterns fieldPatterns;

  /// The provider associated with the public key being used for encryption. This
  /// value must also be provided with the private key for applications to be able
  /// to decrypt data.
  final String providerId;

  /// The public key associated with a set of field-level encryption patterns, to
  /// be used when encrypting the fields that match the patterns.
  final String publicKeyId;

  EncryptionEntity({
    @_s.required this.fieldPatterns,
    @_s.required this.providerId,
    @_s.required this.publicKeyId,
  });
  factory EncryptionEntity.fromXml(_s.XmlElement elem) {
    return EncryptionEntity(
      fieldPatterns: _s
          .extractXmlChild(elem, 'FieldPatterns')
          ?.let((e) => FieldPatterns.fromXml(e)),
      providerId: _s.extractXmlStringValue(elem, 'ProviderId'),
      publicKeyId: _s.extractXmlStringValue(elem, 'PublicKeyId'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('PublicKeyId', publicKeyId),
      _s.encodeXmlStringValue('ProviderId', providerId),
      fieldPatterns?.toXml('FieldPatterns'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// Contains information about the Amazon Kinesis data stream where you are
/// sending real-time log data in a real-time log configuration.
class EndPoint {
  /// The type of data stream where you are sending real-time log data. The only
  /// valid value is <code>Kinesis</code>.
  final String streamType;

  /// Contains information about the Amazon Kinesis data stream where you are
  /// sending real-time log data.
  final KinesisStreamConfig kinesisStreamConfig;

  EndPoint({
    @_s.required this.streamType,
    this.kinesisStreamConfig,
  });
  factory EndPoint.fromXml(_s.XmlElement elem) {
    return EndPoint(
      streamType: _s.extractXmlStringValue(elem, 'StreamType'),
      kinesisStreamConfig: _s
          .extractXmlChild(elem, 'KinesisStreamConfig')
          ?.let((e) => KinesisStreamConfig.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('StreamType', streamType),
      if (kinesisStreamConfig != null)
        kinesisStreamConfig?.toXml('KinesisStreamConfig'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
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
    throw Exception('Unknown enum value: $this');
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
    throw Exception('Unknown enum value: $this');
  }
}

/// A complex data type that includes the profile configurations and other
/// options specified for field-level encryption.
class FieldLevelEncryption {
  /// A complex data type that includes the profile configurations specified for
  /// field-level encryption.
  final FieldLevelEncryptionConfig fieldLevelEncryptionConfig;

  /// The configuration ID for a field-level encryption configuration which
  /// includes a set of profiles that specify certain selected data fields to be
  /// encrypted by specific public keys.
  final String id;

  /// The last time the field-level encryption configuration was changed.
  final DateTime lastModifiedTime;

  FieldLevelEncryption({
    @_s.required this.fieldLevelEncryptionConfig,
    @_s.required this.id,
    @_s.required this.lastModifiedTime,
  });
  factory FieldLevelEncryption.fromXml(_s.XmlElement elem) {
    return FieldLevelEncryption(
      fieldLevelEncryptionConfig: _s
          .extractXmlChild(elem, 'FieldLevelEncryptionConfig')
          ?.let((e) => FieldLevelEncryptionConfig.fromXml(e)),
      id: _s.extractXmlStringValue(elem, 'Id'),
      lastModifiedTime: _s.extractXmlDateTimeValue(elem, 'LastModifiedTime'),
    );
  }
}

/// A complex data type that includes the profile configurations specified for
/// field-level encryption.
class FieldLevelEncryptionConfig {
  /// A unique number that ensures the request can't be replayed.
  final String callerReference;

  /// An optional comment about the configuration.
  final String comment;

  /// A complex data type that specifies when to forward content if a content type
  /// isn't recognized and profiles to use as by default in a request if a query
  /// argument doesn't specify a profile to use.
  final ContentTypeProfileConfig contentTypeProfileConfig;

  /// A complex data type that specifies when to forward content if a profile
  /// isn't found and the profile that can be provided as a query argument in a
  /// request.
  final QueryArgProfileConfig queryArgProfileConfig;

  FieldLevelEncryptionConfig({
    @_s.required this.callerReference,
    this.comment,
    this.contentTypeProfileConfig,
    this.queryArgProfileConfig,
  });
  factory FieldLevelEncryptionConfig.fromXml(_s.XmlElement elem) {
    return FieldLevelEncryptionConfig(
      callerReference: _s.extractXmlStringValue(elem, 'CallerReference'),
      comment: _s.extractXmlStringValue(elem, 'Comment'),
      contentTypeProfileConfig: _s
          .extractXmlChild(elem, 'ContentTypeProfileConfig')
          ?.let((e) => ContentTypeProfileConfig.fromXml(e)),
      queryArgProfileConfig: _s
          .extractXmlChild(elem, 'QueryArgProfileConfig')
          ?.let((e) => QueryArgProfileConfig.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('CallerReference', callerReference),
      if (comment != null) _s.encodeXmlStringValue('Comment', comment),
      if (queryArgProfileConfig != null)
        queryArgProfileConfig?.toXml('QueryArgProfileConfig'),
      if (contentTypeProfileConfig != null)
        contentTypeProfileConfig?.toXml('ContentTypeProfileConfig'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// List of field-level encrpytion configurations.
class FieldLevelEncryptionList {
  /// The maximum number of elements you want in the response body.
  final int maxItems;

  /// The number of field-level encryption items.
  final int quantity;

  /// An array of field-level encryption items.
  final List<FieldLevelEncryptionSummary> items;

  /// If there are more elements to be listed, this element is present and
  /// contains the value that you can use for the <code>Marker</code> request
  /// parameter to continue listing your configurations where you left off.
  final String nextMarker;

  FieldLevelEncryptionList({
    @_s.required this.maxItems,
    @_s.required this.quantity,
    this.items,
    this.nextMarker,
  });
  factory FieldLevelEncryptionList.fromXml(_s.XmlElement elem) {
    return FieldLevelEncryptionList(
      maxItems: _s.extractXmlIntValue(elem, 'MaxItems'),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('FieldLevelEncryptionSummary')
          .map((c) => FieldLevelEncryptionSummary.fromXml(c))
          .toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }
}

/// A complex data type for field-level encryption profiles.
class FieldLevelEncryptionProfile {
  /// A complex data type that includes the profile name and the encryption
  /// entities for the field-level encryption profile.
  final FieldLevelEncryptionProfileConfig fieldLevelEncryptionProfileConfig;

  /// The ID for a field-level encryption profile configuration which includes a
  /// set of profiles that specify certain selected data fields to be encrypted by
  /// specific public keys.
  final String id;

  /// The last time the field-level encryption profile was updated.
  final DateTime lastModifiedTime;

  FieldLevelEncryptionProfile({
    @_s.required this.fieldLevelEncryptionProfileConfig,
    @_s.required this.id,
    @_s.required this.lastModifiedTime,
  });
  factory FieldLevelEncryptionProfile.fromXml(_s.XmlElement elem) {
    return FieldLevelEncryptionProfile(
      fieldLevelEncryptionProfileConfig: _s
          .extractXmlChild(elem, 'FieldLevelEncryptionProfileConfig')
          ?.let((e) => FieldLevelEncryptionProfileConfig.fromXml(e)),
      id: _s.extractXmlStringValue(elem, 'Id'),
      lastModifiedTime: _s.extractXmlDateTimeValue(elem, 'LastModifiedTime'),
    );
  }
}

/// A complex data type of profiles for the field-level encryption.
class FieldLevelEncryptionProfileConfig {
  /// A unique number that ensures that the request can't be replayed.
  final String callerReference;

  /// A complex data type of encryption entities for the field-level encryption
  /// profile that include the public key ID, provider, and field patterns for
  /// specifying which fields to encrypt with this key.
  final EncryptionEntities encryptionEntities;

  /// Profile name for the field-level encryption profile.
  final String name;

  /// An optional comment for the field-level encryption profile.
  final String comment;

  FieldLevelEncryptionProfileConfig({
    @_s.required this.callerReference,
    @_s.required this.encryptionEntities,
    @_s.required this.name,
    this.comment,
  });
  factory FieldLevelEncryptionProfileConfig.fromXml(_s.XmlElement elem) {
    return FieldLevelEncryptionProfileConfig(
      callerReference: _s.extractXmlStringValue(elem, 'CallerReference'),
      encryptionEntities: _s
          .extractXmlChild(elem, 'EncryptionEntities')
          ?.let((e) => EncryptionEntities.fromXml(e)),
      name: _s.extractXmlStringValue(elem, 'Name'),
      comment: _s.extractXmlStringValue(elem, 'Comment'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Name', name),
      _s.encodeXmlStringValue('CallerReference', callerReference),
      if (comment != null) _s.encodeXmlStringValue('Comment', comment),
      encryptionEntities?.toXml('EncryptionEntities'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// List of field-level encryption profiles.
class FieldLevelEncryptionProfileList {
  /// The maximum number of field-level encryption profiles you want in the
  /// response body.
  final int maxItems;

  /// The number of field-level encryption profiles.
  final int quantity;

  /// The field-level encryption profile items.
  final List<FieldLevelEncryptionProfileSummary> items;

  /// If there are more elements to be listed, this element is present and
  /// contains the value that you can use for the <code>Marker</code> request
  /// parameter to continue listing your profiles where you left off.
  final String nextMarker;

  FieldLevelEncryptionProfileList({
    @_s.required this.maxItems,
    @_s.required this.quantity,
    this.items,
    this.nextMarker,
  });
  factory FieldLevelEncryptionProfileList.fromXml(_s.XmlElement elem) {
    return FieldLevelEncryptionProfileList(
      maxItems: _s.extractXmlIntValue(elem, 'MaxItems'),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('FieldLevelEncryptionProfileSummary')
          .map((c) => FieldLevelEncryptionProfileSummary.fromXml(c))
          .toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }
}

/// The field-level encryption profile summary.
class FieldLevelEncryptionProfileSummary {
  /// A complex data type of encryption entities for the field-level encryption
  /// profile that include the public key ID, provider, and field patterns for
  /// specifying which fields to encrypt with this key.
  final EncryptionEntities encryptionEntities;

  /// ID for the field-level encryption profile summary.
  final String id;

  /// The time when the the field-level encryption profile summary was last
  /// updated.
  final DateTime lastModifiedTime;

  /// Name for the field-level encryption profile summary.
  final String name;

  /// An optional comment for the field-level encryption profile summary.
  final String comment;

  FieldLevelEncryptionProfileSummary({
    @_s.required this.encryptionEntities,
    @_s.required this.id,
    @_s.required this.lastModifiedTime,
    @_s.required this.name,
    this.comment,
  });
  factory FieldLevelEncryptionProfileSummary.fromXml(_s.XmlElement elem) {
    return FieldLevelEncryptionProfileSummary(
      encryptionEntities: _s
          .extractXmlChild(elem, 'EncryptionEntities')
          ?.let((e) => EncryptionEntities.fromXml(e)),
      id: _s.extractXmlStringValue(elem, 'Id'),
      lastModifiedTime: _s.extractXmlDateTimeValue(elem, 'LastModifiedTime'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      comment: _s.extractXmlStringValue(elem, 'Comment'),
    );
  }
}

/// A summary of a field-level encryption item.
class FieldLevelEncryptionSummary {
  /// The unique ID of a field-level encryption item.
  final String id;

  /// The last time that the summary of field-level encryption items was modified.
  final DateTime lastModifiedTime;

  /// An optional comment about the field-level encryption item.
  final String comment;

  /// A summary of a content type-profile mapping.
  final ContentTypeProfileConfig contentTypeProfileConfig;

  /// A summary of a query argument-profile mapping.
  final QueryArgProfileConfig queryArgProfileConfig;

  FieldLevelEncryptionSummary({
    @_s.required this.id,
    @_s.required this.lastModifiedTime,
    this.comment,
    this.contentTypeProfileConfig,
    this.queryArgProfileConfig,
  });
  factory FieldLevelEncryptionSummary.fromXml(_s.XmlElement elem) {
    return FieldLevelEncryptionSummary(
      id: _s.extractXmlStringValue(elem, 'Id'),
      lastModifiedTime: _s.extractXmlDateTimeValue(elem, 'LastModifiedTime'),
      comment: _s.extractXmlStringValue(elem, 'Comment'),
      contentTypeProfileConfig: _s
          .extractXmlChild(elem, 'ContentTypeProfileConfig')
          ?.let((e) => ContentTypeProfileConfig.fromXml(e)),
      queryArgProfileConfig: _s
          .extractXmlChild(elem, 'QueryArgProfileConfig')
          ?.let((e) => QueryArgProfileConfig.fromXml(e)),
    );
  }
}

/// A complex data type that includes the field patterns to match for
/// field-level encryption.
class FieldPatterns {
  /// The number of field-level encryption field patterns.
  final int quantity;

  /// An array of the field-level encryption field patterns.
  final List<String> items;

  FieldPatterns({
    @_s.required this.quantity,
    this.items,
  });
  factory FieldPatterns.fromXml(_s.XmlElement elem) {
    return FieldPatterns(
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s
          .extractXmlChild(elem, 'Items')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'FieldPattern')),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => _s.encodeXmlStringValue('FieldPattern', e))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

enum Format {
  uRLEncoded,
}

extension on Format {
  String toValue() {
    switch (this) {
      case Format.uRLEncoded:
        return 'URLEncoded';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  Format toFormat() {
    switch (this) {
      case 'URLEncoded':
        return Format.uRLEncoded;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// This field is deprecated. We recommend that you use a cache policy or an
/// origin request policy instead of this field.
///
/// If you want to include values in the cache key, use a cache policy. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html#cache-key-create-cache-policy">Creating
/// cache policies</a> in the <i>Amazon CloudFront Developer Guide</i>.
///
/// If you want to send values to the origin but not include them in the cache
/// key, use an origin request policy. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-origin-requests.html#origin-request-create-origin-request-policy">Creating
/// origin request policies</a> in the <i>Amazon CloudFront Developer Guide</i>.
///
/// A complex type that specifies how CloudFront handles query strings, cookies,
/// and HTTP headers.
class ForwardedValues {
  /// This field is deprecated. We recommend that you use a cache policy or an
  /// origin request policy instead of this field.
  ///
  /// If you want to include cookies in the cache key, use a cache policy. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html#cache-key-create-cache-policy">Creating
  /// cache policies</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// If you want to send cookies to the origin but not include them in the cache
  /// key, use an origin request policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-origin-requests.html#origin-request-create-origin-request-policy">Creating
  /// origin request policies</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// A complex type that specifies whether you want CloudFront to forward cookies
  /// to the origin and, if so, which ones. For more information about forwarding
  /// cookies to the origin, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Cookies.html">How
  /// CloudFront Forwards, Caches, and Logs Cookies</a> in the <i>Amazon
  /// CloudFront Developer Guide</i>.
  final CookiePreference cookies;

  /// This field is deprecated. We recommend that you use a cache policy or an
  /// origin request policy instead of this field.
  ///
  /// If you want to include query strings in the cache key, use a cache policy.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html#cache-key-create-cache-policy">Creating
  /// cache policies</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// If you want to send query strings to the origin but not include them in the
  /// cache key, use an origin request policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-origin-requests.html#origin-request-create-origin-request-policy">Creating
  /// origin request policies</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
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
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/QueryStringParameters.html">Configuring
  /// CloudFront to Cache Based on Query String Parameters</a> in the <i>Amazon
  /// CloudFront Developer Guide</i>.
  final bool queryString;

  /// This field is deprecated. We recommend that you use a cache policy or an
  /// origin request policy instead of this field.
  ///
  /// If you want to include headers in the cache key, use a cache policy. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html#cache-key-create-cache-policy">Creating
  /// cache policies</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// If you want to send headers to the origin but not include them in the cache
  /// key, use an origin request policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-origin-requests.html#origin-request-create-origin-request-policy">Creating
  /// origin request policies</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// A complex type that specifies the <code>Headers</code>, if any, that you
  /// want CloudFront to forward to the origin for this cache behavior
  /// (whitelisted headers). For the headers that you specify, CloudFront also
  /// caches separate versions of a specified object that is based on the header
  /// values in viewer requests.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/header-caching.html">
  /// Caching Content Based on Request Headers</a> in the <i>Amazon CloudFront
  /// Developer Guide</i>.
  final Headers headers;

  /// This field is deprecated. We recommend that you use a cache policy or an
  /// origin request policy instead of this field.
  ///
  /// If you want to include query strings in the cache key, use a cache policy.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html#cache-key-create-cache-policy">Creating
  /// cache policies</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// If you want to send query strings to the origin but not include them in the
  /// cache key, use an origin request policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-origin-requests.html#origin-request-create-origin-request-policy">Creating
  /// origin request policies</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// A complex type that contains information about the query string parameters
  /// that you want CloudFront to use for caching for this cache behavior.
  final QueryStringCacheKeys queryStringCacheKeys;

  ForwardedValues({
    @_s.required this.cookies,
    @_s.required this.queryString,
    this.headers,
    this.queryStringCacheKeys,
  });
  factory ForwardedValues.fromXml(_s.XmlElement elem) {
    return ForwardedValues(
      cookies: _s
          .extractXmlChild(elem, 'Cookies')
          ?.let((e) => CookiePreference.fromXml(e)),
      queryString: _s.extractXmlBoolValue(elem, 'QueryString'),
      headers:
          _s.extractXmlChild(elem, 'Headers')?.let((e) => Headers.fromXml(e)),
      queryStringCacheKeys: _s
          .extractXmlChild(elem, 'QueryStringCacheKeys')
          ?.let((e) => QueryStringCacheKeys.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlBoolValue('QueryString', queryString),
      cookies?.toXml('Cookies'),
      if (headers != null) headers?.toXml('Headers'),
      if (queryStringCacheKeys != null)
        queryStringCacheKeys?.toXml('QueryStringCacheKeys'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
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
  /// countries in which you don't want CloudFront to distribute your content.
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
  /// for Standardization</i> website. You can also refer to the country list on
  /// the CloudFront console, which includes both country names and codes.
  final List<String> items;

  GeoRestriction({
    @_s.required this.quantity,
    @_s.required this.restrictionType,
    this.items,
  });
  factory GeoRestriction.fromXml(_s.XmlElement elem) {
    return GeoRestriction(
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      restrictionType: _s
          .extractXmlStringValue(elem, 'RestrictionType')
          ?.toGeoRestrictionType(),
      items: _s
          .extractXmlChild(elem, 'Items')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Location')),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue(
          'RestrictionType', restrictionType?.toValue() ?? ''),
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
      $children.where((e) => e != null),
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
    throw Exception('Unknown enum value: $this');
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
    throw Exception('Unknown enum value: $this');
  }
}

class GetCachePolicyConfigResult {
  /// The cache policy configuration.
  final CachePolicyConfig cachePolicyConfig;

  /// The current version of the cache policy.
  final String eTag;

  GetCachePolicyConfigResult({
    this.cachePolicyConfig,
    this.eTag,
  });
}

class GetCachePolicyResult {
  /// The cache policy.
  final CachePolicy cachePolicy;

  /// The current version of the cache policy.
  final String eTag;

  GetCachePolicyResult({
    this.cachePolicy,
    this.eTag,
  });
}

/// The returned result of the corresponding request.
class GetCloudFrontOriginAccessIdentityConfigResult {
  /// The origin access identity's configuration information.
  final CloudFrontOriginAccessIdentityConfig
      cloudFrontOriginAccessIdentityConfig;

  /// The current version of the configuration. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  final String eTag;

  GetCloudFrontOriginAccessIdentityConfigResult({
    this.cloudFrontOriginAccessIdentityConfig,
    this.eTag,
  });
}

/// The returned result of the corresponding request.
class GetCloudFrontOriginAccessIdentityResult {
  /// The origin access identity's information.
  final CloudFrontOriginAccessIdentity cloudFrontOriginAccessIdentity;

  /// The current version of the origin access identity's information. For
  /// example: <code>E2QWRUHAPOMQZL</code>.
  final String eTag;

  GetCloudFrontOriginAccessIdentityResult({
    this.cloudFrontOriginAccessIdentity,
    this.eTag,
  });
}

/// The returned result of the corresponding request.
class GetDistributionConfigResult {
  /// The distribution's configuration information.
  final DistributionConfig distributionConfig;

  /// The current version of the configuration. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  final String eTag;

  GetDistributionConfigResult({
    this.distributionConfig,
    this.eTag,
  });
}

/// The returned result of the corresponding request.
class GetDistributionResult {
  /// The distribution's information.
  final Distribution distribution;

  /// The current version of the distribution's information. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  final String eTag;

  GetDistributionResult({
    this.distribution,
    this.eTag,
  });
}

class GetFieldLevelEncryptionConfigResult {
  /// The current version of the field level encryption configuration. For
  /// example: <code>E2QWRUHAPOMQZL</code>.
  final String eTag;

  /// Return the field-level encryption configuration information.
  final FieldLevelEncryptionConfig fieldLevelEncryptionConfig;

  GetFieldLevelEncryptionConfigResult({
    this.eTag,
    this.fieldLevelEncryptionConfig,
  });
}

class GetFieldLevelEncryptionProfileConfigResult {
  /// The current version of the field-level encryption profile configuration
  /// result. For example: <code>E2QWRUHAPOMQZL</code>.
  final String eTag;

  /// Return the field-level encryption profile configuration information.
  final FieldLevelEncryptionProfileConfig fieldLevelEncryptionProfileConfig;

  GetFieldLevelEncryptionProfileConfigResult({
    this.eTag,
    this.fieldLevelEncryptionProfileConfig,
  });
}

class GetFieldLevelEncryptionProfileResult {
  /// The current version of the field level encryption profile. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  final String eTag;

  /// Return the field-level encryption profile information.
  final FieldLevelEncryptionProfile fieldLevelEncryptionProfile;

  GetFieldLevelEncryptionProfileResult({
    this.eTag,
    this.fieldLevelEncryptionProfile,
  });
}

class GetFieldLevelEncryptionResult {
  /// The current version of the field level encryption configuration. For
  /// example: <code>E2QWRUHAPOMQZL</code>.
  final String eTag;

  /// Return the field-level encryption configuration information.
  final FieldLevelEncryption fieldLevelEncryption;

  GetFieldLevelEncryptionResult({
    this.eTag,
    this.fieldLevelEncryption,
  });
}

/// The returned result of the corresponding request.
class GetInvalidationResult {
  /// The invalidation's information. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/InvalidationDatatype.html">Invalidation
  /// Complex Type</a>.
  final Invalidation invalidation;

  GetInvalidationResult({
    this.invalidation,
  });
  factory GetInvalidationResult.fromXml(_s.XmlElement elem) {
    return GetInvalidationResult(
      invalidation: elem?.let((e) => Invalidation.fromXml(e)),
    );
  }
}

class GetKeyGroupConfigResult {
  /// The identifier for this version of the key group.
  final String eTag;

  /// The key group configuration.
  final KeyGroupConfig keyGroupConfig;

  GetKeyGroupConfigResult({
    this.eTag,
    this.keyGroupConfig,
  });
}

class GetKeyGroupResult {
  /// The identifier for this version of the key group.
  final String eTag;

  /// The key group.
  final KeyGroup keyGroup;

  GetKeyGroupResult({
    this.eTag,
    this.keyGroup,
  });
}

class GetMonitoringSubscriptionResult {
  /// A monitoring subscription. This structure contains information about whether
  /// additional CloudWatch metrics are enabled for a given CloudFront
  /// distribution.
  final MonitoringSubscription monitoringSubscription;

  GetMonitoringSubscriptionResult({
    this.monitoringSubscription,
  });
  factory GetMonitoringSubscriptionResult.fromXml(_s.XmlElement elem) {
    return GetMonitoringSubscriptionResult(
      monitoringSubscription:
          elem?.let((e) => MonitoringSubscription.fromXml(e)),
    );
  }
}

class GetOriginRequestPolicyConfigResult {
  /// The current version of the origin request policy.
  final String eTag;

  /// The origin request policy configuration.
  final OriginRequestPolicyConfig originRequestPolicyConfig;

  GetOriginRequestPolicyConfigResult({
    this.eTag,
    this.originRequestPolicyConfig,
  });
}

class GetOriginRequestPolicyResult {
  /// The current version of the origin request policy.
  final String eTag;

  /// The origin request policy.
  final OriginRequestPolicy originRequestPolicy;

  GetOriginRequestPolicyResult({
    this.eTag,
    this.originRequestPolicy,
  });
}

class GetPublicKeyConfigResult {
  /// The identifier for this version of the public key configuration.
  final String eTag;

  /// A public key configuration.
  final PublicKeyConfig publicKeyConfig;

  GetPublicKeyConfigResult({
    this.eTag,
    this.publicKeyConfig,
  });
}

class GetPublicKeyResult {
  /// The identifier for this version of the public key.
  final String eTag;

  /// The public key.
  final PublicKey publicKey;

  GetPublicKeyResult({
    this.eTag,
    this.publicKey,
  });
}

class GetRealtimeLogConfigRequest {
  /// The Amazon Resource Name (ARN) of the real-time log configuration to get.
  final String arn;

  /// The name of the real-time log configuration to get.
  final String name;

  GetRealtimeLogConfigRequest({
    this.arn,
    this.name,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (name != null) _s.encodeXmlStringValue('Name', name),
      if (arn != null) _s.encodeXmlStringValue('ARN', arn),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

class GetRealtimeLogConfigResult {
  /// A real-time log configuration.
  final RealtimeLogConfig realtimeLogConfig;

  GetRealtimeLogConfigResult({
    this.realtimeLogConfig,
  });
  factory GetRealtimeLogConfigResult.fromXml(_s.XmlElement elem) {
    return GetRealtimeLogConfigResult(
      realtimeLogConfig: _s
          .extractXmlChild(elem, 'RealtimeLogConfig')
          ?.let((e) => RealtimeLogConfig.fromXml(e)),
    );
  }
}

/// The returned result of the corresponding request.
class GetStreamingDistributionConfigResult {
  /// The current version of the configuration. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  final String eTag;

  /// The streaming distribution's configuration information.
  final StreamingDistributionConfig streamingDistributionConfig;

  GetStreamingDistributionConfigResult({
    this.eTag,
    this.streamingDistributionConfig,
  });
}

/// The returned result of the corresponding request.
class GetStreamingDistributionResult {
  /// The current version of the streaming distribution's information. For
  /// example: <code>E2QWRUHAPOMQZL</code>.
  final String eTag;

  /// The streaming distribution's information.
  final StreamingDistribution streamingDistribution;

  GetStreamingDistributionResult({
    this.eTag,
    this.streamingDistribution,
  });
}

/// Contains a list of HTTP header names.
class Headers {
  /// The number of header names in the <code>Items</code> list.
  final int quantity;

  /// A list of HTTP header names.
  final List<String> items;

  Headers({
    @_s.required this.quantity,
    this.items,
  });
  factory Headers.fromXml(_s.XmlElement elem) {
    return Headers(
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s
          .extractXmlChild(elem, 'Items')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Name')),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
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
      $children.where((e) => e != null),
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
    throw Exception('Unknown enum value: $this');
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
    throw Exception('Unknown enum value: $this');
  }
}

enum ICPRecordalStatus {
  approved,
  suspended,
  pending,
}

extension on ICPRecordalStatus {
  String toValue() {
    switch (this) {
      case ICPRecordalStatus.approved:
        return 'APPROVED';
      case ICPRecordalStatus.suspended:
        return 'SUSPENDED';
      case ICPRecordalStatus.pending:
        return 'PENDING';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  ICPRecordalStatus toICPRecordalStatus() {
    switch (this) {
      case 'APPROVED':
        return ICPRecordalStatus.approved;
      case 'SUSPENDED':
        return ICPRecordalStatus.suspended;
      case 'PENDING':
        return ICPRecordalStatus.pending;
    }
    throw Exception('Unknown enum value: $this');
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
    @_s.required this.createTime,
    @_s.required this.id,
    @_s.required this.invalidationBatch,
    @_s.required this.status,
  });
  factory Invalidation.fromXml(_s.XmlElement elem) {
    return Invalidation(
      createTime: _s.extractXmlDateTimeValue(elem, 'CreateTime'),
      id: _s.extractXmlStringValue(elem, 'Id'),
      invalidationBatch: _s
          .extractXmlChild(elem, 'InvalidationBatch')
          ?.let((e) => InvalidationBatch.fromXml(e)),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
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
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Invalidation.html#invalidation-specifying-objects">Specifying
  /// the Objects to Invalidate</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  final Paths paths;

  InvalidationBatch({
    @_s.required this.callerReference,
    @_s.required this.paths,
  });
  factory InvalidationBatch.fromXml(_s.XmlElement elem) {
    return InvalidationBatch(
      callerReference: _s.extractXmlStringValue(elem, 'CallerReference'),
      paths: _s.extractXmlChild(elem, 'Paths')?.let((e) => Paths.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      paths?.toXml('Paths'),
      _s.encodeXmlStringValue('CallerReference', callerReference),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// The <code>InvalidationList</code> complex type describes the list of
/// invalidation objects. For more information about invalidation, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Invalidation.html">Invalidating
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
  final List<InvalidationSummary> items;

  /// If <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value that you can use for the <code>Marker</code> request
  /// parameter to continue listing your invalidation batches where they left off.
  final String nextMarker;

  InvalidationList({
    @_s.required this.isTruncated,
    @_s.required this.marker,
    @_s.required this.maxItems,
    @_s.required this.quantity,
    this.items,
    this.nextMarker,
  });
  factory InvalidationList.fromXml(_s.XmlElement elem) {
    return InvalidationList(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      maxItems: _s.extractXmlIntValue(elem, 'MaxItems'),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('InvalidationSummary')
          .map((c) => InvalidationSummary.fromXml(c))
          .toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }
}

/// A summary of an invalidation request.
class InvalidationSummary {
  /// The time that an invalidation request was created.
  final DateTime createTime;

  /// The unique ID for an invalidation request.
  final String id;

  /// The status of an invalidation request.
  final String status;

  InvalidationSummary({
    @_s.required this.createTime,
    @_s.required this.id,
    @_s.required this.status,
  });
  factory InvalidationSummary.fromXml(_s.XmlElement elem) {
    return InvalidationSummary(
      createTime: _s.extractXmlDateTimeValue(elem, 'CreateTime'),
      id: _s.extractXmlStringValue(elem, 'Id'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
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
    throw Exception('Unknown enum value: $this');
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
    throw Exception('Unknown enum value: $this');
  }
}

/// A list of identifiers for the public keys that CloudFront can use to verify
/// the signatures of signed URLs and signed cookies.
class KGKeyPairIds {
  /// The identifier of the key group that contains the public keys.
  final String keyGroupId;
  final KeyPairIds keyPairIds;

  KGKeyPairIds({
    this.keyGroupId,
    this.keyPairIds,
  });
  factory KGKeyPairIds.fromXml(_s.XmlElement elem) {
    return KGKeyPairIds(
      keyGroupId: _s.extractXmlStringValue(elem, 'KeyGroupId'),
      keyPairIds: _s
          .extractXmlChild(elem, 'KeyPairIds')
          ?.let((e) => KeyPairIds.fromXml(e)),
    );
  }
}

/// A key group.
///
/// A key group contains a list of public keys that you can use with <a
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">CloudFront
/// signed URLs and signed cookies</a>.
class KeyGroup {
  /// The identifier for the key group.
  final String id;

  /// The key group configuration.
  final KeyGroupConfig keyGroupConfig;

  /// The date and time when the key group was last modified.
  final DateTime lastModifiedTime;

  KeyGroup({
    @_s.required this.id,
    @_s.required this.keyGroupConfig,
    @_s.required this.lastModifiedTime,
  });
  factory KeyGroup.fromXml(_s.XmlElement elem) {
    return KeyGroup(
      id: _s.extractXmlStringValue(elem, 'Id'),
      keyGroupConfig: _s
          .extractXmlChild(elem, 'KeyGroupConfig')
          ?.let((e) => KeyGroupConfig.fromXml(e)),
      lastModifiedTime: _s.extractXmlDateTimeValue(elem, 'LastModifiedTime'),
    );
  }
}

/// A key group configuration.
///
/// A key group contains a list of public keys that you can use with <a
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">CloudFront
/// signed URLs and signed cookies</a>.
class KeyGroupConfig {
  /// A list of the identifiers of the public keys in the key group.
  final List<String> items;

  /// A name to identify the key group.
  final String name;

  /// A comment to describe the key group.
  final String comment;

  KeyGroupConfig({
    @_s.required this.items,
    @_s.required this.name,
    this.comment,
  });
  factory KeyGroupConfig.fromXml(_s.XmlElement elem) {
    return KeyGroupConfig(
      items: _s
          .extractXmlChild(elem, 'Items')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'PublicKey')),
      name: _s.extractXmlStringValue(elem, 'Name'),
      comment: _s.extractXmlStringValue(elem, 'Comment'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Name', name),
      _s.XmlElement(_s.XmlName('Items'), [],
          items?.map((e) => _s.encodeXmlStringValue('PublicKey', e))),
      if (comment != null) _s.encodeXmlStringValue('Comment', comment),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A list of key groups.
class KeyGroupList {
  /// The maximum number of key groups requested.
  final int maxItems;

  /// The number of key groups returned in the response.
  final int quantity;

  /// A list of key groups.
  final List<KeyGroupSummary> items;

  /// If there are more items in the list than are in this response, this element
  /// is present. It contains the value that you should use in the
  /// <code>Marker</code> field of a subsequent request to continue listing key
  /// groups.
  final String nextMarker;

  KeyGroupList({
    @_s.required this.maxItems,
    @_s.required this.quantity,
    this.items,
    this.nextMarker,
  });
  factory KeyGroupList.fromXml(_s.XmlElement elem) {
    return KeyGroupList(
      maxItems: _s.extractXmlIntValue(elem, 'MaxItems'),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('KeyGroupSummary')
          .map((c) => KeyGroupSummary.fromXml(c))
          .toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }
}

/// Contains information about a key group.
class KeyGroupSummary {
  /// A key group.
  final KeyGroup keyGroup;

  KeyGroupSummary({
    @_s.required this.keyGroup,
  });
  factory KeyGroupSummary.fromXml(_s.XmlElement elem) {
    return KeyGroupSummary(
      keyGroup:
          _s.extractXmlChild(elem, 'KeyGroup')?.let((e) => KeyGroup.fromXml(e)),
    );
  }
}

/// A list of CloudFront key pair identifiers.
class KeyPairIds {
  /// The number of key pair identifiers in the list.
  final int quantity;

  /// A list of CloudFront key pair identifiers.
  final List<String> items;

  KeyPairIds({
    @_s.required this.quantity,
    this.items,
  });
  factory KeyPairIds.fromXml(_s.XmlElement elem) {
    return KeyPairIds(
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s
          .extractXmlChild(elem, 'Items')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'KeyPairId')),
    );
  }
}

/// Contains information about the Amazon Kinesis data stream where you are
/// sending real-time log data.
class KinesisStreamConfig {
  /// The Amazon Resource Name (ARN) of an AWS Identity and Access Management
  /// (IAM) role that CloudFront can use to send real-time log data to your
  /// Kinesis data stream.
  ///
  /// For more information the IAM role, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/real-time-logs.html#understand-real-time-log-config-iam-role">Real-time
  /// log configuration IAM role</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  final String roleARN;

  /// The Amazon Resource Name (ARN) of the Kinesis data stream where you are
  /// sending real-time log data.
  final String streamARN;

  KinesisStreamConfig({
    @_s.required this.roleARN,
    @_s.required this.streamARN,
  });
  factory KinesisStreamConfig.fromXml(_s.XmlElement elem) {
    return KinesisStreamConfig(
      roleARN: _s.extractXmlStringValue(elem, 'RoleARN'),
      streamARN: _s.extractXmlStringValue(elem, 'StreamARN'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('RoleARN', roleARN),
      _s.encodeXmlStringValue('StreamARN', streamARN),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A complex type that contains a Lambda function association.
class LambdaFunctionAssociation {
  /// Specifies the event type that triggers a Lambda function invocation. You can
  /// specify the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>viewer-request</code>: The function executes when CloudFront receives
  /// a request from a viewer and before it checks to see whether the requested
  /// object is in the edge cache.
  /// </li>
  /// <li>
  /// <code>origin-request</code>: The function executes only when CloudFront
  /// sends a request to your origin. When the requested object is in the edge
  /// cache, the function doesn't execute.
  /// </li>
  /// <li>
  /// <code>origin-response</code>: The function executes after CloudFront
  /// receives a response from the origin and before it caches the object in the
  /// response. When the requested object is in the edge cache, the function
  /// doesn't execute.
  /// </li>
  /// <li>
  /// <code>viewer-response</code>: The function executes before CloudFront
  /// returns the requested object to the viewer. The function executes regardless
  /// of whether the object was already in the edge cache.
  ///
  /// If the origin returns an HTTP status code other than HTTP 200 (OK), the
  /// function doesn't execute.
  /// </li>
  /// </ul>
  final EventType eventType;

  /// The ARN of the Lambda function. You must specify the ARN of a function
  /// version; you can't specify a Lambda alias or $LATEST.
  final String lambdaFunctionARN;

  /// A flag that allows a Lambda function to have read access to the body
  /// content. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/lambda-include-body-access.html">Accessing
  /// the Request Body by Choosing the Include Body Option</a> in the Amazon
  /// CloudFront Developer Guide.
  final bool includeBody;

  LambdaFunctionAssociation({
    @_s.required this.eventType,
    @_s.required this.lambdaFunctionARN,
    this.includeBody,
  });
  factory LambdaFunctionAssociation.fromXml(_s.XmlElement elem) {
    return LambdaFunctionAssociation(
      eventType: _s.extractXmlStringValue(elem, 'EventType')?.toEventType(),
      lambdaFunctionARN: _s.extractXmlStringValue(elem, 'LambdaFunctionARN'),
      includeBody: _s.extractXmlBoolValue(elem, 'IncludeBody'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('LambdaFunctionARN', lambdaFunctionARN),
      _s.encodeXmlStringValue('EventType', eventType?.toValue() ?? ''),
      if (includeBody != null)
        _s.encodeXmlBoolValue('IncludeBody', includeBody),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
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
  final List<LambdaFunctionAssociation> items;

  LambdaFunctionAssociations({
    @_s.required this.quantity,
    this.items,
  });
  factory LambdaFunctionAssociations.fromXml(_s.XmlElement elem) {
    return LambdaFunctionAssociations(
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('LambdaFunctionAssociation')
          .map((c) => LambdaFunctionAssociation.fromXml(c))
          .toList()),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => e?.toXml('LambdaFunctionAssociation'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

class ListCachePoliciesResult {
  /// A list of cache policies.
  final CachePolicyList cachePolicyList;

  ListCachePoliciesResult({
    this.cachePolicyList,
  });
  factory ListCachePoliciesResult.fromXml(_s.XmlElement elem) {
    return ListCachePoliciesResult(
      cachePolicyList: elem?.let((e) => CachePolicyList.fromXml(e)),
    );
  }
}

/// The returned result of the corresponding request.
class ListCloudFrontOriginAccessIdentitiesResult {
  /// The <code>CloudFrontOriginAccessIdentityList</code> type.
  final CloudFrontOriginAccessIdentityList cloudFrontOriginAccessIdentityList;

  ListCloudFrontOriginAccessIdentitiesResult({
    this.cloudFrontOriginAccessIdentityList,
  });
  factory ListCloudFrontOriginAccessIdentitiesResult.fromXml(
      _s.XmlElement elem) {
    return ListCloudFrontOriginAccessIdentitiesResult(
      cloudFrontOriginAccessIdentityList:
          elem?.let((e) => CloudFrontOriginAccessIdentityList.fromXml(e)),
    );
  }
}

class ListDistributionsByCachePolicyIdResult {
  /// A list of distribution IDs.
  final DistributionIdList distributionIdList;

  ListDistributionsByCachePolicyIdResult({
    this.distributionIdList,
  });
  factory ListDistributionsByCachePolicyIdResult.fromXml(_s.XmlElement elem) {
    return ListDistributionsByCachePolicyIdResult(
      distributionIdList: elem?.let((e) => DistributionIdList.fromXml(e)),
    );
  }
}

class ListDistributionsByKeyGroupResult {
  final DistributionIdList distributionIdList;

  ListDistributionsByKeyGroupResult({
    this.distributionIdList,
  });
  factory ListDistributionsByKeyGroupResult.fromXml(_s.XmlElement elem) {
    return ListDistributionsByKeyGroupResult(
      distributionIdList: elem?.let((e) => DistributionIdList.fromXml(e)),
    );
  }
}

class ListDistributionsByOriginRequestPolicyIdResult {
  /// A list of distribution IDs.
  final DistributionIdList distributionIdList;

  ListDistributionsByOriginRequestPolicyIdResult({
    this.distributionIdList,
  });
  factory ListDistributionsByOriginRequestPolicyIdResult.fromXml(
      _s.XmlElement elem) {
    return ListDistributionsByOriginRequestPolicyIdResult(
      distributionIdList: elem?.let((e) => DistributionIdList.fromXml(e)),
    );
  }
}

class ListDistributionsByRealtimeLogConfigRequest {
  /// Use this field when paginating results to indicate where to begin in your
  /// list of distributions. The response includes distributions in the list that
  /// occur after the marker. To get the next page of the list, set this field’s
  /// value to the value of <code>NextMarker</code> from the current page’s
  /// response.
  final String marker;

  /// The maximum number of distributions that you want in the response.
  final String maxItems;

  /// The Amazon Resource Name (ARN) of the real-time log configuration whose
  /// associated distributions you want to list.
  final String realtimeLogConfigArn;

  /// The name of the real-time log configuration whose associated distributions
  /// you want to list.
  final String realtimeLogConfigName;

  ListDistributionsByRealtimeLogConfigRequest({
    this.marker,
    this.maxItems,
    this.realtimeLogConfigArn,
    this.realtimeLogConfigName,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (marker != null) _s.encodeXmlStringValue('Marker', marker),
      if (maxItems != null) _s.encodeXmlStringValue('MaxItems', maxItems),
      if (realtimeLogConfigName != null)
        _s.encodeXmlStringValue('RealtimeLogConfigName', realtimeLogConfigName),
      if (realtimeLogConfigArn != null)
        _s.encodeXmlStringValue('RealtimeLogConfigArn', realtimeLogConfigArn),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

class ListDistributionsByRealtimeLogConfigResult {
  final DistributionList distributionList;

  ListDistributionsByRealtimeLogConfigResult({
    this.distributionList,
  });
  factory ListDistributionsByRealtimeLogConfigResult.fromXml(
      _s.XmlElement elem) {
    return ListDistributionsByRealtimeLogConfigResult(
      distributionList: elem?.let((e) => DistributionList.fromXml(e)),
    );
  }
}

/// The response to a request to list the distributions that are associated with
/// a specified AWS WAF web ACL.
class ListDistributionsByWebACLIdResult {
  /// The <code>DistributionList</code> type.
  final DistributionList distributionList;

  ListDistributionsByWebACLIdResult({
    this.distributionList,
  });
  factory ListDistributionsByWebACLIdResult.fromXml(_s.XmlElement elem) {
    return ListDistributionsByWebACLIdResult(
      distributionList: elem?.let((e) => DistributionList.fromXml(e)),
    );
  }
}

/// The returned result of the corresponding request.
class ListDistributionsResult {
  /// The <code>DistributionList</code> type.
  final DistributionList distributionList;

  ListDistributionsResult({
    this.distributionList,
  });
  factory ListDistributionsResult.fromXml(_s.XmlElement elem) {
    return ListDistributionsResult(
      distributionList: elem?.let((e) => DistributionList.fromXml(e)),
    );
  }
}

class ListFieldLevelEncryptionConfigsResult {
  /// Returns a list of all field-level encryption configurations that have been
  /// created in CloudFront for this account.
  final FieldLevelEncryptionList fieldLevelEncryptionList;

  ListFieldLevelEncryptionConfigsResult({
    this.fieldLevelEncryptionList,
  });
  factory ListFieldLevelEncryptionConfigsResult.fromXml(_s.XmlElement elem) {
    return ListFieldLevelEncryptionConfigsResult(
      fieldLevelEncryptionList:
          elem?.let((e) => FieldLevelEncryptionList.fromXml(e)),
    );
  }
}

class ListFieldLevelEncryptionProfilesResult {
  /// Returns a list of the field-level encryption profiles that have been created
  /// in CloudFront for this account.
  final FieldLevelEncryptionProfileList fieldLevelEncryptionProfileList;

  ListFieldLevelEncryptionProfilesResult({
    this.fieldLevelEncryptionProfileList,
  });
  factory ListFieldLevelEncryptionProfilesResult.fromXml(_s.XmlElement elem) {
    return ListFieldLevelEncryptionProfilesResult(
      fieldLevelEncryptionProfileList:
          elem?.let((e) => FieldLevelEncryptionProfileList.fromXml(e)),
    );
  }
}

/// The returned result of the corresponding request.
class ListInvalidationsResult {
  /// Information about invalidation batches.
  final InvalidationList invalidationList;

  ListInvalidationsResult({
    this.invalidationList,
  });
  factory ListInvalidationsResult.fromXml(_s.XmlElement elem) {
    return ListInvalidationsResult(
      invalidationList: elem?.let((e) => InvalidationList.fromXml(e)),
    );
  }
}

class ListKeyGroupsResult {
  /// A list of key groups.
  final KeyGroupList keyGroupList;

  ListKeyGroupsResult({
    this.keyGroupList,
  });
  factory ListKeyGroupsResult.fromXml(_s.XmlElement elem) {
    return ListKeyGroupsResult(
      keyGroupList: elem?.let((e) => KeyGroupList.fromXml(e)),
    );
  }
}

class ListOriginRequestPoliciesResult {
  /// A list of origin request policies.
  final OriginRequestPolicyList originRequestPolicyList;

  ListOriginRequestPoliciesResult({
    this.originRequestPolicyList,
  });
  factory ListOriginRequestPoliciesResult.fromXml(_s.XmlElement elem) {
    return ListOriginRequestPoliciesResult(
      originRequestPolicyList:
          elem?.let((e) => OriginRequestPolicyList.fromXml(e)),
    );
  }
}

class ListPublicKeysResult {
  /// Returns a list of all public keys that have been added to CloudFront for
  /// this account.
  final PublicKeyList publicKeyList;

  ListPublicKeysResult({
    this.publicKeyList,
  });
  factory ListPublicKeysResult.fromXml(_s.XmlElement elem) {
    return ListPublicKeysResult(
      publicKeyList: elem?.let((e) => PublicKeyList.fromXml(e)),
    );
  }
}

class ListRealtimeLogConfigsResult {
  /// A list of real-time log configurations.
  final RealtimeLogConfigs realtimeLogConfigs;

  ListRealtimeLogConfigsResult({
    this.realtimeLogConfigs,
  });
  factory ListRealtimeLogConfigsResult.fromXml(_s.XmlElement elem) {
    return ListRealtimeLogConfigsResult(
      realtimeLogConfigs: elem?.let((e) => RealtimeLogConfigs.fromXml(e)),
    );
  }
}

/// The returned result of the corresponding request.
class ListStreamingDistributionsResult {
  /// The <code>StreamingDistributionList</code> type.
  final StreamingDistributionList streamingDistributionList;

  ListStreamingDistributionsResult({
    this.streamingDistributionList,
  });
  factory ListStreamingDistributionsResult.fromXml(_s.XmlElement elem) {
    return ListStreamingDistributionsResult(
      streamingDistributionList:
          elem?.let((e) => StreamingDistributionList.fromXml(e)),
    );
  }
}

/// The returned result of the corresponding request.
class ListTagsForResourceResult {
  /// A complex type that contains zero or more <code>Tag</code> elements.
  final Tags tags;

  ListTagsForResourceResult({
    @_s.required this.tags,
  });
  factory ListTagsForResourceResult.fromXml(_s.XmlElement elem) {
    return ListTagsForResourceResult(
      tags: elem?.let((e) => Tags.fromXml(e)),
    );
  }
}

/// A complex type that controls whether access logs are written for the
/// distribution.
class LoggingConfig {
  /// The Amazon S3 bucket to store the access logs in, for example,
  /// <code>myawslogbucket.s3.amazonaws.com</code>.
  final String bucket;

  /// Specifies whether you want CloudFront to save access logs to an Amazon S3
  /// bucket. If you don't want to enable logging when you create a distribution
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
  /// configure the cache behaviors for this distribution. If you don't want to
  /// include cookies when you create a distribution or if you want to disable
  /// include cookies for an existing distribution, specify <code>false</code> for
  /// <code>IncludeCookies</code>.
  final bool includeCookies;

  /// An optional string that you want CloudFront to prefix to the access log
  /// <code>filenames</code> for this distribution, for example,
  /// <code>myprefix/</code>. If you want to enable logging, but you don't want to
  /// specify a prefix, you still must include an empty <code>Prefix</code>
  /// element in the <code>Logging</code> element.
  final String prefix;

  LoggingConfig({
    @_s.required this.bucket,
    @_s.required this.enabled,
    @_s.required this.includeCookies,
    @_s.required this.prefix,
  });
  factory LoggingConfig.fromXml(_s.XmlElement elem) {
    return LoggingConfig(
      bucket: _s.extractXmlStringValue(elem, 'Bucket'),
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      includeCookies: _s.extractXmlBoolValue(elem, 'IncludeCookies'),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
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
      $children.where((e) => e != null),
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
    throw Exception('Unknown enum value: $this');
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
    throw Exception('Unknown enum value: $this');
  }
}

enum MinimumProtocolVersion {
  sSLv3,
  tLSv1,
  tLSv1_2016,
  tLSv1_1_2016,
  tLSv1_2_2018,
  tLSv1_2_2019,
}

extension on MinimumProtocolVersion {
  String toValue() {
    switch (this) {
      case MinimumProtocolVersion.sSLv3:
        return 'SSLv3';
      case MinimumProtocolVersion.tLSv1:
        return 'TLSv1';
      case MinimumProtocolVersion.tLSv1_2016:
        return 'TLSv1_2016';
      case MinimumProtocolVersion.tLSv1_1_2016:
        return 'TLSv1.1_2016';
      case MinimumProtocolVersion.tLSv1_2_2018:
        return 'TLSv1.2_2018';
      case MinimumProtocolVersion.tLSv1_2_2019:
        return 'TLSv1.2_2019';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  MinimumProtocolVersion toMinimumProtocolVersion() {
    switch (this) {
      case 'SSLv3':
        return MinimumProtocolVersion.sSLv3;
      case 'TLSv1':
        return MinimumProtocolVersion.tLSv1;
      case 'TLSv1_2016':
        return MinimumProtocolVersion.tLSv1_2016;
      case 'TLSv1.1_2016':
        return MinimumProtocolVersion.tLSv1_1_2016;
      case 'TLSv1.2_2018':
        return MinimumProtocolVersion.tLSv1_2_2018;
      case 'TLSv1.2_2019':
        return MinimumProtocolVersion.tLSv1_2_2019;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A monitoring subscription. This structure contains information about whether
/// additional CloudWatch metrics are enabled for a given CloudFront
/// distribution.
class MonitoringSubscription {
  /// A subscription configuration for additional CloudWatch metrics.
  final RealtimeMetricsSubscriptionConfig realtimeMetricsSubscriptionConfig;

  MonitoringSubscription({
    this.realtimeMetricsSubscriptionConfig,
  });
  factory MonitoringSubscription.fromXml(_s.XmlElement elem) {
    return MonitoringSubscription(
      realtimeMetricsSubscriptionConfig: _s
          .extractXmlChild(elem, 'RealtimeMetricsSubscriptionConfig')
          ?.let((e) => RealtimeMetricsSubscriptionConfig.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (realtimeMetricsSubscriptionConfig != null)
        realtimeMetricsSubscriptionConfig
            ?.toXml('RealtimeMetricsSubscriptionConfig'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// An origin.
///
/// An origin is the location where content is stored, and from which CloudFront
/// gets content to serve to viewers. To specify an origin:
///
/// <ul>
/// <li>
/// Use <code>S3OriginConfig</code> to specify an Amazon S3 bucket that is not
/// configured with static website hosting.
/// </li>
/// <li>
/// Use <code>CustomOriginConfig</code> to specify all other kinds of origins,
/// including:
///
/// <ul>
/// <li>
/// An Amazon S3 bucket that is configured with static website hosting
/// </li>
/// <li>
/// An Elastic Load Balancing load balancer
/// </li>
/// <li>
/// An AWS Elemental MediaPackage endpoint
/// </li>
/// <li>
/// An AWS Elemental MediaStore container
/// </li>
/// <li>
/// Any other HTTP server, running on an Amazon EC2 instance or any other kind
/// of host
/// </li>
/// </ul> </li>
/// </ul>
/// For the current maximum number of origins that you can specify per
/// distribution, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/cloudfront-limits.html#limits-web-distributions">General
/// Quotas on Web Distributions</a> in the <i>Amazon CloudFront Developer
/// Guide</i> (quotas were formerly referred to as limits).
class Origin {
  /// The domain name for the origin.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesDomainName">Origin
  /// Domain Name</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final String domainName;

  /// A unique identifier for the origin. This value must be unique within the
  /// distribution.
  ///
  /// Use this value to specify the <code>TargetOriginId</code> in a
  /// <code>CacheBehavior</code> or <code>DefaultCacheBehavior</code>.
  final String id;

  /// The number of times that CloudFront attempts to connect to the origin. The
  /// minimum number is 1, the maximum is 3, and the default (if you don’t specify
  /// otherwise) is 3.
  ///
  /// For a custom origin (including an Amazon S3 bucket that’s configured with
  /// static website hosting), this value also specifies the number of times that
  /// CloudFront attempts to get a response from the origin, in the case of an <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesOriginResponseTimeout">Origin
  /// Response Timeout</a>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#origin-connection-attempts">Origin
  /// Connection Attempts</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final int connectionAttempts;

  /// The number of seconds that CloudFront waits when trying to establish a
  /// connection to the origin. The minimum timeout is 1 second, the maximum is 10
  /// seconds, and the default (if you don’t specify otherwise) is 10 seconds.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#origin-connection-timeout">Origin
  /// Connection Timeout</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final int connectionTimeout;

  /// A list of HTTP header names and values that CloudFront adds to the requests
  /// that it sends to the origin.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/add-origin-custom-headers.html">Adding
  /// Custom Headers to Origin Requests</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  final CustomHeaders customHeaders;

  /// Use this type to specify an origin that is not an Amazon S3 bucket, with one
  /// exception. If the Amazon S3 bucket is configured with static website
  /// hosting, use this type. If the Amazon S3 bucket is not configured with
  /// static website hosting, use the <code>S3OriginConfig</code> type instead.
  final CustomOriginConfig customOriginConfig;

  /// An optional path that CloudFront appends to the origin domain name when
  /// CloudFront requests content from the origin.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValuesOriginPath">Origin
  /// Path</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final String originPath;

  /// CloudFront Origin Shield. Using Origin Shield can help reduce the load on
  /// your origin.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/origin-shield.html">Using
  /// Origin Shield</a> in the <i>Amazon CloudFront Developer Guide</i>.
  final OriginShield originShield;

  /// Use this type to specify an origin that is an Amazon S3 bucket that is not
  /// configured with static website hosting. To specify any other type of origin,
  /// including an Amazon S3 bucket that is configured with static website
  /// hosting, use the <code>CustomOriginConfig</code> type instead.
  final S3OriginConfig s3OriginConfig;

  Origin({
    @_s.required this.domainName,
    @_s.required this.id,
    this.connectionAttempts,
    this.connectionTimeout,
    this.customHeaders,
    this.customOriginConfig,
    this.originPath,
    this.originShield,
    this.s3OriginConfig,
  });
  factory Origin.fromXml(_s.XmlElement elem) {
    return Origin(
      domainName: _s.extractXmlStringValue(elem, 'DomainName'),
      id: _s.extractXmlStringValue(elem, 'Id'),
      connectionAttempts: _s.extractXmlIntValue(elem, 'ConnectionAttempts'),
      connectionTimeout: _s.extractXmlIntValue(elem, 'ConnectionTimeout'),
      customHeaders: _s
          .extractXmlChild(elem, 'CustomHeaders')
          ?.let((e) => CustomHeaders.fromXml(e)),
      customOriginConfig: _s
          .extractXmlChild(elem, 'CustomOriginConfig')
          ?.let((e) => CustomOriginConfig.fromXml(e)),
      originPath: _s.extractXmlStringValue(elem, 'OriginPath'),
      originShield: _s
          .extractXmlChild(elem, 'OriginShield')
          ?.let((e) => OriginShield.fromXml(e)),
      s3OriginConfig: _s
          .extractXmlChild(elem, 'S3OriginConfig')
          ?.let((e) => S3OriginConfig.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Id', id),
      _s.encodeXmlStringValue('DomainName', domainName),
      if (originPath != null) _s.encodeXmlStringValue('OriginPath', originPath),
      if (customHeaders != null) customHeaders?.toXml('CustomHeaders'),
      if (s3OriginConfig != null) s3OriginConfig?.toXml('S3OriginConfig'),
      if (customOriginConfig != null)
        customOriginConfig?.toXml('CustomOriginConfig'),
      if (connectionAttempts != null)
        _s.encodeXmlIntValue('ConnectionAttempts', connectionAttempts),
      if (connectionTimeout != null)
        _s.encodeXmlIntValue('ConnectionTimeout', connectionTimeout),
      if (originShield != null) originShield?.toXml('OriginShield'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A complex type that contains <code>HeaderName</code> and
/// <code>HeaderValue</code> elements, if any, for this distribution.
class OriginCustomHeader {
  /// The name of a header that you want CloudFront to send to your origin. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/forward-custom-headers.html">Adding
  /// Custom Headers to Origin Requests</a> in the <i> Amazon CloudFront Developer
  /// Guide</i>.
  final String headerName;

  /// The value for the header that you specified in the <code>HeaderName</code>
  /// field.
  final String headerValue;

  OriginCustomHeader({
    @_s.required this.headerName,
    @_s.required this.headerValue,
  });
  factory OriginCustomHeader.fromXml(_s.XmlElement elem) {
    return OriginCustomHeader(
      headerName: _s.extractXmlStringValue(elem, 'HeaderName'),
      headerValue: _s.extractXmlStringValue(elem, 'HeaderValue'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
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
      $children.where((e) => e != null),
    );
  }
}

/// An origin group includes two origins (a primary origin and a second origin
/// to failover to) and a failover criteria that you specify. You create an
/// origin group to support origin failover in CloudFront. When you create or
/// update a distribution, you can specifiy the origin group instead of a single
/// origin, and CloudFront will failover from the primary origin to the second
/// origin under the failover conditions that you've chosen.
class OriginGroup {
  /// A complex type that contains information about the failover criteria for an
  /// origin group.
  final OriginGroupFailoverCriteria failoverCriteria;

  /// The origin group's ID.
  final String id;

  /// A complex type that contains information about the origins in an origin
  /// group.
  final OriginGroupMembers members;

  OriginGroup({
    @_s.required this.failoverCriteria,
    @_s.required this.id,
    @_s.required this.members,
  });
  factory OriginGroup.fromXml(_s.XmlElement elem) {
    return OriginGroup(
      failoverCriteria: _s
          .extractXmlChild(elem, 'FailoverCriteria')
          ?.let((e) => OriginGroupFailoverCriteria.fromXml(e)),
      id: _s.extractXmlStringValue(elem, 'Id'),
      members: _s
          .extractXmlChild(elem, 'Members')
          ?.let((e) => OriginGroupMembers.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('Id', id),
      failoverCriteria?.toXml('FailoverCriteria'),
      members?.toXml('Members'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A complex data type that includes information about the failover criteria
/// for an origin group, including the status codes for which CloudFront will
/// failover from the primary origin to the second origin.
class OriginGroupFailoverCriteria {
  /// The status codes that, when returned from the primary origin, will trigger
  /// CloudFront to failover to the second origin.
  final StatusCodes statusCodes;

  OriginGroupFailoverCriteria({
    @_s.required this.statusCodes,
  });
  factory OriginGroupFailoverCriteria.fromXml(_s.XmlElement elem) {
    return OriginGroupFailoverCriteria(
      statusCodes: _s
          .extractXmlChild(elem, 'StatusCodes')
          ?.let((e) => StatusCodes.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      statusCodes?.toXml('StatusCodes'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// An origin in an origin group.
class OriginGroupMember {
  /// The ID for an origin in an origin group.
  final String originId;

  OriginGroupMember({
    @_s.required this.originId,
  });
  factory OriginGroupMember.fromXml(_s.XmlElement elem) {
    return OriginGroupMember(
      originId: _s.extractXmlStringValue(elem, 'OriginId'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('OriginId', originId),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A complex data type for the origins included in an origin group.
class OriginGroupMembers {
  /// Items (origins) in an origin group.
  final List<OriginGroupMember> items;

  /// The number of origins in an origin group.
  final int quantity;

  OriginGroupMembers({
    @_s.required this.items,
    @_s.required this.quantity,
  });
  factory OriginGroupMembers.fromXml(_s.XmlElement elem) {
    return OriginGroupMembers(
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('OriginGroupMember')
          .map((c) => OriginGroupMember.fromXml(c))
          .toList()),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      _s.XmlElement(_s.XmlName('Items'), [],
          items?.map((e) => e?.toXml('OriginGroupMember'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A complex data type for the origin groups specified for a distribution.
class OriginGroups {
  /// The number of origin groups.
  final int quantity;

  /// The items (origin groups) in a distribution.
  final List<OriginGroup> items;

  OriginGroups({
    @_s.required this.quantity,
    this.items,
  });
  factory OriginGroups.fromXml(_s.XmlElement elem) {
    return OriginGroups(
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('OriginGroup')
          .map((c) => OriginGroup.fromXml(c))
          .toList()),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(
            _s.XmlName('Items'), [], items.map((e) => e?.toXml('OriginGroup'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
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
    throw Exception('Unknown enum value: $this');
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
    throw Exception('Unknown enum value: $this');
  }
}

/// An origin request policy.
///
/// When it’s attached to a cache behavior, the origin request policy determines
/// the values that CloudFront includes in requests that it sends to the origin.
/// Each request that CloudFront sends to the origin includes the following:
///
/// <ul>
/// <li>
/// The request body and the URL path (without the domain name) from the viewer
/// request.
/// </li>
/// <li>
/// The headers that CloudFront automatically includes in every origin request,
/// including <code>Host</code>, <code>User-Agent</code>, and
/// <code>X-Amz-Cf-Id</code>.
/// </li>
/// <li>
/// All HTTP headers, cookies, and URL query strings that are specified in the
/// cache policy or the origin request policy. These can include items from the
/// viewer request and, in the case of headers, additional ones that are added
/// by CloudFront.
/// </li>
/// </ul>
/// CloudFront sends a request when it can’t find an object in its cache that
/// matches the request. If you want to send values to the origin and also
/// include them in the cache key, use <code>CachePolicy</code>.
class OriginRequestPolicy {
  /// The unique identifier for the origin request policy.
  final String id;

  /// The date and time when the origin request policy was last modified.
  final DateTime lastModifiedTime;

  /// The origin request policy configuration.
  final OriginRequestPolicyConfig originRequestPolicyConfig;

  OriginRequestPolicy({
    @_s.required this.id,
    @_s.required this.lastModifiedTime,
    @_s.required this.originRequestPolicyConfig,
  });
  factory OriginRequestPolicy.fromXml(_s.XmlElement elem) {
    return OriginRequestPolicy(
      id: _s.extractXmlStringValue(elem, 'Id'),
      lastModifiedTime: _s.extractXmlDateTimeValue(elem, 'LastModifiedTime'),
      originRequestPolicyConfig: _s
          .extractXmlChild(elem, 'OriginRequestPolicyConfig')
          ?.let((e) => OriginRequestPolicyConfig.fromXml(e)),
    );
  }
}

/// An origin request policy configuration.
///
/// This configuration determines the values that CloudFront includes in
/// requests that it sends to the origin. Each request that CloudFront sends to
/// the origin includes the following:
///
/// <ul>
/// <li>
/// The request body and the URL path (without the domain name) from the viewer
/// request.
/// </li>
/// <li>
/// The headers that CloudFront automatically includes in every origin request,
/// including <code>Host</code>, <code>User-Agent</code>, and
/// <code>X-Amz-Cf-Id</code>.
/// </li>
/// <li>
/// All HTTP headers, cookies, and URL query strings that are specified in the
/// cache policy or the origin request policy. These can include items from the
/// viewer request and, in the case of headers, additional ones that are added
/// by CloudFront.
/// </li>
/// </ul>
/// CloudFront sends a request when it can’t find an object in its cache that
/// matches the request. If you want to send values to the origin and also
/// include them in the cache key, use <code>CachePolicy</code>.
class OriginRequestPolicyConfig {
  /// The cookies from viewer requests to include in origin requests.
  final OriginRequestPolicyCookiesConfig cookiesConfig;

  /// The HTTP headers to include in origin requests. These can include headers
  /// from viewer requests and additional headers added by CloudFront.
  final OriginRequestPolicyHeadersConfig headersConfig;

  /// A unique name to identify the origin request policy.
  final String name;

  /// The URL query strings from viewer requests to include in origin requests.
  final OriginRequestPolicyQueryStringsConfig queryStringsConfig;

  /// A comment to describe the origin request policy.
  final String comment;

  OriginRequestPolicyConfig({
    @_s.required this.cookiesConfig,
    @_s.required this.headersConfig,
    @_s.required this.name,
    @_s.required this.queryStringsConfig,
    this.comment,
  });
  factory OriginRequestPolicyConfig.fromXml(_s.XmlElement elem) {
    return OriginRequestPolicyConfig(
      cookiesConfig: _s
          .extractXmlChild(elem, 'CookiesConfig')
          ?.let((e) => OriginRequestPolicyCookiesConfig.fromXml(e)),
      headersConfig: _s
          .extractXmlChild(elem, 'HeadersConfig')
          ?.let((e) => OriginRequestPolicyHeadersConfig.fromXml(e)),
      name: _s.extractXmlStringValue(elem, 'Name'),
      queryStringsConfig: _s
          .extractXmlChild(elem, 'QueryStringsConfig')
          ?.let((e) => OriginRequestPolicyQueryStringsConfig.fromXml(e)),
      comment: _s.extractXmlStringValue(elem, 'Comment'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (comment != null) _s.encodeXmlStringValue('Comment', comment),
      _s.encodeXmlStringValue('Name', name),
      headersConfig?.toXml('HeadersConfig'),
      cookiesConfig?.toXml('CookiesConfig'),
      queryStringsConfig?.toXml('QueryStringsConfig'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

enum OriginRequestPolicyCookieBehavior {
  none,
  whitelist,
  all,
}

extension on OriginRequestPolicyCookieBehavior {
  String toValue() {
    switch (this) {
      case OriginRequestPolicyCookieBehavior.none:
        return 'none';
      case OriginRequestPolicyCookieBehavior.whitelist:
        return 'whitelist';
      case OriginRequestPolicyCookieBehavior.all:
        return 'all';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  OriginRequestPolicyCookieBehavior toOriginRequestPolicyCookieBehavior() {
    switch (this) {
      case 'none':
        return OriginRequestPolicyCookieBehavior.none;
      case 'whitelist':
        return OriginRequestPolicyCookieBehavior.whitelist;
      case 'all':
        return OriginRequestPolicyCookieBehavior.all;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// An object that determines whether any cookies in viewer requests (and if so,
/// which cookies) are included in requests that CloudFront sends to the origin.
class OriginRequestPolicyCookiesConfig {
  /// Determines whether cookies in viewer requests are included in requests that
  /// CloudFront sends to the origin. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>none</code> – Cookies in viewer requests are not included in requests
  /// that CloudFront sends to the origin. Even when this field is set to
  /// <code>none</code>, any cookies that are listed in a <code>CachePolicy</code>
  /// <i>are</i> included in origin requests.
  /// </li>
  /// <li>
  /// <code>whitelist</code> – The cookies in viewer requests that are listed in
  /// the <code>CookieNames</code> type are included in requests that CloudFront
  /// sends to the origin.
  /// </li>
  /// <li>
  /// <code>all</code> – All cookies in viewer requests are included in requests
  /// that CloudFront sends to the origin.
  /// </li>
  /// </ul>
  final OriginRequestPolicyCookieBehavior cookieBehavior;
  final CookieNames cookies;

  OriginRequestPolicyCookiesConfig({
    @_s.required this.cookieBehavior,
    this.cookies,
  });
  factory OriginRequestPolicyCookiesConfig.fromXml(_s.XmlElement elem) {
    return OriginRequestPolicyCookiesConfig(
      cookieBehavior: _s
          .extractXmlStringValue(elem, 'CookieBehavior')
          ?.toOriginRequestPolicyCookieBehavior(),
      cookies: _s
          .extractXmlChild(elem, 'Cookies')
          ?.let((e) => CookieNames.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue(
          'CookieBehavior', cookieBehavior?.toValue() ?? ''),
      if (cookies != null) cookies?.toXml('Cookies'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

enum OriginRequestPolicyHeaderBehavior {
  none,
  whitelist,
  allViewer,
  allViewerAndWhitelistCloudFront,
}

extension on OriginRequestPolicyHeaderBehavior {
  String toValue() {
    switch (this) {
      case OriginRequestPolicyHeaderBehavior.none:
        return 'none';
      case OriginRequestPolicyHeaderBehavior.whitelist:
        return 'whitelist';
      case OriginRequestPolicyHeaderBehavior.allViewer:
        return 'allViewer';
      case OriginRequestPolicyHeaderBehavior.allViewerAndWhitelistCloudFront:
        return 'allViewerAndWhitelistCloudFront';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  OriginRequestPolicyHeaderBehavior toOriginRequestPolicyHeaderBehavior() {
    switch (this) {
      case 'none':
        return OriginRequestPolicyHeaderBehavior.none;
      case 'whitelist':
        return OriginRequestPolicyHeaderBehavior.whitelist;
      case 'allViewer':
        return OriginRequestPolicyHeaderBehavior.allViewer;
      case 'allViewerAndWhitelistCloudFront':
        return OriginRequestPolicyHeaderBehavior
            .allViewerAndWhitelistCloudFront;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// An object that determines whether any HTTP headers (and if so, which
/// headers) are included in requests that CloudFront sends to the origin.
class OriginRequestPolicyHeadersConfig {
  /// Determines whether any HTTP headers are included in requests that CloudFront
  /// sends to the origin. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>none</code> – HTTP headers are not included in requests that
  /// CloudFront sends to the origin. Even when this field is set to
  /// <code>none</code>, any headers that are listed in a <code>CachePolicy</code>
  /// <i>are</i> included in origin requests.
  /// </li>
  /// <li>
  /// <code>whitelist</code> – The HTTP headers that are listed in the
  /// <code>Headers</code> type are included in requests that CloudFront sends to
  /// the origin.
  /// </li>
  /// <li>
  /// <code>allViewer</code> – All HTTP headers in viewer requests are included in
  /// requests that CloudFront sends to the origin.
  /// </li>
  /// <li>
  /// <code>allViewerAndWhitelistCloudFront</code> – All HTTP headers in viewer
  /// requests and the additional CloudFront headers that are listed in the
  /// <code>Headers</code> type are included in requests that CloudFront sends to
  /// the origin. The additional headers are added by CloudFront.
  /// </li>
  /// </ul>
  final OriginRequestPolicyHeaderBehavior headerBehavior;
  final Headers headers;

  OriginRequestPolicyHeadersConfig({
    @_s.required this.headerBehavior,
    this.headers,
  });
  factory OriginRequestPolicyHeadersConfig.fromXml(_s.XmlElement elem) {
    return OriginRequestPolicyHeadersConfig(
      headerBehavior: _s
          .extractXmlStringValue(elem, 'HeaderBehavior')
          ?.toOriginRequestPolicyHeaderBehavior(),
      headers:
          _s.extractXmlChild(elem, 'Headers')?.let((e) => Headers.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue(
          'HeaderBehavior', headerBehavior?.toValue() ?? ''),
      if (headers != null) headers?.toXml('Headers'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A list of origin request policies.
class OriginRequestPolicyList {
  /// The maximum number of origin request policies requested.
  final int maxItems;

  /// The total number of origin request policies returned in the response.
  final int quantity;

  /// Contains the origin request policies in the list.
  final List<OriginRequestPolicySummary> items;

  /// If there are more items in the list than are in this response, this element
  /// is present. It contains the value that you should use in the
  /// <code>Marker</code> field of a subsequent request to continue listing origin
  /// request policies where you left off.
  final String nextMarker;

  OriginRequestPolicyList({
    @_s.required this.maxItems,
    @_s.required this.quantity,
    this.items,
    this.nextMarker,
  });
  factory OriginRequestPolicyList.fromXml(_s.XmlElement elem) {
    return OriginRequestPolicyList(
      maxItems: _s.extractXmlIntValue(elem, 'MaxItems'),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('OriginRequestPolicySummary')
          .map((c) => OriginRequestPolicySummary.fromXml(c))
          .toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }
}

enum OriginRequestPolicyQueryStringBehavior {
  none,
  whitelist,
  all,
}

extension on OriginRequestPolicyQueryStringBehavior {
  String toValue() {
    switch (this) {
      case OriginRequestPolicyQueryStringBehavior.none:
        return 'none';
      case OriginRequestPolicyQueryStringBehavior.whitelist:
        return 'whitelist';
      case OriginRequestPolicyQueryStringBehavior.all:
        return 'all';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  OriginRequestPolicyQueryStringBehavior
      toOriginRequestPolicyQueryStringBehavior() {
    switch (this) {
      case 'none':
        return OriginRequestPolicyQueryStringBehavior.none;
      case 'whitelist':
        return OriginRequestPolicyQueryStringBehavior.whitelist;
      case 'all':
        return OriginRequestPolicyQueryStringBehavior.all;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// An object that determines whether any URL query strings in viewer requests
/// (and if so, which query strings) are included in requests that CloudFront
/// sends to the origin.
class OriginRequestPolicyQueryStringsConfig {
  /// Determines whether any URL query strings in viewer requests are included in
  /// requests that CloudFront sends to the origin. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>none</code> – Query strings in viewer requests are not included in
  /// requests that CloudFront sends to the origin. Even when this field is set to
  /// <code>none</code>, any query strings that are listed in a
  /// <code>CachePolicy</code> <i>are</i> included in origin requests.
  /// </li>
  /// <li>
  /// <code>whitelist</code> – The query strings in viewer requests that are
  /// listed in the <code>QueryStringNames</code> type are included in requests
  /// that CloudFront sends to the origin.
  /// </li>
  /// <li>
  /// <code>all</code> – All query strings in viewer requests are included in
  /// requests that CloudFront sends to the origin.
  /// </li>
  /// </ul>
  final OriginRequestPolicyQueryStringBehavior queryStringBehavior;

  /// Contains a list of the query strings in viewer requests that are included in
  /// requests that CloudFront sends to the origin.
  final QueryStringNames queryStrings;

  OriginRequestPolicyQueryStringsConfig({
    @_s.required this.queryStringBehavior,
    this.queryStrings,
  });
  factory OriginRequestPolicyQueryStringsConfig.fromXml(_s.XmlElement elem) {
    return OriginRequestPolicyQueryStringsConfig(
      queryStringBehavior: _s
          .extractXmlStringValue(elem, 'QueryStringBehavior')
          ?.toOriginRequestPolicyQueryStringBehavior(),
      queryStrings: _s
          .extractXmlChild(elem, 'QueryStrings')
          ?.let((e) => QueryStringNames.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue(
          'QueryStringBehavior', queryStringBehavior?.toValue() ?? ''),
      if (queryStrings != null) queryStrings?.toXml('QueryStrings'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// Contains an origin request policy.
class OriginRequestPolicySummary {
  /// The origin request policy.
  final OriginRequestPolicy originRequestPolicy;

  /// The type of origin request policy, either <code>managed</code> (created by
  /// AWS) or <code>custom</code> (created in this AWS account).
  final OriginRequestPolicyType type;

  OriginRequestPolicySummary({
    @_s.required this.originRequestPolicy,
    @_s.required this.type,
  });
  factory OriginRequestPolicySummary.fromXml(_s.XmlElement elem) {
    return OriginRequestPolicySummary(
      originRequestPolicy: _s
          .extractXmlChild(elem, 'OriginRequestPolicy')
          ?.let((e) => OriginRequestPolicy.fromXml(e)),
      type: _s.extractXmlStringValue(elem, 'Type')?.toOriginRequestPolicyType(),
    );
  }
}

enum OriginRequestPolicyType {
  managed,
  custom,
}

extension on OriginRequestPolicyType {
  String toValue() {
    switch (this) {
      case OriginRequestPolicyType.managed:
        return 'managed';
      case OriginRequestPolicyType.custom:
        return 'custom';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  OriginRequestPolicyType toOriginRequestPolicyType() {
    switch (this) {
      case 'managed':
        return OriginRequestPolicyType.managed;
      case 'custom':
        return OriginRequestPolicyType.custom;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// CloudFront Origin Shield.
///
/// Using Origin Shield can help reduce the load on your origin. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/origin-shield.html">Using
/// Origin Shield</a> in the <i>Amazon CloudFront Developer Guide</i>.
class OriginShield {
  /// A flag that specifies whether Origin Shield is enabled.
  ///
  /// When it’s enabled, CloudFront routes all requests through Origin Shield,
  /// which can help protect your origin. When it’s disabled, CloudFront might
  /// send requests directly to your origin from multiple edge locations or
  /// regional edge caches.
  final bool enabled;

  /// The AWS Region for Origin Shield.
  ///
  /// Specify the AWS Region that has the lowest latency to your origin. To
  /// specify a region, use the region code, not the region name. For example,
  /// specify the US East (Ohio) region as <code>us-east-2</code>.
  ///
  /// When you enable CloudFront Origin Shield, you must specify the AWS Region
  /// for Origin Shield. For the list of AWS Regions that you can specify, and for
  /// help choosing the best Region for your origin, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/origin-shield.html#choose-origin-shield-region">Choosing
  /// the AWS Region for Origin Shield</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  final String originShieldRegion;

  OriginShield({
    @_s.required this.enabled,
    this.originShieldRegion,
  });
  factory OriginShield.fromXml(_s.XmlElement elem) {
    return OriginShield(
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      originShieldRegion: _s.extractXmlStringValue(elem, 'OriginShieldRegion'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlBoolValue('Enabled', enabled),
      if (originShieldRegion != null)
        _s.encodeXmlStringValue('OriginShieldRegion', originShieldRegion),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
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
    @_s.required this.items,
    @_s.required this.quantity,
  });
  factory OriginSslProtocols.fromXml(_s.XmlElement elem) {
    return OriginSslProtocols(
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => _s
          .extractXmlStringListValues(elem, 'SslProtocol')
          .map((s) => s.toSslProtocol())
          .toList()),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      _s.XmlElement(
          _s.XmlName('Items'),
          [],
          items?.map((e) =>
              _s.encodeXmlStringValue('SslProtocol', e?.toValue() ?? ''))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// Contains information about the origins for this distribution.
class Origins {
  /// A list of origins.
  final List<Origin> items;

  /// The number of origins for this distribution.
  final int quantity;

  Origins({
    @_s.required this.items,
    @_s.required this.quantity,
  });
  factory Origins.fromXml(_s.XmlElement elem) {
    return Origins(
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) =>
          elem.findElements('Origin').map((c) => Origin.fromXml(c)).toList()),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      _s.XmlElement(
          _s.XmlName('Items'), [], items?.map((e) => e?.toXml('Origin'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// This object determines the values that CloudFront includes in the cache key.
/// These values can include HTTP headers, cookies, and URL query strings.
/// CloudFront uses the cache key to find an object in its cache that it can
/// return to the viewer.
///
/// The headers, cookies, and query strings that are included in the cache key
/// are automatically included in requests that CloudFront sends to the origin.
/// CloudFront sends a request when it can’t find an object in its cache that
/// matches the request’s cache key. If you want to send values to the origin
/// but <i>not</i> include them in the cache key, use
/// <code>OriginRequestPolicy</code>.
class ParametersInCacheKeyAndForwardedToOrigin {
  /// An object that determines whether any cookies in viewer requests (and if so,
  /// which cookies) are included in the cache key and automatically included in
  /// requests that CloudFront sends to the origin.
  final CachePolicyCookiesConfig cookiesConfig;

  /// A flag that can affect whether the <code>Accept-Encoding</code> HTTP header
  /// is included in the cache key and included in requests that CloudFront sends
  /// to the origin.
  ///
  /// This field is related to the <code>EnableAcceptEncodingBrotli</code> field.
  /// If one or both of these fields is <code>true</code> <i>and</i> the viewer
  /// request includes the <code>Accept-Encoding</code> header, then CloudFront
  /// does the following:
  ///
  /// <ul>
  /// <li>
  /// Normalizes the value of the viewer’s <code>Accept-Encoding</code> header
  /// </li>
  /// <li>
  /// Includes the normalized header in the cache key
  /// </li>
  /// <li>
  /// Includes the normalized header in the request to the origin, if a request is
  /// necessary
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html#cache-policy-compressed-objects">Compression
  /// support</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// If you set this value to <code>true</code>, and this cache behavior also has
  /// an origin request policy attached, do not include the
  /// <code>Accept-Encoding</code> header in the origin request policy. CloudFront
  /// always includes the <code>Accept-Encoding</code> header in origin requests
  /// when the value of this field is <code>true</code>, so including this header
  /// in an origin request policy has no effect.
  ///
  /// If both of these fields are <code>false</code>, then CloudFront treats the
  /// <code>Accept-Encoding</code> header the same as any other HTTP header in the
  /// viewer request. By default, it’s not included in the cache key and it’s not
  /// included in origin requests. In this case, you can manually add
  /// <code>Accept-Encoding</code> to the headers whitelist like any other HTTP
  /// header.
  final bool enableAcceptEncodingGzip;

  /// An object that determines whether any HTTP headers (and if so, which
  /// headers) are included in the cache key and automatically included in
  /// requests that CloudFront sends to the origin.
  final CachePolicyHeadersConfig headersConfig;

  /// An object that determines whether any URL query strings in viewer requests
  /// (and if so, which query strings) are included in the cache key and
  /// automatically included in requests that CloudFront sends to the origin.
  final CachePolicyQueryStringsConfig queryStringsConfig;

  /// A flag that can affect whether the <code>Accept-Encoding</code> HTTP header
  /// is included in the cache key and included in requests that CloudFront sends
  /// to the origin.
  ///
  /// This field is related to the <code>EnableAcceptEncodingGzip</code> field. If
  /// one or both of these fields is <code>true</code> <i>and</i> the viewer
  /// request includes the <code>Accept-Encoding</code> header, then CloudFront
  /// does the following:
  ///
  /// <ul>
  /// <li>
  /// Normalizes the value of the viewer’s <code>Accept-Encoding</code> header
  /// </li>
  /// <li>
  /// Includes the normalized header in the cache key
  /// </li>
  /// <li>
  /// Includes the normalized header in the request to the origin, if a request is
  /// necessary
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/controlling-the-cache-key.html#cache-policy-compressed-objects">Compression
  /// support</a> in the <i>Amazon CloudFront Developer Guide</i>.
  ///
  /// If you set this value to <code>true</code>, and this cache behavior also has
  /// an origin request policy attached, do not include the
  /// <code>Accept-Encoding</code> header in the origin request policy. CloudFront
  /// always includes the <code>Accept-Encoding</code> header in origin requests
  /// when the value of this field is <code>true</code>, so including this header
  /// in an origin request policy has no effect.
  ///
  /// If both of these fields are <code>false</code>, then CloudFront treats the
  /// <code>Accept-Encoding</code> header the same as any other HTTP header in the
  /// viewer request. By default, it’s not included in the cache key and it’s not
  /// included in origin requests. In this case, you can manually add
  /// <code>Accept-Encoding</code> to the headers whitelist like any other HTTP
  /// header.
  final bool enableAcceptEncodingBrotli;

  ParametersInCacheKeyAndForwardedToOrigin({
    @_s.required this.cookiesConfig,
    @_s.required this.enableAcceptEncodingGzip,
    @_s.required this.headersConfig,
    @_s.required this.queryStringsConfig,
    this.enableAcceptEncodingBrotli,
  });
  factory ParametersInCacheKeyAndForwardedToOrigin.fromXml(_s.XmlElement elem) {
    return ParametersInCacheKeyAndForwardedToOrigin(
      cookiesConfig: _s
          .extractXmlChild(elem, 'CookiesConfig')
          ?.let((e) => CachePolicyCookiesConfig.fromXml(e)),
      enableAcceptEncodingGzip:
          _s.extractXmlBoolValue(elem, 'EnableAcceptEncodingGzip'),
      headersConfig: _s
          .extractXmlChild(elem, 'HeadersConfig')
          ?.let((e) => CachePolicyHeadersConfig.fromXml(e)),
      queryStringsConfig: _s
          .extractXmlChild(elem, 'QueryStringsConfig')
          ?.let((e) => CachePolicyQueryStringsConfig.fromXml(e)),
      enableAcceptEncodingBrotli:
          _s.extractXmlBoolValue(elem, 'EnableAcceptEncodingBrotli'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlBoolValue(
          'EnableAcceptEncodingGzip', enableAcceptEncodingGzip),
      if (enableAcceptEncodingBrotli != null)
        _s.encodeXmlBoolValue(
            'EnableAcceptEncodingBrotli', enableAcceptEncodingBrotli),
      headersConfig?.toXml('HeadersConfig'),
      cookiesConfig?.toXml('CookiesConfig'),
      queryStringsConfig?.toXml('QueryStringsConfig'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A complex type that contains information about the objects that you want to
/// invalidate. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Invalidation.html#invalidation-specifying-objects">Specifying
/// the Objects to Invalidate</a> in the <i>Amazon CloudFront Developer
/// Guide</i>.
class Paths {
  /// The number of invalidation paths specified for the objects that you want to
  /// invalidate.
  final int quantity;

  /// A complex type that contains a list of the paths that you want to
  /// invalidate.
  final List<String> items;

  Paths({
    @_s.required this.quantity,
    this.items,
  });
  factory Paths.fromXml(_s.XmlElement elem) {
    return Paths(
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s
          .extractXmlChild(elem, 'Items')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Path')),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
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
      $children.where((e) => e != null),
    );
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
    throw Exception('Unknown enum value: $this');
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
    throw Exception('Unknown enum value: $this');
  }
}

/// A public key that you can use with <a
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">signed
/// URLs and signed cookies</a>, or with <a
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/field-level-encryption.html">field-level
/// encryption</a>.
class PublicKey {
  /// The date and time when the public key was uploaded.
  final DateTime createdTime;

  /// The identifier of the public key.
  final String id;

  /// Configuration information about a public key that you can use with <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">signed
  /// URLs and signed cookies</a>, or with <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/field-level-encryption.html">field-level
  /// encryption</a>.
  final PublicKeyConfig publicKeyConfig;

  PublicKey({
    @_s.required this.createdTime,
    @_s.required this.id,
    @_s.required this.publicKeyConfig,
  });
  factory PublicKey.fromXml(_s.XmlElement elem) {
    return PublicKey(
      createdTime: _s.extractXmlDateTimeValue(elem, 'CreatedTime'),
      id: _s.extractXmlStringValue(elem, 'Id'),
      publicKeyConfig: _s
          .extractXmlChild(elem, 'PublicKeyConfig')
          ?.let((e) => PublicKeyConfig.fromXml(e)),
    );
  }
}

/// Configuration information about a public key that you can use with <a
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">signed
/// URLs and signed cookies</a>, or with <a
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/field-level-encryption.html">field-level
/// encryption</a>.
class PublicKeyConfig {
  /// A string included in the request to help make sure that the request can’t be
  /// replayed.
  final String callerReference;

  /// The public key that you can use with <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">signed
  /// URLs and signed cookies</a>, or with <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/field-level-encryption.html">field-level
  /// encryption</a>.
  final String encodedKey;

  /// A name to help identify the public key.
  final String name;

  /// A comment to describe the public key.
  final String comment;

  PublicKeyConfig({
    @_s.required this.callerReference,
    @_s.required this.encodedKey,
    @_s.required this.name,
    this.comment,
  });
  factory PublicKeyConfig.fromXml(_s.XmlElement elem) {
    return PublicKeyConfig(
      callerReference: _s.extractXmlStringValue(elem, 'CallerReference'),
      encodedKey: _s.extractXmlStringValue(elem, 'EncodedKey'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      comment: _s.extractXmlStringValue(elem, 'Comment'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('CallerReference', callerReference),
      _s.encodeXmlStringValue('Name', name),
      _s.encodeXmlStringValue('EncodedKey', encodedKey),
      if (comment != null) _s.encodeXmlStringValue('Comment', comment),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A list of public keys that you can use with <a
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">signed
/// URLs and signed cookies</a>, or with <a
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/field-level-encryption.html">field-level
/// encryption</a>.
class PublicKeyList {
  /// The maximum number of public keys you want in the response.
  final int maxItems;

  /// The number of public keys in the list.
  final int quantity;

  /// A list of public keys.
  final List<PublicKeySummary> items;

  /// If there are more elements to be listed, this element is present and
  /// contains the value that you can use for the <code>Marker</code> request
  /// parameter to continue listing your public keys where you left off.
  final String nextMarker;

  PublicKeyList({
    @_s.required this.maxItems,
    @_s.required this.quantity,
    this.items,
    this.nextMarker,
  });
  factory PublicKeyList.fromXml(_s.XmlElement elem) {
    return PublicKeyList(
      maxItems: _s.extractXmlIntValue(elem, 'MaxItems'),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('PublicKeySummary')
          .map((c) => PublicKeySummary.fromXml(c))
          .toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }
}

/// Contains information about a public key.
class PublicKeySummary {
  /// The date and time when the public key was uploaded.
  final DateTime createdTime;

  /// The public key.
  final String encodedKey;

  /// The identifier of the public key.
  final String id;

  /// A name to help identify the public key.
  final String name;

  /// A comment to describe the public key.
  final String comment;

  PublicKeySummary({
    @_s.required this.createdTime,
    @_s.required this.encodedKey,
    @_s.required this.id,
    @_s.required this.name,
    this.comment,
  });
  factory PublicKeySummary.fromXml(_s.XmlElement elem) {
    return PublicKeySummary(
      createdTime: _s.extractXmlDateTimeValue(elem, 'CreatedTime'),
      encodedKey: _s.extractXmlStringValue(elem, 'EncodedKey'),
      id: _s.extractXmlStringValue(elem, 'Id'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      comment: _s.extractXmlStringValue(elem, 'Comment'),
    );
  }
}

/// Query argument-profile mapping for field-level encryption.
class QueryArgProfile {
  /// ID of profile to use for field-level encryption query argument-profile
  /// mapping
  final String profileId;

  /// Query argument for field-level encryption query argument-profile mapping.
  final String queryArg;

  QueryArgProfile({
    @_s.required this.profileId,
    @_s.required this.queryArg,
  });
  factory QueryArgProfile.fromXml(_s.XmlElement elem) {
    return QueryArgProfile(
      profileId: _s.extractXmlStringValue(elem, 'ProfileId'),
      queryArg: _s.extractXmlStringValue(elem, 'QueryArg'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('QueryArg', queryArg),
      _s.encodeXmlStringValue('ProfileId', profileId),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// Configuration for query argument-profile mapping for field-level encryption.
class QueryArgProfileConfig {
  /// Flag to set if you want a request to be forwarded to the origin even if the
  /// profile specified by the field-level encryption query argument, fle-profile,
  /// is unknown.
  final bool forwardWhenQueryArgProfileIsUnknown;

  /// Profiles specified for query argument-profile mapping for field-level
  /// encryption.
  final QueryArgProfiles queryArgProfiles;

  QueryArgProfileConfig({
    @_s.required this.forwardWhenQueryArgProfileIsUnknown,
    this.queryArgProfiles,
  });
  factory QueryArgProfileConfig.fromXml(_s.XmlElement elem) {
    return QueryArgProfileConfig(
      forwardWhenQueryArgProfileIsUnknown:
          _s.extractXmlBoolValue(elem, 'ForwardWhenQueryArgProfileIsUnknown'),
      queryArgProfiles: _s
          .extractXmlChild(elem, 'QueryArgProfiles')
          ?.let((e) => QueryArgProfiles.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlBoolValue('ForwardWhenQueryArgProfileIsUnknown',
          forwardWhenQueryArgProfileIsUnknown),
      if (queryArgProfiles != null) queryArgProfiles?.toXml('QueryArgProfiles'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// Query argument-profile mapping for field-level encryption.
class QueryArgProfiles {
  /// Number of profiles for query argument-profile mapping for field-level
  /// encryption.
  final int quantity;

  /// Number of items for query argument-profile mapping for field-level
  /// encryption.
  final List<QueryArgProfile> items;

  QueryArgProfiles({
    @_s.required this.quantity,
    this.items,
  });
  factory QueryArgProfiles.fromXml(_s.XmlElement elem) {
    return QueryArgProfiles(
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('QueryArgProfile')
          .map((c) => QueryArgProfile.fromXml(c))
          .toList()),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => e?.toXml('QueryArgProfile'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// This field is deprecated. We recommend that you use a cache policy or an
/// origin request policy instead of this field.
///
/// If you want to include query strings in the cache key, use
/// <code>QueryStringsConfig</code> in a cache policy. See
/// <code>CachePolicy</code>.
///
/// If you want to send query strings to the origin but not include them in the
/// cache key, use <code>QueryStringsConfig</code> in an origin request policy.
/// See <code>OriginRequestPolicy</code>.
///
/// A complex type that contains information about the query string parameters
/// that you want CloudFront to use for caching for a cache behavior.
class QueryStringCacheKeys {
  /// The number of <code>whitelisted</code> query string parameters for a cache
  /// behavior.
  final int quantity;

  /// A list that contains the query string parameters that you want CloudFront to
  /// use as a basis for caching for a cache behavior. If <code>Quantity</code> is
  /// 0, you can omit <code>Items</code>.
  final List<String> items;

  QueryStringCacheKeys({
    @_s.required this.quantity,
    this.items,
  });
  factory QueryStringCacheKeys.fromXml(_s.XmlElement elem) {
    return QueryStringCacheKeys(
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s
          .extractXmlChild(elem, 'Items')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Name')),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
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
      $children.where((e) => e != null),
    );
  }
}

/// Contains a list of query string names.
class QueryStringNames {
  /// The number of query string names in the <code>Items</code> list.
  final int quantity;

  /// A list of query string names.
  final List<String> items;

  QueryStringNames({
    @_s.required this.quantity,
    this.items,
  });
  factory QueryStringNames.fromXml(_s.XmlElement elem) {
    return QueryStringNames(
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s
          .extractXmlChild(elem, 'Items')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Name')),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
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
      $children.where((e) => e != null),
    );
  }
}

/// A real-time log configuration.
class RealtimeLogConfig {
  /// The Amazon Resource Name (ARN) of this real-time log configuration.
  final String arn;

  /// Contains information about the Amazon Kinesis data stream where you are
  /// sending real-time log data for this real-time log configuration.
  final List<EndPoint> endPoints;

  /// A list of fields that are included in each real-time log record. In an API
  /// response, the fields are provided in the same order in which they are sent
  /// to the Amazon Kinesis data stream.
  ///
  /// For more information about fields, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/real-time-logs.html#understand-real-time-log-config-fields">Real-time
  /// log configuration fields</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  final List<String> fields;

  /// The unique name of this real-time log configuration.
  final String name;

  /// The sampling rate for this real-time log configuration. The sampling rate
  /// determines the percentage of viewer requests that are represented in the
  /// real-time log data. The sampling rate is an integer between 1 and 100,
  /// inclusive.
  final int samplingRate;

  RealtimeLogConfig({
    @_s.required this.arn,
    @_s.required this.endPoints,
    @_s.required this.fields,
    @_s.required this.name,
    @_s.required this.samplingRate,
  });
  factory RealtimeLogConfig.fromXml(_s.XmlElement elem) {
    return RealtimeLogConfig(
      arn: _s.extractXmlStringValue(elem, 'ARN'),
      endPoints: _s.extractXmlChild(elem, 'EndPoints')?.let((elem) =>
          elem.findElements('member').map((c) => EndPoint.fromXml(c)).toList()),
      fields: _s
          .extractXmlChild(elem, 'Fields')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'Field')),
      name: _s.extractXmlStringValue(elem, 'Name'),
      samplingRate: _s.extractXmlIntValue(elem, 'SamplingRate'),
    );
  }
}

/// A list of real-time log configurations.
class RealtimeLogConfigs {
  /// A flag that indicates whether there are more real-time log configurations
  /// than are contained in this list.
  final bool isTruncated;

  /// This parameter indicates where this list of real-time log configurations
  /// begins. This list includes real-time log configurations that occur after the
  /// marker.
  final String marker;

  /// The maximum number of real-time log configurations requested.
  final int maxItems;

  /// Contains the list of real-time log configurations.
  final List<RealtimeLogConfig> items;

  /// If there are more items in the list than are in this response, this element
  /// is present. It contains the value that you should use in the
  /// <code>Marker</code> field of a subsequent request to continue listing
  /// real-time log configurations where you left off.
  final String nextMarker;

  RealtimeLogConfigs({
    @_s.required this.isTruncated,
    @_s.required this.marker,
    @_s.required this.maxItems,
    this.items,
    this.nextMarker,
  });
  factory RealtimeLogConfigs.fromXml(_s.XmlElement elem) {
    return RealtimeLogConfigs(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      maxItems: _s.extractXmlIntValue(elem, 'MaxItems'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('member')
          .map((c) => RealtimeLogConfig.fromXml(c))
          .toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }
}

/// A subscription configuration for additional CloudWatch metrics.
class RealtimeMetricsSubscriptionConfig {
  /// A flag that indicates whether additional CloudWatch metrics are enabled for
  /// a given CloudFront distribution.
  final RealtimeMetricsSubscriptionStatus realtimeMetricsSubscriptionStatus;

  RealtimeMetricsSubscriptionConfig({
    @_s.required this.realtimeMetricsSubscriptionStatus,
  });
  factory RealtimeMetricsSubscriptionConfig.fromXml(_s.XmlElement elem) {
    return RealtimeMetricsSubscriptionConfig(
      realtimeMetricsSubscriptionStatus: _s
          .extractXmlStringValue(elem, 'RealtimeMetricsSubscriptionStatus')
          ?.toRealtimeMetricsSubscriptionStatus(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('RealtimeMetricsSubscriptionStatus',
          realtimeMetricsSubscriptionStatus?.toValue() ?? ''),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

enum RealtimeMetricsSubscriptionStatus {
  enabled,
  disabled,
}

extension on RealtimeMetricsSubscriptionStatus {
  String toValue() {
    switch (this) {
      case RealtimeMetricsSubscriptionStatus.enabled:
        return 'Enabled';
      case RealtimeMetricsSubscriptionStatus.disabled:
        return 'Disabled';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  RealtimeMetricsSubscriptionStatus toRealtimeMetricsSubscriptionStatus() {
    switch (this) {
      case 'Enabled':
        return RealtimeMetricsSubscriptionStatus.enabled;
      case 'Disabled':
        return RealtimeMetricsSubscriptionStatus.disabled;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A complex type that identifies ways in which you want to restrict
/// distribution of your content.
class Restrictions {
  /// A complex type that controls the countries in which your content is
  /// distributed. CloudFront determines the location of your users using
  /// <code>MaxMind</code> GeoIP databases.
  final GeoRestriction geoRestriction;

  Restrictions({
    @_s.required this.geoRestriction,
  });
  factory Restrictions.fromXml(_s.XmlElement elem) {
    return Restrictions(
      geoRestriction: _s
          .extractXmlChild(elem, 'GeoRestriction')
          ?.let((e) => GeoRestriction.fromXml(e)),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      geoRestriction?.toXml('GeoRestriction'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A complex type that contains information about the Amazon S3 bucket from
/// which you want CloudFront to get your media files for distribution.
class S3Origin {
  /// The DNS name of the Amazon S3 origin.
  final String domainName;

  /// The CloudFront origin access identity to associate with the distribution.
  /// Use an origin access identity to configure the distribution so that end
  /// users can only access objects in an Amazon S3 bucket through CloudFront.
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
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html">Using
  /// an Origin Access Identity to Restrict Access to Your Amazon S3 Content</a>
  /// in the <i> Amazon CloudFront Developer Guide</i>.
  final String originAccessIdentity;

  S3Origin({
    @_s.required this.domainName,
    @_s.required this.originAccessIdentity,
  });
  factory S3Origin.fromXml(_s.XmlElement elem) {
    return S3Origin(
      domainName: _s.extractXmlStringValue(elem, 'DomainName'),
      originAccessIdentity:
          _s.extractXmlStringValue(elem, 'OriginAccessIdentity'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
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
      $children.where((e) => e != null),
    );
  }
}

/// A complex type that contains information about the Amazon S3 origin. If the
/// origin is a custom origin or an S3 bucket that is configured as a website
/// endpoint, use the <code>CustomOriginConfig</code> element instead.
class S3OriginConfig {
  /// The CloudFront origin access identity to associate with the origin. Use an
  /// origin access identity to configure the origin so that viewers can
  /// <i>only</i> access objects in an Amazon S3 bucket through CloudFront. The
  /// format of the value is:
  ///
  /// origin-access-identity/cloudfront/<i>ID-of-origin-access-identity</i>
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
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving
  /// Private Content through CloudFront</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  final String originAccessIdentity;

  S3OriginConfig({
    @_s.required this.originAccessIdentity,
  });
  factory S3OriginConfig.fromXml(_s.XmlElement elem) {
    return S3OriginConfig(
      originAccessIdentity:
          _s.extractXmlStringValue(elem, 'OriginAccessIdentity'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('OriginAccessIdentity', originAccessIdentity),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

enum SSLSupportMethod {
  sniOnly,
  vip,
  staticIp,
}

extension on SSLSupportMethod {
  String toValue() {
    switch (this) {
      case SSLSupportMethod.sniOnly:
        return 'sni-only';
      case SSLSupportMethod.vip:
        return 'vip';
      case SSLSupportMethod.staticIp:
        return 'static-ip';
    }
    throw Exception('Unknown enum value: $this');
  }
}

extension on String {
  SSLSupportMethod toSSLSupportMethod() {
    switch (this) {
      case 'sni-only':
        return SSLSupportMethod.sniOnly;
      case 'vip':
        return SSLSupportMethod.vip;
      case 'static-ip':
        return SSLSupportMethod.staticIp;
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A list of AWS accounts and the active CloudFront key pairs in each account
/// that CloudFront can use to verify the signatures of signed URLs and signed
/// cookies.
class Signer {
  /// An AWS account number that contains active CloudFront key pairs that
  /// CloudFront can use to verify the signatures of signed URLs and signed
  /// cookies. If the AWS account that owns the key pairs is the same account that
  /// owns the CloudFront distribution, the value of this field is
  /// <code>self</code>.
  final String awsAccountNumber;

  /// A list of CloudFront key pair identifiers.
  final KeyPairIds keyPairIds;

  Signer({
    this.awsAccountNumber,
    this.keyPairIds,
  });
  factory Signer.fromXml(_s.XmlElement elem) {
    return Signer(
      awsAccountNumber: _s.extractXmlStringValue(elem, 'AwsAccountNumber'),
      keyPairIds: _s
          .extractXmlChild(elem, 'KeyPairIds')
          ?.let((e) => KeyPairIds.fromXml(e)),
    );
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
    throw Exception('Unknown enum value: $this');
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
    throw Exception('Unknown enum value: $this');
  }
}

/// A complex data type for the status codes that you specify that, when
/// returned by a primary origin, trigger CloudFront to failover to a second
/// origin.
class StatusCodes {
  /// The items (status codes) for an origin group.
  final List<int> items;

  /// The number of status codes.
  final int quantity;

  StatusCodes({
    @_s.required this.items,
    @_s.required this.quantity,
  });
  factory StatusCodes.fromXml(_s.XmlElement elem) {
    return StatusCodes(
      items: _s
          .extractXmlChild(elem, 'Items')
          ?.let((elem) => _s.extractXmlIntListValues(elem, 'StatusCode')),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlIntValue('Quantity', quantity),
      _s.XmlElement(_s.XmlName('Items'), [],
          items?.map((e) => _s.encodeXmlIntValue('StatusCode', e))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A streaming distribution tells CloudFront where you want RTMP content to be
/// delivered from, and the details about how to track and manage content
/// delivery.
class StreamingDistribution {
  /// The ARN (Amazon Resource Name) for the distribution. For example:
  /// <code>arn:aws:cloudfront::123456789012:distribution/EDFDVBD632BHDS5</code>,
  /// where <code>123456789012</code> is your AWS account ID.
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
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving
  /// Private Content through CloudFront</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  final ActiveTrustedSigners activeTrustedSigners;

  /// The domain name that corresponds to the streaming distribution, for example,
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
  final DateTime lastModifiedTime;

  StreamingDistribution({
    @_s.required this.arn,
    @_s.required this.activeTrustedSigners,
    @_s.required this.domainName,
    @_s.required this.id,
    @_s.required this.status,
    @_s.required this.streamingDistributionConfig,
    this.lastModifiedTime,
  });
  factory StreamingDistribution.fromXml(_s.XmlElement elem) {
    return StreamingDistribution(
      arn: _s.extractXmlStringValue(elem, 'ARN'),
      activeTrustedSigners: _s
          .extractXmlChild(elem, 'ActiveTrustedSigners')
          ?.let((e) => ActiveTrustedSigners.fromXml(e)),
      domainName: _s.extractXmlStringValue(elem, 'DomainName'),
      id: _s.extractXmlStringValue(elem, 'Id'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      streamingDistributionConfig: _s
          .extractXmlChild(elem, 'StreamingDistributionConfig')
          ?.let((e) => StreamingDistributionConfig.fromXml(e)),
      lastModifiedTime: _s.extractXmlDateTimeValue(elem, 'LastModifiedTime'),
    );
  }
}

/// The RTMP distribution's configuration information.
class StreamingDistributionConfig {
  /// A unique value (for example, a date-time stamp) that ensures that the
  /// request can't be replayed.
  ///
  /// If the value of <code>CallerReference</code> is new (regardless of the
  /// content of the <code>StreamingDistributionConfig</code> object), CloudFront
  /// creates a new distribution.
  ///
  /// If <code>CallerReference</code> is a value that you already sent in a
  /// previous request to create a distribution, CloudFront returns a
  /// <code>DistributionAlreadyExists</code> error.
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
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving
  /// Private Content through CloudFront</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  final TrustedSigners trustedSigners;

  /// A complex type that contains information about CNAMEs (alternate domain
  /// names), if any, for this streaming distribution.
  final Aliases aliases;

  /// A complex type that controls whether access logs are written for the
  /// streaming distribution.
  final StreamingLoggingConfig logging;

  /// A complex type that contains information about price class for this
  /// streaming distribution.
  final PriceClass priceClass;

  StreamingDistributionConfig({
    @_s.required this.callerReference,
    @_s.required this.comment,
    @_s.required this.enabled,
    @_s.required this.s3Origin,
    @_s.required this.trustedSigners,
    this.aliases,
    this.logging,
    this.priceClass,
  });
  factory StreamingDistributionConfig.fromXml(_s.XmlElement elem) {
    return StreamingDistributionConfig(
      callerReference: _s.extractXmlStringValue(elem, 'CallerReference'),
      comment: _s.extractXmlStringValue(elem, 'Comment'),
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      s3Origin:
          _s.extractXmlChild(elem, 'S3Origin')?.let((e) => S3Origin.fromXml(e)),
      trustedSigners: _s
          .extractXmlChild(elem, 'TrustedSigners')
          ?.let((e) => TrustedSigners.fromXml(e)),
      aliases:
          _s.extractXmlChild(elem, 'Aliases')?.let((e) => Aliases.fromXml(e)),
      logging: _s
          .extractXmlChild(elem, 'Logging')
          ?.let((e) => StreamingLoggingConfig.fromXml(e)),
      priceClass: _s.extractXmlStringValue(elem, 'PriceClass')?.toPriceClass(),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlStringValue('CallerReference', callerReference),
      s3Origin?.toXml('S3Origin'),
      if (aliases != null) aliases?.toXml('Aliases'),
      _s.encodeXmlStringValue('Comment', comment),
      if (logging != null) logging?.toXml('Logging'),
      trustedSigners?.toXml('TrustedSigners'),
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
      $children.where((e) => e != null),
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
    @_s.required this.streamingDistributionConfig,
    @_s.required this.tags,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      streamingDistributionConfig?.toXml('StreamingDistributionConfig'),
      tags?.toXml('Tags'),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
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
  final List<StreamingDistributionSummary> items;

  /// If <code>IsTruncated</code> is <code>true</code>, this element is present
  /// and contains the value you can use for the <code>Marker</code> request
  /// parameter to continue listing your RTMP distributions where they left off.
  final String nextMarker;

  StreamingDistributionList({
    @_s.required this.isTruncated,
    @_s.required this.marker,
    @_s.required this.maxItems,
    @_s.required this.quantity,
    this.items,
    this.nextMarker,
  });
  factory StreamingDistributionList.fromXml(_s.XmlElement elem) {
    return StreamingDistributionList(
      isTruncated: _s.extractXmlBoolValue(elem, 'IsTruncated'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      maxItems: _s.extractXmlIntValue(elem, 'MaxItems'),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) => elem
          .findElements('StreamingDistributionSummary')
          .map((c) => StreamingDistributionSummary.fromXml(c))
          .toList()),
      nextMarker: _s.extractXmlStringValue(elem, 'NextMarker'),
    );
  }
}

/// A summary of the information for a CloudFront streaming distribution.
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

  /// The domain name corresponding to the distribution, for example,
  /// <code>d111111abcdef8.cloudfront.net</code>.
  final String domainName;

  /// Whether the distribution is enabled to accept end user requests for content.
  final bool enabled;

  /// The identifier for the distribution, for example,
  /// <code>EDFDVBD632BHDS5</code>.
  final String id;

  /// The date and time the distribution was last modified.
  final DateTime lastModifiedTime;

  /// A complex type that contains information about price class for this
  /// streaming distribution.
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
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html">Serving
  /// Private Content through CloudFront</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  final TrustedSigners trustedSigners;

  StreamingDistributionSummary({
    @_s.required this.arn,
    @_s.required this.aliases,
    @_s.required this.comment,
    @_s.required this.domainName,
    @_s.required this.enabled,
    @_s.required this.id,
    @_s.required this.lastModifiedTime,
    @_s.required this.priceClass,
    @_s.required this.s3Origin,
    @_s.required this.status,
    @_s.required this.trustedSigners,
  });
  factory StreamingDistributionSummary.fromXml(_s.XmlElement elem) {
    return StreamingDistributionSummary(
      arn: _s.extractXmlStringValue(elem, 'ARN'),
      aliases:
          _s.extractXmlChild(elem, 'Aliases')?.let((e) => Aliases.fromXml(e)),
      comment: _s.extractXmlStringValue(elem, 'Comment'),
      domainName: _s.extractXmlStringValue(elem, 'DomainName'),
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      id: _s.extractXmlStringValue(elem, 'Id'),
      lastModifiedTime: _s.extractXmlDateTimeValue(elem, 'LastModifiedTime'),
      priceClass: _s.extractXmlStringValue(elem, 'PriceClass')?.toPriceClass(),
      s3Origin:
          _s.extractXmlChild(elem, 'S3Origin')?.let((e) => S3Origin.fromXml(e)),
      status: _s.extractXmlStringValue(elem, 'Status'),
      trustedSigners: _s
          .extractXmlChild(elem, 'TrustedSigners')
          ?.let((e) => TrustedSigners.fromXml(e)),
    );
  }
}

/// A complex type that controls whether access logs are written for this
/// streaming distribution.
class StreamingLoggingConfig {
  /// The Amazon S3 bucket to store the access logs in, for example,
  /// <code>myawslogbucket.s3.amazonaws.com</code>.
  final String bucket;

  /// Specifies whether you want CloudFront to save access logs to an Amazon S3
  /// bucket. If you don't want to enable logging when you create a streaming
  /// distribution or if you want to disable logging for an existing streaming
  /// distribution, specify <code>false</code> for <code>Enabled</code>, and
  /// specify <code>empty Bucket</code> and <code>Prefix</code> elements. If you
  /// specify <code>false</code> for <code>Enabled</code> but you specify values
  /// for <code>Bucket</code> and <code>Prefix</code>, the values are
  /// automatically deleted.
  final bool enabled;

  /// An optional string that you want CloudFront to prefix to the access log
  /// filenames for this streaming distribution, for example,
  /// <code>myprefix/</code>. If you want to enable logging, but you don't want to
  /// specify a prefix, you still must include an empty <code>Prefix</code>
  /// element in the <code>Logging</code> element.
  final String prefix;

  StreamingLoggingConfig({
    @_s.required this.bucket,
    @_s.required this.enabled,
    @_s.required this.prefix,
  });
  factory StreamingLoggingConfig.fromXml(_s.XmlElement elem) {
    return StreamingLoggingConfig(
      bucket: _s.extractXmlStringValue(elem, 'Bucket'),
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      prefix: _s.extractXmlStringValue(elem, 'Prefix'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
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
      $children.where((e) => e != null),
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
  final String value;

  Tag({
    @_s.required this.key,
    this.value,
  });
  factory Tag.fromXml(_s.XmlElement elem) {
    return Tag(
      key: _s.extractXmlStringValue(elem, 'Key'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
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
      $children.where((e) => e != null),
    );
  }
}

/// A complex type that contains zero or more <code>Tag</code> elements.
class TagKeys {
  /// A complex type that contains <code>Tag</code> key elements.
  final List<String> items;

  TagKeys({
    this.items,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
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
      $children.where((e) => e != null),
    );
  }
}

/// A complex type that contains zero or more <code>Tag</code> elements.
class Tags {
  /// A complex type that contains <code>Tag</code> elements.
  final List<Tag> items;

  Tags({
    this.items,
  });
  factory Tags.fromXml(_s.XmlElement elem) {
    return Tags(
      items: _s.extractXmlChild(elem, 'Items')?.let((elem) =>
          elem.findElements('Tag').map((c) => Tag.fromXml(c)).toList()),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (items != null)
        _s.XmlElement(
            _s.XmlName('Items'), [], items.map((e) => e?.toXml('Tag'))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A list of key groups whose public keys CloudFront can use to verify the
/// signatures of signed URLs and signed cookies.
class TrustedKeyGroups {
  /// This field is <code>true</code> if any of the key groups in the list have
  /// public keys that CloudFront can use to verify the signatures of signed URLs
  /// and signed cookies. If not, this field is <code>false</code>.
  final bool enabled;

  /// The number of key groups in the list.
  final int quantity;

  /// A list of key groups identifiers.
  final List<String> items;

  TrustedKeyGroups({
    @_s.required this.enabled,
    @_s.required this.quantity,
    this.items,
  });
  factory TrustedKeyGroups.fromXml(_s.XmlElement elem) {
    return TrustedKeyGroups(
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s
          .extractXmlChild(elem, 'Items')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'KeyGroup')),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      _s.encodeXmlBoolValue('Enabled', enabled),
      _s.encodeXmlIntValue('Quantity', quantity),
      if (items != null)
        _s.XmlElement(_s.XmlName('Items'), [],
            items.map((e) => _s.encodeXmlStringValue('KeyGroup', e))),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

/// A list of AWS accounts whose public keys CloudFront can use to verify the
/// signatures of signed URLs and signed cookies.
class TrustedSigners {
  /// This field is <code>true</code> if any of the AWS accounts have public keys
  /// that CloudFront can use to verify the signatures of signed URLs and signed
  /// cookies. If not, this field is <code>false</code>.
  final bool enabled;

  /// The number of AWS accounts in the list.
  final int quantity;

  /// A list of AWS account identifiers.
  final List<String> items;

  TrustedSigners({
    @_s.required this.enabled,
    @_s.required this.quantity,
    this.items,
  });
  factory TrustedSigners.fromXml(_s.XmlElement elem) {
    return TrustedSigners(
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      quantity: _s.extractXmlIntValue(elem, 'Quantity'),
      items: _s.extractXmlChild(elem, 'Items')?.let(
          (elem) => _s.extractXmlStringListValues(elem, 'AwsAccountNumber')),
    );
  }

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
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
      $children.where((e) => e != null),
    );
  }
}

class UpdateCachePolicyResult {
  /// A cache policy.
  final CachePolicy cachePolicy;

  /// The current version of the cache policy.
  final String eTag;

  UpdateCachePolicyResult({
    this.cachePolicy,
    this.eTag,
  });
}

/// The returned result of the corresponding request.
class UpdateCloudFrontOriginAccessIdentityResult {
  /// The origin access identity's information.
  final CloudFrontOriginAccessIdentity cloudFrontOriginAccessIdentity;

  /// The current version of the configuration. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  final String eTag;

  UpdateCloudFrontOriginAccessIdentityResult({
    this.cloudFrontOriginAccessIdentity,
    this.eTag,
  });
}

/// The returned result of the corresponding request.
class UpdateDistributionResult {
  /// The distribution's information.
  final Distribution distribution;

  /// The current version of the configuration. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  final String eTag;

  UpdateDistributionResult({
    this.distribution,
    this.eTag,
  });
}

class UpdateFieldLevelEncryptionConfigResult {
  /// The value of the <code>ETag</code> header that you received when updating
  /// the configuration. For example: <code>E2QWRUHAPOMQZL</code>.
  final String eTag;

  /// Return the results of updating the configuration.
  final FieldLevelEncryption fieldLevelEncryption;

  UpdateFieldLevelEncryptionConfigResult({
    this.eTag,
    this.fieldLevelEncryption,
  });
}

class UpdateFieldLevelEncryptionProfileResult {
  /// The result of the field-level encryption profile request.
  final String eTag;

  /// Return the results of updating the profile.
  final FieldLevelEncryptionProfile fieldLevelEncryptionProfile;

  UpdateFieldLevelEncryptionProfileResult({
    this.eTag,
    this.fieldLevelEncryptionProfile,
  });
}

class UpdateKeyGroupResult {
  /// The identifier for this version of the key group.
  final String eTag;

  /// The key group that was just updated.
  final KeyGroup keyGroup;

  UpdateKeyGroupResult({
    this.eTag,
    this.keyGroup,
  });
}

class UpdateOriginRequestPolicyResult {
  /// The current version of the origin request policy.
  final String eTag;

  /// An origin request policy.
  final OriginRequestPolicy originRequestPolicy;

  UpdateOriginRequestPolicyResult({
    this.eTag,
    this.originRequestPolicy,
  });
}

class UpdatePublicKeyResult {
  /// The identifier of the current version of the public key.
  final String eTag;

  /// The public key.
  final PublicKey publicKey;

  UpdatePublicKeyResult({
    this.eTag,
    this.publicKey,
  });
}

class UpdateRealtimeLogConfigRequest {
  /// The Amazon Resource Name (ARN) for this real-time log configuration.
  final String arn;

  /// Contains information about the Amazon Kinesis data stream where you are
  /// sending real-time log data.
  final List<EndPoint> endPoints;

  /// A list of fields to include in each real-time log record.
  ///
  /// For more information about fields, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/real-time-logs.html#understand-real-time-log-config-fields">Real-time
  /// log configuration fields</a> in the <i>Amazon CloudFront Developer
  /// Guide</i>.
  final List<String> fields;

  /// The name for this real-time log configuration.
  final String name;

  /// The sampling rate for this real-time log configuration. The sampling rate
  /// determines the percentage of viewer requests that are represented in the
  /// real-time log data. You must provide an integer between 1 and 100,
  /// inclusive.
  final int samplingRate;

  UpdateRealtimeLogConfigRequest({
    this.arn,
    this.endPoints,
    this.fields,
    this.name,
    this.samplingRate,
  });
  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
    final $children = <_s.XmlNode>[
      if (endPoints != null)
        _s.XmlElement(_s.XmlName('EndPoints'), [],
            endPoints.map((e) => e?.toXml('member'))),
      if (fields != null)
        _s.XmlElement(_s.XmlName('Fields'), [],
            fields.map((e) => _s.encodeXmlStringValue('Field', e))),
      if (name != null) _s.encodeXmlStringValue('Name', name),
      if (arn != null) _s.encodeXmlStringValue('ARN', arn),
      if (samplingRate != null)
        _s.encodeXmlIntValue('SamplingRate', samplingRate),
    ];
    final $attributes = <_s.XmlAttribute>[
      ...?attributes,
    ];
    return _s.XmlElement(
      _s.XmlName(elemName),
      $attributes,
      $children.where((e) => e != null),
    );
  }
}

class UpdateRealtimeLogConfigResult {
  /// A real-time log configuration.
  final RealtimeLogConfig realtimeLogConfig;

  UpdateRealtimeLogConfigResult({
    this.realtimeLogConfig,
  });
  factory UpdateRealtimeLogConfigResult.fromXml(_s.XmlElement elem) {
    return UpdateRealtimeLogConfigResult(
      realtimeLogConfig: _s
          .extractXmlChild(elem, 'RealtimeLogConfig')
          ?.let((e) => RealtimeLogConfig.fromXml(e)),
    );
  }
}

/// The returned result of the corresponding request.
class UpdateStreamingDistributionResult {
  /// The current version of the configuration. For example:
  /// <code>E2QWRUHAPOMQZL</code>.
  final String eTag;

  /// The streaming distribution's information.
  final StreamingDistribution streamingDistribution;

  UpdateStreamingDistributionResult({
    this.eTag,
    this.streamingDistribution,
  });
}

/// A complex type that determines the distribution’s SSL/TLS configuration for
/// communicating with viewers.
///
/// If the distribution doesn’t use <code>Aliases</code> (also known as
/// alternate domain names or CNAMEs)—that is, if the distribution uses the
/// CloudFront domain name such as
/// <code>d111111abcdef8.cloudfront.net</code>—set
/// <code>CloudFrontDefaultCertificate</code> to <code>true</code> and leave all
/// other fields empty.
///
/// If the distribution uses <code>Aliases</code> (alternate domain names or
/// CNAMEs), use the fields in this type to specify the following settings:
///
/// <ul>
/// <li>
/// Which viewers the distribution accepts HTTPS connections from: only viewers
/// that support <a
/// href="https://en.wikipedia.org/wiki/Server_Name_Indication">server name
/// indication (SNI)</a> (recommended), or all viewers including those that
/// don’t support SNI.
///
/// <ul>
/// <li>
/// To accept HTTPS connections from only viewers that support SNI, set
/// <code>SSLSupportMethod</code> to <code>sni-only</code>. This is recommended.
/// Most browsers and clients support SNI.
/// </li>
/// <li>
/// To accept HTTPS connections from all viewers, including those that don’t
/// support SNI, set <code>SSLSupportMethod</code> to <code>vip</code>. This is
/// not recommended, and results in additional monthly charges from CloudFront.
/// </li>
/// </ul> </li>
/// <li>
/// The minimum SSL/TLS protocol version that the distribution can use to
/// communicate with viewers. To specify a minimum version, choose a value for
/// <code>MinimumProtocolVersion</code>. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValues-security-policy">Security
/// Policy</a> in the <i>Amazon CloudFront Developer Guide</i>.
/// </li>
/// <li>
/// The location of the SSL/TLS certificate, <a
/// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-overview.html">AWS
/// Certificate Manager (ACM)</a> (recommended) or <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">AWS
/// Identity and Access Management (AWS IAM)</a>. You specify the location by
/// setting a value in one of the following fields (not both):
///
/// <ul>
/// <li>
/// <code>ACMCertificateArn</code>
/// </li>
/// <li>
/// <code>IAMCertificateId</code>
/// </li>
/// </ul> </li>
/// </ul>
/// All distributions support HTTPS connections from viewers. To require viewers
/// to use HTTPS only, or to redirect them from HTTP to HTTPS, use
/// <code>ViewerProtocolPolicy</code> in the <code>CacheBehavior</code> or
/// <code>DefaultCacheBehavior</code>. To specify how CloudFront should use
/// SSL/TLS to communicate with your custom origin, use
/// <code>CustomOriginConfig</code>.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-https.html">Using
/// HTTPS with CloudFront</a> and <a
/// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-https-alternate-domain-names.html">
/// Using Alternate Domain Names and HTTPS</a> in the <i>Amazon CloudFront
/// Developer Guide</i>.
class ViewerCertificate {
  /// If the distribution uses <code>Aliases</code> (alternate domain names or
  /// CNAMEs) and the SSL/TLS certificate is stored in <a
  /// href="https://docs.aws.amazon.com/acm/latest/userguide/acm-overview.html">AWS
  /// Certificate Manager (ACM)</a>, provide the Amazon Resource Name (ARN) of the
  /// ACM certificate. CloudFront only supports ACM certificates in the US East
  /// (N. Virginia) Region (<code>us-east-1</code>).
  ///
  /// If you specify an ACM certificate ARN, you must also specify values for
  /// <code>MinimumProtocolVersion</code> and <code>SSLSupportMethod</code>.
  final String aCMCertificateArn;

  /// This field is deprecated. Use one of the following fields instead:
  ///
  /// <ul>
  /// <li>
  /// <code>ACMCertificateArn</code>
  /// </li>
  /// <li>
  /// <code>IAMCertificateId</code>
  /// </li>
  /// <li>
  /// <code>CloudFrontDefaultCertificate</code>
  /// </li>
  /// </ul>
  final String certificate;

  /// This field is deprecated. Use one of the following fields instead:
  ///
  /// <ul>
  /// <li>
  /// <code>ACMCertificateArn</code>
  /// </li>
  /// <li>
  /// <code>IAMCertificateId</code>
  /// </li>
  /// <li>
  /// <code>CloudFrontDefaultCertificate</code>
  /// </li>
  /// </ul>
  final CertificateSource certificateSource;

  /// If the distribution uses the CloudFront domain name such as
  /// <code>d111111abcdef8.cloudfront.net</code>, set this field to
  /// <code>true</code>.
  ///
  /// If the distribution uses <code>Aliases</code> (alternate domain names or
  /// CNAMEs), set this field to <code>false</code> and specify values for the
  /// following fields:
  ///
  /// <ul>
  /// <li>
  /// <code>ACMCertificateArn</code> or <code>IAMCertificateId</code> (specify a
  /// value for one, not both)
  /// </li>
  /// <li>
  /// <code>MinimumProtocolVersion</code>
  /// </li>
  /// <li>
  /// <code>SSLSupportMethod</code>
  /// </li>
  /// </ul>
  final bool cloudFrontDefaultCertificate;

  /// If the distribution uses <code>Aliases</code> (alternate domain names or
  /// CNAMEs) and the SSL/TLS certificate is stored in <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_server-certs.html">AWS
  /// Identity and Access Management (AWS IAM)</a>, provide the ID of the IAM
  /// certificate.
  ///
  /// If you specify an IAM certificate ID, you must also specify values for
  /// <code>MinimumProtocolVersion</code> and <code>SSLSupportMethod</code>.
  final String iAMCertificateId;

  /// If the distribution uses <code>Aliases</code> (alternate domain names or
  /// CNAMEs), specify the security policy that you want CloudFront to use for
  /// HTTPS connections with viewers. The security policy determines two settings:
  ///
  /// <ul>
  /// <li>
  /// The minimum SSL/TLS protocol that CloudFront can use to communicate with
  /// viewers.
  /// </li>
  /// <li>
  /// The ciphers that CloudFront can use to encrypt the content that it returns
  /// to viewers.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-values-specify.html#DownloadDistValues-security-policy">Security
  /// Policy</a> and <a
  /// href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/secure-connections-supported-viewer-protocols-ciphers.html#secure-connections-supported-ciphers">Supported
  /// Protocols and Ciphers Between Viewers and CloudFront</a> in the <i>Amazon
  /// CloudFront Developer Guide</i>.
  /// <note>
  /// On the CloudFront console, this setting is called <b>Security Policy</b>.
  /// </note>
  /// When you’re using SNI only (you set <code>SSLSupportMethod</code> to
  /// <code>sni-only</code>), you must specify <code>TLSv1</code> or higher.
  ///
  /// If the distribution uses the CloudFront domain name such as
  /// <code>d111111abcdef8.cloudfront.net</code> (you set
  /// <code>CloudFrontDefaultCertificate</code> to <code>true</code>), CloudFront
  /// automatically sets the security policy to <code>TLSv1</code> regardless of
  /// the value that you set here.
  final MinimumProtocolVersion minimumProtocolVersion;

  /// If the distribution uses <code>Aliases</code> (alternate domain names or
  /// CNAMEs), specify which viewers the distribution accepts HTTPS connections
  /// from.
  ///
  /// <ul>
  /// <li>
  /// <code>sni-only</code> – The distribution accepts HTTPS connections from only
  /// viewers that support <a
  /// href="https://en.wikipedia.org/wiki/Server_Name_Indication">server name
  /// indication (SNI)</a>. This is recommended. Most browsers and clients support
  /// SNI.
  /// </li>
  /// <li>
  /// <code>vip</code> – The distribution accepts HTTPS connections from all
  /// viewers including those that don’t support SNI. This is not recommended, and
  /// results in additional monthly charges from CloudFront.
  /// </li>
  /// <li>
  /// <code>static-ip</code> - Do not specify this value unless your distribution
  /// has been enabled for this feature by the CloudFront team. If you have a use
  /// case that requires static IP addresses for a distribution, contact
  /// CloudFront through the <a
  /// href="https://console.aws.amazon.com/support/home">AWS Support Center</a>.
  /// </li>
  /// </ul>
  /// If the distribution uses the CloudFront domain name such as
  /// <code>d111111abcdef8.cloudfront.net</code>, don’t set a value for this
  /// field.
  final SSLSupportMethod sSLSupportMethod;

  ViewerCertificate({
    this.aCMCertificateArn,
    this.certificate,
    this.certificateSource,
    this.cloudFrontDefaultCertificate,
    this.iAMCertificateId,
    this.minimumProtocolVersion,
    this.sSLSupportMethod,
  });
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

  _s.XmlElement toXml(String elemName, {List<_s.XmlAttribute> attributes}) {
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
      $children.where((e) => e != null),
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
    throw Exception('Unknown enum value: $this');
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
    throw Exception('Unknown enum value: $this');
  }
}

class AccessDenied extends _s.GenericAwsException {
  AccessDenied({String type, String message})
      : super(type: type, code: 'AccessDenied', message: message);
}

class BatchTooLarge extends _s.GenericAwsException {
  BatchTooLarge({String type, String message})
      : super(type: type, code: 'BatchTooLarge', message: message);
}

class CNAMEAlreadyExists extends _s.GenericAwsException {
  CNAMEAlreadyExists({String type, String message})
      : super(type: type, code: 'CNAMEAlreadyExists', message: message);
}

class CachePolicyAlreadyExists extends _s.GenericAwsException {
  CachePolicyAlreadyExists({String type, String message})
      : super(type: type, code: 'CachePolicyAlreadyExists', message: message);
}

class CachePolicyInUse extends _s.GenericAwsException {
  CachePolicyInUse({String type, String message})
      : super(type: type, code: 'CachePolicyInUse', message: message);
}

class CannotChangeImmutablePublicKeyFields extends _s.GenericAwsException {
  CannotChangeImmutablePublicKeyFields({String type, String message})
      : super(
            type: type,
            code: 'CannotChangeImmutablePublicKeyFields',
            message: message);
}

class CloudFrontOriginAccessIdentityAlreadyExists
    extends _s.GenericAwsException {
  CloudFrontOriginAccessIdentityAlreadyExists({String type, String message})
      : super(
            type: type,
            code: 'CloudFrontOriginAccessIdentityAlreadyExists',
            message: message);
}

class CloudFrontOriginAccessIdentityInUse extends _s.GenericAwsException {
  CloudFrontOriginAccessIdentityInUse({String type, String message})
      : super(
            type: type,
            code: 'CloudFrontOriginAccessIdentityInUse',
            message: message);
}

class DistributionAlreadyExists extends _s.GenericAwsException {
  DistributionAlreadyExists({String type, String message})
      : super(type: type, code: 'DistributionAlreadyExists', message: message);
}

class DistributionNotDisabled extends _s.GenericAwsException {
  DistributionNotDisabled({String type, String message})
      : super(type: type, code: 'DistributionNotDisabled', message: message);
}

class FieldLevelEncryptionConfigAlreadyExists extends _s.GenericAwsException {
  FieldLevelEncryptionConfigAlreadyExists({String type, String message})
      : super(
            type: type,
            code: 'FieldLevelEncryptionConfigAlreadyExists',
            message: message);
}

class FieldLevelEncryptionConfigInUse extends _s.GenericAwsException {
  FieldLevelEncryptionConfigInUse({String type, String message})
      : super(
            type: type,
            code: 'FieldLevelEncryptionConfigInUse',
            message: message);
}

class FieldLevelEncryptionProfileAlreadyExists extends _s.GenericAwsException {
  FieldLevelEncryptionProfileAlreadyExists({String type, String message})
      : super(
            type: type,
            code: 'FieldLevelEncryptionProfileAlreadyExists',
            message: message);
}

class FieldLevelEncryptionProfileInUse extends _s.GenericAwsException {
  FieldLevelEncryptionProfileInUse({String type, String message})
      : super(
            type: type,
            code: 'FieldLevelEncryptionProfileInUse',
            message: message);
}

class FieldLevelEncryptionProfileSizeExceeded extends _s.GenericAwsException {
  FieldLevelEncryptionProfileSizeExceeded({String type, String message})
      : super(
            type: type,
            code: 'FieldLevelEncryptionProfileSizeExceeded',
            message: message);
}

class IllegalDelete extends _s.GenericAwsException {
  IllegalDelete({String type, String message})
      : super(type: type, code: 'IllegalDelete', message: message);
}

class IllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior
    extends _s.GenericAwsException {
  IllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior(
      {String type, String message})
      : super(
            type: type,
            code:
                'IllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior',
            message: message);
}

class IllegalUpdate extends _s.GenericAwsException {
  IllegalUpdate({String type, String message})
      : super(type: type, code: 'IllegalUpdate', message: message);
}

class InconsistentQuantities extends _s.GenericAwsException {
  InconsistentQuantities({String type, String message})
      : super(type: type, code: 'InconsistentQuantities', message: message);
}

class InvalidArgument extends _s.GenericAwsException {
  InvalidArgument({String type, String message})
      : super(type: type, code: 'InvalidArgument', message: message);
}

class InvalidDefaultRootObject extends _s.GenericAwsException {
  InvalidDefaultRootObject({String type, String message})
      : super(type: type, code: 'InvalidDefaultRootObject', message: message);
}

class InvalidErrorCode extends _s.GenericAwsException {
  InvalidErrorCode({String type, String message})
      : super(type: type, code: 'InvalidErrorCode', message: message);
}

class InvalidForwardCookies extends _s.GenericAwsException {
  InvalidForwardCookies({String type, String message})
      : super(type: type, code: 'InvalidForwardCookies', message: message);
}

class InvalidGeoRestrictionParameter extends _s.GenericAwsException {
  InvalidGeoRestrictionParameter({String type, String message})
      : super(
            type: type,
            code: 'InvalidGeoRestrictionParameter',
            message: message);
}

class InvalidHeadersForS3Origin extends _s.GenericAwsException {
  InvalidHeadersForS3Origin({String type, String message})
      : super(type: type, code: 'InvalidHeadersForS3Origin', message: message);
}

class InvalidIfMatchVersion extends _s.GenericAwsException {
  InvalidIfMatchVersion({String type, String message})
      : super(type: type, code: 'InvalidIfMatchVersion', message: message);
}

class InvalidLambdaFunctionAssociation extends _s.GenericAwsException {
  InvalidLambdaFunctionAssociation({String type, String message})
      : super(
            type: type,
            code: 'InvalidLambdaFunctionAssociation',
            message: message);
}

class InvalidLocationCode extends _s.GenericAwsException {
  InvalidLocationCode({String type, String message})
      : super(type: type, code: 'InvalidLocationCode', message: message);
}

class InvalidMinimumProtocolVersion extends _s.GenericAwsException {
  InvalidMinimumProtocolVersion({String type, String message})
      : super(
            type: type,
            code: 'InvalidMinimumProtocolVersion',
            message: message);
}

class InvalidOrigin extends _s.GenericAwsException {
  InvalidOrigin({String type, String message})
      : super(type: type, code: 'InvalidOrigin', message: message);
}

class InvalidOriginAccessIdentity extends _s.GenericAwsException {
  InvalidOriginAccessIdentity({String type, String message})
      : super(
            type: type, code: 'InvalidOriginAccessIdentity', message: message);
}

class InvalidOriginKeepaliveTimeout extends _s.GenericAwsException {
  InvalidOriginKeepaliveTimeout({String type, String message})
      : super(
            type: type,
            code: 'InvalidOriginKeepaliveTimeout',
            message: message);
}

class InvalidOriginReadTimeout extends _s.GenericAwsException {
  InvalidOriginReadTimeout({String type, String message})
      : super(type: type, code: 'InvalidOriginReadTimeout', message: message);
}

class InvalidProtocolSettings extends _s.GenericAwsException {
  InvalidProtocolSettings({String type, String message})
      : super(type: type, code: 'InvalidProtocolSettings', message: message);
}

class InvalidQueryStringParameters extends _s.GenericAwsException {
  InvalidQueryStringParameters({String type, String message})
      : super(
            type: type, code: 'InvalidQueryStringParameters', message: message);
}

class InvalidRelativePath extends _s.GenericAwsException {
  InvalidRelativePath({String type, String message})
      : super(type: type, code: 'InvalidRelativePath', message: message);
}

class InvalidRequiredProtocol extends _s.GenericAwsException {
  InvalidRequiredProtocol({String type, String message})
      : super(type: type, code: 'InvalidRequiredProtocol', message: message);
}

class InvalidResponseCode extends _s.GenericAwsException {
  InvalidResponseCode({String type, String message})
      : super(type: type, code: 'InvalidResponseCode', message: message);
}

class InvalidTTLOrder extends _s.GenericAwsException {
  InvalidTTLOrder({String type, String message})
      : super(type: type, code: 'InvalidTTLOrder', message: message);
}

class InvalidTagging extends _s.GenericAwsException {
  InvalidTagging({String type, String message})
      : super(type: type, code: 'InvalidTagging', message: message);
}

class InvalidViewerCertificate extends _s.GenericAwsException {
  InvalidViewerCertificate({String type, String message})
      : super(type: type, code: 'InvalidViewerCertificate', message: message);
}

class InvalidWebACLId extends _s.GenericAwsException {
  InvalidWebACLId({String type, String message})
      : super(type: type, code: 'InvalidWebACLId', message: message);
}

class KeyGroupAlreadyExists extends _s.GenericAwsException {
  KeyGroupAlreadyExists({String type, String message})
      : super(type: type, code: 'KeyGroupAlreadyExists', message: message);
}

class MissingBody extends _s.GenericAwsException {
  MissingBody({String type, String message})
      : super(type: type, code: 'MissingBody', message: message);
}

class NoSuchCachePolicy extends _s.GenericAwsException {
  NoSuchCachePolicy({String type, String message})
      : super(type: type, code: 'NoSuchCachePolicy', message: message);
}

class NoSuchCloudFrontOriginAccessIdentity extends _s.GenericAwsException {
  NoSuchCloudFrontOriginAccessIdentity({String type, String message})
      : super(
            type: type,
            code: 'NoSuchCloudFrontOriginAccessIdentity',
            message: message);
}

class NoSuchDistribution extends _s.GenericAwsException {
  NoSuchDistribution({String type, String message})
      : super(type: type, code: 'NoSuchDistribution', message: message);
}

class NoSuchFieldLevelEncryptionConfig extends _s.GenericAwsException {
  NoSuchFieldLevelEncryptionConfig({String type, String message})
      : super(
            type: type,
            code: 'NoSuchFieldLevelEncryptionConfig',
            message: message);
}

class NoSuchFieldLevelEncryptionProfile extends _s.GenericAwsException {
  NoSuchFieldLevelEncryptionProfile({String type, String message})
      : super(
            type: type,
            code: 'NoSuchFieldLevelEncryptionProfile',
            message: message);
}

class NoSuchInvalidation extends _s.GenericAwsException {
  NoSuchInvalidation({String type, String message})
      : super(type: type, code: 'NoSuchInvalidation', message: message);
}

class NoSuchOrigin extends _s.GenericAwsException {
  NoSuchOrigin({String type, String message})
      : super(type: type, code: 'NoSuchOrigin', message: message);
}

class NoSuchOriginRequestPolicy extends _s.GenericAwsException {
  NoSuchOriginRequestPolicy({String type, String message})
      : super(type: type, code: 'NoSuchOriginRequestPolicy', message: message);
}

class NoSuchPublicKey extends _s.GenericAwsException {
  NoSuchPublicKey({String type, String message})
      : super(type: type, code: 'NoSuchPublicKey', message: message);
}

class NoSuchRealtimeLogConfig extends _s.GenericAwsException {
  NoSuchRealtimeLogConfig({String type, String message})
      : super(type: type, code: 'NoSuchRealtimeLogConfig', message: message);
}

class NoSuchResource extends _s.GenericAwsException {
  NoSuchResource({String type, String message})
      : super(type: type, code: 'NoSuchResource', message: message);
}

class NoSuchStreamingDistribution extends _s.GenericAwsException {
  NoSuchStreamingDistribution({String type, String message})
      : super(
            type: type, code: 'NoSuchStreamingDistribution', message: message);
}

class OriginRequestPolicyAlreadyExists extends _s.GenericAwsException {
  OriginRequestPolicyAlreadyExists({String type, String message})
      : super(
            type: type,
            code: 'OriginRequestPolicyAlreadyExists',
            message: message);
}

class OriginRequestPolicyInUse extends _s.GenericAwsException {
  OriginRequestPolicyInUse({String type, String message})
      : super(type: type, code: 'OriginRequestPolicyInUse', message: message);
}

class PreconditionFailed extends _s.GenericAwsException {
  PreconditionFailed({String type, String message})
      : super(type: type, code: 'PreconditionFailed', message: message);
}

class PublicKeyAlreadyExists extends _s.GenericAwsException {
  PublicKeyAlreadyExists({String type, String message})
      : super(type: type, code: 'PublicKeyAlreadyExists', message: message);
}

class PublicKeyInUse extends _s.GenericAwsException {
  PublicKeyInUse({String type, String message})
      : super(type: type, code: 'PublicKeyInUse', message: message);
}

class QueryArgProfileEmpty extends _s.GenericAwsException {
  QueryArgProfileEmpty({String type, String message})
      : super(type: type, code: 'QueryArgProfileEmpty', message: message);
}

class RealtimeLogConfigAlreadyExists extends _s.GenericAwsException {
  RealtimeLogConfigAlreadyExists({String type, String message})
      : super(
            type: type,
            code: 'RealtimeLogConfigAlreadyExists',
            message: message);
}

class RealtimeLogConfigInUse extends _s.GenericAwsException {
  RealtimeLogConfigInUse({String type, String message})
      : super(type: type, code: 'RealtimeLogConfigInUse', message: message);
}

class ResourceInUse extends _s.GenericAwsException {
  ResourceInUse({String type, String message})
      : super(type: type, code: 'ResourceInUse', message: message);
}

class StreamingDistributionAlreadyExists extends _s.GenericAwsException {
  StreamingDistributionAlreadyExists({String type, String message})
      : super(
            type: type,
            code: 'StreamingDistributionAlreadyExists',
            message: message);
}

class StreamingDistributionNotDisabled extends _s.GenericAwsException {
  StreamingDistributionNotDisabled({String type, String message})
      : super(
            type: type,
            code: 'StreamingDistributionNotDisabled',
            message: message);
}

class TooManyCacheBehaviors extends _s.GenericAwsException {
  TooManyCacheBehaviors({String type, String message})
      : super(type: type, code: 'TooManyCacheBehaviors', message: message);
}

class TooManyCachePolicies extends _s.GenericAwsException {
  TooManyCachePolicies({String type, String message})
      : super(type: type, code: 'TooManyCachePolicies', message: message);
}

class TooManyCertificates extends _s.GenericAwsException {
  TooManyCertificates({String type, String message})
      : super(type: type, code: 'TooManyCertificates', message: message);
}

class TooManyCloudFrontOriginAccessIdentities extends _s.GenericAwsException {
  TooManyCloudFrontOriginAccessIdentities({String type, String message})
      : super(
            type: type,
            code: 'TooManyCloudFrontOriginAccessIdentities',
            message: message);
}

class TooManyCookieNamesInWhiteList extends _s.GenericAwsException {
  TooManyCookieNamesInWhiteList({String type, String message})
      : super(
            type: type,
            code: 'TooManyCookieNamesInWhiteList',
            message: message);
}

class TooManyCookiesInCachePolicy extends _s.GenericAwsException {
  TooManyCookiesInCachePolicy({String type, String message})
      : super(
            type: type, code: 'TooManyCookiesInCachePolicy', message: message);
}

class TooManyCookiesInOriginRequestPolicy extends _s.GenericAwsException {
  TooManyCookiesInOriginRequestPolicy({String type, String message})
      : super(
            type: type,
            code: 'TooManyCookiesInOriginRequestPolicy',
            message: message);
}

class TooManyDistributionCNAMEs extends _s.GenericAwsException {
  TooManyDistributionCNAMEs({String type, String message})
      : super(type: type, code: 'TooManyDistributionCNAMEs', message: message);
}

class TooManyDistributions extends _s.GenericAwsException {
  TooManyDistributions({String type, String message})
      : super(type: type, code: 'TooManyDistributions', message: message);
}

class TooManyDistributionsAssociatedToCachePolicy
    extends _s.GenericAwsException {
  TooManyDistributionsAssociatedToCachePolicy({String type, String message})
      : super(
            type: type,
            code: 'TooManyDistributionsAssociatedToCachePolicy',
            message: message);
}

class TooManyDistributionsAssociatedToFieldLevelEncryptionConfig
    extends _s.GenericAwsException {
  TooManyDistributionsAssociatedToFieldLevelEncryptionConfig(
      {String type, String message})
      : super(
            type: type,
            code: 'TooManyDistributionsAssociatedToFieldLevelEncryptionConfig',
            message: message);
}

class TooManyDistributionsAssociatedToKeyGroup extends _s.GenericAwsException {
  TooManyDistributionsAssociatedToKeyGroup({String type, String message})
      : super(
            type: type,
            code: 'TooManyDistributionsAssociatedToKeyGroup',
            message: message);
}

class TooManyDistributionsAssociatedToOriginRequestPolicy
    extends _s.GenericAwsException {
  TooManyDistributionsAssociatedToOriginRequestPolicy(
      {String type, String message})
      : super(
            type: type,
            code: 'TooManyDistributionsAssociatedToOriginRequestPolicy',
            message: message);
}

class TooManyDistributionsWithLambdaAssociations
    extends _s.GenericAwsException {
  TooManyDistributionsWithLambdaAssociations({String type, String message})
      : super(
            type: type,
            code: 'TooManyDistributionsWithLambdaAssociations',
            message: message);
}

class TooManyDistributionsWithSingleFunctionARN extends _s.GenericAwsException {
  TooManyDistributionsWithSingleFunctionARN({String type, String message})
      : super(
            type: type,
            code: 'TooManyDistributionsWithSingleFunctionARN',
            message: message);
}

class TooManyFieldLevelEncryptionConfigs extends _s.GenericAwsException {
  TooManyFieldLevelEncryptionConfigs({String type, String message})
      : super(
            type: type,
            code: 'TooManyFieldLevelEncryptionConfigs',
            message: message);
}

class TooManyFieldLevelEncryptionContentTypeProfiles
    extends _s.GenericAwsException {
  TooManyFieldLevelEncryptionContentTypeProfiles({String type, String message})
      : super(
            type: type,
            code: 'TooManyFieldLevelEncryptionContentTypeProfiles',
            message: message);
}

class TooManyFieldLevelEncryptionEncryptionEntities
    extends _s.GenericAwsException {
  TooManyFieldLevelEncryptionEncryptionEntities({String type, String message})
      : super(
            type: type,
            code: 'TooManyFieldLevelEncryptionEncryptionEntities',
            message: message);
}

class TooManyFieldLevelEncryptionFieldPatterns extends _s.GenericAwsException {
  TooManyFieldLevelEncryptionFieldPatterns({String type, String message})
      : super(
            type: type,
            code: 'TooManyFieldLevelEncryptionFieldPatterns',
            message: message);
}

class TooManyFieldLevelEncryptionProfiles extends _s.GenericAwsException {
  TooManyFieldLevelEncryptionProfiles({String type, String message})
      : super(
            type: type,
            code: 'TooManyFieldLevelEncryptionProfiles',
            message: message);
}

class TooManyFieldLevelEncryptionQueryArgProfiles
    extends _s.GenericAwsException {
  TooManyFieldLevelEncryptionQueryArgProfiles({String type, String message})
      : super(
            type: type,
            code: 'TooManyFieldLevelEncryptionQueryArgProfiles',
            message: message);
}

class TooManyHeadersInCachePolicy extends _s.GenericAwsException {
  TooManyHeadersInCachePolicy({String type, String message})
      : super(
            type: type, code: 'TooManyHeadersInCachePolicy', message: message);
}

class TooManyHeadersInForwardedValues extends _s.GenericAwsException {
  TooManyHeadersInForwardedValues({String type, String message})
      : super(
            type: type,
            code: 'TooManyHeadersInForwardedValues',
            message: message);
}

class TooManyHeadersInOriginRequestPolicy extends _s.GenericAwsException {
  TooManyHeadersInOriginRequestPolicy({String type, String message})
      : super(
            type: type,
            code: 'TooManyHeadersInOriginRequestPolicy',
            message: message);
}

class TooManyInvalidationsInProgress extends _s.GenericAwsException {
  TooManyInvalidationsInProgress({String type, String message})
      : super(
            type: type,
            code: 'TooManyInvalidationsInProgress',
            message: message);
}

class TooManyKeyGroups extends _s.GenericAwsException {
  TooManyKeyGroups({String type, String message})
      : super(type: type, code: 'TooManyKeyGroups', message: message);
}

class TooManyKeyGroupsAssociatedToDistribution extends _s.GenericAwsException {
  TooManyKeyGroupsAssociatedToDistribution({String type, String message})
      : super(
            type: type,
            code: 'TooManyKeyGroupsAssociatedToDistribution',
            message: message);
}

class TooManyLambdaFunctionAssociations extends _s.GenericAwsException {
  TooManyLambdaFunctionAssociations({String type, String message})
      : super(
            type: type,
            code: 'TooManyLambdaFunctionAssociations',
            message: message);
}

class TooManyOriginCustomHeaders extends _s.GenericAwsException {
  TooManyOriginCustomHeaders({String type, String message})
      : super(type: type, code: 'TooManyOriginCustomHeaders', message: message);
}

class TooManyOriginGroupsPerDistribution extends _s.GenericAwsException {
  TooManyOriginGroupsPerDistribution({String type, String message})
      : super(
            type: type,
            code: 'TooManyOriginGroupsPerDistribution',
            message: message);
}

class TooManyOriginRequestPolicies extends _s.GenericAwsException {
  TooManyOriginRequestPolicies({String type, String message})
      : super(
            type: type, code: 'TooManyOriginRequestPolicies', message: message);
}

class TooManyOrigins extends _s.GenericAwsException {
  TooManyOrigins({String type, String message})
      : super(type: type, code: 'TooManyOrigins', message: message);
}

class TooManyPublicKeys extends _s.GenericAwsException {
  TooManyPublicKeys({String type, String message})
      : super(type: type, code: 'TooManyPublicKeys', message: message);
}

class TooManyPublicKeysInKeyGroup extends _s.GenericAwsException {
  TooManyPublicKeysInKeyGroup({String type, String message})
      : super(
            type: type, code: 'TooManyPublicKeysInKeyGroup', message: message);
}

class TooManyQueryStringParameters extends _s.GenericAwsException {
  TooManyQueryStringParameters({String type, String message})
      : super(
            type: type, code: 'TooManyQueryStringParameters', message: message);
}

class TooManyQueryStringsInCachePolicy extends _s.GenericAwsException {
  TooManyQueryStringsInCachePolicy({String type, String message})
      : super(
            type: type,
            code: 'TooManyQueryStringsInCachePolicy',
            message: message);
}

class TooManyQueryStringsInOriginRequestPolicy extends _s.GenericAwsException {
  TooManyQueryStringsInOriginRequestPolicy({String type, String message})
      : super(
            type: type,
            code: 'TooManyQueryStringsInOriginRequestPolicy',
            message: message);
}

class TooManyRealtimeLogConfigs extends _s.GenericAwsException {
  TooManyRealtimeLogConfigs({String type, String message})
      : super(type: type, code: 'TooManyRealtimeLogConfigs', message: message);
}

class TooManyStreamingDistributionCNAMEs extends _s.GenericAwsException {
  TooManyStreamingDistributionCNAMEs({String type, String message})
      : super(
            type: type,
            code: 'TooManyStreamingDistributionCNAMEs',
            message: message);
}

class TooManyStreamingDistributions extends _s.GenericAwsException {
  TooManyStreamingDistributions({String type, String message})
      : super(
            type: type,
            code: 'TooManyStreamingDistributions',
            message: message);
}

class TooManyTrustedSigners extends _s.GenericAwsException {
  TooManyTrustedSigners({String type, String message})
      : super(type: type, code: 'TooManyTrustedSigners', message: message);
}

class TrustedKeyGroupDoesNotExist extends _s.GenericAwsException {
  TrustedKeyGroupDoesNotExist({String type, String message})
      : super(
            type: type, code: 'TrustedKeyGroupDoesNotExist', message: message);
}

class TrustedSignerDoesNotExist extends _s.GenericAwsException {
  TrustedSignerDoesNotExist({String type, String message})
      : super(type: type, code: 'TrustedSignerDoesNotExist', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDenied': (type, message) => AccessDenied(type: type, message: message),
  'BatchTooLarge': (type, message) =>
      BatchTooLarge(type: type, message: message),
  'CNAMEAlreadyExists': (type, message) =>
      CNAMEAlreadyExists(type: type, message: message),
  'CachePolicyAlreadyExists': (type, message) =>
      CachePolicyAlreadyExists(type: type, message: message),
  'CachePolicyInUse': (type, message) =>
      CachePolicyInUse(type: type, message: message),
  'CannotChangeImmutablePublicKeyFields': (type, message) =>
      CannotChangeImmutablePublicKeyFields(type: type, message: message),
  'CloudFrontOriginAccessIdentityAlreadyExists': (type, message) =>
      CloudFrontOriginAccessIdentityAlreadyExists(type: type, message: message),
  'CloudFrontOriginAccessIdentityInUse': (type, message) =>
      CloudFrontOriginAccessIdentityInUse(type: type, message: message),
  'DistributionAlreadyExists': (type, message) =>
      DistributionAlreadyExists(type: type, message: message),
  'DistributionNotDisabled': (type, message) =>
      DistributionNotDisabled(type: type, message: message),
  'FieldLevelEncryptionConfigAlreadyExists': (type, message) =>
      FieldLevelEncryptionConfigAlreadyExists(type: type, message: message),
  'FieldLevelEncryptionConfigInUse': (type, message) =>
      FieldLevelEncryptionConfigInUse(type: type, message: message),
  'FieldLevelEncryptionProfileAlreadyExists': (type, message) =>
      FieldLevelEncryptionProfileAlreadyExists(type: type, message: message),
  'FieldLevelEncryptionProfileInUse': (type, message) =>
      FieldLevelEncryptionProfileInUse(type: type, message: message),
  'FieldLevelEncryptionProfileSizeExceeded': (type, message) =>
      FieldLevelEncryptionProfileSizeExceeded(type: type, message: message),
  'IllegalDelete': (type, message) =>
      IllegalDelete(type: type, message: message),
  'IllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior':
      (type, message) =>
          IllegalFieldLevelEncryptionConfigAssociationWithCacheBehavior(
              type: type, message: message),
  'IllegalUpdate': (type, message) =>
      IllegalUpdate(type: type, message: message),
  'InconsistentQuantities': (type, message) =>
      InconsistentQuantities(type: type, message: message),
  'InvalidArgument': (type, message) =>
      InvalidArgument(type: type, message: message),
  'InvalidDefaultRootObject': (type, message) =>
      InvalidDefaultRootObject(type: type, message: message),
  'InvalidErrorCode': (type, message) =>
      InvalidErrorCode(type: type, message: message),
  'InvalidForwardCookies': (type, message) =>
      InvalidForwardCookies(type: type, message: message),
  'InvalidGeoRestrictionParameter': (type, message) =>
      InvalidGeoRestrictionParameter(type: type, message: message),
  'InvalidHeadersForS3Origin': (type, message) =>
      InvalidHeadersForS3Origin(type: type, message: message),
  'InvalidIfMatchVersion': (type, message) =>
      InvalidIfMatchVersion(type: type, message: message),
  'InvalidLambdaFunctionAssociation': (type, message) =>
      InvalidLambdaFunctionAssociation(type: type, message: message),
  'InvalidLocationCode': (type, message) =>
      InvalidLocationCode(type: type, message: message),
  'InvalidMinimumProtocolVersion': (type, message) =>
      InvalidMinimumProtocolVersion(type: type, message: message),
  'InvalidOrigin': (type, message) =>
      InvalidOrigin(type: type, message: message),
  'InvalidOriginAccessIdentity': (type, message) =>
      InvalidOriginAccessIdentity(type: type, message: message),
  'InvalidOriginKeepaliveTimeout': (type, message) =>
      InvalidOriginKeepaliveTimeout(type: type, message: message),
  'InvalidOriginReadTimeout': (type, message) =>
      InvalidOriginReadTimeout(type: type, message: message),
  'InvalidProtocolSettings': (type, message) =>
      InvalidProtocolSettings(type: type, message: message),
  'InvalidQueryStringParameters': (type, message) =>
      InvalidQueryStringParameters(type: type, message: message),
  'InvalidRelativePath': (type, message) =>
      InvalidRelativePath(type: type, message: message),
  'InvalidRequiredProtocol': (type, message) =>
      InvalidRequiredProtocol(type: type, message: message),
  'InvalidResponseCode': (type, message) =>
      InvalidResponseCode(type: type, message: message),
  'InvalidTTLOrder': (type, message) =>
      InvalidTTLOrder(type: type, message: message),
  'InvalidTagging': (type, message) =>
      InvalidTagging(type: type, message: message),
  'InvalidViewerCertificate': (type, message) =>
      InvalidViewerCertificate(type: type, message: message),
  'InvalidWebACLId': (type, message) =>
      InvalidWebACLId(type: type, message: message),
  'KeyGroupAlreadyExists': (type, message) =>
      KeyGroupAlreadyExists(type: type, message: message),
  'MissingBody': (type, message) => MissingBody(type: type, message: message),
  'NoSuchCachePolicy': (type, message) =>
      NoSuchCachePolicy(type: type, message: message),
  'NoSuchCloudFrontOriginAccessIdentity': (type, message) =>
      NoSuchCloudFrontOriginAccessIdentity(type: type, message: message),
  'NoSuchDistribution': (type, message) =>
      NoSuchDistribution(type: type, message: message),
  'NoSuchFieldLevelEncryptionConfig': (type, message) =>
      NoSuchFieldLevelEncryptionConfig(type: type, message: message),
  'NoSuchFieldLevelEncryptionProfile': (type, message) =>
      NoSuchFieldLevelEncryptionProfile(type: type, message: message),
  'NoSuchInvalidation': (type, message) =>
      NoSuchInvalidation(type: type, message: message),
  'NoSuchOrigin': (type, message) => NoSuchOrigin(type: type, message: message),
  'NoSuchOriginRequestPolicy': (type, message) =>
      NoSuchOriginRequestPolicy(type: type, message: message),
  'NoSuchPublicKey': (type, message) =>
      NoSuchPublicKey(type: type, message: message),
  'NoSuchRealtimeLogConfig': (type, message) =>
      NoSuchRealtimeLogConfig(type: type, message: message),
  'NoSuchResource': (type, message) =>
      NoSuchResource(type: type, message: message),
  'NoSuchStreamingDistribution': (type, message) =>
      NoSuchStreamingDistribution(type: type, message: message),
  'OriginRequestPolicyAlreadyExists': (type, message) =>
      OriginRequestPolicyAlreadyExists(type: type, message: message),
  'OriginRequestPolicyInUse': (type, message) =>
      OriginRequestPolicyInUse(type: type, message: message),
  'PreconditionFailed': (type, message) =>
      PreconditionFailed(type: type, message: message),
  'PublicKeyAlreadyExists': (type, message) =>
      PublicKeyAlreadyExists(type: type, message: message),
  'PublicKeyInUse': (type, message) =>
      PublicKeyInUse(type: type, message: message),
  'QueryArgProfileEmpty': (type, message) =>
      QueryArgProfileEmpty(type: type, message: message),
  'RealtimeLogConfigAlreadyExists': (type, message) =>
      RealtimeLogConfigAlreadyExists(type: type, message: message),
  'RealtimeLogConfigInUse': (type, message) =>
      RealtimeLogConfigInUse(type: type, message: message),
  'ResourceInUse': (type, message) =>
      ResourceInUse(type: type, message: message),
  'StreamingDistributionAlreadyExists': (type, message) =>
      StreamingDistributionAlreadyExists(type: type, message: message),
  'StreamingDistributionNotDisabled': (type, message) =>
      StreamingDistributionNotDisabled(type: type, message: message),
  'TooManyCacheBehaviors': (type, message) =>
      TooManyCacheBehaviors(type: type, message: message),
  'TooManyCachePolicies': (type, message) =>
      TooManyCachePolicies(type: type, message: message),
  'TooManyCertificates': (type, message) =>
      TooManyCertificates(type: type, message: message),
  'TooManyCloudFrontOriginAccessIdentities': (type, message) =>
      TooManyCloudFrontOriginAccessIdentities(type: type, message: message),
  'TooManyCookieNamesInWhiteList': (type, message) =>
      TooManyCookieNamesInWhiteList(type: type, message: message),
  'TooManyCookiesInCachePolicy': (type, message) =>
      TooManyCookiesInCachePolicy(type: type, message: message),
  'TooManyCookiesInOriginRequestPolicy': (type, message) =>
      TooManyCookiesInOriginRequestPolicy(type: type, message: message),
  'TooManyDistributionCNAMEs': (type, message) =>
      TooManyDistributionCNAMEs(type: type, message: message),
  'TooManyDistributions': (type, message) =>
      TooManyDistributions(type: type, message: message),
  'TooManyDistributionsAssociatedToCachePolicy': (type, message) =>
      TooManyDistributionsAssociatedToCachePolicy(type: type, message: message),
  'TooManyDistributionsAssociatedToFieldLevelEncryptionConfig':
      (type, message) =>
          TooManyDistributionsAssociatedToFieldLevelEncryptionConfig(
              type: type, message: message),
  'TooManyDistributionsAssociatedToKeyGroup': (type, message) =>
      TooManyDistributionsAssociatedToKeyGroup(type: type, message: message),
  'TooManyDistributionsAssociatedToOriginRequestPolicy': (type, message) =>
      TooManyDistributionsAssociatedToOriginRequestPolicy(
          type: type, message: message),
  'TooManyDistributionsWithLambdaAssociations': (type, message) =>
      TooManyDistributionsWithLambdaAssociations(type: type, message: message),
  'TooManyDistributionsWithSingleFunctionARN': (type, message) =>
      TooManyDistributionsWithSingleFunctionARN(type: type, message: message),
  'TooManyFieldLevelEncryptionConfigs': (type, message) =>
      TooManyFieldLevelEncryptionConfigs(type: type, message: message),
  'TooManyFieldLevelEncryptionContentTypeProfiles': (type, message) =>
      TooManyFieldLevelEncryptionContentTypeProfiles(
          type: type, message: message),
  'TooManyFieldLevelEncryptionEncryptionEntities': (type, message) =>
      TooManyFieldLevelEncryptionEncryptionEntities(
          type: type, message: message),
  'TooManyFieldLevelEncryptionFieldPatterns': (type, message) =>
      TooManyFieldLevelEncryptionFieldPatterns(type: type, message: message),
  'TooManyFieldLevelEncryptionProfiles': (type, message) =>
      TooManyFieldLevelEncryptionProfiles(type: type, message: message),
  'TooManyFieldLevelEncryptionQueryArgProfiles': (type, message) =>
      TooManyFieldLevelEncryptionQueryArgProfiles(type: type, message: message),
  'TooManyHeadersInCachePolicy': (type, message) =>
      TooManyHeadersInCachePolicy(type: type, message: message),
  'TooManyHeadersInForwardedValues': (type, message) =>
      TooManyHeadersInForwardedValues(type: type, message: message),
  'TooManyHeadersInOriginRequestPolicy': (type, message) =>
      TooManyHeadersInOriginRequestPolicy(type: type, message: message),
  'TooManyInvalidationsInProgress': (type, message) =>
      TooManyInvalidationsInProgress(type: type, message: message),
  'TooManyKeyGroups': (type, message) =>
      TooManyKeyGroups(type: type, message: message),
  'TooManyKeyGroupsAssociatedToDistribution': (type, message) =>
      TooManyKeyGroupsAssociatedToDistribution(type: type, message: message),
  'TooManyLambdaFunctionAssociations': (type, message) =>
      TooManyLambdaFunctionAssociations(type: type, message: message),
  'TooManyOriginCustomHeaders': (type, message) =>
      TooManyOriginCustomHeaders(type: type, message: message),
  'TooManyOriginGroupsPerDistribution': (type, message) =>
      TooManyOriginGroupsPerDistribution(type: type, message: message),
  'TooManyOriginRequestPolicies': (type, message) =>
      TooManyOriginRequestPolicies(type: type, message: message),
  'TooManyOrigins': (type, message) =>
      TooManyOrigins(type: type, message: message),
  'TooManyPublicKeys': (type, message) =>
      TooManyPublicKeys(type: type, message: message),
  'TooManyPublicKeysInKeyGroup': (type, message) =>
      TooManyPublicKeysInKeyGroup(type: type, message: message),
  'TooManyQueryStringParameters': (type, message) =>
      TooManyQueryStringParameters(type: type, message: message),
  'TooManyQueryStringsInCachePolicy': (type, message) =>
      TooManyQueryStringsInCachePolicy(type: type, message: message),
  'TooManyQueryStringsInOriginRequestPolicy': (type, message) =>
      TooManyQueryStringsInOriginRequestPolicy(type: type, message: message),
  'TooManyRealtimeLogConfigs': (type, message) =>
      TooManyRealtimeLogConfigs(type: type, message: message),
  'TooManyStreamingDistributionCNAMEs': (type, message) =>
      TooManyStreamingDistributionCNAMEs(type: type, message: message),
  'TooManyStreamingDistributions': (type, message) =>
      TooManyStreamingDistributions(type: type, message: message),
  'TooManyTrustedSigners': (type, message) =>
      TooManyTrustedSigners(type: type, message: message),
  'TrustedKeyGroupDoesNotExist': (type, message) =>
      TrustedKeyGroupDoesNotExist(type: type, message: message),
  'TrustedSignerDoesNotExist': (type, message) =>
      TrustedSignerDoesNotExist(type: type, message: message),
};

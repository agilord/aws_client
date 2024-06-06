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

/// Amazon Lightsail is the easiest way to get started with Amazon Web Services
/// (Amazon Web Services) for developers who need to build websites or web
/// applications. It includes everything you need to launch your project quickly
/// - instances (virtual private servers), container services, storage buckets,
/// managed databases, SSD-based block storage, static IP addresses, load
/// balancers, content delivery network (CDN) distributions, DNS management of
/// registered domains, and resource snapshots (backups) - for a low,
/// predictable monthly price.
///
/// You can manage your Lightsail resources using the Lightsail console,
/// Lightsail API, Command Line Interface (CLI), or SDKs. For more information
/// about Lightsail concepts and tasks, see the <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/lightsail-how-to-set-up-access-keys-to-use-sdk-api-cli">Amazon
/// Lightsail Developer Guide</a>.
///
/// This API Reference provides detailed information about the actions, data
/// types, parameters, and errors of the Lightsail service. For more information
/// about the supported Amazon Web Services Regions, endpoints, and service
/// quotas of the Lightsail service, see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/lightsail.html">Amazon
/// Lightsail Endpoints and Quotas</a> in the <i>Amazon Web Services General
/// Reference</i>.
class Lightsail {
  final _s.JsonProtocol _protocol;
  Lightsail({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'lightsail',
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

  /// Allocates a static IP address.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [staticIpName] :
  /// The name of the static IP address.
  Future<AllocateStaticIpResult> allocateStaticIp({
    required String staticIpName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.AllocateStaticIp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'staticIpName': staticIpName,
      },
    );

    return AllocateStaticIpResult.fromJson(jsonResponse.body);
  }

  /// Attaches an SSL/TLS certificate to your Amazon Lightsail content delivery
  /// network (CDN) distribution.
  ///
  /// After the certificate is attached, your distribution accepts HTTPS traffic
  /// for all of the domains that are associated with the certificate.
  ///
  /// Use the <code>CreateCertificate</code> action to create a certificate that
  /// you can attach to your distribution.
  /// <important>
  /// Only certificates created in the <code>us-east-1</code> Amazon Web
  /// Services Region can be attached to Lightsail distributions. Lightsail
  /// distributions are global resources that can reference an origin in any
  /// Amazon Web Services Region, and distribute its content globally. However,
  /// all distributions are located in the <code>us-east-1</code> Region.
  /// </important>
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [certificateName] :
  /// The name of the certificate to attach to a distribution.
  ///
  /// Only certificates with a status of <code>ISSUED</code> can be attached to
  /// a distribution.
  ///
  /// Use the <code>GetCertificates</code> action to get a list of certificate
  /// names that you can specify.
  /// <note>
  /// This is the name of the certificate resource type and is used only to
  /// reference the certificate in other API actions. It can be different than
  /// the domain name of the certificate. For example, your certificate name
  /// might be <code>WordPress-Blog-Certificate</code> and the domain name of
  /// the certificate might be <code>example.com</code>.
  /// </note>
  ///
  /// Parameter [distributionName] :
  /// The name of the distribution that the certificate will be attached to.
  ///
  /// Use the <code>GetDistributions</code> action to get a list of distribution
  /// names that you can specify.
  Future<AttachCertificateToDistributionResult>
      attachCertificateToDistribution({
    required String certificateName,
    required String distributionName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.AttachCertificateToDistribution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'certificateName': certificateName,
        'distributionName': distributionName,
      },
    );

    return AttachCertificateToDistributionResult.fromJson(jsonResponse.body);
  }

  /// Attaches a block storage disk to a running or stopped Lightsail instance
  /// and exposes it to the instance with the specified disk name.
  ///
  /// The <code>attach disk</code> operation supports tag-based access control
  /// via resource tags applied to the resource identified by <code>disk
  /// name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [diskName] :
  /// The unique Lightsail disk name (<code>my-disk</code>).
  ///
  /// Parameter [diskPath] :
  /// The disk path to expose to the instance (<code>/dev/xvdf</code>).
  ///
  /// Parameter [instanceName] :
  /// The name of the Lightsail instance where you want to utilize the storage
  /// disk.
  ///
  /// Parameter [autoMounting] :
  /// A Boolean value used to determine the automatic mounting of a storage
  /// volume to a virtual computer. The default value is <code>False</code>.
  /// <important>
  /// This value only applies to Lightsail for Research resources.
  /// </important>
  Future<AttachDiskResult> attachDisk({
    required String diskName,
    required String diskPath,
    required String instanceName,
    bool? autoMounting,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.AttachDisk'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'diskName': diskName,
        'diskPath': diskPath,
        'instanceName': instanceName,
        if (autoMounting != null) 'autoMounting': autoMounting,
      },
    );

    return AttachDiskResult.fromJson(jsonResponse.body);
  }

  /// Attaches one or more Lightsail instances to a load balancer.
  ///
  /// After some time, the instances are attached to the load balancer and the
  /// health check status is available.
  ///
  /// The <code>attach instances to load balancer</code> operation supports
  /// tag-based access control via resource tags applied to the resource
  /// identified by <code>load balancer name</code>. For more information, see
  /// the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instanceNames] :
  /// An array of strings representing the instance name(s) you want to attach
  /// to your load balancer.
  ///
  /// An instance must be <code>running</code> before you can attach it to your
  /// load balancer.
  ///
  /// There are no additional limits on the number of instances you can attach
  /// to your load balancer, aside from the limit of Lightsail instances you can
  /// create in your account (20).
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  Future<AttachInstancesToLoadBalancerResult> attachInstancesToLoadBalancer({
    required List<String> instanceNames,
    required String loadBalancerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.AttachInstancesToLoadBalancer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceNames': instanceNames,
        'loadBalancerName': loadBalancerName,
      },
    );

    return AttachInstancesToLoadBalancerResult.fromJson(jsonResponse.body);
  }

  /// Attaches a Transport Layer Security (TLS) certificate to your load
  /// balancer. TLS is just an updated, more secure version of Secure Socket
  /// Layer (SSL).
  ///
  /// Once you create and validate your certificate, you can attach it to your
  /// load balancer. You can also use this API to rotate the certificates on
  /// your account. Use the <code>AttachLoadBalancerTlsCertificate</code> action
  /// with the non-attached certificate, and it will replace the existing one
  /// and become the attached certificate.
  ///
  /// The <code>AttachLoadBalancerTlsCertificate</code> operation supports
  /// tag-based access control via resource tags applied to the resource
  /// identified by <code>load balancer name</code>. For more information, see
  /// the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [certificateName] :
  /// The name of your SSL/TLS certificate.
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer to which you want to associate the SSL/TLS
  /// certificate.
  Future<AttachLoadBalancerTlsCertificateResult>
      attachLoadBalancerTlsCertificate({
    required String certificateName,
    required String loadBalancerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.AttachLoadBalancerTlsCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'certificateName': certificateName,
        'loadBalancerName': loadBalancerName,
      },
    );

    return AttachLoadBalancerTlsCertificateResult.fromJson(jsonResponse.body);
  }

  /// Attaches a static IP address to a specific Amazon Lightsail instance.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instanceName] :
  /// The instance name to which you want to attach the static IP address.
  ///
  /// Parameter [staticIpName] :
  /// The name of the static IP.
  Future<AttachStaticIpResult> attachStaticIp({
    required String instanceName,
    required String staticIpName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.AttachStaticIp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceName': instanceName,
        'staticIpName': staticIpName,
      },
    );

    return AttachStaticIpResult.fromJson(jsonResponse.body);
  }

  /// Closes ports for a specific Amazon Lightsail instance.
  ///
  /// The <code>CloseInstancePublicPorts</code> action supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// <code>instanceName</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instanceName] :
  /// The name of the instance for which to close ports.
  ///
  /// Parameter [portInfo] :
  /// An object to describe the ports to close for the specified instance.
  Future<CloseInstancePublicPortsResult> closeInstancePublicPorts({
    required String instanceName,
    required PortInfo portInfo,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CloseInstancePublicPorts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceName': instanceName,
        'portInfo': portInfo,
      },
    );

    return CloseInstancePublicPortsResult.fromJson(jsonResponse.body);
  }

  /// Copies a manual snapshot of an instance or disk as another manual
  /// snapshot, or copies an automatic snapshot of an instance or disk as a
  /// manual snapshot. This operation can also be used to copy a manual or
  /// automatic snapshot of an instance or a disk from one Amazon Web Services
  /// Region to another in Amazon Lightsail.
  ///
  /// When copying a <i>manual snapshot</i>, be sure to define the <code>source
  /// region</code>, <code>source snapshot name</code>, and <code>target
  /// snapshot name</code> parameters.
  ///
  /// When copying an <i>automatic snapshot</i>, be sure to define the
  /// <code>source region</code>, <code>source resource name</code>,
  /// <code>target snapshot name</code>, and either the <code>restore
  /// date</code> or the <code>use latest restorable auto snapshot</code>
  /// parameters.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [sourceRegion] :
  /// The Amazon Web Services Region where the source manual or automatic
  /// snapshot is located.
  ///
  /// Parameter [targetSnapshotName] :
  /// The name of the new manual snapshot to be created as a copy.
  ///
  /// Parameter [restoreDate] :
  /// The date of the source automatic snapshot to copy. Use the <code>get auto
  /// snapshots</code> operation to identify the dates of the available
  /// automatic snapshots.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be specified in <code>YYYY-MM-DD</code> format.
  /// </li>
  /// <li>
  /// This parameter cannot be defined together with the <code>use latest
  /// restorable auto snapshot</code> parameter. The <code>restore date</code>
  /// and <code>use latest restorable auto snapshot</code> parameters are
  /// mutually exclusive.
  /// </li>
  /// <li>
  /// Define this parameter only when copying an automatic snapshot as a manual
  /// snapshot. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-keeping-automatic-snapshots">Amazon
  /// Lightsail Developer Guide</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [sourceResourceName] :
  /// The name of the source instance or disk from which the source automatic
  /// snapshot was created.
  ///
  /// Constraint:
  ///
  /// <ul>
  /// <li>
  /// Define this parameter only when copying an automatic snapshot as a manual
  /// snapshot. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-keeping-automatic-snapshots">Amazon
  /// Lightsail Developer Guide</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [sourceSnapshotName] :
  /// The name of the source manual snapshot to copy.
  ///
  /// Constraint:
  ///
  /// <ul>
  /// <li>
  /// Define this parameter only when copying a manual snapshot as another
  /// manual snapshot.
  /// </li>
  /// </ul>
  ///
  /// Parameter [useLatestRestorableAutoSnapshot] :
  /// A Boolean value to indicate whether to use the latest available automatic
  /// snapshot of the specified source instance or disk.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// This parameter cannot be defined together with the <code>restore
  /// date</code> parameter. The <code>use latest restorable auto
  /// snapshot</code> and <code>restore date</code> parameters are mutually
  /// exclusive.
  /// </li>
  /// <li>
  /// Define this parameter only when copying an automatic snapshot as a manual
  /// snapshot. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-keeping-automatic-snapshots">Amazon
  /// Lightsail Developer Guide</a>.
  /// </li>
  /// </ul>
  Future<CopySnapshotResult> copySnapshot({
    required RegionName sourceRegion,
    required String targetSnapshotName,
    String? restoreDate,
    String? sourceResourceName,
    String? sourceSnapshotName,
    bool? useLatestRestorableAutoSnapshot,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CopySnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'sourceRegion': sourceRegion.toValue(),
        'targetSnapshotName': targetSnapshotName,
        if (restoreDate != null) 'restoreDate': restoreDate,
        if (sourceResourceName != null)
          'sourceResourceName': sourceResourceName,
        if (sourceSnapshotName != null)
          'sourceSnapshotName': sourceSnapshotName,
        if (useLatestRestorableAutoSnapshot != null)
          'useLatestRestorableAutoSnapshot': useLatestRestorableAutoSnapshot,
      },
    );

    return CopySnapshotResult.fromJson(jsonResponse.body);
  }

  /// Creates an Amazon Lightsail bucket.
  ///
  /// A bucket is a cloud storage resource available in the Lightsail object
  /// storage service. Use buckets to store objects such as data and its
  /// descriptive metadata. For more information about buckets, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/buckets-in-amazon-lightsail">Buckets
  /// in Amazon Lightsail</a> in the <i>Amazon Lightsail Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [bucketName] :
  /// The name for the bucket.
  ///
  /// For more information about bucket names, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/bucket-naming-rules-in-amazon-lightsail">Bucket
  /// naming rules in Amazon Lightsail</a> in the <i>Amazon Lightsail Developer
  /// Guide</i>.
  ///
  /// Parameter [bundleId] :
  /// The ID of the bundle to use for the bucket.
  ///
  /// A bucket bundle specifies the monthly cost, storage space, and data
  /// transfer quota for a bucket.
  ///
  /// Use the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetBucketBundles.html">GetBucketBundles</a>
  /// action to get a list of bundle IDs that you can specify.
  ///
  /// Use the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_UpdateBucketBundle.html">UpdateBucketBundle</a>
  /// action to change the bundle after the bucket is created.
  ///
  /// Parameter [enableObjectVersioning] :
  /// A Boolean value that indicates whether to enable versioning of objects in
  /// the bucket.
  ///
  /// For more information about versioning, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-managing-bucket-object-versioning">Enabling
  /// and suspending object versioning in a bucket in Amazon Lightsail</a> in
  /// the <i>Amazon Lightsail Developer Guide</i>.
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the bucket during creation.
  ///
  /// Use the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_TagResource.html">TagResource</a>
  /// action to tag the bucket after it's created.
  Future<CreateBucketResult> createBucket({
    required String bucketName,
    required String bundleId,
    bool? enableObjectVersioning,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateBucket'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'bucketName': bucketName,
        'bundleId': bundleId,
        if (enableObjectVersioning != null)
          'enableObjectVersioning': enableObjectVersioning,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateBucketResult.fromJson(jsonResponse.body);
  }

  /// Creates a new access key for the specified Amazon Lightsail bucket. Access
  /// keys consist of an access key ID and corresponding secret access key.
  ///
  /// Access keys grant full programmatic access to the specified bucket and its
  /// objects. You can have a maximum of two access keys per bucket. Use the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetBucketAccessKeys.html">GetBucketAccessKeys</a>
  /// action to get a list of current access keys for a specific bucket. For
  /// more information about access keys, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-creating-bucket-access-keys">Creating
  /// access keys for a bucket in Amazon Lightsail</a> in the <i>Amazon
  /// Lightsail Developer Guide</i>.
  /// <important>
  /// The <code>secretAccessKey</code> value is returned only in response to the
  /// <code>CreateBucketAccessKey</code> action. You can get a secret access key
  /// only when you first create an access key; you cannot get the secret access
  /// key later. If you lose the secret access key, you must create a new access
  /// key.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [bucketName] :
  /// The name of the bucket that the new access key will belong to, and grant
  /// access to.
  Future<CreateBucketAccessKeyResult> createBucketAccessKey({
    required String bucketName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateBucketAccessKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'bucketName': bucketName,
      },
    );

    return CreateBucketAccessKeyResult.fromJson(jsonResponse.body);
  }

  /// Creates an SSL/TLS certificate for an Amazon Lightsail content delivery
  /// network (CDN) distribution and a container service.
  ///
  /// After the certificate is valid, use the
  /// <code>AttachCertificateToDistribution</code> action to use the certificate
  /// and its domains with your distribution. Or use the
  /// <code>UpdateContainerService</code> action to use the certificate and its
  /// domains with your container service.
  /// <important>
  /// Only certificates created in the <code>us-east-1</code> Amazon Web
  /// Services Region can be attached to Lightsail distributions. Lightsail
  /// distributions are global resources that can reference an origin in any
  /// Amazon Web Services Region, and distribute its content globally. However,
  /// all distributions are located in the <code>us-east-1</code> Region.
  /// </important>
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [certificateName] :
  /// The name for the certificate.
  ///
  /// Parameter [domainName] :
  /// The domain name (<code>example.com</code>) for the certificate.
  ///
  /// Parameter [subjectAlternativeNames] :
  /// An array of strings that specify the alternate domains
  /// (<code>example2.com</code>) and subdomains (<code>blog.example.com</code>)
  /// for the certificate.
  ///
  /// You can specify a maximum of nine alternate domains (in addition to the
  /// primary domain name).
  ///
  /// Wildcard domain entries (<code>*.example.com</code>) are not supported.
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the certificate during create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  Future<CreateCertificateResult> createCertificate({
    required String certificateName,
    required String domainName,
    List<String>? subjectAlternativeNames,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'certificateName': certificateName,
        'domainName': domainName,
        if (subjectAlternativeNames != null)
          'subjectAlternativeNames': subjectAlternativeNames,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateCertificateResult.fromJson(jsonResponse.body);
  }

  /// Creates an AWS CloudFormation stack, which creates a new Amazon EC2
  /// instance from an exported Amazon Lightsail snapshot. This operation
  /// results in a CloudFormation stack record that can be used to track the AWS
  /// CloudFormation stack created. Use the <code>get cloud formation stack
  /// records</code> operation to get a list of the CloudFormation stacks
  /// created.
  /// <important>
  /// Wait until after your new Amazon EC2 instance is created before running
  /// the <code>create cloud formation stack</code> operation again with the
  /// same export snapshot record.
  /// </important>
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instances] :
  /// An array of parameters that will be used to create the new Amazon EC2
  /// instance. You can only pass one instance entry at a time in this array.
  /// You will get an invalid parameter error if you pass more than one instance
  /// entry in this array.
  Future<CreateCloudFormationStackResult> createCloudFormationStack({
    required List<InstanceEntry> instances,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateCloudFormationStack'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instances': instances,
      },
    );

    return CreateCloudFormationStackResult.fromJson(jsonResponse.body);
  }

  /// Creates an email or SMS text message contact method.
  ///
  /// A contact method is used to send you notifications about your Amazon
  /// Lightsail resources. You can add one email address and one mobile phone
  /// number contact method in each Amazon Web Services Region. However, SMS
  /// text messaging is not supported in some Amazon Web Services Regions, and
  /// SMS text messages cannot be sent to some countries/regions. For more
  /// information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications
  /// in Amazon Lightsail</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [contactEndpoint] :
  /// The destination of the contact method, such as an email address or a
  /// mobile phone number.
  ///
  /// Use the E.164 format when specifying a mobile phone number. E.164 is a
  /// standard for the phone number structure used for international
  /// telecommunication. Phone numbers that follow this format can have a
  /// maximum of 15 digits, and they are prefixed with the plus character (+)
  /// and the country code. For example, a U.S. phone number in E.164 format
  /// would be specified as +1XXX5550100. For more information, see <a
  /// href="https://en.wikipedia.org/wiki/E.164">E.164</a> on <i>Wikipedia</i>.
  ///
  /// Parameter [protocol] :
  /// The protocol of the contact method, such as <code>Email</code> or
  /// <code>SMS</code> (text messaging).
  ///
  /// The <code>SMS</code> protocol is supported only in the following Amazon
  /// Web Services Regions.
  ///
  /// <ul>
  /// <li>
  /// US East (N. Virginia) (<code>us-east-1</code>)
  /// </li>
  /// <li>
  /// US West (Oregon) (<code>us-west-2</code>)
  /// </li>
  /// <li>
  /// Europe (Ireland) (<code>eu-west-1</code>)
  /// </li>
  /// <li>
  /// Asia Pacific (Tokyo) (<code>ap-northeast-1</code>)
  /// </li>
  /// <li>
  /// Asia Pacific (Singapore) (<code>ap-southeast-1</code>)
  /// </li>
  /// <li>
  /// Asia Pacific (Sydney) (<code>ap-southeast-2</code>)
  /// </li>
  /// </ul>
  /// For a list of countries/regions where SMS text messages can be sent, and
  /// the latest Amazon Web Services Regions where SMS text messaging is
  /// supported, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-supported-regions-countries.html">Supported
  /// Regions and Countries</a> in the <i>Amazon SNS Developer Guide</i>.
  ///
  /// For more information about notifications in Amazon Lightsail, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications
  /// in Amazon Lightsail</a>.
  Future<CreateContactMethodResult> createContactMethod({
    required String contactEndpoint,
    required ContactProtocol protocol,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateContactMethod'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'contactEndpoint': contactEndpoint,
        'protocol': protocol.toValue(),
      },
    );

    return CreateContactMethodResult.fromJson(jsonResponse.body);
  }

  /// Creates an Amazon Lightsail container service.
  ///
  /// A Lightsail container service is a compute resource to which you can
  /// deploy containers. For more information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-services">Container
  /// services in Amazon Lightsail</a> in the <i>Lightsail Dev Guide</i>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [power] :
  /// The power specification for the container service.
  ///
  /// The power specifies the amount of memory, vCPUs, and base monthly cost of
  /// each node of the container service. The <code>power</code> and
  /// <code>scale</code> of a container service makes up its configured
  /// capacity. To determine the monthly price of your container service,
  /// multiply the base price of the <code>power</code> with the
  /// <code>scale</code> (the number of nodes) of the service.
  ///
  /// Use the <code>GetContainerServicePowers</code> action to get a list of
  /// power options that you can specify using this parameter, and their base
  /// monthly cost.
  ///
  /// Parameter [scale] :
  /// The scale specification for the container service.
  ///
  /// The scale specifies the allocated compute nodes of the container service.
  /// The <code>power</code> and <code>scale</code> of a container service makes
  /// up its configured capacity. To determine the monthly price of your
  /// container service, multiply the base price of the <code>power</code> with
  /// the <code>scale</code> (the number of nodes) of the service.
  ///
  /// Parameter [serviceName] :
  /// The name for the container service.
  ///
  /// The name that you specify for your container service will make up part of
  /// its default domain. The default domain of a container service is typically
  /// <code>https://&lt;ServiceName&gt;.&lt;RandomGUID&gt;.&lt;AWSRegion&gt;.cs.amazonlightsail.com</code>.
  /// If the name of your container service is <code>container-service-1</code>,
  /// and it's located in the US East (Ohio) Amazon Web Services Region
  /// (<code>us-east-2</code>), then the domain for your container service will
  /// be like the following example:
  /// <code>https://container-service-1.ur4EXAMPLE2uq.us-east-2.cs.amazonlightsail.com</code>
  ///
  /// The following are the requirements for container service names:
  ///
  /// <ul>
  /// <li>
  /// Must be unique within each Amazon Web Services Region in your Lightsail
  /// account.
  /// </li>
  /// <li>
  /// Must contain 1 to 63 characters.
  /// </li>
  /// <li>
  /// Must contain only alphanumeric characters and hyphens.
  /// </li>
  /// <li>
  /// A hyphen (-) can separate words but cannot be at the start or end of the
  /// name.
  /// </li>
  /// </ul>
  ///
  /// Parameter [deployment] :
  /// An object that describes a deployment for the container service.
  ///
  /// A deployment specifies the containers that will be launched on the
  /// container service and their settings, such as the ports to open, the
  /// environment variables to apply, and the launch command to run. It also
  /// specifies the container that will serve as the public endpoint of the
  /// deployment and its settings, such as the HTTP or HTTPS port to use, and
  /// the health check configuration.
  ///
  /// Parameter [privateRegistryAccess] :
  /// An object to describe the configuration for the container service to
  /// access private container image repositories, such as Amazon Elastic
  /// Container Registry (Amazon ECR) private repositories.
  ///
  /// For more information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-service-ecr-private-repo-access">Configuring
  /// access to an Amazon ECR private repository for an Amazon Lightsail
  /// container service</a> in the <i>Amazon Lightsail Developer Guide</i>.
  ///
  /// Parameter [publicDomainNames] :
  /// The public domain names to use with the container service, such as
  /// <code>example.com</code> and <code>www.example.com</code>.
  ///
  /// You can specify up to four public domain names for a container service.
  /// The domain names that you specify are used when you create a deployment
  /// with a container configured as the public endpoint of your container
  /// service.
  ///
  /// If you don't specify public domain names, then you can use the default
  /// domain of the container service.
  /// <important>
  /// You must create and validate an SSL/TLS certificate before you can use
  /// public domain names with your container service. Use the
  /// <code>CreateCertificate</code> action to create a certificate for the
  /// public domain names you want to use with your container service.
  /// </important>
  /// You can specify public domain names using a string to array map as shown
  /// in the example later on this page.
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the container service during
  /// create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  ///
  /// For more information about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags">Amazon
  /// Lightsail Developer Guide</a>.
  Future<CreateContainerServiceResult> createContainerService({
    required ContainerServicePowerName power,
    required int scale,
    required String serviceName,
    ContainerServiceDeploymentRequest? deployment,
    PrivateRegistryAccessRequest? privateRegistryAccess,
    Map<String, List<String>>? publicDomainNames,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'scale',
      scale,
      1,
      20,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateContainerService'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'power': power.toValue(),
        'scale': scale,
        'serviceName': serviceName,
        if (deployment != null) 'deployment': deployment,
        if (privateRegistryAccess != null)
          'privateRegistryAccess': privateRegistryAccess,
        if (publicDomainNames != null) 'publicDomainNames': publicDomainNames,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateContainerServiceResult.fromJson(jsonResponse.body);
  }

  /// Creates a deployment for your Amazon Lightsail container service.
  ///
  /// A deployment specifies the containers that will be launched on the
  /// container service and their settings, such as the ports to open, the
  /// environment variables to apply, and the launch command to run. It also
  /// specifies the container that will serve as the public endpoint of the
  /// deployment and its settings, such as the HTTP or HTTPS port to use, and
  /// the health check configuration.
  ///
  /// You can deploy containers to your container service using container images
  /// from a public registry such as Amazon ECR Public, or from your local
  /// machine. For more information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-creating-container-images">Creating
  /// container images for your Amazon Lightsail container services</a> in the
  /// <i>Amazon Lightsail Developer Guide</i>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [serviceName] :
  /// The name of the container service for which to create the deployment.
  ///
  /// Parameter [containers] :
  /// An object that describes the settings of the containers that will be
  /// launched on the container service.
  ///
  /// Parameter [publicEndpoint] :
  /// An object that describes the settings of the public endpoint for the
  /// container service.
  Future<CreateContainerServiceDeploymentResult>
      createContainerServiceDeployment({
    required String serviceName,
    Map<String, Container>? containers,
    EndpointRequest? publicEndpoint,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateContainerServiceDeployment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'serviceName': serviceName,
        if (containers != null) 'containers': containers,
        if (publicEndpoint != null) 'publicEndpoint': publicEndpoint,
      },
    );

    return CreateContainerServiceDeploymentResult.fromJson(jsonResponse.body);
  }

  /// Creates a temporary set of log in credentials that you can use to log in
  /// to the Docker process on your local machine. After you're logged in, you
  /// can use the native Docker commands to push your local container images to
  /// the container image registry of your Amazon Lightsail account so that you
  /// can use them with your Lightsail container service. The log in credentials
  /// expire 12 hours after they are created, at which point you will need to
  /// create a new set of log in credentials.
  /// <note>
  /// You can only push container images to the container service registry of
  /// your Lightsail account. You cannot pull container images or perform any
  /// other container image management actions on the container service
  /// registry.
  /// </note>
  /// After you push your container images to the container image registry of
  /// your Lightsail account, use the <code>RegisterContainerImage</code> action
  /// to register the pushed images to a specific Lightsail container service.
  /// <note>
  /// This action is not required if you install and use the Lightsail Control
  /// (lightsailctl) plugin to push container images to your Lightsail container
  /// service. For more information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-pushing-container-images">Pushing
  /// and managing container images on your Amazon Lightsail container
  /// services</a> in the <i>Amazon Lightsail Developer Guide</i>.
  /// </note>
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  Future<CreateContainerServiceRegistryLoginResult>
      createContainerServiceRegistryLogin() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateContainerServiceRegistryLogin'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return CreateContainerServiceRegistryLoginResult.fromJson(
        jsonResponse.body);
  }

  /// Creates a block storage disk that can be attached to an Amazon Lightsail
  /// instance in the same Availability Zone (<code>us-east-2a</code>).
  ///
  /// The <code>create disk</code> operation supports tag-based access control
  /// via request tags. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [availabilityZone] :
  /// The Availability Zone where you want to create the disk
  /// (<code>us-east-2a</code>). Use the same Availability Zone as the Lightsail
  /// instance to which you want to attach the disk.
  ///
  /// Use the <code>get regions</code> operation to list the Availability Zones
  /// where Lightsail is currently available.
  ///
  /// Parameter [diskName] :
  /// The unique Lightsail disk name (<code>my-disk</code>).
  ///
  /// Parameter [sizeInGb] :
  /// The size of the disk in GB (<code>32</code>).
  ///
  /// Parameter [addOns] :
  /// An array of objects that represent the add-ons to enable for the new disk.
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the resource during create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  Future<CreateDiskResult> createDisk({
    required String availabilityZone,
    required String diskName,
    required int sizeInGb,
    List<AddOnRequest>? addOns,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateDisk'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'availabilityZone': availabilityZone,
        'diskName': diskName,
        'sizeInGb': sizeInGb,
        if (addOns != null) 'addOns': addOns,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateDiskResult.fromJson(jsonResponse.body);
  }

  /// Creates a block storage disk from a manual or automatic snapshot of a
  /// disk. The resulting disk can be attached to an Amazon Lightsail instance
  /// in the same Availability Zone (<code>us-east-2a</code>).
  ///
  /// The <code>create disk from snapshot</code> operation supports tag-based
  /// access control via request tags and resource tags applied to the resource
  /// identified by <code>disk snapshot name</code>. For more information, see
  /// the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [availabilityZone] :
  /// The Availability Zone where you want to create the disk
  /// (<code>us-east-2a</code>). Choose the same Availability Zone as the
  /// Lightsail instance where you want to create the disk.
  ///
  /// Use the GetRegions operation to list the Availability Zones where
  /// Lightsail is currently available.
  ///
  /// Parameter [diskName] :
  /// The unique Lightsail disk name (<code>my-disk</code>).
  ///
  /// Parameter [sizeInGb] :
  /// The size of the disk in GB (<code>32</code>).
  ///
  /// Parameter [addOns] :
  /// An array of objects that represent the add-ons to enable for the new disk.
  ///
  /// Parameter [diskSnapshotName] :
  /// The name of the disk snapshot (<code>my-snapshot</code>) from which to
  /// create the new storage disk.
  ///
  /// Constraint:
  ///
  /// <ul>
  /// <li>
  /// This parameter cannot be defined together with the <code>source disk
  /// name</code> parameter. The <code>disk snapshot name</code> and
  /// <code>source disk name</code> parameters are mutually exclusive.
  /// </li>
  /// </ul>
  ///
  /// Parameter [restoreDate] :
  /// The date of the automatic snapshot to use for the new disk. Use the
  /// <code>get auto snapshots</code> operation to identify the dates of the
  /// available automatic snapshots.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be specified in <code>YYYY-MM-DD</code> format.
  /// </li>
  /// <li>
  /// This parameter cannot be defined together with the <code>use latest
  /// restorable auto snapshot</code> parameter. The <code>restore date</code>
  /// and <code>use latest restorable auto snapshot</code> parameters are
  /// mutually exclusive.
  /// </li>
  /// <li>
  /// Define this parameter only when creating a new disk from an automatic
  /// snapshot. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Amazon
  /// Lightsail Developer Guide</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [sourceDiskName] :
  /// The name of the source disk from which the source automatic snapshot was
  /// created.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// This parameter cannot be defined together with the <code>disk snapshot
  /// name</code> parameter. The <code>source disk name</code> and <code>disk
  /// snapshot name</code> parameters are mutually exclusive.
  /// </li>
  /// <li>
  /// Define this parameter only when creating a new disk from an automatic
  /// snapshot. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Amazon
  /// Lightsail Developer Guide</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the resource during create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  ///
  /// Parameter [useLatestRestorableAutoSnapshot] :
  /// A Boolean value to indicate whether to use the latest available automatic
  /// snapshot.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// This parameter cannot be defined together with the <code>restore
  /// date</code> parameter. The <code>use latest restorable auto
  /// snapshot</code> and <code>restore date</code> parameters are mutually
  /// exclusive.
  /// </li>
  /// <li>
  /// Define this parameter only when creating a new disk from an automatic
  /// snapshot. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Amazon
  /// Lightsail Developer Guide</a>.
  /// </li>
  /// </ul>
  Future<CreateDiskFromSnapshotResult> createDiskFromSnapshot({
    required String availabilityZone,
    required String diskName,
    required int sizeInGb,
    List<AddOnRequest>? addOns,
    String? diskSnapshotName,
    String? restoreDate,
    String? sourceDiskName,
    List<Tag>? tags,
    bool? useLatestRestorableAutoSnapshot,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateDiskFromSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'availabilityZone': availabilityZone,
        'diskName': diskName,
        'sizeInGb': sizeInGb,
        if (addOns != null) 'addOns': addOns,
        if (diskSnapshotName != null) 'diskSnapshotName': diskSnapshotName,
        if (restoreDate != null) 'restoreDate': restoreDate,
        if (sourceDiskName != null) 'sourceDiskName': sourceDiskName,
        if (tags != null) 'tags': tags,
        if (useLatestRestorableAutoSnapshot != null)
          'useLatestRestorableAutoSnapshot': useLatestRestorableAutoSnapshot,
      },
    );

    return CreateDiskFromSnapshotResult.fromJson(jsonResponse.body);
  }

  /// Creates a snapshot of a block storage disk. You can use snapshots for
  /// backups, to make copies of disks, and to save data before shutting down a
  /// Lightsail instance.
  ///
  /// You can take a snapshot of an attached disk that is in use; however,
  /// snapshots only capture data that has been written to your disk at the time
  /// the snapshot command is issued. This may exclude any data that has been
  /// cached by any applications or the operating system. If you can pause any
  /// file systems on the disk long enough to take a snapshot, your snapshot
  /// should be complete. Nevertheless, if you cannot pause all file writes to
  /// the disk, you should unmount the disk from within the Lightsail instance,
  /// issue the create disk snapshot command, and then remount the disk to
  /// ensure a consistent and complete snapshot. You may remount and use your
  /// disk while the snapshot status is pending.
  ///
  /// You can also use this operation to create a snapshot of an instance's
  /// system volume. You might want to do this, for example, to recover data
  /// from the system volume of a botched instance or to create a backup of the
  /// system volume like you would for a block storage disk. To create a
  /// snapshot of a system volume, just define the <code>instance name</code>
  /// parameter when issuing the snapshot command, and a snapshot of the defined
  /// instance's system volume will be created. After the snapshot is available,
  /// you can create a block storage disk from the snapshot and attach it to a
  /// running instance to access the data on the disk.
  ///
  /// The <code>create disk snapshot</code> operation supports tag-based access
  /// control via request tags. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [diskSnapshotName] :
  /// The name of the destination disk snapshot (<code>my-disk-snapshot</code>)
  /// based on the source disk.
  ///
  /// Parameter [diskName] :
  /// The unique name of the source disk (<code>Disk-Virginia-1</code>).
  /// <note>
  /// This parameter cannot be defined together with the <code>instance
  /// name</code> parameter. The <code>disk name</code> and <code>instance
  /// name</code> parameters are mutually exclusive.
  /// </note>
  ///
  /// Parameter [instanceName] :
  /// The unique name of the source instance
  /// (<code>Amazon_Linux-512MB-Virginia-1</code>). When this is defined, a
  /// snapshot of the instance's system volume is created.
  /// <note>
  /// This parameter cannot be defined together with the <code>disk name</code>
  /// parameter. The <code>instance name</code> and <code>disk name</code>
  /// parameters are mutually exclusive.
  /// </note>
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the resource during create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  Future<CreateDiskSnapshotResult> createDiskSnapshot({
    required String diskSnapshotName,
    String? diskName,
    String? instanceName,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateDiskSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'diskSnapshotName': diskSnapshotName,
        if (diskName != null) 'diskName': diskName,
        if (instanceName != null) 'instanceName': instanceName,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateDiskSnapshotResult.fromJson(jsonResponse.body);
  }

  /// Creates an Amazon Lightsail content delivery network (CDN) distribution.
  ///
  /// A distribution is a globally distributed network of caching servers that
  /// improve the performance of your website or web application hosted on a
  /// Lightsail instance. For more information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-content-delivery-network-distributions">Content
  /// delivery networks in Amazon Lightsail</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [bundleId] :
  /// The bundle ID to use for the distribution.
  ///
  /// A distribution bundle describes the specifications of your distribution,
  /// such as the monthly cost and monthly network transfer quota.
  ///
  /// Use the <code>GetDistributionBundles</code> action to get a list of
  /// distribution bundle IDs that you can specify.
  ///
  /// Parameter [defaultCacheBehavior] :
  /// An object that describes the default cache behavior for the distribution.
  ///
  /// Parameter [distributionName] :
  /// The name for the distribution.
  ///
  /// Parameter [origin] :
  /// An object that describes the origin resource for the distribution, such as
  /// a Lightsail instance, bucket, or load balancer.
  ///
  /// The distribution pulls, caches, and serves content from the origin.
  ///
  /// Parameter [cacheBehaviorSettings] :
  /// An object that describes the cache behavior settings for the distribution.
  ///
  /// Parameter [cacheBehaviors] :
  /// An array of objects that describe the per-path cache behavior for the
  /// distribution.
  ///
  /// Parameter [certificateName] :
  /// The name of the SSL/TLS certificate that you want to attach to the
  /// distribution.
  ///
  /// Use the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetCertificates.html">GetCertificates</a>
  /// action to get a list of certificate names that you can specify.
  ///
  /// Parameter [ipAddressType] :
  /// The IP address type for the distribution.
  ///
  /// The possible values are <code>ipv4</code> for IPv4 only, and
  /// <code>dualstack</code> for IPv4 and IPv6.
  ///
  /// The default value is <code>dualstack</code>.
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the distribution during create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  ///
  /// Parameter [viewerMinimumTlsProtocolVersion] :
  /// The minimum TLS protocol version for the SSL/TLS certificate.
  Future<CreateDistributionResult> createDistribution({
    required String bundleId,
    required CacheBehavior defaultCacheBehavior,
    required String distributionName,
    required InputOrigin origin,
    CacheSettings? cacheBehaviorSettings,
    List<CacheBehaviorPerPath>? cacheBehaviors,
    String? certificateName,
    IpAddressType? ipAddressType,
    List<Tag>? tags,
    ViewerMinimumTlsProtocolVersionEnum? viewerMinimumTlsProtocolVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateDistribution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'bundleId': bundleId,
        'defaultCacheBehavior': defaultCacheBehavior,
        'distributionName': distributionName,
        'origin': origin,
        if (cacheBehaviorSettings != null)
          'cacheBehaviorSettings': cacheBehaviorSettings,
        if (cacheBehaviors != null) 'cacheBehaviors': cacheBehaviors,
        if (certificateName != null) 'certificateName': certificateName,
        if (ipAddressType != null) 'ipAddressType': ipAddressType.toValue(),
        if (tags != null) 'tags': tags,
        if (viewerMinimumTlsProtocolVersion != null)
          'viewerMinimumTlsProtocolVersion':
              viewerMinimumTlsProtocolVersion.toValue(),
      },
    );

    return CreateDistributionResult.fromJson(jsonResponse.body);
  }

  /// Creates a domain resource for the specified domain (example.com).
  ///
  /// The <code>create domain</code> operation supports tag-based access control
  /// via request tags. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [domainName] :
  /// The domain name to manage (<code>example.com</code>).
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the resource during create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  Future<CreateDomainResult> createDomain({
    required String domainName,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domainName': domainName,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateDomainResult.fromJson(jsonResponse.body);
  }

  /// Creates one of the following domain name system (DNS) records in a domain
  /// DNS zone: Address (A), canonical name (CNAME), mail exchanger (MX), name
  /// server (NS), start of authority (SOA), service locator (SRV), or text
  /// (TXT).
  ///
  /// The <code>create domain entry</code> operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// <code>domain name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [domainEntry] :
  /// An array of key-value pairs containing information about the domain entry
  /// request.
  ///
  /// Parameter [domainName] :
  /// The domain name (<code>example.com</code>) for which you want to create
  /// the domain entry.
  Future<CreateDomainEntryResult> createDomainEntry({
    required DomainEntry domainEntry,
    required String domainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateDomainEntry'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domainEntry': domainEntry,
        'domainName': domainName,
      },
    );

    return CreateDomainEntryResult.fromJson(jsonResponse.body);
  }

  /// Creates two URLs that are used to access a virtual computer’s graphical
  /// user interface (GUI) session. The primary URL initiates a web-based NICE
  /// DCV session to the virtual computer's application. The secondary URL
  /// initiates a web-based NICE DCV session to the virtual computer's operating
  /// session.
  ///
  /// Use <code>StartGUISession</code> to open the session.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [ServiceException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [resourceName] :
  /// The resource name.
  Future<CreateGUISessionAccessDetailsResult> createGUISessionAccessDetails({
    required String resourceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateGUISessionAccessDetails'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceName': resourceName,
      },
    );

    return CreateGUISessionAccessDetailsResult.fromJson(jsonResponse.body);
  }

  /// Creates a snapshot of a specific virtual private server, or
  /// <i>instance</i>. You can use a snapshot to create a new instance that is
  /// based on that snapshot.
  ///
  /// The <code>create instance snapshot</code> operation supports tag-based
  /// access control via request tags. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instanceName] :
  /// The Lightsail instance on which to base your snapshot.
  ///
  /// Parameter [instanceSnapshotName] :
  /// The name for your new snapshot.
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the resource during create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  Future<CreateInstanceSnapshotResult> createInstanceSnapshot({
    required String instanceName,
    required String instanceSnapshotName,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateInstanceSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceName': instanceName,
        'instanceSnapshotName': instanceSnapshotName,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateInstanceSnapshotResult.fromJson(jsonResponse.body);
  }

  /// Creates one or more Amazon Lightsail instances.
  ///
  /// The <code>create instances</code> operation supports tag-based access
  /// control via request tags. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [availabilityZone] :
  /// The Availability Zone in which to create your instance. Use the following
  /// format: <code>us-east-2a</code> (case sensitive). You can get a list of
  /// Availability Zones by using the <a
  /// href="http://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetRegions.html">get
  /// regions</a> operation. Be sure to add the <code>include Availability
  /// Zones</code> parameter to your request.
  ///
  /// Parameter [blueprintId] :
  /// The ID for a virtual private server image (<code>app_wordpress_x_x</code>
  /// or <code>app_lamp_x_x</code>). Use the <code>get blueprints</code>
  /// operation to return a list of available images (or <i>blueprints</i>).
  /// <note>
  /// Use active blueprints when creating new instances. Inactive blueprints are
  /// listed to support customers with existing instances and are not
  /// necessarily available to create new instances. Blueprints are marked
  /// inactive when they become outdated due to operating system updates or new
  /// application releases.
  /// </note>
  ///
  /// Parameter [bundleId] :
  /// The bundle of specification information for your virtual private server
  /// (or <i>instance</i>), including the pricing plan
  /// (<code>medium_x_x</code>).
  ///
  /// Parameter [instanceNames] :
  /// The names to use for your new Lightsail instances. Separate multiple
  /// values using quotation marks and commas, for example:
  /// <code>["MyFirstInstance","MySecondInstance"]</code>
  ///
  /// Parameter [addOns] :
  /// An array of objects representing the add-ons to enable for the new
  /// instance.
  ///
  /// Parameter [customImageName] :
  /// (Discontinued) The name for your custom image.
  /// <note>
  /// In releases prior to June 12, 2017, this parameter was ignored by the API.
  /// It is now discontinued.
  /// </note>
  ///
  /// Parameter [ipAddressType] :
  /// The IP address type for the instance.
  ///
  /// The possible values are <code>ipv4</code> for IPv4 only, <code>ipv6</code>
  /// for IPv6 only, and <code>dualstack</code> for IPv4 and IPv6.
  ///
  /// The default value is <code>dualstack</code>.
  ///
  /// Parameter [keyPairName] :
  /// The name of your key pair.
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the resource during create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  ///
  /// Parameter [userData] :
  /// A launch script you can create that configures a server with additional
  /// user data. For example, you might want to run <code>apt-get -y
  /// update</code>.
  /// <note>
  /// Depending on the machine image you choose, the command to get software on
  /// your instance varies. Amazon Linux and CentOS use <code>yum</code>, Debian
  /// and Ubuntu use <code>apt-get</code>, and FreeBSD uses <code>pkg</code>.
  /// For a complete list, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/compare-options-choose-lightsail-instance-image">Amazon
  /// Lightsail Developer Guide</a>.
  /// </note>
  Future<CreateInstancesResult> createInstances({
    required String availabilityZone,
    required String blueprintId,
    required String bundleId,
    required List<String> instanceNames,
    List<AddOnRequest>? addOns,
    String? customImageName,
    IpAddressType? ipAddressType,
    String? keyPairName,
    List<Tag>? tags,
    String? userData,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'availabilityZone': availabilityZone,
        'blueprintId': blueprintId,
        'bundleId': bundleId,
        'instanceNames': instanceNames,
        if (addOns != null) 'addOns': addOns,
        if (customImageName != null) 'customImageName': customImageName,
        if (ipAddressType != null) 'ipAddressType': ipAddressType.toValue(),
        if (keyPairName != null) 'keyPairName': keyPairName,
        if (tags != null) 'tags': tags,
        if (userData != null) 'userData': userData,
      },
    );

    return CreateInstancesResult.fromJson(jsonResponse.body);
  }

  /// Creates one or more new instances from a manual or automatic snapshot of
  /// an instance.
  ///
  /// The <code>create instances from snapshot</code> operation supports
  /// tag-based access control via request tags and resource tags applied to the
  /// resource identified by <code>instance snapshot name</code>. For more
  /// information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [availabilityZone] :
  /// The Availability Zone where you want to create your instances. Use the
  /// following formatting: <code>us-east-2a</code> (case sensitive). You can
  /// get a list of Availability Zones by using the <a
  /// href="http://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetRegions.html">get
  /// regions</a> operation. Be sure to add the <code>include Availability
  /// Zones</code> parameter to your request.
  ///
  /// Parameter [bundleId] :
  /// The bundle of specification information for your virtual private server
  /// (or <i>instance</i>), including the pricing plan (<code>micro_x_x</code>).
  ///
  /// Parameter [instanceNames] :
  /// The names for your new instances.
  ///
  /// Parameter [addOns] :
  /// An array of objects representing the add-ons to enable for the new
  /// instance.
  ///
  /// Parameter [attachedDiskMapping] :
  /// An object containing information about one or more disk mappings.
  ///
  /// Parameter [instanceSnapshotName] :
  /// The name of the instance snapshot on which you are basing your new
  /// instances. Use the get instance snapshots operation to return information
  /// about your existing snapshots.
  ///
  /// Constraint:
  ///
  /// <ul>
  /// <li>
  /// This parameter cannot be defined together with the <code>source instance
  /// name</code> parameter. The <code>instance snapshot name</code> and
  /// <code>source instance name</code> parameters are mutually exclusive.
  /// </li>
  /// </ul>
  ///
  /// Parameter [ipAddressType] :
  /// The IP address type for the instance.
  ///
  /// The possible values are <code>ipv4</code> for IPv4 only, <code>ipv6</code>
  /// for IPv6 only, and <code>dualstack</code> for IPv4 and IPv6.
  ///
  /// The default value is <code>dualstack</code>.
  ///
  /// Parameter [keyPairName] :
  /// The name for your key pair.
  ///
  /// Parameter [restoreDate] :
  /// The date of the automatic snapshot to use for the new instance. Use the
  /// <code>get auto snapshots</code> operation to identify the dates of the
  /// available automatic snapshots.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be specified in <code>YYYY-MM-DD</code> format.
  /// </li>
  /// <li>
  /// This parameter cannot be defined together with the <code>use latest
  /// restorable auto snapshot</code> parameter. The <code>restore date</code>
  /// and <code>use latest restorable auto snapshot</code> parameters are
  /// mutually exclusive.
  /// </li>
  /// <li>
  /// Define this parameter only when creating a new instance from an automatic
  /// snapshot. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Amazon
  /// Lightsail Developer Guide</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [sourceInstanceName] :
  /// The name of the source instance from which the source automatic snapshot
  /// was created.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// This parameter cannot be defined together with the <code>instance snapshot
  /// name</code> parameter. The <code>source instance name</code> and
  /// <code>instance snapshot name</code> parameters are mutually exclusive.
  /// </li>
  /// <li>
  /// Define this parameter only when creating a new instance from an automatic
  /// snapshot. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Amazon
  /// Lightsail Developer Guide</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the resource during create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  ///
  /// Parameter [useLatestRestorableAutoSnapshot] :
  /// A Boolean value to indicate whether to use the latest available automatic
  /// snapshot.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// This parameter cannot be defined together with the <code>restore
  /// date</code> parameter. The <code>use latest restorable auto
  /// snapshot</code> and <code>restore date</code> parameters are mutually
  /// exclusive.
  /// </li>
  /// <li>
  /// Define this parameter only when creating a new instance from an automatic
  /// snapshot. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Amazon
  /// Lightsail Developer Guide</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [userData] :
  /// You can create a launch script that configures a server with additional
  /// user data. For example, <code>apt-get -y update</code>.
  /// <note>
  /// Depending on the machine image you choose, the command to get software on
  /// your instance varies. Amazon Linux and CentOS use <code>yum</code>, Debian
  /// and Ubuntu use <code>apt-get</code>, and FreeBSD uses <code>pkg</code>.
  /// For a complete list, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/compare-options-choose-lightsail-instance-image">Amazon
  /// Lightsail Developer Guide</a>.
  /// </note>
  Future<CreateInstancesFromSnapshotResult> createInstancesFromSnapshot({
    required String availabilityZone,
    required String bundleId,
    required List<String> instanceNames,
    List<AddOnRequest>? addOns,
    Map<String, List<DiskMap>>? attachedDiskMapping,
    String? instanceSnapshotName,
    IpAddressType? ipAddressType,
    String? keyPairName,
    String? restoreDate,
    String? sourceInstanceName,
    List<Tag>? tags,
    bool? useLatestRestorableAutoSnapshot,
    String? userData,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateInstancesFromSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'availabilityZone': availabilityZone,
        'bundleId': bundleId,
        'instanceNames': instanceNames,
        if (addOns != null) 'addOns': addOns,
        if (attachedDiskMapping != null)
          'attachedDiskMapping': attachedDiskMapping,
        if (instanceSnapshotName != null)
          'instanceSnapshotName': instanceSnapshotName,
        if (ipAddressType != null) 'ipAddressType': ipAddressType.toValue(),
        if (keyPairName != null) 'keyPairName': keyPairName,
        if (restoreDate != null) 'restoreDate': restoreDate,
        if (sourceInstanceName != null)
          'sourceInstanceName': sourceInstanceName,
        if (tags != null) 'tags': tags,
        if (useLatestRestorableAutoSnapshot != null)
          'useLatestRestorableAutoSnapshot': useLatestRestorableAutoSnapshot,
        if (userData != null) 'userData': userData,
      },
    );

    return CreateInstancesFromSnapshotResult.fromJson(jsonResponse.body);
  }

  /// Creates a custom SSH key pair that you can use with an Amazon Lightsail
  /// instance.
  /// <note>
  /// Use the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_DownloadDefaultKeyPair.html">DownloadDefaultKeyPair</a>
  /// action to create a Lightsail default key pair in an Amazon Web Services
  /// Region where a default key pair does not currently exist.
  /// </note>
  /// The <code>create key pair</code> operation supports tag-based access
  /// control via request tags. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [keyPairName] :
  /// The name for your new key pair.
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the resource during create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  Future<CreateKeyPairResult> createKeyPair({
    required String keyPairName,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateKeyPair'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'keyPairName': keyPairName,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateKeyPairResult.fromJson(jsonResponse.body);
  }

  /// Creates a Lightsail load balancer. To learn more about deciding whether to
  /// load balance your application, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/configure-lightsail-instances-for-load-balancing">Configure
  /// your Lightsail instances for load balancing</a>. You can create up to 5
  /// load balancers per AWS Region in your account.
  ///
  /// When you create a load balancer, you can specify a unique name and port
  /// settings. To change additional load balancer settings, use the
  /// <code>UpdateLoadBalancerAttribute</code> operation.
  ///
  /// The <code>create load balancer</code> operation supports tag-based access
  /// control via request tags. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instancePort] :
  /// The instance port where you're creating your load balancer.
  ///
  /// Parameter [loadBalancerName] :
  /// The name of your load balancer.
  ///
  /// Parameter [certificateAlternativeNames] :
  /// The optional alternative domains and subdomains to use with your SSL/TLS
  /// certificate (<code>www.example.com</code>, <code>example.com</code>,
  /// <code>m.example.com</code>, <code>blog.example.com</code>).
  ///
  /// Parameter [certificateDomainName] :
  /// The domain name with which your certificate is associated
  /// (<code>example.com</code>).
  ///
  /// If you specify <code>certificateDomainName</code>, then
  /// <code>certificateName</code> is required (and vice-versa).
  ///
  /// Parameter [certificateName] :
  /// The name of the SSL/TLS certificate.
  ///
  /// If you specify <code>certificateName</code>, then
  /// <code>certificateDomainName</code> is required (and vice-versa).
  ///
  /// Parameter [healthCheckPath] :
  /// The path you provided to perform the load balancer health check. If you
  /// didn't specify a health check path, Lightsail uses the root path of your
  /// website (<code>"/"</code>).
  ///
  /// You may want to specify a custom health check path other than the root of
  /// your application if your home page loads slowly or has a lot of media or
  /// scripting on it.
  ///
  /// Parameter [ipAddressType] :
  /// The IP address type for the load balancer.
  ///
  /// The possible values are <code>ipv4</code> for IPv4 only, <code>ipv6</code>
  /// for IPv6 only, and <code>dualstack</code> for IPv4 and IPv6.
  ///
  /// The default value is <code>dualstack</code>.
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the resource during create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  ///
  /// Parameter [tlsPolicyName] :
  /// The name of the TLS policy to apply to the load balancer.
  ///
  /// Use the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetLoadBalancerTlsPolicies.html">GetLoadBalancerTlsPolicies</a>
  /// action to get a list of TLS policy names that you can specify.
  ///
  /// For more information about load balancer TLS policies, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configure-load-balancer-tls-security-policy">Configuring
  /// TLS security policies on your Amazon Lightsail load balancers</a> in the
  /// <i>Amazon Lightsail Developer Guide</i>.
  Future<CreateLoadBalancerResult> createLoadBalancer({
    required int instancePort,
    required String loadBalancerName,
    List<String>? certificateAlternativeNames,
    String? certificateDomainName,
    String? certificateName,
    String? healthCheckPath,
    IpAddressType? ipAddressType,
    List<Tag>? tags,
    String? tlsPolicyName,
  }) async {
    _s.validateNumRange(
      'instancePort',
      instancePort,
      -1,
      65535,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateLoadBalancer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instancePort': instancePort,
        'loadBalancerName': loadBalancerName,
        if (certificateAlternativeNames != null)
          'certificateAlternativeNames': certificateAlternativeNames,
        if (certificateDomainName != null)
          'certificateDomainName': certificateDomainName,
        if (certificateName != null) 'certificateName': certificateName,
        if (healthCheckPath != null) 'healthCheckPath': healthCheckPath,
        if (ipAddressType != null) 'ipAddressType': ipAddressType.toValue(),
        if (tags != null) 'tags': tags,
        if (tlsPolicyName != null) 'tlsPolicyName': tlsPolicyName,
      },
    );

    return CreateLoadBalancerResult.fromJson(jsonResponse.body);
  }

  /// Creates an SSL/TLS certificate for an Amazon Lightsail load balancer.
  ///
  /// TLS is just an updated, more secure version of Secure Socket Layer (SSL).
  ///
  /// The <code>CreateLoadBalancerTlsCertificate</code> operation supports
  /// tag-based access control via resource tags applied to the resource
  /// identified by <code>load balancer name</code>. For more information, see
  /// the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [certificateDomainName] :
  /// The domain name (<code>example.com</code>) for your SSL/TLS certificate.
  ///
  /// Parameter [certificateName] :
  /// The SSL/TLS certificate name.
  ///
  /// You can have up to 10 certificates in your account at one time. Each
  /// Lightsail load balancer can have up to 2 certificates associated with it
  /// at one time. There is also an overall limit to the number of certificates
  /// that can be issue in a 365-day period. For more information, see <a
  /// href="http://docs.aws.amazon.com/acm/latest/userguide/acm-limits.html">Limits</a>.
  ///
  /// Parameter [loadBalancerName] :
  /// The load balancer name where you want to create the SSL/TLS certificate.
  ///
  /// Parameter [certificateAlternativeNames] :
  /// An array of strings listing alternative domains and subdomains for your
  /// SSL/TLS certificate. Lightsail will de-dupe the names for you. You can
  /// have a maximum of 9 alternative names (in addition to the 1 primary
  /// domain). We do not support wildcards (<code>*.example.com</code>).
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the resource during create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  Future<CreateLoadBalancerTlsCertificateResult>
      createLoadBalancerTlsCertificate({
    required String certificateDomainName,
    required String certificateName,
    required String loadBalancerName,
    List<String>? certificateAlternativeNames,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateLoadBalancerTlsCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'certificateDomainName': certificateDomainName,
        'certificateName': certificateName,
        'loadBalancerName': loadBalancerName,
        if (certificateAlternativeNames != null)
          'certificateAlternativeNames': certificateAlternativeNames,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateLoadBalancerTlsCertificateResult.fromJson(jsonResponse.body);
  }

  /// Creates a new database in Amazon Lightsail.
  ///
  /// The <code>create relational database</code> operation supports tag-based
  /// access control via request tags. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [masterDatabaseName] :
  /// The meaning of this parameter differs according to the database engine you
  /// use.
  ///
  /// <b>MySQL</b>
  ///
  /// The name of the database to create when the Lightsail database resource is
  /// created. If this parameter isn't specified, no database is created in the
  /// database resource.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain 1 to 64 letters or numbers.
  /// </li>
  /// <li>
  /// Must begin with a letter. Subsequent characters can be letters,
  /// underscores, or digits (0- 9).
  /// </li>
  /// <li>
  /// Can't be a word reserved by the specified database engine.
  ///
  /// For more information about reserved words in MySQL, see the Keywords and
  /// Reserved Words articles for <a
  /// href="https://dev.mysql.com/doc/refman/5.6/en/keywords.html">MySQL
  /// 5.6</a>, <a
  /// href="https://dev.mysql.com/doc/refman/5.7/en/keywords.html">MySQL
  /// 5.7</a>, and <a
  /// href="https://dev.mysql.com/doc/refman/8.0/en/keywords.html">MySQL
  /// 8.0</a>.
  /// </li>
  /// </ul>
  /// <b>PostgreSQL</b>
  ///
  /// The name of the database to create when the Lightsail database resource is
  /// created. If this parameter isn't specified, a database named
  /// <code>postgres</code> is created in the database resource.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain 1 to 63 letters or numbers.
  /// </li>
  /// <li>
  /// Must begin with a letter. Subsequent characters can be letters,
  /// underscores, or digits (0- 9).
  /// </li>
  /// <li>
  /// Can't be a word reserved by the specified database engine.
  ///
  /// For more information about reserved words in PostgreSQL, see the SQL Key
  /// Words articles for <a
  /// href="https://www.postgresql.org/docs/9.6/sql-keywords-appendix.html">PostgreSQL
  /// 9.6</a>, <a
  /// href="https://www.postgresql.org/docs/10/sql-keywords-appendix.html">PostgreSQL
  /// 10</a>, <a
  /// href="https://www.postgresql.org/docs/11/sql-keywords-appendix.html">PostgreSQL
  /// 11</a>, and <a
  /// href="https://www.postgresql.org/docs/12/sql-keywords-appendix.html">PostgreSQL
  /// 12</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [masterUsername] :
  /// The name for the master user.
  ///
  /// <b>MySQL</b>
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Required for MySQL.
  /// </li>
  /// <li>
  /// Must be 1 to 16 letters or numbers. Can contain underscores.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't be a reserved word for the chosen database engine.
  ///
  /// For more information about reserved words in MySQL 5.6 or 5.7, see the
  /// Keywords and Reserved Words articles for <a
  /// href="https://dev.mysql.com/doc/refman/5.6/en/keywords.html">MySQL
  /// 5.6</a>, <a
  /// href="https://dev.mysql.com/doc/refman/5.7/en/keywords.html">MySQL
  /// 5.7</a>, or <a
  /// href="https://dev.mysql.com/doc/refman/8.0/en/keywords.html">MySQL
  /// 8.0</a>.
  /// </li>
  /// </ul>
  /// <b>PostgreSQL</b>
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Required for PostgreSQL.
  /// </li>
  /// <li>
  /// Must be 1 to 63 letters or numbers. Can contain underscores.
  /// </li>
  /// <li>
  /// First character must be a letter.
  /// </li>
  /// <li>
  /// Can't be a reserved word for the chosen database engine.
  ///
  /// For more information about reserved words in MySQL 5.6 or 5.7, see the
  /// Keywords and Reserved Words articles for <a
  /// href="https://www.postgresql.org/docs/9.6/sql-keywords-appendix.html">PostgreSQL
  /// 9.6</a>, <a
  /// href="https://www.postgresql.org/docs/10/sql-keywords-appendix.html">PostgreSQL
  /// 10</a>, <a
  /// href="https://www.postgresql.org/docs/11/sql-keywords-appendix.html">PostgreSQL
  /// 11</a>, and <a
  /// href="https://www.postgresql.org/docs/12/sql-keywords-appendix.html">PostgreSQL
  /// 12</a>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [relationalDatabaseBlueprintId] :
  /// The blueprint ID for your new database. A blueprint describes the major
  /// engine version of a database.
  ///
  /// You can get a list of database blueprints IDs by using the <code>get
  /// relational database blueprints</code> operation.
  ///
  /// Parameter [relationalDatabaseBundleId] :
  /// The bundle ID for your new database. A bundle describes the performance
  /// specifications for your database.
  ///
  /// You can get a list of database bundle IDs by using the <code>get
  /// relational database bundles</code> operation.
  ///
  /// Parameter [relationalDatabaseName] :
  /// The name to use for your new Lightsail database resource.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 2 to 255 alphanumeric characters, or hyphens.
  /// </li>
  /// <li>
  /// The first and last character must be a letter or number.
  /// </li>
  /// </ul>
  ///
  /// Parameter [availabilityZone] :
  /// The Availability Zone in which to create your new database. Use the
  /// <code>us-east-2a</code> case-sensitive format.
  ///
  /// You can get a list of Availability Zones by using the <code>get
  /// regions</code> operation. Be sure to add the <code>include relational
  /// database Availability Zones</code> parameter to your request.
  ///
  /// Parameter [masterUserPassword] :
  /// The password for the master user. The password can include any printable
  /// ASCII character except "/", """, or "@". It cannot contain spaces.
  ///
  /// <b>MySQL</b>
  ///
  /// Constraints: Must contain from 8 to 41 characters.
  ///
  /// <b>PostgreSQL</b>
  ///
  /// Constraints: Must contain from 8 to 128 characters.
  ///
  /// Parameter [preferredBackupWindow] :
  /// The daily time range during which automated backups are created for your
  /// new database if automated backups are enabled.
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region. For more information about the preferred
  /// backup window time blocks for each region, see the <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html#USER_WorkingWithAutomatedBackups.BackupWindow">Working
  /// With Backups</a> guide in the Amazon Relational Database Service
  /// documentation.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be in the <code>hh24:mi-hh24:mi</code> format.
  ///
  /// Example: <code>16:00-16:30</code>
  /// </li>
  /// <li>
  /// Specified in Coordinated Universal Time (UTC).
  /// </li>
  /// <li>
  /// Must not conflict with the preferred maintenance window.
  /// </li>
  /// <li>
  /// Must be at least 30 minutes.
  /// </li>
  /// </ul>
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The weekly time range during which system maintenance can occur on your
  /// new database.
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region, occurring on a random day of the week.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be in the <code>ddd:hh24:mi-ddd:hh24:mi</code> format.
  /// </li>
  /// <li>
  /// Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
  /// </li>
  /// <li>
  /// Must be at least 30 minutes.
  /// </li>
  /// <li>
  /// Specified in Coordinated Universal Time (UTC).
  /// </li>
  /// <li>
  /// Example: <code>Tue:17:00-Tue:17:30</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [publiclyAccessible] :
  /// Specifies the accessibility options for your new database. A value of
  /// <code>true</code> specifies a database that is available to resources
  /// outside of your Lightsail account. A value of <code>false</code> specifies
  /// a database that is available only to your Lightsail resources in the same
  /// region as your database.
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the resource during create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  Future<CreateRelationalDatabaseResult> createRelationalDatabase({
    required String masterDatabaseName,
    required String masterUsername,
    required String relationalDatabaseBlueprintId,
    required String relationalDatabaseBundleId,
    required String relationalDatabaseName,
    String? availabilityZone,
    String? masterUserPassword,
    String? preferredBackupWindow,
    String? preferredMaintenanceWindow,
    bool? publiclyAccessible,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateRelationalDatabase'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'masterDatabaseName': masterDatabaseName,
        'masterUsername': masterUsername,
        'relationalDatabaseBlueprintId': relationalDatabaseBlueprintId,
        'relationalDatabaseBundleId': relationalDatabaseBundleId,
        'relationalDatabaseName': relationalDatabaseName,
        if (availabilityZone != null) 'availabilityZone': availabilityZone,
        if (masterUserPassword != null)
          'masterUserPassword': masterUserPassword,
        if (preferredBackupWindow != null)
          'preferredBackupWindow': preferredBackupWindow,
        if (preferredMaintenanceWindow != null)
          'preferredMaintenanceWindow': preferredMaintenanceWindow,
        if (publiclyAccessible != null)
          'publiclyAccessible': publiclyAccessible,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateRelationalDatabaseResult.fromJson(jsonResponse.body);
  }

  /// Creates a new database from an existing database snapshot in Amazon
  /// Lightsail.
  ///
  /// You can create a new database from a snapshot in if something goes wrong
  /// with your original database, or to change it to a different plan, such as
  /// a high availability or standard plan.
  ///
  /// The <code>create relational database from snapshot</code> operation
  /// supports tag-based access control via request tags and resource tags
  /// applied to the resource identified by relationalDatabaseSnapshotName. For
  /// more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [relationalDatabaseName] :
  /// The name to use for your new Lightsail database resource.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 2 to 255 alphanumeric characters, or hyphens.
  /// </li>
  /// <li>
  /// The first and last character must be a letter or number.
  /// </li>
  /// </ul>
  ///
  /// Parameter [availabilityZone] :
  /// The Availability Zone in which to create your new database. Use the
  /// <code>us-east-2a</code> case-sensitive format.
  ///
  /// You can get a list of Availability Zones by using the <code>get
  /// regions</code> operation. Be sure to add the <code>include relational
  /// database Availability Zones</code> parameter to your request.
  ///
  /// Parameter [publiclyAccessible] :
  /// Specifies the accessibility options for your new database. A value of
  /// <code>true</code> specifies a database that is available to resources
  /// outside of your Lightsail account. A value of <code>false</code> specifies
  /// a database that is available only to your Lightsail resources in the same
  /// region as your database.
  ///
  /// Parameter [relationalDatabaseBundleId] :
  /// The bundle ID for your new database. A bundle describes the performance
  /// specifications for your database.
  ///
  /// You can get a list of database bundle IDs by using the <code>get
  /// relational database bundles</code> operation.
  ///
  /// When creating a new database from a snapshot, you cannot choose a bundle
  /// that is smaller than the bundle of the source database.
  ///
  /// Parameter [relationalDatabaseSnapshotName] :
  /// The name of the database snapshot from which to create your new database.
  ///
  /// Parameter [restoreTime] :
  /// The date and time to restore your database from.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be before the latest restorable time for the database.
  /// </li>
  /// <li>
  /// Cannot be specified if the <code>use latest restorable time</code>
  /// parameter is <code>true</code>.
  /// </li>
  /// <li>
  /// Specified in Coordinated Universal Time (UTC).
  /// </li>
  /// <li>
  /// Specified in the Unix time format.
  ///
  /// For example, if you wish to use a restore time of October 1, 2018, at 8 PM
  /// UTC, then you input <code>1538424000</code> as the restore time.
  /// </li>
  /// </ul>
  ///
  /// Parameter [sourceRelationalDatabaseName] :
  /// The name of the source database.
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the resource during create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  ///
  /// Parameter [useLatestRestorableTime] :
  /// Specifies whether your database is restored from the latest backup time. A
  /// value of <code>true</code> restores from the latest backup time.
  ///
  /// Default: <code>false</code>
  ///
  /// Constraints: Cannot be specified if the <code>restore time</code>
  /// parameter is provided.
  Future<CreateRelationalDatabaseFromSnapshotResult>
      createRelationalDatabaseFromSnapshot({
    required String relationalDatabaseName,
    String? availabilityZone,
    bool? publiclyAccessible,
    String? relationalDatabaseBundleId,
    String? relationalDatabaseSnapshotName,
    DateTime? restoreTime,
    String? sourceRelationalDatabaseName,
    List<Tag>? tags,
    bool? useLatestRestorableTime,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateRelationalDatabaseFromSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'relationalDatabaseName': relationalDatabaseName,
        if (availabilityZone != null) 'availabilityZone': availabilityZone,
        if (publiclyAccessible != null)
          'publiclyAccessible': publiclyAccessible,
        if (relationalDatabaseBundleId != null)
          'relationalDatabaseBundleId': relationalDatabaseBundleId,
        if (relationalDatabaseSnapshotName != null)
          'relationalDatabaseSnapshotName': relationalDatabaseSnapshotName,
        if (restoreTime != null)
          'restoreTime': unixTimestampToJson(restoreTime),
        if (sourceRelationalDatabaseName != null)
          'sourceRelationalDatabaseName': sourceRelationalDatabaseName,
        if (tags != null) 'tags': tags,
        if (useLatestRestorableTime != null)
          'useLatestRestorableTime': useLatestRestorableTime,
      },
    );

    return CreateRelationalDatabaseFromSnapshotResult.fromJson(
        jsonResponse.body);
  }

  /// Creates a snapshot of your database in Amazon Lightsail. You can use
  /// snapshots for backups, to make copies of a database, and to save data
  /// before deleting a database.
  ///
  /// The <code>create relational database snapshot</code> operation supports
  /// tag-based access control via request tags. For more information, see the
  /// <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [relationalDatabaseName] :
  /// The name of the database on which to base your new snapshot.
  ///
  /// Parameter [relationalDatabaseSnapshotName] :
  /// The name for your new database snapshot.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 2 to 255 alphanumeric characters, or hyphens.
  /// </li>
  /// <li>
  /// The first and last character must be a letter or number.
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the resource during create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  Future<CreateRelationalDatabaseSnapshotResult>
      createRelationalDatabaseSnapshot({
    required String relationalDatabaseName,
    required String relationalDatabaseSnapshotName,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.CreateRelationalDatabaseSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'relationalDatabaseName': relationalDatabaseName,
        'relationalDatabaseSnapshotName': relationalDatabaseSnapshotName,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateRelationalDatabaseSnapshotResult.fromJson(jsonResponse.body);
  }

  /// Deletes an alarm.
  ///
  /// An alarm is used to monitor a single metric for one of your resources.
  /// When a metric condition is met, the alarm can notify you by email, SMS
  /// text message, and a banner displayed on the Amazon Lightsail console. For
  /// more information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms
  /// in Amazon Lightsail</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [OperationFailureException].
  /// May throw [UnauthenticatedException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [alarmName] :
  /// The name of the alarm to delete.
  Future<DeleteAlarmResult> deleteAlarm({
    required String alarmName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteAlarm'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'alarmName': alarmName,
      },
    );

    return DeleteAlarmResult.fromJson(jsonResponse.body);
  }

  /// Deletes an automatic snapshot of an instance or disk. For more
  /// information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [date] :
  /// The date of the automatic snapshot to delete in <code>YYYY-MM-DD</code>
  /// format. Use the <code>get auto snapshots</code> operation to get the
  /// available automatic snapshots for a resource.
  ///
  /// Parameter [resourceName] :
  /// The name of the source instance or disk from which to delete the automatic
  /// snapshot.
  Future<DeleteAutoSnapshotResult> deleteAutoSnapshot({
    required String date,
    required String resourceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteAutoSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'date': date,
        'resourceName': resourceName,
      },
    );

    return DeleteAutoSnapshotResult.fromJson(jsonResponse.body);
  }

  /// Deletes a Amazon Lightsail bucket.
  /// <note>
  /// When you delete your bucket, the bucket name is released and can be reused
  /// for a new bucket in your account or another Amazon Web Services account.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [ServiceException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [bucketName] :
  /// The name of the bucket to delete.
  ///
  /// Use the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetBuckets.html">GetBuckets</a>
  /// action to get a list of bucket names that you can specify.
  ///
  /// Parameter [forceDelete] :
  /// A Boolean value that indicates whether to force delete the bucket.
  ///
  /// You must force delete the bucket if it has one of the following
  /// conditions:
  ///
  /// <ul>
  /// <li>
  /// The bucket is the origin of a distribution.
  /// </li>
  /// <li>
  /// The bucket has instances that were granted access to it using the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_SetResourceAccessForBucket.html">SetResourceAccessForBucket</a>
  /// action.
  /// </li>
  /// <li>
  /// The bucket has objects.
  /// </li>
  /// <li>
  /// The bucket has access keys.
  /// </li>
  /// </ul> <important>
  /// Force deleting a bucket might impact other resources that rely on the
  /// bucket, such as instances, distributions, or software that use the issued
  /// access keys.
  /// </important>
  Future<DeleteBucketResult> deleteBucket({
    required String bucketName,
    bool? forceDelete,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteBucket'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'bucketName': bucketName,
        if (forceDelete != null) 'forceDelete': forceDelete,
      },
    );

    return DeleteBucketResult.fromJson(jsonResponse.body);
  }

  /// Deletes an access key for the specified Amazon Lightsail bucket.
  ///
  /// We recommend that you delete an access key if the secret access key is
  /// compromised.
  ///
  /// For more information about access keys, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-creating-bucket-access-keys">Creating
  /// access keys for a bucket in Amazon Lightsail</a> in the <i>Amazon
  /// Lightsail Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [ServiceException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [accessKeyId] :
  /// The ID of the access key to delete.
  ///
  /// Use the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetBucketAccessKeys.html">GetBucketAccessKeys</a>
  /// action to get a list of access key IDs that you can specify.
  ///
  /// Parameter [bucketName] :
  /// The name of the bucket that the access key belongs to.
  Future<DeleteBucketAccessKeyResult> deleteBucketAccessKey({
    required String accessKeyId,
    required String bucketName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteBucketAccessKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'accessKeyId': accessKeyId,
        'bucketName': bucketName,
      },
    );

    return DeleteBucketAccessKeyResult.fromJson(jsonResponse.body);
  }

  /// Deletes an SSL/TLS certificate for your Amazon Lightsail content delivery
  /// network (CDN) distribution.
  ///
  /// Certificates that are currently attached to a distribution cannot be
  /// deleted. Use the <code>DetachCertificateFromDistribution</code> action to
  /// detach a certificate from a distribution.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [certificateName] :
  /// The name of the certificate to delete.
  ///
  /// Use the <code>GetCertificates</code> action to get a list of certificate
  /// names that you can specify.
  Future<DeleteCertificateResult> deleteCertificate({
    required String certificateName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'certificateName': certificateName,
      },
    );

    return DeleteCertificateResult.fromJson(jsonResponse.body);
  }

  /// Deletes a contact method.
  ///
  /// A contact method is used to send you notifications about your Amazon
  /// Lightsail resources. You can add one email address and one mobile phone
  /// number contact method in each Amazon Web Services Region. However, SMS
  /// text messaging is not supported in some Amazon Web Services Regions, and
  /// SMS text messages cannot be sent to some countries/regions. For more
  /// information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications
  /// in Amazon Lightsail</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [OperationFailureException].
  /// May throw [UnauthenticatedException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [protocol] :
  /// The protocol that will be deleted, such as <code>Email</code> or
  /// <code>SMS</code> (text messaging).
  /// <note>
  /// To delete an <code>Email</code> and an <code>SMS</code> contact method if
  /// you added both, you must run separate <code>DeleteContactMethod</code>
  /// actions to delete each protocol.
  /// </note>
  Future<DeleteContactMethodResult> deleteContactMethod({
    required ContactProtocol protocol,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteContactMethod'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'protocol': protocol.toValue(),
      },
    );

    return DeleteContactMethodResult.fromJson(jsonResponse.body);
  }

  /// Deletes a container image that is registered to your Amazon Lightsail
  /// container service.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [image] :
  /// The name of the container image to delete from the container service.
  ///
  /// Use the <code>GetContainerImages</code> action to get the name of the
  /// container images that are registered to a container service.
  /// <note>
  /// Container images sourced from your Lightsail container service, that are
  /// registered and stored on your service, start with a colon
  /// (<code>:</code>). For example,
  /// <code>:container-service-1.mystaticwebsite.1</code>. Container images
  /// sourced from a public registry like Docker Hub don't start with a colon.
  /// For example, <code>nginx:latest</code> or <code>nginx</code>.
  /// </note>
  ///
  /// Parameter [serviceName] :
  /// The name of the container service for which to delete a registered
  /// container image.
  Future<void> deleteContainerImage({
    required String image,
    required String serviceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteContainerImage'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'image': image,
        'serviceName': serviceName,
      },
    );
  }

  /// Deletes your Amazon Lightsail container service.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [serviceName] :
  /// The name of the container service to delete.
  Future<void> deleteContainerService({
    required String serviceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteContainerService'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'serviceName': serviceName,
      },
    );
  }

  /// Deletes the specified block storage disk. The disk must be in the
  /// <code>available</code> state (not attached to a Lightsail instance).
  /// <note>
  /// The disk may remain in the <code>deleting</code> state for several
  /// minutes.
  /// </note>
  /// The <code>delete disk</code> operation supports tag-based access control
  /// via resource tags applied to the resource identified by <code>disk
  /// name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [diskName] :
  /// The unique name of the disk you want to delete (<code>my-disk</code>).
  ///
  /// Parameter [forceDeleteAddOns] :
  /// A Boolean value to indicate whether to delete all add-ons for the disk.
  Future<DeleteDiskResult> deleteDisk({
    required String diskName,
    bool? forceDeleteAddOns,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteDisk'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'diskName': diskName,
        if (forceDeleteAddOns != null) 'forceDeleteAddOns': forceDeleteAddOns,
      },
    );

    return DeleteDiskResult.fromJson(jsonResponse.body);
  }

  /// Deletes the specified disk snapshot.
  ///
  /// When you make periodic snapshots of a disk, the snapshots are incremental,
  /// and only the blocks on the device that have changed since your last
  /// snapshot are saved in the new snapshot. When you delete a snapshot, only
  /// the data not needed for any other snapshot is removed. So regardless of
  /// which prior snapshots have been deleted, all active snapshots will have
  /// access to all the information needed to restore the disk.
  ///
  /// The <code>delete disk snapshot</code> operation supports tag-based access
  /// control via resource tags applied to the resource identified by <code>disk
  /// snapshot name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [diskSnapshotName] :
  /// The name of the disk snapshot you want to delete
  /// (<code>my-disk-snapshot</code>).
  Future<DeleteDiskSnapshotResult> deleteDiskSnapshot({
    required String diskSnapshotName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteDiskSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'diskSnapshotName': diskSnapshotName,
      },
    );

    return DeleteDiskSnapshotResult.fromJson(jsonResponse.body);
  }

  /// Deletes your Amazon Lightsail content delivery network (CDN) distribution.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [distributionName] :
  /// The name of the distribution to delete.
  ///
  /// Use the <code>GetDistributions</code> action to get a list of distribution
  /// names that you can specify.
  Future<DeleteDistributionResult> deleteDistribution({
    String? distributionName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteDistribution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (distributionName != null) 'distributionName': distributionName,
      },
    );

    return DeleteDistributionResult.fromJson(jsonResponse.body);
  }

  /// Deletes the specified domain recordset and all of its domain records.
  ///
  /// The <code>delete domain</code> operation supports tag-based access control
  /// via resource tags applied to the resource identified by <code>domain
  /// name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [domainName] :
  /// The specific domain name to delete.
  Future<DeleteDomainResult> deleteDomain({
    required String domainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domainName': domainName,
      },
    );

    return DeleteDomainResult.fromJson(jsonResponse.body);
  }

  /// Deletes a specific domain entry.
  ///
  /// The <code>delete domain entry</code> operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// <code>domain name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [domainEntry] :
  /// An array of key-value pairs containing information about your domain
  /// entries.
  ///
  /// Parameter [domainName] :
  /// The name of the domain entry to delete.
  Future<DeleteDomainEntryResult> deleteDomainEntry({
    required DomainEntry domainEntry,
    required String domainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteDomainEntry'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domainEntry': domainEntry,
        'domainName': domainName,
      },
    );

    return DeleteDomainEntryResult.fromJson(jsonResponse.body);
  }

  /// Deletes an Amazon Lightsail instance.
  ///
  /// The <code>delete instance</code> operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// <code>instance name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instanceName] :
  /// The name of the instance to delete.
  ///
  /// Parameter [forceDeleteAddOns] :
  /// A Boolean value to indicate whether to delete all add-ons for the
  /// instance.
  Future<DeleteInstanceResult> deleteInstance({
    required String instanceName,
    bool? forceDeleteAddOns,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceName': instanceName,
        if (forceDeleteAddOns != null) 'forceDeleteAddOns': forceDeleteAddOns,
      },
    );

    return DeleteInstanceResult.fromJson(jsonResponse.body);
  }

  /// Deletes a specific snapshot of a virtual private server (or
  /// <i>instance</i>).
  ///
  /// The <code>delete instance snapshot</code> operation supports tag-based
  /// access control via resource tags applied to the resource identified by
  /// <code>instance snapshot name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instanceSnapshotName] :
  /// The name of the snapshot to delete.
  Future<DeleteInstanceSnapshotResult> deleteInstanceSnapshot({
    required String instanceSnapshotName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteInstanceSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceSnapshotName': instanceSnapshotName,
      },
    );

    return DeleteInstanceSnapshotResult.fromJson(jsonResponse.body);
  }

  /// Deletes the specified key pair by removing the public key from Amazon
  /// Lightsail.
  ///
  /// You can delete key pairs that were created using the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_ImportKeyPair.html">ImportKeyPair</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateKeyPair.html">CreateKeyPair</a>
  /// actions, as well as the Lightsail default key pair. A new default key pair
  /// will not be created unless you launch an instance without specifying a
  /// custom key pair, or you call the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_DownloadDefaultKeyPair.html">DownloadDefaultKeyPair</a>
  /// API.
  ///
  /// The <code>delete key pair</code> operation supports tag-based access
  /// control via resource tags applied to the resource identified by <code>key
  /// pair name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [keyPairName] :
  /// The name of the key pair to delete.
  ///
  /// Parameter [expectedFingerprint] :
  /// The RSA fingerprint of the Lightsail default key pair to delete.
  /// <note>
  /// The <code>expectedFingerprint</code> parameter is required only when
  /// specifying to delete a Lightsail default key pair.
  /// </note>
  Future<DeleteKeyPairResult> deleteKeyPair({
    required String keyPairName,
    String? expectedFingerprint,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteKeyPair'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'keyPairName': keyPairName,
        if (expectedFingerprint != null)
          'expectedFingerprint': expectedFingerprint,
      },
    );

    return DeleteKeyPairResult.fromJson(jsonResponse.body);
  }

  /// Deletes the known host key or certificate used by the Amazon Lightsail
  /// browser-based SSH or RDP clients to authenticate an instance. This
  /// operation enables the Lightsail browser-based SSH or RDP clients to
  /// connect to the instance after a host key mismatch.
  /// <important>
  /// Perform this operation only if you were expecting the host key or
  /// certificate mismatch or if you are familiar with the new host key or
  /// certificate on the instance. For more information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-troubleshooting-browser-based-ssh-rdp-client-connection">Troubleshooting
  /// connection issues when using the Amazon Lightsail browser-based SSH or RDP
  /// client</a>.
  /// </important>
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instanceName] :
  /// The name of the instance for which you want to reset the host key or
  /// certificate.
  Future<DeleteKnownHostKeysResult> deleteKnownHostKeys({
    required String instanceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteKnownHostKeys'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceName': instanceName,
      },
    );

    return DeleteKnownHostKeysResult.fromJson(jsonResponse.body);
  }

  /// Deletes a Lightsail load balancer and all its associated SSL/TLS
  /// certificates. Once the load balancer is deleted, you will need to create a
  /// new load balancer, create a new certificate, and verify domain ownership
  /// again.
  ///
  /// The <code>delete load balancer</code> operation supports tag-based access
  /// control via resource tags applied to the resource identified by <code>load
  /// balancer name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer you want to delete.
  Future<DeleteLoadBalancerResult> deleteLoadBalancer({
    required String loadBalancerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteLoadBalancer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'loadBalancerName': loadBalancerName,
      },
    );

    return DeleteLoadBalancerResult.fromJson(jsonResponse.body);
  }

  /// Deletes an SSL/TLS certificate associated with a Lightsail load balancer.
  ///
  /// The <code>DeleteLoadBalancerTlsCertificate</code> operation supports
  /// tag-based access control via resource tags applied to the resource
  /// identified by <code>load balancer name</code>. For more information, see
  /// the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [certificateName] :
  /// The SSL/TLS certificate name.
  ///
  /// Parameter [loadBalancerName] :
  /// The load balancer name.
  ///
  /// Parameter [force] :
  /// When <code>true</code>, forces the deletion of an SSL/TLS certificate.
  ///
  /// There can be two certificates associated with a Lightsail load balancer:
  /// the primary and the backup. The <code>force</code> parameter is required
  /// when the primary SSL/TLS certificate is in use by an instance attached to
  /// the load balancer.
  Future<DeleteLoadBalancerTlsCertificateResult>
      deleteLoadBalancerTlsCertificate({
    required String certificateName,
    required String loadBalancerName,
    bool? force,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteLoadBalancerTlsCertificate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'certificateName': certificateName,
        'loadBalancerName': loadBalancerName,
        if (force != null) 'force': force,
      },
    );

    return DeleteLoadBalancerTlsCertificateResult.fromJson(jsonResponse.body);
  }

  /// Deletes a database in Amazon Lightsail.
  ///
  /// The <code>delete relational database</code> operation supports tag-based
  /// access control via resource tags applied to the resource identified by
  /// relationalDatabaseName. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [relationalDatabaseName] :
  /// The name of the database that you are deleting.
  ///
  /// Parameter [finalRelationalDatabaseSnapshotName] :
  /// The name of the database snapshot created if <code>skip final
  /// snapshot</code> is <code>false</code>, which is the default value for that
  /// parameter.
  /// <note>
  /// Specifying this parameter and also specifying the <code>skip final
  /// snapshot</code> parameter to <code>true</code> results in an error.
  /// </note>
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 2 to 255 alphanumeric characters, or hyphens.
  /// </li>
  /// <li>
  /// The first and last character must be a letter or number.
  /// </li>
  /// </ul>
  ///
  /// Parameter [skipFinalSnapshot] :
  /// Determines whether a final database snapshot is created before your
  /// database is deleted. If <code>true</code> is specified, no database
  /// snapshot is created. If <code>false</code> is specified, a database
  /// snapshot is created before your database is deleted.
  ///
  /// You must specify the <code>final relational database snapshot name</code>
  /// parameter if the <code>skip final snapshot</code> parameter is
  /// <code>false</code>.
  ///
  /// Default: <code>false</code>
  Future<DeleteRelationalDatabaseResult> deleteRelationalDatabase({
    required String relationalDatabaseName,
    String? finalRelationalDatabaseSnapshotName,
    bool? skipFinalSnapshot,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteRelationalDatabase'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'relationalDatabaseName': relationalDatabaseName,
        if (finalRelationalDatabaseSnapshotName != null)
          'finalRelationalDatabaseSnapshotName':
              finalRelationalDatabaseSnapshotName,
        if (skipFinalSnapshot != null) 'skipFinalSnapshot': skipFinalSnapshot,
      },
    );

    return DeleteRelationalDatabaseResult.fromJson(jsonResponse.body);
  }

  /// Deletes a database snapshot in Amazon Lightsail.
  ///
  /// The <code>delete relational database snapshot</code> operation supports
  /// tag-based access control via resource tags applied to the resource
  /// identified by relationalDatabaseName. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [relationalDatabaseSnapshotName] :
  /// The name of the database snapshot that you are deleting.
  Future<DeleteRelationalDatabaseSnapshotResult>
      deleteRelationalDatabaseSnapshot({
    required String relationalDatabaseSnapshotName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteRelationalDatabaseSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'relationalDatabaseSnapshotName': relationalDatabaseSnapshotName,
      },
    );

    return DeleteRelationalDatabaseSnapshotResult.fromJson(jsonResponse.body);
  }

  /// Detaches an SSL/TLS certificate from your Amazon Lightsail content
  /// delivery network (CDN) distribution.
  ///
  /// After the certificate is detached, your distribution stops accepting
  /// traffic for all of the domains that are associated with the certificate.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [distributionName] :
  /// The name of the distribution from which to detach the certificate.
  ///
  /// Use the <code>GetDistributions</code> action to get a list of distribution
  /// names that you can specify.
  Future<DetachCertificateFromDistributionResult>
      detachCertificateFromDistribution({
    required String distributionName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DetachCertificateFromDistribution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'distributionName': distributionName,
      },
    );

    return DetachCertificateFromDistributionResult.fromJson(jsonResponse.body);
  }

  /// Detaches a stopped block storage disk from a Lightsail instance. Make sure
  /// to unmount any file systems on the device within your operating system
  /// before stopping the instance and detaching the disk.
  ///
  /// The <code>detach disk</code> operation supports tag-based access control
  /// via resource tags applied to the resource identified by <code>disk
  /// name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [diskName] :
  /// The unique name of the disk you want to detach from your instance
  /// (<code>my-disk</code>).
  Future<DetachDiskResult> detachDisk({
    required String diskName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DetachDisk'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'diskName': diskName,
      },
    );

    return DetachDiskResult.fromJson(jsonResponse.body);
  }

  /// Detaches the specified instances from a Lightsail load balancer.
  ///
  /// This operation waits until the instances are no longer needed before they
  /// are detached from the load balancer.
  ///
  /// The <code>detach instances from load balancer</code> operation supports
  /// tag-based access control via resource tags applied to the resource
  /// identified by <code>load balancer name</code>. For more information, see
  /// the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instanceNames] :
  /// An array of strings containing the names of the instances you want to
  /// detach from the load balancer.
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the Lightsail load balancer.
  Future<DetachInstancesFromLoadBalancerResult>
      detachInstancesFromLoadBalancer({
    required List<String> instanceNames,
    required String loadBalancerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DetachInstancesFromLoadBalancer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceNames': instanceNames,
        'loadBalancerName': loadBalancerName,
      },
    );

    return DetachInstancesFromLoadBalancerResult.fromJson(jsonResponse.body);
  }

  /// Detaches a static IP from the Amazon Lightsail instance to which it is
  /// attached.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [staticIpName] :
  /// The name of the static IP to detach from the instance.
  Future<DetachStaticIpResult> detachStaticIp({
    required String staticIpName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DetachStaticIp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'staticIpName': staticIpName,
      },
    );

    return DetachStaticIpResult.fromJson(jsonResponse.body);
  }

  /// Disables an add-on for an Amazon Lightsail resource. For more information,
  /// see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [addOnType] :
  /// The add-on type to disable.
  ///
  /// Parameter [resourceName] :
  /// The name of the source resource for which to disable the add-on.
  Future<DisableAddOnResult> disableAddOn({
    required AddOnType addOnType,
    required String resourceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DisableAddOn'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'addOnType': addOnType.toValue(),
        'resourceName': resourceName,
      },
    );

    return DisableAddOnResult.fromJson(jsonResponse.body);
  }

  /// Downloads the regional Amazon Lightsail default key pair.
  ///
  /// This action also creates a Lightsail default key pair if a default key
  /// pair does not currently exist in the Amazon Web Services Region.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  Future<DownloadDefaultKeyPairResult> downloadDefaultKeyPair() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DownloadDefaultKeyPair'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DownloadDefaultKeyPairResult.fromJson(jsonResponse.body);
  }

  /// Enables or modifies an add-on for an Amazon Lightsail resource. For more
  /// information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [addOnRequest] :
  /// An array of strings representing the add-on to enable or modify.
  ///
  /// Parameter [resourceName] :
  /// The name of the source resource for which to enable or modify the add-on.
  Future<EnableAddOnResult> enableAddOn({
    required AddOnRequest addOnRequest,
    required String resourceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.EnableAddOn'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'addOnRequest': addOnRequest,
        'resourceName': resourceName,
      },
    );

    return EnableAddOnResult.fromJson(jsonResponse.body);
  }

  /// Exports an Amazon Lightsail instance or block storage disk snapshot to
  /// Amazon Elastic Compute Cloud (Amazon EC2). This operation results in an
  /// export snapshot record that can be used with the <code>create cloud
  /// formation stack</code> operation to create new Amazon EC2 instances.
  ///
  /// Exported instance snapshots appear in Amazon EC2 as Amazon Machine Images
  /// (AMIs), and the instance system disk appears as an Amazon Elastic Block
  /// Store (Amazon EBS) volume. Exported disk snapshots appear in Amazon EC2 as
  /// Amazon EBS volumes. Snapshots are exported to the same Amazon Web Services
  /// Region in Amazon EC2 as the source Lightsail snapshot.
  /// <p/>
  /// The <code>export snapshot</code> operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// <code>source snapshot name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  /// <note>
  /// Use the <code>get instance snapshots</code> or <code>get disk
  /// snapshots</code> operations to get a list of snapshots that you can export
  /// to Amazon EC2.
  /// </note>
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [sourceSnapshotName] :
  /// The name of the instance or disk snapshot to be exported to Amazon EC2.
  Future<ExportSnapshotResult> exportSnapshot({
    required String sourceSnapshotName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.ExportSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'sourceSnapshotName': sourceSnapshotName,
      },
    );

    return ExportSnapshotResult.fromJson(jsonResponse.body);
  }

  /// Returns the names of all active (not deleted) resources.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetActiveNames</code>
  /// request. If your results are paginated, the response will return a next
  /// page token that you can specify as the page token in a subsequent request.
  Future<GetActiveNamesResult> getActiveNames({
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetActiveNames'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetActiveNamesResult.fromJson(jsonResponse.body);
  }

  /// Returns information about the configured alarms. Specify an alarm name in
  /// your request to return information about a specific alarm, or specify a
  /// monitored resource name to return information about all alarms for a
  /// specific resource.
  ///
  /// An alarm is used to monitor a single metric for one of your resources.
  /// When a metric condition is met, the alarm can notify you by email, SMS
  /// text message, and a banner displayed on the Amazon Lightsail console. For
  /// more information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms
  /// in Amazon Lightsail</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [OperationFailureException].
  /// May throw [UnauthenticatedException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [alarmName] :
  /// The name of the alarm.
  ///
  /// Specify an alarm name to return information about a specific alarm.
  ///
  /// Parameter [monitoredResourceName] :
  /// The name of the Lightsail resource being monitored by the alarm.
  ///
  /// Specify a monitored resource name to return information about all alarms
  /// for a specific resource.
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetAlarms</code> request. If
  /// your results are paginated, the response will return a next page token
  /// that you can specify as the page token in a subsequent request.
  Future<GetAlarmsResult> getAlarms({
    String? alarmName,
    String? monitoredResourceName,
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetAlarms'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (alarmName != null) 'alarmName': alarmName,
        if (monitoredResourceName != null)
          'monitoredResourceName': monitoredResourceName,
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetAlarmsResult.fromJson(jsonResponse.body);
  }

  /// Returns the available automatic snapshots for an instance or disk. For
  /// more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [resourceName] :
  /// The name of the source instance or disk from which to get automatic
  /// snapshot information.
  Future<GetAutoSnapshotsResult> getAutoSnapshots({
    required String resourceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetAutoSnapshots'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceName': resourceName,
      },
    );

    return GetAutoSnapshotsResult.fromJson(jsonResponse.body);
  }

  /// Returns the list of available instance images, or <i>blueprints</i>. You
  /// can use a blueprint to create a new instance already running a specific
  /// operating system, as well as a preinstalled app or development stack. The
  /// software each instance is running depends on the blueprint image you
  /// choose.
  /// <note>
  /// Use active blueprints when creating new instances. Inactive blueprints are
  /// listed to support customers with existing instances and are not
  /// necessarily available to create new instances. Blueprints are marked
  /// inactive when they become outdated due to operating system updates or new
  /// application releases.
  /// </note>
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [appCategory] :
  /// Returns a list of blueprints that are specific to Lightsail for Research.
  /// <important>
  /// You must use this parameter to view Lightsail for Research blueprints.
  /// </important>
  ///
  /// Parameter [includeInactive] :
  /// A Boolean value that indicates whether to include inactive (unavailable)
  /// blueprints in the response of your request.
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetBlueprints</code>
  /// request. If your results are paginated, the response will return a next
  /// page token that you can specify as the page token in a subsequent request.
  Future<GetBlueprintsResult> getBlueprints({
    AppCategory? appCategory,
    bool? includeInactive,
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetBlueprints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appCategory != null) 'appCategory': appCategory.toValue(),
        if (includeInactive != null) 'includeInactive': includeInactive,
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetBlueprintsResult.fromJson(jsonResponse.body);
  }

  /// Returns the existing access key IDs for the specified Amazon Lightsail
  /// bucket.
  /// <important>
  /// This action does not return the secret access key value of an access key.
  /// You can get a secret access key only when you create it from the response
  /// of the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateBucketAccessKey.html">CreateBucketAccessKey</a>
  /// action. If you lose the secret access key, you must create a new access
  /// key.
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [ServiceException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [bucketName] :
  /// The name of the bucket for which to return access keys.
  Future<GetBucketAccessKeysResult> getBucketAccessKeys({
    required String bucketName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetBucketAccessKeys'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'bucketName': bucketName,
      },
    );

    return GetBucketAccessKeysResult.fromJson(jsonResponse.body);
  }

  /// Returns the bundles that you can apply to a Amazon Lightsail bucket.
  ///
  /// The bucket bundle specifies the monthly cost, storage quota, and data
  /// transfer quota for a bucket.
  ///
  /// Use the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_UpdateBucketBundle.html">UpdateBucketBundle</a>
  /// action to update the bundle for a bucket.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [ServiceException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [includeInactive] :
  /// A Boolean value that indicates whether to include inactive (unavailable)
  /// bundles in the response of your request.
  Future<GetBucketBundlesResult> getBucketBundles({
    bool? includeInactive,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetBucketBundles'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (includeInactive != null) 'includeInactive': includeInactive,
      },
    );

    return GetBucketBundlesResult.fromJson(jsonResponse.body);
  }

  /// Returns the data points of a specific metric for an Amazon Lightsail
  /// bucket.
  ///
  /// Metrics report the utilization of a bucket. View and collect metric data
  /// regularly to monitor the number of objects stored in a bucket (including
  /// object versions) and the storage space used by those objects.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [ServiceException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [bucketName] :
  /// The name of the bucket for which to get metric data.
  ///
  /// Parameter [endTime] :
  /// The timestamp indicating the latest data to be returned.
  ///
  /// Parameter [metricName] :
  /// The metric for which you want to return information.
  ///
  /// Valid bucket metric names are listed below, along with the most useful
  /// statistics to include in your request, and the published unit value.
  /// <note>
  /// These bucket metrics are reported once per day.
  /// </note>
  /// <ul>
  /// <li>
  /// <b> <code>BucketSizeBytes</code> </b> - The amount of data in bytes stored
  /// in a bucket. This value is calculated by summing the size of all objects
  /// in the bucket (including object versions), including the size of all parts
  /// for all incomplete multipart uploads to the bucket.
  ///
  /// Statistics: The most useful statistic is <code>Maximum</code>.
  ///
  /// Unit: The published unit is <code>Bytes</code>.
  /// </li>
  /// <li>
  /// <b> <code>NumberOfObjects</code> </b> - The total number of objects stored
  /// in a bucket. This value is calculated by counting all objects in the
  /// bucket (including object versions) and the total number of parts for all
  /// incomplete multipart uploads to the bucket.
  ///
  /// Statistics: The most useful statistic is <code>Average</code>.
  ///
  /// Unit: The published unit is <code>Count</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [period] :
  /// The granularity, in seconds, of the returned data points.
  /// <note>
  /// Bucket storage metrics are reported once per day. Therefore, you should
  /// specify a period of 86400 seconds, which is the number of seconds in a
  /// day.
  /// </note>
  ///
  /// Parameter [startTime] :
  /// The timestamp indicating the earliest data to be returned.
  ///
  /// Parameter [statistics] :
  /// The statistic for the metric.
  ///
  /// The following statistics are available:
  ///
  /// <ul>
  /// <li>
  /// <code>Minimum</code> - The lowest value observed during the specified
  /// period. Use this value to determine low volumes of activity for your
  /// application.
  /// </li>
  /// <li>
  /// <code>Maximum</code> - The highest value observed during the specified
  /// period. Use this value to determine high volumes of activity for your
  /// application.
  /// </li>
  /// <li>
  /// <code>Sum</code> - The sum of all values submitted for the matching
  /// metric. You can use this statistic to determine the total volume of a
  /// metric.
  /// </li>
  /// <li>
  /// <code>Average</code> - The value of <code>Sum</code> /
  /// <code>SampleCount</code> during the specified period. By comparing this
  /// statistic with the <code>Minimum</code> and <code>Maximum</code> values,
  /// you can determine the full scope of a metric and how close the average use
  /// is to the <code>Minimum</code> and <code>Maximum</code> values. This
  /// comparison helps you to know when to increase or decrease your resources.
  /// </li>
  /// <li>
  /// <code>SampleCount</code> - The count, or number, of data points used for
  /// the statistical calculation.
  /// </li>
  /// </ul>
  ///
  /// Parameter [unit] :
  /// The unit for the metric data request.
  ///
  /// Valid units depend on the metric data being requested. For the valid units
  /// with each available metric, see the <code>metricName</code> parameter.
  Future<GetBucketMetricDataResult> getBucketMetricData({
    required String bucketName,
    required DateTime endTime,
    required BucketMetricName metricName,
    required int period,
    required DateTime startTime,
    required List<MetricStatistic> statistics,
    required MetricUnit unit,
  }) async {
    _s.validateNumRange(
      'period',
      period,
      60,
      86400,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetBucketMetricData'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'bucketName': bucketName,
        'endTime': unixTimestampToJson(endTime),
        'metricName': metricName.toValue(),
        'period': period,
        'startTime': unixTimestampToJson(startTime),
        'statistics': statistics.map((e) => e.toValue()).toList(),
        'unit': unit.toValue(),
      },
    );

    return GetBucketMetricDataResult.fromJson(jsonResponse.body);
  }

  /// Returns information about one or more Amazon Lightsail buckets. The
  /// information returned includes the synchronization status of the Amazon
  /// Simple Storage Service (Amazon S3) account-level block public access
  /// feature for your Lightsail buckets.
  ///
  /// For more information about buckets, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/buckets-in-amazon-lightsail">Buckets
  /// in Amazon Lightsail</a> in the <i>Amazon Lightsail Developer Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [ServiceException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [bucketName] :
  /// The name of the bucket for which to return information.
  ///
  /// When omitted, the response includes all of your buckets in the Amazon Web
  /// Services Region where the request is made.
  ///
  /// Parameter [includeConnectedResources] :
  /// A Boolean value that indicates whether to include Lightsail instances that
  /// were given access to the bucket using the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_SetResourceAccessForBucket.html">SetResourceAccessForBucket</a>
  /// action.
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetBuckets</code> request.
  /// If your results are paginated, the response will return a next page token
  /// that you can specify as the page token in a subsequent request.
  Future<GetBucketsResult> getBuckets({
    String? bucketName,
    bool? includeConnectedResources,
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetBuckets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (bucketName != null) 'bucketName': bucketName,
        if (includeConnectedResources != null)
          'includeConnectedResources': includeConnectedResources,
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetBucketsResult.fromJson(jsonResponse.body);
  }

  /// Returns the bundles that you can apply to an Amazon Lightsail instance
  /// when you create it.
  ///
  /// A bundle describes the specifications of an instance, such as the monthly
  /// cost, amount of memory, the number of vCPUs, amount of storage space, and
  /// monthly network data transfer quota.
  /// <note>
  /// Bundles are referred to as <i>instance plans</i> in the Lightsail console.
  /// </note>
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [appCategory] :
  /// Returns a list of bundles that are specific to Lightsail for Research.
  /// <important>
  /// You must use this parameter to view Lightsail for Research bundles.
  /// </important>
  ///
  /// Parameter [includeInactive] :
  /// A Boolean value that indicates whether to include inactive (unavailable)
  /// bundles in the response of your request.
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetBundles</code> request.
  /// If your results are paginated, the response will return a next page token
  /// that you can specify as the page token in a subsequent request.
  Future<GetBundlesResult> getBundles({
    AppCategory? appCategory,
    bool? includeInactive,
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetBundles'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appCategory != null) 'appCategory': appCategory.toValue(),
        if (includeInactive != null) 'includeInactive': includeInactive,
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetBundlesResult.fromJson(jsonResponse.body);
  }

  /// Returns information about one or more Amazon Lightsail SSL/TLS
  /// certificates.
  /// <note>
  /// To get a summary of a certificate, omit
  /// <code>includeCertificateDetails</code> from your request. The response
  /// will include only the certificate Amazon Resource Name (ARN), certificate
  /// name, domain name, and tags.
  /// </note>
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [certificateName] :
  /// The name for the certificate for which to return information.
  ///
  /// When omitted, the response includes all of your certificates in the Amazon
  /// Web Services Region where the request is made.
  ///
  /// Parameter [certificateStatuses] :
  /// The status of the certificates for which to return information.
  ///
  /// For example, specify <code>ISSUED</code> to return only certificates with
  /// an <code>ISSUED</code> status.
  ///
  /// When omitted, the response includes all of your certificates in the Amazon
  /// Web Services Region where the request is made, regardless of their current
  /// status.
  ///
  /// Parameter [includeCertificateDetails] :
  /// Indicates whether to include detailed information about the certificates
  /// in the response.
  ///
  /// When omitted, the response includes only the certificate names, Amazon
  /// Resource Names (ARNs), domain names, and tags.
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetCertificates</code>
  /// request. If your results are paginated, the response will return a next
  /// page token that you can specify as the page token in a subsequent request.
  Future<GetCertificatesResult> getCertificates({
    String? certificateName,
    List<CertificateStatus>? certificateStatuses,
    bool? includeCertificateDetails,
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetCertificates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (certificateName != null) 'certificateName': certificateName,
        if (certificateStatuses != null)
          'certificateStatuses':
              certificateStatuses.map((e) => e.toValue()).toList(),
        if (includeCertificateDetails != null)
          'includeCertificateDetails': includeCertificateDetails,
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetCertificatesResult.fromJson(jsonResponse.body);
  }

  /// Returns the CloudFormation stack record created as a result of the
  /// <code>create cloud formation stack</code> operation.
  ///
  /// An AWS CloudFormation stack is used to create a new Amazon EC2 instance
  /// from an exported Lightsail snapshot.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial
  /// <code>GetClouFormationStackRecords</code> request. If your results are
  /// paginated, the response will return a next page token that you can specify
  /// as the page token in a subsequent request.
  Future<GetCloudFormationStackRecordsResult> getCloudFormationStackRecords({
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetCloudFormationStackRecords'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetCloudFormationStackRecordsResult.fromJson(jsonResponse.body);
  }

  /// Returns information about the configured contact methods. Specify a
  /// protocol in your request to return information about a specific contact
  /// method.
  ///
  /// A contact method is used to send you notifications about your Amazon
  /// Lightsail resources. You can add one email address and one mobile phone
  /// number contact method in each Amazon Web Services Region. However, SMS
  /// text messaging is not supported in some Amazon Web Services Regions, and
  /// SMS text messages cannot be sent to some countries/regions. For more
  /// information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications
  /// in Amazon Lightsail</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [protocols] :
  /// The protocols used to send notifications, such as <code>Email</code>, or
  /// <code>SMS</code> (text messaging).
  ///
  /// Specify a protocol in your request to return information about a specific
  /// contact method protocol.
  Future<GetContactMethodsResult> getContactMethods({
    List<ContactProtocol>? protocols,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetContactMethods'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (protocols != null)
          'protocols': protocols.map((e) => e.toValue()).toList(),
      },
    );

    return GetContactMethodsResult.fromJson(jsonResponse.body);
  }

  /// Returns information about Amazon Lightsail containers, such as the current
  /// version of the Lightsail Control (lightsailctl) plugin.
  ///
  /// May throw [ServiceException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  Future<GetContainerAPIMetadataResult> getContainerAPIMetadata() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetContainerAPIMetadata'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetContainerAPIMetadataResult.fromJson(jsonResponse.body);
  }

  /// Returns the container images that are registered to your Amazon Lightsail
  /// container service.
  /// <note>
  /// If you created a deployment on your Lightsail container service that uses
  /// container images from a public registry like Docker Hub, those images are
  /// not returned as part of this action. Those images are not registered to
  /// your Lightsail container service.
  /// </note>
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [serviceName] :
  /// The name of the container service for which to return registered container
  /// images.
  Future<GetContainerImagesResult> getContainerImages({
    required String serviceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetContainerImages'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'serviceName': serviceName,
      },
    );

    return GetContainerImagesResult.fromJson(jsonResponse.body);
  }

  /// Returns the log events of a container of your Amazon Lightsail container
  /// service.
  ///
  /// If your container service has more than one node (i.e., a scale greater
  /// than 1), then the log events that are returned for the specified container
  /// are merged from all nodes on your container service.
  /// <note>
  /// Container logs are retained for a certain amount of time. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/lightsail.html">Amazon
  /// Lightsail endpoints and quotas</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  /// </note>
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [containerName] :
  /// The name of the container that is either running or previously ran on the
  /// container service for which to return a log.
  ///
  /// Parameter [serviceName] :
  /// The name of the container service for which to get a container log.
  ///
  /// Parameter [endTime] :
  /// The end of the time interval for which to get log data.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Specified in Coordinated Universal Time (UTC).
  /// </li>
  /// <li>
  /// Specified in the Unix time format.
  ///
  /// For example, if you wish to use an end time of October 1, 2018, at 9 PM
  /// UTC, specify <code>1538427600</code> as the end time.
  /// </li>
  /// </ul>
  /// You can convert a human-friendly time to Unix time format using a
  /// converter like <a href="https://www.epochconverter.com/">Epoch
  /// converter</a>.
  ///
  /// Parameter [filterPattern] :
  /// The pattern to use to filter the returned log events to a specific term.
  ///
  /// The following are a few examples of filter patterns that you can specify:
  ///
  /// <ul>
  /// <li>
  /// To return all log events, specify a filter pattern of <code>""</code>.
  /// </li>
  /// <li>
  /// To exclude log events that contain the <code>ERROR</code> term, and return
  /// all other log events, specify a filter pattern of <code>"-ERROR"</code>.
  /// </li>
  /// <li>
  /// To return log events that contain the <code>ERROR</code> term, specify a
  /// filter pattern of <code>"ERROR"</code>.
  /// </li>
  /// <li>
  /// To return log events that contain both the <code>ERROR</code> and
  /// <code>Exception</code> terms, specify a filter pattern of <code>"ERROR
  /// Exception"</code>.
  /// </li>
  /// <li>
  /// To return log events that contain the <code>ERROR</code> <i>or</i> the
  /// <code>Exception</code> term, specify a filter pattern of <code>"?ERROR
  /// ?Exception"</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetContainerLog</code>
  /// request. If your results are paginated, the response will return a next
  /// page token that you can specify as the page token in a subsequent request.
  ///
  /// Parameter [startTime] :
  /// The start of the time interval for which to get log data.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Specified in Coordinated Universal Time (UTC).
  /// </li>
  /// <li>
  /// Specified in the Unix time format.
  ///
  /// For example, if you wish to use a start time of October 1, 2018, at 8 PM
  /// UTC, specify <code>1538424000</code> as the start time.
  /// </li>
  /// </ul>
  /// You can convert a human-friendly time to Unix time format using a
  /// converter like <a href="https://www.epochconverter.com/">Epoch
  /// converter</a>.
  Future<GetContainerLogResult> getContainerLog({
    required String containerName,
    required String serviceName,
    DateTime? endTime,
    String? filterPattern,
    String? pageToken,
    DateTime? startTime,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetContainerLog'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'containerName': containerName,
        'serviceName': serviceName,
        if (endTime != null) 'endTime': unixTimestampToJson(endTime),
        if (filterPattern != null) 'filterPattern': filterPattern,
        if (pageToken != null) 'pageToken': pageToken,
        if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      },
    );

    return GetContainerLogResult.fromJson(jsonResponse.body);
  }

  /// Returns the deployments for your Amazon Lightsail container service
  ///
  /// A deployment specifies the settings, such as the ports and launch command,
  /// of containers that are deployed to your container service.
  ///
  /// The deployments are ordered by version in ascending order. The newest
  /// version is listed at the top of the response.
  /// <note>
  /// A set number of deployments are kept before the oldest one is replaced
  /// with the newest one. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/lightsail.html">Amazon
  /// Lightsail endpoints and quotas</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  /// </note>
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [serviceName] :
  /// The name of the container service for which to return deployments.
  Future<GetContainerServiceDeploymentsResult> getContainerServiceDeployments({
    required String serviceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetContainerServiceDeployments'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'serviceName': serviceName,
      },
    );

    return GetContainerServiceDeploymentsResult.fromJson(jsonResponse.body);
  }

  /// Returns the data points of a specific metric of your Amazon Lightsail
  /// container service.
  ///
  /// Metrics report the utilization of your resources. Monitor and collect
  /// metric data regularly to maintain the reliability, availability, and
  /// performance of your resources.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [endTime] :
  /// The end time of the time period.
  ///
  /// Parameter [metricName] :
  /// The metric for which you want to return information.
  ///
  /// Valid container service metric names are listed below, along with the most
  /// useful statistics to include in your request, and the published unit
  /// value.
  ///
  /// <ul>
  /// <li>
  /// <code>CPUUtilization</code> - The average percentage of compute units that
  /// are currently in use across all nodes of the container service. This
  /// metric identifies the processing power required to run containers on each
  /// node of the container service.
  ///
  /// Statistics: The most useful statistics are <code>Maximum</code> and
  /// <code>Average</code>.
  ///
  /// Unit: The published unit is <code>Percent</code>.
  /// </li>
  /// <li>
  /// <code>MemoryUtilization</code> - The average percentage of available
  /// memory that is currently in use across all nodes of the container service.
  /// This metric identifies the memory required to run containers on each node
  /// of the container service.
  ///
  /// Statistics: The most useful statistics are <code>Maximum</code> and
  /// <code>Average</code>.
  ///
  /// Unit: The published unit is <code>Percent</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [period] :
  /// The granularity, in seconds, of the returned data points.
  ///
  /// All container service metric data is available in 5-minute (300 seconds)
  /// granularity.
  ///
  /// Parameter [serviceName] :
  /// The name of the container service for which to get metric data.
  ///
  /// Parameter [startTime] :
  /// The start time of the time period.
  ///
  /// Parameter [statistics] :
  /// The statistic for the metric.
  ///
  /// The following statistics are available:
  ///
  /// <ul>
  /// <li>
  /// <code>Minimum</code> - The lowest value observed during the specified
  /// period. Use this value to determine low volumes of activity for your
  /// application.
  /// </li>
  /// <li>
  /// <code>Maximum</code> - The highest value observed during the specified
  /// period. Use this value to determine high volumes of activity for your
  /// application.
  /// </li>
  /// <li>
  /// <code>Sum</code> - All values submitted for the matching metric added
  /// together. You can use this statistic to determine the total volume of a
  /// metric.
  /// </li>
  /// <li>
  /// <code>Average</code> - The value of <code>Sum</code> /
  /// <code>SampleCount</code> during the specified period. By comparing this
  /// statistic with the <code>Minimum</code> and <code>Maximum</code> values,
  /// you can determine the full scope of a metric and how close the average use
  /// is to the <code>Minimum</code> and <code>Maximum</code> values. This
  /// comparison helps you to know when to increase or decrease your resources.
  /// </li>
  /// <li>
  /// <code>SampleCount</code> - The count, or number, of data points used for
  /// the statistical calculation.
  /// </li>
  /// </ul>
  Future<GetContainerServiceMetricDataResult> getContainerServiceMetricData({
    required DateTime endTime,
    required ContainerServiceMetricName metricName,
    required int period,
    required String serviceName,
    required DateTime startTime,
    required List<MetricStatistic> statistics,
  }) async {
    _s.validateNumRange(
      'period',
      period,
      60,
      86400,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetContainerServiceMetricData'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'endTime': unixTimestampToJson(endTime),
        'metricName': metricName.toValue(),
        'period': period,
        'serviceName': serviceName,
        'startTime': unixTimestampToJson(startTime),
        'statistics': statistics.map((e) => e.toValue()).toList(),
      },
    );

    return GetContainerServiceMetricDataResult.fromJson(jsonResponse.body);
  }

  /// Returns the list of powers that can be specified for your Amazon Lightsail
  /// container services.
  ///
  /// The power specifies the amount of memory, the number of vCPUs, and the
  /// base price of the container service.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  Future<GetContainerServicePowersResult> getContainerServicePowers() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetContainerServicePowers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetContainerServicePowersResult.fromJson(jsonResponse.body);
  }

  /// Returns information about one or more of your Amazon Lightsail container
  /// services.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [serviceName] :
  /// The name of the container service for which to return information.
  ///
  /// When omitted, the response includes all of your container services in the
  /// Amazon Web Services Region where the request is made.
  Future<ContainerServicesListResult> getContainerServices({
    String? serviceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetContainerServices'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (serviceName != null) 'serviceName': serviceName,
      },
    );

    return ContainerServicesListResult.fromJson(jsonResponse.body);
  }

  /// Retrieves information about the cost estimate for a specified resource. A
  /// cost estimate will not generate for a resource that has been deleted.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [ServiceException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [endTime] :
  /// The cost estimate end time.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Specified in Coordinated Universal Time (UTC).
  /// </li>
  /// <li>
  /// Specified in the Unix time format.
  ///
  /// For example, if you want to use an end time of October 1, 2018, at 9 PM
  /// UTC, specify <code>1538427600</code> as the end time.
  /// </li>
  /// </ul>
  /// You can convert a human-friendly time to Unix time format using a
  /// converter like <a href="https://www.epochconverter.com/">Epoch
  /// converter</a>.
  ///
  /// Parameter [resourceName] :
  /// The resource name.
  ///
  /// Parameter [startTime] :
  /// The cost estimate start time.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Specified in Coordinated Universal Time (UTC).
  /// </li>
  /// <li>
  /// Specified in the Unix time format.
  ///
  /// For example, if you want to use a start time of October 1, 2018, at 8 PM
  /// UTC, specify <code>1538424000</code> as the start time.
  /// </li>
  /// </ul>
  /// You can convert a human-friendly time to Unix time format using a
  /// converter like <a href="https://www.epochconverter.com/">Epoch
  /// converter</a>.
  Future<GetCostEstimateResult> getCostEstimate({
    required DateTime endTime,
    required String resourceName,
    required DateTime startTime,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetCostEstimate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'endTime': unixTimestampToJson(endTime),
        'resourceName': resourceName,
        'startTime': unixTimestampToJson(startTime),
      },
    );

    return GetCostEstimateResult.fromJson(jsonResponse.body);
  }

  /// Returns information about a specific block storage disk.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [diskName] :
  /// The name of the disk (<code>my-disk</code>).
  Future<GetDiskResult> getDisk({
    required String diskName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetDisk'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'diskName': diskName,
      },
    );

    return GetDiskResult.fromJson(jsonResponse.body);
  }

  /// Returns information about a specific block storage disk snapshot.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [diskSnapshotName] :
  /// The name of the disk snapshot (<code>my-disk-snapshot</code>).
  Future<GetDiskSnapshotResult> getDiskSnapshot({
    required String diskSnapshotName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetDiskSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'diskSnapshotName': diskSnapshotName,
      },
    );

    return GetDiskSnapshotResult.fromJson(jsonResponse.body);
  }

  /// Returns information about all block storage disk snapshots in your AWS
  /// account and region.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetDiskSnapshots</code>
  /// request. If your results are paginated, the response will return a next
  /// page token that you can specify as the page token in a subsequent request.
  Future<GetDiskSnapshotsResult> getDiskSnapshots({
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetDiskSnapshots'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetDiskSnapshotsResult.fromJson(jsonResponse.body);
  }

  /// Returns information about all block storage disks in your AWS account and
  /// region.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetDisks</code> request. If
  /// your results are paginated, the response will return a next page token
  /// that you can specify as the page token in a subsequent request.
  Future<GetDisksResult> getDisks({
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetDisks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetDisksResult.fromJson(jsonResponse.body);
  }

  /// Returns the bundles that can be applied to your Amazon Lightsail content
  /// delivery network (CDN) distributions.
  ///
  /// A distribution bundle specifies the monthly network transfer quota and
  /// monthly cost of your distribution.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  Future<GetDistributionBundlesResult> getDistributionBundles() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetDistributionBundles'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetDistributionBundlesResult.fromJson(jsonResponse.body);
  }

  /// Returns the timestamp and status of the last cache reset of a specific
  /// Amazon Lightsail content delivery network (CDN) distribution.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [distributionName] :
  /// The name of the distribution for which to return the timestamp of the last
  /// cache reset.
  ///
  /// Use the <code>GetDistributions</code> action to get a list of distribution
  /// names that you can specify.
  ///
  /// When omitted, the response includes the latest cache reset timestamp of
  /// all your distributions.
  Future<GetDistributionLatestCacheResetResult>
      getDistributionLatestCacheReset({
    String? distributionName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetDistributionLatestCacheReset'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (distributionName != null) 'distributionName': distributionName,
      },
    );

    return GetDistributionLatestCacheResetResult.fromJson(jsonResponse.body);
  }

  /// Returns the data points of a specific metric for an Amazon Lightsail
  /// content delivery network (CDN) distribution.
  ///
  /// Metrics report the utilization of your resources, and the error counts
  /// generated by them. Monitor and collect metric data regularly to maintain
  /// the reliability, availability, and performance of your resources.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [distributionName] :
  /// The name of the distribution for which to get metric data.
  ///
  /// Use the <code>GetDistributions</code> action to get a list of distribution
  /// names that you can specify.
  ///
  /// Parameter [endTime] :
  /// The end of the time interval for which to get metric data.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Specified in Coordinated Universal Time (UTC).
  /// </li>
  /// <li>
  /// Specified in the Unix time format.
  ///
  /// For example, if you wish to use an end time of October 1, 2018, at 9 PM
  /// UTC, specify <code>1538427600</code> as the end time.
  /// </li>
  /// </ul>
  /// You can convert a human-friendly time to Unix time format using a
  /// converter like <a href="https://www.epochconverter.com/">Epoch
  /// converter</a>.
  ///
  /// Parameter [metricName] :
  /// The metric for which you want to return information.
  ///
  /// Valid distribution metric names are listed below, along with the most
  /// useful <code>statistics</code> to include in your request, and the
  /// published <code>unit</code> value.
  ///
  /// <ul>
  /// <li>
  /// <b> <code>Requests</code> </b> - The total number of viewer requests
  /// received by your Lightsail distribution, for all HTTP methods, and for
  /// both HTTP and HTTPS requests.
  ///
  /// <code>Statistics</code>: The most useful statistic is <code>Sum</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>None</code>.
  /// </li>
  /// <li>
  /// <b> <code>BytesDownloaded</code> </b> - The number of bytes downloaded by
  /// viewers for GET, HEAD, and OPTIONS requests.
  ///
  /// <code>Statistics</code>: The most useful statistic is <code>Sum</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>None</code>.
  /// </li>
  /// <li>
  /// <b> <code>BytesUploaded </code> </b> - The number of bytes uploaded to
  /// your origin by your Lightsail distribution, using POST and PUT requests.
  ///
  /// <code>Statistics</code>: The most useful statistic is <code>Sum</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>None</code>.
  /// </li>
  /// <li>
  /// <b> <code>TotalErrorRate</code> </b> - The percentage of all viewer
  /// requests for which the response's HTTP status code was 4xx or 5xx.
  ///
  /// <code>Statistics</code>: The most useful statistic is
  /// <code>Average</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Percent</code>.
  /// </li>
  /// <li>
  /// <b> <code>4xxErrorRate</code> </b> - The percentage of all viewer requests
  /// for which the response's HTTP status cod was 4xx. In these cases, the
  /// client or client viewer may have made an error. For example, a status code
  /// of 404 (Not Found) means that the client requested an object that could
  /// not be found.
  ///
  /// <code>Statistics</code>: The most useful statistic is
  /// <code>Average</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Percent</code>.
  /// </li>
  /// <li>
  /// <b> <code>5xxErrorRate</code> </b> - The percentage of all viewer requests
  /// for which the response's HTTP status code was 5xx. In these cases, the
  /// origin server did not satisfy the requests. For example, a status code of
  /// 503 (Service Unavailable) means that the origin server is currently
  /// unavailable.
  ///
  /// <code>Statistics</code>: The most useful statistic is
  /// <code>Average</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Percent</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [period] :
  /// The granularity, in seconds, for the metric data points that will be
  /// returned.
  ///
  /// Parameter [startTime] :
  /// The start of the time interval for which to get metric data.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Specified in Coordinated Universal Time (UTC).
  /// </li>
  /// <li>
  /// Specified in the Unix time format.
  ///
  /// For example, if you wish to use a start time of October 1, 2018, at 8 PM
  /// UTC, specify <code>1538424000</code> as the start time.
  /// </li>
  /// </ul>
  /// You can convert a human-friendly time to Unix time format using a
  /// converter like <a href="https://www.epochconverter.com/">Epoch
  /// converter</a>.
  ///
  /// Parameter [statistics] :
  /// The statistic for the metric.
  ///
  /// The following statistics are available:
  ///
  /// <ul>
  /// <li>
  /// <code>Minimum</code> - The lowest value observed during the specified
  /// period. Use this value to determine low volumes of activity for your
  /// application.
  /// </li>
  /// <li>
  /// <code>Maximum</code> - The highest value observed during the specified
  /// period. Use this value to determine high volumes of activity for your
  /// application.
  /// </li>
  /// <li>
  /// <code>Sum</code> - All values submitted for the matching metric added
  /// together. You can use this statistic to determine the total volume of a
  /// metric.
  /// </li>
  /// <li>
  /// <code>Average</code> - The value of Sum / SampleCount during the specified
  /// period. By comparing this statistic with the Minimum and Maximum values,
  /// you can determine the full scope of a metric and how close the average use
  /// is to the Minimum and Maximum values. This comparison helps you to know
  /// when to increase or decrease your resources.
  /// </li>
  /// <li>
  /// <code>SampleCount</code> - The count, or number, of data points used for
  /// the statistical calculation.
  /// </li>
  /// </ul>
  ///
  /// Parameter [unit] :
  /// The unit for the metric data request.
  ///
  /// Valid units depend on the metric data being requested. For the valid units
  /// with each available metric, see the <code>metricName</code> parameter.
  Future<GetDistributionMetricDataResult> getDistributionMetricData({
    required String distributionName,
    required DateTime endTime,
    required DistributionMetricName metricName,
    required int period,
    required DateTime startTime,
    required List<MetricStatistic> statistics,
    required MetricUnit unit,
  }) async {
    _s.validateNumRange(
      'period',
      period,
      60,
      86400,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetDistributionMetricData'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'distributionName': distributionName,
        'endTime': unixTimestampToJson(endTime),
        'metricName': metricName.toValue(),
        'period': period,
        'startTime': unixTimestampToJson(startTime),
        'statistics': statistics.map((e) => e.toValue()).toList(),
        'unit': unit.toValue(),
      },
    );

    return GetDistributionMetricDataResult.fromJson(jsonResponse.body);
  }

  /// Returns information about one or more of your Amazon Lightsail content
  /// delivery network (CDN) distributions.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [distributionName] :
  /// The name of the distribution for which to return information.
  ///
  /// When omitted, the response includes all of your distributions in the
  /// Amazon Web Services Region where the request is made.
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetDistributions</code>
  /// request. If your results are paginated, the response will return a next
  /// page token that you can specify as the page token in a subsequent request.
  Future<GetDistributionsResult> getDistributions({
    String? distributionName,
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetDistributions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (distributionName != null) 'distributionName': distributionName,
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetDistributionsResult.fromJson(jsonResponse.body);
  }

  /// Returns information about a specific domain recordset.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [domainName] :
  /// The domain name for which your want to return information about.
  Future<GetDomainResult> getDomain({
    required String domainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domainName': domainName,
      },
    );

    return GetDomainResult.fromJson(jsonResponse.body);
  }

  /// Returns a list of all domains in the user's account.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetDomains</code> request.
  /// If your results are paginated, the response will return a next page token
  /// that you can specify as the page token in a subsequent request.
  Future<GetDomainsResult> getDomains({
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetDomains'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetDomainsResult.fromJson(jsonResponse.body);
  }

  /// Returns all export snapshot records created as a result of the
  /// <code>export snapshot</code> operation.
  ///
  /// An export snapshot record can be used to create a new Amazon EC2 instance
  /// and its related resources with the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateCloudFormationStack.html">CreateCloudFormationStack</a>
  /// action.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial
  /// <code>GetExportSnapshotRecords</code> request. If your results are
  /// paginated, the response will return a next page token that you can specify
  /// as the page token in a subsequent request.
  Future<GetExportSnapshotRecordsResult> getExportSnapshotRecords({
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetExportSnapshotRecords'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetExportSnapshotRecordsResult.fromJson(jsonResponse.body);
  }

  /// Returns information about a specific Amazon Lightsail instance, which is a
  /// virtual private server.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instanceName] :
  /// The name of the instance.
  Future<GetInstanceResult> getInstance({
    required String instanceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceName': instanceName,
      },
    );

    return GetInstanceResult.fromJson(jsonResponse.body);
  }

  /// Returns temporary SSH keys you can use to connect to a specific virtual
  /// private server, or <i>instance</i>.
  ///
  /// The <code>get instance access details</code> operation supports tag-based
  /// access control via resource tags applied to the resource identified by
  /// <code>instance name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instanceName] :
  /// The name of the instance to access.
  ///
  /// Parameter [protocol] :
  /// The protocol to use to connect to your instance. Defaults to
  /// <code>ssh</code>.
  Future<GetInstanceAccessDetailsResult> getInstanceAccessDetails({
    required String instanceName,
    InstanceAccessProtocol? protocol,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetInstanceAccessDetails'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceName': instanceName,
        if (protocol != null) 'protocol': protocol.toValue(),
      },
    );

    return GetInstanceAccessDetailsResult.fromJson(jsonResponse.body);
  }

  /// Returns the data points for the specified Amazon Lightsail instance
  /// metric, given an instance name.
  ///
  /// Metrics report the utilization of your resources, and the error counts
  /// generated by them. Monitor and collect metric data regularly to maintain
  /// the reliability, availability, and performance of your resources.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [endTime] :
  /// The end time of the time period.
  ///
  /// Parameter [instanceName] :
  /// The name of the instance for which you want to get metrics data.
  ///
  /// Parameter [metricName] :
  /// The metric for which you want to return information.
  ///
  /// Valid instance metric names are listed below, along with the most useful
  /// <code>statistics</code> to include in your request, and the published
  /// <code>unit</code> value.
  ///
  /// <ul>
  /// <li>
  /// <b> <code>BurstCapacityPercentage</code> </b> - The percentage of CPU
  /// performance available for your instance to burst above its baseline. Your
  /// instance continuously accrues and consumes burst capacity. Burst capacity
  /// stops accruing when your instance's <code>BurstCapacityPercentage</code>
  /// reaches 100%. For more information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-viewing-instance-burst-capacity">Viewing
  /// instance burst capacity in Amazon Lightsail</a>.
  ///
  /// <code>Statistics</code>: The most useful statistics are
  /// <code>Maximum</code> and <code>Average</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Percent</code>.
  /// </li>
  /// <li>
  /// <b> <code>BurstCapacityTime</code> </b> - The available amount of time for
  /// your instance to burst at 100% CPU utilization. Your instance continuously
  /// accrues and consumes burst capacity. Burst capacity time stops accruing
  /// when your instance's <code>BurstCapacityPercentage</code> metric reaches
  /// 100%.
  ///
  /// Burst capacity time is consumed at the full rate only when your instance
  /// operates at 100% CPU utilization. For example, if your instance operates
  /// at 50% CPU utilization in the burstable zone for a 5-minute period, then
  /// it consumes CPU burst capacity minutes at a 50% rate in that period. Your
  /// instance consumed 2 minutes and 30 seconds of CPU burst capacity minutes
  /// in the 5-minute period. For more information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-viewing-instance-burst-capacity">Viewing
  /// instance burst capacity in Amazon Lightsail</a>.
  ///
  /// <code>Statistics</code>: The most useful statistics are
  /// <code>Maximum</code> and <code>Average</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Seconds</code>.
  /// </li>
  /// <li>
  /// <b> <code>CPUUtilization</code> </b> - The percentage of allocated compute
  /// units that are currently in use on the instance. This metric identifies
  /// the processing power to run the applications on the instance. Tools in
  /// your operating system can show a lower percentage than Lightsail when the
  /// instance is not allocated a full processor core.
  ///
  /// <code>Statistics</code>: The most useful statistics are
  /// <code>Maximum</code> and <code>Average</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Percent</code>.
  /// </li>
  /// <li>
  /// <b> <code>NetworkIn</code> </b> - The number of bytes received on all
  /// network interfaces by the instance. This metric identifies the volume of
  /// incoming network traffic to the instance. The number reported is the
  /// number of bytes received during the period. Because this metric is
  /// reported in 5-minute intervals, divide the reported number by 300 to find
  /// Bytes/second.
  ///
  /// <code>Statistics</code>: The most useful statistic is <code>Sum</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Bytes</code>.
  /// </li>
  /// <li>
  /// <b> <code>NetworkOut</code> </b> - The number of bytes sent out on all
  /// network interfaces by the instance. This metric identifies the volume of
  /// outgoing network traffic from the instance. The number reported is the
  /// number of bytes sent during the period. Because this metric is reported in
  /// 5-minute intervals, divide the reported number by 300 to find
  /// Bytes/second.
  ///
  /// <code>Statistics</code>: The most useful statistic is <code>Sum</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Bytes</code>.
  /// </li>
  /// <li>
  /// <b> <code>StatusCheckFailed</code> </b> - Reports whether the instance
  /// passed or failed both the instance status check and the system status
  /// check. This metric can be either 0 (passed) or 1 (failed). This metric
  /// data is available in 1-minute (60 seconds) granularity.
  ///
  /// <code>Statistics</code>: The most useful statistic is <code>Sum</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Count</code>.
  /// </li>
  /// <li>
  /// <b> <code>StatusCheckFailed_Instance</code> </b> - Reports whether the
  /// instance passed or failed the instance status check. This metric can be
  /// either 0 (passed) or 1 (failed). This metric data is available in 1-minute
  /// (60 seconds) granularity.
  ///
  /// <code>Statistics</code>: The most useful statistic is <code>Sum</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Count</code>.
  /// </li>
  /// <li>
  /// <b> <code>StatusCheckFailed_System</code> </b> - Reports whether the
  /// instance passed or failed the system status check. This metric can be
  /// either 0 (passed) or 1 (failed). This metric data is available in 1-minute
  /// (60 seconds) granularity.
  ///
  /// <code>Statistics</code>: The most useful statistic is <code>Sum</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Count</code>.
  /// </li>
  /// <li>
  /// <b> <code>MetadataNoToken</code> </b> - Reports the number of times that
  /// the instance metadata service was successfully accessed without a token.
  /// This metric determines if there are any processes accessing instance
  /// metadata by using Instance Metadata Service Version 1, which doesn't use a
  /// token. If all requests use token-backed sessions, such as Instance
  /// Metadata Service Version 2, then the value is 0.
  ///
  /// <code>Statistics</code>: The most useful statistic is <code>Sum</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Count</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [period] :
  /// The granularity, in seconds, of the returned data points.
  ///
  /// The <code>StatusCheckFailed</code>,
  /// <code>StatusCheckFailed_Instance</code>, and
  /// <code>StatusCheckFailed_System</code> instance metric data is available in
  /// 1-minute (60 seconds) granularity. All other instance metric data is
  /// available in 5-minute (300 seconds) granularity.
  ///
  /// Parameter [startTime] :
  /// The start time of the time period.
  ///
  /// Parameter [statistics] :
  /// The statistic for the metric.
  ///
  /// The following statistics are available:
  ///
  /// <ul>
  /// <li>
  /// <code>Minimum</code> - The lowest value observed during the specified
  /// period. Use this value to determine low volumes of activity for your
  /// application.
  /// </li>
  /// <li>
  /// <code>Maximum</code> - The highest value observed during the specified
  /// period. Use this value to determine high volumes of activity for your
  /// application.
  /// </li>
  /// <li>
  /// <code>Sum</code> - All values submitted for the matching metric added
  /// together. You can use this statistic to determine the total volume of a
  /// metric.
  /// </li>
  /// <li>
  /// <code>Average</code> - The value of Sum / SampleCount during the specified
  /// period. By comparing this statistic with the Minimum and Maximum values,
  /// you can determine the full scope of a metric and how close the average use
  /// is to the Minimum and Maximum values. This comparison helps you to know
  /// when to increase or decrease your resources.
  /// </li>
  /// <li>
  /// <code>SampleCount</code> - The count, or number, of data points used for
  /// the statistical calculation.
  /// </li>
  /// </ul>
  ///
  /// Parameter [unit] :
  /// The unit for the metric data request. Valid units depend on the metric
  /// data being requested. For the valid units to specify with each available
  /// metric, see the <code>metricName</code> parameter.
  Future<GetInstanceMetricDataResult> getInstanceMetricData({
    required DateTime endTime,
    required String instanceName,
    required InstanceMetricName metricName,
    required int period,
    required DateTime startTime,
    required List<MetricStatistic> statistics,
    required MetricUnit unit,
  }) async {
    _s.validateNumRange(
      'period',
      period,
      60,
      86400,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetInstanceMetricData'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'endTime': unixTimestampToJson(endTime),
        'instanceName': instanceName,
        'metricName': metricName.toValue(),
        'period': period,
        'startTime': unixTimestampToJson(startTime),
        'statistics': statistics.map((e) => e.toValue()).toList(),
        'unit': unit.toValue(),
      },
    );

    return GetInstanceMetricDataResult.fromJson(jsonResponse.body);
  }

  /// Returns the firewall port states for a specific Amazon Lightsail instance,
  /// the IP addresses allowed to connect to the instance through the ports, and
  /// the protocol.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instanceName] :
  /// The name of the instance for which to return firewall port states.
  Future<GetInstancePortStatesResult> getInstancePortStates({
    required String instanceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetInstancePortStates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceName': instanceName,
      },
    );

    return GetInstancePortStatesResult.fromJson(jsonResponse.body);
  }

  /// Returns information about a specific instance snapshot.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instanceSnapshotName] :
  /// The name of the snapshot for which you are requesting information.
  Future<GetInstanceSnapshotResult> getInstanceSnapshot({
    required String instanceSnapshotName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetInstanceSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceSnapshotName': instanceSnapshotName,
      },
    );

    return GetInstanceSnapshotResult.fromJson(jsonResponse.body);
  }

  /// Returns all instance snapshots for the user's account.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetInstanceSnapshots</code>
  /// request. If your results are paginated, the response will return a next
  /// page token that you can specify as the page token in a subsequent request.
  Future<GetInstanceSnapshotsResult> getInstanceSnapshots({
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetInstanceSnapshots'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetInstanceSnapshotsResult.fromJson(jsonResponse.body);
  }

  /// Returns the state of a specific instance. Works on one instance at a time.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instanceName] :
  /// The name of the instance to get state information about.
  Future<GetInstanceStateResult> getInstanceState({
    required String instanceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetInstanceState'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceName': instanceName,
      },
    );

    return GetInstanceStateResult.fromJson(jsonResponse.body);
  }

  /// Returns information about all Amazon Lightsail virtual private servers, or
  /// <i>instances</i>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetInstances</code> request.
  /// If your results are paginated, the response will return a next page token
  /// that you can specify as the page token in a subsequent request.
  Future<GetInstancesResult> getInstances({
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetInstancesResult.fromJson(jsonResponse.body);
  }

  /// Returns information about a specific key pair.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [keyPairName] :
  /// The name of the key pair for which you are requesting information.
  Future<GetKeyPairResult> getKeyPair({
    required String keyPairName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetKeyPair'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'keyPairName': keyPairName,
      },
    );

    return GetKeyPairResult.fromJson(jsonResponse.body);
  }

  /// Returns information about all key pairs in the user's account.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [includeDefaultKeyPair] :
  /// A Boolean value that indicates whether to include the default key pair in
  /// the response of your request.
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetKeyPairs</code> request.
  /// If your results are paginated, the response will return a next page token
  /// that you can specify as the page token in a subsequent request.
  Future<GetKeyPairsResult> getKeyPairs({
    bool? includeDefaultKeyPair,
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetKeyPairs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (includeDefaultKeyPair != null)
          'includeDefaultKeyPair': includeDefaultKeyPair,
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetKeyPairsResult.fromJson(jsonResponse.body);
  }

  /// Returns information about the specified Lightsail load balancer.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  Future<GetLoadBalancerResult> getLoadBalancer({
    required String loadBalancerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetLoadBalancer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'loadBalancerName': loadBalancerName,
      },
    );

    return GetLoadBalancerResult.fromJson(jsonResponse.body);
  }

  /// Returns information about health metrics for your Lightsail load balancer.
  ///
  /// Metrics report the utilization of your resources, and the error counts
  /// generated by them. Monitor and collect metric data regularly to maintain
  /// the reliability, availability, and performance of your resources.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [endTime] :
  /// The end time of the period.
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer.
  ///
  /// Parameter [metricName] :
  /// The metric for which you want to return information.
  ///
  /// Valid load balancer metric names are listed below, along with the most
  /// useful <code>statistics</code> to include in your request, and the
  /// published <code>unit</code> value.
  ///
  /// <ul>
  /// <li>
  /// <b> <code>ClientTLSNegotiationErrorCount</code> </b> - The number of TLS
  /// connections initiated by the client that did not establish a session with
  /// the load balancer due to a TLS error generated by the load balancer.
  /// Possible causes include a mismatch of ciphers or protocols.
  ///
  /// <code>Statistics</code>: The most useful statistic is <code>Sum</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Count</code>.
  /// </li>
  /// <li>
  /// <b> <code>HealthyHostCount</code> </b> - The number of target instances
  /// that are considered healthy.
  ///
  /// <code>Statistics</code>: The most useful statistic are
  /// <code>Average</code>, <code>Minimum</code>, and <code>Maximum</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Count</code>.
  /// </li>
  /// <li>
  /// <b> <code>HTTPCode_Instance_2XX_Count</code> </b> - The number of HTTP 2XX
  /// response codes generated by the target instances. This does not include
  /// any response codes generated by the load balancer.
  ///
  /// <code>Statistics</code>: The most useful statistic is <code>Sum</code>.
  /// Note that <code>Minimum</code>, <code>Maximum</code>, and
  /// <code>Average</code> all return <code>1</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Count</code>.
  /// </li>
  /// <li>
  /// <b> <code>HTTPCode_Instance_3XX_Count</code> </b> - The number of HTTP 3XX
  /// response codes generated by the target instances. This does not include
  /// any response codes generated by the load balancer.
  ///
  /// <code>Statistics</code>: The most useful statistic is <code>Sum</code>.
  /// Note that <code>Minimum</code>, <code>Maximum</code>, and
  /// <code>Average</code> all return <code>1</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Count</code>.
  /// </li>
  /// <li>
  /// <b> <code>HTTPCode_Instance_4XX_Count</code> </b> - The number of HTTP 4XX
  /// response codes generated by the target instances. This does not include
  /// any response codes generated by the load balancer.
  ///
  /// <code>Statistics</code>: The most useful statistic is <code>Sum</code>.
  /// Note that <code>Minimum</code>, <code>Maximum</code>, and
  /// <code>Average</code> all return <code>1</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Count</code>.
  /// </li>
  /// <li>
  /// <b> <code>HTTPCode_Instance_5XX_Count</code> </b> - The number of HTTP 5XX
  /// response codes generated by the target instances. This does not include
  /// any response codes generated by the load balancer.
  ///
  /// <code>Statistics</code>: The most useful statistic is <code>Sum</code>.
  /// Note that <code>Minimum</code>, <code>Maximum</code>, and
  /// <code>Average</code> all return <code>1</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Count</code>.
  /// </li>
  /// <li>
  /// <b> <code>HTTPCode_LB_4XX_Count</code> </b> - The number of HTTP 4XX
  /// client error codes that originated from the load balancer. Client errors
  /// are generated when requests are malformed or incomplete. These requests
  /// were not received by the target instance. This count does not include
  /// response codes generated by the target instances.
  ///
  /// <code>Statistics</code>: The most useful statistic is <code>Sum</code>.
  /// Note that <code>Minimum</code>, <code>Maximum</code>, and
  /// <code>Average</code> all return <code>1</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Count</code>.
  /// </li>
  /// <li>
  /// <b> <code>HTTPCode_LB_5XX_Count</code> </b> - The number of HTTP 5XX
  /// server error codes that originated from the load balancer. This does not
  /// include any response codes generated by the target instance. This metric
  /// is reported if there are no healthy instances attached to the load
  /// balancer, or if the request rate exceeds the capacity of the instances
  /// (spillover) or the load balancer.
  ///
  /// <code>Statistics</code>: The most useful statistic is <code>Sum</code>.
  /// Note that <code>Minimum</code>, <code>Maximum</code>, and
  /// <code>Average</code> all return <code>1</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Count</code>.
  /// </li>
  /// <li>
  /// <b> <code>InstanceResponseTime</code> </b> - The time elapsed, in seconds,
  /// after the request leaves the load balancer until a response from the
  /// target instance is received.
  ///
  /// <code>Statistics</code>: The most useful statistic is
  /// <code>Average</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Seconds</code>.
  /// </li>
  /// <li>
  /// <b> <code>RejectedConnectionCount</code> </b> - The number of connections
  /// that were rejected because the load balancer had reached its maximum
  /// number of connections.
  ///
  /// <code>Statistics</code>: The most useful statistic is <code>Sum</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Count</code>.
  /// </li>
  /// <li>
  /// <b> <code>RequestCount</code> </b> - The number of requests processed over
  /// IPv4. This count includes only the requests with a response generated by a
  /// target instance of the load balancer.
  ///
  /// <code>Statistics</code>: The most useful statistic is <code>Sum</code>.
  /// Note that <code>Minimum</code>, <code>Maximum</code>, and
  /// <code>Average</code> all return <code>1</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Count</code>.
  /// </li>
  /// <li>
  /// <b> <code>UnhealthyHostCount</code> </b> - The number of target instances
  /// that are considered unhealthy.
  ///
  /// <code>Statistics</code>: The most useful statistic are
  /// <code>Average</code>, <code>Minimum</code>, and <code>Maximum</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Count</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [period] :
  /// The granularity, in seconds, of the returned data points.
  ///
  /// Parameter [startTime] :
  /// The start time of the period.
  ///
  /// Parameter [statistics] :
  /// The statistic for the metric.
  ///
  /// The following statistics are available:
  ///
  /// <ul>
  /// <li>
  /// <code>Minimum</code> - The lowest value observed during the specified
  /// period. Use this value to determine low volumes of activity for your
  /// application.
  /// </li>
  /// <li>
  /// <code>Maximum</code> - The highest value observed during the specified
  /// period. Use this value to determine high volumes of activity for your
  /// application.
  /// </li>
  /// <li>
  /// <code>Sum</code> - All values submitted for the matching metric added
  /// together. You can use this statistic to determine the total volume of a
  /// metric.
  /// </li>
  /// <li>
  /// <code>Average</code> - The value of Sum / SampleCount during the specified
  /// period. By comparing this statistic with the Minimum and Maximum values,
  /// you can determine the full scope of a metric and how close the average use
  /// is to the Minimum and Maximum values. This comparison helps you to know
  /// when to increase or decrease your resources.
  /// </li>
  /// <li>
  /// <code>SampleCount</code> - The count, or number, of data points used for
  /// the statistical calculation.
  /// </li>
  /// </ul>
  ///
  /// Parameter [unit] :
  /// The unit for the metric data request. Valid units depend on the metric
  /// data being requested. For the valid units with each available metric, see
  /// the <code>metricName</code> parameter.
  Future<GetLoadBalancerMetricDataResult> getLoadBalancerMetricData({
    required DateTime endTime,
    required String loadBalancerName,
    required LoadBalancerMetricName metricName,
    required int period,
    required DateTime startTime,
    required List<MetricStatistic> statistics,
    required MetricUnit unit,
  }) async {
    _s.validateNumRange(
      'period',
      period,
      60,
      86400,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetLoadBalancerMetricData'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'endTime': unixTimestampToJson(endTime),
        'loadBalancerName': loadBalancerName,
        'metricName': metricName.toValue(),
        'period': period,
        'startTime': unixTimestampToJson(startTime),
        'statistics': statistics.map((e) => e.toValue()).toList(),
        'unit': unit.toValue(),
      },
    );

    return GetLoadBalancerMetricDataResult.fromJson(jsonResponse.body);
  }

  /// Returns information about the TLS certificates that are associated with
  /// the specified Lightsail load balancer.
  ///
  /// TLS is just an updated, more secure version of Secure Socket Layer (SSL).
  ///
  /// You can have a maximum of 2 certificates associated with a Lightsail load
  /// balancer. One is active and the other is inactive.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer you associated with your SSL/TLS
  /// certificate.
  Future<GetLoadBalancerTlsCertificatesResult> getLoadBalancerTlsCertificates({
    required String loadBalancerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetLoadBalancerTlsCertificates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'loadBalancerName': loadBalancerName,
      },
    );

    return GetLoadBalancerTlsCertificatesResult.fromJson(jsonResponse.body);
  }

  /// Returns a list of TLS security policies that you can apply to Lightsail
  /// load balancers.
  ///
  /// For more information about load balancer TLS security policies, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configure-load-balancer-tls-security-policy">Configuring
  /// TLS security policies on your Amazon Lightsail load balancers</a> in the
  /// <i>Amazon Lightsail Developer Guide</i>.
  ///
  /// May throw [ServiceException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial
  /// <code>GetLoadBalancerTlsPolicies</code> request. If your results are
  /// paginated, the response will return a next page token that you can specify
  /// as the page token in a subsequent request.
  Future<GetLoadBalancerTlsPoliciesResult> getLoadBalancerTlsPolicies({
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetLoadBalancerTlsPolicies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetLoadBalancerTlsPoliciesResult.fromJson(jsonResponse.body);
  }

  /// Returns information about all load balancers in an account.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetLoadBalancers</code>
  /// request. If your results are paginated, the response will return a next
  /// page token that you can specify as the page token in a subsequent request.
  Future<GetLoadBalancersResult> getLoadBalancers({
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetLoadBalancers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetLoadBalancersResult.fromJson(jsonResponse.body);
  }

  /// Returns information about a specific operation. Operations include events
  /// such as when you create an instance, allocate a static IP, attach a static
  /// IP, and so on.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [operationId] :
  /// A GUID used to identify the operation.
  Future<GetOperationResult> getOperation({
    required String operationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetOperation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'operationId': operationId,
      },
    );

    return GetOperationResult.fromJson(jsonResponse.body);
  }

  /// Returns information about all operations.
  ///
  /// Results are returned from oldest to newest, up to a maximum of 200.
  /// Results can be paged by making each subsequent call to
  /// <code>GetOperations</code> use the maximum (last)
  /// <code>statusChangedAt</code> value from the previous request.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetOperations</code>
  /// request. If your results are paginated, the response will return a next
  /// page token that you can specify as the page token in a subsequent request.
  Future<GetOperationsResult> getOperations({
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetOperations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetOperationsResult.fromJson(jsonResponse.body);
  }

  /// Gets operations for a specific resource (an instance or a static IP).
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [resourceName] :
  /// The name of the resource for which you are requesting information.
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial
  /// <code>GetOperationsForResource</code> request. If your results are
  /// paginated, the response will return a next page token that you can specify
  /// as the page token in a subsequent request.
  Future<GetOperationsForResourceResult> getOperationsForResource({
    required String resourceName,
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetOperationsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceName': resourceName,
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetOperationsForResourceResult.fromJson(jsonResponse.body);
  }

  /// Returns a list of all valid regions for Amazon Lightsail. Use the
  /// <code>include availability zones</code> parameter to also return the
  /// Availability Zones in a region.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [includeAvailabilityZones] :
  /// A Boolean value indicating whether to also include Availability Zones in
  /// your get regions request. Availability Zones are indicated with a letter:
  /// <code>us-east-2a</code>.
  ///
  /// Parameter [includeRelationalDatabaseAvailabilityZones] :
  /// A Boolean value indicating whether to also include Availability Zones for
  /// databases in your get regions request. Availability Zones are indicated
  /// with a letter (<code>us-east-2a</code>).
  Future<GetRegionsResult> getRegions({
    bool? includeAvailabilityZones,
    bool? includeRelationalDatabaseAvailabilityZones,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetRegions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (includeAvailabilityZones != null)
          'includeAvailabilityZones': includeAvailabilityZones,
        if (includeRelationalDatabaseAvailabilityZones != null)
          'includeRelationalDatabaseAvailabilityZones':
              includeRelationalDatabaseAvailabilityZones,
      },
    );

    return GetRegionsResult.fromJson(jsonResponse.body);
  }

  /// Returns information about a specific database in Amazon Lightsail.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [relationalDatabaseName] :
  /// The name of the database that you are looking up.
  Future<GetRelationalDatabaseResult> getRelationalDatabase({
    required String relationalDatabaseName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetRelationalDatabase'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'relationalDatabaseName': relationalDatabaseName,
      },
    );

    return GetRelationalDatabaseResult.fromJson(jsonResponse.body);
  }

  /// Returns a list of available database blueprints in Amazon Lightsail. A
  /// blueprint describes the major engine version of a database.
  ///
  /// You can use a blueprint ID to create a new database that runs a specific
  /// database engine.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial
  /// <code>GetRelationalDatabaseBlueprints</code> request. If your results are
  /// paginated, the response will return a next page token that you can specify
  /// as the page token in a subsequent request.
  Future<GetRelationalDatabaseBlueprintsResult>
      getRelationalDatabaseBlueprints({
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetRelationalDatabaseBlueprints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetRelationalDatabaseBlueprintsResult.fromJson(jsonResponse.body);
  }

  /// Returns the list of bundles that are available in Amazon Lightsail. A
  /// bundle describes the performance specifications for a database.
  ///
  /// You can use a bundle ID to create a new database with explicit performance
  /// specifications.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [includeInactive] :
  /// A Boolean value that indicates whether to include inactive (unavailable)
  /// bundles in the response of your request.
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial
  /// <code>GetRelationalDatabaseBundles</code> request. If your results are
  /// paginated, the response will return a next page token that you can specify
  /// as the page token in a subsequent request.
  Future<GetRelationalDatabaseBundlesResult> getRelationalDatabaseBundles({
    bool? includeInactive,
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetRelationalDatabaseBundles'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (includeInactive != null) 'includeInactive': includeInactive,
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetRelationalDatabaseBundlesResult.fromJson(jsonResponse.body);
  }

  /// Returns a list of events for a specific database in Amazon Lightsail.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [relationalDatabaseName] :
  /// The name of the database from which to get events.
  ///
  /// Parameter [durationInMinutes] :
  /// The number of minutes in the past from which to retrieve events. For
  /// example, to get all events from the past 2 hours, enter 120.
  ///
  /// Default: <code>60</code>
  ///
  /// The minimum is 1 and the maximum is 14 days (20160 minutes).
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial
  /// <code>GetRelationalDatabaseEvents</code> request. If your results are
  /// paginated, the response will return a next page token that you can specify
  /// as the page token in a subsequent request.
  Future<GetRelationalDatabaseEventsResult> getRelationalDatabaseEvents({
    required String relationalDatabaseName,
    int? durationInMinutes,
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetRelationalDatabaseEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'relationalDatabaseName': relationalDatabaseName,
        if (durationInMinutes != null) 'durationInMinutes': durationInMinutes,
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetRelationalDatabaseEventsResult.fromJson(jsonResponse.body);
  }

  /// Returns a list of log events for a database in Amazon Lightsail.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [logStreamName] :
  /// The name of the log stream.
  ///
  /// Use the <code>get relational database log streams</code> operation to get
  /// a list of available log streams.
  ///
  /// Parameter [relationalDatabaseName] :
  /// The name of your database for which to get log events.
  ///
  /// Parameter [endTime] :
  /// The end of the time interval from which to get log events.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Specified in Coordinated Universal Time (UTC).
  /// </li>
  /// <li>
  /// Specified in the Unix time format.
  ///
  /// For example, if you wish to use an end time of October 1, 2018, at 8 PM
  /// UTC, then you input <code>1538424000</code> as the end time.
  /// </li>
  /// </ul>
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next or previous page of results from your
  /// request.
  ///
  /// To get a page token, perform an initial
  /// <code>GetRelationalDatabaseLogEvents</code> request. If your results are
  /// paginated, the response will return a next forward token and/or next
  /// backward token that you can specify as the page token in a subsequent
  /// request.
  ///
  /// Parameter [startFromHead] :
  /// Parameter to specify if the log should start from head or tail. If
  /// <code>true</code> is specified, the log event starts from the head of the
  /// log. If <code>false</code> is specified, the log event starts from the
  /// tail of the log.
  /// <note>
  /// For PostgreSQL, the default value of <code>false</code> is the only option
  /// available.
  /// </note>
  ///
  /// Parameter [startTime] :
  /// The start of the time interval from which to get log events.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Specified in Coordinated Universal Time (UTC).
  /// </li>
  /// <li>
  /// Specified in the Unix time format.
  ///
  /// For example, if you wish to use a start time of October 1, 2018, at 8 PM
  /// UTC, then you input <code>1538424000</code> as the start time.
  /// </li>
  /// </ul>
  Future<GetRelationalDatabaseLogEventsResult> getRelationalDatabaseLogEvents({
    required String logStreamName,
    required String relationalDatabaseName,
    DateTime? endTime,
    String? pageToken,
    bool? startFromHead,
    DateTime? startTime,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetRelationalDatabaseLogEvents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'logStreamName': logStreamName,
        'relationalDatabaseName': relationalDatabaseName,
        if (endTime != null) 'endTime': unixTimestampToJson(endTime),
        if (pageToken != null) 'pageToken': pageToken,
        if (startFromHead != null) 'startFromHead': startFromHead,
        if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      },
    );

    return GetRelationalDatabaseLogEventsResult.fromJson(jsonResponse.body);
  }

  /// Returns a list of available log streams for a specific database in Amazon
  /// Lightsail.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [relationalDatabaseName] :
  /// The name of your database for which to get log streams.
  Future<GetRelationalDatabaseLogStreamsResult>
      getRelationalDatabaseLogStreams({
    required String relationalDatabaseName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetRelationalDatabaseLogStreams'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'relationalDatabaseName': relationalDatabaseName,
      },
    );

    return GetRelationalDatabaseLogStreamsResult.fromJson(jsonResponse.body);
  }

  /// Returns the current, previous, or pending versions of the master user
  /// password for a Lightsail database.
  ///
  /// The <code>GetRelationalDatabaseMasterUserPassword</code> operation
  /// supports tag-based access control via resource tags applied to the
  /// resource identified by relationalDatabaseName.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [relationalDatabaseName] :
  /// The name of your database for which to get the master user password.
  ///
  /// Parameter [passwordVersion] :
  /// The password version to return.
  ///
  /// Specifying <code>CURRENT</code> or <code>PREVIOUS</code> returns the
  /// current or previous passwords respectively. Specifying
  /// <code>PENDING</code> returns the newest version of the password that will
  /// rotate to <code>CURRENT</code>. After the <code>PENDING</code> password
  /// rotates to <code>CURRENT</code>, the <code>PENDING</code> password is no
  /// longer available.
  ///
  /// Default: <code>CURRENT</code>
  Future<GetRelationalDatabaseMasterUserPasswordResult>
      getRelationalDatabaseMasterUserPassword({
    required String relationalDatabaseName,
    RelationalDatabasePasswordVersion? passwordVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'Lightsail_20161128.GetRelationalDatabaseMasterUserPassword'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'relationalDatabaseName': relationalDatabaseName,
        if (passwordVersion != null)
          'passwordVersion': passwordVersion.toValue(),
      },
    );

    return GetRelationalDatabaseMasterUserPasswordResult.fromJson(
        jsonResponse.body);
  }

  /// Returns the data points of the specified metric for a database in Amazon
  /// Lightsail.
  ///
  /// Metrics report the utilization of your resources, and the error counts
  /// generated by them. Monitor and collect metric data regularly to maintain
  /// the reliability, availability, and performance of your resources.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [endTime] :
  /// The end of the time interval from which to get metric data.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Specified in Coordinated Universal Time (UTC).
  /// </li>
  /// <li>
  /// Specified in the Unix time format.
  ///
  /// For example, if you wish to use an end time of October 1, 2018, at 8 PM
  /// UTC, then you input <code>1538424000</code> as the end time.
  /// </li>
  /// </ul>
  ///
  /// Parameter [metricName] :
  /// The metric for which you want to return information.
  ///
  /// Valid relational database metric names are listed below, along with the
  /// most useful <code>statistics</code> to include in your request, and the
  /// published <code>unit</code> value. All relational database metric data is
  /// available in 1-minute (60 seconds) granularity.
  ///
  /// <ul>
  /// <li>
  /// <b> <code>CPUUtilization</code> </b> - The percentage of CPU utilization
  /// currently in use on the database.
  ///
  /// <code>Statistics</code>: The most useful statistics are
  /// <code>Maximum</code> and <code>Average</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Percent</code>.
  /// </li>
  /// <li>
  /// <b> <code>DatabaseConnections</code> </b> - The number of database
  /// connections in use.
  ///
  /// <code>Statistics</code>: The most useful statistics are
  /// <code>Maximum</code> and <code>Sum</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Count</code>.
  /// </li>
  /// <li>
  /// <b> <code>DiskQueueDepth</code> </b> - The number of outstanding IOs
  /// (read/write requests) that are waiting to access the disk.
  ///
  /// <code>Statistics</code>: The most useful statistic is <code>Sum</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Count</code>.
  /// </li>
  /// <li>
  /// <b> <code>FreeStorageSpace</code> </b> - The amount of available storage
  /// space.
  ///
  /// <code>Statistics</code>: The most useful statistic is <code>Sum</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Bytes</code>.
  /// </li>
  /// <li>
  /// <b> <code>NetworkReceiveThroughput</code> </b> - The incoming (Receive)
  /// network traffic on the database, including both customer database traffic
  /// and AWS traffic used for monitoring and replication.
  ///
  /// <code>Statistics</code>: The most useful statistic is
  /// <code>Average</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Bytes/Second</code>.
  /// </li>
  /// <li>
  /// <b> <code>NetworkTransmitThroughput</code> </b> - The outgoing (Transmit)
  /// network traffic on the database, including both customer database traffic
  /// and AWS traffic used for monitoring and replication.
  ///
  /// <code>Statistics</code>: The most useful statistic is
  /// <code>Average</code>.
  ///
  /// <code>Unit</code>: The published unit is <code>Bytes/Second</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [period] :
  /// The granularity, in seconds, of the returned data points.
  ///
  /// All relational database metric data is available in 1-minute (60 seconds)
  /// granularity.
  ///
  /// Parameter [relationalDatabaseName] :
  /// The name of your database from which to get metric data.
  ///
  /// Parameter [startTime] :
  /// The start of the time interval from which to get metric data.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Specified in Coordinated Universal Time (UTC).
  /// </li>
  /// <li>
  /// Specified in the Unix time format.
  ///
  /// For example, if you wish to use a start time of October 1, 2018, at 8 PM
  /// UTC, then you input <code>1538424000</code> as the start time.
  /// </li>
  /// </ul>
  ///
  /// Parameter [statistics] :
  /// The statistic for the metric.
  ///
  /// The following statistics are available:
  ///
  /// <ul>
  /// <li>
  /// <code>Minimum</code> - The lowest value observed during the specified
  /// period. Use this value to determine low volumes of activity for your
  /// application.
  /// </li>
  /// <li>
  /// <code>Maximum</code> - The highest value observed during the specified
  /// period. Use this value to determine high volumes of activity for your
  /// application.
  /// </li>
  /// <li>
  /// <code>Sum</code> - All values submitted for the matching metric added
  /// together. You can use this statistic to determine the total volume of a
  /// metric.
  /// </li>
  /// <li>
  /// <code>Average</code> - The value of Sum / SampleCount during the specified
  /// period. By comparing this statistic with the Minimum and Maximum values,
  /// you can determine the full scope of a metric and how close the average use
  /// is to the Minimum and Maximum values. This comparison helps you to know
  /// when to increase or decrease your resources.
  /// </li>
  /// <li>
  /// <code>SampleCount</code> - The count, or number, of data points used for
  /// the statistical calculation.
  /// </li>
  /// </ul>
  ///
  /// Parameter [unit] :
  /// The unit for the metric data request. Valid units depend on the metric
  /// data being requested. For the valid units with each available metric, see
  /// the <code>metricName</code> parameter.
  Future<GetRelationalDatabaseMetricDataResult>
      getRelationalDatabaseMetricData({
    required DateTime endTime,
    required RelationalDatabaseMetricName metricName,
    required int period,
    required String relationalDatabaseName,
    required DateTime startTime,
    required List<MetricStatistic> statistics,
    required MetricUnit unit,
  }) async {
    _s.validateNumRange(
      'period',
      period,
      60,
      86400,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetRelationalDatabaseMetricData'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'endTime': unixTimestampToJson(endTime),
        'metricName': metricName.toValue(),
        'period': period,
        'relationalDatabaseName': relationalDatabaseName,
        'startTime': unixTimestampToJson(startTime),
        'statistics': statistics.map((e) => e.toValue()).toList(),
        'unit': unit.toValue(),
      },
    );

    return GetRelationalDatabaseMetricDataResult.fromJson(jsonResponse.body);
  }

  /// Returns all of the runtime parameters offered by the underlying database
  /// software, or engine, for a specific database in Amazon Lightsail.
  ///
  /// In addition to the parameter names and values, this operation returns
  /// other information about each parameter. This information includes whether
  /// changes require a reboot, whether the parameter is modifiable, the allowed
  /// values, and the data types.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [relationalDatabaseName] :
  /// The name of your database for which to get parameters.
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial
  /// <code>GetRelationalDatabaseParameters</code> request. If your results are
  /// paginated, the response will return a next page token that you can specify
  /// as the page token in a subsequent request.
  Future<GetRelationalDatabaseParametersResult>
      getRelationalDatabaseParameters({
    required String relationalDatabaseName,
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetRelationalDatabaseParameters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'relationalDatabaseName': relationalDatabaseName,
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetRelationalDatabaseParametersResult.fromJson(jsonResponse.body);
  }

  /// Returns information about a specific database snapshot in Amazon
  /// Lightsail.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [relationalDatabaseSnapshotName] :
  /// The name of the database snapshot for which to get information.
  Future<GetRelationalDatabaseSnapshotResult> getRelationalDatabaseSnapshot({
    required String relationalDatabaseSnapshotName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetRelationalDatabaseSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'relationalDatabaseSnapshotName': relationalDatabaseSnapshotName,
      },
    );

    return GetRelationalDatabaseSnapshotResult.fromJson(jsonResponse.body);
  }

  /// Returns information about all of your database snapshots in Amazon
  /// Lightsail.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial
  /// <code>GetRelationalDatabaseSnapshots</code> request. If your results are
  /// paginated, the response will return a next page token that you can specify
  /// as the page token in a subsequent request.
  Future<GetRelationalDatabaseSnapshotsResult> getRelationalDatabaseSnapshots({
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetRelationalDatabaseSnapshots'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetRelationalDatabaseSnapshotsResult.fromJson(jsonResponse.body);
  }

  /// Returns information about all of your databases in Amazon Lightsail.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial
  /// <code>GetRelationalDatabases</code> request. If your results are
  /// paginated, the response will return a next page token that you can specify
  /// as the page token in a subsequent request.
  Future<GetRelationalDatabasesResult> getRelationalDatabases({
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetRelationalDatabases'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetRelationalDatabasesResult.fromJson(jsonResponse.body);
  }

  /// Returns detailed information for five of the most recent
  /// <code>SetupInstanceHttps</code> requests that were ran on the target
  /// instance.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [ServiceException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [resourceName] :
  /// The name of the resource for which you are requesting information.
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetSetupHistory</code>
  /// request. If your results are paginated, the response will return a next
  /// page token that you can specify as the page token in a subsequent request.
  Future<GetSetupHistoryResult> getSetupHistory({
    required String resourceName,
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetSetupHistory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceName': resourceName,
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetSetupHistoryResult.fromJson(jsonResponse.body);
  }

  /// Returns information about an Amazon Lightsail static IP.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [staticIpName] :
  /// The name of the static IP in Lightsail.
  Future<GetStaticIpResult> getStaticIp({
    required String staticIpName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetStaticIp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'staticIpName': staticIpName,
      },
    );

    return GetStaticIpResult.fromJson(jsonResponse.body);
  }

  /// Returns information about all static IPs in the user's account.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetStaticIps</code> request.
  /// If your results are paginated, the response will return a next page token
  /// that you can specify as the page token in a subsequent request.
  Future<GetStaticIpsResult> getStaticIps({
    String? pageToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.GetStaticIps'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetStaticIpsResult.fromJson(jsonResponse.body);
  }

  /// Imports a public SSH key from a specific key pair.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [keyPairName] :
  /// The name of the key pair for which you want to import the public key.
  ///
  /// Parameter [publicKeyBase64] :
  /// A base64-encoded public key of the <code>ssh-rsa</code> type.
  Future<ImportKeyPairResult> importKeyPair({
    required String keyPairName,
    required String publicKeyBase64,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.ImportKeyPair'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'keyPairName': keyPairName,
        'publicKeyBase64': publicKeyBase64,
      },
    );

    return ImportKeyPairResult.fromJson(jsonResponse.body);
  }

  /// Returns a Boolean value indicating whether your Lightsail VPC is peered.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  Future<IsVpcPeeredResult> isVpcPeered() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.IsVpcPeered'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return IsVpcPeeredResult.fromJson(jsonResponse.body);
  }

  /// Opens ports for a specific Amazon Lightsail instance, and specifies the IP
  /// addresses allowed to connect to the instance through the ports, and the
  /// protocol.
  ///
  /// The <code>OpenInstancePublicPorts</code> action supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// <code>instanceName</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instanceName] :
  /// The name of the instance for which to open ports.
  ///
  /// Parameter [portInfo] :
  /// An object to describe the ports to open for the specified instance.
  Future<OpenInstancePublicPortsResult> openInstancePublicPorts({
    required String instanceName,
    required PortInfo portInfo,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.OpenInstancePublicPorts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceName': instanceName,
        'portInfo': portInfo,
      },
    );

    return OpenInstancePublicPortsResult.fromJson(jsonResponse.body);
  }

  /// Peers the Lightsail VPC with the user's default VPC.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  Future<PeerVpcResult> peerVpc() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.PeerVpc'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return PeerVpcResult.fromJson(jsonResponse.body);
  }

  /// Creates or updates an alarm, and associates it with the specified metric.
  ///
  /// An alarm is used to monitor a single metric for one of your resources.
  /// When a metric condition is met, the alarm can notify you by email, SMS
  /// text message, and a banner displayed on the Amazon Lightsail console. For
  /// more information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms
  /// in Amazon Lightsail</a>.
  ///
  /// When this action creates an alarm, the alarm state is immediately set to
  /// <code>INSUFFICIENT_DATA</code>. The alarm is then evaluated and its state
  /// is set appropriately. Any actions associated with the new state are then
  /// executed.
  ///
  /// When you update an existing alarm, its state is left unchanged, but the
  /// update completely overwrites the previous configuration of the alarm. The
  /// alarm is then evaluated with the updated configuration.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [alarmName] :
  /// The name for the alarm. Specify the name of an existing alarm to update,
  /// and overwrite the previous configuration of the alarm.
  ///
  /// Parameter [comparisonOperator] :
  /// The arithmetic operation to use when comparing the specified statistic to
  /// the threshold. The specified statistic value is used as the first operand.
  ///
  /// Parameter [evaluationPeriods] :
  /// The number of most recent periods over which data is compared to the
  /// specified threshold. If you are setting an "M out of N" alarm, this value
  /// (<code>evaluationPeriods</code>) is the N.
  ///
  /// If you are setting an alarm that requires that a number of consecutive
  /// data points be breaching to trigger the alarm, this value specifies the
  /// rolling period of time in which data points are evaluated.
  ///
  /// Each evaluation period is five minutes long. For example, specify an
  /// evaluation period of 24 to evaluate a metric over a rolling period of two
  /// hours.
  ///
  /// You can specify a minimum valuation period of 1 (5 minutes), and a maximum
  /// evaluation period of 288 (24 hours).
  ///
  /// Parameter [metricName] :
  /// The name of the metric to associate with the alarm.
  ///
  /// You can configure up to two alarms per metric.
  ///
  /// The following metrics are available for each resource type:
  ///
  /// <ul>
  /// <li>
  /// <b>Instances</b>: <code>BurstCapacityPercentage</code>,
  /// <code>BurstCapacityTime</code>, <code>CPUUtilization</code>,
  /// <code>NetworkIn</code>, <code>NetworkOut</code>,
  /// <code>StatusCheckFailed</code>, <code>StatusCheckFailed_Instance</code>,
  /// and <code>StatusCheckFailed_System</code>.
  /// </li>
  /// <li>
  /// <b>Load balancers</b>: <code>ClientTLSNegotiationErrorCount</code>,
  /// <code>HealthyHostCount</code>, <code>UnhealthyHostCount</code>,
  /// <code>HTTPCode_LB_4XX_Count</code>, <code>HTTPCode_LB_5XX_Count</code>,
  /// <code>HTTPCode_Instance_2XX_Count</code>,
  /// <code>HTTPCode_Instance_3XX_Count</code>,
  /// <code>HTTPCode_Instance_4XX_Count</code>,
  /// <code>HTTPCode_Instance_5XX_Count</code>,
  /// <code>InstanceResponseTime</code>, <code>RejectedConnectionCount</code>,
  /// and <code>RequestCount</code>.
  /// </li>
  /// <li>
  /// <b>Relational databases</b>: <code>CPUUtilization</code>,
  /// <code>DatabaseConnections</code>, <code>DiskQueueDepth</code>,
  /// <code>FreeStorageSpace</code>, <code>NetworkReceiveThroughput</code>, and
  /// <code>NetworkTransmitThroughput</code>.
  /// </li>
  /// </ul>
  /// For more information about these metrics, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-resource-health-metrics#available-metrics">Metrics
  /// available in Lightsail</a>.
  ///
  /// Parameter [monitoredResourceName] :
  /// The name of the Lightsail resource that will be monitored.
  ///
  /// Instances, load balancers, and relational databases are the only Lightsail
  /// resources that can currently be monitored by alarms.
  ///
  /// Parameter [threshold] :
  /// The value against which the specified statistic is compared.
  ///
  /// Parameter [contactProtocols] :
  /// The contact protocols to use for the alarm, such as <code>Email</code>,
  /// <code>SMS</code> (text messaging), or both.
  ///
  /// A notification is sent via the specified contact protocol if notifications
  /// are enabled for the alarm, and when the alarm is triggered.
  ///
  /// A notification is not sent if a contact protocol is not specified, if the
  /// specified contact protocol is not configured in the Amazon Web Services
  /// Region, or if notifications are not enabled for the alarm using the
  /// <code>notificationEnabled</code> paramater.
  ///
  /// Use the <code>CreateContactMethod</code> action to configure a contact
  /// protocol in an Amazon Web Services Region.
  ///
  /// Parameter [datapointsToAlarm] :
  /// The number of data points that must be not within the specified threshold
  /// to trigger the alarm. If you are setting an "M out of N" alarm, this value
  /// (<code>datapointsToAlarm</code>) is the M.
  ///
  /// Parameter [notificationEnabled] :
  /// Indicates whether the alarm is enabled.
  ///
  /// Notifications are enabled by default if you don't specify this parameter.
  ///
  /// Parameter [notificationTriggers] :
  /// The alarm states that trigger a notification.
  ///
  /// An alarm has the following possible states:
  ///
  /// <ul>
  /// <li>
  /// <code>ALARM</code> - The metric is outside of the defined threshold.
  /// </li>
  /// <li>
  /// <code>INSUFFICIENT_DATA</code> - The alarm has just started, the metric is
  /// not available, or not enough data is available for the metric to determine
  /// the alarm state.
  /// </li>
  /// <li>
  /// <code>OK</code> - The metric is within the defined threshold.
  /// </li>
  /// </ul>
  /// When you specify a notification trigger, the <code>ALARM</code> state must
  /// be specified. The <code>INSUFFICIENT_DATA</code> and <code>OK</code>
  /// states can be specified in addition to the <code>ALARM</code> state.
  ///
  /// <ul>
  /// <li>
  /// If you specify <code>OK</code> as an alarm trigger, a notification is sent
  /// when the alarm switches from an <code>ALARM</code> or
  /// <code>INSUFFICIENT_DATA</code> alarm state to an <code>OK</code> state.
  /// This can be thought of as an <i>all clear</i> alarm notification.
  /// </li>
  /// <li>
  /// If you specify <code>INSUFFICIENT_DATA</code> as the alarm trigger, a
  /// notification is sent when the alarm switches from an <code>OK</code> or
  /// <code>ALARM</code> alarm state to an <code>INSUFFICIENT_DATA</code> state.
  /// </li>
  /// </ul>
  /// The notification trigger defaults to <code>ALARM</code> if you don't
  /// specify this parameter.
  ///
  /// Parameter [treatMissingData] :
  /// Sets how this alarm will handle missing data points.
  ///
  /// An alarm can treat missing data in the following ways:
  ///
  /// <ul>
  /// <li>
  /// <code>breaching</code> - Assume the missing data is not within the
  /// threshold. Missing data counts towards the number of times the metric is
  /// not within the threshold.
  /// </li>
  /// <li>
  /// <code>notBreaching</code> - Assume the missing data is within the
  /// threshold. Missing data does not count towards the number of times the
  /// metric is not within the threshold.
  /// </li>
  /// <li>
  /// <code>ignore</code> - Ignore the missing data. Maintains the current alarm
  /// state.
  /// </li>
  /// <li>
  /// <code>missing</code> - Missing data is treated as missing.
  /// </li>
  /// </ul>
  /// If <code>treatMissingData</code> is not specified, the default behavior of
  /// <code>missing</code> is used.
  Future<PutAlarmResult> putAlarm({
    required String alarmName,
    required ComparisonOperator comparisonOperator,
    required int evaluationPeriods,
    required MetricName metricName,
    required String monitoredResourceName,
    required double threshold,
    List<ContactProtocol>? contactProtocols,
    int? datapointsToAlarm,
    bool? notificationEnabled,
    List<AlarmState>? notificationTriggers,
    TreatMissingData? treatMissingData,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.PutAlarm'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'alarmName': alarmName,
        'comparisonOperator': comparisonOperator.toValue(),
        'evaluationPeriods': evaluationPeriods,
        'metricName': metricName.toValue(),
        'monitoredResourceName': monitoredResourceName,
        'threshold': threshold,
        if (contactProtocols != null)
          'contactProtocols': contactProtocols.map((e) => e.toValue()).toList(),
        if (datapointsToAlarm != null) 'datapointsToAlarm': datapointsToAlarm,
        if (notificationEnabled != null)
          'notificationEnabled': notificationEnabled,
        if (notificationTriggers != null)
          'notificationTriggers':
              notificationTriggers.map((e) => e.toValue()).toList(),
        if (treatMissingData != null)
          'treatMissingData': treatMissingData.toValue(),
      },
    );

    return PutAlarmResult.fromJson(jsonResponse.body);
  }

  /// Opens ports for a specific Amazon Lightsail instance, and specifies the IP
  /// addresses allowed to connect to the instance through the ports, and the
  /// protocol. This action also closes all currently open ports that are not
  /// included in the request. Include all of the ports and the protocols you
  /// want to open in your <code>PutInstancePublicPorts</code>request. Or use
  /// the <code>OpenInstancePublicPorts</code> action to open ports without
  /// closing currently open ports.
  ///
  /// The <code>PutInstancePublicPorts</code> action supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// <code>instanceName</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instanceName] :
  /// The name of the instance for which to open ports.
  ///
  /// Parameter [portInfos] :
  /// An array of objects to describe the ports to open for the specified
  /// instance.
  Future<PutInstancePublicPortsResult> putInstancePublicPorts({
    required String instanceName,
    required List<PortInfo> portInfos,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.PutInstancePublicPorts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceName': instanceName,
        'portInfos': portInfos,
      },
    );

    return PutInstancePublicPortsResult.fromJson(jsonResponse.body);
  }

  /// Restarts a specific instance.
  ///
  /// The <code>reboot instance</code> operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// <code>instance name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instanceName] :
  /// The name of the instance to reboot.
  Future<RebootInstanceResult> rebootInstance({
    required String instanceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.RebootInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceName': instanceName,
      },
    );

    return RebootInstanceResult.fromJson(jsonResponse.body);
  }

  /// Restarts a specific database in Amazon Lightsail.
  ///
  /// The <code>reboot relational database</code> operation supports tag-based
  /// access control via resource tags applied to the resource identified by
  /// relationalDatabaseName. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [relationalDatabaseName] :
  /// The name of your database to reboot.
  Future<RebootRelationalDatabaseResult> rebootRelationalDatabase({
    required String relationalDatabaseName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.RebootRelationalDatabase'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'relationalDatabaseName': relationalDatabaseName,
      },
    );

    return RebootRelationalDatabaseResult.fromJson(jsonResponse.body);
  }

  /// Registers a container image to your Amazon Lightsail container service.
  /// <note>
  /// This action is not required if you install and use the Lightsail Control
  /// (lightsailctl) plugin to push container images to your Lightsail container
  /// service. For more information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-pushing-container-images">Pushing
  /// and managing container images on your Amazon Lightsail container
  /// services</a> in the <i>Amazon Lightsail Developer Guide</i>.
  /// </note>
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [digest] :
  /// The digest of the container image to be registered.
  ///
  /// Parameter [label] :
  /// The label for the container image when it's registered to the container
  /// service.
  ///
  /// Use a descriptive label that you can use to track the different versions
  /// of your registered container images.
  ///
  /// Use the <code>GetContainerImages</code> action to return the container
  /// images registered to a Lightsail container service. The label is the
  /// <code>&lt;imagelabel&gt;</code> portion of the following image name
  /// example:
  ///
  /// <ul>
  /// <li>
  /// <code>:container-service-1.&lt;imagelabel&gt;.1</code>
  /// </li>
  /// </ul>
  /// If the name of your container service is <code>mycontainerservice</code>,
  /// and the label that you specify is <code>mystaticwebsite</code>, then the
  /// name of the registered container image will be
  /// <code>:mycontainerservice.mystaticwebsite.1</code>.
  ///
  /// The number at the end of these image name examples represents the version
  /// of the registered container image. If you push and register another
  /// container image to the same Lightsail container service, with the same
  /// label, then the version number for the new registered container image will
  /// be <code>2</code>. If you push and register another container image, the
  /// version number will be <code>3</code>, and so on.
  ///
  /// Parameter [serviceName] :
  /// The name of the container service for which to register a container image.
  Future<RegisterContainerImageResult> registerContainerImage({
    required String digest,
    required String label,
    required String serviceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.RegisterContainerImage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'digest': digest,
        'label': label,
        'serviceName': serviceName,
      },
    );

    return RegisterContainerImageResult.fromJson(jsonResponse.body);
  }

  /// Deletes a specific static IP from your account.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [staticIpName] :
  /// The name of the static IP to delete.
  Future<ReleaseStaticIpResult> releaseStaticIp({
    required String staticIpName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.ReleaseStaticIp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'staticIpName': staticIpName,
      },
    );

    return ReleaseStaticIpResult.fromJson(jsonResponse.body);
  }

  /// Deletes currently cached content from your Amazon Lightsail content
  /// delivery network (CDN) distribution.
  ///
  /// After resetting the cache, the next time a content request is made, your
  /// distribution pulls, serves, and caches it from the origin.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [distributionName] :
  /// The name of the distribution for which to reset cache.
  ///
  /// Use the <code>GetDistributions</code> action to get a list of distribution
  /// names that you can specify.
  Future<ResetDistributionCacheResult> resetDistributionCache({
    String? distributionName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.ResetDistributionCache'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (distributionName != null) 'distributionName': distributionName,
      },
    );

    return ResetDistributionCacheResult.fromJson(jsonResponse.body);
  }

  /// Sends a verification request to an email contact method to ensure it's
  /// owned by the requester. SMS contact methods don't need to be verified.
  ///
  /// A contact method is used to send you notifications about your Amazon
  /// Lightsail resources. You can add one email address and one mobile phone
  /// number contact method in each Amazon Web Services Region. However, SMS
  /// text messaging is not supported in some Amazon Web Services Regions, and
  /// SMS text messages cannot be sent to some countries/regions. For more
  /// information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications
  /// in Amazon Lightsail</a>.
  ///
  /// A verification request is sent to the contact method when you initially
  /// create it. Use this action to send another verification request if a
  /// previous verification request was deleted, or has expired.
  /// <important>
  /// Notifications are not sent to an email contact method until after it is
  /// verified, and confirmed as valid.
  /// </important>
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [OperationFailureException].
  /// May throw [UnauthenticatedException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [protocol] :
  /// The protocol to verify, such as <code>Email</code> or <code>SMS</code>
  /// (text messaging).
  Future<SendContactMethodVerificationResult> sendContactMethodVerification({
    required ContactMethodVerificationProtocol protocol,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.SendContactMethodVerification'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'protocol': protocol.toValue(),
      },
    );

    return SendContactMethodVerificationResult.fromJson(jsonResponse.body);
  }

  /// Sets the IP address type for an Amazon Lightsail resource.
  ///
  /// Use this action to enable dual-stack for a resource, which enables IPv4
  /// and IPv6 for the specified resource. Alternately, you can use this action
  /// to disable dual-stack, and enable IPv4 only.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [ipAddressType] :
  /// The IP address type to set for the specified resource.
  ///
  /// The possible values are <code>ipv4</code> for IPv4 only, <code>ipv6</code>
  /// for IPv6 only, and <code>dualstack</code> for IPv4 and IPv6.
  ///
  /// Parameter [resourceName] :
  /// The name of the resource for which to set the IP address type.
  ///
  /// Parameter [resourceType] :
  /// The resource type.
  ///
  /// The resource values are <code>Distribution</code>, <code>Instance</code>,
  /// and <code>LoadBalancer</code>.
  /// <note>
  /// Distribution-related APIs are available only in the N. Virginia
  /// (<code>us-east-1</code>) Amazon Web Services Region. Set your Amazon Web
  /// Services Region configuration to <code>us-east-1</code> to create, view,
  /// or edit distributions.
  /// </note>
  ///
  /// Parameter [acceptBundleUpdate] :
  /// Required parameter to accept the instance bundle update when changing to,
  /// and from, IPv6-only.
  /// <note>
  /// An instance bundle will change when switching from <code>dual-stack</code>
  /// or <code>ipv4</code>, to <code>ipv6</code>. It also changes when switching
  /// from <code>ipv6</code>, to <code>dual-stack</code> or <code>ipv4</code>.
  ///
  /// You must include this parameter in the command to update the bundle. For
  /// example, if you switch from <code>dual-stack</code> to <code>ipv6</code>,
  /// the bundle will be updated, and billing for the IPv6-only instance bundle
  /// begins immediately.
  /// </note>
  Future<SetIpAddressTypeResult> setIpAddressType({
    required IpAddressType ipAddressType,
    required String resourceName,
    required ResourceType resourceType,
    bool? acceptBundleUpdate,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.SetIpAddressType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ipAddressType': ipAddressType.toValue(),
        'resourceName': resourceName,
        'resourceType': resourceType.toValue(),
        if (acceptBundleUpdate != null)
          'acceptBundleUpdate': acceptBundleUpdate,
      },
    );

    return SetIpAddressTypeResult.fromJson(jsonResponse.body);
  }

  /// Sets the Amazon Lightsail resources that can access the specified
  /// Lightsail bucket.
  ///
  /// Lightsail buckets currently support setting access for Lightsail instances
  /// in the same Amazon Web Services Region.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [ServiceException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [access] :
  /// The access setting.
  ///
  /// The following access settings are available:
  ///
  /// <ul>
  /// <li>
  /// <code>allow</code> - Allows access to the bucket and its objects.
  /// </li>
  /// <li>
  /// <code>deny</code> - Denies access to the bucket and its objects. Use this
  /// setting to remove access for a resource previously set to
  /// <code>allow</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [bucketName] :
  /// The name of the bucket for which to set access to another Lightsail
  /// resource.
  ///
  /// Parameter [resourceName] :
  /// The name of the Lightsail instance for which to set bucket access. The
  /// instance must be in a running or stopped state.
  Future<SetResourceAccessForBucketResult> setResourceAccessForBucket({
    required ResourceBucketAccess access,
    required String bucketName,
    required String resourceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.SetResourceAccessForBucket'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'access': access.toValue(),
        'bucketName': bucketName,
        'resourceName': resourceName,
      },
    );

    return SetResourceAccessForBucketResult.fromJson(jsonResponse.body);
  }

  /// Creates an SSL/TLS certificate that secures traffic for your website.
  /// After the certificate is created, it is installed on the specified
  /// Lightsail instance.
  ///
  /// If you provide more than one domain name in the request, at least one name
  /// must be less than or equal to 63 characters in length.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [ServiceException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [certificateProvider] :
  /// The certificate authority that issues the SSL/TLS certificate.
  ///
  /// Parameter [domainNames] :
  /// The name of the domain and subdomains that were specified for the SSL/TLS
  /// certificate.
  ///
  /// Parameter [emailAddress] :
  /// The contact method for SSL/TLS certificate renewal alerts. You can enter
  /// one email address.
  ///
  /// Parameter [instanceName] :
  /// The name of the Lightsail instance.
  Future<SetupInstanceHttpsResult> setupInstanceHttps({
    required CertificateProvider certificateProvider,
    required List<String> domainNames,
    required String emailAddress,
    required String instanceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.SetupInstanceHttps'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'certificateProvider': certificateProvider.toValue(),
        'domainNames': domainNames,
        'emailAddress': emailAddress,
        'instanceName': instanceName,
      },
    );

    return SetupInstanceHttpsResult.fromJson(jsonResponse.body);
  }

  /// Initiates a graphical user interface (GUI) session that’s used to access a
  /// virtual computer’s operating system and application. The session will be
  /// active for 1 hour. Use this action to resume the session after it expires.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [ServiceException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [resourceName] :
  /// The resource name.
  Future<StartGUISessionResult> startGUISession({
    required String resourceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.StartGUISession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceName': resourceName,
      },
    );

    return StartGUISessionResult.fromJson(jsonResponse.body);
  }

  /// Starts a specific Amazon Lightsail instance from a stopped state. To
  /// restart an instance, use the <code>reboot instance</code> operation.
  /// <note>
  /// When you start a stopped instance, Lightsail assigns a new public IP
  /// address to the instance. To use the same IP address after stopping and
  /// starting an instance, create a static IP address and attach it to the
  /// instance. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/lightsail-create-static-ip">Amazon
  /// Lightsail Developer Guide</a>.
  /// </note>
  /// The <code>start instance</code> operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// <code>instance name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instanceName] :
  /// The name of the instance (a virtual private server) to start.
  Future<StartInstanceResult> startInstance({
    required String instanceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.StartInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceName': instanceName,
      },
    );

    return StartInstanceResult.fromJson(jsonResponse.body);
  }

  /// Starts a specific database from a stopped state in Amazon Lightsail. To
  /// restart a database, use the <code>reboot relational database</code>
  /// operation.
  ///
  /// The <code>start relational database</code> operation supports tag-based
  /// access control via resource tags applied to the resource identified by
  /// relationalDatabaseName. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [relationalDatabaseName] :
  /// The name of your database to start.
  Future<StartRelationalDatabaseResult> startRelationalDatabase({
    required String relationalDatabaseName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.StartRelationalDatabase'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'relationalDatabaseName': relationalDatabaseName,
      },
    );

    return StartRelationalDatabaseResult.fromJson(jsonResponse.body);
  }

  /// Terminates a web-based NICE DCV session that’s used to access a virtual
  /// computer’s operating system or application. The session will close and any
  /// unsaved data will be lost.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [ServiceException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [resourceName] :
  /// The resource name.
  Future<StopGUISessionResult> stopGUISession({
    required String resourceName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.StopGUISession'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceName': resourceName,
      },
    );

    return StopGUISessionResult.fromJson(jsonResponse.body);
  }

  /// Stops a specific Amazon Lightsail instance that is currently running.
  /// <note>
  /// When you start a stopped instance, Lightsail assigns a new public IP
  /// address to the instance. To use the same IP address after stopping and
  /// starting an instance, create a static IP address and attach it to the
  /// instance. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/lightsail-create-static-ip">Amazon
  /// Lightsail Developer Guide</a>.
  /// </note>
  /// The <code>stop instance</code> operation supports tag-based access control
  /// via resource tags applied to the resource identified by <code>instance
  /// name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instanceName] :
  /// The name of the instance (a virtual private server) to stop.
  ///
  /// Parameter [force] :
  /// When set to <code>True</code>, forces a Lightsail instance that is stuck
  /// in a <code>stopping</code> state to stop.
  /// <important>
  /// Only use the <code>force</code> parameter if your instance is stuck in the
  /// <code>stopping</code> state. In any other state, your instance should stop
  /// normally without adding this parameter to your API request.
  /// </important>
  Future<StopInstanceResult> stopInstance({
    required String instanceName,
    bool? force,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.StopInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceName': instanceName,
        if (force != null) 'force': force,
      },
    );

    return StopInstanceResult.fromJson(jsonResponse.body);
  }

  /// Stops a specific database that is currently running in Amazon Lightsail.
  ///
  /// The <code>stop relational database</code> operation supports tag-based
  /// access control via resource tags applied to the resource identified by
  /// relationalDatabaseName. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [relationalDatabaseName] :
  /// The name of your database to stop.
  ///
  /// Parameter [relationalDatabaseSnapshotName] :
  /// The name of your new database snapshot to be created before stopping your
  /// database.
  Future<StopRelationalDatabaseResult> stopRelationalDatabase({
    required String relationalDatabaseName,
    String? relationalDatabaseSnapshotName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.StopRelationalDatabase'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'relationalDatabaseName': relationalDatabaseName,
        if (relationalDatabaseSnapshotName != null)
          'relationalDatabaseSnapshotName': relationalDatabaseSnapshotName,
      },
    );

    return StopRelationalDatabaseResult.fromJson(jsonResponse.body);
  }

  /// Adds one or more tags to the specified Amazon Lightsail resource. Each
  /// resource can have a maximum of 50 tags. Each tag consists of a key and an
  /// optional value. Tag keys must be unique per resource. For more information
  /// about tags, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// The <code>tag resource</code> operation supports tag-based access control
  /// via request tags and resource tags applied to the resource identified by
  /// <code>resource name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [resourceName] :
  /// The name of the resource to which you are adding tags.
  ///
  /// Parameter [tags] :
  /// The tag key and optional value.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to which you want to add a
  /// tag.
  Future<TagResourceResult> tagResource({
    required String resourceName,
    required List<Tag> tags,
    String? resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceName': resourceName,
        'tags': tags,
        if (resourceArn != null) 'resourceArn': resourceArn,
      },
    );

    return TagResourceResult.fromJson(jsonResponse.body);
  }

  /// Tests an alarm by displaying a banner on the Amazon Lightsail console. If
  /// a notification trigger is configured for the specified alarm, the test
  /// also sends a notification to the notification protocol (<code>Email</code>
  /// and/or <code>SMS</code>) configured for the alarm.
  ///
  /// An alarm is used to monitor a single metric for one of your resources.
  /// When a metric condition is met, the alarm can notify you by email, SMS
  /// text message, and a banner displayed on the Amazon Lightsail console. For
  /// more information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms
  /// in Amazon Lightsail</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [OperationFailureException].
  /// May throw [UnauthenticatedException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [alarmName] :
  /// The name of the alarm to test.
  ///
  /// Parameter [state] :
  /// The alarm state to test.
  ///
  /// An alarm has the following possible states that can be tested:
  ///
  /// <ul>
  /// <li>
  /// <code>ALARM</code> - The metric is outside of the defined threshold.
  /// </li>
  /// <li>
  /// <code>INSUFFICIENT_DATA</code> - The alarm has just started, the metric is
  /// not available, or not enough data is available for the metric to determine
  /// the alarm state.
  /// </li>
  /// <li>
  /// <code>OK</code> - The metric is within the defined threshold.
  /// </li>
  /// </ul>
  Future<TestAlarmResult> testAlarm({
    required String alarmName,
    required AlarmState state,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.TestAlarm'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'alarmName': alarmName,
        'state': state.toValue(),
      },
    );

    return TestAlarmResult.fromJson(jsonResponse.body);
  }

  /// Unpeers the Lightsail VPC from the user's default VPC.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  Future<UnpeerVpcResult> unpeerVpc() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.UnpeerVpc'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return UnpeerVpcResult.fromJson(jsonResponse.body);
  }

  /// Deletes the specified set of tag keys and their values from the specified
  /// Amazon Lightsail resource.
  ///
  /// The <code>untag resource</code> operation supports tag-based access
  /// control via request tags and resource tags applied to the resource
  /// identified by <code>resource name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [resourceName] :
  /// The name of the resource from which you are removing a tag.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys to delete from the specified resource.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource from which you want to
  /// remove a tag.
  Future<UntagResourceResult> untagResource({
    required String resourceName,
    required List<String> tagKeys,
    String? resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceName': resourceName,
        'tagKeys': tagKeys,
        if (resourceArn != null) 'resourceArn': resourceArn,
      },
    );

    return UntagResourceResult.fromJson(jsonResponse.body);
  }

  /// Updates an existing Amazon Lightsail bucket.
  ///
  /// Use this action to update the configuration of an existing bucket, such as
  /// versioning, public accessibility, and the Amazon Web Services accounts
  /// that can access the bucket.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [ServiceException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [bucketName] :
  /// The name of the bucket to update.
  ///
  /// Parameter [accessLogConfig] :
  /// An object that describes the access log configuration for the bucket.
  ///
  /// Parameter [accessRules] :
  /// An object that sets the public accessibility of objects in the specified
  /// bucket.
  ///
  /// Parameter [readonlyAccessAccounts] :
  /// An array of strings to specify the Amazon Web Services account IDs that
  /// can access the bucket.
  ///
  /// You can give a maximum of 10 Amazon Web Services accounts access to a
  /// bucket.
  ///
  /// Parameter [versioning] :
  /// Specifies whether to enable or suspend versioning of objects in the
  /// bucket.
  ///
  /// The following options can be specified:
  ///
  /// <ul>
  /// <li>
  /// <code>Enabled</code> - Enables versioning of objects in the specified
  /// bucket.
  /// </li>
  /// <li>
  /// <code>Suspended</code> - Suspends versioning of objects in the specified
  /// bucket. Existing object versions are retained.
  /// </li>
  /// </ul>
  Future<UpdateBucketResult> updateBucket({
    required String bucketName,
    BucketAccessLogConfig? accessLogConfig,
    AccessRules? accessRules,
    List<String>? readonlyAccessAccounts,
    String? versioning,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.UpdateBucket'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'bucketName': bucketName,
        if (accessLogConfig != null) 'accessLogConfig': accessLogConfig,
        if (accessRules != null) 'accessRules': accessRules,
        if (readonlyAccessAccounts != null)
          'readonlyAccessAccounts': readonlyAccessAccounts,
        if (versioning != null) 'versioning': versioning,
      },
    );

    return UpdateBucketResult.fromJson(jsonResponse.body);
  }

  /// Updates the bundle, or storage plan, of an existing Amazon Lightsail
  /// bucket.
  ///
  /// A bucket bundle specifies the monthly cost, storage space, and data
  /// transfer quota for a bucket. You can update a bucket's bundle only one
  /// time within a monthly Amazon Web Services billing cycle. To determine if
  /// you can update a bucket's bundle, use the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetBuckets.html">GetBuckets</a>
  /// action. The <code>ableToUpdateBundle</code> parameter in the response will
  /// indicate whether you can currently update a bucket's bundle.
  ///
  /// Update a bucket's bundle if it's consistently going over its storage space
  /// or data transfer quota, or if a bucket's usage is consistently in the
  /// lower range of its storage space or data transfer quota. Due to the
  /// unpredictable usage fluctuations that a bucket might experience, we
  /// strongly recommend that you update a bucket's bundle only as a long-term
  /// strategy, instead of as a short-term, monthly cost-cutting measure. Choose
  /// a bucket bundle that will provide the bucket with ample storage space and
  /// data transfer for a long time to come.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [ServiceException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [bucketName] :
  /// The name of the bucket for which to update the bundle.
  ///
  /// Parameter [bundleId] :
  /// The ID of the new bundle to apply to the bucket.
  ///
  /// Use the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetBucketBundles.html">GetBucketBundles</a>
  /// action to get a list of bundle IDs that you can specify.
  Future<UpdateBucketBundleResult> updateBucketBundle({
    required String bucketName,
    required String bundleId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.UpdateBucketBundle'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'bucketName': bucketName,
        'bundleId': bundleId,
      },
    );

    return UpdateBucketBundleResult.fromJson(jsonResponse.body);
  }

  /// Updates the configuration of your Amazon Lightsail container service, such
  /// as its power, scale, and public domain names.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [serviceName] :
  /// The name of the container service to update.
  ///
  /// Parameter [isDisabled] :
  /// A Boolean value to indicate whether the container service is disabled.
  ///
  /// Parameter [power] :
  /// The power for the container service.
  ///
  /// The power specifies the amount of memory, vCPUs, and base monthly cost of
  /// each node of the container service. The <code>power</code> and
  /// <code>scale</code> of a container service makes up its configured
  /// capacity. To determine the monthly price of your container service,
  /// multiply the base price of the <code>power</code> with the
  /// <code>scale</code> (the number of nodes) of the service.
  ///
  /// Use the <code>GetContainerServicePowers</code> action to view the
  /// specifications of each power option.
  ///
  /// Parameter [privateRegistryAccess] :
  /// An object to describe the configuration for the container service to
  /// access private container image repositories, such as Amazon Elastic
  /// Container Registry (Amazon ECR) private repositories.
  ///
  /// For more information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-service-ecr-private-repo-access">Configuring
  /// access to an Amazon ECR private repository for an Amazon Lightsail
  /// container service</a> in the <i>Amazon Lightsail Developer Guide</i>.
  ///
  /// Parameter [publicDomainNames] :
  /// The public domain names to use with the container service, such as
  /// <code>example.com</code> and <code>www.example.com</code>.
  ///
  /// You can specify up to four public domain names for a container service.
  /// The domain names that you specify are used when you create a deployment
  /// with a container configured as the public endpoint of your container
  /// service.
  ///
  /// If you don't specify public domain names, then you can use the default
  /// domain of the container service.
  /// <important>
  /// You must create and validate an SSL/TLS certificate before you can use
  /// public domain names with your container service. Use the
  /// <code>CreateCertificate</code> action to create a certificate for the
  /// public domain names you want to use with your container service.
  /// </important>
  /// You can specify public domain names using a string to array map as shown
  /// in the example later on this page.
  ///
  /// Parameter [scale] :
  /// The scale for the container service.
  ///
  /// The scale specifies the allocated compute nodes of the container service.
  /// The <code>power</code> and <code>scale</code> of a container service makes
  /// up its configured capacity. To determine the monthly price of your
  /// container service, multiply the base price of the <code>power</code> with
  /// the <code>scale</code> (the number of nodes) of the service.
  Future<UpdateContainerServiceResult> updateContainerService({
    required String serviceName,
    bool? isDisabled,
    ContainerServicePowerName? power,
    PrivateRegistryAccessRequest? privateRegistryAccess,
    Map<String, List<String>>? publicDomainNames,
    int? scale,
  }) async {
    _s.validateNumRange(
      'scale',
      scale,
      1,
      20,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.UpdateContainerService'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'serviceName': serviceName,
        if (isDisabled != null) 'isDisabled': isDisabled,
        if (power != null) 'power': power.toValue(),
        if (privateRegistryAccess != null)
          'privateRegistryAccess': privateRegistryAccess,
        if (publicDomainNames != null) 'publicDomainNames': publicDomainNames,
        if (scale != null) 'scale': scale,
      },
    );

    return UpdateContainerServiceResult.fromJson(jsonResponse.body);
  }

  /// Updates an existing Amazon Lightsail content delivery network (CDN)
  /// distribution.
  ///
  /// Use this action to update the configuration of your existing distribution.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [distributionName] :
  /// The name of the distribution to update.
  ///
  /// Use the <code>GetDistributions</code> action to get a list of distribution
  /// names that you can specify.
  ///
  /// Parameter [cacheBehaviorSettings] :
  /// An object that describes the cache behavior settings for the distribution.
  /// <note>
  /// The <code>cacheBehaviorSettings</code> specified in your
  /// <code>UpdateDistributionRequest</code> will replace your distribution's
  /// existing settings.
  /// </note>
  ///
  /// Parameter [cacheBehaviors] :
  /// An array of objects that describe the per-path cache behavior for the
  /// distribution.
  ///
  /// Parameter [certificateName] :
  /// The name of the SSL/TLS certificate that you want to attach to the
  /// distribution.
  ///
  /// Only certificates with a status of <code>ISSUED</code> can be attached to
  /// a distribution.
  ///
  /// Use the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetCertificates.html">GetCertificates</a>
  /// action to get a list of certificate names that you can specify.
  ///
  /// Parameter [defaultCacheBehavior] :
  /// An object that describes the default cache behavior for the distribution.
  ///
  /// Parameter [isEnabled] :
  /// Indicates whether to enable the distribution.
  ///
  /// Parameter [origin] :
  /// An object that describes the origin resource for the distribution, such as
  /// a Lightsail instance, bucket, or load balancer.
  ///
  /// The distribution pulls, caches, and serves content from the origin.
  ///
  /// Parameter [useDefaultCertificate] :
  /// Indicates whether the default SSL/TLS certificate is attached to the
  /// distribution. The default value is <code>true</code>. When
  /// <code>true</code>, the distribution uses the default domain name such as
  /// <code>d111111abcdef8.cloudfront.net</code>.
  ///
  /// Set this value to <code>false</code> to attach a new certificate to the
  /// distribution.
  ///
  /// Parameter [viewerMinimumTlsProtocolVersion] :
  /// Use this parameter to update the minimum TLS protocol version for the
  /// SSL/TLS certificate that's attached to the distribution.
  Future<UpdateDistributionResult> updateDistribution({
    required String distributionName,
    CacheSettings? cacheBehaviorSettings,
    List<CacheBehaviorPerPath>? cacheBehaviors,
    String? certificateName,
    CacheBehavior? defaultCacheBehavior,
    bool? isEnabled,
    InputOrigin? origin,
    bool? useDefaultCertificate,
    ViewerMinimumTlsProtocolVersionEnum? viewerMinimumTlsProtocolVersion,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.UpdateDistribution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'distributionName': distributionName,
        if (cacheBehaviorSettings != null)
          'cacheBehaviorSettings': cacheBehaviorSettings,
        if (cacheBehaviors != null) 'cacheBehaviors': cacheBehaviors,
        if (certificateName != null) 'certificateName': certificateName,
        if (defaultCacheBehavior != null)
          'defaultCacheBehavior': defaultCacheBehavior,
        if (isEnabled != null) 'isEnabled': isEnabled,
        if (origin != null) 'origin': origin,
        if (useDefaultCertificate != null)
          'useDefaultCertificate': useDefaultCertificate,
        if (viewerMinimumTlsProtocolVersion != null)
          'viewerMinimumTlsProtocolVersion':
              viewerMinimumTlsProtocolVersion.toValue(),
      },
    );

    return UpdateDistributionResult.fromJson(jsonResponse.body);
  }

  /// Updates the bundle of your Amazon Lightsail content delivery network (CDN)
  /// distribution.
  ///
  /// A distribution bundle specifies the monthly network transfer quota and
  /// monthly cost of your distribution.
  ///
  /// Update your distribution's bundle if your distribution is going over its
  /// monthly network transfer quota and is incurring an overage fee.
  ///
  /// You can update your distribution's bundle only one time within your
  /// monthly Amazon Web Services billing cycle. To determine if you can update
  /// your distribution's bundle, use the <code>GetDistributions</code> action.
  /// The <code>ableToUpdateBundle</code> parameter in the result will indicate
  /// whether you can currently update your distribution's bundle.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [bundleId] :
  /// The bundle ID of the new bundle to apply to your distribution.
  ///
  /// Use the <code>GetDistributionBundles</code> action to get a list of
  /// distribution bundle IDs that you can specify.
  ///
  /// Parameter [distributionName] :
  /// The name of the distribution for which to update the bundle.
  ///
  /// Use the <code>GetDistributions</code> action to get a list of distribution
  /// names that you can specify.
  Future<UpdateDistributionBundleResult> updateDistributionBundle({
    String? bundleId,
    String? distributionName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.UpdateDistributionBundle'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (bundleId != null) 'bundleId': bundleId,
        if (distributionName != null) 'distributionName': distributionName,
      },
    );

    return UpdateDistributionBundleResult.fromJson(jsonResponse.body);
  }

  /// Updates a domain recordset after it is created.
  ///
  /// The <code>update domain entry</code> operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// <code>domain name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [domainEntry] :
  /// An array of key-value pairs containing information about the domain entry.
  ///
  /// Parameter [domainName] :
  /// The name of the domain recordset to update.
  Future<UpdateDomainEntryResult> updateDomainEntry({
    required DomainEntry domainEntry,
    required String domainName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.UpdateDomainEntry'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'domainEntry': domainEntry,
        'domainName': domainName,
      },
    );

    return UpdateDomainEntryResult.fromJson(jsonResponse.body);
  }

  /// Modifies the Amazon Lightsail instance metadata parameters on a running or
  /// stopped instance. When you modify the parameters on a running instance,
  /// the <code>GetInstance</code> or <code>GetInstances</code> API operation
  /// initially responds with a state of <code>pending</code>. After the
  /// parameter modifications are successfully applied, the state changes to
  /// <code>applied</code> in subsequent <code>GetInstance</code> or
  /// <code>GetInstances</code> API calls. For more information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-instance-metadata-service">Use
  /// IMDSv2 with an Amazon Lightsail instance</a> in the <i>Amazon Lightsail
  /// Developer Guide</i>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [instanceName] :
  /// The name of the instance for which to update metadata parameters.
  ///
  /// Parameter [httpEndpoint] :
  /// Enables or disables the HTTP metadata endpoint on your instances. If this
  /// parameter is not specified, the existing state is maintained.
  ///
  /// If you specify a value of <code>disabled</code>, you cannot access your
  /// instance metadata.
  ///
  /// Parameter [httpProtocolIpv6] :
  /// Enables or disables the IPv6 endpoint for the instance metadata service.
  /// This setting applies only when the HTTP metadata endpoint is enabled.
  /// <note>
  /// This parameter is available only for instances in the Europe (Stockholm)
  /// Amazon Web Services Region (<code>eu-north-1</code>).
  /// </note>
  ///
  /// Parameter [httpPutResponseHopLimit] :
  /// The desired HTTP PUT response hop limit for instance metadata requests. A
  /// larger number means that the instance metadata requests can travel
  /// farther. If no parameter is specified, the existing state is maintained.
  ///
  /// Parameter [httpTokens] :
  /// The state of token usage for your instance metadata requests. If the
  /// parameter is not specified in the request, the default state is
  /// <code>optional</code>.
  ///
  /// If the state is <code>optional</code>, you can choose whether to retrieve
  /// instance metadata with a signed token header on your request. If you
  /// retrieve the IAM role credentials without a token, the version 1.0 role
  /// credentials are returned. If you retrieve the IAM role credentials by
  /// using a valid signed token, the version 2.0 role credentials are returned.
  ///
  /// If the state is <code>required</code>, you must send a signed token header
  /// with all instance metadata retrieval requests. In this state, retrieving
  /// the IAM role credential always returns the version 2.0 credentials. The
  /// version 1.0 credentials are not available.
  Future<UpdateInstanceMetadataOptionsResult> updateInstanceMetadataOptions({
    required String instanceName,
    HttpEndpoint? httpEndpoint,
    HttpProtocolIpv6? httpProtocolIpv6,
    int? httpPutResponseHopLimit,
    HttpTokens? httpTokens,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.UpdateInstanceMetadataOptions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'instanceName': instanceName,
        if (httpEndpoint != null) 'httpEndpoint': httpEndpoint.toValue(),
        if (httpProtocolIpv6 != null)
          'httpProtocolIpv6': httpProtocolIpv6.toValue(),
        if (httpPutResponseHopLimit != null)
          'httpPutResponseHopLimit': httpPutResponseHopLimit,
        if (httpTokens != null) 'httpTokens': httpTokens.toValue(),
      },
    );

    return UpdateInstanceMetadataOptionsResult.fromJson(jsonResponse.body);
  }

  /// Updates the specified attribute for a load balancer. You can only update
  /// one attribute at a time.
  ///
  /// The <code>update load balancer attribute</code> operation supports
  /// tag-based access control via resource tags applied to the resource
  /// identified by <code>load balancer name</code>. For more information, see
  /// the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [attributeName] :
  /// The name of the attribute you want to update.
  ///
  /// Parameter [attributeValue] :
  /// The value that you want to specify for the attribute name.
  ///
  /// The following values are supported depending on what you specify for the
  /// <code>attributeName</code> request parameter:
  ///
  /// <ul>
  /// <li>
  /// If you specify <code>HealthCheckPath</code> for the
  /// <code>attributeName</code> request parameter, then the
  /// <code>attributeValue</code> request parameter must be the path to ping on
  /// the target (for example, <code>/weather/us/wa/seattle</code>).
  /// </li>
  /// <li>
  /// If you specify <code>SessionStickinessEnabled</code> for the
  /// <code>attributeName</code> request parameter, then the
  /// <code>attributeValue</code> request parameter must be <code>true</code> to
  /// activate session stickiness or <code>false</code> to deactivate session
  /// stickiness.
  /// </li>
  /// <li>
  /// If you specify <code>SessionStickiness_LB_CookieDurationSeconds</code> for
  /// the <code>attributeName</code> request parameter, then the
  /// <code>attributeValue</code> request parameter must be an interger that
  /// represents the cookie duration in seconds.
  /// </li>
  /// <li>
  /// If you specify <code>HttpsRedirectionEnabled</code> for the
  /// <code>attributeName</code> request parameter, then the
  /// <code>attributeValue</code> request parameter must be <code>true</code> to
  /// activate HTTP to HTTPS redirection or <code>false</code> to deactivate
  /// HTTP to HTTPS redirection.
  /// </li>
  /// <li>
  /// If you specify <code>TlsPolicyName</code> for the
  /// <code>attributeName</code> request parameter, then the
  /// <code>attributeValue</code> request parameter must be the name of the TLS
  /// policy.
  ///
  /// Use the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetLoadBalancerTlsPolicies.html">GetLoadBalancerTlsPolicies</a>
  /// action to get a list of TLS policy names that you can specify.
  /// </li>
  /// </ul>
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer that you want to modify
  /// (<code>my-load-balancer</code>.
  Future<UpdateLoadBalancerAttributeResult> updateLoadBalancerAttribute({
    required LoadBalancerAttributeName attributeName,
    required String attributeValue,
    required String loadBalancerName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.UpdateLoadBalancerAttribute'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'attributeName': attributeName.toValue(),
        'attributeValue': attributeValue,
        'loadBalancerName': loadBalancerName,
      },
    );

    return UpdateLoadBalancerAttributeResult.fromJson(jsonResponse.body);
  }

  /// Allows the update of one or more attributes of a database in Amazon
  /// Lightsail.
  ///
  /// Updates are applied immediately, or in cases where the updates could
  /// result in an outage, are applied during the database's predefined
  /// maintenance window.
  ///
  /// The <code>update relational database</code> operation supports tag-based
  /// access control via resource tags applied to the resource identified by
  /// relationalDatabaseName. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [relationalDatabaseName] :
  /// The name of your Lightsail database resource to update.
  ///
  /// Parameter [applyImmediately] :
  /// When <code>true</code>, applies changes immediately. When
  /// <code>false</code>, applies changes during the preferred maintenance
  /// window. Some changes may cause an outage.
  ///
  /// Default: <code>false</code>
  ///
  /// Parameter [caCertificateIdentifier] :
  /// Indicates the certificate that needs to be associated with the database.
  ///
  /// Parameter [disableBackupRetention] :
  /// When <code>true</code>, disables automated backup retention for your
  /// database.
  ///
  /// Disabling backup retention deletes all automated database backups. Before
  /// disabling this, you may want to create a snapshot of your database using
  /// the <code>create relational database snapshot</code> operation.
  ///
  /// Updates are applied during the next maintenance window because this can
  /// result in an outage.
  ///
  /// Parameter [enableBackupRetention] :
  /// When <code>true</code>, enables automated backup retention for your
  /// database.
  ///
  /// Updates are applied during the next maintenance window because this can
  /// result in an outage.
  ///
  /// Parameter [masterUserPassword] :
  /// The password for the master user. The password can include any printable
  /// ASCII character except "/", """, or "@".
  ///
  /// My<b>SQL</b>
  ///
  /// Constraints: Must contain from 8 to 41 characters.
  ///
  /// <b>PostgreSQL</b>
  ///
  /// Constraints: Must contain from 8 to 128 characters.
  ///
  /// Parameter [preferredBackupWindow] :
  /// The daily time range during which automated backups are created for your
  /// database if automated backups are enabled.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be in the <code>hh24:mi-hh24:mi</code> format.
  ///
  /// Example: <code>16:00-16:30</code>
  /// </li>
  /// <li>
  /// Specified in Coordinated Universal Time (UTC).
  /// </li>
  /// <li>
  /// Must not conflict with the preferred maintenance window.
  /// </li>
  /// <li>
  /// Must be at least 30 minutes.
  /// </li>
  /// </ul>
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// The weekly time range during which system maintenance can occur on your
  /// database.
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each Amazon Web Services Region, occurring on a random day of
  /// the week.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be in the <code>ddd:hh24:mi-ddd:hh24:mi</code> format.
  /// </li>
  /// <li>
  /// Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
  /// </li>
  /// <li>
  /// Must be at least 30 minutes.
  /// </li>
  /// <li>
  /// Specified in Coordinated Universal Time (UTC).
  /// </li>
  /// <li>
  /// Example: <code>Tue:17:00-Tue:17:30</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [publiclyAccessible] :
  /// Specifies the accessibility options for your database. A value of
  /// <code>true</code> specifies a database that is available to resources
  /// outside of your Lightsail account. A value of <code>false</code> specifies
  /// a database that is available only to your Lightsail resources in the same
  /// region as your database.
  ///
  /// Parameter [relationalDatabaseBlueprintId] :
  /// This parameter is used to update the major version of the database. Enter
  /// the <code>blueprintId</code> for the major version that you want to update
  /// to.
  ///
  /// Use the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetRelationalDatabaseBlueprints.html">GetRelationalDatabaseBlueprints</a>
  /// action to get a list of available blueprint IDs.
  ///
  /// Parameter [rotateMasterUserPassword] :
  /// When <code>true</code>, the master user password is changed to a new
  /// strong password generated by Lightsail.
  ///
  /// Use the <code>get relational database master user password</code>
  /// operation to get the new password.
  Future<UpdateRelationalDatabaseResult> updateRelationalDatabase({
    required String relationalDatabaseName,
    bool? applyImmediately,
    String? caCertificateIdentifier,
    bool? disableBackupRetention,
    bool? enableBackupRetention,
    String? masterUserPassword,
    String? preferredBackupWindow,
    String? preferredMaintenanceWindow,
    bool? publiclyAccessible,
    String? relationalDatabaseBlueprintId,
    bool? rotateMasterUserPassword,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.UpdateRelationalDatabase'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'relationalDatabaseName': relationalDatabaseName,
        if (applyImmediately != null) 'applyImmediately': applyImmediately,
        if (caCertificateIdentifier != null)
          'caCertificateIdentifier': caCertificateIdentifier,
        if (disableBackupRetention != null)
          'disableBackupRetention': disableBackupRetention,
        if (enableBackupRetention != null)
          'enableBackupRetention': enableBackupRetention,
        if (masterUserPassword != null)
          'masterUserPassword': masterUserPassword,
        if (preferredBackupWindow != null)
          'preferredBackupWindow': preferredBackupWindow,
        if (preferredMaintenanceWindow != null)
          'preferredMaintenanceWindow': preferredMaintenanceWindow,
        if (publiclyAccessible != null)
          'publiclyAccessible': publiclyAccessible,
        if (relationalDatabaseBlueprintId != null)
          'relationalDatabaseBlueprintId': relationalDatabaseBlueprintId,
        if (rotateMasterUserPassword != null)
          'rotateMasterUserPassword': rotateMasterUserPassword,
      },
    );

    return UpdateRelationalDatabaseResult.fromJson(jsonResponse.body);
  }

  /// Allows the update of one or more parameters of a database in Amazon
  /// Lightsail.
  ///
  /// Parameter updates don't cause outages; therefore, their application is not
  /// subject to the preferred maintenance window. However, there are two ways
  /// in which parameter updates are applied: <code>dynamic</code> or
  /// <code>pending-reboot</code>. Parameters marked with a <code>dynamic</code>
  /// apply type are applied immediately. Parameters marked with a
  /// <code>pending-reboot</code> apply type are applied only after the database
  /// is rebooted using the <code>reboot relational database</code> operation.
  ///
  /// The <code>update relational database parameters</code> operation supports
  /// tag-based access control via resource tags applied to the resource
  /// identified by relationalDatabaseName. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags">Amazon
  /// Lightsail Developer Guide</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidInputException].
  /// May throw [NotFoundException].
  /// May throw [OperationFailureException].
  /// May throw [AccessDeniedException].
  /// May throw [AccountSetupInProgressException].
  /// May throw [UnauthenticatedException].
  ///
  /// Parameter [parameters] :
  /// The database parameters to update.
  ///
  /// Parameter [relationalDatabaseName] :
  /// The name of your database for which to update parameters.
  Future<UpdateRelationalDatabaseParametersResult>
      updateRelationalDatabaseParameters({
    required List<RelationalDatabaseParameter> parameters,
    required String relationalDatabaseName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.UpdateRelationalDatabaseParameters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'parameters': parameters,
        'relationalDatabaseName': relationalDatabaseName,
      },
    );

    return UpdateRelationalDatabaseParametersResult.fromJson(jsonResponse.body);
  }
}

enum AccessDirection {
  inbound,
  outbound,
}

extension AccessDirectionValueExtension on AccessDirection {
  String toValue() {
    switch (this) {
      case AccessDirection.inbound:
        return 'inbound';
      case AccessDirection.outbound:
        return 'outbound';
    }
  }
}

extension AccessDirectionFromString on String {
  AccessDirection toAccessDirection() {
    switch (this) {
      case 'inbound':
        return AccessDirection.inbound;
      case 'outbound':
        return AccessDirection.outbound;
    }
    throw Exception('$this is not known in enum AccessDirection');
  }
}

/// Describes an access key for an Amazon Lightsail bucket.
///
/// Access keys grant full programmatic access to the specified bucket and its
/// objects. You can have a maximum of two access keys per bucket. Use the <a
/// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateBucketAccessKey.html">CreateBucketAccessKey</a>
/// action to create an access key for a specific bucket. For more information
/// about access keys, see <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-creating-bucket-access-keys">Creating
/// access keys for a bucket in Amazon Lightsail</a> in the <i>Amazon Lightsail
/// Developer Guide</i>.
/// <important>
/// The <code>secretAccessKey</code> value is returned only in response to the
/// <code>CreateBucketAccessKey</code> action. You can get a secret access key
/// only when you first create an access key; you cannot get the secret access
/// key later. If you lose the secret access key, you must create a new access
/// key.
/// </important>
class AccessKey {
  /// The ID of the access key.
  final String? accessKeyId;

  /// The timestamp when the access key was created.
  final DateTime? createdAt;

  /// An object that describes the last time the access key was used.
  /// <note>
  /// This object does not include data in the response of a <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateBucketAccessKey.html">CreateBucketAccessKey</a>
  /// action. If the access key has not been used, the <code>region</code> and
  /// <code>serviceName</code> values are <code>N/A</code>, and the
  /// <code>lastUsedDate</code> value is null.
  /// </note>
  final AccessKeyLastUsed? lastUsed;

  /// The secret access key used to sign requests.
  ///
  /// You should store the secret access key in a safe location. We recommend that
  /// you delete the access key if the secret access key is compromised.
  final String? secretAccessKey;

  /// The status of the access key.
  ///
  /// A status of <code>Active</code> means that the key is valid, while
  /// <code>Inactive</code> means it is not.
  final StatusType? status;

  AccessKey({
    this.accessKeyId,
    this.createdAt,
    this.lastUsed,
    this.secretAccessKey,
    this.status,
  });

  factory AccessKey.fromJson(Map<String, dynamic> json) {
    return AccessKey(
      accessKeyId: json['accessKeyId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      lastUsed: json['lastUsed'] != null
          ? AccessKeyLastUsed.fromJson(json['lastUsed'] as Map<String, dynamic>)
          : null,
      secretAccessKey: json['secretAccessKey'] as String?,
      status: (json['status'] as String?)?.toStatusType(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final createdAt = this.createdAt;
    final lastUsed = this.lastUsed;
    final secretAccessKey = this.secretAccessKey;
    final status = this.status;
    return {
      if (accessKeyId != null) 'accessKeyId': accessKeyId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (lastUsed != null) 'lastUsed': lastUsed,
      if (secretAccessKey != null) 'secretAccessKey': secretAccessKey,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Describes the last time an access key was used.
/// <note>
/// This object does not include data in the response of a <a
/// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateBucketAccessKey.html">CreateBucketAccessKey</a>
/// action.
/// </note>
class AccessKeyLastUsed {
  /// The date and time when the access key was most recently used.
  ///
  /// This value is null if the access key has not been used.
  final DateTime? lastUsedDate;

  /// The Amazon Web Services Region where this access key was most recently used.
  ///
  /// This value is <code>N/A</code> if the access key has not been used.
  final String? region;

  /// The name of the Amazon Web Services service with which this access key was
  /// most recently used.
  ///
  /// This value is <code>N/A</code> if the access key has not been used.
  final String? serviceName;

  AccessKeyLastUsed({
    this.lastUsedDate,
    this.region,
    this.serviceName,
  });

  factory AccessKeyLastUsed.fromJson(Map<String, dynamic> json) {
    return AccessKeyLastUsed(
      lastUsedDate: timeStampFromJson(json['lastUsedDate']),
      region: json['region'] as String?,
      serviceName: json['serviceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastUsedDate = this.lastUsedDate;
    final region = this.region;
    final serviceName = this.serviceName;
    return {
      if (lastUsedDate != null)
        'lastUsedDate': unixTimestampToJson(lastUsedDate),
      if (region != null) 'region': region,
      if (serviceName != null) 'serviceName': serviceName,
    };
  }
}

/// Describes the anonymous access permissions for an Amazon Lightsail bucket
/// and its objects.
///
/// For more information about bucket access permissions, see <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-understanding-bucket-permissions">Understanding
/// bucket permissions in Amazon Lightsail</a> in the
///
/// <i>Amazon Lightsail Developer Guide</i>.
class AccessRules {
  /// A Boolean value that indicates whether the access control list (ACL)
  /// permissions that are applied to individual objects override the
  /// <code>getObject</code> option that is currently specified.
  ///
  /// When this is true, you can use the <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObjectAcl.html">PutObjectAcl</a>
  /// Amazon S3 API action to set individual objects to public (read-only) using
  /// the <code>public-read</code> ACL, or to private using the
  /// <code>private</code> ACL.
  final bool? allowPublicOverrides;

  /// Specifies the anonymous access to all objects in a bucket.
  ///
  /// The following options can be specified:
  ///
  /// <ul>
  /// <li>
  /// <code>public</code> - Sets all objects in the bucket to public (read-only),
  /// making them readable by anyone in the world.
  ///
  /// If the <code>getObject</code> value is set to <code>public</code>, then all
  /// objects in the bucket default to public regardless of the
  /// <code>allowPublicOverrides</code> value.
  /// </li>
  /// <li>
  /// <code>private</code> - Sets all objects in the bucket to private, making
  /// them readable only by you or anyone you give access to.
  ///
  /// If the <code>getObject</code> value is set to <code>private</code>, and the
  /// <code>allowPublicOverrides</code> value is set to <code>true</code>, then
  /// all objects in the bucket default to private unless they are configured with
  /// a <code>public-read</code> ACL. Individual objects with a
  /// <code>public-read</code> ACL are readable by anyone in the world.
  /// </li>
  /// </ul>
  final AccessType? getObject;

  AccessRules({
    this.allowPublicOverrides,
    this.getObject,
  });

  factory AccessRules.fromJson(Map<String, dynamic> json) {
    return AccessRules(
      allowPublicOverrides: json['allowPublicOverrides'] as bool?,
      getObject: (json['getObject'] as String?)?.toAccessType(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowPublicOverrides = this.allowPublicOverrides;
    final getObject = this.getObject;
    return {
      if (allowPublicOverrides != null)
        'allowPublicOverrides': allowPublicOverrides,
      if (getObject != null) 'getObject': getObject.toValue(),
    };
  }
}

enum AccessType {
  public,
  private,
}

extension AccessTypeValueExtension on AccessType {
  String toValue() {
    switch (this) {
      case AccessType.public:
        return 'public';
      case AccessType.private:
        return 'private';
    }
  }
}

extension AccessTypeFromString on String {
  AccessType toAccessType() {
    switch (this) {
      case 'public':
        return AccessType.public;
      case 'private':
        return AccessType.private;
    }
    throw Exception('$this is not known in enum AccessType');
  }
}

/// Describes the synchronization status of the Amazon Simple Storage Service
/// (Amazon S3) account-level block public access (BPA) feature for your
/// Lightsail buckets.
///
/// The account-level BPA feature of Amazon S3 provides centralized controls to
/// limit public access to all Amazon S3 buckets in an account. BPA can make all
/// Amazon S3 buckets in an Amazon Web Services account private regardless of
/// the individual bucket and object permissions that are configured. Lightsail
/// buckets take into account the Amazon S3 account-level BPA configuration when
/// allowing or denying public access. To do this, Lightsail periodically
/// fetches the account-level BPA configuration from Amazon S3. When the
/// account-level BPA status is <code>InSync</code>, the Amazon S3 account-level
/// BPA configuration is synchronized and it applies to your Lightsail buckets.
/// For more information about Amazon Simple Storage Service account-level BPA
/// and how it affects Lightsail buckets, see <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-block-public-access-for-buckets">Block
/// public access for buckets in Amazon Lightsail</a> in the <i>Amazon Lightsail
/// Developer Guide</i>.
class AccountLevelBpaSync {
  /// A Boolean value that indicates whether account-level block public access is
  /// affecting your Lightsail buckets.
  final bool? bpaImpactsLightsail;

  /// The timestamp of when the account-level BPA configuration was last
  /// synchronized. This value is null when the account-level BPA configuration
  /// has not been synchronized.
  final DateTime? lastSyncedAt;

  /// A message that provides a reason for a <code>Failed</code> or
  /// <code>Defaulted</code> synchronization status.
  ///
  /// The following messages are possible:
  ///
  /// <ul>
  /// <li>
  /// <code>SYNC_ON_HOLD</code> - The synchronization has not yet happened. This
  /// status message occurs immediately after you create your first Lightsail
  /// bucket. This status message should change after the first synchronization
  /// happens, approximately 1 hour after the first bucket is created.
  /// </li>
  /// <li>
  /// <code>DEFAULTED_FOR_SLR_MISSING</code> - The synchronization failed because
  /// the required service-linked role is missing from your Amazon Web Services
  /// account. The account-level BPA configuration for your Lightsail buckets is
  /// defaulted to <i>active</i> until the synchronization can occur. This means
  /// that all your buckets are private and not publicly accessible. For more
  /// information about how to create the required service-linked role to allow
  /// synchronization, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-using-service-linked-roles">Using
  /// Service-Linked Roles for Amazon Lightsail</a> in the <i>Amazon Lightsail
  /// Developer Guide</i>.
  /// </li>
  /// <li>
  /// <code>DEFAULTED_FOR_SLR_MISSING_ON_HOLD</code> - The synchronization failed
  /// because the required service-linked role is missing from your Amazon Web
  /// Services account. Account-level BPA is not yet configured for your Lightsail
  /// buckets. Therefore, only the bucket access permissions and individual object
  /// access permissions apply to your Lightsail buckets. For more information
  /// about how to create the required service-linked role to allow
  /// synchronization, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-using-service-linked-roles">Using
  /// Service-Linked Roles for Amazon Lightsail</a> in the <i>Amazon Lightsail
  /// Developer Guide</i>.
  /// </li>
  /// <li>
  /// <code>Unknown</code> - The reason that synchronization failed is unknown.
  /// Contact Amazon Web Services Support for more information.
  /// </li>
  /// </ul>
  final BPAStatusMessage? message;

  /// The status of the account-level BPA synchronization.
  ///
  /// The following statuses are possible:
  ///
  /// <ul>
  /// <li>
  /// <code>InSync</code> - Account-level BPA is synchronized. The Amazon S3
  /// account-level BPA configuration applies to your Lightsail buckets.
  /// </li>
  /// <li>
  /// <code>NeverSynced</code> - Synchronization has not yet happened. The Amazon
  /// S3 account-level BPA configuration does not apply to your Lightsail buckets.
  /// </li>
  /// <li>
  /// <code>Failed</code> - Synchronization failed. The Amazon S3 account-level
  /// BPA configuration does not apply to your Lightsail buckets.
  /// </li>
  /// <li>
  /// <code>Defaulted</code> - Synchronization failed and account-level BPA for
  /// your Lightsail buckets is defaulted to <i>active</i>.
  /// </li>
  /// </ul> <note>
  /// You might need to complete further actions if the status is
  /// <code>Failed</code> or <code>Defaulted</code>. The <code>message</code>
  /// parameter provides more information for those statuses.
  /// </note>
  final AccountLevelBpaSyncStatus? status;

  AccountLevelBpaSync({
    this.bpaImpactsLightsail,
    this.lastSyncedAt,
    this.message,
    this.status,
  });

  factory AccountLevelBpaSync.fromJson(Map<String, dynamic> json) {
    return AccountLevelBpaSync(
      bpaImpactsLightsail: json['bpaImpactsLightsail'] as bool?,
      lastSyncedAt: timeStampFromJson(json['lastSyncedAt']),
      message: (json['message'] as String?)?.toBPAStatusMessage(),
      status: (json['status'] as String?)?.toAccountLevelBpaSyncStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final bpaImpactsLightsail = this.bpaImpactsLightsail;
    final lastSyncedAt = this.lastSyncedAt;
    final message = this.message;
    final status = this.status;
    return {
      if (bpaImpactsLightsail != null)
        'bpaImpactsLightsail': bpaImpactsLightsail,
      if (lastSyncedAt != null)
        'lastSyncedAt': unixTimestampToJson(lastSyncedAt),
      if (message != null) 'message': message.toValue(),
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum AccountLevelBpaSyncStatus {
  inSync,
  failed,
  neverSynced,
  defaulted,
}

extension AccountLevelBpaSyncStatusValueExtension on AccountLevelBpaSyncStatus {
  String toValue() {
    switch (this) {
      case AccountLevelBpaSyncStatus.inSync:
        return 'InSync';
      case AccountLevelBpaSyncStatus.failed:
        return 'Failed';
      case AccountLevelBpaSyncStatus.neverSynced:
        return 'NeverSynced';
      case AccountLevelBpaSyncStatus.defaulted:
        return 'Defaulted';
    }
  }
}

extension AccountLevelBpaSyncStatusFromString on String {
  AccountLevelBpaSyncStatus toAccountLevelBpaSyncStatus() {
    switch (this) {
      case 'InSync':
        return AccountLevelBpaSyncStatus.inSync;
      case 'Failed':
        return AccountLevelBpaSyncStatus.failed;
      case 'NeverSynced':
        return AccountLevelBpaSyncStatus.neverSynced;
      case 'Defaulted':
        return AccountLevelBpaSyncStatus.defaulted;
    }
    throw Exception('$this is not known in enum AccountLevelBpaSyncStatus');
  }
}

/// Describes an add-on that is enabled for an Amazon Lightsail resource.
class AddOn {
  /// The amount of idle time in minutes after which your virtual computer will
  /// automatically stop.
  /// <important>
  /// This add-on only applies to Lightsail for Research resources.
  /// </important>
  final String? duration;

  /// The name of the add-on.
  final String? name;

  /// The next daily time an automatic snapshot will be created.
  ///
  /// The time shown is in <code>HH:00</code> format, and in Coordinated Universal
  /// Time (UTC).
  ///
  /// The snapshot is automatically created between the time shown and up to 45
  /// minutes after.
  final String? nextSnapshotTimeOfDay;

  /// The daily time when an automatic snapshot is created.
  ///
  /// The time shown is in <code>HH:00</code> format, and in Coordinated Universal
  /// Time (UTC).
  ///
  /// The snapshot is automatically created between the time shown and up to 45
  /// minutes after.
  final String? snapshotTimeOfDay;

  /// The status of the add-on.
  final String? status;

  /// The trigger threshold of the action.
  /// <important>
  /// This add-on only applies to Lightsail for Research resources.
  /// </important>
  final String? threshold;

  AddOn({
    this.duration,
    this.name,
    this.nextSnapshotTimeOfDay,
    this.snapshotTimeOfDay,
    this.status,
    this.threshold,
  });

  factory AddOn.fromJson(Map<String, dynamic> json) {
    return AddOn(
      duration: json['duration'] as String?,
      name: json['name'] as String?,
      nextSnapshotTimeOfDay: json['nextSnapshotTimeOfDay'] as String?,
      snapshotTimeOfDay: json['snapshotTimeOfDay'] as String?,
      status: json['status'] as String?,
      threshold: json['threshold'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final name = this.name;
    final nextSnapshotTimeOfDay = this.nextSnapshotTimeOfDay;
    final snapshotTimeOfDay = this.snapshotTimeOfDay;
    final status = this.status;
    final threshold = this.threshold;
    return {
      if (duration != null) 'duration': duration,
      if (name != null) 'name': name,
      if (nextSnapshotTimeOfDay != null)
        'nextSnapshotTimeOfDay': nextSnapshotTimeOfDay,
      if (snapshotTimeOfDay != null) 'snapshotTimeOfDay': snapshotTimeOfDay,
      if (status != null) 'status': status,
      if (threshold != null) 'threshold': threshold,
    };
  }
}

/// Describes a request to enable, modify, or disable an add-on for an Amazon
/// Lightsail resource.
/// <note>
/// An additional cost may be associated with enabling add-ons. For more
/// information, see the <a
/// href="https://aws.amazon.com/lightsail/pricing/">Lightsail pricing page</a>.
/// </note>
class AddOnRequest {
  /// The add-on type.
  final AddOnType addOnType;

  /// An object that represents additional parameters when enabling or modifying
  /// the automatic snapshot add-on.
  final AutoSnapshotAddOnRequest? autoSnapshotAddOnRequest;

  /// An object that represents additional parameters when enabling or modifying
  /// the <code>StopInstanceOnIdle</code> add-on.
  /// <important>
  /// This object only applies to Lightsail for Research resources.
  /// </important>
  final StopInstanceOnIdleRequest? stopInstanceOnIdleRequest;

  AddOnRequest({
    required this.addOnType,
    this.autoSnapshotAddOnRequest,
    this.stopInstanceOnIdleRequest,
  });

  Map<String, dynamic> toJson() {
    final addOnType = this.addOnType;
    final autoSnapshotAddOnRequest = this.autoSnapshotAddOnRequest;
    final stopInstanceOnIdleRequest = this.stopInstanceOnIdleRequest;
    return {
      'addOnType': addOnType.toValue(),
      if (autoSnapshotAddOnRequest != null)
        'autoSnapshotAddOnRequest': autoSnapshotAddOnRequest,
      if (stopInstanceOnIdleRequest != null)
        'stopInstanceOnIdleRequest': stopInstanceOnIdleRequest,
    };
  }
}

enum AddOnType {
  autoSnapshot,
  stopInstanceOnIdle,
}

extension AddOnTypeValueExtension on AddOnType {
  String toValue() {
    switch (this) {
      case AddOnType.autoSnapshot:
        return 'AutoSnapshot';
      case AddOnType.stopInstanceOnIdle:
        return 'StopInstanceOnIdle';
    }
  }
}

extension AddOnTypeFromString on String {
  AddOnType toAddOnType() {
    switch (this) {
      case 'AutoSnapshot':
        return AddOnType.autoSnapshot;
      case 'StopInstanceOnIdle':
        return AddOnType.stopInstanceOnIdle;
    }
    throw Exception('$this is not known in enum AddOnType');
  }
}

/// Describes an alarm.
///
/// An alarm is a way to monitor your Lightsail resource metrics. For more
/// information, see <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms
/// in Amazon Lightsail</a>.
class Alarm {
  /// The Amazon Resource Name (ARN) of the alarm.
  final String? arn;

  /// The arithmetic operation used when comparing the specified statistic and
  /// threshold.
  final ComparisonOperator? comparisonOperator;

  /// The contact protocols for the alarm, such as <code>Email</code>,
  /// <code>SMS</code> (text messaging), or both.
  final List<ContactProtocol>? contactProtocols;

  /// The timestamp when the alarm was created.
  final DateTime? createdAt;

  /// The number of data points that must not within the specified threshold to
  /// trigger the alarm.
  final int? datapointsToAlarm;

  /// The number of periods over which data is compared to the specified
  /// threshold.
  final int? evaluationPeriods;

  /// An object that lists information about the location of the alarm.
  final ResourceLocation? location;

  /// The name of the metric associated with the alarm.
  final MetricName? metricName;

  /// An object that lists information about the resource monitored by the alarm.
  final MonitoredResourceInfo? monitoredResourceInfo;

  /// The name of the alarm.
  final String? name;

  /// Indicates whether the alarm is enabled.
  final bool? notificationEnabled;

  /// The alarm states that trigger a notification.
  final List<AlarmState>? notificationTriggers;

  /// The period, in seconds, over which the statistic is applied.
  final int? period;

  /// The Lightsail resource type of the alarm.
  final ResourceType? resourceType;

  /// The current state of the alarm.
  ///
  /// An alarm has the following possible states:
  ///
  /// <ul>
  /// <li>
  /// <code>ALARM</code> - The metric is outside of the defined threshold.
  /// </li>
  /// <li>
  /// <code>INSUFFICIENT_DATA</code> - The alarm has just started, the metric is
  /// not available, or not enough data is available for the metric to determine
  /// the alarm state.
  /// </li>
  /// <li>
  /// <code>OK</code> - The metric is within the defined threshold.
  /// </li>
  /// </ul>
  final AlarmState? state;

  /// The statistic for the metric associated with the alarm.
  ///
  /// The following statistics are available:
  ///
  /// <ul>
  /// <li>
  /// <code>Minimum</code> - The lowest value observed during the specified
  /// period. Use this value to determine low volumes of activity for your
  /// application.
  /// </li>
  /// <li>
  /// <code>Maximum</code> - The highest value observed during the specified
  /// period. Use this value to determine high volumes of activity for your
  /// application.
  /// </li>
  /// <li>
  /// <code>Sum</code> - All values submitted for the matching metric added
  /// together. You can use this statistic to determine the total volume of a
  /// metric.
  /// </li>
  /// <li>
  /// <code>Average</code> - The value of Sum / SampleCount during the specified
  /// period. By comparing this statistic with the Minimum and Maximum values, you
  /// can determine the full scope of a metric and how close the average use is to
  /// the Minimum and Maximum values. This comparison helps you to know when to
  /// increase or decrease your resources.
  /// </li>
  /// <li>
  /// <code>SampleCount</code> - The count, or number, of data points used for the
  /// statistical calculation.
  /// </li>
  /// </ul>
  final MetricStatistic? statistic;

  /// The support code. Include this code in your email to support when you have
  /// questions about your Lightsail alarm. This code enables our support team to
  /// look up your Lightsail information more easily.
  final String? supportCode;

  /// The value against which the specified statistic is compared.
  final double? threshold;

  /// Specifies how the alarm handles missing data points.
  ///
  /// An alarm can treat missing data in the following ways:
  ///
  /// <ul>
  /// <li>
  /// <code>breaching</code> - Assume the missing data is not within the
  /// threshold. Missing data counts towards the number of times the metric is not
  /// within the threshold.
  /// </li>
  /// <li>
  /// <code>notBreaching</code> - Assume the missing data is within the threshold.
  /// Missing data does not count towards the number of times the metric is not
  /// within the threshold.
  /// </li>
  /// <li>
  /// <code>ignore</code> - Ignore the missing data. Maintains the current alarm
  /// state.
  /// </li>
  /// <li>
  /// <code>missing</code> - Missing data is treated as missing.
  /// </li>
  /// </ul>
  final TreatMissingData? treatMissingData;

  /// The unit of the metric associated with the alarm.
  final MetricUnit? unit;

  Alarm({
    this.arn,
    this.comparisonOperator,
    this.contactProtocols,
    this.createdAt,
    this.datapointsToAlarm,
    this.evaluationPeriods,
    this.location,
    this.metricName,
    this.monitoredResourceInfo,
    this.name,
    this.notificationEnabled,
    this.notificationTriggers,
    this.period,
    this.resourceType,
    this.state,
    this.statistic,
    this.supportCode,
    this.threshold,
    this.treatMissingData,
    this.unit,
  });

  factory Alarm.fromJson(Map<String, dynamic> json) {
    return Alarm(
      arn: json['arn'] as String?,
      comparisonOperator:
          (json['comparisonOperator'] as String?)?.toComparisonOperator(),
      contactProtocols: (json['contactProtocols'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toContactProtocol())
          .toList(),
      createdAt: timeStampFromJson(json['createdAt']),
      datapointsToAlarm: json['datapointsToAlarm'] as int?,
      evaluationPeriods: json['evaluationPeriods'] as int?,
      location: json['location'] != null
          ? ResourceLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      metricName: (json['metricName'] as String?)?.toMetricName(),
      monitoredResourceInfo: json['monitoredResourceInfo'] != null
          ? MonitoredResourceInfo.fromJson(
              json['monitoredResourceInfo'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      notificationEnabled: json['notificationEnabled'] as bool?,
      notificationTriggers: (json['notificationTriggers'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toAlarmState())
          .toList(),
      period: json['period'] as int?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      state: (json['state'] as String?)?.toAlarmState(),
      statistic: (json['statistic'] as String?)?.toMetricStatistic(),
      supportCode: json['supportCode'] as String?,
      threshold: json['threshold'] as double?,
      treatMissingData:
          (json['treatMissingData'] as String?)?.toTreatMissingData(),
      unit: (json['unit'] as String?)?.toMetricUnit(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final comparisonOperator = this.comparisonOperator;
    final contactProtocols = this.contactProtocols;
    final createdAt = this.createdAt;
    final datapointsToAlarm = this.datapointsToAlarm;
    final evaluationPeriods = this.evaluationPeriods;
    final location = this.location;
    final metricName = this.metricName;
    final monitoredResourceInfo = this.monitoredResourceInfo;
    final name = this.name;
    final notificationEnabled = this.notificationEnabled;
    final notificationTriggers = this.notificationTriggers;
    final period = this.period;
    final resourceType = this.resourceType;
    final state = this.state;
    final statistic = this.statistic;
    final supportCode = this.supportCode;
    final threshold = this.threshold;
    final treatMissingData = this.treatMissingData;
    final unit = this.unit;
    return {
      if (arn != null) 'arn': arn,
      if (comparisonOperator != null)
        'comparisonOperator': comparisonOperator.toValue(),
      if (contactProtocols != null)
        'contactProtocols': contactProtocols.map((e) => e.toValue()).toList(),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (datapointsToAlarm != null) 'datapointsToAlarm': datapointsToAlarm,
      if (evaluationPeriods != null) 'evaluationPeriods': evaluationPeriods,
      if (location != null) 'location': location,
      if (metricName != null) 'metricName': metricName.toValue(),
      if (monitoredResourceInfo != null)
        'monitoredResourceInfo': monitoredResourceInfo,
      if (name != null) 'name': name,
      if (notificationEnabled != null)
        'notificationEnabled': notificationEnabled,
      if (notificationTriggers != null)
        'notificationTriggers':
            notificationTriggers.map((e) => e.toValue()).toList(),
      if (period != null) 'period': period,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (state != null) 'state': state.toValue(),
      if (statistic != null) 'statistic': statistic.toValue(),
      if (supportCode != null) 'supportCode': supportCode,
      if (threshold != null) 'threshold': threshold,
      if (treatMissingData != null)
        'treatMissingData': treatMissingData.toValue(),
      if (unit != null) 'unit': unit.toValue(),
    };
  }
}

enum AlarmState {
  ok,
  alarm,
  insufficientData,
}

extension AlarmStateValueExtension on AlarmState {
  String toValue() {
    switch (this) {
      case AlarmState.ok:
        return 'OK';
      case AlarmState.alarm:
        return 'ALARM';
      case AlarmState.insufficientData:
        return 'INSUFFICIENT_DATA';
    }
  }
}

extension AlarmStateFromString on String {
  AlarmState toAlarmState() {
    switch (this) {
      case 'OK':
        return AlarmState.ok;
      case 'ALARM':
        return AlarmState.alarm;
      case 'INSUFFICIENT_DATA':
        return AlarmState.insufficientData;
    }
    throw Exception('$this is not known in enum AlarmState');
  }
}

class AllocateStaticIpResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  AllocateStaticIpResult({
    this.operations,
  });

  factory AllocateStaticIpResult.fromJson(Map<String, dynamic> json) {
    return AllocateStaticIpResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

enum AppCategory {
  lfR,
}

extension AppCategoryValueExtension on AppCategory {
  String toValue() {
    switch (this) {
      case AppCategory.lfR:
        return 'LfR';
    }
  }
}

extension AppCategoryFromString on String {
  AppCategory toAppCategory() {
    switch (this) {
      case 'LfR':
        return AppCategory.lfR;
    }
    throw Exception('$this is not known in enum AppCategory');
  }
}

class AttachCertificateToDistributionResult {
  /// An object that describes the result of the action, such as the status of the
  /// request, the timestamp of the request, and the resources affected by the
  /// request.
  final Operation? operation;

  AttachCertificateToDistributionResult({
    this.operation,
  });

  factory AttachCertificateToDistributionResult.fromJson(
      Map<String, dynamic> json) {
    return AttachCertificateToDistributionResult(
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    return {
      if (operation != null) 'operation': operation,
    };
  }
}

class AttachDiskResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  AttachDiskResult({
    this.operations,
  });

  factory AttachDiskResult.fromJson(Map<String, dynamic> json) {
    return AttachDiskResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class AttachInstancesToLoadBalancerResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  AttachInstancesToLoadBalancerResult({
    this.operations,
  });

  factory AttachInstancesToLoadBalancerResult.fromJson(
      Map<String, dynamic> json) {
    return AttachInstancesToLoadBalancerResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class AttachLoadBalancerTlsCertificateResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  ///
  /// These SSL/TLS certificates are only usable by Lightsail load balancers. You
  /// can't get the certificate and use it for another purpose.
  final List<Operation>? operations;

  AttachLoadBalancerTlsCertificateResult({
    this.operations,
  });

  factory AttachLoadBalancerTlsCertificateResult.fromJson(
      Map<String, dynamic> json) {
    return AttachLoadBalancerTlsCertificateResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class AttachStaticIpResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  AttachStaticIpResult({
    this.operations,
  });

  factory AttachStaticIpResult.fromJson(Map<String, dynamic> json) {
    return AttachStaticIpResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

/// Describes a block storage disk that is attached to an instance, and is
/// included in an automatic snapshot.
class AttachedDisk {
  /// The path of the disk (<code>/dev/xvdf</code>).
  final String? path;

  /// The size of the disk in GB.
  final int? sizeInGb;

  AttachedDisk({
    this.path,
    this.sizeInGb,
  });

  factory AttachedDisk.fromJson(Map<String, dynamic> json) {
    return AttachedDisk(
      path: json['path'] as String?,
      sizeInGb: json['sizeInGb'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    final sizeInGb = this.sizeInGb;
    return {
      if (path != null) 'path': path,
      if (sizeInGb != null) 'sizeInGb': sizeInGb,
    };
  }
}

enum AutoMountStatus {
  failed,
  pending,
  mounted,
  notMounted,
}

extension AutoMountStatusValueExtension on AutoMountStatus {
  String toValue() {
    switch (this) {
      case AutoMountStatus.failed:
        return 'Failed';
      case AutoMountStatus.pending:
        return 'Pending';
      case AutoMountStatus.mounted:
        return 'Mounted';
      case AutoMountStatus.notMounted:
        return 'NotMounted';
    }
  }
}

extension AutoMountStatusFromString on String {
  AutoMountStatus toAutoMountStatus() {
    switch (this) {
      case 'Failed':
        return AutoMountStatus.failed;
      case 'Pending':
        return AutoMountStatus.pending;
      case 'Mounted':
        return AutoMountStatus.mounted;
      case 'NotMounted':
        return AutoMountStatus.notMounted;
    }
    throw Exception('$this is not known in enum AutoMountStatus');
  }
}

/// Describes a request to enable or modify the automatic snapshot add-on for an
/// Amazon Lightsail instance or disk.
///
/// When you modify the automatic snapshot time for a resource, it is typically
/// effective immediately except under the following conditions:
///
/// <ul>
/// <li>
/// If an automatic snapshot has been created for the current day, and you
/// change the snapshot time to a later time of day, then the new snapshot time
/// will be effective the following day. This ensures that two snapshots are not
/// created for the current day.
/// </li>
/// <li>
/// If an automatic snapshot has not yet been created for the current day, and
/// you change the snapshot time to an earlier time of day, then the new
/// snapshot time will be effective the following day and a snapshot is
/// automatically created at the previously set time for the current day. This
/// ensures that a snapshot is created for the current day.
/// </li>
/// <li>
/// If an automatic snapshot has not yet been created for the current day, and
/// you change the snapshot time to a time that is within 30 minutes from your
/// current time, then the new snapshot time will be effective the following day
/// and a snapshot is automatically created at the previously set time for the
/// current day. This ensures that a snapshot is created for the current day,
/// because 30 minutes is required between your current time and the new
/// snapshot time that you specify.
/// </li>
/// <li>
/// If an automatic snapshot is scheduled to be created within 30 minutes from
/// your current time and you change the snapshot time, then the new snapshot
/// time will be effective the following day and a snapshot is automatically
/// created at the previously set time for the current day. This ensures that a
/// snapshot is created for the current day, because 30 minutes is required
/// between your current time and the new snapshot time that you specify.
/// </li>
/// </ul>
class AutoSnapshotAddOnRequest {
  /// The daily time when an automatic snapshot will be created.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must be in <code>HH:00</code> format, and in an hourly increment.
  /// </li>
  /// <li>
  /// Specified in Coordinated Universal Time (UTC).
  /// </li>
  /// <li>
  /// The snapshot will be automatically created between the time specified and up
  /// to 45 minutes after.
  /// </li>
  /// </ul>
  final String? snapshotTimeOfDay;

  AutoSnapshotAddOnRequest({
    this.snapshotTimeOfDay,
  });

  Map<String, dynamic> toJson() {
    final snapshotTimeOfDay = this.snapshotTimeOfDay;
    return {
      if (snapshotTimeOfDay != null) 'snapshotTimeOfDay': snapshotTimeOfDay,
    };
  }
}

/// Describes an automatic snapshot.
class AutoSnapshotDetails {
  /// The timestamp when the automatic snapshot was created.
  final DateTime? createdAt;

  /// The date of the automatic snapshot in <code>YYYY-MM-DD</code> format.
  final String? date;

  /// An array of objects that describe the block storage disks attached to the
  /// instance when the automatic snapshot was created.
  final List<AttachedDisk>? fromAttachedDisks;

  /// The status of the automatic snapshot.
  final AutoSnapshotStatus? status;

  AutoSnapshotDetails({
    this.createdAt,
    this.date,
    this.fromAttachedDisks,
    this.status,
  });

  factory AutoSnapshotDetails.fromJson(Map<String, dynamic> json) {
    return AutoSnapshotDetails(
      createdAt: timeStampFromJson(json['createdAt']),
      date: json['date'] as String?,
      fromAttachedDisks: (json['fromAttachedDisks'] as List?)
          ?.whereNotNull()
          .map((e) => AttachedDisk.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toAutoSnapshotStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final date = this.date;
    final fromAttachedDisks = this.fromAttachedDisks;
    final status = this.status;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (date != null) 'date': date,
      if (fromAttachedDisks != null) 'fromAttachedDisks': fromAttachedDisks,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum AutoSnapshotStatus {
  success,
  failed,
  inProgress,
  notFound,
}

extension AutoSnapshotStatusValueExtension on AutoSnapshotStatus {
  String toValue() {
    switch (this) {
      case AutoSnapshotStatus.success:
        return 'Success';
      case AutoSnapshotStatus.failed:
        return 'Failed';
      case AutoSnapshotStatus.inProgress:
        return 'InProgress';
      case AutoSnapshotStatus.notFound:
        return 'NotFound';
    }
  }
}

extension AutoSnapshotStatusFromString on String {
  AutoSnapshotStatus toAutoSnapshotStatus() {
    switch (this) {
      case 'Success':
        return AutoSnapshotStatus.success;
      case 'Failed':
        return AutoSnapshotStatus.failed;
      case 'InProgress':
        return AutoSnapshotStatus.inProgress;
      case 'NotFound':
        return AutoSnapshotStatus.notFound;
    }
    throw Exception('$this is not known in enum AutoSnapshotStatus');
  }
}

/// Describes an Availability Zone. This is returned only as part of a
/// <code>GetRegions</code> request.
class AvailabilityZone {
  /// The state of the Availability Zone.
  final String? state;

  /// The name of the Availability Zone. The format is <code>us-east-2a</code>
  /// (case-sensitive).
  final String? zoneName;

  AvailabilityZone({
    this.state,
    this.zoneName,
  });

  factory AvailabilityZone.fromJson(Map<String, dynamic> json) {
    return AvailabilityZone(
      state: json['state'] as String?,
      zoneName: json['zoneName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final zoneName = this.zoneName;
    return {
      if (state != null) 'state': state,
      if (zoneName != null) 'zoneName': zoneName,
    };
  }
}

enum BPAStatusMessage {
  defaultedForSlrMissing,
  syncOnHold,
  defaultedForSlrMissingOnHold,
  unknown,
}

extension BPAStatusMessageValueExtension on BPAStatusMessage {
  String toValue() {
    switch (this) {
      case BPAStatusMessage.defaultedForSlrMissing:
        return 'DEFAULTED_FOR_SLR_MISSING';
      case BPAStatusMessage.syncOnHold:
        return 'SYNC_ON_HOLD';
      case BPAStatusMessage.defaultedForSlrMissingOnHold:
        return 'DEFAULTED_FOR_SLR_MISSING_ON_HOLD';
      case BPAStatusMessage.unknown:
        return 'Unknown';
    }
  }
}

extension BPAStatusMessageFromString on String {
  BPAStatusMessage toBPAStatusMessage() {
    switch (this) {
      case 'DEFAULTED_FOR_SLR_MISSING':
        return BPAStatusMessage.defaultedForSlrMissing;
      case 'SYNC_ON_HOLD':
        return BPAStatusMessage.syncOnHold;
      case 'DEFAULTED_FOR_SLR_MISSING_ON_HOLD':
        return BPAStatusMessage.defaultedForSlrMissingOnHold;
      case 'Unknown':
        return BPAStatusMessage.unknown;
    }
    throw Exception('$this is not known in enum BPAStatusMessage');
  }
}

enum BehaviorEnum {
  dontCache,
  cache,
}

extension BehaviorEnumValueExtension on BehaviorEnum {
  String toValue() {
    switch (this) {
      case BehaviorEnum.dontCache:
        return 'dont-cache';
      case BehaviorEnum.cache:
        return 'cache';
    }
  }
}

extension BehaviorEnumFromString on String {
  BehaviorEnum toBehaviorEnum() {
    switch (this) {
      case 'dont-cache':
        return BehaviorEnum.dontCache;
      case 'cache':
        return BehaviorEnum.cache;
    }
    throw Exception('$this is not known in enum BehaviorEnum');
  }
}

/// Describes a blueprint (a virtual private server image).
class Blueprint {
  /// Virtual computer blueprints that are supported by Lightsail for Research.
  /// <important>
  /// This parameter only applies to Lightsail for Research resources.
  /// </important>
  final AppCategory? appCategory;

  /// The ID for the virtual private server image (<code>app_wordpress_x_x</code>
  /// or <code>app_lamp_x_x</code>).
  final String? blueprintId;

  /// The description of the blueprint.
  final String? description;

  /// The group name of the blueprint (<code>amazon-linux</code>).
  final String? group;

  /// A Boolean value indicating whether the blueprint is active. Inactive
  /// blueprints are listed to support customers with existing instances but are
  /// not necessarily available for launch of new instances. Blueprints are marked
  /// inactive when they become outdated due to operating system updates or new
  /// application releases.
  final bool? isActive;

  /// The end-user license agreement URL for the image or blueprint.
  final String? licenseUrl;

  /// The minimum bundle power required to run this blueprint. For example, you
  /// need a bundle with a power value of 500 or more to create an instance that
  /// uses a blueprint with a minimum power value of 500. <code>0</code> indicates
  /// that the blueprint runs on all instance sizes.
  final int? minPower;

  /// The friendly name of the blueprint (<code>Amazon Linux</code>).
  final String? name;

  /// The operating system platform (either Linux/Unix-based or Windows
  /// Server-based) of the blueprint.
  final InstancePlatform? platform;

  /// The product URL to learn more about the image or blueprint.
  final String? productUrl;

  /// The type of the blueprint (<code>os</code> or <code>app</code>).
  final BlueprintType? type;

  /// The version number of the operating system, application, or stack (
  /// <code>2016.03.0</code>).
  final String? version;

  /// The version code.
  final String? versionCode;

  Blueprint({
    this.appCategory,
    this.blueprintId,
    this.description,
    this.group,
    this.isActive,
    this.licenseUrl,
    this.minPower,
    this.name,
    this.platform,
    this.productUrl,
    this.type,
    this.version,
    this.versionCode,
  });

  factory Blueprint.fromJson(Map<String, dynamic> json) {
    return Blueprint(
      appCategory: (json['appCategory'] as String?)?.toAppCategory(),
      blueprintId: json['blueprintId'] as String?,
      description: json['description'] as String?,
      group: json['group'] as String?,
      isActive: json['isActive'] as bool?,
      licenseUrl: json['licenseUrl'] as String?,
      minPower: json['minPower'] as int?,
      name: json['name'] as String?,
      platform: (json['platform'] as String?)?.toInstancePlatform(),
      productUrl: json['productUrl'] as String?,
      type: (json['type'] as String?)?.toBlueprintType(),
      version: json['version'] as String?,
      versionCode: json['versionCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appCategory = this.appCategory;
    final blueprintId = this.blueprintId;
    final description = this.description;
    final group = this.group;
    final isActive = this.isActive;
    final licenseUrl = this.licenseUrl;
    final minPower = this.minPower;
    final name = this.name;
    final platform = this.platform;
    final productUrl = this.productUrl;
    final type = this.type;
    final version = this.version;
    final versionCode = this.versionCode;
    return {
      if (appCategory != null) 'appCategory': appCategory.toValue(),
      if (blueprintId != null) 'blueprintId': blueprintId,
      if (description != null) 'description': description,
      if (group != null) 'group': group,
      if (isActive != null) 'isActive': isActive,
      if (licenseUrl != null) 'licenseUrl': licenseUrl,
      if (minPower != null) 'minPower': minPower,
      if (name != null) 'name': name,
      if (platform != null) 'platform': platform.toValue(),
      if (productUrl != null) 'productUrl': productUrl,
      if (type != null) 'type': type.toValue(),
      if (version != null) 'version': version,
      if (versionCode != null) 'versionCode': versionCode,
    };
  }
}

enum BlueprintType {
  os,
  app,
}

extension BlueprintTypeValueExtension on BlueprintType {
  String toValue() {
    switch (this) {
      case BlueprintType.os:
        return 'os';
      case BlueprintType.app:
        return 'app';
    }
  }
}

extension BlueprintTypeFromString on String {
  BlueprintType toBlueprintType() {
    switch (this) {
      case 'os':
        return BlueprintType.os;
      case 'app':
        return BlueprintType.app;
    }
    throw Exception('$this is not known in enum BlueprintType');
  }
}

/// Describes an Amazon Lightsail bucket.
class Bucket {
  /// Indicates whether the bundle that is currently applied to a bucket can be
  /// changed to another bundle.
  ///
  /// You can update a bucket's bundle only one time within a monthly Amazon Web
  /// Services billing cycle.
  ///
  /// Use the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_UpdateBucketBundle.html">UpdateBucketBundle</a>
  /// action to change a bucket's bundle.
  final bool? ableToUpdateBundle;

  /// An object that describes the access log configuration for the bucket.
  final BucketAccessLogConfig? accessLogConfig;

  /// An object that describes the access rules of the bucket.
  final AccessRules? accessRules;

  /// The Amazon Resource Name (ARN) of the bucket.
  final String? arn;

  /// The ID of the bundle currently applied to the bucket.
  ///
  /// A bucket bundle specifies the monthly cost, storage space, and data transfer
  /// quota for a bucket.
  ///
  /// Use the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_UpdateBucketBundle.html">UpdateBucketBundle</a>
  /// action to change the bundle of a bucket.
  final String? bundleId;

  /// The timestamp when the distribution was created.
  final DateTime? createdAt;

  /// An object that describes the location of the bucket, such as the Amazon Web
  /// Services Region and Availability Zone.
  final ResourceLocation? location;

  /// The name of the bucket.
  final String? name;

  /// Indicates whether object versioning is enabled for the bucket.
  ///
  /// The following options can be configured:
  ///
  /// <ul>
  /// <li>
  /// <code>Enabled</code> - Object versioning is enabled.
  /// </li>
  /// <li>
  /// <code>Suspended</code> - Object versioning was previously enabled but is
  /// currently suspended. Existing object versions are retained.
  /// </li>
  /// <li>
  /// <code>NeverEnabled</code> - Object versioning has never been enabled.
  /// </li>
  /// </ul>
  final String? objectVersioning;

  /// An array of strings that specify the Amazon Web Services account IDs that
  /// have read-only access to the bucket.
  final List<String>? readonlyAccessAccounts;

  /// The Lightsail resource type of the bucket.
  final String? resourceType;

  /// An array of objects that describe Lightsail instances that have access to
  /// the bucket.
  ///
  /// Use the <a
  /// href="https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_SetResourceAccessForBucket.html">SetResourceAccessForBucket</a>
  /// action to update the instances that have access to a bucket.
  final List<ResourceReceivingAccess>? resourcesReceivingAccess;

  /// An object that describes the state of the bucket.
  final BucketState? state;

  /// The support code for a bucket. Include this code in your email to support
  /// when you have questions about a Lightsail bucket. This code enables our
  /// support team to look up your Lightsail information more easily.
  final String? supportCode;

  /// The tag keys and optional values for the bucket. For more information, see
  /// <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Tags
  /// in Amazon Lightsail</a> in the <i>Amazon Lightsail Developer Guide</i>.
  final List<Tag>? tags;

  /// The URL of the bucket.
  final String? url;

  Bucket({
    this.ableToUpdateBundle,
    this.accessLogConfig,
    this.accessRules,
    this.arn,
    this.bundleId,
    this.createdAt,
    this.location,
    this.name,
    this.objectVersioning,
    this.readonlyAccessAccounts,
    this.resourceType,
    this.resourcesReceivingAccess,
    this.state,
    this.supportCode,
    this.tags,
    this.url,
  });

  factory Bucket.fromJson(Map<String, dynamic> json) {
    return Bucket(
      ableToUpdateBundle: json['ableToUpdateBundle'] as bool?,
      accessLogConfig: json['accessLogConfig'] != null
          ? BucketAccessLogConfig.fromJson(
              json['accessLogConfig'] as Map<String, dynamic>)
          : null,
      accessRules: json['accessRules'] != null
          ? AccessRules.fromJson(json['accessRules'] as Map<String, dynamic>)
          : null,
      arn: json['arn'] as String?,
      bundleId: json['bundleId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      location: json['location'] != null
          ? ResourceLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      objectVersioning: json['objectVersioning'] as String?,
      readonlyAccessAccounts: (json['readonlyAccessAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      resourceType: json['resourceType'] as String?,
      resourcesReceivingAccess: (json['resourcesReceivingAccess'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ResourceReceivingAccess.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: json['state'] != null
          ? BucketState.fromJson(json['state'] as Map<String, dynamic>)
          : null,
      supportCode: json['supportCode'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ableToUpdateBundle = this.ableToUpdateBundle;
    final accessLogConfig = this.accessLogConfig;
    final accessRules = this.accessRules;
    final arn = this.arn;
    final bundleId = this.bundleId;
    final createdAt = this.createdAt;
    final location = this.location;
    final name = this.name;
    final objectVersioning = this.objectVersioning;
    final readonlyAccessAccounts = this.readonlyAccessAccounts;
    final resourceType = this.resourceType;
    final resourcesReceivingAccess = this.resourcesReceivingAccess;
    final state = this.state;
    final supportCode = this.supportCode;
    final tags = this.tags;
    final url = this.url;
    return {
      if (ableToUpdateBundle != null) 'ableToUpdateBundle': ableToUpdateBundle,
      if (accessLogConfig != null) 'accessLogConfig': accessLogConfig,
      if (accessRules != null) 'accessRules': accessRules,
      if (arn != null) 'arn': arn,
      if (bundleId != null) 'bundleId': bundleId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (location != null) 'location': location,
      if (name != null) 'name': name,
      if (objectVersioning != null) 'objectVersioning': objectVersioning,
      if (readonlyAccessAccounts != null)
        'readonlyAccessAccounts': readonlyAccessAccounts,
      if (resourceType != null) 'resourceType': resourceType,
      if (resourcesReceivingAccess != null)
        'resourcesReceivingAccess': resourcesReceivingAccess,
      if (state != null) 'state': state,
      if (supportCode != null) 'supportCode': supportCode,
      if (tags != null) 'tags': tags,
      if (url != null) 'url': url,
    };
  }
}

/// Describes the access log configuration for a bucket in the Amazon Lightsail
/// object storage service.
///
/// For more information about bucket access logs, see <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-bucket-access-logs">Logging
/// bucket requests using access logging in Amazon Lightsail</a> in the
/// <i>Amazon Lightsail Developer Guide</i>.
class BucketAccessLogConfig {
  /// A Boolean value that indicates whether bucket access logging is enabled for
  /// the bucket.
  final bool enabled;

  /// The name of the bucket where the access logs are saved. The destination can
  /// be a Lightsail bucket in the same account, and in the same Amazon Web
  /// Services Region as the source bucket.
  /// <note>
  /// This parameter is required when enabling the access log for a bucket, and
  /// should be omitted when disabling the access log.
  /// </note>
  final String? destination;

  /// The optional object prefix for the bucket access log.
  ///
  /// The prefix is an optional addition to the object key that organizes your
  /// access log files in the destination bucket. For example, if you specify a
  /// <code>logs/</code> prefix, then each log object will begin with the
  /// <code>logs/</code> prefix in its key (for example,
  /// <code>logs/2021-11-01-21-32-16-E568B2907131C0C0</code>).
  /// <note>
  /// This parameter can be optionally specified when enabling the access log for
  /// a bucket, and should be omitted when disabling the access log.
  /// </note>
  final String? prefix;

  BucketAccessLogConfig({
    required this.enabled,
    this.destination,
    this.prefix,
  });

  factory BucketAccessLogConfig.fromJson(Map<String, dynamic> json) {
    return BucketAccessLogConfig(
      enabled: json['enabled'] as bool,
      destination: json['destination'] as String?,
      prefix: json['prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final destination = this.destination;
    final prefix = this.prefix;
    return {
      'enabled': enabled,
      if (destination != null) 'destination': destination,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

/// Describes the specifications of a bundle that can be applied to an Amazon
/// Lightsail bucket.
///
/// A bucket bundle specifies the monthly cost, storage space, and data transfer
/// quota for a bucket.
class BucketBundle {
  /// The ID of the bundle.
  final String? bundleId;

  /// Indicates whether the bundle is active. Use for a new or existing bucket.
  final bool? isActive;

  /// The name of the bundle.
  final String? name;

  /// The monthly price of the bundle, in US dollars.
  final double? price;

  /// The storage size of the bundle, in GB.
  final int? storagePerMonthInGb;

  /// The monthly network transfer quota of the bundle.
  final int? transferPerMonthInGb;

  BucketBundle({
    this.bundleId,
    this.isActive,
    this.name,
    this.price,
    this.storagePerMonthInGb,
    this.transferPerMonthInGb,
  });

  factory BucketBundle.fromJson(Map<String, dynamic> json) {
    return BucketBundle(
      bundleId: json['bundleId'] as String?,
      isActive: json['isActive'] as bool?,
      name: json['name'] as String?,
      price: json['price'] as double?,
      storagePerMonthInGb: json['storagePerMonthInGb'] as int?,
      transferPerMonthInGb: json['transferPerMonthInGb'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bundleId = this.bundleId;
    final isActive = this.isActive;
    final name = this.name;
    final price = this.price;
    final storagePerMonthInGb = this.storagePerMonthInGb;
    final transferPerMonthInGb = this.transferPerMonthInGb;
    return {
      if (bundleId != null) 'bundleId': bundleId,
      if (isActive != null) 'isActive': isActive,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (storagePerMonthInGb != null)
        'storagePerMonthInGb': storagePerMonthInGb,
      if (transferPerMonthInGb != null)
        'transferPerMonthInGb': transferPerMonthInGb,
    };
  }
}

enum BucketMetricName {
  bucketSizeBytes,
  numberOfObjects,
}

extension BucketMetricNameValueExtension on BucketMetricName {
  String toValue() {
    switch (this) {
      case BucketMetricName.bucketSizeBytes:
        return 'BucketSizeBytes';
      case BucketMetricName.numberOfObjects:
        return 'NumberOfObjects';
    }
  }
}

extension BucketMetricNameFromString on String {
  BucketMetricName toBucketMetricName() {
    switch (this) {
      case 'BucketSizeBytes':
        return BucketMetricName.bucketSizeBytes;
      case 'NumberOfObjects':
        return BucketMetricName.numberOfObjects;
    }
    throw Exception('$this is not known in enum BucketMetricName');
  }
}

/// Describes the state of an Amazon Lightsail bucket.
class BucketState {
  /// The state code of the bucket.
  ///
  /// The following codes are possible:
  ///
  /// <ul>
  /// <li>
  /// <code>OK</code> - The bucket is in a running state.
  /// </li>
  /// <li>
  /// <code>Unknown</code> - Creation of the bucket might have timed-out. You
  /// might want to delete the bucket and create a new one.
  /// </li>
  /// </ul>
  final String? code;

  /// A message that describes the state of the bucket.
  final String? message;

  BucketState({
    this.code,
    this.message,
  });

  factory BucketState.fromJson(Map<String, dynamic> json) {
    return BucketState(
      code: json['code'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'code': code,
      if (message != null) 'message': message,
    };
  }
}

/// Describes a bundle, which is a set of specs describing your virtual private
/// server (or <i>instance</i>).
class Bundle {
  /// The bundle ID (<code>micro_x_x</code>).
  final String? bundleId;

  /// The number of vCPUs included in the bundle (<code>2</code>).
  final int? cpuCount;

  /// The size of the SSD (<code>30</code>).
  final int? diskSizeInGb;

  /// The instance type (<code>micro</code>).
  final String? instanceType;

  /// A Boolean value indicating whether the bundle is active.
  final bool? isActive;

  /// A friendly name for the bundle (<code>Micro</code>).
  final String? name;

  /// A numeric value that represents the power of the bundle (<code>500</code>).
  /// You can use the bundle's power value in conjunction with a blueprint's
  /// minimum power value to determine whether the blueprint will run on the
  /// bundle. For example, you need a bundle with a power value of 500 or more to
  /// create an instance that uses a blueprint with a minimum power value of 500.
  final int? power;

  /// The price in US dollars (<code>5.0</code>) of the bundle.
  final double? price;

  /// An integer that indicates the public ipv4 address count included in the
  /// bundle, the value is either 0 or 1.
  final int? publicIpv4AddressCount;

  /// The amount of RAM in GB (<code>2.0</code>).
  final double? ramSizeInGb;

  /// Virtual computer blueprints that are supported by a Lightsail for Research
  /// bundle.
  /// <important>
  /// This parameter only applies to Lightsail for Research resources.
  /// </important>
  final List<AppCategory>? supportedAppCategories;

  /// The operating system platform (Linux/Unix-based or Windows Server-based)
  /// that the bundle supports. You can only launch a <code>WINDOWS</code> bundle
  /// on a blueprint that supports the <code>WINDOWS</code> platform.
  /// <code>LINUX_UNIX</code> blueprints require a <code>LINUX_UNIX</code> bundle.
  final List<InstancePlatform>? supportedPlatforms;

  /// The data transfer rate per month in GB (<code>2000</code>).
  final int? transferPerMonthInGb;

  Bundle({
    this.bundleId,
    this.cpuCount,
    this.diskSizeInGb,
    this.instanceType,
    this.isActive,
    this.name,
    this.power,
    this.price,
    this.publicIpv4AddressCount,
    this.ramSizeInGb,
    this.supportedAppCategories,
    this.supportedPlatforms,
    this.transferPerMonthInGb,
  });

  factory Bundle.fromJson(Map<String, dynamic> json) {
    return Bundle(
      bundleId: json['bundleId'] as String?,
      cpuCount: json['cpuCount'] as int?,
      diskSizeInGb: json['diskSizeInGb'] as int?,
      instanceType: json['instanceType'] as String?,
      isActive: json['isActive'] as bool?,
      name: json['name'] as String?,
      power: json['power'] as int?,
      price: json['price'] as double?,
      publicIpv4AddressCount: json['publicIpv4AddressCount'] as int?,
      ramSizeInGb: json['ramSizeInGb'] as double?,
      supportedAppCategories: (json['supportedAppCategories'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toAppCategory())
          .toList(),
      supportedPlatforms: (json['supportedPlatforms'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toInstancePlatform())
          .toList(),
      transferPerMonthInGb: json['transferPerMonthInGb'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bundleId = this.bundleId;
    final cpuCount = this.cpuCount;
    final diskSizeInGb = this.diskSizeInGb;
    final instanceType = this.instanceType;
    final isActive = this.isActive;
    final name = this.name;
    final power = this.power;
    final price = this.price;
    final publicIpv4AddressCount = this.publicIpv4AddressCount;
    final ramSizeInGb = this.ramSizeInGb;
    final supportedAppCategories = this.supportedAppCategories;
    final supportedPlatforms = this.supportedPlatforms;
    final transferPerMonthInGb = this.transferPerMonthInGb;
    return {
      if (bundleId != null) 'bundleId': bundleId,
      if (cpuCount != null) 'cpuCount': cpuCount,
      if (diskSizeInGb != null) 'diskSizeInGb': diskSizeInGb,
      if (instanceType != null) 'instanceType': instanceType,
      if (isActive != null) 'isActive': isActive,
      if (name != null) 'name': name,
      if (power != null) 'power': power,
      if (price != null) 'price': price,
      if (publicIpv4AddressCount != null)
        'publicIpv4AddressCount': publicIpv4AddressCount,
      if (ramSizeInGb != null) 'ramSizeInGb': ramSizeInGb,
      if (supportedAppCategories != null)
        'supportedAppCategories':
            supportedAppCategories.map((e) => e.toValue()).toList(),
      if (supportedPlatforms != null)
        'supportedPlatforms':
            supportedPlatforms.map((e) => e.toValue()).toList(),
      if (transferPerMonthInGb != null)
        'transferPerMonthInGb': transferPerMonthInGb,
    };
  }
}

/// Describes the default cache behavior of an Amazon Lightsail content delivery
/// network (CDN) distribution.
class CacheBehavior {
  /// The cache behavior of the distribution.
  ///
  /// The following cache behaviors can be specified:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>cache</code> </b> - This option is best for static sites. When
  /// specified, your distribution caches and serves your entire website as static
  /// content. This behavior is ideal for websites with static content that
  /// doesn't change depending on who views it, or for websites that don't use
  /// cookies, headers, or query strings to personalize content.
  /// </li>
  /// <li>
  /// <b> <code>dont-cache</code> </b> - This option is best for sites that serve
  /// a mix of static and dynamic content. When specified, your distribution
  /// caches and serve only the content that is specified in the distribution's
  /// <code>CacheBehaviorPerPath</code> parameter. This behavior is ideal for
  /// websites or web applications that use cookies, headers, and query strings to
  /// personalize content for individual users.
  /// </li>
  /// </ul>
  final BehaviorEnum? behavior;

  CacheBehavior({
    this.behavior,
  });

  factory CacheBehavior.fromJson(Map<String, dynamic> json) {
    return CacheBehavior(
      behavior: (json['behavior'] as String?)?.toBehaviorEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final behavior = this.behavior;
    return {
      if (behavior != null) 'behavior': behavior.toValue(),
    };
  }
}

/// Describes the per-path cache behavior of an Amazon Lightsail content
/// delivery network (CDN) distribution.
///
/// A per-path cache behavior is used to override, or add an exception to, the
/// default cache behavior of a distribution. For example, if the
/// <code>cacheBehavior</code> is set to <code>cache</code>, then a per-path
/// cache behavior can be used to specify a directory, file, or file type that
/// your distribution will cache. Alternately, if the distribution's
/// <code>cacheBehavior</code> is <code>dont-cache</code>, then a per-path cache
/// behavior can be used to specify a directory, file, or file type that your
/// distribution will not cache.
class CacheBehaviorPerPath {
  /// The cache behavior for the specified path.
  ///
  /// You can specify one of the following per-path cache behaviors:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>cache</code> </b> - This behavior caches the specified path.
  /// </li>
  /// <li>
  /// <b> <code>dont-cache</code> </b> - This behavior doesn't cache the specified
  /// path.
  /// </li>
  /// </ul>
  final BehaviorEnum? behavior;

  /// The path to a directory or file to cached, or not cache. Use an asterisk
  /// symbol to specify wildcard directories (<code>path/to/assets/*</code>), and
  /// file types (<code>*.html, *jpg, *js</code>). Directories and file paths are
  /// case-sensitive.
  ///
  /// Examples:
  ///
  /// <ul>
  /// <li>
  /// Specify the following to cache all files in the document root of an Apache
  /// web server running on a Lightsail instance.
  ///
  /// <code>var/www/html/</code>
  /// </li>
  /// <li>
  /// Specify the following file to cache only the index page in the document root
  /// of an Apache web server.
  ///
  /// <code>var/www/html/index.html</code>
  /// </li>
  /// <li>
  /// Specify the following to cache only the .html files in the document root of
  /// an Apache web server.
  ///
  /// <code>var/www/html/*.html</code>
  /// </li>
  /// <li>
  /// Specify the following to cache only the .jpg, .png, and .gif files in the
  /// images sub-directory of the document root of an Apache web server.
  ///
  /// <code>var/www/html/images/*.jpg</code>
  ///
  /// <code>var/www/html/images/*.png</code>
  ///
  /// <code>var/www/html/images/*.gif</code>
  ///
  /// Specify the following to cache all files in the images sub-directory of the
  /// document root of an Apache web server.
  ///
  /// <code>var/www/html/images/</code>
  /// </li>
  /// </ul>
  final String? path;

  CacheBehaviorPerPath({
    this.behavior,
    this.path,
  });

  factory CacheBehaviorPerPath.fromJson(Map<String, dynamic> json) {
    return CacheBehaviorPerPath(
      behavior: (json['behavior'] as String?)?.toBehaviorEnum(),
      path: json['path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final behavior = this.behavior;
    final path = this.path;
    return {
      if (behavior != null) 'behavior': behavior.toValue(),
      if (path != null) 'path': path,
    };
  }
}

/// Describes the cache settings of an Amazon Lightsail content delivery network
/// (CDN) distribution.
///
/// These settings apply only to your distribution's <code>cacheBehaviors</code>
/// (including the <code>defaultCacheBehavior</code>) that have a
/// <code>behavior</code> of <code>cache</code>.
class CacheSettings {
  /// The HTTP methods that are processed and forwarded to the distribution's
  /// origin.
  ///
  /// You can specify the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>GET,HEAD</code> - The distribution forwards the <code>GET</code> and
  /// <code>HEAD</code> methods.
  /// </li>
  /// <li>
  /// <code>GET,HEAD,OPTIONS</code> - The distribution forwards the
  /// <code>GET</code>, <code>HEAD</code>, and <code>OPTIONS</code> methods.
  /// </li>
  /// <li>
  /// <code>GET,HEAD,OPTIONS,PUT,PATCH,POST,DELETE</code> - The distribution
  /// forwards the <code>GET</code>, <code>HEAD</code>, <code>OPTIONS</code>,
  /// <code>PUT</code>, <code>PATCH</code>, <code>POST</code>, and
  /// <code>DELETE</code> methods.
  /// </li>
  /// </ul>
  /// If you specify the third option, you might need to restrict access to your
  /// distribution's origin so users can't perform operations that you don't want
  /// them to. For example, you might not want users to have permission to delete
  /// objects from your origin.
  final String? allowedHTTPMethods;

  /// The HTTP method responses that are cached by your distribution.
  ///
  /// You can specify the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>GET,HEAD</code> - The distribution caches responses to the
  /// <code>GET</code> and <code>HEAD</code> methods.
  /// </li>
  /// <li>
  /// <code>GET,HEAD,OPTIONS</code> - The distribution caches responses to the
  /// <code>GET</code>, <code>HEAD</code>, and <code>OPTIONS</code> methods.
  /// </li>
  /// </ul>
  final String? cachedHTTPMethods;

  /// The default amount of time that objects stay in the distribution's cache
  /// before the distribution forwards another request to the origin to determine
  /// whether the content has been updated.
  /// <note>
  /// The value specified applies only when the origin does not add HTTP headers
  /// such as <code>Cache-Control max-age</code>, <code>Cache-Control
  /// s-maxage</code>, and <code>Expires</code> to objects.
  /// </note>
  final int? defaultTTL;

  /// An object that describes the cookies that are forwarded to the origin. Your
  /// content is cached based on the cookies that are forwarded.
  final CookieObject? forwardedCookies;

  /// An object that describes the headers that are forwarded to the origin. Your
  /// content is cached based on the headers that are forwarded.
  final HeaderObject? forwardedHeaders;

  /// An object that describes the query strings that are forwarded to the origin.
  /// Your content is cached based on the query strings that are forwarded.
  final QueryStringObject? forwardedQueryStrings;

  /// The maximum amount of time that objects stay in the distribution's cache
  /// before the distribution forwards another request to the origin to determine
  /// whether the object has been updated.
  ///
  /// The value specified applies only when the origin adds HTTP headers such as
  /// <code>Cache-Control max-age</code>, <code>Cache-Control s-maxage</code>, and
  /// <code>Expires</code> to objects.
  final int? maximumTTL;

  /// The minimum amount of time that objects stay in the distribution's cache
  /// before the distribution forwards another request to the origin to determine
  /// whether the object has been updated.
  ///
  /// A value of <code>0</code> must be specified for <code>minimumTTL</code> if
  /// the distribution is configured to forward all headers to the origin.
  final int? minimumTTL;

  CacheSettings({
    this.allowedHTTPMethods,
    this.cachedHTTPMethods,
    this.defaultTTL,
    this.forwardedCookies,
    this.forwardedHeaders,
    this.forwardedQueryStrings,
    this.maximumTTL,
    this.minimumTTL,
  });

  factory CacheSettings.fromJson(Map<String, dynamic> json) {
    return CacheSettings(
      allowedHTTPMethods: json['allowedHTTPMethods'] as String?,
      cachedHTTPMethods: json['cachedHTTPMethods'] as String?,
      defaultTTL: json['defaultTTL'] as int?,
      forwardedCookies: json['forwardedCookies'] != null
          ? CookieObject.fromJson(
              json['forwardedCookies'] as Map<String, dynamic>)
          : null,
      forwardedHeaders: json['forwardedHeaders'] != null
          ? HeaderObject.fromJson(
              json['forwardedHeaders'] as Map<String, dynamic>)
          : null,
      forwardedQueryStrings: json['forwardedQueryStrings'] != null
          ? QueryStringObject.fromJson(
              json['forwardedQueryStrings'] as Map<String, dynamic>)
          : null,
      maximumTTL: json['maximumTTL'] as int?,
      minimumTTL: json['minimumTTL'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedHTTPMethods = this.allowedHTTPMethods;
    final cachedHTTPMethods = this.cachedHTTPMethods;
    final defaultTTL = this.defaultTTL;
    final forwardedCookies = this.forwardedCookies;
    final forwardedHeaders = this.forwardedHeaders;
    final forwardedQueryStrings = this.forwardedQueryStrings;
    final maximumTTL = this.maximumTTL;
    final minimumTTL = this.minimumTTL;
    return {
      if (allowedHTTPMethods != null) 'allowedHTTPMethods': allowedHTTPMethods,
      if (cachedHTTPMethods != null) 'cachedHTTPMethods': cachedHTTPMethods,
      if (defaultTTL != null) 'defaultTTL': defaultTTL,
      if (forwardedCookies != null) 'forwardedCookies': forwardedCookies,
      if (forwardedHeaders != null) 'forwardedHeaders': forwardedHeaders,
      if (forwardedQueryStrings != null)
        'forwardedQueryStrings': forwardedQueryStrings,
      if (maximumTTL != null) 'maximumTTL': maximumTTL,
      if (minimumTTL != null) 'minimumTTL': minimumTTL,
    };
  }
}

/// Describes the full details of an Amazon Lightsail SSL/TLS certificate.
/// <note>
/// To get a summary of a certificate, use the <code>GetCertificates</code>
/// action and omit <code>includeCertificateDetails</code> from your request.
/// The response will include only the certificate Amazon Resource Name (ARN),
/// certificate name, domain name, and tags.
/// </note>
class Certificate {
  /// The Amazon Resource Name (ARN) of the certificate.
  final String? arn;

  /// The timestamp when the certificate was created.
  final DateTime? createdAt;

  /// The domain name of the certificate.
  final String? domainName;

  /// An array of objects that describe the domain validation records of the
  /// certificate.
  final List<DomainValidationRecord>? domainValidationRecords;

  /// The renewal eligibility of the certificate.
  final String? eligibleToRenew;

  /// The number of Lightsail resources that the certificate is attached to.
  final int? inUseResourceCount;

  /// The timestamp when the certificate was issued.
  final DateTime? issuedAt;

  /// The certificate authority that issued the certificate.
  final String? issuerCA;

  /// The algorithm used to generate the key pair (the public and private key) of
  /// the certificate.
  final String? keyAlgorithm;

  /// The name of the certificate (<code>my-certificate</code>).
  final String? name;

  /// The timestamp when the certificate expires.
  final DateTime? notAfter;

  /// The timestamp when the certificate is first valid.
  final DateTime? notBefore;

  /// An object that describes the status of the certificate renewal managed by
  /// Lightsail.
  final RenewalSummary? renewalSummary;

  /// The validation failure reason, if any, of the certificate.
  ///
  /// The following failure reasons are possible:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>NO_AVAILABLE_CONTACTS</code> </b> - This failure applies to email
  /// validation, which is not available for Lightsail certificates.
  /// </li>
  /// <li>
  /// <b> <code>ADDITIONAL_VERIFICATION_REQUIRED</code> </b> - Lightsail requires
  /// additional information to process this certificate request. This can happen
  /// as a fraud-protection measure, such as when the domain ranks within the
  /// Alexa top 1000 websites. To provide the required information, use the <a
  /// href="https://console.aws.amazon.com/support/home">Amazon Web Services
  /// Support Center</a> to contact Amazon Web Services Support.
  /// <note>
  /// You cannot request a certificate for Amazon-owned domain names such as those
  /// ending in amazonaws.com, cloudfront.net, or elasticbeanstalk.com.
  /// </note> </li>
  /// <li>
  /// <b> <code>DOMAIN_NOT_ALLOWED</code> </b> - One or more of the domain names
  /// in the certificate request was reported as an unsafe domain by <a
  /// href="https://www.virustotal.com/gui/home/url">VirusTotal</a>. To correct
  /// the problem, search for your domain name on the <a
  /// href="https://www.virustotal.com/gui/home/url">VirusTotal</a> website. If
  /// your domain is reported as suspicious, see <a
  /// href="https://developers.google.com/web/fundamentals/security/hacked">Google
  /// Help for Hacked Websites</a> to learn what you can do.
  ///
  /// If you believe that the result is a false positive, notify the organization
  /// that is reporting the domain. VirusTotal is an aggregate of several
  /// antivirus and URL scanners and cannot remove your domain from a block list
  /// itself. After you correct the problem and the VirusTotal registry has been
  /// updated, request a new certificate.
  ///
  /// If you see this error and your domain is not included in the VirusTotal
  /// list, visit the <a href="https://console.aws.amazon.com/support/home">Amazon
  /// Web Services Support Center</a> and create a case.
  /// </li>
  /// <li>
  /// <b> <code>INVALID_PUBLIC_DOMAIN</code> </b> - One or more of the domain
  /// names in the certificate request is not valid. Typically, this is because a
  /// domain name in the request is not a valid top-level domain. Try to request a
  /// certificate again, correcting any spelling errors or typos that were in the
  /// failed request, and ensure that all domain names in the request are for
  /// valid top-level domains. For example, you cannot request a certificate for
  /// <code>example.invalidpublicdomain</code> because
  /// <code>invalidpublicdomain</code> is not a valid top-level domain.
  /// </li>
  /// <li>
  /// <b> <code>OTHER</code> </b> - Typically, this failure occurs when there is a
  /// typographical error in one or more of the domain names in the certificate
  /// request. Try to request a certificate again, correcting any spelling errors
  /// or typos that were in the failed request.
  /// </li>
  /// </ul>
  final String? requestFailureReason;

  /// The reason the certificate was revoked. This value is present only when the
  /// certificate status is <code>REVOKED</code>.
  final String? revocationReason;

  /// The timestamp when the certificate was revoked. This value is present only
  /// when the certificate status is <code>REVOKED</code>.
  final DateTime? revokedAt;

  /// The serial number of the certificate.
  final String? serialNumber;

  /// The validation status of the certificate.
  final CertificateStatus? status;

  /// An array of strings that specify the alternate domains
  /// (<code>example2.com</code>) and subdomains (<code>blog.example.com</code>)
  /// of the certificate.
  final List<String>? subjectAlternativeNames;

  /// The support code. Include this code in your email to support when you have
  /// questions about your Lightsail certificate. This code enables our support
  /// team to look up your Lightsail information more easily.
  final String? supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags">Amazon
  /// Lightsail Developer Guide</a>.
  final List<Tag>? tags;

  Certificate({
    this.arn,
    this.createdAt,
    this.domainName,
    this.domainValidationRecords,
    this.eligibleToRenew,
    this.inUseResourceCount,
    this.issuedAt,
    this.issuerCA,
    this.keyAlgorithm,
    this.name,
    this.notAfter,
    this.notBefore,
    this.renewalSummary,
    this.requestFailureReason,
    this.revocationReason,
    this.revokedAt,
    this.serialNumber,
    this.status,
    this.subjectAlternativeNames,
    this.supportCode,
    this.tags,
  });

  factory Certificate.fromJson(Map<String, dynamic> json) {
    return Certificate(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      domainName: json['domainName'] as String?,
      domainValidationRecords: (json['domainValidationRecords'] as List?)
          ?.whereNotNull()
          .map(
              (e) => DomainValidationRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      eligibleToRenew: json['eligibleToRenew'] as String?,
      inUseResourceCount: json['inUseResourceCount'] as int?,
      issuedAt: timeStampFromJson(json['issuedAt']),
      issuerCA: json['issuerCA'] as String?,
      keyAlgorithm: json['keyAlgorithm'] as String?,
      name: json['name'] as String?,
      notAfter: timeStampFromJson(json['notAfter']),
      notBefore: timeStampFromJson(json['notBefore']),
      renewalSummary: json['renewalSummary'] != null
          ? RenewalSummary.fromJson(
              json['renewalSummary'] as Map<String, dynamic>)
          : null,
      requestFailureReason: json['requestFailureReason'] as String?,
      revocationReason: json['revocationReason'] as String?,
      revokedAt: timeStampFromJson(json['revokedAt']),
      serialNumber: json['serialNumber'] as String?,
      status: (json['status'] as String?)?.toCertificateStatus(),
      subjectAlternativeNames: (json['subjectAlternativeNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      supportCode: json['supportCode'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final domainValidationRecords = this.domainValidationRecords;
    final eligibleToRenew = this.eligibleToRenew;
    final inUseResourceCount = this.inUseResourceCount;
    final issuedAt = this.issuedAt;
    final issuerCA = this.issuerCA;
    final keyAlgorithm = this.keyAlgorithm;
    final name = this.name;
    final notAfter = this.notAfter;
    final notBefore = this.notBefore;
    final renewalSummary = this.renewalSummary;
    final requestFailureReason = this.requestFailureReason;
    final revocationReason = this.revocationReason;
    final revokedAt = this.revokedAt;
    final serialNumber = this.serialNumber;
    final status = this.status;
    final subjectAlternativeNames = this.subjectAlternativeNames;
    final supportCode = this.supportCode;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (domainName != null) 'domainName': domainName,
      if (domainValidationRecords != null)
        'domainValidationRecords': domainValidationRecords,
      if (eligibleToRenew != null) 'eligibleToRenew': eligibleToRenew,
      if (inUseResourceCount != null) 'inUseResourceCount': inUseResourceCount,
      if (issuedAt != null) 'issuedAt': unixTimestampToJson(issuedAt),
      if (issuerCA != null) 'issuerCA': issuerCA,
      if (keyAlgorithm != null) 'keyAlgorithm': keyAlgorithm,
      if (name != null) 'name': name,
      if (notAfter != null) 'notAfter': unixTimestampToJson(notAfter),
      if (notBefore != null) 'notBefore': unixTimestampToJson(notBefore),
      if (renewalSummary != null) 'renewalSummary': renewalSummary,
      if (requestFailureReason != null)
        'requestFailureReason': requestFailureReason,
      if (revocationReason != null) 'revocationReason': revocationReason,
      if (revokedAt != null) 'revokedAt': unixTimestampToJson(revokedAt),
      if (serialNumber != null) 'serialNumber': serialNumber,
      if (status != null) 'status': status.toValue(),
      if (subjectAlternativeNames != null)
        'subjectAlternativeNames': subjectAlternativeNames,
      if (supportCode != null) 'supportCode': supportCode,
      if (tags != null) 'tags': tags,
    };
  }
}

enum CertificateDomainValidationStatus {
  pendingValidation,
  failed,
  success,
}

extension CertificateDomainValidationStatusValueExtension
    on CertificateDomainValidationStatus {
  String toValue() {
    switch (this) {
      case CertificateDomainValidationStatus.pendingValidation:
        return 'PENDING_VALIDATION';
      case CertificateDomainValidationStatus.failed:
        return 'FAILED';
      case CertificateDomainValidationStatus.success:
        return 'SUCCESS';
    }
  }
}

extension CertificateDomainValidationStatusFromString on String {
  CertificateDomainValidationStatus toCertificateDomainValidationStatus() {
    switch (this) {
      case 'PENDING_VALIDATION':
        return CertificateDomainValidationStatus.pendingValidation;
      case 'FAILED':
        return CertificateDomainValidationStatus.failed;
      case 'SUCCESS':
        return CertificateDomainValidationStatus.success;
    }
    throw Exception(
        '$this is not known in enum CertificateDomainValidationStatus');
  }
}

enum CertificateProvider {
  letsEncrypt,
}

extension CertificateProviderValueExtension on CertificateProvider {
  String toValue() {
    switch (this) {
      case CertificateProvider.letsEncrypt:
        return 'LetsEncrypt';
    }
  }
}

extension CertificateProviderFromString on String {
  CertificateProvider toCertificateProvider() {
    switch (this) {
      case 'LetsEncrypt':
        return CertificateProvider.letsEncrypt;
    }
    throw Exception('$this is not known in enum CertificateProvider');
  }
}

enum CertificateStatus {
  pendingValidation,
  issued,
  inactive,
  expired,
  validationTimedOut,
  revoked,
  failed,
}

extension CertificateStatusValueExtension on CertificateStatus {
  String toValue() {
    switch (this) {
      case CertificateStatus.pendingValidation:
        return 'PENDING_VALIDATION';
      case CertificateStatus.issued:
        return 'ISSUED';
      case CertificateStatus.inactive:
        return 'INACTIVE';
      case CertificateStatus.expired:
        return 'EXPIRED';
      case CertificateStatus.validationTimedOut:
        return 'VALIDATION_TIMED_OUT';
      case CertificateStatus.revoked:
        return 'REVOKED';
      case CertificateStatus.failed:
        return 'FAILED';
    }
  }
}

extension CertificateStatusFromString on String {
  CertificateStatus toCertificateStatus() {
    switch (this) {
      case 'PENDING_VALIDATION':
        return CertificateStatus.pendingValidation;
      case 'ISSUED':
        return CertificateStatus.issued;
      case 'INACTIVE':
        return CertificateStatus.inactive;
      case 'EXPIRED':
        return CertificateStatus.expired;
      case 'VALIDATION_TIMED_OUT':
        return CertificateStatus.validationTimedOut;
      case 'REVOKED':
        return CertificateStatus.revoked;
      case 'FAILED':
        return CertificateStatus.failed;
    }
    throw Exception('$this is not known in enum CertificateStatus');
  }
}

/// Describes an Amazon Lightsail SSL/TLS certificate.
class CertificateSummary {
  /// The Amazon Resource Name (ARN) of the certificate.
  final String? certificateArn;

  /// An object that describes a certificate in detail.
  final Certificate? certificateDetail;

  /// The name of the certificate.
  final String? certificateName;

  /// The domain name of the certificate.
  final String? domainName;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags">Amazon
  /// Lightsail Developer Guide</a>.
  final List<Tag>? tags;

  CertificateSummary({
    this.certificateArn,
    this.certificateDetail,
    this.certificateName,
    this.domainName,
    this.tags,
  });

  factory CertificateSummary.fromJson(Map<String, dynamic> json) {
    return CertificateSummary(
      certificateArn: json['certificateArn'] as String?,
      certificateDetail: json['certificateDetail'] != null
          ? Certificate.fromJson(
              json['certificateDetail'] as Map<String, dynamic>)
          : null,
      certificateName: json['certificateName'] as String?,
      domainName: json['domainName'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final certificateArn = this.certificateArn;
    final certificateDetail = this.certificateDetail;
    final certificateName = this.certificateName;
    final domainName = this.domainName;
    final tags = this.tags;
    return {
      if (certificateArn != null) 'certificateArn': certificateArn,
      if (certificateDetail != null) 'certificateDetail': certificateDetail,
      if (certificateName != null) 'certificateName': certificateName,
      if (domainName != null) 'domainName': domainName,
      if (tags != null) 'tags': tags,
    };
  }
}

class CloseInstancePublicPortsResult {
  /// An object that describes the result of the action, such as the status of the
  /// request, the timestamp of the request, and the resources affected by the
  /// request.
  final Operation? operation;

  CloseInstancePublicPortsResult({
    this.operation,
  });

  factory CloseInstancePublicPortsResult.fromJson(Map<String, dynamic> json) {
    return CloseInstancePublicPortsResult(
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    return {
      if (operation != null) 'operation': operation,
    };
  }
}

/// Describes a CloudFormation stack record created as a result of the
/// <code>create cloud formation stack</code> action.
///
/// A CloudFormation stack record provides information about the AWS
/// CloudFormation stack used to create a new Amazon Elastic Compute Cloud
/// instance from an exported Lightsail instance snapshot.
class CloudFormationStackRecord {
  /// The Amazon Resource Name (ARN) of the CloudFormation stack record.
  final String? arn;

  /// The date when the CloudFormation stack record was created.
  final DateTime? createdAt;

  /// A list of objects describing the destination service, which is AWS
  /// CloudFormation, and the Amazon Resource Name (ARN) of the AWS CloudFormation
  /// stack.
  final DestinationInfo? destinationInfo;

  /// A list of objects describing the Availability Zone and Amazon Web Services
  /// Region of the CloudFormation stack record.
  final ResourceLocation? location;

  /// The name of the CloudFormation stack record. It starts with
  /// <code>CloudFormationStackRecord</code> followed by a GUID.
  final String? name;

  /// The Lightsail resource type (<code>CloudFormationStackRecord</code>).
  final ResourceType? resourceType;

  /// A list of objects describing the source of the CloudFormation stack record.
  final List<CloudFormationStackRecordSourceInfo>? sourceInfo;

  /// The current state of the CloudFormation stack record.
  final RecordState? state;

  CloudFormationStackRecord({
    this.arn,
    this.createdAt,
    this.destinationInfo,
    this.location,
    this.name,
    this.resourceType,
    this.sourceInfo,
    this.state,
  });

  factory CloudFormationStackRecord.fromJson(Map<String, dynamic> json) {
    return CloudFormationStackRecord(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      destinationInfo: json['destinationInfo'] != null
          ? DestinationInfo.fromJson(
              json['destinationInfo'] as Map<String, dynamic>)
          : null,
      location: json['location'] != null
          ? ResourceLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      sourceInfo: (json['sourceInfo'] as List?)
          ?.whereNotNull()
          .map((e) => CloudFormationStackRecordSourceInfo.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      state: (json['state'] as String?)?.toRecordState(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final destinationInfo = this.destinationInfo;
    final location = this.location;
    final name = this.name;
    final resourceType = this.resourceType;
    final sourceInfo = this.sourceInfo;
    final state = this.state;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (destinationInfo != null) 'destinationInfo': destinationInfo,
      if (location != null) 'location': location,
      if (name != null) 'name': name,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (sourceInfo != null) 'sourceInfo': sourceInfo,
      if (state != null) 'state': state.toValue(),
    };
  }
}

/// Describes the source of a CloudFormation stack record (i.e., the export
/// snapshot record).
class CloudFormationStackRecordSourceInfo {
  /// The Amazon Resource Name (ARN) of the export snapshot record.
  final String? arn;

  /// The name of the record.
  final String? name;

  /// The Lightsail resource type (<code>ExportSnapshotRecord</code>).
  final CloudFormationStackRecordSourceType? resourceType;

  CloudFormationStackRecordSourceInfo({
    this.arn,
    this.name,
    this.resourceType,
  });

  factory CloudFormationStackRecordSourceInfo.fromJson(
      Map<String, dynamic> json) {
    return CloudFormationStackRecordSourceInfo(
      arn: json['arn'] as String?,
      name: json['name'] as String?,
      resourceType: (json['resourceType'] as String?)
          ?.toCloudFormationStackRecordSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final resourceType = this.resourceType;
    return {
      if (arn != null) 'arn': arn,
      if (name != null) 'name': name,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
    };
  }
}

enum CloudFormationStackRecordSourceType {
  exportSnapshotRecord,
}

extension CloudFormationStackRecordSourceTypeValueExtension
    on CloudFormationStackRecordSourceType {
  String toValue() {
    switch (this) {
      case CloudFormationStackRecordSourceType.exportSnapshotRecord:
        return 'ExportSnapshotRecord';
    }
  }
}

extension CloudFormationStackRecordSourceTypeFromString on String {
  CloudFormationStackRecordSourceType toCloudFormationStackRecordSourceType() {
    switch (this) {
      case 'ExportSnapshotRecord':
        return CloudFormationStackRecordSourceType.exportSnapshotRecord;
    }
    throw Exception(
        '$this is not known in enum CloudFormationStackRecordSourceType');
  }
}

enum ComparisonOperator {
  greaterThanOrEqualToThreshold,
  greaterThanThreshold,
  lessThanThreshold,
  lessThanOrEqualToThreshold,
}

extension ComparisonOperatorValueExtension on ComparisonOperator {
  String toValue() {
    switch (this) {
      case ComparisonOperator.greaterThanOrEqualToThreshold:
        return 'GreaterThanOrEqualToThreshold';
      case ComparisonOperator.greaterThanThreshold:
        return 'GreaterThanThreshold';
      case ComparisonOperator.lessThanThreshold:
        return 'LessThanThreshold';
      case ComparisonOperator.lessThanOrEqualToThreshold:
        return 'LessThanOrEqualToThreshold';
    }
  }
}

extension ComparisonOperatorFromString on String {
  ComparisonOperator toComparisonOperator() {
    switch (this) {
      case 'GreaterThanOrEqualToThreshold':
        return ComparisonOperator.greaterThanOrEqualToThreshold;
      case 'GreaterThanThreshold':
        return ComparisonOperator.greaterThanThreshold;
      case 'LessThanThreshold':
        return ComparisonOperator.lessThanThreshold;
      case 'LessThanOrEqualToThreshold':
        return ComparisonOperator.lessThanOrEqualToThreshold;
    }
    throw Exception('$this is not known in enum ComparisonOperator');
  }
}

/// Describes a contact method.
///
/// A contact method is a way to send you notifications. For more information,
/// see <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications
/// in Amazon Lightsail</a>.
class ContactMethod {
  /// The Amazon Resource Name (ARN) of the contact method.
  final String? arn;

  /// The destination of the contact method, such as an email address or a mobile
  /// phone number.
  final String? contactEndpoint;

  /// The timestamp when the contact method was created.
  final DateTime? createdAt;

  /// An object that describes the location of the contact method, such as the
  /// Amazon Web Services Region and Availability Zone.
  final ResourceLocation? location;

  /// The name of the contact method.
  final String? name;

  /// The protocol of the contact method, such as email or SMS (text messaging).
  final ContactProtocol? protocol;

  /// The Lightsail resource type of the contact method.
  final ResourceType? resourceType;

  /// The current status of the contact method.
  ///
  /// A contact method has the following possible status:
  ///
  /// <ul>
  /// <li>
  /// <code>PendingVerification</code> - The contact method has not yet been
  /// verified, and the verification has not yet expired.
  /// </li>
  /// <li>
  /// <code>Valid</code> - The contact method has been verified.
  /// </li>
  /// <li>
  /// <code>InValid</code> - An attempt was made to verify the contact method, but
  /// the verification has expired.
  /// </li>
  /// </ul>
  final ContactMethodStatus? status;

  /// The support code. Include this code in your email to support when you have
  /// questions about your Lightsail contact method. This code enables our support
  /// team to look up your Lightsail information more easily.
  final String? supportCode;

  ContactMethod({
    this.arn,
    this.contactEndpoint,
    this.createdAt,
    this.location,
    this.name,
    this.protocol,
    this.resourceType,
    this.status,
    this.supportCode,
  });

  factory ContactMethod.fromJson(Map<String, dynamic> json) {
    return ContactMethod(
      arn: json['arn'] as String?,
      contactEndpoint: json['contactEndpoint'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      location: json['location'] != null
          ? ResourceLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      protocol: (json['protocol'] as String?)?.toContactProtocol(),
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      status: (json['status'] as String?)?.toContactMethodStatus(),
      supportCode: json['supportCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final contactEndpoint = this.contactEndpoint;
    final createdAt = this.createdAt;
    final location = this.location;
    final name = this.name;
    final protocol = this.protocol;
    final resourceType = this.resourceType;
    final status = this.status;
    final supportCode = this.supportCode;
    return {
      if (arn != null) 'arn': arn,
      if (contactEndpoint != null) 'contactEndpoint': contactEndpoint,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (location != null) 'location': location,
      if (name != null) 'name': name,
      if (protocol != null) 'protocol': protocol.toValue(),
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (status != null) 'status': status.toValue(),
      if (supportCode != null) 'supportCode': supportCode,
    };
  }
}

enum ContactMethodStatus {
  pendingVerification,
  valid,
  invalid,
}

extension ContactMethodStatusValueExtension on ContactMethodStatus {
  String toValue() {
    switch (this) {
      case ContactMethodStatus.pendingVerification:
        return 'PendingVerification';
      case ContactMethodStatus.valid:
        return 'Valid';
      case ContactMethodStatus.invalid:
        return 'Invalid';
    }
  }
}

extension ContactMethodStatusFromString on String {
  ContactMethodStatus toContactMethodStatus() {
    switch (this) {
      case 'PendingVerification':
        return ContactMethodStatus.pendingVerification;
      case 'Valid':
        return ContactMethodStatus.valid;
      case 'Invalid':
        return ContactMethodStatus.invalid;
    }
    throw Exception('$this is not known in enum ContactMethodStatus');
  }
}

enum ContactMethodVerificationProtocol {
  email,
}

extension ContactMethodVerificationProtocolValueExtension
    on ContactMethodVerificationProtocol {
  String toValue() {
    switch (this) {
      case ContactMethodVerificationProtocol.email:
        return 'Email';
    }
  }
}

extension ContactMethodVerificationProtocolFromString on String {
  ContactMethodVerificationProtocol toContactMethodVerificationProtocol() {
    switch (this) {
      case 'Email':
        return ContactMethodVerificationProtocol.email;
    }
    throw Exception(
        '$this is not known in enum ContactMethodVerificationProtocol');
  }
}

enum ContactProtocol {
  email,
  sms,
}

extension ContactProtocolValueExtension on ContactProtocol {
  String toValue() {
    switch (this) {
      case ContactProtocol.email:
        return 'Email';
      case ContactProtocol.sms:
        return 'SMS';
    }
  }
}

extension ContactProtocolFromString on String {
  ContactProtocol toContactProtocol() {
    switch (this) {
      case 'Email':
        return ContactProtocol.email;
      case 'SMS':
        return ContactProtocol.sms;
    }
    throw Exception('$this is not known in enum ContactProtocol');
  }
}

/// Describes the settings of a container that will be launched, or that is
/// launched, to an Amazon Lightsail container service.
class Container {
  /// The launch command for the container.
  final List<String>? command;

  /// The environment variables of the container.
  final Map<String, String>? environment;

  /// The name of the image used for the container.
  ///
  /// Container images sourced from your Lightsail container service, that are
  /// registered and stored on your service, start with a colon (<code>:</code>).
  /// For example, if your container service name is
  /// <code>container-service-1</code>, the container image label is
  /// <code>mystaticsite</code>, and you want to use the third (<code>3</code>)
  /// version of the registered container image, then you should specify
  /// <code>:container-service-1.mystaticsite.3</code>. To use the latest version
  /// of a container image, specify <code>latest</code> instead of a version
  /// number (for example, <code>:container-service-1.mystaticsite.latest</code>).
  /// Lightsail will automatically use the highest numbered version of the
  /// registered container image.
  ///
  /// Container images sourced from a public registry like Docker Hub don't start
  /// with a colon. For example, <code>nginx:latest</code> or <code>nginx</code>.
  final String? image;

  /// The open firewall ports of the container.
  final Map<String, ContainerServiceProtocol>? ports;

  Container({
    this.command,
    this.environment,
    this.image,
    this.ports,
  });

  factory Container.fromJson(Map<String, dynamic> json) {
    return Container(
      command: (json['command'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      environment: (json['environment'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      image: json['image'] as String?,
      ports: (json['ports'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, (e as String).toContainerServiceProtocol())),
    );
  }

  Map<String, dynamic> toJson() {
    final command = this.command;
    final environment = this.environment;
    final image = this.image;
    final ports = this.ports;
    return {
      if (command != null) 'command': command,
      if (environment != null) 'environment': environment,
      if (image != null) 'image': image,
      if (ports != null) 'ports': ports.map((k, e) => MapEntry(k, e.toValue())),
    };
  }
}

/// Describes a container image that is registered to an Amazon Lightsail
/// container service.
class ContainerImage {
  /// The timestamp when the container image was created.
  final DateTime? createdAt;

  /// The digest of the container image.
  final String? digest;

  /// The name of the container image.
  final String? image;

  ContainerImage({
    this.createdAt,
    this.digest,
    this.image,
  });

  factory ContainerImage.fromJson(Map<String, dynamic> json) {
    return ContainerImage(
      createdAt: timeStampFromJson(json['createdAt']),
      digest: json['digest'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final digest = this.digest;
    final image = this.image;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (digest != null) 'digest': digest,
      if (image != null) 'image': image,
    };
  }
}

/// Describes an Amazon Lightsail container service.
class ContainerService {
  /// The Amazon Resource Name (ARN) of the container service.
  final String? arn;

  /// The name of the container service.
  final String? containerServiceName;

  /// The timestamp when the container service was created.
  final DateTime? createdAt;

  /// An object that describes the current container deployment of the container
  /// service.
  final ContainerServiceDeployment? currentDeployment;

  /// A Boolean value indicating whether the container service is disabled.
  final bool? isDisabled;

  /// An object that describes the location of the container service, such as the
  /// Amazon Web Services Region and Availability Zone.
  final ResourceLocation? location;

  /// An object that describes the next deployment of the container service.
  ///
  /// This value is <code>null</code> when there is no deployment in a
  /// <code>pending</code> state.
  final ContainerServiceDeployment? nextDeployment;

  /// The power specification of the container service.
  ///
  /// The power specifies the amount of RAM, the number of vCPUs, and the base
  /// price of the container service.
  final ContainerServicePowerName? power;

  /// The ID of the power of the container service.
  final String? powerId;

  /// The principal ARN of the container service.
  ///
  /// The principal ARN can be used to create a trust relationship between your
  /// standard Amazon Web Services account and your Lightsail container service.
  /// This allows you to give your service permission to access resources in your
  /// standard Amazon Web Services account.
  final String? principalArn;

  /// The private domain name of the container service.
  ///
  /// The private domain name is accessible only by other resources within the
  /// default virtual private cloud (VPC) of your Lightsail account.
  final String? privateDomainName;

  /// An object that describes the configuration for the container service to
  /// access private container image repositories, such as Amazon Elastic
  /// Container Registry (Amazon ECR) private repositories.
  ///
  /// For more information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-service-ecr-private-repo-access">Configuring
  /// access to an Amazon ECR private repository for an Amazon Lightsail container
  /// service</a> in the <i>Amazon Lightsail Developer Guide</i>.
  final PrivateRegistryAccess? privateRegistryAccess;

  /// The public domain name of the container service, such as
  /// <code>example.com</code> and <code>www.example.com</code>.
  ///
  /// You can specify up to four public domain names for a container service. The
  /// domain names that you specify are used when you create a deployment with a
  /// container configured as the public endpoint of your container service.
  ///
  /// If you don't specify public domain names, then you can use the default
  /// domain of the container service.
  /// <important>
  /// You must create and validate an SSL/TLS certificate before you can use
  /// public domain names with your container service. Use the
  /// <code>CreateCertificate</code> action to create a certificate for the public
  /// domain names you want to use with your container service.
  /// </important>
  /// See <code>CreateContainerService</code> or
  /// <code>UpdateContainerService</code> for information about how to specify
  /// public domain names for your Lightsail container service.
  final Map<String, List<String>>? publicDomainNames;

  /// The Lightsail resource type of the container service.
  final ResourceType? resourceType;

  /// The scale specification of the container service.
  ///
  /// The scale specifies the allocated compute nodes of the container service.
  final int? scale;

  /// The current state of the container service.
  ///
  /// The following container service states are possible:
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> - The container service is being created.
  /// </li>
  /// <li>
  /// <code>READY</code> - The container service is running but it does not have
  /// an active container deployment.
  /// </li>
  /// <li>
  /// <code>DEPLOYING</code> - The container service is launching a container
  /// deployment.
  /// </li>
  /// <li>
  /// <code>RUNNING</code> - The container service is running and it has an active
  /// container deployment.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The container service capacity or its custom domains
  /// are being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The container service is being deleted.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> - The container service is disabled, and its active
  /// deployment and containers, if any, are shut down.
  /// </li>
  /// </ul>
  final ContainerServiceState? state;

  /// An object that describes the current state of the container service.
  /// <note>
  /// The state detail is populated only when a container service is in a
  /// <code>PENDING</code>, <code>DEPLOYING</code>, or <code>UPDATING</code>
  /// state.
  /// </note>
  final ContainerServiceStateDetail? stateDetail;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags">Amazon
  /// Lightsail Developer Guide</a>.
  final List<Tag>? tags;

  /// The publicly accessible URL of the container service.
  ///
  /// If no public endpoint is specified in the <code>currentDeployment</code>,
  /// this URL returns a 404 response.
  final String? url;

  ContainerService({
    this.arn,
    this.containerServiceName,
    this.createdAt,
    this.currentDeployment,
    this.isDisabled,
    this.location,
    this.nextDeployment,
    this.power,
    this.powerId,
    this.principalArn,
    this.privateDomainName,
    this.privateRegistryAccess,
    this.publicDomainNames,
    this.resourceType,
    this.scale,
    this.state,
    this.stateDetail,
    this.tags,
    this.url,
  });

  factory ContainerService.fromJson(Map<String, dynamic> json) {
    return ContainerService(
      arn: json['arn'] as String?,
      containerServiceName: json['containerServiceName'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      currentDeployment: json['currentDeployment'] != null
          ? ContainerServiceDeployment.fromJson(
              json['currentDeployment'] as Map<String, dynamic>)
          : null,
      isDisabled: json['isDisabled'] as bool?,
      location: json['location'] != null
          ? ResourceLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      nextDeployment: json['nextDeployment'] != null
          ? ContainerServiceDeployment.fromJson(
              json['nextDeployment'] as Map<String, dynamic>)
          : null,
      power: (json['power'] as String?)?.toContainerServicePowerName(),
      powerId: json['powerId'] as String?,
      principalArn: json['principalArn'] as String?,
      privateDomainName: json['privateDomainName'] as String?,
      privateRegistryAccess: json['privateRegistryAccess'] != null
          ? PrivateRegistryAccess.fromJson(
              json['privateRegistryAccess'] as Map<String, dynamic>)
          : null,
      publicDomainNames: (json['publicDomainNames'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      scale: json['scale'] as int?,
      state: (json['state'] as String?)?.toContainerServiceState(),
      stateDetail: json['stateDetail'] != null
          ? ContainerServiceStateDetail.fromJson(
              json['stateDetail'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final containerServiceName = this.containerServiceName;
    final createdAt = this.createdAt;
    final currentDeployment = this.currentDeployment;
    final isDisabled = this.isDisabled;
    final location = this.location;
    final nextDeployment = this.nextDeployment;
    final power = this.power;
    final powerId = this.powerId;
    final principalArn = this.principalArn;
    final privateDomainName = this.privateDomainName;
    final privateRegistryAccess = this.privateRegistryAccess;
    final publicDomainNames = this.publicDomainNames;
    final resourceType = this.resourceType;
    final scale = this.scale;
    final state = this.state;
    final stateDetail = this.stateDetail;
    final tags = this.tags;
    final url = this.url;
    return {
      if (arn != null) 'arn': arn,
      if (containerServiceName != null)
        'containerServiceName': containerServiceName,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (currentDeployment != null) 'currentDeployment': currentDeployment,
      if (isDisabled != null) 'isDisabled': isDisabled,
      if (location != null) 'location': location,
      if (nextDeployment != null) 'nextDeployment': nextDeployment,
      if (power != null) 'power': power.toValue(),
      if (powerId != null) 'powerId': powerId,
      if (principalArn != null) 'principalArn': principalArn,
      if (privateDomainName != null) 'privateDomainName': privateDomainName,
      if (privateRegistryAccess != null)
        'privateRegistryAccess': privateRegistryAccess,
      if (publicDomainNames != null) 'publicDomainNames': publicDomainNames,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (scale != null) 'scale': scale,
      if (state != null) 'state': state.toValue(),
      if (stateDetail != null) 'stateDetail': stateDetail,
      if (tags != null) 'tags': tags,
      if (url != null) 'url': url,
    };
  }
}

/// Describes a container deployment configuration of an Amazon Lightsail
/// container service.
///
/// A deployment specifies the settings, such as the ports and launch command,
/// of containers that are deployed to your container service.
class ContainerServiceDeployment {
  /// An object that describes the configuration for the containers of the
  /// deployment.
  final Map<String, Container>? containers;

  /// The timestamp when the deployment was created.
  final DateTime? createdAt;

  /// An object that describes the endpoint of the deployment.
  final ContainerServiceEndpoint? publicEndpoint;

  /// The state of the deployment.
  ///
  /// A deployment can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVATING</code> - The deployment is being created.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The deployment was successfully created, and it's
  /// currently running on the container service. The container service can have
  /// only one deployment in an active state at a time.
  /// </li>
  /// <li>
  /// <code>INACTIVE</code> - The deployment was previously successfully created,
  /// but it is not currently running on the container service.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - The deployment failed. Use the
  /// <code>GetContainerLog</code> action to view the log events for the
  /// containers in the deployment to try to determine the reason for the failure.
  /// </li>
  /// </ul>
  final ContainerServiceDeploymentState? state;

  /// The version number of the deployment.
  final int? version;

  ContainerServiceDeployment({
    this.containers,
    this.createdAt,
    this.publicEndpoint,
    this.state,
    this.version,
  });

  factory ContainerServiceDeployment.fromJson(Map<String, dynamic> json) {
    return ContainerServiceDeployment(
      containers: (json['containers'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, Container.fromJson(e as Map<String, dynamic>))),
      createdAt: timeStampFromJson(json['createdAt']),
      publicEndpoint: json['publicEndpoint'] != null
          ? ContainerServiceEndpoint.fromJson(
              json['publicEndpoint'] as Map<String, dynamic>)
          : null,
      state: (json['state'] as String?)?.toContainerServiceDeploymentState(),
      version: json['version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final containers = this.containers;
    final createdAt = this.createdAt;
    final publicEndpoint = this.publicEndpoint;
    final state = this.state;
    final version = this.version;
    return {
      if (containers != null) 'containers': containers,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (publicEndpoint != null) 'publicEndpoint': publicEndpoint,
      if (state != null) 'state': state.toValue(),
      if (version != null) 'version': version,
    };
  }
}

/// Describes a container deployment configuration of an Amazon Lightsail
/// container service.
///
/// A deployment specifies the settings, such as the ports and launch command,
/// of containers that are deployed to your container service.
class ContainerServiceDeploymentRequest {
  /// An object that describes the configuration for the containers of the
  /// deployment.
  final Map<String, Container>? containers;

  /// An object that describes the endpoint of the deployment.
  final EndpointRequest? publicEndpoint;

  ContainerServiceDeploymentRequest({
    this.containers,
    this.publicEndpoint,
  });

  Map<String, dynamic> toJson() {
    final containers = this.containers;
    final publicEndpoint = this.publicEndpoint;
    return {
      if (containers != null) 'containers': containers,
      if (publicEndpoint != null) 'publicEndpoint': publicEndpoint,
    };
  }
}

enum ContainerServiceDeploymentState {
  activating,
  active,
  inactive,
  failed,
}

extension ContainerServiceDeploymentStateValueExtension
    on ContainerServiceDeploymentState {
  String toValue() {
    switch (this) {
      case ContainerServiceDeploymentState.activating:
        return 'ACTIVATING';
      case ContainerServiceDeploymentState.active:
        return 'ACTIVE';
      case ContainerServiceDeploymentState.inactive:
        return 'INACTIVE';
      case ContainerServiceDeploymentState.failed:
        return 'FAILED';
    }
  }
}

extension ContainerServiceDeploymentStateFromString on String {
  ContainerServiceDeploymentState toContainerServiceDeploymentState() {
    switch (this) {
      case 'ACTIVATING':
        return ContainerServiceDeploymentState.activating;
      case 'ACTIVE':
        return ContainerServiceDeploymentState.active;
      case 'INACTIVE':
        return ContainerServiceDeploymentState.inactive;
      case 'FAILED':
        return ContainerServiceDeploymentState.failed;
    }
    throw Exception(
        '$this is not known in enum ContainerServiceDeploymentState');
  }
}

/// Describes the activation status of the role that you can use to grant an
/// Amazon Lightsail container service access to Amazon Elastic Container
/// Registry (Amazon ECR) private repositories.
///
/// When activated, Lightsail creates an Identity and Access Management (IAM)
/// role for the specified Lightsail container service. You can use the ARN of
/// the role to create a trust relationship between your Lightsail container
/// service and an Amazon ECR private repository in your Amazon Web Services
/// account. This allows your container service to pull images from Amazon ECR
/// private repositories. For more information, see <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-service-ecr-private-repo-access">Configuring
/// access to an Amazon ECR private repository for an Amazon Lightsail container
/// service</a> in the <i>Amazon Lightsail Developer Guide</i>.
class ContainerServiceECRImagePullerRole {
  /// A Boolean value that indicates whether the role is activated.
  final bool? isActive;

  /// The Amazon Resource Name (ARN) of the role, if it is activated.
  final String? principalArn;

  ContainerServiceECRImagePullerRole({
    this.isActive,
    this.principalArn,
  });

  factory ContainerServiceECRImagePullerRole.fromJson(
      Map<String, dynamic> json) {
    return ContainerServiceECRImagePullerRole(
      isActive: json['isActive'] as bool?,
      principalArn: json['principalArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isActive = this.isActive;
    final principalArn = this.principalArn;
    return {
      if (isActive != null) 'isActive': isActive,
      if (principalArn != null) 'principalArn': principalArn,
    };
  }
}

/// Describes a request to activate or deactivate the role that you can use to
/// grant an Amazon Lightsail container service access to Amazon Elastic
/// Container Registry (Amazon ECR) private repositories.
///
/// When activated, Lightsail creates an Identity and Access Management (IAM)
/// role for the specified Lightsail container service. You can use the ARN of
/// the role to create a trust relationship between your Lightsail container
/// service and an Amazon ECR private repository in your Amazon Web Services
/// account. This allows your container service to pull images from Amazon ECR
/// private repositories. For more information, see <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-service-ecr-private-repo-access">Configuring
/// access to an Amazon ECR private repository for an Amazon Lightsail container
/// service</a> in the <i>Amazon Lightsail Developer Guide</i>.
class ContainerServiceECRImagePullerRoleRequest {
  /// A Boolean value that indicates whether to activate the role.
  final bool? isActive;

  ContainerServiceECRImagePullerRoleRequest({
    this.isActive,
  });

  Map<String, dynamic> toJson() {
    final isActive = this.isActive;
    return {
      if (isActive != null) 'isActive': isActive,
    };
  }
}

/// Describes the public endpoint configuration of a deployment of an Amazon
/// Lightsail container service.
class ContainerServiceEndpoint {
  /// The name of the container entry of the deployment that the endpoint
  /// configuration applies to.
  final String? containerName;

  /// The port of the specified container to which traffic is forwarded to.
  final int? containerPort;

  /// An object that describes the health check configuration of the container.
  final ContainerServiceHealthCheckConfig? healthCheck;

  ContainerServiceEndpoint({
    this.containerName,
    this.containerPort,
    this.healthCheck,
  });

  factory ContainerServiceEndpoint.fromJson(Map<String, dynamic> json) {
    return ContainerServiceEndpoint(
      containerName: json['containerName'] as String?,
      containerPort: json['containerPort'] as int?,
      healthCheck: json['healthCheck'] != null
          ? ContainerServiceHealthCheckConfig.fromJson(
              json['healthCheck'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final containerName = this.containerName;
    final containerPort = this.containerPort;
    final healthCheck = this.healthCheck;
    return {
      if (containerName != null) 'containerName': containerName,
      if (containerPort != null) 'containerPort': containerPort,
      if (healthCheck != null) 'healthCheck': healthCheck,
    };
  }
}

/// Describes the health check configuration of an Amazon Lightsail container
/// service.
class ContainerServiceHealthCheckConfig {
  /// The number of consecutive health checks successes required before moving the
  /// container to the <code>Healthy</code> state. The default value is
  /// <code>2</code>.
  final int? healthyThreshold;

  /// The approximate interval, in seconds, between health checks of an individual
  /// container. You can specify between 5 and 300 seconds. The default value is
  /// <code>5</code>.
  final int? intervalSeconds;

  /// The path on the container on which to perform the health check. The default
  /// value is <code>/</code>.
  final String? path;

  /// The HTTP codes to use when checking for a successful response from a
  /// container. You can specify values between <code>200</code> and
  /// <code>499</code>. You can specify multiple values (for example,
  /// <code>200,202</code>) or a range of values (for example,
  /// <code>200-299</code>).
  final String? successCodes;

  /// The amount of time, in seconds, during which no response means a failed
  /// health check. You can specify between 2 and 60 seconds. The default value is
  /// <code>2</code>.
  final int? timeoutSeconds;

  /// The number of consecutive health check failures required before moving the
  /// container to the <code>Unhealthy</code> state. The default value is
  /// <code>2</code>.
  final int? unhealthyThreshold;

  ContainerServiceHealthCheckConfig({
    this.healthyThreshold,
    this.intervalSeconds,
    this.path,
    this.successCodes,
    this.timeoutSeconds,
    this.unhealthyThreshold,
  });

  factory ContainerServiceHealthCheckConfig.fromJson(
      Map<String, dynamic> json) {
    return ContainerServiceHealthCheckConfig(
      healthyThreshold: json['healthyThreshold'] as int?,
      intervalSeconds: json['intervalSeconds'] as int?,
      path: json['path'] as String?,
      successCodes: json['successCodes'] as String?,
      timeoutSeconds: json['timeoutSeconds'] as int?,
      unhealthyThreshold: json['unhealthyThreshold'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final healthyThreshold = this.healthyThreshold;
    final intervalSeconds = this.intervalSeconds;
    final path = this.path;
    final successCodes = this.successCodes;
    final timeoutSeconds = this.timeoutSeconds;
    final unhealthyThreshold = this.unhealthyThreshold;
    return {
      if (healthyThreshold != null) 'healthyThreshold': healthyThreshold,
      if (intervalSeconds != null) 'intervalSeconds': intervalSeconds,
      if (path != null) 'path': path,
      if (successCodes != null) 'successCodes': successCodes,
      if (timeoutSeconds != null) 'timeoutSeconds': timeoutSeconds,
      if (unhealthyThreshold != null) 'unhealthyThreshold': unhealthyThreshold,
    };
  }
}

/// Describes the log events of a container of an Amazon Lightsail container
/// service.
class ContainerServiceLogEvent {
  /// The timestamp when the container service log event was created.
  final DateTime? createdAt;

  /// The message of the container service log event.
  final String? message;

  ContainerServiceLogEvent({
    this.createdAt,
    this.message,
  });

  factory ContainerServiceLogEvent.fromJson(Map<String, dynamic> json) {
    return ContainerServiceLogEvent(
      createdAt: timeStampFromJson(json['createdAt']),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final message = this.message;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (message != null) 'message': message,
    };
  }
}

enum ContainerServiceMetricName {
  cPUUtilization,
  memoryUtilization,
}

extension ContainerServiceMetricNameValueExtension
    on ContainerServiceMetricName {
  String toValue() {
    switch (this) {
      case ContainerServiceMetricName.cPUUtilization:
        return 'CPUUtilization';
      case ContainerServiceMetricName.memoryUtilization:
        return 'MemoryUtilization';
    }
  }
}

extension ContainerServiceMetricNameFromString on String {
  ContainerServiceMetricName toContainerServiceMetricName() {
    switch (this) {
      case 'CPUUtilization':
        return ContainerServiceMetricName.cPUUtilization;
      case 'MemoryUtilization':
        return ContainerServiceMetricName.memoryUtilization;
    }
    throw Exception('$this is not known in enum ContainerServiceMetricName');
  }
}

/// Describes the powers that can be specified for an Amazon Lightsail container
/// service.
///
/// The power specifies the amount of RAM, the number of vCPUs, and the base
/// price of the container service.
class ContainerServicePower {
  /// The number of vCPUs included in the power.
  final double? cpuCount;

  /// A Boolean value indicating whether the power is active and can be specified
  /// for container services.
  final bool? isActive;

  /// The friendly name of the power (<code>nano</code>).
  final String? name;

  /// The ID of the power (<code>nano-1</code>).
  final String? powerId;

  /// The monthly price of the power in USD.
  final double? price;

  /// The amount of RAM (in GB) of the power.
  final double? ramSizeInGb;

  ContainerServicePower({
    this.cpuCount,
    this.isActive,
    this.name,
    this.powerId,
    this.price,
    this.ramSizeInGb,
  });

  factory ContainerServicePower.fromJson(Map<String, dynamic> json) {
    return ContainerServicePower(
      cpuCount: json['cpuCount'] as double?,
      isActive: json['isActive'] as bool?,
      name: json['name'] as String?,
      powerId: json['powerId'] as String?,
      price: json['price'] as double?,
      ramSizeInGb: json['ramSizeInGb'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final cpuCount = this.cpuCount;
    final isActive = this.isActive;
    final name = this.name;
    final powerId = this.powerId;
    final price = this.price;
    final ramSizeInGb = this.ramSizeInGb;
    return {
      if (cpuCount != null) 'cpuCount': cpuCount,
      if (isActive != null) 'isActive': isActive,
      if (name != null) 'name': name,
      if (powerId != null) 'powerId': powerId,
      if (price != null) 'price': price,
      if (ramSizeInGb != null) 'ramSizeInGb': ramSizeInGb,
    };
  }
}

enum ContainerServicePowerName {
  nano,
  micro,
  small,
  medium,
  large,
  xlarge,
}

extension ContainerServicePowerNameValueExtension on ContainerServicePowerName {
  String toValue() {
    switch (this) {
      case ContainerServicePowerName.nano:
        return 'nano';
      case ContainerServicePowerName.micro:
        return 'micro';
      case ContainerServicePowerName.small:
        return 'small';
      case ContainerServicePowerName.medium:
        return 'medium';
      case ContainerServicePowerName.large:
        return 'large';
      case ContainerServicePowerName.xlarge:
        return 'xlarge';
    }
  }
}

extension ContainerServicePowerNameFromString on String {
  ContainerServicePowerName toContainerServicePowerName() {
    switch (this) {
      case 'nano':
        return ContainerServicePowerName.nano;
      case 'micro':
        return ContainerServicePowerName.micro;
      case 'small':
        return ContainerServicePowerName.small;
      case 'medium':
        return ContainerServicePowerName.medium;
      case 'large':
        return ContainerServicePowerName.large;
      case 'xlarge':
        return ContainerServicePowerName.xlarge;
    }
    throw Exception('$this is not known in enum ContainerServicePowerName');
  }
}

enum ContainerServiceProtocol {
  http,
  https,
  tcp,
  udp,
}

extension ContainerServiceProtocolValueExtension on ContainerServiceProtocol {
  String toValue() {
    switch (this) {
      case ContainerServiceProtocol.http:
        return 'HTTP';
      case ContainerServiceProtocol.https:
        return 'HTTPS';
      case ContainerServiceProtocol.tcp:
        return 'TCP';
      case ContainerServiceProtocol.udp:
        return 'UDP';
    }
  }
}

extension ContainerServiceProtocolFromString on String {
  ContainerServiceProtocol toContainerServiceProtocol() {
    switch (this) {
      case 'HTTP':
        return ContainerServiceProtocol.http;
      case 'HTTPS':
        return ContainerServiceProtocol.https;
      case 'TCP':
        return ContainerServiceProtocol.tcp;
      case 'UDP':
        return ContainerServiceProtocol.udp;
    }
    throw Exception('$this is not known in enum ContainerServiceProtocol');
  }
}

/// Describes the sign-in credentials for the container image registry of an
/// Amazon Lightsail account.
class ContainerServiceRegistryLogin {
  /// The timestamp of when the container image registry sign-in credentials
  /// expire.
  ///
  /// The log in credentials expire 12 hours after they are created, at which
  /// point you will need to create a new set of log in credentials using the
  /// <code>CreateContainerServiceRegistryLogin</code> action.
  final DateTime? expiresAt;

  /// The container service registry password to use to push container images to
  /// the container image registry of a Lightsail account
  final String? password;

  /// The address to use to push container images to the container image registry
  /// of a Lightsail account.
  final String? registry;

  /// The container service registry username to use to push container images to
  /// the container image registry of a Lightsail account.
  final String? username;

  ContainerServiceRegistryLogin({
    this.expiresAt,
    this.password,
    this.registry,
    this.username,
  });

  factory ContainerServiceRegistryLogin.fromJson(Map<String, dynamic> json) {
    return ContainerServiceRegistryLogin(
      expiresAt: timeStampFromJson(json['expiresAt']),
      password: json['password'] as String?,
      registry: json['registry'] as String?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final expiresAt = this.expiresAt;
    final password = this.password;
    final registry = this.registry;
    final username = this.username;
    return {
      if (expiresAt != null) 'expiresAt': unixTimestampToJson(expiresAt),
      if (password != null) 'password': password,
      if (registry != null) 'registry': registry,
      if (username != null) 'username': username,
    };
  }
}

enum ContainerServiceState {
  pending,
  ready,
  running,
  updating,
  deleting,
  disabled,
  deploying,
}

extension ContainerServiceStateValueExtension on ContainerServiceState {
  String toValue() {
    switch (this) {
      case ContainerServiceState.pending:
        return 'PENDING';
      case ContainerServiceState.ready:
        return 'READY';
      case ContainerServiceState.running:
        return 'RUNNING';
      case ContainerServiceState.updating:
        return 'UPDATING';
      case ContainerServiceState.deleting:
        return 'DELETING';
      case ContainerServiceState.disabled:
        return 'DISABLED';
      case ContainerServiceState.deploying:
        return 'DEPLOYING';
    }
  }
}

extension ContainerServiceStateFromString on String {
  ContainerServiceState toContainerServiceState() {
    switch (this) {
      case 'PENDING':
        return ContainerServiceState.pending;
      case 'READY':
        return ContainerServiceState.ready;
      case 'RUNNING':
        return ContainerServiceState.running;
      case 'UPDATING':
        return ContainerServiceState.updating;
      case 'DELETING':
        return ContainerServiceState.deleting;
      case 'DISABLED':
        return ContainerServiceState.disabled;
      case 'DEPLOYING':
        return ContainerServiceState.deploying;
    }
    throw Exception('$this is not known in enum ContainerServiceState');
  }
}

/// Describes the current state of a container service.
class ContainerServiceStateDetail {
  /// The state code of the container service.
  ///
  /// The following state codes are possible:
  ///
  /// <ul>
  /// <li>
  /// The following state codes are possible if your container service is in a
  /// <code>DEPLOYING</code> or <code>UPDATING</code> state:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING_SYSTEM_RESOURCES</code> - The system resources for your
  /// container service are being created.
  /// </li>
  /// <li>
  /// <code>CREATING_NETWORK_INFRASTRUCTURE</code> - The network infrastructure
  /// for your container service are being created.
  /// </li>
  /// <li>
  /// <code>PROVISIONING_CERTIFICATE</code> - The SSL/TLS certificate for your
  /// container service is being created.
  /// </li>
  /// <li>
  /// <code>PROVISIONING_SERVICE</code> - Your container service is being
  /// provisioned.
  /// </li>
  /// <li>
  /// <code>CREATING_DEPLOYMENT</code> - Your deployment is being created on your
  /// container service.
  /// </li>
  /// <li>
  /// <code>EVALUATING_HEALTH_CHECK</code> - The health of your deployment is
  /// being evaluated.
  /// </li>
  /// <li>
  /// <code>ACTIVATING_DEPLOYMENT</code> - Your deployment is being activated.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// The following state codes are possible if your container service is in a
  /// <code>PENDING</code> state:
  ///
  /// <ul>
  /// <li>
  /// <code>CERTIFICATE_LIMIT_EXCEEDED</code> - The SSL/TLS certificate required
  /// for your container service exceeds the maximum number of certificates
  /// allowed for your account.
  /// </li>
  /// <li>
  /// <code>UNKNOWN_ERROR</code> - An error was experienced when your container
  /// service was being created.
  /// </li>
  /// </ul> </li>
  /// </ul>
  final ContainerServiceStateDetailCode? code;

  /// A message that provides more information for the state code.
  /// <note>
  /// The state detail is populated only when a container service is in a
  /// <code>PENDING</code>, <code>DEPLOYING</code>, or <code>UPDATING</code>
  /// state.
  /// </note>
  final String? message;

  ContainerServiceStateDetail({
    this.code,
    this.message,
  });

  factory ContainerServiceStateDetail.fromJson(Map<String, dynamic> json) {
    return ContainerServiceStateDetail(
      code: (json['code'] as String?)?.toContainerServiceStateDetailCode(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'code': code.toValue(),
      if (message != null) 'message': message,
    };
  }
}

enum ContainerServiceStateDetailCode {
  creatingSystemResources,
  creatingNetworkInfrastructure,
  provisioningCertificate,
  provisioningService,
  creatingDeployment,
  evaluatingHealthCheck,
  activatingDeployment,
  certificateLimitExceeded,
  unknownError,
}

extension ContainerServiceStateDetailCodeValueExtension
    on ContainerServiceStateDetailCode {
  String toValue() {
    switch (this) {
      case ContainerServiceStateDetailCode.creatingSystemResources:
        return 'CREATING_SYSTEM_RESOURCES';
      case ContainerServiceStateDetailCode.creatingNetworkInfrastructure:
        return 'CREATING_NETWORK_INFRASTRUCTURE';
      case ContainerServiceStateDetailCode.provisioningCertificate:
        return 'PROVISIONING_CERTIFICATE';
      case ContainerServiceStateDetailCode.provisioningService:
        return 'PROVISIONING_SERVICE';
      case ContainerServiceStateDetailCode.creatingDeployment:
        return 'CREATING_DEPLOYMENT';
      case ContainerServiceStateDetailCode.evaluatingHealthCheck:
        return 'EVALUATING_HEALTH_CHECK';
      case ContainerServiceStateDetailCode.activatingDeployment:
        return 'ACTIVATING_DEPLOYMENT';
      case ContainerServiceStateDetailCode.certificateLimitExceeded:
        return 'CERTIFICATE_LIMIT_EXCEEDED';
      case ContainerServiceStateDetailCode.unknownError:
        return 'UNKNOWN_ERROR';
    }
  }
}

extension ContainerServiceStateDetailCodeFromString on String {
  ContainerServiceStateDetailCode toContainerServiceStateDetailCode() {
    switch (this) {
      case 'CREATING_SYSTEM_RESOURCES':
        return ContainerServiceStateDetailCode.creatingSystemResources;
      case 'CREATING_NETWORK_INFRASTRUCTURE':
        return ContainerServiceStateDetailCode.creatingNetworkInfrastructure;
      case 'PROVISIONING_CERTIFICATE':
        return ContainerServiceStateDetailCode.provisioningCertificate;
      case 'PROVISIONING_SERVICE':
        return ContainerServiceStateDetailCode.provisioningService;
      case 'CREATING_DEPLOYMENT':
        return ContainerServiceStateDetailCode.creatingDeployment;
      case 'EVALUATING_HEALTH_CHECK':
        return ContainerServiceStateDetailCode.evaluatingHealthCheck;
      case 'ACTIVATING_DEPLOYMENT':
        return ContainerServiceStateDetailCode.activatingDeployment;
      case 'CERTIFICATE_LIMIT_EXCEEDED':
        return ContainerServiceStateDetailCode.certificateLimitExceeded;
      case 'UNKNOWN_ERROR':
        return ContainerServiceStateDetailCode.unknownError;
    }
    throw Exception(
        '$this is not known in enum ContainerServiceStateDetailCode');
  }
}

class ContainerServicesListResult {
  /// An array of objects that describe one or more container services.
  final List<ContainerService>? containerServices;

  ContainerServicesListResult({
    this.containerServices,
  });

  factory ContainerServicesListResult.fromJson(Map<String, dynamic> json) {
    return ContainerServicesListResult(
      containerServices: (json['containerServices'] as List?)
          ?.whereNotNull()
          .map((e) => ContainerService.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final containerServices = this.containerServices;
    return {
      if (containerServices != null) 'containerServices': containerServices,
    };
  }
}

/// Describes whether an Amazon Lightsail content delivery network (CDN)
/// distribution forwards cookies to the origin and, if so, which ones.
///
/// For the cookies that you specify, your distribution caches separate versions
/// of the specified content based on the cookie values in viewer requests.
class CookieObject {
  /// The specific cookies to forward to your distribution's origin.
  final List<String>? cookiesAllowList;

  /// Specifies which cookies to forward to the distribution's origin for a cache
  /// behavior: <code>all</code>, <code>none</code>, or <code>allow-list</code> to
  /// forward only the cookies specified in the <code>cookiesAllowList</code>
  /// parameter.
  final ForwardValues? option;

  CookieObject({
    this.cookiesAllowList,
    this.option,
  });

  factory CookieObject.fromJson(Map<String, dynamic> json) {
    return CookieObject(
      cookiesAllowList: (json['cookiesAllowList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      option: (json['option'] as String?)?.toForwardValues(),
    );
  }

  Map<String, dynamic> toJson() {
    final cookiesAllowList = this.cookiesAllowList;
    final option = this.option;
    return {
      if (cookiesAllowList != null) 'cookiesAllowList': cookiesAllowList,
      if (option != null) 'option': option.toValue(),
    };
  }
}

class CopySnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  CopySnapshotResult({
    this.operations,
  });

  factory CopySnapshotResult.fromJson(Map<String, dynamic> json) {
    return CopySnapshotResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

/// Describes the estimated cost for resources in your Lightsail for Research
/// account.
class CostEstimate {
  /// The cost estimate result that's associated with a time period.
  final List<EstimateByTime>? resultsByTime;

  /// The types of usage that are included in the estimate, such as costs, usage,
  /// or data transfer.
  final String? usageType;

  CostEstimate({
    this.resultsByTime,
    this.usageType,
  });

  factory CostEstimate.fromJson(Map<String, dynamic> json) {
    return CostEstimate(
      resultsByTime: (json['resultsByTime'] as List?)
          ?.whereNotNull()
          .map((e) => EstimateByTime.fromJson(e as Map<String, dynamic>))
          .toList(),
      usageType: json['usageType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resultsByTime = this.resultsByTime;
    final usageType = this.usageType;
    return {
      if (resultsByTime != null) 'resultsByTime': resultsByTime,
      if (usageType != null) 'usageType': usageType,
    };
  }
}

class CreateBucketAccessKeyResult {
  /// An object that describes the access key that is created.
  final AccessKey? accessKey;

  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  CreateBucketAccessKeyResult({
    this.accessKey,
    this.operations,
  });

  factory CreateBucketAccessKeyResult.fromJson(Map<String, dynamic> json) {
    return CreateBucketAccessKeyResult(
      accessKey: json['accessKey'] != null
          ? AccessKey.fromJson(json['accessKey'] as Map<String, dynamic>)
          : null,
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessKey = this.accessKey;
    final operations = this.operations;
    return {
      if (accessKey != null) 'accessKey': accessKey,
      if (operations != null) 'operations': operations,
    };
  }
}

class CreateBucketResult {
  /// An object that describes the bucket that is created.
  final Bucket? bucket;

  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  CreateBucketResult({
    this.bucket,
    this.operations,
  });

  factory CreateBucketResult.fromJson(Map<String, dynamic> json) {
    return CreateBucketResult(
      bucket: json['bucket'] != null
          ? Bucket.fromJson(json['bucket'] as Map<String, dynamic>)
          : null,
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final operations = this.operations;
    return {
      if (bucket != null) 'bucket': bucket,
      if (operations != null) 'operations': operations,
    };
  }
}

class CreateCertificateResult {
  /// An object that describes the certificate created.
  final CertificateSummary? certificate;

  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  CreateCertificateResult({
    this.certificate,
    this.operations,
  });

  factory CreateCertificateResult.fromJson(Map<String, dynamic> json) {
    return CreateCertificateResult(
      certificate: json['certificate'] != null
          ? CertificateSummary.fromJson(
              json['certificate'] as Map<String, dynamic>)
          : null,
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final certificate = this.certificate;
    final operations = this.operations;
    return {
      if (certificate != null) 'certificate': certificate,
      if (operations != null) 'operations': operations,
    };
  }
}

class CreateCloudFormationStackResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  CreateCloudFormationStackResult({
    this.operations,
  });

  factory CreateCloudFormationStackResult.fromJson(Map<String, dynamic> json) {
    return CreateCloudFormationStackResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class CreateContactMethodResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  CreateContactMethodResult({
    this.operations,
  });

  factory CreateContactMethodResult.fromJson(Map<String, dynamic> json) {
    return CreateContactMethodResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class CreateContainerServiceDeploymentResult {
  /// An object that describes a container service.
  final ContainerService? containerService;

  CreateContainerServiceDeploymentResult({
    this.containerService,
  });

  factory CreateContainerServiceDeploymentResult.fromJson(
      Map<String, dynamic> json) {
    return CreateContainerServiceDeploymentResult(
      containerService: json['containerService'] != null
          ? ContainerService.fromJson(
              json['containerService'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final containerService = this.containerService;
    return {
      if (containerService != null) 'containerService': containerService,
    };
  }
}

class CreateContainerServiceRegistryLoginResult {
  /// An object that describes the log in information for the container service
  /// registry of your Lightsail account.
  final ContainerServiceRegistryLogin? registryLogin;

  CreateContainerServiceRegistryLoginResult({
    this.registryLogin,
  });

  factory CreateContainerServiceRegistryLoginResult.fromJson(
      Map<String, dynamic> json) {
    return CreateContainerServiceRegistryLoginResult(
      registryLogin: json['registryLogin'] != null
          ? ContainerServiceRegistryLogin.fromJson(
              json['registryLogin'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final registryLogin = this.registryLogin;
    return {
      if (registryLogin != null) 'registryLogin': registryLogin,
    };
  }
}

class CreateContainerServiceResult {
  /// An object that describes a container service.
  final ContainerService? containerService;

  CreateContainerServiceResult({
    this.containerService,
  });

  factory CreateContainerServiceResult.fromJson(Map<String, dynamic> json) {
    return CreateContainerServiceResult(
      containerService: json['containerService'] != null
          ? ContainerService.fromJson(
              json['containerService'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final containerService = this.containerService;
    return {
      if (containerService != null) 'containerService': containerService,
    };
  }
}

class CreateDiskFromSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  CreateDiskFromSnapshotResult({
    this.operations,
  });

  factory CreateDiskFromSnapshotResult.fromJson(Map<String, dynamic> json) {
    return CreateDiskFromSnapshotResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class CreateDiskResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  CreateDiskResult({
    this.operations,
  });

  factory CreateDiskResult.fromJson(Map<String, dynamic> json) {
    return CreateDiskResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class CreateDiskSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  CreateDiskSnapshotResult({
    this.operations,
  });

  factory CreateDiskSnapshotResult.fromJson(Map<String, dynamic> json) {
    return CreateDiskSnapshotResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class CreateDistributionResult {
  /// An object that describes the distribution created.
  final LightsailDistribution? distribution;

  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final Operation? operation;

  CreateDistributionResult({
    this.distribution,
    this.operation,
  });

  factory CreateDistributionResult.fromJson(Map<String, dynamic> json) {
    return CreateDistributionResult(
      distribution: json['distribution'] != null
          ? LightsailDistribution.fromJson(
              json['distribution'] as Map<String, dynamic>)
          : null,
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final distribution = this.distribution;
    final operation = this.operation;
    return {
      if (distribution != null) 'distribution': distribution,
      if (operation != null) 'operation': operation,
    };
  }
}

class CreateDomainEntryResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final Operation? operation;

  CreateDomainEntryResult({
    this.operation,
  });

  factory CreateDomainEntryResult.fromJson(Map<String, dynamic> json) {
    return CreateDomainEntryResult(
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    return {
      if (operation != null) 'operation': operation,
    };
  }
}

class CreateDomainResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final Operation? operation;

  CreateDomainResult({
    this.operation,
  });

  factory CreateDomainResult.fromJson(Map<String, dynamic> json) {
    return CreateDomainResult(
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    return {
      if (operation != null) 'operation': operation,
    };
  }
}

class CreateGUISessionAccessDetailsResult {
  /// The reason the operation failed.
  final String? failureReason;

  /// The percentage of completion for the operation.
  final int? percentageComplete;

  /// The resource name.
  final String? resourceName;

  /// Returns information about the specified NICE DCV GUI session.
  final List<Session>? sessions;

  /// The status of the operation.
  final Status? status;

  CreateGUISessionAccessDetailsResult({
    this.failureReason,
    this.percentageComplete,
    this.resourceName,
    this.sessions,
    this.status,
  });

  factory CreateGUISessionAccessDetailsResult.fromJson(
      Map<String, dynamic> json) {
    return CreateGUISessionAccessDetailsResult(
      failureReason: json['failureReason'] as String?,
      percentageComplete: json['percentageComplete'] as int?,
      resourceName: json['resourceName'] as String?,
      sessions: (json['sessions'] as List?)
          ?.whereNotNull()
          .map((e) => Session.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final failureReason = this.failureReason;
    final percentageComplete = this.percentageComplete;
    final resourceName = this.resourceName;
    final sessions = this.sessions;
    final status = this.status;
    return {
      if (failureReason != null) 'failureReason': failureReason,
      if (percentageComplete != null) 'percentageComplete': percentageComplete,
      if (resourceName != null) 'resourceName': resourceName,
      if (sessions != null) 'sessions': sessions,
      if (status != null) 'status': status.toValue(),
    };
  }
}

class CreateInstanceSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  CreateInstanceSnapshotResult({
    this.operations,
  });

  factory CreateInstanceSnapshotResult.fromJson(Map<String, dynamic> json) {
    return CreateInstanceSnapshotResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class CreateInstancesFromSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  CreateInstancesFromSnapshotResult({
    this.operations,
  });

  factory CreateInstancesFromSnapshotResult.fromJson(
      Map<String, dynamic> json) {
    return CreateInstancesFromSnapshotResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class CreateInstancesResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  CreateInstancesResult({
    this.operations,
  });

  factory CreateInstancesResult.fromJson(Map<String, dynamic> json) {
    return CreateInstancesResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class CreateKeyPairResult {
  /// An array of key-value pairs containing information about the new key pair
  /// you just created.
  final KeyPair? keyPair;

  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final Operation? operation;

  /// A base64-encoded RSA private key.
  final String? privateKeyBase64;

  /// A base64-encoded public key of the <code>ssh-rsa</code> type.
  final String? publicKeyBase64;

  CreateKeyPairResult({
    this.keyPair,
    this.operation,
    this.privateKeyBase64,
    this.publicKeyBase64,
  });

  factory CreateKeyPairResult.fromJson(Map<String, dynamic> json) {
    return CreateKeyPairResult(
      keyPair: json['keyPair'] != null
          ? KeyPair.fromJson(json['keyPair'] as Map<String, dynamic>)
          : null,
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
      privateKeyBase64: json['privateKeyBase64'] as String?,
      publicKeyBase64: json['publicKeyBase64'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyPair = this.keyPair;
    final operation = this.operation;
    final privateKeyBase64 = this.privateKeyBase64;
    final publicKeyBase64 = this.publicKeyBase64;
    return {
      if (keyPair != null) 'keyPair': keyPair,
      if (operation != null) 'operation': operation,
      if (privateKeyBase64 != null) 'privateKeyBase64': privateKeyBase64,
      if (publicKeyBase64 != null) 'publicKeyBase64': publicKeyBase64,
    };
  }
}

class CreateLoadBalancerResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  CreateLoadBalancerResult({
    this.operations,
  });

  factory CreateLoadBalancerResult.fromJson(Map<String, dynamic> json) {
    return CreateLoadBalancerResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class CreateLoadBalancerTlsCertificateResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  CreateLoadBalancerTlsCertificateResult({
    this.operations,
  });

  factory CreateLoadBalancerTlsCertificateResult.fromJson(
      Map<String, dynamic> json) {
    return CreateLoadBalancerTlsCertificateResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class CreateRelationalDatabaseFromSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  CreateRelationalDatabaseFromSnapshotResult({
    this.operations,
  });

  factory CreateRelationalDatabaseFromSnapshotResult.fromJson(
      Map<String, dynamic> json) {
    return CreateRelationalDatabaseFromSnapshotResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class CreateRelationalDatabaseResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  CreateRelationalDatabaseResult({
    this.operations,
  });

  factory CreateRelationalDatabaseResult.fromJson(Map<String, dynamic> json) {
    return CreateRelationalDatabaseResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class CreateRelationalDatabaseSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  CreateRelationalDatabaseSnapshotResult({
    this.operations,
  });

  factory CreateRelationalDatabaseSnapshotResult.fromJson(
      Map<String, dynamic> json) {
    return CreateRelationalDatabaseSnapshotResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

enum Currency {
  usd,
}

extension CurrencyValueExtension on Currency {
  String toValue() {
    switch (this) {
      case Currency.usd:
        return 'USD';
    }
  }
}

extension CurrencyFromString on String {
  Currency toCurrency() {
    switch (this) {
      case 'USD':
        return Currency.usd;
    }
    throw Exception('$this is not known in enum Currency');
  }
}

class DeleteAlarmResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  DeleteAlarmResult({
    this.operations,
  });

  factory DeleteAlarmResult.fromJson(Map<String, dynamic> json) {
    return DeleteAlarmResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class DeleteAutoSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  DeleteAutoSnapshotResult({
    this.operations,
  });

  factory DeleteAutoSnapshotResult.fromJson(Map<String, dynamic> json) {
    return DeleteAutoSnapshotResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class DeleteBucketAccessKeyResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  DeleteBucketAccessKeyResult({
    this.operations,
  });

  factory DeleteBucketAccessKeyResult.fromJson(Map<String, dynamic> json) {
    return DeleteBucketAccessKeyResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class DeleteBucketResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  DeleteBucketResult({
    this.operations,
  });

  factory DeleteBucketResult.fromJson(Map<String, dynamic> json) {
    return DeleteBucketResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class DeleteCertificateResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  DeleteCertificateResult({
    this.operations,
  });

  factory DeleteCertificateResult.fromJson(Map<String, dynamic> json) {
    return DeleteCertificateResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class DeleteContactMethodResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  DeleteContactMethodResult({
    this.operations,
  });

  factory DeleteContactMethodResult.fromJson(Map<String, dynamic> json) {
    return DeleteContactMethodResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class DeleteContainerImageResult {
  DeleteContainerImageResult();

  factory DeleteContainerImageResult.fromJson(Map<String, dynamic> _) {
    return DeleteContainerImageResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteContainerServiceResult {
  DeleteContainerServiceResult();

  factory DeleteContainerServiceResult.fromJson(Map<String, dynamic> _) {
    return DeleteContainerServiceResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteDiskResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  DeleteDiskResult({
    this.operations,
  });

  factory DeleteDiskResult.fromJson(Map<String, dynamic> json) {
    return DeleteDiskResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class DeleteDiskSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  DeleteDiskSnapshotResult({
    this.operations,
  });

  factory DeleteDiskSnapshotResult.fromJson(Map<String, dynamic> json) {
    return DeleteDiskSnapshotResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class DeleteDistributionResult {
  /// An object that describes the result of the action, such as the status of the
  /// request, the timestamp of the request, and the resources affected by the
  /// request.
  final Operation? operation;

  DeleteDistributionResult({
    this.operation,
  });

  factory DeleteDistributionResult.fromJson(Map<String, dynamic> json) {
    return DeleteDistributionResult(
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    return {
      if (operation != null) 'operation': operation,
    };
  }
}

class DeleteDomainEntryResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final Operation? operation;

  DeleteDomainEntryResult({
    this.operation,
  });

  factory DeleteDomainEntryResult.fromJson(Map<String, dynamic> json) {
    return DeleteDomainEntryResult(
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    return {
      if (operation != null) 'operation': operation,
    };
  }
}

class DeleteDomainResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final Operation? operation;

  DeleteDomainResult({
    this.operation,
  });

  factory DeleteDomainResult.fromJson(Map<String, dynamic> json) {
    return DeleteDomainResult(
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    return {
      if (operation != null) 'operation': operation,
    };
  }
}

class DeleteInstanceResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  DeleteInstanceResult({
    this.operations,
  });

  factory DeleteInstanceResult.fromJson(Map<String, dynamic> json) {
    return DeleteInstanceResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class DeleteInstanceSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  DeleteInstanceSnapshotResult({
    this.operations,
  });

  factory DeleteInstanceSnapshotResult.fromJson(Map<String, dynamic> json) {
    return DeleteInstanceSnapshotResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class DeleteKeyPairResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final Operation? operation;

  DeleteKeyPairResult({
    this.operation,
  });

  factory DeleteKeyPairResult.fromJson(Map<String, dynamic> json) {
    return DeleteKeyPairResult(
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    return {
      if (operation != null) 'operation': operation,
    };
  }
}

class DeleteKnownHostKeysResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  DeleteKnownHostKeysResult({
    this.operations,
  });

  factory DeleteKnownHostKeysResult.fromJson(Map<String, dynamic> json) {
    return DeleteKnownHostKeysResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class DeleteLoadBalancerResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  DeleteLoadBalancerResult({
    this.operations,
  });

  factory DeleteLoadBalancerResult.fromJson(Map<String, dynamic> json) {
    return DeleteLoadBalancerResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class DeleteLoadBalancerTlsCertificateResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  DeleteLoadBalancerTlsCertificateResult({
    this.operations,
  });

  factory DeleteLoadBalancerTlsCertificateResult.fromJson(
      Map<String, dynamic> json) {
    return DeleteLoadBalancerTlsCertificateResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class DeleteRelationalDatabaseResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  DeleteRelationalDatabaseResult({
    this.operations,
  });

  factory DeleteRelationalDatabaseResult.fromJson(Map<String, dynamic> json) {
    return DeleteRelationalDatabaseResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class DeleteRelationalDatabaseSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  DeleteRelationalDatabaseSnapshotResult({
    this.operations,
  });

  factory DeleteRelationalDatabaseSnapshotResult.fromJson(
      Map<String, dynamic> json) {
    return DeleteRelationalDatabaseSnapshotResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

/// Describes the destination of a record.
class DestinationInfo {
  /// The ID of the resource created at the destination.
  final String? id;

  /// The destination service of the record.
  final String? service;

  DestinationInfo({
    this.id,
    this.service,
  });

  factory DestinationInfo.fromJson(Map<String, dynamic> json) {
    return DestinationInfo(
      id: json['id'] as String?,
      service: json['service'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final service = this.service;
    return {
      if (id != null) 'id': id,
      if (service != null) 'service': service,
    };
  }
}

class DetachCertificateFromDistributionResult {
  /// An object that describes the result of the action, such as the status of the
  /// request, the timestamp of the request, and the resources affected by the
  /// request.
  final Operation? operation;

  DetachCertificateFromDistributionResult({
    this.operation,
  });

  factory DetachCertificateFromDistributionResult.fromJson(
      Map<String, dynamic> json) {
    return DetachCertificateFromDistributionResult(
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    return {
      if (operation != null) 'operation': operation,
    };
  }
}

class DetachDiskResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  DetachDiskResult({
    this.operations,
  });

  factory DetachDiskResult.fromJson(Map<String, dynamic> json) {
    return DetachDiskResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class DetachInstancesFromLoadBalancerResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  DetachInstancesFromLoadBalancerResult({
    this.operations,
  });

  factory DetachInstancesFromLoadBalancerResult.fromJson(
      Map<String, dynamic> json) {
    return DetachInstancesFromLoadBalancerResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class DetachStaticIpResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  DetachStaticIpResult({
    this.operations,
  });

  factory DetachStaticIpResult.fromJson(Map<String, dynamic> json) {
    return DetachStaticIpResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class DisableAddOnResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  DisableAddOnResult({
    this.operations,
  });

  factory DisableAddOnResult.fromJson(Map<String, dynamic> json) {
    return DisableAddOnResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

/// Describes a block storage disk.
class Disk {
  /// An array of objects representing the add-ons enabled on the disk.
  final List<AddOn>? addOns;

  /// The Amazon Resource Name (ARN) of the disk.
  final String? arn;

  /// The resources to which the disk is attached.
  final String? attachedTo;

  /// (Discontinued) The attachment state of the disk.
  /// <note>
  /// In releases prior to November 14, 2017, this parameter returned
  /// <code>attached</code> for system disks in the API response. It is now
  /// discontinued, but still included in the response. Use
  /// <code>isAttached</code> instead.
  /// </note>
  final String? attachmentState;

  /// The status of automatically mounting a storage disk to a virtual computer.
  /// <important>
  /// This parameter only applies to Lightsail for Research resources.
  /// </important>
  final AutoMountStatus? autoMountStatus;

  /// The date when the disk was created.
  final DateTime? createdAt;

  /// (Discontinued) The number of GB in use by the disk.
  /// <note>
  /// In releases prior to November 14, 2017, this parameter was not included in
  /// the API response. It is now discontinued.
  /// </note>
  final int? gbInUse;

  /// The input/output operations per second (IOPS) of the disk.
  final int? iops;

  /// A Boolean value indicating whether the disk is attached.
  final bool? isAttached;

  /// A Boolean value indicating whether this disk is a system disk (has an
  /// operating system loaded on it).
  final bool? isSystemDisk;

  /// The AWS Region and Availability Zone where the disk is located.
  final ResourceLocation? location;

  /// The unique name of the disk.
  final String? name;

  /// The disk path.
  final String? path;

  /// The Lightsail resource type (<code>Disk</code>).
  final ResourceType? resourceType;

  /// The size of the disk in GB.
  final int? sizeInGb;

  /// Describes the status of the disk.
  final DiskState? state;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more easily.
  final String? supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags">Amazon
  /// Lightsail Developer Guide</a>.
  final List<Tag>? tags;

  Disk({
    this.addOns,
    this.arn,
    this.attachedTo,
    this.attachmentState,
    this.autoMountStatus,
    this.createdAt,
    this.gbInUse,
    this.iops,
    this.isAttached,
    this.isSystemDisk,
    this.location,
    this.name,
    this.path,
    this.resourceType,
    this.sizeInGb,
    this.state,
    this.supportCode,
    this.tags,
  });

  factory Disk.fromJson(Map<String, dynamic> json) {
    return Disk(
      addOns: (json['addOns'] as List?)
          ?.whereNotNull()
          .map((e) => AddOn.fromJson(e as Map<String, dynamic>))
          .toList(),
      arn: json['arn'] as String?,
      attachedTo: json['attachedTo'] as String?,
      attachmentState: json['attachmentState'] as String?,
      autoMountStatus:
          (json['autoMountStatus'] as String?)?.toAutoMountStatus(),
      createdAt: timeStampFromJson(json['createdAt']),
      gbInUse: json['gbInUse'] as int?,
      iops: json['iops'] as int?,
      isAttached: json['isAttached'] as bool?,
      isSystemDisk: json['isSystemDisk'] as bool?,
      location: json['location'] != null
          ? ResourceLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      path: json['path'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      sizeInGb: json['sizeInGb'] as int?,
      state: (json['state'] as String?)?.toDiskState(),
      supportCode: json['supportCode'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final addOns = this.addOns;
    final arn = this.arn;
    final attachedTo = this.attachedTo;
    final attachmentState = this.attachmentState;
    final autoMountStatus = this.autoMountStatus;
    final createdAt = this.createdAt;
    final gbInUse = this.gbInUse;
    final iops = this.iops;
    final isAttached = this.isAttached;
    final isSystemDisk = this.isSystemDisk;
    final location = this.location;
    final name = this.name;
    final path = this.path;
    final resourceType = this.resourceType;
    final sizeInGb = this.sizeInGb;
    final state = this.state;
    final supportCode = this.supportCode;
    final tags = this.tags;
    return {
      if (addOns != null) 'addOns': addOns,
      if (arn != null) 'arn': arn,
      if (attachedTo != null) 'attachedTo': attachedTo,
      if (attachmentState != null) 'attachmentState': attachmentState,
      if (autoMountStatus != null) 'autoMountStatus': autoMountStatus.toValue(),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (gbInUse != null) 'gbInUse': gbInUse,
      if (iops != null) 'iops': iops,
      if (isAttached != null) 'isAttached': isAttached,
      if (isSystemDisk != null) 'isSystemDisk': isSystemDisk,
      if (location != null) 'location': location,
      if (name != null) 'name': name,
      if (path != null) 'path': path,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (sizeInGb != null) 'sizeInGb': sizeInGb,
      if (state != null) 'state': state.toValue(),
      if (supportCode != null) 'supportCode': supportCode,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Describes a disk.
class DiskInfo {
  /// A Boolean value indicating whether this disk is a system disk (has an
  /// operating system loaded on it).
  final bool? isSystemDisk;

  /// The disk name.
  final String? name;

  /// The disk path.
  final String? path;

  /// The size of the disk in GB (<code>32</code>).
  final int? sizeInGb;

  DiskInfo({
    this.isSystemDisk,
    this.name,
    this.path,
    this.sizeInGb,
  });

  factory DiskInfo.fromJson(Map<String, dynamic> json) {
    return DiskInfo(
      isSystemDisk: json['isSystemDisk'] as bool?,
      name: json['name'] as String?,
      path: json['path'] as String?,
      sizeInGb: json['sizeInGb'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final isSystemDisk = this.isSystemDisk;
    final name = this.name;
    final path = this.path;
    final sizeInGb = this.sizeInGb;
    return {
      if (isSystemDisk != null) 'isSystemDisk': isSystemDisk,
      if (name != null) 'name': name,
      if (path != null) 'path': path,
      if (sizeInGb != null) 'sizeInGb': sizeInGb,
    };
  }
}

/// Describes a block storage disk mapping.
class DiskMap {
  /// The new disk name (<code>my-new-disk</code>).
  final String? newDiskName;

  /// The original disk path exposed to the instance (for example,
  /// <code>/dev/sdh</code>).
  final String? originalDiskPath;

  DiskMap({
    this.newDiskName,
    this.originalDiskPath,
  });

  Map<String, dynamic> toJson() {
    final newDiskName = this.newDiskName;
    final originalDiskPath = this.originalDiskPath;
    return {
      if (newDiskName != null) 'newDiskName': newDiskName,
      if (originalDiskPath != null) 'originalDiskPath': originalDiskPath,
    };
  }
}

/// Describes a block storage disk snapshot.
class DiskSnapshot {
  /// The Amazon Resource Name (ARN) of the disk snapshot.
  final String? arn;

  /// The date when the disk snapshot was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the source disk from which the disk
  /// snapshot was created.
  final String? fromDiskArn;

  /// The unique name of the source disk from which the disk snapshot was created.
  final String? fromDiskName;

  /// The Amazon Resource Name (ARN) of the source instance from which the disk
  /// (system volume) snapshot was created.
  final String? fromInstanceArn;

  /// The unique name of the source instance from which the disk (system volume)
  /// snapshot was created.
  final String? fromInstanceName;

  /// A Boolean value indicating whether the snapshot was created from an
  /// automatic snapshot.
  final bool? isFromAutoSnapshot;

  /// The AWS Region and Availability Zone where the disk snapshot was created.
  final ResourceLocation? location;

  /// The name of the disk snapshot (<code>my-disk-snapshot</code>).
  final String? name;

  /// The progress of the snapshot.
  final String? progress;

  /// The Lightsail resource type (<code>DiskSnapshot</code>).
  final ResourceType? resourceType;

  /// The size of the disk in GB.
  final int? sizeInGb;

  /// The status of the disk snapshot operation.
  final DiskSnapshotState? state;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more easily.
  final String? supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags">Amazon
  /// Lightsail Developer Guide</a>.
  final List<Tag>? tags;

  DiskSnapshot({
    this.arn,
    this.createdAt,
    this.fromDiskArn,
    this.fromDiskName,
    this.fromInstanceArn,
    this.fromInstanceName,
    this.isFromAutoSnapshot,
    this.location,
    this.name,
    this.progress,
    this.resourceType,
    this.sizeInGb,
    this.state,
    this.supportCode,
    this.tags,
  });

  factory DiskSnapshot.fromJson(Map<String, dynamic> json) {
    return DiskSnapshot(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      fromDiskArn: json['fromDiskArn'] as String?,
      fromDiskName: json['fromDiskName'] as String?,
      fromInstanceArn: json['fromInstanceArn'] as String?,
      fromInstanceName: json['fromInstanceName'] as String?,
      isFromAutoSnapshot: json['isFromAutoSnapshot'] as bool?,
      location: json['location'] != null
          ? ResourceLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      progress: json['progress'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      sizeInGb: json['sizeInGb'] as int?,
      state: (json['state'] as String?)?.toDiskSnapshotState(),
      supportCode: json['supportCode'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final fromDiskArn = this.fromDiskArn;
    final fromDiskName = this.fromDiskName;
    final fromInstanceArn = this.fromInstanceArn;
    final fromInstanceName = this.fromInstanceName;
    final isFromAutoSnapshot = this.isFromAutoSnapshot;
    final location = this.location;
    final name = this.name;
    final progress = this.progress;
    final resourceType = this.resourceType;
    final sizeInGb = this.sizeInGb;
    final state = this.state;
    final supportCode = this.supportCode;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (fromDiskArn != null) 'fromDiskArn': fromDiskArn,
      if (fromDiskName != null) 'fromDiskName': fromDiskName,
      if (fromInstanceArn != null) 'fromInstanceArn': fromInstanceArn,
      if (fromInstanceName != null) 'fromInstanceName': fromInstanceName,
      if (isFromAutoSnapshot != null) 'isFromAutoSnapshot': isFromAutoSnapshot,
      if (location != null) 'location': location,
      if (name != null) 'name': name,
      if (progress != null) 'progress': progress,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (sizeInGb != null) 'sizeInGb': sizeInGb,
      if (state != null) 'state': state.toValue(),
      if (supportCode != null) 'supportCode': supportCode,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Describes a disk snapshot.
class DiskSnapshotInfo {
  /// The size of the disk in GB (<code>32</code>).
  final int? sizeInGb;

  DiskSnapshotInfo({
    this.sizeInGb,
  });

  factory DiskSnapshotInfo.fromJson(Map<String, dynamic> json) {
    return DiskSnapshotInfo(
      sizeInGb: json['sizeInGb'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final sizeInGb = this.sizeInGb;
    return {
      if (sizeInGb != null) 'sizeInGb': sizeInGb,
    };
  }
}

enum DiskSnapshotState {
  pending,
  completed,
  error,
  unknown,
}

extension DiskSnapshotStateValueExtension on DiskSnapshotState {
  String toValue() {
    switch (this) {
      case DiskSnapshotState.pending:
        return 'pending';
      case DiskSnapshotState.completed:
        return 'completed';
      case DiskSnapshotState.error:
        return 'error';
      case DiskSnapshotState.unknown:
        return 'unknown';
    }
  }
}

extension DiskSnapshotStateFromString on String {
  DiskSnapshotState toDiskSnapshotState() {
    switch (this) {
      case 'pending':
        return DiskSnapshotState.pending;
      case 'completed':
        return DiskSnapshotState.completed;
      case 'error':
        return DiskSnapshotState.error;
      case 'unknown':
        return DiskSnapshotState.unknown;
    }
    throw Exception('$this is not known in enum DiskSnapshotState');
  }
}

enum DiskState {
  pending,
  error,
  available,
  inUse,
  unknown,
}

extension DiskStateValueExtension on DiskState {
  String toValue() {
    switch (this) {
      case DiskState.pending:
        return 'pending';
      case DiskState.error:
        return 'error';
      case DiskState.available:
        return 'available';
      case DiskState.inUse:
        return 'in-use';
      case DiskState.unknown:
        return 'unknown';
    }
  }
}

extension DiskStateFromString on String {
  DiskState toDiskState() {
    switch (this) {
      case 'pending':
        return DiskState.pending;
      case 'error':
        return DiskState.error;
      case 'available':
        return DiskState.available;
      case 'in-use':
        return DiskState.inUse;
      case 'unknown':
        return DiskState.unknown;
    }
    throw Exception('$this is not known in enum DiskState');
  }
}

/// Describes the specifications of a distribution bundle.
class DistributionBundle {
  /// The ID of the bundle.
  final String? bundleId;

  /// Indicates whether the bundle is active, and can be specified for a new or
  /// existing distribution.
  final bool? isActive;

  /// The name of the distribution bundle.
  final String? name;

  /// The monthly price, in US dollars, of the bundle.
  final double? price;

  /// The monthly network transfer quota of the bundle.
  final int? transferPerMonthInGb;

  DistributionBundle({
    this.bundleId,
    this.isActive,
    this.name,
    this.price,
    this.transferPerMonthInGb,
  });

  factory DistributionBundle.fromJson(Map<String, dynamic> json) {
    return DistributionBundle(
      bundleId: json['bundleId'] as String?,
      isActive: json['isActive'] as bool?,
      name: json['name'] as String?,
      price: json['price'] as double?,
      transferPerMonthInGb: json['transferPerMonthInGb'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bundleId = this.bundleId;
    final isActive = this.isActive;
    final name = this.name;
    final price = this.price;
    final transferPerMonthInGb = this.transferPerMonthInGb;
    return {
      if (bundleId != null) 'bundleId': bundleId,
      if (isActive != null) 'isActive': isActive,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (transferPerMonthInGb != null)
        'transferPerMonthInGb': transferPerMonthInGb,
    };
  }
}

enum DistributionMetricName {
  requests,
  bytesDownloaded,
  bytesUploaded,
  totalErrorRate,
  http4xxErrorRate,
  http5xxErrorRate,
}

extension DistributionMetricNameValueExtension on DistributionMetricName {
  String toValue() {
    switch (this) {
      case DistributionMetricName.requests:
        return 'Requests';
      case DistributionMetricName.bytesDownloaded:
        return 'BytesDownloaded';
      case DistributionMetricName.bytesUploaded:
        return 'BytesUploaded';
      case DistributionMetricName.totalErrorRate:
        return 'TotalErrorRate';
      case DistributionMetricName.http4xxErrorRate:
        return 'Http4xxErrorRate';
      case DistributionMetricName.http5xxErrorRate:
        return 'Http5xxErrorRate';
    }
  }
}

extension DistributionMetricNameFromString on String {
  DistributionMetricName toDistributionMetricName() {
    switch (this) {
      case 'Requests':
        return DistributionMetricName.requests;
      case 'BytesDownloaded':
        return DistributionMetricName.bytesDownloaded;
      case 'BytesUploaded':
        return DistributionMetricName.bytesUploaded;
      case 'TotalErrorRate':
        return DistributionMetricName.totalErrorRate;
      case 'Http4xxErrorRate':
        return DistributionMetricName.http4xxErrorRate;
      case 'Http5xxErrorRate':
        return DistributionMetricName.http5xxErrorRate;
    }
    throw Exception('$this is not known in enum DistributionMetricName');
  }
}

/// Describes the creation state of the canonical name (CNAME) records that are
/// automatically added by Amazon Lightsail to the DNS of a domain to validate
/// domain ownership for an SSL/TLS certificate.
///
/// When you create an SSL/TLS certificate for a Lightsail resource, you must
/// add a set of CNAME records to the DNS of the domains for the certificate to
/// validate that you own the domains. Lightsail can automatically add the CNAME
/// records to the DNS of the domain if the DNS zone for the domain exists
/// within your Lightsail account. If automatic record addition fails, or if you
/// manage the DNS of your domain using a third-party service, then you must
/// manually add the CNAME records to the DNS of your domain. For more
/// information, see <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/verify-tls-ssl-certificate-using-dns-cname-https">Verify
/// an SSL/TLS certificate in Amazon Lightsail</a> in the <i>Amazon Lightsail
/// Developer Guide</i>.
class DnsRecordCreationState {
  /// The status code for the automated DNS record creation.
  ///
  /// Following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>SUCCEEDED</code> - The validation records were successfully added to
  /// the domain.
  /// </li>
  /// <li>
  /// <code>STARTED</code> - The automatic DNS record creation has started.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - The validation records failed to be added to the
  /// domain.
  /// </li>
  /// </ul>
  final DnsRecordCreationStateCode? code;

  /// The message that describes the reason for the status code.
  final String? message;

  DnsRecordCreationState({
    this.code,
    this.message,
  });

  factory DnsRecordCreationState.fromJson(Map<String, dynamic> json) {
    return DnsRecordCreationState(
      code: (json['code'] as String?)?.toDnsRecordCreationStateCode(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'code': code.toValue(),
      if (message != null) 'message': message,
    };
  }
}

enum DnsRecordCreationStateCode {
  succeeded,
  started,
  failed,
}

extension DnsRecordCreationStateCodeValueExtension
    on DnsRecordCreationStateCode {
  String toValue() {
    switch (this) {
      case DnsRecordCreationStateCode.succeeded:
        return 'SUCCEEDED';
      case DnsRecordCreationStateCode.started:
        return 'STARTED';
      case DnsRecordCreationStateCode.failed:
        return 'FAILED';
    }
  }
}

extension DnsRecordCreationStateCodeFromString on String {
  DnsRecordCreationStateCode toDnsRecordCreationStateCode() {
    switch (this) {
      case 'SUCCEEDED':
        return DnsRecordCreationStateCode.succeeded;
      case 'STARTED':
        return DnsRecordCreationStateCode.started;
      case 'FAILED':
        return DnsRecordCreationStateCode.failed;
    }
    throw Exception('$this is not known in enum DnsRecordCreationStateCode');
  }
}

/// Describes a domain where you are storing recordsets.
class Domain {
  /// The Amazon Resource Name (ARN) of the domain recordset
  /// (<code>arn:aws:lightsail:global:123456789101:Domain/824cede0-abc7-4f84-8dbc-12345EXAMPLE</code>).
  final String? arn;

  /// The date when the domain recordset was created.
  final DateTime? createdAt;

  /// An array of key-value pairs containing information about the domain entries.
  final List<DomainEntry>? domainEntries;

  /// The AWS Region and Availability Zones where the domain recordset was
  /// created.
  final ResourceLocation? location;

  /// The name of the domain.
  final String? name;

  /// An object that describes the state of the Route 53 domain delegation to a
  /// Lightsail DNS zone.
  final RegisteredDomainDelegationInfo? registeredDomainDelegationInfo;

  /// The resource type.
  final ResourceType? resourceType;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more easily.
  final String? supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags">Amazon
  /// Lightsail Developer Guide</a>.
  final List<Tag>? tags;

  Domain({
    this.arn,
    this.createdAt,
    this.domainEntries,
    this.location,
    this.name,
    this.registeredDomainDelegationInfo,
    this.resourceType,
    this.supportCode,
    this.tags,
  });

  factory Domain.fromJson(Map<String, dynamic> json) {
    return Domain(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      domainEntries: (json['domainEntries'] as List?)
          ?.whereNotNull()
          .map((e) => DomainEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      location: json['location'] != null
          ? ResourceLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      registeredDomainDelegationInfo: json['registeredDomainDelegationInfo'] !=
              null
          ? RegisteredDomainDelegationInfo.fromJson(
              json['registeredDomainDelegationInfo'] as Map<String, dynamic>)
          : null,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      supportCode: json['supportCode'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final domainEntries = this.domainEntries;
    final location = this.location;
    final name = this.name;
    final registeredDomainDelegationInfo = this.registeredDomainDelegationInfo;
    final resourceType = this.resourceType;
    final supportCode = this.supportCode;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (domainEntries != null) 'domainEntries': domainEntries,
      if (location != null) 'location': location,
      if (name != null) 'name': name,
      if (registeredDomainDelegationInfo != null)
        'registeredDomainDelegationInfo': registeredDomainDelegationInfo,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (supportCode != null) 'supportCode': supportCode,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Describes a domain recordset entry.
class DomainEntry {
  /// The ID of the domain recordset entry.
  final String? id;

  /// When <code>true</code>, specifies whether the domain entry is an alias used
  /// by the Lightsail load balancer, Lightsail container service, Lightsail
  /// content delivery network (CDN) distribution, or another Amazon Web Services
  /// resource. You can include an alias (A type) record in your request, which
  /// points to the DNS name of a load balancer, container service, CDN
  /// distribution, or other Amazon Web Services resource and routes traffic to
  /// that resource.
  final bool? isAlias;

  /// The name of the domain.
  final String? name;

  /// (Discontinued) The options for the domain entry.
  /// <note>
  /// In releases prior to November 29, 2017, this parameter was not included in
  /// the API response. It is now discontinued.
  /// </note>
  final Map<String, String>? options;

  /// The target IP address (<code>192.0.2.0</code>), or AWS name server
  /// (<code>ns-111.awsdns-22.com.</code>).
  ///
  /// For Lightsail load balancers, the value looks like
  /// <code>ab1234c56789c6b86aba6fb203d443bc-123456789.us-east-2.elb.amazonaws.com</code>.
  /// For Lightsail distributions, the value looks like
  /// <code>exampled1182ne.cloudfront.net</code>. For Lightsail container
  /// services, the value looks like
  /// <code>container-service-1.example23scljs.us-west-2.cs.amazonlightsail.com</code>.
  /// Be sure to also set <code>isAlias</code> to <code>true</code> when setting
  /// up an A record for a Lightsail load balancer, distribution, or container
  /// service.
  final String? target;

  /// The type of domain entry, such as address for IPv4 (A), address for IPv6
  /// (AAAA), canonical name (CNAME), mail exchanger (MX), name server (NS), start
  /// of authority (SOA), service locator (SRV), or text (TXT).
  ///
  /// The following domain entry types can be used:
  ///
  /// <ul>
  /// <li>
  /// <code>A</code>
  /// </li>
  /// <li>
  /// <code>AAAA</code>
  /// </li>
  /// <li>
  /// <code>CNAME</code>
  /// </li>
  /// <li>
  /// <code>MX</code>
  /// </li>
  /// <li>
  /// <code>NS</code>
  /// </li>
  /// <li>
  /// <code>SOA</code>
  /// </li>
  /// <li>
  /// <code>SRV</code>
  /// </li>
  /// <li>
  /// <code>TXT</code>
  /// </li>
  /// </ul>
  final String? type;

  DomainEntry({
    this.id,
    this.isAlias,
    this.name,
    this.options,
    this.target,
    this.type,
  });

  factory DomainEntry.fromJson(Map<String, dynamic> json) {
    return DomainEntry(
      id: json['id'] as String?,
      isAlias: json['isAlias'] as bool?,
      name: json['name'] as String?,
      options: (json['options'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      target: json['target'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final isAlias = this.isAlias;
    final name = this.name;
    final options = this.options;
    final target = this.target;
    final type = this.type;
    return {
      if (id != null) 'id': id,
      if (isAlias != null) 'isAlias': isAlias,
      if (name != null) 'name': name,
      if (options != null) 'options': options,
      if (target != null) 'target': target,
      if (type != null) 'type': type,
    };
  }
}

/// Describes the domain name system (DNS) records that you must add to the DNS
/// of your registered domain to validate ownership for an Amazon Lightsail
/// SSL/TLS certificate.
class DomainValidationRecord {
  /// An object that describes the state of the canonical name (CNAME) records
  /// that are automatically added by Lightsail to the DNS of the domain to
  /// validate domain ownership.
  final DnsRecordCreationState? dnsRecordCreationState;

  /// The domain name of the certificate validation record. For example,
  /// <code>example.com</code> or <code>www.example.com</code>.
  final String? domainName;

  /// An object that describes the DNS records to add to your domain's DNS to
  /// validate it for the certificate.
  final ResourceRecord? resourceRecord;

  /// The validation status of the record.
  final CertificateDomainValidationStatus? validationStatus;

  DomainValidationRecord({
    this.dnsRecordCreationState,
    this.domainName,
    this.resourceRecord,
    this.validationStatus,
  });

  factory DomainValidationRecord.fromJson(Map<String, dynamic> json) {
    return DomainValidationRecord(
      dnsRecordCreationState: json['dnsRecordCreationState'] != null
          ? DnsRecordCreationState.fromJson(
              json['dnsRecordCreationState'] as Map<String, dynamic>)
          : null,
      domainName: json['domainName'] as String?,
      resourceRecord: json['resourceRecord'] != null
          ? ResourceRecord.fromJson(
              json['resourceRecord'] as Map<String, dynamic>)
          : null,
      validationStatus: (json['validationStatus'] as String?)
          ?.toCertificateDomainValidationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final dnsRecordCreationState = this.dnsRecordCreationState;
    final domainName = this.domainName;
    final resourceRecord = this.resourceRecord;
    final validationStatus = this.validationStatus;
    return {
      if (dnsRecordCreationState != null)
        'dnsRecordCreationState': dnsRecordCreationState,
      if (domainName != null) 'domainName': domainName,
      if (resourceRecord != null) 'resourceRecord': resourceRecord,
      if (validationStatus != null)
        'validationStatus': validationStatus.toValue(),
    };
  }
}

class DownloadDefaultKeyPairResult {
  /// The timestamp when the default key pair was created.
  final DateTime? createdAt;

  /// A base64-encoded RSA private key.
  final String? privateKeyBase64;

  /// A base64-encoded public key of the <code>ssh-rsa</code> type.
  final String? publicKeyBase64;

  DownloadDefaultKeyPairResult({
    this.createdAt,
    this.privateKeyBase64,
    this.publicKeyBase64,
  });

  factory DownloadDefaultKeyPairResult.fromJson(Map<String, dynamic> json) {
    return DownloadDefaultKeyPairResult(
      createdAt: timeStampFromJson(json['createdAt']),
      privateKeyBase64: json['privateKeyBase64'] as String?,
      publicKeyBase64: json['publicKeyBase64'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final privateKeyBase64 = this.privateKeyBase64;
    final publicKeyBase64 = this.publicKeyBase64;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (privateKeyBase64 != null) 'privateKeyBase64': privateKeyBase64,
      if (publicKeyBase64 != null) 'publicKeyBase64': publicKeyBase64,
    };
  }
}

class EnableAddOnResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  EnableAddOnResult({
    this.operations,
  });

  factory EnableAddOnResult.fromJson(Map<String, dynamic> json) {
    return EnableAddOnResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

/// Describes the settings of a public endpoint for an Amazon Lightsail
/// container service.
class EndpointRequest {
  /// The name of the container for the endpoint.
  final String containerName;

  /// The port of the container to which traffic is forwarded to.
  final int containerPort;

  /// An object that describes the health check configuration of the container.
  final ContainerServiceHealthCheckConfig? healthCheck;

  EndpointRequest({
    required this.containerName,
    required this.containerPort,
    this.healthCheck,
  });

  Map<String, dynamic> toJson() {
    final containerName = this.containerName;
    final containerPort = this.containerPort;
    final healthCheck = this.healthCheck;
    return {
      'containerName': containerName,
      'containerPort': containerPort,
      if (healthCheck != null) 'healthCheck': healthCheck,
    };
  }
}

/// An estimate that's associated with a time period.
class EstimateByTime {
  /// The currency of the estimate in USD.
  final Currency? currency;

  /// The unit of measurement that's used for the cost estimate.
  final PricingUnit? pricingUnit;

  /// The period of time, in days, that an estimate covers. The period has a start
  /// date and an end date. The start date must come before the end date.
  final TimePeriod? timePeriod;

  /// The number of pricing units used to calculate the total number of hours. For
  /// example, 1 unit equals 1 hour.
  final double? unit;

  /// The amount of cost or usage that's measured for the cost estimate.
  final double? usageCost;

  EstimateByTime({
    this.currency,
    this.pricingUnit,
    this.timePeriod,
    this.unit,
    this.usageCost,
  });

  factory EstimateByTime.fromJson(Map<String, dynamic> json) {
    return EstimateByTime(
      currency: (json['currency'] as String?)?.toCurrency(),
      pricingUnit: (json['pricingUnit'] as String?)?.toPricingUnit(),
      timePeriod: json['timePeriod'] != null
          ? TimePeriod.fromJson(json['timePeriod'] as Map<String, dynamic>)
          : null,
      unit: json['unit'] as double?,
      usageCost: json['usageCost'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final currency = this.currency;
    final pricingUnit = this.pricingUnit;
    final timePeriod = this.timePeriod;
    final unit = this.unit;
    final usageCost = this.usageCost;
    return {
      if (currency != null) 'currency': currency.toValue(),
      if (pricingUnit != null) 'pricingUnit': pricingUnit.toValue(),
      if (timePeriod != null) 'timePeriod': timePeriod,
      if (unit != null) 'unit': unit,
      if (usageCost != null) 'usageCost': usageCost,
    };
  }
}

/// Describes an export snapshot record.
class ExportSnapshotRecord {
  /// The Amazon Resource Name (ARN) of the export snapshot record.
  final String? arn;

  /// The date when the export snapshot record was created.
  final DateTime? createdAt;

  /// A list of objects describing the destination of the export snapshot record.
  final DestinationInfo? destinationInfo;

  /// The AWS Region and Availability Zone where the export snapshot record is
  /// located.
  final ResourceLocation? location;

  /// The export snapshot record name.
  final String? name;

  /// The Lightsail resource type (<code>ExportSnapshotRecord</code>).
  final ResourceType? resourceType;

  /// A list of objects describing the source of the export snapshot record.
  final ExportSnapshotRecordSourceInfo? sourceInfo;

  /// The state of the export snapshot record.
  final RecordState? state;

  ExportSnapshotRecord({
    this.arn,
    this.createdAt,
    this.destinationInfo,
    this.location,
    this.name,
    this.resourceType,
    this.sourceInfo,
    this.state,
  });

  factory ExportSnapshotRecord.fromJson(Map<String, dynamic> json) {
    return ExportSnapshotRecord(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      destinationInfo: json['destinationInfo'] != null
          ? DestinationInfo.fromJson(
              json['destinationInfo'] as Map<String, dynamic>)
          : null,
      location: json['location'] != null
          ? ResourceLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      sourceInfo: json['sourceInfo'] != null
          ? ExportSnapshotRecordSourceInfo.fromJson(
              json['sourceInfo'] as Map<String, dynamic>)
          : null,
      state: (json['state'] as String?)?.toRecordState(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final destinationInfo = this.destinationInfo;
    final location = this.location;
    final name = this.name;
    final resourceType = this.resourceType;
    final sourceInfo = this.sourceInfo;
    final state = this.state;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (destinationInfo != null) 'destinationInfo': destinationInfo,
      if (location != null) 'location': location,
      if (name != null) 'name': name,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (sourceInfo != null) 'sourceInfo': sourceInfo,
      if (state != null) 'state': state.toValue(),
    };
  }
}

/// Describes the source of an export snapshot record.
class ExportSnapshotRecordSourceInfo {
  /// The Amazon Resource Name (ARN) of the source instance or disk snapshot.
  final String? arn;

  /// The date when the source instance or disk snapshot was created.
  final DateTime? createdAt;

  /// A list of objects describing a disk snapshot.
  final DiskSnapshotInfo? diskSnapshotInfo;

  /// The Amazon Resource Name (ARN) of the snapshot's source instance or disk.
  final String? fromResourceArn;

  /// The name of the snapshot's source instance or disk.
  final String? fromResourceName;

  /// A list of objects describing an instance snapshot.
  final InstanceSnapshotInfo? instanceSnapshotInfo;

  /// The name of the source instance or disk snapshot.
  final String? name;

  /// The Lightsail resource type (<code>InstanceSnapshot</code> or
  /// <code>DiskSnapshot</code>).
  final ExportSnapshotRecordSourceType? resourceType;

  ExportSnapshotRecordSourceInfo({
    this.arn,
    this.createdAt,
    this.diskSnapshotInfo,
    this.fromResourceArn,
    this.fromResourceName,
    this.instanceSnapshotInfo,
    this.name,
    this.resourceType,
  });

  factory ExportSnapshotRecordSourceInfo.fromJson(Map<String, dynamic> json) {
    return ExportSnapshotRecordSourceInfo(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      diskSnapshotInfo: json['diskSnapshotInfo'] != null
          ? DiskSnapshotInfo.fromJson(
              json['diskSnapshotInfo'] as Map<String, dynamic>)
          : null,
      fromResourceArn: json['fromResourceArn'] as String?,
      fromResourceName: json['fromResourceName'] as String?,
      instanceSnapshotInfo: json['instanceSnapshotInfo'] != null
          ? InstanceSnapshotInfo.fromJson(
              json['instanceSnapshotInfo'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      resourceType:
          (json['resourceType'] as String?)?.toExportSnapshotRecordSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final diskSnapshotInfo = this.diskSnapshotInfo;
    final fromResourceArn = this.fromResourceArn;
    final fromResourceName = this.fromResourceName;
    final instanceSnapshotInfo = this.instanceSnapshotInfo;
    final name = this.name;
    final resourceType = this.resourceType;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (diskSnapshotInfo != null) 'diskSnapshotInfo': diskSnapshotInfo,
      if (fromResourceArn != null) 'fromResourceArn': fromResourceArn,
      if (fromResourceName != null) 'fromResourceName': fromResourceName,
      if (instanceSnapshotInfo != null)
        'instanceSnapshotInfo': instanceSnapshotInfo,
      if (name != null) 'name': name,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
    };
  }
}

enum ExportSnapshotRecordSourceType {
  instanceSnapshot,
  diskSnapshot,
}

extension ExportSnapshotRecordSourceTypeValueExtension
    on ExportSnapshotRecordSourceType {
  String toValue() {
    switch (this) {
      case ExportSnapshotRecordSourceType.instanceSnapshot:
        return 'InstanceSnapshot';
      case ExportSnapshotRecordSourceType.diskSnapshot:
        return 'DiskSnapshot';
    }
  }
}

extension ExportSnapshotRecordSourceTypeFromString on String {
  ExportSnapshotRecordSourceType toExportSnapshotRecordSourceType() {
    switch (this) {
      case 'InstanceSnapshot':
        return ExportSnapshotRecordSourceType.instanceSnapshot;
      case 'DiskSnapshot':
        return ExportSnapshotRecordSourceType.diskSnapshot;
    }
    throw Exception(
        '$this is not known in enum ExportSnapshotRecordSourceType');
  }
}

class ExportSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  ExportSnapshotResult({
    this.operations,
  });

  factory ExportSnapshotResult.fromJson(Map<String, dynamic> json) {
    return ExportSnapshotResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

enum ForwardValues {
  none,
  allowList,
  all,
}

extension ForwardValuesValueExtension on ForwardValues {
  String toValue() {
    switch (this) {
      case ForwardValues.none:
        return 'none';
      case ForwardValues.allowList:
        return 'allow-list';
      case ForwardValues.all:
        return 'all';
    }
  }
}

extension ForwardValuesFromString on String {
  ForwardValues toForwardValues() {
    switch (this) {
      case 'none':
        return ForwardValues.none;
      case 'allow-list':
        return ForwardValues.allowList;
      case 'all':
        return ForwardValues.all;
    }
    throw Exception('$this is not known in enum ForwardValues');
  }
}

class GetActiveNamesResult {
  /// The list of active names returned by the get active names request.
  final List<String>? activeNames;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetActiveNames</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  final String? nextPageToken;

  GetActiveNamesResult({
    this.activeNames,
    this.nextPageToken,
  });

  factory GetActiveNamesResult.fromJson(Map<String, dynamic> json) {
    return GetActiveNamesResult(
      activeNames: (json['activeNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeNames = this.activeNames;
    final nextPageToken = this.nextPageToken;
    return {
      if (activeNames != null) 'activeNames': activeNames,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

class GetAlarmsResult {
  /// An array of objects that describe the alarms.
  final List<Alarm>? alarms;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetAlarms</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  final String? nextPageToken;

  GetAlarmsResult({
    this.alarms,
    this.nextPageToken,
  });

  factory GetAlarmsResult.fromJson(Map<String, dynamic> json) {
    return GetAlarmsResult(
      alarms: (json['alarms'] as List?)
          ?.whereNotNull()
          .map((e) => Alarm.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alarms = this.alarms;
    final nextPageToken = this.nextPageToken;
    return {
      if (alarms != null) 'alarms': alarms,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

class GetAutoSnapshotsResult {
  /// An array of objects that describe the automatic snapshots that are available
  /// for the specified source instance or disk.
  final List<AutoSnapshotDetails>? autoSnapshots;

  /// The name of the source instance or disk for the automatic snapshots.
  final String? resourceName;

  /// The resource type of the automatic snapshot. The possible values are
  /// <code>Instance</code>, and <code>Disk</code>.
  final ResourceType? resourceType;

  GetAutoSnapshotsResult({
    this.autoSnapshots,
    this.resourceName,
    this.resourceType,
  });

  factory GetAutoSnapshotsResult.fromJson(Map<String, dynamic> json) {
    return GetAutoSnapshotsResult(
      autoSnapshots: (json['autoSnapshots'] as List?)
          ?.whereNotNull()
          .map((e) => AutoSnapshotDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceName: json['resourceName'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoSnapshots = this.autoSnapshots;
    final resourceName = this.resourceName;
    final resourceType = this.resourceType;
    return {
      if (autoSnapshots != null) 'autoSnapshots': autoSnapshots,
      if (resourceName != null) 'resourceName': resourceName,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
    };
  }
}

class GetBlueprintsResult {
  /// An array of key-value pairs that contains information about the available
  /// blueprints.
  final List<Blueprint>? blueprints;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetBlueprints</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  final String? nextPageToken;

  GetBlueprintsResult({
    this.blueprints,
    this.nextPageToken,
  });

  factory GetBlueprintsResult.fromJson(Map<String, dynamic> json) {
    return GetBlueprintsResult(
      blueprints: (json['blueprints'] as List?)
          ?.whereNotNull()
          .map((e) => Blueprint.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blueprints = this.blueprints;
    final nextPageToken = this.nextPageToken;
    return {
      if (blueprints != null) 'blueprints': blueprints,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

class GetBucketAccessKeysResult {
  /// An object that describes the access keys for the specified bucket.
  final List<AccessKey>? accessKeys;

  GetBucketAccessKeysResult({
    this.accessKeys,
  });

  factory GetBucketAccessKeysResult.fromJson(Map<String, dynamic> json) {
    return GetBucketAccessKeysResult(
      accessKeys: (json['accessKeys'] as List?)
          ?.whereNotNull()
          .map((e) => AccessKey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeys = this.accessKeys;
    return {
      if (accessKeys != null) 'accessKeys': accessKeys,
    };
  }
}

class GetBucketBundlesResult {
  /// An object that describes bucket bundles.
  final List<BucketBundle>? bundles;

  GetBucketBundlesResult({
    this.bundles,
  });

  factory GetBucketBundlesResult.fromJson(Map<String, dynamic> json) {
    return GetBucketBundlesResult(
      bundles: (json['bundles'] as List?)
          ?.whereNotNull()
          .map((e) => BucketBundle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bundles = this.bundles;
    return {
      if (bundles != null) 'bundles': bundles,
    };
  }
}

class GetBucketMetricDataResult {
  /// An array of objects that describe the metric data returned.
  final List<MetricDatapoint>? metricData;

  /// The name of the metric returned.
  final BucketMetricName? metricName;

  GetBucketMetricDataResult({
    this.metricData,
    this.metricName,
  });

  factory GetBucketMetricDataResult.fromJson(Map<String, dynamic> json) {
    return GetBucketMetricDataResult(
      metricData: (json['metricData'] as List?)
          ?.whereNotNull()
          .map((e) => MetricDatapoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      metricName: (json['metricName'] as String?)?.toBucketMetricName(),
    );
  }

  Map<String, dynamic> toJson() {
    final metricData = this.metricData;
    final metricName = this.metricName;
    return {
      if (metricData != null) 'metricData': metricData,
      if (metricName != null) 'metricName': metricName.toValue(),
    };
  }
}

class GetBucketsResult {
  /// An object that describes the synchronization status of the Amazon S3
  /// account-level block public access feature for your Lightsail buckets.
  ///
  /// For more information about this feature and how it affects Lightsail
  /// buckets, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-block-public-access-for-buckets">Block
  /// public access for buckets in Amazon Lightsail</a>.
  final AccountLevelBpaSync? accountLevelBpaSync;

  /// An array of objects that describe buckets.
  final List<Bucket>? buckets;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetBuckets</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  final String? nextPageToken;

  GetBucketsResult({
    this.accountLevelBpaSync,
    this.buckets,
    this.nextPageToken,
  });

  factory GetBucketsResult.fromJson(Map<String, dynamic> json) {
    return GetBucketsResult(
      accountLevelBpaSync: json['accountLevelBpaSync'] != null
          ? AccountLevelBpaSync.fromJson(
              json['accountLevelBpaSync'] as Map<String, dynamic>)
          : null,
      buckets: (json['buckets'] as List?)
          ?.whereNotNull()
          .map((e) => Bucket.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountLevelBpaSync = this.accountLevelBpaSync;
    final buckets = this.buckets;
    final nextPageToken = this.nextPageToken;
    return {
      if (accountLevelBpaSync != null)
        'accountLevelBpaSync': accountLevelBpaSync,
      if (buckets != null) 'buckets': buckets,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

class GetBundlesResult {
  /// An array of key-value pairs that contains information about the available
  /// bundles.
  final List<Bundle>? bundles;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetBundles</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  final String? nextPageToken;

  GetBundlesResult({
    this.bundles,
    this.nextPageToken,
  });

  factory GetBundlesResult.fromJson(Map<String, dynamic> json) {
    return GetBundlesResult(
      bundles: (json['bundles'] as List?)
          ?.whereNotNull()
          .map((e) => Bundle.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bundles = this.bundles;
    final nextPageToken = this.nextPageToken;
    return {
      if (bundles != null) 'bundles': bundles,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

class GetCertificatesResult {
  /// An object that describes certificates.
  final List<CertificateSummary>? certificates;

  /// If <code>NextPageToken</code> is returned there are more results available.
  /// The value of <code>NextPageToken</code> is a unique pagination token for
  /// each page. Make the call again using the returned token to retrieve the next
  /// page. Keep all other arguments unchanged.
  final String? nextPageToken;

  GetCertificatesResult({
    this.certificates,
    this.nextPageToken,
  });

  factory GetCertificatesResult.fromJson(Map<String, dynamic> json) {
    return GetCertificatesResult(
      certificates: (json['certificates'] as List?)
          ?.whereNotNull()
          .map((e) => CertificateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificates = this.certificates;
    final nextPageToken = this.nextPageToken;
    return {
      if (certificates != null) 'certificates': certificates,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

class GetCloudFormationStackRecordsResult {
  /// A list of objects describing the CloudFormation stack records.
  final List<CloudFormationStackRecord>? cloudFormationStackRecords;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetCloudFormationStackRecords</code> request and specify the next page
  /// token using the <code>pageToken</code> parameter.
  final String? nextPageToken;

  GetCloudFormationStackRecordsResult({
    this.cloudFormationStackRecords,
    this.nextPageToken,
  });

  factory GetCloudFormationStackRecordsResult.fromJson(
      Map<String, dynamic> json) {
    return GetCloudFormationStackRecordsResult(
      cloudFormationStackRecords: (json['cloudFormationStackRecords'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CloudFormationStackRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudFormationStackRecords = this.cloudFormationStackRecords;
    final nextPageToken = this.nextPageToken;
    return {
      if (cloudFormationStackRecords != null)
        'cloudFormationStackRecords': cloudFormationStackRecords,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

class GetContactMethodsResult {
  /// An array of objects that describe the contact methods.
  final List<ContactMethod>? contactMethods;

  GetContactMethodsResult({
    this.contactMethods,
  });

  factory GetContactMethodsResult.fromJson(Map<String, dynamic> json) {
    return GetContactMethodsResult(
      contactMethods: (json['contactMethods'] as List?)
          ?.whereNotNull()
          .map((e) => ContactMethod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final contactMethods = this.contactMethods;
    return {
      if (contactMethods != null) 'contactMethods': contactMethods,
    };
  }
}

class GetContainerAPIMetadataResult {
  /// Metadata about Lightsail containers, such as the current version of the
  /// Lightsail Control (lightsailctl) plugin.
  final List<Map<String, String>>? metadata;

  GetContainerAPIMetadataResult({
    this.metadata,
  });

  factory GetContainerAPIMetadataResult.fromJson(Map<String, dynamic> json) {
    return GetContainerAPIMetadataResult(
      metadata: (json['metadata'] as List?)
          ?.whereNotNull()
          .map((e) => (e as Map<String, dynamic>)
              .map((k, e) => MapEntry(k, e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    return {
      if (metadata != null) 'metadata': metadata,
    };
  }
}

class GetContainerImagesResult {
  /// An array of objects that describe container images that are registered to
  /// the container service.
  final List<ContainerImage>? containerImages;

  GetContainerImagesResult({
    this.containerImages,
  });

  factory GetContainerImagesResult.fromJson(Map<String, dynamic> json) {
    return GetContainerImagesResult(
      containerImages: (json['containerImages'] as List?)
          ?.whereNotNull()
          .map((e) => ContainerImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final containerImages = this.containerImages;
    return {
      if (containerImages != null) 'containerImages': containerImages,
    };
  }
}

class GetContainerLogResult {
  /// An array of objects that describe the log events of a container.
  final List<ContainerServiceLogEvent>? logEvents;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetContainerLog</code> request and specify the next page token using
  /// the <code>pageToken</code> parameter.
  final String? nextPageToken;

  GetContainerLogResult({
    this.logEvents,
    this.nextPageToken,
  });

  factory GetContainerLogResult.fromJson(Map<String, dynamic> json) {
    return GetContainerLogResult(
      logEvents: (json['logEvents'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ContainerServiceLogEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logEvents = this.logEvents;
    final nextPageToken = this.nextPageToken;
    return {
      if (logEvents != null) 'logEvents': logEvents,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

class GetContainerServiceDeploymentsResult {
  /// An array of objects that describe deployments for a container service.
  final List<ContainerServiceDeployment>? deployments;

  GetContainerServiceDeploymentsResult({
    this.deployments,
  });

  factory GetContainerServiceDeploymentsResult.fromJson(
      Map<String, dynamic> json) {
    return GetContainerServiceDeploymentsResult(
      deployments: (json['deployments'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ContainerServiceDeployment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final deployments = this.deployments;
    return {
      if (deployments != null) 'deployments': deployments,
    };
  }
}

class GetContainerServiceMetricDataResult {
  /// An array of objects that describe the metric data returned.
  final List<MetricDatapoint>? metricData;

  /// The name of the metric returned.
  final ContainerServiceMetricName? metricName;

  GetContainerServiceMetricDataResult({
    this.metricData,
    this.metricName,
  });

  factory GetContainerServiceMetricDataResult.fromJson(
      Map<String, dynamic> json) {
    return GetContainerServiceMetricDataResult(
      metricData: (json['metricData'] as List?)
          ?.whereNotNull()
          .map((e) => MetricDatapoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      metricName:
          (json['metricName'] as String?)?.toContainerServiceMetricName(),
    );
  }

  Map<String, dynamic> toJson() {
    final metricData = this.metricData;
    final metricName = this.metricName;
    return {
      if (metricData != null) 'metricData': metricData,
      if (metricName != null) 'metricName': metricName.toValue(),
    };
  }
}

class GetContainerServicePowersResult {
  /// An array of objects that describe the powers that can be specified for a
  /// container service.
  final List<ContainerServicePower>? powers;

  GetContainerServicePowersResult({
    this.powers,
  });

  factory GetContainerServicePowersResult.fromJson(Map<String, dynamic> json) {
    return GetContainerServicePowersResult(
      powers: (json['powers'] as List?)
          ?.whereNotNull()
          .map((e) => ContainerServicePower.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final powers = this.powers;
    return {
      if (powers != null) 'powers': powers,
    };
  }
}

class GetCostEstimateResult {
  /// Returns the estimate's forecasted cost or usage.
  final List<ResourceBudgetEstimate>? resourcesBudgetEstimate;

  GetCostEstimateResult({
    this.resourcesBudgetEstimate,
  });

  factory GetCostEstimateResult.fromJson(Map<String, dynamic> json) {
    return GetCostEstimateResult(
      resourcesBudgetEstimate: (json['resourcesBudgetEstimate'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ResourceBudgetEstimate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourcesBudgetEstimate = this.resourcesBudgetEstimate;
    return {
      if (resourcesBudgetEstimate != null)
        'resourcesBudgetEstimate': resourcesBudgetEstimate,
    };
  }
}

class GetDiskResult {
  /// An object containing information about the disk.
  final Disk? disk;

  GetDiskResult({
    this.disk,
  });

  factory GetDiskResult.fromJson(Map<String, dynamic> json) {
    return GetDiskResult(
      disk: json['disk'] != null
          ? Disk.fromJson(json['disk'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final disk = this.disk;
    return {
      if (disk != null) 'disk': disk,
    };
  }
}

class GetDiskSnapshotResult {
  /// An object containing information about the disk snapshot.
  final DiskSnapshot? diskSnapshot;

  GetDiskSnapshotResult({
    this.diskSnapshot,
  });

  factory GetDiskSnapshotResult.fromJson(Map<String, dynamic> json) {
    return GetDiskSnapshotResult(
      diskSnapshot: json['diskSnapshot'] != null
          ? DiskSnapshot.fromJson(json['diskSnapshot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final diskSnapshot = this.diskSnapshot;
    return {
      if (diskSnapshot != null) 'diskSnapshot': diskSnapshot,
    };
  }
}

class GetDiskSnapshotsResult {
  /// An array of objects containing information about all block storage disk
  /// snapshots.
  final List<DiskSnapshot>? diskSnapshots;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetDiskSnapshots</code> request and specify the next page token using
  /// the <code>pageToken</code> parameter.
  final String? nextPageToken;

  GetDiskSnapshotsResult({
    this.diskSnapshots,
    this.nextPageToken,
  });

  factory GetDiskSnapshotsResult.fromJson(Map<String, dynamic> json) {
    return GetDiskSnapshotsResult(
      diskSnapshots: (json['diskSnapshots'] as List?)
          ?.whereNotNull()
          .map((e) => DiskSnapshot.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final diskSnapshots = this.diskSnapshots;
    final nextPageToken = this.nextPageToken;
    return {
      if (diskSnapshots != null) 'diskSnapshots': diskSnapshots,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

class GetDisksResult {
  /// An array of objects containing information about all block storage disks.
  final List<Disk>? disks;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetDisks</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  final String? nextPageToken;

  GetDisksResult({
    this.disks,
    this.nextPageToken,
  });

  factory GetDisksResult.fromJson(Map<String, dynamic> json) {
    return GetDisksResult(
      disks: (json['disks'] as List?)
          ?.whereNotNull()
          .map((e) => Disk.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final disks = this.disks;
    final nextPageToken = this.nextPageToken;
    return {
      if (disks != null) 'disks': disks,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

class GetDistributionBundlesResult {
  /// An object that describes a distribution bundle.
  final List<DistributionBundle>? bundles;

  GetDistributionBundlesResult({
    this.bundles,
  });

  factory GetDistributionBundlesResult.fromJson(Map<String, dynamic> json) {
    return GetDistributionBundlesResult(
      bundles: (json['bundles'] as List?)
          ?.whereNotNull()
          .map((e) => DistributionBundle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bundles = this.bundles;
    return {
      if (bundles != null) 'bundles': bundles,
    };
  }
}

class GetDistributionLatestCacheResetResult {
  /// The timestamp of the last cache reset (<code>1479734909.17</code>) in Unix
  /// time format.
  final DateTime? createTime;

  /// The status of the last cache reset.
  final String? status;

  GetDistributionLatestCacheResetResult({
    this.createTime,
    this.status,
  });

  factory GetDistributionLatestCacheResetResult.fromJson(
      Map<String, dynamic> json) {
    return GetDistributionLatestCacheResetResult(
      createTime: timeStampFromJson(json['createTime']),
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final status = this.status;
    return {
      if (createTime != null) 'createTime': unixTimestampToJson(createTime),
      if (status != null) 'status': status,
    };
  }
}

class GetDistributionMetricDataResult {
  /// An array of objects that describe the metric data returned.
  final List<MetricDatapoint>? metricData;

  /// The name of the metric returned.
  final DistributionMetricName? metricName;

  GetDistributionMetricDataResult({
    this.metricData,
    this.metricName,
  });

  factory GetDistributionMetricDataResult.fromJson(Map<String, dynamic> json) {
    return GetDistributionMetricDataResult(
      metricData: (json['metricData'] as List?)
          ?.whereNotNull()
          .map((e) => MetricDatapoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      metricName: (json['metricName'] as String?)?.toDistributionMetricName(),
    );
  }

  Map<String, dynamic> toJson() {
    final metricData = this.metricData;
    final metricName = this.metricName;
    return {
      if (metricData != null) 'metricData': metricData,
      if (metricName != null) 'metricName': metricName.toValue(),
    };
  }
}

class GetDistributionsResult {
  /// An array of objects that describe your distributions.
  final List<LightsailDistribution>? distributions;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetDistributions</code> request and specify the next page token using
  /// the <code>pageToken</code> parameter.
  final String? nextPageToken;

  GetDistributionsResult({
    this.distributions,
    this.nextPageToken,
  });

  factory GetDistributionsResult.fromJson(Map<String, dynamic> json) {
    return GetDistributionsResult(
      distributions: (json['distributions'] as List?)
          ?.whereNotNull()
          .map((e) => LightsailDistribution.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final distributions = this.distributions;
    final nextPageToken = this.nextPageToken;
    return {
      if (distributions != null) 'distributions': distributions,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

class GetDomainResult {
  /// An array of key-value pairs containing information about your get domain
  /// request.
  final Domain? domain;

  GetDomainResult({
    this.domain,
  });

  factory GetDomainResult.fromJson(Map<String, dynamic> json) {
    return GetDomainResult(
      domain: json['domain'] != null
          ? Domain.fromJson(json['domain'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    return {
      if (domain != null) 'domain': domain,
    };
  }
}

class GetDomainsResult {
  /// An array of key-value pairs containing information about each of the domain
  /// entries in the user's account.
  final List<Domain>? domains;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetDomains</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  final String? nextPageToken;

  GetDomainsResult({
    this.domains,
    this.nextPageToken,
  });

  factory GetDomainsResult.fromJson(Map<String, dynamic> json) {
    return GetDomainsResult(
      domains: (json['domains'] as List?)
          ?.whereNotNull()
          .map((e) => Domain.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final domains = this.domains;
    final nextPageToken = this.nextPageToken;
    return {
      if (domains != null) 'domains': domains,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

class GetExportSnapshotRecordsResult {
  /// A list of objects describing the export snapshot records.
  final List<ExportSnapshotRecord>? exportSnapshotRecords;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetExportSnapshotRecords</code> request and specify the next page
  /// token using the <code>pageToken</code> parameter.
  final String? nextPageToken;

  GetExportSnapshotRecordsResult({
    this.exportSnapshotRecords,
    this.nextPageToken,
  });

  factory GetExportSnapshotRecordsResult.fromJson(Map<String, dynamic> json) {
    return GetExportSnapshotRecordsResult(
      exportSnapshotRecords: (json['exportSnapshotRecords'] as List?)
          ?.whereNotNull()
          .map((e) => ExportSnapshotRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportSnapshotRecords = this.exportSnapshotRecords;
    final nextPageToken = this.nextPageToken;
    return {
      if (exportSnapshotRecords != null)
        'exportSnapshotRecords': exportSnapshotRecords,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

class GetInstanceAccessDetailsResult {
  /// An array of key-value pairs containing information about a get instance
  /// access request.
  final InstanceAccessDetails? accessDetails;

  GetInstanceAccessDetailsResult({
    this.accessDetails,
  });

  factory GetInstanceAccessDetailsResult.fromJson(Map<String, dynamic> json) {
    return GetInstanceAccessDetailsResult(
      accessDetails: json['accessDetails'] != null
          ? InstanceAccessDetails.fromJson(
              json['accessDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessDetails = this.accessDetails;
    return {
      if (accessDetails != null) 'accessDetails': accessDetails,
    };
  }
}

class GetInstanceMetricDataResult {
  /// An array of objects that describe the metric data returned.
  final List<MetricDatapoint>? metricData;

  /// The name of the metric returned.
  final InstanceMetricName? metricName;

  GetInstanceMetricDataResult({
    this.metricData,
    this.metricName,
  });

  factory GetInstanceMetricDataResult.fromJson(Map<String, dynamic> json) {
    return GetInstanceMetricDataResult(
      metricData: (json['metricData'] as List?)
          ?.whereNotNull()
          .map((e) => MetricDatapoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      metricName: (json['metricName'] as String?)?.toInstanceMetricName(),
    );
  }

  Map<String, dynamic> toJson() {
    final metricData = this.metricData;
    final metricName = this.metricName;
    return {
      if (metricData != null) 'metricData': metricData,
      if (metricName != null) 'metricName': metricName.toValue(),
    };
  }
}

class GetInstancePortStatesResult {
  /// An array of objects that describe the firewall port states for the specified
  /// instance.
  final List<InstancePortState>? portStates;

  GetInstancePortStatesResult({
    this.portStates,
  });

  factory GetInstancePortStatesResult.fromJson(Map<String, dynamic> json) {
    return GetInstancePortStatesResult(
      portStates: (json['portStates'] as List?)
          ?.whereNotNull()
          .map((e) => InstancePortState.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final portStates = this.portStates;
    return {
      if (portStates != null) 'portStates': portStates,
    };
  }
}

class GetInstanceResult {
  /// An array of key-value pairs containing information about the specified
  /// instance.
  final Instance? instance;

  GetInstanceResult({
    this.instance,
  });

  factory GetInstanceResult.fromJson(Map<String, dynamic> json) {
    return GetInstanceResult(
      instance: json['instance'] != null
          ? Instance.fromJson(json['instance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final instance = this.instance;
    return {
      if (instance != null) 'instance': instance,
    };
  }
}

class GetInstanceSnapshotResult {
  /// An array of key-value pairs containing information about the results of your
  /// get instance snapshot request.
  final InstanceSnapshot? instanceSnapshot;

  GetInstanceSnapshotResult({
    this.instanceSnapshot,
  });

  factory GetInstanceSnapshotResult.fromJson(Map<String, dynamic> json) {
    return GetInstanceSnapshotResult(
      instanceSnapshot: json['instanceSnapshot'] != null
          ? InstanceSnapshot.fromJson(
              json['instanceSnapshot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceSnapshot = this.instanceSnapshot;
    return {
      if (instanceSnapshot != null) 'instanceSnapshot': instanceSnapshot,
    };
  }
}

class GetInstanceSnapshotsResult {
  /// An array of key-value pairs containing information about the results of your
  /// get instance snapshots request.
  final List<InstanceSnapshot>? instanceSnapshots;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetInstanceSnapshots</code> request and specify the next page token
  /// using the <code>pageToken</code> parameter.
  final String? nextPageToken;

  GetInstanceSnapshotsResult({
    this.instanceSnapshots,
    this.nextPageToken,
  });

  factory GetInstanceSnapshotsResult.fromJson(Map<String, dynamic> json) {
    return GetInstanceSnapshotsResult(
      instanceSnapshots: (json['instanceSnapshots'] as List?)
          ?.whereNotNull()
          .map((e) => InstanceSnapshot.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceSnapshots = this.instanceSnapshots;
    final nextPageToken = this.nextPageToken;
    return {
      if (instanceSnapshots != null) 'instanceSnapshots': instanceSnapshots,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

class GetInstanceStateResult {
  /// The state of the instance.
  final InstanceState? state;

  GetInstanceStateResult({
    this.state,
  });

  factory GetInstanceStateResult.fromJson(Map<String, dynamic> json) {
    return GetInstanceStateResult(
      state: json['state'] != null
          ? InstanceState.fromJson(json['state'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      if (state != null) 'state': state,
    };
  }
}

class GetInstancesResult {
  /// An array of key-value pairs containing information about your instances.
  final List<Instance>? instances;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetInstances</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  final String? nextPageToken;

  GetInstancesResult({
    this.instances,
    this.nextPageToken,
  });

  factory GetInstancesResult.fromJson(Map<String, dynamic> json) {
    return GetInstancesResult(
      instances: (json['instances'] as List?)
          ?.whereNotNull()
          .map((e) => Instance.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instances = this.instances;
    final nextPageToken = this.nextPageToken;
    return {
      if (instances != null) 'instances': instances,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

class GetKeyPairResult {
  /// An array of key-value pairs containing information about the key pair.
  final KeyPair? keyPair;

  GetKeyPairResult({
    this.keyPair,
  });

  factory GetKeyPairResult.fromJson(Map<String, dynamic> json) {
    return GetKeyPairResult(
      keyPair: json['keyPair'] != null
          ? KeyPair.fromJson(json['keyPair'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final keyPair = this.keyPair;
    return {
      if (keyPair != null) 'keyPair': keyPair,
    };
  }
}

class GetKeyPairsResult {
  /// An array of key-value pairs containing information about the key pairs.
  final List<KeyPair>? keyPairs;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetKeyPairs</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  final String? nextPageToken;

  GetKeyPairsResult({
    this.keyPairs,
    this.nextPageToken,
  });

  factory GetKeyPairsResult.fromJson(Map<String, dynamic> json) {
    return GetKeyPairsResult(
      keyPairs: (json['keyPairs'] as List?)
          ?.whereNotNull()
          .map((e) => KeyPair.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyPairs = this.keyPairs;
    final nextPageToken = this.nextPageToken;
    return {
      if (keyPairs != null) 'keyPairs': keyPairs,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

class GetLoadBalancerMetricDataResult {
  /// An array of objects that describe the metric data returned.
  final List<MetricDatapoint>? metricData;

  /// The name of the metric returned.
  final LoadBalancerMetricName? metricName;

  GetLoadBalancerMetricDataResult({
    this.metricData,
    this.metricName,
  });

  factory GetLoadBalancerMetricDataResult.fromJson(Map<String, dynamic> json) {
    return GetLoadBalancerMetricDataResult(
      metricData: (json['metricData'] as List?)
          ?.whereNotNull()
          .map((e) => MetricDatapoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      metricName: (json['metricName'] as String?)?.toLoadBalancerMetricName(),
    );
  }

  Map<String, dynamic> toJson() {
    final metricData = this.metricData;
    final metricName = this.metricName;
    return {
      if (metricData != null) 'metricData': metricData,
      if (metricName != null) 'metricName': metricName.toValue(),
    };
  }
}

class GetLoadBalancerResult {
  /// An object containing information about your load balancer.
  final LoadBalancer? loadBalancer;

  GetLoadBalancerResult({
    this.loadBalancer,
  });

  factory GetLoadBalancerResult.fromJson(Map<String, dynamic> json) {
    return GetLoadBalancerResult(
      loadBalancer: json['loadBalancer'] != null
          ? LoadBalancer.fromJson(json['loadBalancer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final loadBalancer = this.loadBalancer;
    return {
      if (loadBalancer != null) 'loadBalancer': loadBalancer,
    };
  }
}

class GetLoadBalancerTlsCertificatesResult {
  /// An array of LoadBalancerTlsCertificate objects describing your SSL/TLS
  /// certificates.
  final List<LoadBalancerTlsCertificate>? tlsCertificates;

  GetLoadBalancerTlsCertificatesResult({
    this.tlsCertificates,
  });

  factory GetLoadBalancerTlsCertificatesResult.fromJson(
      Map<String, dynamic> json) {
    return GetLoadBalancerTlsCertificatesResult(
      tlsCertificates: (json['tlsCertificates'] as List?)
          ?.whereNotNull()
          .map((e) =>
              LoadBalancerTlsCertificate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tlsCertificates = this.tlsCertificates;
    return {
      if (tlsCertificates != null) 'tlsCertificates': tlsCertificates,
    };
  }
}

class GetLoadBalancerTlsPoliciesResult {
  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetLoadBalancerTlsPolicies</code> request and specify the next page
  /// token using the <code>pageToken</code> parameter.
  final String? nextPageToken;

  /// An array of objects that describe the TLS security policies that are
  /// available.
  final List<LoadBalancerTlsPolicy>? tlsPolicies;

  GetLoadBalancerTlsPoliciesResult({
    this.nextPageToken,
    this.tlsPolicies,
  });

  factory GetLoadBalancerTlsPoliciesResult.fromJson(Map<String, dynamic> json) {
    return GetLoadBalancerTlsPoliciesResult(
      nextPageToken: json['nextPageToken'] as String?,
      tlsPolicies: (json['tlsPolicies'] as List?)
          ?.whereNotNull()
          .map((e) => LoadBalancerTlsPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final tlsPolicies = this.tlsPolicies;
    return {
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
      if (tlsPolicies != null) 'tlsPolicies': tlsPolicies,
    };
  }
}

class GetLoadBalancersResult {
  /// An array of LoadBalancer objects describing your load balancers.
  final List<LoadBalancer>? loadBalancers;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetLoadBalancers</code> request and specify the next page token using
  /// the <code>pageToken</code> parameter.
  final String? nextPageToken;

  GetLoadBalancersResult({
    this.loadBalancers,
    this.nextPageToken,
  });

  factory GetLoadBalancersResult.fromJson(Map<String, dynamic> json) {
    return GetLoadBalancersResult(
      loadBalancers: (json['loadBalancers'] as List?)
          ?.whereNotNull()
          .map((e) => LoadBalancer.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final loadBalancers = this.loadBalancers;
    final nextPageToken = this.nextPageToken;
    return {
      if (loadBalancers != null) 'loadBalancers': loadBalancers,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

class GetOperationResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final Operation? operation;

  GetOperationResult({
    this.operation,
  });

  factory GetOperationResult.fromJson(Map<String, dynamic> json) {
    return GetOperationResult(
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    return {
      if (operation != null) 'operation': operation,
    };
  }
}

class GetOperationsForResourceResult {
  /// (Discontinued) Returns the number of pages of results that remain.
  /// <note>
  /// In releases prior to June 12, 2017, this parameter returned
  /// <code>null</code> by the API. It is now discontinued, and the API returns
  /// the <code>next page token</code> parameter instead.
  /// </note>
  final String? nextPageCount;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetOperationsForResource</code> request and specify the next page
  /// token using the <code>pageToken</code> parameter.
  final String? nextPageToken;

  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  GetOperationsForResourceResult({
    this.nextPageCount,
    this.nextPageToken,
    this.operations,
  });

  factory GetOperationsForResourceResult.fromJson(Map<String, dynamic> json) {
    return GetOperationsForResourceResult(
      nextPageCount: json['nextPageCount'] as String?,
      nextPageToken: json['nextPageToken'] as String?,
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageCount = this.nextPageCount;
    final nextPageToken = this.nextPageToken;
    final operations = this.operations;
    return {
      if (nextPageCount != null) 'nextPageCount': nextPageCount,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
      if (operations != null) 'operations': operations,
    };
  }
}

class GetOperationsResult {
  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetOperations</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  final String? nextPageToken;

  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  GetOperationsResult({
    this.nextPageToken,
    this.operations,
  });

  factory GetOperationsResult.fromJson(Map<String, dynamic> json) {
    return GetOperationsResult(
      nextPageToken: json['nextPageToken'] as String?,
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final operations = this.operations;
    return {
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
      if (operations != null) 'operations': operations,
    };
  }
}

class GetRegionsResult {
  /// An array of key-value pairs containing information about your get regions
  /// request.
  final List<Region>? regions;

  GetRegionsResult({
    this.regions,
  });

  factory GetRegionsResult.fromJson(Map<String, dynamic> json) {
    return GetRegionsResult(
      regions: (json['regions'] as List?)
          ?.whereNotNull()
          .map((e) => Region.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final regions = this.regions;
    return {
      if (regions != null) 'regions': regions,
    };
  }
}

class GetRelationalDatabaseBlueprintsResult {
  /// An object describing the result of your get relational database blueprints
  /// request.
  final List<RelationalDatabaseBlueprint>? blueprints;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetRelationalDatabaseBlueprints</code> request and specify the next
  /// page token using the <code>pageToken</code> parameter.
  final String? nextPageToken;

  GetRelationalDatabaseBlueprintsResult({
    this.blueprints,
    this.nextPageToken,
  });

  factory GetRelationalDatabaseBlueprintsResult.fromJson(
      Map<String, dynamic> json) {
    return GetRelationalDatabaseBlueprintsResult(
      blueprints: (json['blueprints'] as List?)
          ?.whereNotNull()
          .map((e) =>
              RelationalDatabaseBlueprint.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blueprints = this.blueprints;
    final nextPageToken = this.nextPageToken;
    return {
      if (blueprints != null) 'blueprints': blueprints,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

class GetRelationalDatabaseBundlesResult {
  /// An object describing the result of your get relational database bundles
  /// request.
  final List<RelationalDatabaseBundle>? bundles;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetRelationalDatabaseBundles</code> request and specify the next page
  /// token using the <code>pageToken</code> parameter.
  final String? nextPageToken;

  GetRelationalDatabaseBundlesResult({
    this.bundles,
    this.nextPageToken,
  });

  factory GetRelationalDatabaseBundlesResult.fromJson(
      Map<String, dynamic> json) {
    return GetRelationalDatabaseBundlesResult(
      bundles: (json['bundles'] as List?)
          ?.whereNotNull()
          .map((e) =>
              RelationalDatabaseBundle.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bundles = this.bundles;
    final nextPageToken = this.nextPageToken;
    return {
      if (bundles != null) 'bundles': bundles,
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
    };
  }
}

class GetRelationalDatabaseEventsResult {
  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetRelationalDatabaseEvents</code> request and specify the next page
  /// token using the <code>pageToken</code> parameter.
  final String? nextPageToken;

  /// An object describing the result of your get relational database events
  /// request.
  final List<RelationalDatabaseEvent>? relationalDatabaseEvents;

  GetRelationalDatabaseEventsResult({
    this.nextPageToken,
    this.relationalDatabaseEvents,
  });

  factory GetRelationalDatabaseEventsResult.fromJson(
      Map<String, dynamic> json) {
    return GetRelationalDatabaseEventsResult(
      nextPageToken: json['nextPageToken'] as String?,
      relationalDatabaseEvents: (json['relationalDatabaseEvents'] as List?)
          ?.whereNotNull()
          .map((e) =>
              RelationalDatabaseEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final relationalDatabaseEvents = this.relationalDatabaseEvents;
    return {
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
      if (relationalDatabaseEvents != null)
        'relationalDatabaseEvents': relationalDatabaseEvents,
    };
  }
}

class GetRelationalDatabaseLogEventsResult {
  /// A token used for advancing to the previous page of results from your get
  /// relational database log events request.
  final String? nextBackwardToken;

  /// A token used for advancing to the next page of results from your get
  /// relational database log events request.
  final String? nextForwardToken;

  /// An object describing the result of your get relational database log events
  /// request.
  final List<LogEvent>? resourceLogEvents;

  GetRelationalDatabaseLogEventsResult({
    this.nextBackwardToken,
    this.nextForwardToken,
    this.resourceLogEvents,
  });

  factory GetRelationalDatabaseLogEventsResult.fromJson(
      Map<String, dynamic> json) {
    return GetRelationalDatabaseLogEventsResult(
      nextBackwardToken: json['nextBackwardToken'] as String?,
      nextForwardToken: json['nextForwardToken'] as String?,
      resourceLogEvents: (json['resourceLogEvents'] as List?)
          ?.whereNotNull()
          .map((e) => LogEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextBackwardToken = this.nextBackwardToken;
    final nextForwardToken = this.nextForwardToken;
    final resourceLogEvents = this.resourceLogEvents;
    return {
      if (nextBackwardToken != null) 'nextBackwardToken': nextBackwardToken,
      if (nextForwardToken != null) 'nextForwardToken': nextForwardToken,
      if (resourceLogEvents != null) 'resourceLogEvents': resourceLogEvents,
    };
  }
}

class GetRelationalDatabaseLogStreamsResult {
  /// An object describing the result of your get relational database log streams
  /// request.
  final List<String>? logStreams;

  GetRelationalDatabaseLogStreamsResult({
    this.logStreams,
  });

  factory GetRelationalDatabaseLogStreamsResult.fromJson(
      Map<String, dynamic> json) {
    return GetRelationalDatabaseLogStreamsResult(
      logStreams: (json['logStreams'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logStreams = this.logStreams;
    return {
      if (logStreams != null) 'logStreams': logStreams,
    };
  }
}

class GetRelationalDatabaseMasterUserPasswordResult {
  /// The timestamp when the specified version of the master user password was
  /// created.
  final DateTime? createdAt;

  /// The master user password for the <code>password version</code> specified.
  final String? masterUserPassword;

  GetRelationalDatabaseMasterUserPasswordResult({
    this.createdAt,
    this.masterUserPassword,
  });

  factory GetRelationalDatabaseMasterUserPasswordResult.fromJson(
      Map<String, dynamic> json) {
    return GetRelationalDatabaseMasterUserPasswordResult(
      createdAt: timeStampFromJson(json['createdAt']),
      masterUserPassword: json['masterUserPassword'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final masterUserPassword = this.masterUserPassword;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (masterUserPassword != null) 'masterUserPassword': masterUserPassword,
    };
  }
}

class GetRelationalDatabaseMetricDataResult {
  /// An array of objects that describe the metric data returned.
  final List<MetricDatapoint>? metricData;

  /// The name of the metric returned.
  final RelationalDatabaseMetricName? metricName;

  GetRelationalDatabaseMetricDataResult({
    this.metricData,
    this.metricName,
  });

  factory GetRelationalDatabaseMetricDataResult.fromJson(
      Map<String, dynamic> json) {
    return GetRelationalDatabaseMetricDataResult(
      metricData: (json['metricData'] as List?)
          ?.whereNotNull()
          .map((e) => MetricDatapoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      metricName:
          (json['metricName'] as String?)?.toRelationalDatabaseMetricName(),
    );
  }

  Map<String, dynamic> toJson() {
    final metricData = this.metricData;
    final metricName = this.metricName;
    return {
      if (metricData != null) 'metricData': metricData,
      if (metricName != null) 'metricName': metricName.toValue(),
    };
  }
}

class GetRelationalDatabaseParametersResult {
  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetRelationalDatabaseParameters</code> request and specify the next
  /// page token using the <code>pageToken</code> parameter.
  final String? nextPageToken;

  /// An object describing the result of your get relational database parameters
  /// request.
  final List<RelationalDatabaseParameter>? parameters;

  GetRelationalDatabaseParametersResult({
    this.nextPageToken,
    this.parameters,
  });

  factory GetRelationalDatabaseParametersResult.fromJson(
      Map<String, dynamic> json) {
    return GetRelationalDatabaseParametersResult(
      nextPageToken: json['nextPageToken'] as String?,
      parameters: (json['parameters'] as List?)
          ?.whereNotNull()
          .map((e) =>
              RelationalDatabaseParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final parameters = this.parameters;
    return {
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
      if (parameters != null) 'parameters': parameters,
    };
  }
}

class GetRelationalDatabaseResult {
  /// An object describing the specified database.
  final RelationalDatabase? relationalDatabase;

  GetRelationalDatabaseResult({
    this.relationalDatabase,
  });

  factory GetRelationalDatabaseResult.fromJson(Map<String, dynamic> json) {
    return GetRelationalDatabaseResult(
      relationalDatabase: json['relationalDatabase'] != null
          ? RelationalDatabase.fromJson(
              json['relationalDatabase'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final relationalDatabase = this.relationalDatabase;
    return {
      if (relationalDatabase != null) 'relationalDatabase': relationalDatabase,
    };
  }
}

class GetRelationalDatabaseSnapshotResult {
  /// An object describing the specified database snapshot.
  final RelationalDatabaseSnapshot? relationalDatabaseSnapshot;

  GetRelationalDatabaseSnapshotResult({
    this.relationalDatabaseSnapshot,
  });

  factory GetRelationalDatabaseSnapshotResult.fromJson(
      Map<String, dynamic> json) {
    return GetRelationalDatabaseSnapshotResult(
      relationalDatabaseSnapshot: json['relationalDatabaseSnapshot'] != null
          ? RelationalDatabaseSnapshot.fromJson(
              json['relationalDatabaseSnapshot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final relationalDatabaseSnapshot = this.relationalDatabaseSnapshot;
    return {
      if (relationalDatabaseSnapshot != null)
        'relationalDatabaseSnapshot': relationalDatabaseSnapshot,
    };
  }
}

class GetRelationalDatabaseSnapshotsResult {
  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetRelationalDatabaseSnapshots</code> request and specify the next
  /// page token using the <code>pageToken</code> parameter.
  final String? nextPageToken;

  /// An object describing the result of your get relational database snapshots
  /// request.
  final List<RelationalDatabaseSnapshot>? relationalDatabaseSnapshots;

  GetRelationalDatabaseSnapshotsResult({
    this.nextPageToken,
    this.relationalDatabaseSnapshots,
  });

  factory GetRelationalDatabaseSnapshotsResult.fromJson(
      Map<String, dynamic> json) {
    return GetRelationalDatabaseSnapshotsResult(
      nextPageToken: json['nextPageToken'] as String?,
      relationalDatabaseSnapshots: (json['relationalDatabaseSnapshots']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              RelationalDatabaseSnapshot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final relationalDatabaseSnapshots = this.relationalDatabaseSnapshots;
    return {
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
      if (relationalDatabaseSnapshots != null)
        'relationalDatabaseSnapshots': relationalDatabaseSnapshots,
    };
  }
}

class GetRelationalDatabasesResult {
  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetRelationalDatabases</code> request and specify the next page token
  /// using the <code>pageToken</code> parameter.
  final String? nextPageToken;

  /// An object describing the result of your get relational databases request.
  final List<RelationalDatabase>? relationalDatabases;

  GetRelationalDatabasesResult({
    this.nextPageToken,
    this.relationalDatabases,
  });

  factory GetRelationalDatabasesResult.fromJson(Map<String, dynamic> json) {
    return GetRelationalDatabasesResult(
      nextPageToken: json['nextPageToken'] as String?,
      relationalDatabases: (json['relationalDatabases'] as List?)
          ?.whereNotNull()
          .map((e) => RelationalDatabase.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final relationalDatabases = this.relationalDatabases;
    return {
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
      if (relationalDatabases != null)
        'relationalDatabases': relationalDatabases,
    };
  }
}

class GetSetupHistoryResult {
  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetSetupHistory</code> request and specify the next page token using
  /// the pageToken parameter.
  final String? nextPageToken;

  /// The historical information that's returned.
  final List<SetupHistory>? setupHistory;

  GetSetupHistoryResult({
    this.nextPageToken,
    this.setupHistory,
  });

  factory GetSetupHistoryResult.fromJson(Map<String, dynamic> json) {
    return GetSetupHistoryResult(
      nextPageToken: json['nextPageToken'] as String?,
      setupHistory: (json['setupHistory'] as List?)
          ?.whereNotNull()
          .map((e) => SetupHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final setupHistory = this.setupHistory;
    return {
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
      if (setupHistory != null) 'setupHistory': setupHistory,
    };
  }
}

class GetStaticIpResult {
  /// An array of key-value pairs containing information about the requested
  /// static IP.
  final StaticIp? staticIp;

  GetStaticIpResult({
    this.staticIp,
  });

  factory GetStaticIpResult.fromJson(Map<String, dynamic> json) {
    return GetStaticIpResult(
      staticIp: json['staticIp'] != null
          ? StaticIp.fromJson(json['staticIp'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final staticIp = this.staticIp;
    return {
      if (staticIp != null) 'staticIp': staticIp,
    };
  }
}

class GetStaticIpsResult {
  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetStaticIps</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  final String? nextPageToken;

  /// An array of key-value pairs containing information about your get static IPs
  /// request.
  final List<StaticIp>? staticIps;

  GetStaticIpsResult({
    this.nextPageToken,
    this.staticIps,
  });

  factory GetStaticIpsResult.fromJson(Map<String, dynamic> json) {
    return GetStaticIpsResult(
      nextPageToken: json['nextPageToken'] as String?,
      staticIps: (json['staticIps'] as List?)
          ?.whereNotNull()
          .map((e) => StaticIp.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextPageToken = this.nextPageToken;
    final staticIps = this.staticIps;
    return {
      if (nextPageToken != null) 'nextPageToken': nextPageToken,
      if (staticIps != null) 'staticIps': staticIps,
    };
  }
}

enum HeaderEnum {
  accept,
  acceptCharset,
  acceptDatetime,
  acceptEncoding,
  acceptLanguage,
  authorization,
  cloudFrontForwardedProto,
  cloudFrontIsDesktopViewer,
  cloudFrontIsMobileViewer,
  cloudFrontIsSmartTVViewer,
  cloudFrontIsTabletViewer,
  cloudFrontViewerCountry,
  host,
  origin,
  referer,
}

extension HeaderEnumValueExtension on HeaderEnum {
  String toValue() {
    switch (this) {
      case HeaderEnum.accept:
        return 'Accept';
      case HeaderEnum.acceptCharset:
        return 'Accept-Charset';
      case HeaderEnum.acceptDatetime:
        return 'Accept-Datetime';
      case HeaderEnum.acceptEncoding:
        return 'Accept-Encoding';
      case HeaderEnum.acceptLanguage:
        return 'Accept-Language';
      case HeaderEnum.authorization:
        return 'Authorization';
      case HeaderEnum.cloudFrontForwardedProto:
        return 'CloudFront-Forwarded-Proto';
      case HeaderEnum.cloudFrontIsDesktopViewer:
        return 'CloudFront-Is-Desktop-Viewer';
      case HeaderEnum.cloudFrontIsMobileViewer:
        return 'CloudFront-Is-Mobile-Viewer';
      case HeaderEnum.cloudFrontIsSmartTVViewer:
        return 'CloudFront-Is-SmartTV-Viewer';
      case HeaderEnum.cloudFrontIsTabletViewer:
        return 'CloudFront-Is-Tablet-Viewer';
      case HeaderEnum.cloudFrontViewerCountry:
        return 'CloudFront-Viewer-Country';
      case HeaderEnum.host:
        return 'Host';
      case HeaderEnum.origin:
        return 'Origin';
      case HeaderEnum.referer:
        return 'Referer';
    }
  }
}

extension HeaderEnumFromString on String {
  HeaderEnum toHeaderEnum() {
    switch (this) {
      case 'Accept':
        return HeaderEnum.accept;
      case 'Accept-Charset':
        return HeaderEnum.acceptCharset;
      case 'Accept-Datetime':
        return HeaderEnum.acceptDatetime;
      case 'Accept-Encoding':
        return HeaderEnum.acceptEncoding;
      case 'Accept-Language':
        return HeaderEnum.acceptLanguage;
      case 'Authorization':
        return HeaderEnum.authorization;
      case 'CloudFront-Forwarded-Proto':
        return HeaderEnum.cloudFrontForwardedProto;
      case 'CloudFront-Is-Desktop-Viewer':
        return HeaderEnum.cloudFrontIsDesktopViewer;
      case 'CloudFront-Is-Mobile-Viewer':
        return HeaderEnum.cloudFrontIsMobileViewer;
      case 'CloudFront-Is-SmartTV-Viewer':
        return HeaderEnum.cloudFrontIsSmartTVViewer;
      case 'CloudFront-Is-Tablet-Viewer':
        return HeaderEnum.cloudFrontIsTabletViewer;
      case 'CloudFront-Viewer-Country':
        return HeaderEnum.cloudFrontViewerCountry;
      case 'Host':
        return HeaderEnum.host;
      case 'Origin':
        return HeaderEnum.origin;
      case 'Referer':
        return HeaderEnum.referer;
    }
    throw Exception('$this is not known in enum HeaderEnum');
  }
}

/// Describes the request headers that a Lightsail distribution bases caching
/// on.
///
/// For the headers that you specify, your distribution caches separate versions
/// of the specified content based on the header values in viewer requests. For
/// example, suppose viewer requests for <code>logo.jpg</code> contain a custom
/// <code>product</code> header that has a value of either <code>acme</code> or
/// <code>apex</code>, and you configure your distribution to cache your content
/// based on values in the <code>product</code> header. Your distribution
/// forwards the <code>product</code> header to the origin and caches the
/// response from the origin once for each header value.
class HeaderObject {
  /// The specific headers to forward to your distribution's origin.
  final List<HeaderEnum>? headersAllowList;

  /// The headers that you want your distribution to forward to your origin and
  /// base caching on.
  ///
  /// You can configure your distribution to do one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>all</code> </b> - Forward all headers to your origin.
  /// </li>
  /// <li>
  /// <b> <code>none</code> </b> - Forward only the default headers.
  /// </li>
  /// <li>
  /// <b> <code>allow-list</code> </b> - Forward only the headers you specify
  /// using the <code>headersAllowList</code> parameter.
  /// </li>
  /// </ul>
  final ForwardValues? option;

  HeaderObject({
    this.headersAllowList,
    this.option,
  });

  factory HeaderObject.fromJson(Map<String, dynamic> json) {
    return HeaderObject(
      headersAllowList: (json['headersAllowList'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toHeaderEnum())
          .toList(),
      option: (json['option'] as String?)?.toForwardValues(),
    );
  }

  Map<String, dynamic> toJson() {
    final headersAllowList = this.headersAllowList;
    final option = this.option;
    return {
      if (headersAllowList != null)
        'headersAllowList': headersAllowList.map((e) => e.toValue()).toList(),
      if (option != null) 'option': option.toValue(),
    };
  }
}

/// Describes the public SSH host keys or the RDP certificate.
class HostKeyAttributes {
  /// The SSH host key algorithm or the RDP certificate format.
  ///
  /// For SSH host keys, the algorithm may be <code>ssh-rsa</code>,
  /// <code>ecdsa-sha2-nistp256</code>, <code>ssh-ed25519</code>, etc. For RDP
  /// certificates, the algorithm is always <code>x509-cert</code>.
  final String? algorithm;

  /// The SHA-1 fingerprint of the returned SSH host key or RDP certificate.
  ///
  /// <ul>
  /// <li>
  /// Example of an SHA-1 SSH fingerprint:
  ///
  /// <code>SHA1:1CHH6FaAaXjtFOsR/t83vf91SR0</code>
  /// </li>
  /// <li>
  /// Example of an SHA-1 RDP fingerprint:
  ///
  /// <code>af:34:51:fe:09:f0:e0:da:b8:4e:56:ca:60:c2:10:ff:38:06:db:45</code>
  /// </li>
  /// </ul>
  final String? fingerprintSHA1;

  /// The SHA-256 fingerprint of the returned SSH host key or RDP certificate.
  ///
  /// <ul>
  /// <li>
  /// Example of an SHA-256 SSH fingerprint:
  ///
  /// <code>SHA256:KTsMnRBh1IhD17HpdfsbzeGA4jOijm5tyXsMjKVbB8o</code>
  /// </li>
  /// <li>
  /// Example of an SHA-256 RDP fingerprint:
  ///
  /// <code>03:9b:36:9f:4b:de:4e:61:70:fc:7c:c9:78:e7:d2:1a:1c:25:a8:0c:91:f6:7c:e4:d6:a0:85:c8:b4:53:99:68</code>
  /// </li>
  /// </ul>
  final String? fingerprintSHA256;

  /// The returned RDP certificate is not valid after this point in time.
  ///
  /// This value is listed only for RDP certificates.
  final DateTime? notValidAfter;

  /// The returned RDP certificate is valid after this point in time.
  ///
  /// This value is listed only for RDP certificates.
  final DateTime? notValidBefore;

  /// The public SSH host key or the RDP certificate.
  final String? publicKey;

  /// The time that the SSH host key or RDP certificate was recorded by Lightsail.
  final DateTime? witnessedAt;

  HostKeyAttributes({
    this.algorithm,
    this.fingerprintSHA1,
    this.fingerprintSHA256,
    this.notValidAfter,
    this.notValidBefore,
    this.publicKey,
    this.witnessedAt,
  });

  factory HostKeyAttributes.fromJson(Map<String, dynamic> json) {
    return HostKeyAttributes(
      algorithm: json['algorithm'] as String?,
      fingerprintSHA1: json['fingerprintSHA1'] as String?,
      fingerprintSHA256: json['fingerprintSHA256'] as String?,
      notValidAfter: timeStampFromJson(json['notValidAfter']),
      notValidBefore: timeStampFromJson(json['notValidBefore']),
      publicKey: json['publicKey'] as String?,
      witnessedAt: timeStampFromJson(json['witnessedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final algorithm = this.algorithm;
    final fingerprintSHA1 = this.fingerprintSHA1;
    final fingerprintSHA256 = this.fingerprintSHA256;
    final notValidAfter = this.notValidAfter;
    final notValidBefore = this.notValidBefore;
    final publicKey = this.publicKey;
    final witnessedAt = this.witnessedAt;
    return {
      if (algorithm != null) 'algorithm': algorithm,
      if (fingerprintSHA1 != null) 'fingerprintSHA1': fingerprintSHA1,
      if (fingerprintSHA256 != null) 'fingerprintSHA256': fingerprintSHA256,
      if (notValidAfter != null)
        'notValidAfter': unixTimestampToJson(notValidAfter),
      if (notValidBefore != null)
        'notValidBefore': unixTimestampToJson(notValidBefore),
      if (publicKey != null) 'publicKey': publicKey,
      if (witnessedAt != null) 'witnessedAt': unixTimestampToJson(witnessedAt),
    };
  }
}

enum HttpEndpoint {
  disabled,
  enabled,
}

extension HttpEndpointValueExtension on HttpEndpoint {
  String toValue() {
    switch (this) {
      case HttpEndpoint.disabled:
        return 'disabled';
      case HttpEndpoint.enabled:
        return 'enabled';
    }
  }
}

extension HttpEndpointFromString on String {
  HttpEndpoint toHttpEndpoint() {
    switch (this) {
      case 'disabled':
        return HttpEndpoint.disabled;
      case 'enabled':
        return HttpEndpoint.enabled;
    }
    throw Exception('$this is not known in enum HttpEndpoint');
  }
}

enum HttpProtocolIpv6 {
  disabled,
  enabled,
}

extension HttpProtocolIpv6ValueExtension on HttpProtocolIpv6 {
  String toValue() {
    switch (this) {
      case HttpProtocolIpv6.disabled:
        return 'disabled';
      case HttpProtocolIpv6.enabled:
        return 'enabled';
    }
  }
}

extension HttpProtocolIpv6FromString on String {
  HttpProtocolIpv6 toHttpProtocolIpv6() {
    switch (this) {
      case 'disabled':
        return HttpProtocolIpv6.disabled;
      case 'enabled':
        return HttpProtocolIpv6.enabled;
    }
    throw Exception('$this is not known in enum HttpProtocolIpv6');
  }
}

enum HttpTokens {
  optional,
  required,
}

extension HttpTokensValueExtension on HttpTokens {
  String toValue() {
    switch (this) {
      case HttpTokens.optional:
        return 'optional';
      case HttpTokens.required:
        return 'required';
    }
  }
}

extension HttpTokensFromString on String {
  HttpTokens toHttpTokens() {
    switch (this) {
      case 'optional':
        return HttpTokens.optional;
      case 'required':
        return HttpTokens.required;
    }
    throw Exception('$this is not known in enum HttpTokens');
  }
}

class ImportKeyPairResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final Operation? operation;

  ImportKeyPairResult({
    this.operation,
  });

  factory ImportKeyPairResult.fromJson(Map<String, dynamic> json) {
    return ImportKeyPairResult(
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    return {
      if (operation != null) 'operation': operation,
    };
  }
}

/// Describes the origin resource of an Amazon Lightsail content delivery
/// network (CDN) distribution.
///
/// An origin can be a Lightsail instance, bucket, container service, or load
/// balancer. A distribution pulls content from an origin, caches it, and serves
/// it to viewers via a worldwide network of edge servers.
class InputOrigin {
  /// The name of the origin resource.
  final String? name;

  /// The protocol that your Amazon Lightsail distribution uses when establishing
  /// a connection with your origin to pull content.
  final OriginProtocolPolicyEnum? protocolPolicy;

  /// The AWS Region name of the origin resource.
  final RegionName? regionName;

  /// The amount of time, in seconds, that the distribution waits for a response
  /// after forwarding a request to the origin. The minimum timeout is 1 second,
  /// the maximum is 60 seconds, and the default (if you don't specify otherwise)
  /// is 30 seconds.
  final int? responseTimeout;

  InputOrigin({
    this.name,
    this.protocolPolicy,
    this.regionName,
    this.responseTimeout,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final protocolPolicy = this.protocolPolicy;
    final regionName = this.regionName;
    final responseTimeout = this.responseTimeout;
    return {
      if (name != null) 'name': name,
      if (protocolPolicy != null) 'protocolPolicy': protocolPolicy.toValue(),
      if (regionName != null) 'regionName': regionName.toValue(),
      if (responseTimeout != null) 'responseTimeout': responseTimeout,
    };
  }
}

/// Describes an instance (a virtual private server).
class Instance {
  /// An array of objects representing the add-ons enabled on the instance.
  final List<AddOn>? addOns;

  /// The Amazon Resource Name (ARN) of the instance
  /// (<code>arn:aws:lightsail:us-east-2:123456789101:Instance/244ad76f-8aad-4741-809f-12345EXAMPLE</code>).
  final String? arn;

  /// The blueprint ID (<code>amazon_linux_2023</code>).
  final String? blueprintId;

  /// The friendly name of the blueprint (<code>Amazon Linux 2023</code>).
  final String? blueprintName;

  /// The bundle for the instance (<code>micro_x_x</code>).
  final String? bundleId;

  /// The timestamp when the instance was created (<code>1479734909.17</code>) in
  /// Unix time format.
  final DateTime? createdAt;

  /// The size of the vCPU and the amount of RAM for the instance.
  final InstanceHardware? hardware;

  /// The IP address type of the instance.
  ///
  /// The possible values are <code>ipv4</code> for IPv4 only, <code>ipv6</code>
  /// for IPv6 only, and <code>dualstack</code> for IPv4 and IPv6.
  final IpAddressType? ipAddressType;

  /// The IPv6 addresses of the instance.
  final List<String>? ipv6Addresses;

  /// A Boolean value indicating whether this instance has a static IP assigned to
  /// it.
  final bool? isStaticIp;

  /// The region name and Availability Zone where the instance is located.
  final ResourceLocation? location;

  /// The metadata options for the Amazon Lightsail instance.
  final InstanceMetadataOptions? metadataOptions;

  /// The name the user gave the instance (<code>Amazon_Linux_2023-1</code>).
  final String? name;

  /// Information about the public ports and monthly data transfer rates for the
  /// instance.
  final InstanceNetworking? networking;

  /// The private IP address of the instance.
  final String? privateIpAddress;

  /// The public IP address of the instance.
  final String? publicIpAddress;

  /// The type of resource (usually <code>Instance</code>).
  final ResourceType? resourceType;

  /// The name of the SSH key being used to connect to the instance
  /// (<code>LightsailDefaultKeyPair</code>).
  final String? sshKeyName;

  /// The status code and the state (<code>running</code>) for the instance.
  final InstanceState? state;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more easily.
  final String? supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags">Amazon
  /// Lightsail Developer Guide</a>.
  final List<Tag>? tags;

  /// The user name for connecting to the instance (<code>ec2-user</code>).
  final String? username;

  Instance({
    this.addOns,
    this.arn,
    this.blueprintId,
    this.blueprintName,
    this.bundleId,
    this.createdAt,
    this.hardware,
    this.ipAddressType,
    this.ipv6Addresses,
    this.isStaticIp,
    this.location,
    this.metadataOptions,
    this.name,
    this.networking,
    this.privateIpAddress,
    this.publicIpAddress,
    this.resourceType,
    this.sshKeyName,
    this.state,
    this.supportCode,
    this.tags,
    this.username,
  });

  factory Instance.fromJson(Map<String, dynamic> json) {
    return Instance(
      addOns: (json['addOns'] as List?)
          ?.whereNotNull()
          .map((e) => AddOn.fromJson(e as Map<String, dynamic>))
          .toList(),
      arn: json['arn'] as String?,
      blueprintId: json['blueprintId'] as String?,
      blueprintName: json['blueprintName'] as String?,
      bundleId: json['bundleId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      hardware: json['hardware'] != null
          ? InstanceHardware.fromJson(json['hardware'] as Map<String, dynamic>)
          : null,
      ipAddressType: (json['ipAddressType'] as String?)?.toIpAddressType(),
      ipv6Addresses: (json['ipv6Addresses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      isStaticIp: json['isStaticIp'] as bool?,
      location: json['location'] != null
          ? ResourceLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      metadataOptions: json['metadataOptions'] != null
          ? InstanceMetadataOptions.fromJson(
              json['metadataOptions'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      networking: json['networking'] != null
          ? InstanceNetworking.fromJson(
              json['networking'] as Map<String, dynamic>)
          : null,
      privateIpAddress: json['privateIpAddress'] as String?,
      publicIpAddress: json['publicIpAddress'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      sshKeyName: json['sshKeyName'] as String?,
      state: json['state'] != null
          ? InstanceState.fromJson(json['state'] as Map<String, dynamic>)
          : null,
      supportCode: json['supportCode'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addOns = this.addOns;
    final arn = this.arn;
    final blueprintId = this.blueprintId;
    final blueprintName = this.blueprintName;
    final bundleId = this.bundleId;
    final createdAt = this.createdAt;
    final hardware = this.hardware;
    final ipAddressType = this.ipAddressType;
    final ipv6Addresses = this.ipv6Addresses;
    final isStaticIp = this.isStaticIp;
    final location = this.location;
    final metadataOptions = this.metadataOptions;
    final name = this.name;
    final networking = this.networking;
    final privateIpAddress = this.privateIpAddress;
    final publicIpAddress = this.publicIpAddress;
    final resourceType = this.resourceType;
    final sshKeyName = this.sshKeyName;
    final state = this.state;
    final supportCode = this.supportCode;
    final tags = this.tags;
    final username = this.username;
    return {
      if (addOns != null) 'addOns': addOns,
      if (arn != null) 'arn': arn,
      if (blueprintId != null) 'blueprintId': blueprintId,
      if (blueprintName != null) 'blueprintName': blueprintName,
      if (bundleId != null) 'bundleId': bundleId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (hardware != null) 'hardware': hardware,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.toValue(),
      if (ipv6Addresses != null) 'ipv6Addresses': ipv6Addresses,
      if (isStaticIp != null) 'isStaticIp': isStaticIp,
      if (location != null) 'location': location,
      if (metadataOptions != null) 'metadataOptions': metadataOptions,
      if (name != null) 'name': name,
      if (networking != null) 'networking': networking,
      if (privateIpAddress != null) 'privateIpAddress': privateIpAddress,
      if (publicIpAddress != null) 'publicIpAddress': publicIpAddress,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (sshKeyName != null) 'sshKeyName': sshKeyName,
      if (state != null) 'state': state,
      if (supportCode != null) 'supportCode': supportCode,
      if (tags != null) 'tags': tags,
      if (username != null) 'username': username,
    };
  }
}

/// The parameters for gaining temporary access to one of your Amazon Lightsail
/// instances.
class InstanceAccessDetails {
  /// For SSH access, the public key to use when accessing your instance For
  /// OpenSSH clients (command line SSH), you should save this value to
  /// <code>tempkey-cert.pub</code>.
  final String? certKey;

  /// For SSH access, the date on which the temporary keys expire.
  final DateTime? expiresAt;

  /// Describes the public SSH host keys or the RDP certificate.
  final List<HostKeyAttributes>? hostKeys;

  /// The name of this Amazon Lightsail instance.
  final String? instanceName;

  /// The public IP address of the Amazon Lightsail instance.
  final String? ipAddress;

  /// The IPv6 address of the Amazon Lightsail instance.
  final List<String>? ipv6Addresses;

  /// For RDP access, the password for your Amazon Lightsail instance. Password
  /// will be an empty string if the password for your new instance is not ready
  /// yet. When you create an instance, it can take up to 15 minutes for the
  /// instance to be ready.
  /// <note>
  /// If you create an instance using any key pair other than the default
  /// (<code>LightsailDefaultKeyPair</code>), <code>password</code> will always be
  /// an empty string.
  ///
  /// If you change the Administrator password on the instance, Lightsail will
  /// continue to return the original password value. When accessing the instance
  /// using RDP, you need to manually enter the Administrator password after
  /// changing it from the default.
  /// </note>
  final String? password;

  /// For a Windows Server-based instance, an object with the data you can use to
  /// retrieve your password. This is only needed if <code>password</code> is
  /// empty and the instance is not new (and therefore the password is not ready
  /// yet). When you create an instance, it can take up to 15 minutes for the
  /// instance to be ready.
  final PasswordData? passwordData;

  /// For SSH access, the temporary private key. For OpenSSH clients (command line
  /// SSH), you should save this value to <code>tempkey</code>).
  final String? privateKey;

  /// The protocol for these Amazon Lightsail instance access details.
  final InstanceAccessProtocol? protocol;

  /// The user name to use when logging in to the Amazon Lightsail instance.
  final String? username;

  InstanceAccessDetails({
    this.certKey,
    this.expiresAt,
    this.hostKeys,
    this.instanceName,
    this.ipAddress,
    this.ipv6Addresses,
    this.password,
    this.passwordData,
    this.privateKey,
    this.protocol,
    this.username,
  });

  factory InstanceAccessDetails.fromJson(Map<String, dynamic> json) {
    return InstanceAccessDetails(
      certKey: json['certKey'] as String?,
      expiresAt: timeStampFromJson(json['expiresAt']),
      hostKeys: (json['hostKeys'] as List?)
          ?.whereNotNull()
          .map((e) => HostKeyAttributes.fromJson(e as Map<String, dynamic>))
          .toList(),
      instanceName: json['instanceName'] as String?,
      ipAddress: json['ipAddress'] as String?,
      ipv6Addresses: (json['ipv6Addresses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      password: json['password'] as String?,
      passwordData: json['passwordData'] != null
          ? PasswordData.fromJson(json['passwordData'] as Map<String, dynamic>)
          : null,
      privateKey: json['privateKey'] as String?,
      protocol: (json['protocol'] as String?)?.toInstanceAccessProtocol(),
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certKey = this.certKey;
    final expiresAt = this.expiresAt;
    final hostKeys = this.hostKeys;
    final instanceName = this.instanceName;
    final ipAddress = this.ipAddress;
    final ipv6Addresses = this.ipv6Addresses;
    final password = this.password;
    final passwordData = this.passwordData;
    final privateKey = this.privateKey;
    final protocol = this.protocol;
    final username = this.username;
    return {
      if (certKey != null) 'certKey': certKey,
      if (expiresAt != null) 'expiresAt': unixTimestampToJson(expiresAt),
      if (hostKeys != null) 'hostKeys': hostKeys,
      if (instanceName != null) 'instanceName': instanceName,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (ipv6Addresses != null) 'ipv6Addresses': ipv6Addresses,
      if (password != null) 'password': password,
      if (passwordData != null) 'passwordData': passwordData,
      if (privateKey != null) 'privateKey': privateKey,
      if (protocol != null) 'protocol': protocol.toValue(),
      if (username != null) 'username': username,
    };
  }
}

enum InstanceAccessProtocol {
  ssh,
  rdp,
}

extension InstanceAccessProtocolValueExtension on InstanceAccessProtocol {
  String toValue() {
    switch (this) {
      case InstanceAccessProtocol.ssh:
        return 'ssh';
      case InstanceAccessProtocol.rdp:
        return 'rdp';
    }
  }
}

extension InstanceAccessProtocolFromString on String {
  InstanceAccessProtocol toInstanceAccessProtocol() {
    switch (this) {
      case 'ssh':
        return InstanceAccessProtocol.ssh;
      case 'rdp':
        return InstanceAccessProtocol.rdp;
    }
    throw Exception('$this is not known in enum InstanceAccessProtocol');
  }
}

/// Describes the Amazon Elastic Compute Cloud instance and related resources to
/// be created using the <code>create cloud formation stack</code> operation.
class InstanceEntry {
  /// The Availability Zone for the new Amazon EC2 instance.
  final String availabilityZone;

  /// The instance type (<code>t2.micro</code>) to use for the new Amazon EC2
  /// instance.
  final String instanceType;

  /// The port configuration to use for the new Amazon EC2 instance.
  ///
  /// The following configuration options are available:
  ///
  /// <ul>
  /// <li>
  /// <code>DEFAULT</code> - Use the default firewall settings from the Lightsail
  /// instance blueprint. If this is specified, then IPv4 and IPv6 will be
  /// configured for the new instance that is created in Amazon EC2.
  /// </li>
  /// <li>
  /// <code>INSTANCE</code> - Use the configured firewall settings from the source
  /// Lightsail instance. If this is specified, the new instance that is created
  /// in Amazon EC2 will be configured to match the configuration of the source
  /// Lightsail instance. For example, if the source instance is configured for
  /// dual-stack (IPv4 and IPv6), then IPv4 and IPv6 will be configured for the
  /// new instance that is created in Amazon EC2. If the source instance is
  /// configured for IPv4 only, then only IPv4 will be configured for the new
  /// instance that is created in Amazon EC2.
  /// </li>
  /// <li>
  /// <code>NONE</code> - Use the default Amazon EC2 security group. If this is
  /// specified, then only IPv4 will be configured for the new instance that is
  /// created in Amazon EC2.
  /// </li>
  /// <li>
  /// <code>CLOSED</code> - All ports closed. If this is specified, then only IPv4
  /// will be configured for the new instance that is created in Amazon EC2.
  /// </li>
  /// </ul> <note>
  /// If you configured <code>lightsail-connect</code> as a
  /// <code>cidrListAliases</code> on your instance, or if you chose to allow the
  /// Lightsail browser-based SSH or RDP clients to connect to your instance, that
  /// configuration is not carried over to your new Amazon EC2 instance.
  /// </note>
  final PortInfoSourceType portInfoSource;

  /// The name of the export snapshot record, which contains the exported
  /// Lightsail instance snapshot that will be used as the source of the new
  /// Amazon EC2 instance.
  ///
  /// Use the <code>get export snapshot records</code> operation to get a list of
  /// export snapshot records that you can use to create a CloudFormation stack.
  final String sourceName;

  /// A launch script you can create that configures a server with additional user
  /// data. For example, you might want to run <code>apt-get -y update</code>.
  /// <note>
  /// Depending on the machine image you choose, the command to get software on
  /// your instance varies. Amazon Linux and CentOS use <code>yum</code>, Debian
  /// and Ubuntu use <code>apt-get</code>, and FreeBSD uses <code>pkg</code>.
  /// </note>
  final String? userData;

  InstanceEntry({
    required this.availabilityZone,
    required this.instanceType,
    required this.portInfoSource,
    required this.sourceName,
    this.userData,
  });

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final instanceType = this.instanceType;
    final portInfoSource = this.portInfoSource;
    final sourceName = this.sourceName;
    final userData = this.userData;
    return {
      'availabilityZone': availabilityZone,
      'instanceType': instanceType,
      'portInfoSource': portInfoSource.toValue(),
      'sourceName': sourceName,
      if (userData != null) 'userData': userData,
    };
  }
}

/// Describes the hardware for the instance.
class InstanceHardware {
  /// The number of vCPUs the instance has.
  final int? cpuCount;

  /// The disks attached to the instance.
  final List<Disk>? disks;

  /// The amount of RAM in GB on the instance (<code>1.0</code>).
  final double? ramSizeInGb;

  InstanceHardware({
    this.cpuCount,
    this.disks,
    this.ramSizeInGb,
  });

  factory InstanceHardware.fromJson(Map<String, dynamic> json) {
    return InstanceHardware(
      cpuCount: json['cpuCount'] as int?,
      disks: (json['disks'] as List?)
          ?.whereNotNull()
          .map((e) => Disk.fromJson(e as Map<String, dynamic>))
          .toList(),
      ramSizeInGb: json['ramSizeInGb'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final cpuCount = this.cpuCount;
    final disks = this.disks;
    final ramSizeInGb = this.ramSizeInGb;
    return {
      if (cpuCount != null) 'cpuCount': cpuCount,
      if (disks != null) 'disks': disks,
      if (ramSizeInGb != null) 'ramSizeInGb': ramSizeInGb,
    };
  }
}

enum InstanceHealthReason {
  lbRegistrationInProgress,
  lbInitialHealthChecking,
  lbInternalError,
  instanceResponseCodeMismatch,
  instanceTimeout,
  instanceFailedHealthChecks,
  instanceNotRegistered,
  instanceNotInUse,
  instanceDeregistrationInProgress,
  instanceInvalidState,
  instanceIpUnusable,
}

extension InstanceHealthReasonValueExtension on InstanceHealthReason {
  String toValue() {
    switch (this) {
      case InstanceHealthReason.lbRegistrationInProgress:
        return 'Lb.RegistrationInProgress';
      case InstanceHealthReason.lbInitialHealthChecking:
        return 'Lb.InitialHealthChecking';
      case InstanceHealthReason.lbInternalError:
        return 'Lb.InternalError';
      case InstanceHealthReason.instanceResponseCodeMismatch:
        return 'Instance.ResponseCodeMismatch';
      case InstanceHealthReason.instanceTimeout:
        return 'Instance.Timeout';
      case InstanceHealthReason.instanceFailedHealthChecks:
        return 'Instance.FailedHealthChecks';
      case InstanceHealthReason.instanceNotRegistered:
        return 'Instance.NotRegistered';
      case InstanceHealthReason.instanceNotInUse:
        return 'Instance.NotInUse';
      case InstanceHealthReason.instanceDeregistrationInProgress:
        return 'Instance.DeregistrationInProgress';
      case InstanceHealthReason.instanceInvalidState:
        return 'Instance.InvalidState';
      case InstanceHealthReason.instanceIpUnusable:
        return 'Instance.IpUnusable';
    }
  }
}

extension InstanceHealthReasonFromString on String {
  InstanceHealthReason toInstanceHealthReason() {
    switch (this) {
      case 'Lb.RegistrationInProgress':
        return InstanceHealthReason.lbRegistrationInProgress;
      case 'Lb.InitialHealthChecking':
        return InstanceHealthReason.lbInitialHealthChecking;
      case 'Lb.InternalError':
        return InstanceHealthReason.lbInternalError;
      case 'Instance.ResponseCodeMismatch':
        return InstanceHealthReason.instanceResponseCodeMismatch;
      case 'Instance.Timeout':
        return InstanceHealthReason.instanceTimeout;
      case 'Instance.FailedHealthChecks':
        return InstanceHealthReason.instanceFailedHealthChecks;
      case 'Instance.NotRegistered':
        return InstanceHealthReason.instanceNotRegistered;
      case 'Instance.NotInUse':
        return InstanceHealthReason.instanceNotInUse;
      case 'Instance.DeregistrationInProgress':
        return InstanceHealthReason.instanceDeregistrationInProgress;
      case 'Instance.InvalidState':
        return InstanceHealthReason.instanceInvalidState;
      case 'Instance.IpUnusable':
        return InstanceHealthReason.instanceIpUnusable;
    }
    throw Exception('$this is not known in enum InstanceHealthReason');
  }
}

enum InstanceHealthState {
  initial,
  healthy,
  unhealthy,
  unused,
  draining,
  unavailable,
}

extension InstanceHealthStateValueExtension on InstanceHealthState {
  String toValue() {
    switch (this) {
      case InstanceHealthState.initial:
        return 'initial';
      case InstanceHealthState.healthy:
        return 'healthy';
      case InstanceHealthState.unhealthy:
        return 'unhealthy';
      case InstanceHealthState.unused:
        return 'unused';
      case InstanceHealthState.draining:
        return 'draining';
      case InstanceHealthState.unavailable:
        return 'unavailable';
    }
  }
}

extension InstanceHealthStateFromString on String {
  InstanceHealthState toInstanceHealthState() {
    switch (this) {
      case 'initial':
        return InstanceHealthState.initial;
      case 'healthy':
        return InstanceHealthState.healthy;
      case 'unhealthy':
        return InstanceHealthState.unhealthy;
      case 'unused':
        return InstanceHealthState.unused;
      case 'draining':
        return InstanceHealthState.draining;
      case 'unavailable':
        return InstanceHealthState.unavailable;
    }
    throw Exception('$this is not known in enum InstanceHealthState');
  }
}

/// Describes information about the health of the instance.
class InstanceHealthSummary {
  /// Describes the overall instance health. Valid values are below.
  final InstanceHealthState? instanceHealth;

  /// More information about the instance health. If the
  /// <code>instanceHealth</code> is <code>healthy</code>, then an
  /// <code>instanceHealthReason</code> value is not provided.
  ///
  /// If <b> <code>instanceHealth</code> </b> is <code>initial</code>, the <b>
  /// <code>instanceHealthReason</code> </b> value can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>Lb.RegistrationInProgress</code> </b> - The target instance is in
  /// the process of being registered with the load balancer.
  /// </li>
  /// <li>
  /// <b> <code>Lb.InitialHealthChecking</code> </b> - The Lightsail load balancer
  /// is still sending the target instance the minimum number of health checks
  /// required to determine its health status.
  /// </li>
  /// </ul>
  /// If <b> <code>instanceHealth</code> </b> is <code>unhealthy</code>, the <b>
  /// <code>instanceHealthReason</code> </b> value can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>Instance.ResponseCodeMismatch</code> </b> - The health checks did
  /// not return an expected HTTP code.
  /// </li>
  /// <li>
  /// <b> <code>Instance.Timeout</code> </b> - The health check requests timed
  /// out.
  /// </li>
  /// <li>
  /// <b> <code>Instance.FailedHealthChecks</code> </b> - The health checks failed
  /// because the connection to the target instance timed out, the target instance
  /// response was malformed, or the target instance failed the health check for
  /// an unknown reason.
  /// </li>
  /// <li>
  /// <b> <code>Lb.InternalError</code> </b> - The health checks failed due to an
  /// internal error.
  /// </li>
  /// </ul>
  /// If <b> <code>instanceHealth</code> </b> is <code>unused</code>, the <b>
  /// <code>instanceHealthReason</code> </b> value can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>Instance.NotRegistered</code> </b> - The target instance is not
  /// registered with the target group.
  /// </li>
  /// <li>
  /// <b> <code>Instance.NotInUse</code> </b> - The target group is not used by
  /// any load balancer, or the target instance is in an Availability Zone that is
  /// not enabled for its load balancer.
  /// </li>
  /// <li>
  /// <b> <code>Instance.IpUnusable</code> </b> - The target IP address is
  /// reserved for use by a Lightsail load balancer.
  /// </li>
  /// <li>
  /// <b> <code>Instance.InvalidState</code> </b> - The target is in the stopped
  /// or terminated state.
  /// </li>
  /// </ul>
  /// If <b> <code>instanceHealth</code> </b> is <code>draining</code>, the <b>
  /// <code>instanceHealthReason</code> </b> value can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>Instance.DeregistrationInProgress</code> </b> - The target
  /// instance is in the process of being deregistered and the deregistration
  /// delay period has not expired.
  /// </li>
  /// </ul>
  final InstanceHealthReason? instanceHealthReason;

  /// The name of the Lightsail instance for which you are requesting health check
  /// data.
  final String? instanceName;

  InstanceHealthSummary({
    this.instanceHealth,
    this.instanceHealthReason,
    this.instanceName,
  });

  factory InstanceHealthSummary.fromJson(Map<String, dynamic> json) {
    return InstanceHealthSummary(
      instanceHealth:
          (json['instanceHealth'] as String?)?.toInstanceHealthState(),
      instanceHealthReason:
          (json['instanceHealthReason'] as String?)?.toInstanceHealthReason(),
      instanceName: json['instanceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceHealth = this.instanceHealth;
    final instanceHealthReason = this.instanceHealthReason;
    final instanceName = this.instanceName;
    return {
      if (instanceHealth != null) 'instanceHealth': instanceHealth.toValue(),
      if (instanceHealthReason != null)
        'instanceHealthReason': instanceHealthReason.toValue(),
      if (instanceName != null) 'instanceName': instanceName,
    };
  }
}

/// The metadata options for the instance.
class InstanceMetadataOptions {
  /// Indicates whether the HTTP metadata endpoint on your instances is enabled or
  /// disabled.
  ///
  /// If the value is <code>disabled</code>, you cannot access your instance
  /// metadata.
  final HttpEndpoint? httpEndpoint;

  /// Indicates whether the IPv6 endpoint for the instance metadata service is
  /// enabled or disabled.
  final HttpProtocolIpv6? httpProtocolIpv6;

  /// The desired HTTP PUT response hop limit for instance metadata requests. A
  /// larger number means that the instance metadata requests can travel farther.
  final int? httpPutResponseHopLimit;

  /// The state of token usage for your instance metadata requests.
  ///
  /// If the state is <code>optional</code>, you can choose whether to retrieve
  /// instance metadata with a signed token header on your request. If you
  /// retrieve the IAM role credentials without a token, the version 1.0 role
  /// credentials are returned. If you retrieve the IAM role credentials by using
  /// a valid signed token, the version 2.0 role credentials are returned.
  ///
  /// If the state is <code>required</code>, you must send a signed token header
  /// with all instance metadata retrieval requests. In this state, retrieving the
  /// IAM role credential always returns the version 2.0 credentials. The version
  /// 1.0 credentials are not available.
  /// <important>
  /// Not all instance blueprints in Lightsail support version 2.0 credentials.
  /// Use the <code>MetadataNoToken</code> instance metric to track the number of
  /// calls to the instance metadata service that are using version 1.0
  /// credentials. For more information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-viewing-instance-health-metrics">Viewing
  /// instance metrics in Amazon Lightsail</a> in the <i>Amazon Lightsail
  /// Developer Guide</i>.
  /// </important>
  final HttpTokens? httpTokens;

  /// The state of the metadata option changes.
  ///
  /// The following states are possible:
  ///
  /// <ul>
  /// <li>
  /// <code>pending</code> - The metadata options are being updated. The instance
  /// is not yet ready to process metadata traffic with the new selection.
  /// </li>
  /// <li>
  /// <code>applied</code> - The metadata options have been successfully applied
  /// to the instance.
  /// </li>
  /// </ul>
  final InstanceMetadataState? state;

  InstanceMetadataOptions({
    this.httpEndpoint,
    this.httpProtocolIpv6,
    this.httpPutResponseHopLimit,
    this.httpTokens,
    this.state,
  });

  factory InstanceMetadataOptions.fromJson(Map<String, dynamic> json) {
    return InstanceMetadataOptions(
      httpEndpoint: (json['httpEndpoint'] as String?)?.toHttpEndpoint(),
      httpProtocolIpv6:
          (json['httpProtocolIpv6'] as String?)?.toHttpProtocolIpv6(),
      httpPutResponseHopLimit: json['httpPutResponseHopLimit'] as int?,
      httpTokens: (json['httpTokens'] as String?)?.toHttpTokens(),
      state: (json['state'] as String?)?.toInstanceMetadataState(),
    );
  }

  Map<String, dynamic> toJson() {
    final httpEndpoint = this.httpEndpoint;
    final httpProtocolIpv6 = this.httpProtocolIpv6;
    final httpPutResponseHopLimit = this.httpPutResponseHopLimit;
    final httpTokens = this.httpTokens;
    final state = this.state;
    return {
      if (httpEndpoint != null) 'httpEndpoint': httpEndpoint.toValue(),
      if (httpProtocolIpv6 != null)
        'httpProtocolIpv6': httpProtocolIpv6.toValue(),
      if (httpPutResponseHopLimit != null)
        'httpPutResponseHopLimit': httpPutResponseHopLimit,
      if (httpTokens != null) 'httpTokens': httpTokens.toValue(),
      if (state != null) 'state': state.toValue(),
    };
  }
}

enum InstanceMetadataState {
  pending,
  applied,
}

extension InstanceMetadataStateValueExtension on InstanceMetadataState {
  String toValue() {
    switch (this) {
      case InstanceMetadataState.pending:
        return 'pending';
      case InstanceMetadataState.applied:
        return 'applied';
    }
  }
}

extension InstanceMetadataStateFromString on String {
  InstanceMetadataState toInstanceMetadataState() {
    switch (this) {
      case 'pending':
        return InstanceMetadataState.pending;
      case 'applied':
        return InstanceMetadataState.applied;
    }
    throw Exception('$this is not known in enum InstanceMetadataState');
  }
}

enum InstanceMetricName {
  cPUUtilization,
  networkIn,
  networkOut,
  statusCheckFailed,
  statusCheckFailedInstance,
  statusCheckFailedSystem,
  burstCapacityTime,
  burstCapacityPercentage,
  metadataNoToken,
}

extension InstanceMetricNameValueExtension on InstanceMetricName {
  String toValue() {
    switch (this) {
      case InstanceMetricName.cPUUtilization:
        return 'CPUUtilization';
      case InstanceMetricName.networkIn:
        return 'NetworkIn';
      case InstanceMetricName.networkOut:
        return 'NetworkOut';
      case InstanceMetricName.statusCheckFailed:
        return 'StatusCheckFailed';
      case InstanceMetricName.statusCheckFailedInstance:
        return 'StatusCheckFailed_Instance';
      case InstanceMetricName.statusCheckFailedSystem:
        return 'StatusCheckFailed_System';
      case InstanceMetricName.burstCapacityTime:
        return 'BurstCapacityTime';
      case InstanceMetricName.burstCapacityPercentage:
        return 'BurstCapacityPercentage';
      case InstanceMetricName.metadataNoToken:
        return 'MetadataNoToken';
    }
  }
}

extension InstanceMetricNameFromString on String {
  InstanceMetricName toInstanceMetricName() {
    switch (this) {
      case 'CPUUtilization':
        return InstanceMetricName.cPUUtilization;
      case 'NetworkIn':
        return InstanceMetricName.networkIn;
      case 'NetworkOut':
        return InstanceMetricName.networkOut;
      case 'StatusCheckFailed':
        return InstanceMetricName.statusCheckFailed;
      case 'StatusCheckFailed_Instance':
        return InstanceMetricName.statusCheckFailedInstance;
      case 'StatusCheckFailed_System':
        return InstanceMetricName.statusCheckFailedSystem;
      case 'BurstCapacityTime':
        return InstanceMetricName.burstCapacityTime;
      case 'BurstCapacityPercentage':
        return InstanceMetricName.burstCapacityPercentage;
      case 'MetadataNoToken':
        return InstanceMetricName.metadataNoToken;
    }
    throw Exception('$this is not known in enum InstanceMetricName');
  }
}

/// Describes monthly data transfer rates and port information for an instance.
class InstanceNetworking {
  /// The amount of data in GB allocated for monthly data transfers.
  final MonthlyTransfer? monthlyTransfer;

  /// An array of key-value pairs containing information about the ports on the
  /// instance.
  final List<InstancePortInfo>? ports;

  InstanceNetworking({
    this.monthlyTransfer,
    this.ports,
  });

  factory InstanceNetworking.fromJson(Map<String, dynamic> json) {
    return InstanceNetworking(
      monthlyTransfer: json['monthlyTransfer'] != null
          ? MonthlyTransfer.fromJson(
              json['monthlyTransfer'] as Map<String, dynamic>)
          : null,
      ports: (json['ports'] as List?)
          ?.whereNotNull()
          .map((e) => InstancePortInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final monthlyTransfer = this.monthlyTransfer;
    final ports = this.ports;
    return {
      if (monthlyTransfer != null) 'monthlyTransfer': monthlyTransfer,
      if (ports != null) 'ports': ports,
    };
  }
}

enum InstancePlatform {
  linuxUnix,
  windows,
}

extension InstancePlatformValueExtension on InstancePlatform {
  String toValue() {
    switch (this) {
      case InstancePlatform.linuxUnix:
        return 'LINUX_UNIX';
      case InstancePlatform.windows:
        return 'WINDOWS';
    }
  }
}

extension InstancePlatformFromString on String {
  InstancePlatform toInstancePlatform() {
    switch (this) {
      case 'LINUX_UNIX':
        return InstancePlatform.linuxUnix;
      case 'WINDOWS':
        return InstancePlatform.windows;
    }
    throw Exception('$this is not known in enum InstancePlatform');
  }
}

/// Describes information about ports for an Amazon Lightsail instance.
class InstancePortInfo {
  /// The access direction (<code>inbound</code> or <code>outbound</code>).
  /// <note>
  /// Lightsail currently supports only <code>inbound</code> access direction.
  /// </note>
  final AccessDirection? accessDirection;

  /// The location from which access is allowed. For example, <code>Anywhere
  /// (0.0.0.0/0)</code>, or <code>Custom</code> if a specific IP address or range
  /// of IP addresses is allowed.
  final String? accessFrom;

  /// The type of access (<code>Public</code> or <code>Private</code>).
  final PortAccessType? accessType;

  /// An alias that defines access for a preconfigured range of IP addresses.
  ///
  /// The only alias currently supported is <code>lightsail-connect</code>, which
  /// allows IP addresses of the browser-based RDP/SSH client in the Lightsail
  /// console to connect to your instance.
  final List<String>? cidrListAliases;

  /// The IPv4 address, or range of IPv4 addresses (in CIDR notation) that are
  /// allowed to connect to an instance through the ports, and the protocol.
  /// <note>
  /// The <code>ipv6Cidrs</code> parameter lists the IPv6 addresses that are
  /// allowed to connect to an instance.
  /// </note>
  /// For more information about CIDR block notation, see <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation">Classless
  /// Inter-Domain Routing</a> on <i>Wikipedia</i>.
  final List<String>? cidrs;

  /// The common name of the port information.
  final String? commonName;

  /// The first port in a range of open ports on an instance.
  ///
  /// Allowed ports:
  ///
  /// <ul>
  /// <li>
  /// TCP and UDP - <code>0</code> to <code>65535</code>
  /// </li>
  /// <li>
  /// ICMP - The ICMP type for IPv4 addresses. For example, specify <code>8</code>
  /// as the <code>fromPort</code> (ICMP type), and <code>-1</code> as the
  /// <code>toPort</code> (ICMP code), to enable ICMP Ping. For more information,
  /// see <a
  /// href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control
  /// Messages</a> on <i>Wikipedia</i>.
  /// </li>
  /// <li>
  /// ICMPv6 - The ICMP type for IPv6 addresses. For example, specify
  /// <code>128</code> as the <code>fromPort</code> (ICMPv6 type), and
  /// <code>0</code> as <code>toPort</code> (ICMPv6 code). For more information,
  /// see <a
  /// href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol_for_IPv6">Internet
  /// Control Message Protocol for IPv6</a>.
  /// </li>
  /// </ul>
  final int? fromPort;

  /// The IPv6 address, or range of IPv6 addresses (in CIDR notation) that are
  /// allowed to connect to an instance through the ports, and the protocol. Only
  /// devices with an IPv6 address can connect to an instance through IPv6;
  /// otherwise, IPv4 should be used.
  /// <note>
  /// The <code>cidrs</code> parameter lists the IPv4 addresses that are allowed
  /// to connect to an instance.
  /// </note>
  /// For more information about CIDR block notation, see <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation">Classless
  /// Inter-Domain Routing</a> on <i>Wikipedia</i>.
  final List<String>? ipv6Cidrs;

  /// The IP protocol name.
  ///
  /// The name can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>tcp</code> - Transmission Control Protocol (TCP) provides reliable,
  /// ordered, and error-checked delivery of streamed data between applications
  /// running on hosts communicating by an IP network. If you have an application
  /// that doesn't require reliable data stream service, use UDP instead.
  /// </li>
  /// <li>
  /// <code>all</code> - All transport layer protocol types. For more general
  /// information, see <a
  /// href="https://en.wikipedia.org/wiki/Transport_layer">Transport layer</a> on
  /// <i>Wikipedia</i>.
  /// </li>
  /// <li>
  /// <code>udp</code> - With User Datagram Protocol (UDP), computer applications
  /// can send messages (or datagrams) to other hosts on an Internet Protocol (IP)
  /// network. Prior communications are not required to set up transmission
  /// channels or data paths. Applications that don't require reliable data stream
  /// service can use UDP, which provides a connectionless datagram service that
  /// emphasizes reduced latency over reliability. If you do require reliable data
  /// stream service, use TCP instead.
  /// </li>
  /// <li>
  /// <code>icmp</code> - Internet Control Message Protocol (ICMP) is used to send
  /// error messages and operational information indicating success or failure
  /// when communicating with an instance. For example, an error is indicated when
  /// an instance could not be reached. When you specify <code>icmp</code> as the
  /// <code>protocol</code>, you must specify the ICMP type using the
  /// <code>fromPort</code> parameter, and ICMP code using the <code>toPort</code>
  /// parameter.
  /// </li>
  /// <li>
  /// <code>icmp6</code> - Internet Control Message Protocol (ICMP) for IPv6. When
  /// you specify <code>icmp6</code> as the <code>protocol</code>, you must
  /// specify the ICMP type using the <code>fromPort</code> parameter, and ICMP
  /// code using the <code>toPort</code> parameter.
  /// </li>
  /// </ul>
  final NetworkProtocol? protocol;

  /// The last port in a range of open ports on an instance.
  ///
  /// Allowed ports:
  ///
  /// <ul>
  /// <li>
  /// TCP and UDP - <code>0</code> to <code>65535</code>
  /// </li>
  /// <li>
  /// ICMP - The ICMP code for IPv4 addresses. For example, specify <code>8</code>
  /// as the <code>fromPort</code> (ICMP type), and <code>-1</code> as the
  /// <code>toPort</code> (ICMP code), to enable ICMP Ping. For more information,
  /// see <a
  /// href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control
  /// Messages</a> on <i>Wikipedia</i>.
  /// </li>
  /// <li>
  /// ICMPv6 - The ICMP code for IPv6 addresses. For example, specify
  /// <code>128</code> as the <code>fromPort</code> (ICMPv6 type), and
  /// <code>0</code> as <code>toPort</code> (ICMPv6 code). For more information,
  /// see <a
  /// href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol_for_IPv6">Internet
  /// Control Message Protocol for IPv6</a>.
  /// </li>
  /// </ul>
  final int? toPort;

  InstancePortInfo({
    this.accessDirection,
    this.accessFrom,
    this.accessType,
    this.cidrListAliases,
    this.cidrs,
    this.commonName,
    this.fromPort,
    this.ipv6Cidrs,
    this.protocol,
    this.toPort,
  });

  factory InstancePortInfo.fromJson(Map<String, dynamic> json) {
    return InstancePortInfo(
      accessDirection:
          (json['accessDirection'] as String?)?.toAccessDirection(),
      accessFrom: json['accessFrom'] as String?,
      accessType: (json['accessType'] as String?)?.toPortAccessType(),
      cidrListAliases: (json['cidrListAliases'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      cidrs: (json['cidrs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      commonName: json['commonName'] as String?,
      fromPort: json['fromPort'] as int?,
      ipv6Cidrs: (json['ipv6Cidrs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      protocol: (json['protocol'] as String?)?.toNetworkProtocol(),
      toPort: json['toPort'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessDirection = this.accessDirection;
    final accessFrom = this.accessFrom;
    final accessType = this.accessType;
    final cidrListAliases = this.cidrListAliases;
    final cidrs = this.cidrs;
    final commonName = this.commonName;
    final fromPort = this.fromPort;
    final ipv6Cidrs = this.ipv6Cidrs;
    final protocol = this.protocol;
    final toPort = this.toPort;
    return {
      if (accessDirection != null) 'accessDirection': accessDirection.toValue(),
      if (accessFrom != null) 'accessFrom': accessFrom,
      if (accessType != null) 'accessType': accessType.toValue(),
      if (cidrListAliases != null) 'cidrListAliases': cidrListAliases,
      if (cidrs != null) 'cidrs': cidrs,
      if (commonName != null) 'commonName': commonName,
      if (fromPort != null) 'fromPort': fromPort,
      if (ipv6Cidrs != null) 'ipv6Cidrs': ipv6Cidrs,
      if (protocol != null) 'protocol': protocol.toValue(),
      if (toPort != null) 'toPort': toPort,
    };
  }
}

/// Describes open ports on an instance, the IP addresses allowed to connect to
/// the instance through the ports, and the protocol.
class InstancePortState {
  /// An alias that defines access for a preconfigured range of IP addresses.
  ///
  /// The only alias currently supported is <code>lightsail-connect</code>, which
  /// allows IP addresses of the browser-based RDP/SSH client in the Lightsail
  /// console to connect to your instance.
  final List<String>? cidrListAliases;

  /// The IPv4 address, or range of IPv4 addresses (in CIDR notation) that are
  /// allowed to connect to an instance through the ports, and the protocol.
  /// <note>
  /// The <code>ipv6Cidrs</code> parameter lists the IPv6 addresses that are
  /// allowed to connect to an instance.
  /// </note>
  /// For more information about CIDR block notation, see <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation">Classless
  /// Inter-Domain Routing</a> on <i>Wikipedia</i>.
  final List<String>? cidrs;

  /// The first port in a range of open ports on an instance.
  ///
  /// Allowed ports:
  ///
  /// <ul>
  /// <li>
  /// TCP and UDP - <code>0</code> to <code>65535</code>
  /// </li>
  /// <li>
  /// ICMP - The ICMP type for IPv4 addresses. For example, specify <code>8</code>
  /// as the <code>fromPort</code> (ICMP type), and <code>-1</code> as the
  /// <code>toPort</code> (ICMP code), to enable ICMP Ping. For more information,
  /// see <a
  /// href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control
  /// Messages</a> on <i>Wikipedia</i>.
  /// </li>
  /// <li>
  /// ICMPv6 - The ICMP type for IPv6 addresses. For example, specify
  /// <code>128</code> as the <code>fromPort</code> (ICMPv6 type), and
  /// <code>0</code> as <code>toPort</code> (ICMPv6 code). For more information,
  /// see <a
  /// href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol_for_IPv6">Internet
  /// Control Message Protocol for IPv6</a>.
  /// </li>
  /// </ul>
  final int? fromPort;

  /// The IPv6 address, or range of IPv6 addresses (in CIDR notation) that are
  /// allowed to connect to an instance through the ports, and the protocol. Only
  /// devices with an IPv6 address can connect to an instance through IPv6;
  /// otherwise, IPv4 should be used.
  /// <note>
  /// The <code>cidrs</code> parameter lists the IPv4 addresses that are allowed
  /// to connect to an instance.
  /// </note>
  /// For more information about CIDR block notation, see <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation">Classless
  /// Inter-Domain Routing</a> on <i>Wikipedia</i>.
  final List<String>? ipv6Cidrs;

  /// The IP protocol name.
  ///
  /// The name can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>tcp</code> - Transmission Control Protocol (TCP) provides reliable,
  /// ordered, and error-checked delivery of streamed data between applications
  /// running on hosts communicating by an IP network. If you have an application
  /// that doesn't require reliable data stream service, use UDP instead.
  /// </li>
  /// <li>
  /// <code>all</code> - All transport layer protocol types. For more general
  /// information, see <a
  /// href="https://en.wikipedia.org/wiki/Transport_layer">Transport layer</a> on
  /// <i>Wikipedia</i>.
  /// </li>
  /// <li>
  /// <code>udp</code> - With User Datagram Protocol (UDP), computer applications
  /// can send messages (or datagrams) to other hosts on an Internet Protocol (IP)
  /// network. Prior communications are not required to set up transmission
  /// channels or data paths. Applications that don't require reliable data stream
  /// service can use UDP, which provides a connectionless datagram service that
  /// emphasizes reduced latency over reliability. If you do require reliable data
  /// stream service, use TCP instead.
  /// </li>
  /// <li>
  /// <code>icmp</code> - Internet Control Message Protocol (ICMP) is used to send
  /// error messages and operational information indicating success or failure
  /// when communicating with an instance. For example, an error is indicated when
  /// an instance could not be reached. When you specify <code>icmp</code> as the
  /// <code>protocol</code>, you must specify the ICMP type using the
  /// <code>fromPort</code> parameter, and ICMP code using the <code>toPort</code>
  /// parameter.
  /// </li>
  /// <li>
  /// <code>icmp6</code> - Internet Control Message Protocol (ICMP) for IPv6. When
  /// you specify <code>icmp6</code> as the <code>protocol</code>, you must
  /// specify the ICMP type using the <code>fromPort</code> parameter, and ICMP
  /// code using the <code>toPort</code> parameter.
  /// </li>
  /// </ul>
  final NetworkProtocol? protocol;

  /// Specifies whether the instance port is <code>open</code> or
  /// <code>closed</code>.
  /// <note>
  /// The port state for Lightsail instances is always <code>open</code>.
  /// </note>
  final PortState? state;

  /// The last port in a range of open ports on an instance.
  ///
  /// Allowed ports:
  ///
  /// <ul>
  /// <li>
  /// TCP and UDP - <code>0</code> to <code>65535</code>
  /// </li>
  /// <li>
  /// ICMP - The ICMP code for IPv4 addresses. For example, specify <code>8</code>
  /// as the <code>fromPort</code> (ICMP type), and <code>-1</code> as the
  /// <code>toPort</code> (ICMP code), to enable ICMP Ping. For more information,
  /// see <a
  /// href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control
  /// Messages</a> on <i>Wikipedia</i>.
  /// </li>
  /// <li>
  /// ICMPv6 - The ICMP code for IPv6 addresses. For example, specify
  /// <code>128</code> as the <code>fromPort</code> (ICMPv6 type), and
  /// <code>0</code> as <code>toPort</code> (ICMPv6 code). For more information,
  /// see <a
  /// href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol_for_IPv6">Internet
  /// Control Message Protocol for IPv6</a>.
  /// </li>
  /// </ul>
  final int? toPort;

  InstancePortState({
    this.cidrListAliases,
    this.cidrs,
    this.fromPort,
    this.ipv6Cidrs,
    this.protocol,
    this.state,
    this.toPort,
  });

  factory InstancePortState.fromJson(Map<String, dynamic> json) {
    return InstancePortState(
      cidrListAliases: (json['cidrListAliases'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      cidrs: (json['cidrs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      fromPort: json['fromPort'] as int?,
      ipv6Cidrs: (json['ipv6Cidrs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      protocol: (json['protocol'] as String?)?.toNetworkProtocol(),
      state: (json['state'] as String?)?.toPortState(),
      toPort: json['toPort'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final cidrListAliases = this.cidrListAliases;
    final cidrs = this.cidrs;
    final fromPort = this.fromPort;
    final ipv6Cidrs = this.ipv6Cidrs;
    final protocol = this.protocol;
    final state = this.state;
    final toPort = this.toPort;
    return {
      if (cidrListAliases != null) 'cidrListAliases': cidrListAliases,
      if (cidrs != null) 'cidrs': cidrs,
      if (fromPort != null) 'fromPort': fromPort,
      if (ipv6Cidrs != null) 'ipv6Cidrs': ipv6Cidrs,
      if (protocol != null) 'protocol': protocol.toValue(),
      if (state != null) 'state': state.toValue(),
      if (toPort != null) 'toPort': toPort,
    };
  }
}

/// Describes an instance snapshot.
class InstanceSnapshot {
  /// The Amazon Resource Name (ARN) of the snapshot
  /// (<code>arn:aws:lightsail:us-east-2:123456789101:InstanceSnapshot/d23b5706-3322-4d83-81e5-12345EXAMPLE</code>).
  final String? arn;

  /// The timestamp when the snapshot was created (<code>1479907467.024</code>).
  final DateTime? createdAt;

  /// An array of disk objects containing information about all block storage
  /// disks.
  final List<Disk>? fromAttachedDisks;

  /// The blueprint ID from which you created the snapshot
  /// (<code>amazon_linux_2023</code>). A blueprint is a virtual private server
  /// (or <i>instance</i>) image used to create instances quickly.
  final String? fromBlueprintId;

  /// The bundle ID from which you created the snapshot (<code>micro_x_x</code>).
  final String? fromBundleId;

  /// The Amazon Resource Name (ARN) of the instance from which the snapshot was
  /// created
  /// (<code>arn:aws:lightsail:us-east-2:123456789101:Instance/64b8404c-ccb1-430b-8daf-12345EXAMPLE</code>).
  final String? fromInstanceArn;

  /// The instance from which the snapshot was created.
  final String? fromInstanceName;

  /// A Boolean value indicating whether the snapshot was created from an
  /// automatic snapshot.
  final bool? isFromAutoSnapshot;

  /// The region name and Availability Zone where you created the snapshot.
  final ResourceLocation? location;

  /// The name of the snapshot.
  final String? name;

  /// The progress of the snapshot.
  /// <note>
  /// This is populated only for disk snapshots, and is <code>null</code> for
  /// instance snapshots.
  /// </note>
  final String? progress;

  /// The type of resource (usually <code>InstanceSnapshot</code>).
  final ResourceType? resourceType;

  /// The size in GB of the SSD.
  final int? sizeInGb;

  /// The state the snapshot is in.
  final InstanceSnapshotState? state;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more easily.
  final String? supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags">Amazon
  /// Lightsail Developer Guide</a>.
  final List<Tag>? tags;

  InstanceSnapshot({
    this.arn,
    this.createdAt,
    this.fromAttachedDisks,
    this.fromBlueprintId,
    this.fromBundleId,
    this.fromInstanceArn,
    this.fromInstanceName,
    this.isFromAutoSnapshot,
    this.location,
    this.name,
    this.progress,
    this.resourceType,
    this.sizeInGb,
    this.state,
    this.supportCode,
    this.tags,
  });

  factory InstanceSnapshot.fromJson(Map<String, dynamic> json) {
    return InstanceSnapshot(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      fromAttachedDisks: (json['fromAttachedDisks'] as List?)
          ?.whereNotNull()
          .map((e) => Disk.fromJson(e as Map<String, dynamic>))
          .toList(),
      fromBlueprintId: json['fromBlueprintId'] as String?,
      fromBundleId: json['fromBundleId'] as String?,
      fromInstanceArn: json['fromInstanceArn'] as String?,
      fromInstanceName: json['fromInstanceName'] as String?,
      isFromAutoSnapshot: json['isFromAutoSnapshot'] as bool?,
      location: json['location'] != null
          ? ResourceLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      progress: json['progress'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      sizeInGb: json['sizeInGb'] as int?,
      state: (json['state'] as String?)?.toInstanceSnapshotState(),
      supportCode: json['supportCode'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final fromAttachedDisks = this.fromAttachedDisks;
    final fromBlueprintId = this.fromBlueprintId;
    final fromBundleId = this.fromBundleId;
    final fromInstanceArn = this.fromInstanceArn;
    final fromInstanceName = this.fromInstanceName;
    final isFromAutoSnapshot = this.isFromAutoSnapshot;
    final location = this.location;
    final name = this.name;
    final progress = this.progress;
    final resourceType = this.resourceType;
    final sizeInGb = this.sizeInGb;
    final state = this.state;
    final supportCode = this.supportCode;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (fromAttachedDisks != null) 'fromAttachedDisks': fromAttachedDisks,
      if (fromBlueprintId != null) 'fromBlueprintId': fromBlueprintId,
      if (fromBundleId != null) 'fromBundleId': fromBundleId,
      if (fromInstanceArn != null) 'fromInstanceArn': fromInstanceArn,
      if (fromInstanceName != null) 'fromInstanceName': fromInstanceName,
      if (isFromAutoSnapshot != null) 'isFromAutoSnapshot': isFromAutoSnapshot,
      if (location != null) 'location': location,
      if (name != null) 'name': name,
      if (progress != null) 'progress': progress,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (sizeInGb != null) 'sizeInGb': sizeInGb,
      if (state != null) 'state': state.toValue(),
      if (supportCode != null) 'supportCode': supportCode,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Describes an instance snapshot.
class InstanceSnapshotInfo {
  /// The blueprint ID from which the source instance
  /// (<code>amazon_linux_2023</code>).
  final String? fromBlueprintId;

  /// The bundle ID from which the source instance was created
  /// (<code>micro_x_x</code>).
  final String? fromBundleId;

  /// A list of objects describing the disks that were attached to the source
  /// instance.
  final List<DiskInfo>? fromDiskInfo;

  InstanceSnapshotInfo({
    this.fromBlueprintId,
    this.fromBundleId,
    this.fromDiskInfo,
  });

  factory InstanceSnapshotInfo.fromJson(Map<String, dynamic> json) {
    return InstanceSnapshotInfo(
      fromBlueprintId: json['fromBlueprintId'] as String?,
      fromBundleId: json['fromBundleId'] as String?,
      fromDiskInfo: (json['fromDiskInfo'] as List?)
          ?.whereNotNull()
          .map((e) => DiskInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fromBlueprintId = this.fromBlueprintId;
    final fromBundleId = this.fromBundleId;
    final fromDiskInfo = this.fromDiskInfo;
    return {
      if (fromBlueprintId != null) 'fromBlueprintId': fromBlueprintId,
      if (fromBundleId != null) 'fromBundleId': fromBundleId,
      if (fromDiskInfo != null) 'fromDiskInfo': fromDiskInfo,
    };
  }
}

enum InstanceSnapshotState {
  pending,
  error,
  available,
}

extension InstanceSnapshotStateValueExtension on InstanceSnapshotState {
  String toValue() {
    switch (this) {
      case InstanceSnapshotState.pending:
        return 'pending';
      case InstanceSnapshotState.error:
        return 'error';
      case InstanceSnapshotState.available:
        return 'available';
    }
  }
}

extension InstanceSnapshotStateFromString on String {
  InstanceSnapshotState toInstanceSnapshotState() {
    switch (this) {
      case 'pending':
        return InstanceSnapshotState.pending;
      case 'error':
        return InstanceSnapshotState.error;
      case 'available':
        return InstanceSnapshotState.available;
    }
    throw Exception('$this is not known in enum InstanceSnapshotState');
  }
}

/// Describes the virtual private server (or <i>instance</i>) status.
class InstanceState {
  /// The status code for the instance.
  final int? code;

  /// The state of the instance (<code>running</code> or <code>pending</code>).
  final String? name;

  InstanceState({
    this.code,
    this.name,
  });

  factory InstanceState.fromJson(Map<String, dynamic> json) {
    return InstanceState(
      code: json['code'] as int?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final name = this.name;
    return {
      if (code != null) 'code': code,
      if (name != null) 'name': name,
    };
  }
}

enum IpAddressType {
  dualstack,
  ipv4,
  ipv6,
}

extension IpAddressTypeValueExtension on IpAddressType {
  String toValue() {
    switch (this) {
      case IpAddressType.dualstack:
        return 'dualstack';
      case IpAddressType.ipv4:
        return 'ipv4';
      case IpAddressType.ipv6:
        return 'ipv6';
    }
  }
}

extension IpAddressTypeFromString on String {
  IpAddressType toIpAddressType() {
    switch (this) {
      case 'dualstack':
        return IpAddressType.dualstack;
      case 'ipv4':
        return IpAddressType.ipv4;
      case 'ipv6':
        return IpAddressType.ipv6;
    }
    throw Exception('$this is not known in enum IpAddressType');
  }
}

class IsVpcPeeredResult {
  /// Returns <code>true</code> if the Lightsail VPC is peered; otherwise,
  /// <code>false</code>.
  final bool? isPeered;

  IsVpcPeeredResult({
    this.isPeered,
  });

  factory IsVpcPeeredResult.fromJson(Map<String, dynamic> json) {
    return IsVpcPeeredResult(
      isPeered: json['isPeered'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final isPeered = this.isPeered;
    return {
      if (isPeered != null) 'isPeered': isPeered,
    };
  }
}

/// Describes an SSH key pair.
class KeyPair {
  /// The Amazon Resource Name (ARN) of the key pair
  /// (<code>arn:aws:lightsail:us-east-2:123456789101:KeyPair/05859e3d-331d-48ba-9034-12345EXAMPLE</code>).
  final String? arn;

  /// The timestamp when the key pair was created (<code>1479816991.349</code>).
  final DateTime? createdAt;

  /// The RSA fingerprint of the key pair.
  final String? fingerprint;

  /// The region name and Availability Zone where the key pair was created.
  final ResourceLocation? location;

  /// The friendly name of the SSH key pair.
  final String? name;

  /// The resource type (usually <code>KeyPair</code>).
  final ResourceType? resourceType;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more easily.
  final String? supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags">Amazon
  /// Lightsail Developer Guide</a>.
  final List<Tag>? tags;

  KeyPair({
    this.arn,
    this.createdAt,
    this.fingerprint,
    this.location,
    this.name,
    this.resourceType,
    this.supportCode,
    this.tags,
  });

  factory KeyPair.fromJson(Map<String, dynamic> json) {
    return KeyPair(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      fingerprint: json['fingerprint'] as String?,
      location: json['location'] != null
          ? ResourceLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      supportCode: json['supportCode'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final fingerprint = this.fingerprint;
    final location = this.location;
    final name = this.name;
    final resourceType = this.resourceType;
    final supportCode = this.supportCode;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (fingerprint != null) 'fingerprint': fingerprint,
      if (location != null) 'location': location,
      if (name != null) 'name': name,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (supportCode != null) 'supportCode': supportCode,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Describes an Amazon Lightsail content delivery network (CDN) distribution.
class LightsailDistribution {
  /// Indicates whether the bundle that is currently applied to your distribution,
  /// specified using the <code>distributionName</code> parameter, can be changed
  /// to another bundle.
  ///
  /// Use the <code>UpdateDistributionBundle</code> action to change your
  /// distribution's bundle.
  final bool? ableToUpdateBundle;

  /// The alternate domain names of the distribution.
  final List<String>? alternativeDomainNames;

  /// The Amazon Resource Name (ARN) of the distribution.
  final String? arn;

  /// The ID of the bundle currently applied to the distribution.
  final String? bundleId;

  /// An object that describes the cache behavior settings of the distribution.
  final CacheSettings? cacheBehaviorSettings;

  /// An array of objects that describe the per-path cache behavior of the
  /// distribution.
  final List<CacheBehaviorPerPath>? cacheBehaviors;

  /// The name of the SSL/TLS certificate attached to the distribution, if any.
  final String? certificateName;

  /// The timestamp when the distribution was created.
  final DateTime? createdAt;

  /// An object that describes the default cache behavior of the distribution.
  final CacheBehavior? defaultCacheBehavior;

  /// The domain name of the distribution.
  final String? domainName;

  /// The IP address type of the distribution.
  ///
  /// The possible values are <code>ipv4</code> for IPv4 only, and
  /// <code>dualstack</code> for IPv4 and IPv6.
  final IpAddressType? ipAddressType;

  /// Indicates whether the distribution is enabled.
  final bool? isEnabled;

  /// An object that describes the location of the distribution, such as the
  /// Amazon Web Services Region and Availability Zone.
  /// <note>
  /// Lightsail distributions are global resources that can reference an origin in
  /// any Amazon Web Services Region, and distribute its content globally.
  /// However, all distributions are located in the <code>us-east-1</code> Region.
  /// </note>
  final ResourceLocation? location;

  /// The name of the distribution.
  final String? name;

  /// An object that describes the origin resource of the distribution, such as a
  /// Lightsail instance, bucket, or load balancer.
  ///
  /// The distribution pulls, caches, and serves content from the origin.
  final Origin? origin;

  /// The public DNS of the origin.
  final String? originPublicDNS;

  /// The Lightsail resource type (<code>Distribution</code>).
  final ResourceType? resourceType;

  /// The status of the distribution.
  final String? status;

  /// The support code. Include this code in your email to support when you have
  /// questions about your Lightsail distribution. This code enables our support
  /// team to look up your Lightsail information more easily.
  final String? supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags">Amazon
  /// Lightsail Developer Guide</a>.
  final List<Tag>? tags;

  /// The minimum TLS protocol version that the distribution can use to
  /// communicate with viewers.
  final String? viewerMinimumTlsProtocolVersion;

  LightsailDistribution({
    this.ableToUpdateBundle,
    this.alternativeDomainNames,
    this.arn,
    this.bundleId,
    this.cacheBehaviorSettings,
    this.cacheBehaviors,
    this.certificateName,
    this.createdAt,
    this.defaultCacheBehavior,
    this.domainName,
    this.ipAddressType,
    this.isEnabled,
    this.location,
    this.name,
    this.origin,
    this.originPublicDNS,
    this.resourceType,
    this.status,
    this.supportCode,
    this.tags,
    this.viewerMinimumTlsProtocolVersion,
  });

  factory LightsailDistribution.fromJson(Map<String, dynamic> json) {
    return LightsailDistribution(
      ableToUpdateBundle: json['ableToUpdateBundle'] as bool?,
      alternativeDomainNames: (json['alternativeDomainNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      arn: json['arn'] as String?,
      bundleId: json['bundleId'] as String?,
      cacheBehaviorSettings: json['cacheBehaviorSettings'] != null
          ? CacheSettings.fromJson(
              json['cacheBehaviorSettings'] as Map<String, dynamic>)
          : null,
      cacheBehaviors: (json['cacheBehaviors'] as List?)
          ?.whereNotNull()
          .map((e) => CacheBehaviorPerPath.fromJson(e as Map<String, dynamic>))
          .toList(),
      certificateName: json['certificateName'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      defaultCacheBehavior: json['defaultCacheBehavior'] != null
          ? CacheBehavior.fromJson(
              json['defaultCacheBehavior'] as Map<String, dynamic>)
          : null,
      domainName: json['domainName'] as String?,
      ipAddressType: (json['ipAddressType'] as String?)?.toIpAddressType(),
      isEnabled: json['isEnabled'] as bool?,
      location: json['location'] != null
          ? ResourceLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      origin: json['origin'] != null
          ? Origin.fromJson(json['origin'] as Map<String, dynamic>)
          : null,
      originPublicDNS: json['originPublicDNS'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      status: json['status'] as String?,
      supportCode: json['supportCode'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      viewerMinimumTlsProtocolVersion:
          json['viewerMinimumTlsProtocolVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ableToUpdateBundle = this.ableToUpdateBundle;
    final alternativeDomainNames = this.alternativeDomainNames;
    final arn = this.arn;
    final bundleId = this.bundleId;
    final cacheBehaviorSettings = this.cacheBehaviorSettings;
    final cacheBehaviors = this.cacheBehaviors;
    final certificateName = this.certificateName;
    final createdAt = this.createdAt;
    final defaultCacheBehavior = this.defaultCacheBehavior;
    final domainName = this.domainName;
    final ipAddressType = this.ipAddressType;
    final isEnabled = this.isEnabled;
    final location = this.location;
    final name = this.name;
    final origin = this.origin;
    final originPublicDNS = this.originPublicDNS;
    final resourceType = this.resourceType;
    final status = this.status;
    final supportCode = this.supportCode;
    final tags = this.tags;
    final viewerMinimumTlsProtocolVersion =
        this.viewerMinimumTlsProtocolVersion;
    return {
      if (ableToUpdateBundle != null) 'ableToUpdateBundle': ableToUpdateBundle,
      if (alternativeDomainNames != null)
        'alternativeDomainNames': alternativeDomainNames,
      if (arn != null) 'arn': arn,
      if (bundleId != null) 'bundleId': bundleId,
      if (cacheBehaviorSettings != null)
        'cacheBehaviorSettings': cacheBehaviorSettings,
      if (cacheBehaviors != null) 'cacheBehaviors': cacheBehaviors,
      if (certificateName != null) 'certificateName': certificateName,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (defaultCacheBehavior != null)
        'defaultCacheBehavior': defaultCacheBehavior,
      if (domainName != null) 'domainName': domainName,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.toValue(),
      if (isEnabled != null) 'isEnabled': isEnabled,
      if (location != null) 'location': location,
      if (name != null) 'name': name,
      if (origin != null) 'origin': origin,
      if (originPublicDNS != null) 'originPublicDNS': originPublicDNS,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (status != null) 'status': status,
      if (supportCode != null) 'supportCode': supportCode,
      if (tags != null) 'tags': tags,
      if (viewerMinimumTlsProtocolVersion != null)
        'viewerMinimumTlsProtocolVersion': viewerMinimumTlsProtocolVersion,
    };
  }
}

/// Describes a load balancer.
class LoadBalancer {
  /// The Amazon Resource Name (ARN) of the load balancer.
  final String? arn;

  /// A string to string map of the configuration options for your load balancer.
  /// Valid values are listed below.
  final Map<LoadBalancerAttributeName, String>? configurationOptions;

  /// The date when your load balancer was created.
  final DateTime? createdAt;

  /// The DNS name of your Lightsail load balancer.
  final String? dnsName;

  /// The path you specified to perform your health checks. If no path is
  /// specified, the load balancer tries to make a request to the default (root)
  /// page.
  final String? healthCheckPath;

  /// A Boolean value that indicates whether HTTPS redirection is enabled for the
  /// load balancer.
  final bool? httpsRedirectionEnabled;

  /// An array of InstanceHealthSummary objects describing the health of the load
  /// balancer.
  final List<InstanceHealthSummary>? instanceHealthSummary;

  /// The port where the load balancer will direct traffic to your Lightsail
  /// instances. For HTTP traffic, it's port 80. For HTTPS traffic, it's port 443.
  final int? instancePort;

  /// The IP address type of the load balancer.
  ///
  /// The possible values are <code>ipv4</code> for IPv4 only, <code>ipv6</code>
  /// for IPv6 only, and <code>dualstack</code> for IPv4 and IPv6.
  final IpAddressType? ipAddressType;

  /// The AWS Region where your load balancer was created
  /// (<code>us-east-2a</code>). Lightsail automatically creates your load
  /// balancer across Availability Zones.
  final ResourceLocation? location;

  /// The name of the load balancer (<code>my-load-balancer</code>).
  final String? name;

  /// The protocol you have enabled for your load balancer. Valid values are
  /// below.
  ///
  /// You can't just have <code>HTTP_HTTPS</code>, but you can have just
  /// <code>HTTP</code>.
  final LoadBalancerProtocol? protocol;

  /// An array of public port settings for your load balancer. For HTTP, use port
  /// 80. For HTTPS, use port 443.
  final List<int>? publicPorts;

  /// The resource type (<code>LoadBalancer</code>.
  final ResourceType? resourceType;

  /// The status of your load balancer. Valid values are below.
  final LoadBalancerState? state;

  /// The support code. Include this code in your email to support when you have
  /// questions about your Lightsail load balancer. This code enables our support
  /// team to look up your Lightsail information more easily.
  final String? supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags">Amazon
  /// Lightsail Developer Guide</a>.
  final List<Tag>? tags;

  /// An array of LoadBalancerTlsCertificateSummary objects that provide
  /// additional information about the SSL/TLS certificates. For example, if
  /// <code>true</code>, the certificate is attached to the load balancer.
  final List<LoadBalancerTlsCertificateSummary>? tlsCertificateSummaries;

  /// The name of the TLS security policy for the load balancer.
  final String? tlsPolicyName;

  LoadBalancer({
    this.arn,
    this.configurationOptions,
    this.createdAt,
    this.dnsName,
    this.healthCheckPath,
    this.httpsRedirectionEnabled,
    this.instanceHealthSummary,
    this.instancePort,
    this.ipAddressType,
    this.location,
    this.name,
    this.protocol,
    this.publicPorts,
    this.resourceType,
    this.state,
    this.supportCode,
    this.tags,
    this.tlsCertificateSummaries,
    this.tlsPolicyName,
  });

  factory LoadBalancer.fromJson(Map<String, dynamic> json) {
    return LoadBalancer(
      arn: json['arn'] as String?,
      configurationOptions:
          (json['configurationOptions'] as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(k.toLoadBalancerAttributeName(), e as String)),
      createdAt: timeStampFromJson(json['createdAt']),
      dnsName: json['dnsName'] as String?,
      healthCheckPath: json['healthCheckPath'] as String?,
      httpsRedirectionEnabled: json['httpsRedirectionEnabled'] as bool?,
      instanceHealthSummary: (json['instanceHealthSummary'] as List?)
          ?.whereNotNull()
          .map((e) => InstanceHealthSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      instancePort: json['instancePort'] as int?,
      ipAddressType: (json['ipAddressType'] as String?)?.toIpAddressType(),
      location: json['location'] != null
          ? ResourceLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      protocol: (json['protocol'] as String?)?.toLoadBalancerProtocol(),
      publicPorts: (json['publicPorts'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      state: (json['state'] as String?)?.toLoadBalancerState(),
      supportCode: json['supportCode'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      tlsCertificateSummaries: (json['tlsCertificateSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => LoadBalancerTlsCertificateSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      tlsPolicyName: json['tlsPolicyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final configurationOptions = this.configurationOptions;
    final createdAt = this.createdAt;
    final dnsName = this.dnsName;
    final healthCheckPath = this.healthCheckPath;
    final httpsRedirectionEnabled = this.httpsRedirectionEnabled;
    final instanceHealthSummary = this.instanceHealthSummary;
    final instancePort = this.instancePort;
    final ipAddressType = this.ipAddressType;
    final location = this.location;
    final name = this.name;
    final protocol = this.protocol;
    final publicPorts = this.publicPorts;
    final resourceType = this.resourceType;
    final state = this.state;
    final supportCode = this.supportCode;
    final tags = this.tags;
    final tlsCertificateSummaries = this.tlsCertificateSummaries;
    final tlsPolicyName = this.tlsPolicyName;
    return {
      if (arn != null) 'arn': arn,
      if (configurationOptions != null)
        'configurationOptions':
            configurationOptions.map((k, e) => MapEntry(k.toValue(), e)),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (dnsName != null) 'dnsName': dnsName,
      if (healthCheckPath != null) 'healthCheckPath': healthCheckPath,
      if (httpsRedirectionEnabled != null)
        'httpsRedirectionEnabled': httpsRedirectionEnabled,
      if (instanceHealthSummary != null)
        'instanceHealthSummary': instanceHealthSummary,
      if (instancePort != null) 'instancePort': instancePort,
      if (ipAddressType != null) 'ipAddressType': ipAddressType.toValue(),
      if (location != null) 'location': location,
      if (name != null) 'name': name,
      if (protocol != null) 'protocol': protocol.toValue(),
      if (publicPorts != null) 'publicPorts': publicPorts,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (state != null) 'state': state.toValue(),
      if (supportCode != null) 'supportCode': supportCode,
      if (tags != null) 'tags': tags,
      if (tlsCertificateSummaries != null)
        'tlsCertificateSummaries': tlsCertificateSummaries,
      if (tlsPolicyName != null) 'tlsPolicyName': tlsPolicyName,
    };
  }
}

enum LoadBalancerAttributeName {
  healthCheckPath,
  sessionStickinessEnabled,
  sessionStickinessLbCookieDurationSeconds,
  httpsRedirectionEnabled,
  tlsPolicyName,
}

extension LoadBalancerAttributeNameValueExtension on LoadBalancerAttributeName {
  String toValue() {
    switch (this) {
      case LoadBalancerAttributeName.healthCheckPath:
        return 'HealthCheckPath';
      case LoadBalancerAttributeName.sessionStickinessEnabled:
        return 'SessionStickinessEnabled';
      case LoadBalancerAttributeName.sessionStickinessLbCookieDurationSeconds:
        return 'SessionStickiness_LB_CookieDurationSeconds';
      case LoadBalancerAttributeName.httpsRedirectionEnabled:
        return 'HttpsRedirectionEnabled';
      case LoadBalancerAttributeName.tlsPolicyName:
        return 'TlsPolicyName';
    }
  }
}

extension LoadBalancerAttributeNameFromString on String {
  LoadBalancerAttributeName toLoadBalancerAttributeName() {
    switch (this) {
      case 'HealthCheckPath':
        return LoadBalancerAttributeName.healthCheckPath;
      case 'SessionStickinessEnabled':
        return LoadBalancerAttributeName.sessionStickinessEnabled;
      case 'SessionStickiness_LB_CookieDurationSeconds':
        return LoadBalancerAttributeName
            .sessionStickinessLbCookieDurationSeconds;
      case 'HttpsRedirectionEnabled':
        return LoadBalancerAttributeName.httpsRedirectionEnabled;
      case 'TlsPolicyName':
        return LoadBalancerAttributeName.tlsPolicyName;
    }
    throw Exception('$this is not known in enum LoadBalancerAttributeName');
  }
}

enum LoadBalancerMetricName {
  clientTLSNegotiationErrorCount,
  healthyHostCount,
  unhealthyHostCount,
  hTTPCodeLb_4xxCount,
  hTTPCodeLb_5xxCount,
  hTTPCodeInstance_2xxCount,
  hTTPCodeInstance_3xxCount,
  hTTPCodeInstance_4xxCount,
  hTTPCodeInstance_5xxCount,
  instanceResponseTime,
  rejectedConnectionCount,
  requestCount,
}

extension LoadBalancerMetricNameValueExtension on LoadBalancerMetricName {
  String toValue() {
    switch (this) {
      case LoadBalancerMetricName.clientTLSNegotiationErrorCount:
        return 'ClientTLSNegotiationErrorCount';
      case LoadBalancerMetricName.healthyHostCount:
        return 'HealthyHostCount';
      case LoadBalancerMetricName.unhealthyHostCount:
        return 'UnhealthyHostCount';
      case LoadBalancerMetricName.hTTPCodeLb_4xxCount:
        return 'HTTPCode_LB_4XX_Count';
      case LoadBalancerMetricName.hTTPCodeLb_5xxCount:
        return 'HTTPCode_LB_5XX_Count';
      case LoadBalancerMetricName.hTTPCodeInstance_2xxCount:
        return 'HTTPCode_Instance_2XX_Count';
      case LoadBalancerMetricName.hTTPCodeInstance_3xxCount:
        return 'HTTPCode_Instance_3XX_Count';
      case LoadBalancerMetricName.hTTPCodeInstance_4xxCount:
        return 'HTTPCode_Instance_4XX_Count';
      case LoadBalancerMetricName.hTTPCodeInstance_5xxCount:
        return 'HTTPCode_Instance_5XX_Count';
      case LoadBalancerMetricName.instanceResponseTime:
        return 'InstanceResponseTime';
      case LoadBalancerMetricName.rejectedConnectionCount:
        return 'RejectedConnectionCount';
      case LoadBalancerMetricName.requestCount:
        return 'RequestCount';
    }
  }
}

extension LoadBalancerMetricNameFromString on String {
  LoadBalancerMetricName toLoadBalancerMetricName() {
    switch (this) {
      case 'ClientTLSNegotiationErrorCount':
        return LoadBalancerMetricName.clientTLSNegotiationErrorCount;
      case 'HealthyHostCount':
        return LoadBalancerMetricName.healthyHostCount;
      case 'UnhealthyHostCount':
        return LoadBalancerMetricName.unhealthyHostCount;
      case 'HTTPCode_LB_4XX_Count':
        return LoadBalancerMetricName.hTTPCodeLb_4xxCount;
      case 'HTTPCode_LB_5XX_Count':
        return LoadBalancerMetricName.hTTPCodeLb_5xxCount;
      case 'HTTPCode_Instance_2XX_Count':
        return LoadBalancerMetricName.hTTPCodeInstance_2xxCount;
      case 'HTTPCode_Instance_3XX_Count':
        return LoadBalancerMetricName.hTTPCodeInstance_3xxCount;
      case 'HTTPCode_Instance_4XX_Count':
        return LoadBalancerMetricName.hTTPCodeInstance_4xxCount;
      case 'HTTPCode_Instance_5XX_Count':
        return LoadBalancerMetricName.hTTPCodeInstance_5xxCount;
      case 'InstanceResponseTime':
        return LoadBalancerMetricName.instanceResponseTime;
      case 'RejectedConnectionCount':
        return LoadBalancerMetricName.rejectedConnectionCount;
      case 'RequestCount':
        return LoadBalancerMetricName.requestCount;
    }
    throw Exception('$this is not known in enum LoadBalancerMetricName');
  }
}

enum LoadBalancerProtocol {
  httpHttps,
  http,
}

extension LoadBalancerProtocolValueExtension on LoadBalancerProtocol {
  String toValue() {
    switch (this) {
      case LoadBalancerProtocol.httpHttps:
        return 'HTTP_HTTPS';
      case LoadBalancerProtocol.http:
        return 'HTTP';
    }
  }
}

extension LoadBalancerProtocolFromString on String {
  LoadBalancerProtocol toLoadBalancerProtocol() {
    switch (this) {
      case 'HTTP_HTTPS':
        return LoadBalancerProtocol.httpHttps;
      case 'HTTP':
        return LoadBalancerProtocol.http;
    }
    throw Exception('$this is not known in enum LoadBalancerProtocol');
  }
}

enum LoadBalancerState {
  active,
  provisioning,
  activeImpaired,
  failed,
  unknown,
}

extension LoadBalancerStateValueExtension on LoadBalancerState {
  String toValue() {
    switch (this) {
      case LoadBalancerState.active:
        return 'active';
      case LoadBalancerState.provisioning:
        return 'provisioning';
      case LoadBalancerState.activeImpaired:
        return 'active_impaired';
      case LoadBalancerState.failed:
        return 'failed';
      case LoadBalancerState.unknown:
        return 'unknown';
    }
  }
}

extension LoadBalancerStateFromString on String {
  LoadBalancerState toLoadBalancerState() {
    switch (this) {
      case 'active':
        return LoadBalancerState.active;
      case 'provisioning':
        return LoadBalancerState.provisioning;
      case 'active_impaired':
        return LoadBalancerState.activeImpaired;
      case 'failed':
        return LoadBalancerState.failed;
      case 'unknown':
        return LoadBalancerState.unknown;
    }
    throw Exception('$this is not known in enum LoadBalancerState');
  }
}

/// Describes a load balancer SSL/TLS certificate.
///
/// TLS is just an updated, more secure version of Secure Socket Layer (SSL).
class LoadBalancerTlsCertificate {
  /// The Amazon Resource Name (ARN) of the SSL/TLS certificate.
  final String? arn;

  /// The time when you created your SSL/TLS certificate.
  final DateTime? createdAt;

  /// The domain name for your SSL/TLS certificate.
  final String? domainName;

  /// An array of LoadBalancerTlsCertificateDomainValidationRecord objects
  /// describing the records.
  final List<LoadBalancerTlsCertificateDomainValidationRecord>?
      domainValidationRecords;

  /// The validation failure reason, if any, of the certificate.
  ///
  /// The following failure reasons are possible:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>NO_AVAILABLE_CONTACTS</code> </b> - This failure applies to email
  /// validation, which is not available for Lightsail certificates.
  /// </li>
  /// <li>
  /// <b> <code>ADDITIONAL_VERIFICATION_REQUIRED</code> </b> - Lightsail requires
  /// additional information to process this certificate request. This can happen
  /// as a fraud-protection measure, such as when the domain ranks within the
  /// Alexa top 1000 websites. To provide the required information, use the <a
  /// href="https://console.aws.amazon.com/support/home">AWS Support Center</a> to
  /// contact AWS Support.
  /// <note>
  /// You cannot request a certificate for Amazon-owned domain names such as those
  /// ending in amazonaws.com, cloudfront.net, or elasticbeanstalk.com.
  /// </note> </li>
  /// <li>
  /// <b> <code>DOMAIN_NOT_ALLOWED</code> </b> - One or more of the domain names
  /// in the certificate request was reported as an unsafe domain by <a
  /// href="https://www.virustotal.com/gui/home/url">VirusTotal</a>. To correct
  /// the problem, search for your domain name on the <a
  /// href="https://www.virustotal.com/gui/home/url">VirusTotal</a> website. If
  /// your domain is reported as suspicious, see <a
  /// href="https://developers.google.com/web/fundamentals/security/hacked">Google
  /// Help for Hacked Websites</a> to learn what you can do.
  ///
  /// If you believe that the result is a false positive, notify the organization
  /// that is reporting the domain. VirusTotal is an aggregate of several
  /// antivirus and URL scanners and cannot remove your domain from a block list
  /// itself. After you correct the problem and the VirusTotal registry has been
  /// updated, request a new certificate.
  ///
  /// If you see this error and your domain is not included in the VirusTotal
  /// list, visit the <a href="https://console.aws.amazon.com/support/home">AWS
  /// Support Center</a> and create a case.
  /// </li>
  /// <li>
  /// <b> <code>INVALID_PUBLIC_DOMAIN</code> </b> - One or more of the domain
  /// names in the certificate request is not valid. Typically, this is because a
  /// domain name in the request is not a valid top-level domain. Try to request a
  /// certificate again, correcting any spelling errors or typos that were in the
  /// failed request, and ensure that all domain names in the request are for
  /// valid top-level domains. For example, you cannot request a certificate for
  /// <code>example.invalidpublicdomain</code> because
  /// <code>invalidpublicdomain</code> is not a valid top-level domain.
  /// </li>
  /// <li>
  /// <b> <code>OTHER</code> </b> - Typically, this failure occurs when there is a
  /// typographical error in one or more of the domain names in the certificate
  /// request. Try to request a certificate again, correcting any spelling errors
  /// or typos that were in the failed request.
  /// </li>
  /// </ul>
  final LoadBalancerTlsCertificateFailureReason? failureReason;

  /// When <code>true</code>, the SSL/TLS certificate is attached to the Lightsail
  /// load balancer.
  final bool? isAttached;

  /// The time when the SSL/TLS certificate was issued.
  final DateTime? issuedAt;

  /// The issuer of the certificate.
  final String? issuer;

  /// The algorithm used to generate the key pair (the public and private key).
  final String? keyAlgorithm;

  /// The load balancer name where your SSL/TLS certificate is attached.
  final String? loadBalancerName;

  /// The Amazon Web Services Region and Availability Zone where you created your
  /// certificate.
  final ResourceLocation? location;

  /// The name of the SSL/TLS certificate (<code>my-certificate</code>).
  final String? name;

  /// The timestamp when the SSL/TLS certificate expires.
  final DateTime? notAfter;

  /// The timestamp when the SSL/TLS certificate is first valid.
  final DateTime? notBefore;

  /// An object that describes the status of the certificate renewal managed by
  /// Lightsail.
  final LoadBalancerTlsCertificateRenewalSummary? renewalSummary;

  /// The resource type (<code>LoadBalancerTlsCertificate</code>).
  ///
  /// <ul>
  /// <li>
  /// <b> <code>Instance</code> </b> - A Lightsail instance (a virtual private
  /// server)
  /// </li>
  /// <li>
  /// <b> <code>StaticIp</code> </b> - A static IP address
  /// </li>
  /// <li>
  /// <b> <code>KeyPair</code> </b> - The key pair used to connect to a Lightsail
  /// instance
  /// </li>
  /// <li>
  /// <b> <code>InstanceSnapshot</code> </b> - A Lightsail instance snapshot
  /// </li>
  /// <li>
  /// <b> <code>Domain</code> </b> - A DNS zone
  /// </li>
  /// <li>
  /// <b> <code>PeeredVpc</code> </b> - A peered VPC
  /// </li>
  /// <li>
  /// <b> <code>LoadBalancer</code> </b> - A Lightsail load balancer
  /// </li>
  /// <li>
  /// <b> <code>LoadBalancerTlsCertificate</code> </b> - An SSL/TLS certificate
  /// associated with a Lightsail load balancer
  /// </li>
  /// <li>
  /// <b> <code>Disk</code> </b> - A Lightsail block storage disk
  /// </li>
  /// <li>
  /// <b> <code>DiskSnapshot</code> </b> - A block storage disk snapshot
  /// </li>
  /// </ul>
  final ResourceType? resourceType;

  /// The reason the certificate was revoked. This value is present only when the
  /// certificate status is <code>REVOKED</code>.
  final LoadBalancerTlsCertificateRevocationReason? revocationReason;

  /// The timestamp when the certificate was revoked. This value is present only
  /// when the certificate status is <code>REVOKED</code>.
  final DateTime? revokedAt;

  /// The serial number of the certificate.
  final String? serial;

  /// The algorithm that was used to sign the certificate.
  final String? signatureAlgorithm;

  /// The validation status of the SSL/TLS certificate. Valid values are below.
  final LoadBalancerTlsCertificateStatus? status;

  /// The name of the entity that is associated with the public key contained in
  /// the certificate.
  final String? subject;

  /// An array of strings that specify the alternate domains
  /// (<code>example2.com</code>) and subdomains (<code>blog.example.com</code>)
  /// for the certificate.
  final List<String>? subjectAlternativeNames;

  /// The support code. Include this code in your email to support when you have
  /// questions about your Lightsail load balancer or SSL/TLS certificate. This
  /// code enables our support team to look up your Lightsail information more
  /// easily.
  final String? supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags">Amazon
  /// Lightsail Developer Guide</a>.
  final List<Tag>? tags;

  LoadBalancerTlsCertificate({
    this.arn,
    this.createdAt,
    this.domainName,
    this.domainValidationRecords,
    this.failureReason,
    this.isAttached,
    this.issuedAt,
    this.issuer,
    this.keyAlgorithm,
    this.loadBalancerName,
    this.location,
    this.name,
    this.notAfter,
    this.notBefore,
    this.renewalSummary,
    this.resourceType,
    this.revocationReason,
    this.revokedAt,
    this.serial,
    this.signatureAlgorithm,
    this.status,
    this.subject,
    this.subjectAlternativeNames,
    this.supportCode,
    this.tags,
  });

  factory LoadBalancerTlsCertificate.fromJson(Map<String, dynamic> json) {
    return LoadBalancerTlsCertificate(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      domainName: json['domainName'] as String?,
      domainValidationRecords: (json['domainValidationRecords'] as List?)
          ?.whereNotNull()
          .map((e) => LoadBalancerTlsCertificateDomainValidationRecord.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      failureReason: (json['failureReason'] as String?)
          ?.toLoadBalancerTlsCertificateFailureReason(),
      isAttached: json['isAttached'] as bool?,
      issuedAt: timeStampFromJson(json['issuedAt']),
      issuer: json['issuer'] as String?,
      keyAlgorithm: json['keyAlgorithm'] as String?,
      loadBalancerName: json['loadBalancerName'] as String?,
      location: json['location'] != null
          ? ResourceLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      notAfter: timeStampFromJson(json['notAfter']),
      notBefore: timeStampFromJson(json['notBefore']),
      renewalSummary: json['renewalSummary'] != null
          ? LoadBalancerTlsCertificateRenewalSummary.fromJson(
              json['renewalSummary'] as Map<String, dynamic>)
          : null,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      revocationReason: (json['revocationReason'] as String?)
          ?.toLoadBalancerTlsCertificateRevocationReason(),
      revokedAt: timeStampFromJson(json['revokedAt']),
      serial: json['serial'] as String?,
      signatureAlgorithm: json['signatureAlgorithm'] as String?,
      status: (json['status'] as String?)?.toLoadBalancerTlsCertificateStatus(),
      subject: json['subject'] as String?,
      subjectAlternativeNames: (json['subjectAlternativeNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      supportCode: json['supportCode'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final domainName = this.domainName;
    final domainValidationRecords = this.domainValidationRecords;
    final failureReason = this.failureReason;
    final isAttached = this.isAttached;
    final issuedAt = this.issuedAt;
    final issuer = this.issuer;
    final keyAlgorithm = this.keyAlgorithm;
    final loadBalancerName = this.loadBalancerName;
    final location = this.location;
    final name = this.name;
    final notAfter = this.notAfter;
    final notBefore = this.notBefore;
    final renewalSummary = this.renewalSummary;
    final resourceType = this.resourceType;
    final revocationReason = this.revocationReason;
    final revokedAt = this.revokedAt;
    final serial = this.serial;
    final signatureAlgorithm = this.signatureAlgorithm;
    final status = this.status;
    final subject = this.subject;
    final subjectAlternativeNames = this.subjectAlternativeNames;
    final supportCode = this.supportCode;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (domainName != null) 'domainName': domainName,
      if (domainValidationRecords != null)
        'domainValidationRecords': domainValidationRecords,
      if (failureReason != null) 'failureReason': failureReason.toValue(),
      if (isAttached != null) 'isAttached': isAttached,
      if (issuedAt != null) 'issuedAt': unixTimestampToJson(issuedAt),
      if (issuer != null) 'issuer': issuer,
      if (keyAlgorithm != null) 'keyAlgorithm': keyAlgorithm,
      if (loadBalancerName != null) 'loadBalancerName': loadBalancerName,
      if (location != null) 'location': location,
      if (name != null) 'name': name,
      if (notAfter != null) 'notAfter': unixTimestampToJson(notAfter),
      if (notBefore != null) 'notBefore': unixTimestampToJson(notBefore),
      if (renewalSummary != null) 'renewalSummary': renewalSummary,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (revocationReason != null)
        'revocationReason': revocationReason.toValue(),
      if (revokedAt != null) 'revokedAt': unixTimestampToJson(revokedAt),
      if (serial != null) 'serial': serial,
      if (signatureAlgorithm != null) 'signatureAlgorithm': signatureAlgorithm,
      if (status != null) 'status': status.toValue(),
      if (subject != null) 'subject': subject,
      if (subjectAlternativeNames != null)
        'subjectAlternativeNames': subjectAlternativeNames,
      if (supportCode != null) 'supportCode': supportCode,
      if (tags != null) 'tags': tags,
    };
  }
}

/// An object that describes the state of the canonical name (CNAME) records
/// that are automatically added by Lightsail to the DNS of the domain to
/// validate domain ownership.
class LoadBalancerTlsCertificateDnsRecordCreationState {
  /// The status code for the automated DNS record creation.
  ///
  /// Following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>SUCCEEDED</code> - The validation records were successfully added.
  /// </li>
  /// <li>
  /// <code>STARTED</code> - The automatic DNS record creation has started.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - The validation record addition failed.
  /// </li>
  /// </ul>
  final LoadBalancerTlsCertificateDnsRecordCreationStateCode? code;

  /// The message that describes the reason for the status code.
  final String? message;

  LoadBalancerTlsCertificateDnsRecordCreationState({
    this.code,
    this.message,
  });

  factory LoadBalancerTlsCertificateDnsRecordCreationState.fromJson(
      Map<String, dynamic> json) {
    return LoadBalancerTlsCertificateDnsRecordCreationState(
      code: (json['code'] as String?)
          ?.toLoadBalancerTlsCertificateDnsRecordCreationStateCode(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'code': code.toValue(),
      if (message != null) 'message': message,
    };
  }
}

enum LoadBalancerTlsCertificateDnsRecordCreationStateCode {
  succeeded,
  started,
  failed,
}

extension LoadBalancerTlsCertificateDnsRecordCreationStateCodeValueExtension
    on LoadBalancerTlsCertificateDnsRecordCreationStateCode {
  String toValue() {
    switch (this) {
      case LoadBalancerTlsCertificateDnsRecordCreationStateCode.succeeded:
        return 'SUCCEEDED';
      case LoadBalancerTlsCertificateDnsRecordCreationStateCode.started:
        return 'STARTED';
      case LoadBalancerTlsCertificateDnsRecordCreationStateCode.failed:
        return 'FAILED';
    }
  }
}

extension LoadBalancerTlsCertificateDnsRecordCreationStateCodeFromString
    on String {
  LoadBalancerTlsCertificateDnsRecordCreationStateCode
      toLoadBalancerTlsCertificateDnsRecordCreationStateCode() {
    switch (this) {
      case 'SUCCEEDED':
        return LoadBalancerTlsCertificateDnsRecordCreationStateCode.succeeded;
      case 'STARTED':
        return LoadBalancerTlsCertificateDnsRecordCreationStateCode.started;
      case 'FAILED':
        return LoadBalancerTlsCertificateDnsRecordCreationStateCode.failed;
    }
    throw Exception(
        '$this is not known in enum LoadBalancerTlsCertificateDnsRecordCreationStateCode');
  }
}

enum LoadBalancerTlsCertificateDomainStatus {
  pendingValidation,
  failed,
  success,
}

extension LoadBalancerTlsCertificateDomainStatusValueExtension
    on LoadBalancerTlsCertificateDomainStatus {
  String toValue() {
    switch (this) {
      case LoadBalancerTlsCertificateDomainStatus.pendingValidation:
        return 'PENDING_VALIDATION';
      case LoadBalancerTlsCertificateDomainStatus.failed:
        return 'FAILED';
      case LoadBalancerTlsCertificateDomainStatus.success:
        return 'SUCCESS';
    }
  }
}

extension LoadBalancerTlsCertificateDomainStatusFromString on String {
  LoadBalancerTlsCertificateDomainStatus
      toLoadBalancerTlsCertificateDomainStatus() {
    switch (this) {
      case 'PENDING_VALIDATION':
        return LoadBalancerTlsCertificateDomainStatus.pendingValidation;
      case 'FAILED':
        return LoadBalancerTlsCertificateDomainStatus.failed;
      case 'SUCCESS':
        return LoadBalancerTlsCertificateDomainStatus.success;
    }
    throw Exception(
        '$this is not known in enum LoadBalancerTlsCertificateDomainStatus');
  }
}

/// Contains information about the domain names on an SSL/TLS certificate that
/// you will use to validate domain ownership.
class LoadBalancerTlsCertificateDomainValidationOption {
  /// The fully qualified domain name in the certificate request.
  final String? domainName;

  /// The status of the domain validation. Valid values are listed below.
  final LoadBalancerTlsCertificateDomainStatus? validationStatus;

  LoadBalancerTlsCertificateDomainValidationOption({
    this.domainName,
    this.validationStatus,
  });

  factory LoadBalancerTlsCertificateDomainValidationOption.fromJson(
      Map<String, dynamic> json) {
    return LoadBalancerTlsCertificateDomainValidationOption(
      domainName: json['domainName'] as String?,
      validationStatus: (json['validationStatus'] as String?)
          ?.toLoadBalancerTlsCertificateDomainStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainName = this.domainName;
    final validationStatus = this.validationStatus;
    return {
      if (domainName != null) 'domainName': domainName,
      if (validationStatus != null)
        'validationStatus': validationStatus.toValue(),
    };
  }
}

/// Describes the validation record of each domain name in the SSL/TLS
/// certificate.
class LoadBalancerTlsCertificateDomainValidationRecord {
  /// An object that describes the state of the canonical name (CNAME) records
  /// that are automatically added by Lightsail to the DNS of a domain to validate
  /// domain ownership.
  final LoadBalancerTlsCertificateDnsRecordCreationState?
      dnsRecordCreationState;

  /// The domain name against which your SSL/TLS certificate was validated.
  final String? domainName;

  /// A fully qualified domain name in the certificate. For example,
  /// <code>example.com</code>.
  final String? name;

  /// The type of validation record. For example, <code>CNAME</code> for domain
  /// validation.
  final String? type;

  /// The validation status. Valid values are listed below.
  final LoadBalancerTlsCertificateDomainStatus? validationStatus;

  /// The value for that type.
  final String? value;

  LoadBalancerTlsCertificateDomainValidationRecord({
    this.dnsRecordCreationState,
    this.domainName,
    this.name,
    this.type,
    this.validationStatus,
    this.value,
  });

  factory LoadBalancerTlsCertificateDomainValidationRecord.fromJson(
      Map<String, dynamic> json) {
    return LoadBalancerTlsCertificateDomainValidationRecord(
      dnsRecordCreationState: json['dnsRecordCreationState'] != null
          ? LoadBalancerTlsCertificateDnsRecordCreationState.fromJson(
              json['dnsRecordCreationState'] as Map<String, dynamic>)
          : null,
      domainName: json['domainName'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      validationStatus: (json['validationStatus'] as String?)
          ?.toLoadBalancerTlsCertificateDomainStatus(),
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dnsRecordCreationState = this.dnsRecordCreationState;
    final domainName = this.domainName;
    final name = this.name;
    final type = this.type;
    final validationStatus = this.validationStatus;
    final value = this.value;
    return {
      if (dnsRecordCreationState != null)
        'dnsRecordCreationState': dnsRecordCreationState,
      if (domainName != null) 'domainName': domainName,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (validationStatus != null)
        'validationStatus': validationStatus.toValue(),
      if (value != null) 'value': value,
    };
  }
}

enum LoadBalancerTlsCertificateFailureReason {
  noAvailableContacts,
  additionalVerificationRequired,
  domainNotAllowed,
  invalidPublicDomain,
  other,
}

extension LoadBalancerTlsCertificateFailureReasonValueExtension
    on LoadBalancerTlsCertificateFailureReason {
  String toValue() {
    switch (this) {
      case LoadBalancerTlsCertificateFailureReason.noAvailableContacts:
        return 'NO_AVAILABLE_CONTACTS';
      case LoadBalancerTlsCertificateFailureReason
            .additionalVerificationRequired:
        return 'ADDITIONAL_VERIFICATION_REQUIRED';
      case LoadBalancerTlsCertificateFailureReason.domainNotAllowed:
        return 'DOMAIN_NOT_ALLOWED';
      case LoadBalancerTlsCertificateFailureReason.invalidPublicDomain:
        return 'INVALID_PUBLIC_DOMAIN';
      case LoadBalancerTlsCertificateFailureReason.other:
        return 'OTHER';
    }
  }
}

extension LoadBalancerTlsCertificateFailureReasonFromString on String {
  LoadBalancerTlsCertificateFailureReason
      toLoadBalancerTlsCertificateFailureReason() {
    switch (this) {
      case 'NO_AVAILABLE_CONTACTS':
        return LoadBalancerTlsCertificateFailureReason.noAvailableContacts;
      case 'ADDITIONAL_VERIFICATION_REQUIRED':
        return LoadBalancerTlsCertificateFailureReason
            .additionalVerificationRequired;
      case 'DOMAIN_NOT_ALLOWED':
        return LoadBalancerTlsCertificateFailureReason.domainNotAllowed;
      case 'INVALID_PUBLIC_DOMAIN':
        return LoadBalancerTlsCertificateFailureReason.invalidPublicDomain;
      case 'OTHER':
        return LoadBalancerTlsCertificateFailureReason.other;
    }
    throw Exception(
        '$this is not known in enum LoadBalancerTlsCertificateFailureReason');
  }
}

enum LoadBalancerTlsCertificateRenewalStatus {
  pendingAutoRenewal,
  pendingValidation,
  success,
  failed,
}

extension LoadBalancerTlsCertificateRenewalStatusValueExtension
    on LoadBalancerTlsCertificateRenewalStatus {
  String toValue() {
    switch (this) {
      case LoadBalancerTlsCertificateRenewalStatus.pendingAutoRenewal:
        return 'PENDING_AUTO_RENEWAL';
      case LoadBalancerTlsCertificateRenewalStatus.pendingValidation:
        return 'PENDING_VALIDATION';
      case LoadBalancerTlsCertificateRenewalStatus.success:
        return 'SUCCESS';
      case LoadBalancerTlsCertificateRenewalStatus.failed:
        return 'FAILED';
    }
  }
}

extension LoadBalancerTlsCertificateRenewalStatusFromString on String {
  LoadBalancerTlsCertificateRenewalStatus
      toLoadBalancerTlsCertificateRenewalStatus() {
    switch (this) {
      case 'PENDING_AUTO_RENEWAL':
        return LoadBalancerTlsCertificateRenewalStatus.pendingAutoRenewal;
      case 'PENDING_VALIDATION':
        return LoadBalancerTlsCertificateRenewalStatus.pendingValidation;
      case 'SUCCESS':
        return LoadBalancerTlsCertificateRenewalStatus.success;
      case 'FAILED':
        return LoadBalancerTlsCertificateRenewalStatus.failed;
    }
    throw Exception(
        '$this is not known in enum LoadBalancerTlsCertificateRenewalStatus');
  }
}

/// Contains information about the status of Lightsail's managed renewal for the
/// certificate.
///
/// The renewal status of the certificate.
///
/// The following renewal status are possible:
///
/// <ul>
/// <li>
/// <b> <code>PendingAutoRenewal</code> </b> - Lightsail is attempting to
/// automatically validate the domain names in the certificate. No further
/// action is required.
/// </li>
/// <li>
/// <b> <code>PendingValidation</code> </b> - Lightsail couldn't automatically
/// validate one or more domain names in the certificate. You must take action
/// to validate these domain names or the certificate won't be renewed. If you
/// used DNS validation, check to make sure your certificate's domain validation
/// records exist in your domain's DNS, and that your certificate remains in
/// use.
/// </li>
/// <li>
/// <b> <code>Success</code> </b> - All domain names in the certificate are
/// validated, and Lightsail renewed the certificate. No further action is
/// required.
/// </li>
/// <li>
/// <b> <code>Failed</code> </b> - One or more domain names were not validated
/// before the certificate expired, and Lightsail did not renew the certificate.
/// You can request a new certificate using the <code>CreateCertificate</code>
/// action.
/// </li>
/// </ul>
class LoadBalancerTlsCertificateRenewalSummary {
  /// Contains information about the validation of each domain name in the
  /// certificate, as it pertains to Lightsail's managed renewal. This is
  /// different from the initial validation that occurs as a result of the
  /// RequestCertificate request.
  final List<LoadBalancerTlsCertificateDomainValidationOption>?
      domainValidationOptions;

  /// The renewal status of the certificate.
  ///
  /// The following renewal status are possible:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>PendingAutoRenewal</code> </b> - Lightsail is attempting to
  /// automatically validate the domain names of the certificate. No further
  /// action is required.
  /// </li>
  /// <li>
  /// <b> <code>PendingValidation</code> </b> - Lightsail couldn't automatically
  /// validate one or more domain names of the certificate. You must take action
  /// to validate these domain names or the certificate won't be renewed. Check to
  /// make sure your certificate's domain validation records exist in your
  /// domain's DNS, and that your certificate remains in use.
  /// </li>
  /// <li>
  /// <b> <code>Success</code> </b> - All domain names in the certificate are
  /// validated, and Lightsail renewed the certificate. No further action is
  /// required.
  /// </li>
  /// <li>
  /// <b> <code>Failed</code> </b> - One or more domain names were not validated
  /// before the certificate expired, and Lightsail did not renew the certificate.
  /// You can request a new certificate using the <code>CreateCertificate</code>
  /// action.
  /// </li>
  /// </ul>
  final LoadBalancerTlsCertificateRenewalStatus? renewalStatus;

  LoadBalancerTlsCertificateRenewalSummary({
    this.domainValidationOptions,
    this.renewalStatus,
  });

  factory LoadBalancerTlsCertificateRenewalSummary.fromJson(
      Map<String, dynamic> json) {
    return LoadBalancerTlsCertificateRenewalSummary(
      domainValidationOptions: (json['domainValidationOptions'] as List?)
          ?.whereNotNull()
          .map((e) => LoadBalancerTlsCertificateDomainValidationOption.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      renewalStatus: (json['renewalStatus'] as String?)
          ?.toLoadBalancerTlsCertificateRenewalStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final domainValidationOptions = this.domainValidationOptions;
    final renewalStatus = this.renewalStatus;
    return {
      if (domainValidationOptions != null)
        'domainValidationOptions': domainValidationOptions,
      if (renewalStatus != null) 'renewalStatus': renewalStatus.toValue(),
    };
  }
}

enum LoadBalancerTlsCertificateRevocationReason {
  unspecified,
  keyCompromise,
  caCompromise,
  affiliationChanged,
  superceded,
  cessationOfOperation,
  certificateHold,
  removeFromCrl,
  privilegeWithdrawn,
  aACompromise,
}

extension LoadBalancerTlsCertificateRevocationReasonValueExtension
    on LoadBalancerTlsCertificateRevocationReason {
  String toValue() {
    switch (this) {
      case LoadBalancerTlsCertificateRevocationReason.unspecified:
        return 'UNSPECIFIED';
      case LoadBalancerTlsCertificateRevocationReason.keyCompromise:
        return 'KEY_COMPROMISE';
      case LoadBalancerTlsCertificateRevocationReason.caCompromise:
        return 'CA_COMPROMISE';
      case LoadBalancerTlsCertificateRevocationReason.affiliationChanged:
        return 'AFFILIATION_CHANGED';
      case LoadBalancerTlsCertificateRevocationReason.superceded:
        return 'SUPERCEDED';
      case LoadBalancerTlsCertificateRevocationReason.cessationOfOperation:
        return 'CESSATION_OF_OPERATION';
      case LoadBalancerTlsCertificateRevocationReason.certificateHold:
        return 'CERTIFICATE_HOLD';
      case LoadBalancerTlsCertificateRevocationReason.removeFromCrl:
        return 'REMOVE_FROM_CRL';
      case LoadBalancerTlsCertificateRevocationReason.privilegeWithdrawn:
        return 'PRIVILEGE_WITHDRAWN';
      case LoadBalancerTlsCertificateRevocationReason.aACompromise:
        return 'A_A_COMPROMISE';
    }
  }
}

extension LoadBalancerTlsCertificateRevocationReasonFromString on String {
  LoadBalancerTlsCertificateRevocationReason
      toLoadBalancerTlsCertificateRevocationReason() {
    switch (this) {
      case 'UNSPECIFIED':
        return LoadBalancerTlsCertificateRevocationReason.unspecified;
      case 'KEY_COMPROMISE':
        return LoadBalancerTlsCertificateRevocationReason.keyCompromise;
      case 'CA_COMPROMISE':
        return LoadBalancerTlsCertificateRevocationReason.caCompromise;
      case 'AFFILIATION_CHANGED':
        return LoadBalancerTlsCertificateRevocationReason.affiliationChanged;
      case 'SUPERCEDED':
        return LoadBalancerTlsCertificateRevocationReason.superceded;
      case 'CESSATION_OF_OPERATION':
        return LoadBalancerTlsCertificateRevocationReason.cessationOfOperation;
      case 'CERTIFICATE_HOLD':
        return LoadBalancerTlsCertificateRevocationReason.certificateHold;
      case 'REMOVE_FROM_CRL':
        return LoadBalancerTlsCertificateRevocationReason.removeFromCrl;
      case 'PRIVILEGE_WITHDRAWN':
        return LoadBalancerTlsCertificateRevocationReason.privilegeWithdrawn;
      case 'A_A_COMPROMISE':
        return LoadBalancerTlsCertificateRevocationReason.aACompromise;
    }
    throw Exception(
        '$this is not known in enum LoadBalancerTlsCertificateRevocationReason');
  }
}

enum LoadBalancerTlsCertificateStatus {
  pendingValidation,
  issued,
  inactive,
  expired,
  validationTimedOut,
  revoked,
  failed,
  unknown,
}

extension LoadBalancerTlsCertificateStatusValueExtension
    on LoadBalancerTlsCertificateStatus {
  String toValue() {
    switch (this) {
      case LoadBalancerTlsCertificateStatus.pendingValidation:
        return 'PENDING_VALIDATION';
      case LoadBalancerTlsCertificateStatus.issued:
        return 'ISSUED';
      case LoadBalancerTlsCertificateStatus.inactive:
        return 'INACTIVE';
      case LoadBalancerTlsCertificateStatus.expired:
        return 'EXPIRED';
      case LoadBalancerTlsCertificateStatus.validationTimedOut:
        return 'VALIDATION_TIMED_OUT';
      case LoadBalancerTlsCertificateStatus.revoked:
        return 'REVOKED';
      case LoadBalancerTlsCertificateStatus.failed:
        return 'FAILED';
      case LoadBalancerTlsCertificateStatus.unknown:
        return 'UNKNOWN';
    }
  }
}

extension LoadBalancerTlsCertificateStatusFromString on String {
  LoadBalancerTlsCertificateStatus toLoadBalancerTlsCertificateStatus() {
    switch (this) {
      case 'PENDING_VALIDATION':
        return LoadBalancerTlsCertificateStatus.pendingValidation;
      case 'ISSUED':
        return LoadBalancerTlsCertificateStatus.issued;
      case 'INACTIVE':
        return LoadBalancerTlsCertificateStatus.inactive;
      case 'EXPIRED':
        return LoadBalancerTlsCertificateStatus.expired;
      case 'VALIDATION_TIMED_OUT':
        return LoadBalancerTlsCertificateStatus.validationTimedOut;
      case 'REVOKED':
        return LoadBalancerTlsCertificateStatus.revoked;
      case 'FAILED':
        return LoadBalancerTlsCertificateStatus.failed;
      case 'UNKNOWN':
        return LoadBalancerTlsCertificateStatus.unknown;
    }
    throw Exception(
        '$this is not known in enum LoadBalancerTlsCertificateStatus');
  }
}

/// Provides a summary of SSL/TLS certificate metadata.
class LoadBalancerTlsCertificateSummary {
  /// When <code>true</code>, the SSL/TLS certificate is attached to the Lightsail
  /// load balancer.
  final bool? isAttached;

  /// The name of the SSL/TLS certificate.
  final String? name;

  LoadBalancerTlsCertificateSummary({
    this.isAttached,
    this.name,
  });

  factory LoadBalancerTlsCertificateSummary.fromJson(
      Map<String, dynamic> json) {
    return LoadBalancerTlsCertificateSummary(
      isAttached: json['isAttached'] as bool?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isAttached = this.isAttached;
    final name = this.name;
    return {
      if (isAttached != null) 'isAttached': isAttached,
      if (name != null) 'name': name,
    };
  }
}

/// Describes the TLS security policies that are available for Lightsail load
/// balancers.
///
/// For more information about load balancer TLS security policies, see <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configure-load-balancer-tls-security-policy">Configuring
/// TLS security policies on your Amazon Lightsail load balancers</a> in the
/// <i>Amazon Lightsail Developer Guide</i>.
class LoadBalancerTlsPolicy {
  /// The ciphers used by the TLS security policy.
  ///
  /// The ciphers are listed in order of preference.
  final List<String>? ciphers;

  /// The description of the TLS security policy.
  final String? description;

  /// A Boolean value that indicates whether the TLS security policy is the
  /// default.
  final bool? isDefault;

  /// The name of the TLS security policy.
  final String? name;

  /// The protocols used in a given TLS security policy.
  final List<String>? protocols;

  LoadBalancerTlsPolicy({
    this.ciphers,
    this.description,
    this.isDefault,
    this.name,
    this.protocols,
  });

  factory LoadBalancerTlsPolicy.fromJson(Map<String, dynamic> json) {
    return LoadBalancerTlsPolicy(
      ciphers: (json['ciphers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      isDefault: json['isDefault'] as bool?,
      name: json['name'] as String?,
      protocols: (json['protocols'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final ciphers = this.ciphers;
    final description = this.description;
    final isDefault = this.isDefault;
    final name = this.name;
    final protocols = this.protocols;
    return {
      if (ciphers != null) 'ciphers': ciphers,
      if (description != null) 'description': description,
      if (isDefault != null) 'isDefault': isDefault,
      if (name != null) 'name': name,
      if (protocols != null) 'protocols': protocols,
    };
  }
}

/// Describes a database log event.
class LogEvent {
  /// The timestamp when the database log event was created.
  final DateTime? createdAt;

  /// The message of the database log event.
  final String? message;

  LogEvent({
    this.createdAt,
    this.message,
  });

  factory LogEvent.fromJson(Map<String, dynamic> json) {
    return LogEvent(
      createdAt: timeStampFromJson(json['createdAt']),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final message = this.message;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (message != null) 'message': message,
    };
  }
}

/// Describes the metric data point.
class MetricDatapoint {
  /// The average.
  final double? average;

  /// The maximum.
  final double? maximum;

  /// The minimum.
  final double? minimum;

  /// The sample count.
  final double? sampleCount;

  /// The sum.
  final double? sum;

  /// The timestamp (<code>1479816991.349</code>).
  final DateTime? timestamp;

  /// The unit.
  final MetricUnit? unit;

  MetricDatapoint({
    this.average,
    this.maximum,
    this.minimum,
    this.sampleCount,
    this.sum,
    this.timestamp,
    this.unit,
  });

  factory MetricDatapoint.fromJson(Map<String, dynamic> json) {
    return MetricDatapoint(
      average: json['average'] as double?,
      maximum: json['maximum'] as double?,
      minimum: json['minimum'] as double?,
      sampleCount: json['sampleCount'] as double?,
      sum: json['sum'] as double?,
      timestamp: timeStampFromJson(json['timestamp']),
      unit: (json['unit'] as String?)?.toMetricUnit(),
    );
  }

  Map<String, dynamic> toJson() {
    final average = this.average;
    final maximum = this.maximum;
    final minimum = this.minimum;
    final sampleCount = this.sampleCount;
    final sum = this.sum;
    final timestamp = this.timestamp;
    final unit = this.unit;
    return {
      if (average != null) 'average': average,
      if (maximum != null) 'maximum': maximum,
      if (minimum != null) 'minimum': minimum,
      if (sampleCount != null) 'sampleCount': sampleCount,
      if (sum != null) 'sum': sum,
      if (timestamp != null) 'timestamp': unixTimestampToJson(timestamp),
      if (unit != null) 'unit': unit.toValue(),
    };
  }
}

enum MetricName {
  cPUUtilization,
  networkIn,
  networkOut,
  statusCheckFailed,
  statusCheckFailedInstance,
  statusCheckFailedSystem,
  clientTLSNegotiationErrorCount,
  healthyHostCount,
  unhealthyHostCount,
  hTTPCodeLb_4xxCount,
  hTTPCodeLb_5xxCount,
  hTTPCodeInstance_2xxCount,
  hTTPCodeInstance_3xxCount,
  hTTPCodeInstance_4xxCount,
  hTTPCodeInstance_5xxCount,
  instanceResponseTime,
  rejectedConnectionCount,
  requestCount,
  databaseConnections,
  diskQueueDepth,
  freeStorageSpace,
  networkReceiveThroughput,
  networkTransmitThroughput,
  burstCapacityTime,
  burstCapacityPercentage,
}

extension MetricNameValueExtension on MetricName {
  String toValue() {
    switch (this) {
      case MetricName.cPUUtilization:
        return 'CPUUtilization';
      case MetricName.networkIn:
        return 'NetworkIn';
      case MetricName.networkOut:
        return 'NetworkOut';
      case MetricName.statusCheckFailed:
        return 'StatusCheckFailed';
      case MetricName.statusCheckFailedInstance:
        return 'StatusCheckFailed_Instance';
      case MetricName.statusCheckFailedSystem:
        return 'StatusCheckFailed_System';
      case MetricName.clientTLSNegotiationErrorCount:
        return 'ClientTLSNegotiationErrorCount';
      case MetricName.healthyHostCount:
        return 'HealthyHostCount';
      case MetricName.unhealthyHostCount:
        return 'UnhealthyHostCount';
      case MetricName.hTTPCodeLb_4xxCount:
        return 'HTTPCode_LB_4XX_Count';
      case MetricName.hTTPCodeLb_5xxCount:
        return 'HTTPCode_LB_5XX_Count';
      case MetricName.hTTPCodeInstance_2xxCount:
        return 'HTTPCode_Instance_2XX_Count';
      case MetricName.hTTPCodeInstance_3xxCount:
        return 'HTTPCode_Instance_3XX_Count';
      case MetricName.hTTPCodeInstance_4xxCount:
        return 'HTTPCode_Instance_4XX_Count';
      case MetricName.hTTPCodeInstance_5xxCount:
        return 'HTTPCode_Instance_5XX_Count';
      case MetricName.instanceResponseTime:
        return 'InstanceResponseTime';
      case MetricName.rejectedConnectionCount:
        return 'RejectedConnectionCount';
      case MetricName.requestCount:
        return 'RequestCount';
      case MetricName.databaseConnections:
        return 'DatabaseConnections';
      case MetricName.diskQueueDepth:
        return 'DiskQueueDepth';
      case MetricName.freeStorageSpace:
        return 'FreeStorageSpace';
      case MetricName.networkReceiveThroughput:
        return 'NetworkReceiveThroughput';
      case MetricName.networkTransmitThroughput:
        return 'NetworkTransmitThroughput';
      case MetricName.burstCapacityTime:
        return 'BurstCapacityTime';
      case MetricName.burstCapacityPercentage:
        return 'BurstCapacityPercentage';
    }
  }
}

extension MetricNameFromString on String {
  MetricName toMetricName() {
    switch (this) {
      case 'CPUUtilization':
        return MetricName.cPUUtilization;
      case 'NetworkIn':
        return MetricName.networkIn;
      case 'NetworkOut':
        return MetricName.networkOut;
      case 'StatusCheckFailed':
        return MetricName.statusCheckFailed;
      case 'StatusCheckFailed_Instance':
        return MetricName.statusCheckFailedInstance;
      case 'StatusCheckFailed_System':
        return MetricName.statusCheckFailedSystem;
      case 'ClientTLSNegotiationErrorCount':
        return MetricName.clientTLSNegotiationErrorCount;
      case 'HealthyHostCount':
        return MetricName.healthyHostCount;
      case 'UnhealthyHostCount':
        return MetricName.unhealthyHostCount;
      case 'HTTPCode_LB_4XX_Count':
        return MetricName.hTTPCodeLb_4xxCount;
      case 'HTTPCode_LB_5XX_Count':
        return MetricName.hTTPCodeLb_5xxCount;
      case 'HTTPCode_Instance_2XX_Count':
        return MetricName.hTTPCodeInstance_2xxCount;
      case 'HTTPCode_Instance_3XX_Count':
        return MetricName.hTTPCodeInstance_3xxCount;
      case 'HTTPCode_Instance_4XX_Count':
        return MetricName.hTTPCodeInstance_4xxCount;
      case 'HTTPCode_Instance_5XX_Count':
        return MetricName.hTTPCodeInstance_5xxCount;
      case 'InstanceResponseTime':
        return MetricName.instanceResponseTime;
      case 'RejectedConnectionCount':
        return MetricName.rejectedConnectionCount;
      case 'RequestCount':
        return MetricName.requestCount;
      case 'DatabaseConnections':
        return MetricName.databaseConnections;
      case 'DiskQueueDepth':
        return MetricName.diskQueueDepth;
      case 'FreeStorageSpace':
        return MetricName.freeStorageSpace;
      case 'NetworkReceiveThroughput':
        return MetricName.networkReceiveThroughput;
      case 'NetworkTransmitThroughput':
        return MetricName.networkTransmitThroughput;
      case 'BurstCapacityTime':
        return MetricName.burstCapacityTime;
      case 'BurstCapacityPercentage':
        return MetricName.burstCapacityPercentage;
    }
    throw Exception('$this is not known in enum MetricName');
  }
}

enum MetricStatistic {
  minimum,
  maximum,
  sum,
  average,
  sampleCount,
}

extension MetricStatisticValueExtension on MetricStatistic {
  String toValue() {
    switch (this) {
      case MetricStatistic.minimum:
        return 'Minimum';
      case MetricStatistic.maximum:
        return 'Maximum';
      case MetricStatistic.sum:
        return 'Sum';
      case MetricStatistic.average:
        return 'Average';
      case MetricStatistic.sampleCount:
        return 'SampleCount';
    }
  }
}

extension MetricStatisticFromString on String {
  MetricStatistic toMetricStatistic() {
    switch (this) {
      case 'Minimum':
        return MetricStatistic.minimum;
      case 'Maximum':
        return MetricStatistic.maximum;
      case 'Sum':
        return MetricStatistic.sum;
      case 'Average':
        return MetricStatistic.average;
      case 'SampleCount':
        return MetricStatistic.sampleCount;
    }
    throw Exception('$this is not known in enum MetricStatistic');
  }
}

enum MetricUnit {
  seconds,
  microseconds,
  milliseconds,
  bytes,
  kilobytes,
  megabytes,
  gigabytes,
  terabytes,
  bits,
  kilobits,
  megabits,
  gigabits,
  terabits,
  percent,
  count,
  bytesSecond,
  kilobytesSecond,
  megabytesSecond,
  gigabytesSecond,
  terabytesSecond,
  bitsSecond,
  kilobitsSecond,
  megabitsSecond,
  gigabitsSecond,
  terabitsSecond,
  countSecond,
  none,
}

extension MetricUnitValueExtension on MetricUnit {
  String toValue() {
    switch (this) {
      case MetricUnit.seconds:
        return 'Seconds';
      case MetricUnit.microseconds:
        return 'Microseconds';
      case MetricUnit.milliseconds:
        return 'Milliseconds';
      case MetricUnit.bytes:
        return 'Bytes';
      case MetricUnit.kilobytes:
        return 'Kilobytes';
      case MetricUnit.megabytes:
        return 'Megabytes';
      case MetricUnit.gigabytes:
        return 'Gigabytes';
      case MetricUnit.terabytes:
        return 'Terabytes';
      case MetricUnit.bits:
        return 'Bits';
      case MetricUnit.kilobits:
        return 'Kilobits';
      case MetricUnit.megabits:
        return 'Megabits';
      case MetricUnit.gigabits:
        return 'Gigabits';
      case MetricUnit.terabits:
        return 'Terabits';
      case MetricUnit.percent:
        return 'Percent';
      case MetricUnit.count:
        return 'Count';
      case MetricUnit.bytesSecond:
        return 'Bytes/Second';
      case MetricUnit.kilobytesSecond:
        return 'Kilobytes/Second';
      case MetricUnit.megabytesSecond:
        return 'Megabytes/Second';
      case MetricUnit.gigabytesSecond:
        return 'Gigabytes/Second';
      case MetricUnit.terabytesSecond:
        return 'Terabytes/Second';
      case MetricUnit.bitsSecond:
        return 'Bits/Second';
      case MetricUnit.kilobitsSecond:
        return 'Kilobits/Second';
      case MetricUnit.megabitsSecond:
        return 'Megabits/Second';
      case MetricUnit.gigabitsSecond:
        return 'Gigabits/Second';
      case MetricUnit.terabitsSecond:
        return 'Terabits/Second';
      case MetricUnit.countSecond:
        return 'Count/Second';
      case MetricUnit.none:
        return 'None';
    }
  }
}

extension MetricUnitFromString on String {
  MetricUnit toMetricUnit() {
    switch (this) {
      case 'Seconds':
        return MetricUnit.seconds;
      case 'Microseconds':
        return MetricUnit.microseconds;
      case 'Milliseconds':
        return MetricUnit.milliseconds;
      case 'Bytes':
        return MetricUnit.bytes;
      case 'Kilobytes':
        return MetricUnit.kilobytes;
      case 'Megabytes':
        return MetricUnit.megabytes;
      case 'Gigabytes':
        return MetricUnit.gigabytes;
      case 'Terabytes':
        return MetricUnit.terabytes;
      case 'Bits':
        return MetricUnit.bits;
      case 'Kilobits':
        return MetricUnit.kilobits;
      case 'Megabits':
        return MetricUnit.megabits;
      case 'Gigabits':
        return MetricUnit.gigabits;
      case 'Terabits':
        return MetricUnit.terabits;
      case 'Percent':
        return MetricUnit.percent;
      case 'Count':
        return MetricUnit.count;
      case 'Bytes/Second':
        return MetricUnit.bytesSecond;
      case 'Kilobytes/Second':
        return MetricUnit.kilobytesSecond;
      case 'Megabytes/Second':
        return MetricUnit.megabytesSecond;
      case 'Gigabytes/Second':
        return MetricUnit.gigabytesSecond;
      case 'Terabytes/Second':
        return MetricUnit.terabytesSecond;
      case 'Bits/Second':
        return MetricUnit.bitsSecond;
      case 'Kilobits/Second':
        return MetricUnit.kilobitsSecond;
      case 'Megabits/Second':
        return MetricUnit.megabitsSecond;
      case 'Gigabits/Second':
        return MetricUnit.gigabitsSecond;
      case 'Terabits/Second':
        return MetricUnit.terabitsSecond;
      case 'Count/Second':
        return MetricUnit.countSecond;
      case 'None':
        return MetricUnit.none;
    }
    throw Exception('$this is not known in enum MetricUnit');
  }
}

/// Describes resource being monitored by an alarm.
///
/// An alarm is a way to monitor your Amazon Lightsail resource metrics. For
/// more information, see <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms
/// in Amazon Lightsail</a>.
class MonitoredResourceInfo {
  /// The Amazon Resource Name (ARN) of the resource being monitored.
  final String? arn;

  /// The name of the Lightsail resource being monitored.
  final String? name;

  /// The Lightsail resource type of the resource being monitored.
  ///
  /// Instances, load balancers, and relational databases are the only Lightsail
  /// resources that can currently be monitored by alarms.
  final ResourceType? resourceType;

  MonitoredResourceInfo({
    this.arn,
    this.name,
    this.resourceType,
  });

  factory MonitoredResourceInfo.fromJson(Map<String, dynamic> json) {
    return MonitoredResourceInfo(
      arn: json['arn'] as String?,
      name: json['name'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final resourceType = this.resourceType;
    return {
      if (arn != null) 'arn': arn,
      if (name != null) 'name': name,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
    };
  }
}

/// Describes the monthly data transfer in and out of your virtual private
/// server (or <i>instance</i>).
class MonthlyTransfer {
  /// The amount allocated per month (in GB).
  final int? gbPerMonthAllocated;

  MonthlyTransfer({
    this.gbPerMonthAllocated,
  });

  factory MonthlyTransfer.fromJson(Map<String, dynamic> json) {
    return MonthlyTransfer(
      gbPerMonthAllocated: json['gbPerMonthAllocated'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final gbPerMonthAllocated = this.gbPerMonthAllocated;
    return {
      if (gbPerMonthAllocated != null)
        'gbPerMonthAllocated': gbPerMonthAllocated,
    };
  }
}

/// Describes the state of the name server records update made by Amazon
/// Lightsail to an Amazon Route 53 registered domain.
///
/// For more information, see <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/understanding-dns-in-amazon-lightsail">DNS
/// in Amazon Lightsail</a> in the <i>Amazon Lightsail Developer Guide</i>.
class NameServersUpdateState {
  /// The status code for the name servers update.
  ///
  /// Following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>SUCCEEDED</code> - The name server records were successfully updated.
  /// </li>
  /// <li>
  /// <code>PENDING</code> - The name server record update is in progress.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - The name server record update failed.
  /// </li>
  /// <li>
  /// <code>STARTED</code> - The automatic name server record update started.
  /// </li>
  /// </ul>
  final NameServersUpdateStateCode? code;

  /// The message that describes the reason for the status code.
  final String? message;

  NameServersUpdateState({
    this.code,
    this.message,
  });

  factory NameServersUpdateState.fromJson(Map<String, dynamic> json) {
    return NameServersUpdateState(
      code: (json['code'] as String?)?.toNameServersUpdateStateCode(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'code': code.toValue(),
      if (message != null) 'message': message,
    };
  }
}

enum NameServersUpdateStateCode {
  succeeded,
  pending,
  failed,
  started,
}

extension NameServersUpdateStateCodeValueExtension
    on NameServersUpdateStateCode {
  String toValue() {
    switch (this) {
      case NameServersUpdateStateCode.succeeded:
        return 'SUCCEEDED';
      case NameServersUpdateStateCode.pending:
        return 'PENDING';
      case NameServersUpdateStateCode.failed:
        return 'FAILED';
      case NameServersUpdateStateCode.started:
        return 'STARTED';
    }
  }
}

extension NameServersUpdateStateCodeFromString on String {
  NameServersUpdateStateCode toNameServersUpdateStateCode() {
    switch (this) {
      case 'SUCCEEDED':
        return NameServersUpdateStateCode.succeeded;
      case 'PENDING':
        return NameServersUpdateStateCode.pending;
      case 'FAILED':
        return NameServersUpdateStateCode.failed;
      case 'STARTED':
        return NameServersUpdateStateCode.started;
    }
    throw Exception('$this is not known in enum NameServersUpdateStateCode');
  }
}

enum NetworkProtocol {
  tcp,
  all,
  udp,
  icmp,
  icmpv6,
}

extension NetworkProtocolValueExtension on NetworkProtocol {
  String toValue() {
    switch (this) {
      case NetworkProtocol.tcp:
        return 'tcp';
      case NetworkProtocol.all:
        return 'all';
      case NetworkProtocol.udp:
        return 'udp';
      case NetworkProtocol.icmp:
        return 'icmp';
      case NetworkProtocol.icmpv6:
        return 'icmpv6';
    }
  }
}

extension NetworkProtocolFromString on String {
  NetworkProtocol toNetworkProtocol() {
    switch (this) {
      case 'tcp':
        return NetworkProtocol.tcp;
      case 'all':
        return NetworkProtocol.all;
      case 'udp':
        return NetworkProtocol.udp;
      case 'icmp':
        return NetworkProtocol.icmp;
      case 'icmpv6':
        return NetworkProtocol.icmpv6;
    }
    throw Exception('$this is not known in enum NetworkProtocol');
  }
}

class OpenInstancePublicPortsResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final Operation? operation;

  OpenInstancePublicPortsResult({
    this.operation,
  });

  factory OpenInstancePublicPortsResult.fromJson(Map<String, dynamic> json) {
    return OpenInstancePublicPortsResult(
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    return {
      if (operation != null) 'operation': operation,
    };
  }
}

/// Describes the API operation.
class Operation {
  /// The timestamp when the operation was initialized
  /// (<code>1479816991.349</code>).
  final DateTime? createdAt;

  /// The error code.
  final String? errorCode;

  /// The error details.
  final String? errorDetails;

  /// The ID of the operation.
  final String? id;

  /// A Boolean value indicating whether the operation is terminal.
  final bool? isTerminal;

  /// The Amazon Web Services Region and Availability Zone.
  final ResourceLocation? location;

  /// Details about the operation (<code>Debian-1GB-Ohio-1</code>).
  final String? operationDetails;

  /// The type of operation.
  final OperationType? operationType;

  /// The resource name.
  final String? resourceName;

  /// The resource type.
  final ResourceType? resourceType;

  /// The status of the operation.
  final OperationStatus? status;

  /// The timestamp when the status was changed (<code>1479816991.349</code>).
  final DateTime? statusChangedAt;

  Operation({
    this.createdAt,
    this.errorCode,
    this.errorDetails,
    this.id,
    this.isTerminal,
    this.location,
    this.operationDetails,
    this.operationType,
    this.resourceName,
    this.resourceType,
    this.status,
    this.statusChangedAt,
  });

  factory Operation.fromJson(Map<String, dynamic> json) {
    return Operation(
      createdAt: timeStampFromJson(json['createdAt']),
      errorCode: json['errorCode'] as String?,
      errorDetails: json['errorDetails'] as String?,
      id: json['id'] as String?,
      isTerminal: json['isTerminal'] as bool?,
      location: json['location'] != null
          ? ResourceLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      operationDetails: json['operationDetails'] as String?,
      operationType: (json['operationType'] as String?)?.toOperationType(),
      resourceName: json['resourceName'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      status: (json['status'] as String?)?.toOperationStatus(),
      statusChangedAt: timeStampFromJson(json['statusChangedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final errorCode = this.errorCode;
    final errorDetails = this.errorDetails;
    final id = this.id;
    final isTerminal = this.isTerminal;
    final location = this.location;
    final operationDetails = this.operationDetails;
    final operationType = this.operationType;
    final resourceName = this.resourceName;
    final resourceType = this.resourceType;
    final status = this.status;
    final statusChangedAt = this.statusChangedAt;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (errorCode != null) 'errorCode': errorCode,
      if (errorDetails != null) 'errorDetails': errorDetails,
      if (id != null) 'id': id,
      if (isTerminal != null) 'isTerminal': isTerminal,
      if (location != null) 'location': location,
      if (operationDetails != null) 'operationDetails': operationDetails,
      if (operationType != null) 'operationType': operationType.toValue(),
      if (resourceName != null) 'resourceName': resourceName,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (status != null) 'status': status.toValue(),
      if (statusChangedAt != null)
        'statusChangedAt': unixTimestampToJson(statusChangedAt),
    };
  }
}

enum OperationStatus {
  notStarted,
  started,
  failed,
  completed,
  succeeded,
}

extension OperationStatusValueExtension on OperationStatus {
  String toValue() {
    switch (this) {
      case OperationStatus.notStarted:
        return 'NotStarted';
      case OperationStatus.started:
        return 'Started';
      case OperationStatus.failed:
        return 'Failed';
      case OperationStatus.completed:
        return 'Completed';
      case OperationStatus.succeeded:
        return 'Succeeded';
    }
  }
}

extension OperationStatusFromString on String {
  OperationStatus toOperationStatus() {
    switch (this) {
      case 'NotStarted':
        return OperationStatus.notStarted;
      case 'Started':
        return OperationStatus.started;
      case 'Failed':
        return OperationStatus.failed;
      case 'Completed':
        return OperationStatus.completed;
      case 'Succeeded':
        return OperationStatus.succeeded;
    }
    throw Exception('$this is not known in enum OperationStatus');
  }
}

enum OperationType {
  deleteKnownHostKeys,
  deleteInstance,
  createInstance,
  stopInstance,
  startInstance,
  rebootInstance,
  openInstancePublicPorts,
  putInstancePublicPorts,
  closeInstancePublicPorts,
  allocateStaticIp,
  releaseStaticIp,
  attachStaticIp,
  detachStaticIp,
  updateDomainEntry,
  deleteDomainEntry,
  createDomain,
  deleteDomain,
  createInstanceSnapshot,
  deleteInstanceSnapshot,
  createInstancesFromSnapshot,
  createLoadBalancer,
  deleteLoadBalancer,
  attachInstancesToLoadBalancer,
  detachInstancesFromLoadBalancer,
  updateLoadBalancerAttribute,
  createLoadBalancerTlsCertificate,
  deleteLoadBalancerTlsCertificate,
  attachLoadBalancerTlsCertificate,
  createDisk,
  deleteDisk,
  attachDisk,
  detachDisk,
  createDiskSnapshot,
  deleteDiskSnapshot,
  createDiskFromSnapshot,
  createRelationalDatabase,
  updateRelationalDatabase,
  deleteRelationalDatabase,
  createRelationalDatabaseFromSnapshot,
  createRelationalDatabaseSnapshot,
  deleteRelationalDatabaseSnapshot,
  updateRelationalDatabaseParameters,
  startRelationalDatabase,
  rebootRelationalDatabase,
  stopRelationalDatabase,
  enableAddOn,
  disableAddOn,
  putAlarm,
  getAlarms,
  deleteAlarm,
  testAlarm,
  createContactMethod,
  getContactMethods,
  sendContactMethodVerification,
  deleteContactMethod,
  createDistribution,
  updateDistribution,
  deleteDistribution,
  resetDistributionCache,
  attachCertificateToDistribution,
  detachCertificateFromDistribution,
  updateDistributionBundle,
  setIpAddressType,
  createCertificate,
  deleteCertificate,
  createContainerService,
  updateContainerService,
  deleteContainerService,
  createContainerServiceDeployment,
  createContainerServiceRegistryLogin,
  registerContainerImage,
  deleteContainerImage,
  createBucket,
  deleteBucket,
  createBucketAccessKey,
  deleteBucketAccessKey,
  updateBucketBundle,
  updateBucket,
  setResourceAccessForBucket,
  updateInstanceMetadataOptions,
  startGUISession,
  stopGUISession,
  setupInstanceHttps,
}

extension OperationTypeValueExtension on OperationType {
  String toValue() {
    switch (this) {
      case OperationType.deleteKnownHostKeys:
        return 'DeleteKnownHostKeys';
      case OperationType.deleteInstance:
        return 'DeleteInstance';
      case OperationType.createInstance:
        return 'CreateInstance';
      case OperationType.stopInstance:
        return 'StopInstance';
      case OperationType.startInstance:
        return 'StartInstance';
      case OperationType.rebootInstance:
        return 'RebootInstance';
      case OperationType.openInstancePublicPorts:
        return 'OpenInstancePublicPorts';
      case OperationType.putInstancePublicPorts:
        return 'PutInstancePublicPorts';
      case OperationType.closeInstancePublicPorts:
        return 'CloseInstancePublicPorts';
      case OperationType.allocateStaticIp:
        return 'AllocateStaticIp';
      case OperationType.releaseStaticIp:
        return 'ReleaseStaticIp';
      case OperationType.attachStaticIp:
        return 'AttachStaticIp';
      case OperationType.detachStaticIp:
        return 'DetachStaticIp';
      case OperationType.updateDomainEntry:
        return 'UpdateDomainEntry';
      case OperationType.deleteDomainEntry:
        return 'DeleteDomainEntry';
      case OperationType.createDomain:
        return 'CreateDomain';
      case OperationType.deleteDomain:
        return 'DeleteDomain';
      case OperationType.createInstanceSnapshot:
        return 'CreateInstanceSnapshot';
      case OperationType.deleteInstanceSnapshot:
        return 'DeleteInstanceSnapshot';
      case OperationType.createInstancesFromSnapshot:
        return 'CreateInstancesFromSnapshot';
      case OperationType.createLoadBalancer:
        return 'CreateLoadBalancer';
      case OperationType.deleteLoadBalancer:
        return 'DeleteLoadBalancer';
      case OperationType.attachInstancesToLoadBalancer:
        return 'AttachInstancesToLoadBalancer';
      case OperationType.detachInstancesFromLoadBalancer:
        return 'DetachInstancesFromLoadBalancer';
      case OperationType.updateLoadBalancerAttribute:
        return 'UpdateLoadBalancerAttribute';
      case OperationType.createLoadBalancerTlsCertificate:
        return 'CreateLoadBalancerTlsCertificate';
      case OperationType.deleteLoadBalancerTlsCertificate:
        return 'DeleteLoadBalancerTlsCertificate';
      case OperationType.attachLoadBalancerTlsCertificate:
        return 'AttachLoadBalancerTlsCertificate';
      case OperationType.createDisk:
        return 'CreateDisk';
      case OperationType.deleteDisk:
        return 'DeleteDisk';
      case OperationType.attachDisk:
        return 'AttachDisk';
      case OperationType.detachDisk:
        return 'DetachDisk';
      case OperationType.createDiskSnapshot:
        return 'CreateDiskSnapshot';
      case OperationType.deleteDiskSnapshot:
        return 'DeleteDiskSnapshot';
      case OperationType.createDiskFromSnapshot:
        return 'CreateDiskFromSnapshot';
      case OperationType.createRelationalDatabase:
        return 'CreateRelationalDatabase';
      case OperationType.updateRelationalDatabase:
        return 'UpdateRelationalDatabase';
      case OperationType.deleteRelationalDatabase:
        return 'DeleteRelationalDatabase';
      case OperationType.createRelationalDatabaseFromSnapshot:
        return 'CreateRelationalDatabaseFromSnapshot';
      case OperationType.createRelationalDatabaseSnapshot:
        return 'CreateRelationalDatabaseSnapshot';
      case OperationType.deleteRelationalDatabaseSnapshot:
        return 'DeleteRelationalDatabaseSnapshot';
      case OperationType.updateRelationalDatabaseParameters:
        return 'UpdateRelationalDatabaseParameters';
      case OperationType.startRelationalDatabase:
        return 'StartRelationalDatabase';
      case OperationType.rebootRelationalDatabase:
        return 'RebootRelationalDatabase';
      case OperationType.stopRelationalDatabase:
        return 'StopRelationalDatabase';
      case OperationType.enableAddOn:
        return 'EnableAddOn';
      case OperationType.disableAddOn:
        return 'DisableAddOn';
      case OperationType.putAlarm:
        return 'PutAlarm';
      case OperationType.getAlarms:
        return 'GetAlarms';
      case OperationType.deleteAlarm:
        return 'DeleteAlarm';
      case OperationType.testAlarm:
        return 'TestAlarm';
      case OperationType.createContactMethod:
        return 'CreateContactMethod';
      case OperationType.getContactMethods:
        return 'GetContactMethods';
      case OperationType.sendContactMethodVerification:
        return 'SendContactMethodVerification';
      case OperationType.deleteContactMethod:
        return 'DeleteContactMethod';
      case OperationType.createDistribution:
        return 'CreateDistribution';
      case OperationType.updateDistribution:
        return 'UpdateDistribution';
      case OperationType.deleteDistribution:
        return 'DeleteDistribution';
      case OperationType.resetDistributionCache:
        return 'ResetDistributionCache';
      case OperationType.attachCertificateToDistribution:
        return 'AttachCertificateToDistribution';
      case OperationType.detachCertificateFromDistribution:
        return 'DetachCertificateFromDistribution';
      case OperationType.updateDistributionBundle:
        return 'UpdateDistributionBundle';
      case OperationType.setIpAddressType:
        return 'SetIpAddressType';
      case OperationType.createCertificate:
        return 'CreateCertificate';
      case OperationType.deleteCertificate:
        return 'DeleteCertificate';
      case OperationType.createContainerService:
        return 'CreateContainerService';
      case OperationType.updateContainerService:
        return 'UpdateContainerService';
      case OperationType.deleteContainerService:
        return 'DeleteContainerService';
      case OperationType.createContainerServiceDeployment:
        return 'CreateContainerServiceDeployment';
      case OperationType.createContainerServiceRegistryLogin:
        return 'CreateContainerServiceRegistryLogin';
      case OperationType.registerContainerImage:
        return 'RegisterContainerImage';
      case OperationType.deleteContainerImage:
        return 'DeleteContainerImage';
      case OperationType.createBucket:
        return 'CreateBucket';
      case OperationType.deleteBucket:
        return 'DeleteBucket';
      case OperationType.createBucketAccessKey:
        return 'CreateBucketAccessKey';
      case OperationType.deleteBucketAccessKey:
        return 'DeleteBucketAccessKey';
      case OperationType.updateBucketBundle:
        return 'UpdateBucketBundle';
      case OperationType.updateBucket:
        return 'UpdateBucket';
      case OperationType.setResourceAccessForBucket:
        return 'SetResourceAccessForBucket';
      case OperationType.updateInstanceMetadataOptions:
        return 'UpdateInstanceMetadataOptions';
      case OperationType.startGUISession:
        return 'StartGUISession';
      case OperationType.stopGUISession:
        return 'StopGUISession';
      case OperationType.setupInstanceHttps:
        return 'SetupInstanceHttps';
    }
  }
}

extension OperationTypeFromString on String {
  OperationType toOperationType() {
    switch (this) {
      case 'DeleteKnownHostKeys':
        return OperationType.deleteKnownHostKeys;
      case 'DeleteInstance':
        return OperationType.deleteInstance;
      case 'CreateInstance':
        return OperationType.createInstance;
      case 'StopInstance':
        return OperationType.stopInstance;
      case 'StartInstance':
        return OperationType.startInstance;
      case 'RebootInstance':
        return OperationType.rebootInstance;
      case 'OpenInstancePublicPorts':
        return OperationType.openInstancePublicPorts;
      case 'PutInstancePublicPorts':
        return OperationType.putInstancePublicPorts;
      case 'CloseInstancePublicPorts':
        return OperationType.closeInstancePublicPorts;
      case 'AllocateStaticIp':
        return OperationType.allocateStaticIp;
      case 'ReleaseStaticIp':
        return OperationType.releaseStaticIp;
      case 'AttachStaticIp':
        return OperationType.attachStaticIp;
      case 'DetachStaticIp':
        return OperationType.detachStaticIp;
      case 'UpdateDomainEntry':
        return OperationType.updateDomainEntry;
      case 'DeleteDomainEntry':
        return OperationType.deleteDomainEntry;
      case 'CreateDomain':
        return OperationType.createDomain;
      case 'DeleteDomain':
        return OperationType.deleteDomain;
      case 'CreateInstanceSnapshot':
        return OperationType.createInstanceSnapshot;
      case 'DeleteInstanceSnapshot':
        return OperationType.deleteInstanceSnapshot;
      case 'CreateInstancesFromSnapshot':
        return OperationType.createInstancesFromSnapshot;
      case 'CreateLoadBalancer':
        return OperationType.createLoadBalancer;
      case 'DeleteLoadBalancer':
        return OperationType.deleteLoadBalancer;
      case 'AttachInstancesToLoadBalancer':
        return OperationType.attachInstancesToLoadBalancer;
      case 'DetachInstancesFromLoadBalancer':
        return OperationType.detachInstancesFromLoadBalancer;
      case 'UpdateLoadBalancerAttribute':
        return OperationType.updateLoadBalancerAttribute;
      case 'CreateLoadBalancerTlsCertificate':
        return OperationType.createLoadBalancerTlsCertificate;
      case 'DeleteLoadBalancerTlsCertificate':
        return OperationType.deleteLoadBalancerTlsCertificate;
      case 'AttachLoadBalancerTlsCertificate':
        return OperationType.attachLoadBalancerTlsCertificate;
      case 'CreateDisk':
        return OperationType.createDisk;
      case 'DeleteDisk':
        return OperationType.deleteDisk;
      case 'AttachDisk':
        return OperationType.attachDisk;
      case 'DetachDisk':
        return OperationType.detachDisk;
      case 'CreateDiskSnapshot':
        return OperationType.createDiskSnapshot;
      case 'DeleteDiskSnapshot':
        return OperationType.deleteDiskSnapshot;
      case 'CreateDiskFromSnapshot':
        return OperationType.createDiskFromSnapshot;
      case 'CreateRelationalDatabase':
        return OperationType.createRelationalDatabase;
      case 'UpdateRelationalDatabase':
        return OperationType.updateRelationalDatabase;
      case 'DeleteRelationalDatabase':
        return OperationType.deleteRelationalDatabase;
      case 'CreateRelationalDatabaseFromSnapshot':
        return OperationType.createRelationalDatabaseFromSnapshot;
      case 'CreateRelationalDatabaseSnapshot':
        return OperationType.createRelationalDatabaseSnapshot;
      case 'DeleteRelationalDatabaseSnapshot':
        return OperationType.deleteRelationalDatabaseSnapshot;
      case 'UpdateRelationalDatabaseParameters':
        return OperationType.updateRelationalDatabaseParameters;
      case 'StartRelationalDatabase':
        return OperationType.startRelationalDatabase;
      case 'RebootRelationalDatabase':
        return OperationType.rebootRelationalDatabase;
      case 'StopRelationalDatabase':
        return OperationType.stopRelationalDatabase;
      case 'EnableAddOn':
        return OperationType.enableAddOn;
      case 'DisableAddOn':
        return OperationType.disableAddOn;
      case 'PutAlarm':
        return OperationType.putAlarm;
      case 'GetAlarms':
        return OperationType.getAlarms;
      case 'DeleteAlarm':
        return OperationType.deleteAlarm;
      case 'TestAlarm':
        return OperationType.testAlarm;
      case 'CreateContactMethod':
        return OperationType.createContactMethod;
      case 'GetContactMethods':
        return OperationType.getContactMethods;
      case 'SendContactMethodVerification':
        return OperationType.sendContactMethodVerification;
      case 'DeleteContactMethod':
        return OperationType.deleteContactMethod;
      case 'CreateDistribution':
        return OperationType.createDistribution;
      case 'UpdateDistribution':
        return OperationType.updateDistribution;
      case 'DeleteDistribution':
        return OperationType.deleteDistribution;
      case 'ResetDistributionCache':
        return OperationType.resetDistributionCache;
      case 'AttachCertificateToDistribution':
        return OperationType.attachCertificateToDistribution;
      case 'DetachCertificateFromDistribution':
        return OperationType.detachCertificateFromDistribution;
      case 'UpdateDistributionBundle':
        return OperationType.updateDistributionBundle;
      case 'SetIpAddressType':
        return OperationType.setIpAddressType;
      case 'CreateCertificate':
        return OperationType.createCertificate;
      case 'DeleteCertificate':
        return OperationType.deleteCertificate;
      case 'CreateContainerService':
        return OperationType.createContainerService;
      case 'UpdateContainerService':
        return OperationType.updateContainerService;
      case 'DeleteContainerService':
        return OperationType.deleteContainerService;
      case 'CreateContainerServiceDeployment':
        return OperationType.createContainerServiceDeployment;
      case 'CreateContainerServiceRegistryLogin':
        return OperationType.createContainerServiceRegistryLogin;
      case 'RegisterContainerImage':
        return OperationType.registerContainerImage;
      case 'DeleteContainerImage':
        return OperationType.deleteContainerImage;
      case 'CreateBucket':
        return OperationType.createBucket;
      case 'DeleteBucket':
        return OperationType.deleteBucket;
      case 'CreateBucketAccessKey':
        return OperationType.createBucketAccessKey;
      case 'DeleteBucketAccessKey':
        return OperationType.deleteBucketAccessKey;
      case 'UpdateBucketBundle':
        return OperationType.updateBucketBundle;
      case 'UpdateBucket':
        return OperationType.updateBucket;
      case 'SetResourceAccessForBucket':
        return OperationType.setResourceAccessForBucket;
      case 'UpdateInstanceMetadataOptions':
        return OperationType.updateInstanceMetadataOptions;
      case 'StartGUISession':
        return OperationType.startGUISession;
      case 'StopGUISession':
        return OperationType.stopGUISession;
      case 'SetupInstanceHttps':
        return OperationType.setupInstanceHttps;
    }
    throw Exception('$this is not known in enum OperationType');
  }
}

/// Describes the origin resource of an Amazon Lightsail content delivery
/// network (CDN) distribution.
///
/// An origin can be a Lightsail instance, bucket, or load balancer. A
/// distribution pulls content from an origin, caches it, and serves it to
/// viewers via a worldwide network of edge servers.
class Origin {
  /// The name of the origin resource.
  final String? name;

  /// The protocol that your Amazon Lightsail distribution uses when establishing
  /// a connection with your origin to pull content.
  final OriginProtocolPolicyEnum? protocolPolicy;

  /// The AWS Region name of the origin resource.
  final RegionName? regionName;

  /// The resource type of the origin resource (<i>Instance</i>).
  final ResourceType? resourceType;

  /// The amount of time, in seconds, that the distribution waits for a response
  /// after forwarding a request to the origin. The minimum timeout is 1 second,
  /// the maximum is 60 seconds, and the default (if you don't specify otherwise)
  /// is 30 seconds.
  final int? responseTimeout;

  Origin({
    this.name,
    this.protocolPolicy,
    this.regionName,
    this.resourceType,
    this.responseTimeout,
  });

  factory Origin.fromJson(Map<String, dynamic> json) {
    return Origin(
      name: json['name'] as String?,
      protocolPolicy:
          (json['protocolPolicy'] as String?)?.toOriginProtocolPolicyEnum(),
      regionName: (json['regionName'] as String?)?.toRegionName(),
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      responseTimeout: json['responseTimeout'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final protocolPolicy = this.protocolPolicy;
    final regionName = this.regionName;
    final resourceType = this.resourceType;
    final responseTimeout = this.responseTimeout;
    return {
      if (name != null) 'name': name,
      if (protocolPolicy != null) 'protocolPolicy': protocolPolicy.toValue(),
      if (regionName != null) 'regionName': regionName.toValue(),
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (responseTimeout != null) 'responseTimeout': responseTimeout,
    };
  }
}

enum OriginProtocolPolicyEnum {
  httpOnly,
  httpsOnly,
}

extension OriginProtocolPolicyEnumValueExtension on OriginProtocolPolicyEnum {
  String toValue() {
    switch (this) {
      case OriginProtocolPolicyEnum.httpOnly:
        return 'http-only';
      case OriginProtocolPolicyEnum.httpsOnly:
        return 'https-only';
    }
  }
}

extension OriginProtocolPolicyEnumFromString on String {
  OriginProtocolPolicyEnum toOriginProtocolPolicyEnum() {
    switch (this) {
      case 'http-only':
        return OriginProtocolPolicyEnum.httpOnly;
      case 'https-only':
        return OriginProtocolPolicyEnum.httpsOnly;
    }
    throw Exception('$this is not known in enum OriginProtocolPolicyEnum');
  }
}

/// The password data for the Windows Server-based instance, including the
/// ciphertext and the key pair name.
class PasswordData {
  /// The encrypted password. Ciphertext will be an empty string if access to your
  /// new instance is not ready yet. When you create an instance, it can take up
  /// to 15 minutes for the instance to be ready.
  /// <note>
  /// If you use the default key pair (<code>LightsailDefaultKeyPair</code>), the
  /// decrypted password will be available in the password field.
  ///
  /// If you are using a custom key pair, you need to use your own means of
  /// decryption.
  ///
  /// If you change the Administrator password on the instance, Lightsail will
  /// continue to return the original ciphertext value. When accessing the
  /// instance using RDP, you need to manually enter the Administrator password
  /// after changing it from the default.
  /// </note>
  final String? ciphertext;

  /// The name of the key pair that you used when creating your instance. If no
  /// key pair name was specified when creating the instance, Lightsail uses the
  /// default key pair (<code>LightsailDefaultKeyPair</code>).
  ///
  /// If you are using a custom key pair, you need to use your own means of
  /// decrypting your password using the <code>ciphertext</code>. Lightsail
  /// creates the ciphertext by encrypting your password with the public key part
  /// of this key pair.
  final String? keyPairName;

  PasswordData({
    this.ciphertext,
    this.keyPairName,
  });

  factory PasswordData.fromJson(Map<String, dynamic> json) {
    return PasswordData(
      ciphertext: json['ciphertext'] as String?,
      keyPairName: json['keyPairName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ciphertext = this.ciphertext;
    final keyPairName = this.keyPairName;
    return {
      if (ciphertext != null) 'ciphertext': ciphertext,
      if (keyPairName != null) 'keyPairName': keyPairName,
    };
  }
}

class PeerVpcResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final Operation? operation;

  PeerVpcResult({
    this.operation,
  });

  factory PeerVpcResult.fromJson(Map<String, dynamic> json) {
    return PeerVpcResult(
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    return {
      if (operation != null) 'operation': operation,
    };
  }
}

/// Describes a pending database maintenance action.
class PendingMaintenanceAction {
  /// The type of pending database maintenance action.
  final String? action;

  /// The effective date of the pending database maintenance action.
  final DateTime? currentApplyDate;

  /// Additional detail about the pending database maintenance action.
  final String? description;

  PendingMaintenanceAction({
    this.action,
    this.currentApplyDate,
    this.description,
  });

  factory PendingMaintenanceAction.fromJson(Map<String, dynamic> json) {
    return PendingMaintenanceAction(
      action: json['action'] as String?,
      currentApplyDate: timeStampFromJson(json['currentApplyDate']),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final currentApplyDate = this.currentApplyDate;
    final description = this.description;
    return {
      if (action != null) 'action': action,
      if (currentApplyDate != null)
        'currentApplyDate': unixTimestampToJson(currentApplyDate),
      if (description != null) 'description': description,
    };
  }
}

/// Describes a pending database value modification.
class PendingModifiedRelationalDatabaseValues {
  /// A Boolean value indicating whether automated backup retention is enabled.
  final bool? backupRetentionEnabled;

  /// The database engine version.
  final String? engineVersion;

  /// The password for the master user of the database.
  final String? masterUserPassword;

  PendingModifiedRelationalDatabaseValues({
    this.backupRetentionEnabled,
    this.engineVersion,
    this.masterUserPassword,
  });

  factory PendingModifiedRelationalDatabaseValues.fromJson(
      Map<String, dynamic> json) {
    return PendingModifiedRelationalDatabaseValues(
      backupRetentionEnabled: json['backupRetentionEnabled'] as bool?,
      engineVersion: json['engineVersion'] as String?,
      masterUserPassword: json['masterUserPassword'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupRetentionEnabled = this.backupRetentionEnabled;
    final engineVersion = this.engineVersion;
    final masterUserPassword = this.masterUserPassword;
    return {
      if (backupRetentionEnabled != null)
        'backupRetentionEnabled': backupRetentionEnabled,
      if (engineVersion != null) 'engineVersion': engineVersion,
      if (masterUserPassword != null) 'masterUserPassword': masterUserPassword,
    };
  }
}

enum PortAccessType {
  public,
  private,
}

extension PortAccessTypeValueExtension on PortAccessType {
  String toValue() {
    switch (this) {
      case PortAccessType.public:
        return 'Public';
      case PortAccessType.private:
        return 'Private';
    }
  }
}

extension PortAccessTypeFromString on String {
  PortAccessType toPortAccessType() {
    switch (this) {
      case 'Public':
        return PortAccessType.public;
      case 'Private':
        return PortAccessType.private;
    }
    throw Exception('$this is not known in enum PortAccessType');
  }
}

/// Describes ports to open on an instance, the IP addresses allowed to connect
/// to the instance through the ports, and the protocol.
class PortInfo {
  /// An alias that defines access for a preconfigured range of IP addresses.
  ///
  /// The only alias currently supported is <code>lightsail-connect</code>, which
  /// allows IP addresses of the browser-based RDP/SSH client in the Lightsail
  /// console to connect to your instance.
  final List<String>? cidrListAliases;

  /// The IPv4 address, or range of IPv4 addresses (in CIDR notation) that are
  /// allowed to connect to an instance through the ports, and the protocol.
  /// <note>
  /// The <code>ipv6Cidrs</code> parameter lists the IPv6 addresses that are
  /// allowed to connect to an instance.
  /// </note>
  /// Examples:
  ///
  /// <ul>
  /// <li>
  /// To allow the IP address <code>192.0.2.44</code>, specify
  /// <code>192.0.2.44</code> or <code>192.0.2.44/32</code>.
  /// </li>
  /// <li>
  /// To allow the IP addresses <code>192.0.2.0</code> to
  /// <code>192.0.2.255</code>, specify <code>192.0.2.0/24</code>.
  /// </li>
  /// </ul>
  /// For more information about CIDR block notation, see <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation">Classless
  /// Inter-Domain Routing</a> on <i>Wikipedia</i>.
  final List<String>? cidrs;

  /// The first port in a range of open ports on an instance.
  ///
  /// Allowed ports:
  ///
  /// <ul>
  /// <li>
  /// TCP and UDP - <code>0</code> to <code>65535</code>
  /// </li>
  /// <li>
  /// ICMP - The ICMP type for IPv4 addresses. For example, specify <code>8</code>
  /// as the <code>fromPort</code> (ICMP type), and <code>-1</code> as the
  /// <code>toPort</code> (ICMP code), to enable ICMP Ping. For more information,
  /// see <a
  /// href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control
  /// Messages</a> on <i>Wikipedia</i>.
  /// </li>
  /// <li>
  /// ICMPv6 - The ICMP type for IPv6 addresses. For example, specify
  /// <code>128</code> as the <code>fromPort</code> (ICMPv6 type), and
  /// <code>0</code> as <code>toPort</code> (ICMPv6 code). For more information,
  /// see <a
  /// href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol_for_IPv6">Internet
  /// Control Message Protocol for IPv6</a>.
  /// </li>
  /// </ul>
  final int? fromPort;

  /// The IPv6 address, or range of IPv6 addresses (in CIDR notation) that are
  /// allowed to connect to an instance through the ports, and the protocol. Only
  /// devices with an IPv6 address can connect to an instance through IPv6;
  /// otherwise, IPv4 should be used.
  /// <note>
  /// The <code>cidrs</code> parameter lists the IPv4 addresses that are allowed
  /// to connect to an instance.
  /// </note>
  /// For more information about CIDR block notation, see <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation">Classless
  /// Inter-Domain Routing</a> on <i>Wikipedia</i>.
  final List<String>? ipv6Cidrs;

  /// The IP protocol name.
  ///
  /// The name can be one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>tcp</code> - Transmission Control Protocol (TCP) provides reliable,
  /// ordered, and error-checked delivery of streamed data between applications
  /// running on hosts communicating by an IP network. If you have an application
  /// that doesn't require reliable data stream service, use UDP instead.
  /// </li>
  /// <li>
  /// <code>all</code> - All transport layer protocol types. For more general
  /// information, see <a
  /// href="https://en.wikipedia.org/wiki/Transport_layer">Transport layer</a> on
  /// <i>Wikipedia</i>.
  /// </li>
  /// <li>
  /// <code>udp</code> - With User Datagram Protocol (UDP), computer applications
  /// can send messages (or datagrams) to other hosts on an Internet Protocol (IP)
  /// network. Prior communications are not required to set up transmission
  /// channels or data paths. Applications that don't require reliable data stream
  /// service can use UDP, which provides a connectionless datagram service that
  /// emphasizes reduced latency over reliability. If you do require reliable data
  /// stream service, use TCP instead.
  /// </li>
  /// <li>
  /// <code>icmp</code> - Internet Control Message Protocol (ICMP) is used to send
  /// error messages and operational information indicating success or failure
  /// when communicating with an instance. For example, an error is indicated when
  /// an instance could not be reached. When you specify <code>icmp</code> as the
  /// <code>protocol</code>, you must specify the ICMP type using the
  /// <code>fromPort</code> parameter, and ICMP code using the <code>toPort</code>
  /// parameter.
  /// </li>
  /// <li>
  /// <code>icmp6</code> - Internet Control Message Protocol (ICMP) for IPv6. When
  /// you specify <code>icmp6</code> as the <code>protocol</code>, you must
  /// specify the ICMP type using the <code>fromPort</code> parameter, and ICMP
  /// code using the <code>toPort</code> parameter.
  /// </li>
  /// </ul>
  final NetworkProtocol? protocol;

  /// The last port in a range of open ports on an instance.
  ///
  /// Allowed ports:
  ///
  /// <ul>
  /// <li>
  /// TCP and UDP - <code>0</code> to <code>65535</code>
  /// </li>
  /// <li>
  /// ICMP - The ICMP code for IPv4 addresses. For example, specify <code>8</code>
  /// as the <code>fromPort</code> (ICMP type), and <code>-1</code> as the
  /// <code>toPort</code> (ICMP code), to enable ICMP Ping. For more information,
  /// see <a
  /// href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control
  /// Messages</a> on <i>Wikipedia</i>.
  /// </li>
  /// <li>
  /// ICMPv6 - The ICMP code for IPv6 addresses. For example, specify
  /// <code>128</code> as the <code>fromPort</code> (ICMPv6 type), and
  /// <code>0</code> as <code>toPort</code> (ICMPv6 code). For more information,
  /// see <a
  /// href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol_for_IPv6">Internet
  /// Control Message Protocol for IPv6</a>.
  /// </li>
  /// </ul>
  final int? toPort;

  PortInfo({
    this.cidrListAliases,
    this.cidrs,
    this.fromPort,
    this.ipv6Cidrs,
    this.protocol,
    this.toPort,
  });

  Map<String, dynamic> toJson() {
    final cidrListAliases = this.cidrListAliases;
    final cidrs = this.cidrs;
    final fromPort = this.fromPort;
    final ipv6Cidrs = this.ipv6Cidrs;
    final protocol = this.protocol;
    final toPort = this.toPort;
    return {
      if (cidrListAliases != null) 'cidrListAliases': cidrListAliases,
      if (cidrs != null) 'cidrs': cidrs,
      if (fromPort != null) 'fromPort': fromPort,
      if (ipv6Cidrs != null) 'ipv6Cidrs': ipv6Cidrs,
      if (protocol != null) 'protocol': protocol.toValue(),
      if (toPort != null) 'toPort': toPort,
    };
  }
}

enum PortInfoSourceType {
  $default,
  instance,
  none,
  closed,
}

extension PortInfoSourceTypeValueExtension on PortInfoSourceType {
  String toValue() {
    switch (this) {
      case PortInfoSourceType.$default:
        return 'DEFAULT';
      case PortInfoSourceType.instance:
        return 'INSTANCE';
      case PortInfoSourceType.none:
        return 'NONE';
      case PortInfoSourceType.closed:
        return 'CLOSED';
    }
  }
}

extension PortInfoSourceTypeFromString on String {
  PortInfoSourceType toPortInfoSourceType() {
    switch (this) {
      case 'DEFAULT':
        return PortInfoSourceType.$default;
      case 'INSTANCE':
        return PortInfoSourceType.instance;
      case 'NONE':
        return PortInfoSourceType.none;
      case 'CLOSED':
        return PortInfoSourceType.closed;
    }
    throw Exception('$this is not known in enum PortInfoSourceType');
  }
}

enum PortState {
  open,
  closed,
}

extension PortStateValueExtension on PortState {
  String toValue() {
    switch (this) {
      case PortState.open:
        return 'open';
      case PortState.closed:
        return 'closed';
    }
  }
}

extension PortStateFromString on String {
  PortState toPortState() {
    switch (this) {
      case 'open':
        return PortState.open;
      case 'closed':
        return PortState.closed;
    }
    throw Exception('$this is not known in enum PortState');
  }
}

enum PricingUnit {
  gb,
  hrs,
  gbMo,
  bundles,
  queries,
}

extension PricingUnitValueExtension on PricingUnit {
  String toValue() {
    switch (this) {
      case PricingUnit.gb:
        return 'GB';
      case PricingUnit.hrs:
        return 'Hrs';
      case PricingUnit.gbMo:
        return 'GB-Mo';
      case PricingUnit.bundles:
        return 'Bundles';
      case PricingUnit.queries:
        return 'Queries';
    }
  }
}

extension PricingUnitFromString on String {
  PricingUnit toPricingUnit() {
    switch (this) {
      case 'GB':
        return PricingUnit.gb;
      case 'Hrs':
        return PricingUnit.hrs;
      case 'GB-Mo':
        return PricingUnit.gbMo;
      case 'Bundles':
        return PricingUnit.bundles;
      case 'Queries':
        return PricingUnit.queries;
    }
    throw Exception('$this is not known in enum PricingUnit');
  }
}

/// Describes the configuration for an Amazon Lightsail container service to
/// access private container image repositories, such as Amazon Elastic
/// Container Registry (Amazon ECR) private repositories.
///
/// For more information, see <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-service-ecr-private-repo-access">Configuring
/// access to an Amazon ECR private repository for an Amazon Lightsail container
/// service</a> in the <i>Amazon Lightsail Developer Guide</i>.
class PrivateRegistryAccess {
  /// An object that describes the activation status of the role that you can use
  /// to grant a Lightsail container service access to Amazon ECR private
  /// repositories. If the role is activated, the Amazon Resource Name (ARN) of
  /// the role is also listed.
  final ContainerServiceECRImagePullerRole? ecrImagePullerRole;

  PrivateRegistryAccess({
    this.ecrImagePullerRole,
  });

  factory PrivateRegistryAccess.fromJson(Map<String, dynamic> json) {
    return PrivateRegistryAccess(
      ecrImagePullerRole: json['ecrImagePullerRole'] != null
          ? ContainerServiceECRImagePullerRole.fromJson(
              json['ecrImagePullerRole'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ecrImagePullerRole = this.ecrImagePullerRole;
    return {
      if (ecrImagePullerRole != null) 'ecrImagePullerRole': ecrImagePullerRole,
    };
  }
}

/// Describes a request to configure an Amazon Lightsail container service to
/// access private container image repositories, such as Amazon Elastic
/// Container Registry (Amazon ECR) private repositories.
///
/// For more information, see <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-service-ecr-private-repo-access">Configuring
/// access to an Amazon ECR private repository for an Amazon Lightsail container
/// service</a> in the <i>Amazon Lightsail Developer Guide</i>.
class PrivateRegistryAccessRequest {
  /// An object to describe a request to activate or deactivate the role that you
  /// can use to grant an Amazon Lightsail container service access to Amazon
  /// Elastic Container Registry (Amazon ECR) private repositories.
  final ContainerServiceECRImagePullerRoleRequest? ecrImagePullerRole;

  PrivateRegistryAccessRequest({
    this.ecrImagePullerRole,
  });

  Map<String, dynamic> toJson() {
    final ecrImagePullerRole = this.ecrImagePullerRole;
    return {
      if (ecrImagePullerRole != null) 'ecrImagePullerRole': ecrImagePullerRole,
    };
  }
}

class PutAlarmResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  PutAlarmResult({
    this.operations,
  });

  factory PutAlarmResult.fromJson(Map<String, dynamic> json) {
    return PutAlarmResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class PutInstancePublicPortsResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final Operation? operation;

  PutInstancePublicPortsResult({
    this.operation,
  });

  factory PutInstancePublicPortsResult.fromJson(Map<String, dynamic> json) {
    return PutInstancePublicPortsResult(
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    return {
      if (operation != null) 'operation': operation,
    };
  }
}

/// Describes the query string parameters that an Amazon Lightsail content
/// delivery network (CDN) distribution to bases caching on.
///
/// For the query strings that you specify, your distribution caches separate
/// versions of the specified content based on the query string values in viewer
/// requests.
class QueryStringObject {
  /// Indicates whether the distribution forwards and caches based on query
  /// strings.
  final bool? option;

  /// The specific query strings that the distribution forwards to the origin.
  ///
  /// Your distribution will cache content based on the specified query strings.
  ///
  /// If the <code>option</code> parameter is true, then your distribution
  /// forwards all query strings, regardless of what you specify using the
  /// <code>queryStringsAllowList</code> parameter.
  final List<String>? queryStringsAllowList;

  QueryStringObject({
    this.option,
    this.queryStringsAllowList,
  });

  factory QueryStringObject.fromJson(Map<String, dynamic> json) {
    return QueryStringObject(
      option: json['option'] as bool?,
      queryStringsAllowList: (json['queryStringsAllowList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final option = this.option;
    final queryStringsAllowList = this.queryStringsAllowList;
    return {
      if (option != null) 'option': option,
      if (queryStringsAllowList != null)
        'queryStringsAllowList': queryStringsAllowList,
    };
  }
}

/// Describes the deletion state of an Amazon Route 53 hosted zone for a domain
/// that is being automatically delegated to an Amazon Lightsail DNS zone.
class R53HostedZoneDeletionState {
  /// The status code for the deletion state.
  ///
  /// Following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>SUCCEEDED</code> - The hosted zone was successfully deleted.
  /// </li>
  /// <li>
  /// <code>PENDING</code> - The hosted zone deletion is in progress.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - The hosted zone deletion failed.
  /// </li>
  /// <li>
  /// <code>STARTED</code> - The hosted zone deletion started.
  /// </li>
  /// </ul>
  final R53HostedZoneDeletionStateCode? code;

  /// The message that describes the reason for the status code.
  final String? message;

  R53HostedZoneDeletionState({
    this.code,
    this.message,
  });

  factory R53HostedZoneDeletionState.fromJson(Map<String, dynamic> json) {
    return R53HostedZoneDeletionState(
      code: (json['code'] as String?)?.toR53HostedZoneDeletionStateCode(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'code': code.toValue(),
      if (message != null) 'message': message,
    };
  }
}

enum R53HostedZoneDeletionStateCode {
  succeeded,
  pending,
  failed,
  started,
}

extension R53HostedZoneDeletionStateCodeValueExtension
    on R53HostedZoneDeletionStateCode {
  String toValue() {
    switch (this) {
      case R53HostedZoneDeletionStateCode.succeeded:
        return 'SUCCEEDED';
      case R53HostedZoneDeletionStateCode.pending:
        return 'PENDING';
      case R53HostedZoneDeletionStateCode.failed:
        return 'FAILED';
      case R53HostedZoneDeletionStateCode.started:
        return 'STARTED';
    }
  }
}

extension R53HostedZoneDeletionStateCodeFromString on String {
  R53HostedZoneDeletionStateCode toR53HostedZoneDeletionStateCode() {
    switch (this) {
      case 'SUCCEEDED':
        return R53HostedZoneDeletionStateCode.succeeded;
      case 'PENDING':
        return R53HostedZoneDeletionStateCode.pending;
      case 'FAILED':
        return R53HostedZoneDeletionStateCode.failed;
      case 'STARTED':
        return R53HostedZoneDeletionStateCode.started;
    }
    throw Exception(
        '$this is not known in enum R53HostedZoneDeletionStateCode');
  }
}

class RebootInstanceResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  RebootInstanceResult({
    this.operations,
  });

  factory RebootInstanceResult.fromJson(Map<String, dynamic> json) {
    return RebootInstanceResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class RebootRelationalDatabaseResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  RebootRelationalDatabaseResult({
    this.operations,
  });

  factory RebootRelationalDatabaseResult.fromJson(Map<String, dynamic> json) {
    return RebootRelationalDatabaseResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

enum RecordState {
  started,
  succeeded,
  failed,
}

extension RecordStateValueExtension on RecordState {
  String toValue() {
    switch (this) {
      case RecordState.started:
        return 'Started';
      case RecordState.succeeded:
        return 'Succeeded';
      case RecordState.failed:
        return 'Failed';
    }
  }
}

extension RecordStateFromString on String {
  RecordState toRecordState() {
    switch (this) {
      case 'Started':
        return RecordState.started;
      case 'Succeeded':
        return RecordState.succeeded;
      case 'Failed':
        return RecordState.failed;
    }
    throw Exception('$this is not known in enum RecordState');
  }
}

/// Describes the Amazon Web Services Region.
class Region {
  /// The Availability Zones. Follows the format <code>us-east-2a</code>
  /// (case-sensitive).
  final List<AvailabilityZone>? availabilityZones;

  /// The continent code (<code>NA</code>, meaning North America).
  final String? continentCode;

  /// The description of the Amazon Web Services Region (<code>This region is
  /// recommended to serve users in the eastern United States and eastern
  /// Canada</code>).
  final String? description;

  /// The display name (<code>Ohio</code>).
  final String? displayName;

  /// The region name (<code>us-east-2</code>).
  final RegionName? name;

  /// The Availability Zones for databases. Follows the format
  /// <code>us-east-2a</code> (case-sensitive).
  final List<AvailabilityZone>? relationalDatabaseAvailabilityZones;

  Region({
    this.availabilityZones,
    this.continentCode,
    this.description,
    this.displayName,
    this.name,
    this.relationalDatabaseAvailabilityZones,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      availabilityZones: (json['availabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => AvailabilityZone.fromJson(e as Map<String, dynamic>))
          .toList(),
      continentCode: json['continentCode'] as String?,
      description: json['description'] as String?,
      displayName: json['displayName'] as String?,
      name: (json['name'] as String?)?.toRegionName(),
      relationalDatabaseAvailabilityZones:
          (json['relationalDatabaseAvailabilityZones'] as List?)
              ?.whereNotNull()
              .map((e) => AvailabilityZone.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final continentCode = this.continentCode;
    final description = this.description;
    final displayName = this.displayName;
    final name = this.name;
    final relationalDatabaseAvailabilityZones =
        this.relationalDatabaseAvailabilityZones;
    return {
      if (availabilityZones != null) 'availabilityZones': availabilityZones,
      if (continentCode != null) 'continentCode': continentCode,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (name != null) 'name': name.toValue(),
      if (relationalDatabaseAvailabilityZones != null)
        'relationalDatabaseAvailabilityZones':
            relationalDatabaseAvailabilityZones,
    };
  }
}

enum RegionName {
  usEast_1,
  usEast_2,
  usWest_1,
  usWest_2,
  euWest_1,
  euWest_2,
  euWest_3,
  euCentral_1,
  caCentral_1,
  apSouth_1,
  apSoutheast_1,
  apSoutheast_2,
  apNortheast_1,
  apNortheast_2,
  euNorth_1,
}

extension RegionNameValueExtension on RegionName {
  String toValue() {
    switch (this) {
      case RegionName.usEast_1:
        return 'us-east-1';
      case RegionName.usEast_2:
        return 'us-east-2';
      case RegionName.usWest_1:
        return 'us-west-1';
      case RegionName.usWest_2:
        return 'us-west-2';
      case RegionName.euWest_1:
        return 'eu-west-1';
      case RegionName.euWest_2:
        return 'eu-west-2';
      case RegionName.euWest_3:
        return 'eu-west-3';
      case RegionName.euCentral_1:
        return 'eu-central-1';
      case RegionName.caCentral_1:
        return 'ca-central-1';
      case RegionName.apSouth_1:
        return 'ap-south-1';
      case RegionName.apSoutheast_1:
        return 'ap-southeast-1';
      case RegionName.apSoutheast_2:
        return 'ap-southeast-2';
      case RegionName.apNortheast_1:
        return 'ap-northeast-1';
      case RegionName.apNortheast_2:
        return 'ap-northeast-2';
      case RegionName.euNorth_1:
        return 'eu-north-1';
    }
  }
}

extension RegionNameFromString on String {
  RegionName toRegionName() {
    switch (this) {
      case 'us-east-1':
        return RegionName.usEast_1;
      case 'us-east-2':
        return RegionName.usEast_2;
      case 'us-west-1':
        return RegionName.usWest_1;
      case 'us-west-2':
        return RegionName.usWest_2;
      case 'eu-west-1':
        return RegionName.euWest_1;
      case 'eu-west-2':
        return RegionName.euWest_2;
      case 'eu-west-3':
        return RegionName.euWest_3;
      case 'eu-central-1':
        return RegionName.euCentral_1;
      case 'ca-central-1':
        return RegionName.caCentral_1;
      case 'ap-south-1':
        return RegionName.apSouth_1;
      case 'ap-southeast-1':
        return RegionName.apSoutheast_1;
      case 'ap-southeast-2':
        return RegionName.apSoutheast_2;
      case 'ap-northeast-1':
        return RegionName.apNortheast_1;
      case 'ap-northeast-2':
        return RegionName.apNortheast_2;
      case 'eu-north-1':
        return RegionName.euNorth_1;
    }
    throw Exception('$this is not known in enum RegionName');
  }
}

class RegisterContainerImageResult {
  /// An object that describes a container image that is registered to a Lightsail
  /// container service
  final ContainerImage? containerImage;

  RegisterContainerImageResult({
    this.containerImage,
  });

  factory RegisterContainerImageResult.fromJson(Map<String, dynamic> json) {
    return RegisterContainerImageResult(
      containerImage: json['containerImage'] != null
          ? ContainerImage.fromJson(
              json['containerImage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final containerImage = this.containerImage;
    return {
      if (containerImage != null) 'containerImage': containerImage,
    };
  }
}

/// Describes the delegation state of an Amazon Route 53 registered domain to
/// Amazon Lightsail.
///
/// When you delegate an Amazon Route 53 registered domain to Lightsail, you can
/// manage the DNS of the domain using a Lightsail DNS zone. You no longer use
/// the Route 53 hosted zone to manage the DNS of the domain. To delegate the
/// domain, Lightsail automatically updates the domain's name servers in
/// Route 53 to the name servers of the Lightsail DNS zone. Then, Lightsail
/// automatically deletes the Route 53 hosted zone for the domain.
///
/// All of the following conditions must be true for automatic domain delegation
/// to be successful:
///
/// <ul>
/// <li>
/// The registered domain must be in the same Amazon Web Services account as the
/// Lightsail account making the request.
/// </li>
/// <li>
/// The user or entity making the request must have permission to manage domains
/// in Route 53.
/// </li>
/// <li>
/// The Route 53 hosted zone for the domain must be empty. It cannot contain DNS
/// records other than start of authority (SOA) and name server records.
/// </li>
/// </ul>
/// If automatic domain delegation fails, or if you manage the DNS of your
/// domain using a service other than Route 53, then you must manually add the
/// Lightsail DNS zone name servers to your domain in order to delegate
/// management of its DNS to Lightsail. For more information, see <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/lightsail-how-to-create-dns-entry">Creating
/// a DNS zone to manage your domain’s records in Amazon Lightsail</a> in the
/// <i>Amazon Lightsail Developer Guide</i>.
class RegisteredDomainDelegationInfo {
  /// An object that describes the state of the name server records that are
  /// automatically added to the Route 53 domain by Lightsail.
  final NameServersUpdateState? nameServersUpdateState;

  /// Describes the deletion state of an Amazon Route 53 hosted zone for a domain
  /// that is being automatically delegated to an Amazon Lightsail DNS zone.
  final R53HostedZoneDeletionState? r53HostedZoneDeletionState;

  RegisteredDomainDelegationInfo({
    this.nameServersUpdateState,
    this.r53HostedZoneDeletionState,
  });

  factory RegisteredDomainDelegationInfo.fromJson(Map<String, dynamic> json) {
    return RegisteredDomainDelegationInfo(
      nameServersUpdateState: json['nameServersUpdateState'] != null
          ? NameServersUpdateState.fromJson(
              json['nameServersUpdateState'] as Map<String, dynamic>)
          : null,
      r53HostedZoneDeletionState: json['r53HostedZoneDeletionState'] != null
          ? R53HostedZoneDeletionState.fromJson(
              json['r53HostedZoneDeletionState'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nameServersUpdateState = this.nameServersUpdateState;
    final r53HostedZoneDeletionState = this.r53HostedZoneDeletionState;
    return {
      if (nameServersUpdateState != null)
        'nameServersUpdateState': nameServersUpdateState,
      if (r53HostedZoneDeletionState != null)
        'r53HostedZoneDeletionState': r53HostedZoneDeletionState,
    };
  }
}

/// Describes a database.
class RelationalDatabase {
  /// The Amazon Resource Name (ARN) of the database.
  final String? arn;

  /// A Boolean value indicating whether automated backup retention is enabled for
  /// the database.
  final bool? backupRetentionEnabled;

  /// The certificate associated with the database.
  final String? caCertificateIdentifier;

  /// The timestamp when the database was created. Formatted in Unix time.
  final DateTime? createdAt;

  /// The database software (for example, <code>MySQL</code>).
  final String? engine;

  /// The database engine version (for example, <code>5.7.23</code>).
  final String? engineVersion;

  /// Describes the hardware of the database.
  final RelationalDatabaseHardware? hardware;

  /// The latest point in time to which the database can be restored. Formatted in
  /// Unix time.
  final DateTime? latestRestorableTime;

  /// The Region name and Availability Zone where the database is located.
  final ResourceLocation? location;

  /// The name of the master database created when the Lightsail database resource
  /// is created.
  final String? masterDatabaseName;

  /// The master endpoint for the database.
  final RelationalDatabaseEndpoint? masterEndpoint;

  /// The master user name of the database.
  final String? masterUsername;

  /// The unique name of the database resource in Lightsail.
  final String? name;

  /// The status of parameter updates for the database.
  final String? parameterApplyStatus;

  /// Describes the pending maintenance actions for the database.
  final List<PendingMaintenanceAction>? pendingMaintenanceActions;

  /// Describes pending database value modifications.
  final PendingModifiedRelationalDatabaseValues? pendingModifiedValues;

  /// The daily time range during which automated backups are created for the
  /// database (for example, <code>16:00-16:30</code>).
  final String? preferredBackupWindow;

  /// The weekly time range during which system maintenance can occur on the
  /// database.
  ///
  /// In the format <code>ddd:hh24:mi-ddd:hh24:mi</code>. For example,
  /// <code>Tue:17:00-Tue:17:30</code>.
  final String? preferredMaintenanceWindow;

  /// A Boolean value indicating whether the database is publicly accessible.
  final bool? publiclyAccessible;

  /// The blueprint ID for the database. A blueprint describes the major engine
  /// version of a database.
  final String? relationalDatabaseBlueprintId;

  /// The bundle ID for the database. A bundle describes the performance
  /// specifications for your database.
  final String? relationalDatabaseBundleId;

  /// The Lightsail resource type for the database (for example,
  /// <code>RelationalDatabase</code>).
  final ResourceType? resourceType;

  /// Describes the secondary Availability Zone of a high availability database.
  ///
  /// The secondary database is used for failover support of a high availability
  /// database.
  final String? secondaryAvailabilityZone;

  /// Describes the current state of the database.
  final String? state;

  /// The support code for the database. Include this code in your email to
  /// support when you have questions about a database in Lightsail. This code
  /// enables our support team to look up your Lightsail information more easily.
  final String? supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags">Amazon
  /// Lightsail Developer Guide</a>.
  final List<Tag>? tags;

  RelationalDatabase({
    this.arn,
    this.backupRetentionEnabled,
    this.caCertificateIdentifier,
    this.createdAt,
    this.engine,
    this.engineVersion,
    this.hardware,
    this.latestRestorableTime,
    this.location,
    this.masterDatabaseName,
    this.masterEndpoint,
    this.masterUsername,
    this.name,
    this.parameterApplyStatus,
    this.pendingMaintenanceActions,
    this.pendingModifiedValues,
    this.preferredBackupWindow,
    this.preferredMaintenanceWindow,
    this.publiclyAccessible,
    this.relationalDatabaseBlueprintId,
    this.relationalDatabaseBundleId,
    this.resourceType,
    this.secondaryAvailabilityZone,
    this.state,
    this.supportCode,
    this.tags,
  });

  factory RelationalDatabase.fromJson(Map<String, dynamic> json) {
    return RelationalDatabase(
      arn: json['arn'] as String?,
      backupRetentionEnabled: json['backupRetentionEnabled'] as bool?,
      caCertificateIdentifier: json['caCertificateIdentifier'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      engine: json['engine'] as String?,
      engineVersion: json['engineVersion'] as String?,
      hardware: json['hardware'] != null
          ? RelationalDatabaseHardware.fromJson(
              json['hardware'] as Map<String, dynamic>)
          : null,
      latestRestorableTime: timeStampFromJson(json['latestRestorableTime']),
      location: json['location'] != null
          ? ResourceLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      masterDatabaseName: json['masterDatabaseName'] as String?,
      masterEndpoint: json['masterEndpoint'] != null
          ? RelationalDatabaseEndpoint.fromJson(
              json['masterEndpoint'] as Map<String, dynamic>)
          : null,
      masterUsername: json['masterUsername'] as String?,
      name: json['name'] as String?,
      parameterApplyStatus: json['parameterApplyStatus'] as String?,
      pendingMaintenanceActions: (json['pendingMaintenanceActions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              PendingMaintenanceAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      pendingModifiedValues: json['pendingModifiedValues'] != null
          ? PendingModifiedRelationalDatabaseValues.fromJson(
              json['pendingModifiedValues'] as Map<String, dynamic>)
          : null,
      preferredBackupWindow: json['preferredBackupWindow'] as String?,
      preferredMaintenanceWindow: json['preferredMaintenanceWindow'] as String?,
      publiclyAccessible: json['publiclyAccessible'] as bool?,
      relationalDatabaseBlueprintId:
          json['relationalDatabaseBlueprintId'] as String?,
      relationalDatabaseBundleId: json['relationalDatabaseBundleId'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      secondaryAvailabilityZone: json['secondaryAvailabilityZone'] as String?,
      state: json['state'] as String?,
      supportCode: json['supportCode'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final backupRetentionEnabled = this.backupRetentionEnabled;
    final caCertificateIdentifier = this.caCertificateIdentifier;
    final createdAt = this.createdAt;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    final hardware = this.hardware;
    final latestRestorableTime = this.latestRestorableTime;
    final location = this.location;
    final masterDatabaseName = this.masterDatabaseName;
    final masterEndpoint = this.masterEndpoint;
    final masterUsername = this.masterUsername;
    final name = this.name;
    final parameterApplyStatus = this.parameterApplyStatus;
    final pendingMaintenanceActions = this.pendingMaintenanceActions;
    final pendingModifiedValues = this.pendingModifiedValues;
    final preferredBackupWindow = this.preferredBackupWindow;
    final preferredMaintenanceWindow = this.preferredMaintenanceWindow;
    final publiclyAccessible = this.publiclyAccessible;
    final relationalDatabaseBlueprintId = this.relationalDatabaseBlueprintId;
    final relationalDatabaseBundleId = this.relationalDatabaseBundleId;
    final resourceType = this.resourceType;
    final secondaryAvailabilityZone = this.secondaryAvailabilityZone;
    final state = this.state;
    final supportCode = this.supportCode;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (backupRetentionEnabled != null)
        'backupRetentionEnabled': backupRetentionEnabled,
      if (caCertificateIdentifier != null)
        'caCertificateIdentifier': caCertificateIdentifier,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (engine != null) 'engine': engine,
      if (engineVersion != null) 'engineVersion': engineVersion,
      if (hardware != null) 'hardware': hardware,
      if (latestRestorableTime != null)
        'latestRestorableTime': unixTimestampToJson(latestRestorableTime),
      if (location != null) 'location': location,
      if (masterDatabaseName != null) 'masterDatabaseName': masterDatabaseName,
      if (masterEndpoint != null) 'masterEndpoint': masterEndpoint,
      if (masterUsername != null) 'masterUsername': masterUsername,
      if (name != null) 'name': name,
      if (parameterApplyStatus != null)
        'parameterApplyStatus': parameterApplyStatus,
      if (pendingMaintenanceActions != null)
        'pendingMaintenanceActions': pendingMaintenanceActions,
      if (pendingModifiedValues != null)
        'pendingModifiedValues': pendingModifiedValues,
      if (preferredBackupWindow != null)
        'preferredBackupWindow': preferredBackupWindow,
      if (preferredMaintenanceWindow != null)
        'preferredMaintenanceWindow': preferredMaintenanceWindow,
      if (publiclyAccessible != null) 'publiclyAccessible': publiclyAccessible,
      if (relationalDatabaseBlueprintId != null)
        'relationalDatabaseBlueprintId': relationalDatabaseBlueprintId,
      if (relationalDatabaseBundleId != null)
        'relationalDatabaseBundleId': relationalDatabaseBundleId,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (secondaryAvailabilityZone != null)
        'secondaryAvailabilityZone': secondaryAvailabilityZone,
      if (state != null) 'state': state,
      if (supportCode != null) 'supportCode': supportCode,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Describes a database image, or blueprint. A blueprint describes the major
/// engine version of a database.
class RelationalDatabaseBlueprint {
  /// The ID for the database blueprint.
  final String? blueprintId;

  /// The database software of the database blueprint (for example,
  /// <code>MySQL</code>).
  final RelationalDatabaseEngine? engine;

  /// The description of the database engine for the database blueprint.
  final String? engineDescription;

  /// The database engine version for the database blueprint (for example,
  /// <code>5.7.23</code>).
  final String? engineVersion;

  /// The description of the database engine version for the database blueprint.
  final String? engineVersionDescription;

  /// A Boolean value indicating whether the engine version is the default for the
  /// database blueprint.
  final bool? isEngineDefault;

  RelationalDatabaseBlueprint({
    this.blueprintId,
    this.engine,
    this.engineDescription,
    this.engineVersion,
    this.engineVersionDescription,
    this.isEngineDefault,
  });

  factory RelationalDatabaseBlueprint.fromJson(Map<String, dynamic> json) {
    return RelationalDatabaseBlueprint(
      blueprintId: json['blueprintId'] as String?,
      engine: (json['engine'] as String?)?.toRelationalDatabaseEngine(),
      engineDescription: json['engineDescription'] as String?,
      engineVersion: json['engineVersion'] as String?,
      engineVersionDescription: json['engineVersionDescription'] as String?,
      isEngineDefault: json['isEngineDefault'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final blueprintId = this.blueprintId;
    final engine = this.engine;
    final engineDescription = this.engineDescription;
    final engineVersion = this.engineVersion;
    final engineVersionDescription = this.engineVersionDescription;
    final isEngineDefault = this.isEngineDefault;
    return {
      if (blueprintId != null) 'blueprintId': blueprintId,
      if (engine != null) 'engine': engine.toValue(),
      if (engineDescription != null) 'engineDescription': engineDescription,
      if (engineVersion != null) 'engineVersion': engineVersion,
      if (engineVersionDescription != null)
        'engineVersionDescription': engineVersionDescription,
      if (isEngineDefault != null) 'isEngineDefault': isEngineDefault,
    };
  }
}

/// Describes a database bundle. A bundle describes the performance
/// specifications of the database.
class RelationalDatabaseBundle {
  /// The ID for the database bundle.
  final String? bundleId;

  /// The number of virtual CPUs (vCPUs) for the database bundle.
  final int? cpuCount;

  /// The size of the disk for the database bundle.
  final int? diskSizeInGb;

  /// A Boolean value indicating whether the database bundle is active.
  final bool? isActive;

  /// A Boolean value indicating whether the database bundle is encrypted.
  final bool? isEncrypted;

  /// The name for the database bundle.
  final String? name;

  /// The cost of the database bundle in US currency.
  final double? price;

  /// The amount of RAM in GB (for example, <code>2.0</code>) for the database
  /// bundle.
  final double? ramSizeInGb;

  /// The data transfer rate per month in GB for the database bundle.
  final int? transferPerMonthInGb;

  RelationalDatabaseBundle({
    this.bundleId,
    this.cpuCount,
    this.diskSizeInGb,
    this.isActive,
    this.isEncrypted,
    this.name,
    this.price,
    this.ramSizeInGb,
    this.transferPerMonthInGb,
  });

  factory RelationalDatabaseBundle.fromJson(Map<String, dynamic> json) {
    return RelationalDatabaseBundle(
      bundleId: json['bundleId'] as String?,
      cpuCount: json['cpuCount'] as int?,
      diskSizeInGb: json['diskSizeInGb'] as int?,
      isActive: json['isActive'] as bool?,
      isEncrypted: json['isEncrypted'] as bool?,
      name: json['name'] as String?,
      price: json['price'] as double?,
      ramSizeInGb: json['ramSizeInGb'] as double?,
      transferPerMonthInGb: json['transferPerMonthInGb'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bundleId = this.bundleId;
    final cpuCount = this.cpuCount;
    final diskSizeInGb = this.diskSizeInGb;
    final isActive = this.isActive;
    final isEncrypted = this.isEncrypted;
    final name = this.name;
    final price = this.price;
    final ramSizeInGb = this.ramSizeInGb;
    final transferPerMonthInGb = this.transferPerMonthInGb;
    return {
      if (bundleId != null) 'bundleId': bundleId,
      if (cpuCount != null) 'cpuCount': cpuCount,
      if (diskSizeInGb != null) 'diskSizeInGb': diskSizeInGb,
      if (isActive != null) 'isActive': isActive,
      if (isEncrypted != null) 'isEncrypted': isEncrypted,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (ramSizeInGb != null) 'ramSizeInGb': ramSizeInGb,
      if (transferPerMonthInGb != null)
        'transferPerMonthInGb': transferPerMonthInGb,
    };
  }
}

/// Describes an endpoint for a database.
class RelationalDatabaseEndpoint {
  /// Specifies the DNS address of the database.
  final String? address;

  /// Specifies the port that the database is listening on.
  final int? port;

  RelationalDatabaseEndpoint({
    this.address,
    this.port,
  });

  factory RelationalDatabaseEndpoint.fromJson(Map<String, dynamic> json) {
    return RelationalDatabaseEndpoint(
      address: json['address'] as String?,
      port: json['port'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final port = this.port;
    return {
      if (address != null) 'address': address,
      if (port != null) 'port': port,
    };
  }
}

enum RelationalDatabaseEngine {
  mysql,
}

extension RelationalDatabaseEngineValueExtension on RelationalDatabaseEngine {
  String toValue() {
    switch (this) {
      case RelationalDatabaseEngine.mysql:
        return 'mysql';
    }
  }
}

extension RelationalDatabaseEngineFromString on String {
  RelationalDatabaseEngine toRelationalDatabaseEngine() {
    switch (this) {
      case 'mysql':
        return RelationalDatabaseEngine.mysql;
    }
    throw Exception('$this is not known in enum RelationalDatabaseEngine');
  }
}

/// Describes an event for a database.
class RelationalDatabaseEvent {
  /// The timestamp when the database event was created.
  final DateTime? createdAt;

  /// The category that the database event belongs to.
  final List<String>? eventCategories;

  /// The message of the database event.
  final String? message;

  /// The database that the database event relates to.
  final String? resource;

  RelationalDatabaseEvent({
    this.createdAt,
    this.eventCategories,
    this.message,
    this.resource,
  });

  factory RelationalDatabaseEvent.fromJson(Map<String, dynamic> json) {
    return RelationalDatabaseEvent(
      createdAt: timeStampFromJson(json['createdAt']),
      eventCategories: (json['eventCategories'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      message: json['message'] as String?,
      resource: json['resource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final eventCategories = this.eventCategories;
    final message = this.message;
    final resource = this.resource;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (eventCategories != null) 'eventCategories': eventCategories,
      if (message != null) 'message': message,
      if (resource != null) 'resource': resource,
    };
  }
}

/// Describes the hardware of a database.
class RelationalDatabaseHardware {
  /// The number of vCPUs for the database.
  final int? cpuCount;

  /// The size of the disk for the database.
  final int? diskSizeInGb;

  /// The amount of RAM in GB for the database.
  final double? ramSizeInGb;

  RelationalDatabaseHardware({
    this.cpuCount,
    this.diskSizeInGb,
    this.ramSizeInGb,
  });

  factory RelationalDatabaseHardware.fromJson(Map<String, dynamic> json) {
    return RelationalDatabaseHardware(
      cpuCount: json['cpuCount'] as int?,
      diskSizeInGb: json['diskSizeInGb'] as int?,
      ramSizeInGb: json['ramSizeInGb'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final cpuCount = this.cpuCount;
    final diskSizeInGb = this.diskSizeInGb;
    final ramSizeInGb = this.ramSizeInGb;
    return {
      if (cpuCount != null) 'cpuCount': cpuCount,
      if (diskSizeInGb != null) 'diskSizeInGb': diskSizeInGb,
      if (ramSizeInGb != null) 'ramSizeInGb': ramSizeInGb,
    };
  }
}

enum RelationalDatabaseMetricName {
  cPUUtilization,
  databaseConnections,
  diskQueueDepth,
  freeStorageSpace,
  networkReceiveThroughput,
  networkTransmitThroughput,
}

extension RelationalDatabaseMetricNameValueExtension
    on RelationalDatabaseMetricName {
  String toValue() {
    switch (this) {
      case RelationalDatabaseMetricName.cPUUtilization:
        return 'CPUUtilization';
      case RelationalDatabaseMetricName.databaseConnections:
        return 'DatabaseConnections';
      case RelationalDatabaseMetricName.diskQueueDepth:
        return 'DiskQueueDepth';
      case RelationalDatabaseMetricName.freeStorageSpace:
        return 'FreeStorageSpace';
      case RelationalDatabaseMetricName.networkReceiveThroughput:
        return 'NetworkReceiveThroughput';
      case RelationalDatabaseMetricName.networkTransmitThroughput:
        return 'NetworkTransmitThroughput';
    }
  }
}

extension RelationalDatabaseMetricNameFromString on String {
  RelationalDatabaseMetricName toRelationalDatabaseMetricName() {
    switch (this) {
      case 'CPUUtilization':
        return RelationalDatabaseMetricName.cPUUtilization;
      case 'DatabaseConnections':
        return RelationalDatabaseMetricName.databaseConnections;
      case 'DiskQueueDepth':
        return RelationalDatabaseMetricName.diskQueueDepth;
      case 'FreeStorageSpace':
        return RelationalDatabaseMetricName.freeStorageSpace;
      case 'NetworkReceiveThroughput':
        return RelationalDatabaseMetricName.networkReceiveThroughput;
      case 'NetworkTransmitThroughput':
        return RelationalDatabaseMetricName.networkTransmitThroughput;
    }
    throw Exception('$this is not known in enum RelationalDatabaseMetricName');
  }
}

/// Describes the parameters of a database.
class RelationalDatabaseParameter {
  /// Specifies the valid range of values for the parameter.
  final String? allowedValues;

  /// Indicates when parameter updates are applied.
  ///
  /// Can be <code>immediate</code> or <code>pending-reboot</code>.
  final String? applyMethod;

  /// Specifies the engine-specific parameter type.
  final String? applyType;

  /// Specifies the valid data type for the parameter.
  final String? dataType;

  /// Provides a description of the parameter.
  final String? description;

  /// A Boolean value indicating whether the parameter can be modified.
  final bool? isModifiable;

  /// Specifies the name of the parameter.
  final String? parameterName;

  /// Specifies the value of the parameter.
  final String? parameterValue;

  RelationalDatabaseParameter({
    this.allowedValues,
    this.applyMethod,
    this.applyType,
    this.dataType,
    this.description,
    this.isModifiable,
    this.parameterName,
    this.parameterValue,
  });

  factory RelationalDatabaseParameter.fromJson(Map<String, dynamic> json) {
    return RelationalDatabaseParameter(
      allowedValues: json['allowedValues'] as String?,
      applyMethod: json['applyMethod'] as String?,
      applyType: json['applyType'] as String?,
      dataType: json['dataType'] as String?,
      description: json['description'] as String?,
      isModifiable: json['isModifiable'] as bool?,
      parameterName: json['parameterName'] as String?,
      parameterValue: json['parameterValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedValues = this.allowedValues;
    final applyMethod = this.applyMethod;
    final applyType = this.applyType;
    final dataType = this.dataType;
    final description = this.description;
    final isModifiable = this.isModifiable;
    final parameterName = this.parameterName;
    final parameterValue = this.parameterValue;
    return {
      if (allowedValues != null) 'allowedValues': allowedValues,
      if (applyMethod != null) 'applyMethod': applyMethod,
      if (applyType != null) 'applyType': applyType,
      if (dataType != null) 'dataType': dataType,
      if (description != null) 'description': description,
      if (isModifiable != null) 'isModifiable': isModifiable,
      if (parameterName != null) 'parameterName': parameterName,
      if (parameterValue != null) 'parameterValue': parameterValue,
    };
  }
}

enum RelationalDatabasePasswordVersion {
  current,
  previous,
  pending,
}

extension RelationalDatabasePasswordVersionValueExtension
    on RelationalDatabasePasswordVersion {
  String toValue() {
    switch (this) {
      case RelationalDatabasePasswordVersion.current:
        return 'CURRENT';
      case RelationalDatabasePasswordVersion.previous:
        return 'PREVIOUS';
      case RelationalDatabasePasswordVersion.pending:
        return 'PENDING';
    }
  }
}

extension RelationalDatabasePasswordVersionFromString on String {
  RelationalDatabasePasswordVersion toRelationalDatabasePasswordVersion() {
    switch (this) {
      case 'CURRENT':
        return RelationalDatabasePasswordVersion.current;
      case 'PREVIOUS':
        return RelationalDatabasePasswordVersion.previous;
      case 'PENDING':
        return RelationalDatabasePasswordVersion.pending;
    }
    throw Exception(
        '$this is not known in enum RelationalDatabasePasswordVersion');
  }
}

/// Describes a database snapshot.
class RelationalDatabaseSnapshot {
  /// The Amazon Resource Name (ARN) of the database snapshot.
  final String? arn;

  /// The timestamp when the database snapshot was created.
  final DateTime? createdAt;

  /// The software of the database snapshot (for example, <code>MySQL</code>)
  final String? engine;

  /// The database engine version for the database snapshot (for example,
  /// <code>5.7.23</code>).
  final String? engineVersion;

  /// The Amazon Resource Name (ARN) of the database from which the database
  /// snapshot was created.
  final String? fromRelationalDatabaseArn;

  /// The blueprint ID of the database from which the database snapshot was
  /// created. A blueprint describes the major engine version of a database.
  final String? fromRelationalDatabaseBlueprintId;

  /// The bundle ID of the database from which the database snapshot was created.
  final String? fromRelationalDatabaseBundleId;

  /// The name of the source database from which the database snapshot was
  /// created.
  final String? fromRelationalDatabaseName;

  /// The Region name and Availability Zone where the database snapshot is
  /// located.
  final ResourceLocation? location;

  /// The name of the database snapshot.
  final String? name;

  /// The Lightsail resource type.
  final ResourceType? resourceType;

  /// The size of the disk in GB (for example, <code>32</code>) for the database
  /// snapshot.
  final int? sizeInGb;

  /// The state of the database snapshot.
  final String? state;

  /// The support code for the database snapshot. Include this code in your email
  /// to support when you have questions about a database snapshot in Lightsail.
  /// This code enables our support team to look up your Lightsail information
  /// more easily.
  final String? supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags">Amazon
  /// Lightsail Developer Guide</a>.
  final List<Tag>? tags;

  RelationalDatabaseSnapshot({
    this.arn,
    this.createdAt,
    this.engine,
    this.engineVersion,
    this.fromRelationalDatabaseArn,
    this.fromRelationalDatabaseBlueprintId,
    this.fromRelationalDatabaseBundleId,
    this.fromRelationalDatabaseName,
    this.location,
    this.name,
    this.resourceType,
    this.sizeInGb,
    this.state,
    this.supportCode,
    this.tags,
  });

  factory RelationalDatabaseSnapshot.fromJson(Map<String, dynamic> json) {
    return RelationalDatabaseSnapshot(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      engine: json['engine'] as String?,
      engineVersion: json['engineVersion'] as String?,
      fromRelationalDatabaseArn: json['fromRelationalDatabaseArn'] as String?,
      fromRelationalDatabaseBlueprintId:
          json['fromRelationalDatabaseBlueprintId'] as String?,
      fromRelationalDatabaseBundleId:
          json['fromRelationalDatabaseBundleId'] as String?,
      fromRelationalDatabaseName: json['fromRelationalDatabaseName'] as String?,
      location: json['location'] != null
          ? ResourceLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      sizeInGb: json['sizeInGb'] as int?,
      state: json['state'] as String?,
      supportCode: json['supportCode'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    final fromRelationalDatabaseArn = this.fromRelationalDatabaseArn;
    final fromRelationalDatabaseBlueprintId =
        this.fromRelationalDatabaseBlueprintId;
    final fromRelationalDatabaseBundleId = this.fromRelationalDatabaseBundleId;
    final fromRelationalDatabaseName = this.fromRelationalDatabaseName;
    final location = this.location;
    final name = this.name;
    final resourceType = this.resourceType;
    final sizeInGb = this.sizeInGb;
    final state = this.state;
    final supportCode = this.supportCode;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (engine != null) 'engine': engine,
      if (engineVersion != null) 'engineVersion': engineVersion,
      if (fromRelationalDatabaseArn != null)
        'fromRelationalDatabaseArn': fromRelationalDatabaseArn,
      if (fromRelationalDatabaseBlueprintId != null)
        'fromRelationalDatabaseBlueprintId': fromRelationalDatabaseBlueprintId,
      if (fromRelationalDatabaseBundleId != null)
        'fromRelationalDatabaseBundleId': fromRelationalDatabaseBundleId,
      if (fromRelationalDatabaseName != null)
        'fromRelationalDatabaseName': fromRelationalDatabaseName,
      if (location != null) 'location': location,
      if (name != null) 'name': name,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (sizeInGb != null) 'sizeInGb': sizeInGb,
      if (state != null) 'state': state,
      if (supportCode != null) 'supportCode': supportCode,
      if (tags != null) 'tags': tags,
    };
  }
}

class ReleaseStaticIpResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  ReleaseStaticIpResult({
    this.operations,
  });

  factory ReleaseStaticIpResult.fromJson(Map<String, dynamic> json) {
    return ReleaseStaticIpResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

enum RenewalStatus {
  pendingAutoRenewal,
  pendingValidation,
  success,
  failed,
}

extension RenewalStatusValueExtension on RenewalStatus {
  String toValue() {
    switch (this) {
      case RenewalStatus.pendingAutoRenewal:
        return 'PendingAutoRenewal';
      case RenewalStatus.pendingValidation:
        return 'PendingValidation';
      case RenewalStatus.success:
        return 'Success';
      case RenewalStatus.failed:
        return 'Failed';
    }
  }
}

extension RenewalStatusFromString on String {
  RenewalStatus toRenewalStatus() {
    switch (this) {
      case 'PendingAutoRenewal':
        return RenewalStatus.pendingAutoRenewal;
      case 'PendingValidation':
        return RenewalStatus.pendingValidation;
      case 'Success':
        return RenewalStatus.success;
      case 'Failed':
        return RenewalStatus.failed;
    }
    throw Exception('$this is not known in enum RenewalStatus');
  }
}

/// Describes the status of a SSL/TLS certificate renewal managed by Amazon
/// Lightsail.
class RenewalSummary {
  /// An array of objects that describe the domain validation records of the
  /// certificate.
  final List<DomainValidationRecord>? domainValidationRecords;

  /// The renewal status of the certificate.
  ///
  /// The following renewal status are possible:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>PendingAutoRenewal</code> </b> - Lightsail is attempting to
  /// automatically validate the domain names of the certificate. No further
  /// action is required.
  /// </li>
  /// <li>
  /// <b> <code>PendingValidation</code> </b> - Lightsail couldn't automatically
  /// validate one or more domain names of the certificate. You must take action
  /// to validate these domain names or the certificate won't be renewed. Check to
  /// make sure your certificate's domain validation records exist in your
  /// domain's DNS, and that your certificate remains in use.
  /// </li>
  /// <li>
  /// <b> <code>Success</code> </b> - All domain names in the certificate are
  /// validated, and Lightsail renewed the certificate. No further action is
  /// required.
  /// </li>
  /// <li>
  /// <b> <code>Failed</code> </b> - One or more domain names were not validated
  /// before the certificate expired, and Lightsail did not renew the certificate.
  /// You can request a new certificate using the <code>CreateCertificate</code>
  /// action.
  /// </li>
  /// </ul>
  final RenewalStatus? renewalStatus;

  /// The reason for the renewal status of the certificate.
  final String? renewalStatusReason;

  /// The timestamp when the certificate was last updated.
  final DateTime? updatedAt;

  RenewalSummary({
    this.domainValidationRecords,
    this.renewalStatus,
    this.renewalStatusReason,
    this.updatedAt,
  });

  factory RenewalSummary.fromJson(Map<String, dynamic> json) {
    return RenewalSummary(
      domainValidationRecords: (json['domainValidationRecords'] as List?)
          ?.whereNotNull()
          .map(
              (e) => DomainValidationRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      renewalStatus: (json['renewalStatus'] as String?)?.toRenewalStatus(),
      renewalStatusReason: json['renewalStatusReason'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final domainValidationRecords = this.domainValidationRecords;
    final renewalStatus = this.renewalStatus;
    final renewalStatusReason = this.renewalStatusReason;
    final updatedAt = this.updatedAt;
    return {
      if (domainValidationRecords != null)
        'domainValidationRecords': domainValidationRecords,
      if (renewalStatus != null) 'renewalStatus': renewalStatus.toValue(),
      if (renewalStatusReason != null)
        'renewalStatusReason': renewalStatusReason,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class ResetDistributionCacheResult {
  /// The timestamp of the reset cache request (<code>1479734909.17</code>) in
  /// Unix time format.
  final DateTime? createTime;

  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final Operation? operation;

  /// The status of the reset cache request.
  final String? status;

  ResetDistributionCacheResult({
    this.createTime,
    this.operation,
    this.status,
  });

  factory ResetDistributionCacheResult.fromJson(Map<String, dynamic> json) {
    return ResetDistributionCacheResult(
      createTime: timeStampFromJson(json['createTime']),
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createTime = this.createTime;
    final operation = this.operation;
    final status = this.status;
    return {
      if (createTime != null) 'createTime': unixTimestampToJson(createTime),
      if (operation != null) 'operation': operation,
      if (status != null) 'status': status,
    };
  }
}

enum ResourceBucketAccess {
  allow,
  deny,
}

extension ResourceBucketAccessValueExtension on ResourceBucketAccess {
  String toValue() {
    switch (this) {
      case ResourceBucketAccess.allow:
        return 'allow';
      case ResourceBucketAccess.deny:
        return 'deny';
    }
  }
}

extension ResourceBucketAccessFromString on String {
  ResourceBucketAccess toResourceBucketAccess() {
    switch (this) {
      case 'allow':
        return ResourceBucketAccess.allow;
      case 'deny':
        return ResourceBucketAccess.deny;
    }
    throw Exception('$this is not known in enum ResourceBucketAccess');
  }
}

/// Describes the estimated cost or usage that a budget tracks.
class ResourceBudgetEstimate {
  /// The cost estimate for the specified budget.
  final List<CostEstimate>? costEstimates;

  /// The estimate end time.
  final DateTime? endTime;

  /// The resource name.
  final String? resourceName;

  /// The type of resource the budget will track.
  final ResourceType? resourceType;

  /// The estimate start time.
  final DateTime? startTime;

  ResourceBudgetEstimate({
    this.costEstimates,
    this.endTime,
    this.resourceName,
    this.resourceType,
    this.startTime,
  });

  factory ResourceBudgetEstimate.fromJson(Map<String, dynamic> json) {
    return ResourceBudgetEstimate(
      costEstimates: (json['costEstimates'] as List?)
          ?.whereNotNull()
          .map((e) => CostEstimate.fromJson(e as Map<String, dynamic>))
          .toList(),
      endTime: timeStampFromJson(json['endTime']),
      resourceName: json['resourceName'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      startTime: timeStampFromJson(json['startTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final costEstimates = this.costEstimates;
    final endTime = this.endTime;
    final resourceName = this.resourceName;
    final resourceType = this.resourceType;
    final startTime = this.startTime;
    return {
      if (costEstimates != null) 'costEstimates': costEstimates,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (resourceName != null) 'resourceName': resourceName,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
    };
  }
}

/// Describes the resource location.
class ResourceLocation {
  /// The Availability Zone. Follows the format <code>us-east-2a</code>
  /// (case-sensitive).
  final String? availabilityZone;

  /// The Amazon Web Services Region name.
  final RegionName? regionName;

  ResourceLocation({
    this.availabilityZone,
    this.regionName,
  });

  factory ResourceLocation.fromJson(Map<String, dynamic> json) {
    return ResourceLocation(
      availabilityZone: json['availabilityZone'] as String?,
      regionName: (json['regionName'] as String?)?.toRegionName(),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final regionName = this.regionName;
    return {
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (regionName != null) 'regionName': regionName.toValue(),
    };
  }
}

/// Describes an Amazon Lightsail instance that has access to a Lightsail
/// bucket.
class ResourceReceivingAccess {
  /// The name of the Lightsail instance.
  final String? name;

  /// The Lightsail resource type (for example, <code>Instance</code>).
  final String? resourceType;

  ResourceReceivingAccess({
    this.name,
    this.resourceType,
  });

  factory ResourceReceivingAccess.fromJson(Map<String, dynamic> json) {
    return ResourceReceivingAccess(
      name: json['name'] as String?,
      resourceType: json['resourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final resourceType = this.resourceType;
    return {
      if (name != null) 'name': name,
      if (resourceType != null) 'resourceType': resourceType,
    };
  }
}

/// Describes the domain name system (DNS) records to add to your domain's DNS
/// to validate it for an Amazon Lightsail certificate.
class ResourceRecord {
  /// The name of the record.
  final String? name;

  /// The DNS record type.
  final String? type;

  /// The value for the DNS record.
  final String? value;

  ResourceRecord({
    this.name,
    this.type,
    this.value,
  });

  factory ResourceRecord.fromJson(Map<String, dynamic> json) {
    return ResourceRecord(
      name: json['name'] as String?,
      type: json['type'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final value = this.value;
    return {
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (value != null) 'value': value,
    };
  }
}

enum ResourceType {
  containerService,
  instance,
  staticIp,
  keyPair,
  instanceSnapshot,
  domain,
  peeredVpc,
  loadBalancer,
  loadBalancerTlsCertificate,
  disk,
  diskSnapshot,
  relationalDatabase,
  relationalDatabaseSnapshot,
  exportSnapshotRecord,
  cloudFormationStackRecord,
  alarm,
  contactMethod,
  distribution,
  certificate,
  bucket,
}

extension ResourceTypeValueExtension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.containerService:
        return 'ContainerService';
      case ResourceType.instance:
        return 'Instance';
      case ResourceType.staticIp:
        return 'StaticIp';
      case ResourceType.keyPair:
        return 'KeyPair';
      case ResourceType.instanceSnapshot:
        return 'InstanceSnapshot';
      case ResourceType.domain:
        return 'Domain';
      case ResourceType.peeredVpc:
        return 'PeeredVpc';
      case ResourceType.loadBalancer:
        return 'LoadBalancer';
      case ResourceType.loadBalancerTlsCertificate:
        return 'LoadBalancerTlsCertificate';
      case ResourceType.disk:
        return 'Disk';
      case ResourceType.diskSnapshot:
        return 'DiskSnapshot';
      case ResourceType.relationalDatabase:
        return 'RelationalDatabase';
      case ResourceType.relationalDatabaseSnapshot:
        return 'RelationalDatabaseSnapshot';
      case ResourceType.exportSnapshotRecord:
        return 'ExportSnapshotRecord';
      case ResourceType.cloudFormationStackRecord:
        return 'CloudFormationStackRecord';
      case ResourceType.alarm:
        return 'Alarm';
      case ResourceType.contactMethod:
        return 'ContactMethod';
      case ResourceType.distribution:
        return 'Distribution';
      case ResourceType.certificate:
        return 'Certificate';
      case ResourceType.bucket:
        return 'Bucket';
    }
  }
}

extension ResourceTypeFromString on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'ContainerService':
        return ResourceType.containerService;
      case 'Instance':
        return ResourceType.instance;
      case 'StaticIp':
        return ResourceType.staticIp;
      case 'KeyPair':
        return ResourceType.keyPair;
      case 'InstanceSnapshot':
        return ResourceType.instanceSnapshot;
      case 'Domain':
        return ResourceType.domain;
      case 'PeeredVpc':
        return ResourceType.peeredVpc;
      case 'LoadBalancer':
        return ResourceType.loadBalancer;
      case 'LoadBalancerTlsCertificate':
        return ResourceType.loadBalancerTlsCertificate;
      case 'Disk':
        return ResourceType.disk;
      case 'DiskSnapshot':
        return ResourceType.diskSnapshot;
      case 'RelationalDatabase':
        return ResourceType.relationalDatabase;
      case 'RelationalDatabaseSnapshot':
        return ResourceType.relationalDatabaseSnapshot;
      case 'ExportSnapshotRecord':
        return ResourceType.exportSnapshotRecord;
      case 'CloudFormationStackRecord':
        return ResourceType.cloudFormationStackRecord;
      case 'Alarm':
        return ResourceType.alarm;
      case 'ContactMethod':
        return ResourceType.contactMethod;
      case 'Distribution':
        return ResourceType.distribution;
      case 'Certificate':
        return ResourceType.certificate;
      case 'Bucket':
        return ResourceType.bucket;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

class SendContactMethodVerificationResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  SendContactMethodVerificationResult({
    this.operations,
  });

  factory SendContactMethodVerificationResult.fromJson(
      Map<String, dynamic> json) {
    return SendContactMethodVerificationResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

/// Describes a web-based, remote graphical user interface (GUI), NICE DCV
/// session. The session is used to access a virtual computer’s operating system
/// or application.
class Session {
  /// When true, this Boolean value indicates the primary session for the
  /// specified resource.
  final bool? isPrimary;

  /// The session name.
  final String? name;

  /// The session URL.
  final String? url;

  Session({
    this.isPrimary,
    this.name,
    this.url,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      isPrimary: json['isPrimary'] as bool?,
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isPrimary = this.isPrimary;
    final name = this.name;
    final url = this.url;
    return {
      if (isPrimary != null) 'isPrimary': isPrimary,
      if (name != null) 'name': name,
      if (url != null) 'url': url,
    };
  }
}

class SetIpAddressTypeResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  SetIpAddressTypeResult({
    this.operations,
  });

  factory SetIpAddressTypeResult.fromJson(Map<String, dynamic> json) {
    return SetIpAddressTypeResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class SetResourceAccessForBucketResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  SetResourceAccessForBucketResult({
    this.operations,
  });

  factory SetResourceAccessForBucketResult.fromJson(Map<String, dynamic> json) {
    return SetResourceAccessForBucketResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

/// Returns details about the commands that were run.
class SetupExecutionDetails {
  /// The command that was executed.
  final String? command;

  /// The timestamp for when the request was run.
  final DateTime? dateTime;

  /// The name of the target resource.
  final String? name;

  /// The text written by the command to stderr.
  final String? standardError;

  /// The text written by the command to stdout.
  final String? standardOutput;

  /// The status of the <code>SetupInstanceHttps</code> request.
  final SetupStatus? status;

  /// The current version of the script..
  final String? version;

  SetupExecutionDetails({
    this.command,
    this.dateTime,
    this.name,
    this.standardError,
    this.standardOutput,
    this.status,
    this.version,
  });

  factory SetupExecutionDetails.fromJson(Map<String, dynamic> json) {
    return SetupExecutionDetails(
      command: json['command'] as String?,
      dateTime: timeStampFromJson(json['dateTime']),
      name: json['name'] as String?,
      standardError: json['standardError'] as String?,
      standardOutput: json['standardOutput'] as String?,
      status: (json['status'] as String?)?.toSetupStatus(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final command = this.command;
    final dateTime = this.dateTime;
    final name = this.name;
    final standardError = this.standardError;
    final standardOutput = this.standardOutput;
    final status = this.status;
    final version = this.version;
    return {
      if (command != null) 'command': command,
      if (dateTime != null) 'dateTime': unixTimestampToJson(dateTime),
      if (name != null) 'name': name,
      if (standardError != null) 'standardError': standardError,
      if (standardOutput != null) 'standardOutput': standardOutput,
      if (status != null) 'status': status.toValue(),
      if (version != null) 'version': version,
    };
  }
}

/// Returns a list of the commands that were ran on the target resource.
///
/// The status of each command is also returned.
class SetupHistory {
  /// Describes the full details of the request.
  final List<SetupExecutionDetails>? executionDetails;

  /// A GUID that's used to identify the operation.
  final String? operationId;

  /// Information about the specified request.
  final SetupRequest? request;

  /// The target resource name for the request.
  final SetupHistoryResource? resource;

  /// The status of the request.
  final SetupStatus? status;

  SetupHistory({
    this.executionDetails,
    this.operationId,
    this.request,
    this.resource,
    this.status,
  });

  factory SetupHistory.fromJson(Map<String, dynamic> json) {
    return SetupHistory(
      executionDetails: (json['executionDetails'] as List?)
          ?.whereNotNull()
          .map((e) => SetupExecutionDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      operationId: json['operationId'] as String?,
      request: json['request'] != null
          ? SetupRequest.fromJson(json['request'] as Map<String, dynamic>)
          : null,
      resource: json['resource'] != null
          ? SetupHistoryResource.fromJson(
              json['resource'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toSetupStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final executionDetails = this.executionDetails;
    final operationId = this.operationId;
    final request = this.request;
    final resource = this.resource;
    final status = this.status;
    return {
      if (executionDetails != null) 'executionDetails': executionDetails,
      if (operationId != null) 'operationId': operationId,
      if (request != null) 'request': request,
      if (resource != null) 'resource': resource,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// The Lightsail resource that <code>SetupHistory</code> was ran on.
class SetupHistoryResource {
  /// The Amazon Resource Name (ARN) of the Lightsail resource.
  final String? arn;

  /// The timestamp for when the resource was created.
  final DateTime? createdAt;
  final ResourceLocation? location;

  /// The name of the Lightsail resource.
  final String? name;

  /// The Lightsail resource type. For example, <code>Instance</code>.
  final ResourceType? resourceType;

  SetupHistoryResource({
    this.arn,
    this.createdAt,
    this.location,
    this.name,
    this.resourceType,
  });

  factory SetupHistoryResource.fromJson(Map<String, dynamic> json) {
    return SetupHistoryResource(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      location: json['location'] != null
          ? ResourceLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final location = this.location;
    final name = this.name;
    final resourceType = this.resourceType;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (location != null) 'location': location,
      if (name != null) 'name': name,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
    };
  }
}

class SetupInstanceHttpsResult {
  /// The available API operations for <code>SetupInstanceHttps</code>.
  final List<Operation>? operations;

  SetupInstanceHttpsResult({
    this.operations,
  });

  factory SetupInstanceHttpsResult.fromJson(Map<String, dynamic> json) {
    return SetupInstanceHttpsResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

/// Returns information that was submitted during the
/// <code>SetupInstanceHttps</code> request. Email information is redacted for
/// privacy.
class SetupRequest {
  /// The Certificate Authority (CA) that issues the SSL/TLS certificate.
  final CertificateProvider? certificateProvider;

  /// The name of the domain and subdomains that the SSL/TLS certificate secures.
  final List<String>? domainNames;

  /// The name of the Lightsail instance.
  final String? instanceName;

  SetupRequest({
    this.certificateProvider,
    this.domainNames,
    this.instanceName,
  });

  factory SetupRequest.fromJson(Map<String, dynamic> json) {
    return SetupRequest(
      certificateProvider:
          (json['certificateProvider'] as String?)?.toCertificateProvider(),
      domainNames: (json['domainNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      instanceName: json['instanceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final certificateProvider = this.certificateProvider;
    final domainNames = this.domainNames;
    final instanceName = this.instanceName;
    return {
      if (certificateProvider != null)
        'certificateProvider': certificateProvider.toValue(),
      if (domainNames != null) 'domainNames': domainNames,
      if (instanceName != null) 'instanceName': instanceName,
    };
  }
}

enum SetupStatus {
  succeeded,
  failed,
  inProgress,
}

extension SetupStatusValueExtension on SetupStatus {
  String toValue() {
    switch (this) {
      case SetupStatus.succeeded:
        return 'succeeded';
      case SetupStatus.failed:
        return 'failed';
      case SetupStatus.inProgress:
        return 'inProgress';
    }
  }
}

extension SetupStatusFromString on String {
  SetupStatus toSetupStatus() {
    switch (this) {
      case 'succeeded':
        return SetupStatus.succeeded;
      case 'failed':
        return SetupStatus.failed;
      case 'inProgress':
        return SetupStatus.inProgress;
    }
    throw Exception('$this is not known in enum SetupStatus');
  }
}

class StartGUISessionResult {
  /// The available API operations.
  final List<Operation>? operations;

  StartGUISessionResult({
    this.operations,
  });

  factory StartGUISessionResult.fromJson(Map<String, dynamic> json) {
    return StartGUISessionResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class StartInstanceResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  StartInstanceResult({
    this.operations,
  });

  factory StartInstanceResult.fromJson(Map<String, dynamic> json) {
    return StartInstanceResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class StartRelationalDatabaseResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  StartRelationalDatabaseResult({
    this.operations,
  });

  factory StartRelationalDatabaseResult.fromJson(Map<String, dynamic> json) {
    return StartRelationalDatabaseResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

/// Describes a static IP.
class StaticIp {
  /// The Amazon Resource Name (ARN) of the static IP
  /// (<code>arn:aws:lightsail:us-east-2:123456789101:StaticIp/9cbb4a9e-f8e3-4dfe-b57e-12345EXAMPLE</code>).
  final String? arn;

  /// The instance where the static IP is attached
  /// (<code>Amazon_Linux-1GB-Ohio-1</code>).
  final String? attachedTo;

  /// The timestamp when the static IP was created (<code>1479735304.222</code>).
  final DateTime? createdAt;

  /// The static IP address.
  final String? ipAddress;

  /// A Boolean value indicating whether the static IP is attached.
  final bool? isAttached;

  /// The region and Availability Zone where the static IP was created.
  final ResourceLocation? location;

  /// The name of the static IP (<code>StaticIP-Ohio-EXAMPLE</code>).
  final String? name;

  /// The resource type (usually <code>StaticIp</code>).
  final ResourceType? resourceType;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more easily.
  final String? supportCode;

  StaticIp({
    this.arn,
    this.attachedTo,
    this.createdAt,
    this.ipAddress,
    this.isAttached,
    this.location,
    this.name,
    this.resourceType,
    this.supportCode,
  });

  factory StaticIp.fromJson(Map<String, dynamic> json) {
    return StaticIp(
      arn: json['arn'] as String?,
      attachedTo: json['attachedTo'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      ipAddress: json['ipAddress'] as String?,
      isAttached: json['isAttached'] as bool?,
      location: json['location'] != null
          ? ResourceLocation.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      resourceType: (json['resourceType'] as String?)?.toResourceType(),
      supportCode: json['supportCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final attachedTo = this.attachedTo;
    final createdAt = this.createdAt;
    final ipAddress = this.ipAddress;
    final isAttached = this.isAttached;
    final location = this.location;
    final name = this.name;
    final resourceType = this.resourceType;
    final supportCode = this.supportCode;
    return {
      if (arn != null) 'arn': arn,
      if (attachedTo != null) 'attachedTo': attachedTo,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (isAttached != null) 'isAttached': isAttached,
      if (location != null) 'location': location,
      if (name != null) 'name': name,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (supportCode != null) 'supportCode': supportCode,
    };
  }
}

enum Status {
  startExpired,
  notStarted,
  started,
  starting,
  stopped,
  stopping,
  settingUpInstance,
  failedInstanceCreation,
  failedStartingGUISession,
  failedStoppingGUISession,
}

extension StatusValueExtension on Status {
  String toValue() {
    switch (this) {
      case Status.startExpired:
        return 'startExpired';
      case Status.notStarted:
        return 'notStarted';
      case Status.started:
        return 'started';
      case Status.starting:
        return 'starting';
      case Status.stopped:
        return 'stopped';
      case Status.stopping:
        return 'stopping';
      case Status.settingUpInstance:
        return 'settingUpInstance';
      case Status.failedInstanceCreation:
        return 'failedInstanceCreation';
      case Status.failedStartingGUISession:
        return 'failedStartingGUISession';
      case Status.failedStoppingGUISession:
        return 'failedStoppingGUISession';
    }
  }
}

extension StatusFromString on String {
  Status toStatus() {
    switch (this) {
      case 'startExpired':
        return Status.startExpired;
      case 'notStarted':
        return Status.notStarted;
      case 'started':
        return Status.started;
      case 'starting':
        return Status.starting;
      case 'stopped':
        return Status.stopped;
      case 'stopping':
        return Status.stopping;
      case 'settingUpInstance':
        return Status.settingUpInstance;
      case 'failedInstanceCreation':
        return Status.failedInstanceCreation;
      case 'failedStartingGUISession':
        return Status.failedStartingGUISession;
      case 'failedStoppingGUISession':
        return Status.failedStoppingGUISession;
    }
    throw Exception('$this is not known in enum Status');
  }
}

enum StatusType {
  active,
  inactive,
}

extension StatusTypeValueExtension on StatusType {
  String toValue() {
    switch (this) {
      case StatusType.active:
        return 'Active';
      case StatusType.inactive:
        return 'Inactive';
    }
  }
}

extension StatusTypeFromString on String {
  StatusType toStatusType() {
    switch (this) {
      case 'Active':
        return StatusType.active;
      case 'Inactive':
        return StatusType.inactive;
    }
    throw Exception('$this is not known in enum StatusType');
  }
}

class StopGUISessionResult {
  /// The available API operations.
  final List<Operation>? operations;

  StopGUISessionResult({
    this.operations,
  });

  factory StopGUISessionResult.fromJson(Map<String, dynamic> json) {
    return StopGUISessionResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

/// Describes a request to create or edit the <code>StopInstanceOnIdle</code>
/// add-on.
/// <important>
/// This add-on only applies to Lightsail for Research resources.
/// </important>
class StopInstanceOnIdleRequest {
  /// The amount of idle time in minutes after which your virtual computer will
  /// automatically stop.
  final String? duration;

  /// The value to compare with the duration.
  final String? threshold;

  StopInstanceOnIdleRequest({
    this.duration,
    this.threshold,
  });

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final threshold = this.threshold;
    return {
      if (duration != null) 'duration': duration,
      if (threshold != null) 'threshold': threshold,
    };
  }
}

class StopInstanceResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  StopInstanceResult({
    this.operations,
  });

  factory StopInstanceResult.fromJson(Map<String, dynamic> json) {
    return StopInstanceResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class StopRelationalDatabaseResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  StopRelationalDatabaseResult({
    this.operations,
  });

  factory StopRelationalDatabaseResult.fromJson(Map<String, dynamic> json) {
    return StopRelationalDatabaseResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

/// Describes a tag key and optional value assigned to an Amazon Lightsail
/// resource.
///
/// For more information about tags in Lightsail, see the <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags">Amazon
/// Lightsail Developer Guide</a>.
class Tag {
  /// The key of the tag.
  ///
  /// Constraints: Tag keys accept a maximum of 128 letters, numbers, spaces in
  /// UTF-8, or the following characters: + - = . _ : / @
  final String? key;

  /// The value of the tag.
  ///
  /// Constraints: Tag values accept a maximum of 256 letters, numbers, spaces in
  /// UTF-8, or the following characters: + - = . _ : / @
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

class TagResourceResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  TagResourceResult({
    this.operations,
  });

  factory TagResourceResult.fromJson(Map<String, dynamic> json) {
    return TagResourceResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class TestAlarmResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  TestAlarmResult({
    this.operations,
  });

  factory TestAlarmResult.fromJson(Map<String, dynamic> json) {
    return TestAlarmResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

/// Sets the start date and end date for retrieving a cost estimate. The start
/// date is inclusive, but the end date is exclusive. For example, if
/// <code>start</code> is <code>2017-01-01</code> and <code>end</code> is
/// <code>2017-05-01</code>, then the cost and usage data is retrieved from
/// <code>2017-01-01</code> up to and including <code>2017-04-30</code> but not
/// including <code>2017-05-01</code>.
class TimePeriod {
  /// The end of the time period. The end date is exclusive. For example, if
  /// <code>end</code> is <code>2017-05-01</code>, Lightsail for Research
  /// retrieves cost and usage data from the start date up to, but not including,
  /// <code>2017-05-01</code>.
  final DateTime? end;

  /// The beginning of the time period. The start date is inclusive. For example,
  /// if <code>start</code> is <code>2017-01-01</code>, Lightsail for Research
  /// retrieves cost and usage data starting at <code>2017-01-01</code> up to the
  /// end date. The start date must be equal to or no later than the current date
  /// to avoid a validation error.
  final DateTime? start;

  TimePeriod({
    this.end,
    this.start,
  });

  factory TimePeriod.fromJson(Map<String, dynamic> json) {
    return TimePeriod(
      end: timeStampFromJson(json['end']),
      start: timeStampFromJson(json['start']),
    );
  }

  Map<String, dynamic> toJson() {
    final end = this.end;
    final start = this.start;
    return {
      if (end != null) 'end': unixTimestampToJson(end),
      if (start != null) 'start': unixTimestampToJson(start),
    };
  }
}

enum TreatMissingData {
  breaching,
  notBreaching,
  ignore,
  missing,
}

extension TreatMissingDataValueExtension on TreatMissingData {
  String toValue() {
    switch (this) {
      case TreatMissingData.breaching:
        return 'breaching';
      case TreatMissingData.notBreaching:
        return 'notBreaching';
      case TreatMissingData.ignore:
        return 'ignore';
      case TreatMissingData.missing:
        return 'missing';
    }
  }
}

extension TreatMissingDataFromString on String {
  TreatMissingData toTreatMissingData() {
    switch (this) {
      case 'breaching':
        return TreatMissingData.breaching;
      case 'notBreaching':
        return TreatMissingData.notBreaching;
      case 'ignore':
        return TreatMissingData.ignore;
      case 'missing':
        return TreatMissingData.missing;
    }
    throw Exception('$this is not known in enum TreatMissingData');
  }
}

class UnpeerVpcResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final Operation? operation;

  UnpeerVpcResult({
    this.operation,
  });

  factory UnpeerVpcResult.fromJson(Map<String, dynamic> json) {
    return UnpeerVpcResult(
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    return {
      if (operation != null) 'operation': operation,
    };
  }
}

class UntagResourceResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  UntagResourceResult({
    this.operations,
  });

  factory UntagResourceResult.fromJson(Map<String, dynamic> json) {
    return UntagResourceResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class UpdateBucketBundleResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  UpdateBucketBundleResult({
    this.operations,
  });

  factory UpdateBucketBundleResult.fromJson(Map<String, dynamic> json) {
    return UpdateBucketBundleResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class UpdateBucketResult {
  /// An object that describes the bucket that is updated.
  final Bucket? bucket;

  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  UpdateBucketResult({
    this.bucket,
    this.operations,
  });

  factory UpdateBucketResult.fromJson(Map<String, dynamic> json) {
    return UpdateBucketResult(
      bucket: json['bucket'] != null
          ? Bucket.fromJson(json['bucket'] as Map<String, dynamic>)
          : null,
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final operations = this.operations;
    return {
      if (bucket != null) 'bucket': bucket,
      if (operations != null) 'operations': operations,
    };
  }
}

class UpdateContainerServiceResult {
  /// An object that describes a container service.
  final ContainerService? containerService;

  UpdateContainerServiceResult({
    this.containerService,
  });

  factory UpdateContainerServiceResult.fromJson(Map<String, dynamic> json) {
    return UpdateContainerServiceResult(
      containerService: json['containerService'] != null
          ? ContainerService.fromJson(
              json['containerService'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final containerService = this.containerService;
    return {
      if (containerService != null) 'containerService': containerService,
    };
  }
}

class UpdateDistributionBundleResult {
  /// An object that describes the result of the action, such as the status of the
  /// request, the timestamp of the request, and the resources affected by the
  /// request.
  final Operation? operation;

  UpdateDistributionBundleResult({
    this.operation,
  });

  factory UpdateDistributionBundleResult.fromJson(Map<String, dynamic> json) {
    return UpdateDistributionBundleResult(
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    return {
      if (operation != null) 'operation': operation,
    };
  }
}

class UpdateDistributionResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final Operation? operation;

  UpdateDistributionResult({
    this.operation,
  });

  factory UpdateDistributionResult.fromJson(Map<String, dynamic> json) {
    return UpdateDistributionResult(
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    return {
      if (operation != null) 'operation': operation,
    };
  }
}

class UpdateDomainEntryResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  UpdateDomainEntryResult({
    this.operations,
  });

  factory UpdateDomainEntryResult.fromJson(Map<String, dynamic> json) {
    return UpdateDomainEntryResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class UpdateInstanceMetadataOptionsResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final Operation? operation;

  UpdateInstanceMetadataOptionsResult({
    this.operation,
  });

  factory UpdateInstanceMetadataOptionsResult.fromJson(
      Map<String, dynamic> json) {
    return UpdateInstanceMetadataOptionsResult(
      operation: json['operation'] != null
          ? Operation.fromJson(json['operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    return {
      if (operation != null) 'operation': operation,
    };
  }
}

class UpdateLoadBalancerAttributeResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  UpdateLoadBalancerAttributeResult({
    this.operations,
  });

  factory UpdateLoadBalancerAttributeResult.fromJson(
      Map<String, dynamic> json) {
    return UpdateLoadBalancerAttributeResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class UpdateRelationalDatabaseParametersResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  UpdateRelationalDatabaseParametersResult({
    this.operations,
  });

  factory UpdateRelationalDatabaseParametersResult.fromJson(
      Map<String, dynamic> json) {
    return UpdateRelationalDatabaseParametersResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

class UpdateRelationalDatabaseResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  final List<Operation>? operations;

  UpdateRelationalDatabaseResult({
    this.operations,
  });

  factory UpdateRelationalDatabaseResult.fromJson(Map<String, dynamic> json) {
    return UpdateRelationalDatabaseResult(
      operations: (json['operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final operations = this.operations;
    return {
      if (operations != null) 'operations': operations,
    };
  }
}

enum ViewerMinimumTlsProtocolVersionEnum {
  tLSv1_1_2016,
  tLSv1_2_2018,
  tLSv1_2_2019,
  tLSv1_2_2021,
}

extension ViewerMinimumTlsProtocolVersionEnumValueExtension
    on ViewerMinimumTlsProtocolVersionEnum {
  String toValue() {
    switch (this) {
      case ViewerMinimumTlsProtocolVersionEnum.tLSv1_1_2016:
        return 'TLSv1.1_2016';
      case ViewerMinimumTlsProtocolVersionEnum.tLSv1_2_2018:
        return 'TLSv1.2_2018';
      case ViewerMinimumTlsProtocolVersionEnum.tLSv1_2_2019:
        return 'TLSv1.2_2019';
      case ViewerMinimumTlsProtocolVersionEnum.tLSv1_2_2021:
        return 'TLSv1.2_2021';
    }
  }
}

extension ViewerMinimumTlsProtocolVersionEnumFromString on String {
  ViewerMinimumTlsProtocolVersionEnum toViewerMinimumTlsProtocolVersionEnum() {
    switch (this) {
      case 'TLSv1.1_2016':
        return ViewerMinimumTlsProtocolVersionEnum.tLSv1_1_2016;
      case 'TLSv1.2_2018':
        return ViewerMinimumTlsProtocolVersionEnum.tLSv1_2_2018;
      case 'TLSv1.2_2019':
        return ViewerMinimumTlsProtocolVersionEnum.tLSv1_2_2019;
      case 'TLSv1.2_2021':
        return ViewerMinimumTlsProtocolVersionEnum.tLSv1_2_2021;
    }
    throw Exception(
        '$this is not known in enum ViewerMinimumTlsProtocolVersionEnum');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AccountSetupInProgressException extends _s.GenericAwsException {
  AccountSetupInProgressException({String? type, String? message})
      : super(
            type: type,
            code: 'AccountSetupInProgressException',
            message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String? type, String? message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class OperationFailureException extends _s.GenericAwsException {
  OperationFailureException({String? type, String? message})
      : super(type: type, code: 'OperationFailureException', message: message);
}

class ServiceException extends _s.GenericAwsException {
  ServiceException({String? type, String? message})
      : super(type: type, code: 'ServiceException', message: message);
}

class UnauthenticatedException extends _s.GenericAwsException {
  UnauthenticatedException({String? type, String? message})
      : super(type: type, code: 'UnauthenticatedException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'AccountSetupInProgressException': (type, message) =>
      AccountSetupInProgressException(type: type, message: message),
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'OperationFailureException': (type, message) =>
      OperationFailureException(type: type, message: message),
  'ServiceException': (type, message) =>
      ServiceException(type: type, message: message),
  'UnauthenticatedException': (type, message) =>
      UnauthenticatedException(type: type, message: message),
};

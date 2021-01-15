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

part '2016-11-28.g.dart';

/// Amazon Lightsail is the easiest way to get started with Amazon Web Services
/// (AWS) for developers who need to build websites or web applications. It
/// includes everything you need to launch your project quickly - instances
/// (virtual private servers), container services, managed databases, SSD-based
/// block storage, static IP addresses, load balancers, content delivery network
/// (CDN) distributions, DNS management of registered domains, and resource
/// snapshots (backups) - for a low, predictable monthly price.
///
/// You can manage your Lightsail resources using the Lightsail console,
/// Lightsail API, AWS Command Line Interface (AWS CLI), or SDKs. For more
/// information about Lightsail concepts and tasks, see the <a
/// href="http://lightsail.aws.amazon.com/ls/docs/how-to/article/lightsail-how-to-set-up-access-keys-to-use-sdk-api-cli">Lightsail
/// Dev Guide</a>.
///
/// This API Reference provides detailed information about the actions, data
/// types, parameters, and errors of the Lightsail service. For more information
/// about the supported AWS Regions, endpoints, and service quotas of the
/// Lightsail service, see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/lightsail.html">Amazon
/// Lightsail Endpoints and Quotas</a> in the <i>AWS General Reference</i>.
class Lightsail {
  final _s.JsonProtocol _protocol;
  Lightsail({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'lightsail',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required String staticIpName,
  }) async {
    ArgumentError.checkNotNull(staticIpName, 'staticIpName');
    _s.validateStringPattern(
      'staticIpName',
      staticIpName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// Only certificates created in the <code>us-east-1</code> AWS Region can be
  /// attached to Lightsail distributions. Lightsail distributions are global
  /// resources that can reference an origin in any AWS Region, and distribute
  /// its content globally. However, all distributions are located in the
  /// <code>us-east-1</code> Region.
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
    @_s.required String certificateName,
    @_s.required String distributionName,
  }) async {
    ArgumentError.checkNotNull(certificateName, 'certificateName');
    _s.validateStringPattern(
      'certificateName',
      certificateName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(distributionName, 'distributionName');
    _s.validateStringPattern(
      'distributionName',
      distributionName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
  /// The unique Lightsail disk name (e.g., <code>my-disk</code>).
  ///
  /// Parameter [diskPath] :
  /// The disk path to expose to the instance (e.g., <code>/dev/xvdf</code>).
  ///
  /// Parameter [instanceName] :
  /// The name of the Lightsail instance where you want to utilize the storage
  /// disk.
  Future<AttachDiskResult> attachDisk({
    @_s.required String diskName,
    @_s.required String diskPath,
    @_s.required String instanceName,
  }) async {
    ArgumentError.checkNotNull(diskName, 'diskName');
    _s.validateStringPattern(
      'diskName',
      diskName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(diskPath, 'diskPath');
    _s.validateStringPattern(
      'diskPath',
      diskPath,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceName, 'instanceName');
    _s.validateStringPattern(
      'instanceName',
      instanceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required List<String> instanceNames,
    @_s.required String loadBalancerName,
  }) async {
    ArgumentError.checkNotNull(instanceNames, 'instanceNames');
    ArgumentError.checkNotNull(loadBalancerName, 'loadBalancerName');
    _s.validateStringPattern(
      'loadBalancerName',
      loadBalancerName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String certificateName,
    @_s.required String loadBalancerName,
  }) async {
    ArgumentError.checkNotNull(certificateName, 'certificateName');
    _s.validateStringPattern(
      'certificateName',
      certificateName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(loadBalancerName, 'loadBalancerName');
    _s.validateStringPattern(
      'loadBalancerName',
      loadBalancerName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    @_s.required String instanceName,
    @_s.required String staticIpName,
  }) async {
    ArgumentError.checkNotNull(instanceName, 'instanceName');
    _s.validateStringPattern(
      'instanceName',
      instanceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(staticIpName, 'staticIpName');
    _s.validateStringPattern(
      'staticIpName',
      staticIpName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String instanceName,
    @_s.required PortInfo portInfo,
  }) async {
    ArgumentError.checkNotNull(instanceName, 'instanceName');
    _s.validateStringPattern(
      'instanceName',
      instanceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(portInfo, 'portInfo');
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
  /// automatic snapshot of an instance or a disk from one AWS Region to another
  /// in Amazon Lightsail.
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
  /// The AWS Region where the source manual or automatic snapshot is located.
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-keeping-automatic-snapshots">Lightsail
  /// Dev Guide</a>.
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-keeping-automatic-snapshots">Lightsail
  /// Dev Guide</a>.
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-keeping-automatic-snapshots">Lightsail
  /// Dev Guide</a>.
  /// </li>
  /// </ul>
  Future<CopySnapshotResult> copySnapshot({
    @_s.required RegionName sourceRegion,
    @_s.required String targetSnapshotName,
    String restoreDate,
    String sourceResourceName,
    String sourceSnapshotName,
    bool useLatestRestorableAutoSnapshot,
  }) async {
    ArgumentError.checkNotNull(sourceRegion, 'sourceRegion');
    ArgumentError.checkNotNull(targetSnapshotName, 'targetSnapshotName');
    _s.validateStringPattern(
      'targetSnapshotName',
      targetSnapshotName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'sourceSnapshotName',
      sourceSnapshotName,
      r'''\w[\w\-]*\w''',
    );
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
        'sourceRegion': sourceRegion?.toValue() ?? '',
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

  /// Creates an SSL/TLS certificate for a Amazon Lightsail content delivery
  /// network (CDN) distribution.
  ///
  /// After the certificate is created, use the
  /// <code>AttachCertificateToDistribution</code> action to attach the
  /// certificate to your distribution.
  /// <important>
  /// Only certificates created in the <code>us-east-1</code> AWS Region can be
  /// attached to Lightsail distributions. Lightsail distributions are global
  /// resources that can reference an origin in any AWS Region, and distribute
  /// its content globally. However, all distributions are located in the
  /// <code>us-east-1</code> Region.
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
  /// The domain name (e.g., <code>example.com</code>) for the certificate.
  ///
  /// Parameter [subjectAlternativeNames] :
  /// An array of strings that specify the alternate domains (e.g.,
  /// <code>example2.com</code>) and subdomains (e.g.,
  /// <code>blog.example.com</code>) for the certificate.
  ///
  /// You can specify a maximum of nine alternate domains (in addition to the
  /// primary domain name).
  ///
  /// Wildcard domain entries (e.g., <code>*.example.com</code>) are not
  /// supported.
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the certificate during create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  Future<CreateCertificateResult> createCertificate({
    @_s.required String certificateName,
    @_s.required String domainName,
    List<String> subjectAlternativeNames,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(certificateName, 'certificateName');
    ArgumentError.checkNotNull(domainName, 'domainName');
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
    @_s.required List<InstanceEntry> instances,
  }) async {
    ArgumentError.checkNotNull(instances, 'instances');
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
  /// number contact method in each AWS Region. However, SMS text messaging is
  /// not supported in some AWS Regions, and SMS text messages cannot be sent to
  /// some countries/regions. For more information, see <a
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
  /// The <code>SMS</code> protocol is supported only in the following AWS
  /// Regions.
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
  /// the latest AWS Regions where SMS text messaging is supported, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/sns-supported-regions-countries.html">Supported
  /// Regions and Countries</a> in the <i>Amazon SNS Developer Guide</i>.
  ///
  /// For more information about notifications in Amazon Lightsail, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications
  /// in Amazon Lightsail</a>.
  Future<CreateContactMethodResult> createContactMethod({
    @_s.required String contactEndpoint,
    @_s.required ContactProtocol protocol,
  }) async {
    ArgumentError.checkNotNull(contactEndpoint, 'contactEndpoint');
    _s.validateStringLength(
      'contactEndpoint',
      contactEndpoint,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(protocol, 'protocol');
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
        'protocol': protocol?.toValue() ?? '',
      },
    );

    return CreateContactMethodResult.fromJson(jsonResponse.body);
  }

  /// Creates an Amazon Lightsail container service.
  ///
  /// A Lightsail container service is a compute resource to which you can
  /// deploy containers. For more information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-containers">Container
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
  /// and it's located in the US East (Ohio) AWS region
  /// (<code>us-east-2</code>), then the domain for your container service will
  /// be like the following example:
  /// <code>https://container-service-1.ur4EXAMPLE2uq.us-east-2.cs.amazonlightsail.com</code>
  ///
  /// The following are the requirements for container service names:
  ///
  /// <ul>
  /// <li>
  /// Must be unique within each AWS Region in your Lightsail account.
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
  /// The tag keys and optional values for the container service.
  ///
  /// For more information about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
  /// Dev Guide</a>.
  Future<CreateContainerServiceResult> createContainerService({
    @_s.required ContainerServicePowerName power,
    @_s.required int scale,
    @_s.required String serviceName,
    ContainerServiceDeploymentRequest deployment,
    Map<String, List<String>> publicDomainNames,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(power, 'power');
    ArgumentError.checkNotNull(scale, 'scale');
    _s.validateNumRange(
      'scale',
      scale,
      1,
      20,
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceName, 'serviceName');
    _s.validateStringLength(
      'serviceName',
      serviceName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceName',
      serviceName,
      r'''^[a-z0-9]{1,2}|[a-z0-9][a-z0-9-]+[a-z0-9]$''',
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
        'power': power?.toValue() ?? '',
        'scale': scale,
        'serviceName': serviceName,
        if (deployment != null) 'deployment': deployment,
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
  /// from a public registry like Docker Hub, or from your local machine. For
  /// more information, see <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-creating-container-images">Creating
  /// container images for your Amazon Lightsail container services</a> in the
  /// <i>Lightsail Dev Guide</i>.
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
    @_s.required String serviceName,
    Map<String, Container> containers,
    EndpointRequest publicEndpoint,
  }) async {
    ArgumentError.checkNotNull(serviceName, 'serviceName');
    _s.validateStringLength(
      'serviceName',
      serviceName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceName',
      serviceName,
      r'''^[a-z0-9]{1,2}|[a-z0-9][a-z0-9-]+[a-z0-9]$''',
      isRequired: true,
    );
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
  /// your Lightsail account. You cannot pull container images perform any other
  /// container image management actions on the container service registry of
  /// your Lightsail account.
  /// </note>
  /// After you push your container images to the container image registry of
  /// your Lightsail account, use the <code>RegisterContainerImage</code> action
  /// to register the pushed images to a specific Lightsail container service.
  /// <note>
  /// This action is not required if you install and use the Lightsail Control
  /// (lightsailctl) plugin to push container images to your Lightsail container
  /// service. For more information, see <a
  /// href="amazon-lightsail-pushing-container-images">Pushing and managing
  /// container images on your Amazon Lightsail container services</a> in the
  /// <i>Lightsail Dev Guide</i>.
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
  /// instance in the same Availability Zone (e.g., <code>us-east-2a</code>).
  ///
  /// The <code>create disk</code> operation supports tag-based access control
  /// via request tags. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
  /// The Availability Zone where you want to create the disk (e.g.,
  /// <code>us-east-2a</code>). Use the same Availability Zone as the Lightsail
  /// instance to which you want to attach the disk.
  ///
  /// Use the <code>get regions</code> operation to list the Availability Zones
  /// where Lightsail is currently available.
  ///
  /// Parameter [diskName] :
  /// The unique Lightsail disk name (e.g., <code>my-disk</code>).
  ///
  /// Parameter [sizeInGb] :
  /// The size of the disk in GB (e.g., <code>32</code>).
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
    @_s.required String availabilityZone,
    @_s.required String diskName,
    @_s.required int sizeInGb,
    List<AddOnRequest> addOns,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(availabilityZone, 'availabilityZone');
    _s.validateStringPattern(
      'availabilityZone',
      availabilityZone,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(diskName, 'diskName');
    _s.validateStringPattern(
      'diskName',
      diskName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sizeInGb, 'sizeInGb');
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
  /// in the same Availability Zone (e.g., <code>us-east-2a</code>).
  ///
  /// The <code>create disk from snapshot</code> operation supports tag-based
  /// access control via request tags and resource tags applied to the resource
  /// identified by <code>disk snapshot name</code>. For more information, see
  /// the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
  /// The Availability Zone where you want to create the disk (e.g.,
  /// <code>us-east-2a</code>). Choose the same Availability Zone as the
  /// Lightsail instance where you want to create the disk.
  ///
  /// Use the GetRegions operation to list the Availability Zones where
  /// Lightsail is currently available.
  ///
  /// Parameter [diskName] :
  /// The unique Lightsail disk name (e.g., <code>my-disk</code>).
  ///
  /// Parameter [sizeInGb] :
  /// The size of the disk in GB (e.g., <code>32</code>).
  ///
  /// Parameter [addOns] :
  /// An array of objects that represent the add-ons to enable for the new disk.
  ///
  /// Parameter [diskSnapshotName] :
  /// The name of the disk snapshot (e.g., <code>my-snapshot</code>) from which
  /// to create the new storage disk.
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail
  /// Dev Guide</a>.
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail
  /// Dev Guide</a>.
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail
  /// Dev Guide</a>.
  /// </li>
  /// </ul>
  Future<CreateDiskFromSnapshotResult> createDiskFromSnapshot({
    @_s.required String availabilityZone,
    @_s.required String diskName,
    @_s.required int sizeInGb,
    List<AddOnRequest> addOns,
    String diskSnapshotName,
    String restoreDate,
    String sourceDiskName,
    List<Tag> tags,
    bool useLatestRestorableAutoSnapshot,
  }) async {
    ArgumentError.checkNotNull(availabilityZone, 'availabilityZone');
    _s.validateStringPattern(
      'availabilityZone',
      availabilityZone,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(diskName, 'diskName');
    _s.validateStringPattern(
      'diskName',
      diskName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(sizeInGb, 'sizeInGb');
    _s.validateStringPattern(
      'diskSnapshotName',
      diskSnapshotName,
      r'''\w[\w\-]*\w''',
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
  /// The name of the destination disk snapshot (e.g.,
  /// <code>my-disk-snapshot</code>) based on the source disk.
  ///
  /// Parameter [diskName] :
  /// The unique name of the source disk (e.g., <code>Disk-Virginia-1</code>).
  /// <note>
  /// This parameter cannot be defined together with the <code>instance
  /// name</code> parameter. The <code>disk name</code> and <code>instance
  /// name</code> parameters are mutually exclusive.
  /// </note>
  ///
  /// Parameter [instanceName] :
  /// The unique name of the source instance (e.g.,
  /// <code>Amazon_Linux-512MB-Virginia-1</code>). When this is defined, a
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
    @_s.required String diskSnapshotName,
    String diskName,
    String instanceName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(diskSnapshotName, 'diskSnapshotName');
    _s.validateStringPattern(
      'diskSnapshotName',
      diskSnapshotName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'diskName',
      diskName,
      r'''\w[\w\-]*\w''',
    );
    _s.validateStringPattern(
      'instanceName',
      instanceName,
      r'''\w[\w\-]*\w''',
    );
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
  /// a Lightsail instance or load balancer.
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
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the distribution during create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  Future<CreateDistributionResult> createDistribution({
    @_s.required String bundleId,
    @_s.required CacheBehavior defaultCacheBehavior,
    @_s.required String distributionName,
    @_s.required InputOrigin origin,
    CacheSettings cacheBehaviorSettings,
    List<CacheBehaviorPerPath> cacheBehaviors,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(bundleId, 'bundleId');
    ArgumentError.checkNotNull(defaultCacheBehavior, 'defaultCacheBehavior');
    ArgumentError.checkNotNull(distributionName, 'distributionName');
    _s.validateStringPattern(
      'distributionName',
      distributionName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(origin, 'origin');
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
        if (tags != null) 'tags': tags,
      },
    );

    return CreateDistributionResult.fromJson(jsonResponse.body);
  }

  /// Creates a domain resource for the specified domain (e.g., example.com).
  ///
  /// The <code>create domain</code> operation supports tag-based access control
  /// via request tags. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
  /// The domain name to manage (e.g., <code>example.com</code>).
  /// <note>
  /// You cannot register a new domain name using Lightsail. You must register a
  /// domain name using Amazon Route 53 or another domain name registrar. If you
  /// have already registered your domain, you can enter its name in this
  /// parameter to manage the DNS records for that domain.
  /// </note>
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the resource during create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  Future<CreateDomainResult> createDomain({
    @_s.required String domainName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
  /// The domain name (e.g., <code>example.com</code>) for which you want to
  /// create the domain entry.
  Future<CreateDomainEntryResult> createDomainEntry({
    @_s.required DomainEntry domainEntry,
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainEntry, 'domainEntry');
    ArgumentError.checkNotNull(domainName, 'domainName');
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

  /// Creates a snapshot of a specific virtual private server, or
  /// <i>instance</i>. You can use a snapshot to create a new instance that is
  /// based on that snapshot.
  ///
  /// The <code>create instance snapshot</code> operation supports tag-based
  /// access control via request tags. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String instanceName,
    @_s.required String instanceSnapshotName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(instanceName, 'instanceName');
    _s.validateStringPattern(
      'instanceName',
      instanceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceSnapshotName, 'instanceSnapshotName');
    _s.validateStringPattern(
      'instanceSnapshotName',
      instanceSnapshotName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
  /// The ID for a virtual private server image (e.g.,
  /// <code>app_wordpress_4_4</code> or <code>app_lamp_7_0</code>). Use the
  /// <code>get blueprints</code> operation to return a list of available images
  /// (or <i>blueprints</i>).
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
  /// (or <i>instance</i>), including the pricing plan (e.g.,
  /// <code>micro_1_0</code>).
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
  /// (Deprecated) The name for your custom image.
  /// <note>
  /// In releases prior to June 12, 2017, this parameter was ignored by the API.
  /// It is now deprecated.
  /// </note>
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/getting-started/article/compare-options-choose-lightsail-instance-image">Dev
  /// Guide</a>.
  /// </note>
  Future<CreateInstancesResult> createInstances({
    @_s.required String availabilityZone,
    @_s.required String blueprintId,
    @_s.required String bundleId,
    @_s.required List<String> instanceNames,
    List<AddOnRequest> addOns,
    String customImageName,
    String keyPairName,
    List<Tag> tags,
    String userData,
  }) async {
    ArgumentError.checkNotNull(availabilityZone, 'availabilityZone');
    ArgumentError.checkNotNull(blueprintId, 'blueprintId');
    _s.validateStringPattern(
      'blueprintId',
      blueprintId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(bundleId, 'bundleId');
    _s.validateStringPattern(
      'bundleId',
      bundleId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceNames, 'instanceNames');
    _s.validateStringPattern(
      'customImageName',
      customImageName,
      r'''\w[\w\-]*\w''',
    );
    _s.validateStringPattern(
      'keyPairName',
      keyPairName,
      r'''\w[\w\-]*\w''',
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
  /// (or <i>instance</i>), including the pricing plan (e.g.,
  /// <code>micro_1_0</code>).
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail
  /// Dev Guide</a>.
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail
  /// Dev Guide</a>.
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail
  /// Dev Guide</a>.
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/getting-started/article/compare-options-choose-lightsail-instance-image">Dev
  /// Guide</a>.
  /// </note>
  Future<CreateInstancesFromSnapshotResult> createInstancesFromSnapshot({
    @_s.required String availabilityZone,
    @_s.required String bundleId,
    @_s.required List<String> instanceNames,
    List<AddOnRequest> addOns,
    Map<String, List<DiskMap>> attachedDiskMapping,
    String instanceSnapshotName,
    String keyPairName,
    String restoreDate,
    String sourceInstanceName,
    List<Tag> tags,
    bool useLatestRestorableAutoSnapshot,
    String userData,
  }) async {
    ArgumentError.checkNotNull(availabilityZone, 'availabilityZone');
    ArgumentError.checkNotNull(bundleId, 'bundleId');
    _s.validateStringPattern(
      'bundleId',
      bundleId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceNames, 'instanceNames');
    _s.validateStringPattern(
      'instanceSnapshotName',
      instanceSnapshotName,
      r'''\w[\w\-]*\w''',
    );
    _s.validateStringPattern(
      'keyPairName',
      keyPairName,
      r'''\w[\w\-]*\w''',
    );
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

  /// Creates an SSH key pair.
  ///
  /// The <code>create key pair</code> operation supports tag-based access
  /// control via request tags. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String keyPairName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(keyPairName, 'keyPairName');
    _s.validateStringPattern(
      'keyPairName',
      keyPairName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/how-to/article/configure-lightsail-instances-for-load-balancing">Configure
  /// your Lightsail instances for load balancing</a>. You can create up to 5
  /// load balancers per AWS Region in your account.
  ///
  /// When you create a load balancer, you can specify a unique name and port
  /// settings. To change additional load balancer settings, use the
  /// <code>UpdateLoadBalancerAttribute</code> operation.
  ///
  /// The <code>create load balancer</code> operation supports tag-based access
  /// control via request tags. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
  /// certificate (e.g., <code>www.example.com</code>, <code>example.com</code>,
  /// <code>m.example.com</code>, <code>blog.example.com</code>).
  ///
  /// Parameter [certificateDomainName] :
  /// The domain name with which your certificate is associated (e.g.,
  /// <code>example.com</code>).
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
  /// website (e.g., <code>"/"</code>).
  ///
  /// You may want to specify a custom health check path other than the root of
  /// your application if your home page loads slowly or has a lot of media or
  /// scripting on it.
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the resource during create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  Future<CreateLoadBalancerResult> createLoadBalancer({
    @_s.required int instancePort,
    @_s.required String loadBalancerName,
    List<String> certificateAlternativeNames,
    String certificateDomainName,
    String certificateName,
    String healthCheckPath,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(instancePort, 'instancePort');
    _s.validateNumRange(
      'instancePort',
      instancePort,
      -1,
      65535,
      isRequired: true,
    );
    ArgumentError.checkNotNull(loadBalancerName, 'loadBalancerName');
    _s.validateStringPattern(
      'loadBalancerName',
      loadBalancerName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateName',
      certificateName,
      r'''\w[\w\-]*\w''',
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
        if (tags != null) 'tags': tags,
      },
    );

    return CreateLoadBalancerResult.fromJson(jsonResponse.body);
  }

  /// Creates a Lightsail load balancer TLS certificate.
  ///
  /// TLS is just an updated, more secure version of Secure Socket Layer (SSL).
  ///
  /// The <code>CreateLoadBalancerTlsCertificate</code> operation supports
  /// tag-based access control via resource tags applied to the resource
  /// identified by <code>load balancer name</code>. For more information, see
  /// the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
  /// The domain name (e.g., <code>example.com</code>) for your SSL/TLS
  /// certificate.
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
  /// domain). We do not support wildcards (e.g., <code>*.example.com</code>).
  ///
  /// Parameter [tags] :
  /// The tag keys and optional values to add to the resource during create.
  ///
  /// Use the <code>TagResource</code> action to tag a resource after it's
  /// created.
  Future<CreateLoadBalancerTlsCertificateResult>
      createLoadBalancerTlsCertificate({
    @_s.required String certificateDomainName,
    @_s.required String certificateName,
    @_s.required String loadBalancerName,
    List<String> certificateAlternativeNames,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(certificateDomainName, 'certificateDomainName');
    ArgumentError.checkNotNull(certificateName, 'certificateName');
    _s.validateStringPattern(
      'certificateName',
      certificateName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(loadBalancerName, 'loadBalancerName');
    _s.validateStringPattern(
      'loadBalancerName',
      loadBalancerName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
  /// The name of the master database created when the Lightsail database
  /// resource is created.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Must contain from 1 to 64 alphanumeric characters.
  /// </li>
  /// <li>
  /// Cannot be a word reserved by the specified database engine
  /// </li>
  /// </ul>
  ///
  /// Parameter [masterUsername] :
  /// The master user name for your new database.
  ///
  /// Constraints:
  ///
  /// <ul>
  /// <li>
  /// Master user name is required.
  /// </li>
  /// <li>
  /// Must contain from 1 to 16 alphanumeric characters.
  /// </li>
  /// <li>
  /// The first character must be a letter.
  /// </li>
  /// <li>
  /// Cannot be a reserved word for the database engine you choose.
  ///
  /// For more information about reserved words in MySQL 5.6 or 5.7, see the
  /// Keywords and Reserved Words articles for <a
  /// href="https://dev.mysql.com/doc/refman/5.6/en/keywords.html">MySQL 5.6</a>
  /// or <a href="https://dev.mysql.com/doc/refman/5.7/en/keywords.html">MySQL
  /// 5.7</a> respectively.
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
  /// The name to use for your new database.
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
  /// The password for the master user of your new database. The password can
  /// include any printable ASCII character except "/", """, or "@".
  ///
  /// Constraints: Must contain 8 to 41 characters.
  ///
  /// Parameter [preferredBackupWindow] :
  /// The daily time range during which automated backups are created for your
  /// new database if automated backups are enabled.
  ///
  /// The default is a 30-minute window selected at random from an 8-hour block
  /// of time for each AWS Region. For more information about the preferred
  /// backup window time blocks for each region, see the <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html#USER_WorkingWithAutomatedBackups.BackupWindow">Working
  /// With Backups</a> guide in the Amazon Relational Database Service (Amazon
  /// RDS) documentation.
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
    @_s.required String masterDatabaseName,
    @_s.required String masterUsername,
    @_s.required String relationalDatabaseBlueprintId,
    @_s.required String relationalDatabaseBundleId,
    @_s.required String relationalDatabaseName,
    String availabilityZone,
    String masterUserPassword,
    String preferredBackupWindow,
    String preferredMaintenanceWindow,
    bool publiclyAccessible,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(masterDatabaseName, 'masterDatabaseName');
    ArgumentError.checkNotNull(masterUsername, 'masterUsername');
    ArgumentError.checkNotNull(
        relationalDatabaseBlueprintId, 'relationalDatabaseBlueprintId');
    ArgumentError.checkNotNull(
        relationalDatabaseBundleId, 'relationalDatabaseBundleId');
    ArgumentError.checkNotNull(
        relationalDatabaseName, 'relationalDatabaseName');
    _s.validateStringPattern(
      'relationalDatabaseName',
      relationalDatabaseName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
  /// The name to use for your new database.
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
    @_s.required String relationalDatabaseName,
    String availabilityZone,
    bool publiclyAccessible,
    String relationalDatabaseBundleId,
    String relationalDatabaseSnapshotName,
    DateTime restoreTime,
    String sourceRelationalDatabaseName,
    List<Tag> tags,
    bool useLatestRestorableTime,
  }) async {
    ArgumentError.checkNotNull(
        relationalDatabaseName, 'relationalDatabaseName');
    _s.validateStringPattern(
      'relationalDatabaseName',
      relationalDatabaseName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'relationalDatabaseSnapshotName',
      relationalDatabaseSnapshotName,
      r'''\w[\w\-]*\w''',
    );
    _s.validateStringPattern(
      'sourceRelationalDatabaseName',
      sourceRelationalDatabaseName,
      r'''\w[\w\-]*\w''',
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String relationalDatabaseName,
    @_s.required String relationalDatabaseSnapshotName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(
        relationalDatabaseName, 'relationalDatabaseName');
    _s.validateStringPattern(
      'relationalDatabaseName',
      relationalDatabaseName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        relationalDatabaseSnapshotName, 'relationalDatabaseSnapshotName');
    _s.validateStringPattern(
      'relationalDatabaseSnapshotName',
      relationalDatabaseSnapshotName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    @_s.required String alarmName,
  }) async {
    ArgumentError.checkNotNull(alarmName, 'alarmName');
    _s.validateStringPattern(
      'alarmName',
      alarmName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String date,
    @_s.required String resourceName,
  }) async {
    ArgumentError.checkNotNull(date, 'date');
    _s.validateStringPattern(
      'date',
      date,
      r'''^[0-9]{4}-[0-9]{2}-[0-9]{2}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    _s.validateStringPattern(
      'resourceName',
      resourceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    @_s.required String certificateName,
  }) async {
    ArgumentError.checkNotNull(certificateName, 'certificateName');
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
  /// number contact method in each AWS Region. However, SMS text messaging is
  /// not supported in some AWS Regions, and SMS text messages cannot be sent to
  /// some countries/regions. For more information, see <a
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
    @_s.required ContactProtocol protocol,
  }) async {
    ArgumentError.checkNotNull(protocol, 'protocol');
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
        'protocol': protocol?.toValue() ?? '',
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
    @_s.required String image,
    @_s.required String serviceName,
  }) async {
    ArgumentError.checkNotNull(image, 'image');
    ArgumentError.checkNotNull(serviceName, 'serviceName');
    _s.validateStringLength(
      'serviceName',
      serviceName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceName',
      serviceName,
      r'''^[a-z0-9]{1,2}|[a-z0-9][a-z0-9-]+[a-z0-9]$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteContainerImage'
    };
    final jsonResponse = await _protocol.send(
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

    return DeleteContainerImageResult.fromJson(jsonResponse.body);
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
    @_s.required String serviceName,
  }) async {
    ArgumentError.checkNotNull(serviceName, 'serviceName');
    _s.validateStringLength(
      'serviceName',
      serviceName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceName',
      serviceName,
      r'''^[a-z0-9]{1,2}|[a-z0-9][a-z0-9-]+[a-z0-9]$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Lightsail_20161128.DeleteContainerService'
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

    return DeleteContainerServiceResult.fromJson(jsonResponse.body);
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
  /// The unique name of the disk you want to delete (e.g.,
  /// <code>my-disk</code>).
  ///
  /// Parameter [forceDeleteAddOns] :
  /// A Boolean value to indicate whether to delete the enabled add-ons for the
  /// disk.
  Future<DeleteDiskResult> deleteDisk({
    @_s.required String diskName,
    bool forceDeleteAddOns,
  }) async {
    ArgumentError.checkNotNull(diskName, 'diskName');
    _s.validateStringPattern(
      'diskName',
      diskName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
  /// The name of the disk snapshot you want to delete (e.g.,
  /// <code>my-disk-snapshot</code>).
  Future<DeleteDiskSnapshotResult> deleteDiskSnapshot({
    @_s.required String diskSnapshotName,
  }) async {
    ArgumentError.checkNotNull(diskSnapshotName, 'diskSnapshotName');
    _s.validateStringPattern(
      'diskSnapshotName',
      diskSnapshotName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    String distributionName,
  }) async {
    _s.validateStringPattern(
      'distributionName',
      distributionName,
      r'''\w[\w\-]*\w''',
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required DomainEntry domainEntry,
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainEntry, 'domainEntry');
    ArgumentError.checkNotNull(domainName, 'domainName');
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
  /// A Boolean value to indicate whether to delete the enabled add-ons for the
  /// disk.
  Future<DeleteInstanceResult> deleteInstance({
    @_s.required String instanceName,
    bool forceDeleteAddOns,
  }) async {
    ArgumentError.checkNotNull(instanceName, 'instanceName');
    _s.validateStringPattern(
      'instanceName',
      instanceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String instanceSnapshotName,
  }) async {
    ArgumentError.checkNotNull(instanceSnapshotName, 'instanceSnapshotName');
    _s.validateStringPattern(
      'instanceSnapshotName',
      instanceSnapshotName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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

  /// Deletes a specific SSH key pair.
  ///
  /// The <code>delete key pair</code> operation supports tag-based access
  /// control via resource tags applied to the resource identified by <code>key
  /// pair name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
  Future<DeleteKeyPairResult> deleteKeyPair({
    @_s.required String keyPairName,
  }) async {
    ArgumentError.checkNotNull(keyPairName, 'keyPairName');
    _s.validateStringPattern(
      'keyPairName',
      keyPairName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-troubleshooting-browser-based-ssh-rdp-client-connection">Troubleshooting
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
    @_s.required String instanceName,
  }) async {
    ArgumentError.checkNotNull(instanceName, 'instanceName');
    _s.validateStringPattern(
      'instanceName',
      instanceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String loadBalancerName,
  }) async {
    ArgumentError.checkNotNull(loadBalancerName, 'loadBalancerName');
    _s.validateStringPattern(
      'loadBalancerName',
      loadBalancerName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String certificateName,
    @_s.required String loadBalancerName,
    bool force,
  }) async {
    ArgumentError.checkNotNull(certificateName, 'certificateName');
    _s.validateStringPattern(
      'certificateName',
      certificateName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(loadBalancerName, 'loadBalancerName');
    _s.validateStringPattern(
      'loadBalancerName',
      loadBalancerName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String relationalDatabaseName,
    String finalRelationalDatabaseSnapshotName,
    bool skipFinalSnapshot,
  }) async {
    ArgumentError.checkNotNull(
        relationalDatabaseName, 'relationalDatabaseName');
    _s.validateStringPattern(
      'relationalDatabaseName',
      relationalDatabaseName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'finalRelationalDatabaseSnapshotName',
      finalRelationalDatabaseSnapshotName,
      r'''\w[\w\-]*\w''',
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String relationalDatabaseSnapshotName,
  }) async {
    ArgumentError.checkNotNull(
        relationalDatabaseSnapshotName, 'relationalDatabaseSnapshotName');
    _s.validateStringPattern(
      'relationalDatabaseSnapshotName',
      relationalDatabaseSnapshotName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    @_s.required String distributionName,
  }) async {
    ArgumentError.checkNotNull(distributionName, 'distributionName');
    _s.validateStringPattern(
      'distributionName',
      distributionName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
  /// The unique name of the disk you want to detach from your instance (e.g.,
  /// <code>my-disk</code>).
  Future<DetachDiskResult> detachDisk({
    @_s.required String diskName,
  }) async {
    ArgumentError.checkNotNull(diskName, 'diskName');
    _s.validateStringPattern(
      'diskName',
      diskName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required List<String> instanceNames,
    @_s.required String loadBalancerName,
  }) async {
    ArgumentError.checkNotNull(instanceNames, 'instanceNames');
    ArgumentError.checkNotNull(loadBalancerName, 'loadBalancerName');
    _s.validateStringPattern(
      'loadBalancerName',
      loadBalancerName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    @_s.required String staticIpName,
  }) async {
    ArgumentError.checkNotNull(staticIpName, 'staticIpName');
    _s.validateStringPattern(
      'staticIpName',
      staticIpName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail
  /// Dev Guide</a>.
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
    @_s.required AddOnType addOnType,
    @_s.required String resourceName,
  }) async {
    ArgumentError.checkNotNull(addOnType, 'addOnType');
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    _s.validateStringPattern(
      'resourceName',
      resourceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
        'addOnType': addOnType?.toValue() ?? '',
        'resourceName': resourceName,
      },
    );

    return DisableAddOnResult.fromJson(jsonResponse.body);
  }

  /// Downloads the default SSH key pair from the user's account.
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail
  /// Dev Guide</a>.
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
    @_s.required AddOnRequest addOnRequest,
    @_s.required String resourceName,
  }) async {
    ArgumentError.checkNotNull(addOnRequest, 'addOnRequest');
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    _s.validateStringPattern(
      'resourceName',
      resourceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String sourceSnapshotName,
  }) async {
    ArgumentError.checkNotNull(sourceSnapshotName, 'sourceSnapshotName');
    _s.validateStringPattern(
      'sourceSnapshotName',
      sourceSnapshotName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    String pageToken,
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
    String alarmName,
    String monitoredResourceName,
    String pageToken,
  }) async {
    _s.validateStringPattern(
      'alarmName',
      alarmName,
      r'''\w[\w\-]*\w''',
    );
    _s.validateStringPattern(
      'monitoredResourceName',
      monitoredResourceName,
      r'''\w[\w\-]*\w''',
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String resourceName,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    _s.validateStringPattern(
      'resourceName',
      resourceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// Parameter [includeInactive] :
  /// A Boolean value indicating whether to include inactive results in your
  /// request.
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetBlueprints</code>
  /// request. If your results are paginated, the response will return a next
  /// page token that you can specify as the page token in a subsequent request.
  Future<GetBlueprintsResult> getBlueprints({
    bool includeInactive,
    String pageToken,
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
        if (includeInactive != null) 'includeInactive': includeInactive,
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetBlueprintsResult.fromJson(jsonResponse.body);
  }

  /// Returns the list of bundles that are available for purchase. A bundle
  /// describes the specs for your virtual private server (or <i>instance</i>).
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
  /// A Boolean value that indicates whether to include inactive bundle results
  /// in your request.
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetBundles</code> request.
  /// If your results are paginated, the response will return a next page token
  /// that you can specify as the page token in a subsequent request.
  Future<GetBundlesResult> getBundles({
    bool includeInactive,
    String pageToken,
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
        if (includeInactive != null) 'includeInactive': includeInactive,
        if (pageToken != null) 'pageToken': pageToken,
      },
    );

    return GetBundlesResult.fromJson(jsonResponse.body);
  }

  /// Returns information about one or more Amazon Lightsail SSL/TLS
  /// certificates.
  /// <note>
  /// To get a summary of a certificate, ommit
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
  /// When omitted, the response includes all of your certificates in the AWS
  /// Region where the request is made.
  ///
  /// Parameter [certificateStatuses] :
  /// The status of the certificates for which to return information.
  ///
  /// For example, specify <code>ISSUED</code> to return only certificates with
  /// an <code>ISSUED</code> status.
  ///
  /// When omitted, the response includes all of your certificates in the AWS
  /// Region where the request is made, regardless of their current status.
  ///
  /// Parameter [includeCertificateDetails] :
  /// Indicates whether to include detailed information about the certificates
  /// in the response.
  ///
  /// When omitted, the response includes only the certificate names, Amazon
  /// Resource Names (ARNs), domain names, and tags.
  Future<GetCertificatesResult> getCertificates({
    String certificateName,
    List<CertificateStatus> certificateStatuses,
    bool includeCertificateDetails,
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
              certificateStatuses.map((e) => e?.toValue() ?? '').toList(),
        if (includeCertificateDetails != null)
          'includeCertificateDetails': includeCertificateDetails,
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
    String pageToken,
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
  /// number contact method in each AWS Region. However, SMS text messaging is
  /// not supported in some AWS Regions, and SMS text messages cannot be sent to
  /// some countries/regions. For more information, see <a
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
    List<ContactProtocol> protocols,
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
          'protocols': protocols.map((e) => e?.toValue() ?? '').toList(),
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
    @_s.required String serviceName,
  }) async {
    ArgumentError.checkNotNull(serviceName, 'serviceName');
    _s.validateStringLength(
      'serviceName',
      serviceName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceName',
      serviceName,
      r'''^[a-z0-9]{1,2}|[a-z0-9][a-z0-9-]+[a-z0-9]$''',
      isRequired: true,
    );
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
  /// Lightsail endpoints and quotas</a> in the <i>AWS General Reference</i>.
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
    @_s.required String containerName,
    @_s.required String serviceName,
    DateTime endTime,
    String filterPattern,
    String pageToken,
    DateTime startTime,
  }) async {
    ArgumentError.checkNotNull(containerName, 'containerName');
    ArgumentError.checkNotNull(serviceName, 'serviceName');
    _s.validateStringLength(
      'serviceName',
      serviceName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceName',
      serviceName,
      r'''^[a-z0-9]{1,2}|[a-z0-9][a-z0-9-]+[a-z0-9]$''',
      isRequired: true,
    );
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
  /// Lightsail endpoints and quotas</a> in the <i>AWS General Reference</i>.
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
    @_s.required String serviceName,
  }) async {
    ArgumentError.checkNotNull(serviceName, 'serviceName');
    _s.validateStringLength(
      'serviceName',
      serviceName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceName',
      serviceName,
      r'''^[a-z0-9]{1,2}|[a-z0-9][a-z0-9-]+[a-z0-9]$''',
      isRequired: true,
    );
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
    @_s.required DateTime endTime,
    @_s.required ContainerServiceMetricName metricName,
    @_s.required int period,
    @_s.required String serviceName,
    @_s.required DateTime startTime,
    @_s.required List<MetricStatistic> statistics,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(metricName, 'metricName');
    ArgumentError.checkNotNull(period, 'period');
    _s.validateNumRange(
      'period',
      period,
      60,
      86400,
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceName, 'serviceName');
    _s.validateStringLength(
      'serviceName',
      serviceName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceName',
      serviceName,
      r'''^[a-z0-9]{1,2}|[a-z0-9][a-z0-9-]+[a-z0-9]$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(startTime, 'startTime');
    ArgumentError.checkNotNull(statistics, 'statistics');
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
        'metricName': metricName?.toValue() ?? '',
        'period': period,
        'serviceName': serviceName,
        'startTime': unixTimestampToJson(startTime),
        'statistics': statistics?.map((e) => e?.toValue() ?? '')?.toList(),
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
  /// AWS Region where the request is made.
  Future<ContainerServicesListResult> getContainerServices({
    String serviceName,
  }) async {
    _s.validateStringLength(
      'serviceName',
      serviceName,
      1,
      63,
    );
    _s.validateStringPattern(
      'serviceName',
      serviceName,
      r'''^[a-z0-9]{1,2}|[a-z0-9][a-z0-9-]+[a-z0-9]$''',
    );
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
  /// The name of the disk (e.g., <code>my-disk</code>).
  Future<GetDiskResult> getDisk({
    @_s.required String diskName,
  }) async {
    ArgumentError.checkNotNull(diskName, 'diskName');
    _s.validateStringPattern(
      'diskName',
      diskName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// The name of the disk snapshot (e.g., <code>my-disk-snapshot</code>).
  Future<GetDiskSnapshotResult> getDiskSnapshot({
    @_s.required String diskSnapshotName,
  }) async {
    ArgumentError.checkNotNull(diskSnapshotName, 'diskSnapshotName');
    _s.validateStringPattern(
      'diskSnapshotName',
      diskSnapshotName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    String pageToken,
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
    String pageToken,
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

  /// Returns the list bundles that can be applied to you Amazon Lightsail
  /// content delivery network (CDN) distributions.
  ///
  /// A distribution bundle specifies the monthly network transfer quota and
  /// monthly cost of your dsitribution.
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
    String distributionName,
  }) async {
    _s.validateStringPattern(
      'distributionName',
      distributionName,
      r'''\w[\w\-]*\w''',
    );
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
    @_s.required String distributionName,
    @_s.required DateTime endTime,
    @_s.required DistributionMetricName metricName,
    @_s.required int period,
    @_s.required DateTime startTime,
    @_s.required List<MetricStatistic> statistics,
    @_s.required MetricUnit unit,
  }) async {
    ArgumentError.checkNotNull(distributionName, 'distributionName');
    _s.validateStringPattern(
      'distributionName',
      distributionName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(metricName, 'metricName');
    ArgumentError.checkNotNull(period, 'period');
    _s.validateNumRange(
      'period',
      period,
      60,
      86400,
      isRequired: true,
    );
    ArgumentError.checkNotNull(startTime, 'startTime');
    ArgumentError.checkNotNull(statistics, 'statistics');
    ArgumentError.checkNotNull(unit, 'unit');
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
        'metricName': metricName?.toValue() ?? '',
        'period': period,
        'startTime': unixTimestampToJson(startTime),
        'statistics': statistics?.map((e) => e?.toValue() ?? '')?.toList(),
        'unit': unit?.toValue() ?? '',
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
  /// Use the <code>GetDistributions</code> action to get a list of distribution
  /// names that you can specify.
  ///
  /// When omitted, the response includes all of your distributions in the AWS
  /// Region where the request is made.
  ///
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetDistributions</code>
  /// request. If your results are paginated, the response will return a next
  /// page token that you can specify as the page token in a subsequent request.
  Future<GetDistributionsResult> getDistributions({
    String distributionName,
    String pageToken,
  }) async {
    _s.validateStringPattern(
      'distributionName',
      distributionName,
      r'''\w[\w\-]*\w''',
    );
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
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainName, 'domainName');
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
    String pageToken,
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

  /// Returns the export snapshot record created as a result of the <code>export
  /// snapshot</code> operation.
  ///
  /// An export snapshot record can be used to create a new Amazon EC2 instance
  /// and its related resources with the <code>create cloud formation
  /// stack</code> operation.
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
    String pageToken,
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
    @_s.required String instanceName,
  }) async {
    ArgumentError.checkNotNull(instanceName, 'instanceName');
    _s.validateStringPattern(
      'instanceName',
      instanceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String instanceName,
    InstanceAccessProtocol protocol,
  }) async {
    ArgumentError.checkNotNull(instanceName, 'instanceName');
    _s.validateStringPattern(
      'instanceName',
      instanceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    @_s.required DateTime endTime,
    @_s.required String instanceName,
    @_s.required InstanceMetricName metricName,
    @_s.required int period,
    @_s.required DateTime startTime,
    @_s.required List<MetricStatistic> statistics,
    @_s.required MetricUnit unit,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(instanceName, 'instanceName');
    _s.validateStringPattern(
      'instanceName',
      instanceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(metricName, 'metricName');
    ArgumentError.checkNotNull(period, 'period');
    _s.validateNumRange(
      'period',
      period,
      60,
      86400,
      isRequired: true,
    );
    ArgumentError.checkNotNull(startTime, 'startTime');
    ArgumentError.checkNotNull(statistics, 'statistics');
    ArgumentError.checkNotNull(unit, 'unit');
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
        'metricName': metricName?.toValue() ?? '',
        'period': period,
        'startTime': unixTimestampToJson(startTime),
        'statistics': statistics?.map((e) => e?.toValue() ?? '')?.toList(),
        'unit': unit?.toValue() ?? '',
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
    @_s.required String instanceName,
  }) async {
    ArgumentError.checkNotNull(instanceName, 'instanceName');
    _s.validateStringPattern(
      'instanceName',
      instanceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    @_s.required String instanceSnapshotName,
  }) async {
    ArgumentError.checkNotNull(instanceSnapshotName, 'instanceSnapshotName');
    _s.validateStringPattern(
      'instanceSnapshotName',
      instanceSnapshotName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    String pageToken,
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
    @_s.required String instanceName,
  }) async {
    ArgumentError.checkNotNull(instanceName, 'instanceName');
    _s.validateStringPattern(
      'instanceName',
      instanceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    String pageToken,
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
    @_s.required String keyPairName,
  }) async {
    ArgumentError.checkNotNull(keyPairName, 'keyPairName');
    _s.validateStringPattern(
      'keyPairName',
      keyPairName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial <code>GetKeyPairs</code> request.
  /// If your results are paginated, the response will return a next page token
  /// that you can specify as the page token in a subsequent request.
  Future<GetKeyPairsResult> getKeyPairs({
    String pageToken,
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
    @_s.required String loadBalancerName,
  }) async {
    ArgumentError.checkNotNull(loadBalancerName, 'loadBalancerName');
    _s.validateStringPattern(
      'loadBalancerName',
      loadBalancerName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    @_s.required DateTime endTime,
    @_s.required String loadBalancerName,
    @_s.required LoadBalancerMetricName metricName,
    @_s.required int period,
    @_s.required DateTime startTime,
    @_s.required List<MetricStatistic> statistics,
    @_s.required MetricUnit unit,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(loadBalancerName, 'loadBalancerName');
    _s.validateStringPattern(
      'loadBalancerName',
      loadBalancerName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(metricName, 'metricName');
    ArgumentError.checkNotNull(period, 'period');
    _s.validateNumRange(
      'period',
      period,
      60,
      86400,
      isRequired: true,
    );
    ArgumentError.checkNotNull(startTime, 'startTime');
    ArgumentError.checkNotNull(statistics, 'statistics');
    ArgumentError.checkNotNull(unit, 'unit');
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
        'metricName': metricName?.toValue() ?? '',
        'period': period,
        'startTime': unixTimestampToJson(startTime),
        'statistics': statistics?.map((e) => e?.toValue() ?? '')?.toList(),
        'unit': unit?.toValue() ?? '',
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
    @_s.required String loadBalancerName,
  }) async {
    ArgumentError.checkNotNull(loadBalancerName, 'loadBalancerName');
    _s.validateStringPattern(
      'loadBalancerName',
      loadBalancerName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    String pageToken,
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
    @_s.required String operationId,
  }) async {
    ArgumentError.checkNotNull(operationId, 'operationId');
    _s.validateStringPattern(
      'operationId',
      operationId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
    String pageToken,
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

  /// Gets operations for a specific resource (e.g., an instance or a static
  /// IP).
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
    @_s.required String resourceName,
    String pageToken,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    _s.validateStringPattern(
      'resourceName',
      resourceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// e.g., <code>us-east-2a</code>.
  ///
  /// Parameter [includeRelationalDatabaseAvailabilityZones] :
  /// A Boolean value indicating whether to also include Availability Zones for
  /// databases in your get regions request. Availability Zones are indicated
  /// with a letter (e.g., <code>us-east-2a</code>).
  Future<GetRegionsResult> getRegions({
    bool includeAvailabilityZones,
    bool includeRelationalDatabaseAvailabilityZones,
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
    @_s.required String relationalDatabaseName,
  }) async {
    ArgumentError.checkNotNull(
        relationalDatabaseName, 'relationalDatabaseName');
    _s.validateStringPattern(
      'relationalDatabaseName',
      relationalDatabaseName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    String pageToken,
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
  /// Parameter [pageToken] :
  /// The token to advance to the next page of results from your request.
  ///
  /// To get a page token, perform an initial
  /// <code>GetRelationalDatabaseBundles</code> request. If your results are
  /// paginated, the response will return a next page token that you can specify
  /// as the page token in a subsequent request.
  Future<GetRelationalDatabaseBundlesResult> getRelationalDatabaseBundles({
    String pageToken,
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
    @_s.required String relationalDatabaseName,
    int durationInMinutes,
    String pageToken,
  }) async {
    ArgumentError.checkNotNull(
        relationalDatabaseName, 'relationalDatabaseName');
    _s.validateStringPattern(
      'relationalDatabaseName',
      relationalDatabaseName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    @_s.required String logStreamName,
    @_s.required String relationalDatabaseName,
    DateTime endTime,
    String pageToken,
    bool startFromHead,
    DateTime startTime,
  }) async {
    ArgumentError.checkNotNull(logStreamName, 'logStreamName');
    ArgumentError.checkNotNull(
        relationalDatabaseName, 'relationalDatabaseName');
    _s.validateStringPattern(
      'relationalDatabaseName',
      relationalDatabaseName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    @_s.required String relationalDatabaseName,
  }) async {
    ArgumentError.checkNotNull(
        relationalDatabaseName, 'relationalDatabaseName');
    _s.validateStringPattern(
      'relationalDatabaseName',
      relationalDatabaseName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    @_s.required String relationalDatabaseName,
    RelationalDatabasePasswordVersion passwordVersion,
  }) async {
    ArgumentError.checkNotNull(
        relationalDatabaseName, 'relationalDatabaseName');
    _s.validateStringPattern(
      'relationalDatabaseName',
      relationalDatabaseName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    @_s.required DateTime endTime,
    @_s.required RelationalDatabaseMetricName metricName,
    @_s.required int period,
    @_s.required String relationalDatabaseName,
    @_s.required DateTime startTime,
    @_s.required List<MetricStatistic> statistics,
    @_s.required MetricUnit unit,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(metricName, 'metricName');
    ArgumentError.checkNotNull(period, 'period');
    _s.validateNumRange(
      'period',
      period,
      60,
      86400,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        relationalDatabaseName, 'relationalDatabaseName');
    _s.validateStringPattern(
      'relationalDatabaseName',
      relationalDatabaseName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(startTime, 'startTime');
    ArgumentError.checkNotNull(statistics, 'statistics');
    ArgumentError.checkNotNull(unit, 'unit');
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
        'metricName': metricName?.toValue() ?? '',
        'period': period,
        'relationalDatabaseName': relationalDatabaseName,
        'startTime': unixTimestampToJson(startTime),
        'statistics': statistics?.map((e) => e?.toValue() ?? '')?.toList(),
        'unit': unit?.toValue() ?? '',
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
    @_s.required String relationalDatabaseName,
    String pageToken,
  }) async {
    ArgumentError.checkNotNull(
        relationalDatabaseName, 'relationalDatabaseName');
    _s.validateStringPattern(
      'relationalDatabaseName',
      relationalDatabaseName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    @_s.required String relationalDatabaseSnapshotName,
  }) async {
    ArgumentError.checkNotNull(
        relationalDatabaseSnapshotName, 'relationalDatabaseSnapshotName');
    _s.validateStringPattern(
      'relationalDatabaseSnapshotName',
      relationalDatabaseSnapshotName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    String pageToken,
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
    String pageToken,
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

  /// Returns information about a specific static IP.
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
    @_s.required String staticIpName,
  }) async {
    ArgumentError.checkNotNull(staticIpName, 'staticIpName');
    _s.validateStringPattern(
      'staticIpName',
      staticIpName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    String pageToken,
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
    @_s.required String keyPairName,
    @_s.required String publicKeyBase64,
  }) async {
    ArgumentError.checkNotNull(keyPairName, 'keyPairName');
    _s.validateStringPattern(
      'keyPairName',
      keyPairName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(publicKeyBase64, 'publicKeyBase64');
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String instanceName,
    @_s.required PortInfo portInfo,
  }) async {
    ArgumentError.checkNotNull(instanceName, 'instanceName');
    _s.validateStringPattern(
      'instanceName',
      instanceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(portInfo, 'portInfo');
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

  /// Tries to peer the Lightsail VPC with the user's default VPC.
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
  /// specified contact protocol is not configured in the AWS Region, or if
  /// notifications are not enabled for the alarm using the
  /// <code>notificationEnabled</code> paramater.
  ///
  /// Use the <code>CreateContactMethod</code> action to configure a contact
  /// protocol in an AWS Region.
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
    @_s.required String alarmName,
    @_s.required ComparisonOperator comparisonOperator,
    @_s.required int evaluationPeriods,
    @_s.required MetricName metricName,
    @_s.required String monitoredResourceName,
    @_s.required double threshold,
    List<ContactProtocol> contactProtocols,
    int datapointsToAlarm,
    bool notificationEnabled,
    List<AlarmState> notificationTriggers,
    TreatMissingData treatMissingData,
  }) async {
    ArgumentError.checkNotNull(alarmName, 'alarmName');
    _s.validateStringPattern(
      'alarmName',
      alarmName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(comparisonOperator, 'comparisonOperator');
    ArgumentError.checkNotNull(evaluationPeriods, 'evaluationPeriods');
    ArgumentError.checkNotNull(metricName, 'metricName');
    ArgumentError.checkNotNull(monitoredResourceName, 'monitoredResourceName');
    _s.validateStringPattern(
      'monitoredResourceName',
      monitoredResourceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(threshold, 'threshold');
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
        'comparisonOperator': comparisonOperator?.toValue() ?? '',
        'evaluationPeriods': evaluationPeriods,
        'metricName': metricName?.toValue() ?? '',
        'monitoredResourceName': monitoredResourceName,
        'threshold': threshold,
        if (contactProtocols != null)
          'contactProtocols':
              contactProtocols.map((e) => e?.toValue() ?? '').toList(),
        if (datapointsToAlarm != null) 'datapointsToAlarm': datapointsToAlarm,
        if (notificationEnabled != null)
          'notificationEnabled': notificationEnabled,
        if (notificationTriggers != null)
          'notificationTriggers':
              notificationTriggers.map((e) => e?.toValue() ?? '').toList(),
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String instanceName,
    @_s.required List<PortInfo> portInfos,
  }) async {
    ArgumentError.checkNotNull(instanceName, 'instanceName');
    _s.validateStringPattern(
      'instanceName',
      instanceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(portInfos, 'portInfos');
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String instanceName,
  }) async {
    ArgumentError.checkNotNull(instanceName, 'instanceName');
    _s.validateStringPattern(
      'instanceName',
      instanceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String relationalDatabaseName,
  }) async {
    ArgumentError.checkNotNull(
        relationalDatabaseName, 'relationalDatabaseName');
    _s.validateStringPattern(
      'relationalDatabaseName',
      relationalDatabaseName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="amazon-lightsail-pushing-container-images">Pushing and managing
  /// container images on your Amazon Lightsail container services</a> in the
  /// <i>Lightsail Dev Guide</i>.
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
    @_s.required String digest,
    @_s.required String label,
    @_s.required String serviceName,
  }) async {
    ArgumentError.checkNotNull(digest, 'digest');
    ArgumentError.checkNotNull(label, 'label');
    _s.validateStringLength(
      'label',
      label,
      1,
      53,
      isRequired: true,
    );
    _s.validateStringPattern(
      'label',
      label,
      r'''^[a-z0-9]{1,2}|[a-z0-9][a-z0-9-]+[a-z0-9]$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceName, 'serviceName');
    _s.validateStringLength(
      'serviceName',
      serviceName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceName',
      serviceName,
      r'''^[a-z0-9]{1,2}|[a-z0-9][a-z0-9-]+[a-z0-9]$''',
      isRequired: true,
    );
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
    @_s.required String staticIpName,
  }) async {
    ArgumentError.checkNotNull(staticIpName, 'staticIpName');
    _s.validateStringPattern(
      'staticIpName',
      staticIpName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
    String distributionName,
  }) async {
    _s.validateStringPattern(
      'distributionName',
      distributionName,
      r'''\w[\w\-]*\w''',
    );
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
  /// number contact method in each AWS Region. However, SMS text messaging is
  /// not supported in some AWS Regions, and SMS text messages cannot be sent to
  /// some countries/regions. For more information, see <a
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
    @_s.required ContactMethodVerificationProtocol protocol,
  }) async {
    ArgumentError.checkNotNull(protocol, 'protocol');
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
        'protocol': protocol?.toValue() ?? '',
      },
    );

    return SendContactMethodVerificationResult.fromJson(jsonResponse.body);
  }

  /// Starts a specific Amazon Lightsail instance from a stopped state. To
  /// restart an instance, use the <code>reboot instance</code> operation.
  /// <note>
  /// When you start a stopped instance, Lightsail assigns a new public IP
  /// address to the instance. To use the same IP address after stopping and
  /// starting an instance, create a static IP address and attach it to the
  /// instance. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/lightsail-create-static-ip">Lightsail
  /// Dev Guide</a>.
  /// </note>
  /// The <code>start instance</code> operation supports tag-based access
  /// control via resource tags applied to the resource identified by
  /// <code>instance name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String instanceName,
  }) async {
    ArgumentError.checkNotNull(instanceName, 'instanceName');
    _s.validateStringPattern(
      'instanceName',
      instanceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String relationalDatabaseName,
  }) async {
    ArgumentError.checkNotNull(
        relationalDatabaseName, 'relationalDatabaseName');
    _s.validateStringPattern(
      'relationalDatabaseName',
      relationalDatabaseName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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

  /// Stops a specific Amazon Lightsail instance that is currently running.
  /// <note>
  /// When you start a stopped instance, Lightsail assigns a new public IP
  /// address to the instance. To use the same IP address after stopping and
  /// starting an instance, create a static IP address and attach it to the
  /// instance. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/lightsail-create-static-ip">Lightsail
  /// Dev Guide</a>.
  /// </note>
  /// The <code>stop instance</code> operation supports tag-based access control
  /// via resource tags applied to the resource identified by <code>instance
  /// name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String instanceName,
    bool force,
  }) async {
    ArgumentError.checkNotNull(instanceName, 'instanceName');
    _s.validateStringPattern(
      'instanceName',
      instanceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String relationalDatabaseName,
    String relationalDatabaseSnapshotName,
  }) async {
    ArgumentError.checkNotNull(
        relationalDatabaseName, 'relationalDatabaseName');
    _s.validateStringPattern(
      'relationalDatabaseName',
      relationalDatabaseName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'relationalDatabaseSnapshotName',
      relationalDatabaseSnapshotName,
      r'''\w[\w\-]*\w''',
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
  /// Dev Guide</a>.
  ///
  /// The <code>tag resource</code> operation supports tag-based access control
  /// via request tags and resource tags applied to the resource identified by
  /// <code>resource name</code>. For more information, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String resourceName,
    @_s.required List<Tag> tags,
    String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    _s.validateStringPattern(
      'resourceName',
      resourceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:(aws[^:]*):([a-zA-Z0-9-]+):([a-z0-9-]+):([0-9]+):([a-zA-Z]+)/([a-zA-Z0-9-]+)$''',
    );
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
    @_s.required String alarmName,
    @_s.required AlarmState state,
  }) async {
    ArgumentError.checkNotNull(alarmName, 'alarmName');
    _s.validateStringPattern(
      'alarmName',
      alarmName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(state, 'state');
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
        'state': state?.toValue() ?? '',
      },
    );

    return TestAlarmResult.fromJson(jsonResponse.body);
  }

  /// Attempts to unpeer the Lightsail VPC from the user's default VPC.
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required String resourceName,
    @_s.required List<String> tagKeys,
    String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    _s.validateStringPattern(
      'resourceName',
      resourceName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:(aws[^:]*):([a-zA-Z0-9-]+):([a-z0-9-]+):([0-9]+):([a-zA-Z]+)/([a-zA-Z0-9-]+)$''',
    );
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
    @_s.required String serviceName,
    bool isDisabled,
    ContainerServicePowerName power,
    Map<String, List<String>> publicDomainNames,
    int scale,
  }) async {
    ArgumentError.checkNotNull(serviceName, 'serviceName');
    _s.validateStringLength(
      'serviceName',
      serviceName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'serviceName',
      serviceName,
      r'''^[a-z0-9]{1,2}|[a-z0-9][a-z0-9-]+[a-z0-9]$''',
      isRequired: true,
    );
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
        if (publicDomainNames != null) 'publicDomainNames': publicDomainNames,
        if (scale != null) 'scale': scale,
      },
    );

    return UpdateContainerServiceResult.fromJson(jsonResponse.body);
  }

  /// Updates an existing Amazon Lightsail content delivery network (CDN)
  /// distribution.
  ///
  /// Use this action to update the configuration of your existing distribution
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
  /// Parameter [defaultCacheBehavior] :
  /// An object that describes the default cache behavior for the distribution.
  ///
  /// Parameter [isEnabled] :
  /// Indicates whether to enable the distribution.
  ///
  /// Parameter [origin] :
  /// An object that describes the origin resource for the distribution, such as
  /// a Lightsail instance or load balancer.
  ///
  /// The distribution pulls, caches, and serves content from the origin.
  Future<UpdateDistributionResult> updateDistribution({
    @_s.required String distributionName,
    CacheSettings cacheBehaviorSettings,
    List<CacheBehaviorPerPath> cacheBehaviors,
    CacheBehavior defaultCacheBehavior,
    bool isEnabled,
    InputOrigin origin,
  }) async {
    ArgumentError.checkNotNull(distributionName, 'distributionName');
    _s.validateStringPattern(
      'distributionName',
      distributionName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
        if (defaultCacheBehavior != null)
          'defaultCacheBehavior': defaultCacheBehavior,
        if (isEnabled != null) 'isEnabled': isEnabled,
        if (origin != null) 'origin': origin,
      },
    );

    return UpdateDistributionResult.fromJson(jsonResponse.body);
  }

  /// Updates the bundle of your Amazon Lightsail content delivery network (CDN)
  /// distribution.
  ///
  /// A distribution bundle specifies the monthly network transfer quota and
  /// monthly cost of your dsitribution.
  ///
  /// Update your distribution's bundle if your distribution is going over its
  /// monthly network transfer quota and is incurring an overage fee.
  ///
  /// You can update your distribution's bundle only one time within your
  /// monthly AWS billing cycle. To determine if you can update your
  /// distribution's bundle, use the <code>GetDistributions</code> action. The
  /// <code>ableToUpdateBundle</code> parameter in the result will indicate
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
    String bundleId,
    String distributionName,
  }) async {
    _s.validateStringPattern(
      'distributionName',
      distributionName,
      r'''\w[\w\-]*\w''',
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required DomainEntry domainEntry,
    @_s.required String domainName,
  }) async {
    ArgumentError.checkNotNull(domainEntry, 'domainEntry');
    ArgumentError.checkNotNull(domainName, 'domainName');
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

  /// Updates the specified attribute for a load balancer. You can only update
  /// one attribute at a time.
  ///
  /// The <code>update load balancer attribute</code> operation supports
  /// tag-based access control via resource tags applied to the resource
  /// identified by <code>load balancer name</code>. For more information, see
  /// the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
  /// The name of the attribute you want to update. Valid values are below.
  ///
  /// Parameter [attributeValue] :
  /// The value that you want to specify for the attribute name.
  ///
  /// Parameter [loadBalancerName] :
  /// The name of the load balancer that you want to modify (e.g.,
  /// <code>my-load-balancer</code>.
  Future<UpdateLoadBalancerAttributeResult> updateLoadBalancerAttribute({
    @_s.required LoadBalancerAttributeName attributeName,
    @_s.required String attributeValue,
    @_s.required String loadBalancerName,
  }) async {
    ArgumentError.checkNotNull(attributeName, 'attributeName');
    ArgumentError.checkNotNull(attributeValue, 'attributeValue');
    _s.validateStringLength(
      'attributeValue',
      attributeValue,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(loadBalancerName, 'loadBalancerName');
    _s.validateStringPattern(
      'loadBalancerName',
      loadBalancerName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
        'attributeName': attributeName?.toValue() ?? '',
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
  /// The name of your database to update.
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
  /// The password for the master user of your database. The password can
  /// include any printable ASCII character except "/", """, or "@".
  ///
  /// Constraints: Must contain 8 to 41 characters.
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
  /// Specifies the accessibility options for your database. A value of
  /// <code>true</code> specifies a database that is available to resources
  /// outside of your Lightsail account. A value of <code>false</code> specifies
  /// a database that is available only to your Lightsail resources in the same
  /// region as your database.
  ///
  /// Parameter [rotateMasterUserPassword] :
  /// When <code>true</code>, the master user password is changed to a new
  /// strong password generated by Lightsail.
  ///
  /// Use the <code>get relational database master user password</code>
  /// operation to get the new password.
  Future<UpdateRelationalDatabaseResult> updateRelationalDatabase({
    @_s.required String relationalDatabaseName,
    bool applyImmediately,
    String caCertificateIdentifier,
    bool disableBackupRetention,
    bool enableBackupRetention,
    String masterUserPassword,
    String preferredBackupWindow,
    String preferredMaintenanceWindow,
    bool publiclyAccessible,
    bool rotateMasterUserPassword,
  }) async {
    ArgumentError.checkNotNull(
        relationalDatabaseName, 'relationalDatabaseName');
    _s.validateStringPattern(
      'relationalDatabaseName',
      relationalDatabaseName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-controlling-access-using-tags">Lightsail
  /// Dev Guide</a>.
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
    @_s.required List<RelationalDatabaseParameter> parameters,
    @_s.required String relationalDatabaseName,
  }) async {
    ArgumentError.checkNotNull(parameters, 'parameters');
    ArgumentError.checkNotNull(
        relationalDatabaseName, 'relationalDatabaseName');
    _s.validateStringPattern(
      'relationalDatabaseName',
      relationalDatabaseName,
      r'''\w[\w\-]*\w''',
      isRequired: true,
    );
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
  @_s.JsonValue('inbound')
  inbound,
  @_s.JsonValue('outbound')
  outbound,
}

/// Describes an add-on that is enabled for an Amazon Lightsail resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddOn {
  /// The name of the add-on.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The next daily time an automatic snapshot will be created.
  ///
  /// The time shown is in <code>HH:00</code> format, and in Coordinated Universal
  /// Time (UTC).
  ///
  /// The snapshot is automatically created between the time shown and up to 45
  /// minutes after.
  @_s.JsonKey(name: 'nextSnapshotTimeOfDay')
  final String nextSnapshotTimeOfDay;

  /// The daily time when an automatic snapshot is created.
  ///
  /// The time shown is in <code>HH:00</code> format, and in Coordinated Universal
  /// Time (UTC).
  ///
  /// The snapshot is automatically created between the time shown and up to 45
  /// minutes after.
  @_s.JsonKey(name: 'snapshotTimeOfDay')
  final String snapshotTimeOfDay;

  /// The status of the add-on.
  @_s.JsonKey(name: 'status')
  final String status;

  AddOn({
    this.name,
    this.nextSnapshotTimeOfDay,
    this.snapshotTimeOfDay,
    this.status,
  });
  factory AddOn.fromJson(Map<String, dynamic> json) => _$AddOnFromJson(json);
}

/// Describes a request to enable, modify, or disable an add-on for an Amazon
/// Lightsail resource.
/// <note>
/// An additional cost may be associated with enabling add-ons. For more
/// information, see the <a
/// href="https://aws.amazon.com/lightsail/pricing/">Lightsail pricing page</a>.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AddOnRequest {
  /// The add-on type.
  @_s.JsonKey(name: 'addOnType')
  final AddOnType addOnType;

  /// An object that represents additional parameters when enabling or modifying
  /// the automatic snapshot add-on.
  @_s.JsonKey(name: 'autoSnapshotAddOnRequest')
  final AutoSnapshotAddOnRequest autoSnapshotAddOnRequest;

  AddOnRequest({
    @_s.required this.addOnType,
    this.autoSnapshotAddOnRequest,
  });
  Map<String, dynamic> toJson() => _$AddOnRequestToJson(this);
}

enum AddOnType {
  @_s.JsonValue('AutoSnapshot')
  autoSnapshot,
}

extension on AddOnType {
  String toValue() {
    switch (this) {
      case AddOnType.autoSnapshot:
        return 'AutoSnapshot';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes an alarm.
///
/// An alarm is a way to monitor your Amazon Lightsail resource metrics. For
/// more information, see <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms
/// in Amazon Lightsail</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Alarm {
  /// The Amazon Resource Name (ARN) of the alarm.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The arithmetic operation used when comparing the specified statistic and
  /// threshold.
  @_s.JsonKey(name: 'comparisonOperator')
  final ComparisonOperator comparisonOperator;

  /// The contact protocols for the alarm, such as <code>Email</code>,
  /// <code>SMS</code> (text messaging), or both.
  @_s.JsonKey(name: 'contactProtocols')
  final List<ContactProtocol> contactProtocols;

  /// The timestamp when the alarm was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The number of data points that must not within the specified threshold to
  /// trigger the alarm.
  @_s.JsonKey(name: 'datapointsToAlarm')
  final int datapointsToAlarm;

  /// The number of periods over which data is compared to the specified
  /// threshold.
  @_s.JsonKey(name: 'evaluationPeriods')
  final int evaluationPeriods;

  /// An object that lists information about the location of the alarm.
  @_s.JsonKey(name: 'location')
  final ResourceLocation location;

  /// The name of the metric associated with the alarm.
  @_s.JsonKey(name: 'metricName')
  final MetricName metricName;

  /// An object that lists information about the resource monitored by the alarm.
  @_s.JsonKey(name: 'monitoredResourceInfo')
  final MonitoredResourceInfo monitoredResourceInfo;

  /// The name of the alarm.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Indicates whether the alarm is enabled.
  @_s.JsonKey(name: 'notificationEnabled')
  final bool notificationEnabled;

  /// The alarm states that trigger a notification.
  @_s.JsonKey(name: 'notificationTriggers')
  final List<AlarmState> notificationTriggers;

  /// The period, in seconds, over which the statistic is applied.
  @_s.JsonKey(name: 'period')
  final int period;

  /// The Lightsail resource type (e.g., <code>Alarm</code>).
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

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
  @_s.JsonKey(name: 'state')
  final AlarmState state;

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
  @_s.JsonKey(name: 'statistic')
  final MetricStatistic statistic;

  /// The support code. Include this code in your email to support when you have
  /// questions about your Lightsail alarm. This code enables our support team to
  /// look up your Lightsail information more easily.
  @_s.JsonKey(name: 'supportCode')
  final String supportCode;

  /// The value against which the specified statistic is compared.
  @_s.JsonKey(name: 'threshold')
  final double threshold;

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
  @_s.JsonKey(name: 'treatMissingData')
  final TreatMissingData treatMissingData;

  /// The unit of the metric associated with the alarm.
  @_s.JsonKey(name: 'unit')
  final MetricUnit unit;

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
  factory Alarm.fromJson(Map<String, dynamic> json) => _$AlarmFromJson(json);
}

enum AlarmState {
  @_s.JsonValue('OK')
  ok,
  @_s.JsonValue('ALARM')
  alarm,
  @_s.JsonValue('INSUFFICIENT_DATA')
  insufficientData,
}

extension on AlarmState {
  String toValue() {
    switch (this) {
      case AlarmState.ok:
        return 'OK';
      case AlarmState.alarm:
        return 'ALARM';
      case AlarmState.insufficientData:
        return 'INSUFFICIENT_DATA';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AllocateStaticIpResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  AllocateStaticIpResult({
    this.operations,
  });
  factory AllocateStaticIpResult.fromJson(Map<String, dynamic> json) =>
      _$AllocateStaticIpResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttachCertificateToDistributionResult {
  /// An object that describes the result of the action, such as the status of the
  /// request, the timestamp of the request, and the resources affected by the
  /// request.
  @_s.JsonKey(name: 'operation')
  final Operation operation;

  AttachCertificateToDistributionResult({
    this.operation,
  });
  factory AttachCertificateToDistributionResult.fromJson(
          Map<String, dynamic> json) =>
      _$AttachCertificateToDistributionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttachDiskResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  AttachDiskResult({
    this.operations,
  });
  factory AttachDiskResult.fromJson(Map<String, dynamic> json) =>
      _$AttachDiskResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttachInstancesToLoadBalancerResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  AttachInstancesToLoadBalancerResult({
    this.operations,
  });
  factory AttachInstancesToLoadBalancerResult.fromJson(
          Map<String, dynamic> json) =>
      _$AttachInstancesToLoadBalancerResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttachLoadBalancerTlsCertificateResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  ///
  /// These SSL/TLS certificates are only usable by Lightsail load balancers. You
  /// can't get the certificate and use it for another purpose.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  AttachLoadBalancerTlsCertificateResult({
    this.operations,
  });
  factory AttachLoadBalancerTlsCertificateResult.fromJson(
          Map<String, dynamic> json) =>
      _$AttachLoadBalancerTlsCertificateResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttachStaticIpResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  AttachStaticIpResult({
    this.operations,
  });
  factory AttachStaticIpResult.fromJson(Map<String, dynamic> json) =>
      _$AttachStaticIpResultFromJson(json);
}

/// Describes a block storage disk that is attached to an instance, and is
/// included in an automatic snapshot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttachedDisk {
  /// The path of the disk (e.g., <code>/dev/xvdf</code>).
  @_s.JsonKey(name: 'path')
  final String path;

  /// The size of the disk in GB.
  @_s.JsonKey(name: 'sizeInGb')
  final int sizeInGb;

  AttachedDisk({
    this.path,
    this.sizeInGb,
  });
  factory AttachedDisk.fromJson(Map<String, dynamic> json) =>
      _$AttachedDiskFromJson(json);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @_s.JsonKey(name: 'snapshotTimeOfDay')
  final String snapshotTimeOfDay;

  AutoSnapshotAddOnRequest({
    this.snapshotTimeOfDay,
  });
  Map<String, dynamic> toJson() => _$AutoSnapshotAddOnRequestToJson(this);
}

/// Describes an automatic snapshot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutoSnapshotDetails {
  /// The timestamp when the automatic snapshot was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The date of the automatic snapshot in <code>YYYY-MM-DD</code> format.
  @_s.JsonKey(name: 'date')
  final String date;

  /// An array of objects that describe the block storage disks attached to the
  /// instance when the automatic snapshot was created.
  @_s.JsonKey(name: 'fromAttachedDisks')
  final List<AttachedDisk> fromAttachedDisks;

  /// The status of the automatic snapshot.
  @_s.JsonKey(name: 'status')
  final AutoSnapshotStatus status;

  AutoSnapshotDetails({
    this.createdAt,
    this.date,
    this.fromAttachedDisks,
    this.status,
  });
  factory AutoSnapshotDetails.fromJson(Map<String, dynamic> json) =>
      _$AutoSnapshotDetailsFromJson(json);
}

enum AutoSnapshotStatus {
  @_s.JsonValue('Success')
  success,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('NotFound')
  notFound,
}

/// Describes an Availability Zone.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AvailabilityZone {
  /// The state of the Availability Zone.
  @_s.JsonKey(name: 'state')
  final String state;

  /// The name of the Availability Zone. The format is <code>us-east-2a</code>
  /// (case-sensitive).
  @_s.JsonKey(name: 'zoneName')
  final String zoneName;

  AvailabilityZone({
    this.state,
    this.zoneName,
  });
  factory AvailabilityZone.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityZoneFromJson(json);
}

enum BehaviorEnum {
  @_s.JsonValue('dont-cache')
  dontCache,
  @_s.JsonValue('cache')
  cache,
}

/// Describes a blueprint (a virtual private server image).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Blueprint {
  /// The ID for the virtual private server image (e.g.,
  /// <code>app_wordpress_4_4</code> or <code>app_lamp_7_0</code>).
  @_s.JsonKey(name: 'blueprintId')
  final String blueprintId;

  /// The description of the blueprint.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The group name of the blueprint (e.g., <code>amazon-linux</code>).
  @_s.JsonKey(name: 'group')
  final String group;

  /// A Boolean value indicating whether the blueprint is active. Inactive
  /// blueprints are listed to support customers with existing instances but are
  /// not necessarily available for launch of new instances. Blueprints are marked
  /// inactive when they become outdated due to operating system updates or new
  /// application releases.
  @_s.JsonKey(name: 'isActive')
  final bool isActive;

  /// The end-user license agreement URL for the image or blueprint.
  @_s.JsonKey(name: 'licenseUrl')
  final String licenseUrl;

  /// The minimum bundle power required to run this blueprint. For example, you
  /// need a bundle with a power value of 500 or more to create an instance that
  /// uses a blueprint with a minimum power value of 500. <code>0</code> indicates
  /// that the blueprint runs on all instance sizes.
  @_s.JsonKey(name: 'minPower')
  final int minPower;

  /// The friendly name of the blueprint (e.g., <code>Amazon Linux</code>).
  @_s.JsonKey(name: 'name')
  final String name;

  /// The operating system platform (either Linux/Unix-based or Windows
  /// Server-based) of the blueprint.
  @_s.JsonKey(name: 'platform')
  final InstancePlatform platform;

  /// The product URL to learn more about the image or blueprint.
  @_s.JsonKey(name: 'productUrl')
  final String productUrl;

  /// The type of the blueprint (e.g., <code>os</code> or <code>app</code>).
  @_s.JsonKey(name: 'type')
  final BlueprintType type;

  /// The version number of the operating system, application, or stack (e.g.,
  /// <code>2016.03.0</code>).
  @_s.JsonKey(name: 'version')
  final String version;

  /// The version code.
  @_s.JsonKey(name: 'versionCode')
  final String versionCode;

  Blueprint({
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
  factory Blueprint.fromJson(Map<String, dynamic> json) =>
      _$BlueprintFromJson(json);
}

enum BlueprintType {
  @_s.JsonValue('os')
  os,
  @_s.JsonValue('app')
  app,
}

/// Describes a bundle, which is a set of specs describing your virtual private
/// server (or <i>instance</i>).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Bundle {
  /// The bundle ID (e.g., <code>micro_1_0</code>).
  @_s.JsonKey(name: 'bundleId')
  final String bundleId;

  /// The number of vCPUs included in the bundle (e.g., <code>2</code>).
  @_s.JsonKey(name: 'cpuCount')
  final int cpuCount;

  /// The size of the SSD (e.g., <code>30</code>).
  @_s.JsonKey(name: 'diskSizeInGb')
  final int diskSizeInGb;

  /// The Amazon EC2 instance type (e.g., <code>t2.micro</code>).
  @_s.JsonKey(name: 'instanceType')
  final String instanceType;

  /// A Boolean value indicating whether the bundle is active.
  @_s.JsonKey(name: 'isActive')
  final bool isActive;

  /// A friendly name for the bundle (e.g., <code>Micro</code>).
  @_s.JsonKey(name: 'name')
  final String name;

  /// A numeric value that represents the power of the bundle (e.g.,
  /// <code>500</code>). You can use the bundle's power value in conjunction with
  /// a blueprint's minimum power value to determine whether the blueprint will
  /// run on the bundle. For example, you need a bundle with a power value of 500
  /// or more to create an instance that uses a blueprint with a minimum power
  /// value of 500.
  @_s.JsonKey(name: 'power')
  final int power;

  /// The price in US dollars (e.g., <code>5.0</code>) of the bundle.
  @_s.JsonKey(name: 'price')
  final double price;

  /// The amount of RAM in GB (e.g., <code>2.0</code>).
  @_s.JsonKey(name: 'ramSizeInGb')
  final double ramSizeInGb;

  /// The operating system platform (Linux/Unix-based or Windows Server-based)
  /// that the bundle supports. You can only launch a <code>WINDOWS</code> bundle
  /// on a blueprint that supports the <code>WINDOWS</code> platform.
  /// <code>LINUX_UNIX</code> blueprints require a <code>LINUX_UNIX</code> bundle.
  @_s.JsonKey(name: 'supportedPlatforms')
  final List<InstancePlatform> supportedPlatforms;

  /// The data transfer rate per month in GB (e.g., <code>2000</code>).
  @_s.JsonKey(name: 'transferPerMonthInGb')
  final int transferPerMonthInGb;

  Bundle({
    this.bundleId,
    this.cpuCount,
    this.diskSizeInGb,
    this.instanceType,
    this.isActive,
    this.name,
    this.power,
    this.price,
    this.ramSizeInGb,
    this.supportedPlatforms,
    this.transferPerMonthInGb,
  });
  factory Bundle.fromJson(Map<String, dynamic> json) => _$BundleFromJson(json);
}

/// Describes the default cache behavior of an Amazon Lightsail content delivery
/// network (CDN) distribution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'behavior')
  final BehaviorEnum behavior;

  CacheBehavior({
    this.behavior,
  });
  factory CacheBehavior.fromJson(Map<String, dynamic> json) =>
      _$CacheBehaviorFromJson(json);

  Map<String, dynamic> toJson() => _$CacheBehaviorToJson(this);
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
///
/// if the cacheBehavior's behavior is set to 'cache', then
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'behavior')
  final BehaviorEnum behavior;

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
  @_s.JsonKey(name: 'path')
  final String path;

  CacheBehaviorPerPath({
    this.behavior,
    this.path,
  });
  factory CacheBehaviorPerPath.fromJson(Map<String, dynamic> json) =>
      _$CacheBehaviorPerPathFromJson(json);

  Map<String, dynamic> toJson() => _$CacheBehaviorPerPathToJson(this);
}

/// Describes the cache settings of an Amazon Lightsail content delivery network
/// (CDN) distribution.
///
/// These settings apply only to your distribution's <code>cacheBehaviors</code>
/// (including the <code>defaultCacheBehavior</code>) that have a
/// <code>behavior</code> of <code>cache</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'allowedHTTPMethods')
  final String allowedHTTPMethods;

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
  @_s.JsonKey(name: 'cachedHTTPMethods')
  final String cachedHTTPMethods;

  /// The default amount of time that objects stay in the distribution's cache
  /// before the distribution forwards another request to the origin to determine
  /// whether the content has been updated.
  /// <note>
  /// The value specified applies only when the origin does not add HTTP headers
  /// such as <code>Cache-Control max-age</code>, <code>Cache-Control
  /// s-maxage</code>, and <code>Expires</code> to objects.
  /// </note>
  @_s.JsonKey(name: 'defaultTTL')
  final int defaultTTL;

  /// An object that describes the cookies that are forwarded to the origin. Your
  /// content is cached based on the cookies that are forwarded.
  @_s.JsonKey(name: 'forwardedCookies')
  final CookieObject forwardedCookies;

  /// An object that describes the headers that are forwarded to the origin. Your
  /// content is cached based on the headers that are forwarded.
  @_s.JsonKey(name: 'forwardedHeaders')
  final HeaderObject forwardedHeaders;

  /// An object that describes the query strings that are forwarded to the origin.
  /// Your content is cached based on the query strings that are forwarded.
  @_s.JsonKey(name: 'forwardedQueryStrings')
  final QueryStringObject forwardedQueryStrings;

  /// The maximum amount of time that objects stay in the distribution's cache
  /// before the distribution forwards another request to the origin to determine
  /// whether the object has been updated.
  ///
  /// The value specified applies only when the origin adds HTTP headers such as
  /// <code>Cache-Control max-age</code>, <code>Cache-Control s-maxage</code>, and
  /// <code>Expires</code> to objects.
  @_s.JsonKey(name: 'maximumTTL')
  final int maximumTTL;

  /// The minimum amount of time that objects stay in the distribution's cache
  /// before the distribution forwards another request to the origin to determine
  /// whether the object has been updated.
  ///
  /// A value of <code>0</code> must be specified for <code>minimumTTL</code> if
  /// the distribution is configured to forward all headers to the origin.
  @_s.JsonKey(name: 'minimumTTL')
  final int minimumTTL;

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
  factory CacheSettings.fromJson(Map<String, dynamic> json) =>
      _$CacheSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$CacheSettingsToJson(this);
}

/// Describes the full details of an Amazon Lightsail SSL/TLS certificate.
/// <note>
/// To get a summary of a certificate, use the <code>GetCertificates</code>
/// action and ommit <code>includeCertificateDetails</code> from your request.
/// The response will include only the certificate Amazon Resource Name (ARN),
/// certificate name, domain name, and tags.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Certificate {
  /// The Amazon Resource Name (ARN) of the certificate.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The timestamp when the certificate was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The domain name of the certificate.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// An array of objects that describe the domain validation records of the
  /// certificate.
  @_s.JsonKey(name: 'domainValidationRecords')
  final List<DomainValidationRecord> domainValidationRecords;

  /// The renewal eligibility of the certificate.
  @_s.JsonKey(name: 'eligibleToRenew')
  final String eligibleToRenew;

  /// The number of Lightsail resources that the certificate is attached to.
  @_s.JsonKey(name: 'inUseResourceCount')
  final int inUseResourceCount;

  /// The timestamp when the certificate was issued.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'issuedAt')
  final DateTime issuedAt;

  /// The certificate authority that issued the certificate.
  @_s.JsonKey(name: 'issuerCA')
  final String issuerCA;

  /// The algorithm used to generate the key pair (the public and private key) of
  /// the certificate.
  @_s.JsonKey(name: 'keyAlgorithm')
  final String keyAlgorithm;

  /// The name of the certificate (e.g., <code>my-certificate</code>).
  @_s.JsonKey(name: 'name')
  final String name;

  /// The timestamp when the certificate expires.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'notAfter')
  final DateTime notAfter;

  /// The timestamp when the certificate is first valid.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'notBefore')
  final DateTime notBefore;

  /// An object that describes the status of the certificate renewal managed by
  /// Lightsail.
  @_s.JsonKey(name: 'renewalSummary')
  final RenewalSummary renewalSummary;

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
  /// href="https://www.google.com/webmasters/hacked/?hl=en">Google Help for
  /// Hacked Websites</a> to learn what you can do.
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
  @_s.JsonKey(name: 'requestFailureReason')
  final String requestFailureReason;

  /// The reason the certificate was revoked. This value is present only when the
  /// certificate status is <code>REVOKED</code>.
  @_s.JsonKey(name: 'revocationReason')
  final String revocationReason;

  /// The timestamp when the certificate was revoked. This value is present only
  /// when the certificate status is <code>REVOKED</code>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'revokedAt')
  final DateTime revokedAt;

  /// The serial number of the certificate.
  @_s.JsonKey(name: 'serialNumber')
  final String serialNumber;

  /// The validation status of the certificate.
  @_s.JsonKey(name: 'status')
  final CertificateStatus status;

  /// An array of strings that specify the alternate domains (e.g.,
  /// <code>example2.com</code>) and subdomains (e.g.,
  /// <code>blog.example.com</code>) of the certificate.
  @_s.JsonKey(name: 'subjectAlternativeNames')
  final List<String> subjectAlternativeNames;

  /// The support code. Include this code in your email to support when you have
  /// questions about your Lightsail certificate. This code enables our support
  /// team to look up your Lightsail information more easily.
  @_s.JsonKey(name: 'supportCode')
  final String supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
  /// Dev Guide</a>.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

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
  factory Certificate.fromJson(Map<String, dynamic> json) =>
      _$CertificateFromJson(json);
}

enum CertificateStatus {
  @_s.JsonValue('PENDING_VALIDATION')
  pendingValidation,
  @_s.JsonValue('ISSUED')
  issued,
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('EXPIRED')
  expired,
  @_s.JsonValue('VALIDATION_TIMED_OUT')
  validationTimedOut,
  @_s.JsonValue('REVOKED')
  revoked,
  @_s.JsonValue('FAILED')
  failed,
}

extension on CertificateStatus {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes an Amazon Lightsail SSL/TLS certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CertificateSummary {
  /// The Amazon Resource Name (ARN) of the certificate.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  /// An object that describes a certificate in detail.
  @_s.JsonKey(name: 'certificateDetail')
  final Certificate certificateDetail;

  /// The name of the certificate.
  @_s.JsonKey(name: 'certificateName')
  final String certificateName;

  /// The domain name of the certificate.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
  /// Dev Guide</a>.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  CertificateSummary({
    this.certificateArn,
    this.certificateDetail,
    this.certificateName,
    this.domainName,
    this.tags,
  });
  factory CertificateSummary.fromJson(Map<String, dynamic> json) =>
      _$CertificateSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CloseInstancePublicPortsResult {
  /// An object that describes the result of the action, such as the status of the
  /// request, the timestamp of the request, and the resources affected by the
  /// request.
  @_s.JsonKey(name: 'operation')
  final Operation operation;

  CloseInstancePublicPortsResult({
    this.operation,
  });
  factory CloseInstancePublicPortsResult.fromJson(Map<String, dynamic> json) =>
      _$CloseInstancePublicPortsResultFromJson(json);
}

/// Describes a CloudFormation stack record created as a result of the
/// <code>create cloud formation stack</code> operation.
///
/// A CloudFormation stack record provides information about the AWS
/// CloudFormation stack used to create a new Amazon Elastic Compute Cloud
/// instance from an exported Lightsail instance snapshot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CloudFormationStackRecord {
  /// The Amazon Resource Name (ARN) of the CloudFormation stack record.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date when the CloudFormation stack record was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// A list of objects describing the destination service, which is AWS
  /// CloudFormation, and the Amazon Resource Name (ARN) of the AWS CloudFormation
  /// stack.
  @_s.JsonKey(name: 'destinationInfo')
  final DestinationInfo destinationInfo;

  /// A list of objects describing the Availability Zone and AWS Region of the
  /// CloudFormation stack record.
  @_s.JsonKey(name: 'location')
  final ResourceLocation location;

  /// The name of the CloudFormation stack record. It starts with
  /// <code>CloudFormationStackRecord</code> followed by a GUID.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The Lightsail resource type (e.g., <code>CloudFormationStackRecord</code>).
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// A list of objects describing the source of the CloudFormation stack record.
  @_s.JsonKey(name: 'sourceInfo')
  final List<CloudFormationStackRecordSourceInfo> sourceInfo;

  /// The current state of the CloudFormation stack record.
  @_s.JsonKey(name: 'state')
  final RecordState state;

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
  factory CloudFormationStackRecord.fromJson(Map<String, dynamic> json) =>
      _$CloudFormationStackRecordFromJson(json);
}

/// Describes the source of a CloudFormation stack record (i.e., the export
/// snapshot record).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CloudFormationStackRecordSourceInfo {
  /// The Amazon Resource Name (ARN) of the export snapshot record.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The name of the record.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The Lightsail resource type (e.g., <code>ExportSnapshotRecord</code>).
  @_s.JsonKey(name: 'resourceType')
  final CloudFormationStackRecordSourceType resourceType;

  CloudFormationStackRecordSourceInfo({
    this.arn,
    this.name,
    this.resourceType,
  });
  factory CloudFormationStackRecordSourceInfo.fromJson(
          Map<String, dynamic> json) =>
      _$CloudFormationStackRecordSourceInfoFromJson(json);
}

enum CloudFormationStackRecordSourceType {
  @_s.JsonValue('ExportSnapshotRecord')
  exportSnapshotRecord,
}

enum ComparisonOperator {
  @_s.JsonValue('GreaterThanOrEqualToThreshold')
  greaterThanOrEqualToThreshold,
  @_s.JsonValue('GreaterThanThreshold')
  greaterThanThreshold,
  @_s.JsonValue('LessThanThreshold')
  lessThanThreshold,
  @_s.JsonValue('LessThanOrEqualToThreshold')
  lessThanOrEqualToThreshold,
}

extension on ComparisonOperator {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a contact method.
///
/// A contact method is a way to send you notifications. For more information,
/// see <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications">Notifications
/// in Amazon Lightsail</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContactMethod {
  /// The Amazon Resource Name (ARN) of the contact method.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The destination of the contact method, such as an email address or a mobile
  /// phone number.
  @_s.JsonKey(name: 'contactEndpoint')
  final String contactEndpoint;

  /// The timestamp when the contact method was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @_s.JsonKey(name: 'location')
  final ResourceLocation location;

  /// The name of the contact method.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The protocol of the contact method, such as email or SMS (text messaging).
  @_s.JsonKey(name: 'protocol')
  final ContactProtocol protocol;

  /// The Lightsail resource type (e.g., <code>ContactMethod</code>).
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

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
  @_s.JsonKey(name: 'status')
  final ContactMethodStatus status;

  /// The support code. Include this code in your email to support when you have
  /// questions about your Lightsail contact method. This code enables our support
  /// team to look up your Lightsail information more easily.
  @_s.JsonKey(name: 'supportCode')
  final String supportCode;

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
  factory ContactMethod.fromJson(Map<String, dynamic> json) =>
      _$ContactMethodFromJson(json);
}

enum ContactMethodStatus {
  @_s.JsonValue('PendingVerification')
  pendingVerification,
  @_s.JsonValue('Valid')
  valid,
  @_s.JsonValue('Invalid')
  invalid,
}

enum ContactMethodVerificationProtocol {
  @_s.JsonValue('Email')
  email,
}

extension on ContactMethodVerificationProtocol {
  String toValue() {
    switch (this) {
      case ContactMethodVerificationProtocol.email:
        return 'Email';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ContactProtocol {
  @_s.JsonValue('Email')
  email,
  @_s.JsonValue('SMS')
  sms,
}

extension on ContactProtocol {
  String toValue() {
    switch (this) {
      case ContactProtocol.email:
        return 'Email';
      case ContactProtocol.sms:
        return 'SMS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the settings of a container that will be launched, or that is
/// launched, to an Amazon Lightsail container service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Container {
  /// The launch command for the container.
  @_s.JsonKey(name: 'command')
  final List<String> command;

  /// The environment variables of the container.
  @_s.JsonKey(name: 'environment')
  final Map<String, String> environment;

  /// The name of the image used for the container.
  ///
  /// Container images sourced from your Lightsail container service, that are
  /// registered and stored on your service, start with a colon (<code>:</code>).
  /// For example, <code>:container-service-1.mystaticwebsite.1</code>. Container
  /// images sourced from a public registry like Docker Hub don't start with a
  /// colon. For example, <code>nginx:latest</code> or <code>nginx</code>.
  @_s.JsonKey(name: 'image')
  final String image;

  /// The open firewall ports of the container.
  @_s.JsonKey(name: 'ports')
  final Map<String, ContainerServiceProtocol> ports;

  Container({
    this.command,
    this.environment,
    this.image,
    this.ports,
  });
  factory Container.fromJson(Map<String, dynamic> json) =>
      _$ContainerFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerToJson(this);
}

/// Describes a container image that is registered to an Amazon Lightsail
/// container service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContainerImage {
  /// The timestamp when the container image was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The digest of the container image.
  @_s.JsonKey(name: 'digest')
  final String digest;

  /// The name of the container image.
  @_s.JsonKey(name: 'image')
  final String image;

  ContainerImage({
    this.createdAt,
    this.digest,
    this.image,
  });
  factory ContainerImage.fromJson(Map<String, dynamic> json) =>
      _$ContainerImageFromJson(json);
}

/// Describes an Amazon Lightsail container service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContainerService {
  /// The Amazon Resource Name (ARN) of the container service.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The name of the container service.
  @_s.JsonKey(name: 'containerServiceName')
  final String containerServiceName;

  /// The timestamp when the container service was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// An object that describes the current container deployment of the container
  /// service.
  @_s.JsonKey(name: 'currentDeployment')
  final ContainerServiceDeployment currentDeployment;

  /// A Boolean value indicating whether the container service is disabled.
  @_s.JsonKey(name: 'isDisabled')
  final bool isDisabled;

  /// An object that describes the location of the container service, such as the
  /// AWS Region and Availability Zone.
  @_s.JsonKey(name: 'location')
  final ResourceLocation location;

  /// An object that describes the next deployment of the container service.
  ///
  /// This value is <code>null</code> when there is no deployment in a
  /// <code>pending</code> state.
  @_s.JsonKey(name: 'nextDeployment')
  final ContainerServiceDeployment nextDeployment;

  /// The power specification of the container service.
  ///
  /// The power specifies the amount of RAM, the number of vCPUs, and the base
  /// price of the container service.
  @_s.JsonKey(name: 'power')
  final ContainerServicePowerName power;

  /// The ID of the power of the container service.
  @_s.JsonKey(name: 'powerId')
  final String powerId;

  /// The principal ARN of the container service.
  ///
  /// The principal ARN can be used to create a trust relationship between your
  /// standard AWS account and your Lightsail container service. This allows you
  /// to give your service permission to access resources in your standard AWS
  /// account.
  @_s.JsonKey(name: 'principalArn')
  final String principalArn;

  /// The private domain name of the container service.
  ///
  /// The private domain name is accessible only by other resources within the
  /// default virtual private cloud (VPC) of your Lightsail account.
  @_s.JsonKey(name: 'privateDomainName')
  final String privateDomainName;

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
  @_s.JsonKey(name: 'publicDomainNames')
  final Map<String, List<String>> publicDomainNames;

  /// The Lightsail resource type of the container service (i.e.,
  /// <code>ContainerService</code>).
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// The scale specification of the container service.
  ///
  /// The scale specifies the allocated compute nodes of the container service.
  @_s.JsonKey(name: 'scale')
  final int scale;

  /// The current state of the container service.
  ///
  /// The state can be:
  ///
  /// <ul>
  /// <li>
  /// <code>Pending</code> - The container service is being created.
  /// </li>
  /// <li>
  /// <code>Ready</code> - The container service is created but does not have a
  /// container deployment.
  /// </li>
  /// <li>
  /// <code>Disabled</code> - The container service is disabled.
  /// </li>
  /// <li>
  /// <code>Updating</code> - The container service capacity or other setting is
  /// being updated.
  /// </li>
  /// <li>
  /// <code>Deploying</code> - The container service is launching a container
  /// deployment.
  /// </li>
  /// <li>
  /// <code>Running</code> - The container service is created and it has a
  /// container deployment.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'state')
  final ContainerServiceState state;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
  /// Dev Guide</a>.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  /// The publicly accessible URL of the container service.
  ///
  /// If no public endpoint is specified in the <code>currentDeployment</code>,
  /// this URL returns a 404 response.
  @_s.JsonKey(name: 'url')
  final String url;

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
    this.publicDomainNames,
    this.resourceType,
    this.scale,
    this.state,
    this.tags,
    this.url,
  });
  factory ContainerService.fromJson(Map<String, dynamic> json) =>
      _$ContainerServiceFromJson(json);
}

/// Describes a container deployment configuration of an Amazon Lightsail
/// container service.
///
/// A deployment specifies the settings, such as the ports and launch command,
/// of containers that are deployed to your container service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContainerServiceDeployment {
  /// An object that describes the configuration for the containers of the
  /// deployment.
  @_s.JsonKey(name: 'containers')
  final Map<String, Container> containers;

  /// The timestamp when the deployment was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// An object that describes the endpoint of the deployment.
  @_s.JsonKey(name: 'publicEndpoint')
  final ContainerServiceEndpoint publicEndpoint;

  /// The state of the deployment.
  ///
  /// A deployment can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// <code>Activating</code> - The deployment is being created.
  /// </li>
  /// <li>
  /// <code>Active</code> - The deployment was successfully created, and it's
  /// currently running on the container service. The container service can have
  /// only one deployment in an active state at a time.
  /// </li>
  /// <li>
  /// <code>Inactive</code> - The deployment was previously successfully created,
  /// but it is not currently running on the container service.
  /// </li>
  /// <li>
  /// <code>Failed</code> - The deployment failed. Use the
  /// <code>GetContainerLog</code> action to view the log events for the
  /// containers in the deployment to try to determine the reason for the failure.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'state')
  final ContainerServiceDeploymentState state;

  /// The version number of the deployment.
  @_s.JsonKey(name: 'version')
  final int version;

  ContainerServiceDeployment({
    this.containers,
    this.createdAt,
    this.publicEndpoint,
    this.state,
    this.version,
  });
  factory ContainerServiceDeployment.fromJson(Map<String, dynamic> json) =>
      _$ContainerServiceDeploymentFromJson(json);
}

/// Describes a container deployment configuration of an Amazon Lightsail
/// container service.
///
/// A deployment specifies the settings, such as the ports and launch command,
/// of containers that are deployed to your container service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ContainerServiceDeploymentRequest {
  /// An object that describes the configuration for the containers of the
  /// deployment.
  @_s.JsonKey(name: 'containers')
  final Map<String, Container> containers;

  /// An object that describes the endpoint of the deployment.
  @_s.JsonKey(name: 'publicEndpoint')
  final EndpointRequest publicEndpoint;

  ContainerServiceDeploymentRequest({
    this.containers,
    this.publicEndpoint,
  });
  Map<String, dynamic> toJson() =>
      _$ContainerServiceDeploymentRequestToJson(this);
}

enum ContainerServiceDeploymentState {
  @_s.JsonValue('ACTIVATING')
  activating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('FAILED')
  failed,
}

/// Describes the public endpoint configuration of a deployment of an Amazon
/// Lightsail container service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContainerServiceEndpoint {
  /// The name of the container entry of the deployment that the endpoint
  /// configuration applies to.
  @_s.JsonKey(name: 'containerName')
  final String containerName;

  /// The port of the specified container to which traffic is forwarded to.
  @_s.JsonKey(name: 'containerPort')
  final int containerPort;

  /// An object that describes the health check configuration of the container.
  @_s.JsonKey(name: 'healthCheck')
  final ContainerServiceHealthCheckConfig healthCheck;

  ContainerServiceEndpoint({
    this.containerName,
    this.containerPort,
    this.healthCheck,
  });
  factory ContainerServiceEndpoint.fromJson(Map<String, dynamic> json) =>
      _$ContainerServiceEndpointFromJson(json);
}

/// Describes the health check configuration of an Amazon Lightsail container
/// service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ContainerServiceHealthCheckConfig {
  /// The number of consecutive health checks successes required before moving the
  /// container to the <code>Healthy</code> state.
  @_s.JsonKey(name: 'healthyThreshold')
  final int healthyThreshold;

  /// The approximate interval, in seconds, between health checks of an individual
  /// container. You may specify between 5 and 300 seconds.
  @_s.JsonKey(name: 'intervalSeconds')
  final int intervalSeconds;

  /// The path on the container on which to perform the health check.
  @_s.JsonKey(name: 'path')
  final String path;

  /// The HTTP codes to use when checking for a successful response from a
  /// container. You can specify values between 200 and 499.
  @_s.JsonKey(name: 'successCodes')
  final String successCodes;

  /// The amount of time, in seconds, during which no response means a failed
  /// health check. You may specify between 2 and 60 seconds.
  @_s.JsonKey(name: 'timeoutSeconds')
  final int timeoutSeconds;

  /// The number of consecutive health check failures required before moving the
  /// container to the <code>Unhealthy</code> state.
  @_s.JsonKey(name: 'unhealthyThreshold')
  final int unhealthyThreshold;

  ContainerServiceHealthCheckConfig({
    this.healthyThreshold,
    this.intervalSeconds,
    this.path,
    this.successCodes,
    this.timeoutSeconds,
    this.unhealthyThreshold,
  });
  factory ContainerServiceHealthCheckConfig.fromJson(
          Map<String, dynamic> json) =>
      _$ContainerServiceHealthCheckConfigFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ContainerServiceHealthCheckConfigToJson(this);
}

/// Describes the log events of a container of an Amazon Lightsail container
/// service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContainerServiceLogEvent {
  /// The timestamp when the container service log event was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The message of the container service log event.
  @_s.JsonKey(name: 'message')
  final String message;

  ContainerServiceLogEvent({
    this.createdAt,
    this.message,
  });
  factory ContainerServiceLogEvent.fromJson(Map<String, dynamic> json) =>
      _$ContainerServiceLogEventFromJson(json);
}

enum ContainerServiceMetricName {
  @_s.JsonValue('CPUUtilization')
  cPUUtilization,
  @_s.JsonValue('MemoryUtilization')
  memoryUtilization,
}

extension on ContainerServiceMetricName {
  String toValue() {
    switch (this) {
      case ContainerServiceMetricName.cPUUtilization:
        return 'CPUUtilization';
      case ContainerServiceMetricName.memoryUtilization:
        return 'MemoryUtilization';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the powers that can be specified for an Amazon Lightsail container
/// service.
///
/// The power specifies the amount of RAM, the number of vCPUs, and the base
/// price of the container service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContainerServicePower {
  /// The number of vCPUs included in the power.
  @_s.JsonKey(name: 'cpuCount')
  final double cpuCount;

  /// A Boolean value indicating whether the power is active and can be specified
  /// for container services.
  @_s.JsonKey(name: 'isActive')
  final bool isActive;

  /// The friendly name of the power (e.g., <code>nano</code>).
  @_s.JsonKey(name: 'name')
  final String name;

  /// The ID of the power (e.g., <code>nano-1</code>).
  @_s.JsonKey(name: 'powerId')
  final String powerId;

  /// The monthly price of the power in USD.
  @_s.JsonKey(name: 'price')
  final double price;

  /// The amount of RAM (in GB) of the power.
  @_s.JsonKey(name: 'ramSizeInGb')
  final double ramSizeInGb;

  ContainerServicePower({
    this.cpuCount,
    this.isActive,
    this.name,
    this.powerId,
    this.price,
    this.ramSizeInGb,
  });
  factory ContainerServicePower.fromJson(Map<String, dynamic> json) =>
      _$ContainerServicePowerFromJson(json);
}

enum ContainerServicePowerName {
  @_s.JsonValue('nano')
  nano,
  @_s.JsonValue('micro')
  micro,
  @_s.JsonValue('small')
  small,
  @_s.JsonValue('medium')
  medium,
  @_s.JsonValue('large')
  large,
  @_s.JsonValue('xlarge')
  xlarge,
}

extension on ContainerServicePowerName {
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
    throw Exception('Unknown enum value: $this');
  }
}

enum ContainerServiceProtocol {
  @_s.JsonValue('HTTP')
  http,
  @_s.JsonValue('HTTPS')
  https,
  @_s.JsonValue('TCP')
  tcp,
  @_s.JsonValue('UDP')
  udp,
}

/// Describes the login information for the container image registry of an
/// Amazon Lightsail account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContainerServiceRegistryLogin {
  /// The timestamp of when the container image registry username and password
  /// expire.
  ///
  /// The log in credentials expire 12 hours after they are created, at which
  /// point you will need to create a new set of log in credentials using the
  /// <code>CreateContainerServiceRegistryLogin</code> action.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'expiresAt')
  final DateTime expiresAt;

  /// The container service registry password to use to push container images to
  /// the container image registry of a Lightsail account
  @_s.JsonKey(name: 'password')
  final String password;

  /// The address to use to push container images to the container image registry
  /// of a Lightsail account.
  @_s.JsonKey(name: 'registry')
  final String registry;

  /// The container service registry username to use to push container images to
  /// the container image registry of a Lightsail account.
  @_s.JsonKey(name: 'username')
  final String username;

  ContainerServiceRegistryLogin({
    this.expiresAt,
    this.password,
    this.registry,
    this.username,
  });
  factory ContainerServiceRegistryLogin.fromJson(Map<String, dynamic> json) =>
      _$ContainerServiceRegistryLoginFromJson(json);
}

enum ContainerServiceState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('READY')
  ready,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DISABLED')
  disabled,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContainerServicesListResult {
  /// An array of objects that describe one or more container services.
  @_s.JsonKey(name: 'containerServices')
  final List<ContainerService> containerServices;

  ContainerServicesListResult({
    this.containerServices,
  });
  factory ContainerServicesListResult.fromJson(Map<String, dynamic> json) =>
      _$ContainerServicesListResultFromJson(json);
}

/// Describes whether an Amazon Lightsail content delivery network (CDN)
/// distribution forwards cookies to the origin and, if so, which ones.
///
/// For the cookies that you specify, your distribution caches separate versions
/// of the specified content based on the cookie values in viewer requests.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CookieObject {
  /// The specific cookies to forward to your distribution's origin.
  @_s.JsonKey(name: 'cookiesAllowList')
  final List<String> cookiesAllowList;

  /// Specifies which cookies to forward to the distribution's origin for a cache
  /// behavior: <code>all</code>, <code>none</code>, or <code>allow-list</code> to
  /// forward only the cookies specified in the <code>cookiesAllowList</code>
  /// parameter.
  @_s.JsonKey(name: 'option')
  final ForwardValues option;

  CookieObject({
    this.cookiesAllowList,
    this.option,
  });
  factory CookieObject.fromJson(Map<String, dynamic> json) =>
      _$CookieObjectFromJson(json);

  Map<String, dynamic> toJson() => _$CookieObjectToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CopySnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  CopySnapshotResult({
    this.operations,
  });
  factory CopySnapshotResult.fromJson(Map<String, dynamic> json) =>
      _$CopySnapshotResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCertificateResult {
  /// An object that describes the certificate created.
  @_s.JsonKey(name: 'certificate')
  final CertificateSummary certificate;

  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  CreateCertificateResult({
    this.certificate,
    this.operations,
  });
  factory CreateCertificateResult.fromJson(Map<String, dynamic> json) =>
      _$CreateCertificateResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCloudFormationStackResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  CreateCloudFormationStackResult({
    this.operations,
  });
  factory CreateCloudFormationStackResult.fromJson(Map<String, dynamic> json) =>
      _$CreateCloudFormationStackResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateContactMethodResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  CreateContactMethodResult({
    this.operations,
  });
  factory CreateContactMethodResult.fromJson(Map<String, dynamic> json) =>
      _$CreateContactMethodResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateContainerServiceDeploymentResult {
  /// An object that describes a container service.
  @_s.JsonKey(name: 'containerService')
  final ContainerService containerService;

  CreateContainerServiceDeploymentResult({
    this.containerService,
  });
  factory CreateContainerServiceDeploymentResult.fromJson(
          Map<String, dynamic> json) =>
      _$CreateContainerServiceDeploymentResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateContainerServiceRegistryLoginResult {
  /// An object that describes the log in information for the container service
  /// registry of your Lightsail account.
  @_s.JsonKey(name: 'registryLogin')
  final ContainerServiceRegistryLogin registryLogin;

  CreateContainerServiceRegistryLoginResult({
    this.registryLogin,
  });
  factory CreateContainerServiceRegistryLoginResult.fromJson(
          Map<String, dynamic> json) =>
      _$CreateContainerServiceRegistryLoginResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateContainerServiceResult {
  /// An object that describes a container service.
  @_s.JsonKey(name: 'containerService')
  final ContainerService containerService;

  CreateContainerServiceResult({
    this.containerService,
  });
  factory CreateContainerServiceResult.fromJson(Map<String, dynamic> json) =>
      _$CreateContainerServiceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDiskFromSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  CreateDiskFromSnapshotResult({
    this.operations,
  });
  factory CreateDiskFromSnapshotResult.fromJson(Map<String, dynamic> json) =>
      _$CreateDiskFromSnapshotResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDiskResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  CreateDiskResult({
    this.operations,
  });
  factory CreateDiskResult.fromJson(Map<String, dynamic> json) =>
      _$CreateDiskResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDiskSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  CreateDiskSnapshotResult({
    this.operations,
  });
  factory CreateDiskSnapshotResult.fromJson(Map<String, dynamic> json) =>
      _$CreateDiskSnapshotResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDistributionResult {
  /// An object that describes the distribution created.
  @_s.JsonKey(name: 'distribution')
  final LightsailDistribution distribution;

  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operation')
  final Operation operation;

  CreateDistributionResult({
    this.distribution,
    this.operation,
  });
  factory CreateDistributionResult.fromJson(Map<String, dynamic> json) =>
      _$CreateDistributionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDomainEntryResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operation')
  final Operation operation;

  CreateDomainEntryResult({
    this.operation,
  });
  factory CreateDomainEntryResult.fromJson(Map<String, dynamic> json) =>
      _$CreateDomainEntryResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDomainResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operation')
  final Operation operation;

  CreateDomainResult({
    this.operation,
  });
  factory CreateDomainResult.fromJson(Map<String, dynamic> json) =>
      _$CreateDomainResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateInstanceSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  CreateInstanceSnapshotResult({
    this.operations,
  });
  factory CreateInstanceSnapshotResult.fromJson(Map<String, dynamic> json) =>
      _$CreateInstanceSnapshotResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateInstancesFromSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  CreateInstancesFromSnapshotResult({
    this.operations,
  });
  factory CreateInstancesFromSnapshotResult.fromJson(
          Map<String, dynamic> json) =>
      _$CreateInstancesFromSnapshotResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateInstancesResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  CreateInstancesResult({
    this.operations,
  });
  factory CreateInstancesResult.fromJson(Map<String, dynamic> json) =>
      _$CreateInstancesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateKeyPairResult {
  /// An array of key-value pairs containing information about the new key pair
  /// you just created.
  @_s.JsonKey(name: 'keyPair')
  final KeyPair keyPair;

  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operation')
  final Operation operation;

  /// A base64-encoded RSA private key.
  @_s.JsonKey(name: 'privateKeyBase64')
  final String privateKeyBase64;

  /// A base64-encoded public key of the <code>ssh-rsa</code> type.
  @_s.JsonKey(name: 'publicKeyBase64')
  final String publicKeyBase64;

  CreateKeyPairResult({
    this.keyPair,
    this.operation,
    this.privateKeyBase64,
    this.publicKeyBase64,
  });
  factory CreateKeyPairResult.fromJson(Map<String, dynamic> json) =>
      _$CreateKeyPairResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLoadBalancerResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  CreateLoadBalancerResult({
    this.operations,
  });
  factory CreateLoadBalancerResult.fromJson(Map<String, dynamic> json) =>
      _$CreateLoadBalancerResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLoadBalancerTlsCertificateResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  CreateLoadBalancerTlsCertificateResult({
    this.operations,
  });
  factory CreateLoadBalancerTlsCertificateResult.fromJson(
          Map<String, dynamic> json) =>
      _$CreateLoadBalancerTlsCertificateResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRelationalDatabaseFromSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  CreateRelationalDatabaseFromSnapshotResult({
    this.operations,
  });
  factory CreateRelationalDatabaseFromSnapshotResult.fromJson(
          Map<String, dynamic> json) =>
      _$CreateRelationalDatabaseFromSnapshotResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRelationalDatabaseResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  CreateRelationalDatabaseResult({
    this.operations,
  });
  factory CreateRelationalDatabaseResult.fromJson(Map<String, dynamic> json) =>
      _$CreateRelationalDatabaseResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRelationalDatabaseSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  CreateRelationalDatabaseSnapshotResult({
    this.operations,
  });
  factory CreateRelationalDatabaseSnapshotResult.fromJson(
          Map<String, dynamic> json) =>
      _$CreateRelationalDatabaseSnapshotResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAlarmResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  DeleteAlarmResult({
    this.operations,
  });
  factory DeleteAlarmResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteAlarmResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAutoSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  DeleteAutoSnapshotResult({
    this.operations,
  });
  factory DeleteAutoSnapshotResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteAutoSnapshotResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteCertificateResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  DeleteCertificateResult({
    this.operations,
  });
  factory DeleteCertificateResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteCertificateResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteContactMethodResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  DeleteContactMethodResult({
    this.operations,
  });
  factory DeleteContactMethodResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteContactMethodResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteContainerImageResult {
  DeleteContainerImageResult();
  factory DeleteContainerImageResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteContainerImageResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteContainerServiceResult {
  DeleteContainerServiceResult();
  factory DeleteContainerServiceResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteContainerServiceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDiskResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  DeleteDiskResult({
    this.operations,
  });
  factory DeleteDiskResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteDiskResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDiskSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  DeleteDiskSnapshotResult({
    this.operations,
  });
  factory DeleteDiskSnapshotResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteDiskSnapshotResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDistributionResult {
  /// An object that describes the result of the action, such as the status of the
  /// request, the timestamp of the request, and the resources affected by the
  /// request.
  @_s.JsonKey(name: 'operation')
  final Operation operation;

  DeleteDistributionResult({
    this.operation,
  });
  factory DeleteDistributionResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteDistributionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDomainEntryResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operation')
  final Operation operation;

  DeleteDomainEntryResult({
    this.operation,
  });
  factory DeleteDomainEntryResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteDomainEntryResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDomainResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operation')
  final Operation operation;

  DeleteDomainResult({
    this.operation,
  });
  factory DeleteDomainResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteDomainResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteInstanceResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  DeleteInstanceResult({
    this.operations,
  });
  factory DeleteInstanceResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteInstanceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteInstanceSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  DeleteInstanceSnapshotResult({
    this.operations,
  });
  factory DeleteInstanceSnapshotResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteInstanceSnapshotResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteKeyPairResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operation')
  final Operation operation;

  DeleteKeyPairResult({
    this.operation,
  });
  factory DeleteKeyPairResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteKeyPairResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteKnownHostKeysResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  DeleteKnownHostKeysResult({
    this.operations,
  });
  factory DeleteKnownHostKeysResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteKnownHostKeysResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteLoadBalancerResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  DeleteLoadBalancerResult({
    this.operations,
  });
  factory DeleteLoadBalancerResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteLoadBalancerResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteLoadBalancerTlsCertificateResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  DeleteLoadBalancerTlsCertificateResult({
    this.operations,
  });
  factory DeleteLoadBalancerTlsCertificateResult.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteLoadBalancerTlsCertificateResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRelationalDatabaseResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  DeleteRelationalDatabaseResult({
    this.operations,
  });
  factory DeleteRelationalDatabaseResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteRelationalDatabaseResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRelationalDatabaseSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  DeleteRelationalDatabaseSnapshotResult({
    this.operations,
  });
  factory DeleteRelationalDatabaseSnapshotResult.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteRelationalDatabaseSnapshotResultFromJson(json);
}

/// Describes the destination of a record.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DestinationInfo {
  /// The ID of the resource created at the destination.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The destination service of the record.
  @_s.JsonKey(name: 'service')
  final String service;

  DestinationInfo({
    this.id,
    this.service,
  });
  factory DestinationInfo.fromJson(Map<String, dynamic> json) =>
      _$DestinationInfoFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetachCertificateFromDistributionResult {
  /// An object that describes the result of the action, such as the status of the
  /// request, the timestamp of the request, and the resources affected by the
  /// request.
  @_s.JsonKey(name: 'operation')
  final Operation operation;

  DetachCertificateFromDistributionResult({
    this.operation,
  });
  factory DetachCertificateFromDistributionResult.fromJson(
          Map<String, dynamic> json) =>
      _$DetachCertificateFromDistributionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetachDiskResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  DetachDiskResult({
    this.operations,
  });
  factory DetachDiskResult.fromJson(Map<String, dynamic> json) =>
      _$DetachDiskResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetachInstancesFromLoadBalancerResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  DetachInstancesFromLoadBalancerResult({
    this.operations,
  });
  factory DetachInstancesFromLoadBalancerResult.fromJson(
          Map<String, dynamic> json) =>
      _$DetachInstancesFromLoadBalancerResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetachStaticIpResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  DetachStaticIpResult({
    this.operations,
  });
  factory DetachStaticIpResult.fromJson(Map<String, dynamic> json) =>
      _$DetachStaticIpResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisableAddOnResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  DisableAddOnResult({
    this.operations,
  });
  factory DisableAddOnResult.fromJson(Map<String, dynamic> json) =>
      _$DisableAddOnResultFromJson(json);
}

/// Describes a system disk or a block storage disk.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Disk {
  /// An array of objects representing the add-ons enabled on the disk.
  @_s.JsonKey(name: 'addOns')
  final List<AddOn> addOns;

  /// The Amazon Resource Name (ARN) of the disk.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The resources to which the disk is attached.
  @_s.JsonKey(name: 'attachedTo')
  final String attachedTo;

  /// (Deprecated) The attachment state of the disk.
  /// <note>
  /// In releases prior to November 14, 2017, this parameter returned
  /// <code>attached</code> for system disks in the API response. It is now
  /// deprecated, but still included in the response. Use <code>isAttached</code>
  /// instead.
  /// </note>
  @_s.JsonKey(name: 'attachmentState')
  final String attachmentState;

  /// The date when the disk was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// (Deprecated) The number of GB in use by the disk.
  /// <note>
  /// In releases prior to November 14, 2017, this parameter was not included in
  /// the API response. It is now deprecated.
  /// </note>
  @_s.JsonKey(name: 'gbInUse')
  final int gbInUse;

  /// The input/output operations per second (IOPS) of the disk.
  @_s.JsonKey(name: 'iops')
  final int iops;

  /// A Boolean value indicating whether the disk is attached.
  @_s.JsonKey(name: 'isAttached')
  final bool isAttached;

  /// A Boolean value indicating whether this disk is a system disk (has an
  /// operating system loaded on it).
  @_s.JsonKey(name: 'isSystemDisk')
  final bool isSystemDisk;

  /// The AWS Region and Availability Zone where the disk is located.
  @_s.JsonKey(name: 'location')
  final ResourceLocation location;

  /// The unique name of the disk.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The disk path.
  @_s.JsonKey(name: 'path')
  final String path;

  /// The Lightsail resource type (e.g., <code>Disk</code>).
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// The size of the disk in GB.
  @_s.JsonKey(name: 'sizeInGb')
  final int sizeInGb;

  /// Describes the status of the disk.
  @_s.JsonKey(name: 'state')
  final DiskState state;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more easily.
  @_s.JsonKey(name: 'supportCode')
  final String supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
  /// Dev Guide</a>.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  Disk({
    this.addOns,
    this.arn,
    this.attachedTo,
    this.attachmentState,
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
  factory Disk.fromJson(Map<String, dynamic> json) => _$DiskFromJson(json);
}

/// Describes a disk.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DiskInfo {
  /// A Boolean value indicating whether this disk is a system disk (has an
  /// operating system loaded on it).
  @_s.JsonKey(name: 'isSystemDisk')
  final bool isSystemDisk;

  /// The disk name.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The disk path.
  @_s.JsonKey(name: 'path')
  final String path;

  /// The size of the disk in GB (e.g., <code>32</code>).
  @_s.JsonKey(name: 'sizeInGb')
  final int sizeInGb;

  DiskInfo({
    this.isSystemDisk,
    this.name,
    this.path,
    this.sizeInGb,
  });
  factory DiskInfo.fromJson(Map<String, dynamic> json) =>
      _$DiskInfoFromJson(json);
}

/// Describes a block storage disk mapping.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DiskMap {
  /// The new disk name (e.g., <code>my-new-disk</code>).
  @_s.JsonKey(name: 'newDiskName')
  final String newDiskName;

  /// The original disk path exposed to the instance (for example,
  /// <code>/dev/sdh</code>).
  @_s.JsonKey(name: 'originalDiskPath')
  final String originalDiskPath;

  DiskMap({
    this.newDiskName,
    this.originalDiskPath,
  });
  Map<String, dynamic> toJson() => _$DiskMapToJson(this);
}

/// Describes a block storage disk snapshot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DiskSnapshot {
  /// The Amazon Resource Name (ARN) of the disk snapshot.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date when the disk snapshot was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the source disk from which the disk
  /// snapshot was created.
  @_s.JsonKey(name: 'fromDiskArn')
  final String fromDiskArn;

  /// The unique name of the source disk from which the disk snapshot was created.
  @_s.JsonKey(name: 'fromDiskName')
  final String fromDiskName;

  /// The Amazon Resource Name (ARN) of the source instance from which the disk
  /// (system volume) snapshot was created.
  @_s.JsonKey(name: 'fromInstanceArn')
  final String fromInstanceArn;

  /// The unique name of the source instance from which the disk (system volume)
  /// snapshot was created.
  @_s.JsonKey(name: 'fromInstanceName')
  final String fromInstanceName;

  /// A Boolean value indicating whether the snapshot was created from an
  /// automatic snapshot.
  @_s.JsonKey(name: 'isFromAutoSnapshot')
  final bool isFromAutoSnapshot;

  /// The AWS Region and Availability Zone where the disk snapshot was created.
  @_s.JsonKey(name: 'location')
  final ResourceLocation location;

  /// The name of the disk snapshot (e.g., <code>my-disk-snapshot</code>).
  @_s.JsonKey(name: 'name')
  final String name;

  /// The progress of the disk snapshot operation.
  @_s.JsonKey(name: 'progress')
  final String progress;

  /// The Lightsail resource type (e.g., <code>DiskSnapshot</code>).
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// The size of the disk in GB.
  @_s.JsonKey(name: 'sizeInGb')
  final int sizeInGb;

  /// The status of the disk snapshot operation.
  @_s.JsonKey(name: 'state')
  final DiskSnapshotState state;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more easily.
  @_s.JsonKey(name: 'supportCode')
  final String supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
  /// Dev Guide</a>.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

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
  factory DiskSnapshot.fromJson(Map<String, dynamic> json) =>
      _$DiskSnapshotFromJson(json);
}

/// Describes a disk snapshot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DiskSnapshotInfo {
  /// The size of the disk in GB (e.g., <code>32</code>).
  @_s.JsonKey(name: 'sizeInGb')
  final int sizeInGb;

  DiskSnapshotInfo({
    this.sizeInGb,
  });
  factory DiskSnapshotInfo.fromJson(Map<String, dynamic> json) =>
      _$DiskSnapshotInfoFromJson(json);
}

enum DiskSnapshotState {
  @_s.JsonValue('pending')
  pending,
  @_s.JsonValue('completed')
  completed,
  @_s.JsonValue('error')
  error,
  @_s.JsonValue('unknown')
  unknown,
}

enum DiskState {
  @_s.JsonValue('pending')
  pending,
  @_s.JsonValue('error')
  error,
  @_s.JsonValue('available')
  available,
  @_s.JsonValue('in-use')
  inUse,
  @_s.JsonValue('unknown')
  unknown,
}

/// Describes the specifications of a distribution bundle.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DistributionBundle {
  /// The ID of the bundle.
  @_s.JsonKey(name: 'bundleId')
  final String bundleId;

  /// Indicates whether the bundle is active, and can be specified for a new
  /// distribution.
  @_s.JsonKey(name: 'isActive')
  final bool isActive;

  /// The name of the distribution bundle.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The monthly price, in US dollars, of the bundle.
  @_s.JsonKey(name: 'price')
  final double price;

  /// The monthly network transfer quota of the bundle.
  @_s.JsonKey(name: 'transferPerMonthInGb')
  final int transferPerMonthInGb;

  DistributionBundle({
    this.bundleId,
    this.isActive,
    this.name,
    this.price,
    this.transferPerMonthInGb,
  });
  factory DistributionBundle.fromJson(Map<String, dynamic> json) =>
      _$DistributionBundleFromJson(json);
}

enum DistributionMetricName {
  @_s.JsonValue('Requests')
  requests,
  @_s.JsonValue('BytesDownloaded')
  bytesDownloaded,
  @_s.JsonValue('BytesUploaded')
  bytesUploaded,
  @_s.JsonValue('TotalErrorRate')
  totalErrorRate,
  @_s.JsonValue('Http4xxErrorRate')
  http4xxErrorRate,
  @_s.JsonValue('Http5xxErrorRate')
  http5xxErrorRate,
}

extension on DistributionMetricName {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a domain where you are storing recordsets in Lightsail.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Domain {
  /// The Amazon Resource Name (ARN) of the domain recordset (e.g.,
  /// <code>arn:aws:lightsail:global:123456789101:Domain/824cede0-abc7-4f84-8dbc-12345EXAMPLE</code>).
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date when the domain recordset was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// An array of key-value pairs containing information about the domain entries.
  @_s.JsonKey(name: 'domainEntries')
  final List<DomainEntry> domainEntries;

  /// The AWS Region and Availability Zones where the domain recordset was
  /// created.
  @_s.JsonKey(name: 'location')
  final ResourceLocation location;

  /// The name of the domain.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The resource type.
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more easily.
  @_s.JsonKey(name: 'supportCode')
  final String supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
  /// Dev Guide</a>.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  Domain({
    this.arn,
    this.createdAt,
    this.domainEntries,
    this.location,
    this.name,
    this.resourceType,
    this.supportCode,
    this.tags,
  });
  factory Domain.fromJson(Map<String, dynamic> json) => _$DomainFromJson(json);
}

/// Describes a domain recordset entry.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DomainEntry {
  /// The ID of the domain recordset entry.
  @_s.JsonKey(name: 'id')
  final String id;

  /// When <code>true</code>, specifies whether the domain entry is an alias used
  /// by the Lightsail load balancer. You can include an alias (A type) record in
  /// your request, which points to a load balancer DNS name and routes traffic to
  /// your load balancer.
  @_s.JsonKey(name: 'isAlias')
  final bool isAlias;

  /// The name of the domain.
  @_s.JsonKey(name: 'name')
  final String name;

  /// (Deprecated) The options for the domain entry.
  /// <note>
  /// In releases prior to November 29, 2017, this parameter was not included in
  /// the API response. It is now deprecated.
  /// </note>
  @_s.JsonKey(name: 'options')
  final Map<String, String> options;

  /// The target AWS name server (e.g., <code>ns-111.awsdns-22.com.</code>).
  ///
  /// For Lightsail load balancers, the value looks like
  /// <code>ab1234c56789c6b86aba6fb203d443bc-123456789.us-east-2.elb.amazonaws.com</code>.
  /// Be sure to also set <code>isAlias</code> to <code>true</code> when setting
  /// up an A record for a load balancer.
  @_s.JsonKey(name: 'target')
  final String target;

  /// The type of domain entry, such as address (A), canonical name (CNAME), mail
  /// exchanger (MX), name server (NS), start of authority (SOA), service locator
  /// (SRV), or text (TXT).
  ///
  /// The following domain entry types can be used:
  ///
  /// <ul>
  /// <li>
  /// <code>A</code>
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
  @_s.JsonKey(name: 'type')
  final String type;

  DomainEntry({
    this.id,
    this.isAlias,
    this.name,
    this.options,
    this.target,
    this.type,
  });
  factory DomainEntry.fromJson(Map<String, dynamic> json) =>
      _$DomainEntryFromJson(json);

  Map<String, dynamic> toJson() => _$DomainEntryToJson(this);
}

/// Describes the domain validation records of an Amazon Lightsail SSL/TLS
/// certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainValidationRecord {
  /// The domain name of the certificate validation record. For example,
  /// <code>example.com</code> or <code>www.example.com</code>.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// An object that describes the DNS records to add to your domain's DNS to
  /// validate it for the certificate.
  @_s.JsonKey(name: 'resourceRecord')
  final ResourceRecord resourceRecord;

  DomainValidationRecord({
    this.domainName,
    this.resourceRecord,
  });
  factory DomainValidationRecord.fromJson(Map<String, dynamic> json) =>
      _$DomainValidationRecordFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DownloadDefaultKeyPairResult {
  /// A base64-encoded RSA private key.
  @_s.JsonKey(name: 'privateKeyBase64')
  final String privateKeyBase64;

  /// A base64-encoded public key of the <code>ssh-rsa</code> type.
  @_s.JsonKey(name: 'publicKeyBase64')
  final String publicKeyBase64;

  DownloadDefaultKeyPairResult({
    this.privateKeyBase64,
    this.publicKeyBase64,
  });
  factory DownloadDefaultKeyPairResult.fromJson(Map<String, dynamic> json) =>
      _$DownloadDefaultKeyPairResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnableAddOnResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  EnableAddOnResult({
    this.operations,
  });
  factory EnableAddOnResult.fromJson(Map<String, dynamic> json) =>
      _$EnableAddOnResultFromJson(json);
}

/// Describes the settings of a public endpoint for an Amazon Lightsail
/// container service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EndpointRequest {
  /// The name of the container for the endpoint.
  @_s.JsonKey(name: 'containerName')
  final String containerName;

  /// The port of the container to which traffic is forwarded to.
  @_s.JsonKey(name: 'containerPort')
  final int containerPort;

  /// An object that describes the health check configuration of the container.
  @_s.JsonKey(name: 'healthCheck')
  final ContainerServiceHealthCheckConfig healthCheck;

  EndpointRequest({
    @_s.required this.containerName,
    @_s.required this.containerPort,
    this.healthCheck,
  });
  Map<String, dynamic> toJson() => _$EndpointRequestToJson(this);
}

/// Describes an export snapshot record.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportSnapshotRecord {
  /// The Amazon Resource Name (ARN) of the export snapshot record.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date when the export snapshot record was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// A list of objects describing the destination of the export snapshot record.
  @_s.JsonKey(name: 'destinationInfo')
  final DestinationInfo destinationInfo;

  /// The AWS Region and Availability Zone where the export snapshot record is
  /// located.
  @_s.JsonKey(name: 'location')
  final ResourceLocation location;

  /// The export snapshot record name.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The Lightsail resource type (e.g., <code>ExportSnapshotRecord</code>).
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// A list of objects describing the source of the export snapshot record.
  @_s.JsonKey(name: 'sourceInfo')
  final ExportSnapshotRecordSourceInfo sourceInfo;

  /// The state of the export snapshot record.
  @_s.JsonKey(name: 'state')
  final RecordState state;

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
  factory ExportSnapshotRecord.fromJson(Map<String, dynamic> json) =>
      _$ExportSnapshotRecordFromJson(json);
}

/// Describes the source of an export snapshot record.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportSnapshotRecordSourceInfo {
  /// The Amazon Resource Name (ARN) of the source instance or disk snapshot.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date when the source instance or disk snapshot was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// A list of objects describing a disk snapshot.
  @_s.JsonKey(name: 'diskSnapshotInfo')
  final DiskSnapshotInfo diskSnapshotInfo;

  /// The Amazon Resource Name (ARN) of the snapshot's source instance or disk.
  @_s.JsonKey(name: 'fromResourceArn')
  final String fromResourceArn;

  /// The name of the snapshot's source instance or disk.
  @_s.JsonKey(name: 'fromResourceName')
  final String fromResourceName;

  /// A list of objects describing an instance snapshot.
  @_s.JsonKey(name: 'instanceSnapshotInfo')
  final InstanceSnapshotInfo instanceSnapshotInfo;

  /// The name of the source instance or disk snapshot.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The Lightsail resource type (e.g., <code>InstanceSnapshot</code> or
  /// <code>DiskSnapshot</code>).
  @_s.JsonKey(name: 'resourceType')
  final ExportSnapshotRecordSourceType resourceType;

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
  factory ExportSnapshotRecordSourceInfo.fromJson(Map<String, dynamic> json) =>
      _$ExportSnapshotRecordSourceInfoFromJson(json);
}

enum ExportSnapshotRecordSourceType {
  @_s.JsonValue('InstanceSnapshot')
  instanceSnapshot,
  @_s.JsonValue('DiskSnapshot')
  diskSnapshot,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportSnapshotResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  ExportSnapshotResult({
    this.operations,
  });
  factory ExportSnapshotResult.fromJson(Map<String, dynamic> json) =>
      _$ExportSnapshotResultFromJson(json);
}

enum ForwardValues {
  @_s.JsonValue('none')
  none,
  @_s.JsonValue('allow-list')
  allowList,
  @_s.JsonValue('all')
  all,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetActiveNamesResult {
  /// The list of active names returned by the get active names request.
  @_s.JsonKey(name: 'activeNames')
  final List<String> activeNames;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetActiveNames</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  GetActiveNamesResult({
    this.activeNames,
    this.nextPageToken,
  });
  factory GetActiveNamesResult.fromJson(Map<String, dynamic> json) =>
      _$GetActiveNamesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAlarmsResult {
  /// An array of objects that describe the alarms.
  @_s.JsonKey(name: 'alarms')
  final List<Alarm> alarms;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetAlarms</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  GetAlarmsResult({
    this.alarms,
    this.nextPageToken,
  });
  factory GetAlarmsResult.fromJson(Map<String, dynamic> json) =>
      _$GetAlarmsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAutoSnapshotsResult {
  /// An array of objects that describe the automatic snapshots that are available
  /// for the specified source instance or disk.
  @_s.JsonKey(name: 'autoSnapshots')
  final List<AutoSnapshotDetails> autoSnapshots;

  /// The name of the source instance or disk for the automatic snapshots.
  @_s.JsonKey(name: 'resourceName')
  final String resourceName;

  /// The resource type (e.g., <code>Instance</code> or <code>Disk</code>).
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  GetAutoSnapshotsResult({
    this.autoSnapshots,
    this.resourceName,
    this.resourceType,
  });
  factory GetAutoSnapshotsResult.fromJson(Map<String, dynamic> json) =>
      _$GetAutoSnapshotsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBlueprintsResult {
  /// An array of key-value pairs that contains information about the available
  /// blueprints.
  @_s.JsonKey(name: 'blueprints')
  final List<Blueprint> blueprints;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetBlueprints</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  GetBlueprintsResult({
    this.blueprints,
    this.nextPageToken,
  });
  factory GetBlueprintsResult.fromJson(Map<String, dynamic> json) =>
      _$GetBlueprintsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBundlesResult {
  /// An array of key-value pairs that contains information about the available
  /// bundles.
  @_s.JsonKey(name: 'bundles')
  final List<Bundle> bundles;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetBundles</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  GetBundlesResult({
    this.bundles,
    this.nextPageToken,
  });
  factory GetBundlesResult.fromJson(Map<String, dynamic> json) =>
      _$GetBundlesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCertificatesResult {
  /// An object that describes certificates.
  @_s.JsonKey(name: 'certificates')
  final List<CertificateSummary> certificates;

  GetCertificatesResult({
    this.certificates,
  });
  factory GetCertificatesResult.fromJson(Map<String, dynamic> json) =>
      _$GetCertificatesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCloudFormationStackRecordsResult {
  /// A list of objects describing the CloudFormation stack records.
  @_s.JsonKey(name: 'cloudFormationStackRecords')
  final List<CloudFormationStackRecord> cloudFormationStackRecords;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetCloudFormationStackRecords</code> request and specify the next page
  /// token using the <code>pageToken</code> parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  GetCloudFormationStackRecordsResult({
    this.cloudFormationStackRecords,
    this.nextPageToken,
  });
  factory GetCloudFormationStackRecordsResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetCloudFormationStackRecordsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetContactMethodsResult {
  /// An array of objects that describe the contact methods.
  @_s.JsonKey(name: 'contactMethods')
  final List<ContactMethod> contactMethods;

  GetContactMethodsResult({
    this.contactMethods,
  });
  factory GetContactMethodsResult.fromJson(Map<String, dynamic> json) =>
      _$GetContactMethodsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetContainerAPIMetadataResult {
  /// Metadata about Lightsail containers, such as the current version of the
  /// Lightsail Control (lightsailctl) plugin.
  @_s.JsonKey(name: 'metadata')
  final List<Map<String, String>> metadata;

  GetContainerAPIMetadataResult({
    this.metadata,
  });
  factory GetContainerAPIMetadataResult.fromJson(Map<String, dynamic> json) =>
      _$GetContainerAPIMetadataResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetContainerImagesResult {
  /// An array of objects that describe container images that are registered to
  /// the container service.
  @_s.JsonKey(name: 'containerImages')
  final List<ContainerImage> containerImages;

  GetContainerImagesResult({
    this.containerImages,
  });
  factory GetContainerImagesResult.fromJson(Map<String, dynamic> json) =>
      _$GetContainerImagesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetContainerLogResult {
  /// An array of objects that describe the log events of a container.
  @_s.JsonKey(name: 'logEvents')
  final List<ContainerServiceLogEvent> logEvents;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetContainerLog</code> request and specify the next page token using
  /// the <code>pageToken</code> parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  GetContainerLogResult({
    this.logEvents,
    this.nextPageToken,
  });
  factory GetContainerLogResult.fromJson(Map<String, dynamic> json) =>
      _$GetContainerLogResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetContainerServiceDeploymentsResult {
  /// An array of objects that describe deployments for a container service.
  @_s.JsonKey(name: 'deployments')
  final List<ContainerServiceDeployment> deployments;

  GetContainerServiceDeploymentsResult({
    this.deployments,
  });
  factory GetContainerServiceDeploymentsResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetContainerServiceDeploymentsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetContainerServiceMetricDataResult {
  /// An array of objects that describe the metric data returned.
  @_s.JsonKey(name: 'metricData')
  final List<MetricDatapoint> metricData;

  /// The name of the metric returned.
  @_s.JsonKey(name: 'metricName')
  final ContainerServiceMetricName metricName;

  GetContainerServiceMetricDataResult({
    this.metricData,
    this.metricName,
  });
  factory GetContainerServiceMetricDataResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetContainerServiceMetricDataResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetContainerServicePowersResult {
  /// An array of objects that describe the powers that can be specified for a
  /// container service.
  @_s.JsonKey(name: 'powers')
  final List<ContainerServicePower> powers;

  GetContainerServicePowersResult({
    this.powers,
  });
  factory GetContainerServicePowersResult.fromJson(Map<String, dynamic> json) =>
      _$GetContainerServicePowersResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDiskResult {
  /// An object containing information about the disk.
  @_s.JsonKey(name: 'disk')
  final Disk disk;

  GetDiskResult({
    this.disk,
  });
  factory GetDiskResult.fromJson(Map<String, dynamic> json) =>
      _$GetDiskResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDiskSnapshotResult {
  /// An object containing information about the disk snapshot.
  @_s.JsonKey(name: 'diskSnapshot')
  final DiskSnapshot diskSnapshot;

  GetDiskSnapshotResult({
    this.diskSnapshot,
  });
  factory GetDiskSnapshotResult.fromJson(Map<String, dynamic> json) =>
      _$GetDiskSnapshotResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDiskSnapshotsResult {
  /// An array of objects containing information about all block storage disk
  /// snapshots.
  @_s.JsonKey(name: 'diskSnapshots')
  final List<DiskSnapshot> diskSnapshots;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetDiskSnapshots</code> request and specify the next page token using
  /// the <code>pageToken</code> parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  GetDiskSnapshotsResult({
    this.diskSnapshots,
    this.nextPageToken,
  });
  factory GetDiskSnapshotsResult.fromJson(Map<String, dynamic> json) =>
      _$GetDiskSnapshotsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDisksResult {
  /// An array of objects containing information about all block storage disks.
  @_s.JsonKey(name: 'disks')
  final List<Disk> disks;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetDisks</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  GetDisksResult({
    this.disks,
    this.nextPageToken,
  });
  factory GetDisksResult.fromJson(Map<String, dynamic> json) =>
      _$GetDisksResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDistributionBundlesResult {
  /// An object that describes a distribution bundle.
  @_s.JsonKey(name: 'bundles')
  final List<DistributionBundle> bundles;

  GetDistributionBundlesResult({
    this.bundles,
  });
  factory GetDistributionBundlesResult.fromJson(Map<String, dynamic> json) =>
      _$GetDistributionBundlesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDistributionLatestCacheResetResult {
  /// The timestamp of the last cache reset (e.g., <code>1479734909.17</code>) in
  /// Unix time format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createTime')
  final DateTime createTime;

  /// The status of the last cache reset.
  @_s.JsonKey(name: 'status')
  final String status;

  GetDistributionLatestCacheResetResult({
    this.createTime,
    this.status,
  });
  factory GetDistributionLatestCacheResetResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetDistributionLatestCacheResetResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDistributionMetricDataResult {
  /// An array of objects that describe the metric data returned.
  @_s.JsonKey(name: 'metricData')
  final List<MetricDatapoint> metricData;

  /// The name of the metric returned.
  @_s.JsonKey(name: 'metricName')
  final DistributionMetricName metricName;

  GetDistributionMetricDataResult({
    this.metricData,
    this.metricName,
  });
  factory GetDistributionMetricDataResult.fromJson(Map<String, dynamic> json) =>
      _$GetDistributionMetricDataResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDistributionsResult {
  /// An array of objects that describe your distributions.
  @_s.JsonKey(name: 'distributions')
  final List<LightsailDistribution> distributions;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetDistributions</code> request and specify the next page token using
  /// the <code>pageToken</code> parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  GetDistributionsResult({
    this.distributions,
    this.nextPageToken,
  });
  factory GetDistributionsResult.fromJson(Map<String, dynamic> json) =>
      _$GetDistributionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDomainResult {
  /// An array of key-value pairs containing information about your get domain
  /// request.
  @_s.JsonKey(name: 'domain')
  final Domain domain;

  GetDomainResult({
    this.domain,
  });
  factory GetDomainResult.fromJson(Map<String, dynamic> json) =>
      _$GetDomainResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDomainsResult {
  /// An array of key-value pairs containing information about each of the domain
  /// entries in the user's account.
  @_s.JsonKey(name: 'domains')
  final List<Domain> domains;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetDomains</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  GetDomainsResult({
    this.domains,
    this.nextPageToken,
  });
  factory GetDomainsResult.fromJson(Map<String, dynamic> json) =>
      _$GetDomainsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetExportSnapshotRecordsResult {
  /// A list of objects describing the export snapshot records.
  @_s.JsonKey(name: 'exportSnapshotRecords')
  final List<ExportSnapshotRecord> exportSnapshotRecords;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetExportSnapshotRecords</code> request and specify the next page
  /// token using the <code>pageToken</code> parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  GetExportSnapshotRecordsResult({
    this.exportSnapshotRecords,
    this.nextPageToken,
  });
  factory GetExportSnapshotRecordsResult.fromJson(Map<String, dynamic> json) =>
      _$GetExportSnapshotRecordsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInstanceAccessDetailsResult {
  /// An array of key-value pairs containing information about a get instance
  /// access request.
  @_s.JsonKey(name: 'accessDetails')
  final InstanceAccessDetails accessDetails;

  GetInstanceAccessDetailsResult({
    this.accessDetails,
  });
  factory GetInstanceAccessDetailsResult.fromJson(Map<String, dynamic> json) =>
      _$GetInstanceAccessDetailsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInstanceMetricDataResult {
  /// An array of objects that describe the metric data returned.
  @_s.JsonKey(name: 'metricData')
  final List<MetricDatapoint> metricData;

  /// The name of the metric returned.
  @_s.JsonKey(name: 'metricName')
  final InstanceMetricName metricName;

  GetInstanceMetricDataResult({
    this.metricData,
    this.metricName,
  });
  factory GetInstanceMetricDataResult.fromJson(Map<String, dynamic> json) =>
      _$GetInstanceMetricDataResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInstancePortStatesResult {
  /// An array of objects that describe the firewall port states for the specified
  /// instance.
  @_s.JsonKey(name: 'portStates')
  final List<InstancePortState> portStates;

  GetInstancePortStatesResult({
    this.portStates,
  });
  factory GetInstancePortStatesResult.fromJson(Map<String, dynamic> json) =>
      _$GetInstancePortStatesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInstanceResult {
  /// An array of key-value pairs containing information about the specified
  /// instance.
  @_s.JsonKey(name: 'instance')
  final Instance instance;

  GetInstanceResult({
    this.instance,
  });
  factory GetInstanceResult.fromJson(Map<String, dynamic> json) =>
      _$GetInstanceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInstanceSnapshotResult {
  /// An array of key-value pairs containing information about the results of your
  /// get instance snapshot request.
  @_s.JsonKey(name: 'instanceSnapshot')
  final InstanceSnapshot instanceSnapshot;

  GetInstanceSnapshotResult({
    this.instanceSnapshot,
  });
  factory GetInstanceSnapshotResult.fromJson(Map<String, dynamic> json) =>
      _$GetInstanceSnapshotResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInstanceSnapshotsResult {
  /// An array of key-value pairs containing information about the results of your
  /// get instance snapshots request.
  @_s.JsonKey(name: 'instanceSnapshots')
  final List<InstanceSnapshot> instanceSnapshots;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetInstanceSnapshots</code> request and specify the next page token
  /// using the <code>pageToken</code> parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  GetInstanceSnapshotsResult({
    this.instanceSnapshots,
    this.nextPageToken,
  });
  factory GetInstanceSnapshotsResult.fromJson(Map<String, dynamic> json) =>
      _$GetInstanceSnapshotsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInstanceStateResult {
  /// The state of the instance.
  @_s.JsonKey(name: 'state')
  final InstanceState state;

  GetInstanceStateResult({
    this.state,
  });
  factory GetInstanceStateResult.fromJson(Map<String, dynamic> json) =>
      _$GetInstanceStateResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInstancesResult {
  /// An array of key-value pairs containing information about your instances.
  @_s.JsonKey(name: 'instances')
  final List<Instance> instances;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetInstances</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  GetInstancesResult({
    this.instances,
    this.nextPageToken,
  });
  factory GetInstancesResult.fromJson(Map<String, dynamic> json) =>
      _$GetInstancesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetKeyPairResult {
  /// An array of key-value pairs containing information about the key pair.
  @_s.JsonKey(name: 'keyPair')
  final KeyPair keyPair;

  GetKeyPairResult({
    this.keyPair,
  });
  factory GetKeyPairResult.fromJson(Map<String, dynamic> json) =>
      _$GetKeyPairResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetKeyPairsResult {
  /// An array of key-value pairs containing information about the key pairs.
  @_s.JsonKey(name: 'keyPairs')
  final List<KeyPair> keyPairs;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetKeyPairs</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  GetKeyPairsResult({
    this.keyPairs,
    this.nextPageToken,
  });
  factory GetKeyPairsResult.fromJson(Map<String, dynamic> json) =>
      _$GetKeyPairsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLoadBalancerMetricDataResult {
  /// An array of objects that describe the metric data returned.
  @_s.JsonKey(name: 'metricData')
  final List<MetricDatapoint> metricData;

  /// The name of the metric returned.
  @_s.JsonKey(name: 'metricName')
  final LoadBalancerMetricName metricName;

  GetLoadBalancerMetricDataResult({
    this.metricData,
    this.metricName,
  });
  factory GetLoadBalancerMetricDataResult.fromJson(Map<String, dynamic> json) =>
      _$GetLoadBalancerMetricDataResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLoadBalancerResult {
  /// An object containing information about your load balancer.
  @_s.JsonKey(name: 'loadBalancer')
  final LoadBalancer loadBalancer;

  GetLoadBalancerResult({
    this.loadBalancer,
  });
  factory GetLoadBalancerResult.fromJson(Map<String, dynamic> json) =>
      _$GetLoadBalancerResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLoadBalancerTlsCertificatesResult {
  /// An array of LoadBalancerTlsCertificate objects describing your SSL/TLS
  /// certificates.
  @_s.JsonKey(name: 'tlsCertificates')
  final List<LoadBalancerTlsCertificate> tlsCertificates;

  GetLoadBalancerTlsCertificatesResult({
    this.tlsCertificates,
  });
  factory GetLoadBalancerTlsCertificatesResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetLoadBalancerTlsCertificatesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLoadBalancersResult {
  /// An array of LoadBalancer objects describing your load balancers.
  @_s.JsonKey(name: 'loadBalancers')
  final List<LoadBalancer> loadBalancers;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetLoadBalancers</code> request and specify the next page token using
  /// the <code>pageToken</code> parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  GetLoadBalancersResult({
    this.loadBalancers,
    this.nextPageToken,
  });
  factory GetLoadBalancersResult.fromJson(Map<String, dynamic> json) =>
      _$GetLoadBalancersResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetOperationResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operation')
  final Operation operation;

  GetOperationResult({
    this.operation,
  });
  factory GetOperationResult.fromJson(Map<String, dynamic> json) =>
      _$GetOperationResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetOperationsForResourceResult {
  /// (Deprecated) Returns the number of pages of results that remain.
  /// <note>
  /// In releases prior to June 12, 2017, this parameter returned
  /// <code>null</code> by the API. It is now deprecated, and the API returns the
  /// <code>next page token</code> parameter instead.
  /// </note>
  @_s.JsonKey(name: 'nextPageCount')
  final String nextPageCount;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetOperationsForResource</code> request and specify the next page
  /// token using the <code>pageToken</code> parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  GetOperationsForResourceResult({
    this.nextPageCount,
    this.nextPageToken,
    this.operations,
  });
  factory GetOperationsForResourceResult.fromJson(Map<String, dynamic> json) =>
      _$GetOperationsForResourceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetOperationsResult {
  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetOperations</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  GetOperationsResult({
    this.nextPageToken,
    this.operations,
  });
  factory GetOperationsResult.fromJson(Map<String, dynamic> json) =>
      _$GetOperationsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRegionsResult {
  /// An array of key-value pairs containing information about your get regions
  /// request.
  @_s.JsonKey(name: 'regions')
  final List<Region> regions;

  GetRegionsResult({
    this.regions,
  });
  factory GetRegionsResult.fromJson(Map<String, dynamic> json) =>
      _$GetRegionsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRelationalDatabaseBlueprintsResult {
  /// An object describing the result of your get relational database blueprints
  /// request.
  @_s.JsonKey(name: 'blueprints')
  final List<RelationalDatabaseBlueprint> blueprints;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetRelationalDatabaseBlueprints</code> request and specify the next
  /// page token using the <code>pageToken</code> parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  GetRelationalDatabaseBlueprintsResult({
    this.blueprints,
    this.nextPageToken,
  });
  factory GetRelationalDatabaseBlueprintsResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetRelationalDatabaseBlueprintsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRelationalDatabaseBundlesResult {
  /// An object describing the result of your get relational database bundles
  /// request.
  @_s.JsonKey(name: 'bundles')
  final List<RelationalDatabaseBundle> bundles;

  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetRelationalDatabaseBundles</code> request and specify the next page
  /// token using the <code>pageToken</code> parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  GetRelationalDatabaseBundlesResult({
    this.bundles,
    this.nextPageToken,
  });
  factory GetRelationalDatabaseBundlesResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetRelationalDatabaseBundlesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRelationalDatabaseEventsResult {
  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetRelationalDatabaseEvents</code> request and specify the next page
  /// token using the <code>pageToken</code> parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  /// An object describing the result of your get relational database events
  /// request.
  @_s.JsonKey(name: 'relationalDatabaseEvents')
  final List<RelationalDatabaseEvent> relationalDatabaseEvents;

  GetRelationalDatabaseEventsResult({
    this.nextPageToken,
    this.relationalDatabaseEvents,
  });
  factory GetRelationalDatabaseEventsResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetRelationalDatabaseEventsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRelationalDatabaseLogEventsResult {
  /// A token used for advancing to the previous page of results from your get
  /// relational database log events request.
  @_s.JsonKey(name: 'nextBackwardToken')
  final String nextBackwardToken;

  /// A token used for advancing to the next page of results from your get
  /// relational database log events request.
  @_s.JsonKey(name: 'nextForwardToken')
  final String nextForwardToken;

  /// An object describing the result of your get relational database log events
  /// request.
  @_s.JsonKey(name: 'resourceLogEvents')
  final List<LogEvent> resourceLogEvents;

  GetRelationalDatabaseLogEventsResult({
    this.nextBackwardToken,
    this.nextForwardToken,
    this.resourceLogEvents,
  });
  factory GetRelationalDatabaseLogEventsResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetRelationalDatabaseLogEventsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRelationalDatabaseLogStreamsResult {
  /// An object describing the result of your get relational database log streams
  /// request.
  @_s.JsonKey(name: 'logStreams')
  final List<String> logStreams;

  GetRelationalDatabaseLogStreamsResult({
    this.logStreams,
  });
  factory GetRelationalDatabaseLogStreamsResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetRelationalDatabaseLogStreamsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRelationalDatabaseMasterUserPasswordResult {
  /// The timestamp when the specified version of the master user password was
  /// created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The master user password for the <code>password version</code> specified.
  @_s.JsonKey(name: 'masterUserPassword')
  final String masterUserPassword;

  GetRelationalDatabaseMasterUserPasswordResult({
    this.createdAt,
    this.masterUserPassword,
  });
  factory GetRelationalDatabaseMasterUserPasswordResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetRelationalDatabaseMasterUserPasswordResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRelationalDatabaseMetricDataResult {
  /// An array of objects that describe the metric data returned.
  @_s.JsonKey(name: 'metricData')
  final List<MetricDatapoint> metricData;

  /// The name of the metric returned.
  @_s.JsonKey(name: 'metricName')
  final RelationalDatabaseMetricName metricName;

  GetRelationalDatabaseMetricDataResult({
    this.metricData,
    this.metricName,
  });
  factory GetRelationalDatabaseMetricDataResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetRelationalDatabaseMetricDataResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRelationalDatabaseParametersResult {
  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetRelationalDatabaseParameters</code> request and specify the next
  /// page token using the <code>pageToken</code> parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  /// An object describing the result of your get relational database parameters
  /// request.
  @_s.JsonKey(name: 'parameters')
  final List<RelationalDatabaseParameter> parameters;

  GetRelationalDatabaseParametersResult({
    this.nextPageToken,
    this.parameters,
  });
  factory GetRelationalDatabaseParametersResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetRelationalDatabaseParametersResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRelationalDatabaseResult {
  /// An object describing the specified database.
  @_s.JsonKey(name: 'relationalDatabase')
  final RelationalDatabase relationalDatabase;

  GetRelationalDatabaseResult({
    this.relationalDatabase,
  });
  factory GetRelationalDatabaseResult.fromJson(Map<String, dynamic> json) =>
      _$GetRelationalDatabaseResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRelationalDatabaseSnapshotResult {
  /// An object describing the specified database snapshot.
  @_s.JsonKey(name: 'relationalDatabaseSnapshot')
  final RelationalDatabaseSnapshot relationalDatabaseSnapshot;

  GetRelationalDatabaseSnapshotResult({
    this.relationalDatabaseSnapshot,
  });
  factory GetRelationalDatabaseSnapshotResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetRelationalDatabaseSnapshotResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRelationalDatabaseSnapshotsResult {
  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetRelationalDatabaseSnapshots</code> request and specify the next
  /// page token using the <code>pageToken</code> parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  /// An object describing the result of your get relational database snapshots
  /// request.
  @_s.JsonKey(name: 'relationalDatabaseSnapshots')
  final List<RelationalDatabaseSnapshot> relationalDatabaseSnapshots;

  GetRelationalDatabaseSnapshotsResult({
    this.nextPageToken,
    this.relationalDatabaseSnapshots,
  });
  factory GetRelationalDatabaseSnapshotsResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetRelationalDatabaseSnapshotsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRelationalDatabasesResult {
  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another
  /// <code>GetRelationalDatabases</code> request and specify the next page token
  /// using the <code>pageToken</code> parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  /// An object describing the result of your get relational databases request.
  @_s.JsonKey(name: 'relationalDatabases')
  final List<RelationalDatabase> relationalDatabases;

  GetRelationalDatabasesResult({
    this.nextPageToken,
    this.relationalDatabases,
  });
  factory GetRelationalDatabasesResult.fromJson(Map<String, dynamic> json) =>
      _$GetRelationalDatabasesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetStaticIpResult {
  /// An array of key-value pairs containing information about the requested
  /// static IP.
  @_s.JsonKey(name: 'staticIp')
  final StaticIp staticIp;

  GetStaticIpResult({
    this.staticIp,
  });
  factory GetStaticIpResult.fromJson(Map<String, dynamic> json) =>
      _$GetStaticIpResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetStaticIpsResult {
  /// The token to advance to the next page of results from your request.
  ///
  /// A next page token is not returned if there are no more results to display.
  ///
  /// To get the next page of results, perform another <code>GetStaticIps</code>
  /// request and specify the next page token using the <code>pageToken</code>
  /// parameter.
  @_s.JsonKey(name: 'nextPageToken')
  final String nextPageToken;

  /// An array of key-value pairs containing information about your get static IPs
  /// request.
  @_s.JsonKey(name: 'staticIps')
  final List<StaticIp> staticIps;

  GetStaticIpsResult({
    this.nextPageToken,
    this.staticIps,
  });
  factory GetStaticIpsResult.fromJson(Map<String, dynamic> json) =>
      _$GetStaticIpsResultFromJson(json);
}

enum HeaderEnum {
  @_s.JsonValue('Accept')
  accept,
  @_s.JsonValue('Accept-Charset')
  acceptCharset,
  @_s.JsonValue('Accept-Datetime')
  acceptDatetime,
  @_s.JsonValue('Accept-Encoding')
  acceptEncoding,
  @_s.JsonValue('Accept-Language')
  acceptLanguage,
  @_s.JsonValue('Authorization')
  authorization,
  @_s.JsonValue('CloudFront-Forwarded-Proto')
  cloudFrontForwardedProto,
  @_s.JsonValue('CloudFront-Is-Desktop-Viewer')
  cloudFrontIsDesktopViewer,
  @_s.JsonValue('CloudFront-Is-Mobile-Viewer')
  cloudFrontIsMobileViewer,
  @_s.JsonValue('CloudFront-Is-SmartTV-Viewer')
  cloudFrontIsSmartTVViewer,
  @_s.JsonValue('CloudFront-Is-Tablet-Viewer')
  cloudFrontIsTabletViewer,
  @_s.JsonValue('CloudFront-Viewer-Country')
  cloudFrontViewerCountry,
  @_s.JsonValue('Host')
  host,
  @_s.JsonValue('Origin')
  origin,
  @_s.JsonValue('Referer')
  referer,
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HeaderObject {
  /// The specific headers to forward to your distribution's origin.
  @_s.JsonKey(name: 'headersAllowList')
  final List<HeaderEnum> headersAllowList;

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
  @_s.JsonKey(name: 'option')
  final ForwardValues option;

  HeaderObject({
    this.headersAllowList,
    this.option,
  });
  factory HeaderObject.fromJson(Map<String, dynamic> json) =>
      _$HeaderObjectFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderObjectToJson(this);
}

/// Describes the public SSH host keys or the RDP certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HostKeyAttributes {
  /// The SSH host key algorithm or the RDP certificate format.
  ///
  /// For SSH host keys, the algorithm may be <code>ssh-rsa</code>,
  /// <code>ecdsa-sha2-nistp256</code>, <code>ssh-ed25519</code>, etc. For RDP
  /// certificates, the algorithm is always <code>x509-cert</code>.
  @_s.JsonKey(name: 'algorithm')
  final String algorithm;

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
  @_s.JsonKey(name: 'fingerprintSHA1')
  final String fingerprintSHA1;

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
  @_s.JsonKey(name: 'fingerprintSHA256')
  final String fingerprintSHA256;

  /// The returned RDP certificate is not valid after this point in time.
  ///
  /// This value is listed only for RDP certificates.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'notValidAfter')
  final DateTime notValidAfter;

  /// The returned RDP certificate is valid after this point in time.
  ///
  /// This value is listed only for RDP certificates.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'notValidBefore')
  final DateTime notValidBefore;

  /// The public SSH host key or the RDP certificate.
  @_s.JsonKey(name: 'publicKey')
  final String publicKey;

  /// The time that the SSH host key or RDP certificate was recorded by Lightsail.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'witnessedAt')
  final DateTime witnessedAt;

  HostKeyAttributes({
    this.algorithm,
    this.fingerprintSHA1,
    this.fingerprintSHA256,
    this.notValidAfter,
    this.notValidBefore,
    this.publicKey,
    this.witnessedAt,
  });
  factory HostKeyAttributes.fromJson(Map<String, dynamic> json) =>
      _$HostKeyAttributesFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportKeyPairResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operation')
  final Operation operation;

  ImportKeyPairResult({
    this.operation,
  });
  factory ImportKeyPairResult.fromJson(Map<String, dynamic> json) =>
      _$ImportKeyPairResultFromJson(json);
}

/// Describes the origin resource of an Amazon Lightsail content delivery
/// network (CDN) distribution.
///
/// An origin can be a Lightsail instance or load balancer. A distribution pulls
/// content from an origin, caches it, and serves it to viewers via a worldwide
/// network of edge servers.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputOrigin {
  /// The name of the origin resource.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The protocol that your Amazon Lightsail distribution uses when establishing
  /// a connection with your origin to pull content.
  @_s.JsonKey(name: 'protocolPolicy')
  final OriginProtocolPolicyEnum protocolPolicy;

  /// The AWS Region name of the origin resource.
  @_s.JsonKey(name: 'regionName')
  final RegionName regionName;

  InputOrigin({
    this.name,
    this.protocolPolicy,
    this.regionName,
  });
  Map<String, dynamic> toJson() => _$InputOriginToJson(this);
}

/// Describes an instance (a virtual private server).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Instance {
  /// An array of objects representing the add-ons enabled on the instance.
  @_s.JsonKey(name: 'addOns')
  final List<AddOn> addOns;

  /// The Amazon Resource Name (ARN) of the instance (e.g.,
  /// <code>arn:aws:lightsail:us-east-2:123456789101:Instance/244ad76f-8aad-4741-809f-12345EXAMPLE</code>).
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The blueprint ID (e.g., <code>os_amlinux_2016_03</code>).
  @_s.JsonKey(name: 'blueprintId')
  final String blueprintId;

  /// The friendly name of the blueprint (e.g., <code>Amazon Linux</code>).
  @_s.JsonKey(name: 'blueprintName')
  final String blueprintName;

  /// The bundle for the instance (e.g., <code>micro_1_0</code>).
  @_s.JsonKey(name: 'bundleId')
  final String bundleId;

  /// The timestamp when the instance was created (e.g.,
  /// <code>1479734909.17</code>) in Unix time format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The size of the vCPU and the amount of RAM for the instance.
  @_s.JsonKey(name: 'hardware')
  final InstanceHardware hardware;

  /// The IPv6 address of the instance.
  @_s.JsonKey(name: 'ipv6Address')
  final String ipv6Address;

  /// A Boolean value indicating whether this instance has a static IP assigned to
  /// it.
  @_s.JsonKey(name: 'isStaticIp')
  final bool isStaticIp;

  /// The region name and Availability Zone where the instance is located.
  @_s.JsonKey(name: 'location')
  final ResourceLocation location;

  /// The name the user gave the instance (e.g.,
  /// <code>Amazon_Linux-1GB-Ohio-1</code>).
  @_s.JsonKey(name: 'name')
  final String name;

  /// Information about the public ports and monthly data transfer rates for the
  /// instance.
  @_s.JsonKey(name: 'networking')
  final InstanceNetworking networking;

  /// The private IP address of the instance.
  @_s.JsonKey(name: 'privateIpAddress')
  final String privateIpAddress;

  /// The public IP address of the instance.
  @_s.JsonKey(name: 'publicIpAddress')
  final String publicIpAddress;

  /// The type of resource (usually <code>Instance</code>).
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// The name of the SSH key being used to connect to the instance (e.g.,
  /// <code>LightsailDefaultKeyPair</code>).
  @_s.JsonKey(name: 'sshKeyName')
  final String sshKeyName;

  /// The status code and the state (e.g., <code>running</code>) for the instance.
  @_s.JsonKey(name: 'state')
  final InstanceState state;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more easily.
  @_s.JsonKey(name: 'supportCode')
  final String supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
  /// Dev Guide</a>.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  /// The user name for connecting to the instance (e.g., <code>ec2-user</code>).
  @_s.JsonKey(name: 'username')
  final String username;

  Instance({
    this.addOns,
    this.arn,
    this.blueprintId,
    this.blueprintName,
    this.bundleId,
    this.createdAt,
    this.hardware,
    this.ipv6Address,
    this.isStaticIp,
    this.location,
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
  factory Instance.fromJson(Map<String, dynamic> json) =>
      _$InstanceFromJson(json);
}

/// The parameters for gaining temporary access to one of your Amazon Lightsail
/// instances.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceAccessDetails {
  /// For SSH access, the public key to use when accessing your instance For
  /// OpenSSH clients (e.g., command line SSH), you should save this value to
  /// <code>tempkey-cert.pub</code>.
  @_s.JsonKey(name: 'certKey')
  final String certKey;

  /// For SSH access, the date on which the temporary keys expire.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'expiresAt')
  final DateTime expiresAt;

  /// Describes the public SSH host keys or the RDP certificate.
  @_s.JsonKey(name: 'hostKeys')
  final List<HostKeyAttributes> hostKeys;

  /// The name of this Amazon Lightsail instance.
  @_s.JsonKey(name: 'instanceName')
  final String instanceName;

  /// The public IP address of the Amazon Lightsail instance.
  @_s.JsonKey(name: 'ipAddress')
  final String ipAddress;

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
  @_s.JsonKey(name: 'password')
  final String password;

  /// For a Windows Server-based instance, an object with the data you can use to
  /// retrieve your password. This is only needed if <code>password</code> is
  /// empty and the instance is not new (and therefore the password is not ready
  /// yet). When you create an instance, it can take up to 15 minutes for the
  /// instance to be ready.
  @_s.JsonKey(name: 'passwordData')
  final PasswordData passwordData;

  /// For SSH access, the temporary private key. For OpenSSH clients (e.g.,
  /// command line SSH), you should save this value to <code>tempkey</code>).
  @_s.JsonKey(name: 'privateKey')
  final String privateKey;

  /// The protocol for these Amazon Lightsail instance access details.
  @_s.JsonKey(name: 'protocol')
  final InstanceAccessProtocol protocol;

  /// The user name to use when logging in to the Amazon Lightsail instance.
  @_s.JsonKey(name: 'username')
  final String username;

  InstanceAccessDetails({
    this.certKey,
    this.expiresAt,
    this.hostKeys,
    this.instanceName,
    this.ipAddress,
    this.password,
    this.passwordData,
    this.privateKey,
    this.protocol,
    this.username,
  });
  factory InstanceAccessDetails.fromJson(Map<String, dynamic> json) =>
      _$InstanceAccessDetailsFromJson(json);
}

enum InstanceAccessProtocol {
  @_s.JsonValue('ssh')
  ssh,
  @_s.JsonValue('rdp')
  rdp,
}

extension on InstanceAccessProtocol {
  String toValue() {
    switch (this) {
      case InstanceAccessProtocol.ssh:
        return 'ssh';
      case InstanceAccessProtocol.rdp:
        return 'rdp';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the Amazon Elastic Compute Cloud instance and related resources to
/// be created using the <code>create cloud formation stack</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InstanceEntry {
  /// The Availability Zone for the new Amazon EC2 instance.
  @_s.JsonKey(name: 'availabilityZone')
  final String availabilityZone;

  /// The instance type (e.g., <code>t2.micro</code>) to use for the new Amazon
  /// EC2 instance.
  @_s.JsonKey(name: 'instanceType')
  final String instanceType;

  /// The port configuration to use for the new Amazon EC2 instance.
  ///
  /// The following configuration options are available:
  ///
  /// <ul>
  /// <li>
  /// <code>DEFAULT</code> - Use the default firewall settings from the Lightsail
  /// instance blueprint.
  /// </li>
  /// <li>
  /// <code>INSTANCE</code> - Use the configured firewall settings from the source
  /// Lightsail instance.
  /// </li>
  /// <li>
  /// <code>NONE</code> - Use the default Amazon EC2 security group.
  /// </li>
  /// <li>
  /// <code>CLOSED</code> - All ports closed.
  /// </li>
  /// </ul> <note>
  /// If you configured <code>lightsail-connect</code> as a
  /// <code>cidrListAliases</code> on your instance, or if you chose to allow the
  /// Lightsail browser-based SSH or RDP clients to connect to your instance, that
  /// configuration is not carried over to your new Amazon EC2 instance.
  /// </note>
  @_s.JsonKey(name: 'portInfoSource')
  final PortInfoSourceType portInfoSource;

  /// The name of the export snapshot record, which contains the exported
  /// Lightsail instance snapshot that will be used as the source of the new
  /// Amazon EC2 instance.
  ///
  /// Use the <code>get export snapshot records</code> operation to get a list of
  /// export snapshot records that you can use to create a CloudFormation stack.
  @_s.JsonKey(name: 'sourceName')
  final String sourceName;

  /// A launch script you can create that configures a server with additional user
  /// data. For example, you might want to run <code>apt-get -y update</code>.
  /// <note>
  /// Depending on the machine image you choose, the command to get software on
  /// your instance varies. Amazon Linux and CentOS use <code>yum</code>, Debian
  /// and Ubuntu use <code>apt-get</code>, and FreeBSD uses <code>pkg</code>.
  /// </note>
  @_s.JsonKey(name: 'userData')
  final String userData;

  InstanceEntry({
    @_s.required this.availabilityZone,
    @_s.required this.instanceType,
    @_s.required this.portInfoSource,
    @_s.required this.sourceName,
    this.userData,
  });
  Map<String, dynamic> toJson() => _$InstanceEntryToJson(this);
}

/// Describes the hardware for the instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceHardware {
  /// The number of vCPUs the instance has.
  @_s.JsonKey(name: 'cpuCount')
  final int cpuCount;

  /// The disks attached to the instance.
  @_s.JsonKey(name: 'disks')
  final List<Disk> disks;

  /// The amount of RAM in GB on the instance (e.g., <code>1.0</code>).
  @_s.JsonKey(name: 'ramSizeInGb')
  final double ramSizeInGb;

  InstanceHardware({
    this.cpuCount,
    this.disks,
    this.ramSizeInGb,
  });
  factory InstanceHardware.fromJson(Map<String, dynamic> json) =>
      _$InstanceHardwareFromJson(json);
}

enum InstanceHealthReason {
  @_s.JsonValue('Lb.RegistrationInProgress')
  lbRegistrationInProgress,
  @_s.JsonValue('Lb.InitialHealthChecking')
  lbInitialHealthChecking,
  @_s.JsonValue('Lb.InternalError')
  lbInternalError,
  @_s.JsonValue('Instance.ResponseCodeMismatch')
  instanceResponseCodeMismatch,
  @_s.JsonValue('Instance.Timeout')
  instanceTimeout,
  @_s.JsonValue('Instance.FailedHealthChecks')
  instanceFailedHealthChecks,
  @_s.JsonValue('Instance.NotRegistered')
  instanceNotRegistered,
  @_s.JsonValue('Instance.NotInUse')
  instanceNotInUse,
  @_s.JsonValue('Instance.DeregistrationInProgress')
  instanceDeregistrationInProgress,
  @_s.JsonValue('Instance.InvalidState')
  instanceInvalidState,
  @_s.JsonValue('Instance.IpUnusable')
  instanceIpUnusable,
}

enum InstanceHealthState {
  @_s.JsonValue('initial')
  initial,
  @_s.JsonValue('healthy')
  healthy,
  @_s.JsonValue('unhealthy')
  unhealthy,
  @_s.JsonValue('unused')
  unused,
  @_s.JsonValue('draining')
  draining,
  @_s.JsonValue('unavailable')
  unavailable,
}

/// Describes information about the health of the instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceHealthSummary {
  /// Describes the overall instance health. Valid values are below.
  @_s.JsonKey(name: 'instanceHealth')
  final InstanceHealthState instanceHealth;

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
  @_s.JsonKey(name: 'instanceHealthReason')
  final InstanceHealthReason instanceHealthReason;

  /// The name of the Lightsail instance for which you are requesting health check
  /// data.
  @_s.JsonKey(name: 'instanceName')
  final String instanceName;

  InstanceHealthSummary({
    this.instanceHealth,
    this.instanceHealthReason,
    this.instanceName,
  });
  factory InstanceHealthSummary.fromJson(Map<String, dynamic> json) =>
      _$InstanceHealthSummaryFromJson(json);
}

enum InstanceMetricName {
  @_s.JsonValue('CPUUtilization')
  cPUUtilization,
  @_s.JsonValue('NetworkIn')
  networkIn,
  @_s.JsonValue('NetworkOut')
  networkOut,
  @_s.JsonValue('StatusCheckFailed')
  statusCheckFailed,
  @_s.JsonValue('StatusCheckFailed_Instance')
  statusCheckFailedInstance,
  @_s.JsonValue('StatusCheckFailed_System')
  statusCheckFailedSystem,
  @_s.JsonValue('BurstCapacityTime')
  burstCapacityTime,
  @_s.JsonValue('BurstCapacityPercentage')
  burstCapacityPercentage,
}

extension on InstanceMetricName {
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
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes monthly data transfer rates and port information for an instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceNetworking {
  /// The amount of data in GB allocated for monthly data transfers.
  @_s.JsonKey(name: 'monthlyTransfer')
  final MonthlyTransfer monthlyTransfer;

  /// An array of key-value pairs containing information about the ports on the
  /// instance.
  @_s.JsonKey(name: 'ports')
  final List<InstancePortInfo> ports;

  InstanceNetworking({
    this.monthlyTransfer,
    this.ports,
  });
  factory InstanceNetworking.fromJson(Map<String, dynamic> json) =>
      _$InstanceNetworkingFromJson(json);
}

enum InstancePlatform {
  @_s.JsonValue('LINUX_UNIX')
  linuxUnix,
  @_s.JsonValue('WINDOWS')
  windows,
}

/// Describes information about ports for an Amazon Lightsail instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstancePortInfo {
  /// The access direction (<code>inbound</code> or <code>outbound</code>).
  /// <note>
  /// Lightsail currently supports only <code>inbound</code> access direction.
  /// </note>
  @_s.JsonKey(name: 'accessDirection')
  final AccessDirection accessDirection;

  /// The location from which access is allowed. For example, <code>Anywhere
  /// (0.0.0.0/0)</code>, or <code>Custom</code> if a specific IP address or range
  /// of IP addresses is allowed.
  @_s.JsonKey(name: 'accessFrom')
  final String accessFrom;

  /// The type of access (<code>Public</code> or <code>Private</code>).
  @_s.JsonKey(name: 'accessType')
  final PortAccessType accessType;

  /// An alias that defines access for a preconfigured range of IP addresses.
  ///
  /// The only alias currently supported is <code>lightsail-connect</code>, which
  /// allows IP addresses of the browser-based RDP/SSH client in the Lightsail
  /// console to connect to your instance.
  @_s.JsonKey(name: 'cidrListAliases')
  final List<String> cidrListAliases;

  /// The IP address, or range of IP addresses in CIDR notation, that are allowed
  /// to connect to an instance through the ports, and the protocol. Lightsail
  /// supports IPv4 addresses.
  ///
  /// For more information about CIDR block notation, see <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation">Classless
  /// Inter-Domain Routing</a> on <i>Wikipedia</i>.
  @_s.JsonKey(name: 'cidrs')
  final List<String> cidrs;

  /// The common name of the port information.
  @_s.JsonKey(name: 'commonName')
  final String commonName;

  /// The first port in a range of open ports on an instance.
  ///
  /// Allowed ports:
  ///
  /// <ul>
  /// <li>
  /// TCP and UDP - <code>0</code> to <code>65535</code>
  /// </li>
  /// <li>
  /// ICMP - The ICMP type. For example, specify <code>8</code> as the
  /// <code>fromPort</code> (ICMP type), and <code>-1</code> as the
  /// <code>toPort</code> (ICMP code), to enable ICMP Ping. For more information,
  /// see <a
  /// href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control
  /// Messages</a> on <i>Wikipedia</i>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'fromPort')
  final int fromPort;

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
  /// </ul>
  @_s.JsonKey(name: 'protocol')
  final NetworkProtocol protocol;

  /// The last port in a range of open ports on an instance.
  ///
  /// Allowed ports:
  ///
  /// <ul>
  /// <li>
  /// TCP and UDP - <code>0</code> to <code>65535</code>
  /// </li>
  /// <li>
  /// ICMP - The ICMP code. For example, specify <code>8</code> as the
  /// <code>fromPort</code> (ICMP type), and <code>-1</code> as the
  /// <code>toPort</code> (ICMP code), to enable ICMP Ping. For more information,
  /// see <a
  /// href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control
  /// Messages</a> on <i>Wikipedia</i>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'toPort')
  final int toPort;

  InstancePortInfo({
    this.accessDirection,
    this.accessFrom,
    this.accessType,
    this.cidrListAliases,
    this.cidrs,
    this.commonName,
    this.fromPort,
    this.protocol,
    this.toPort,
  });
  factory InstancePortInfo.fromJson(Map<String, dynamic> json) =>
      _$InstancePortInfoFromJson(json);
}

/// Describes open ports on an instance, the IP addresses allowed to connect to
/// the instance through the ports, and the protocol.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstancePortState {
  /// An alias that defines access for a preconfigured range of IP addresses.
  ///
  /// The only alias currently supported is <code>lightsail-connect</code>, which
  /// allows IP addresses of the browser-based RDP/SSH client in the Lightsail
  /// console to connect to your instance.
  @_s.JsonKey(name: 'cidrListAliases')
  final List<String> cidrListAliases;

  /// The IP address, or range of IP addresses in CIDR notation, that are allowed
  /// to connect to an instance through the ports, and the protocol. Lightsail
  /// supports IPv4 addresses.
  ///
  /// For more information about CIDR block notation, see <a
  /// href="https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation">Classless
  /// Inter-Domain Routing</a> on <i>Wikipedia</i>.
  @_s.JsonKey(name: 'cidrs')
  final List<String> cidrs;

  /// The first port in a range of open ports on an instance.
  ///
  /// Allowed ports:
  ///
  /// <ul>
  /// <li>
  /// TCP and UDP - <code>0</code> to <code>65535</code>
  /// </li>
  /// <li>
  /// ICMP - The ICMP type. For example, specify <code>8</code> as the
  /// <code>fromPort</code> (ICMP type), and <code>-1</code> as the
  /// <code>toPort</code> (ICMP code), to enable ICMP Ping. For more information,
  /// see <a
  /// href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control
  /// Messages</a> on <i>Wikipedia</i>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'fromPort')
  final int fromPort;

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
  /// </ul>
  @_s.JsonKey(name: 'protocol')
  final NetworkProtocol protocol;

  /// Specifies whether the instance port is <code>open</code> or
  /// <code>closed</code>.
  /// <note>
  /// The port state for Lightsail instances is always <code>open</code>.
  /// </note>
  @_s.JsonKey(name: 'state')
  final PortState state;

  /// The last port in a range of open ports on an instance.
  ///
  /// Allowed ports:
  ///
  /// <ul>
  /// <li>
  /// TCP and UDP - <code>0</code> to <code>65535</code>
  /// </li>
  /// <li>
  /// ICMP - The ICMP code. For example, specify <code>8</code> as the
  /// <code>fromPort</code> (ICMP type), and <code>-1</code> as the
  /// <code>toPort</code> (ICMP code), to enable ICMP Ping. For more information,
  /// see <a
  /// href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control
  /// Messages</a> on <i>Wikipedia</i>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'toPort')
  final int toPort;

  InstancePortState({
    this.cidrListAliases,
    this.cidrs,
    this.fromPort,
    this.protocol,
    this.state,
    this.toPort,
  });
  factory InstancePortState.fromJson(Map<String, dynamic> json) =>
      _$InstancePortStateFromJson(json);
}

/// Describes an instance snapshot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceSnapshot {
  /// The Amazon Resource Name (ARN) of the snapshot (e.g.,
  /// <code>arn:aws:lightsail:us-east-2:123456789101:InstanceSnapshot/d23b5706-3322-4d83-81e5-12345EXAMPLE</code>).
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The timestamp when the snapshot was created (e.g.,
  /// <code>1479907467.024</code>).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// An array of disk objects containing information about all block storage
  /// disks.
  @_s.JsonKey(name: 'fromAttachedDisks')
  final List<Disk> fromAttachedDisks;

  /// The blueprint ID from which you created the snapshot (e.g.,
  /// <code>os_debian_8_3</code>). A blueprint is a virtual private server (or
  /// <i>instance</i>) image used to create instances quickly.
  @_s.JsonKey(name: 'fromBlueprintId')
  final String fromBlueprintId;

  /// The bundle ID from which you created the snapshot (e.g.,
  /// <code>micro_1_0</code>).
  @_s.JsonKey(name: 'fromBundleId')
  final String fromBundleId;

  /// The Amazon Resource Name (ARN) of the instance from which the snapshot was
  /// created (e.g.,
  /// <code>arn:aws:lightsail:us-east-2:123456789101:Instance/64b8404c-ccb1-430b-8daf-12345EXAMPLE</code>).
  @_s.JsonKey(name: 'fromInstanceArn')
  final String fromInstanceArn;

  /// The instance from which the snapshot was created.
  @_s.JsonKey(name: 'fromInstanceName')
  final String fromInstanceName;

  /// A Boolean value indicating whether the snapshot was created from an
  /// automatic snapshot.
  @_s.JsonKey(name: 'isFromAutoSnapshot')
  final bool isFromAutoSnapshot;

  /// The region name and Availability Zone where you created the snapshot.
  @_s.JsonKey(name: 'location')
  final ResourceLocation location;

  /// The name of the snapshot.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The progress of the snapshot.
  @_s.JsonKey(name: 'progress')
  final String progress;

  /// The type of resource (usually <code>InstanceSnapshot</code>).
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// The size in GB of the SSD.
  @_s.JsonKey(name: 'sizeInGb')
  final int sizeInGb;

  /// The state the snapshot is in.
  @_s.JsonKey(name: 'state')
  final InstanceSnapshotState state;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more easily.
  @_s.JsonKey(name: 'supportCode')
  final String supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
  /// Dev Guide</a>.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

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
  factory InstanceSnapshot.fromJson(Map<String, dynamic> json) =>
      _$InstanceSnapshotFromJson(json);
}

/// Describes an instance snapshot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceSnapshotInfo {
  /// The blueprint ID from which the source instance (e.g.,
  /// <code>os_debian_8_3</code>).
  @_s.JsonKey(name: 'fromBlueprintId')
  final String fromBlueprintId;

  /// The bundle ID from which the source instance was created (e.g.,
  /// <code>micro_1_0</code>).
  @_s.JsonKey(name: 'fromBundleId')
  final String fromBundleId;

  /// A list of objects describing the disks that were attached to the source
  /// instance.
  @_s.JsonKey(name: 'fromDiskInfo')
  final List<DiskInfo> fromDiskInfo;

  InstanceSnapshotInfo({
    this.fromBlueprintId,
    this.fromBundleId,
    this.fromDiskInfo,
  });
  factory InstanceSnapshotInfo.fromJson(Map<String, dynamic> json) =>
      _$InstanceSnapshotInfoFromJson(json);
}

enum InstanceSnapshotState {
  @_s.JsonValue('pending')
  pending,
  @_s.JsonValue('error')
  error,
  @_s.JsonValue('available')
  available,
}

/// Describes the virtual private server (or <i>instance</i>) status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceState {
  /// The status code for the instance.
  @_s.JsonKey(name: 'code')
  final int code;

  /// The state of the instance (e.g., <code>running</code> or
  /// <code>pending</code>).
  @_s.JsonKey(name: 'name')
  final String name;

  InstanceState({
    this.code,
    this.name,
  });
  factory InstanceState.fromJson(Map<String, dynamic> json) =>
      _$InstanceStateFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IsVpcPeeredResult {
  /// Returns <code>true</code> if the Lightsail VPC is peered; otherwise,
  /// <code>false</code>.
  @_s.JsonKey(name: 'isPeered')
  final bool isPeered;

  IsVpcPeeredResult({
    this.isPeered,
  });
  factory IsVpcPeeredResult.fromJson(Map<String, dynamic> json) =>
      _$IsVpcPeeredResultFromJson(json);
}

/// Describes the SSH key pair.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class KeyPair {
  /// The Amazon Resource Name (ARN) of the key pair (e.g.,
  /// <code>arn:aws:lightsail:us-east-2:123456789101:KeyPair/05859e3d-331d-48ba-9034-12345EXAMPLE</code>).
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The timestamp when the key pair was created (e.g.,
  /// <code>1479816991.349</code>).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The RSA fingerprint of the key pair.
  @_s.JsonKey(name: 'fingerprint')
  final String fingerprint;

  /// The region name and Availability Zone where the key pair was created.
  @_s.JsonKey(name: 'location')
  final ResourceLocation location;

  /// The friendly name of the SSH key pair.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The resource type (usually <code>KeyPair</code>).
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more easily.
  @_s.JsonKey(name: 'supportCode')
  final String supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
  /// Dev Guide</a>.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

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
  factory KeyPair.fromJson(Map<String, dynamic> json) =>
      _$KeyPairFromJson(json);
}

/// Describes an Amazon Lightsail content delivery network (CDN) distribution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LightsailDistribution {
  /// Indicates whether the bundle that is currently applied to your distribution,
  /// specified using the <code>distributionName</code> parameter, can be changed
  /// to another bundle.
  ///
  /// Use the <code>UpdateDistributionBundle</code> action to change your
  /// distribution's bundle.
  @_s.JsonKey(name: 'ableToUpdateBundle')
  final bool ableToUpdateBundle;

  /// The alternate domain names of the distribution.
  @_s.JsonKey(name: 'alternativeDomainNames')
  final List<String> alternativeDomainNames;

  /// The Amazon Resource Name (ARN) of the distribution.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The ID of the bundle currently applied to the distribution.
  @_s.JsonKey(name: 'bundleId')
  final String bundleId;

  /// An object that describes the cache behavior settings of the distribution.
  @_s.JsonKey(name: 'cacheBehaviorSettings')
  final CacheSettings cacheBehaviorSettings;

  /// An array of objects that describe the per-path cache behavior of the
  /// distribution.
  @_s.JsonKey(name: 'cacheBehaviors')
  final List<CacheBehaviorPerPath> cacheBehaviors;

  /// The name of the SSL/TLS certificate attached to the distribution, if any.
  @_s.JsonKey(name: 'certificateName')
  final String certificateName;

  /// The timestamp when the distribution was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// An object that describes the default cache behavior of the distribution.
  @_s.JsonKey(name: 'defaultCacheBehavior')
  final CacheBehavior defaultCacheBehavior;

  /// The domain name of the distribution.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// Indicates whether the distribution is enabled.
  @_s.JsonKey(name: 'isEnabled')
  final bool isEnabled;

  /// An object that describes the location of the distribution, such as the AWS
  /// Region and Availability Zone.
  /// <note>
  /// Lightsail distributions are global resources that can reference an origin in
  /// any AWS Region, and distribute its content globally. However, all
  /// distributions are located in the <code>us-east-1</code> Region.
  /// </note>
  @_s.JsonKey(name: 'location')
  final ResourceLocation location;

  /// The name of the distribution.
  @_s.JsonKey(name: 'name')
  final String name;

  /// An object that describes the origin resource of the distribution, such as a
  /// Lightsail instance or load balancer.
  ///
  /// The distribution pulls, caches, and serves content from the origin.
  @_s.JsonKey(name: 'origin')
  final Origin origin;

  /// The public DNS of the origin.
  @_s.JsonKey(name: 'originPublicDNS')
  final String originPublicDNS;

  /// The Lightsail resource type (e.g., <code>Distribution</code>).
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// The status of the distribution.
  @_s.JsonKey(name: 'status')
  final String status;

  /// The support code. Include this code in your email to support when you have
  /// questions about your Lightsail distribution. This code enables our support
  /// team to look up your Lightsail information more easily.
  @_s.JsonKey(name: 'supportCode')
  final String supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
  /// Dev Guide</a>.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

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
    this.isEnabled,
    this.location,
    this.name,
    this.origin,
    this.originPublicDNS,
    this.resourceType,
    this.status,
    this.supportCode,
    this.tags,
  });
  factory LightsailDistribution.fromJson(Map<String, dynamic> json) =>
      _$LightsailDistributionFromJson(json);
}

/// Describes the Lightsail load balancer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LoadBalancer {
  /// The Amazon Resource Name (ARN) of the load balancer.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A string to string map of the configuration options for your load balancer.
  /// Valid values are listed below.
  @_s.JsonKey(name: 'configurationOptions')
  final Map<LoadBalancerAttributeName, String> configurationOptions;

  /// The date when your load balancer was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The DNS name of your Lightsail load balancer.
  @_s.JsonKey(name: 'dnsName')
  final String dnsName;

  /// The path you specified to perform your health checks. If no path is
  /// specified, the load balancer tries to make a request to the default (root)
  /// page.
  @_s.JsonKey(name: 'healthCheckPath')
  final String healthCheckPath;

  /// An array of InstanceHealthSummary objects describing the health of the load
  /// balancer.
  @_s.JsonKey(name: 'instanceHealthSummary')
  final List<InstanceHealthSummary> instanceHealthSummary;

  /// The port where the load balancer will direct traffic to your Lightsail
  /// instances. For HTTP traffic, it's port 80. For HTTPS traffic, it's port 443.
  @_s.JsonKey(name: 'instancePort')
  final int instancePort;

  /// The AWS Region where your load balancer was created (e.g.,
  /// <code>us-east-2a</code>). Lightsail automatically creates your load balancer
  /// across Availability Zones.
  @_s.JsonKey(name: 'location')
  final ResourceLocation location;

  /// The name of the load balancer (e.g., <code>my-load-balancer</code>).
  @_s.JsonKey(name: 'name')
  final String name;

  /// The protocol you have enabled for your load balancer. Valid values are
  /// below.
  ///
  /// You can't just have <code>HTTP_HTTPS</code>, but you can have just
  /// <code>HTTP</code>.
  @_s.JsonKey(name: 'protocol')
  final LoadBalancerProtocol protocol;

  /// An array of public port settings for your load balancer. For HTTP, use port
  /// 80. For HTTPS, use port 443.
  @_s.JsonKey(name: 'publicPorts')
  final List<int> publicPorts;

  /// The resource type (e.g., <code>LoadBalancer</code>.
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// The status of your load balancer. Valid values are below.
  @_s.JsonKey(name: 'state')
  final LoadBalancerState state;

  /// The support code. Include this code in your email to support when you have
  /// questions about your Lightsail load balancer. This code enables our support
  /// team to look up your Lightsail information more easily.
  @_s.JsonKey(name: 'supportCode')
  final String supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
  /// Dev Guide</a>.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  /// An array of LoadBalancerTlsCertificateSummary objects that provide
  /// additional information about the SSL/TLS certificates. For example, if
  /// <code>true</code>, the certificate is attached to the load balancer.
  @_s.JsonKey(name: 'tlsCertificateSummaries')
  final List<LoadBalancerTlsCertificateSummary> tlsCertificateSummaries;

  LoadBalancer({
    this.arn,
    this.configurationOptions,
    this.createdAt,
    this.dnsName,
    this.healthCheckPath,
    this.instanceHealthSummary,
    this.instancePort,
    this.location,
    this.name,
    this.protocol,
    this.publicPorts,
    this.resourceType,
    this.state,
    this.supportCode,
    this.tags,
    this.tlsCertificateSummaries,
  });
  factory LoadBalancer.fromJson(Map<String, dynamic> json) =>
      _$LoadBalancerFromJson(json);
}

enum LoadBalancerAttributeName {
  @_s.JsonValue('HealthCheckPath')
  healthCheckPath,
  @_s.JsonValue('SessionStickinessEnabled')
  sessionStickinessEnabled,
  @_s.JsonValue('SessionStickiness_LB_CookieDurationSeconds')
  sessionStickinessLbCookieDurationSeconds,
}

extension on LoadBalancerAttributeName {
  String toValue() {
    switch (this) {
      case LoadBalancerAttributeName.healthCheckPath:
        return 'HealthCheckPath';
      case LoadBalancerAttributeName.sessionStickinessEnabled:
        return 'SessionStickinessEnabled';
      case LoadBalancerAttributeName.sessionStickinessLbCookieDurationSeconds:
        return 'SessionStickiness_LB_CookieDurationSeconds';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum LoadBalancerMetricName {
  @_s.JsonValue('ClientTLSNegotiationErrorCount')
  clientTLSNegotiationErrorCount,
  @_s.JsonValue('HealthyHostCount')
  healthyHostCount,
  @_s.JsonValue('UnhealthyHostCount')
  unhealthyHostCount,
  @_s.JsonValue('HTTPCode_LB_4XX_Count')
  hTTPCodeLb_4xxCount,
  @_s.JsonValue('HTTPCode_LB_5XX_Count')
  hTTPCodeLb_5xxCount,
  @_s.JsonValue('HTTPCode_Instance_2XX_Count')
  hTTPCodeInstance_2xxCount,
  @_s.JsonValue('HTTPCode_Instance_3XX_Count')
  hTTPCodeInstance_3xxCount,
  @_s.JsonValue('HTTPCode_Instance_4XX_Count')
  hTTPCodeInstance_4xxCount,
  @_s.JsonValue('HTTPCode_Instance_5XX_Count')
  hTTPCodeInstance_5xxCount,
  @_s.JsonValue('InstanceResponseTime')
  instanceResponseTime,
  @_s.JsonValue('RejectedConnectionCount')
  rejectedConnectionCount,
  @_s.JsonValue('RequestCount')
  requestCount,
}

extension on LoadBalancerMetricName {
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
    throw Exception('Unknown enum value: $this');
  }
}

enum LoadBalancerProtocol {
  @_s.JsonValue('HTTP_HTTPS')
  httpHttps,
  @_s.JsonValue('HTTP')
  http,
}

enum LoadBalancerState {
  @_s.JsonValue('active')
  active,
  @_s.JsonValue('provisioning')
  provisioning,
  @_s.JsonValue('active_impaired')
  activeImpaired,
  @_s.JsonValue('failed')
  failed,
  @_s.JsonValue('unknown')
  unknown,
}

/// Describes a load balancer SSL/TLS certificate.
///
/// TLS is just an updated, more secure version of Secure Socket Layer (SSL).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LoadBalancerTlsCertificate {
  /// The Amazon Resource Name (ARN) of the SSL/TLS certificate.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time when you created your SSL/TLS certificate.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The domain name for your SSL/TLS certificate.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// An array of LoadBalancerTlsCertificateDomainValidationRecord objects
  /// describing the records.
  @_s.JsonKey(name: 'domainValidationRecords')
  final List<LoadBalancerTlsCertificateDomainValidationRecord>
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
  /// href="https://www.google.com/webmasters/hacked/?hl=en">Google Help for
  /// Hacked Websites</a> to learn what you can do.
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
  @_s.JsonKey(name: 'failureReason')
  final LoadBalancerTlsCertificateFailureReason failureReason;

  /// When <code>true</code>, the SSL/TLS certificate is attached to the Lightsail
  /// load balancer.
  @_s.JsonKey(name: 'isAttached')
  final bool isAttached;

  /// The time when the SSL/TLS certificate was issued.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'issuedAt')
  final DateTime issuedAt;

  /// The issuer of the certificate.
  @_s.JsonKey(name: 'issuer')
  final String issuer;

  /// The algorithm used to generate the key pair (the public and private key).
  @_s.JsonKey(name: 'keyAlgorithm')
  final String keyAlgorithm;

  /// The load balancer name where your SSL/TLS certificate is attached.
  @_s.JsonKey(name: 'loadBalancerName')
  final String loadBalancerName;

  /// The AWS Region and Availability Zone where you created your certificate.
  @_s.JsonKey(name: 'location')
  final ResourceLocation location;

  /// The name of the SSL/TLS certificate (e.g., <code>my-certificate</code>).
  @_s.JsonKey(name: 'name')
  final String name;

  /// The timestamp when the SSL/TLS certificate expires.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'notAfter')
  final DateTime notAfter;

  /// The timestamp when the SSL/TLS certificate is first valid.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'notBefore')
  final DateTime notBefore;

  /// An object that describes the status of the certificate renewal managed by
  /// Lightsail.
  @_s.JsonKey(name: 'renewalSummary')
  final LoadBalancerTlsCertificateRenewalSummary renewalSummary;

  /// The resource type (e.g., <code>LoadBalancerTlsCertificate</code>).
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
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// The reason the certificate was revoked. This value is present only when the
  /// certificate status is <code>REVOKED</code>.
  @_s.JsonKey(name: 'revocationReason')
  final LoadBalancerTlsCertificateRevocationReason revocationReason;

  /// The timestamp when the certificate was revoked. This value is present only
  /// when the certificate status is <code>REVOKED</code>.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'revokedAt')
  final DateTime revokedAt;

  /// The serial number of the certificate.
  @_s.JsonKey(name: 'serial')
  final String serial;

  /// The algorithm that was used to sign the certificate.
  @_s.JsonKey(name: 'signatureAlgorithm')
  final String signatureAlgorithm;

  /// The validation status of the SSL/TLS certificate. Valid values are below.
  @_s.JsonKey(name: 'status')
  final LoadBalancerTlsCertificateStatus status;

  /// The name of the entity that is associated with the public key contained in
  /// the certificate.
  @_s.JsonKey(name: 'subject')
  final String subject;

  /// An array of strings that specify the alternate domains (e.g.,
  /// <code>example2.com</code>) and subdomains (e.g.,
  /// <code>blog.example.com</code>) for the certificate.
  @_s.JsonKey(name: 'subjectAlternativeNames')
  final List<String> subjectAlternativeNames;

  /// The support code. Include this code in your email to support when you have
  /// questions about your Lightsail load balancer or SSL/TLS certificate. This
  /// code enables our support team to look up your Lightsail information more
  /// easily.
  @_s.JsonKey(name: 'supportCode')
  final String supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
  /// Dev Guide</a>.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

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
  factory LoadBalancerTlsCertificate.fromJson(Map<String, dynamic> json) =>
      _$LoadBalancerTlsCertificateFromJson(json);
}

enum LoadBalancerTlsCertificateDomainStatus {
  @_s.JsonValue('PENDING_VALIDATION')
  pendingValidation,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('SUCCESS')
  success,
}

/// Contains information about the domain names on an SSL/TLS certificate that
/// you will use to validate domain ownership.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LoadBalancerTlsCertificateDomainValidationOption {
  /// The fully qualified domain name in the certificate request.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// The status of the domain validation. Valid values are listed below.
  @_s.JsonKey(name: 'validationStatus')
  final LoadBalancerTlsCertificateDomainStatus validationStatus;

  LoadBalancerTlsCertificateDomainValidationOption({
    this.domainName,
    this.validationStatus,
  });
  factory LoadBalancerTlsCertificateDomainValidationOption.fromJson(
          Map<String, dynamic> json) =>
      _$LoadBalancerTlsCertificateDomainValidationOptionFromJson(json);
}

/// Describes the validation record of each domain name in the SSL/TLS
/// certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LoadBalancerTlsCertificateDomainValidationRecord {
  /// The domain name against which your SSL/TLS certificate was validated.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// A fully qualified domain name in the certificate. For example,
  /// <code>example.com</code>.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The type of validation record. For example, <code>CNAME</code> for domain
  /// validation.
  @_s.JsonKey(name: 'type')
  final String type;

  /// The validation status. Valid values are listed below.
  @_s.JsonKey(name: 'validationStatus')
  final LoadBalancerTlsCertificateDomainStatus validationStatus;

  /// The value for that type.
  @_s.JsonKey(name: 'value')
  final String value;

  LoadBalancerTlsCertificateDomainValidationRecord({
    this.domainName,
    this.name,
    this.type,
    this.validationStatus,
    this.value,
  });
  factory LoadBalancerTlsCertificateDomainValidationRecord.fromJson(
          Map<String, dynamic> json) =>
      _$LoadBalancerTlsCertificateDomainValidationRecordFromJson(json);
}

enum LoadBalancerTlsCertificateFailureReason {
  @_s.JsonValue('NO_AVAILABLE_CONTACTS')
  noAvailableContacts,
  @_s.JsonValue('ADDITIONAL_VERIFICATION_REQUIRED')
  additionalVerificationRequired,
  @_s.JsonValue('DOMAIN_NOT_ALLOWED')
  domainNotAllowed,
  @_s.JsonValue('INVALID_PUBLIC_DOMAIN')
  invalidPublicDomain,
  @_s.JsonValue('OTHER')
  other,
}

enum LoadBalancerTlsCertificateRenewalStatus {
  @_s.JsonValue('PENDING_AUTO_RENEWAL')
  pendingAutoRenewal,
  @_s.JsonValue('PENDING_VALIDATION')
  pendingValidation,
  @_s.JsonValue('SUCCESS')
  success,
  @_s.JsonValue('FAILED')
  failed,
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LoadBalancerTlsCertificateRenewalSummary {
  /// Contains information about the validation of each domain name in the
  /// certificate, as it pertains to Lightsail's managed renewal. This is
  /// different from the initial validation that occurs as a result of the
  /// RequestCertificate request.
  @_s.JsonKey(name: 'domainValidationOptions')
  final List<LoadBalancerTlsCertificateDomainValidationOption>
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
  @_s.JsonKey(name: 'renewalStatus')
  final LoadBalancerTlsCertificateRenewalStatus renewalStatus;

  LoadBalancerTlsCertificateRenewalSummary({
    this.domainValidationOptions,
    this.renewalStatus,
  });
  factory LoadBalancerTlsCertificateRenewalSummary.fromJson(
          Map<String, dynamic> json) =>
      _$LoadBalancerTlsCertificateRenewalSummaryFromJson(json);
}

enum LoadBalancerTlsCertificateRevocationReason {
  @_s.JsonValue('UNSPECIFIED')
  unspecified,
  @_s.JsonValue('KEY_COMPROMISE')
  keyCompromise,
  @_s.JsonValue('CA_COMPROMISE')
  caCompromise,
  @_s.JsonValue('AFFILIATION_CHANGED')
  affiliationChanged,
  @_s.JsonValue('SUPERCEDED')
  superceded,
  @_s.JsonValue('CESSATION_OF_OPERATION')
  cessationOfOperation,
  @_s.JsonValue('CERTIFICATE_HOLD')
  certificateHold,
  @_s.JsonValue('REMOVE_FROM_CRL')
  removeFromCrl,
  @_s.JsonValue('PRIVILEGE_WITHDRAWN')
  privilegeWithdrawn,
  @_s.JsonValue('A_A_COMPROMISE')
  aACompromise,
}

enum LoadBalancerTlsCertificateStatus {
  @_s.JsonValue('PENDING_VALIDATION')
  pendingValidation,
  @_s.JsonValue('ISSUED')
  issued,
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('EXPIRED')
  expired,
  @_s.JsonValue('VALIDATION_TIMED_OUT')
  validationTimedOut,
  @_s.JsonValue('REVOKED')
  revoked,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('UNKNOWN')
  unknown,
}

/// Provides a summary of SSL/TLS certificate metadata.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LoadBalancerTlsCertificateSummary {
  /// When <code>true</code>, the SSL/TLS certificate is attached to the Lightsail
  /// load balancer.
  @_s.JsonKey(name: 'isAttached')
  final bool isAttached;

  /// The name of the SSL/TLS certificate.
  @_s.JsonKey(name: 'name')
  final String name;

  LoadBalancerTlsCertificateSummary({
    this.isAttached,
    this.name,
  });
  factory LoadBalancerTlsCertificateSummary.fromJson(
          Map<String, dynamic> json) =>
      _$LoadBalancerTlsCertificateSummaryFromJson(json);
}

/// Describes a database log event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LogEvent {
  /// The timestamp when the database log event was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The message of the database log event.
  @_s.JsonKey(name: 'message')
  final String message;

  LogEvent({
    this.createdAt,
    this.message,
  });
  factory LogEvent.fromJson(Map<String, dynamic> json) =>
      _$LogEventFromJson(json);
}

/// Describes the metric data point.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MetricDatapoint {
  /// The average.
  @_s.JsonKey(name: 'average')
  final double average;

  /// The maximum.
  @_s.JsonKey(name: 'maximum')
  final double maximum;

  /// The minimum.
  @_s.JsonKey(name: 'minimum')
  final double minimum;

  /// The sample count.
  @_s.JsonKey(name: 'sampleCount')
  final double sampleCount;

  /// The sum.
  @_s.JsonKey(name: 'sum')
  final double sum;

  /// The timestamp (e.g., <code>1479816991.349</code>).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'timestamp')
  final DateTime timestamp;

  /// The unit.
  @_s.JsonKey(name: 'unit')
  final MetricUnit unit;

  MetricDatapoint({
    this.average,
    this.maximum,
    this.minimum,
    this.sampleCount,
    this.sum,
    this.timestamp,
    this.unit,
  });
  factory MetricDatapoint.fromJson(Map<String, dynamic> json) =>
      _$MetricDatapointFromJson(json);
}

enum MetricName {
  @_s.JsonValue('CPUUtilization')
  cPUUtilization,
  @_s.JsonValue('NetworkIn')
  networkIn,
  @_s.JsonValue('NetworkOut')
  networkOut,
  @_s.JsonValue('StatusCheckFailed')
  statusCheckFailed,
  @_s.JsonValue('StatusCheckFailed_Instance')
  statusCheckFailedInstance,
  @_s.JsonValue('StatusCheckFailed_System')
  statusCheckFailedSystem,
  @_s.JsonValue('ClientTLSNegotiationErrorCount')
  clientTLSNegotiationErrorCount,
  @_s.JsonValue('HealthyHostCount')
  healthyHostCount,
  @_s.JsonValue('UnhealthyHostCount')
  unhealthyHostCount,
  @_s.JsonValue('HTTPCode_LB_4XX_Count')
  hTTPCodeLb_4xxCount,
  @_s.JsonValue('HTTPCode_LB_5XX_Count')
  hTTPCodeLb_5xxCount,
  @_s.JsonValue('HTTPCode_Instance_2XX_Count')
  hTTPCodeInstance_2xxCount,
  @_s.JsonValue('HTTPCode_Instance_3XX_Count')
  hTTPCodeInstance_3xxCount,
  @_s.JsonValue('HTTPCode_Instance_4XX_Count')
  hTTPCodeInstance_4xxCount,
  @_s.JsonValue('HTTPCode_Instance_5XX_Count')
  hTTPCodeInstance_5xxCount,
  @_s.JsonValue('InstanceResponseTime')
  instanceResponseTime,
  @_s.JsonValue('RejectedConnectionCount')
  rejectedConnectionCount,
  @_s.JsonValue('RequestCount')
  requestCount,
  @_s.JsonValue('DatabaseConnections')
  databaseConnections,
  @_s.JsonValue('DiskQueueDepth')
  diskQueueDepth,
  @_s.JsonValue('FreeStorageSpace')
  freeStorageSpace,
  @_s.JsonValue('NetworkReceiveThroughput')
  networkReceiveThroughput,
  @_s.JsonValue('NetworkTransmitThroughput')
  networkTransmitThroughput,
  @_s.JsonValue('BurstCapacityTime')
  burstCapacityTime,
  @_s.JsonValue('BurstCapacityPercentage')
  burstCapacityPercentage,
}

extension on MetricName {
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
    throw Exception('Unknown enum value: $this');
  }
}

enum MetricStatistic {
  @_s.JsonValue('Minimum')
  minimum,
  @_s.JsonValue('Maximum')
  maximum,
  @_s.JsonValue('Sum')
  sum,
  @_s.JsonValue('Average')
  average,
  @_s.JsonValue('SampleCount')
  sampleCount,
}

extension on MetricStatistic {
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
    throw Exception('Unknown enum value: $this');
  }
}

enum MetricUnit {
  @_s.JsonValue('Seconds')
  seconds,
  @_s.JsonValue('Microseconds')
  microseconds,
  @_s.JsonValue('Milliseconds')
  milliseconds,
  @_s.JsonValue('Bytes')
  bytes,
  @_s.JsonValue('Kilobytes')
  kilobytes,
  @_s.JsonValue('Megabytes')
  megabytes,
  @_s.JsonValue('Gigabytes')
  gigabytes,
  @_s.JsonValue('Terabytes')
  terabytes,
  @_s.JsonValue('Bits')
  bits,
  @_s.JsonValue('Kilobits')
  kilobits,
  @_s.JsonValue('Megabits')
  megabits,
  @_s.JsonValue('Gigabits')
  gigabits,
  @_s.JsonValue('Terabits')
  terabits,
  @_s.JsonValue('Percent')
  percent,
  @_s.JsonValue('Count')
  count,
  @_s.JsonValue('Bytes/Second')
  bytesSecond,
  @_s.JsonValue('Kilobytes/Second')
  kilobytesSecond,
  @_s.JsonValue('Megabytes/Second')
  megabytesSecond,
  @_s.JsonValue('Gigabytes/Second')
  gigabytesSecond,
  @_s.JsonValue('Terabytes/Second')
  terabytesSecond,
  @_s.JsonValue('Bits/Second')
  bitsSecond,
  @_s.JsonValue('Kilobits/Second')
  kilobitsSecond,
  @_s.JsonValue('Megabits/Second')
  megabitsSecond,
  @_s.JsonValue('Gigabits/Second')
  gigabitsSecond,
  @_s.JsonValue('Terabits/Second')
  terabitsSecond,
  @_s.JsonValue('Count/Second')
  countSecond,
  @_s.JsonValue('None')
  none,
}

extension on MetricUnit {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes resource being monitored by an alarm.
///
/// An alarm is a way to monitor your Amazon Lightsail resource metrics. For
/// more information, see <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms">Alarms
/// in Amazon Lightsail</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MonitoredResourceInfo {
  /// The Amazon Resource Name (ARN) of the resource being monitored.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The name of the Lightsail resource being monitored.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The Lightsail resource type of the resource being monitored.
  ///
  /// Instances, load balancers, and relational databases are the only Lightsail
  /// resources that can currently be monitored by alarms.
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  MonitoredResourceInfo({
    this.arn,
    this.name,
    this.resourceType,
  });
  factory MonitoredResourceInfo.fromJson(Map<String, dynamic> json) =>
      _$MonitoredResourceInfoFromJson(json);
}

/// Describes the monthly data transfer in and out of your virtual private
/// server (or <i>instance</i>).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MonthlyTransfer {
  /// The amount allocated per month (in GB).
  @_s.JsonKey(name: 'gbPerMonthAllocated')
  final int gbPerMonthAllocated;

  MonthlyTransfer({
    this.gbPerMonthAllocated,
  });
  factory MonthlyTransfer.fromJson(Map<String, dynamic> json) =>
      _$MonthlyTransferFromJson(json);
}

enum NetworkProtocol {
  @_s.JsonValue('tcp')
  tcp,
  @_s.JsonValue('all')
  all,
  @_s.JsonValue('udp')
  udp,
  @_s.JsonValue('icmp')
  icmp,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OpenInstancePublicPortsResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operation')
  final Operation operation;

  OpenInstancePublicPortsResult({
    this.operation,
  });
  factory OpenInstancePublicPortsResult.fromJson(Map<String, dynamic> json) =>
      _$OpenInstancePublicPortsResultFromJson(json);
}

/// Describes the API operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Operation {
  /// The timestamp when the operation was initialized (e.g.,
  /// <code>1479816991.349</code>).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The error code.
  @_s.JsonKey(name: 'errorCode')
  final String errorCode;

  /// The error details.
  @_s.JsonKey(name: 'errorDetails')
  final String errorDetails;

  /// The ID of the operation.
  @_s.JsonKey(name: 'id')
  final String id;

  /// A Boolean value indicating whether the operation is terminal.
  @_s.JsonKey(name: 'isTerminal')
  final bool isTerminal;

  /// The AWS Region and Availability Zone.
  @_s.JsonKey(name: 'location')
  final ResourceLocation location;

  /// Details about the operation (e.g., <code>Debian-1GB-Ohio-1</code>).
  @_s.JsonKey(name: 'operationDetails')
  final String operationDetails;

  /// The type of operation.
  @_s.JsonKey(name: 'operationType')
  final OperationType operationType;

  /// The resource name.
  @_s.JsonKey(name: 'resourceName')
  final String resourceName;

  /// The resource type.
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// The status of the operation.
  @_s.JsonKey(name: 'status')
  final OperationStatus status;

  /// The timestamp when the status was changed (e.g.,
  /// <code>1479816991.349</code>).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'statusChangedAt')
  final DateTime statusChangedAt;

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
  factory Operation.fromJson(Map<String, dynamic> json) =>
      _$OperationFromJson(json);
}

enum OperationStatus {
  @_s.JsonValue('NotStarted')
  notStarted,
  @_s.JsonValue('Started')
  started,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Succeeded')
  succeeded,
}

enum OperationType {
  @_s.JsonValue('DeleteKnownHostKeys')
  deleteKnownHostKeys,
  @_s.JsonValue('DeleteInstance')
  deleteInstance,
  @_s.JsonValue('CreateInstance')
  createInstance,
  @_s.JsonValue('StopInstance')
  stopInstance,
  @_s.JsonValue('StartInstance')
  startInstance,
  @_s.JsonValue('RebootInstance')
  rebootInstance,
  @_s.JsonValue('OpenInstancePublicPorts')
  openInstancePublicPorts,
  @_s.JsonValue('PutInstancePublicPorts')
  putInstancePublicPorts,
  @_s.JsonValue('CloseInstancePublicPorts')
  closeInstancePublicPorts,
  @_s.JsonValue('AllocateStaticIp')
  allocateStaticIp,
  @_s.JsonValue('ReleaseStaticIp')
  releaseStaticIp,
  @_s.JsonValue('AttachStaticIp')
  attachStaticIp,
  @_s.JsonValue('DetachStaticIp')
  detachStaticIp,
  @_s.JsonValue('UpdateDomainEntry')
  updateDomainEntry,
  @_s.JsonValue('DeleteDomainEntry')
  deleteDomainEntry,
  @_s.JsonValue('CreateDomain')
  createDomain,
  @_s.JsonValue('DeleteDomain')
  deleteDomain,
  @_s.JsonValue('CreateInstanceSnapshot')
  createInstanceSnapshot,
  @_s.JsonValue('DeleteInstanceSnapshot')
  deleteInstanceSnapshot,
  @_s.JsonValue('CreateInstancesFromSnapshot')
  createInstancesFromSnapshot,
  @_s.JsonValue('CreateLoadBalancer')
  createLoadBalancer,
  @_s.JsonValue('DeleteLoadBalancer')
  deleteLoadBalancer,
  @_s.JsonValue('AttachInstancesToLoadBalancer')
  attachInstancesToLoadBalancer,
  @_s.JsonValue('DetachInstancesFromLoadBalancer')
  detachInstancesFromLoadBalancer,
  @_s.JsonValue('UpdateLoadBalancerAttribute')
  updateLoadBalancerAttribute,
  @_s.JsonValue('CreateLoadBalancerTlsCertificate')
  createLoadBalancerTlsCertificate,
  @_s.JsonValue('DeleteLoadBalancerTlsCertificate')
  deleteLoadBalancerTlsCertificate,
  @_s.JsonValue('AttachLoadBalancerTlsCertificate')
  attachLoadBalancerTlsCertificate,
  @_s.JsonValue('CreateDisk')
  createDisk,
  @_s.JsonValue('DeleteDisk')
  deleteDisk,
  @_s.JsonValue('AttachDisk')
  attachDisk,
  @_s.JsonValue('DetachDisk')
  detachDisk,
  @_s.JsonValue('CreateDiskSnapshot')
  createDiskSnapshot,
  @_s.JsonValue('DeleteDiskSnapshot')
  deleteDiskSnapshot,
  @_s.JsonValue('CreateDiskFromSnapshot')
  createDiskFromSnapshot,
  @_s.JsonValue('CreateRelationalDatabase')
  createRelationalDatabase,
  @_s.JsonValue('UpdateRelationalDatabase')
  updateRelationalDatabase,
  @_s.JsonValue('DeleteRelationalDatabase')
  deleteRelationalDatabase,
  @_s.JsonValue('CreateRelationalDatabaseFromSnapshot')
  createRelationalDatabaseFromSnapshot,
  @_s.JsonValue('CreateRelationalDatabaseSnapshot')
  createRelationalDatabaseSnapshot,
  @_s.JsonValue('DeleteRelationalDatabaseSnapshot')
  deleteRelationalDatabaseSnapshot,
  @_s.JsonValue('UpdateRelationalDatabaseParameters')
  updateRelationalDatabaseParameters,
  @_s.JsonValue('StartRelationalDatabase')
  startRelationalDatabase,
  @_s.JsonValue('RebootRelationalDatabase')
  rebootRelationalDatabase,
  @_s.JsonValue('StopRelationalDatabase')
  stopRelationalDatabase,
  @_s.JsonValue('EnableAddOn')
  enableAddOn,
  @_s.JsonValue('DisableAddOn')
  disableAddOn,
  @_s.JsonValue('PutAlarm')
  putAlarm,
  @_s.JsonValue('GetAlarms')
  getAlarms,
  @_s.JsonValue('DeleteAlarm')
  deleteAlarm,
  @_s.JsonValue('TestAlarm')
  testAlarm,
  @_s.JsonValue('CreateContactMethod')
  createContactMethod,
  @_s.JsonValue('GetContactMethods')
  getContactMethods,
  @_s.JsonValue('SendContactMethodVerification')
  sendContactMethodVerification,
  @_s.JsonValue('DeleteContactMethod')
  deleteContactMethod,
  @_s.JsonValue('CreateDistribution')
  createDistribution,
  @_s.JsonValue('UpdateDistribution')
  updateDistribution,
  @_s.JsonValue('DeleteDistribution')
  deleteDistribution,
  @_s.JsonValue('ResetDistributionCache')
  resetDistributionCache,
  @_s.JsonValue('AttachCertificateToDistribution')
  attachCertificateToDistribution,
  @_s.JsonValue('DetachCertificateFromDistribution')
  detachCertificateFromDistribution,
  @_s.JsonValue('UpdateDistributionBundle')
  updateDistributionBundle,
  @_s.JsonValue('CreateCertificate')
  createCertificate,
  @_s.JsonValue('DeleteCertificate')
  deleteCertificate,
  @_s.JsonValue('CreateContainerService')
  createContainerService,
  @_s.JsonValue('UpdateContainerService')
  updateContainerService,
  @_s.JsonValue('DeleteContainerService')
  deleteContainerService,
  @_s.JsonValue('CreateContainerServiceDeployment')
  createContainerServiceDeployment,
  @_s.JsonValue('CreateContainerServiceRegistryLogin')
  createContainerServiceRegistryLogin,
  @_s.JsonValue('RegisterContainerImage')
  registerContainerImage,
  @_s.JsonValue('DeleteContainerImage')
  deleteContainerImage,
}

/// Describes the origin resource of an Amazon Lightsail content delivery
/// network (CDN) distribution.
///
/// An origin can be a Lightsail instance or load balancer. A distribution pulls
/// content from an origin, caches it, and serves it to viewers via a worldwide
/// network of edge servers.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Origin {
  /// The name of the origin resource.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The protocol that your Amazon Lightsail distribution uses when establishing
  /// a connection with your origin to pull content.
  @_s.JsonKey(name: 'protocolPolicy')
  final OriginProtocolPolicyEnum protocolPolicy;

  /// The AWS Region name of the origin resource.
  @_s.JsonKey(name: 'regionName')
  final RegionName regionName;

  /// The resource type of the origin resource (e.g., <i>Instance</i>).
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  Origin({
    this.name,
    this.protocolPolicy,
    this.regionName,
    this.resourceType,
  });
  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);
}

enum OriginProtocolPolicyEnum {
  @_s.JsonValue('http-only')
  httpOnly,
  @_s.JsonValue('https-only')
  httpsOnly,
}

/// The password data for the Windows Server-based instance, including the
/// ciphertext and the key pair name.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'ciphertext')
  final String ciphertext;

  /// The name of the key pair that you used when creating your instance. If no
  /// key pair name was specified when creating the instance, Lightsail uses the
  /// default key pair (<code>LightsailDefaultKeyPair</code>).
  ///
  /// If you are using a custom key pair, you need to use your own means of
  /// decrypting your password using the <code>ciphertext</code>. Lightsail
  /// creates the ciphertext by encrypting your password with the public key part
  /// of this key pair.
  @_s.JsonKey(name: 'keyPairName')
  final String keyPairName;

  PasswordData({
    this.ciphertext,
    this.keyPairName,
  });
  factory PasswordData.fromJson(Map<String, dynamic> json) =>
      _$PasswordDataFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PeerVpcResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operation')
  final Operation operation;

  PeerVpcResult({
    this.operation,
  });
  factory PeerVpcResult.fromJson(Map<String, dynamic> json) =>
      _$PeerVpcResultFromJson(json);
}

/// Describes a pending database maintenance action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PendingMaintenanceAction {
  /// The type of pending database maintenance action.
  @_s.JsonKey(name: 'action')
  final String action;

  /// The effective date of the pending database maintenance action.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'currentApplyDate')
  final DateTime currentApplyDate;

  /// Additional detail about the pending database maintenance action.
  @_s.JsonKey(name: 'description')
  final String description;

  PendingMaintenanceAction({
    this.action,
    this.currentApplyDate,
    this.description,
  });
  factory PendingMaintenanceAction.fromJson(Map<String, dynamic> json) =>
      _$PendingMaintenanceActionFromJson(json);
}

/// Describes a pending database value modification.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PendingModifiedRelationalDatabaseValues {
  /// A Boolean value indicating whether automated backup retention is enabled.
  @_s.JsonKey(name: 'backupRetentionEnabled')
  final bool backupRetentionEnabled;

  /// The database engine version.
  @_s.JsonKey(name: 'engineVersion')
  final String engineVersion;

  /// The password for the master user of the database.
  @_s.JsonKey(name: 'masterUserPassword')
  final String masterUserPassword;

  PendingModifiedRelationalDatabaseValues({
    this.backupRetentionEnabled,
    this.engineVersion,
    this.masterUserPassword,
  });
  factory PendingModifiedRelationalDatabaseValues.fromJson(
          Map<String, dynamic> json) =>
      _$PendingModifiedRelationalDatabaseValuesFromJson(json);
}

enum PortAccessType {
  @_s.JsonValue('Public')
  public,
  @_s.JsonValue('Private')
  private,
}

/// Describes ports to open on an instance, the IP addresses allowed to connect
/// to the instance through the ports, and the protocol.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PortInfo {
  /// An alias that defines access for a preconfigured range of IP addresses.
  ///
  /// The only alias currently supported is <code>lightsail-connect</code>, which
  /// allows IP addresses of the browser-based RDP/SSH client in the Lightsail
  /// console to connect to your instance.
  @_s.JsonKey(name: 'cidrListAliases')
  final List<String> cidrListAliases;

  /// The IP address, or range of IP addresses in CIDR notation, that are allowed
  /// to connect to an instance through the ports, and the protocol. Lightsail
  /// supports IPv4 addresses.
  ///
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
  @_s.JsonKey(name: 'cidrs')
  final List<String> cidrs;

  /// The first port in a range of open ports on an instance.
  ///
  /// Allowed ports:
  ///
  /// <ul>
  /// <li>
  /// TCP and UDP - <code>0</code> to <code>65535</code>
  /// </li>
  /// <li>
  /// ICMP - The ICMP type. For example, specify <code>8</code> as the
  /// <code>fromPort</code> (ICMP type), and <code>-1</code> as the
  /// <code>toPort</code> (ICMP code), to enable ICMP Ping. For more information,
  /// see <a
  /// href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control
  /// Messages</a> on <i>Wikipedia</i>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'fromPort')
  final int fromPort;

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
  /// </ul>
  @_s.JsonKey(name: 'protocol')
  final NetworkProtocol protocol;

  /// The last port in a range of open ports on an instance.
  ///
  /// Allowed ports:
  ///
  /// <ul>
  /// <li>
  /// TCP and UDP - <code>0</code> to <code>65535</code>
  /// </li>
  /// <li>
  /// ICMP - The ICMP code. For example, specify <code>8</code> as the
  /// <code>fromPort</code> (ICMP type), and <code>-1</code> as the
  /// <code>toPort</code> (ICMP code), to enable ICMP Ping. For more information,
  /// see <a
  /// href="https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages">Control
  /// Messages</a> on <i>Wikipedia</i>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'toPort')
  final int toPort;

  PortInfo({
    this.cidrListAliases,
    this.cidrs,
    this.fromPort,
    this.protocol,
    this.toPort,
  });
  Map<String, dynamic> toJson() => _$PortInfoToJson(this);
}

enum PortInfoSourceType {
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('INSTANCE')
  instance,
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('CLOSED')
  closed,
}

enum PortState {
  @_s.JsonValue('open')
  open,
  @_s.JsonValue('closed')
  closed,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutAlarmResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  PutAlarmResult({
    this.operations,
  });
  factory PutAlarmResult.fromJson(Map<String, dynamic> json) =>
      _$PutAlarmResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutInstancePublicPortsResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operation')
  final Operation operation;

  PutInstancePublicPortsResult({
    this.operation,
  });
  factory PutInstancePublicPortsResult.fromJson(Map<String, dynamic> json) =>
      _$PutInstancePublicPortsResultFromJson(json);
}

/// Describes the query string parameters that an Amazon Lightsail content
/// delivery network (CDN) distribution to bases caching on.
///
/// For the query strings that you specify, your distribution caches separate
/// versions of the specified content based on the query string values in viewer
/// requests.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class QueryStringObject {
  /// Indicates whether the distribution forwards and caches based on query
  /// strings.
  @_s.JsonKey(name: 'option')
  final bool option;

  /// The specific query strings that the distribution forwards to the origin.
  ///
  /// Your distribution will cache content based on the specified query strings.
  ///
  /// If the <code>option</code> parameter is true, then your distribution
  /// forwards all query strings, regardless of what you specify using the
  /// <code>queryStringsAllowList</code> parameter.
  @_s.JsonKey(name: 'queryStringsAllowList')
  final List<String> queryStringsAllowList;

  QueryStringObject({
    this.option,
    this.queryStringsAllowList,
  });
  factory QueryStringObject.fromJson(Map<String, dynamic> json) =>
      _$QueryStringObjectFromJson(json);

  Map<String, dynamic> toJson() => _$QueryStringObjectToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RebootInstanceResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  RebootInstanceResult({
    this.operations,
  });
  factory RebootInstanceResult.fromJson(Map<String, dynamic> json) =>
      _$RebootInstanceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RebootRelationalDatabaseResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  RebootRelationalDatabaseResult({
    this.operations,
  });
  factory RebootRelationalDatabaseResult.fromJson(Map<String, dynamic> json) =>
      _$RebootRelationalDatabaseResultFromJson(json);
}

enum RecordState {
  @_s.JsonValue('Started')
  started,
  @_s.JsonValue('Succeeded')
  succeeded,
  @_s.JsonValue('Failed')
  failed,
}

/// Describes the AWS Region.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Region {
  /// The Availability Zones. Follows the format <code>us-east-2a</code>
  /// (case-sensitive).
  @_s.JsonKey(name: 'availabilityZones')
  final List<AvailabilityZone> availabilityZones;

  /// The continent code (e.g., <code>NA</code>, meaning North America).
  @_s.JsonKey(name: 'continentCode')
  final String continentCode;

  /// The description of the AWS Region (e.g., <code>This region is recommended to
  /// serve users in the eastern United States and eastern Canada</code>).
  @_s.JsonKey(name: 'description')
  final String description;

  /// The display name (e.g., <code>Ohio</code>).
  @_s.JsonKey(name: 'displayName')
  final String displayName;

  /// The region name (e.g., <code>us-east-2</code>).
  @_s.JsonKey(name: 'name')
  final RegionName name;

  /// The Availability Zones for databases. Follows the format
  /// <code>us-east-2a</code> (case-sensitive).
  @_s.JsonKey(name: 'relationalDatabaseAvailabilityZones')
  final List<AvailabilityZone> relationalDatabaseAvailabilityZones;

  Region({
    this.availabilityZones,
    this.continentCode,
    this.description,
    this.displayName,
    this.name,
    this.relationalDatabaseAvailabilityZones,
  });
  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
}

enum RegionName {
  @_s.JsonValue('us-east-1')
  usEast_1,
  @_s.JsonValue('us-east-2')
  usEast_2,
  @_s.JsonValue('us-west-1')
  usWest_1,
  @_s.JsonValue('us-west-2')
  usWest_2,
  @_s.JsonValue('eu-west-1')
  euWest_1,
  @_s.JsonValue('eu-west-2')
  euWest_2,
  @_s.JsonValue('eu-west-3')
  euWest_3,
  @_s.JsonValue('eu-central-1')
  euCentral_1,
  @_s.JsonValue('ca-central-1')
  caCentral_1,
  @_s.JsonValue('ap-south-1')
  apSouth_1,
  @_s.JsonValue('ap-southeast-1')
  apSoutheast_1,
  @_s.JsonValue('ap-southeast-2')
  apSoutheast_2,
  @_s.JsonValue('ap-northeast-1')
  apNortheast_1,
  @_s.JsonValue('ap-northeast-2')
  apNortheast_2,
}

extension on RegionName {
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
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterContainerImageResult {
  @_s.JsonKey(name: 'containerImage')
  final ContainerImage containerImage;

  RegisterContainerImageResult({
    this.containerImage,
  });
  factory RegisterContainerImageResult.fromJson(Map<String, dynamic> json) =>
      _$RegisterContainerImageResultFromJson(json);
}

/// Describes a database.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RelationalDatabase {
  /// The Amazon Resource Name (ARN) of the database.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A Boolean value indicating whether automated backup retention is enabled for
  /// the database.
  @_s.JsonKey(name: 'backupRetentionEnabled')
  final bool backupRetentionEnabled;

  /// The certificate associated with the database.
  @_s.JsonKey(name: 'caCertificateIdentifier')
  final String caCertificateIdentifier;

  /// The timestamp when the database was created. Formatted in Unix time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The database software (for example, <code>MySQL</code>).
  @_s.JsonKey(name: 'engine')
  final String engine;

  /// The database engine version (for example, <code>5.7.23</code>).
  @_s.JsonKey(name: 'engineVersion')
  final String engineVersion;

  /// Describes the hardware of the database.
  @_s.JsonKey(name: 'hardware')
  final RelationalDatabaseHardware hardware;

  /// The latest point in time to which the database can be restored. Formatted in
  /// Unix time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'latestRestorableTime')
  final DateTime latestRestorableTime;

  /// The Region name and Availability Zone where the database is located.
  @_s.JsonKey(name: 'location')
  final ResourceLocation location;

  /// The name of the master database created when the Lightsail database resource
  /// is created.
  @_s.JsonKey(name: 'masterDatabaseName')
  final String masterDatabaseName;

  /// The master endpoint for the database.
  @_s.JsonKey(name: 'masterEndpoint')
  final RelationalDatabaseEndpoint masterEndpoint;

  /// The master user name of the database.
  @_s.JsonKey(name: 'masterUsername')
  final String masterUsername;

  /// The unique name of the database resource in Lightsail.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The status of parameter updates for the database.
  @_s.JsonKey(name: 'parameterApplyStatus')
  final String parameterApplyStatus;

  /// Describes the pending maintenance actions for the database.
  @_s.JsonKey(name: 'pendingMaintenanceActions')
  final List<PendingMaintenanceAction> pendingMaintenanceActions;

  /// Describes pending database value modifications.
  @_s.JsonKey(name: 'pendingModifiedValues')
  final PendingModifiedRelationalDatabaseValues pendingModifiedValues;

  /// The daily time range during which automated backups are created for the
  /// database (for example, <code>16:00-16:30</code>).
  @_s.JsonKey(name: 'preferredBackupWindow')
  final String preferredBackupWindow;

  /// The weekly time range during which system maintenance can occur on the
  /// database.
  ///
  /// In the format <code>ddd:hh24:mi-ddd:hh24:mi</code>. For example,
  /// <code>Tue:17:00-Tue:17:30</code>.
  @_s.JsonKey(name: 'preferredMaintenanceWindow')
  final String preferredMaintenanceWindow;

  /// A Boolean value indicating whether the database is publicly accessible.
  @_s.JsonKey(name: 'publiclyAccessible')
  final bool publiclyAccessible;

  /// The blueprint ID for the database. A blueprint describes the major engine
  /// version of a database.
  @_s.JsonKey(name: 'relationalDatabaseBlueprintId')
  final String relationalDatabaseBlueprintId;

  /// The bundle ID for the database. A bundle describes the performance
  /// specifications for your database.
  @_s.JsonKey(name: 'relationalDatabaseBundleId')
  final String relationalDatabaseBundleId;

  /// The Lightsail resource type for the database (for example,
  /// <code>RelationalDatabase</code>).
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// Describes the secondary Availability Zone of a high availability database.
  ///
  /// The secondary database is used for failover support of a high availability
  /// database.
  @_s.JsonKey(name: 'secondaryAvailabilityZone')
  final String secondaryAvailabilityZone;

  /// Describes the current state of the database.
  @_s.JsonKey(name: 'state')
  final String state;

  /// The support code for the database. Include this code in your email to
  /// support when you have questions about a database in Lightsail. This code
  /// enables our support team to look up your Lightsail information more easily.
  @_s.JsonKey(name: 'supportCode')
  final String supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
  /// Dev Guide</a>.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

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
  factory RelationalDatabase.fromJson(Map<String, dynamic> json) =>
      _$RelationalDatabaseFromJson(json);
}

/// Describes a database image, or blueprint. A blueprint describes the major
/// engine version of a database.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RelationalDatabaseBlueprint {
  /// The ID for the database blueprint.
  @_s.JsonKey(name: 'blueprintId')
  final String blueprintId;

  /// The database software of the database blueprint (for example,
  /// <code>MySQL</code>).
  @_s.JsonKey(name: 'engine')
  final RelationalDatabaseEngine engine;

  /// The description of the database engine for the database blueprint.
  @_s.JsonKey(name: 'engineDescription')
  final String engineDescription;

  /// The database engine version for the database blueprint (for example,
  /// <code>5.7.23</code>).
  @_s.JsonKey(name: 'engineVersion')
  final String engineVersion;

  /// The description of the database engine version for the database blueprint.
  @_s.JsonKey(name: 'engineVersionDescription')
  final String engineVersionDescription;

  /// A Boolean value indicating whether the engine version is the default for the
  /// database blueprint.
  @_s.JsonKey(name: 'isEngineDefault')
  final bool isEngineDefault;

  RelationalDatabaseBlueprint({
    this.blueprintId,
    this.engine,
    this.engineDescription,
    this.engineVersion,
    this.engineVersionDescription,
    this.isEngineDefault,
  });
  factory RelationalDatabaseBlueprint.fromJson(Map<String, dynamic> json) =>
      _$RelationalDatabaseBlueprintFromJson(json);
}

/// Describes a database bundle. A bundle describes the performance
/// specifications of the database.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RelationalDatabaseBundle {
  /// The ID for the database bundle.
  @_s.JsonKey(name: 'bundleId')
  final String bundleId;

  /// The number of virtual CPUs (vCPUs) for the database bundle.
  @_s.JsonKey(name: 'cpuCount')
  final int cpuCount;

  /// The size of the disk for the database bundle.
  @_s.JsonKey(name: 'diskSizeInGb')
  final int diskSizeInGb;

  /// A Boolean value indicating whether the database bundle is active.
  @_s.JsonKey(name: 'isActive')
  final bool isActive;

  /// A Boolean value indicating whether the database bundle is encrypted.
  @_s.JsonKey(name: 'isEncrypted')
  final bool isEncrypted;

  /// The name for the database bundle.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The cost of the database bundle in US currency.
  @_s.JsonKey(name: 'price')
  final double price;

  /// The amount of RAM in GB (for example, <code>2.0</code>) for the database
  /// bundle.
  @_s.JsonKey(name: 'ramSizeInGb')
  final double ramSizeInGb;

  /// The data transfer rate per month in GB for the database bundle.
  @_s.JsonKey(name: 'transferPerMonthInGb')
  final int transferPerMonthInGb;

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
  factory RelationalDatabaseBundle.fromJson(Map<String, dynamic> json) =>
      _$RelationalDatabaseBundleFromJson(json);
}

/// Describes an endpoint for a database.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RelationalDatabaseEndpoint {
  /// Specifies the DNS address of the database.
  @_s.JsonKey(name: 'address')
  final String address;

  /// Specifies the port that the database is listening on.
  @_s.JsonKey(name: 'port')
  final int port;

  RelationalDatabaseEndpoint({
    this.address,
    this.port,
  });
  factory RelationalDatabaseEndpoint.fromJson(Map<String, dynamic> json) =>
      _$RelationalDatabaseEndpointFromJson(json);
}

enum RelationalDatabaseEngine {
  @_s.JsonValue('mysql')
  mysql,
}

/// Describes an event for a database.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RelationalDatabaseEvent {
  /// The timestamp when the database event was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The category that the database event belongs to.
  @_s.JsonKey(name: 'eventCategories')
  final List<String> eventCategories;

  /// The message of the database event.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The database that the database event relates to.
  @_s.JsonKey(name: 'resource')
  final String resource;

  RelationalDatabaseEvent({
    this.createdAt,
    this.eventCategories,
    this.message,
    this.resource,
  });
  factory RelationalDatabaseEvent.fromJson(Map<String, dynamic> json) =>
      _$RelationalDatabaseEventFromJson(json);
}

/// Describes the hardware of a database.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RelationalDatabaseHardware {
  /// The number of vCPUs for the database.
  @_s.JsonKey(name: 'cpuCount')
  final int cpuCount;

  /// The size of the disk for the database.
  @_s.JsonKey(name: 'diskSizeInGb')
  final int diskSizeInGb;

  /// The amount of RAM in GB for the database.
  @_s.JsonKey(name: 'ramSizeInGb')
  final double ramSizeInGb;

  RelationalDatabaseHardware({
    this.cpuCount,
    this.diskSizeInGb,
    this.ramSizeInGb,
  });
  factory RelationalDatabaseHardware.fromJson(Map<String, dynamic> json) =>
      _$RelationalDatabaseHardwareFromJson(json);
}

enum RelationalDatabaseMetricName {
  @_s.JsonValue('CPUUtilization')
  cPUUtilization,
  @_s.JsonValue('DatabaseConnections')
  databaseConnections,
  @_s.JsonValue('DiskQueueDepth')
  diskQueueDepth,
  @_s.JsonValue('FreeStorageSpace')
  freeStorageSpace,
  @_s.JsonValue('NetworkReceiveThroughput')
  networkReceiveThroughput,
  @_s.JsonValue('NetworkTransmitThroughput')
  networkTransmitThroughput,
}

extension on RelationalDatabaseMetricName {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the parameters of a database.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RelationalDatabaseParameter {
  /// Specifies the valid range of values for the parameter.
  @_s.JsonKey(name: 'allowedValues')
  final String allowedValues;

  /// Indicates when parameter updates are applied.
  ///
  /// Can be <code>immediate</code> or <code>pending-reboot</code>.
  @_s.JsonKey(name: 'applyMethod')
  final String applyMethod;

  /// Specifies the engine-specific parameter type.
  @_s.JsonKey(name: 'applyType')
  final String applyType;

  /// Specifies the valid data type for the parameter.
  @_s.JsonKey(name: 'dataType')
  final String dataType;

  /// Provides a description of the parameter.
  @_s.JsonKey(name: 'description')
  final String description;

  /// A Boolean value indicating whether the parameter can be modified.
  @_s.JsonKey(name: 'isModifiable')
  final bool isModifiable;

  /// Specifies the name of the parameter.
  @_s.JsonKey(name: 'parameterName')
  final String parameterName;

  /// Specifies the value of the parameter.
  @_s.JsonKey(name: 'parameterValue')
  final String parameterValue;

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
  factory RelationalDatabaseParameter.fromJson(Map<String, dynamic> json) =>
      _$RelationalDatabaseParameterFromJson(json);

  Map<String, dynamic> toJson() => _$RelationalDatabaseParameterToJson(this);
}

enum RelationalDatabasePasswordVersion {
  @_s.JsonValue('CURRENT')
  current,
  @_s.JsonValue('PREVIOUS')
  previous,
  @_s.JsonValue('PENDING')
  pending,
}

extension on RelationalDatabasePasswordVersion {
  String toValue() {
    switch (this) {
      case RelationalDatabasePasswordVersion.current:
        return 'CURRENT';
      case RelationalDatabasePasswordVersion.previous:
        return 'PREVIOUS';
      case RelationalDatabasePasswordVersion.pending:
        return 'PENDING';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a database snapshot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RelationalDatabaseSnapshot {
  /// The Amazon Resource Name (ARN) of the database snapshot.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The timestamp when the database snapshot was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The software of the database snapshot (for example, <code>MySQL</code>)
  @_s.JsonKey(name: 'engine')
  final String engine;

  /// The database engine version for the database snapshot (for example,
  /// <code>5.7.23</code>).
  @_s.JsonKey(name: 'engineVersion')
  final String engineVersion;

  /// The Amazon Resource Name (ARN) of the database from which the database
  /// snapshot was created.
  @_s.JsonKey(name: 'fromRelationalDatabaseArn')
  final String fromRelationalDatabaseArn;

  /// The blueprint ID of the database from which the database snapshot was
  /// created. A blueprint describes the major engine version of a database.
  @_s.JsonKey(name: 'fromRelationalDatabaseBlueprintId')
  final String fromRelationalDatabaseBlueprintId;

  /// The bundle ID of the database from which the database snapshot was created.
  @_s.JsonKey(name: 'fromRelationalDatabaseBundleId')
  final String fromRelationalDatabaseBundleId;

  /// The name of the source database from which the database snapshot was
  /// created.
  @_s.JsonKey(name: 'fromRelationalDatabaseName')
  final String fromRelationalDatabaseName;

  /// The Region name and Availability Zone where the database snapshot is
  /// located.
  @_s.JsonKey(name: 'location')
  final ResourceLocation location;

  /// The name of the database snapshot.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The Lightsail resource type.
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// The size of the disk in GB (for example, <code>32</code>) for the database
  /// snapshot.
  @_s.JsonKey(name: 'sizeInGb')
  final int sizeInGb;

  /// The state of the database snapshot.
  @_s.JsonKey(name: 'state')
  final String state;

  /// The support code for the database snapshot. Include this code in your email
  /// to support when you have questions about a database snapshot in Lightsail.
  /// This code enables our support team to look up your Lightsail information
  /// more easily.
  @_s.JsonKey(name: 'supportCode')
  final String supportCode;

  /// The tag keys and optional values for the resource. For more information
  /// about tags in Lightsail, see the <a
  /// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
  /// Dev Guide</a>.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

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
  factory RelationalDatabaseSnapshot.fromJson(Map<String, dynamic> json) =>
      _$RelationalDatabaseSnapshotFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReleaseStaticIpResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  ReleaseStaticIpResult({
    this.operations,
  });
  factory ReleaseStaticIpResult.fromJson(Map<String, dynamic> json) =>
      _$ReleaseStaticIpResultFromJson(json);
}

enum RenewalStatus {
  @_s.JsonValue('PendingAutoRenewal')
  pendingAutoRenewal,
  @_s.JsonValue('PendingValidation')
  pendingValidation,
  @_s.JsonValue('Success')
  success,
  @_s.JsonValue('Failed')
  failed,
}

/// Describes the status of a SSL/TLS certificate renewal managed by Amazon
/// Lightsail.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RenewalSummary {
  /// An array of objects that describe the domain validation records of the
  /// certificate.
  @_s.JsonKey(name: 'domainValidationRecords')
  final List<DomainValidationRecord> domainValidationRecords;

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
  @_s.JsonKey(name: 'renewalStatus')
  final RenewalStatus renewalStatus;

  /// The reason for the renewal status of the certificate.
  @_s.JsonKey(name: 'renewalStatusReason')
  final String renewalStatusReason;

  /// The timestamp when the certificate was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  RenewalSummary({
    this.domainValidationRecords,
    this.renewalStatus,
    this.renewalStatusReason,
    this.updatedAt,
  });
  factory RenewalSummary.fromJson(Map<String, dynamic> json) =>
      _$RenewalSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResetDistributionCacheResult {
  /// The timestamp of the reset cache request (e.g., <code>1479734909.17</code>)
  /// in Unix time format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createTime')
  final DateTime createTime;

  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operation')
  final Operation operation;

  /// The status of the reset cache request.
  @_s.JsonKey(name: 'status')
  final String status;

  ResetDistributionCacheResult({
    this.createTime,
    this.operation,
    this.status,
  });
  factory ResetDistributionCacheResult.fromJson(Map<String, dynamic> json) =>
      _$ResetDistributionCacheResultFromJson(json);
}

/// Describes the resource location.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceLocation {
  /// The Availability Zone. Follows the format <code>us-east-2a</code>
  /// (case-sensitive).
  @_s.JsonKey(name: 'availabilityZone')
  final String availabilityZone;

  /// The AWS Region name.
  @_s.JsonKey(name: 'regionName')
  final RegionName regionName;

  ResourceLocation({
    this.availabilityZone,
    this.regionName,
  });
  factory ResourceLocation.fromJson(Map<String, dynamic> json) =>
      _$ResourceLocationFromJson(json);
}

/// Describes the domain name system (DNS) records to add to your domain's DNS
/// to validate it for an Amazon Lightsail certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceRecord {
  /// The name of the record.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The DNS record type.
  @_s.JsonKey(name: 'type')
  final String type;

  /// The value for the DNS record.
  @_s.JsonKey(name: 'value')
  final String value;

  ResourceRecord({
    this.name,
    this.type,
    this.value,
  });
  factory ResourceRecord.fromJson(Map<String, dynamic> json) =>
      _$ResourceRecordFromJson(json);
}

enum ResourceType {
  @_s.JsonValue('ContainerService')
  containerService,
  @_s.JsonValue('Instance')
  instance,
  @_s.JsonValue('StaticIp')
  staticIp,
  @_s.JsonValue('KeyPair')
  keyPair,
  @_s.JsonValue('InstanceSnapshot')
  instanceSnapshot,
  @_s.JsonValue('Domain')
  domain,
  @_s.JsonValue('PeeredVpc')
  peeredVpc,
  @_s.JsonValue('LoadBalancer')
  loadBalancer,
  @_s.JsonValue('LoadBalancerTlsCertificate')
  loadBalancerTlsCertificate,
  @_s.JsonValue('Disk')
  disk,
  @_s.JsonValue('DiskSnapshot')
  diskSnapshot,
  @_s.JsonValue('RelationalDatabase')
  relationalDatabase,
  @_s.JsonValue('RelationalDatabaseSnapshot')
  relationalDatabaseSnapshot,
  @_s.JsonValue('ExportSnapshotRecord')
  exportSnapshotRecord,
  @_s.JsonValue('CloudFormationStackRecord')
  cloudFormationStackRecord,
  @_s.JsonValue('Alarm')
  alarm,
  @_s.JsonValue('ContactMethod')
  contactMethod,
  @_s.JsonValue('Distribution')
  distribution,
  @_s.JsonValue('Certificate')
  certificate,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendContactMethodVerificationResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  SendContactMethodVerificationResult({
    this.operations,
  });
  factory SendContactMethodVerificationResult.fromJson(
          Map<String, dynamic> json) =>
      _$SendContactMethodVerificationResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartInstanceResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  StartInstanceResult({
    this.operations,
  });
  factory StartInstanceResult.fromJson(Map<String, dynamic> json) =>
      _$StartInstanceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartRelationalDatabaseResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  StartRelationalDatabaseResult({
    this.operations,
  });
  factory StartRelationalDatabaseResult.fromJson(Map<String, dynamic> json) =>
      _$StartRelationalDatabaseResultFromJson(json);
}

/// Describes the static IP.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StaticIp {
  /// The Amazon Resource Name (ARN) of the static IP (e.g.,
  /// <code>arn:aws:lightsail:us-east-2:123456789101:StaticIp/9cbb4a9e-f8e3-4dfe-b57e-12345EXAMPLE</code>).
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The instance where the static IP is attached (e.g.,
  /// <code>Amazon_Linux-1GB-Ohio-1</code>).
  @_s.JsonKey(name: 'attachedTo')
  final String attachedTo;

  /// The timestamp when the static IP was created (e.g.,
  /// <code>1479735304.222</code>).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The static IP address.
  @_s.JsonKey(name: 'ipAddress')
  final String ipAddress;

  /// A Boolean value indicating whether the static IP is attached.
  @_s.JsonKey(name: 'isAttached')
  final bool isAttached;

  /// The region and Availability Zone where the static IP was created.
  @_s.JsonKey(name: 'location')
  final ResourceLocation location;

  /// The name of the static IP (e.g., <code>StaticIP-Ohio-EXAMPLE</code>).
  @_s.JsonKey(name: 'name')
  final String name;

  /// The resource type (usually <code>StaticIp</code>).
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  /// The support code. Include this code in your email to support when you have
  /// questions about an instance or another resource in Lightsail. This code
  /// enables our support team to look up your Lightsail information more easily.
  @_s.JsonKey(name: 'supportCode')
  final String supportCode;

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
  factory StaticIp.fromJson(Map<String, dynamic> json) =>
      _$StaticIpFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopInstanceResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  StopInstanceResult({
    this.operations,
  });
  factory StopInstanceResult.fromJson(Map<String, dynamic> json) =>
      _$StopInstanceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopRelationalDatabaseResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  StopRelationalDatabaseResult({
    this.operations,
  });
  factory StopRelationalDatabaseResult.fromJson(Map<String, dynamic> json) =>
      _$StopRelationalDatabaseResultFromJson(json);
}

/// Describes a tag key and optional value assigned to an Amazon Lightsail
/// resource.
///
/// For more information about tags in Lightsail, see the <a
/// href="https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags">Lightsail
/// Dev Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key of the tag.
  ///
  /// Constraints: Tag keys accept a maximum of 128 letters, numbers, spaces in
  /// UTF-8, or the following characters: + - = . _ : / @
  @_s.JsonKey(name: 'key')
  final String key;

  /// The value of the tag.
  ///
  /// Constraints: Tag values accept a maximum of 256 letters, numbers, spaces in
  /// UTF-8, or the following characters: + - = . _ : / @
  @_s.JsonKey(name: 'value')
  final String value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  TagResourceResult({
    this.operations,
  });
  factory TagResourceResult.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestAlarmResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  TestAlarmResult({
    this.operations,
  });
  factory TestAlarmResult.fromJson(Map<String, dynamic> json) =>
      _$TestAlarmResultFromJson(json);
}

enum TreatMissingData {
  @_s.JsonValue('breaching')
  breaching,
  @_s.JsonValue('notBreaching')
  notBreaching,
  @_s.JsonValue('ignore')
  ignore,
  @_s.JsonValue('missing')
  missing,
}

extension on TreatMissingData {
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
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UnpeerVpcResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operation')
  final Operation operation;

  UnpeerVpcResult({
    this.operation,
  });
  factory UnpeerVpcResult.fromJson(Map<String, dynamic> json) =>
      _$UnpeerVpcResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  UntagResourceResult({
    this.operations,
  });
  factory UntagResourceResult.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateContainerServiceResult {
  /// An object that describes a container service.
  @_s.JsonKey(name: 'containerService')
  final ContainerService containerService;

  UpdateContainerServiceResult({
    this.containerService,
  });
  factory UpdateContainerServiceResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateContainerServiceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDistributionBundleResult {
  @_s.JsonKey(name: 'operation')
  final Operation operation;

  UpdateDistributionBundleResult({
    this.operation,
  });
  factory UpdateDistributionBundleResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateDistributionBundleResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDistributionResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operation')
  final Operation operation;

  UpdateDistributionResult({
    this.operation,
  });
  factory UpdateDistributionResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateDistributionResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDomainEntryResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  UpdateDomainEntryResult({
    this.operations,
  });
  factory UpdateDomainEntryResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateDomainEntryResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateLoadBalancerAttributeResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  UpdateLoadBalancerAttributeResult({
    this.operations,
  });
  factory UpdateLoadBalancerAttributeResult.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateLoadBalancerAttributeResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRelationalDatabaseParametersResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  UpdateRelationalDatabaseParametersResult({
    this.operations,
  });
  factory UpdateRelationalDatabaseParametersResult.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateRelationalDatabaseParametersResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRelationalDatabaseResult {
  /// An array of objects that describe the result of the action, such as the
  /// status of the request, the timestamp of the request, and the resources
  /// affected by the request.
  @_s.JsonKey(name: 'operations')
  final List<Operation> operations;

  UpdateRelationalDatabaseResult({
    this.operations,
  });
  factory UpdateRelationalDatabaseResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateRelationalDatabaseResultFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AccountSetupInProgressException extends _s.GenericAwsException {
  AccountSetupInProgressException({String type, String message})
      : super(
            type: type,
            code: 'AccountSetupInProgressException',
            message: message);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String type, String message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class OperationFailureException extends _s.GenericAwsException {
  OperationFailureException({String type, String message})
      : super(type: type, code: 'OperationFailureException', message: message);
}

class ServiceException extends _s.GenericAwsException {
  ServiceException({String type, String message})
      : super(type: type, code: 'ServiceException', message: message);
}

class UnauthenticatedException extends _s.GenericAwsException {
  UnauthenticatedException({String type, String message})
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

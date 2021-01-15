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

part '2016-06-30.g.dart';

/// AWS Snow Family is a petabyte-scale data transport solution that uses secure
/// devices to transfer large amounts of data between your on-premises data
/// centers and Amazon Simple Storage Service (Amazon S3). The Snow commands
/// described here provide access to the same functionality that is available in
/// the AWS Snow Family Management Console, which enables you to create and
/// manage jobs for a Snow device. To transfer data locally with a Snow device,
/// you'll need to use the Snowball Edge client or the Amazon S3 API Interface
/// for Snowball or AWS OpsHub for Snow Family. For more information, see the <a
/// href="https://docs.aws.amazon.com/AWSImportExport/latest/ug/api-reference.html">User
/// Guide</a>.
class Snowball {
  final _s.JsonProtocol _protocol;
  Snowball({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'snowball',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Cancels a cluster job. You can only cancel a cluster job while it's in the
  /// <code>AwaitingQuorum</code> status. You'll have at least an hour after
  /// creating a cluster job to cancel it.
  ///
  /// May throw [KMSRequestFailedException].
  /// May throw [InvalidJobStateException].
  /// May throw [InvalidResourceException].
  ///
  /// Parameter [clusterId] :
  /// The 39-character ID for the cluster that you want to cancel, for example
  /// <code>CID123e4567-e89b-12d3-a456-426655440000</code>.
  Future<void> cancelCluster({
    @_s.required String clusterId,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
    _s.validateStringLength(
      'clusterId',
      clusterId,
      39,
      39,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clusterId',
      clusterId,
      r'''CID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.CancelCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
      },
    );

    return CancelClusterResult.fromJson(jsonResponse.body);
  }

  /// Cancels the specified job. You can only cancel a job before its
  /// <code>JobState</code> value changes to <code>PreparingAppliance</code>.
  /// Requesting the <code>ListJobs</code> or <code>DescribeJob</code> action
  /// returns a job's <code>JobState</code> as part of the response element data
  /// returned.
  ///
  /// May throw [InvalidResourceException].
  /// May throw [InvalidJobStateException].
  /// May throw [KMSRequestFailedException].
  ///
  /// Parameter [jobId] :
  /// The 39-character job ID for the job that you want to cancel, for example
  /// <code>JID123e4567-e89b-12d3-a456-426655440000</code>.
  Future<void> cancelJob({
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      39,
      39,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''(M|J)ID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.CancelJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return CancelJobResult.fromJson(jsonResponse.body);
  }

  /// Creates an address for a Snow device to be shipped to. In most regions,
  /// addresses are validated at the time of creation. The address you provide
  /// must be located within the serviceable area of your region. If the address
  /// is invalid or unsupported, then an exception is thrown.
  ///
  /// May throw [InvalidAddressException].
  /// May throw [UnsupportedAddressException].
  ///
  /// Parameter [address] :
  /// The address that you want the Snow device shipped to.
  Future<CreateAddressResult> createAddress({
    @_s.required Address address,
  }) async {
    ArgumentError.checkNotNull(address, 'address');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.CreateAddress'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Address': address,
      },
    );

    return CreateAddressResult.fromJson(jsonResponse.body);
  }

  /// Creates an empty cluster. Each cluster supports five nodes. You use the
  /// <a>CreateJob</a> action separately to create the jobs for each of these
  /// nodes. The cluster does not ship until these five node jobs have been
  /// created.
  ///
  /// May throw [InvalidResourceException].
  /// May throw [KMSRequestFailedException].
  /// May throw [InvalidInputCombinationException].
  /// May throw [Ec2RequestFailedException].
  ///
  /// Parameter [addressId] :
  /// The ID for the address that you want the cluster shipped to.
  ///
  /// Parameter [jobType] :
  /// The type of job for this cluster. Currently, the only job type supported
  /// for clusters is <code>LOCAL_USE</code>.
  ///
  /// Parameter [resources] :
  /// The resources associated with the cluster job. These resources include
  /// Amazon S3 buckets and optional AWS Lambda functions written in the Python
  /// language.
  ///
  /// Parameter [roleARN] :
  /// The <code>RoleARN</code> that you want to associate with this cluster.
  /// <code>RoleArn</code> values are created by using the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html">CreateRole</a>
  /// API action in AWS Identity and Access Management (IAM).
  ///
  /// Parameter [shippingOption] :
  /// The shipping speed for each node in this cluster. This speed doesn't
  /// dictate how soon you'll get each Snowball Edge device, rather it
  /// represents how quickly each device moves to its destination while in
  /// transit. Regional shipping speeds are as follows:
  ///
  /// <ul>
  /// <li>
  /// In Australia, you have access to express shipping. Typically, Snow devices
  /// shipped express are delivered in about a day.
  /// </li>
  /// <li>
  /// In the European Union (EU), you have access to express shipping.
  /// Typically, Snow devices shipped express are delivered in about a day. In
  /// addition, most countries in the EU have access to standard shipping, which
  /// typically takes less than a week, one way.
  /// </li>
  /// <li>
  /// In India, Snow device are delivered in one to seven days.
  /// </li>
  /// <li>
  /// In the United States of America (US), you have access to one-day shipping
  /// and two-day shipping.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// In Australia, you have access to express shipping. Typically, devices
  /// shipped express are delivered in about a day.
  /// </li>
  /// <li>
  /// In the European Union (EU), you have access to express shipping.
  /// Typically, Snow devices shipped express are delivered in about a day. In
  /// addition, most countries in the EU have access to standard shipping, which
  /// typically takes less than a week, one way.
  /// </li>
  /// <li>
  /// In India, Snow device are delivered in one to seven days.
  /// </li>
  /// <li>
  /// In the US, you have access to one-day shipping and two-day shipping.
  /// </li>
  /// </ul>
  ///
  /// Parameter [description] :
  /// An optional description of this specific cluster, for example
  /// <code>Environmental Data Cluster-01</code>.
  ///
  /// Parameter [forwardingAddressId] :
  /// The forwarding address ID for a cluster. This field is not supported in
  /// most regions.
  ///
  /// Parameter [kmsKeyARN] :
  /// The <code>KmsKeyARN</code> value that you want to associate with this
  /// cluster. <code>KmsKeyARN</code> values are created by using the <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html">CreateKey</a>
  /// API action in AWS Key Management Service (AWS KMS).
  ///
  /// Parameter [notification] :
  /// The Amazon Simple Notification Service (Amazon SNS) notification settings
  /// for this cluster.
  ///
  /// Parameter [snowballType] :
  /// The type of AWS Snow Family device to use for this cluster.
  /// <note>
  /// For cluster jobs, AWS Snow Family currently supports only the
  /// <code>EDGE</code> device type.
  /// </note>
  ///
  /// Parameter [taxDocuments] :
  /// The tax documents required in your AWS Region.
  Future<CreateClusterResult> createCluster({
    @_s.required String addressId,
    @_s.required JobType jobType,
    @_s.required JobResource resources,
    @_s.required String roleARN,
    @_s.required ShippingOption shippingOption,
    String description,
    String forwardingAddressId,
    String kmsKeyARN,
    Notification notification,
    SnowballType snowballType,
    TaxDocuments taxDocuments,
  }) async {
    ArgumentError.checkNotNull(addressId, 'addressId');
    _s.validateStringLength(
      'addressId',
      addressId,
      40,
      40,
      isRequired: true,
    );
    _s.validateStringPattern(
      'addressId',
      addressId,
      r'''ADID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobType, 'jobType');
    ArgumentError.checkNotNull(resources, 'resources');
    ArgumentError.checkNotNull(roleARN, 'roleARN');
    _s.validateStringLength(
      'roleARN',
      roleARN,
      0,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleARN',
      roleARN,
      r'''arn:aws.*:iam::[0-9]{12}:role/.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(shippingOption, 'shippingOption');
    _s.validateStringLength(
      'description',
      description,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'forwardingAddressId',
      forwardingAddressId,
      40,
      40,
    );
    _s.validateStringPattern(
      'forwardingAddressId',
      forwardingAddressId,
      r'''ADID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
    );
    _s.validateStringLength(
      'kmsKeyARN',
      kmsKeyARN,
      0,
      255,
    );
    _s.validateStringPattern(
      'kmsKeyARN',
      kmsKeyARN,
      r'''arn:aws.*:kms:.*:[0-9]{12}:key/.*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.CreateCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddressId': addressId,
        'JobType': jobType?.toValue() ?? '',
        'Resources': resources,
        'RoleARN': roleARN,
        'ShippingOption': shippingOption?.toValue() ?? '',
        if (description != null) 'Description': description,
        if (forwardingAddressId != null)
          'ForwardingAddressId': forwardingAddressId,
        if (kmsKeyARN != null) 'KmsKeyARN': kmsKeyARN,
        if (notification != null) 'Notification': notification,
        if (snowballType != null) 'SnowballType': snowballType.toValue(),
        if (taxDocuments != null) 'TaxDocuments': taxDocuments,
      },
    );

    return CreateClusterResult.fromJson(jsonResponse.body);
  }

  /// Creates a job to import or export data between Amazon S3 and your
  /// on-premises data center. Your AWS account must have the right trust
  /// policies and permissions in place to create a job for a Snow device. If
  /// you're creating a job for a node in a cluster, you only need to provide
  /// the <code>clusterId</code> value; the other job attributes are inherited
  /// from the cluster.
  ///
  /// May throw [InvalidResourceException].
  /// May throw [KMSRequestFailedException].
  /// May throw [InvalidInputCombinationException].
  /// May throw [ClusterLimitExceededException].
  /// May throw [Ec2RequestFailedException].
  ///
  /// Parameter [addressId] :
  /// The ID for the address that you want the Snow device shipped to.
  ///
  /// Parameter [clusterId] :
  /// The ID of a cluster. If you're creating a job for a node in a cluster, you
  /// need to provide only this <code>clusterId</code> value. The other job
  /// attributes are inherited from the cluster.
  ///
  /// Parameter [description] :
  /// Defines an optional description of this specific job, for example
  /// <code>Important Photos 2016-08-11</code>.
  ///
  /// Parameter [deviceConfiguration] :
  /// Defines the device configuration for an AWS Snowcone job.
  ///
  /// Parameter [forwardingAddressId] :
  /// The forwarding address ID for a job. This field is not supported in most
  /// regions.
  ///
  /// Parameter [jobType] :
  /// Defines the type of job that you're creating.
  ///
  /// Parameter [kmsKeyARN] :
  /// The <code>KmsKeyARN</code> that you want to associate with this job.
  /// <code>KmsKeyARN</code>s are created using the <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html">CreateKey</a>
  /// AWS Key Management Service (KMS) API action.
  ///
  /// Parameter [notification] :
  /// Defines the Amazon Simple Notification Service (Amazon SNS) notification
  /// settings for this job.
  ///
  /// Parameter [resources] :
  /// Defines the Amazon S3 buckets associated with this job.
  ///
  /// With <code>IMPORT</code> jobs, you specify the bucket or buckets that your
  /// transferred data will be imported into.
  ///
  /// With <code>EXPORT</code> jobs, you specify the bucket or buckets that your
  /// transferred data will be exported from. Optionally, you can also specify a
  /// <code>KeyRange</code> value. If you choose to export a range, you define
  /// the length of the range by providing either an inclusive
  /// <code>BeginMarker</code> value, an inclusive <code>EndMarker</code> value,
  /// or both. Ranges are UTF-8 binary sorted.
  ///
  /// Parameter [roleARN] :
  /// The <code>RoleARN</code> that you want to associate with this job.
  /// <code>RoleArn</code>s are created using the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html">CreateRole</a>
  /// AWS Identity and Access Management (IAM) API action.
  ///
  /// Parameter [shippingOption] :
  /// The shipping speed for this job. This speed doesn't dictate how soon
  /// you'll get the Snow device, rather it represents how quickly the Snow
  /// device moves to its destination while in transit. Regional shipping speeds
  /// are as follows:
  ///
  /// <ul>
  /// <li>
  /// In Australia, you have access to express shipping. Typically, Snow devices
  /// shipped express are delivered in about a day.
  /// </li>
  /// <li>
  /// In the European Union (EU), you have access to express shipping.
  /// Typically, Snow devices shipped express are delivered in about a day. In
  /// addition, most countries in the EU have access to standard shipping, which
  /// typically takes less than a week, one way.
  /// </li>
  /// <li>
  /// In India, Snow devices are delivered in one to seven days.
  /// </li>
  /// <li>
  /// In the US, you have access to one-day shipping and two-day shipping.
  /// </li>
  /// </ul>
  ///
  /// Parameter [snowballCapacityPreference] :
  /// If your job is being created in one of the US regions, you have the option
  /// of specifying what size Snow device you'd like for this job. In all other
  /// regions, Snowballs come with 80 TB in storage capacity.
  ///
  /// Parameter [snowballType] :
  /// The type of AWS Snow Family device to use for this job.
  /// <note>
  /// For cluster jobs, AWS Snow Family currently supports only the
  /// <code>EDGE</code> device type.
  /// </note>
  /// The type of AWS Snow device to use for this job. Currently, the only
  /// supported device type for cluster jobs is <code>EDGE</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/snowball/latest/developer-guide/device-differences.html">Snowball
  /// Edge Device Options</a> in the Snowball Edge Developer Guide.
  ///
  /// Parameter [taxDocuments] :
  /// The tax documents required in your AWS Region.
  Future<CreateJobResult> createJob({
    String addressId,
    String clusterId,
    String description,
    DeviceConfiguration deviceConfiguration,
    String forwardingAddressId,
    JobType jobType,
    String kmsKeyARN,
    Notification notification,
    JobResource resources,
    String roleARN,
    ShippingOption shippingOption,
    SnowballCapacity snowballCapacityPreference,
    SnowballType snowballType,
    TaxDocuments taxDocuments,
  }) async {
    _s.validateStringLength(
      'addressId',
      addressId,
      40,
      40,
    );
    _s.validateStringPattern(
      'addressId',
      addressId,
      r'''ADID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
    );
    _s.validateStringLength(
      'clusterId',
      clusterId,
      39,
      39,
    );
    _s.validateStringPattern(
      'clusterId',
      clusterId,
      r'''CID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'forwardingAddressId',
      forwardingAddressId,
      40,
      40,
    );
    _s.validateStringPattern(
      'forwardingAddressId',
      forwardingAddressId,
      r'''ADID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
    );
    _s.validateStringLength(
      'kmsKeyARN',
      kmsKeyARN,
      0,
      255,
    );
    _s.validateStringPattern(
      'kmsKeyARN',
      kmsKeyARN,
      r'''arn:aws.*:kms:.*:[0-9]{12}:key/.*''',
    );
    _s.validateStringLength(
      'roleARN',
      roleARN,
      0,
      255,
    );
    _s.validateStringPattern(
      'roleARN',
      roleARN,
      r'''arn:aws.*:iam::[0-9]{12}:role/.*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.CreateJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (addressId != null) 'AddressId': addressId,
        if (clusterId != null) 'ClusterId': clusterId,
        if (description != null) 'Description': description,
        if (deviceConfiguration != null)
          'DeviceConfiguration': deviceConfiguration,
        if (forwardingAddressId != null)
          'ForwardingAddressId': forwardingAddressId,
        if (jobType != null) 'JobType': jobType.toValue(),
        if (kmsKeyARN != null) 'KmsKeyARN': kmsKeyARN,
        if (notification != null) 'Notification': notification,
        if (resources != null) 'Resources': resources,
        if (roleARN != null) 'RoleARN': roleARN,
        if (shippingOption != null) 'ShippingOption': shippingOption.toValue(),
        if (snowballCapacityPreference != null)
          'SnowballCapacityPreference': snowballCapacityPreference.toValue(),
        if (snowballType != null) 'SnowballType': snowballType.toValue(),
        if (taxDocuments != null) 'TaxDocuments': taxDocuments,
      },
    );

    return CreateJobResult.fromJson(jsonResponse.body);
  }

  /// Creates a shipping label that will be used to return the Snow device to
  /// AWS.
  ///
  /// May throw [InvalidResourceException].
  /// May throw [InvalidJobStateException].
  /// May throw [InvalidInputCombinationException].
  /// May throw [ConflictException].
  /// May throw [ReturnShippingLabelAlreadyExistsException].
  ///
  /// Parameter [jobId] :
  /// The ID for a job that you want to create the return shipping label for.
  /// For example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.
  ///
  /// Parameter [shippingOption] :
  /// The shipping speed for a particular job. This speed doesn't dictate how
  /// soon the device is returned to AWS. This speed represents how quickly it
  /// moves to its destination while in transit. Regional shipping speeds are as
  /// follows:
  Future<CreateReturnShippingLabelResult> createReturnShippingLabel({
    @_s.required String jobId,
    ShippingOption shippingOption,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      39,
      39,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''(M|J)ID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSIESnowballJobManagementService.CreateReturnShippingLabel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        if (shippingOption != null) 'ShippingOption': shippingOption.toValue(),
      },
    );

    return CreateReturnShippingLabelResult.fromJson(jsonResponse.body);
  }

  /// Takes an <code>AddressId</code> and returns specific details about that
  /// address in the form of an <code>Address</code> object.
  ///
  /// May throw [InvalidResourceException].
  ///
  /// Parameter [addressId] :
  /// The automatically generated ID for a specific address.
  Future<DescribeAddressResult> describeAddress({
    @_s.required String addressId,
  }) async {
    ArgumentError.checkNotNull(addressId, 'addressId');
    _s.validateStringLength(
      'addressId',
      addressId,
      40,
      40,
      isRequired: true,
    );
    _s.validateStringPattern(
      'addressId',
      addressId,
      r'''ADID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.DescribeAddress'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AddressId': addressId,
      },
    );

    return DescribeAddressResult.fromJson(jsonResponse.body);
  }

  /// Returns a specified number of <code>ADDRESS</code> objects. Calling this
  /// API in one of the US regions will return addresses from the list of all
  /// addresses associated with this account in all US regions.
  ///
  /// May throw [InvalidResourceException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The number of <code>ADDRESS</code> objects to return.
  ///
  /// Parameter [nextToken] :
  /// HTTP requests are stateless. To identify what object comes "next" in the
  /// list of <code>ADDRESS</code> objects, you have the option of specifying a
  /// value for <code>NextToken</code> as the starting point for your list of
  /// returned addresses.
  Future<DescribeAddressesResult> describeAddresses({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.DescribeAddresses'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeAddressesResult.fromJson(jsonResponse.body);
  }

  /// Returns information about a specific cluster including shipping
  /// information, cluster status, and other important metadata.
  ///
  /// May throw [InvalidResourceException].
  ///
  /// Parameter [clusterId] :
  /// The automatically generated ID for a cluster.
  Future<DescribeClusterResult> describeCluster({
    @_s.required String clusterId,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
    _s.validateStringLength(
      'clusterId',
      clusterId,
      39,
      39,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clusterId',
      clusterId,
      r'''CID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.DescribeCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
      },
    );

    return DescribeClusterResult.fromJson(jsonResponse.body);
  }

  /// Returns information about a specific job including shipping information,
  /// job status, and other important metadata.
  ///
  /// May throw [InvalidResourceException].
  ///
  /// Parameter [jobId] :
  /// The automatically generated ID for a job, for example
  /// <code>JID123e4567-e89b-12d3-a456-426655440000</code>.
  Future<DescribeJobResult> describeJob({
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      39,
      39,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''(M|J)ID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.DescribeJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return DescribeJobResult.fromJson(jsonResponse.body);
  }

  /// Information on the shipping label of a Snow device that is being returned
  /// to AWS.
  ///
  /// May throw [InvalidResourceException].
  /// May throw [InvalidJobStateException].
  /// May throw [ConflictException].
  ///
  /// Parameter [jobId] :
  /// The automatically generated ID for a job, for example
  /// <code>JID123e4567-e89b-12d3-a456-426655440000</code>.
  Future<DescribeReturnShippingLabelResult> describeReturnShippingLabel({
    String jobId,
  }) async {
    _s.validateStringLength(
      'jobId',
      jobId,
      39,
      39,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''(M|J)ID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSIESnowballJobManagementService.DescribeReturnShippingLabel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (jobId != null) 'JobId': jobId,
      },
    );

    return DescribeReturnShippingLabelResult.fromJson(jsonResponse.body);
  }

  /// Returns a link to an Amazon S3 presigned URL for the manifest file
  /// associated with the specified <code>JobId</code> value. You can access the
  /// manifest file for up to 60 minutes after this request has been made. To
  /// access the manifest file after 60 minutes have passed, you'll have to make
  /// another call to the <code>GetJobManifest</code> action.
  ///
  /// The manifest is an encrypted file that you can download after your job
  /// enters the <code>WithCustomer</code> status. The manifest is decrypted by
  /// using the <code>UnlockCode</code> code value, when you pass both values to
  /// the Snow device through the Snowball client when the client is started for
  /// the first time.
  ///
  /// As a best practice, we recommend that you don't save a copy of an
  /// <code>UnlockCode</code> value in the same location as the manifest file
  /// for that job. Saving these separately helps prevent unauthorized parties
  /// from gaining access to the Snow device associated with that job.
  ///
  /// The credentials of a given job, including its manifest file and unlock
  /// code, expire 90 days after the job is created.
  ///
  /// May throw [InvalidResourceException].
  /// May throw [InvalidJobStateException].
  ///
  /// Parameter [jobId] :
  /// The ID for a job that you want to get the manifest file for, for example
  /// <code>JID123e4567-e89b-12d3-a456-426655440000</code>.
  Future<GetJobManifestResult> getJobManifest({
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      39,
      39,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''(M|J)ID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.GetJobManifest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return GetJobManifestResult.fromJson(jsonResponse.body);
  }

  /// Returns the <code>UnlockCode</code> code value for the specified job. A
  /// particular <code>UnlockCode</code> value can be accessed for up to 90 days
  /// after the associated job has been created.
  ///
  /// The <code>UnlockCode</code> value is a 29-character code with 25
  /// alphanumeric characters and 4 hyphens. This code is used to decrypt the
  /// manifest file when it is passed along with the manifest to the Snow device
  /// through the Snowball client when the client is started for the first time.
  ///
  /// As a best practice, we recommend that you don't save a copy of the
  /// <code>UnlockCode</code> in the same location as the manifest file for that
  /// job. Saving these separately helps prevent unauthorized parties from
  /// gaining access to the Snow device associated with that job.
  ///
  /// May throw [InvalidResourceException].
  /// May throw [InvalidJobStateException].
  ///
  /// Parameter [jobId] :
  /// The ID for the job that you want to get the <code>UnlockCode</code> value
  /// for, for example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.
  Future<GetJobUnlockCodeResult> getJobUnlockCode({
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      39,
      39,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''(M|J)ID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.GetJobUnlockCode'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return GetJobUnlockCodeResult.fromJson(jsonResponse.body);
  }

  /// Returns information about the Snow Family service limit for your account,
  /// and also the number of Snow devices your account has in use.
  ///
  /// The default service limit for the number of Snow devices that you can have
  /// at one time is 1. If you want to increase your service limit, contact AWS
  /// Support.
  Future<GetSnowballUsageResult> getSnowballUsage() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.GetSnowballUsage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetSnowballUsageResult.fromJson(jsonResponse.body);
  }

  /// Returns an Amazon S3 presigned URL for an update file associated with a
  /// specified <code>JobId</code>.
  ///
  /// May throw [InvalidResourceException].
  /// May throw [InvalidJobStateException].
  ///
  /// Parameter [jobId] :
  /// The ID for a job that you want to get the software update file for, for
  /// example <code>JID123e4567-e89b-12d3-a456-426655440000</code>.
  Future<GetSoftwareUpdatesResult> getSoftwareUpdates({
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      39,
      39,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''(M|J)ID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.GetSoftwareUpdates'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );

    return GetSoftwareUpdatesResult.fromJson(jsonResponse.body);
  }

  /// Returns an array of <code>JobListEntry</code> objects of the specified
  /// length. Each <code>JobListEntry</code> object is for a job in the
  /// specified cluster and contains a job's state, a job's ID, and other
  /// information.
  ///
  /// May throw [InvalidResourceException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [clusterId] :
  /// The 39-character ID for the cluster that you want to list, for example
  /// <code>CID123e4567-e89b-12d3-a456-426655440000</code>.
  ///
  /// Parameter [maxResults] :
  /// The number of <code>JobListEntry</code> objects to return.
  ///
  /// Parameter [nextToken] :
  /// HTTP requests are stateless. To identify what object comes "next" in the
  /// list of <code>JobListEntry</code> objects, you have the option of
  /// specifying <code>NextToken</code> as the starting point for your returned
  /// list.
  Future<ListClusterJobsResult> listClusterJobs({
    @_s.required String clusterId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
    _s.validateStringLength(
      'clusterId',
      clusterId,
      39,
      39,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clusterId',
      clusterId,
      r'''CID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.ListClusterJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListClusterJobsResult.fromJson(jsonResponse.body);
  }

  /// Returns an array of <code>ClusterListEntry</code> objects of the specified
  /// length. Each <code>ClusterListEntry</code> object contains a cluster's
  /// state, a cluster's ID, and other important status information.
  ///
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The number of <code>ClusterListEntry</code> objects to return.
  ///
  /// Parameter [nextToken] :
  /// HTTP requests are stateless. To identify what object comes "next" in the
  /// list of <code>ClusterListEntry</code> objects, you have the option of
  /// specifying <code>NextToken</code> as the starting point for your returned
  /// list.
  Future<ListClustersResult> listClusters({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.ListClusters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListClustersResult.fromJson(jsonResponse.body);
  }

  /// This action returns a list of the different Amazon EC2 Amazon Machine
  /// Images (AMIs) that are owned by your AWS account that would be supported
  /// for use on a Snow device. Currently, supported AMIs are based on the
  /// CentOS 7 (x86_64) - with Updates HVM, Ubuntu Server 14.04 LTS (HVM), and
  /// Ubuntu 16.04 LTS - Xenial (HVM) images, available on the AWS Marketplace.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [Ec2RequestFailedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results for the list of compatible images.
  /// Currently, a Snowball Edge device can store 10 AMIs.
  ///
  /// Parameter [nextToken] :
  /// HTTP requests are stateless. To identify what object comes "next" in the
  /// list of compatible images, you can specify a value for
  /// <code>NextToken</code> as the starting point for your list of returned
  /// images.
  Future<ListCompatibleImagesResult> listCompatibleImages({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.ListCompatibleImages'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListCompatibleImagesResult.fromJson(jsonResponse.body);
  }

  /// Returns an array of <code>JobListEntry</code> objects of the specified
  /// length. Each <code>JobListEntry</code> object contains a job's state, a
  /// job's ID, and a value that indicates whether the job is a job part, in the
  /// case of export jobs. Calling this API action in one of the US regions will
  /// return jobs from the list of all jobs associated with this account in all
  /// US regions.
  ///
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The number of <code>JobListEntry</code> objects to return.
  ///
  /// Parameter [nextToken] :
  /// HTTP requests are stateless. To identify what object comes "next" in the
  /// list of <code>JobListEntry</code> objects, you have the option of
  /// specifying <code>NextToken</code> as the starting point for your returned
  /// list.
  Future<ListJobsResult> listJobs({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.ListJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListJobsResult.fromJson(jsonResponse.body);
  }

  /// While a cluster's <code>ClusterState</code> value is in the
  /// <code>AwaitingQuorum</code> state, you can update some of the information
  /// associated with a cluster. Once the cluster changes to a different job
  /// state, usually 60 minutes after the cluster being created, this action is
  /// no longer available.
  ///
  /// May throw [InvalidResourceException].
  /// May throw [InvalidJobStateException].
  /// May throw [KMSRequestFailedException].
  /// May throw [InvalidInputCombinationException].
  /// May throw [Ec2RequestFailedException].
  ///
  /// Parameter [clusterId] :
  /// The cluster ID of the cluster that you want to update, for example
  /// <code>CID123e4567-e89b-12d3-a456-426655440000</code>.
  ///
  /// Parameter [addressId] :
  /// The ID of the updated <a>Address</a> object.
  ///
  /// Parameter [description] :
  /// The updated description of this cluster.
  ///
  /// Parameter [forwardingAddressId] :
  /// The updated ID for the forwarding address for a cluster. This field is not
  /// supported in most regions.
  ///
  /// Parameter [notification] :
  /// The new or updated <a>Notification</a> object.
  ///
  /// Parameter [resources] :
  /// The updated arrays of <a>JobResource</a> objects that can include updated
  /// <a>S3Resource</a> objects or <a>LambdaResource</a> objects.
  ///
  /// Parameter [roleARN] :
  /// The new role Amazon Resource Name (ARN) that you want to associate with
  /// this cluster. To create a role ARN, use the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html">CreateRole</a>
  /// API action in AWS Identity and Access Management (IAM).
  ///
  /// Parameter [shippingOption] :
  /// The updated shipping option value of this cluster's <a>ShippingDetails</a>
  /// object.
  Future<void> updateCluster({
    @_s.required String clusterId,
    String addressId,
    String description,
    String forwardingAddressId,
    Notification notification,
    JobResource resources,
    String roleARN,
    ShippingOption shippingOption,
  }) async {
    ArgumentError.checkNotNull(clusterId, 'clusterId');
    _s.validateStringLength(
      'clusterId',
      clusterId,
      39,
      39,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clusterId',
      clusterId,
      r'''CID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
      isRequired: true,
    );
    _s.validateStringLength(
      'addressId',
      addressId,
      40,
      40,
    );
    _s.validateStringPattern(
      'addressId',
      addressId,
      r'''ADID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'forwardingAddressId',
      forwardingAddressId,
      40,
      40,
    );
    _s.validateStringPattern(
      'forwardingAddressId',
      forwardingAddressId,
      r'''ADID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
    );
    _s.validateStringLength(
      'roleARN',
      roleARN,
      0,
      255,
    );
    _s.validateStringPattern(
      'roleARN',
      roleARN,
      r'''arn:aws.*:iam::[0-9]{12}:role/.*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.UpdateCluster'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
        if (addressId != null) 'AddressId': addressId,
        if (description != null) 'Description': description,
        if (forwardingAddressId != null)
          'ForwardingAddressId': forwardingAddressId,
        if (notification != null) 'Notification': notification,
        if (resources != null) 'Resources': resources,
        if (roleARN != null) 'RoleARN': roleARN,
        if (shippingOption != null) 'ShippingOption': shippingOption.toValue(),
      },
    );

    return UpdateClusterResult.fromJson(jsonResponse.body);
  }

  /// While a job's <code>JobState</code> value is <code>New</code>, you can
  /// update some of the information associated with a job. Once the job changes
  /// to a different job state, usually within 60 minutes of the job being
  /// created, this action is no longer available.
  ///
  /// May throw [InvalidResourceException].
  /// May throw [InvalidJobStateException].
  /// May throw [KMSRequestFailedException].
  /// May throw [InvalidInputCombinationException].
  /// May throw [ClusterLimitExceededException].
  /// May throw [Ec2RequestFailedException].
  ///
  /// Parameter [jobId] :
  /// The job ID of the job that you want to update, for example
  /// <code>JID123e4567-e89b-12d3-a456-426655440000</code>.
  ///
  /// Parameter [addressId] :
  /// The ID of the updated <a>Address</a> object.
  ///
  /// Parameter [description] :
  /// The updated description of this job's <a>JobMetadata</a> object.
  ///
  /// Parameter [forwardingAddressId] :
  /// The updated ID for the forwarding address for a job. This field is not
  /// supported in most regions.
  ///
  /// Parameter [notification] :
  /// The new or updated <a>Notification</a> object.
  ///
  /// Parameter [resources] :
  /// The updated <code>JobResource</code> object, or the updated
  /// <a>JobResource</a> object.
  ///
  /// Parameter [roleARN] :
  /// The new role Amazon Resource Name (ARN) that you want to associate with
  /// this job. To create a role ARN, use the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html">CreateRole</a>AWS
  /// Identity and Access Management (IAM) API action.
  ///
  /// Parameter [shippingOption] :
  /// The updated shipping option value of this job's <a>ShippingDetails</a>
  /// object.
  ///
  /// Parameter [snowballCapacityPreference] :
  /// The updated <code>SnowballCapacityPreference</code> of this job's
  /// <a>JobMetadata</a> object. The 50 TB Snowballs are only available in the
  /// US regions.
  Future<void> updateJob({
    @_s.required String jobId,
    String addressId,
    String description,
    String forwardingAddressId,
    Notification notification,
    JobResource resources,
    String roleARN,
    ShippingOption shippingOption,
    SnowballCapacity snowballCapacityPreference,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      39,
      39,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''(M|J)ID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
      isRequired: true,
    );
    _s.validateStringLength(
      'addressId',
      addressId,
      40,
      40,
    );
    _s.validateStringPattern(
      'addressId',
      addressId,
      r'''ADID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'forwardingAddressId',
      forwardingAddressId,
      40,
      40,
    );
    _s.validateStringPattern(
      'forwardingAddressId',
      forwardingAddressId,
      r'''ADID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
    );
    _s.validateStringLength(
      'roleARN',
      roleARN,
      0,
      255,
    );
    _s.validateStringPattern(
      'roleARN',
      roleARN,
      r'''arn:aws.*:iam::[0-9]{12}:role/.*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.UpdateJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        if (addressId != null) 'AddressId': addressId,
        if (description != null) 'Description': description,
        if (forwardingAddressId != null)
          'ForwardingAddressId': forwardingAddressId,
        if (notification != null) 'Notification': notification,
        if (resources != null) 'Resources': resources,
        if (roleARN != null) 'RoleARN': roleARN,
        if (shippingOption != null) 'ShippingOption': shippingOption.toValue(),
        if (snowballCapacityPreference != null)
          'SnowballCapacityPreference': snowballCapacityPreference.toValue(),
      },
    );

    return UpdateJobResult.fromJson(jsonResponse.body);
  }

  /// Updates the state when a the shipment states changes to a different state.
  ///
  /// May throw [InvalidResourceException].
  /// May throw [InvalidJobStateException].
  ///
  /// Parameter [jobId] :
  /// The job ID of the job whose shipment date you want to update, for example
  /// <code>JID123e4567-e89b-12d3-a456-426655440000</code>.
  ///
  /// Parameter [shipmentState] :
  /// The state of a device when it is being shipped.
  ///
  /// Set to <code>RECEIVED</code> when the device arrives at your location.
  ///
  /// Set to <code>RETURNED</code> when you have returned the device to AWS.
  Future<void> updateJobShipmentState({
    @_s.required String jobId,
    @_s.required ShipmentState shipmentState,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      39,
      39,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''(M|J)ID[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(shipmentState, 'shipmentState');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.UpdateJobShipmentState'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        'ShipmentState': shipmentState?.toValue() ?? '',
      },
    );

    return UpdateJobShipmentStateResult.fromJson(jsonResponse.body);
  }
}

/// The address that you want the Snow device(s) associated with a specific job
/// to be shipped to. Addresses are validated at the time of creation. The
/// address you provide must be located within the serviceable area of your
/// region. Although no individual elements of the <code>Address</code> are
/// required, if the address is invalid or unsupported, then an exception is
/// thrown.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Address {
  /// The unique ID for an address.
  @_s.JsonKey(name: 'AddressId')
  final String addressId;

  /// The city in an address that a Snow device is to be delivered to.
  @_s.JsonKey(name: 'City')
  final String city;

  /// The name of the company to receive a Snow device at an address.
  @_s.JsonKey(name: 'Company')
  final String company;

  /// The country in an address that a Snow device is to be delivered to.
  @_s.JsonKey(name: 'Country')
  final String country;

  /// If the address you are creating is a primary address, then set this option
  /// to true. This field is not supported in most regions.
  @_s.JsonKey(name: 'IsRestricted')
  final bool isRestricted;

  /// This field is no longer used and the value is ignored.
  @_s.JsonKey(name: 'Landmark')
  final String landmark;

  /// The name of a person to receive a Snow device at an address.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The phone number associated with an address that a Snow device is to be
  /// delivered to.
  @_s.JsonKey(name: 'PhoneNumber')
  final String phoneNumber;

  /// The postal code in an address that a Snow device is to be delivered to.
  @_s.JsonKey(name: 'PostalCode')
  final String postalCode;

  /// This field is no longer used and the value is ignored.
  @_s.JsonKey(name: 'PrefectureOrDistrict')
  final String prefectureOrDistrict;

  /// The state or province in an address that a Snow device is to be delivered
  /// to.
  @_s.JsonKey(name: 'StateOrProvince')
  final String stateOrProvince;

  /// The first line in a street address that a Snow device is to be delivered to.
  @_s.JsonKey(name: 'Street1')
  final String street1;

  /// The second line in a street address that a Snow device is to be delivered
  /// to.
  @_s.JsonKey(name: 'Street2')
  final String street2;

  /// The third line in a street address that a Snow device is to be delivered to.
  @_s.JsonKey(name: 'Street3')
  final String street3;

  Address({
    this.addressId,
    this.city,
    this.company,
    this.country,
    this.isRestricted,
    this.landmark,
    this.name,
    this.phoneNumber,
    this.postalCode,
    this.prefectureOrDistrict,
    this.stateOrProvince,
    this.street1,
    this.street2,
    this.street3,
  });
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelClusterResult {
  CancelClusterResult();
  factory CancelClusterResult.fromJson(Map<String, dynamic> json) =>
      _$CancelClusterResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelJobResult {
  CancelJobResult();
  factory CancelJobResult.fromJson(Map<String, dynamic> json) =>
      _$CancelJobResultFromJson(json);
}

/// Contains a cluster's state, a cluster's ID, and other important information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ClusterListEntry {
  /// The 39-character ID for the cluster that you want to list, for example
  /// <code>CID123e4567-e89b-12d3-a456-426655440000</code>.
  @_s.JsonKey(name: 'ClusterId')
  final String clusterId;

  /// The current state of this cluster. For information about the state of a
  /// specific node, see <a>JobListEntry$JobState</a>.
  @_s.JsonKey(name: 'ClusterState')
  final ClusterState clusterState;

  /// The creation date for this cluster.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// Defines an optional description of the cluster, for example
  /// <code>Environmental Data Cluster-01</code>.
  @_s.JsonKey(name: 'Description')
  final String description;

  ClusterListEntry({
    this.clusterId,
    this.clusterState,
    this.creationDate,
    this.description,
  });
  factory ClusterListEntry.fromJson(Map<String, dynamic> json) =>
      _$ClusterListEntryFromJson(json);
}

/// Contains metadata about a specific cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ClusterMetadata {
  /// The automatically generated ID for a specific address.
  @_s.JsonKey(name: 'AddressId')
  final String addressId;

  /// The automatically generated ID for a cluster.
  @_s.JsonKey(name: 'ClusterId')
  final String clusterId;

  /// The current status of the cluster.
  @_s.JsonKey(name: 'ClusterState')
  final ClusterState clusterState;

  /// The creation date for this cluster.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// The optional description of the cluster.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ID of the address that you want a cluster shipped to, after it will be
  /// shipped to its primary address. This field is not supported in most regions.
  @_s.JsonKey(name: 'ForwardingAddressId')
  final String forwardingAddressId;

  /// The type of job for this cluster. Currently, the only job type supported for
  /// clusters is <code>LOCAL_USE</code>.
  @_s.JsonKey(name: 'JobType')
  final JobType jobType;

  /// The <code>KmsKeyARN</code> Amazon Resource Name (ARN) associated with this
  /// cluster. This ARN was created using the <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html">CreateKey</a>
  /// API action in AWS Key Management Service (AWS KMS).
  @_s.JsonKey(name: 'KmsKeyARN')
  final String kmsKeyARN;

  /// The Amazon Simple Notification Service (Amazon SNS) notification settings
  /// for this cluster.
  @_s.JsonKey(name: 'Notification')
  final Notification notification;

  /// The arrays of <a>JobResource</a> objects that can include updated
  /// <a>S3Resource</a> objects or <a>LambdaResource</a> objects.
  @_s.JsonKey(name: 'Resources')
  final JobResource resources;

  /// The role ARN associated with this cluster. This ARN was created using the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html">CreateRole</a>
  /// API action in AWS Identity and Access Management (IAM).
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// The shipping speed for each node in this cluster. This speed doesn't dictate
  /// how soon you'll get each device, rather it represents how quickly each
  /// device moves to its destination while in transit. Regional shipping speeds
  /// are as follows:
  ///
  /// <ul>
  /// <li>
  /// In Australia, you have access to express shipping. Typically, devices
  /// shipped express are delivered in about a day.
  /// </li>
  /// <li>
  /// In the European Union (EU), you have access to express shipping. Typically,
  /// Snow devices shipped express are delivered in about a day. In addition, most
  /// countries in the EU have access to standard shipping, which typically takes
  /// less than a week, one way.
  /// </li>
  /// <li>
  /// In India, Snow devices are delivered in one to seven days.
  /// </li>
  /// <li>
  /// In the US, you have access to one-day shipping and two-day shipping.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ShippingOption')
  final ShippingOption shippingOption;

  /// The type of AWS Snow device to use for this cluster.
  /// <note>
  /// For cluster jobs, AWS Snow Family currently supports only the
  /// <code>EDGE</code> device type.
  /// </note>
  @_s.JsonKey(name: 'SnowballType')
  final SnowballType snowballType;

  /// The tax documents required in your AWS Region.
  @_s.JsonKey(name: 'TaxDocuments')
  final TaxDocuments taxDocuments;

  ClusterMetadata({
    this.addressId,
    this.clusterId,
    this.clusterState,
    this.creationDate,
    this.description,
    this.forwardingAddressId,
    this.jobType,
    this.kmsKeyARN,
    this.notification,
    this.resources,
    this.roleARN,
    this.shippingOption,
    this.snowballType,
    this.taxDocuments,
  });
  factory ClusterMetadata.fromJson(Map<String, dynamic> json) =>
      _$ClusterMetadataFromJson(json);
}

enum ClusterState {
  @_s.JsonValue('AwaitingQuorum')
  awaitingQuorum,
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('InUse')
  inUse,
  @_s.JsonValue('Complete')
  complete,
  @_s.JsonValue('Cancelled')
  cancelled,
}

/// A JSON-formatted object that describes a compatible Amazon Machine Image
/// (AMI), including the ID and name for a Snow device AMI. This AMI is
/// compatible with the device's physical hardware requirements, and it should
/// be able to be run in an SBE1 instance on the device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CompatibleImage {
  /// The unique identifier for an individual Snow device AMI.
  @_s.JsonKey(name: 'AmiId')
  final String amiId;

  /// The optional name of a compatible image.
  @_s.JsonKey(name: 'Name')
  final String name;

  CompatibleImage({
    this.amiId,
    this.name,
  });
  factory CompatibleImage.fromJson(Map<String, dynamic> json) =>
      _$CompatibleImageFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAddressResult {
  /// The automatically generated ID for a specific address. You'll use this ID
  /// when you create a job to specify which address you want the Snow device for
  /// that job shipped to.
  @_s.JsonKey(name: 'AddressId')
  final String addressId;

  CreateAddressResult({
    this.addressId,
  });
  factory CreateAddressResult.fromJson(Map<String, dynamic> json) =>
      _$CreateAddressResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateClusterResult {
  /// The automatically generated ID for a cluster.
  @_s.JsonKey(name: 'ClusterId')
  final String clusterId;

  CreateClusterResult({
    this.clusterId,
  });
  factory CreateClusterResult.fromJson(Map<String, dynamic> json) =>
      _$CreateClusterResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateJobResult {
  /// The automatically generated ID for a job, for example
  /// <code>JID123e4567-e89b-12d3-a456-426655440000</code>.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  CreateJobResult({
    this.jobId,
  });
  factory CreateJobResult.fromJson(Map<String, dynamic> json) =>
      _$CreateJobResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateReturnShippingLabelResult {
  /// The status information of the task on a Snow device that is being returned
  /// to AWS.
  @_s.JsonKey(name: 'Status')
  final ShippingLabelStatus status;

  CreateReturnShippingLabelResult({
    this.status,
  });
  factory CreateReturnShippingLabelResult.fromJson(Map<String, dynamic> json) =>
      _$CreateReturnShippingLabelResultFromJson(json);
}

/// Defines the real-time status of a Snow device's data transfer while the
/// device is at AWS. This data is only available while a job has a
/// <code>JobState</code> value of <code>InProgress</code>, for both import and
/// export jobs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataTransfer {
  /// The number of bytes transferred between a Snow device and Amazon S3.
  @_s.JsonKey(name: 'BytesTransferred')
  final int bytesTransferred;

  /// The number of objects transferred between a Snow device and Amazon S3.
  @_s.JsonKey(name: 'ObjectsTransferred')
  final int objectsTransferred;

  /// The total bytes of data for a transfer between a Snow device and Amazon S3.
  /// This value is set to 0 (zero) until all the keys that will be transferred
  /// have been listed.
  @_s.JsonKey(name: 'TotalBytes')
  final int totalBytes;

  /// The total number of objects for a transfer between a Snow device and Amazon
  /// S3. This value is set to 0 (zero) until all the keys that will be
  /// transferred have been listed.
  @_s.JsonKey(name: 'TotalObjects')
  final int totalObjects;

  DataTransfer({
    this.bytesTransferred,
    this.objectsTransferred,
    this.totalBytes,
    this.totalObjects,
  });
  factory DataTransfer.fromJson(Map<String, dynamic> json) =>
      _$DataTransferFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAddressResult {
  /// The address that you want the Snow device(s) associated with a specific job
  /// to be shipped to.
  @_s.JsonKey(name: 'Address')
  final Address address;

  DescribeAddressResult({
    this.address,
  });
  factory DescribeAddressResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeAddressResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAddressesResult {
  /// The Snow device shipping addresses that were created for this account.
  @_s.JsonKey(name: 'Addresses')
  final List<Address> addresses;

  /// HTTP requests are stateless. If you use the automatically generated
  /// <code>NextToken</code> value in your next <code>DescribeAddresses</code>
  /// call, your list of returned addresses will start from this point in the
  /// array.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  DescribeAddressesResult({
    this.addresses,
    this.nextToken,
  });
  factory DescribeAddressesResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeAddressesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeClusterResult {
  /// Information about a specific cluster, including shipping information,
  /// cluster status, and other important metadata.
  @_s.JsonKey(name: 'ClusterMetadata')
  final ClusterMetadata clusterMetadata;

  DescribeClusterResult({
    this.clusterMetadata,
  });
  factory DescribeClusterResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeClusterResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeJobResult {
  /// Information about a specific job, including shipping information, job
  /// status, and other important metadata.
  @_s.JsonKey(name: 'JobMetadata')
  final JobMetadata jobMetadata;

  /// Information about a specific job part (in the case of an export job),
  /// including shipping information, job status, and other important metadata.
  @_s.JsonKey(name: 'SubJobMetadata')
  final List<JobMetadata> subJobMetadata;

  DescribeJobResult({
    this.jobMetadata,
    this.subJobMetadata,
  });
  factory DescribeJobResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeJobResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeReturnShippingLabelResult {
  /// The expiration date of the current return shipping label.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExpirationDate')
  final DateTime expirationDate;

  /// The status information of the task on a Snow device that is being returned
  /// to AWS.
  @_s.JsonKey(name: 'Status')
  final ShippingLabelStatus status;

  DescribeReturnShippingLabelResult({
    this.expirationDate,
    this.status,
  });
  factory DescribeReturnShippingLabelResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeReturnShippingLabelResultFromJson(json);
}

/// The container for <code>SnowconeDeviceConfiguration</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeviceConfiguration {
  /// Returns information about the device configuration for an AWS Snowcone job.
  @_s.JsonKey(name: 'SnowconeDeviceConfiguration')
  final SnowconeDeviceConfiguration snowconeDeviceConfiguration;

  DeviceConfiguration({
    this.snowconeDeviceConfiguration,
  });
  factory DeviceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$DeviceConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceConfigurationToJson(this);
}

/// A JSON-formatted object that contains the IDs for an Amazon Machine Image
/// (AMI), including the Amazon EC2 AMI ID and the Snow device AMI ID. Each AMI
/// has these two IDs to simplify identifying the AMI in both the AWS Cloud and
/// on the device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Ec2AmiResource {
  /// The ID of the AMI in Amazon EC2.
  @_s.JsonKey(name: 'AmiId')
  final String amiId;

  /// The ID of the AMI on the Snow device.
  @_s.JsonKey(name: 'SnowballAmiId')
  final String snowballAmiId;

  Ec2AmiResource({
    @_s.required this.amiId,
    this.snowballAmiId,
  });
  factory Ec2AmiResource.fromJson(Map<String, dynamic> json) =>
      _$Ec2AmiResourceFromJson(json);

  Map<String, dynamic> toJson() => _$Ec2AmiResourceToJson(this);
}

/// The container for the <a>EventTriggerDefinition$EventResourceARN</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EventTriggerDefinition {
  /// The Amazon Resource Name (ARN) for any local Amazon S3 resource that is an
  /// AWS Lambda function's event trigger associated with this job.
  @_s.JsonKey(name: 'EventResourceARN')
  final String eventResourceARN;

  EventTriggerDefinition({
    this.eventResourceARN,
  });
  factory EventTriggerDefinition.fromJson(Map<String, dynamic> json) =>
      _$EventTriggerDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$EventTriggerDefinitionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetJobManifestResult {
  /// The Amazon S3 presigned URL for the manifest file associated with the
  /// specified <code>JobId</code> value.
  @_s.JsonKey(name: 'ManifestURI')
  final String manifestURI;

  GetJobManifestResult({
    this.manifestURI,
  });
  factory GetJobManifestResult.fromJson(Map<String, dynamic> json) =>
      _$GetJobManifestResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetJobUnlockCodeResult {
  /// The <code>UnlockCode</code> value for the specified job. The
  /// <code>UnlockCode</code> value can be accessed for up to 90 days after the
  /// job has been created.
  @_s.JsonKey(name: 'UnlockCode')
  final String unlockCode;

  GetJobUnlockCodeResult({
    this.unlockCode,
  });
  factory GetJobUnlockCodeResult.fromJson(Map<String, dynamic> json) =>
      _$GetJobUnlockCodeResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSnowballUsageResult {
  /// The service limit for number of Snow devices this account can have at once.
  /// The default service limit is 1 (one).
  @_s.JsonKey(name: 'SnowballLimit')
  final int snowballLimit;

  /// The number of Snow devices that this account is currently using.
  @_s.JsonKey(name: 'SnowballsInUse')
  final int snowballsInUse;

  GetSnowballUsageResult({
    this.snowballLimit,
    this.snowballsInUse,
  });
  factory GetSnowballUsageResult.fromJson(Map<String, dynamic> json) =>
      _$GetSnowballUsageResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSoftwareUpdatesResult {
  /// The Amazon S3 presigned URL for the update file associated with the
  /// specified <code>JobId</code> value. The software update will be available
  /// for 2 days after this request is made. To access an update after the 2 days
  /// have passed, you'll have to make another call to
  /// <code>GetSoftwareUpdates</code>.
  @_s.JsonKey(name: 'UpdatesURI')
  final String updatesURI;

  GetSoftwareUpdatesResult({
    this.updatesURI,
  });
  factory GetSoftwareUpdatesResult.fromJson(Map<String, dynamic> json) =>
      _$GetSoftwareUpdatesResultFromJson(json);
}

/// The tax documents required in AWS Regions in India.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class INDTaxDocuments {
  /// The Goods and Services Tax (GST) documents required in AWS Regions in India.
  @_s.JsonKey(name: 'GSTIN')
  final String gstin;

  INDTaxDocuments({
    this.gstin,
  });
  factory INDTaxDocuments.fromJson(Map<String, dynamic> json) =>
      _$INDTaxDocumentsFromJson(json);

  Map<String, dynamic> toJson() => _$INDTaxDocumentsToJson(this);
}

/// Each <code>JobListEntry</code> object contains a job's state, a job's ID,
/// and a value that indicates whether the job is a job part, in the case of an
/// export job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobListEntry {
  /// The creation date for this job.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// The optional description of this specific job, for example <code>Important
  /// Photos 2016-08-11</code>.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// A value that indicates that this job is a main job. A main job represents a
  /// successful request to create an export job. Main jobs aren't associated with
  /// any Snowballs. Instead, each main job will have at least one job part, and
  /// each job part is associated with a Snowball. It might take some time before
  /// the job parts associated with a particular main job are listed, because they
  /// are created after the main job is created.
  @_s.JsonKey(name: 'IsMaster')
  final bool isMaster;

  /// The automatically generated ID for a job, for example
  /// <code>JID123e4567-e89b-12d3-a456-426655440000</code>.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  /// The current state of this job.
  @_s.JsonKey(name: 'JobState')
  final JobState jobState;

  /// The type of job.
  @_s.JsonKey(name: 'JobType')
  final JobType jobType;

  /// The type of device used with this job.
  @_s.JsonKey(name: 'SnowballType')
  final SnowballType snowballType;

  JobListEntry({
    this.creationDate,
    this.description,
    this.isMaster,
    this.jobId,
    this.jobState,
    this.jobType,
    this.snowballType,
  });
  factory JobListEntry.fromJson(Map<String, dynamic> json) =>
      _$JobListEntryFromJson(json);
}

/// Contains job logs. Whenever a Snow device is used to import data into or
/// export data out of Amazon S3, you'll have the option of downloading a PDF
/// job report. Job logs are returned as a part of the response syntax of the
/// <code>DescribeJob</code> action in the <code>JobMetadata</code> data type.
/// The job logs can be accessed for up to 60 minutes after this request has
/// been made. To access any of the job logs after 60 minutes have passed,
/// you'll have to make another call to the <code>DescribeJob</code> action.
///
/// For import jobs, the PDF job report becomes available at the end of the
/// import process. For export jobs, your job report typically becomes available
/// while the Snow device for your job part is being delivered to you.
///
/// The job report provides you insight into the state of your Amazon S3 data
/// transfer. The report includes details about your job or job part for your
/// records.
///
/// For deeper visibility into the status of your transferred objects, you can
/// look at the two associated logs: a success log and a failure log. The logs
/// are saved in comma-separated value (CSV) format, and the name of each log
/// includes the ID of the job or job part that the log describes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobLogs {
  /// A link to an Amazon S3 presigned URL where the job completion report is
  /// located.
  @_s.JsonKey(name: 'JobCompletionReportURI')
  final String jobCompletionReportURI;

  /// A link to an Amazon S3 presigned URL where the job failure log is located.
  @_s.JsonKey(name: 'JobFailureLogURI')
  final String jobFailureLogURI;

  /// A link to an Amazon S3 presigned URL where the job success log is located.
  @_s.JsonKey(name: 'JobSuccessLogURI')
  final String jobSuccessLogURI;

  JobLogs({
    this.jobCompletionReportURI,
    this.jobFailureLogURI,
    this.jobSuccessLogURI,
  });
  factory JobLogs.fromJson(Map<String, dynamic> json) =>
      _$JobLogsFromJson(json);
}

/// Contains information about a specific job including shipping information,
/// job status, and other important metadata. This information is returned as a
/// part of the response syntax of the <code>DescribeJob</code> action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobMetadata {
  /// The ID for the address that you want the Snow device shipped to.
  @_s.JsonKey(name: 'AddressId')
  final String addressId;

  /// The 39-character ID for the cluster, for example
  /// <code>CID123e4567-e89b-12d3-a456-426655440000</code>.
  @_s.JsonKey(name: 'ClusterId')
  final String clusterId;

  /// The creation date for this job.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// A value that defines the real-time status of a Snow device's data transfer
  /// while the device is at AWS. This data is only available while a job has a
  /// <code>JobState</code> value of <code>InProgress</code>, for both import and
  /// export jobs.
  @_s.JsonKey(name: 'DataTransferProgress')
  final DataTransfer dataTransferProgress;

  /// The description of the job, provided at job creation.
  @_s.JsonKey(name: 'Description')
  final String description;
  @_s.JsonKey(name: 'DeviceConfiguration')
  final DeviceConfiguration deviceConfiguration;

  /// The ID of the address that you want a job shipped to, after it will be
  /// shipped to its primary address. This field is not supported in most regions.
  @_s.JsonKey(name: 'ForwardingAddressId')
  final String forwardingAddressId;

  /// The automatically generated ID for a job, for example
  /// <code>JID123e4567-e89b-12d3-a456-426655440000</code>.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  /// Links to Amazon S3 presigned URLs for the job report and logs. For import
  /// jobs, the PDF job report becomes available at the end of the import process.
  /// For export jobs, your job report typically becomes available while the Snow
  /// device for your job part is being delivered to you.
  @_s.JsonKey(name: 'JobLogInfo')
  final JobLogs jobLogInfo;

  /// The current status of the jobs.
  @_s.JsonKey(name: 'JobState')
  final JobState jobState;

  /// The type of job.
  @_s.JsonKey(name: 'JobType')
  final JobType jobType;

  /// The Amazon Resource Name (ARN) for the AWS Key Management Service (AWS KMS)
  /// key associated with this job. This ARN was created using the <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html">CreateKey</a>
  /// API action in AWS KMS.
  @_s.JsonKey(name: 'KmsKeyARN')
  final String kmsKeyARN;

  /// The Amazon Simple Notification Service (Amazon SNS) notification settings
  /// associated with a specific job. The <code>Notification</code> object is
  /// returned as a part of the response syntax of the <code>DescribeJob</code>
  /// action in the <code>JobMetadata</code> data type.
  @_s.JsonKey(name: 'Notification')
  final Notification notification;

  /// An array of <code>S3Resource</code> objects. Each <code>S3Resource</code>
  /// object represents an Amazon S3 bucket that your transferred data will be
  /// exported from or imported into.
  @_s.JsonKey(name: 'Resources')
  final JobResource resources;

  /// The role ARN associated with this job. This ARN was created using the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html">CreateRole</a>
  /// API action in AWS Identity and Access Management (IAM).
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// A job's shipping information, including inbound and outbound tracking
  /// numbers and shipping speed options.
  @_s.JsonKey(name: 'ShippingDetails')
  final ShippingDetails shippingDetails;

  /// The Snow device capacity preference for this job, specified at job creation.
  /// In US regions, you can choose between 50 TB and 80 TB Snowballs. All other
  /// regions use 80 TB capacity Snowballs.
  @_s.JsonKey(name: 'SnowballCapacityPreference')
  final SnowballCapacity snowballCapacityPreference;

  /// The type of device used with this job.
  @_s.JsonKey(name: 'SnowballType')
  final SnowballType snowballType;

  /// The metadata associated with the tax documents required in your AWS Region.
  @_s.JsonKey(name: 'TaxDocuments')
  final TaxDocuments taxDocuments;

  JobMetadata({
    this.addressId,
    this.clusterId,
    this.creationDate,
    this.dataTransferProgress,
    this.description,
    this.deviceConfiguration,
    this.forwardingAddressId,
    this.jobId,
    this.jobLogInfo,
    this.jobState,
    this.jobType,
    this.kmsKeyARN,
    this.notification,
    this.resources,
    this.roleARN,
    this.shippingDetails,
    this.snowballCapacityPreference,
    this.snowballType,
    this.taxDocuments,
  });
  factory JobMetadata.fromJson(Map<String, dynamic> json) =>
      _$JobMetadataFromJson(json);
}

/// Contains an array of AWS resource objects. Each object represents an Amazon
/// S3 bucket, an AWS Lambda function, or an Amazon Machine Image (AMI) based on
/// Amazon EC2 that is associated with a particular job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JobResource {
  /// The Amazon Machine Images (AMIs) associated with this job.
  @_s.JsonKey(name: 'Ec2AmiResources')
  final List<Ec2AmiResource> ec2AmiResources;

  /// The Python-language Lambda functions for this job.
  @_s.JsonKey(name: 'LambdaResources')
  final List<LambdaResource> lambdaResources;

  /// An array of <code>S3Resource</code> objects.
  @_s.JsonKey(name: 'S3Resources')
  final List<S3Resource> s3Resources;

  JobResource({
    this.ec2AmiResources,
    this.lambdaResources,
    this.s3Resources,
  });
  factory JobResource.fromJson(Map<String, dynamic> json) =>
      _$JobResourceFromJson(json);

  Map<String, dynamic> toJson() => _$JobResourceToJson(this);
}

enum JobState {
  @_s.JsonValue('New')
  $new,
  @_s.JsonValue('PreparingAppliance')
  preparingAppliance,
  @_s.JsonValue('PreparingShipment')
  preparingShipment,
  @_s.JsonValue('InTransitToCustomer')
  inTransitToCustomer,
  @_s.JsonValue('WithCustomer')
  withCustomer,
  @_s.JsonValue('InTransitToAWS')
  inTransitToAWS,
  @_s.JsonValue('WithAWSSortingFacility')
  withAWSSortingFacility,
  @_s.JsonValue('WithAWS')
  withAWS,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Complete')
  complete,
  @_s.JsonValue('Cancelled')
  cancelled,
  @_s.JsonValue('Listing')
  listing,
  @_s.JsonValue('Pending')
  pending,
}

enum JobType {
  @_s.JsonValue('IMPORT')
  import,
  @_s.JsonValue('EXPORT')
  export,
  @_s.JsonValue('LOCAL_USE')
  localUse,
}

extension on JobType {
  String toValue() {
    switch (this) {
      case JobType.import:
        return 'IMPORT';
      case JobType.export:
        return 'EXPORT';
      case JobType.localUse:
        return 'LOCAL_USE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains a key range. For export jobs, a <code>S3Resource</code> object can
/// have an optional <code>KeyRange</code> value. The length of the range is
/// defined at job creation, and has either an inclusive
/// <code>BeginMarker</code>, an inclusive <code>EndMarker</code>, or both.
/// Ranges are UTF-8 binary sorted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KeyRange {
  /// The key that starts an optional key range for an export job. Ranges are
  /// inclusive and UTF-8 binary sorted.
  @_s.JsonKey(name: 'BeginMarker')
  final String beginMarker;

  /// The key that ends an optional key range for an export job. Ranges are
  /// inclusive and UTF-8 binary sorted.
  @_s.JsonKey(name: 'EndMarker')
  final String endMarker;

  KeyRange({
    this.beginMarker,
    this.endMarker,
  });
  factory KeyRange.fromJson(Map<String, dynamic> json) =>
      _$KeyRangeFromJson(json);

  Map<String, dynamic> toJson() => _$KeyRangeToJson(this);
}

/// Identifies
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LambdaResource {
  /// The array of ARNs for <a>S3Resource</a> objects to trigger the
  /// <a>LambdaResource</a> objects associated with this job.
  @_s.JsonKey(name: 'EventTriggers')
  final List<EventTriggerDefinition> eventTriggers;

  /// An Amazon Resource Name (ARN) that represents an AWS Lambda function to be
  /// triggered by PUT object actions on the associated local Amazon S3 resource.
  @_s.JsonKey(name: 'LambdaArn')
  final String lambdaArn;

  LambdaResource({
    this.eventTriggers,
    this.lambdaArn,
  });
  factory LambdaResource.fromJson(Map<String, dynamic> json) =>
      _$LambdaResourceFromJson(json);

  Map<String, dynamic> toJson() => _$LambdaResourceToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListClusterJobsResult {
  /// Each <code>JobListEntry</code> object contains a job's state, a job's ID,
  /// and a value that indicates whether the job is a job part, in the case of
  /// export jobs.
  @_s.JsonKey(name: 'JobListEntries')
  final List<JobListEntry> jobListEntries;

  /// HTTP requests are stateless. If you use the automatically generated
  /// <code>NextToken</code> value in your next <code>ListClusterJobsResult</code>
  /// call, your list of returned jobs will start from this point in the array.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListClusterJobsResult({
    this.jobListEntries,
    this.nextToken,
  });
  factory ListClusterJobsResult.fromJson(Map<String, dynamic> json) =>
      _$ListClusterJobsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListClustersResult {
  /// Each <code>ClusterListEntry</code> object contains a cluster's state, a
  /// cluster's ID, and other important status information.
  @_s.JsonKey(name: 'ClusterListEntries')
  final List<ClusterListEntry> clusterListEntries;

  /// HTTP requests are stateless. If you use the automatically generated
  /// <code>NextToken</code> value in your next <code>ClusterListEntry</code>
  /// call, your list of returned clusters will start from this point in the
  /// array.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListClustersResult({
    this.clusterListEntries,
    this.nextToken,
  });
  factory ListClustersResult.fromJson(Map<String, dynamic> json) =>
      _$ListClustersResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCompatibleImagesResult {
  /// A JSON-formatted object that describes a compatible AMI, including the ID
  /// and name for a Snow device AMI.
  @_s.JsonKey(name: 'CompatibleImages')
  final List<CompatibleImage> compatibleImages;

  /// Because HTTP requests are stateless, this is the starting point for your
  /// next list of returned images.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCompatibleImagesResult({
    this.compatibleImages,
    this.nextToken,
  });
  factory ListCompatibleImagesResult.fromJson(Map<String, dynamic> json) =>
      _$ListCompatibleImagesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJobsResult {
  /// Each <code>JobListEntry</code> object contains a job's state, a job's ID,
  /// and a value that indicates whether the job is a job part, in the case of
  /// export jobs.
  @_s.JsonKey(name: 'JobListEntries')
  final List<JobListEntry> jobListEntries;

  /// HTTP requests are stateless. If you use this automatically generated
  /// <code>NextToken</code> value in your next <code>ListJobs</code> call, your
  /// returned <code>JobListEntry</code> objects will start from this point in the
  /// array.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListJobsResult({
    this.jobListEntries,
    this.nextToken,
  });
  factory ListJobsResult.fromJson(Map<String, dynamic> json) =>
      _$ListJobsResultFromJson(json);
}

/// The Amazon Simple Notification Service (Amazon SNS) notification settings
/// associated with a specific job. The <code>Notification</code> object is
/// returned as a part of the response syntax of the <code>DescribeJob</code>
/// action in the <code>JobMetadata</code> data type.
///
/// When the notification settings are defined during job creation, you can
/// choose to notify based on a specific set of job states using the
/// <code>JobStatesToNotify</code> array of strings, or you can specify that you
/// want to have Amazon SNS notifications sent out for all job states with
/// <code>NotifyAll</code> set to true.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Notification {
  /// The list of job states that will trigger a notification for this job.
  @_s.JsonKey(name: 'JobStatesToNotify')
  final List<JobState> jobStatesToNotify;

  /// Any change in job state will trigger a notification for this job.
  @_s.JsonKey(name: 'NotifyAll')
  final bool notifyAll;

  /// The new SNS <code>TopicArn</code> that you want to associate with this job.
  /// You can create Amazon Resource Names (ARNs) for topics by using the <a
  /// href="https://docs.aws.amazon.com/sns/latest/api/API_CreateTopic.html">CreateTopic</a>
  /// Amazon SNS API action.
  ///
  /// You can subscribe email addresses to an Amazon SNS topic through the AWS
  /// Management Console, or by using the <a
  /// href="https://docs.aws.amazon.com/sns/latest/api/API_Subscribe.html">Subscribe</a>
  /// AWS Simple Notification Service (SNS) API action.
  @_s.JsonKey(name: 'SnsTopicARN')
  final String snsTopicARN;

  Notification({
    this.jobStatesToNotify,
    this.notifyAll,
    this.snsTopicARN,
  });
  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}

/// Each <code>S3Resource</code> object represents an Amazon S3 bucket that your
/// transferred data will be exported from or imported into. For export jobs,
/// this object can have an optional <code>KeyRange</code> value. The length of
/// the range is defined at job creation, and has either an inclusive
/// <code>BeginMarker</code>, an inclusive <code>EndMarker</code>, or both.
/// Ranges are UTF-8 binary sorted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Resource {
  /// The Amazon Resource Name (ARN) of an Amazon S3 bucket.
  @_s.JsonKey(name: 'BucketArn')
  final String bucketArn;

  /// For export jobs, you can provide an optional <code>KeyRange</code> within a
  /// specific Amazon S3 bucket. The length of the range is defined at job
  /// creation, and has either an inclusive <code>BeginMarker</code>, an inclusive
  /// <code>EndMarker</code>, or both. Ranges are UTF-8 binary sorted.
  @_s.JsonKey(name: 'KeyRange')
  final KeyRange keyRange;

  S3Resource({
    this.bucketArn,
    this.keyRange,
  });
  factory S3Resource.fromJson(Map<String, dynamic> json) =>
      _$S3ResourceFromJson(json);

  Map<String, dynamic> toJson() => _$S3ResourceToJson(this);
}

/// The <code>Status</code> and <code>TrackingNumber</code> information for an
/// inbound or outbound shipment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Shipment {
  /// Status information for a shipment.
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The tracking number for this job. Using this tracking number with your
  /// region's carrier's website, you can track a Snow device as the carrier
  /// transports it.
  ///
  /// For India, the carrier is Amazon Logistics. For all other regions, UPS is
  /// the carrier.
  @_s.JsonKey(name: 'TrackingNumber')
  final String trackingNumber;

  Shipment({
    this.status,
    this.trackingNumber,
  });
  factory Shipment.fromJson(Map<String, dynamic> json) =>
      _$ShipmentFromJson(json);
}

enum ShipmentState {
  @_s.JsonValue('RECEIVED')
  received,
  @_s.JsonValue('RETURNED')
  returned,
}

extension on ShipmentState {
  String toValue() {
    switch (this) {
      case ShipmentState.received:
        return 'RECEIVED';
      case ShipmentState.returned:
        return 'RETURNED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A job's shipping information, including inbound and outbound tracking
/// numbers and shipping speed options.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ShippingDetails {
  /// The <code>Status</code> and <code>TrackingNumber</code> values for a Snow
  /// device being returned to AWS for a particular job.
  @_s.JsonKey(name: 'InboundShipment')
  final Shipment inboundShipment;

  /// The <code>Status</code> and <code>TrackingNumber</code> values for a Snow
  /// device being delivered to the address that you specified for a particular
  /// job.
  @_s.JsonKey(name: 'OutboundShipment')
  final Shipment outboundShipment;

  /// The shipping speed for a particular job. This speed doesn't dictate how soon
  /// you'll get the Snow device from the job's creation date. This speed
  /// represents how quickly it moves to its destination while in transit.
  /// Regional shipping speeds are as follows:
  ///
  /// <ul>
  /// <li>
  /// In Australia, you have access to express shipping. Typically, Snow devices
  /// shipped express are delivered in about a day.
  /// </li>
  /// <li>
  /// In the European Union (EU), you have access to express shipping. Typically,
  /// Snow devices shipped express are delivered in about a day. In addition, most
  /// countries in the EU have access to standard shipping, which typically takes
  /// less than a week, one way.
  /// </li>
  /// <li>
  /// In India, Snow device are delivered in one to seven days.
  /// </li>
  /// <li>
  /// In the United States of America (US), you have access to one-day shipping
  /// and two-day shipping.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ShippingOption')
  final ShippingOption shippingOption;

  ShippingDetails({
    this.inboundShipment,
    this.outboundShipment,
    this.shippingOption,
  });
  factory ShippingDetails.fromJson(Map<String, dynamic> json) =>
      _$ShippingDetailsFromJson(json);
}

enum ShippingLabelStatus {
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('TimedOut')
  timedOut,
  @_s.JsonValue('Succeeded')
  succeeded,
  @_s.JsonValue('Failed')
  failed,
}

enum ShippingOption {
  @_s.JsonValue('SECOND_DAY')
  secondDay,
  @_s.JsonValue('NEXT_DAY')
  nextDay,
  @_s.JsonValue('EXPRESS')
  express,
  @_s.JsonValue('STANDARD')
  standard,
}

extension on ShippingOption {
  String toValue() {
    switch (this) {
      case ShippingOption.secondDay:
        return 'SECOND_DAY';
      case ShippingOption.nextDay:
        return 'NEXT_DAY';
      case ShippingOption.express:
        return 'EXPRESS';
      case ShippingOption.standard:
        return 'STANDARD';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum SnowballCapacity {
  @_s.JsonValue('T50')
  t50,
  @_s.JsonValue('T80')
  t80,
  @_s.JsonValue('T100')
  t100,
  @_s.JsonValue('T42')
  t42,
  @_s.JsonValue('T98')
  t98,
  @_s.JsonValue('T8')
  t8,
  @_s.JsonValue('NoPreference')
  noPreference,
}

extension on SnowballCapacity {
  String toValue() {
    switch (this) {
      case SnowballCapacity.t50:
        return 'T50';
      case SnowballCapacity.t80:
        return 'T80';
      case SnowballCapacity.t100:
        return 'T100';
      case SnowballCapacity.t42:
        return 'T42';
      case SnowballCapacity.t98:
        return 'T98';
      case SnowballCapacity.t8:
        return 'T8';
      case SnowballCapacity.noPreference:
        return 'NoPreference';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum SnowballType {
  @_s.JsonValue('STANDARD')
  standard,
  @_s.JsonValue('EDGE')
  edge,
  @_s.JsonValue('EDGE_C')
  edgeC,
  @_s.JsonValue('EDGE_CG')
  edgeCg,
  @_s.JsonValue('EDGE_S')
  edgeS,
  @_s.JsonValue('SNC1_HDD')
  snc1Hdd,
}

extension on SnowballType {
  String toValue() {
    switch (this) {
      case SnowballType.standard:
        return 'STANDARD';
      case SnowballType.edge:
        return 'EDGE';
      case SnowballType.edgeC:
        return 'EDGE_C';
      case SnowballType.edgeCg:
        return 'EDGE_CG';
      case SnowballType.edgeS:
        return 'EDGE_S';
      case SnowballType.snc1Hdd:
        return 'SNC1_HDD';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Specifies the device configuration for an AWS Snowcone job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SnowconeDeviceConfiguration {
  /// Configures the wireless connection for the AWS Snowcone device.
  @_s.JsonKey(name: 'WirelessConnection')
  final WirelessConnection wirelessConnection;

  SnowconeDeviceConfiguration({
    this.wirelessConnection,
  });
  factory SnowconeDeviceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$SnowconeDeviceConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$SnowconeDeviceConfigurationToJson(this);
}

/// The tax documents required in your AWS Region.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TaxDocuments {
  @_s.JsonKey(name: 'IND')
  final INDTaxDocuments ind;

  TaxDocuments({
    this.ind,
  });
  factory TaxDocuments.fromJson(Map<String, dynamic> json) =>
      _$TaxDocumentsFromJson(json);

  Map<String, dynamic> toJson() => _$TaxDocumentsToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateClusterResult {
  UpdateClusterResult();
  factory UpdateClusterResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateClusterResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateJobResult {
  UpdateJobResult();
  factory UpdateJobResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateJobResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateJobShipmentStateResult {
  UpdateJobShipmentStateResult();
  factory UpdateJobShipmentStateResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateJobShipmentStateResultFromJson(json);
}

/// Configures the wireless connection on an AWS Snowcone device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WirelessConnection {
  /// Enables the Wi-Fi adapter on an AWS Snowcone device.
  @_s.JsonKey(name: 'IsWifiEnabled')
  final bool isWifiEnabled;

  WirelessConnection({
    this.isWifiEnabled,
  });
  factory WirelessConnection.fromJson(Map<String, dynamic> json) =>
      _$WirelessConnectionFromJson(json);

  Map<String, dynamic> toJson() => _$WirelessConnectionToJson(this);
}

class ClusterLimitExceededException extends _s.GenericAwsException {
  ClusterLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ClusterLimitExceededException',
            message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class Ec2RequestFailedException extends _s.GenericAwsException {
  Ec2RequestFailedException({String type, String message})
      : super(type: type, code: 'Ec2RequestFailedException', message: message);
}

class InvalidAddressException extends _s.GenericAwsException {
  InvalidAddressException({String type, String message})
      : super(type: type, code: 'InvalidAddressException', message: message);
}

class InvalidInputCombinationException extends _s.GenericAwsException {
  InvalidInputCombinationException({String type, String message})
      : super(
            type: type,
            code: 'InvalidInputCombinationException',
            message: message);
}

class InvalidJobStateException extends _s.GenericAwsException {
  InvalidJobStateException({String type, String message})
      : super(type: type, code: 'InvalidJobStateException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidResourceException extends _s.GenericAwsException {
  InvalidResourceException({String type, String message})
      : super(type: type, code: 'InvalidResourceException', message: message);
}

class KMSRequestFailedException extends _s.GenericAwsException {
  KMSRequestFailedException({String type, String message})
      : super(type: type, code: 'KMSRequestFailedException', message: message);
}

class ReturnShippingLabelAlreadyExistsException extends _s.GenericAwsException {
  ReturnShippingLabelAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ReturnShippingLabelAlreadyExistsException',
            message: message);
}

class UnsupportedAddressException extends _s.GenericAwsException {
  UnsupportedAddressException({String type, String message})
      : super(
            type: type, code: 'UnsupportedAddressException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ClusterLimitExceededException': (type, message) =>
      ClusterLimitExceededException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'Ec2RequestFailedException': (type, message) =>
      Ec2RequestFailedException(type: type, message: message),
  'InvalidAddressException': (type, message) =>
      InvalidAddressException(type: type, message: message),
  'InvalidInputCombinationException': (type, message) =>
      InvalidInputCombinationException(type: type, message: message),
  'InvalidJobStateException': (type, message) =>
      InvalidJobStateException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidResourceException': (type, message) =>
      InvalidResourceException(type: type, message: message),
  'KMSRequestFailedException': (type, message) =>
      KMSRequestFailedException(type: type, message: message),
  'ReturnShippingLabelAlreadyExistsException': (type, message) =>
      ReturnShippingLabelAlreadyExistsException(type: type, message: message),
  'UnsupportedAddressException': (type, message) =>
      UnsupportedAddressException(type: type, message: message),
};

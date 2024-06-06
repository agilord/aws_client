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

/// The Amazon Web Services Snow Family provides a petabyte-scale data transport
/// solution that uses secure devices to transfer large amounts of data between
/// your on-premises data centers and Amazon Simple Storage Service (Amazon S3).
/// The Snow Family commands described here provide access to the same
/// functionality that is available in the Amazon Web Services Snow Family
/// Management Console, which enables you to create and manage jobs for a Snow
/// Family device. To transfer data locally with a Snow Family device, you'll
/// need to use the Snowball Edge client or the Amazon S3 API Interface for
/// Snowball or OpsHub for Snow Family. For more information, see the <a
/// href="https://docs.aws.amazon.com/AWSImportExport/latest/ug/api-reference.html">User
/// Guide</a>.
class Snowball {
  final _s.JsonProtocol _protocol;
  Snowball({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'snowball',
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
    required String clusterId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.CancelCluster'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClusterId': clusterId,
      },
    );
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
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.CancelJob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },
    );
  }

  /// Creates an address for a Snow device to be shipped to. In most regions,
  /// addresses are validated at the time of creation. The address you provide
  /// must be located within the serviceable area of your region. If the address
  /// is invalid or unsupported, then an exception is thrown. If providing an
  /// address as a JSON file through the <code>cli-input-json</code> option,
  /// include the full file path. For example, <code>--cli-input-json
  /// file://create-address.json</code>.
  ///
  /// May throw [InvalidAddressException].
  /// May throw [UnsupportedAddressException].
  ///
  /// Parameter [address] :
  /// The address that you want the Snow device shipped to.
  Future<CreateAddressResult> createAddress({
    required Address address,
  }) async {
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
  /// For more information, see
  /// "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html"
  /// (Snow Family Devices and Capacity) in the <i>Snowcone User Guide</i> or
  /// "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html"
  /// (Snow Family Devices and Capacity) in the <i>Snowcone User Guide</i>.
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
  /// In India, Snow devices are delivered in one to seven days.
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
  /// In India, Snow devices are delivered in one to seven days.
  /// </li>
  /// <li>
  /// In the US, you have access to one-day shipping and two-day shipping.
  /// </li>
  /// </ul>
  ///
  /// Parameter [snowballType] :
  /// The type of Snow Family devices to use for this cluster.
  /// <note>
  /// For cluster jobs, Amazon Web Services Snow Family currently supports only
  /// the <code>EDGE</code> device type.
  /// </note>
  /// For more information, see
  /// "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html"
  /// (Snow Family Devices and Capacity) in the <i>Snowcone User Guide</i> or
  /// "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html"
  /// (Snow Family Devices and Capacity) in the <i>Snowcone User Guide</i>.
  ///
  /// Parameter [description] :
  /// An optional description of this specific cluster, for example
  /// <code>Environmental Data Cluster-01</code>.
  ///
  /// Parameter [forceCreateJobs] :
  /// Force to create cluster when user attempts to overprovision or
  /// underprovision a cluster. A cluster is overprovisioned or underprovisioned
  /// if the initial size of the cluster is more (overprovisioned) or less
  /// (underprovisioned) than what needed to meet capacity requirement specified
  /// with <code>OnDeviceServiceConfiguration</code>.
  ///
  /// Parameter [forwardingAddressId] :
  /// The forwarding address ID for a cluster. This field is not supported in
  /// most regions.
  ///
  /// Parameter [initialClusterSize] :
  /// If provided, each job will be automatically created and associated with
  /// the new cluster. If not provided, will be treated as 0.
  ///
  /// Parameter [kmsKeyARN] :
  /// The <code>KmsKeyARN</code> value that you want to associate with this
  /// cluster. <code>KmsKeyARN</code> values are created by using the <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html">CreateKey</a>
  /// API action in Key Management Service (KMS).
  ///
  /// Parameter [longTermPricingIds] :
  /// Lists long-term pricing id that will be used to associate with jobs
  /// automatically created for the new cluster.
  ///
  /// Parameter [notification] :
  /// The Amazon Simple Notification Service (Amazon SNS) notification settings
  /// for this cluster.
  ///
  /// Parameter [onDeviceServiceConfiguration] :
  /// Specifies the service or services on the Snow Family device that your
  /// transferred data will be exported from or imported into. Amazon Web
  /// Services Snow Family device clusters support Amazon S3 and NFS (Network
  /// File System).
  ///
  /// Parameter [remoteManagement] :
  /// Allows you to securely operate and manage Snow devices in a cluster
  /// remotely from outside of your internal network. When set to
  /// <code>INSTALLED_AUTOSTART</code>, remote management will automatically be
  /// available when the device arrives at your location. Otherwise, you need to
  /// use the Snowball Client to manage the device.
  ///
  /// Parameter [resources] :
  /// The resources associated with the cluster job. These resources include
  /// Amazon S3 buckets and optional Lambda functions written in the Python
  /// language.
  ///
  /// Parameter [roleARN] :
  /// The <code>RoleARN</code> that you want to associate with this cluster.
  /// <code>RoleArn</code> values are created by using the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html">CreateRole</a>
  /// API action in Identity and Access Management (IAM).
  ///
  /// Parameter [snowballCapacityPreference] :
  /// If your job is being created in one of the US regions, you have the option
  /// of specifying what size Snow device you'd like for this job. In all other
  /// regions, Snowballs come with 80 TB in storage capacity.
  ///
  /// For more information, see
  /// "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html"
  /// (Snow Family Devices and Capacity) in the <i>Snowcone User Guide</i> or
  /// "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html"
  /// (Snow Family Devices and Capacity) in the <i>Snowcone User Guide</i>.
  ///
  /// Parameter [taxDocuments] :
  /// The tax documents required in your Amazon Web Services Region.
  Future<CreateClusterResult> createCluster({
    required String addressId,
    required JobType jobType,
    required ShippingOption shippingOption,
    required SnowballType snowballType,
    String? description,
    bool? forceCreateJobs,
    String? forwardingAddressId,
    int? initialClusterSize,
    String? kmsKeyARN,
    List<String>? longTermPricingIds,
    Notification? notification,
    OnDeviceServiceConfiguration? onDeviceServiceConfiguration,
    RemoteManagement? remoteManagement,
    JobResource? resources,
    String? roleARN,
    SnowballCapacity? snowballCapacityPreference,
    TaxDocuments? taxDocuments,
  }) async {
    _s.validateNumRange(
      'initialClusterSize',
      initialClusterSize,
      0,
      16,
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
        'JobType': jobType.toValue(),
        'ShippingOption': shippingOption.toValue(),
        'SnowballType': snowballType.toValue(),
        if (description != null) 'Description': description,
        if (forceCreateJobs != null) 'ForceCreateJobs': forceCreateJobs,
        if (forwardingAddressId != null)
          'ForwardingAddressId': forwardingAddressId,
        if (initialClusterSize != null)
          'InitialClusterSize': initialClusterSize,
        if (kmsKeyARN != null) 'KmsKeyARN': kmsKeyARN,
        if (longTermPricingIds != null)
          'LongTermPricingIds': longTermPricingIds,
        if (notification != null) 'Notification': notification,
        if (onDeviceServiceConfiguration != null)
          'OnDeviceServiceConfiguration': onDeviceServiceConfiguration,
        if (remoteManagement != null)
          'RemoteManagement': remoteManagement.toValue(),
        if (resources != null) 'Resources': resources,
        if (roleARN != null) 'RoleARN': roleARN,
        if (snowballCapacityPreference != null)
          'SnowballCapacityPreference': snowballCapacityPreference.toValue(),
        if (taxDocuments != null) 'TaxDocuments': taxDocuments,
      },
    );

    return CreateClusterResult.fromJson(jsonResponse.body);
  }

  /// Creates a job to import or export data between Amazon S3 and your
  /// on-premises data center. Your Amazon Web Services account must have the
  /// right trust policies and permissions in place to create a job for a Snow
  /// device. If you're creating a job for a node in a cluster, you only need to
  /// provide the <code>clusterId</code> value; the other job attributes are
  /// inherited from the cluster.
  /// <note>
  /// Only the Snowball; Edge device type is supported when ordering clustered
  /// jobs.
  ///
  /// The device capacity is optional.
  ///
  /// Availability of device types differ by Amazon Web Services Region. For
  /// more information about Region availability, see <a
  /// href="https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services/?p=ngi&amp;loc=4">Amazon
  /// Web Services Regional Services</a>.
  /// </note> <p/> <p class="title"> <b>Snow Family devices and their
  /// capacities.</b>
  ///
  /// <ul>
  /// <li>
  /// Device type: <b>SNC1_SSD</b>
  ///
  /// <ul>
  /// <li>
  /// Capacity: T14
  /// </li>
  /// <li>
  /// Description: Snowcone
  /// </li>
  /// </ul> <p/> </li>
  /// <li>
  /// Device type: <b>SNC1_HDD</b>
  ///
  /// <ul>
  /// <li>
  /// Capacity: T8
  /// </li>
  /// <li>
  /// Description: Snowcone
  /// </li>
  /// </ul> <p/> </li>
  /// <li>
  /// Device type: <b>EDGE_S</b>
  ///
  /// <ul>
  /// <li>
  /// Capacity: T98
  /// </li>
  /// <li>
  /// Description: Snowball Edge Storage Optimized for data transfer only
  /// </li>
  /// </ul> <p/> </li>
  /// <li>
  /// Device type: <b>EDGE_CG</b>
  ///
  /// <ul>
  /// <li>
  /// Capacity: T42
  /// </li>
  /// <li>
  /// Description: Snowball Edge Compute Optimized with GPU
  /// </li>
  /// </ul> <p/> </li>
  /// <li>
  /// Device type: <b>EDGE_C</b>
  ///
  /// <ul>
  /// <li>
  /// Capacity: T42
  /// </li>
  /// <li>
  /// Description: Snowball Edge Compute Optimized without GPU
  /// </li>
  /// </ul> <p/> </li>
  /// <li>
  /// Device type: <b>EDGE</b>
  ///
  /// <ul>
  /// <li>
  /// Capacity: T100
  /// </li>
  /// <li>
  /// Description: Snowball Edge Storage Optimized with EC2 Compute
  /// </li>
  /// </ul> <note>
  /// This device is replaced with T98.
  /// </note> <p/> </li>
  /// <li>
  /// Device type: <b>STANDARD</b>
  ///
  /// <ul>
  /// <li>
  /// Capacity: T50
  /// </li>
  /// <li>
  /// Description: Original Snowball device
  /// <note>
  /// This device is only available in the Ningxia, Beijing, and Singapore
  /// Amazon Web Services Region
  /// </note> </li>
  /// </ul> <p/> </li>
  /// <li>
  /// Device type: <b>STANDARD</b>
  ///
  /// <ul>
  /// <li>
  /// Capacity: T80
  /// </li>
  /// <li>
  /// Description: Original Snowball device
  /// <note>
  /// This device is only available in the Ningxia, Beijing, and Singapore
  /// Amazon Web Services Region.
  /// </note> </li>
  /// </ul> <p/> </li>
  /// <li>
  /// Snow Family device type: <b>RACK_5U_C</b>
  ///
  /// <ul>
  /// <li>
  /// Capacity: T13
  /// </li>
  /// <li>
  /// Description: Snowblade.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Device type: <b>V3_5S</b>
  ///
  /// <ul>
  /// <li>
  /// Capacity: T240
  /// </li>
  /// <li>
  /// Description: Snowball Edge Storage Optimized 210TB
  /// </li>
  /// </ul> </li>
  /// </ul>
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
  /// Defines the device configuration for an Snowcone job.
  ///
  /// For more information, see
  /// "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html"
  /// (Snow Family Devices and Capacity) in the <i>Snowcone User Guide</i> or
  /// "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html"
  /// (Snow Family Devices and Capacity) in the <i>Snowcone User Guide</i>.
  ///
  /// Parameter [forwardingAddressId] :
  /// The forwarding address ID for a job. This field is not supported in most
  /// Regions.
  ///
  /// Parameter [impactLevel] :
  /// The highest impact level of data that will be stored or processed on the
  /// device, provided at job creation.
  ///
  /// Parameter [jobType] :
  /// Defines the type of job that you're creating.
  ///
  /// Parameter [kmsKeyARN] :
  /// The <code>KmsKeyARN</code> that you want to associate with this job.
  /// <code>KmsKeyARN</code>s are created using the <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html">CreateKey</a>
  /// Key Management Service (KMS) API action.
  ///
  /// Parameter [longTermPricingId] :
  /// The ID of the long-term pricing type for the device.
  ///
  /// Parameter [notification] :
  /// Defines the Amazon Simple Notification Service (Amazon SNS) notification
  /// settings for this job.
  ///
  /// Parameter [onDeviceServiceConfiguration] :
  /// Specifies the service or services on the Snow Family device that your
  /// transferred data will be exported from or imported into. Amazon Web
  /// Services Snow Family supports Amazon S3 and NFS (Network File System) and
  /// the Amazon Web Services Storage Gateway service Tape Gateway type.
  ///
  /// Parameter [pickupDetails] :
  /// Information identifying the person picking up the device.
  ///
  /// Parameter [remoteManagement] :
  /// Allows you to securely operate and manage Snowcone devices remotely from
  /// outside of your internal network. When set to
  /// <code>INSTALLED_AUTOSTART</code>, remote management will automatically be
  /// available when the device arrives at your location. Otherwise, you need to
  /// use the Snowball Edge client to manage the device. When set to
  /// <code>NOT_INSTALLED</code>, remote management will not be available on the
  /// device.
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
  /// Identity and Access Management (IAM) API action.
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
  /// For more information, see
  /// "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html"
  /// (Snow Family Devices and Capacity) in the <i>Snowcone User Guide</i> or
  /// "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html"
  /// (Snow Family Devices and Capacity) in the <i>Snowcone User Guide</i>.
  ///
  /// Parameter [snowballType] :
  /// The type of Snow Family devices to use for this job.
  /// <note>
  /// For cluster jobs, Amazon Web Services Snow Family currently supports only
  /// the <code>EDGE</code> device type.
  /// </note>
  /// The type of Amazon Web Services Snow device to use for this job.
  /// Currently, the only supported device type for cluster jobs is
  /// <code>EDGE</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/snowball/latest/developer-guide/device-differences.html">Snowball
  /// Edge Device Options</a> in the Snowball Edge Developer Guide.
  ///
  /// For more information, see
  /// "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html"
  /// (Snow Family Devices and Capacity) in the <i>Snowcone User Guide</i> or
  /// "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html"
  /// (Snow Family Devices and Capacity) in the <i>Snowcone User Guide</i>.
  ///
  /// Parameter [taxDocuments] :
  /// The tax documents required in your Amazon Web Services Region.
  Future<CreateJobResult> createJob({
    String? addressId,
    String? clusterId,
    String? description,
    DeviceConfiguration? deviceConfiguration,
    String? forwardingAddressId,
    ImpactLevel? impactLevel,
    JobType? jobType,
    String? kmsKeyARN,
    String? longTermPricingId,
    Notification? notification,
    OnDeviceServiceConfiguration? onDeviceServiceConfiguration,
    PickupDetails? pickupDetails,
    RemoteManagement? remoteManagement,
    JobResource? resources,
    String? roleARN,
    ShippingOption? shippingOption,
    SnowballCapacity? snowballCapacityPreference,
    SnowballType? snowballType,
    TaxDocuments? taxDocuments,
  }) async {
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
        if (impactLevel != null) 'ImpactLevel': impactLevel.toValue(),
        if (jobType != null) 'JobType': jobType.toValue(),
        if (kmsKeyARN != null) 'KmsKeyARN': kmsKeyARN,
        if (longTermPricingId != null) 'LongTermPricingId': longTermPricingId,
        if (notification != null) 'Notification': notification,
        if (onDeviceServiceConfiguration != null)
          'OnDeviceServiceConfiguration': onDeviceServiceConfiguration,
        if (pickupDetails != null) 'PickupDetails': pickupDetails,
        if (remoteManagement != null)
          'RemoteManagement': remoteManagement.toValue(),
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

  /// Creates a job with the long-term usage option for a device. The long-term
  /// usage is a 1-year or 3-year long-term pricing type for the device. You are
  /// billed upfront, and Amazon Web Services provides discounts for long-term
  /// pricing.
  ///
  /// May throw [InvalidResourceException].
  ///
  /// Parameter [longTermPricingType] :
  /// The type of long-term pricing option you want for the device, either
  /// 1-year or 3-year long-term pricing.
  ///
  /// Parameter [snowballType] :
  /// The type of Snow Family devices to use for the long-term pricing job.
  ///
  /// Parameter [isLongTermPricingAutoRenew] :
  /// Specifies whether the current long-term pricing type for the device should
  /// be renewed.
  Future<CreateLongTermPricingResult> createLongTermPricing({
    required LongTermPricingType longTermPricingType,
    required SnowballType snowballType,
    bool? isLongTermPricingAutoRenew,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.CreateLongTermPricing'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LongTermPricingType': longTermPricingType.toValue(),
        'SnowballType': snowballType.toValue(),
        if (isLongTermPricingAutoRenew != null)
          'IsLongTermPricingAutoRenew': isLongTermPricingAutoRenew,
      },
    );

    return CreateLongTermPricingResult.fromJson(jsonResponse.body);
  }

  /// Creates a shipping label that will be used to return the Snow device to
  /// Amazon Web Services.
  ///
  /// May throw [InvalidResourceException].
  /// May throw [InvalidJobStateException].
  /// May throw [InvalidInputCombinationException].
  /// May throw [ConflictException].
  /// May throw [ReturnShippingLabelAlreadyExistsException].
  ///
  /// Parameter [jobId] :
  /// The ID for a job that you want to create the return shipping label for;
  /// for example, <code>JID123e4567-e89b-12d3-a456-426655440000</code>.
  ///
  /// Parameter [shippingOption] :
  /// The shipping speed for a particular job. This speed doesn't dictate how
  /// soon the device is returned to Amazon Web Services. This speed represents
  /// how quickly it moves to its destination while in transit. Regional
  /// shipping speeds are as follows:
  Future<CreateReturnShippingLabelResult> createReturnShippingLabel({
    required String jobId,
    ShippingOption? shippingOption,
  }) async {
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
    required String addressId,
  }) async {
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
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
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
    required String clusterId,
  }) async {
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
    required String jobId,
  }) async {
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
  /// to Amazon Web Services.
  ///
  /// May throw [InvalidResourceException].
  /// May throw [InvalidJobStateException].
  /// May throw [ConflictException].
  ///
  /// Parameter [jobId] :
  /// The automatically generated ID for a job, for example
  /// <code>JID123e4567-e89b-12d3-a456-426655440000</code>.
  Future<DescribeReturnShippingLabelResult> describeReturnShippingLabel({
    required String jobId,
  }) async {
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
        'JobId': jobId,
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
  /// enters the <code>WithCustomer</code> status. This is the only valid status
  /// for calling this API as the manifest and <code>UnlockCode</code> code
  /// value are used for securing your device and should only be used when you
  /// have the device. The manifest is decrypted by using the
  /// <code>UnlockCode</code> code value, when you pass both values to the Snow
  /// device through the Snowball client when the client is started for the
  /// first time.
  ///
  /// As a best practice, we recommend that you don't save a copy of an
  /// <code>UnlockCode</code> value in the same location as the manifest file
  /// for that job. Saving these separately helps prevent unauthorized parties
  /// from gaining access to the Snow device associated with that job.
  ///
  /// The credentials of a given job, including its manifest file and unlock
  /// code, expire 360 days after the job is created.
  ///
  /// May throw [InvalidResourceException].
  /// May throw [InvalidJobStateException].
  ///
  /// Parameter [jobId] :
  /// The ID for a job that you want to get the manifest file for, for example
  /// <code>JID123e4567-e89b-12d3-a456-426655440000</code>.
  Future<GetJobManifestResult> getJobManifest({
    required String jobId,
  }) async {
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
  /// particular <code>UnlockCode</code> value can be accessed for up to 360
  /// days after the associated job has been created.
  ///
  /// The <code>UnlockCode</code> value is a 29-character code with 25
  /// alphanumeric characters and 4 hyphens. This code is used to decrypt the
  /// manifest file when it is passed along with the manifest to the Snow device
  /// through the Snowball client when the client is started for the first time.
  /// The only valid status for calling this API is <code>WithCustomer</code> as
  /// the manifest and <code>Unlock</code> code values are used for securing
  /// your device and should only be used when you have the device.
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
    required String jobId,
  }) async {
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
  /// at one time is 1. If you want to increase your service limit, contact
  /// Amazon Web Services Support.
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
    required String jobId,
  }) async {
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
    required String clusterId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
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
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
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

  /// This action returns a list of the different Amazon EC2-compatible Amazon
  /// Machine Images (AMIs) that are owned by your Amazon Web Services
  /// accountthat would be supported for use on a Snow device. Currently,
  /// supported AMIs are based on the Amazon Linux-2, Ubuntu 20.04 LTS - Focal,
  /// or Ubuntu 22.04 LTS - Jammy images, available on the Amazon Web Services
  /// Marketplace. Ubuntu 16.04 LTS - Xenial (HVM) images are no longer
  /// supported in the Market, but still supported for use on devices through
  /// Amazon EC2 VM Import/Export and running locally in AMIs.
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
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
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
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
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

  /// Lists all long-term pricing types.
  ///
  /// May throw [InvalidResourceException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of <code>ListLongTermPricing</code> objects to return.
  ///
  /// Parameter [nextToken] :
  /// Because HTTP requests are stateless, this is the starting point for your
  /// next list of <code>ListLongTermPricing</code> to return.
  Future<ListLongTermPricingResult> listLongTermPricing({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.ListLongTermPricing'
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

    return ListLongTermPricingResult.fromJson(jsonResponse.body);
  }

  /// A list of locations from which the customer can choose to pickup a device.
  ///
  /// May throw [InvalidResourceException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of locations to list per page.
  ///
  /// Parameter [nextToken] :
  /// HTTP requests are stateless. To identify what object comes "next" in the
  /// list of <code>ListPickupLocationsRequest</code> objects, you have the
  /// option of specifying <code>NextToken</code> as the starting point for your
  /// returned list.
  Future<ListPickupLocationsResult> listPickupLocations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.ListPickupLocations'
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

    return ListPickupLocationsResult.fromJson(jsonResponse.body);
  }

  /// Lists all supported versions for Snow on-device services. Returns an array
  /// of <code>ServiceVersion</code> object containing the supported versions
  /// for a particular service.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidResourceException].
  ///
  /// Parameter [serviceName] :
  /// The name of the service for which you're requesting supported versions.
  ///
  /// Parameter [dependentServices] :
  /// A list of names and versions of dependant services of the requested
  /// service.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of <code>ListServiceVersions</code> objects to return.
  ///
  /// Parameter [nextToken] :
  /// Because HTTP requests are stateless, this is the starting point for the
  /// next list of returned <code>ListServiceVersionsRequest</code> versions.
  Future<ListServiceVersionsResult> listServiceVersions({
    required ServiceName serviceName,
    List<DependentService>? dependentServices,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.ListServiceVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceName': serviceName.toValue(),
        if (dependentServices != null) 'DependentServices': dependentServices,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListServiceVersionsResult.fromJson(jsonResponse.body);
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
  /// Parameter [onDeviceServiceConfiguration] :
  /// Specifies the service or services on the Snow Family device that your
  /// transferred data will be exported from or imported into. Amazon Web
  /// Services Snow Family device clusters support Amazon S3 and NFS (Network
  /// File System).
  ///
  /// Parameter [resources] :
  /// The updated arrays of <a>JobResource</a> objects that can include updated
  /// <a>S3Resource</a> objects or <a>LambdaResource</a> objects.
  ///
  /// Parameter [roleARN] :
  /// The new role Amazon Resource Name (ARN) that you want to associate with
  /// this cluster. To create a role ARN, use the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html">CreateRole</a>
  /// API action in Identity and Access Management (IAM).
  ///
  /// Parameter [shippingOption] :
  /// The updated shipping option value of this cluster's <a>ShippingDetails</a>
  /// object.
  Future<void> updateCluster({
    required String clusterId,
    String? addressId,
    String? description,
    String? forwardingAddressId,
    Notification? notification,
    OnDeviceServiceConfiguration? onDeviceServiceConfiguration,
    JobResource? resources,
    String? roleARN,
    ShippingOption? shippingOption,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.UpdateCluster'
    };
    await _protocol.send(
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
        if (onDeviceServiceConfiguration != null)
          'OnDeviceServiceConfiguration': onDeviceServiceConfiguration,
        if (resources != null) 'Resources': resources,
        if (roleARN != null) 'RoleARN': roleARN,
        if (shippingOption != null) 'ShippingOption': shippingOption.toValue(),
      },
    );
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
  /// Parameter [onDeviceServiceConfiguration] :
  /// Specifies the service or services on the Snow Family device that your
  /// transferred data will be exported from or imported into. Amazon Web
  /// Services Snow Family supports Amazon S3 and NFS (Network File System) and
  /// the Amazon Web Services Storage Gateway service Tape Gateway type.
  ///
  /// Parameter [resources] :
  /// The updated <code>JobResource</code> object, or the updated
  /// <a>JobResource</a> object.
  ///
  /// Parameter [roleARN] :
  /// The new role Amazon Resource Name (ARN) that you want to associate with
  /// this job. To create a role ARN, use the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html">CreateRole</a>Identity
  /// and Access Management (IAM) API action.
  ///
  /// Parameter [shippingOption] :
  /// The updated shipping option value of this job's <a>ShippingDetails</a>
  /// object.
  ///
  /// Parameter [snowballCapacityPreference] :
  /// The updated <code>SnowballCapacityPreference</code> of this job's
  /// <a>JobMetadata</a> object. The 50 TB Snowballs are only available in the
  /// US regions.
  ///
  /// For more information, see
  /// "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html"
  /// (Snow Family Devices and Capacity) in the <i>Snowcone User Guide</i> or
  /// "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html"
  /// (Snow Family Devices and Capacity) in the <i>Snowcone User Guide</i>.
  Future<void> updateJob({
    required String jobId,
    String? addressId,
    String? description,
    String? forwardingAddressId,
    Notification? notification,
    OnDeviceServiceConfiguration? onDeviceServiceConfiguration,
    PickupDetails? pickupDetails,
    JobResource? resources,
    String? roleARN,
    ShippingOption? shippingOption,
    SnowballCapacity? snowballCapacityPreference,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.UpdateJob'
    };
    await _protocol.send(
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
        if (onDeviceServiceConfiguration != null)
          'OnDeviceServiceConfiguration': onDeviceServiceConfiguration,
        if (pickupDetails != null) 'PickupDetails': pickupDetails,
        if (resources != null) 'Resources': resources,
        if (roleARN != null) 'RoleARN': roleARN,
        if (shippingOption != null) 'ShippingOption': shippingOption.toValue(),
        if (snowballCapacityPreference != null)
          'SnowballCapacityPreference': snowballCapacityPreference.toValue(),
      },
    );
  }

  /// Updates the state when a shipment state changes to a different state.
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
  /// Set to <code>RETURNED</code> when you have returned the device to Amazon
  /// Web Services.
  Future<void> updateJobShipmentState({
    required String jobId,
    required ShipmentState shipmentState,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.UpdateJobShipmentState'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
        'ShipmentState': shipmentState.toValue(),
      },
    );
  }

  /// Updates the long-term pricing type.
  ///
  /// May throw [InvalidResourceException].
  ///
  /// Parameter [longTermPricingId] :
  /// The ID of the long-term pricing type for the device.
  ///
  /// Parameter [isLongTermPricingAutoRenew] :
  /// If set to <code>true</code>, specifies that the current long-term pricing
  /// type for the device should be automatically renewed before the long-term
  /// pricing contract expires.
  ///
  /// Parameter [replacementJob] :
  /// Specifies that a device that is ordered with long-term pricing should be
  /// replaced with a new device.
  Future<void> updateLongTermPricing({
    required String longTermPricingId,
    bool? isLongTermPricingAutoRenew,
    String? replacementJob,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSIESnowballJobManagementService.UpdateLongTermPricing'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LongTermPricingId': longTermPricingId,
        if (isLongTermPricingAutoRenew != null)
          'IsLongTermPricingAutoRenew': isLongTermPricingAutoRenew,
        if (replacementJob != null) 'ReplacementJob': replacementJob,
      },
    );
  }
}

/// The address that you want the Snow device(s) associated with a specific job
/// to be shipped to. Addresses are validated at the time of creation. The
/// address you provide must be located within the serviceable area of your
/// region. Although no individual elements of the <code>Address</code> are
/// required, if the address is invalid or unsupported, then an exception is
/// thrown.
class Address {
  /// The unique ID for an address.
  final String? addressId;

  /// The city in an address that a Snow device is to be delivered to.
  final String? city;

  /// The name of the company to receive a Snow device at an address.
  final String? company;

  /// The country in an address that a Snow device is to be delivered to.
  final String? country;

  /// If the address you are creating is a primary address, then set this option
  /// to true. This field is not supported in most regions.
  final bool? isRestricted;

  /// This field is no longer used and the value is ignored.
  final String? landmark;

  /// The name of a person to receive a Snow device at an address.
  final String? name;

  /// The phone number associated with an address that a Snow device is to be
  /// delivered to.
  final String? phoneNumber;

  /// The postal code in an address that a Snow device is to be delivered to.
  final String? postalCode;

  /// This field is no longer used and the value is ignored.
  final String? prefectureOrDistrict;

  /// The state or province in an address that a Snow device is to be delivered
  /// to.
  final String? stateOrProvince;

  /// The first line in a street address that a Snow device is to be delivered to.
  final String? street1;

  /// The second line in a street address that a Snow device is to be delivered
  /// to.
  final String? street2;

  /// The third line in a street address that a Snow device is to be delivered to.
  final String? street3;

  /// Differentiates between delivery address and pickup address in the customer
  /// account. Provided at job creation.
  final AddressType? type;

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
    this.type,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      addressId: json['AddressId'] as String?,
      city: json['City'] as String?,
      company: json['Company'] as String?,
      country: json['Country'] as String?,
      isRestricted: json['IsRestricted'] as bool?,
      landmark: json['Landmark'] as String?,
      name: json['Name'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      postalCode: json['PostalCode'] as String?,
      prefectureOrDistrict: json['PrefectureOrDistrict'] as String?,
      stateOrProvince: json['StateOrProvince'] as String?,
      street1: json['Street1'] as String?,
      street2: json['Street2'] as String?,
      street3: json['Street3'] as String?,
      type: (json['Type'] as String?)?.toAddressType(),
    );
  }

  Map<String, dynamic> toJson() {
    final addressId = this.addressId;
    final city = this.city;
    final company = this.company;
    final country = this.country;
    final isRestricted = this.isRestricted;
    final landmark = this.landmark;
    final name = this.name;
    final phoneNumber = this.phoneNumber;
    final postalCode = this.postalCode;
    final prefectureOrDistrict = this.prefectureOrDistrict;
    final stateOrProvince = this.stateOrProvince;
    final street1 = this.street1;
    final street2 = this.street2;
    final street3 = this.street3;
    final type = this.type;
    return {
      if (addressId != null) 'AddressId': addressId,
      if (city != null) 'City': city,
      if (company != null) 'Company': company,
      if (country != null) 'Country': country,
      if (isRestricted != null) 'IsRestricted': isRestricted,
      if (landmark != null) 'Landmark': landmark,
      if (name != null) 'Name': name,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (postalCode != null) 'PostalCode': postalCode,
      if (prefectureOrDistrict != null)
        'PrefectureOrDistrict': prefectureOrDistrict,
      if (stateOrProvince != null) 'StateOrProvince': stateOrProvince,
      if (street1 != null) 'Street1': street1,
      if (street2 != null) 'Street2': street2,
      if (street3 != null) 'Street3': street3,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum AddressType {
  custPickup,
  awsShip,
}

extension AddressTypeValueExtension on AddressType {
  String toValue() {
    switch (this) {
      case AddressType.custPickup:
        return 'CUST_PICKUP';
      case AddressType.awsShip:
        return 'AWS_SHIP';
    }
  }
}

extension AddressTypeFromString on String {
  AddressType toAddressType() {
    switch (this) {
      case 'CUST_PICKUP':
        return AddressType.custPickup;
      case 'AWS_SHIP':
        return AddressType.awsShip;
    }
    throw Exception('$this is not known in enum AddressType');
  }
}

class CancelClusterResult {
  CancelClusterResult();

  factory CancelClusterResult.fromJson(Map<String, dynamic> _) {
    return CancelClusterResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CancelJobResult {
  CancelJobResult();

  factory CancelJobResult.fromJson(Map<String, dynamic> _) {
    return CancelJobResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains a cluster's state, a cluster's ID, and other important information.
class ClusterListEntry {
  /// The 39-character ID for the cluster that you want to list, for example
  /// <code>CID123e4567-e89b-12d3-a456-426655440000</code>.
  final String? clusterId;

  /// The current state of this cluster. For information about the state of a
  /// specific node, see <a>JobListEntry$JobState</a>.
  final ClusterState? clusterState;

  /// The creation date for this cluster.
  final DateTime? creationDate;

  /// Defines an optional description of the cluster, for example
  /// <code>Environmental Data Cluster-01</code>.
  final String? description;

  ClusterListEntry({
    this.clusterId,
    this.clusterState,
    this.creationDate,
    this.description,
  });

  factory ClusterListEntry.fromJson(Map<String, dynamic> json) {
    return ClusterListEntry(
      clusterId: json['ClusterId'] as String?,
      clusterState: (json['ClusterState'] as String?)?.toClusterState(),
      creationDate: timeStampFromJson(json['CreationDate']),
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterId = this.clusterId;
    final clusterState = this.clusterState;
    final creationDate = this.creationDate;
    final description = this.description;
    return {
      if (clusterId != null) 'ClusterId': clusterId,
      if (clusterState != null) 'ClusterState': clusterState.toValue(),
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (description != null) 'Description': description,
    };
  }
}

/// Contains metadata about a specific cluster.
class ClusterMetadata {
  /// The automatically generated ID for a specific address.
  final String? addressId;

  /// The automatically generated ID for a cluster.
  final String? clusterId;

  /// The current status of the cluster.
  final ClusterState? clusterState;

  /// The creation date for this cluster.
  final DateTime? creationDate;

  /// The optional description of the cluster.
  final String? description;

  /// The ID of the address that you want a cluster shipped to, after it will be
  /// shipped to its primary address. This field is not supported in most regions.
  final String? forwardingAddressId;

  /// The type of job for this cluster. Currently, the only job type supported for
  /// clusters is <code>LOCAL_USE</code>.
  final JobType? jobType;

  /// The <code>KmsKeyARN</code> Amazon Resource Name (ARN) associated with this
  /// cluster. This ARN was created using the <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html">CreateKey</a>
  /// API action in Key Management Service (KMS.
  final String? kmsKeyARN;

  /// The Amazon Simple Notification Service (Amazon SNS) notification settings
  /// for this cluster.
  final Notification? notification;

  /// Represents metadata and configuration settings for services on an Amazon Web
  /// Services Snow Family device.
  final OnDeviceServiceConfiguration? onDeviceServiceConfiguration;

  /// The arrays of <a>JobResource</a> objects that can include updated
  /// <a>S3Resource</a> objects or <a>LambdaResource</a> objects.
  final JobResource? resources;

  /// The role ARN associated with this cluster. This ARN was created using the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html">CreateRole</a>
  /// API action in Identity and Access Management (IAM).
  final String? roleARN;

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
  final ShippingOption? shippingOption;

  /// The type of Snowcone device to use for this cluster.
  /// <note>
  /// For cluster jobs, Amazon Web Services Snow Family currently supports only
  /// the <code>EDGE</code> device type.
  /// </note>
  final SnowballType? snowballType;

  /// The tax documents required in your Amazon Web Services Region.
  final TaxDocuments? taxDocuments;

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
    this.onDeviceServiceConfiguration,
    this.resources,
    this.roleARN,
    this.shippingOption,
    this.snowballType,
    this.taxDocuments,
  });

  factory ClusterMetadata.fromJson(Map<String, dynamic> json) {
    return ClusterMetadata(
      addressId: json['AddressId'] as String?,
      clusterId: json['ClusterId'] as String?,
      clusterState: (json['ClusterState'] as String?)?.toClusterState(),
      creationDate: timeStampFromJson(json['CreationDate']),
      description: json['Description'] as String?,
      forwardingAddressId: json['ForwardingAddressId'] as String?,
      jobType: (json['JobType'] as String?)?.toJobType(),
      kmsKeyARN: json['KmsKeyARN'] as String?,
      notification: json['Notification'] != null
          ? Notification.fromJson(json['Notification'] as Map<String, dynamic>)
          : null,
      onDeviceServiceConfiguration: json['OnDeviceServiceConfiguration'] != null
          ? OnDeviceServiceConfiguration.fromJson(
              json['OnDeviceServiceConfiguration'] as Map<String, dynamic>)
          : null,
      resources: json['Resources'] != null
          ? JobResource.fromJson(json['Resources'] as Map<String, dynamic>)
          : null,
      roleARN: json['RoleARN'] as String?,
      shippingOption: (json['ShippingOption'] as String?)?.toShippingOption(),
      snowballType: (json['SnowballType'] as String?)?.toSnowballType(),
      taxDocuments: json['TaxDocuments'] != null
          ? TaxDocuments.fromJson(json['TaxDocuments'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final addressId = this.addressId;
    final clusterId = this.clusterId;
    final clusterState = this.clusterState;
    final creationDate = this.creationDate;
    final description = this.description;
    final forwardingAddressId = this.forwardingAddressId;
    final jobType = this.jobType;
    final kmsKeyARN = this.kmsKeyARN;
    final notification = this.notification;
    final onDeviceServiceConfiguration = this.onDeviceServiceConfiguration;
    final resources = this.resources;
    final roleARN = this.roleARN;
    final shippingOption = this.shippingOption;
    final snowballType = this.snowballType;
    final taxDocuments = this.taxDocuments;
    return {
      if (addressId != null) 'AddressId': addressId,
      if (clusterId != null) 'ClusterId': clusterId,
      if (clusterState != null) 'ClusterState': clusterState.toValue(),
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (description != null) 'Description': description,
      if (forwardingAddressId != null)
        'ForwardingAddressId': forwardingAddressId,
      if (jobType != null) 'JobType': jobType.toValue(),
      if (kmsKeyARN != null) 'KmsKeyARN': kmsKeyARN,
      if (notification != null) 'Notification': notification,
      if (onDeviceServiceConfiguration != null)
        'OnDeviceServiceConfiguration': onDeviceServiceConfiguration,
      if (resources != null) 'Resources': resources,
      if (roleARN != null) 'RoleARN': roleARN,
      if (shippingOption != null) 'ShippingOption': shippingOption.toValue(),
      if (snowballType != null) 'SnowballType': snowballType.toValue(),
      if (taxDocuments != null) 'TaxDocuments': taxDocuments,
    };
  }
}

enum ClusterState {
  awaitingQuorum,
  pending,
  inUse,
  complete,
  cancelled,
}

extension ClusterStateValueExtension on ClusterState {
  String toValue() {
    switch (this) {
      case ClusterState.awaitingQuorum:
        return 'AwaitingQuorum';
      case ClusterState.pending:
        return 'Pending';
      case ClusterState.inUse:
        return 'InUse';
      case ClusterState.complete:
        return 'Complete';
      case ClusterState.cancelled:
        return 'Cancelled';
    }
  }
}

extension ClusterStateFromString on String {
  ClusterState toClusterState() {
    switch (this) {
      case 'AwaitingQuorum':
        return ClusterState.awaitingQuorum;
      case 'Pending':
        return ClusterState.pending;
      case 'InUse':
        return ClusterState.inUse;
      case 'Complete':
        return ClusterState.complete;
      case 'Cancelled':
        return ClusterState.cancelled;
    }
    throw Exception('$this is not known in enum ClusterState');
  }
}

/// A JSON-formatted object that describes a compatible Amazon Machine Image
/// (AMI), including the ID and name for a Snow device AMI. This AMI is
/// compatible with the device's physical hardware requirements, and it should
/// be able to be run in an SBE1 instance on the device.
class CompatibleImage {
  /// The unique identifier for an individual Snow device AMI.
  final String? amiId;

  /// The optional name of a compatible image.
  final String? name;

  CompatibleImage({
    this.amiId,
    this.name,
  });

  factory CompatibleImage.fromJson(Map<String, dynamic> json) {
    return CompatibleImage(
      amiId: json['AmiId'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amiId = this.amiId;
    final name = this.name;
    return {
      if (amiId != null) 'AmiId': amiId,
      if (name != null) 'Name': name,
    };
  }
}

class CreateAddressResult {
  /// The automatically generated ID for a specific address. You'll use this ID
  /// when you create a job to specify which address you want the Snow device for
  /// that job shipped to.
  final String? addressId;

  CreateAddressResult({
    this.addressId,
  });

  factory CreateAddressResult.fromJson(Map<String, dynamic> json) {
    return CreateAddressResult(
      addressId: json['AddressId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addressId = this.addressId;
    return {
      if (addressId != null) 'AddressId': addressId,
    };
  }
}

class CreateClusterResult {
  /// The automatically generated ID for a cluster.
  final String? clusterId;

  /// List of jobs created for this cluster. For syntax, see <a
  /// href="http://amazonaws.com/snowball/latest/api-reference/API_ListJobs.html#API_ListJobs_ResponseSyntax">ListJobsResult$JobListEntries</a>
  /// in this guide.
  final List<JobListEntry>? jobListEntries;

  CreateClusterResult({
    this.clusterId,
    this.jobListEntries,
  });

  factory CreateClusterResult.fromJson(Map<String, dynamic> json) {
    return CreateClusterResult(
      clusterId: json['ClusterId'] as String?,
      jobListEntries: (json['JobListEntries'] as List?)
          ?.whereNotNull()
          .map((e) => JobListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterId = this.clusterId;
    final jobListEntries = this.jobListEntries;
    return {
      if (clusterId != null) 'ClusterId': clusterId,
      if (jobListEntries != null) 'JobListEntries': jobListEntries,
    };
  }
}

class CreateJobResult {
  /// The automatically generated ID for a job, for example
  /// <code>JID123e4567-e89b-12d3-a456-426655440000</code>.
  final String? jobId;

  CreateJobResult({
    this.jobId,
  });

  factory CreateJobResult.fromJson(Map<String, dynamic> json) {
    return CreateJobResult(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

class CreateLongTermPricingResult {
  /// The ID of the long-term pricing type for the device.
  final String? longTermPricingId;

  CreateLongTermPricingResult({
    this.longTermPricingId,
  });

  factory CreateLongTermPricingResult.fromJson(Map<String, dynamic> json) {
    return CreateLongTermPricingResult(
      longTermPricingId: json['LongTermPricingId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final longTermPricingId = this.longTermPricingId;
    return {
      if (longTermPricingId != null) 'LongTermPricingId': longTermPricingId,
    };
  }
}

class CreateReturnShippingLabelResult {
  /// The status information of the task on a Snow device that is being returned
  /// to Amazon Web Services.
  final ShippingLabelStatus? status;

  CreateReturnShippingLabelResult({
    this.status,
  });

  factory CreateReturnShippingLabelResult.fromJson(Map<String, dynamic> json) {
    return CreateReturnShippingLabelResult(
      status: (json['Status'] as String?)?.toShippingLabelStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Defines the real-time status of a Snow device's data transfer while the
/// device is at Amazon Web Services. This data is only available while a job
/// has a <code>JobState</code> value of <code>InProgress</code>, for both
/// import and export jobs.
class DataTransfer {
  /// The number of bytes transferred between a Snow device and Amazon S3.
  final int? bytesTransferred;

  /// The number of objects transferred between a Snow device and Amazon S3.
  final int? objectsTransferred;

  /// The total bytes of data for a transfer between a Snow device and Amazon S3.
  /// This value is set to 0 (zero) until all the keys that will be transferred
  /// have been listed.
  final int? totalBytes;

  /// The total number of objects for a transfer between a Snow device and Amazon
  /// S3. This value is set to 0 (zero) until all the keys that will be
  /// transferred have been listed.
  final int? totalObjects;

  DataTransfer({
    this.bytesTransferred,
    this.objectsTransferred,
    this.totalBytes,
    this.totalObjects,
  });

  factory DataTransfer.fromJson(Map<String, dynamic> json) {
    return DataTransfer(
      bytesTransferred: json['BytesTransferred'] as int?,
      objectsTransferred: json['ObjectsTransferred'] as int?,
      totalBytes: json['TotalBytes'] as int?,
      totalObjects: json['TotalObjects'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bytesTransferred = this.bytesTransferred;
    final objectsTransferred = this.objectsTransferred;
    final totalBytes = this.totalBytes;
    final totalObjects = this.totalObjects;
    return {
      if (bytesTransferred != null) 'BytesTransferred': bytesTransferred,
      if (objectsTransferred != null) 'ObjectsTransferred': objectsTransferred,
      if (totalBytes != null) 'TotalBytes': totalBytes,
      if (totalObjects != null) 'TotalObjects': totalObjects,
    };
  }
}

/// The name and version of the service dependant on the requested service.
class DependentService {
  /// The name of the dependent service.
  final ServiceName? serviceName;

  /// The version of the dependent service.
  final ServiceVersion? serviceVersion;

  DependentService({
    this.serviceName,
    this.serviceVersion,
  });

  factory DependentService.fromJson(Map<String, dynamic> json) {
    return DependentService(
      serviceName: (json['ServiceName'] as String?)?.toServiceName(),
      serviceVersion: json['ServiceVersion'] != null
          ? ServiceVersion.fromJson(
              json['ServiceVersion'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceName = this.serviceName;
    final serviceVersion = this.serviceVersion;
    return {
      if (serviceName != null) 'ServiceName': serviceName.toValue(),
      if (serviceVersion != null) 'ServiceVersion': serviceVersion,
    };
  }
}

class DescribeAddressResult {
  /// The address that you want the Snow device(s) associated with a specific job
  /// to be shipped to.
  final Address? address;

  DescribeAddressResult({
    this.address,
  });

  factory DescribeAddressResult.fromJson(Map<String, dynamic> json) {
    return DescribeAddressResult(
      address: json['Address'] != null
          ? Address.fromJson(json['Address'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    return {
      if (address != null) 'Address': address,
    };
  }
}

class DescribeAddressesResult {
  /// The Snow device shipping addresses that were created for this account.
  final List<Address>? addresses;

  /// HTTP requests are stateless. If you use the automatically generated
  /// <code>NextToken</code> value in your next <code>DescribeAddresses</code>
  /// call, your list of returned addresses will start from this point in the
  /// array.
  final String? nextToken;

  DescribeAddressesResult({
    this.addresses,
    this.nextToken,
  });

  factory DescribeAddressesResult.fromJson(Map<String, dynamic> json) {
    return DescribeAddressesResult(
      addresses: (json['Addresses'] as List?)
          ?.whereNotNull()
          .map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addresses = this.addresses;
    final nextToken = this.nextToken;
    return {
      if (addresses != null) 'Addresses': addresses,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeClusterResult {
  /// Information about a specific cluster, including shipping information,
  /// cluster status, and other important metadata.
  final ClusterMetadata? clusterMetadata;

  DescribeClusterResult({
    this.clusterMetadata,
  });

  factory DescribeClusterResult.fromJson(Map<String, dynamic> json) {
    return DescribeClusterResult(
      clusterMetadata: json['ClusterMetadata'] != null
          ? ClusterMetadata.fromJson(
              json['ClusterMetadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterMetadata = this.clusterMetadata;
    return {
      if (clusterMetadata != null) 'ClusterMetadata': clusterMetadata,
    };
  }
}

class DescribeJobResult {
  /// Information about a specific job, including shipping information, job
  /// status, and other important metadata.
  final JobMetadata? jobMetadata;

  /// Information about a specific job part (in the case of an export job),
  /// including shipping information, job status, and other important metadata.
  final List<JobMetadata>? subJobMetadata;

  DescribeJobResult({
    this.jobMetadata,
    this.subJobMetadata,
  });

  factory DescribeJobResult.fromJson(Map<String, dynamic> json) {
    return DescribeJobResult(
      jobMetadata: json['JobMetadata'] != null
          ? JobMetadata.fromJson(json['JobMetadata'] as Map<String, dynamic>)
          : null,
      subJobMetadata: (json['SubJobMetadata'] as List?)
          ?.whereNotNull()
          .map((e) => JobMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobMetadata = this.jobMetadata;
    final subJobMetadata = this.subJobMetadata;
    return {
      if (jobMetadata != null) 'JobMetadata': jobMetadata,
      if (subJobMetadata != null) 'SubJobMetadata': subJobMetadata,
    };
  }
}

class DescribeReturnShippingLabelResult {
  /// The expiration date of the current return shipping label.
  final DateTime? expirationDate;

  /// The pre-signed Amazon S3 URI used to download the return shipping label.
  final String? returnShippingLabelURI;

  /// The status information of the task on a Snow device that is being returned
  /// to Amazon Web Services.
  final ShippingLabelStatus? status;

  DescribeReturnShippingLabelResult({
    this.expirationDate,
    this.returnShippingLabelURI,
    this.status,
  });

  factory DescribeReturnShippingLabelResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeReturnShippingLabelResult(
      expirationDate: timeStampFromJson(json['ExpirationDate']),
      returnShippingLabelURI: json['ReturnShippingLabelURI'] as String?,
      status: (json['Status'] as String?)?.toShippingLabelStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final expirationDate = this.expirationDate;
    final returnShippingLabelURI = this.returnShippingLabelURI;
    final status = this.status;
    return {
      if (expirationDate != null)
        'ExpirationDate': unixTimestampToJson(expirationDate),
      if (returnShippingLabelURI != null)
        'ReturnShippingLabelURI': returnShippingLabelURI,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// The container for <code>SnowconeDeviceConfiguration</code>.
class DeviceConfiguration {
  /// Returns information about the device configuration for an Snowcone job.
  final SnowconeDeviceConfiguration? snowconeDeviceConfiguration;

  DeviceConfiguration({
    this.snowconeDeviceConfiguration,
  });

  factory DeviceConfiguration.fromJson(Map<String, dynamic> json) {
    return DeviceConfiguration(
      snowconeDeviceConfiguration: json['SnowconeDeviceConfiguration'] != null
          ? SnowconeDeviceConfiguration.fromJson(
              json['SnowconeDeviceConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final snowconeDeviceConfiguration = this.snowconeDeviceConfiguration;
    return {
      if (snowconeDeviceConfiguration != null)
        'SnowconeDeviceConfiguration': snowconeDeviceConfiguration,
    };
  }
}

enum DeviceServiceName {
  nfsOnDeviceService,
  s3OnDeviceService,
}

extension DeviceServiceNameValueExtension on DeviceServiceName {
  String toValue() {
    switch (this) {
      case DeviceServiceName.nfsOnDeviceService:
        return 'NFS_ON_DEVICE_SERVICE';
      case DeviceServiceName.s3OnDeviceService:
        return 'S3_ON_DEVICE_SERVICE';
    }
  }
}

extension DeviceServiceNameFromString on String {
  DeviceServiceName toDeviceServiceName() {
    switch (this) {
      case 'NFS_ON_DEVICE_SERVICE':
        return DeviceServiceName.nfsOnDeviceService;
      case 'S3_ON_DEVICE_SERVICE':
        return DeviceServiceName.s3OnDeviceService;
    }
    throw Exception('$this is not known in enum DeviceServiceName');
  }
}

/// An object representing the metadata and configuration settings of EKS
/// Anywhere on the Snow Family device.
class EKSOnDeviceServiceConfiguration {
  /// The optional version of EKS Anywhere on the Snow Family device.
  final String? eKSAnywhereVersion;

  /// The Kubernetes version for EKS Anywhere on the Snow Family device.
  final String? kubernetesVersion;

  EKSOnDeviceServiceConfiguration({
    this.eKSAnywhereVersion,
    this.kubernetesVersion,
  });

  factory EKSOnDeviceServiceConfiguration.fromJson(Map<String, dynamic> json) {
    return EKSOnDeviceServiceConfiguration(
      eKSAnywhereVersion: json['EKSAnywhereVersion'] as String?,
      kubernetesVersion: json['KubernetesVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eKSAnywhereVersion = this.eKSAnywhereVersion;
    final kubernetesVersion = this.kubernetesVersion;
    return {
      if (eKSAnywhereVersion != null) 'EKSAnywhereVersion': eKSAnywhereVersion,
      if (kubernetesVersion != null) 'KubernetesVersion': kubernetesVersion,
    };
  }
}

/// A JSON-formatted object that contains the IDs for an Amazon Machine Image
/// (AMI), including the Amazon EC2-compatible AMI ID and the Snow device AMI
/// ID. Each AMI has these two IDs to simplify identifying the AMI in both the
/// Amazon Web Services Cloud and on the device.
class Ec2AmiResource {
  /// The ID of the AMI in Amazon EC2.
  final String amiId;

  /// The ID of the AMI on the Snow device.
  final String? snowballAmiId;

  Ec2AmiResource({
    required this.amiId,
    this.snowballAmiId,
  });

  factory Ec2AmiResource.fromJson(Map<String, dynamic> json) {
    return Ec2AmiResource(
      amiId: json['AmiId'] as String,
      snowballAmiId: json['SnowballAmiId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amiId = this.amiId;
    final snowballAmiId = this.snowballAmiId;
    return {
      'AmiId': amiId,
      if (snowballAmiId != null) 'SnowballAmiId': snowballAmiId,
    };
  }
}

/// The container for the <a>EventTriggerDefinition$EventResourceARN</a>.
class EventTriggerDefinition {
  /// The Amazon Resource Name (ARN) for any local Amazon S3 resource that is an
  /// Lambda function's event trigger associated with this job.
  final String? eventResourceARN;

  EventTriggerDefinition({
    this.eventResourceARN,
  });

  factory EventTriggerDefinition.fromJson(Map<String, dynamic> json) {
    return EventTriggerDefinition(
      eventResourceARN: json['EventResourceARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventResourceARN = this.eventResourceARN;
    return {
      if (eventResourceARN != null) 'EventResourceARN': eventResourceARN,
    };
  }
}

class GetJobManifestResult {
  /// The Amazon S3 presigned URL for the manifest file associated with the
  /// specified <code>JobId</code> value.
  final String? manifestURI;

  GetJobManifestResult({
    this.manifestURI,
  });

  factory GetJobManifestResult.fromJson(Map<String, dynamic> json) {
    return GetJobManifestResult(
      manifestURI: json['ManifestURI'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final manifestURI = this.manifestURI;
    return {
      if (manifestURI != null) 'ManifestURI': manifestURI,
    };
  }
}

class GetJobUnlockCodeResult {
  /// The <code>UnlockCode</code> value for the specified job. The
  /// <code>UnlockCode</code> value can be accessed for up to 360 days after the
  /// job has been created.
  final String? unlockCode;

  GetJobUnlockCodeResult({
    this.unlockCode,
  });

  factory GetJobUnlockCodeResult.fromJson(Map<String, dynamic> json) {
    return GetJobUnlockCodeResult(
      unlockCode: json['UnlockCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final unlockCode = this.unlockCode;
    return {
      if (unlockCode != null) 'UnlockCode': unlockCode,
    };
  }
}

class GetSnowballUsageResult {
  /// The service limit for number of Snow devices this account can have at once.
  /// The default service limit is 1 (one).
  final int? snowballLimit;

  /// The number of Snow devices that this account is currently using.
  final int? snowballsInUse;

  GetSnowballUsageResult({
    this.snowballLimit,
    this.snowballsInUse,
  });

  factory GetSnowballUsageResult.fromJson(Map<String, dynamic> json) {
    return GetSnowballUsageResult(
      snowballLimit: json['SnowballLimit'] as int?,
      snowballsInUse: json['SnowballsInUse'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final snowballLimit = this.snowballLimit;
    final snowballsInUse = this.snowballsInUse;
    return {
      if (snowballLimit != null) 'SnowballLimit': snowballLimit,
      if (snowballsInUse != null) 'SnowballsInUse': snowballsInUse,
    };
  }
}

class GetSoftwareUpdatesResult {
  /// The Amazon S3 presigned URL for the update file associated with the
  /// specified <code>JobId</code> value. The software update will be available
  /// for 2 days after this request is made. To access an update after the 2 days
  /// have passed, you'll have to make another call to
  /// <code>GetSoftwareUpdates</code>.
  final String? updatesURI;

  GetSoftwareUpdatesResult({
    this.updatesURI,
  });

  factory GetSoftwareUpdatesResult.fromJson(Map<String, dynamic> json) {
    return GetSoftwareUpdatesResult(
      updatesURI: json['UpdatesURI'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final updatesURI = this.updatesURI;
    return {
      if (updatesURI != null) 'UpdatesURI': updatesURI,
    };
  }
}

/// The tax documents required in Amazon Web Services Region in India.
class INDTaxDocuments {
  /// The Goods and Services Tax (GST) documents required in Amazon Web Services
  /// Region in India.
  final String? gstin;

  INDTaxDocuments({
    this.gstin,
  });

  factory INDTaxDocuments.fromJson(Map<String, dynamic> json) {
    return INDTaxDocuments(
      gstin: json['GSTIN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final gstin = this.gstin;
    return {
      if (gstin != null) 'GSTIN': gstin,
    };
  }
}

enum ImpactLevel {
  il2,
  il4,
  il5,
  il6,
  il99,
}

extension ImpactLevelValueExtension on ImpactLevel {
  String toValue() {
    switch (this) {
      case ImpactLevel.il2:
        return 'IL2';
      case ImpactLevel.il4:
        return 'IL4';
      case ImpactLevel.il5:
        return 'IL5';
      case ImpactLevel.il6:
        return 'IL6';
      case ImpactLevel.il99:
        return 'IL99';
    }
  }
}

extension ImpactLevelFromString on String {
  ImpactLevel toImpactLevel() {
    switch (this) {
      case 'IL2':
        return ImpactLevel.il2;
      case 'IL4':
        return ImpactLevel.il4;
      case 'IL5':
        return ImpactLevel.il5;
      case 'IL6':
        return ImpactLevel.il6;
      case 'IL99':
        return ImpactLevel.il99;
    }
    throw Exception('$this is not known in enum ImpactLevel');
  }
}

/// Each <code>JobListEntry</code> object contains a job's state, a job's ID,
/// and a value that indicates whether the job is a job part, in the case of an
/// export job.
class JobListEntry {
  /// The creation date for this job.
  final DateTime? creationDate;

  /// The optional description of this specific job, for example <code>Important
  /// Photos 2016-08-11</code>.
  final String? description;

  /// A value that indicates that this job is a main job. A main job represents a
  /// successful request to create an export job. Main jobs aren't associated with
  /// any Snowballs. Instead, each main job will have at least one job part, and
  /// each job part is associated with a Snowball. It might take some time before
  /// the job parts associated with a particular main job are listed, because they
  /// are created after the main job is created.
  final bool? isMaster;

  /// The automatically generated ID for a job, for example
  /// <code>JID123e4567-e89b-12d3-a456-426655440000</code>.
  final String? jobId;

  /// The current state of this job.
  final JobState? jobState;

  /// The type of job.
  final JobType? jobType;

  /// The type of device used with this job.
  final SnowballType? snowballType;

  JobListEntry({
    this.creationDate,
    this.description,
    this.isMaster,
    this.jobId,
    this.jobState,
    this.jobType,
    this.snowballType,
  });

  factory JobListEntry.fromJson(Map<String, dynamic> json) {
    return JobListEntry(
      creationDate: timeStampFromJson(json['CreationDate']),
      description: json['Description'] as String?,
      isMaster: json['IsMaster'] as bool?,
      jobId: json['JobId'] as String?,
      jobState: (json['JobState'] as String?)?.toJobState(),
      jobType: (json['JobType'] as String?)?.toJobType(),
      snowballType: (json['SnowballType'] as String?)?.toSnowballType(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final description = this.description;
    final isMaster = this.isMaster;
    final jobId = this.jobId;
    final jobState = this.jobState;
    final jobType = this.jobType;
    final snowballType = this.snowballType;
    return {
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (description != null) 'Description': description,
      if (isMaster != null) 'IsMaster': isMaster,
      if (jobId != null) 'JobId': jobId,
      if (jobState != null) 'JobState': jobState.toValue(),
      if (jobType != null) 'JobType': jobType.toValue(),
      if (snowballType != null) 'SnowballType': snowballType.toValue(),
    };
  }
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
class JobLogs {
  /// A link to an Amazon S3 presigned URL where the job completion report is
  /// located.
  final String? jobCompletionReportURI;

  /// A link to an Amazon S3 presigned URL where the job failure log is located.
  final String? jobFailureLogURI;

  /// A link to an Amazon S3 presigned URL where the job success log is located.
  final String? jobSuccessLogURI;

  JobLogs({
    this.jobCompletionReportURI,
    this.jobFailureLogURI,
    this.jobSuccessLogURI,
  });

  factory JobLogs.fromJson(Map<String, dynamic> json) {
    return JobLogs(
      jobCompletionReportURI: json['JobCompletionReportURI'] as String?,
      jobFailureLogURI: json['JobFailureLogURI'] as String?,
      jobSuccessLogURI: json['JobSuccessLogURI'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobCompletionReportURI = this.jobCompletionReportURI;
    final jobFailureLogURI = this.jobFailureLogURI;
    final jobSuccessLogURI = this.jobSuccessLogURI;
    return {
      if (jobCompletionReportURI != null)
        'JobCompletionReportURI': jobCompletionReportURI,
      if (jobFailureLogURI != null) 'JobFailureLogURI': jobFailureLogURI,
      if (jobSuccessLogURI != null) 'JobSuccessLogURI': jobSuccessLogURI,
    };
  }
}

/// Contains information about a specific job including shipping information,
/// job status, and other important metadata. This information is returned as a
/// part of the response syntax of the <code>DescribeJob</code> action.
class JobMetadata {
  /// The ID for the address that you want the Snow device shipped to.
  final String? addressId;

  /// The 39-character ID for the cluster, for example
  /// <code>CID123e4567-e89b-12d3-a456-426655440000</code>.
  final String? clusterId;

  /// The creation date for this job.
  final DateTime? creationDate;

  /// A value that defines the real-time status of a Snow device's data transfer
  /// while the device is at Amazon Web Services. This data is only available
  /// while a job has a <code>JobState</code> value of <code>InProgress</code>,
  /// for both import and export jobs.
  final DataTransfer? dataTransferProgress;

  /// The description of the job, provided at job creation.
  final String? description;
  final DeviceConfiguration? deviceConfiguration;

  /// The ID of the address that you want a job shipped to, after it will be
  /// shipped to its primary address. This field is not supported in most regions.
  final String? forwardingAddressId;

  /// The highest impact level of data that will be stored or processed on the
  /// device, provided at job creation.
  final ImpactLevel? impactLevel;

  /// The automatically generated ID for a job, for example
  /// <code>JID123e4567-e89b-12d3-a456-426655440000</code>.
  final String? jobId;

  /// Links to Amazon S3 presigned URLs for the job report and logs. For import
  /// jobs, the PDF job report becomes available at the end of the import process.
  /// For export jobs, your job report typically becomes available while the Snow
  /// device for your job part is being delivered to you.
  final JobLogs? jobLogInfo;

  /// The current status of the jobs.
  final JobState? jobState;

  /// The type of job.
  final JobType? jobType;

  /// The Amazon Resource Name (ARN) for the Key Management Service (KMS) key
  /// associated with this job. This ARN was created using the <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html">CreateKey</a>
  /// API action in KMS.
  final String? kmsKeyARN;

  /// The ID of the long-term pricing type for the device.
  final String? longTermPricingId;

  /// The Amazon Simple Notification Service (Amazon SNS) notification settings
  /// associated with a specific job. The <code>Notification</code> object is
  /// returned as a part of the response syntax of the <code>DescribeJob</code>
  /// action in the <code>JobMetadata</code> data type.
  final Notification? notification;

  /// Represents metadata and configuration settings for services on an Amazon Web
  /// Services Snow Family device.
  final OnDeviceServiceConfiguration? onDeviceServiceConfiguration;

  /// Information identifying the person picking up the device.
  final PickupDetails? pickupDetails;

  /// Allows you to securely operate and manage Snowcone devices remotely from
  /// outside of your internal network. When set to
  /// <code>INSTALLED_AUTOSTART</code>, remote management will automatically be
  /// available when the device arrives at your location. Otherwise, you need to
  /// use the Snowball Client to manage the device.
  final RemoteManagement? remoteManagement;

  /// An array of <code>S3Resource</code> objects. Each <code>S3Resource</code>
  /// object represents an Amazon S3 bucket that your transferred data will be
  /// exported from or imported into.
  final JobResource? resources;

  /// The role ARN associated with this job. This ARN was created using the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html">CreateRole</a>
  /// API action in Identity and Access Management.
  final String? roleARN;

  /// A job's shipping information, including inbound and outbound tracking
  /// numbers and shipping speed options.
  final ShippingDetails? shippingDetails;

  /// The Snow device capacity preference for this job, specified at job creation.
  /// In US regions, you can choose between 50 TB and 80 TB Snowballs. All other
  /// regions use 80 TB capacity Snowballs.
  ///
  /// For more information, see
  /// "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html"
  /// (Snow Family Devices and Capacity) in the <i>Snowcone User Guide</i> or
  /// "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html"
  /// (Snow Family Devices and Capacity) in the <i>Snowcone User Guide</i>.
  final SnowballCapacity? snowballCapacityPreference;

  /// Unique ID associated with a device.
  final String? snowballId;

  /// The type of device used with this job.
  final SnowballType? snowballType;

  /// The metadata associated with the tax documents required in your Amazon Web
  /// Services Region.
  final TaxDocuments? taxDocuments;

  JobMetadata({
    this.addressId,
    this.clusterId,
    this.creationDate,
    this.dataTransferProgress,
    this.description,
    this.deviceConfiguration,
    this.forwardingAddressId,
    this.impactLevel,
    this.jobId,
    this.jobLogInfo,
    this.jobState,
    this.jobType,
    this.kmsKeyARN,
    this.longTermPricingId,
    this.notification,
    this.onDeviceServiceConfiguration,
    this.pickupDetails,
    this.remoteManagement,
    this.resources,
    this.roleARN,
    this.shippingDetails,
    this.snowballCapacityPreference,
    this.snowballId,
    this.snowballType,
    this.taxDocuments,
  });

  factory JobMetadata.fromJson(Map<String, dynamic> json) {
    return JobMetadata(
      addressId: json['AddressId'] as String?,
      clusterId: json['ClusterId'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      dataTransferProgress: json['DataTransferProgress'] != null
          ? DataTransfer.fromJson(
              json['DataTransferProgress'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      deviceConfiguration: json['DeviceConfiguration'] != null
          ? DeviceConfiguration.fromJson(
              json['DeviceConfiguration'] as Map<String, dynamic>)
          : null,
      forwardingAddressId: json['ForwardingAddressId'] as String?,
      impactLevel: (json['ImpactLevel'] as String?)?.toImpactLevel(),
      jobId: json['JobId'] as String?,
      jobLogInfo: json['JobLogInfo'] != null
          ? JobLogs.fromJson(json['JobLogInfo'] as Map<String, dynamic>)
          : null,
      jobState: (json['JobState'] as String?)?.toJobState(),
      jobType: (json['JobType'] as String?)?.toJobType(),
      kmsKeyARN: json['KmsKeyARN'] as String?,
      longTermPricingId: json['LongTermPricingId'] as String?,
      notification: json['Notification'] != null
          ? Notification.fromJson(json['Notification'] as Map<String, dynamic>)
          : null,
      onDeviceServiceConfiguration: json['OnDeviceServiceConfiguration'] != null
          ? OnDeviceServiceConfiguration.fromJson(
              json['OnDeviceServiceConfiguration'] as Map<String, dynamic>)
          : null,
      pickupDetails: json['PickupDetails'] != null
          ? PickupDetails.fromJson(
              json['PickupDetails'] as Map<String, dynamic>)
          : null,
      remoteManagement:
          (json['RemoteManagement'] as String?)?.toRemoteManagement(),
      resources: json['Resources'] != null
          ? JobResource.fromJson(json['Resources'] as Map<String, dynamic>)
          : null,
      roleARN: json['RoleARN'] as String?,
      shippingDetails: json['ShippingDetails'] != null
          ? ShippingDetails.fromJson(
              json['ShippingDetails'] as Map<String, dynamic>)
          : null,
      snowballCapacityPreference:
          (json['SnowballCapacityPreference'] as String?)?.toSnowballCapacity(),
      snowballId: json['SnowballId'] as String?,
      snowballType: (json['SnowballType'] as String?)?.toSnowballType(),
      taxDocuments: json['TaxDocuments'] != null
          ? TaxDocuments.fromJson(json['TaxDocuments'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final addressId = this.addressId;
    final clusterId = this.clusterId;
    final creationDate = this.creationDate;
    final dataTransferProgress = this.dataTransferProgress;
    final description = this.description;
    final deviceConfiguration = this.deviceConfiguration;
    final forwardingAddressId = this.forwardingAddressId;
    final impactLevel = this.impactLevel;
    final jobId = this.jobId;
    final jobLogInfo = this.jobLogInfo;
    final jobState = this.jobState;
    final jobType = this.jobType;
    final kmsKeyARN = this.kmsKeyARN;
    final longTermPricingId = this.longTermPricingId;
    final notification = this.notification;
    final onDeviceServiceConfiguration = this.onDeviceServiceConfiguration;
    final pickupDetails = this.pickupDetails;
    final remoteManagement = this.remoteManagement;
    final resources = this.resources;
    final roleARN = this.roleARN;
    final shippingDetails = this.shippingDetails;
    final snowballCapacityPreference = this.snowballCapacityPreference;
    final snowballId = this.snowballId;
    final snowballType = this.snowballType;
    final taxDocuments = this.taxDocuments;
    return {
      if (addressId != null) 'AddressId': addressId,
      if (clusterId != null) 'ClusterId': clusterId,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (dataTransferProgress != null)
        'DataTransferProgress': dataTransferProgress,
      if (description != null) 'Description': description,
      if (deviceConfiguration != null)
        'DeviceConfiguration': deviceConfiguration,
      if (forwardingAddressId != null)
        'ForwardingAddressId': forwardingAddressId,
      if (impactLevel != null) 'ImpactLevel': impactLevel.toValue(),
      if (jobId != null) 'JobId': jobId,
      if (jobLogInfo != null) 'JobLogInfo': jobLogInfo,
      if (jobState != null) 'JobState': jobState.toValue(),
      if (jobType != null) 'JobType': jobType.toValue(),
      if (kmsKeyARN != null) 'KmsKeyARN': kmsKeyARN,
      if (longTermPricingId != null) 'LongTermPricingId': longTermPricingId,
      if (notification != null) 'Notification': notification,
      if (onDeviceServiceConfiguration != null)
        'OnDeviceServiceConfiguration': onDeviceServiceConfiguration,
      if (pickupDetails != null) 'PickupDetails': pickupDetails,
      if (remoteManagement != null)
        'RemoteManagement': remoteManagement.toValue(),
      if (resources != null) 'Resources': resources,
      if (roleARN != null) 'RoleARN': roleARN,
      if (shippingDetails != null) 'ShippingDetails': shippingDetails,
      if (snowballCapacityPreference != null)
        'SnowballCapacityPreference': snowballCapacityPreference.toValue(),
      if (snowballId != null) 'SnowballId': snowballId,
      if (snowballType != null) 'SnowballType': snowballType.toValue(),
      if (taxDocuments != null) 'TaxDocuments': taxDocuments,
    };
  }
}

/// Contains an array of Amazon Web Services resource objects. Each object
/// represents an Amazon S3 bucket, an Lambda function, or an Amazon Machine
/// Image (AMI) based on Amazon EC2 that is associated with a particular job.
class JobResource {
  /// The Amazon Machine Images (AMIs) associated with this job.
  final List<Ec2AmiResource>? ec2AmiResources;

  /// The Python-language Lambda functions for this job.
  final List<LambdaResource>? lambdaResources;

  /// An array of <code>S3Resource</code> objects.
  final List<S3Resource>? s3Resources;

  JobResource({
    this.ec2AmiResources,
    this.lambdaResources,
    this.s3Resources,
  });

  factory JobResource.fromJson(Map<String, dynamic> json) {
    return JobResource(
      ec2AmiResources: (json['Ec2AmiResources'] as List?)
          ?.whereNotNull()
          .map((e) => Ec2AmiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      lambdaResources: (json['LambdaResources'] as List?)
          ?.whereNotNull()
          .map((e) => LambdaResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      s3Resources: (json['S3Resources'] as List?)
          ?.whereNotNull()
          .map((e) => S3Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final ec2AmiResources = this.ec2AmiResources;
    final lambdaResources = this.lambdaResources;
    final s3Resources = this.s3Resources;
    return {
      if (ec2AmiResources != null) 'Ec2AmiResources': ec2AmiResources,
      if (lambdaResources != null) 'LambdaResources': lambdaResources,
      if (s3Resources != null) 'S3Resources': s3Resources,
    };
  }
}

enum JobState {
  $new,
  preparingAppliance,
  preparingShipment,
  inTransitToCustomer,
  withCustomer,
  inTransitToAWS,
  withAWSSortingFacility,
  withAWS,
  inProgress,
  complete,
  cancelled,
  listing,
  pending,
}

extension JobStateValueExtension on JobState {
  String toValue() {
    switch (this) {
      case JobState.$new:
        return 'New';
      case JobState.preparingAppliance:
        return 'PreparingAppliance';
      case JobState.preparingShipment:
        return 'PreparingShipment';
      case JobState.inTransitToCustomer:
        return 'InTransitToCustomer';
      case JobState.withCustomer:
        return 'WithCustomer';
      case JobState.inTransitToAWS:
        return 'InTransitToAWS';
      case JobState.withAWSSortingFacility:
        return 'WithAWSSortingFacility';
      case JobState.withAWS:
        return 'WithAWS';
      case JobState.inProgress:
        return 'InProgress';
      case JobState.complete:
        return 'Complete';
      case JobState.cancelled:
        return 'Cancelled';
      case JobState.listing:
        return 'Listing';
      case JobState.pending:
        return 'Pending';
    }
  }
}

extension JobStateFromString on String {
  JobState toJobState() {
    switch (this) {
      case 'New':
        return JobState.$new;
      case 'PreparingAppliance':
        return JobState.preparingAppliance;
      case 'PreparingShipment':
        return JobState.preparingShipment;
      case 'InTransitToCustomer':
        return JobState.inTransitToCustomer;
      case 'WithCustomer':
        return JobState.withCustomer;
      case 'InTransitToAWS':
        return JobState.inTransitToAWS;
      case 'WithAWSSortingFacility':
        return JobState.withAWSSortingFacility;
      case 'WithAWS':
        return JobState.withAWS;
      case 'InProgress':
        return JobState.inProgress;
      case 'Complete':
        return JobState.complete;
      case 'Cancelled':
        return JobState.cancelled;
      case 'Listing':
        return JobState.listing;
      case 'Pending':
        return JobState.pending;
    }
    throw Exception('$this is not known in enum JobState');
  }
}

enum JobType {
  import,
  export,
  localUse,
}

extension JobTypeValueExtension on JobType {
  String toValue() {
    switch (this) {
      case JobType.import:
        return 'IMPORT';
      case JobType.export:
        return 'EXPORT';
      case JobType.localUse:
        return 'LOCAL_USE';
    }
  }
}

extension JobTypeFromString on String {
  JobType toJobType() {
    switch (this) {
      case 'IMPORT':
        return JobType.import;
      case 'EXPORT':
        return JobType.export;
      case 'LOCAL_USE':
        return JobType.localUse;
    }
    throw Exception('$this is not known in enum JobType');
  }
}

/// Contains a key range. For export jobs, a <code>S3Resource</code> object can
/// have an optional <code>KeyRange</code> value. The length of the range is
/// defined at job creation, and has either an inclusive
/// <code>BeginMarker</code>, an inclusive <code>EndMarker</code>, or both.
/// Ranges are UTF-8 binary sorted.
class KeyRange {
  /// The key that starts an optional key range for an export job. Ranges are
  /// inclusive and UTF-8 binary sorted.
  final String? beginMarker;

  /// The key that ends an optional key range for an export job. Ranges are
  /// inclusive and UTF-8 binary sorted.
  final String? endMarker;

  KeyRange({
    this.beginMarker,
    this.endMarker,
  });

  factory KeyRange.fromJson(Map<String, dynamic> json) {
    return KeyRange(
      beginMarker: json['BeginMarker'] as String?,
      endMarker: json['EndMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final beginMarker = this.beginMarker;
    final endMarker = this.endMarker;
    return {
      if (beginMarker != null) 'BeginMarker': beginMarker,
      if (endMarker != null) 'EndMarker': endMarker,
    };
  }
}

/// Identifies
class LambdaResource {
  /// The array of ARNs for <a>S3Resource</a> objects to trigger the
  /// <a>LambdaResource</a> objects associated with this job.
  final List<EventTriggerDefinition>? eventTriggers;

  /// An Amazon Resource Name (ARN) that represents an Lambda function to be
  /// triggered by PUT object actions on the associated local Amazon S3 resource.
  final String? lambdaArn;

  LambdaResource({
    this.eventTriggers,
    this.lambdaArn,
  });

  factory LambdaResource.fromJson(Map<String, dynamic> json) {
    return LambdaResource(
      eventTriggers: (json['EventTriggers'] as List?)
          ?.whereNotNull()
          .map(
              (e) => EventTriggerDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      lambdaArn: json['LambdaArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventTriggers = this.eventTriggers;
    final lambdaArn = this.lambdaArn;
    return {
      if (eventTriggers != null) 'EventTriggers': eventTriggers,
      if (lambdaArn != null) 'LambdaArn': lambdaArn,
    };
  }
}

class ListClusterJobsResult {
  /// Each <code>JobListEntry</code> object contains a job's state, a job's ID,
  /// and a value that indicates whether the job is a job part, in the case of
  /// export jobs.
  final List<JobListEntry>? jobListEntries;

  /// HTTP requests are stateless. If you use the automatically generated
  /// <code>NextToken</code> value in your next <code>ListClusterJobsResult</code>
  /// call, your list of returned jobs will start from this point in the array.
  final String? nextToken;

  ListClusterJobsResult({
    this.jobListEntries,
    this.nextToken,
  });

  factory ListClusterJobsResult.fromJson(Map<String, dynamic> json) {
    return ListClusterJobsResult(
      jobListEntries: (json['JobListEntries'] as List?)
          ?.whereNotNull()
          .map((e) => JobListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobListEntries = this.jobListEntries;
    final nextToken = this.nextToken;
    return {
      if (jobListEntries != null) 'JobListEntries': jobListEntries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListClustersResult {
  /// Each <code>ClusterListEntry</code> object contains a cluster's state, a
  /// cluster's ID, and other important status information.
  final List<ClusterListEntry>? clusterListEntries;

  /// HTTP requests are stateless. If you use the automatically generated
  /// <code>NextToken</code> value in your next <code>ClusterListEntry</code>
  /// call, your list of returned clusters will start from this point in the
  /// array.
  final String? nextToken;

  ListClustersResult({
    this.clusterListEntries,
    this.nextToken,
  });

  factory ListClustersResult.fromJson(Map<String, dynamic> json) {
    return ListClustersResult(
      clusterListEntries: (json['ClusterListEntries'] as List?)
          ?.whereNotNull()
          .map((e) => ClusterListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterListEntries = this.clusterListEntries;
    final nextToken = this.nextToken;
    return {
      if (clusterListEntries != null) 'ClusterListEntries': clusterListEntries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListCompatibleImagesResult {
  /// A JSON-formatted object that describes a compatible AMI, including the ID
  /// and name for a Snow device AMI.
  final List<CompatibleImage>? compatibleImages;

  /// Because HTTP requests are stateless, this is the starting point for your
  /// next list of returned images.
  final String? nextToken;

  ListCompatibleImagesResult({
    this.compatibleImages,
    this.nextToken,
  });

  factory ListCompatibleImagesResult.fromJson(Map<String, dynamic> json) {
    return ListCompatibleImagesResult(
      compatibleImages: (json['CompatibleImages'] as List?)
          ?.whereNotNull()
          .map((e) => CompatibleImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final compatibleImages = this.compatibleImages;
    final nextToken = this.nextToken;
    return {
      if (compatibleImages != null) 'CompatibleImages': compatibleImages,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListJobsResult {
  /// Each <code>JobListEntry</code> object contains a job's state, a job's ID,
  /// and a value that indicates whether the job is a job part, in the case of
  /// export jobs.
  final List<JobListEntry>? jobListEntries;

  /// HTTP requests are stateless. If you use this automatically generated
  /// <code>NextToken</code> value in your next <code>ListJobs</code> call, your
  /// returned <code>JobListEntry</code> objects will start from this point in the
  /// array.
  final String? nextToken;

  ListJobsResult({
    this.jobListEntries,
    this.nextToken,
  });

  factory ListJobsResult.fromJson(Map<String, dynamic> json) {
    return ListJobsResult(
      jobListEntries: (json['JobListEntries'] as List?)
          ?.whereNotNull()
          .map((e) => JobListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobListEntries = this.jobListEntries;
    final nextToken = this.nextToken;
    return {
      if (jobListEntries != null) 'JobListEntries': jobListEntries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListLongTermPricingResult {
  /// Each <code>LongTermPricingEntry</code> object contains a status, ID, and
  /// other information about the <code>LongTermPricing</code> type.
  final List<LongTermPricingListEntry>? longTermPricingEntries;

  /// Because HTTP requests are stateless, this is the starting point for your
  /// next list of returned <code>ListLongTermPricing</code> list.
  final String? nextToken;

  ListLongTermPricingResult({
    this.longTermPricingEntries,
    this.nextToken,
  });

  factory ListLongTermPricingResult.fromJson(Map<String, dynamic> json) {
    return ListLongTermPricingResult(
      longTermPricingEntries: (json['LongTermPricingEntries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              LongTermPricingListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final longTermPricingEntries = this.longTermPricingEntries;
    final nextToken = this.nextToken;
    return {
      if (longTermPricingEntries != null)
        'LongTermPricingEntries': longTermPricingEntries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListPickupLocationsResult {
  /// Information about the address of pickup locations.
  final List<Address>? addresses;

  /// HTTP requests are stateless. To identify what object comes "next" in the
  /// list of <code>ListPickupLocationsResult</code> objects, you have the option
  /// of specifying <code>NextToken</code> as the starting point for your returned
  /// list.
  final String? nextToken;

  ListPickupLocationsResult({
    this.addresses,
    this.nextToken,
  });

  factory ListPickupLocationsResult.fromJson(Map<String, dynamic> json) {
    return ListPickupLocationsResult(
      addresses: (json['Addresses'] as List?)
          ?.whereNotNull()
          .map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addresses = this.addresses;
    final nextToken = this.nextToken;
    return {
      if (addresses != null) 'Addresses': addresses,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListServiceVersionsResult {
  /// The name of the service for which the system provided supported versions.
  final ServiceName serviceName;

  /// A list of supported versions.
  final List<ServiceVersion> serviceVersions;

  /// A list of names and versions of dependant services of the service for which
  /// the system provided supported versions.
  final List<DependentService>? dependentServices;

  /// Because HTTP requests are stateless, this is the starting point of the next
  /// list of returned <code>ListServiceVersionsResult</code> results.
  final String? nextToken;

  ListServiceVersionsResult({
    required this.serviceName,
    required this.serviceVersions,
    this.dependentServices,
    this.nextToken,
  });

  factory ListServiceVersionsResult.fromJson(Map<String, dynamic> json) {
    return ListServiceVersionsResult(
      serviceName: (json['ServiceName'] as String).toServiceName(),
      serviceVersions: (json['ServiceVersions'] as List)
          .whereNotNull()
          .map((e) => ServiceVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      dependentServices: (json['DependentServices'] as List?)
          ?.whereNotNull()
          .map((e) => DependentService.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceName = this.serviceName;
    final serviceVersions = this.serviceVersions;
    final dependentServices = this.dependentServices;
    final nextToken = this.nextToken;
    return {
      'ServiceName': serviceName.toValue(),
      'ServiceVersions': serviceVersions,
      if (dependentServices != null) 'DependentServices': dependentServices,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Each <code>LongTermPricingListEntry</code> object contains information about
/// a long-term pricing type.
class LongTermPricingListEntry {
  /// The current active jobs on the device the long-term pricing type.
  final String? currentActiveJob;

  /// If set to <code>true</code>, specifies that the current long-term pricing
  /// type for the device should be automatically renewed before the long-term
  /// pricing contract expires.
  final bool? isLongTermPricingAutoRenew;

  /// The IDs of the jobs that are associated with a long-term pricing type.
  final List<String>? jobIds;

  /// The end date the long-term pricing contract.
  final DateTime? longTermPricingEndDate;

  /// The ID of the long-term pricing type for the device.
  final String? longTermPricingId;

  /// The start date of the long-term pricing contract.
  final DateTime? longTermPricingStartDate;

  /// The status of the long-term pricing type.
  final String? longTermPricingStatus;

  /// The type of long-term pricing that was selected for the device.
  final LongTermPricingType? longTermPricingType;

  /// A new device that replaces a device that is ordered with long-term pricing.
  final String? replacementJob;

  /// The type of Snow Family devices associated with this long-term pricing job.
  final SnowballType? snowballType;

  LongTermPricingListEntry({
    this.currentActiveJob,
    this.isLongTermPricingAutoRenew,
    this.jobIds,
    this.longTermPricingEndDate,
    this.longTermPricingId,
    this.longTermPricingStartDate,
    this.longTermPricingStatus,
    this.longTermPricingType,
    this.replacementJob,
    this.snowballType,
  });

  factory LongTermPricingListEntry.fromJson(Map<String, dynamic> json) {
    return LongTermPricingListEntry(
      currentActiveJob: json['CurrentActiveJob'] as String?,
      isLongTermPricingAutoRenew: json['IsLongTermPricingAutoRenew'] as bool?,
      jobIds: (json['JobIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      longTermPricingEndDate: timeStampFromJson(json['LongTermPricingEndDate']),
      longTermPricingId: json['LongTermPricingId'] as String?,
      longTermPricingStartDate:
          timeStampFromJson(json['LongTermPricingStartDate']),
      longTermPricingStatus: json['LongTermPricingStatus'] as String?,
      longTermPricingType:
          (json['LongTermPricingType'] as String?)?.toLongTermPricingType(),
      replacementJob: json['ReplacementJob'] as String?,
      snowballType: (json['SnowballType'] as String?)?.toSnowballType(),
    );
  }

  Map<String, dynamic> toJson() {
    final currentActiveJob = this.currentActiveJob;
    final isLongTermPricingAutoRenew = this.isLongTermPricingAutoRenew;
    final jobIds = this.jobIds;
    final longTermPricingEndDate = this.longTermPricingEndDate;
    final longTermPricingId = this.longTermPricingId;
    final longTermPricingStartDate = this.longTermPricingStartDate;
    final longTermPricingStatus = this.longTermPricingStatus;
    final longTermPricingType = this.longTermPricingType;
    final replacementJob = this.replacementJob;
    final snowballType = this.snowballType;
    return {
      if (currentActiveJob != null) 'CurrentActiveJob': currentActiveJob,
      if (isLongTermPricingAutoRenew != null)
        'IsLongTermPricingAutoRenew': isLongTermPricingAutoRenew,
      if (jobIds != null) 'JobIds': jobIds,
      if (longTermPricingEndDate != null)
        'LongTermPricingEndDate': unixTimestampToJson(longTermPricingEndDate),
      if (longTermPricingId != null) 'LongTermPricingId': longTermPricingId,
      if (longTermPricingStartDate != null)
        'LongTermPricingStartDate':
            unixTimestampToJson(longTermPricingStartDate),
      if (longTermPricingStatus != null)
        'LongTermPricingStatus': longTermPricingStatus,
      if (longTermPricingType != null)
        'LongTermPricingType': longTermPricingType.toValue(),
      if (replacementJob != null) 'ReplacementJob': replacementJob,
      if (snowballType != null) 'SnowballType': snowballType.toValue(),
    };
  }
}

enum LongTermPricingType {
  oneYear,
  threeYear,
  oneMonth,
}

extension LongTermPricingTypeValueExtension on LongTermPricingType {
  String toValue() {
    switch (this) {
      case LongTermPricingType.oneYear:
        return 'OneYear';
      case LongTermPricingType.threeYear:
        return 'ThreeYear';
      case LongTermPricingType.oneMonth:
        return 'OneMonth';
    }
  }
}

extension LongTermPricingTypeFromString on String {
  LongTermPricingType toLongTermPricingType() {
    switch (this) {
      case 'OneYear':
        return LongTermPricingType.oneYear;
      case 'ThreeYear':
        return LongTermPricingType.threeYear;
      case 'OneMonth':
        return LongTermPricingType.oneMonth;
    }
    throw Exception('$this is not known in enum LongTermPricingType');
  }
}

/// An object that represents the metadata and configuration settings for the
/// NFS (Network File System) service on an Amazon Web Services Snow Family
/// device.
class NFSOnDeviceServiceConfiguration {
  /// The maximum NFS storage for one Snow Family device.
  final int? storageLimit;

  /// The scale unit of the NFS storage on the device.
  ///
  /// Valid values: TB.
  final StorageUnit? storageUnit;

  NFSOnDeviceServiceConfiguration({
    this.storageLimit,
    this.storageUnit,
  });

  factory NFSOnDeviceServiceConfiguration.fromJson(Map<String, dynamic> json) {
    return NFSOnDeviceServiceConfiguration(
      storageLimit: json['StorageLimit'] as int?,
      storageUnit: (json['StorageUnit'] as String?)?.toStorageUnit(),
    );
  }

  Map<String, dynamic> toJson() {
    final storageLimit = this.storageLimit;
    final storageUnit = this.storageUnit;
    return {
      if (storageLimit != null) 'StorageLimit': storageLimit,
      if (storageUnit != null) 'StorageUnit': storageUnit.toValue(),
    };
  }
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
class Notification {
  /// Used to send SNS notifications for the person picking up the device
  /// (identified during job creation).
  final String? devicePickupSnsTopicARN;

  /// The list of job states that will trigger a notification for this job.
  final List<JobState>? jobStatesToNotify;

  /// Any change in job state will trigger a notification for this job.
  final bool? notifyAll;

  /// The new SNS <code>TopicArn</code> that you want to associate with this job.
  /// You can create Amazon Resource Names (ARNs) for topics by using the <a
  /// href="https://docs.aws.amazon.com/sns/latest/api/API_CreateTopic.html">CreateTopic</a>
  /// Amazon SNS API action.
  ///
  /// You can subscribe email addresses to an Amazon SNS topic through the Amazon
  /// Web Services Management Console, or by using the <a
  /// href="https://docs.aws.amazon.com/sns/latest/api/API_Subscribe.html">Subscribe</a>
  /// Amazon Simple Notification Service (Amazon SNS) API action.
  final String? snsTopicARN;

  Notification({
    this.devicePickupSnsTopicARN,
    this.jobStatesToNotify,
    this.notifyAll,
    this.snsTopicARN,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      devicePickupSnsTopicARN: json['DevicePickupSnsTopicARN'] as String?,
      jobStatesToNotify: (json['JobStatesToNotify'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toJobState())
          .toList(),
      notifyAll: json['NotifyAll'] as bool?,
      snsTopicARN: json['SnsTopicARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final devicePickupSnsTopicARN = this.devicePickupSnsTopicARN;
    final jobStatesToNotify = this.jobStatesToNotify;
    final notifyAll = this.notifyAll;
    final snsTopicARN = this.snsTopicARN;
    return {
      if (devicePickupSnsTopicARN != null)
        'DevicePickupSnsTopicARN': devicePickupSnsTopicARN,
      if (jobStatesToNotify != null)
        'JobStatesToNotify': jobStatesToNotify.map((e) => e.toValue()).toList(),
      if (notifyAll != null) 'NotifyAll': notifyAll,
      if (snsTopicARN != null) 'SnsTopicARN': snsTopicARN,
    };
  }
}

/// An object that represents the metadata and configuration settings for
/// services on an Amazon Web Services Snow Family device.
class OnDeviceServiceConfiguration {
  /// The configuration of EKS Anywhere on the Snow Family device.
  final EKSOnDeviceServiceConfiguration? eKSOnDeviceService;

  /// Represents the NFS (Network File System) service on a Snow Family device.
  final NFSOnDeviceServiceConfiguration? nFSOnDeviceService;

  /// Configuration for Amazon S3 compatible storage on Snow family devices.
  final S3OnDeviceServiceConfiguration? s3OnDeviceService;

  /// Represents the Storage Gateway service Tape Gateway type on a Snow Family
  /// device.
  final TGWOnDeviceServiceConfiguration? tGWOnDeviceService;

  OnDeviceServiceConfiguration({
    this.eKSOnDeviceService,
    this.nFSOnDeviceService,
    this.s3OnDeviceService,
    this.tGWOnDeviceService,
  });

  factory OnDeviceServiceConfiguration.fromJson(Map<String, dynamic> json) {
    return OnDeviceServiceConfiguration(
      eKSOnDeviceService: json['EKSOnDeviceService'] != null
          ? EKSOnDeviceServiceConfiguration.fromJson(
              json['EKSOnDeviceService'] as Map<String, dynamic>)
          : null,
      nFSOnDeviceService: json['NFSOnDeviceService'] != null
          ? NFSOnDeviceServiceConfiguration.fromJson(
              json['NFSOnDeviceService'] as Map<String, dynamic>)
          : null,
      s3OnDeviceService: json['S3OnDeviceService'] != null
          ? S3OnDeviceServiceConfiguration.fromJson(
              json['S3OnDeviceService'] as Map<String, dynamic>)
          : null,
      tGWOnDeviceService: json['TGWOnDeviceService'] != null
          ? TGWOnDeviceServiceConfiguration.fromJson(
              json['TGWOnDeviceService'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eKSOnDeviceService = this.eKSOnDeviceService;
    final nFSOnDeviceService = this.nFSOnDeviceService;
    final s3OnDeviceService = this.s3OnDeviceService;
    final tGWOnDeviceService = this.tGWOnDeviceService;
    return {
      if (eKSOnDeviceService != null) 'EKSOnDeviceService': eKSOnDeviceService,
      if (nFSOnDeviceService != null) 'NFSOnDeviceService': nFSOnDeviceService,
      if (s3OnDeviceService != null) 'S3OnDeviceService': s3OnDeviceService,
      if (tGWOnDeviceService != null) 'TGWOnDeviceService': tGWOnDeviceService,
    };
  }
}

/// Information identifying the person picking up the device.
class PickupDetails {
  /// The unique ID for a device that will be picked up.
  final String? devicePickupId;

  /// The email address of the person picking up the device.
  final String? email;

  /// Expiration date of the credential identifying the person picking up the
  /// device.
  final DateTime? identificationExpirationDate;

  /// Organization that issued the credential identifying the person picking up
  /// the device.
  final String? identificationIssuingOrg;

  /// The number on the credential identifying the person picking up the device.
  final String? identificationNumber;

  /// The name of the person picking up the device.
  final String? name;

  /// The phone number of the person picking up the device.
  final String? phoneNumber;

  PickupDetails({
    this.devicePickupId,
    this.email,
    this.identificationExpirationDate,
    this.identificationIssuingOrg,
    this.identificationNumber,
    this.name,
    this.phoneNumber,
  });

  factory PickupDetails.fromJson(Map<String, dynamic> json) {
    return PickupDetails(
      devicePickupId: json['DevicePickupId'] as String?,
      email: json['Email'] as String?,
      identificationExpirationDate:
          timeStampFromJson(json['IdentificationExpirationDate']),
      identificationIssuingOrg: json['IdentificationIssuingOrg'] as String?,
      identificationNumber: json['IdentificationNumber'] as String?,
      name: json['Name'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final devicePickupId = this.devicePickupId;
    final email = this.email;
    final identificationExpirationDate = this.identificationExpirationDate;
    final identificationIssuingOrg = this.identificationIssuingOrg;
    final identificationNumber = this.identificationNumber;
    final name = this.name;
    final phoneNumber = this.phoneNumber;
    return {
      if (devicePickupId != null) 'DevicePickupId': devicePickupId,
      if (email != null) 'Email': email,
      if (identificationExpirationDate != null)
        'IdentificationExpirationDate':
            unixTimestampToJson(identificationExpirationDate),
      if (identificationIssuingOrg != null)
        'IdentificationIssuingOrg': identificationIssuingOrg,
      if (identificationNumber != null)
        'IdentificationNumber': identificationNumber,
      if (name != null) 'Name': name,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
    };
  }
}

enum RemoteManagement {
  installedOnly,
  installedAutostart,
  notInstalled,
}

extension RemoteManagementValueExtension on RemoteManagement {
  String toValue() {
    switch (this) {
      case RemoteManagement.installedOnly:
        return 'INSTALLED_ONLY';
      case RemoteManagement.installedAutostart:
        return 'INSTALLED_AUTOSTART';
      case RemoteManagement.notInstalled:
        return 'NOT_INSTALLED';
    }
  }
}

extension RemoteManagementFromString on String {
  RemoteManagement toRemoteManagement() {
    switch (this) {
      case 'INSTALLED_ONLY':
        return RemoteManagement.installedOnly;
      case 'INSTALLED_AUTOSTART':
        return RemoteManagement.installedAutostart;
      case 'NOT_INSTALLED':
        return RemoteManagement.notInstalled;
    }
    throw Exception('$this is not known in enum RemoteManagement');
  }
}

/// Amazon S3 compatible storage on Snow family devices configuration items.
class S3OnDeviceServiceConfiguration {
  /// &gt;Fault tolerance level of the cluster. This indicates the number of nodes
  /// that can go down without degrading the performance of the cluster. This
  /// additional input helps when the specified <code>StorageLimit</code> matches
  /// more than one Amazon S3 compatible storage on Snow family devices service
  /// configuration.
  final int? faultTolerance;

  /// Applicable when creating a cluster. Specifies how many nodes are needed for
  /// Amazon S3 compatible storage on Snow family devices. If specified, the other
  /// input can be omitted.
  final int? serviceSize;

  /// If the specified storage limit value matches storage limit of one of the
  /// defined configurations, that configuration will be used. If the specified
  /// storage limit value does not match any defined configuration, the request
  /// will fail. If more than one configuration has the same storage limit as
  /// specified, the other input need to be provided.
  final double? storageLimit;

  /// Storage unit. Currently the only supported unit is TB.
  final StorageUnit? storageUnit;

  S3OnDeviceServiceConfiguration({
    this.faultTolerance,
    this.serviceSize,
    this.storageLimit,
    this.storageUnit,
  });

  factory S3OnDeviceServiceConfiguration.fromJson(Map<String, dynamic> json) {
    return S3OnDeviceServiceConfiguration(
      faultTolerance: json['FaultTolerance'] as int?,
      serviceSize: json['ServiceSize'] as int?,
      storageLimit: json['StorageLimit'] as double?,
      storageUnit: (json['StorageUnit'] as String?)?.toStorageUnit(),
    );
  }

  Map<String, dynamic> toJson() {
    final faultTolerance = this.faultTolerance;
    final serviceSize = this.serviceSize;
    final storageLimit = this.storageLimit;
    final storageUnit = this.storageUnit;
    return {
      if (faultTolerance != null) 'FaultTolerance': faultTolerance,
      if (serviceSize != null) 'ServiceSize': serviceSize,
      if (storageLimit != null) 'StorageLimit': storageLimit,
      if (storageUnit != null) 'StorageUnit': storageUnit.toValue(),
    };
  }
}

/// Each <code>S3Resource</code> object represents an Amazon S3 bucket that your
/// transferred data will be exported from or imported into. For export jobs,
/// this object can have an optional <code>KeyRange</code> value. The length of
/// the range is defined at job creation, and has either an inclusive
/// <code>BeginMarker</code>, an inclusive <code>EndMarker</code>, or both.
/// Ranges are UTF-8 binary sorted.
class S3Resource {
  /// The Amazon Resource Name (ARN) of an Amazon S3 bucket.
  final String? bucketArn;

  /// For export jobs, you can provide an optional <code>KeyRange</code> within a
  /// specific Amazon S3 bucket. The length of the range is defined at job
  /// creation, and has either an inclusive <code>BeginMarker</code>, an inclusive
  /// <code>EndMarker</code>, or both. Ranges are UTF-8 binary sorted.
  final KeyRange? keyRange;

  /// Specifies the service or services on the Snow Family device that your
  /// transferred data will be exported from or imported into. Amazon Web Services
  /// Snow Family supports Amazon S3 and NFS (Network File System).
  final List<TargetOnDeviceService>? targetOnDeviceServices;

  S3Resource({
    this.bucketArn,
    this.keyRange,
    this.targetOnDeviceServices,
  });

  factory S3Resource.fromJson(Map<String, dynamic> json) {
    return S3Resource(
      bucketArn: json['BucketArn'] as String?,
      keyRange: json['KeyRange'] != null
          ? KeyRange.fromJson(json['KeyRange'] as Map<String, dynamic>)
          : null,
      targetOnDeviceServices: (json['TargetOnDeviceServices'] as List?)
          ?.whereNotNull()
          .map((e) => TargetOnDeviceService.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bucketArn = this.bucketArn;
    final keyRange = this.keyRange;
    final targetOnDeviceServices = this.targetOnDeviceServices;
    return {
      if (bucketArn != null) 'BucketArn': bucketArn,
      if (keyRange != null) 'KeyRange': keyRange,
      if (targetOnDeviceServices != null)
        'TargetOnDeviceServices': targetOnDeviceServices,
    };
  }
}

enum ServiceName {
  kubernetes,
  eksAnywhere,
}

extension ServiceNameValueExtension on ServiceName {
  String toValue() {
    switch (this) {
      case ServiceName.kubernetes:
        return 'KUBERNETES';
      case ServiceName.eksAnywhere:
        return 'EKS_ANYWHERE';
    }
  }
}

extension ServiceNameFromString on String {
  ServiceName toServiceName() {
    switch (this) {
      case 'KUBERNETES':
        return ServiceName.kubernetes;
      case 'EKS_ANYWHERE':
        return ServiceName.eksAnywhere;
    }
    throw Exception('$this is not known in enum ServiceName');
  }
}

/// The version of the requested service.
class ServiceVersion {
  /// The version number of the requested service.
  final String? version;

  ServiceVersion({
    this.version,
  });

  factory ServiceVersion.fromJson(Map<String, dynamic> json) {
    return ServiceVersion(
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final version = this.version;
    return {
      if (version != null) 'Version': version,
    };
  }
}

/// The <code>Status</code> and <code>TrackingNumber</code> information for an
/// inbound or outbound shipment.
class Shipment {
  /// Status information for a shipment.
  final String? status;

  /// The tracking number for this job. Using this tracking number with your
  /// region's carrier's website, you can track a Snow device as the carrier
  /// transports it.
  ///
  /// For India, the carrier is Amazon Logistics. For all other regions, UPS is
  /// the carrier.
  final String? trackingNumber;

  Shipment({
    this.status,
    this.trackingNumber,
  });

  factory Shipment.fromJson(Map<String, dynamic> json) {
    return Shipment(
      status: json['Status'] as String?,
      trackingNumber: json['TrackingNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final trackingNumber = this.trackingNumber;
    return {
      if (status != null) 'Status': status,
      if (trackingNumber != null) 'TrackingNumber': trackingNumber,
    };
  }
}

enum ShipmentState {
  received,
  returned,
}

extension ShipmentStateValueExtension on ShipmentState {
  String toValue() {
    switch (this) {
      case ShipmentState.received:
        return 'RECEIVED';
      case ShipmentState.returned:
        return 'RETURNED';
    }
  }
}

extension ShipmentStateFromString on String {
  ShipmentState toShipmentState() {
    switch (this) {
      case 'RECEIVED':
        return ShipmentState.received;
      case 'RETURNED':
        return ShipmentState.returned;
    }
    throw Exception('$this is not known in enum ShipmentState');
  }
}

/// A job's shipping information, including inbound and outbound tracking
/// numbers and shipping speed options.
class ShippingDetails {
  /// The <code>Status</code> and <code>TrackingNumber</code> values for a Snow
  /// device being returned to Amazon Web Services for a particular job.
  final Shipment? inboundShipment;

  /// The <code>Status</code> and <code>TrackingNumber</code> values for a Snow
  /// device being delivered to the address that you specified for a particular
  /// job.
  final Shipment? outboundShipment;

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
  /// In India, Snow devices are delivered in one to seven days.
  /// </li>
  /// <li>
  /// In the United States of America (US), you have access to one-day shipping
  /// and two-day shipping.
  /// </li>
  /// </ul>
  final ShippingOption? shippingOption;

  ShippingDetails({
    this.inboundShipment,
    this.outboundShipment,
    this.shippingOption,
  });

  factory ShippingDetails.fromJson(Map<String, dynamic> json) {
    return ShippingDetails(
      inboundShipment: json['InboundShipment'] != null
          ? Shipment.fromJson(json['InboundShipment'] as Map<String, dynamic>)
          : null,
      outboundShipment: json['OutboundShipment'] != null
          ? Shipment.fromJson(json['OutboundShipment'] as Map<String, dynamic>)
          : null,
      shippingOption: (json['ShippingOption'] as String?)?.toShippingOption(),
    );
  }

  Map<String, dynamic> toJson() {
    final inboundShipment = this.inboundShipment;
    final outboundShipment = this.outboundShipment;
    final shippingOption = this.shippingOption;
    return {
      if (inboundShipment != null) 'InboundShipment': inboundShipment,
      if (outboundShipment != null) 'OutboundShipment': outboundShipment,
      if (shippingOption != null) 'ShippingOption': shippingOption.toValue(),
    };
  }
}

enum ShippingLabelStatus {
  inProgress,
  timedOut,
  succeeded,
  failed,
}

extension ShippingLabelStatusValueExtension on ShippingLabelStatus {
  String toValue() {
    switch (this) {
      case ShippingLabelStatus.inProgress:
        return 'InProgress';
      case ShippingLabelStatus.timedOut:
        return 'TimedOut';
      case ShippingLabelStatus.succeeded:
        return 'Succeeded';
      case ShippingLabelStatus.failed:
        return 'Failed';
    }
  }
}

extension ShippingLabelStatusFromString on String {
  ShippingLabelStatus toShippingLabelStatus() {
    switch (this) {
      case 'InProgress':
        return ShippingLabelStatus.inProgress;
      case 'TimedOut':
        return ShippingLabelStatus.timedOut;
      case 'Succeeded':
        return ShippingLabelStatus.succeeded;
      case 'Failed':
        return ShippingLabelStatus.failed;
    }
    throw Exception('$this is not known in enum ShippingLabelStatus');
  }
}

enum ShippingOption {
  secondDay,
  nextDay,
  express,
  standard,
}

extension ShippingOptionValueExtension on ShippingOption {
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
  }
}

extension ShippingOptionFromString on String {
  ShippingOption toShippingOption() {
    switch (this) {
      case 'SECOND_DAY':
        return ShippingOption.secondDay;
      case 'NEXT_DAY':
        return ShippingOption.nextDay;
      case 'EXPRESS':
        return ShippingOption.express;
      case 'STANDARD':
        return ShippingOption.standard;
    }
    throw Exception('$this is not known in enum ShippingOption');
  }
}

enum SnowballCapacity {
  t50,
  t80,
  t100,
  t42,
  t98,
  t8,
  t14,
  t32,
  noPreference,
  t240,
  t13,
}

extension SnowballCapacityValueExtension on SnowballCapacity {
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
      case SnowballCapacity.t14:
        return 'T14';
      case SnowballCapacity.t32:
        return 'T32';
      case SnowballCapacity.noPreference:
        return 'NoPreference';
      case SnowballCapacity.t240:
        return 'T240';
      case SnowballCapacity.t13:
        return 'T13';
    }
  }
}

extension SnowballCapacityFromString on String {
  SnowballCapacity toSnowballCapacity() {
    switch (this) {
      case 'T50':
        return SnowballCapacity.t50;
      case 'T80':
        return SnowballCapacity.t80;
      case 'T100':
        return SnowballCapacity.t100;
      case 'T42':
        return SnowballCapacity.t42;
      case 'T98':
        return SnowballCapacity.t98;
      case 'T8':
        return SnowballCapacity.t8;
      case 'T14':
        return SnowballCapacity.t14;
      case 'T32':
        return SnowballCapacity.t32;
      case 'NoPreference':
        return SnowballCapacity.noPreference;
      case 'T240':
        return SnowballCapacity.t240;
      case 'T13':
        return SnowballCapacity.t13;
    }
    throw Exception('$this is not known in enum SnowballCapacity');
  }
}

enum SnowballType {
  standard,
  edge,
  edgeC,
  edgeCg,
  edgeS,
  snc1Hdd,
  snc1Ssd,
  v3_5c,
  v3_5s,
  rack_5uC,
}

extension SnowballTypeValueExtension on SnowballType {
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
      case SnowballType.snc1Ssd:
        return 'SNC1_SSD';
      case SnowballType.v3_5c:
        return 'V3_5C';
      case SnowballType.v3_5s:
        return 'V3_5S';
      case SnowballType.rack_5uC:
        return 'RACK_5U_C';
    }
  }
}

extension SnowballTypeFromString on String {
  SnowballType toSnowballType() {
    switch (this) {
      case 'STANDARD':
        return SnowballType.standard;
      case 'EDGE':
        return SnowballType.edge;
      case 'EDGE_C':
        return SnowballType.edgeC;
      case 'EDGE_CG':
        return SnowballType.edgeCg;
      case 'EDGE_S':
        return SnowballType.edgeS;
      case 'SNC1_HDD':
        return SnowballType.snc1Hdd;
      case 'SNC1_SSD':
        return SnowballType.snc1Ssd;
      case 'V3_5C':
        return SnowballType.v3_5c;
      case 'V3_5S':
        return SnowballType.v3_5s;
      case 'RACK_5U_C':
        return SnowballType.rack_5uC;
    }
    throw Exception('$this is not known in enum SnowballType');
  }
}

/// Specifies the device configuration for an Snowcone job.
class SnowconeDeviceConfiguration {
  /// Configures the wireless connection for the Snowcone device.
  final WirelessConnection? wirelessConnection;

  SnowconeDeviceConfiguration({
    this.wirelessConnection,
  });

  factory SnowconeDeviceConfiguration.fromJson(Map<String, dynamic> json) {
    return SnowconeDeviceConfiguration(
      wirelessConnection: json['WirelessConnection'] != null
          ? WirelessConnection.fromJson(
              json['WirelessConnection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final wirelessConnection = this.wirelessConnection;
    return {
      if (wirelessConnection != null) 'WirelessConnection': wirelessConnection,
    };
  }
}

enum StorageUnit {
  tb,
}

extension StorageUnitValueExtension on StorageUnit {
  String toValue() {
    switch (this) {
      case StorageUnit.tb:
        return 'TB';
    }
  }
}

extension StorageUnitFromString on String {
  StorageUnit toStorageUnit() {
    switch (this) {
      case 'TB':
        return StorageUnit.tb;
    }
    throw Exception('$this is not known in enum StorageUnit');
  }
}

/// An object that represents the metadata and configuration settings for the
/// Storage Gateway service Tape Gateway type on an Amazon Web Services Snow
/// Family device.
class TGWOnDeviceServiceConfiguration {
  /// The maximum number of virtual tapes to store on one Snow Family device. Due
  /// to physical resource limitations, this value must be set to 80 for Snowball
  /// Edge.
  final int? storageLimit;

  /// The scale unit of the virtual tapes on the device.
  final StorageUnit? storageUnit;

  TGWOnDeviceServiceConfiguration({
    this.storageLimit,
    this.storageUnit,
  });

  factory TGWOnDeviceServiceConfiguration.fromJson(Map<String, dynamic> json) {
    return TGWOnDeviceServiceConfiguration(
      storageLimit: json['StorageLimit'] as int?,
      storageUnit: (json['StorageUnit'] as String?)?.toStorageUnit(),
    );
  }

  Map<String, dynamic> toJson() {
    final storageLimit = this.storageLimit;
    final storageUnit = this.storageUnit;
    return {
      if (storageLimit != null) 'StorageLimit': storageLimit,
      if (storageUnit != null) 'StorageUnit': storageUnit.toValue(),
    };
  }
}

/// An object that represents the service or services on the Snow Family device
/// that your transferred data will be exported from or imported into. Amazon
/// Web Services Snow Family supports Amazon S3 and NFS (Network File System).
class TargetOnDeviceService {
  /// Specifies the name of the service on the Snow Family device that your
  /// transferred data will be exported from or imported into.
  final DeviceServiceName? serviceName;

  /// Specifies whether the data is being imported or exported. You can import or
  /// export the data, or use it locally on the device.
  final TransferOption? transferOption;

  TargetOnDeviceService({
    this.serviceName,
    this.transferOption,
  });

  factory TargetOnDeviceService.fromJson(Map<String, dynamic> json) {
    return TargetOnDeviceService(
      serviceName: (json['ServiceName'] as String?)?.toDeviceServiceName(),
      transferOption: (json['TransferOption'] as String?)?.toTransferOption(),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceName = this.serviceName;
    final transferOption = this.transferOption;
    return {
      if (serviceName != null) 'ServiceName': serviceName.toValue(),
      if (transferOption != null) 'TransferOption': transferOption.toValue(),
    };
  }
}

/// The tax documents required in your Amazon Web Services Region.
class TaxDocuments {
  final INDTaxDocuments? ind;

  TaxDocuments({
    this.ind,
  });

  factory TaxDocuments.fromJson(Map<String, dynamic> json) {
    return TaxDocuments(
      ind: json['IND'] != null
          ? INDTaxDocuments.fromJson(json['IND'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ind = this.ind;
    return {
      if (ind != null) 'IND': ind,
    };
  }
}

enum TransferOption {
  import,
  export,
  localUse,
}

extension TransferOptionValueExtension on TransferOption {
  String toValue() {
    switch (this) {
      case TransferOption.import:
        return 'IMPORT';
      case TransferOption.export:
        return 'EXPORT';
      case TransferOption.localUse:
        return 'LOCAL_USE';
    }
  }
}

extension TransferOptionFromString on String {
  TransferOption toTransferOption() {
    switch (this) {
      case 'IMPORT':
        return TransferOption.import;
      case 'EXPORT':
        return TransferOption.export;
      case 'LOCAL_USE':
        return TransferOption.localUse;
    }
    throw Exception('$this is not known in enum TransferOption');
  }
}

class UpdateClusterResult {
  UpdateClusterResult();

  factory UpdateClusterResult.fromJson(Map<String, dynamic> _) {
    return UpdateClusterResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateJobResult {
  UpdateJobResult();

  factory UpdateJobResult.fromJson(Map<String, dynamic> _) {
    return UpdateJobResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateJobShipmentStateResult {
  UpdateJobShipmentStateResult();

  factory UpdateJobShipmentStateResult.fromJson(Map<String, dynamic> _) {
    return UpdateJobShipmentStateResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateLongTermPricingResult {
  UpdateLongTermPricingResult();

  factory UpdateLongTermPricingResult.fromJson(Map<String, dynamic> _) {
    return UpdateLongTermPricingResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Configures the wireless connection on an Snowcone device.
class WirelessConnection {
  /// Enables the Wi-Fi adapter on an Snowcone device.
  final bool? isWifiEnabled;

  WirelessConnection({
    this.isWifiEnabled,
  });

  factory WirelessConnection.fromJson(Map<String, dynamic> json) {
    return WirelessConnection(
      isWifiEnabled: json['IsWifiEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final isWifiEnabled = this.isWifiEnabled;
    return {
      if (isWifiEnabled != null) 'IsWifiEnabled': isWifiEnabled,
    };
  }
}

class ClusterLimitExceededException extends _s.GenericAwsException {
  ClusterLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ClusterLimitExceededException',
            message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class Ec2RequestFailedException extends _s.GenericAwsException {
  Ec2RequestFailedException({String? type, String? message})
      : super(type: type, code: 'Ec2RequestFailedException', message: message);
}

class InvalidAddressException extends _s.GenericAwsException {
  InvalidAddressException({String? type, String? message})
      : super(type: type, code: 'InvalidAddressException', message: message);
}

class InvalidInputCombinationException extends _s.GenericAwsException {
  InvalidInputCombinationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidInputCombinationException',
            message: message);
}

class InvalidJobStateException extends _s.GenericAwsException {
  InvalidJobStateException({String? type, String? message})
      : super(type: type, code: 'InvalidJobStateException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidResourceException extends _s.GenericAwsException {
  InvalidResourceException({String? type, String? message})
      : super(type: type, code: 'InvalidResourceException', message: message);
}

class KMSRequestFailedException extends _s.GenericAwsException {
  KMSRequestFailedException({String? type, String? message})
      : super(type: type, code: 'KMSRequestFailedException', message: message);
}

class ReturnShippingLabelAlreadyExistsException extends _s.GenericAwsException {
  ReturnShippingLabelAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ReturnShippingLabelAlreadyExistsException',
            message: message);
}

class UnsupportedAddressException extends _s.GenericAwsException {
  UnsupportedAddressException({String? type, String? message})
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

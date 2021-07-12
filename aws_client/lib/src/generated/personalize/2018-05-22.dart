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

/// Amazon Personalize is a machine learning service that makes it easy to add
/// individualized recommendations to customers.
class Personalize {
  final _s.JsonProtocol _protocol;
  Personalize({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'personalize',
            signingName: 'personalize',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a batch inference job. The operation can handle up to 50 million
  /// records and the input file must be in JSON format. For more information,
  /// see <a>recommendations-batch</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [jobInput] :
  /// The Amazon S3 path that leads to the input file to base your
  /// recommendations on. The input material must be in JSON format.
  ///
  /// Parameter [jobName] :
  /// The name of the batch inference job to create.
  ///
  /// Parameter [jobOutput] :
  /// The path to the Amazon S3 bucket where the job's output will be stored.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the Amazon Identity and Access Management role that has
  /// permissions to read and write to your input and output Amazon S3 buckets
  /// respectively.
  ///
  /// Parameter [solutionVersionArn] :
  /// The Amazon Resource Name (ARN) of the solution version that will be used
  /// to generate the batch inference recommendations.
  ///
  /// Parameter [batchInferenceJobConfig] :
  /// The configuration details of a batch inference job.
  ///
  /// Parameter [filterArn] :
  /// The ARN of the filter to apply to the batch inference job. For more
  /// information on using filters, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/filter-batch.html">Filtering
  /// Batch Recommendations</a>..
  ///
  /// Parameter [numResults] :
  /// The number of recommendations to retreive.
  Future<CreateBatchInferenceJobResponse> createBatchInferenceJob({
    required BatchInferenceJobInput jobInput,
    required String jobName,
    required BatchInferenceJobOutput jobOutput,
    required String roleArn,
    required String solutionVersionArn,
    BatchInferenceJobConfig? batchInferenceJobConfig,
    String? filterArn,
    int? numResults,
  }) async {
    ArgumentError.checkNotNull(jobInput, 'jobInput');
    ArgumentError.checkNotNull(jobName, 'jobName');
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      63,
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobOutput, 'jobOutput');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(solutionVersionArn, 'solutionVersionArn');
    _s.validateStringLength(
      'solutionVersionArn',
      solutionVersionArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'filterArn',
      filterArn,
      0,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.CreateBatchInferenceJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'jobInput': jobInput,
        'jobName': jobName,
        'jobOutput': jobOutput,
        'roleArn': roleArn,
        'solutionVersionArn': solutionVersionArn,
        if (batchInferenceJobConfig != null)
          'batchInferenceJobConfig': batchInferenceJobConfig,
        if (filterArn != null) 'filterArn': filterArn,
        if (numResults != null) 'numResults': numResults,
      },
    );

    return CreateBatchInferenceJobResponse.fromJson(jsonResponse.body);
  }

  /// Creates a campaign by deploying a solution version. When a client calls
  /// the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html">GetRecommendations</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetPersonalizedRanking.html">GetPersonalizedRanking</a>
  /// APIs, a campaign is specified in the request.
  ///
  /// <b>Minimum Provisioned TPS and Auto-Scaling</b>
  ///
  /// A transaction is a single <code>GetRecommendations</code> or
  /// <code>GetPersonalizedRanking</code> call. Transactions per second (TPS) is
  /// the throughput and unit of billing for Amazon Personalize. The minimum
  /// provisioned TPS (<code>minProvisionedTPS</code>) specifies the baseline
  /// throughput provisioned by Amazon Personalize, and thus, the minimum
  /// billing charge.
  ///
  /// If your TPS increases beyond <code>minProvisionedTPS</code>, Amazon
  /// Personalize auto-scales the provisioned capacity up and down, but never
  /// below <code>minProvisionedTPS</code>. There's a short time delay while the
  /// capacity is increased that might cause loss of transactions.
  ///
  /// The actual TPS used is calculated as the average requests/second within a
  /// 5-minute window. You pay for maximum of either the minimum provisioned TPS
  /// or the actual TPS. We recommend starting with a low
  /// <code>minProvisionedTPS</code>, track your usage using Amazon CloudWatch
  /// metrics, and then increase the <code>minProvisionedTPS</code> as
  /// necessary.
  ///
  /// <b>Status</b>
  ///
  /// A campaign can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// DELETE PENDING &gt; DELETE IN_PROGRESS
  /// </li>
  /// </ul>
  /// To get the campaign status, call <a>DescribeCampaign</a>.
  /// <note>
  /// Wait until the <code>status</code> of the campaign is <code>ACTIVE</code>
  /// before asking the campaign for recommendations.
  /// </note> <p class="title"> <b>Related APIs</b>
  ///
  /// <ul>
  /// <li>
  /// <a>ListCampaigns</a>
  /// </li>
  /// <li>
  /// <a>DescribeCampaign</a>
  /// </li>
  /// <li>
  /// <a>UpdateCampaign</a>
  /// </li>
  /// <li>
  /// <a>DeleteCampaign</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [minProvisionedTPS] :
  /// Specifies the requested minimum provisioned transactions (recommendations)
  /// per second that Amazon Personalize will support.
  ///
  /// Parameter [name] :
  /// A name for the new campaign. The campaign name must be unique within your
  /// account.
  ///
  /// Parameter [solutionVersionArn] :
  /// The Amazon Resource Name (ARN) of the solution version to deploy.
  ///
  /// Parameter [campaignConfig] :
  /// The configuration details of a campaign.
  Future<CreateCampaignResponse> createCampaign({
    required int minProvisionedTPS,
    required String name,
    required String solutionVersionArn,
    CampaignConfig? campaignConfig,
  }) async {
    ArgumentError.checkNotNull(minProvisionedTPS, 'minProvisionedTPS');
    _s.validateNumRange(
      'minProvisionedTPS',
      minProvisionedTPS,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      63,
      isRequired: true,
    );
    ArgumentError.checkNotNull(solutionVersionArn, 'solutionVersionArn');
    _s.validateStringLength(
      'solutionVersionArn',
      solutionVersionArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.CreateCampaign'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'minProvisionedTPS': minProvisionedTPS,
        'name': name,
        'solutionVersionArn': solutionVersionArn,
        if (campaignConfig != null) 'campaignConfig': campaignConfig,
      },
    );

    return CreateCampaignResponse.fromJson(jsonResponse.body);
  }

  /// Creates an empty dataset and adds it to the specified dataset group. Use
  /// <a>CreateDatasetImportJob</a> to import your training data to a dataset.
  ///
  /// There are three types of datasets:
  ///
  /// <ul>
  /// <li>
  /// Interactions
  /// </li>
  /// <li>
  /// Items
  /// </li>
  /// <li>
  /// Users
  /// </li>
  /// </ul>
  /// Each dataset type has an associated schema with required field types. Only
  /// the <code>Interactions</code> dataset is required in order to train a
  /// model (also referred to as creating a solution).
  ///
  /// A dataset can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// DELETE PENDING &gt; DELETE IN_PROGRESS
  /// </li>
  /// </ul>
  /// To get the status of the dataset, call <a>DescribeDataset</a>.
  /// <p class="title"> <b>Related APIs</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateDatasetGroup</a>
  /// </li>
  /// <li>
  /// <a>ListDatasets</a>
  /// </li>
  /// <li>
  /// <a>DescribeDataset</a>
  /// </li>
  /// <li>
  /// <a>DeleteDataset</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The Amazon Resource Name (ARN) of the dataset group to add the dataset to.
  ///
  /// Parameter [datasetType] :
  /// The type of dataset.
  ///
  /// One of the following (case insensitive) values:
  ///
  /// <ul>
  /// <li>
  /// Interactions
  /// </li>
  /// <li>
  /// Items
  /// </li>
  /// <li>
  /// Users
  /// </li>
  /// </ul>
  ///
  /// Parameter [name] :
  /// The name for the dataset.
  ///
  /// Parameter [schemaArn] :
  /// The ARN of the schema to associate with the dataset. The schema defines
  /// the dataset fields.
  Future<CreateDatasetResponse> createDataset({
    required String datasetGroupArn,
    required String datasetType,
    required String name,
    required String schemaArn,
  }) async {
    ArgumentError.checkNotNull(datasetGroupArn, 'datasetGroupArn');
    _s.validateStringLength(
      'datasetGroupArn',
      datasetGroupArn,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(datasetType, 'datasetType');
    _s.validateStringLength(
      'datasetType',
      datasetType,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      63,
      isRequired: true,
    );
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    _s.validateStringLength(
      'schemaArn',
      schemaArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.CreateDataset'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'datasetGroupArn': datasetGroupArn,
        'datasetType': datasetType,
        'name': name,
        'schemaArn': schemaArn,
      },
    );

    return CreateDatasetResponse.fromJson(jsonResponse.body);
  }

  /// Creates a job that exports data from your dataset to an Amazon S3 bucket.
  /// To allow Amazon Personalize to export the training data, you must specify
  /// an service-linked AWS Identity and Access Management (IAM) role that gives
  /// Amazon Personalize <code>PutObject</code> permissions for your Amazon S3
  /// bucket. For information, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/export-data.html">Exporting
  /// a dataset</a> in the Amazon Personalize developer guide.
  ///
  /// <b>Status</b>
  ///
  /// A dataset export job can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// </ul>
  /// To get the status of the export job, call <a>DescribeDatasetExportJob</a>,
  /// and specify the Amazon Resource Name (ARN) of the dataset export job. The
  /// dataset export is complete when the status shows as ACTIVE. If the status
  /// shows as CREATE FAILED, the response includes a <code>failureReason</code>
  /// key, which describes why the job failed.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [datasetArn] :
  /// The Amazon Resource Name (ARN) of the dataset that contains the data to
  /// export.
  ///
  /// Parameter [jobName] :
  /// The name for the dataset export job.
  ///
  /// Parameter [jobOutput] :
  /// The path to the Amazon S3 bucket where the job's output is stored.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// service role that has permissions to add data to your output Amazon S3
  /// bucket.
  ///
  /// Parameter [ingestionMode] :
  /// The data to export, based on how you imported the data. You can choose to
  /// export only <code>BULK</code> data that you imported using a dataset
  /// import job, only <code>PUT</code> data that you imported incrementally
  /// (using the console, PutEvents, PutUsers and PutItems operations), or
  /// <code>ALL</code> for both types. The default value is <code>PUT</code>.
  Future<CreateDatasetExportJobResponse> createDatasetExportJob({
    required String datasetArn,
    required String jobName,
    required DatasetExportJobOutput jobOutput,
    required String roleArn,
    IngestionMode? ingestionMode,
  }) async {
    ArgumentError.checkNotNull(datasetArn, 'datasetArn');
    _s.validateStringLength(
      'datasetArn',
      datasetArn,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobName, 'jobName');
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      63,
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobOutput, 'jobOutput');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.CreateDatasetExportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'datasetArn': datasetArn,
        'jobName': jobName,
        'jobOutput': jobOutput,
        'roleArn': roleArn,
        if (ingestionMode != null) 'ingestionMode': ingestionMode.toValue(),
      },
    );

    return CreateDatasetExportJobResponse.fromJson(jsonResponse.body);
  }

  /// Creates an empty dataset group. A dataset group contains related datasets
  /// that supply data for training a model. A dataset group can contain at most
  /// three datasets, one for each type of dataset:
  ///
  /// <ul>
  /// <li>
  /// Interactions
  /// </li>
  /// <li>
  /// Items
  /// </li>
  /// <li>
  /// Users
  /// </li>
  /// </ul>
  /// To train a model (create a solution), a dataset group that contains an
  /// <code>Interactions</code> dataset is required. Call <a>CreateDataset</a>
  /// to add a dataset to the group.
  ///
  /// A dataset group can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// DELETE PENDING
  /// </li>
  /// </ul>
  /// To get the status of the dataset group, call <a>DescribeDatasetGroup</a>.
  /// If the status shows as CREATE FAILED, the response includes a
  /// <code>failureReason</code> key, which describes why the creation failed.
  /// <note>
  /// You must wait until the <code>status</code> of the dataset group is
  /// <code>ACTIVE</code> before adding a dataset to the group.
  /// </note>
  /// You can specify an AWS Key Management Service (KMS) key to encrypt the
  /// datasets in the group. If you specify a KMS key, you must also include an
  /// AWS Identity and Access Management (IAM) role that has permission to
  /// access the key.
  /// <p class="title"> <b>APIs that require a dataset group ARN in the
  /// request</b>
  ///
  /// <ul>
  /// <li>
  /// <a>CreateDataset</a>
  /// </li>
  /// <li>
  /// <a>CreateEventTracker</a>
  /// </li>
  /// <li>
  /// <a>CreateSolution</a>
  /// </li>
  /// </ul> <p class="title"> <b>Related APIs</b>
  ///
  /// <ul>
  /// <li>
  /// <a>ListDatasetGroups</a>
  /// </li>
  /// <li>
  /// <a>DescribeDatasetGroup</a>
  /// </li>
  /// <li>
  /// <a>DeleteDatasetGroup</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [name] :
  /// The name for the new dataset group.
  ///
  /// Parameter [kmsKeyArn] :
  /// The Amazon Resource Name (ARN) of a KMS key used to encrypt the datasets.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the IAM role that has permissions to access the KMS key.
  /// Supplying an IAM role is only valid when also specifying a KMS key.
  Future<CreateDatasetGroupResponse> createDatasetGroup({
    required String name,
    String? kmsKeyArn,
    String? roleArn,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringLength(
      'roleArn',
      roleArn,
      0,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.CreateDatasetGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
        if (roleArn != null) 'roleArn': roleArn,
      },
    );

    return CreateDatasetGroupResponse.fromJson(jsonResponse.body);
  }

  /// Creates a job that imports training data from your data source (an Amazon
  /// S3 bucket) to an Amazon Personalize dataset. To allow Amazon Personalize
  /// to import the training data, you must specify an AWS Identity and Access
  /// Management (IAM) service role that has permission to read from the data
  /// source, as Amazon Personalize makes a copy of your data and processes it
  /// in an internal AWS system. For information on granting access to your
  /// Amazon S3 bucket, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/granting-personalize-s3-access.html">Giving
  /// Amazon Personalize Access to Amazon S3 Resources</a>.
  /// <important>
  /// The dataset import job replaces any existing data in the dataset that you
  /// imported in bulk.
  /// </important>
  /// <b>Status</b>
  ///
  /// A dataset import job can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// </ul>
  /// To get the status of the import job, call <a>DescribeDatasetImportJob</a>,
  /// providing the Amazon Resource Name (ARN) of the dataset import job. The
  /// dataset import is complete when the status shows as ACTIVE. If the status
  /// shows as CREATE FAILED, the response includes a <code>failureReason</code>
  /// key, which describes why the job failed.
  /// <note>
  /// Importing takes time. You must wait until the status shows as ACTIVE
  /// before training a model using the dataset.
  /// </note> <p class="title"> <b>Related APIs</b>
  ///
  /// <ul>
  /// <li>
  /// <a>ListDatasetImportJobs</a>
  /// </li>
  /// <li>
  /// <a>DescribeDatasetImportJob</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [dataSource] :
  /// The Amazon S3 bucket that contains the training data to import.
  ///
  /// Parameter [datasetArn] :
  /// The ARN of the dataset that receives the imported data.
  ///
  /// Parameter [jobName] :
  /// The name for the dataset import job.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the IAM role that has permissions to read from the Amazon S3
  /// data source.
  Future<CreateDatasetImportJobResponse> createDatasetImportJob({
    required DataSource dataSource,
    required String datasetArn,
    required String jobName,
    required String roleArn,
  }) async {
    ArgumentError.checkNotNull(dataSource, 'dataSource');
    ArgumentError.checkNotNull(datasetArn, 'datasetArn');
    _s.validateStringLength(
      'datasetArn',
      datasetArn,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobName, 'jobName');
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      63,
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.CreateDatasetImportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'dataSource': dataSource,
        'datasetArn': datasetArn,
        'jobName': jobName,
        'roleArn': roleArn,
      },
    );

    return CreateDatasetImportJobResponse.fromJson(jsonResponse.body);
  }

  /// Creates an event tracker that you use when adding event data to a
  /// specified dataset group using the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html">PutEvents</a>
  /// API.
  /// <note>
  /// Only one event tracker can be associated with a dataset group. You will
  /// get an error if you call <code>CreateEventTracker</code> using the same
  /// dataset group as an existing event tracker.
  /// </note>
  /// When you create an event tracker, the response includes a tracking ID,
  /// which you pass as a parameter when you use the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html">PutEvents</a>
  /// operation. Amazon Personalize then appends the event data to the
  /// Interactions dataset of the dataset group you specify in your event
  /// tracker.
  ///
  /// The event tracker can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// DELETE PENDING &gt; DELETE IN_PROGRESS
  /// </li>
  /// </ul>
  /// To get the status of the event tracker, call <a>DescribeEventTracker</a>.
  /// <note>
  /// The event tracker must be in the ACTIVE state before using the tracking
  /// ID.
  /// </note> <p class="title"> <b>Related APIs</b>
  ///
  /// <ul>
  /// <li>
  /// <a>ListEventTrackers</a>
  /// </li>
  /// <li>
  /// <a>DescribeEventTracker</a>
  /// </li>
  /// <li>
  /// <a>DeleteEventTracker</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The Amazon Resource Name (ARN) of the dataset group that receives the
  /// event data.
  ///
  /// Parameter [name] :
  /// The name for the event tracker.
  Future<CreateEventTrackerResponse> createEventTracker({
    required String datasetGroupArn,
    required String name,
  }) async {
    ArgumentError.checkNotNull(datasetGroupArn, 'datasetGroupArn');
    _s.validateStringLength(
      'datasetGroupArn',
      datasetGroupArn,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      63,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.CreateEventTracker'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'datasetGroupArn': datasetGroupArn,
        'name': name,
      },
    );

    return CreateEventTrackerResponse.fromJson(jsonResponse.body);
  }

  /// Creates a recommendation filter. For more information, see <a>filter</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The ARN of the dataset group that the filter will belong to.
  ///
  /// Parameter [filterExpression] :
  /// The filter expression defines which items are included or excluded from
  /// recommendations. Filter expression must follow specific format rules. For
  /// information about filter expression structure and syntax, see
  /// <a>filter-expressions</a>.
  ///
  /// Parameter [name] :
  /// The name of the filter to create.
  Future<CreateFilterResponse> createFilter({
    required String datasetGroupArn,
    required String filterExpression,
    required String name,
  }) async {
    ArgumentError.checkNotNull(datasetGroupArn, 'datasetGroupArn');
    _s.validateStringLength(
      'datasetGroupArn',
      datasetGroupArn,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(filterExpression, 'filterExpression');
    _s.validateStringLength(
      'filterExpression',
      filterExpression,
      1,
      2500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      63,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.CreateFilter'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'datasetGroupArn': datasetGroupArn,
        'filterExpression': filterExpression,
        'name': name,
      },
    );

    return CreateFilterResponse.fromJson(jsonResponse.body);
  }

  /// Creates an Amazon Personalize schema from the specified schema string. The
  /// schema you create must be in Avro JSON format.
  ///
  /// Amazon Personalize recognizes three schema variants. Each schema is
  /// associated with a dataset type and has a set of required field and
  /// keywords. You specify a schema when you call <a>CreateDataset</a>.
  /// <p class="title"> <b>Related APIs</b>
  ///
  /// <ul>
  /// <li>
  /// <a>ListSchemas</a>
  /// </li>
  /// <li>
  /// <a>DescribeSchema</a>
  /// </li>
  /// <li>
  /// <a>DeleteSchema</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [name] :
  /// The name for the schema.
  ///
  /// Parameter [schema] :
  /// A schema in Avro JSON format.
  Future<CreateSchemaResponse> createSchema({
    required String name,
    required String schema,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      63,
      isRequired: true,
    );
    ArgumentError.checkNotNull(schema, 'schema');
    _s.validateStringLength(
      'schema',
      schema,
      0,
      10000,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.CreateSchema'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'schema': schema,
      },
    );

    return CreateSchemaResponse.fromJson(jsonResponse.body);
  }

  /// Creates the configuration for training a model. A trained model is known
  /// as a solution. After the configuration is created, you train the model
  /// (create a solution) by calling the <a>CreateSolutionVersion</a> operation.
  /// Every time you call <code>CreateSolutionVersion</code>, a new version of
  /// the solution is created.
  ///
  /// After creating a solution version, you check its accuracy by calling
  /// <a>GetSolutionMetrics</a>. When you are satisfied with the version, you
  /// deploy it using <a>CreateCampaign</a>. The campaign provides
  /// recommendations to a client through the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html">GetRecommendations</a>
  /// API.
  ///
  /// To train a model, Amazon Personalize requires training data and a recipe.
  /// The training data comes from the dataset group that you provide in the
  /// request. A recipe specifies the training algorithm and a feature
  /// transformation. You can specify one of the predefined recipes provided by
  /// Amazon Personalize. Alternatively, you can specify
  /// <code>performAutoML</code> and Amazon Personalize will analyze your data
  /// and select the optimum USER_PERSONALIZATION recipe for you.
  /// <note>
  /// Amazon Personalize doesn't support configuring the
  /// <code>hpoObjective</code> for solution hyperparameter optimization at this
  /// time.
  /// </note>
  /// <b>Status</b>
  ///
  /// A solution can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// DELETE PENDING &gt; DELETE IN_PROGRESS
  /// </li>
  /// </ul>
  /// To get the status of the solution, call <a>DescribeSolution</a>. Wait
  /// until the status shows as ACTIVE before calling
  /// <code>CreateSolutionVersion</code>.
  /// <p class="title"> <b>Related APIs</b>
  ///
  /// <ul>
  /// <li>
  /// <a>ListSolutions</a>
  /// </li>
  /// <li>
  /// <a>CreateSolutionVersion</a>
  /// </li>
  /// <li>
  /// <a>DescribeSolution</a>
  /// </li>
  /// <li>
  /// <a>DeleteSolution</a>
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// <a>ListSolutionVersions</a>
  /// </li>
  /// <li>
  /// <a>DescribeSolutionVersion</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The Amazon Resource Name (ARN) of the dataset group that provides the
  /// training data.
  ///
  /// Parameter [name] :
  /// The name for the solution.
  ///
  /// Parameter [eventType] :
  /// When your have multiple event types (using an <code>EVENT_TYPE</code>
  /// schema field), this parameter specifies which event type (for example,
  /// 'click' or 'like') is used for training the model.
  ///
  /// If you do not provide an <code>eventType</code>, Amazon Personalize will
  /// use all interactions for training with equal weight regardless of type.
  ///
  /// Parameter [performAutoML] :
  /// Whether to perform automated machine learning (AutoML). The default is
  /// <code>false</code>. For this case, you must specify
  /// <code>recipeArn</code>.
  ///
  /// When set to <code>true</code>, Amazon Personalize analyzes your training
  /// data and selects the optimal USER_PERSONALIZATION recipe and
  /// hyperparameters. In this case, you must omit <code>recipeArn</code>.
  /// Amazon Personalize determines the optimal recipe by running tests with
  /// different values for the hyperparameters. AutoML lengthens the training
  /// process as compared to selecting a specific recipe.
  ///
  /// Parameter [performHPO] :
  /// Whether to perform hyperparameter optimization (HPO) on the specified or
  /// selected recipe. The default is <code>false</code>.
  ///
  /// When performing AutoML, this parameter is always <code>true</code> and you
  /// should not set it to <code>false</code>.
  ///
  /// Parameter [recipeArn] :
  /// The ARN of the recipe to use for model training. Only specified when
  /// <code>performAutoML</code> is false.
  ///
  /// Parameter [solutionConfig] :
  /// The configuration to use with the solution. When
  /// <code>performAutoML</code> is set to true, Amazon Personalize only
  /// evaluates the <code>autoMLConfig</code> section of the solution
  /// configuration.
  /// <note>
  /// Amazon Personalize doesn't support configuring the
  /// <code>hpoObjective</code> at this time.
  /// </note>
  Future<CreateSolutionResponse> createSolution({
    required String datasetGroupArn,
    required String name,
    String? eventType,
    bool? performAutoML,
    bool? performHPO,
    String? recipeArn,
    SolutionConfig? solutionConfig,
  }) async {
    ArgumentError.checkNotNull(datasetGroupArn, 'datasetGroupArn');
    _s.validateStringLength(
      'datasetGroupArn',
      datasetGroupArn,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringLength(
      'eventType',
      eventType,
      0,
      256,
    );
    _s.validateStringLength(
      'recipeArn',
      recipeArn,
      0,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.CreateSolution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'datasetGroupArn': datasetGroupArn,
        'name': name,
        if (eventType != null) 'eventType': eventType,
        if (performAutoML != null) 'performAutoML': performAutoML,
        if (performHPO != null) 'performHPO': performHPO,
        if (recipeArn != null) 'recipeArn': recipeArn,
        if (solutionConfig != null) 'solutionConfig': solutionConfig,
      },
    );

    return CreateSolutionResponse.fromJson(jsonResponse.body);
  }

  /// Trains or retrains an active solution. A solution is created using the
  /// <a>CreateSolution</a> operation and must be in the ACTIVE state before
  /// calling <code>CreateSolutionVersion</code>. A new version of the solution
  /// is created every time you call this operation.
  ///
  /// <b>Status</b>
  ///
  /// A solution version can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING
  /// </li>
  /// <li>
  /// CREATE IN_PROGRESS
  /// </li>
  /// <li>
  /// ACTIVE
  /// </li>
  /// <li>
  /// CREATE FAILED
  /// </li>
  /// <li>
  /// CREATE STOPPING
  /// </li>
  /// <li>
  /// CREATE STOPPED
  /// </li>
  /// </ul>
  /// To get the status of the version, call <a>DescribeSolutionVersion</a>.
  /// Wait until the status shows as ACTIVE before calling
  /// <code>CreateCampaign</code>.
  ///
  /// If the status shows as CREATE FAILED, the response includes a
  /// <code>failureReason</code> key, which describes why the job failed.
  /// <p class="title"> <b>Related APIs</b>
  ///
  /// <ul>
  /// <li>
  /// <a>ListSolutionVersions</a>
  /// </li>
  /// <li>
  /// <a>DescribeSolutionVersion</a>
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// <a>ListSolutions</a>
  /// </li>
  /// <li>
  /// <a>CreateSolution</a>
  /// </li>
  /// <li>
  /// <a>DescribeSolution</a>
  /// </li>
  /// <li>
  /// <a>DeleteSolution</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [solutionArn] :
  /// The Amazon Resource Name (ARN) of the solution containing the training
  /// configuration information.
  ///
  /// Parameter [trainingMode] :
  /// The scope of training to be performed when creating the solution version.
  /// The <code>FULL</code> option trains the solution version based on the
  /// entirety of the input solution's training data, while the
  /// <code>UPDATE</code> option processes only the data that has changed in
  /// comparison to the input solution. Choose <code>UPDATE</code> when you want
  /// to incrementally update your solution version instead of creating an
  /// entirely new one.
  /// <important>
  /// The <code>UPDATE</code> option can only be used when you already have an
  /// active solution version created from the input solution using the
  /// <code>FULL</code> option and the input solution was trained with the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/native-recipe-new-item-USER_PERSONALIZATION.html">User-Personalization</a>
  /// recipe or the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/native-recipe-hrnn-coldstart.html">HRNN-Coldstart</a>
  /// recipe.
  /// </important>
  Future<CreateSolutionVersionResponse> createSolutionVersion({
    required String solutionArn,
    TrainingMode? trainingMode,
  }) async {
    ArgumentError.checkNotNull(solutionArn, 'solutionArn');
    _s.validateStringLength(
      'solutionArn',
      solutionArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.CreateSolutionVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'solutionArn': solutionArn,
        if (trainingMode != null) 'trainingMode': trainingMode.toValue(),
      },
    );

    return CreateSolutionVersionResponse.fromJson(jsonResponse.body);
  }

  /// Removes a campaign by deleting the solution deployment. The solution that
  /// the campaign is based on is not deleted and can be redeployed when needed.
  /// A deleted campaign can no longer be specified in a <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html">GetRecommendations</a>
  /// request. For more information on campaigns, see <a>CreateCampaign</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [campaignArn] :
  /// The Amazon Resource Name (ARN) of the campaign to delete.
  Future<void> deleteCampaign({
    required String campaignArn,
  }) async {
    ArgumentError.checkNotNull(campaignArn, 'campaignArn');
    _s.validateStringLength(
      'campaignArn',
      campaignArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DeleteCampaign'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'campaignArn': campaignArn,
      },
    );
  }

  /// Deletes a dataset. You can't delete a dataset if an associated
  /// <code>DatasetImportJob</code> or <code>SolutionVersion</code> is in the
  /// CREATE PENDING or IN PROGRESS state. For more information on datasets, see
  /// <a>CreateDataset</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [datasetArn] :
  /// The Amazon Resource Name (ARN) of the dataset to delete.
  Future<void> deleteDataset({
    required String datasetArn,
  }) async {
    ArgumentError.checkNotNull(datasetArn, 'datasetArn');
    _s.validateStringLength(
      'datasetArn',
      datasetArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DeleteDataset'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'datasetArn': datasetArn,
      },
    );
  }

  /// Deletes a dataset group. Before you delete a dataset group, you must
  /// delete the following:
  ///
  /// <ul>
  /// <li>
  /// All associated event trackers.
  /// </li>
  /// <li>
  /// All associated solutions.
  /// </li>
  /// <li>
  /// All datasets in the dataset group.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The ARN of the dataset group to delete.
  Future<void> deleteDatasetGroup({
    required String datasetGroupArn,
  }) async {
    ArgumentError.checkNotNull(datasetGroupArn, 'datasetGroupArn');
    _s.validateStringLength(
      'datasetGroupArn',
      datasetGroupArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DeleteDatasetGroup'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'datasetGroupArn': datasetGroupArn,
      },
    );
  }

  /// Deletes the event tracker. Does not delete the event-interactions dataset
  /// from the associated dataset group. For more information on event trackers,
  /// see <a>CreateEventTracker</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [eventTrackerArn] :
  /// The Amazon Resource Name (ARN) of the event tracker to delete.
  Future<void> deleteEventTracker({
    required String eventTrackerArn,
  }) async {
    ArgumentError.checkNotNull(eventTrackerArn, 'eventTrackerArn');
    _s.validateStringLength(
      'eventTrackerArn',
      eventTrackerArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DeleteEventTracker'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'eventTrackerArn': eventTrackerArn,
      },
    );
  }

  /// Deletes a filter.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [filterArn] :
  /// The ARN of the filter to delete.
  Future<void> deleteFilter({
    required String filterArn,
  }) async {
    ArgumentError.checkNotNull(filterArn, 'filterArn');
    _s.validateStringLength(
      'filterArn',
      filterArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DeleteFilter'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'filterArn': filterArn,
      },
    );
  }

  /// Deletes a schema. Before deleting a schema, you must delete all datasets
  /// referencing the schema. For more information on schemas, see
  /// <a>CreateSchema</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [schemaArn] :
  /// The Amazon Resource Name (ARN) of the schema to delete.
  Future<void> deleteSchema({
    required String schemaArn,
  }) async {
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    _s.validateStringLength(
      'schemaArn',
      schemaArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DeleteSchema'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'schemaArn': schemaArn,
      },
    );
  }

  /// Deletes all versions of a solution and the <code>Solution</code> object
  /// itself. Before deleting a solution, you must delete all campaigns based on
  /// the solution. To determine what campaigns are using the solution, call
  /// <a>ListCampaigns</a> and supply the Amazon Resource Name (ARN) of the
  /// solution. You can't delete a solution if an associated
  /// <code>SolutionVersion</code> is in the CREATE PENDING or IN PROGRESS
  /// state. For more information on solutions, see <a>CreateSolution</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [solutionArn] :
  /// The ARN of the solution to delete.
  Future<void> deleteSolution({
    required String solutionArn,
  }) async {
    ArgumentError.checkNotNull(solutionArn, 'solutionArn');
    _s.validateStringLength(
      'solutionArn',
      solutionArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DeleteSolution'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'solutionArn': solutionArn,
      },
    );
  }

  /// Describes the given algorithm.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [algorithmArn] :
  /// The Amazon Resource Name (ARN) of the algorithm to describe.
  Future<DescribeAlgorithmResponse> describeAlgorithm({
    required String algorithmArn,
  }) async {
    ArgumentError.checkNotNull(algorithmArn, 'algorithmArn');
    _s.validateStringLength(
      'algorithmArn',
      algorithmArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DescribeAlgorithm'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'algorithmArn': algorithmArn,
      },
    );

    return DescribeAlgorithmResponse.fromJson(jsonResponse.body);
  }

  /// Gets the properties of a batch inference job including name, Amazon
  /// Resource Name (ARN), status, input and output configurations, and the ARN
  /// of the solution version used to generate the recommendations.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [batchInferenceJobArn] :
  /// The ARN of the batch inference job to describe.
  Future<DescribeBatchInferenceJobResponse> describeBatchInferenceJob({
    required String batchInferenceJobArn,
  }) async {
    ArgumentError.checkNotNull(batchInferenceJobArn, 'batchInferenceJobArn');
    _s.validateStringLength(
      'batchInferenceJobArn',
      batchInferenceJobArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DescribeBatchInferenceJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'batchInferenceJobArn': batchInferenceJobArn,
      },
    );

    return DescribeBatchInferenceJobResponse.fromJson(jsonResponse.body);
  }

  /// Describes the given campaign, including its status.
  ///
  /// A campaign can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// DELETE PENDING &gt; DELETE IN_PROGRESS
  /// </li>
  /// </ul>
  /// When the <code>status</code> is <code>CREATE FAILED</code>, the response
  /// includes the <code>failureReason</code> key, which describes why.
  ///
  /// For more information on campaigns, see <a>CreateCampaign</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [campaignArn] :
  /// The Amazon Resource Name (ARN) of the campaign.
  Future<DescribeCampaignResponse> describeCampaign({
    required String campaignArn,
  }) async {
    ArgumentError.checkNotNull(campaignArn, 'campaignArn');
    _s.validateStringLength(
      'campaignArn',
      campaignArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DescribeCampaign'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'campaignArn': campaignArn,
      },
    );

    return DescribeCampaignResponse.fromJson(jsonResponse.body);
  }

  /// Describes the given dataset. For more information on datasets, see
  /// <a>CreateDataset</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [datasetArn] :
  /// The Amazon Resource Name (ARN) of the dataset to describe.
  Future<DescribeDatasetResponse> describeDataset({
    required String datasetArn,
  }) async {
    ArgumentError.checkNotNull(datasetArn, 'datasetArn');
    _s.validateStringLength(
      'datasetArn',
      datasetArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DescribeDataset'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'datasetArn': datasetArn,
      },
    );

    return DescribeDatasetResponse.fromJson(jsonResponse.body);
  }

  /// Describes the dataset export job created by <a>CreateDatasetExportJob</a>,
  /// including the export job status.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [datasetExportJobArn] :
  /// The Amazon Resource Name (ARN) of the dataset export job to describe.
  Future<DescribeDatasetExportJobResponse> describeDatasetExportJob({
    required String datasetExportJobArn,
  }) async {
    ArgumentError.checkNotNull(datasetExportJobArn, 'datasetExportJobArn');
    _s.validateStringLength(
      'datasetExportJobArn',
      datasetExportJobArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DescribeDatasetExportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'datasetExportJobArn': datasetExportJobArn,
      },
    );

    return DescribeDatasetExportJobResponse.fromJson(jsonResponse.body);
  }

  /// Describes the given dataset group. For more information on dataset groups,
  /// see <a>CreateDatasetGroup</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The Amazon Resource Name (ARN) of the dataset group to describe.
  Future<DescribeDatasetGroupResponse> describeDatasetGroup({
    required String datasetGroupArn,
  }) async {
    ArgumentError.checkNotNull(datasetGroupArn, 'datasetGroupArn');
    _s.validateStringLength(
      'datasetGroupArn',
      datasetGroupArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DescribeDatasetGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'datasetGroupArn': datasetGroupArn,
      },
    );

    return DescribeDatasetGroupResponse.fromJson(jsonResponse.body);
  }

  /// Describes the dataset import job created by <a>CreateDatasetImportJob</a>,
  /// including the import job status.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [datasetImportJobArn] :
  /// The Amazon Resource Name (ARN) of the dataset import job to describe.
  Future<DescribeDatasetImportJobResponse> describeDatasetImportJob({
    required String datasetImportJobArn,
  }) async {
    ArgumentError.checkNotNull(datasetImportJobArn, 'datasetImportJobArn');
    _s.validateStringLength(
      'datasetImportJobArn',
      datasetImportJobArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DescribeDatasetImportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'datasetImportJobArn': datasetImportJobArn,
      },
    );

    return DescribeDatasetImportJobResponse.fromJson(jsonResponse.body);
  }

  /// Describes an event tracker. The response includes the
  /// <code>trackingId</code> and <code>status</code> of the event tracker. For
  /// more information on event trackers, see <a>CreateEventTracker</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [eventTrackerArn] :
  /// The Amazon Resource Name (ARN) of the event tracker to describe.
  Future<DescribeEventTrackerResponse> describeEventTracker({
    required String eventTrackerArn,
  }) async {
    ArgumentError.checkNotNull(eventTrackerArn, 'eventTrackerArn');
    _s.validateStringLength(
      'eventTrackerArn',
      eventTrackerArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DescribeEventTracker'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'eventTrackerArn': eventTrackerArn,
      },
    );

    return DescribeEventTrackerResponse.fromJson(jsonResponse.body);
  }

  /// Describes the given feature transformation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [featureTransformationArn] :
  /// The Amazon Resource Name (ARN) of the feature transformation to describe.
  Future<DescribeFeatureTransformationResponse> describeFeatureTransformation({
    required String featureTransformationArn,
  }) async {
    ArgumentError.checkNotNull(
        featureTransformationArn, 'featureTransformationArn');
    _s.validateStringLength(
      'featureTransformationArn',
      featureTransformationArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DescribeFeatureTransformation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'featureTransformationArn': featureTransformationArn,
      },
    );

    return DescribeFeatureTransformationResponse.fromJson(jsonResponse.body);
  }

  /// Describes a filter's properties.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [filterArn] :
  /// The ARN of the filter to describe.
  Future<DescribeFilterResponse> describeFilter({
    required String filterArn,
  }) async {
    ArgumentError.checkNotNull(filterArn, 'filterArn');
    _s.validateStringLength(
      'filterArn',
      filterArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DescribeFilter'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'filterArn': filterArn,
      },
    );

    return DescribeFilterResponse.fromJson(jsonResponse.body);
  }

  /// Describes a recipe.
  ///
  /// A recipe contains three items:
  ///
  /// <ul>
  /// <li>
  /// An algorithm that trains a model.
  /// </li>
  /// <li>
  /// Hyperparameters that govern the training.
  /// </li>
  /// <li>
  /// Feature transformation information for modifying the input data before
  /// training.
  /// </li>
  /// </ul>
  /// Amazon Personalize provides a set of predefined recipes. You specify a
  /// recipe when you create a solution with the <a>CreateSolution</a> API.
  /// <code>CreateSolution</code> trains a model by using the algorithm in the
  /// specified recipe and a training dataset. The solution, when deployed as a
  /// campaign, can provide recommendations using the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html">GetRecommendations</a>
  /// API.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [recipeArn] :
  /// The Amazon Resource Name (ARN) of the recipe to describe.
  Future<DescribeRecipeResponse> describeRecipe({
    required String recipeArn,
  }) async {
    ArgumentError.checkNotNull(recipeArn, 'recipeArn');
    _s.validateStringLength(
      'recipeArn',
      recipeArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DescribeRecipe'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'recipeArn': recipeArn,
      },
    );

    return DescribeRecipeResponse.fromJson(jsonResponse.body);
  }

  /// Describes a schema. For more information on schemas, see
  /// <a>CreateSchema</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [schemaArn] :
  /// The Amazon Resource Name (ARN) of the schema to retrieve.
  Future<DescribeSchemaResponse> describeSchema({
    required String schemaArn,
  }) async {
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    _s.validateStringLength(
      'schemaArn',
      schemaArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DescribeSchema'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'schemaArn': schemaArn,
      },
    );

    return DescribeSchemaResponse.fromJson(jsonResponse.body);
  }

  /// Describes a solution. For more information on solutions, see
  /// <a>CreateSolution</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [solutionArn] :
  /// The Amazon Resource Name (ARN) of the solution to describe.
  Future<DescribeSolutionResponse> describeSolution({
    required String solutionArn,
  }) async {
    ArgumentError.checkNotNull(solutionArn, 'solutionArn');
    _s.validateStringLength(
      'solutionArn',
      solutionArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DescribeSolution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'solutionArn': solutionArn,
      },
    );

    return DescribeSolutionResponse.fromJson(jsonResponse.body);
  }

  /// Describes a specific version of a solution. For more information on
  /// solutions, see <a>CreateSolution</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [solutionVersionArn] :
  /// The Amazon Resource Name (ARN) of the solution version.
  Future<DescribeSolutionVersionResponse> describeSolutionVersion({
    required String solutionVersionArn,
  }) async {
    ArgumentError.checkNotNull(solutionVersionArn, 'solutionVersionArn');
    _s.validateStringLength(
      'solutionVersionArn',
      solutionVersionArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DescribeSolutionVersion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'solutionVersionArn': solutionVersionArn,
      },
    );

    return DescribeSolutionVersionResponse.fromJson(jsonResponse.body);
  }

  /// Gets the metrics for the specified solution version.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [solutionVersionArn] :
  /// The Amazon Resource Name (ARN) of the solution version for which to get
  /// metrics.
  Future<GetSolutionMetricsResponse> getSolutionMetrics({
    required String solutionVersionArn,
  }) async {
    ArgumentError.checkNotNull(solutionVersionArn, 'solutionVersionArn');
    _s.validateStringLength(
      'solutionVersionArn',
      solutionVersionArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.GetSolutionMetrics'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'solutionVersionArn': solutionVersionArn,
      },
    );

    return GetSolutionMetricsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of the batch inference jobs that have been performed off of a
  /// solution version.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of batch inference job results to return in each page.
  /// The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  ///
  /// Parameter [solutionVersionArn] :
  /// The Amazon Resource Name (ARN) of the solution version from which the
  /// batch inference jobs were created.
  Future<ListBatchInferenceJobsResponse> listBatchInferenceJobs({
    int? maxResults,
    String? nextToken,
    String? solutionVersionArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1300,
    );
    _s.validateStringLength(
      'solutionVersionArn',
      solutionVersionArn,
      0,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.ListBatchInferenceJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (solutionVersionArn != null)
          'solutionVersionArn': solutionVersionArn,
      },
    );

    return ListBatchInferenceJobsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of campaigns that use the given solution. When a solution
  /// is not specified, all the campaigns associated with the account are
  /// listed. The response provides the properties for each campaign, including
  /// the Amazon Resource Name (ARN). For more information on campaigns, see
  /// <a>CreateCampaign</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of campaigns to return.
  ///
  /// Parameter [nextToken] :
  /// A token returned from the previous call to <code>ListCampaigns</code> for
  /// getting the next set of campaigns (if they exist).
  ///
  /// Parameter [solutionArn] :
  /// The Amazon Resource Name (ARN) of the solution to list the campaigns for.
  /// When a solution is not specified, all the campaigns associated with the
  /// account are listed.
  Future<ListCampaignsResponse> listCampaigns({
    int? maxResults,
    String? nextToken,
    String? solutionArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1300,
    );
    _s.validateStringLength(
      'solutionArn',
      solutionArn,
      0,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.ListCampaigns'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (solutionArn != null) 'solutionArn': solutionArn,
      },
    );

    return ListCampaignsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of dataset export jobs that use the given dataset. When a
  /// dataset is not specified, all the dataset export jobs associated with the
  /// account are listed. The response provides the properties for each dataset
  /// export job, including the Amazon Resource Name (ARN). For more information
  /// on dataset export jobs, see <a>CreateDatasetExportJob</a>. For more
  /// information on datasets, see <a>CreateDataset</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [datasetArn] :
  /// The Amazon Resource Name (ARN) of the dataset to list the dataset export
  /// jobs for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of dataset export jobs to return.
  ///
  /// Parameter [nextToken] :
  /// A token returned from the previous call to
  /// <code>ListDatasetExportJobs</code> for getting the next set of dataset
  /// export jobs (if they exist).
  Future<ListDatasetExportJobsResponse> listDatasetExportJobs({
    String? datasetArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'datasetArn',
      datasetArn,
      0,
      256,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1300,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.ListDatasetExportJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (datasetArn != null) 'datasetArn': datasetArn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListDatasetExportJobsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of dataset groups. The response provides the properties for
  /// each dataset group, including the Amazon Resource Name (ARN). For more
  /// information on dataset groups, see <a>CreateDatasetGroup</a>.
  ///
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of dataset groups to return.
  ///
  /// Parameter [nextToken] :
  /// A token returned from the previous call to <code>ListDatasetGroups</code>
  /// for getting the next set of dataset groups (if they exist).
  Future<ListDatasetGroupsResponse> listDatasetGroups({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1300,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.ListDatasetGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListDatasetGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of dataset import jobs that use the given dataset. When a
  /// dataset is not specified, all the dataset import jobs associated with the
  /// account are listed. The response provides the properties for each dataset
  /// import job, including the Amazon Resource Name (ARN). For more information
  /// on dataset import jobs, see <a>CreateDatasetImportJob</a>. For more
  /// information on datasets, see <a>CreateDataset</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [datasetArn] :
  /// The Amazon Resource Name (ARN) of the dataset to list the dataset import
  /// jobs for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of dataset import jobs to return.
  ///
  /// Parameter [nextToken] :
  /// A token returned from the previous call to
  /// <code>ListDatasetImportJobs</code> for getting the next set of dataset
  /// import jobs (if they exist).
  Future<ListDatasetImportJobsResponse> listDatasetImportJobs({
    String? datasetArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'datasetArn',
      datasetArn,
      0,
      256,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1300,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.ListDatasetImportJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (datasetArn != null) 'datasetArn': datasetArn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListDatasetImportJobsResponse.fromJson(jsonResponse.body);
  }

  /// Returns the list of datasets contained in the given dataset group. The
  /// response provides the properties for each dataset, including the Amazon
  /// Resource Name (ARN). For more information on datasets, see
  /// <a>CreateDataset</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The Amazon Resource Name (ARN) of the dataset group that contains the
  /// datasets to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of datasets to return.
  ///
  /// Parameter [nextToken] :
  /// A token returned from the previous call to
  /// <code>ListDatasetImportJobs</code> for getting the next set of dataset
  /// import jobs (if they exist).
  Future<ListDatasetsResponse> listDatasets({
    String? datasetGroupArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'datasetGroupArn',
      datasetGroupArn,
      0,
      256,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1300,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.ListDatasets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListDatasetsResponse.fromJson(jsonResponse.body);
  }

  /// Returns the list of event trackers associated with the account. The
  /// response provides the properties for each event tracker, including the
  /// Amazon Resource Name (ARN) and tracking ID. For more information on event
  /// trackers, see <a>CreateEventTracker</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The ARN of a dataset group used to filter the response.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of event trackers to return.
  ///
  /// Parameter [nextToken] :
  /// A token returned from the previous call to <code>ListEventTrackers</code>
  /// for getting the next set of event trackers (if they exist).
  Future<ListEventTrackersResponse> listEventTrackers({
    String? datasetGroupArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'datasetGroupArn',
      datasetGroupArn,
      0,
      256,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1300,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.ListEventTrackers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListEventTrackersResponse.fromJson(jsonResponse.body);
  }

  /// Lists all filters that belong to a given dataset group.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The ARN of the dataset group that contains the filters.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of filters to return.
  ///
  /// Parameter [nextToken] :
  /// A token returned from the previous call to <code>ListFilters</code> for
  /// getting the next set of filters (if they exist).
  Future<ListFiltersResponse> listFilters({
    String? datasetGroupArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'datasetGroupArn',
      datasetGroupArn,
      0,
      256,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1300,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.ListFilters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListFiltersResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of available recipes. The response provides the properties
  /// for each recipe, including the recipe's Amazon Resource Name (ARN).
  ///
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of recipes to return.
  ///
  /// Parameter [nextToken] :
  /// A token returned from the previous call to <code>ListRecipes</code> for
  /// getting the next set of recipes (if they exist).
  ///
  /// Parameter [recipeProvider] :
  /// The default is <code>SERVICE</code>.
  Future<ListRecipesResponse> listRecipes({
    int? maxResults,
    String? nextToken,
    RecipeProvider? recipeProvider,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1300,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.ListRecipes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (recipeProvider != null) 'recipeProvider': recipeProvider.toValue(),
      },
    );

    return ListRecipesResponse.fromJson(jsonResponse.body);
  }

  /// Returns the list of schemas associated with the account. The response
  /// provides the properties for each schema, including the Amazon Resource
  /// Name (ARN). For more information on schemas, see <a>CreateSchema</a>.
  ///
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of schemas to return.
  ///
  /// Parameter [nextToken] :
  /// A token returned from the previous call to <code>ListSchemas</code> for
  /// getting the next set of schemas (if they exist).
  Future<ListSchemasResponse> listSchemas({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1300,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.ListSchemas'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListSchemasResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of solution versions for the given solution. When a
  /// solution is not specified, all the solution versions associated with the
  /// account are listed. The response provides the properties for each solution
  /// version, including the Amazon Resource Name (ARN). For more information on
  /// solutions, see <a>CreateSolution</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of solution versions to return.
  ///
  /// Parameter [nextToken] :
  /// A token returned from the previous call to
  /// <code>ListSolutionVersions</code> for getting the next set of solution
  /// versions (if they exist).
  ///
  /// Parameter [solutionArn] :
  /// The Amazon Resource Name (ARN) of the solution.
  Future<ListSolutionVersionsResponse> listSolutionVersions({
    int? maxResults,
    String? nextToken,
    String? solutionArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1300,
    );
    _s.validateStringLength(
      'solutionArn',
      solutionArn,
      0,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.ListSolutionVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (solutionArn != null) 'solutionArn': solutionArn,
      },
    );

    return ListSolutionVersionsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of solutions that use the given dataset group. When a
  /// dataset group is not specified, all the solutions associated with the
  /// account are listed. The response provides the properties for each
  /// solution, including the Amazon Resource Name (ARN). For more information
  /// on solutions, see <a>CreateSolution</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The Amazon Resource Name (ARN) of the dataset group.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of solutions to return.
  ///
  /// Parameter [nextToken] :
  /// A token returned from the previous call to <code>ListSolutions</code> for
  /// getting the next set of solutions (if they exist).
  Future<ListSolutionsResponse> listSolutions({
    String? datasetGroupArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'datasetGroupArn',
      datasetGroupArn,
      0,
      256,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1300,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.ListSolutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListSolutionsResponse.fromJson(jsonResponse.body);
  }

  /// Stops creating a solution version that is in a state of CREATE_PENDING or
  /// CREATE IN_PROGRESS.
  ///
  /// Depending on the current state of the solution version, the solution
  /// version state changes as follows:
  ///
  /// <ul>
  /// <li>
  /// CREATE_PENDING &gt; CREATE_STOPPED
  ///
  /// or
  /// </li>
  /// <li>
  /// CREATE_IN_PROGRESS &gt; CREATE_STOPPING &gt; CREATE_STOPPED
  /// </li>
  /// </ul>
  /// You are billed for all of the training completed up until you stop the
  /// solution version creation. You cannot resume creating a solution version
  /// once it has been stopped.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [solutionVersionArn] :
  /// The Amazon Resource Name (ARN) of the solution version you want to stop
  /// creating.
  Future<void> stopSolutionVersionCreation({
    required String solutionVersionArn,
  }) async {
    ArgumentError.checkNotNull(solutionVersionArn, 'solutionVersionArn');
    _s.validateStringLength(
      'solutionVersionArn',
      solutionVersionArn,
      0,
      256,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.StopSolutionVersionCreation'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'solutionVersionArn': solutionVersionArn,
      },
    );
  }

  /// Updates a campaign by either deploying a new solution or changing the
  /// value of the campaign's <code>minProvisionedTPS</code> parameter.
  ///
  /// To update a campaign, the campaign status must be ACTIVE or CREATE FAILED.
  /// Check the campaign status using the <a>DescribeCampaign</a> API.
  /// <note>
  /// You must wait until the <code>status</code> of the updated campaign is
  /// <code>ACTIVE</code> before asking the campaign for recommendations.
  /// </note>
  /// For more information on campaigns, see <a>CreateCampaign</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [campaignArn] :
  /// The Amazon Resource Name (ARN) of the campaign.
  ///
  /// Parameter [campaignConfig] :
  /// The configuration details of a campaign.
  ///
  /// Parameter [minProvisionedTPS] :
  /// Specifies the requested minimum provisioned transactions (recommendations)
  /// per second that Amazon Personalize will support.
  ///
  /// Parameter [solutionVersionArn] :
  /// The ARN of a new solution version to deploy.
  Future<UpdateCampaignResponse> updateCampaign({
    required String campaignArn,
    CampaignConfig? campaignConfig,
    int? minProvisionedTPS,
    String? solutionVersionArn,
  }) async {
    ArgumentError.checkNotNull(campaignArn, 'campaignArn');
    _s.validateStringLength(
      'campaignArn',
      campaignArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateNumRange(
      'minProvisionedTPS',
      minProvisionedTPS,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'solutionVersionArn',
      solutionVersionArn,
      0,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.UpdateCampaign'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'campaignArn': campaignArn,
        if (campaignConfig != null) 'campaignConfig': campaignConfig,
        if (minProvisionedTPS != null) 'minProvisionedTPS': minProvisionedTPS,
        if (solutionVersionArn != null)
          'solutionVersionArn': solutionVersionArn,
      },
    );

    return UpdateCampaignResponse.fromJson(jsonResponse.body);
  }
}

/// Describes a custom algorithm.
class Algorithm {
  /// The Amazon Resource Name (ARN) of the algorithm.
  final String? algorithmArn;

  /// The URI of the Docker container for the algorithm image.
  final AlgorithmImage? algorithmImage;

  /// The date and time (in Unix time) that the algorithm was created.
  final DateTime? creationDateTime;

  /// Specifies the default hyperparameters, their ranges, and whether they are
  /// tunable. A tunable hyperparameter can have its value determined during
  /// hyperparameter optimization (HPO).
  final DefaultHyperParameterRanges? defaultHyperParameterRanges;

  /// Specifies the default hyperparameters.
  final Map<String, String>? defaultHyperParameters;

  /// Specifies the default maximum number of training jobs and parallel training
  /// jobs.
  final Map<String, String>? defaultResourceConfig;

  /// The date and time (in Unix time) that the algorithm was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The name of the algorithm.
  final String? name;

  /// The Amazon Resource Name (ARN) of the role.
  final String? roleArn;

  /// The training input mode.
  final String? trainingInputMode;

  Algorithm({
    this.algorithmArn,
    this.algorithmImage,
    this.creationDateTime,
    this.defaultHyperParameterRanges,
    this.defaultHyperParameters,
    this.defaultResourceConfig,
    this.lastUpdatedDateTime,
    this.name,
    this.roleArn,
    this.trainingInputMode,
  });

  factory Algorithm.fromJson(Map<String, dynamic> json) {
    return Algorithm(
      algorithmArn: json['algorithmArn'] as String?,
      algorithmImage: json['algorithmImage'] != null
          ? AlgorithmImage.fromJson(
              json['algorithmImage'] as Map<String, dynamic>)
          : null,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      defaultHyperParameterRanges: json['defaultHyperParameterRanges'] != null
          ? DefaultHyperParameterRanges.fromJson(
              json['defaultHyperParameterRanges'] as Map<String, dynamic>)
          : null,
      defaultHyperParameters:
          (json['defaultHyperParameters'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      defaultResourceConfig:
          (json['defaultResourceConfig'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      roleArn: json['roleArn'] as String?,
      trainingInputMode: json['trainingInputMode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final algorithmArn = this.algorithmArn;
    final algorithmImage = this.algorithmImage;
    final creationDateTime = this.creationDateTime;
    final defaultHyperParameterRanges = this.defaultHyperParameterRanges;
    final defaultHyperParameters = this.defaultHyperParameters;
    final defaultResourceConfig = this.defaultResourceConfig;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final roleArn = this.roleArn;
    final trainingInputMode = this.trainingInputMode;
    return {
      if (algorithmArn != null) 'algorithmArn': algorithmArn,
      if (algorithmImage != null) 'algorithmImage': algorithmImage,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (defaultHyperParameterRanges != null)
        'defaultHyperParameterRanges': defaultHyperParameterRanges,
      if (defaultHyperParameters != null)
        'defaultHyperParameters': defaultHyperParameters,
      if (defaultResourceConfig != null)
        'defaultResourceConfig': defaultResourceConfig,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (roleArn != null) 'roleArn': roleArn,
      if (trainingInputMode != null) 'trainingInputMode': trainingInputMode,
    };
  }
}

/// Describes an algorithm image.
class AlgorithmImage {
  /// The URI of the Docker container for the algorithm image.
  final String dockerURI;

  /// The name of the algorithm image.
  final String? name;

  AlgorithmImage({
    required this.dockerURI,
    this.name,
  });

  factory AlgorithmImage.fromJson(Map<String, dynamic> json) {
    return AlgorithmImage(
      dockerURI: json['dockerURI'] as String,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dockerURI = this.dockerURI;
    final name = this.name;
    return {
      'dockerURI': dockerURI,
      if (name != null) 'name': name,
    };
  }
}

/// When the solution performs AutoML (<code>performAutoML</code> is true in
/// <a>CreateSolution</a>), Amazon Personalize determines which recipe, from the
/// specified list, optimizes the given metric. Amazon Personalize then uses
/// that recipe for the solution.
class AutoMLConfig {
  /// The metric to optimize.
  final String? metricName;

  /// The list of candidate recipes.
  final List<String>? recipeList;

  AutoMLConfig({
    this.metricName,
    this.recipeList,
  });

  factory AutoMLConfig.fromJson(Map<String, dynamic> json) {
    return AutoMLConfig(
      metricName: json['metricName'] as String?,
      recipeList: (json['recipeList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final metricName = this.metricName;
    final recipeList = this.recipeList;
    return {
      if (metricName != null) 'metricName': metricName,
      if (recipeList != null) 'recipeList': recipeList,
    };
  }
}

/// When the solution performs AutoML (<code>performAutoML</code> is true in
/// <a>CreateSolution</a>), specifies the recipe that best optimized the
/// specified metric.
class AutoMLResult {
  /// The Amazon Resource Name (ARN) of the best recipe.
  final String? bestRecipeArn;

  AutoMLResult({
    this.bestRecipeArn,
  });

  factory AutoMLResult.fromJson(Map<String, dynamic> json) {
    return AutoMLResult(
      bestRecipeArn: json['bestRecipeArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bestRecipeArn = this.bestRecipeArn;
    return {
      if (bestRecipeArn != null) 'bestRecipeArn': bestRecipeArn,
    };
  }
}

/// Contains information on a batch inference job.
class BatchInferenceJob {
  /// The Amazon Resource Name (ARN) of the batch inference job.
  final String? batchInferenceJobArn;

  /// A string to string map of the configuration details of a batch inference
  /// job.
  final BatchInferenceJobConfig? batchInferenceJobConfig;

  /// The time at which the batch inference job was created.
  final DateTime? creationDateTime;

  /// If the batch inference job failed, the reason for the failure.
  final String? failureReason;

  /// The ARN of the filter used on the batch inference job.
  final String? filterArn;

  /// The Amazon S3 path that leads to the input data used to generate the batch
  /// inference job.
  final BatchInferenceJobInput? jobInput;

  /// The name of the batch inference job.
  final String? jobName;

  /// The Amazon S3 bucket that contains the output data generated by the batch
  /// inference job.
  final BatchInferenceJobOutput? jobOutput;

  /// The time at which the batch inference job was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The number of recommendations generated by the batch inference job. This
  /// number includes the error messages generated for failed input records.
  final int? numResults;

  /// The ARN of the Amazon Identity and Access Management (IAM) role that
  /// requested the batch inference job.
  final String? roleArn;

  /// The Amazon Resource Name (ARN) of the solution version from which the batch
  /// inference job was created.
  final String? solutionVersionArn;

  /// The status of the batch inference job. The status is one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// PENDING
  /// </li>
  /// <li>
  /// IN PROGRESS
  /// </li>
  /// <li>
  /// ACTIVE
  /// </li>
  /// <li>
  /// CREATE FAILED
  /// </li>
  /// </ul>
  final String? status;

  BatchInferenceJob({
    this.batchInferenceJobArn,
    this.batchInferenceJobConfig,
    this.creationDateTime,
    this.failureReason,
    this.filterArn,
    this.jobInput,
    this.jobName,
    this.jobOutput,
    this.lastUpdatedDateTime,
    this.numResults,
    this.roleArn,
    this.solutionVersionArn,
    this.status,
  });

  factory BatchInferenceJob.fromJson(Map<String, dynamic> json) {
    return BatchInferenceJob(
      batchInferenceJobArn: json['batchInferenceJobArn'] as String?,
      batchInferenceJobConfig: json['batchInferenceJobConfig'] != null
          ? BatchInferenceJobConfig.fromJson(
              json['batchInferenceJobConfig'] as Map<String, dynamic>)
          : null,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      failureReason: json['failureReason'] as String?,
      filterArn: json['filterArn'] as String?,
      jobInput: json['jobInput'] != null
          ? BatchInferenceJobInput.fromJson(
              json['jobInput'] as Map<String, dynamic>)
          : null,
      jobName: json['jobName'] as String?,
      jobOutput: json['jobOutput'] != null
          ? BatchInferenceJobOutput.fromJson(
              json['jobOutput'] as Map<String, dynamic>)
          : null,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      numResults: json['numResults'] as int?,
      roleArn: json['roleArn'] as String?,
      solutionVersionArn: json['solutionVersionArn'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchInferenceJobArn = this.batchInferenceJobArn;
    final batchInferenceJobConfig = this.batchInferenceJobConfig;
    final creationDateTime = this.creationDateTime;
    final failureReason = this.failureReason;
    final filterArn = this.filterArn;
    final jobInput = this.jobInput;
    final jobName = this.jobName;
    final jobOutput = this.jobOutput;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final numResults = this.numResults;
    final roleArn = this.roleArn;
    final solutionVersionArn = this.solutionVersionArn;
    final status = this.status;
    return {
      if (batchInferenceJobArn != null)
        'batchInferenceJobArn': batchInferenceJobArn,
      if (batchInferenceJobConfig != null)
        'batchInferenceJobConfig': batchInferenceJobConfig,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (failureReason != null) 'failureReason': failureReason,
      if (filterArn != null) 'filterArn': filterArn,
      if (jobInput != null) 'jobInput': jobInput,
      if (jobName != null) 'jobName': jobName,
      if (jobOutput != null) 'jobOutput': jobOutput,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (numResults != null) 'numResults': numResults,
      if (roleArn != null) 'roleArn': roleArn,
      if (solutionVersionArn != null) 'solutionVersionArn': solutionVersionArn,
      if (status != null) 'status': status,
    };
  }
}

/// The configuration details of a batch inference job.
class BatchInferenceJobConfig {
  /// A string to string map specifying the exploration configuration
  /// hyperparameters, including <code>explorationWeight</code> and
  /// <code>explorationItemAgeCutOff</code>, you want to use to configure the
  /// amount of item exploration Amazon Personalize uses when recommending items.
  /// See <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/native-recipe-new-item-USER_PERSONALIZATION.html">User-Personalization</a>.
  final Map<String, String>? itemExplorationConfig;

  BatchInferenceJobConfig({
    this.itemExplorationConfig,
  });

  factory BatchInferenceJobConfig.fromJson(Map<String, dynamic> json) {
    return BatchInferenceJobConfig(
      itemExplorationConfig:
          (json['itemExplorationConfig'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final itemExplorationConfig = this.itemExplorationConfig;
    return {
      if (itemExplorationConfig != null)
        'itemExplorationConfig': itemExplorationConfig,
    };
  }
}

/// The input configuration of a batch inference job.
class BatchInferenceJobInput {
  /// The URI of the Amazon S3 location that contains your input data. The Amazon
  /// S3 bucket must be in the same region as the API endpoint you are calling.
  final S3DataConfig s3DataSource;

  BatchInferenceJobInput({
    required this.s3DataSource,
  });

  factory BatchInferenceJobInput.fromJson(Map<String, dynamic> json) {
    return BatchInferenceJobInput(
      s3DataSource:
          S3DataConfig.fromJson(json['s3DataSource'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3DataSource = this.s3DataSource;
    return {
      's3DataSource': s3DataSource,
    };
  }
}

/// The output configuration parameters of a batch inference job.
class BatchInferenceJobOutput {
  /// Information on the Amazon S3 bucket in which the batch inference job's
  /// output is stored.
  final S3DataConfig s3DataDestination;

  BatchInferenceJobOutput({
    required this.s3DataDestination,
  });

  factory BatchInferenceJobOutput.fromJson(Map<String, dynamic> json) {
    return BatchInferenceJobOutput(
      s3DataDestination: S3DataConfig.fromJson(
          json['s3DataDestination'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3DataDestination = this.s3DataDestination;
    return {
      's3DataDestination': s3DataDestination,
    };
  }
}

/// A truncated version of the <a>BatchInferenceJob</a> datatype. The
/// <a>ListBatchInferenceJobs</a> operation returns a list of batch inference
/// job summaries.
class BatchInferenceJobSummary {
  /// The Amazon Resource Name (ARN) of the batch inference job.
  final String? batchInferenceJobArn;

  /// The time at which the batch inference job was created.
  final DateTime? creationDateTime;

  /// If the batch inference job failed, the reason for the failure.
  final String? failureReason;

  /// The name of the batch inference job.
  final String? jobName;

  /// The time at which the batch inference job was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The ARN of the solution version used by the batch inference job.
  final String? solutionVersionArn;

  /// The status of the batch inference job. The status is one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// PENDING
  /// </li>
  /// <li>
  /// IN PROGRESS
  /// </li>
  /// <li>
  /// ACTIVE
  /// </li>
  /// <li>
  /// CREATE FAILED
  /// </li>
  /// </ul>
  final String? status;

  BatchInferenceJobSummary({
    this.batchInferenceJobArn,
    this.creationDateTime,
    this.failureReason,
    this.jobName,
    this.lastUpdatedDateTime,
    this.solutionVersionArn,
    this.status,
  });

  factory BatchInferenceJobSummary.fromJson(Map<String, dynamic> json) {
    return BatchInferenceJobSummary(
      batchInferenceJobArn: json['batchInferenceJobArn'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      failureReason: json['failureReason'] as String?,
      jobName: json['jobName'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      solutionVersionArn: json['solutionVersionArn'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchInferenceJobArn = this.batchInferenceJobArn;
    final creationDateTime = this.creationDateTime;
    final failureReason = this.failureReason;
    final jobName = this.jobName;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final solutionVersionArn = this.solutionVersionArn;
    final status = this.status;
    return {
      if (batchInferenceJobArn != null)
        'batchInferenceJobArn': batchInferenceJobArn,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (failureReason != null) 'failureReason': failureReason,
      if (jobName != null) 'jobName': jobName,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (solutionVersionArn != null) 'solutionVersionArn': solutionVersionArn,
      if (status != null) 'status': status,
    };
  }
}

/// Describes a deployed solution version, otherwise known as a campaign. For
/// more information on campaigns, see <a>CreateCampaign</a>.
class Campaign {
  /// The Amazon Resource Name (ARN) of the campaign.
  final String? campaignArn;

  /// The configuration details of a campaign.
  final CampaignConfig? campaignConfig;

  /// The date and time (in Unix format) that the campaign was created.
  final DateTime? creationDateTime;

  /// If a campaign fails, the reason behind the failure.
  final String? failureReason;

  /// The date and time (in Unix format) that the campaign was last updated.
  final DateTime? lastUpdatedDateTime;
  final CampaignUpdateSummary? latestCampaignUpdate;

  /// Specifies the requested minimum provisioned transactions (recommendations)
  /// per second.
  final int? minProvisionedTPS;

  /// The name of the campaign.
  final String? name;

  /// The Amazon Resource Name (ARN) of a specific version of the solution.
  final String? solutionVersionArn;

  /// The status of the campaign.
  ///
  /// A campaign can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// DELETE PENDING &gt; DELETE IN_PROGRESS
  /// </li>
  /// </ul>
  final String? status;

  Campaign({
    this.campaignArn,
    this.campaignConfig,
    this.creationDateTime,
    this.failureReason,
    this.lastUpdatedDateTime,
    this.latestCampaignUpdate,
    this.minProvisionedTPS,
    this.name,
    this.solutionVersionArn,
    this.status,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      campaignArn: json['campaignArn'] as String?,
      campaignConfig: json['campaignConfig'] != null
          ? CampaignConfig.fromJson(
              json['campaignConfig'] as Map<String, dynamic>)
          : null,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      failureReason: json['failureReason'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      latestCampaignUpdate: json['latestCampaignUpdate'] != null
          ? CampaignUpdateSummary.fromJson(
              json['latestCampaignUpdate'] as Map<String, dynamic>)
          : null,
      minProvisionedTPS: json['minProvisionedTPS'] as int?,
      name: json['name'] as String?,
      solutionVersionArn: json['solutionVersionArn'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final campaignArn = this.campaignArn;
    final campaignConfig = this.campaignConfig;
    final creationDateTime = this.creationDateTime;
    final failureReason = this.failureReason;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final latestCampaignUpdate = this.latestCampaignUpdate;
    final minProvisionedTPS = this.minProvisionedTPS;
    final name = this.name;
    final solutionVersionArn = this.solutionVersionArn;
    final status = this.status;
    return {
      if (campaignArn != null) 'campaignArn': campaignArn,
      if (campaignConfig != null) 'campaignConfig': campaignConfig,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (failureReason != null) 'failureReason': failureReason,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (latestCampaignUpdate != null)
        'latestCampaignUpdate': latestCampaignUpdate,
      if (minProvisionedTPS != null) 'minProvisionedTPS': minProvisionedTPS,
      if (name != null) 'name': name,
      if (solutionVersionArn != null) 'solutionVersionArn': solutionVersionArn,
      if (status != null) 'status': status,
    };
  }
}

/// The configuration details of a campaign.
class CampaignConfig {
  /// A string to string map specifying the exploration configuration
  /// hyperparameters, including <code>explorationWeight</code> and
  /// <code>explorationItemAgeCutOff</code>, you want to use to configure the
  /// amount of item exploration Amazon Personalize uses when recommending items.
  /// Provide <code>itemExplorationConfig</code> data only if your solution uses
  /// the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/native-recipe-new-item-USER_PERSONALIZATION.html">User-Personalization</a>
  /// recipe.
  final Map<String, String>? itemExplorationConfig;

  CampaignConfig({
    this.itemExplorationConfig,
  });

  factory CampaignConfig.fromJson(Map<String, dynamic> json) {
    return CampaignConfig(
      itemExplorationConfig:
          (json['itemExplorationConfig'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final itemExplorationConfig = this.itemExplorationConfig;
    return {
      if (itemExplorationConfig != null)
        'itemExplorationConfig': itemExplorationConfig,
    };
  }
}

/// Provides a summary of the properties of a campaign. For a complete listing,
/// call the <a>DescribeCampaign</a> API.
class CampaignSummary {
  /// The Amazon Resource Name (ARN) of the campaign.
  final String? campaignArn;

  /// The date and time (in Unix time) that the campaign was created.
  final DateTime? creationDateTime;

  /// If a campaign fails, the reason behind the failure.
  final String? failureReason;

  /// The date and time (in Unix time) that the campaign was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The name of the campaign.
  final String? name;

  /// The status of the campaign.
  ///
  /// A campaign can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// DELETE PENDING &gt; DELETE IN_PROGRESS
  /// </li>
  /// </ul>
  final String? status;

  CampaignSummary({
    this.campaignArn,
    this.creationDateTime,
    this.failureReason,
    this.lastUpdatedDateTime,
    this.name,
    this.status,
  });

  factory CampaignSummary.fromJson(Map<String, dynamic> json) {
    return CampaignSummary(
      campaignArn: json['campaignArn'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      failureReason: json['failureReason'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final campaignArn = this.campaignArn;
    final creationDateTime = this.creationDateTime;
    final failureReason = this.failureReason;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final status = this.status;
    return {
      if (campaignArn != null) 'campaignArn': campaignArn,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (failureReason != null) 'failureReason': failureReason,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (status != null) 'status': status,
    };
  }
}

/// Provides a summary of the properties of a campaign update. For a complete
/// listing, call the <a>DescribeCampaign</a> API.
class CampaignUpdateSummary {
  final CampaignConfig? campaignConfig;

  /// The date and time (in Unix time) that the campaign update was created.
  final DateTime? creationDateTime;

  /// If a campaign update fails, the reason behind the failure.
  final String? failureReason;

  /// The date and time (in Unix time) that the campaign update was last updated.
  final DateTime? lastUpdatedDateTime;

  /// Specifies the requested minimum provisioned transactions (recommendations)
  /// per second that Amazon Personalize will support.
  final int? minProvisionedTPS;

  /// The Amazon Resource Name (ARN) of the deployed solution version.
  final String? solutionVersionArn;

  /// The status of the campaign update.
  ///
  /// A campaign update can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// DELETE PENDING &gt; DELETE IN_PROGRESS
  /// </li>
  /// </ul>
  final String? status;

  CampaignUpdateSummary({
    this.campaignConfig,
    this.creationDateTime,
    this.failureReason,
    this.lastUpdatedDateTime,
    this.minProvisionedTPS,
    this.solutionVersionArn,
    this.status,
  });

  factory CampaignUpdateSummary.fromJson(Map<String, dynamic> json) {
    return CampaignUpdateSummary(
      campaignConfig: json['campaignConfig'] != null
          ? CampaignConfig.fromJson(
              json['campaignConfig'] as Map<String, dynamic>)
          : null,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      failureReason: json['failureReason'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      minProvisionedTPS: json['minProvisionedTPS'] as int?,
      solutionVersionArn: json['solutionVersionArn'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final campaignConfig = this.campaignConfig;
    final creationDateTime = this.creationDateTime;
    final failureReason = this.failureReason;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final minProvisionedTPS = this.minProvisionedTPS;
    final solutionVersionArn = this.solutionVersionArn;
    final status = this.status;
    return {
      if (campaignConfig != null) 'campaignConfig': campaignConfig,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (failureReason != null) 'failureReason': failureReason,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (minProvisionedTPS != null) 'minProvisionedTPS': minProvisionedTPS,
      if (solutionVersionArn != null) 'solutionVersionArn': solutionVersionArn,
      if (status != null) 'status': status,
    };
  }
}

/// Provides the name and range of a categorical hyperparameter.
class CategoricalHyperParameterRange {
  /// The name of the hyperparameter.
  final String? name;

  /// A list of the categories for the hyperparameter.
  final List<String>? values;

  CategoricalHyperParameterRange({
    this.name,
    this.values,
  });

  factory CategoricalHyperParameterRange.fromJson(Map<String, dynamic> json) {
    return CategoricalHyperParameterRange(
      name: json['name'] as String?,
      values: (json['values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'name': name,
      if (values != null) 'values': values,
    };
  }
}

/// Provides the name and range of a continuous hyperparameter.
class ContinuousHyperParameterRange {
  /// The maximum allowable value for the hyperparameter.
  final double? maxValue;

  /// The minimum allowable value for the hyperparameter.
  final double? minValue;

  /// The name of the hyperparameter.
  final String? name;

  ContinuousHyperParameterRange({
    this.maxValue,
    this.minValue,
    this.name,
  });

  factory ContinuousHyperParameterRange.fromJson(Map<String, dynamic> json) {
    return ContinuousHyperParameterRange(
      maxValue: json['maxValue'] as double?,
      minValue: json['minValue'] as double?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxValue = this.maxValue;
    final minValue = this.minValue;
    final name = this.name;
    return {
      if (maxValue != null) 'maxValue': maxValue,
      if (minValue != null) 'minValue': minValue,
      if (name != null) 'name': name,
    };
  }
}

class CreateBatchInferenceJobResponse {
  /// The ARN of the batch inference job.
  final String? batchInferenceJobArn;

  CreateBatchInferenceJobResponse({
    this.batchInferenceJobArn,
  });

  factory CreateBatchInferenceJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateBatchInferenceJobResponse(
      batchInferenceJobArn: json['batchInferenceJobArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchInferenceJobArn = this.batchInferenceJobArn;
    return {
      if (batchInferenceJobArn != null)
        'batchInferenceJobArn': batchInferenceJobArn,
    };
  }
}

class CreateCampaignResponse {
  /// The Amazon Resource Name (ARN) of the campaign.
  final String? campaignArn;

  CreateCampaignResponse({
    this.campaignArn,
  });

  factory CreateCampaignResponse.fromJson(Map<String, dynamic> json) {
    return CreateCampaignResponse(
      campaignArn: json['campaignArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final campaignArn = this.campaignArn;
    return {
      if (campaignArn != null) 'campaignArn': campaignArn,
    };
  }
}

class CreateDatasetExportJobResponse {
  /// The Amazon Resource Name (ARN) of the dataset export job.
  final String? datasetExportJobArn;

  CreateDatasetExportJobResponse({
    this.datasetExportJobArn,
  });

  factory CreateDatasetExportJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateDatasetExportJobResponse(
      datasetExportJobArn: json['datasetExportJobArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetExportJobArn = this.datasetExportJobArn;
    return {
      if (datasetExportJobArn != null)
        'datasetExportJobArn': datasetExportJobArn,
    };
  }
}

class CreateDatasetGroupResponse {
  /// The Amazon Resource Name (ARN) of the new dataset group.
  final String? datasetGroupArn;

  CreateDatasetGroupResponse({
    this.datasetGroupArn,
  });

  factory CreateDatasetGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateDatasetGroupResponse(
      datasetGroupArn: json['datasetGroupArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetGroupArn = this.datasetGroupArn;
    return {
      if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
    };
  }
}

class CreateDatasetImportJobResponse {
  /// The ARN of the dataset import job.
  final String? datasetImportJobArn;

  CreateDatasetImportJobResponse({
    this.datasetImportJobArn,
  });

  factory CreateDatasetImportJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateDatasetImportJobResponse(
      datasetImportJobArn: json['datasetImportJobArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetImportJobArn = this.datasetImportJobArn;
    return {
      if (datasetImportJobArn != null)
        'datasetImportJobArn': datasetImportJobArn,
    };
  }
}

class CreateDatasetResponse {
  /// The ARN of the dataset.
  final String? datasetArn;

  CreateDatasetResponse({
    this.datasetArn,
  });

  factory CreateDatasetResponse.fromJson(Map<String, dynamic> json) {
    return CreateDatasetResponse(
      datasetArn: json['datasetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetArn = this.datasetArn;
    return {
      if (datasetArn != null) 'datasetArn': datasetArn,
    };
  }
}

class CreateEventTrackerResponse {
  /// The ARN of the event tracker.
  final String? eventTrackerArn;

  /// The ID of the event tracker. Include this ID in requests to the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html">PutEvents</a>
  /// API.
  final String? trackingId;

  CreateEventTrackerResponse({
    this.eventTrackerArn,
    this.trackingId,
  });

  factory CreateEventTrackerResponse.fromJson(Map<String, dynamic> json) {
    return CreateEventTrackerResponse(
      eventTrackerArn: json['eventTrackerArn'] as String?,
      trackingId: json['trackingId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventTrackerArn = this.eventTrackerArn;
    final trackingId = this.trackingId;
    return {
      if (eventTrackerArn != null) 'eventTrackerArn': eventTrackerArn,
      if (trackingId != null) 'trackingId': trackingId,
    };
  }
}

class CreateFilterResponse {
  /// The ARN of the new filter.
  final String? filterArn;

  CreateFilterResponse({
    this.filterArn,
  });

  factory CreateFilterResponse.fromJson(Map<String, dynamic> json) {
    return CreateFilterResponse(
      filterArn: json['filterArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final filterArn = this.filterArn;
    return {
      if (filterArn != null) 'filterArn': filterArn,
    };
  }
}

class CreateSchemaResponse {
  /// The Amazon Resource Name (ARN) of the created schema.
  final String? schemaArn;

  CreateSchemaResponse({
    this.schemaArn,
  });

  factory CreateSchemaResponse.fromJson(Map<String, dynamic> json) {
    return CreateSchemaResponse(
      schemaArn: json['schemaArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final schemaArn = this.schemaArn;
    return {
      if (schemaArn != null) 'schemaArn': schemaArn,
    };
  }
}

class CreateSolutionResponse {
  /// The ARN of the solution.
  final String? solutionArn;

  CreateSolutionResponse({
    this.solutionArn,
  });

  factory CreateSolutionResponse.fromJson(Map<String, dynamic> json) {
    return CreateSolutionResponse(
      solutionArn: json['solutionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final solutionArn = this.solutionArn;
    return {
      if (solutionArn != null) 'solutionArn': solutionArn,
    };
  }
}

class CreateSolutionVersionResponse {
  /// The ARN of the new solution version.
  final String? solutionVersionArn;

  CreateSolutionVersionResponse({
    this.solutionVersionArn,
  });

  factory CreateSolutionVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreateSolutionVersionResponse(
      solutionVersionArn: json['solutionVersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final solutionVersionArn = this.solutionVersionArn;
    return {
      if (solutionVersionArn != null) 'solutionVersionArn': solutionVersionArn,
    };
  }
}

/// Describes the data source that contains the data to upload to a dataset.
class DataSource {
  /// The path to the Amazon S3 bucket where the data that you want to upload to
  /// your dataset is stored. For example:
  ///
  /// <code>s3://bucket-name/folder-name/</code>
  final String? dataLocation;

  DataSource({
    this.dataLocation,
  });

  factory DataSource.fromJson(Map<String, dynamic> json) {
    return DataSource(
      dataLocation: json['dataLocation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataLocation = this.dataLocation;
    return {
      if (dataLocation != null) 'dataLocation': dataLocation,
    };
  }
}

/// Provides metadata for a dataset.
class Dataset {
  /// The creation date and time (in Unix time) of the dataset.
  final DateTime? creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset that you want metadata for.
  final String? datasetArn;

  /// The Amazon Resource Name (ARN) of the dataset group.
  final String? datasetGroupArn;

  /// One of the following values:
  ///
  /// <ul>
  /// <li>
  /// Interactions
  /// </li>
  /// <li>
  /// Items
  /// </li>
  /// <li>
  /// Users
  /// </li>
  /// </ul>
  final String? datasetType;

  /// A time stamp that shows when the dataset was updated.
  final DateTime? lastUpdatedDateTime;

  /// The name of the dataset.
  final String? name;

  /// The ARN of the associated schema.
  final String? schemaArn;

  /// The status of the dataset.
  ///
  /// A dataset can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// DELETE PENDING &gt; DELETE IN_PROGRESS
  /// </li>
  /// </ul>
  final String? status;

  Dataset({
    this.creationDateTime,
    this.datasetArn,
    this.datasetGroupArn,
    this.datasetType,
    this.lastUpdatedDateTime,
    this.name,
    this.schemaArn,
    this.status,
  });

  factory Dataset.fromJson(Map<String, dynamic> json) {
    return Dataset(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      datasetArn: json['datasetArn'] as String?,
      datasetGroupArn: json['datasetGroupArn'] as String?,
      datasetType: json['datasetType'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      schemaArn: json['schemaArn'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final datasetArn = this.datasetArn;
    final datasetGroupArn = this.datasetGroupArn;
    final datasetType = this.datasetType;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final schemaArn = this.schemaArn;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (datasetArn != null) 'datasetArn': datasetArn,
      if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
      if (datasetType != null) 'datasetType': datasetType,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (schemaArn != null) 'schemaArn': schemaArn,
      if (status != null) 'status': status,
    };
  }
}

/// Describes a job that exports a dataset to an Amazon S3 bucket. For more
/// information, see <a>CreateDatasetExportJob</a>.
///
/// A dataset export job can be in one of the following states:
///
/// <ul>
/// <li>
/// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
/// </li>
/// </ul>
class DatasetExportJob {
  /// The creation date and time (in Unix time) of the dataset export job.
  final DateTime? creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset to export.
  final String? datasetArn;

  /// The Amazon Resource Name (ARN) of the dataset export job.
  final String? datasetExportJobArn;

  /// If a dataset export job fails, provides the reason why.
  final String? failureReason;

  /// The data to export, based on how you imported the data. You can choose to
  /// export <code>BULK</code> data that you imported using a dataset import job,
  /// <code>PUT</code> data that you imported incrementally (using the console,
  /// PutEvents, PutUsers and PutItems operations), or <code>ALL</code> for both
  /// types. The default value is <code>PUT</code>.
  final IngestionMode? ingestionMode;

  /// The name of the export job.
  final String? jobName;

  /// The path to the Amazon S3 bucket where the job's output is stored. For
  /// example:
  ///
  /// <code>s3://bucket-name/folder-name/</code>
  final DatasetExportJobOutput? jobOutput;

  /// The date and time (in Unix time) the status of the dataset export job was
  /// last updated.
  final DateTime? lastUpdatedDateTime;

  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// service role that has permissions to add data to your output Amazon S3
  /// bucket.
  final String? roleArn;

  /// The status of the dataset export job.
  ///
  /// A dataset export job can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// </ul>
  final String? status;

  DatasetExportJob({
    this.creationDateTime,
    this.datasetArn,
    this.datasetExportJobArn,
    this.failureReason,
    this.ingestionMode,
    this.jobName,
    this.jobOutput,
    this.lastUpdatedDateTime,
    this.roleArn,
    this.status,
  });

  factory DatasetExportJob.fromJson(Map<String, dynamic> json) {
    return DatasetExportJob(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      datasetArn: json['datasetArn'] as String?,
      datasetExportJobArn: json['datasetExportJobArn'] as String?,
      failureReason: json['failureReason'] as String?,
      ingestionMode: (json['ingestionMode'] as String?)?.toIngestionMode(),
      jobName: json['jobName'] as String?,
      jobOutput: json['jobOutput'] != null
          ? DatasetExportJobOutput.fromJson(
              json['jobOutput'] as Map<String, dynamic>)
          : null,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      roleArn: json['roleArn'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final datasetArn = this.datasetArn;
    final datasetExportJobArn = this.datasetExportJobArn;
    final failureReason = this.failureReason;
    final ingestionMode = this.ingestionMode;
    final jobName = this.jobName;
    final jobOutput = this.jobOutput;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final roleArn = this.roleArn;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (datasetArn != null) 'datasetArn': datasetArn,
      if (datasetExportJobArn != null)
        'datasetExportJobArn': datasetExportJobArn,
      if (failureReason != null) 'failureReason': failureReason,
      if (ingestionMode != null) 'ingestionMode': ingestionMode.toValue(),
      if (jobName != null) 'jobName': jobName,
      if (jobOutput != null) 'jobOutput': jobOutput,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status,
    };
  }
}

/// The output configuration parameters of a dataset export job.
class DatasetExportJobOutput {
  final S3DataConfig s3DataDestination;

  DatasetExportJobOutput({
    required this.s3DataDestination,
  });

  factory DatasetExportJobOutput.fromJson(Map<String, dynamic> json) {
    return DatasetExportJobOutput(
      s3DataDestination: S3DataConfig.fromJson(
          json['s3DataDestination'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final s3DataDestination = this.s3DataDestination;
    return {
      's3DataDestination': s3DataDestination,
    };
  }
}

/// Provides a summary of the properties of a dataset export job. For a complete
/// listing, call the <a>DescribeDatasetExportJob</a> API.
class DatasetExportJobSummary {
  /// The date and time (in Unix time) that the dataset export job was created.
  final DateTime? creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset export job.
  final String? datasetExportJobArn;

  /// If a dataset export job fails, the reason behind the failure.
  final String? failureReason;

  /// The name of the dataset export job.
  final String? jobName;

  /// The date and time (in Unix time) that the dataset export job status was last
  /// updated.
  final DateTime? lastUpdatedDateTime;

  /// The status of the dataset export job.
  ///
  /// A dataset export job can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// </ul>
  final String? status;

  DatasetExportJobSummary({
    this.creationDateTime,
    this.datasetExportJobArn,
    this.failureReason,
    this.jobName,
    this.lastUpdatedDateTime,
    this.status,
  });

  factory DatasetExportJobSummary.fromJson(Map<String, dynamic> json) {
    return DatasetExportJobSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      datasetExportJobArn: json['datasetExportJobArn'] as String?,
      failureReason: json['failureReason'] as String?,
      jobName: json['jobName'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final datasetExportJobArn = this.datasetExportJobArn;
    final failureReason = this.failureReason;
    final jobName = this.jobName;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (datasetExportJobArn != null)
        'datasetExportJobArn': datasetExportJobArn,
      if (failureReason != null) 'failureReason': failureReason,
      if (jobName != null) 'jobName': jobName,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (status != null) 'status': status,
    };
  }
}

/// A dataset group is a collection of related datasets (Interactions, User, and
/// Item). You create a dataset group by calling <a>CreateDatasetGroup</a>. You
/// then create a dataset and add it to a dataset group by calling
/// <a>CreateDataset</a>. The dataset group is used to create and train a
/// solution by calling <a>CreateSolution</a>. A dataset group can contain only
/// one of each type of dataset.
///
/// You can specify an AWS Key Management Service (KMS) key to encrypt the
/// datasets in the group.
class DatasetGroup {
  /// The creation date and time (in Unix time) of the dataset group.
  final DateTime? creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset group.
  final String? datasetGroupArn;

  /// If creating a dataset group fails, provides the reason why.
  final String? failureReason;

  /// The Amazon Resource Name (ARN) of the KMS key used to encrypt the datasets.
  final String? kmsKeyArn;

  /// The last update date and time (in Unix time) of the dataset group.
  final DateTime? lastUpdatedDateTime;

  /// The name of the dataset group.
  final String? name;

  /// The ARN of the IAM role that has permissions to create the dataset group.
  final String? roleArn;

  /// The current status of the dataset group.
  ///
  /// A dataset group can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// DELETE PENDING
  /// </li>
  /// </ul>
  final String? status;

  DatasetGroup({
    this.creationDateTime,
    this.datasetGroupArn,
    this.failureReason,
    this.kmsKeyArn,
    this.lastUpdatedDateTime,
    this.name,
    this.roleArn,
    this.status,
  });

  factory DatasetGroup.fromJson(Map<String, dynamic> json) {
    return DatasetGroup(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      datasetGroupArn: json['datasetGroupArn'] as String?,
      failureReason: json['failureReason'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      roleArn: json['roleArn'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final datasetGroupArn = this.datasetGroupArn;
    final failureReason = this.failureReason;
    final kmsKeyArn = this.kmsKeyArn;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final roleArn = this.roleArn;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
      if (failureReason != null) 'failureReason': failureReason,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status,
    };
  }
}

/// Provides a summary of the properties of a dataset group. For a complete
/// listing, call the <a>DescribeDatasetGroup</a> API.
class DatasetGroupSummary {
  /// The date and time (in Unix time) that the dataset group was created.
  final DateTime? creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset group.
  final String? datasetGroupArn;

  /// If creating a dataset group fails, the reason behind the failure.
  final String? failureReason;

  /// The date and time (in Unix time) that the dataset group was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The name of the dataset group.
  final String? name;

  /// The status of the dataset group.
  ///
  /// A dataset group can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// DELETE PENDING
  /// </li>
  /// </ul>
  final String? status;

  DatasetGroupSummary({
    this.creationDateTime,
    this.datasetGroupArn,
    this.failureReason,
    this.lastUpdatedDateTime,
    this.name,
    this.status,
  });

  factory DatasetGroupSummary.fromJson(Map<String, dynamic> json) {
    return DatasetGroupSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      datasetGroupArn: json['datasetGroupArn'] as String?,
      failureReason: json['failureReason'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final datasetGroupArn = this.datasetGroupArn;
    final failureReason = this.failureReason;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
      if (failureReason != null) 'failureReason': failureReason,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (status != null) 'status': status,
    };
  }
}

/// Describes a job that imports training data from a data source (Amazon S3
/// bucket) to an Amazon Personalize dataset. For more information, see
/// <a>CreateDatasetImportJob</a>.
///
/// A dataset import job can be in one of the following states:
///
/// <ul>
/// <li>
/// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
/// </li>
/// </ul>
class DatasetImportJob {
  /// The creation date and time (in Unix time) of the dataset import job.
  final DateTime? creationDateTime;

  /// The Amazon S3 bucket that contains the training data to import.
  final DataSource? dataSource;

  /// The Amazon Resource Name (ARN) of the dataset that receives the imported
  /// data.
  final String? datasetArn;

  /// The ARN of the dataset import job.
  final String? datasetImportJobArn;

  /// If a dataset import job fails, provides the reason why.
  final String? failureReason;

  /// The name of the import job.
  final String? jobName;

  /// The date and time (in Unix time) the dataset was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The ARN of the AWS Identity and Access Management (IAM) role that has
  /// permissions to read from the Amazon S3 data source.
  final String? roleArn;

  /// The status of the dataset import job.
  ///
  /// A dataset import job can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// </ul>
  final String? status;

  DatasetImportJob({
    this.creationDateTime,
    this.dataSource,
    this.datasetArn,
    this.datasetImportJobArn,
    this.failureReason,
    this.jobName,
    this.lastUpdatedDateTime,
    this.roleArn,
    this.status,
  });

  factory DatasetImportJob.fromJson(Map<String, dynamic> json) {
    return DatasetImportJob(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      dataSource: json['dataSource'] != null
          ? DataSource.fromJson(json['dataSource'] as Map<String, dynamic>)
          : null,
      datasetArn: json['datasetArn'] as String?,
      datasetImportJobArn: json['datasetImportJobArn'] as String?,
      failureReason: json['failureReason'] as String?,
      jobName: json['jobName'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      roleArn: json['roleArn'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final dataSource = this.dataSource;
    final datasetArn = this.datasetArn;
    final datasetImportJobArn = this.datasetImportJobArn;
    final failureReason = this.failureReason;
    final jobName = this.jobName;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final roleArn = this.roleArn;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (dataSource != null) 'dataSource': dataSource,
      if (datasetArn != null) 'datasetArn': datasetArn,
      if (datasetImportJobArn != null)
        'datasetImportJobArn': datasetImportJobArn,
      if (failureReason != null) 'failureReason': failureReason,
      if (jobName != null) 'jobName': jobName,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status,
    };
  }
}

/// Provides a summary of the properties of a dataset import job. For a complete
/// listing, call the <a>DescribeDatasetImportJob</a> API.
class DatasetImportJobSummary {
  /// The date and time (in Unix time) that the dataset import job was created.
  final DateTime? creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset import job.
  final String? datasetImportJobArn;

  /// If a dataset import job fails, the reason behind the failure.
  final String? failureReason;

  /// The name of the dataset import job.
  final String? jobName;

  /// The date and time (in Unix time) that the dataset import job status was last
  /// updated.
  final DateTime? lastUpdatedDateTime;

  /// The status of the dataset import job.
  ///
  /// A dataset import job can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// </ul>
  final String? status;

  DatasetImportJobSummary({
    this.creationDateTime,
    this.datasetImportJobArn,
    this.failureReason,
    this.jobName,
    this.lastUpdatedDateTime,
    this.status,
  });

  factory DatasetImportJobSummary.fromJson(Map<String, dynamic> json) {
    return DatasetImportJobSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      datasetImportJobArn: json['datasetImportJobArn'] as String?,
      failureReason: json['failureReason'] as String?,
      jobName: json['jobName'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final datasetImportJobArn = this.datasetImportJobArn;
    final failureReason = this.failureReason;
    final jobName = this.jobName;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (datasetImportJobArn != null)
        'datasetImportJobArn': datasetImportJobArn,
      if (failureReason != null) 'failureReason': failureReason,
      if (jobName != null) 'jobName': jobName,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (status != null) 'status': status,
    };
  }
}

/// Describes the schema for a dataset. For more information on schemas, see
/// <a>CreateSchema</a>.
class DatasetSchema {
  /// The date and time (in Unix time) that the schema was created.
  final DateTime? creationDateTime;

  /// The date and time (in Unix time) that the schema was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The name of the schema.
  final String? name;

  /// The schema.
  final String? schema;

  /// The Amazon Resource Name (ARN) of the schema.
  final String? schemaArn;

  DatasetSchema({
    this.creationDateTime,
    this.lastUpdatedDateTime,
    this.name,
    this.schema,
    this.schemaArn,
  });

  factory DatasetSchema.fromJson(Map<String, dynamic> json) {
    return DatasetSchema(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      schema: json['schema'] as String?,
      schemaArn: json['schemaArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final schema = this.schema;
    final schemaArn = this.schemaArn;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (schema != null) 'schema': schema,
      if (schemaArn != null) 'schemaArn': schemaArn,
    };
  }
}

/// Provides a summary of the properties of a dataset schema. For a complete
/// listing, call the <a>DescribeSchema</a> API.
class DatasetSchemaSummary {
  /// The date and time (in Unix time) that the schema was created.
  final DateTime? creationDateTime;

  /// The date and time (in Unix time) that the schema was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The name of the schema.
  final String? name;

  /// The Amazon Resource Name (ARN) of the schema.
  final String? schemaArn;

  DatasetSchemaSummary({
    this.creationDateTime,
    this.lastUpdatedDateTime,
    this.name,
    this.schemaArn,
  });

  factory DatasetSchemaSummary.fromJson(Map<String, dynamic> json) {
    return DatasetSchemaSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      schemaArn: json['schemaArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final schemaArn = this.schemaArn;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (schemaArn != null) 'schemaArn': schemaArn,
    };
  }
}

/// Provides a summary of the properties of a dataset. For a complete listing,
/// call the <a>DescribeDataset</a> API.
class DatasetSummary {
  /// The date and time (in Unix time) that the dataset was created.
  final DateTime? creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset.
  final String? datasetArn;

  /// The dataset type. One of the following values:
  ///
  /// <ul>
  /// <li>
  /// Interactions
  /// </li>
  /// <li>
  /// Items
  /// </li>
  /// <li>
  /// Users
  /// </li>
  /// <li>
  /// Event-Interactions
  /// </li>
  /// </ul>
  final String? datasetType;

  /// The date and time (in Unix time) that the dataset was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The name of the dataset.
  final String? name;

  /// The status of the dataset.
  ///
  /// A dataset can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// DELETE PENDING &gt; DELETE IN_PROGRESS
  /// </li>
  /// </ul>
  final String? status;

  DatasetSummary({
    this.creationDateTime,
    this.datasetArn,
    this.datasetType,
    this.lastUpdatedDateTime,
    this.name,
    this.status,
  });

  factory DatasetSummary.fromJson(Map<String, dynamic> json) {
    return DatasetSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      datasetArn: json['datasetArn'] as String?,
      datasetType: json['datasetType'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final datasetArn = this.datasetArn;
    final datasetType = this.datasetType;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (datasetArn != null) 'datasetArn': datasetArn,
      if (datasetType != null) 'datasetType': datasetType,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (status != null) 'status': status,
    };
  }
}

/// Provides the name and default range of a categorical hyperparameter and
/// whether the hyperparameter is tunable. A tunable hyperparameter can have its
/// value determined during hyperparameter optimization (HPO).
class DefaultCategoricalHyperParameterRange {
  /// Whether the hyperparameter is tunable.
  final bool? isTunable;

  /// The name of the hyperparameter.
  final String? name;

  /// A list of the categories for the hyperparameter.
  final List<String>? values;

  DefaultCategoricalHyperParameterRange({
    this.isTunable,
    this.name,
    this.values,
  });

  factory DefaultCategoricalHyperParameterRange.fromJson(
      Map<String, dynamic> json) {
    return DefaultCategoricalHyperParameterRange(
      isTunable: json['isTunable'] as bool?,
      name: json['name'] as String?,
      values: (json['values'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final isTunable = this.isTunable;
    final name = this.name;
    final values = this.values;
    return {
      if (isTunable != null) 'isTunable': isTunable,
      if (name != null) 'name': name,
      if (values != null) 'values': values,
    };
  }
}

/// Provides the name and default range of a continuous hyperparameter and
/// whether the hyperparameter is tunable. A tunable hyperparameter can have its
/// value determined during hyperparameter optimization (HPO).
class DefaultContinuousHyperParameterRange {
  /// Whether the hyperparameter is tunable.
  final bool? isTunable;

  /// The maximum allowable value for the hyperparameter.
  final double? maxValue;

  /// The minimum allowable value for the hyperparameter.
  final double? minValue;

  /// The name of the hyperparameter.
  final String? name;

  DefaultContinuousHyperParameterRange({
    this.isTunable,
    this.maxValue,
    this.minValue,
    this.name,
  });

  factory DefaultContinuousHyperParameterRange.fromJson(
      Map<String, dynamic> json) {
    return DefaultContinuousHyperParameterRange(
      isTunable: json['isTunable'] as bool?,
      maxValue: json['maxValue'] as double?,
      minValue: json['minValue'] as double?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isTunable = this.isTunable;
    final maxValue = this.maxValue;
    final minValue = this.minValue;
    final name = this.name;
    return {
      if (isTunable != null) 'isTunable': isTunable,
      if (maxValue != null) 'maxValue': maxValue,
      if (minValue != null) 'minValue': minValue,
      if (name != null) 'name': name,
    };
  }
}

/// Specifies the hyperparameters and their default ranges. Hyperparameters can
/// be categorical, continuous, or integer-valued.
class DefaultHyperParameterRanges {
  /// The categorical hyperparameters and their default ranges.
  final List<DefaultCategoricalHyperParameterRange>?
      categoricalHyperParameterRanges;

  /// The continuous hyperparameters and their default ranges.
  final List<DefaultContinuousHyperParameterRange>?
      continuousHyperParameterRanges;

  /// The integer-valued hyperparameters and their default ranges.
  final List<DefaultIntegerHyperParameterRange>? integerHyperParameterRanges;

  DefaultHyperParameterRanges({
    this.categoricalHyperParameterRanges,
    this.continuousHyperParameterRanges,
    this.integerHyperParameterRanges,
  });

  factory DefaultHyperParameterRanges.fromJson(Map<String, dynamic> json) {
    return DefaultHyperParameterRanges(
      categoricalHyperParameterRanges:
          (json['categoricalHyperParameterRanges'] as List?)
              ?.whereNotNull()
              .map((e) => DefaultCategoricalHyperParameterRange.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      continuousHyperParameterRanges:
          (json['continuousHyperParameterRanges'] as List?)
              ?.whereNotNull()
              .map((e) => DefaultContinuousHyperParameterRange.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      integerHyperParameterRanges:
          (json['integerHyperParameterRanges'] as List?)
              ?.whereNotNull()
              .map((e) => DefaultIntegerHyperParameterRange.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final categoricalHyperParameterRanges =
        this.categoricalHyperParameterRanges;
    final continuousHyperParameterRanges = this.continuousHyperParameterRanges;
    final integerHyperParameterRanges = this.integerHyperParameterRanges;
    return {
      if (categoricalHyperParameterRanges != null)
        'categoricalHyperParameterRanges': categoricalHyperParameterRanges,
      if (continuousHyperParameterRanges != null)
        'continuousHyperParameterRanges': continuousHyperParameterRanges,
      if (integerHyperParameterRanges != null)
        'integerHyperParameterRanges': integerHyperParameterRanges,
    };
  }
}

/// Provides the name and default range of a integer-valued hyperparameter and
/// whether the hyperparameter is tunable. A tunable hyperparameter can have its
/// value determined during hyperparameter optimization (HPO).
class DefaultIntegerHyperParameterRange {
  /// Indicates whether the hyperparameter is tunable.
  final bool? isTunable;

  /// The maximum allowable value for the hyperparameter.
  final int? maxValue;

  /// The minimum allowable value for the hyperparameter.
  final int? minValue;

  /// The name of the hyperparameter.
  final String? name;

  DefaultIntegerHyperParameterRange({
    this.isTunable,
    this.maxValue,
    this.minValue,
    this.name,
  });

  factory DefaultIntegerHyperParameterRange.fromJson(
      Map<String, dynamic> json) {
    return DefaultIntegerHyperParameterRange(
      isTunable: json['isTunable'] as bool?,
      maxValue: json['maxValue'] as int?,
      minValue: json['minValue'] as int?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isTunable = this.isTunable;
    final maxValue = this.maxValue;
    final minValue = this.minValue;
    final name = this.name;
    return {
      if (isTunable != null) 'isTunable': isTunable,
      if (maxValue != null) 'maxValue': maxValue,
      if (minValue != null) 'minValue': minValue,
      if (name != null) 'name': name,
    };
  }
}

class DescribeAlgorithmResponse {
  /// A listing of the properties of the algorithm.
  final Algorithm? algorithm;

  DescribeAlgorithmResponse({
    this.algorithm,
  });

  factory DescribeAlgorithmResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAlgorithmResponse(
      algorithm: json['algorithm'] != null
          ? Algorithm.fromJson(json['algorithm'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final algorithm = this.algorithm;
    return {
      if (algorithm != null) 'algorithm': algorithm,
    };
  }
}

class DescribeBatchInferenceJobResponse {
  /// Information on the specified batch inference job.
  final BatchInferenceJob? batchInferenceJob;

  DescribeBatchInferenceJobResponse({
    this.batchInferenceJob,
  });

  factory DescribeBatchInferenceJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeBatchInferenceJobResponse(
      batchInferenceJob: json['batchInferenceJob'] != null
          ? BatchInferenceJob.fromJson(
              json['batchInferenceJob'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final batchInferenceJob = this.batchInferenceJob;
    return {
      if (batchInferenceJob != null) 'batchInferenceJob': batchInferenceJob,
    };
  }
}

class DescribeCampaignResponse {
  /// The properties of the campaign.
  final Campaign? campaign;

  DescribeCampaignResponse({
    this.campaign,
  });

  factory DescribeCampaignResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCampaignResponse(
      campaign: json['campaign'] != null
          ? Campaign.fromJson(json['campaign'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final campaign = this.campaign;
    return {
      if (campaign != null) 'campaign': campaign,
    };
  }
}

class DescribeDatasetExportJobResponse {
  /// Information about the dataset export job, including the status.
  ///
  /// The status is one of the following values:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING
  /// </li>
  /// <li>
  /// CREATE IN_PROGRESS
  /// </li>
  /// <li>
  /// ACTIVE
  /// </li>
  /// <li>
  /// CREATE FAILED
  /// </li>
  /// </ul>
  final DatasetExportJob? datasetExportJob;

  DescribeDatasetExportJobResponse({
    this.datasetExportJob,
  });

  factory DescribeDatasetExportJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDatasetExportJobResponse(
      datasetExportJob: json['datasetExportJob'] != null
          ? DatasetExportJob.fromJson(
              json['datasetExportJob'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetExportJob = this.datasetExportJob;
    return {
      if (datasetExportJob != null) 'datasetExportJob': datasetExportJob,
    };
  }
}

class DescribeDatasetGroupResponse {
  /// A listing of the dataset group's properties.
  final DatasetGroup? datasetGroup;

  DescribeDatasetGroupResponse({
    this.datasetGroup,
  });

  factory DescribeDatasetGroupResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDatasetGroupResponse(
      datasetGroup: json['datasetGroup'] != null
          ? DatasetGroup.fromJson(json['datasetGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetGroup = this.datasetGroup;
    return {
      if (datasetGroup != null) 'datasetGroup': datasetGroup,
    };
  }
}

class DescribeDatasetImportJobResponse {
  /// Information about the dataset import job, including the status.
  ///
  /// The status is one of the following values:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING
  /// </li>
  /// <li>
  /// CREATE IN_PROGRESS
  /// </li>
  /// <li>
  /// ACTIVE
  /// </li>
  /// <li>
  /// CREATE FAILED
  /// </li>
  /// </ul>
  final DatasetImportJob? datasetImportJob;

  DescribeDatasetImportJobResponse({
    this.datasetImportJob,
  });

  factory DescribeDatasetImportJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDatasetImportJobResponse(
      datasetImportJob: json['datasetImportJob'] != null
          ? DatasetImportJob.fromJson(
              json['datasetImportJob'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetImportJob = this.datasetImportJob;
    return {
      if (datasetImportJob != null) 'datasetImportJob': datasetImportJob,
    };
  }
}

class DescribeDatasetResponse {
  /// A listing of the dataset's properties.
  final Dataset? dataset;

  DescribeDatasetResponse({
    this.dataset,
  });

  factory DescribeDatasetResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDatasetResponse(
      dataset: json['dataset'] != null
          ? Dataset.fromJson(json['dataset'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataset = this.dataset;
    return {
      if (dataset != null) 'dataset': dataset,
    };
  }
}

class DescribeEventTrackerResponse {
  /// An object that describes the event tracker.
  final EventTracker? eventTracker;

  DescribeEventTrackerResponse({
    this.eventTracker,
  });

  factory DescribeEventTrackerResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEventTrackerResponse(
      eventTracker: json['eventTracker'] != null
          ? EventTracker.fromJson(json['eventTracker'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eventTracker = this.eventTracker;
    return {
      if (eventTracker != null) 'eventTracker': eventTracker,
    };
  }
}

class DescribeFeatureTransformationResponse {
  /// A listing of the FeatureTransformation properties.
  final FeatureTransformation? featureTransformation;

  DescribeFeatureTransformationResponse({
    this.featureTransformation,
  });

  factory DescribeFeatureTransformationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeFeatureTransformationResponse(
      featureTransformation: json['featureTransformation'] != null
          ? FeatureTransformation.fromJson(
              json['featureTransformation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final featureTransformation = this.featureTransformation;
    return {
      if (featureTransformation != null)
        'featureTransformation': featureTransformation,
    };
  }
}

class DescribeFilterResponse {
  /// The filter's details.
  final Filter? filter;

  DescribeFilterResponse({
    this.filter,
  });

  factory DescribeFilterResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFilterResponse(
      filter: json['filter'] != null
          ? Filter.fromJson(json['filter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final filter = this.filter;
    return {
      if (filter != null) 'filter': filter,
    };
  }
}

class DescribeRecipeResponse {
  /// An object that describes the recipe.
  final Recipe? recipe;

  DescribeRecipeResponse({
    this.recipe,
  });

  factory DescribeRecipeResponse.fromJson(Map<String, dynamic> json) {
    return DescribeRecipeResponse(
      recipe: json['recipe'] != null
          ? Recipe.fromJson(json['recipe'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final recipe = this.recipe;
    return {
      if (recipe != null) 'recipe': recipe,
    };
  }
}

class DescribeSchemaResponse {
  /// The requested schema.
  final DatasetSchema? schema;

  DescribeSchemaResponse({
    this.schema,
  });

  factory DescribeSchemaResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSchemaResponse(
      schema: json['schema'] != null
          ? DatasetSchema.fromJson(json['schema'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final schema = this.schema;
    return {
      if (schema != null) 'schema': schema,
    };
  }
}

class DescribeSolutionResponse {
  /// An object that describes the solution.
  final Solution? solution;

  DescribeSolutionResponse({
    this.solution,
  });

  factory DescribeSolutionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSolutionResponse(
      solution: json['solution'] != null
          ? Solution.fromJson(json['solution'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final solution = this.solution;
    return {
      if (solution != null) 'solution': solution,
    };
  }
}

class DescribeSolutionVersionResponse {
  /// The solution version.
  final SolutionVersion? solutionVersion;

  DescribeSolutionVersionResponse({
    this.solutionVersion,
  });

  factory DescribeSolutionVersionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSolutionVersionResponse(
      solutionVersion: json['solutionVersion'] != null
          ? SolutionVersion.fromJson(
              json['solutionVersion'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final solutionVersion = this.solutionVersion;
    return {
      if (solutionVersion != null) 'solutionVersion': solutionVersion,
    };
  }
}

/// Provides information about an event tracker.
class EventTracker {
  /// The Amazon AWS account that owns the event tracker.
  final String? accountId;

  /// The date and time (in Unix format) that the event tracker was created.
  final DateTime? creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset group that receives the event
  /// data.
  final String? datasetGroupArn;

  /// The ARN of the event tracker.
  final String? eventTrackerArn;

  /// The date and time (in Unix time) that the event tracker was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The name of the event tracker.
  final String? name;

  /// The status of the event tracker.
  ///
  /// An event tracker can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// DELETE PENDING &gt; DELETE IN_PROGRESS
  /// </li>
  /// </ul>
  final String? status;

  /// The ID of the event tracker. Include this ID in requests to the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html">PutEvents</a>
  /// API.
  final String? trackingId;

  EventTracker({
    this.accountId,
    this.creationDateTime,
    this.datasetGroupArn,
    this.eventTrackerArn,
    this.lastUpdatedDateTime,
    this.name,
    this.status,
    this.trackingId,
  });

  factory EventTracker.fromJson(Map<String, dynamic> json) {
    return EventTracker(
      accountId: json['accountId'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      datasetGroupArn: json['datasetGroupArn'] as String?,
      eventTrackerArn: json['eventTrackerArn'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      status: json['status'] as String?,
      trackingId: json['trackingId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final creationDateTime = this.creationDateTime;
    final datasetGroupArn = this.datasetGroupArn;
    final eventTrackerArn = this.eventTrackerArn;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final status = this.status;
    final trackingId = this.trackingId;
    return {
      if (accountId != null) 'accountId': accountId,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
      if (eventTrackerArn != null) 'eventTrackerArn': eventTrackerArn,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (status != null) 'status': status,
      if (trackingId != null) 'trackingId': trackingId,
    };
  }
}

/// Provides a summary of the properties of an event tracker. For a complete
/// listing, call the <a>DescribeEventTracker</a> API.
class EventTrackerSummary {
  /// The date and time (in Unix time) that the event tracker was created.
  final DateTime? creationDateTime;

  /// The Amazon Resource Name (ARN) of the event tracker.
  final String? eventTrackerArn;

  /// The date and time (in Unix time) that the event tracker was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The name of the event tracker.
  final String? name;

  /// The status of the event tracker.
  ///
  /// An event tracker can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// DELETE PENDING &gt; DELETE IN_PROGRESS
  /// </li>
  /// </ul>
  final String? status;

  EventTrackerSummary({
    this.creationDateTime,
    this.eventTrackerArn,
    this.lastUpdatedDateTime,
    this.name,
    this.status,
  });

  factory EventTrackerSummary.fromJson(Map<String, dynamic> json) {
    return EventTrackerSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      eventTrackerArn: json['eventTrackerArn'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final eventTrackerArn = this.eventTrackerArn;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (eventTrackerArn != null) 'eventTrackerArn': eventTrackerArn,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (status != null) 'status': status,
    };
  }
}

/// Provides feature transformation information. Feature transformation is the
/// process of modifying raw input data into a form more suitable for model
/// training.
class FeatureTransformation {
  /// The creation date and time (in Unix time) of the feature transformation.
  final DateTime? creationDateTime;

  /// Provides the default parameters for feature transformation.
  final Map<String, String>? defaultParameters;

  /// The Amazon Resource Name (ARN) of the FeatureTransformation object.
  final String? featureTransformationArn;

  /// The last update date and time (in Unix time) of the feature transformation.
  final DateTime? lastUpdatedDateTime;

  /// The name of the feature transformation.
  final String? name;

  /// The status of the feature transformation.
  ///
  /// A feature transformation can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// </ul>
  final String? status;

  FeatureTransformation({
    this.creationDateTime,
    this.defaultParameters,
    this.featureTransformationArn,
    this.lastUpdatedDateTime,
    this.name,
    this.status,
  });

  factory FeatureTransformation.fromJson(Map<String, dynamic> json) {
    return FeatureTransformation(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      defaultParameters: (json['defaultParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      featureTransformationArn: json['featureTransformationArn'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final defaultParameters = this.defaultParameters;
    final featureTransformationArn = this.featureTransformationArn;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (defaultParameters != null) 'defaultParameters': defaultParameters,
      if (featureTransformationArn != null)
        'featureTransformationArn': featureTransformationArn,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (status != null) 'status': status,
    };
  }
}

/// Contains information on a recommendation filter, including its ARN, status,
/// and filter expression.
class Filter {
  /// The time at which the filter was created.
  final DateTime? creationDateTime;

  /// The ARN of the dataset group to which the filter belongs.
  final String? datasetGroupArn;

  /// If the filter failed, the reason for its failure.
  final String? failureReason;

  /// The ARN of the filter.
  final String? filterArn;

  /// Specifies the type of item interactions to filter out of recommendation
  /// results. The filter expression must follow specific format rules. For
  /// information about filter expression structure and syntax, see
  /// <a>filter-expressions</a>.
  final String? filterExpression;

  /// The time at which the filter was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The name of the filter.
  final String? name;

  /// The status of the filter.
  final String? status;

  Filter({
    this.creationDateTime,
    this.datasetGroupArn,
    this.failureReason,
    this.filterArn,
    this.filterExpression,
    this.lastUpdatedDateTime,
    this.name,
    this.status,
  });

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      datasetGroupArn: json['datasetGroupArn'] as String?,
      failureReason: json['failureReason'] as String?,
      filterArn: json['filterArn'] as String?,
      filterExpression: json['filterExpression'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final datasetGroupArn = this.datasetGroupArn;
    final failureReason = this.failureReason;
    final filterArn = this.filterArn;
    final filterExpression = this.filterExpression;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
      if (failureReason != null) 'failureReason': failureReason,
      if (filterArn != null) 'filterArn': filterArn,
      if (filterExpression != null) 'filterExpression': filterExpression,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (status != null) 'status': status,
    };
  }
}

/// A short summary of a filter's attributes.
class FilterSummary {
  /// The time at which the filter was created.
  final DateTime? creationDateTime;

  /// The ARN of the dataset group to which the filter belongs.
  final String? datasetGroupArn;

  /// If the filter failed, the reason for the failure.
  final String? failureReason;

  /// The ARN of the filter.
  final String? filterArn;

  /// The time at which the filter was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The name of the filter.
  final String? name;

  /// The status of the filter.
  final String? status;

  FilterSummary({
    this.creationDateTime,
    this.datasetGroupArn,
    this.failureReason,
    this.filterArn,
    this.lastUpdatedDateTime,
    this.name,
    this.status,
  });

  factory FilterSummary.fromJson(Map<String, dynamic> json) {
    return FilterSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      datasetGroupArn: json['datasetGroupArn'] as String?,
      failureReason: json['failureReason'] as String?,
      filterArn: json['filterArn'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final datasetGroupArn = this.datasetGroupArn;
    final failureReason = this.failureReason;
    final filterArn = this.filterArn;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
      if (failureReason != null) 'failureReason': failureReason,
      if (filterArn != null) 'filterArn': filterArn,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (status != null) 'status': status,
    };
  }
}

class GetSolutionMetricsResponse {
  /// The metrics for the solution version.
  final Map<String, double>? metrics;

  /// The same solution version ARN as specified in the request.
  final String? solutionVersionArn;

  GetSolutionMetricsResponse({
    this.metrics,
    this.solutionVersionArn,
  });

  factory GetSolutionMetricsResponse.fromJson(Map<String, dynamic> json) {
    return GetSolutionMetricsResponse(
      metrics: (json['metrics'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as double)),
      solutionVersionArn: json['solutionVersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metrics = this.metrics;
    final solutionVersionArn = this.solutionVersionArn;
    return {
      if (metrics != null) 'metrics': metrics,
      if (solutionVersionArn != null) 'solutionVersionArn': solutionVersionArn,
    };
  }
}

/// Describes the properties for hyperparameter optimization (HPO).
class HPOConfig {
  /// The hyperparameters and their allowable ranges.
  final HyperParameterRanges? algorithmHyperParameterRanges;

  /// The metric to optimize during HPO.
  /// <note>
  /// Amazon Personalize doesn't support configuring the <code>hpoObjective</code>
  /// at this time.
  /// </note>
  final HPOObjective? hpoObjective;

  /// Describes the resource configuration for HPO.
  final HPOResourceConfig? hpoResourceConfig;

  HPOConfig({
    this.algorithmHyperParameterRanges,
    this.hpoObjective,
    this.hpoResourceConfig,
  });

  factory HPOConfig.fromJson(Map<String, dynamic> json) {
    return HPOConfig(
      algorithmHyperParameterRanges:
          json['algorithmHyperParameterRanges'] != null
              ? HyperParameterRanges.fromJson(
                  json['algorithmHyperParameterRanges'] as Map<String, dynamic>)
              : null,
      hpoObjective: json['hpoObjective'] != null
          ? HPOObjective.fromJson(json['hpoObjective'] as Map<String, dynamic>)
          : null,
      hpoResourceConfig: json['hpoResourceConfig'] != null
          ? HPOResourceConfig.fromJson(
              json['hpoResourceConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final algorithmHyperParameterRanges = this.algorithmHyperParameterRanges;
    final hpoObjective = this.hpoObjective;
    final hpoResourceConfig = this.hpoResourceConfig;
    return {
      if (algorithmHyperParameterRanges != null)
        'algorithmHyperParameterRanges': algorithmHyperParameterRanges,
      if (hpoObjective != null) 'hpoObjective': hpoObjective,
      if (hpoResourceConfig != null) 'hpoResourceConfig': hpoResourceConfig,
    };
  }
}

/// The metric to optimize during hyperparameter optimization (HPO).
/// <note>
/// Amazon Personalize doesn't support configuring the <code>hpoObjective</code>
/// at this time.
/// </note>
class HPOObjective {
  /// The name of the metric.
  final String? metricName;

  /// A regular expression for finding the metric in the training job logs.
  final String? metricRegex;

  /// The type of the metric. Valid values are <code>Maximize</code> and
  /// <code>Minimize</code>.
  final String? type;

  HPOObjective({
    this.metricName,
    this.metricRegex,
    this.type,
  });

  factory HPOObjective.fromJson(Map<String, dynamic> json) {
    return HPOObjective(
      metricName: json['metricName'] as String?,
      metricRegex: json['metricRegex'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricName = this.metricName;
    final metricRegex = this.metricRegex;
    final type = this.type;
    return {
      if (metricName != null) 'metricName': metricName,
      if (metricRegex != null) 'metricRegex': metricRegex,
      if (type != null) 'type': type,
    };
  }
}

/// Describes the resource configuration for hyperparameter optimization (HPO).
class HPOResourceConfig {
  /// The maximum number of training jobs when you create a solution version. The
  /// maximum value for <code>maxNumberOfTrainingJobs</code> is <code>40</code>.
  final String? maxNumberOfTrainingJobs;

  /// The maximum number of parallel training jobs when you create a solution
  /// version. The maximum value for <code>maxParallelTrainingJobs</code> is
  /// <code>10</code>.
  final String? maxParallelTrainingJobs;

  HPOResourceConfig({
    this.maxNumberOfTrainingJobs,
    this.maxParallelTrainingJobs,
  });

  factory HPOResourceConfig.fromJson(Map<String, dynamic> json) {
    return HPOResourceConfig(
      maxNumberOfTrainingJobs: json['maxNumberOfTrainingJobs'] as String?,
      maxParallelTrainingJobs: json['maxParallelTrainingJobs'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxNumberOfTrainingJobs = this.maxNumberOfTrainingJobs;
    final maxParallelTrainingJobs = this.maxParallelTrainingJobs;
    return {
      if (maxNumberOfTrainingJobs != null)
        'maxNumberOfTrainingJobs': maxNumberOfTrainingJobs,
      if (maxParallelTrainingJobs != null)
        'maxParallelTrainingJobs': maxParallelTrainingJobs,
    };
  }
}

/// Specifies the hyperparameters and their ranges. Hyperparameters can be
/// categorical, continuous, or integer-valued.
class HyperParameterRanges {
  /// The categorical hyperparameters and their ranges.
  final List<CategoricalHyperParameterRange>? categoricalHyperParameterRanges;

  /// The continuous hyperparameters and their ranges.
  final List<ContinuousHyperParameterRange>? continuousHyperParameterRanges;

  /// The integer-valued hyperparameters and their ranges.
  final List<IntegerHyperParameterRange>? integerHyperParameterRanges;

  HyperParameterRanges({
    this.categoricalHyperParameterRanges,
    this.continuousHyperParameterRanges,
    this.integerHyperParameterRanges,
  });

  factory HyperParameterRanges.fromJson(Map<String, dynamic> json) {
    return HyperParameterRanges(
      categoricalHyperParameterRanges:
          (json['categoricalHyperParameterRanges'] as List?)
              ?.whereNotNull()
              .map((e) => CategoricalHyperParameterRange.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      continuousHyperParameterRanges: (json['continuousHyperParameterRanges']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ContinuousHyperParameterRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      integerHyperParameterRanges: (json['integerHyperParameterRanges']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              IntegerHyperParameterRange.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final categoricalHyperParameterRanges =
        this.categoricalHyperParameterRanges;
    final continuousHyperParameterRanges = this.continuousHyperParameterRanges;
    final integerHyperParameterRanges = this.integerHyperParameterRanges;
    return {
      if (categoricalHyperParameterRanges != null)
        'categoricalHyperParameterRanges': categoricalHyperParameterRanges,
      if (continuousHyperParameterRanges != null)
        'continuousHyperParameterRanges': continuousHyperParameterRanges,
      if (integerHyperParameterRanges != null)
        'integerHyperParameterRanges': integerHyperParameterRanges,
    };
  }
}

enum IngestionMode {
  bulk,
  put,
  all,
}

extension on IngestionMode {
  String toValue() {
    switch (this) {
      case IngestionMode.bulk:
        return 'BULK';
      case IngestionMode.put:
        return 'PUT';
      case IngestionMode.all:
        return 'ALL';
    }
  }
}

extension on String {
  IngestionMode toIngestionMode() {
    switch (this) {
      case 'BULK':
        return IngestionMode.bulk;
      case 'PUT':
        return IngestionMode.put;
      case 'ALL':
        return IngestionMode.all;
    }
    throw Exception('$this is not known in enum IngestionMode');
  }
}

/// Provides the name and range of an integer-valued hyperparameter.
class IntegerHyperParameterRange {
  /// The maximum allowable value for the hyperparameter.
  final int? maxValue;

  /// The minimum allowable value for the hyperparameter.
  final int? minValue;

  /// The name of the hyperparameter.
  final String? name;

  IntegerHyperParameterRange({
    this.maxValue,
    this.minValue,
    this.name,
  });

  factory IntegerHyperParameterRange.fromJson(Map<String, dynamic> json) {
    return IntegerHyperParameterRange(
      maxValue: json['maxValue'] as int?,
      minValue: json['minValue'] as int?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxValue = this.maxValue;
    final minValue = this.minValue;
    final name = this.name;
    return {
      if (maxValue != null) 'maxValue': maxValue,
      if (minValue != null) 'minValue': minValue,
      if (name != null) 'name': name,
    };
  }
}

class ListBatchInferenceJobsResponse {
  /// A list containing information on each job that is returned.
  final List<BatchInferenceJobSummary>? batchInferenceJobs;

  /// The token to use to retrieve the next page of results. The value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListBatchInferenceJobsResponse({
    this.batchInferenceJobs,
    this.nextToken,
  });

  factory ListBatchInferenceJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListBatchInferenceJobsResponse(
      batchInferenceJobs: (json['batchInferenceJobs'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BatchInferenceJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchInferenceJobs = this.batchInferenceJobs;
    final nextToken = this.nextToken;
    return {
      if (batchInferenceJobs != null) 'batchInferenceJobs': batchInferenceJobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListCampaignsResponse {
  /// A list of the campaigns.
  final List<CampaignSummary>? campaigns;

  /// A token for getting the next set of campaigns (if they exist).
  final String? nextToken;

  ListCampaignsResponse({
    this.campaigns,
    this.nextToken,
  });

  factory ListCampaignsResponse.fromJson(Map<String, dynamic> json) {
    return ListCampaignsResponse(
      campaigns: (json['campaigns'] as List?)
          ?.whereNotNull()
          .map((e) => CampaignSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final campaigns = this.campaigns;
    final nextToken = this.nextToken;
    return {
      if (campaigns != null) 'campaigns': campaigns,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDatasetExportJobsResponse {
  /// The list of dataset export jobs.
  final List<DatasetExportJobSummary>? datasetExportJobs;

  /// A token for getting the next set of dataset export jobs (if they exist).
  final String? nextToken;

  ListDatasetExportJobsResponse({
    this.datasetExportJobs,
    this.nextToken,
  });

  factory ListDatasetExportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListDatasetExportJobsResponse(
      datasetExportJobs: (json['datasetExportJobs'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DatasetExportJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetExportJobs = this.datasetExportJobs;
    final nextToken = this.nextToken;
    return {
      if (datasetExportJobs != null) 'datasetExportJobs': datasetExportJobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDatasetGroupsResponse {
  /// The list of your dataset groups.
  final List<DatasetGroupSummary>? datasetGroups;

  /// A token for getting the next set of dataset groups (if they exist).
  final String? nextToken;

  ListDatasetGroupsResponse({
    this.datasetGroups,
    this.nextToken,
  });

  factory ListDatasetGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListDatasetGroupsResponse(
      datasetGroups: (json['datasetGroups'] as List?)
          ?.whereNotNull()
          .map((e) => DatasetGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetGroups = this.datasetGroups;
    final nextToken = this.nextToken;
    return {
      if (datasetGroups != null) 'datasetGroups': datasetGroups,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDatasetImportJobsResponse {
  /// The list of dataset import jobs.
  final List<DatasetImportJobSummary>? datasetImportJobs;

  /// A token for getting the next set of dataset import jobs (if they exist).
  final String? nextToken;

  ListDatasetImportJobsResponse({
    this.datasetImportJobs,
    this.nextToken,
  });

  factory ListDatasetImportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListDatasetImportJobsResponse(
      datasetImportJobs: (json['datasetImportJobs'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DatasetImportJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetImportJobs = this.datasetImportJobs;
    final nextToken = this.nextToken;
    return {
      if (datasetImportJobs != null) 'datasetImportJobs': datasetImportJobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDatasetsResponse {
  /// An array of <code>Dataset</code> objects. Each object provides metadata
  /// information.
  final List<DatasetSummary>? datasets;

  /// A token for getting the next set of datasets (if they exist).
  final String? nextToken;

  ListDatasetsResponse({
    this.datasets,
    this.nextToken,
  });

  factory ListDatasetsResponse.fromJson(Map<String, dynamic> json) {
    return ListDatasetsResponse(
      datasets: (json['datasets'] as List?)
          ?.whereNotNull()
          .map((e) => DatasetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datasets = this.datasets;
    final nextToken = this.nextToken;
    return {
      if (datasets != null) 'datasets': datasets,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEventTrackersResponse {
  /// A list of event trackers.
  final List<EventTrackerSummary>? eventTrackers;

  /// A token for getting the next set of event trackers (if they exist).
  final String? nextToken;

  ListEventTrackersResponse({
    this.eventTrackers,
    this.nextToken,
  });

  factory ListEventTrackersResponse.fromJson(Map<String, dynamic> json) {
    return ListEventTrackersResponse(
      eventTrackers: (json['eventTrackers'] as List?)
          ?.whereNotNull()
          .map((e) => EventTrackerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventTrackers = this.eventTrackers;
    final nextToken = this.nextToken;
    return {
      if (eventTrackers != null) 'eventTrackers': eventTrackers,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListFiltersResponse {
  /// A list of returned filters.
  final List<FilterSummary>? filters;

  /// A token for getting the next set of filters (if they exist).
  final String? nextToken;

  ListFiltersResponse({
    this.filters,
    this.nextToken,
  });

  factory ListFiltersResponse.fromJson(Map<String, dynamic> json) {
    return ListFiltersResponse(
      filters: (json['Filters'] as List?)
          ?.whereNotNull()
          .map((e) => FilterSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    final nextToken = this.nextToken;
    return {
      if (filters != null) 'Filters': filters,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListRecipesResponse {
  /// A token for getting the next set of recipes.
  final String? nextToken;

  /// The list of available recipes.
  final List<RecipeSummary>? recipes;

  ListRecipesResponse({
    this.nextToken,
    this.recipes,
  });

  factory ListRecipesResponse.fromJson(Map<String, dynamic> json) {
    return ListRecipesResponse(
      nextToken: json['nextToken'] as String?,
      recipes: (json['recipes'] as List?)
          ?.whereNotNull()
          .map((e) => RecipeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final recipes = this.recipes;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (recipes != null) 'recipes': recipes,
    };
  }
}

class ListSchemasResponse {
  /// A token used to get the next set of schemas (if they exist).
  final String? nextToken;

  /// A list of schemas.
  final List<DatasetSchemaSummary>? schemas;

  ListSchemasResponse({
    this.nextToken,
    this.schemas,
  });

  factory ListSchemasResponse.fromJson(Map<String, dynamic> json) {
    return ListSchemasResponse(
      nextToken: json['nextToken'] as String?,
      schemas: (json['schemas'] as List?)
          ?.whereNotNull()
          .map((e) => DatasetSchemaSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final schemas = this.schemas;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (schemas != null) 'schemas': schemas,
    };
  }
}

class ListSolutionVersionsResponse {
  /// A token for getting the next set of solution versions (if they exist).
  final String? nextToken;

  /// A list of solution versions describing the version properties.
  final List<SolutionVersionSummary>? solutionVersions;

  ListSolutionVersionsResponse({
    this.nextToken,
    this.solutionVersions,
  });

  factory ListSolutionVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSolutionVersionsResponse(
      nextToken: json['nextToken'] as String?,
      solutionVersions: (json['solutionVersions'] as List?)
          ?.whereNotNull()
          .map(
              (e) => SolutionVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final solutionVersions = this.solutionVersions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (solutionVersions != null) 'solutionVersions': solutionVersions,
    };
  }
}

class ListSolutionsResponse {
  /// A token for getting the next set of solutions (if they exist).
  final String? nextToken;

  /// A list of the current solutions.
  final List<SolutionSummary>? solutions;

  ListSolutionsResponse({
    this.nextToken,
    this.solutions,
  });

  factory ListSolutionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSolutionsResponse(
      nextToken: json['nextToken'] as String?,
      solutions: (json['solutions'] as List?)
          ?.whereNotNull()
          .map((e) => SolutionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final solutions = this.solutions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (solutions != null) 'solutions': solutions,
    };
  }
}

enum ObjectiveSensitivity {
  low,
  medium,
  high,
  off,
}

extension on ObjectiveSensitivity {
  String toValue() {
    switch (this) {
      case ObjectiveSensitivity.low:
        return 'LOW';
      case ObjectiveSensitivity.medium:
        return 'MEDIUM';
      case ObjectiveSensitivity.high:
        return 'HIGH';
      case ObjectiveSensitivity.off:
        return 'OFF';
    }
  }
}

extension on String {
  ObjectiveSensitivity toObjectiveSensitivity() {
    switch (this) {
      case 'LOW':
        return ObjectiveSensitivity.low;
      case 'MEDIUM':
        return ObjectiveSensitivity.medium;
      case 'HIGH':
        return ObjectiveSensitivity.high;
      case 'OFF':
        return ObjectiveSensitivity.off;
    }
    throw Exception('$this is not known in enum ObjectiveSensitivity');
  }
}

/// Describes the additional objective for the solution, such as maximizing
/// streaming minutes or increasing revenue. For more information see <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/optimizing-solution-for-objective.html">Optimizing
/// a solution</a>.
class OptimizationObjective {
  /// The numerical metadata column in an Items dataset related to the
  /// optimization objective. For example, VIDEO_LENGTH (to maximize streaming
  /// minutes), or PRICE (to maximize revenue).
  final String? itemAttribute;

  /// Specifies how Amazon Personalize balances the importance of your
  /// optimization objective versus relevance.
  final ObjectiveSensitivity? objectiveSensitivity;

  OptimizationObjective({
    this.itemAttribute,
    this.objectiveSensitivity,
  });

  factory OptimizationObjective.fromJson(Map<String, dynamic> json) {
    return OptimizationObjective(
      itemAttribute: json['itemAttribute'] as String?,
      objectiveSensitivity:
          (json['objectiveSensitivity'] as String?)?.toObjectiveSensitivity(),
    );
  }

  Map<String, dynamic> toJson() {
    final itemAttribute = this.itemAttribute;
    final objectiveSensitivity = this.objectiveSensitivity;
    return {
      if (itemAttribute != null) 'itemAttribute': itemAttribute,
      if (objectiveSensitivity != null)
        'objectiveSensitivity': objectiveSensitivity.toValue(),
    };
  }
}

/// Provides information about a recipe. Each recipe provides an algorithm that
/// Amazon Personalize uses in model training when you use the
/// <a>CreateSolution</a> operation.
class Recipe {
  /// The Amazon Resource Name (ARN) of the algorithm that Amazon Personalize uses
  /// to train the model.
  final String? algorithmArn;

  /// The date and time (in Unix format) that the recipe was created.
  final DateTime? creationDateTime;

  /// The description of the recipe.
  final String? description;

  /// The ARN of the FeatureTransformation object.
  final String? featureTransformationArn;

  /// The date and time (in Unix format) that the recipe was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The name of the recipe.
  final String? name;

  /// The Amazon Resource Name (ARN) of the recipe.
  final String? recipeArn;

  /// One of the following values:
  ///
  /// <ul>
  /// <li>
  /// PERSONALIZED_RANKING
  /// </li>
  /// <li>
  /// RELATED_ITEMS
  /// </li>
  /// <li>
  /// USER_PERSONALIZATION
  /// </li>
  /// </ul>
  final String? recipeType;

  /// The status of the recipe.
  final String? status;

  Recipe({
    this.algorithmArn,
    this.creationDateTime,
    this.description,
    this.featureTransformationArn,
    this.lastUpdatedDateTime,
    this.name,
    this.recipeArn,
    this.recipeType,
    this.status,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      algorithmArn: json['algorithmArn'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      description: json['description'] as String?,
      featureTransformationArn: json['featureTransformationArn'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      recipeArn: json['recipeArn'] as String?,
      recipeType: json['recipeType'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final algorithmArn = this.algorithmArn;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final featureTransformationArn = this.featureTransformationArn;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final recipeArn = this.recipeArn;
    final recipeType = this.recipeType;
    final status = this.status;
    return {
      if (algorithmArn != null) 'algorithmArn': algorithmArn,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (description != null) 'description': description,
      if (featureTransformationArn != null)
        'featureTransformationArn': featureTransformationArn,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (recipeArn != null) 'recipeArn': recipeArn,
      if (recipeType != null) 'recipeType': recipeType,
      if (status != null) 'status': status,
    };
  }
}

enum RecipeProvider {
  service,
}

extension on RecipeProvider {
  String toValue() {
    switch (this) {
      case RecipeProvider.service:
        return 'SERVICE';
    }
  }
}

extension on String {
  RecipeProvider toRecipeProvider() {
    switch (this) {
      case 'SERVICE':
        return RecipeProvider.service;
    }
    throw Exception('$this is not known in enum RecipeProvider');
  }
}

/// Provides a summary of the properties of a recipe. For a complete listing,
/// call the <a>DescribeRecipe</a> API.
class RecipeSummary {
  /// The date and time (in Unix time) that the recipe was created.
  final DateTime? creationDateTime;

  /// The date and time (in Unix time) that the recipe was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The name of the recipe.
  final String? name;

  /// The Amazon Resource Name (ARN) of the recipe.
  final String? recipeArn;

  /// The status of the recipe.
  final String? status;

  RecipeSummary({
    this.creationDateTime,
    this.lastUpdatedDateTime,
    this.name,
    this.recipeArn,
    this.status,
  });

  factory RecipeSummary.fromJson(Map<String, dynamic> json) {
    return RecipeSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      recipeArn: json['recipeArn'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final recipeArn = this.recipeArn;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (recipeArn != null) 'recipeArn': recipeArn,
      if (status != null) 'status': status,
    };
  }
}

/// The configuration details of an Amazon S3 input or output bucket.
class S3DataConfig {
  /// The file path of the Amazon S3 bucket.
  final String path;

  /// The Amazon Resource Name (ARN) of the Amazon Key Management Service (KMS)
  /// key that Amazon Personalize uses to encrypt or decrypt the input and output
  /// files of a batch inference job.
  final String? kmsKeyArn;

  S3DataConfig({
    required this.path,
    this.kmsKeyArn,
  });

  factory S3DataConfig.fromJson(Map<String, dynamic> json) {
    return S3DataConfig(
      path: json['path'] as String,
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'path': path,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

/// An object that provides information about a solution. A solution is a
/// trained model that can be deployed as a campaign.
class Solution {
  /// When <code>performAutoML</code> is true, specifies the best recipe found.
  final AutoMLResult? autoMLResult;

  /// The creation date and time (in Unix time) of the solution.
  final DateTime? creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset group that provides the
  /// training data.
  final String? datasetGroupArn;

  /// The event type (for example, 'click' or 'like') that is used for training
  /// the model. If no <code>eventType</code> is provided, Amazon Personalize uses
  /// all interactions for training with equal weight regardless of type.
  final String? eventType;

  /// The date and time (in Unix time) that the solution was last updated.
  final DateTime? lastUpdatedDateTime;

  /// Describes the latest version of the solution, including the status and the
  /// ARN.
  final SolutionVersionSummary? latestSolutionVersion;

  /// The name of the solution.
  final String? name;

  /// When true, Amazon Personalize performs a search for the best
  /// USER_PERSONALIZATION recipe from the list specified in the solution
  /// configuration (<code>recipeArn</code> must not be specified). When false
  /// (the default), Amazon Personalize uses <code>recipeArn</code> for training.
  final bool? performAutoML;

  /// Whether to perform hyperparameter optimization (HPO) on the chosen recipe.
  /// The default is <code>false</code>.
  final bool? performHPO;

  /// The ARN of the recipe used to create the solution.
  final String? recipeArn;

  /// The ARN of the solution.
  final String? solutionArn;

  /// Describes the configuration properties for the solution.
  final SolutionConfig? solutionConfig;

  /// The status of the solution.
  ///
  /// A solution can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// DELETE PENDING &gt; DELETE IN_PROGRESS
  /// </li>
  /// </ul>
  final String? status;

  Solution({
    this.autoMLResult,
    this.creationDateTime,
    this.datasetGroupArn,
    this.eventType,
    this.lastUpdatedDateTime,
    this.latestSolutionVersion,
    this.name,
    this.performAutoML,
    this.performHPO,
    this.recipeArn,
    this.solutionArn,
    this.solutionConfig,
    this.status,
  });

  factory Solution.fromJson(Map<String, dynamic> json) {
    return Solution(
      autoMLResult: json['autoMLResult'] != null
          ? AutoMLResult.fromJson(json['autoMLResult'] as Map<String, dynamic>)
          : null,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      datasetGroupArn: json['datasetGroupArn'] as String?,
      eventType: json['eventType'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      latestSolutionVersion: json['latestSolutionVersion'] != null
          ? SolutionVersionSummary.fromJson(
              json['latestSolutionVersion'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      performAutoML: json['performAutoML'] as bool?,
      performHPO: json['performHPO'] as bool?,
      recipeArn: json['recipeArn'] as String?,
      solutionArn: json['solutionArn'] as String?,
      solutionConfig: json['solutionConfig'] != null
          ? SolutionConfig.fromJson(
              json['solutionConfig'] as Map<String, dynamic>)
          : null,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final autoMLResult = this.autoMLResult;
    final creationDateTime = this.creationDateTime;
    final datasetGroupArn = this.datasetGroupArn;
    final eventType = this.eventType;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final latestSolutionVersion = this.latestSolutionVersion;
    final name = this.name;
    final performAutoML = this.performAutoML;
    final performHPO = this.performHPO;
    final recipeArn = this.recipeArn;
    final solutionArn = this.solutionArn;
    final solutionConfig = this.solutionConfig;
    final status = this.status;
    return {
      if (autoMLResult != null) 'autoMLResult': autoMLResult,
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
      if (eventType != null) 'eventType': eventType,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (latestSolutionVersion != null)
        'latestSolutionVersion': latestSolutionVersion,
      if (name != null) 'name': name,
      if (performAutoML != null) 'performAutoML': performAutoML,
      if (performHPO != null) 'performHPO': performHPO,
      if (recipeArn != null) 'recipeArn': recipeArn,
      if (solutionArn != null) 'solutionArn': solutionArn,
      if (solutionConfig != null) 'solutionConfig': solutionConfig,
      if (status != null) 'status': status,
    };
  }
}

/// Describes the configuration properties for the solution.
class SolutionConfig {
  /// Lists the hyperparameter names and ranges.
  final Map<String, String>? algorithmHyperParameters;

  /// The <a>AutoMLConfig</a> object containing a list of recipes to search when
  /// AutoML is performed.
  final AutoMLConfig? autoMLConfig;

  /// Only events with a value greater than or equal to this threshold are used
  /// for training a model.
  final String? eventValueThreshold;

  /// Lists the feature transformation parameters.
  final Map<String, String>? featureTransformationParameters;

  /// Describes the properties for hyperparameter optimization (HPO).
  final HPOConfig? hpoConfig;

  /// Describes the additional objective for the solution, such as maximizing
  /// streaming minutes or increasing revenue. For more information see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/optimizing-solution-for-objective.html">Optimizing
  /// a solution</a>.
  final OptimizationObjective? optimizationObjective;

  SolutionConfig({
    this.algorithmHyperParameters,
    this.autoMLConfig,
    this.eventValueThreshold,
    this.featureTransformationParameters,
    this.hpoConfig,
    this.optimizationObjective,
  });

  factory SolutionConfig.fromJson(Map<String, dynamic> json) {
    return SolutionConfig(
      algorithmHyperParameters:
          (json['algorithmHyperParameters'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      autoMLConfig: json['autoMLConfig'] != null
          ? AutoMLConfig.fromJson(json['autoMLConfig'] as Map<String, dynamic>)
          : null,
      eventValueThreshold: json['eventValueThreshold'] as String?,
      featureTransformationParameters:
          (json['featureTransformationParameters'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      hpoConfig: json['hpoConfig'] != null
          ? HPOConfig.fromJson(json['hpoConfig'] as Map<String, dynamic>)
          : null,
      optimizationObjective: json['optimizationObjective'] != null
          ? OptimizationObjective.fromJson(
              json['optimizationObjective'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final algorithmHyperParameters = this.algorithmHyperParameters;
    final autoMLConfig = this.autoMLConfig;
    final eventValueThreshold = this.eventValueThreshold;
    final featureTransformationParameters =
        this.featureTransformationParameters;
    final hpoConfig = this.hpoConfig;
    final optimizationObjective = this.optimizationObjective;
    return {
      if (algorithmHyperParameters != null)
        'algorithmHyperParameters': algorithmHyperParameters,
      if (autoMLConfig != null) 'autoMLConfig': autoMLConfig,
      if (eventValueThreshold != null)
        'eventValueThreshold': eventValueThreshold,
      if (featureTransformationParameters != null)
        'featureTransformationParameters': featureTransformationParameters,
      if (hpoConfig != null) 'hpoConfig': hpoConfig,
      if (optimizationObjective != null)
        'optimizationObjective': optimizationObjective,
    };
  }
}

/// Provides a summary of the properties of a solution. For a complete listing,
/// call the <a>DescribeSolution</a> API.
class SolutionSummary {
  /// The date and time (in Unix time) that the solution was created.
  final DateTime? creationDateTime;

  /// The date and time (in Unix time) that the solution was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The name of the solution.
  final String? name;

  /// The Amazon Resource Name (ARN) of the solution.
  final String? solutionArn;

  /// The status of the solution.
  ///
  /// A solution can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// DELETE PENDING &gt; DELETE IN_PROGRESS
  /// </li>
  /// </ul>
  final String? status;

  SolutionSummary({
    this.creationDateTime,
    this.lastUpdatedDateTime,
    this.name,
    this.solutionArn,
    this.status,
  });

  factory SolutionSummary.fromJson(Map<String, dynamic> json) {
    return SolutionSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      solutionArn: json['solutionArn'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final solutionArn = this.solutionArn;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (solutionArn != null) 'solutionArn': solutionArn,
      if (status != null) 'status': status,
    };
  }
}

/// An object that provides information about a specific version of a
/// <a>Solution</a>.
class SolutionVersion {
  /// The date and time (in Unix time) that this version of the solution was
  /// created.
  final DateTime? creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset group providing the training
  /// data.
  final String? datasetGroupArn;

  /// The event type (for example, 'click' or 'like') that is used for training
  /// the model.
  final String? eventType;

  /// If training a solution version fails, the reason for the failure.
  final String? failureReason;

  /// The date and time (in Unix time) that the solution was last updated.
  final DateTime? lastUpdatedDateTime;

  /// When true, Amazon Personalize searches for the most optimal recipe according
  /// to the solution configuration. When false (the default), Amazon Personalize
  /// uses <code>recipeArn</code>.
  final bool? performAutoML;

  /// Whether to perform hyperparameter optimization (HPO) on the chosen recipe.
  /// The default is <code>false</code>.
  final bool? performHPO;

  /// The ARN of the recipe used in the solution.
  final String? recipeArn;

  /// The ARN of the solution.
  final String? solutionArn;

  /// Describes the configuration properties for the solution.
  final SolutionConfig? solutionConfig;

  /// The ARN of the solution version.
  final String? solutionVersionArn;

  /// The status of the solution version.
  ///
  /// A solution version can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING
  /// </li>
  /// <li>
  /// CREATE IN_PROGRESS
  /// </li>
  /// <li>
  /// ACTIVE
  /// </li>
  /// <li>
  /// CREATE FAILED
  /// </li>
  /// <li>
  /// CREATE STOPPING
  /// </li>
  /// <li>
  /// CREATE STOPPED
  /// </li>
  /// </ul>
  final String? status;

  /// The time used to train the model. You are billed for the time it takes to
  /// train a model. This field is visible only after Amazon Personalize
  /// successfully trains a model.
  final double? trainingHours;

  /// The scope of training to be performed when creating the solution version.
  /// The <code>FULL</code> option trains the solution version based on the
  /// entirety of the input solution's training data, while the
  /// <code>UPDATE</code> option processes only the data that has changed in
  /// comparison to the input solution. Choose <code>UPDATE</code> when you want
  /// to incrementally update your solution version instead of creating an
  /// entirely new one.
  /// <important>
  /// The <code>UPDATE</code> option can only be used when you already have an
  /// active solution version created from the input solution using the
  /// <code>FULL</code> option and the input solution was trained with the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/native-recipe-new-item-USER_PERSONALIZATION.html">User-Personalization</a>
  /// recipe or the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/native-recipe-hrnn-coldstart.html">HRNN-Coldstart</a>
  /// recipe.
  /// </important>
  final TrainingMode? trainingMode;

  /// If hyperparameter optimization was performed, contains the hyperparameter
  /// values of the best performing model.
  final TunedHPOParams? tunedHPOParams;

  SolutionVersion({
    this.creationDateTime,
    this.datasetGroupArn,
    this.eventType,
    this.failureReason,
    this.lastUpdatedDateTime,
    this.performAutoML,
    this.performHPO,
    this.recipeArn,
    this.solutionArn,
    this.solutionConfig,
    this.solutionVersionArn,
    this.status,
    this.trainingHours,
    this.trainingMode,
    this.tunedHPOParams,
  });

  factory SolutionVersion.fromJson(Map<String, dynamic> json) {
    return SolutionVersion(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      datasetGroupArn: json['datasetGroupArn'] as String?,
      eventType: json['eventType'] as String?,
      failureReason: json['failureReason'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      performAutoML: json['performAutoML'] as bool?,
      performHPO: json['performHPO'] as bool?,
      recipeArn: json['recipeArn'] as String?,
      solutionArn: json['solutionArn'] as String?,
      solutionConfig: json['solutionConfig'] != null
          ? SolutionConfig.fromJson(
              json['solutionConfig'] as Map<String, dynamic>)
          : null,
      solutionVersionArn: json['solutionVersionArn'] as String?,
      status: json['status'] as String?,
      trainingHours: json['trainingHours'] as double?,
      trainingMode: (json['trainingMode'] as String?)?.toTrainingMode(),
      tunedHPOParams: json['tunedHPOParams'] != null
          ? TunedHPOParams.fromJson(
              json['tunedHPOParams'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final datasetGroupArn = this.datasetGroupArn;
    final eventType = this.eventType;
    final failureReason = this.failureReason;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final performAutoML = this.performAutoML;
    final performHPO = this.performHPO;
    final recipeArn = this.recipeArn;
    final solutionArn = this.solutionArn;
    final solutionConfig = this.solutionConfig;
    final solutionVersionArn = this.solutionVersionArn;
    final status = this.status;
    final trainingHours = this.trainingHours;
    final trainingMode = this.trainingMode;
    final tunedHPOParams = this.tunedHPOParams;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
      if (eventType != null) 'eventType': eventType,
      if (failureReason != null) 'failureReason': failureReason,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (performAutoML != null) 'performAutoML': performAutoML,
      if (performHPO != null) 'performHPO': performHPO,
      if (recipeArn != null) 'recipeArn': recipeArn,
      if (solutionArn != null) 'solutionArn': solutionArn,
      if (solutionConfig != null) 'solutionConfig': solutionConfig,
      if (solutionVersionArn != null) 'solutionVersionArn': solutionVersionArn,
      if (status != null) 'status': status,
      if (trainingHours != null) 'trainingHours': trainingHours,
      if (trainingMode != null) 'trainingMode': trainingMode.toValue(),
      if (tunedHPOParams != null) 'tunedHPOParams': tunedHPOParams,
    };
  }
}

/// Provides a summary of the properties of a solution version. For a complete
/// listing, call the <a>DescribeSolutionVersion</a> API.
class SolutionVersionSummary {
  /// The date and time (in Unix time) that this version of a solution was
  /// created.
  final DateTime? creationDateTime;

  /// If a solution version fails, the reason behind the failure.
  final String? failureReason;

  /// The date and time (in Unix time) that the solution version was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The Amazon Resource Name (ARN) of the solution version.
  final String? solutionVersionArn;

  /// The status of the solution version.
  ///
  /// A solution version can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// </ul>
  final String? status;

  SolutionVersionSummary({
    this.creationDateTime,
    this.failureReason,
    this.lastUpdatedDateTime,
    this.solutionVersionArn,
    this.status,
  });

  factory SolutionVersionSummary.fromJson(Map<String, dynamic> json) {
    return SolutionVersionSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      failureReason: json['failureReason'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      solutionVersionArn: json['solutionVersionArn'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final failureReason = this.failureReason;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final solutionVersionArn = this.solutionVersionArn;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (failureReason != null) 'failureReason': failureReason,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (solutionVersionArn != null) 'solutionVersionArn': solutionVersionArn,
      if (status != null) 'status': status,
    };
  }
}

enum TrainingMode {
  full,
  update,
}

extension on TrainingMode {
  String toValue() {
    switch (this) {
      case TrainingMode.full:
        return 'FULL';
      case TrainingMode.update:
        return 'UPDATE';
    }
  }
}

extension on String {
  TrainingMode toTrainingMode() {
    switch (this) {
      case 'FULL':
        return TrainingMode.full;
      case 'UPDATE':
        return TrainingMode.update;
    }
    throw Exception('$this is not known in enum TrainingMode');
  }
}

/// If hyperparameter optimization (HPO) was performed, contains the
/// hyperparameter values of the best performing model.
class TunedHPOParams {
  /// A list of the hyperparameter values of the best performing model.
  final Map<String, String>? algorithmHyperParameters;

  TunedHPOParams({
    this.algorithmHyperParameters,
  });

  factory TunedHPOParams.fromJson(Map<String, dynamic> json) {
    return TunedHPOParams(
      algorithmHyperParameters:
          (json['algorithmHyperParameters'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final algorithmHyperParameters = this.algorithmHyperParameters;
    return {
      if (algorithmHyperParameters != null)
        'algorithmHyperParameters': algorithmHyperParameters,
    };
  }
}

class UpdateCampaignResponse {
  /// The same campaign ARN as given in the request.
  final String? campaignArn;

  UpdateCampaignResponse({
    this.campaignArn,
  });

  factory UpdateCampaignResponse.fromJson(Map<String, dynamic> json) {
    return UpdateCampaignResponse(
      campaignArn: json['campaignArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final campaignArn = this.campaignArn;
    return {
      if (campaignArn != null) 'campaignArn': campaignArn,
    };
  }
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String? type, String? message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};

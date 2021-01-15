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

part '2018-05-22.g.dart';

/// Amazon Personalize is a machine learning service that makes it easy to add
/// individualized recommendations to customers.
class Personalize {
  final _s.JsonProtocol _protocol;
  Personalize({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
  /// permissions to read and write to your input and out Amazon S3 buckets
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
  /// information on using filters, see Using Filters with Amazon Personalize.
  ///
  /// Parameter [numResults] :
  /// The number of recommendations to retreive.
  Future<CreateBatchInferenceJobResponse> createBatchInferenceJob({
    @_s.required BatchInferenceJobInput jobInput,
    @_s.required String jobName,
    @_s.required BatchInferenceJobOutput jobOutput,
    @_s.required String roleArn,
    @_s.required String solutionVersionArn,
    BatchInferenceJobConfig batchInferenceJobConfig,
    String filterArn,
    int numResults,
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
    _s.validateStringPattern(
      'jobName',
      jobName,
      r'''^[a-zA-Z0-9][a-zA-Z0-9\-_]*''',
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
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''arn:([a-z\d-]+):iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+''',
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
    _s.validateStringPattern(
      'solutionVersionArn',
      solutionVersionArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'filterArn',
      filterArn,
      0,
      256,
    );
    _s.validateStringPattern(
      'filterArn',
      filterArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
  /// billing charge. If your TPS increases beyond
  /// <code>minProvisionedTPS</code>, Amazon Personalize auto-scales the
  /// provisioned capacity up and down, but never below
  /// <code>minProvisionedTPS</code>, to maintain a 70% utilization. There's a
  /// short time delay while the capacity is increased that might cause loss of
  /// transactions. It's recommended to start with a low
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
    @_s.required int minProvisionedTPS,
    @_s.required String name,
    @_s.required String solutionVersionArn,
    CampaignConfig campaignConfig,
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
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9][a-zA-Z0-9\-_]*''',
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
    _s.validateStringPattern(
      'solutionVersionArn',
      solutionVersionArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    @_s.required String datasetGroupArn,
    @_s.required String datasetType,
    @_s.required String name,
    @_s.required String schemaArn,
  }) async {
    ArgumentError.checkNotNull(datasetGroupArn, 'datasetGroupArn');
    _s.validateStringLength(
      'datasetGroupArn',
      datasetGroupArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetGroupArn',
      datasetGroupArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9][a-zA-Z0-9\-_]*''',
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
    _s.validateStringPattern(
      'schemaArn',
      schemaArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    @_s.required String name,
    String kmsKeyArn,
    String roleArn,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9][a-zA-Z0-9\-_]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'roleArn',
      roleArn,
      0,
      256,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''arn:([a-z\d-]+):iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+''',
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
  /// Management (IAM) role that has permission to read from the data source, as
  /// Amazon Personalize makes a copy of your data and processes it in an
  /// internal AWS system.
  /// <important>
  /// The dataset import job replaces any previous data in the dataset.
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
    @_s.required DataSource dataSource,
    @_s.required String datasetArn,
    @_s.required String jobName,
    @_s.required String roleArn,
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
    _s.validateStringPattern(
      'datasetArn',
      datasetArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    _s.validateStringPattern(
      'jobName',
      jobName,
      r'''^[a-zA-Z0-9][a-zA-Z0-9\-_]*''',
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
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''arn:([a-z\d-]+):iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+''',
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

  /// Creates an event tracker that you use when sending event data to the
  /// specified dataset group using the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html">PutEvents</a>
  /// API.
  ///
  /// When Amazon Personalize creates an event tracker, it also creates an
  /// <i>event-interactions</i> dataset in the dataset group associated with the
  /// event tracker. The event-interactions dataset stores the event data from
  /// the <code>PutEvents</code> call. The contents of this dataset are not
  /// available to the user.
  /// <note>
  /// Only one event tracker can be associated with a dataset group. You will
  /// get an error if you call <code>CreateEventTracker</code> using the same
  /// dataset group as an existing event tracker.
  /// </note>
  /// When you send event data you include your tracking ID. The tracking ID
  /// identifies the customer and authorizes the customer to send the data.
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
    @_s.required String datasetGroupArn,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(datasetGroupArn, 'datasetGroupArn');
    _s.validateStringLength(
      'datasetGroupArn',
      datasetGroupArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetGroupArn',
      datasetGroupArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9][a-zA-Z0-9\-_]*''',
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

  /// Creates a recommendation filter. For more information, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/filters.html">Using
  /// Filters with Amazon Personalize</a>.
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
  /// The filter expression that designates the interaction types that the
  /// filter will filter out. A filter expression must follow the following
  /// format:
  ///
  /// <code>EXCLUDE itemId WHERE INTERACTIONS.event_type in
  /// ("EVENT_TYPE")</code>
  ///
  /// Where "EVENT_TYPE" is the type of event to filter out. To filter out all
  /// items with any interactions history, set <code>"*"</code> as the
  /// EVENT_TYPE. For more information, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/filters.html">Using
  /// Filters with Amazon Personalize</a>.
  ///
  /// Parameter [name] :
  /// The name of the filter to create.
  Future<CreateFilterResponse> createFilter({
    @_s.required String datasetGroupArn,
    @_s.required String filterExpression,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(datasetGroupArn, 'datasetGroupArn');
    _s.validateStringLength(
      'datasetGroupArn',
      datasetGroupArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetGroupArn',
      datasetGroupArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9][a-zA-Z0-9\-_]*''',
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
    @_s.required String name,
    @_s.required String schema,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9][a-zA-Z0-9\-_]*''',
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
  ///
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
  Future<CreateSolutionResponse> createSolution({
    @_s.required String datasetGroupArn,
    @_s.required String name,
    String eventType,
    bool performAutoML,
    bool performHPO,
    String recipeArn,
    SolutionConfig solutionConfig,
  }) async {
    ArgumentError.checkNotNull(datasetGroupArn, 'datasetGroupArn');
    _s.validateStringLength(
      'datasetGroupArn',
      datasetGroupArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetGroupArn',
      datasetGroupArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9][a-zA-Z0-9\-_]*''',
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
    _s.validateStringPattern(
      'recipeArn',
      recipeArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
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
  /// <code>FULL</code> option and the input solution was trained with the
  /// <a>native-recipe-hrnn-coldstart</a> recipe.
  /// </important>
  Future<CreateSolutionVersionResponse> createSolutionVersion({
    @_s.required String solutionArn,
    TrainingMode trainingMode,
  }) async {
    ArgumentError.checkNotNull(solutionArn, 'solutionArn');
    _s.validateStringLength(
      'solutionArn',
      solutionArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'solutionArn',
      solutionArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    @_s.required String campaignArn,
  }) async {
    ArgumentError.checkNotNull(campaignArn, 'campaignArn');
    _s.validateStringLength(
      'campaignArn',
      campaignArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'campaignArn',
      campaignArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DeleteCampaign'
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
    @_s.required String datasetArn,
  }) async {
    ArgumentError.checkNotNull(datasetArn, 'datasetArn');
    _s.validateStringLength(
      'datasetArn',
      datasetArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetArn',
      datasetArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DeleteDataset'
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
    @_s.required String datasetGroupArn,
  }) async {
    ArgumentError.checkNotNull(datasetGroupArn, 'datasetGroupArn');
    _s.validateStringLength(
      'datasetGroupArn',
      datasetGroupArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetGroupArn',
      datasetGroupArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DeleteDatasetGroup'
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
    @_s.required String eventTrackerArn,
  }) async {
    ArgumentError.checkNotNull(eventTrackerArn, 'eventTrackerArn');
    _s.validateStringLength(
      'eventTrackerArn',
      eventTrackerArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'eventTrackerArn',
      eventTrackerArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DeleteEventTracker'
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
    @_s.required String filterArn,
  }) async {
    ArgumentError.checkNotNull(filterArn, 'filterArn');
    _s.validateStringLength(
      'filterArn',
      filterArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'filterArn',
      filterArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DeleteFilter'
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
    @_s.required String schemaArn,
  }) async {
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    _s.validateStringLength(
      'schemaArn',
      schemaArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'schemaArn',
      schemaArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DeleteSchema'
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
    @_s.required String solutionArn,
  }) async {
    ArgumentError.checkNotNull(solutionArn, 'solutionArn');
    _s.validateStringLength(
      'solutionArn',
      solutionArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'solutionArn',
      solutionArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DeleteSolution'
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
  }

  /// Describes the given algorithm.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [algorithmArn] :
  /// The Amazon Resource Name (ARN) of the algorithm to describe.
  Future<DescribeAlgorithmResponse> describeAlgorithm({
    @_s.required String algorithmArn,
  }) async {
    ArgumentError.checkNotNull(algorithmArn, 'algorithmArn');
    _s.validateStringLength(
      'algorithmArn',
      algorithmArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'algorithmArn',
      algorithmArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    @_s.required String batchInferenceJobArn,
  }) async {
    ArgumentError.checkNotNull(batchInferenceJobArn, 'batchInferenceJobArn');
    _s.validateStringLength(
      'batchInferenceJobArn',
      batchInferenceJobArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'batchInferenceJobArn',
      batchInferenceJobArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    @_s.required String campaignArn,
  }) async {
    ArgumentError.checkNotNull(campaignArn, 'campaignArn');
    _s.validateStringLength(
      'campaignArn',
      campaignArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'campaignArn',
      campaignArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    @_s.required String datasetArn,
  }) async {
    ArgumentError.checkNotNull(datasetArn, 'datasetArn');
    _s.validateStringLength(
      'datasetArn',
      datasetArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetArn',
      datasetArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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

  /// Describes the given dataset group. For more information on dataset groups,
  /// see <a>CreateDatasetGroup</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The Amazon Resource Name (ARN) of the dataset group to describe.
  Future<DescribeDatasetGroupResponse> describeDatasetGroup({
    @_s.required String datasetGroupArn,
  }) async {
    ArgumentError.checkNotNull(datasetGroupArn, 'datasetGroupArn');
    _s.validateStringLength(
      'datasetGroupArn',
      datasetGroupArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetGroupArn',
      datasetGroupArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    @_s.required String datasetImportJobArn,
  }) async {
    ArgumentError.checkNotNull(datasetImportJobArn, 'datasetImportJobArn');
    _s.validateStringLength(
      'datasetImportJobArn',
      datasetImportJobArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetImportJobArn',
      datasetImportJobArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    @_s.required String eventTrackerArn,
  }) async {
    ArgumentError.checkNotNull(eventTrackerArn, 'eventTrackerArn');
    _s.validateStringLength(
      'eventTrackerArn',
      eventTrackerArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'eventTrackerArn',
      eventTrackerArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    @_s.required String featureTransformationArn,
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
    _s.validateStringPattern(
      'featureTransformationArn',
      featureTransformationArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    @_s.required String filterArn,
  }) async {
    ArgumentError.checkNotNull(filterArn, 'filterArn');
    _s.validateStringLength(
      'filterArn',
      filterArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'filterArn',
      filterArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    @_s.required String recipeArn,
  }) async {
    ArgumentError.checkNotNull(recipeArn, 'recipeArn');
    _s.validateStringLength(
      'recipeArn',
      recipeArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'recipeArn',
      recipeArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    @_s.required String schemaArn,
  }) async {
    ArgumentError.checkNotNull(schemaArn, 'schemaArn');
    _s.validateStringLength(
      'schemaArn',
      schemaArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'schemaArn',
      schemaArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    @_s.required String solutionArn,
  }) async {
    ArgumentError.checkNotNull(solutionArn, 'solutionArn');
    _s.validateStringLength(
      'solutionArn',
      solutionArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'solutionArn',
      solutionArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    @_s.required String solutionVersionArn,
  }) async {
    ArgumentError.checkNotNull(solutionVersionArn, 'solutionVersionArn');
    _s.validateStringLength(
      'solutionVersionArn',
      solutionVersionArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'solutionVersionArn',
      solutionVersionArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    @_s.required String solutionVersionArn,
  }) async {
    ArgumentError.checkNotNull(solutionVersionArn, 'solutionVersionArn');
    _s.validateStringLength(
      'solutionVersionArn',
      solutionVersionArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'solutionVersionArn',
      solutionVersionArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    int maxResults,
    String nextToken,
    String solutionVersionArn,
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
    _s.validateStringPattern(
      'solutionVersionArn',
      solutionVersionArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    int maxResults,
    String nextToken,
    String solutionArn,
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
    _s.validateStringPattern(
      'solutionArn',
      solutionArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    int maxResults,
    String nextToken,
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
    String datasetArn,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'datasetArn',
      datasetArn,
      0,
      256,
    );
    _s.validateStringPattern(
      'datasetArn',
      datasetArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    String datasetGroupArn,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'datasetGroupArn',
      datasetGroupArn,
      0,
      256,
    );
    _s.validateStringPattern(
      'datasetGroupArn',
      datasetGroupArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    String datasetGroupArn,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'datasetGroupArn',
      datasetGroupArn,
      0,
      256,
    );
    _s.validateStringPattern(
      'datasetGroupArn',
      datasetGroupArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    String datasetGroupArn,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'datasetGroupArn',
      datasetGroupArn,
      0,
      256,
    );
    _s.validateStringPattern(
      'datasetGroupArn',
      datasetGroupArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    int maxResults,
    String nextToken,
    RecipeProvider recipeProvider,
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
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
    String solutionArn,
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
    _s.validateStringPattern(
      'solutionArn',
      solutionArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    String datasetGroupArn,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'datasetGroupArn',
      datasetGroupArn,
      0,
      256,
    );
    _s.validateStringPattern(
      'datasetGroupArn',
      datasetGroupArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    @_s.required String campaignArn,
    CampaignConfig campaignConfig,
    int minProvisionedTPS,
    String solutionVersionArn,
  }) async {
    ArgumentError.checkNotNull(campaignArn, 'campaignArn');
    _s.validateStringLength(
      'campaignArn',
      campaignArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'campaignArn',
      campaignArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
    _s.validateStringPattern(
      'solutionVersionArn',
      solutionVersionArn,
      r'''arn:([a-z\d-]+):personalize:.*:.*:.+''',
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Algorithm {
  /// The Amazon Resource Name (ARN) of the algorithm.
  @_s.JsonKey(name: 'algorithmArn')
  final String algorithmArn;

  /// The URI of the Docker container for the algorithm image.
  @_s.JsonKey(name: 'algorithmImage')
  final AlgorithmImage algorithmImage;

  /// The date and time (in Unix time) that the algorithm was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// Specifies the default hyperparameters, their ranges, and whether they are
  /// tunable. A tunable hyperparameter can have its value determined during
  /// hyperparameter optimization (HPO).
  @_s.JsonKey(name: 'defaultHyperParameterRanges')
  final DefaultHyperParameterRanges defaultHyperParameterRanges;

  /// Specifies the default hyperparameters.
  @_s.JsonKey(name: 'defaultHyperParameters')
  final Map<String, String> defaultHyperParameters;

  /// Specifies the default maximum number of training jobs and parallel training
  /// jobs.
  @_s.JsonKey(name: 'defaultResourceConfig')
  final Map<String, String> defaultResourceConfig;

  /// The date and time (in Unix time) that the algorithm was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The name of the algorithm.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The Amazon Resource Name (ARN) of the role.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The training input mode.
  @_s.JsonKey(name: 'trainingInputMode')
  final String trainingInputMode;

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
  factory Algorithm.fromJson(Map<String, dynamic> json) =>
      _$AlgorithmFromJson(json);
}

/// Describes an algorithm image.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AlgorithmImage {
  /// The URI of the Docker container for the algorithm image.
  @_s.JsonKey(name: 'dockerURI')
  final String dockerURI;

  /// The name of the algorithm image.
  @_s.JsonKey(name: 'name')
  final String name;

  AlgorithmImage({
    @_s.required this.dockerURI,
    this.name,
  });
  factory AlgorithmImage.fromJson(Map<String, dynamic> json) =>
      _$AlgorithmImageFromJson(json);
}

/// When the solution performs AutoML (<code>performAutoML</code> is true in
/// <a>CreateSolution</a>), Amazon Personalize determines which recipe, from the
/// specified list, optimizes the given metric. Amazon Personalize then uses
/// that recipe for the solution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AutoMLConfig {
  /// The metric to optimize.
  @_s.JsonKey(name: 'metricName')
  final String metricName;

  /// The list of candidate recipes.
  @_s.JsonKey(name: 'recipeList')
  final List<String> recipeList;

  AutoMLConfig({
    this.metricName,
    this.recipeList,
  });
  factory AutoMLConfig.fromJson(Map<String, dynamic> json) =>
      _$AutoMLConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AutoMLConfigToJson(this);
}

/// When the solution performs AutoML (<code>performAutoML</code> is true in
/// <a>CreateSolution</a>), specifies the recipe that best optimized the
/// specified metric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutoMLResult {
  /// The Amazon Resource Name (ARN) of the best recipe.
  @_s.JsonKey(name: 'bestRecipeArn')
  final String bestRecipeArn;

  AutoMLResult({
    this.bestRecipeArn,
  });
  factory AutoMLResult.fromJson(Map<String, dynamic> json) =>
      _$AutoMLResultFromJson(json);
}

/// Contains information on a batch inference job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchInferenceJob {
  /// The Amazon Resource Name (ARN) of the batch inference job.
  @_s.JsonKey(name: 'batchInferenceJobArn')
  final String batchInferenceJobArn;

  /// A string to string map of the configuration details of a batch inference
  /// job.
  @_s.JsonKey(name: 'batchInferenceJobConfig')
  final BatchInferenceJobConfig batchInferenceJobConfig;

  /// The time at which the batch inference job was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// If the batch inference job failed, the reason for the failure.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The ARN of the filter used on the batch inference job.
  @_s.JsonKey(name: 'filterArn')
  final String filterArn;

  /// The Amazon S3 path that leads to the input data used to generate the batch
  /// inference job.
  @_s.JsonKey(name: 'jobInput')
  final BatchInferenceJobInput jobInput;

  /// The name of the batch inference job.
  @_s.JsonKey(name: 'jobName')
  final String jobName;

  /// The Amazon S3 bucket that contains the output data generated by the batch
  /// inference job.
  @_s.JsonKey(name: 'jobOutput')
  final BatchInferenceJobOutput jobOutput;

  /// The time at which the batch inference job was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The number of recommendations generated by the batch inference job. This
  /// number includes the error messages generated for failed input records.
  @_s.JsonKey(name: 'numResults')
  final int numResults;

  /// The ARN of the Amazon Identity and Access Management (IAM) role that
  /// requested the batch inference job.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The Amazon Resource Name (ARN) of the solution version from which the batch
  /// inference job was created.
  @_s.JsonKey(name: 'solutionVersionArn')
  final String solutionVersionArn;

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
  @_s.JsonKey(name: 'status')
  final String status;

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
  factory BatchInferenceJob.fromJson(Map<String, dynamic> json) =>
      _$BatchInferenceJobFromJson(json);
}

/// The configuration details of a batch inference job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BatchInferenceJobConfig {
  /// A string to string map specifying the inference hyperparameters you wish to
  /// use for hyperparameter optimization. See
  /// <a>customizing-solution-config-hpo</a>.
  @_s.JsonKey(name: 'itemExplorationConfig')
  final Map<String, String> itemExplorationConfig;

  BatchInferenceJobConfig({
    this.itemExplorationConfig,
  });
  factory BatchInferenceJobConfig.fromJson(Map<String, dynamic> json) =>
      _$BatchInferenceJobConfigFromJson(json);

  Map<String, dynamic> toJson() => _$BatchInferenceJobConfigToJson(this);
}

/// The input configuration of a batch inference job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BatchInferenceJobInput {
  /// The URI of the Amazon S3 location that contains your input data. The Amazon
  /// S3 bucket must be in the same region as the API endpoint you are calling.
  @_s.JsonKey(name: 's3DataSource')
  final S3DataConfig s3DataSource;

  BatchInferenceJobInput({
    @_s.required this.s3DataSource,
  });
  factory BatchInferenceJobInput.fromJson(Map<String, dynamic> json) =>
      _$BatchInferenceJobInputFromJson(json);

  Map<String, dynamic> toJson() => _$BatchInferenceJobInputToJson(this);
}

/// The output configuration parameters of a batch inference job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BatchInferenceJobOutput {
  /// Information on the Amazon S3 bucket in which the batch inference job's
  /// output is stored.
  @_s.JsonKey(name: 's3DataDestination')
  final S3DataConfig s3DataDestination;

  BatchInferenceJobOutput({
    @_s.required this.s3DataDestination,
  });
  factory BatchInferenceJobOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchInferenceJobOutputFromJson(json);

  Map<String, dynamic> toJson() => _$BatchInferenceJobOutputToJson(this);
}

/// A truncated version of the <a>BatchInferenceJob</a> datatype. The
/// <a>ListBatchInferenceJobs</a> operation returns a list of batch inference
/// job summaries.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchInferenceJobSummary {
  /// The Amazon Resource Name (ARN) of the batch inference job.
  @_s.JsonKey(name: 'batchInferenceJobArn')
  final String batchInferenceJobArn;

  /// The time at which the batch inference job was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// If the batch inference job failed, the reason for the failure.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The name of the batch inference job.
  @_s.JsonKey(name: 'jobName')
  final String jobName;

  /// The time at which the batch inference job was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The ARN of the solution version used by the batch inference job.
  @_s.JsonKey(name: 'solutionVersionArn')
  final String solutionVersionArn;

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
  @_s.JsonKey(name: 'status')
  final String status;

  BatchInferenceJobSummary({
    this.batchInferenceJobArn,
    this.creationDateTime,
    this.failureReason,
    this.jobName,
    this.lastUpdatedDateTime,
    this.solutionVersionArn,
    this.status,
  });
  factory BatchInferenceJobSummary.fromJson(Map<String, dynamic> json) =>
      _$BatchInferenceJobSummaryFromJson(json);
}

/// Describes a deployed solution version, otherwise known as a campaign. For
/// more information on campaigns, see <a>CreateCampaign</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Campaign {
  /// The Amazon Resource Name (ARN) of the campaign.
  @_s.JsonKey(name: 'campaignArn')
  final String campaignArn;

  /// The configuration details of a campaign.
  @_s.JsonKey(name: 'campaignConfig')
  final CampaignConfig campaignConfig;

  /// The date and time (in Unix format) that the campaign was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// If a campaign fails, the reason behind the failure.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The date and time (in Unix format) that the campaign was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;
  @_s.JsonKey(name: 'latestCampaignUpdate')
  final CampaignUpdateSummary latestCampaignUpdate;

  /// Specifies the requested minimum provisioned transactions (recommendations)
  /// per second.
  @_s.JsonKey(name: 'minProvisionedTPS')
  final int minProvisionedTPS;

  /// The name of the campaign.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The Amazon Resource Name (ARN) of a specific version of the solution.
  @_s.JsonKey(name: 'solutionVersionArn')
  final String solutionVersionArn;

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
  @_s.JsonKey(name: 'status')
  final String status;

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
  factory Campaign.fromJson(Map<String, dynamic> json) =>
      _$CampaignFromJson(json);
}

/// The configuration details of a campaign.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CampaignConfig {
  /// A string to string map specifying the inference hyperparameters you wish to
  /// use for hyperparameter optimization. See
  /// <a>customizing-solution-config-hpo</a>.
  @_s.JsonKey(name: 'itemExplorationConfig')
  final Map<String, String> itemExplorationConfig;

  CampaignConfig({
    this.itemExplorationConfig,
  });
  factory CampaignConfig.fromJson(Map<String, dynamic> json) =>
      _$CampaignConfigFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignConfigToJson(this);
}

/// Provides a summary of the properties of a campaign. For a complete listing,
/// call the <a>DescribeCampaign</a> API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CampaignSummary {
  /// The Amazon Resource Name (ARN) of the campaign.
  @_s.JsonKey(name: 'campaignArn')
  final String campaignArn;

  /// The date and time (in Unix time) that the campaign was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// If a campaign fails, the reason behind the failure.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The date and time (in Unix time) that the campaign was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The name of the campaign.
  @_s.JsonKey(name: 'name')
  final String name;

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
  @_s.JsonKey(name: 'status')
  final String status;

  CampaignSummary({
    this.campaignArn,
    this.creationDateTime,
    this.failureReason,
    this.lastUpdatedDateTime,
    this.name,
    this.status,
  });
  factory CampaignSummary.fromJson(Map<String, dynamic> json) =>
      _$CampaignSummaryFromJson(json);
}

/// Provides a summary of the properties of a campaign update. For a complete
/// listing, call the <a>DescribeCampaign</a> API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CampaignUpdateSummary {
  @_s.JsonKey(name: 'campaignConfig')
  final CampaignConfig campaignConfig;

  /// The date and time (in Unix time) that the campaign update was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// If a campaign update fails, the reason behind the failure.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The date and time (in Unix time) that the campaign update was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// Specifies the requested minimum provisioned transactions (recommendations)
  /// per second that Amazon Personalize will support.
  @_s.JsonKey(name: 'minProvisionedTPS')
  final int minProvisionedTPS;

  /// The Amazon Resource Name (ARN) of the deployed solution version.
  @_s.JsonKey(name: 'solutionVersionArn')
  final String solutionVersionArn;

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
  @_s.JsonKey(name: 'status')
  final String status;

  CampaignUpdateSummary({
    this.campaignConfig,
    this.creationDateTime,
    this.failureReason,
    this.lastUpdatedDateTime,
    this.minProvisionedTPS,
    this.solutionVersionArn,
    this.status,
  });
  factory CampaignUpdateSummary.fromJson(Map<String, dynamic> json) =>
      _$CampaignUpdateSummaryFromJson(json);
}

/// Provides the name and range of a categorical hyperparameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CategoricalHyperParameterRange {
  /// The name of the hyperparameter.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A list of the categories for the hyperparameter.
  @_s.JsonKey(name: 'values')
  final List<String> values;

  CategoricalHyperParameterRange({
    this.name,
    this.values,
  });
  factory CategoricalHyperParameterRange.fromJson(Map<String, dynamic> json) =>
      _$CategoricalHyperParameterRangeFromJson(json);

  Map<String, dynamic> toJson() => _$CategoricalHyperParameterRangeToJson(this);
}

/// Provides the name and range of a continuous hyperparameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ContinuousHyperParameterRange {
  /// The maximum allowable value for the hyperparameter.
  @_s.JsonKey(name: 'maxValue')
  final double maxValue;

  /// The minimum allowable value for the hyperparameter.
  @_s.JsonKey(name: 'minValue')
  final double minValue;

  /// The name of the hyperparameter.
  @_s.JsonKey(name: 'name')
  final String name;

  ContinuousHyperParameterRange({
    this.maxValue,
    this.minValue,
    this.name,
  });
  factory ContinuousHyperParameterRange.fromJson(Map<String, dynamic> json) =>
      _$ContinuousHyperParameterRangeFromJson(json);

  Map<String, dynamic> toJson() => _$ContinuousHyperParameterRangeToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBatchInferenceJobResponse {
  /// The ARN of the batch inference job.
  @_s.JsonKey(name: 'batchInferenceJobArn')
  final String batchInferenceJobArn;

  CreateBatchInferenceJobResponse({
    this.batchInferenceJobArn,
  });
  factory CreateBatchInferenceJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateBatchInferenceJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCampaignResponse {
  /// The Amazon Resource Name (ARN) of the campaign.
  @_s.JsonKey(name: 'campaignArn')
  final String campaignArn;

  CreateCampaignResponse({
    this.campaignArn,
  });
  factory CreateCampaignResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCampaignResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDatasetGroupResponse {
  /// The Amazon Resource Name (ARN) of the new dataset group.
  @_s.JsonKey(name: 'datasetGroupArn')
  final String datasetGroupArn;

  CreateDatasetGroupResponse({
    this.datasetGroupArn,
  });
  factory CreateDatasetGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDatasetGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDatasetImportJobResponse {
  /// The ARN of the dataset import job.
  @_s.JsonKey(name: 'datasetImportJobArn')
  final String datasetImportJobArn;

  CreateDatasetImportJobResponse({
    this.datasetImportJobArn,
  });
  factory CreateDatasetImportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDatasetImportJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDatasetResponse {
  /// The ARN of the dataset.
  @_s.JsonKey(name: 'datasetArn')
  final String datasetArn;

  CreateDatasetResponse({
    this.datasetArn,
  });
  factory CreateDatasetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDatasetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateEventTrackerResponse {
  /// The ARN of the event tracker.
  @_s.JsonKey(name: 'eventTrackerArn')
  final String eventTrackerArn;

  /// The ID of the event tracker. Include this ID in requests to the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html">PutEvents</a>
  /// API.
  @_s.JsonKey(name: 'trackingId')
  final String trackingId;

  CreateEventTrackerResponse({
    this.eventTrackerArn,
    this.trackingId,
  });
  factory CreateEventTrackerResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateEventTrackerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFilterResponse {
  /// The ARN of the new filter.
  @_s.JsonKey(name: 'filterArn')
  final String filterArn;

  CreateFilterResponse({
    this.filterArn,
  });
  factory CreateFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFilterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSchemaResponse {
  /// The Amazon Resource Name (ARN) of the created schema.
  @_s.JsonKey(name: 'schemaArn')
  final String schemaArn;

  CreateSchemaResponse({
    this.schemaArn,
  });
  factory CreateSchemaResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSchemaResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSolutionResponse {
  /// The ARN of the solution.
  @_s.JsonKey(name: 'solutionArn')
  final String solutionArn;

  CreateSolutionResponse({
    this.solutionArn,
  });
  factory CreateSolutionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSolutionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSolutionVersionResponse {
  /// The ARN of the new solution version.
  @_s.JsonKey(name: 'solutionVersionArn')
  final String solutionVersionArn;

  CreateSolutionVersionResponse({
    this.solutionVersionArn,
  });
  factory CreateSolutionVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSolutionVersionResponseFromJson(json);
}

/// Describes the data source that contains the data to upload to a dataset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataSource {
  /// The path to the Amazon S3 bucket where the data that you want to upload to
  /// your dataset is stored. For example:
  ///
  /// <code>s3://bucket-name/training-data.csv</code>
  @_s.JsonKey(name: 'dataLocation')
  final String dataLocation;

  DataSource({
    this.dataLocation,
  });
  factory DataSource.fromJson(Map<String, dynamic> json) =>
      _$DataSourceFromJson(json);

  Map<String, dynamic> toJson() => _$DataSourceToJson(this);
}

/// Provides metadata for a dataset.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Dataset {
  /// The creation date and time (in Unix time) of the dataset.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset that you want metadata for.
  @_s.JsonKey(name: 'datasetArn')
  final String datasetArn;

  /// The Amazon Resource Name (ARN) of the dataset group.
  @_s.JsonKey(name: 'datasetGroupArn')
  final String datasetGroupArn;

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
  @_s.JsonKey(name: 'datasetType')
  final String datasetType;

  /// A time stamp that shows when the dataset was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The name of the dataset.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The ARN of the associated schema.
  @_s.JsonKey(name: 'schemaArn')
  final String schemaArn;

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
  @_s.JsonKey(name: 'status')
  final String status;

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
  factory Dataset.fromJson(Map<String, dynamic> json) =>
      _$DatasetFromJson(json);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatasetGroup {
  /// The creation date and time (in Unix time) of the dataset group.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset group.
  @_s.JsonKey(name: 'datasetGroupArn')
  final String datasetGroupArn;

  /// If creating a dataset group fails, provides the reason why.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The Amazon Resource Name (ARN) of the KMS key used to encrypt the datasets.
  @_s.JsonKey(name: 'kmsKeyArn')
  final String kmsKeyArn;

  /// The last update date and time (in Unix time) of the dataset group.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The name of the dataset group.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The ARN of the IAM role that has permissions to create the dataset group.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

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
  @_s.JsonKey(name: 'status')
  final String status;

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
  factory DatasetGroup.fromJson(Map<String, dynamic> json) =>
      _$DatasetGroupFromJson(json);
}

/// Provides a summary of the properties of a dataset group. For a complete
/// listing, call the <a>DescribeDatasetGroup</a> API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatasetGroupSummary {
  /// The date and time (in Unix time) that the dataset group was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset group.
  @_s.JsonKey(name: 'datasetGroupArn')
  final String datasetGroupArn;

  /// If creating a dataset group fails, the reason behind the failure.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The date and time (in Unix time) that the dataset group was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The name of the dataset group.
  @_s.JsonKey(name: 'name')
  final String name;

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
  @_s.JsonKey(name: 'status')
  final String status;

  DatasetGroupSummary({
    this.creationDateTime,
    this.datasetGroupArn,
    this.failureReason,
    this.lastUpdatedDateTime,
    this.name,
    this.status,
  });
  factory DatasetGroupSummary.fromJson(Map<String, dynamic> json) =>
      _$DatasetGroupSummaryFromJson(json);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatasetImportJob {
  /// The creation date and time (in Unix time) of the dataset import job.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// The Amazon S3 bucket that contains the training data to import.
  @_s.JsonKey(name: 'dataSource')
  final DataSource dataSource;

  /// The Amazon Resource Name (ARN) of the dataset that receives the imported
  /// data.
  @_s.JsonKey(name: 'datasetArn')
  final String datasetArn;

  /// The ARN of the dataset import job.
  @_s.JsonKey(name: 'datasetImportJobArn')
  final String datasetImportJobArn;

  /// If a dataset import job fails, provides the reason why.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The name of the import job.
  @_s.JsonKey(name: 'jobName')
  final String jobName;

  /// The date and time (in Unix time) the dataset was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The ARN of the AWS Identity and Access Management (IAM) role that has
  /// permissions to read from the Amazon S3 data source.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The status of the dataset import job.
  ///
  /// A dataset import job can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'status')
  final String status;

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
  factory DatasetImportJob.fromJson(Map<String, dynamic> json) =>
      _$DatasetImportJobFromJson(json);
}

/// Provides a summary of the properties of a dataset import job. For a complete
/// listing, call the <a>DescribeDatasetImportJob</a> API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatasetImportJobSummary {
  /// The date and time (in Unix time) that the dataset import job was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset import job.
  @_s.JsonKey(name: 'datasetImportJobArn')
  final String datasetImportJobArn;

  /// If a dataset import job fails, the reason behind the failure.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The name of the dataset import job.
  @_s.JsonKey(name: 'jobName')
  final String jobName;

  /// The date and time (in Unix time) that the dataset was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The status of the dataset import job.
  ///
  /// A dataset import job can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'status')
  final String status;

  DatasetImportJobSummary({
    this.creationDateTime,
    this.datasetImportJobArn,
    this.failureReason,
    this.jobName,
    this.lastUpdatedDateTime,
    this.status,
  });
  factory DatasetImportJobSummary.fromJson(Map<String, dynamic> json) =>
      _$DatasetImportJobSummaryFromJson(json);
}

/// Describes the schema for a dataset. For more information on schemas, see
/// <a>CreateSchema</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatasetSchema {
  /// The date and time (in Unix time) that the schema was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// The date and time (in Unix time) that the schema was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The name of the schema.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The schema.
  @_s.JsonKey(name: 'schema')
  final String schema;

  /// The Amazon Resource Name (ARN) of the schema.
  @_s.JsonKey(name: 'schemaArn')
  final String schemaArn;

  DatasetSchema({
    this.creationDateTime,
    this.lastUpdatedDateTime,
    this.name,
    this.schema,
    this.schemaArn,
  });
  factory DatasetSchema.fromJson(Map<String, dynamic> json) =>
      _$DatasetSchemaFromJson(json);
}

/// Provides a summary of the properties of a dataset schema. For a complete
/// listing, call the <a>DescribeSchema</a> API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatasetSchemaSummary {
  /// The date and time (in Unix time) that the schema was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// The date and time (in Unix time) that the schema was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The name of the schema.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The Amazon Resource Name (ARN) of the schema.
  @_s.JsonKey(name: 'schemaArn')
  final String schemaArn;

  DatasetSchemaSummary({
    this.creationDateTime,
    this.lastUpdatedDateTime,
    this.name,
    this.schemaArn,
  });
  factory DatasetSchemaSummary.fromJson(Map<String, dynamic> json) =>
      _$DatasetSchemaSummaryFromJson(json);
}

/// Provides a summary of the properties of a dataset. For a complete listing,
/// call the <a>DescribeDataset</a> API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatasetSummary {
  /// The date and time (in Unix time) that the dataset was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset.
  @_s.JsonKey(name: 'datasetArn')
  final String datasetArn;

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
  @_s.JsonKey(name: 'datasetType')
  final String datasetType;

  /// The date and time (in Unix time) that the dataset was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The name of the dataset.
  @_s.JsonKey(name: 'name')
  final String name;

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
  @_s.JsonKey(name: 'status')
  final String status;

  DatasetSummary({
    this.creationDateTime,
    this.datasetArn,
    this.datasetType,
    this.lastUpdatedDateTime,
    this.name,
    this.status,
  });
  factory DatasetSummary.fromJson(Map<String, dynamic> json) =>
      _$DatasetSummaryFromJson(json);
}

/// Provides the name and default range of a categorical hyperparameter and
/// whether the hyperparameter is tunable. A tunable hyperparameter can have its
/// value determined during hyperparameter optimization (HPO).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DefaultCategoricalHyperParameterRange {
  /// Whether the hyperparameter is tunable.
  @_s.JsonKey(name: 'isTunable')
  final bool isTunable;

  /// The name of the hyperparameter.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A list of the categories for the hyperparameter.
  @_s.JsonKey(name: 'values')
  final List<String> values;

  DefaultCategoricalHyperParameterRange({
    this.isTunable,
    this.name,
    this.values,
  });
  factory DefaultCategoricalHyperParameterRange.fromJson(
          Map<String, dynamic> json) =>
      _$DefaultCategoricalHyperParameterRangeFromJson(json);
}

/// Provides the name and default range of a continuous hyperparameter and
/// whether the hyperparameter is tunable. A tunable hyperparameter can have its
/// value determined during hyperparameter optimization (HPO).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DefaultContinuousHyperParameterRange {
  /// Whether the hyperparameter is tunable.
  @_s.JsonKey(name: 'isTunable')
  final bool isTunable;

  /// The maximum allowable value for the hyperparameter.
  @_s.JsonKey(name: 'maxValue')
  final double maxValue;

  /// The minimum allowable value for the hyperparameter.
  @_s.JsonKey(name: 'minValue')
  final double minValue;

  /// The name of the hyperparameter.
  @_s.JsonKey(name: 'name')
  final String name;

  DefaultContinuousHyperParameterRange({
    this.isTunable,
    this.maxValue,
    this.minValue,
    this.name,
  });
  factory DefaultContinuousHyperParameterRange.fromJson(
          Map<String, dynamic> json) =>
      _$DefaultContinuousHyperParameterRangeFromJson(json);
}

/// Specifies the hyperparameters and their default ranges. Hyperparameters can
/// be categorical, continuous, or integer-valued.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DefaultHyperParameterRanges {
  /// The categorical hyperparameters and their default ranges.
  @_s.JsonKey(name: 'categoricalHyperParameterRanges')
  final List<DefaultCategoricalHyperParameterRange>
      categoricalHyperParameterRanges;

  /// The continuous hyperparameters and their default ranges.
  @_s.JsonKey(name: 'continuousHyperParameterRanges')
  final List<DefaultContinuousHyperParameterRange>
      continuousHyperParameterRanges;

  /// The integer-valued hyperparameters and their default ranges.
  @_s.JsonKey(name: 'integerHyperParameterRanges')
  final List<DefaultIntegerHyperParameterRange> integerHyperParameterRanges;

  DefaultHyperParameterRanges({
    this.categoricalHyperParameterRanges,
    this.continuousHyperParameterRanges,
    this.integerHyperParameterRanges,
  });
  factory DefaultHyperParameterRanges.fromJson(Map<String, dynamic> json) =>
      _$DefaultHyperParameterRangesFromJson(json);
}

/// Provides the name and default range of a integer-valued hyperparameter and
/// whether the hyperparameter is tunable. A tunable hyperparameter can have its
/// value determined during hyperparameter optimization (HPO).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DefaultIntegerHyperParameterRange {
  /// Indicates whether the hyperparameter is tunable.
  @_s.JsonKey(name: 'isTunable')
  final bool isTunable;

  /// The maximum allowable value for the hyperparameter.
  @_s.JsonKey(name: 'maxValue')
  final int maxValue;

  /// The minimum allowable value for the hyperparameter.
  @_s.JsonKey(name: 'minValue')
  final int minValue;

  /// The name of the hyperparameter.
  @_s.JsonKey(name: 'name')
  final String name;

  DefaultIntegerHyperParameterRange({
    this.isTunable,
    this.maxValue,
    this.minValue,
    this.name,
  });
  factory DefaultIntegerHyperParameterRange.fromJson(
          Map<String, dynamic> json) =>
      _$DefaultIntegerHyperParameterRangeFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAlgorithmResponse {
  /// A listing of the properties of the algorithm.
  @_s.JsonKey(name: 'algorithm')
  final Algorithm algorithm;

  DescribeAlgorithmResponse({
    this.algorithm,
  });
  factory DescribeAlgorithmResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAlgorithmResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBatchInferenceJobResponse {
  /// Information on the specified batch inference job.
  @_s.JsonKey(name: 'batchInferenceJob')
  final BatchInferenceJob batchInferenceJob;

  DescribeBatchInferenceJobResponse({
    this.batchInferenceJob,
  });
  factory DescribeBatchInferenceJobResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeBatchInferenceJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCampaignResponse {
  /// The properties of the campaign.
  @_s.JsonKey(name: 'campaign')
  final Campaign campaign;

  DescribeCampaignResponse({
    this.campaign,
  });
  factory DescribeCampaignResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeCampaignResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDatasetGroupResponse {
  /// A listing of the dataset group's properties.
  @_s.JsonKey(name: 'datasetGroup')
  final DatasetGroup datasetGroup;

  DescribeDatasetGroupResponse({
    this.datasetGroup,
  });
  factory DescribeDatasetGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDatasetGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'datasetImportJob')
  final DatasetImportJob datasetImportJob;

  DescribeDatasetImportJobResponse({
    this.datasetImportJob,
  });
  factory DescribeDatasetImportJobResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeDatasetImportJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDatasetResponse {
  /// A listing of the dataset's properties.
  @_s.JsonKey(name: 'dataset')
  final Dataset dataset;

  DescribeDatasetResponse({
    this.dataset,
  });
  factory DescribeDatasetResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDatasetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEventTrackerResponse {
  /// An object that describes the event tracker.
  @_s.JsonKey(name: 'eventTracker')
  final EventTracker eventTracker;

  DescribeEventTrackerResponse({
    this.eventTracker,
  });
  factory DescribeEventTrackerResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEventTrackerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFeatureTransformationResponse {
  /// A listing of the FeatureTransformation properties.
  @_s.JsonKey(name: 'featureTransformation')
  final FeatureTransformation featureTransformation;

  DescribeFeatureTransformationResponse({
    this.featureTransformation,
  });
  factory DescribeFeatureTransformationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeFeatureTransformationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFilterResponse {
  /// The filter's details.
  @_s.JsonKey(name: 'filter')
  final Filter filter;

  DescribeFilterResponse({
    this.filter,
  });
  factory DescribeFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeFilterResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRecipeResponse {
  /// An object that describes the recipe.
  @_s.JsonKey(name: 'recipe')
  final Recipe recipe;

  DescribeRecipeResponse({
    this.recipe,
  });
  factory DescribeRecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeRecipeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSchemaResponse {
  /// The requested schema.
  @_s.JsonKey(name: 'schema')
  final DatasetSchema schema;

  DescribeSchemaResponse({
    this.schema,
  });
  factory DescribeSchemaResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeSchemaResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSolutionResponse {
  /// An object that describes the solution.
  @_s.JsonKey(name: 'solution')
  final Solution solution;

  DescribeSolutionResponse({
    this.solution,
  });
  factory DescribeSolutionResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeSolutionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSolutionVersionResponse {
  /// The solution version.
  @_s.JsonKey(name: 'solutionVersion')
  final SolutionVersion solutionVersion;

  DescribeSolutionVersionResponse({
    this.solutionVersion,
  });
  factory DescribeSolutionVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeSolutionVersionResponseFromJson(json);
}

/// Provides information about an event tracker.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventTracker {
  /// The Amazon AWS account that owns the event tracker.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The date and time (in Unix format) that the event tracker was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset group that receives the event
  /// data.
  @_s.JsonKey(name: 'datasetGroupArn')
  final String datasetGroupArn;

  /// The ARN of the event tracker.
  @_s.JsonKey(name: 'eventTrackerArn')
  final String eventTrackerArn;

  /// The date and time (in Unix time) that the event tracker was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The name of the event tracker.
  @_s.JsonKey(name: 'name')
  final String name;

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
  @_s.JsonKey(name: 'status')
  final String status;

  /// The ID of the event tracker. Include this ID in requests to the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html">PutEvents</a>
  /// API.
  @_s.JsonKey(name: 'trackingId')
  final String trackingId;

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
  factory EventTracker.fromJson(Map<String, dynamic> json) =>
      _$EventTrackerFromJson(json);
}

/// Provides a summary of the properties of an event tracker. For a complete
/// listing, call the <a>DescribeEventTracker</a> API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventTrackerSummary {
  /// The date and time (in Unix time) that the event tracker was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// The Amazon Resource Name (ARN) of the event tracker.
  @_s.JsonKey(name: 'eventTrackerArn')
  final String eventTrackerArn;

  /// The date and time (in Unix time) that the event tracker was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The name of the event tracker.
  @_s.JsonKey(name: 'name')
  final String name;

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
  @_s.JsonKey(name: 'status')
  final String status;

  EventTrackerSummary({
    this.creationDateTime,
    this.eventTrackerArn,
    this.lastUpdatedDateTime,
    this.name,
    this.status,
  });
  factory EventTrackerSummary.fromJson(Map<String, dynamic> json) =>
      _$EventTrackerSummaryFromJson(json);
}

/// Provides feature transformation information. Feature transformation is the
/// process of modifying raw input data into a form more suitable for model
/// training.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FeatureTransformation {
  /// The creation date and time (in Unix time) of the feature transformation.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// Provides the default parameters for feature transformation.
  @_s.JsonKey(name: 'defaultParameters')
  final Map<String, String> defaultParameters;

  /// The Amazon Resource Name (ARN) of the FeatureTransformation object.
  @_s.JsonKey(name: 'featureTransformationArn')
  final String featureTransformationArn;

  /// The last update date and time (in Unix time) of the feature transformation.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The name of the feature transformation.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The status of the feature transformation.
  ///
  /// A feature transformation can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'status')
  final String status;

  FeatureTransformation({
    this.creationDateTime,
    this.defaultParameters,
    this.featureTransformationArn,
    this.lastUpdatedDateTime,
    this.name,
    this.status,
  });
  factory FeatureTransformation.fromJson(Map<String, dynamic> json) =>
      _$FeatureTransformationFromJson(json);
}

/// Contains information on a recommendation filter, including its ARN, status,
/// and filter expression.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Filter {
  /// The time at which the filter was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// The ARN of the dataset group to which the filter belongs.
  @_s.JsonKey(name: 'datasetGroupArn')
  final String datasetGroupArn;

  /// If the filter failed, the reason for its failure.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The ARN of the filter.
  @_s.JsonKey(name: 'filterArn')
  final String filterArn;

  /// Specifies the type of item interactions to filter out of recommendation
  /// results. The filter expression must follow the following format:
  ///
  /// <code>EXCLUDE itemId WHERE INTERACTIONS.event_type in ("EVENT_TYPE")</code>
  ///
  /// Where "EVENT_TYPE" is the type of event to filter out. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/filters.html">Using
  /// Filters with Amazon Personalize</a>.
  @_s.JsonKey(name: 'filterExpression')
  final String filterExpression;

  /// The time at which the filter was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The name of the filter.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The status of the filter.
  @_s.JsonKey(name: 'status')
  final String status;

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
  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
}

/// A short summary of a filter's attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FilterSummary {
  /// The time at which the filter was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// The ARN of the dataset group to which the filter belongs.
  @_s.JsonKey(name: 'datasetGroupArn')
  final String datasetGroupArn;

  /// If the filter failed, the reason for the failure.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The ARN of the filter.
  @_s.JsonKey(name: 'filterArn')
  final String filterArn;

  /// The time at which the filter was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The name of the filter.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The status of the filter.
  @_s.JsonKey(name: 'status')
  final String status;

  FilterSummary({
    this.creationDateTime,
    this.datasetGroupArn,
    this.failureReason,
    this.filterArn,
    this.lastUpdatedDateTime,
    this.name,
    this.status,
  });
  factory FilterSummary.fromJson(Map<String, dynamic> json) =>
      _$FilterSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSolutionMetricsResponse {
  /// The metrics for the solution version.
  @_s.JsonKey(name: 'metrics')
  final Map<String, double> metrics;

  /// The same solution version ARN as specified in the request.
  @_s.JsonKey(name: 'solutionVersionArn')
  final String solutionVersionArn;

  GetSolutionMetricsResponse({
    this.metrics,
    this.solutionVersionArn,
  });
  factory GetSolutionMetricsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSolutionMetricsResponseFromJson(json);
}

/// Describes the properties for hyperparameter optimization (HPO). For use with
/// the bring-your-own-recipe feature. Do not use for Amazon Personalize native
/// recipes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HPOConfig {
  /// The hyperparameters and their allowable ranges.
  @_s.JsonKey(name: 'algorithmHyperParameterRanges')
  final HyperParameterRanges algorithmHyperParameterRanges;

  /// The metric to optimize during HPO.
  @_s.JsonKey(name: 'hpoObjective')
  final HPOObjective hpoObjective;

  /// Describes the resource configuration for HPO.
  @_s.JsonKey(name: 'hpoResourceConfig')
  final HPOResourceConfig hpoResourceConfig;

  HPOConfig({
    this.algorithmHyperParameterRanges,
    this.hpoObjective,
    this.hpoResourceConfig,
  });
  factory HPOConfig.fromJson(Map<String, dynamic> json) =>
      _$HPOConfigFromJson(json);

  Map<String, dynamic> toJson() => _$HPOConfigToJson(this);
}

/// The metric to optimize during hyperparameter optimization (HPO).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HPOObjective {
  /// The name of the metric.
  @_s.JsonKey(name: 'metricName')
  final String metricName;

  /// A regular expression for finding the metric in the training job logs.
  @_s.JsonKey(name: 'metricRegex')
  final String metricRegex;

  /// The type of the metric. Valid values are <code>Maximize</code> and
  /// <code>Minimize</code>.
  @_s.JsonKey(name: 'type')
  final String type;

  HPOObjective({
    this.metricName,
    this.metricRegex,
    this.type,
  });
  factory HPOObjective.fromJson(Map<String, dynamic> json) =>
      _$HPOObjectiveFromJson(json);

  Map<String, dynamic> toJson() => _$HPOObjectiveToJson(this);
}

/// Describes the resource configuration for hyperparameter optimization (HPO).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HPOResourceConfig {
  /// The maximum number of training jobs when you create a solution version. The
  /// maximum value for <code>maxNumberOfTrainingJobs</code> is <code>40</code>.
  @_s.JsonKey(name: 'maxNumberOfTrainingJobs')
  final String maxNumberOfTrainingJobs;

  /// The maximum number of parallel training jobs when you create a solution
  /// version. The maximum value for <code>maxParallelTrainingJobs</code> is
  /// <code>10</code>.
  @_s.JsonKey(name: 'maxParallelTrainingJobs')
  final String maxParallelTrainingJobs;

  HPOResourceConfig({
    this.maxNumberOfTrainingJobs,
    this.maxParallelTrainingJobs,
  });
  factory HPOResourceConfig.fromJson(Map<String, dynamic> json) =>
      _$HPOResourceConfigFromJson(json);

  Map<String, dynamic> toJson() => _$HPOResourceConfigToJson(this);
}

/// Specifies the hyperparameters and their ranges. Hyperparameters can be
/// categorical, continuous, or integer-valued.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HyperParameterRanges {
  /// The categorical hyperparameters and their ranges.
  @_s.JsonKey(name: 'categoricalHyperParameterRanges')
  final List<CategoricalHyperParameterRange> categoricalHyperParameterRanges;

  /// The continuous hyperparameters and their ranges.
  @_s.JsonKey(name: 'continuousHyperParameterRanges')
  final List<ContinuousHyperParameterRange> continuousHyperParameterRanges;

  /// The integer-valued hyperparameters and their ranges.
  @_s.JsonKey(name: 'integerHyperParameterRanges')
  final List<IntegerHyperParameterRange> integerHyperParameterRanges;

  HyperParameterRanges({
    this.categoricalHyperParameterRanges,
    this.continuousHyperParameterRanges,
    this.integerHyperParameterRanges,
  });
  factory HyperParameterRanges.fromJson(Map<String, dynamic> json) =>
      _$HyperParameterRangesFromJson(json);

  Map<String, dynamic> toJson() => _$HyperParameterRangesToJson(this);
}

/// Provides the name and range of an integer-valued hyperparameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IntegerHyperParameterRange {
  /// The maximum allowable value for the hyperparameter.
  @_s.JsonKey(name: 'maxValue')
  final int maxValue;

  /// The minimum allowable value for the hyperparameter.
  @_s.JsonKey(name: 'minValue')
  final int minValue;

  /// The name of the hyperparameter.
  @_s.JsonKey(name: 'name')
  final String name;

  IntegerHyperParameterRange({
    this.maxValue,
    this.minValue,
    this.name,
  });
  factory IntegerHyperParameterRange.fromJson(Map<String, dynamic> json) =>
      _$IntegerHyperParameterRangeFromJson(json);

  Map<String, dynamic> toJson() => _$IntegerHyperParameterRangeToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBatchInferenceJobsResponse {
  /// A list containing information on each job that is returned.
  @_s.JsonKey(name: 'batchInferenceJobs')
  final List<BatchInferenceJobSummary> batchInferenceJobs;

  /// The token to use to retreive the next page of results. The value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListBatchInferenceJobsResponse({
    this.batchInferenceJobs,
    this.nextToken,
  });
  factory ListBatchInferenceJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListBatchInferenceJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCampaignsResponse {
  /// A list of the campaigns.
  @_s.JsonKey(name: 'campaigns')
  final List<CampaignSummary> campaigns;

  /// A token for getting the next set of campaigns (if they exist).
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListCampaignsResponse({
    this.campaigns,
    this.nextToken,
  });
  factory ListCampaignsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCampaignsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDatasetGroupsResponse {
  /// The list of your dataset groups.
  @_s.JsonKey(name: 'datasetGroups')
  final List<DatasetGroupSummary> datasetGroups;

  /// A token for getting the next set of dataset groups (if they exist).
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDatasetGroupsResponse({
    this.datasetGroups,
    this.nextToken,
  });
  factory ListDatasetGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDatasetGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDatasetImportJobsResponse {
  /// The list of dataset import jobs.
  @_s.JsonKey(name: 'datasetImportJobs')
  final List<DatasetImportJobSummary> datasetImportJobs;

  /// A token for getting the next set of dataset import jobs (if they exist).
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDatasetImportJobsResponse({
    this.datasetImportJobs,
    this.nextToken,
  });
  factory ListDatasetImportJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDatasetImportJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDatasetsResponse {
  /// An array of <code>Dataset</code> objects. Each object provides metadata
  /// information.
  @_s.JsonKey(name: 'datasets')
  final List<DatasetSummary> datasets;

  /// A token for getting the next set of datasets (if they exist).
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDatasetsResponse({
    this.datasets,
    this.nextToken,
  });
  factory ListDatasetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDatasetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListEventTrackersResponse {
  /// A list of event trackers.
  @_s.JsonKey(name: 'eventTrackers')
  final List<EventTrackerSummary> eventTrackers;

  /// A token for getting the next set of event trackers (if they exist).
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListEventTrackersResponse({
    this.eventTrackers,
    this.nextToken,
  });
  factory ListEventTrackersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListEventTrackersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFiltersResponse {
  /// A list of returned filters.
  @_s.JsonKey(name: 'Filters')
  final List<FilterSummary> filters;

  /// A token for getting the next set of filters (if they exist).
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListFiltersResponse({
    this.filters,
    this.nextToken,
  });
  factory ListFiltersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFiltersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRecipesResponse {
  /// A token for getting the next set of recipes.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The list of available recipes.
  @_s.JsonKey(name: 'recipes')
  final List<RecipeSummary> recipes;

  ListRecipesResponse({
    this.nextToken,
    this.recipes,
  });
  factory ListRecipesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRecipesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSchemasResponse {
  /// A token used to get the next set of schemas (if they exist).
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of schemas.
  @_s.JsonKey(name: 'schemas')
  final List<DatasetSchemaSummary> schemas;

  ListSchemasResponse({
    this.nextToken,
    this.schemas,
  });
  factory ListSchemasResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSchemasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSolutionVersionsResponse {
  /// A token for getting the next set of solution versions (if they exist).
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of solution versions describing the version properties.
  @_s.JsonKey(name: 'solutionVersions')
  final List<SolutionVersionSummary> solutionVersions;

  ListSolutionVersionsResponse({
    this.nextToken,
    this.solutionVersions,
  });
  factory ListSolutionVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSolutionVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSolutionsResponse {
  /// A token for getting the next set of solutions (if they exist).
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of the current solutions.
  @_s.JsonKey(name: 'solutions')
  final List<SolutionSummary> solutions;

  ListSolutionsResponse({
    this.nextToken,
    this.solutions,
  });
  factory ListSolutionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSolutionsResponseFromJson(json);
}

/// Provides information about a recipe. Each recipe provides an algorithm that
/// Amazon Personalize uses in model training when you use the
/// <a>CreateSolution</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Recipe {
  /// The Amazon Resource Name (ARN) of the algorithm that Amazon Personalize uses
  /// to train the model.
  @_s.JsonKey(name: 'algorithmArn')
  final String algorithmArn;

  /// The date and time (in Unix format) that the recipe was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// The description of the recipe.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The ARN of the FeatureTransformation object.
  @_s.JsonKey(name: 'featureTransformationArn')
  final String featureTransformationArn;

  /// The date and time (in Unix format) that the recipe was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The name of the recipe.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The Amazon Resource Name (ARN) of the recipe.
  @_s.JsonKey(name: 'recipeArn')
  final String recipeArn;

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
  @_s.JsonKey(name: 'recipeType')
  final String recipeType;

  /// The status of the recipe.
  @_s.JsonKey(name: 'status')
  final String status;

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
  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

enum RecipeProvider {
  @_s.JsonValue('SERVICE')
  service,
}

extension on RecipeProvider {
  String toValue() {
    switch (this) {
      case RecipeProvider.service:
        return 'SERVICE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Provides a summary of the properties of a recipe. For a complete listing,
/// call the <a>DescribeRecipe</a> API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RecipeSummary {
  /// The date and time (in Unix time) that the recipe was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// The date and time (in Unix time) that the recipe was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The name of the recipe.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The Amazon Resource Name (ARN) of the recipe.
  @_s.JsonKey(name: 'recipeArn')
  final String recipeArn;

  /// The status of the recipe.
  @_s.JsonKey(name: 'status')
  final String status;

  RecipeSummary({
    this.creationDateTime,
    this.lastUpdatedDateTime,
    this.name,
    this.recipeArn,
    this.status,
  });
  factory RecipeSummary.fromJson(Map<String, dynamic> json) =>
      _$RecipeSummaryFromJson(json);
}

/// The configuration details of an Amazon S3 input or output bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3DataConfig {
  /// The file path of the Amazon S3 bucket.
  @_s.JsonKey(name: 'path')
  final String path;

  /// The Amazon Resource Name (ARN) of the Amazon Key Management Service (KMS)
  /// key that Amazon Personalize uses to encrypt or decrypt the input and output
  /// files of a batch inference job.
  @_s.JsonKey(name: 'kmsKeyArn')
  final String kmsKeyArn;

  S3DataConfig({
    @_s.required this.path,
    this.kmsKeyArn,
  });
  factory S3DataConfig.fromJson(Map<String, dynamic> json) =>
      _$S3DataConfigFromJson(json);

  Map<String, dynamic> toJson() => _$S3DataConfigToJson(this);
}

/// An object that provides information about a solution. A solution is a
/// trained model that can be deployed as a campaign.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Solution {
  /// When <code>performAutoML</code> is true, specifies the best recipe found.
  @_s.JsonKey(name: 'autoMLResult')
  final AutoMLResult autoMLResult;

  /// The creation date and time (in Unix time) of the solution.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset group that provides the
  /// training data.
  @_s.JsonKey(name: 'datasetGroupArn')
  final String datasetGroupArn;

  /// The event type (for example, 'click' or 'like') that is used for training
  /// the model.
  @_s.JsonKey(name: 'eventType')
  final String eventType;

  /// The date and time (in Unix time) that the solution was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// Describes the latest version of the solution, including the status and the
  /// ARN.
  @_s.JsonKey(name: 'latestSolutionVersion')
  final SolutionVersionSummary latestSolutionVersion;

  /// The name of the solution.
  @_s.JsonKey(name: 'name')
  final String name;

  /// When true, Amazon Personalize performs a search for the best
  /// USER_PERSONALIZATION recipe from the list specified in the solution
  /// configuration (<code>recipeArn</code> must not be specified). When false
  /// (the default), Amazon Personalize uses <code>recipeArn</code> for training.
  @_s.JsonKey(name: 'performAutoML')
  final bool performAutoML;

  /// Whether to perform hyperparameter optimization (HPO) on the chosen recipe.
  /// The default is <code>false</code>.
  @_s.JsonKey(name: 'performHPO')
  final bool performHPO;

  /// The ARN of the recipe used to create the solution.
  @_s.JsonKey(name: 'recipeArn')
  final String recipeArn;

  /// The ARN of the solution.
  @_s.JsonKey(name: 'solutionArn')
  final String solutionArn;

  /// Describes the configuration properties for the solution.
  @_s.JsonKey(name: 'solutionConfig')
  final SolutionConfig solutionConfig;

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
  @_s.JsonKey(name: 'status')
  final String status;

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
  factory Solution.fromJson(Map<String, dynamic> json) =>
      _$SolutionFromJson(json);
}

/// Describes the configuration properties for the solution.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SolutionConfig {
  /// Lists the hyperparameter names and ranges.
  @_s.JsonKey(name: 'algorithmHyperParameters')
  final Map<String, String> algorithmHyperParameters;

  /// The <a>AutoMLConfig</a> object containing a list of recipes to search when
  /// AutoML is performed.
  @_s.JsonKey(name: 'autoMLConfig')
  final AutoMLConfig autoMLConfig;

  /// Only events with a value greater than or equal to this threshold are used
  /// for training a model.
  @_s.JsonKey(name: 'eventValueThreshold')
  final String eventValueThreshold;

  /// Lists the feature transformation parameters.
  @_s.JsonKey(name: 'featureTransformationParameters')
  final Map<String, String> featureTransformationParameters;

  /// Describes the properties for hyperparameter optimization (HPO).
  @_s.JsonKey(name: 'hpoConfig')
  final HPOConfig hpoConfig;

  SolutionConfig({
    this.algorithmHyperParameters,
    this.autoMLConfig,
    this.eventValueThreshold,
    this.featureTransformationParameters,
    this.hpoConfig,
  });
  factory SolutionConfig.fromJson(Map<String, dynamic> json) =>
      _$SolutionConfigFromJson(json);

  Map<String, dynamic> toJson() => _$SolutionConfigToJson(this);
}

/// Provides a summary of the properties of a solution. For a complete listing,
/// call the <a>DescribeSolution</a> API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SolutionSummary {
  /// The date and time (in Unix time) that the solution was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// The date and time (in Unix time) that the solution was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The name of the solution.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The Amazon Resource Name (ARN) of the solution.
  @_s.JsonKey(name: 'solutionArn')
  final String solutionArn;

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
  @_s.JsonKey(name: 'status')
  final String status;

  SolutionSummary({
    this.creationDateTime,
    this.lastUpdatedDateTime,
    this.name,
    this.solutionArn,
    this.status,
  });
  factory SolutionSummary.fromJson(Map<String, dynamic> json) =>
      _$SolutionSummaryFromJson(json);
}

/// An object that provides information about a specific version of a
/// <a>Solution</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SolutionVersion {
  /// The date and time (in Unix time) that this version of the solution was
  /// created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset group providing the training
  /// data.
  @_s.JsonKey(name: 'datasetGroupArn')
  final String datasetGroupArn;

  /// The event type (for example, 'click' or 'like') that is used for training
  /// the model.
  @_s.JsonKey(name: 'eventType')
  final String eventType;

  /// If training a solution version fails, the reason for the failure.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The date and time (in Unix time) that the solution was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// When true, Amazon Personalize searches for the most optimal recipe according
  /// to the solution configuration. When false (the default), Amazon Personalize
  /// uses <code>recipeArn</code>.
  @_s.JsonKey(name: 'performAutoML')
  final bool performAutoML;

  /// Whether to perform hyperparameter optimization (HPO) on the chosen recipe.
  /// The default is <code>false</code>.
  @_s.JsonKey(name: 'performHPO')
  final bool performHPO;

  /// The ARN of the recipe used in the solution.
  @_s.JsonKey(name: 'recipeArn')
  final String recipeArn;

  /// The ARN of the solution.
  @_s.JsonKey(name: 'solutionArn')
  final String solutionArn;

  /// Describes the configuration properties for the solution.
  @_s.JsonKey(name: 'solutionConfig')
  final SolutionConfig solutionConfig;

  /// The ARN of the solution version.
  @_s.JsonKey(name: 'solutionVersionArn')
  final String solutionVersionArn;

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
  /// </ul>
  @_s.JsonKey(name: 'status')
  final String status;

  /// The time used to train the model. You are billed for the time it takes to
  /// train a model. This field is visible only after Amazon Personalize
  /// successfully trains a model.
  @_s.JsonKey(name: 'trainingHours')
  final double trainingHours;

  /// The scope of training used to create the solution version. The
  /// <code>FULL</code> option trains the solution version based on the entirety
  /// of the input solution's training data, while the <code>UPDATE</code> option
  /// processes only the training data that has changed since the creation of the
  /// last solution version. Choose <code>UPDATE</code> when you want to start
  /// recommending items added to the dataset without retraining the model.
  /// <important>
  /// The <code>UPDATE</code> option can only be used after you've created a
  /// solution version with the <code>FULL</code> option and the training solution
  /// uses the <a>native-recipe-hrnn-coldstart</a>.
  /// </important>
  @_s.JsonKey(name: 'trainingMode')
  final TrainingMode trainingMode;

  /// If hyperparameter optimization was performed, contains the hyperparameter
  /// values of the best performing model.
  @_s.JsonKey(name: 'tunedHPOParams')
  final TunedHPOParams tunedHPOParams;

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
  factory SolutionVersion.fromJson(Map<String, dynamic> json) =>
      _$SolutionVersionFromJson(json);
}

/// Provides a summary of the properties of a solution version. For a complete
/// listing, call the <a>DescribeSolutionVersion</a> API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SolutionVersionSummary {
  /// The date and time (in Unix time) that this version of a solution was
  /// created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDateTime')
  final DateTime creationDateTime;

  /// If a solution version fails, the reason behind the failure.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The date and time (in Unix time) that the solution version was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedDateTime')
  final DateTime lastUpdatedDateTime;

  /// The Amazon Resource Name (ARN) of the solution version.
  @_s.JsonKey(name: 'solutionVersionArn')
  final String solutionVersionArn;

  /// The status of the solution version.
  ///
  /// A solution version can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'status')
  final String status;

  SolutionVersionSummary({
    this.creationDateTime,
    this.failureReason,
    this.lastUpdatedDateTime,
    this.solutionVersionArn,
    this.status,
  });
  factory SolutionVersionSummary.fromJson(Map<String, dynamic> json) =>
      _$SolutionVersionSummaryFromJson(json);
}

enum TrainingMode {
  @_s.JsonValue('FULL')
  full,
  @_s.JsonValue('UPDATE')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// If hyperparameter optimization (HPO) was performed, contains the
/// hyperparameter values of the best performing model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TunedHPOParams {
  /// A list of the hyperparameter values of the best performing model.
  @_s.JsonKey(name: 'algorithmHyperParameters')
  final Map<String, String> algorithmHyperParameters;

  TunedHPOParams({
    this.algorithmHyperParameters,
  });
  factory TunedHPOParams.fromJson(Map<String, dynamic> json) =>
      _$TunedHPOParamsFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateCampaignResponse {
  /// The same campaign ARN as given in the request.
  @_s.JsonKey(name: 'campaignArn')
  final String campaignArn;

  UpdateCampaignResponse({
    this.campaignArn,
  });
  factory UpdateCampaignResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateCampaignResponseFromJson(json);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String type, String message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
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

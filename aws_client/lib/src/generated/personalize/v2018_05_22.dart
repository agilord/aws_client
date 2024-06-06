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

/// Amazon Personalize is a machine learning service that makes it easy to add
/// individualized recommendations to customers.
class Personalize {
  final _s.JsonProtocol _protocol;
  Personalize({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
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

  /// Generates batch recommendations based on a list of items or users stored
  /// in Amazon S3 and exports the recommendations to an Amazon S3 bucket.
  ///
  /// To generate batch recommendations, specify the ARN of a solution version
  /// and an Amazon S3 URI for the input and output data. For user
  /// personalization, popular items, and personalized ranking solutions, the
  /// batch inference job generates a list of recommended items for each user ID
  /// in the input file. For related items solutions, the job generates a list
  /// of recommended items for each item ID in the input file.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/getting-batch-recommendations.html">Creating
  /// a batch inference job </a>.
  ///
  /// If you use the Similar-Items recipe, Amazon Personalize can add
  /// descriptive themes to batch recommendations. To generate themes, set the
  /// job's mode to <code>THEME_GENERATION</code> and specify the name of the
  /// field that contains item names in the input data.
  ///
  /// For more information about generating themes, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/themed-batch-recommendations.html">Batch
  /// recommendations with themes from Content Generator </a>.
  ///
  /// You can't get batch recommendations with the Trending-Now or
  /// Next-Best-Action recipes.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [TooManyTagsException].
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
  /// Parameter [batchInferenceJobMode] :
  /// The mode of the batch inference job. To generate descriptive themes for
  /// groups of similar items, set the job mode to
  /// <code>THEME_GENERATION</code>. If you don't want to generate themes, use
  /// the default <code>BATCH_INFERENCE</code>.
  ///
  /// When you get batch recommendations with themes, you will incur additional
  /// costs. For more information, see <a
  /// href="https://aws.amazon.com/personalize/pricing/">Amazon Personalize
  /// pricing</a>.
  ///
  /// Parameter [filterArn] :
  /// The ARN of the filter to apply to the batch inference job. For more
  /// information on using filters, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/filter-batch.html">Filtering
  /// batch recommendations</a>.
  ///
  /// Parameter [numResults] :
  /// The number of recommendations to retrieve.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html">tags</a>
  /// to apply to the batch inference job.
  ///
  /// Parameter [themeGenerationConfig] :
  /// For theme generation jobs, specify the name of the column in your Items
  /// dataset that contains each item's name.
  Future<CreateBatchInferenceJobResponse> createBatchInferenceJob({
    required BatchInferenceJobInput jobInput,
    required String jobName,
    required BatchInferenceJobOutput jobOutput,
    required String roleArn,
    required String solutionVersionArn,
    BatchInferenceJobConfig? batchInferenceJobConfig,
    BatchInferenceJobMode? batchInferenceJobMode,
    String? filterArn,
    int? numResults,
    List<Tag>? tags,
    ThemeGenerationConfig? themeGenerationConfig,
  }) async {
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
        if (batchInferenceJobMode != null)
          'batchInferenceJobMode': batchInferenceJobMode.toValue(),
        if (filterArn != null) 'filterArn': filterArn,
        if (numResults != null) 'numResults': numResults,
        if (tags != null) 'tags': tags,
        if (themeGenerationConfig != null)
          'themeGenerationConfig': themeGenerationConfig,
      },
    );

    return CreateBatchInferenceJobResponse.fromJson(jsonResponse.body);
  }

  /// Creates a batch segment job. The operation can handle up to 50 million
  /// records and the input file must be in JSON format. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/recommendations-batch.html">Getting
  /// batch recommendations and user segments</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [jobInput] :
  /// The Amazon S3 path for the input data used to generate the batch segment
  /// job.
  ///
  /// Parameter [jobName] :
  /// The name of the batch segment job to create.
  ///
  /// Parameter [jobOutput] :
  /// The Amazon S3 path for the bucket where the job's output will be stored.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the Amazon Identity and Access Management role that has
  /// permissions to read and write to your input and output Amazon S3 buckets
  /// respectively.
  ///
  /// Parameter [solutionVersionArn] :
  /// The Amazon Resource Name (ARN) of the solution version you want the batch
  /// segment job to use to generate batch segments.
  ///
  /// Parameter [filterArn] :
  /// The ARN of the filter to apply to the batch segment job. For more
  /// information on using filters, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/filter-batch.html">Filtering
  /// batch recommendations</a>.
  ///
  /// Parameter [numResults] :
  /// The number of predicted users generated by the batch segment job for each
  /// line of input data. The maximum number of users per segment is 5 million.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html">tags</a>
  /// to apply to the batch segment job.
  Future<CreateBatchSegmentJobResponse> createBatchSegmentJob({
    required BatchSegmentJobInput jobInput,
    required String jobName,
    required BatchSegmentJobOutput jobOutput,
    required String roleArn,
    required String solutionVersionArn,
    String? filterArn,
    int? numResults,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.CreateBatchSegmentJob'
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
        if (filterArn != null) 'filterArn': filterArn,
        if (numResults != null) 'numResults': numResults,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateBatchSegmentJobResponse.fromJson(jsonResponse.body);
  }

  /// <important>
  /// You incur campaign costs while it is active. To avoid unnecessary costs,
  /// make sure to delete the campaign when you are finished. For information
  /// about campaign costs, see <a
  /// href="https://aws.amazon.com/personalize/pricing/">Amazon Personalize
  /// pricing</a>.
  /// </important>
  /// Creates a campaign that deploys a solution version. When a client calls
  /// the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html">GetRecommendations</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetPersonalizedRanking.html">GetPersonalizedRanking</a>
  /// APIs, a campaign is specified in the request.
  ///
  /// <b>Minimum Provisioned TPS and Auto-Scaling</b>
  /// <important>
  /// A high <code>minProvisionedTPS</code> will increase your cost. We
  /// recommend starting with 1 for <code>minProvisionedTPS</code> (the
  /// default). Track your usage using Amazon CloudWatch metrics, and increase
  /// the <code>minProvisionedTPS</code> as necessary.
  /// </important>
  /// When you create an Amazon Personalize campaign, you can specify the
  /// minimum provisioned transactions per second
  /// (<code>minProvisionedTPS</code>) for the campaign. This is the baseline
  /// transaction throughput for the campaign provisioned by Amazon Personalize.
  /// It sets the minimum billing charge for the campaign while it is active. A
  /// transaction is a single <code>GetRecommendations</code> or
  /// <code>GetPersonalizedRanking</code> request. The default
  /// <code>minProvisionedTPS</code> is 1.
  ///
  /// If your TPS increases beyond the <code>minProvisionedTPS</code>, Amazon
  /// Personalize auto-scales the provisioned capacity up and down, but never
  /// below <code>minProvisionedTPS</code>. There's a short time delay while the
  /// capacity is increased that might cause loss of transactions. When your
  /// traffic reduces, capacity returns to the <code>minProvisionedTPS</code>.
  ///
  /// You are charged for the the minimum provisioned TPS or, if your requests
  /// exceed the <code>minProvisionedTPS</code>, the actual TPS. The actual TPS
  /// is the total number of recommendation requests you make. We recommend
  /// starting with a low <code>minProvisionedTPS</code>, track your usage using
  /// Amazon CloudWatch metrics, and then increase the
  /// <code>minProvisionedTPS</code> as necessary.
  ///
  /// For more information about campaign costs, see <a
  /// href="https://aws.amazon.com/personalize/pricing/">Amazon Personalize
  /// pricing</a>.
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
  /// To get the campaign status, call <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeCampaign.html">DescribeCampaign</a>.
  /// <note>
  /// Wait until the <code>status</code> of the campaign is <code>ACTIVE</code>
  /// before asking the campaign for recommendations.
  /// </note> <p class="title"> <b>Related APIs</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_ListCampaigns.html">ListCampaigns</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeCampaign.html">DescribeCampaign</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_UpdateCampaign.html">UpdateCampaign</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteCampaign.html">DeleteCampaign</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [name] :
  /// A name for the new campaign. The campaign name must be unique within your
  /// account.
  ///
  /// Parameter [solutionVersionArn] :
  /// The Amazon Resource Name (ARN) of the trained model to deploy with the
  /// campaign. To specify the latest solution version of your solution, specify
  /// the ARN of your <i>solution</i> in <code>SolutionArn/$LATEST</code>
  /// format. You must use this format if you set
  /// <code>syncWithLatestSolutionVersion</code> to <code>True</code> in the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CampaignConfig.html">CampaignConfig</a>.
  ///
  /// To deploy a model that isn't the latest solution version of your solution,
  /// specify the ARN of the solution version.
  ///
  /// For more information about automatic campaign updates, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/campaigns.html#create-campaign-automatic-latest-sv-update">Enabling
  /// automatic campaign updates</a>.
  ///
  /// Parameter [campaignConfig] :
  /// The configuration details of a campaign.
  ///
  /// Parameter [minProvisionedTPS] :
  /// Specifies the requested minimum provisioned transactions (recommendations)
  /// per second that Amazon Personalize will support. A high
  /// <code>minProvisionedTPS</code> will increase your bill. We recommend
  /// starting with 1 for <code>minProvisionedTPS</code> (the default). Track
  /// your usage using Amazon CloudWatch metrics, and increase the
  /// <code>minProvisionedTPS</code> as necessary.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html">tags</a>
  /// to apply to the campaign.
  Future<CreateCampaignResponse> createCampaign({
    required String name,
    required String solutionVersionArn,
    CampaignConfig? campaignConfig,
    int? minProvisionedTPS,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'minProvisionedTPS',
      minProvisionedTPS,
      1,
      1152921504606846976,
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
        'name': name,
        'solutionVersionArn': solutionVersionArn,
        if (campaignConfig != null) 'campaignConfig': campaignConfig,
        if (minProvisionedTPS != null) 'minProvisionedTPS': minProvisionedTPS,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateCampaignResponse.fromJson(jsonResponse.body);
  }

  /// Creates a batch job that deletes all references to specific users from an
  /// Amazon Personalize dataset group in batches. You specify the users to
  /// delete in a CSV file of userIds in an Amazon S3 bucket. After a job
  /// completes, Amazon Personalize no longer trains on the users’ data and no
  /// longer considers the users when generating user segments. For more
  /// information about creating a data deletion job, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/delete-records.html">Deleting
  /// users</a>.
  ///
  /// <ul>
  /// <li>
  /// Your input file must be a CSV file with a single USER_ID column that lists
  /// the users IDs. For more information about preparing the CSV file, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/prepare-deletion-input-file.html">Preparing
  /// your data deletion file and uploading it to Amazon S3</a>.
  /// </li>
  /// <li>
  /// To give Amazon Personalize permission to access your input CSV file of
  /// userIds, you must specify an IAM service role that has permission to read
  /// from the data source. This role needs <code>GetObject</code> and
  /// <code>ListBucket</code> permissions for the bucket and its content. These
  /// permissions are the same as importing data. For information on granting
  /// access to your Amazon S3 bucket, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/granting-personalize-s3-access.html">Giving
  /// Amazon Personalize Access to Amazon S3 Resources</a>.
  /// </li>
  /// </ul>
  /// After you create a job, it can take up to a day to delete all references
  /// to the users from datasets and models. Until the job completes, Amazon
  /// Personalize continues to use the data when training. And if you use a User
  /// Segmentation recipe, the users might appear in user segments.
  ///
  /// <b>Status</b>
  ///
  /// A data deletion job can have one of the following statuses:
  ///
  /// <ul>
  /// <li>
  /// PENDING &gt; IN_PROGRESS &gt; COMPLETED -or- FAILED
  /// </li>
  /// </ul>
  /// To get the status of the data deletion job, call <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDataDeletionJob.html">DescribeDataDeletionJob</a>
  /// API operation and specify the Amazon Resource Name (ARN) of the job. If
  /// the status is FAILED, the response includes a <code>failureReason</code>
  /// key, which describes why the job failed.
  /// <p class="title"> <b>Related APIs</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_ListDataDeletionJobs.html">ListDataDeletionJobs</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDataDeletionJob.html">DescribeDataDeletionJob</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [dataSource] :
  /// The Amazon S3 bucket that contains the list of userIds of the users to
  /// delete.
  ///
  /// Parameter [datasetGroupArn] :
  /// The Amazon Resource Name (ARN) of the dataset group that has the datasets
  /// you want to delete records from.
  ///
  /// Parameter [jobName] :
  /// The name for the data deletion job.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that has permissions to
  /// read from the Amazon S3 data source.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html">tags</a>
  /// to apply to the data deletion job.
  Future<CreateDataDeletionJobResponse> createDataDeletionJob({
    required DataSource dataSource,
    required String datasetGroupArn,
    required String jobName,
    required String roleArn,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.CreateDataDeletionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'dataSource': dataSource,
        'datasetGroupArn': datasetGroupArn,
        'jobName': jobName,
        'roleArn': roleArn,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateDataDeletionJobResponse.fromJson(jsonResponse.body);
  }

  /// Creates an empty dataset and adds it to the specified dataset group. Use
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetImportJob.html">CreateDatasetImportJob</a>
  /// to import your training data to a dataset.
  ///
  /// There are 5 types of datasets:
  ///
  /// <ul>
  /// <li>
  /// Item interactions
  /// </li>
  /// <li>
  /// Items
  /// </li>
  /// <li>
  /// Users
  /// </li>
  /// <li>
  /// Action interactions
  /// </li>
  /// <li>
  /// Actions
  /// </li>
  /// </ul>
  /// Each dataset type has an associated schema with required field types. Only
  /// the <code>Item interactions</code> dataset is required in order to train a
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
  /// To get the status of the dataset, call <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDataset.html">DescribeDataset</a>.
  /// <p class="title"> <b>Related APIs</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetGroup.html">CreateDatasetGroup</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_ListDatasets.html">ListDatasets</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDataset.html">DescribeDataset</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteDataset.html">DeleteDataset</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [TooManyTagsException].
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
  /// <li>
  /// Actions
  /// </li>
  /// <li>
  /// Action_Interactions
  /// </li>
  /// </ul>
  ///
  /// Parameter [name] :
  /// The name for the dataset.
  ///
  /// Parameter [schemaArn] :
  /// The ARN of the schema to associate with the dataset. The schema defines
  /// the dataset fields.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html">tags</a>
  /// to apply to the dataset.
  Future<CreateDatasetResponse> createDataset({
    required String datasetGroupArn,
    required String datasetType,
    required String name,
    required String schemaArn,
    List<Tag>? tags,
  }) async {
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
        if (tags != null) 'tags': tags,
      },
    );

    return CreateDatasetResponse.fromJson(jsonResponse.body);
  }

  /// Creates a job that exports data from your dataset to an Amazon S3 bucket.
  /// To allow Amazon Personalize to export the training data, you must specify
  /// an service-linked IAM role that gives Amazon Personalize
  /// <code>PutObject</code> permissions for your Amazon S3 bucket. For
  /// information, see <a
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
  /// To get the status of the export job, call <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetExportJob.html">DescribeDatasetExportJob</a>,
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
  /// May throw [TooManyTagsException].
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
  /// The Amazon Resource Name (ARN) of the IAM service role that has
  /// permissions to add data to your output Amazon S3 bucket.
  ///
  /// Parameter [ingestionMode] :
  /// The data to export, based on how you imported the data. You can choose to
  /// export only <code>BULK</code> data that you imported using a dataset
  /// import job, only <code>PUT</code> data that you imported incrementally
  /// (using the console, PutEvents, PutUsers and PutItems operations), or
  /// <code>ALL</code> for both types. The default value is <code>PUT</code>.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html">tags</a>
  /// to apply to the dataset export job.
  Future<CreateDatasetExportJobResponse> createDatasetExportJob({
    required String datasetArn,
    required String jobName,
    required DatasetExportJobOutput jobOutput,
    required String roleArn,
    IngestionMode? ingestionMode,
    List<Tag>? tags,
  }) async {
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
        if (tags != null) 'tags': tags,
      },
    );

    return CreateDatasetExportJobResponse.fromJson(jsonResponse.body);
  }

  /// Creates an empty dataset group. A dataset group is a container for Amazon
  /// Personalize resources. A dataset group can contain at most three datasets,
  /// one for each type of dataset:
  ///
  /// <ul>
  /// <li>
  /// Item interactions
  /// </li>
  /// <li>
  /// Items
  /// </li>
  /// <li>
  /// Users
  /// </li>
  /// <li>
  /// Actions
  /// </li>
  /// <li>
  /// Action interactions
  /// </li>
  /// </ul>
  /// A dataset group can be a Domain dataset group, where you specify a domain
  /// and use pre-configured resources like recommenders, or a Custom dataset
  /// group, where you use custom resources, such as a solution with a solution
  /// version, that you deploy with a campaign. If you start with a Domain
  /// dataset group, you can still add custom resources such as solutions and
  /// solution versions trained with recipes for custom use cases and deployed
  /// with campaigns.
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
  /// To get the status of the dataset group, call <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetGroup.html">DescribeDatasetGroup</a>.
  /// If the status shows as CREATE FAILED, the response includes a
  /// <code>failureReason</code> key, which describes why the creation failed.
  /// <note>
  /// You must wait until the <code>status</code> of the dataset group is
  /// <code>ACTIVE</code> before adding a dataset to the group.
  /// </note>
  /// You can specify an Key Management Service (KMS) key to encrypt the
  /// datasets in the group. If you specify a KMS key, you must also include an
  /// Identity and Access Management (IAM) role that has permission to access
  /// the key.
  /// <p class="title"> <b>APIs that require a dataset group ARN in the
  /// request</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html">CreateDataset</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateEventTracker.html">CreateEventTracker</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html">CreateSolution</a>
  /// </li>
  /// </ul> <p class="title"> <b>Related APIs</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_ListDatasetGroups.html">ListDatasetGroups</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetGroup.html">DescribeDatasetGroup</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteDatasetGroup.html">DeleteDatasetGroup</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [name] :
  /// The name for the new dataset group.
  ///
  /// Parameter [domain] :
  /// The domain of the dataset group. Specify a domain to create a Domain
  /// dataset group. The domain you specify determines the default schemas for
  /// datasets and the use cases available for recommenders. If you don't
  /// specify a domain, you create a Custom dataset group with solution versions
  /// that you deploy with a campaign.
  ///
  /// Parameter [kmsKeyArn] :
  /// The Amazon Resource Name (ARN) of a Key Management Service (KMS) key used
  /// to encrypt the datasets.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the Identity and Access Management (IAM) role that has
  /// permissions to access the Key Management Service (KMS) key. Supplying an
  /// IAM role is only valid when also specifying a KMS key.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html">tags</a>
  /// to apply to the dataset group.
  Future<CreateDatasetGroupResponse> createDatasetGroup({
    required String name,
    Domain? domain,
    String? kmsKeyArn,
    String? roleArn,
    List<Tag>? tags,
  }) async {
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
        if (domain != null) 'domain': domain.toValue(),
        if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
        if (roleArn != null) 'roleArn': roleArn,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateDatasetGroupResponse.fromJson(jsonResponse.body);
  }

  /// Creates a job that imports training data from your data source (an Amazon
  /// S3 bucket) to an Amazon Personalize dataset. To allow Amazon Personalize
  /// to import the training data, you must specify an IAM service role that has
  /// permission to read from the data source, as Amazon Personalize makes a
  /// copy of your data and processes it internally. For information on granting
  /// access to your Amazon S3 bucket, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/granting-personalize-s3-access.html">Giving
  /// Amazon Personalize Access to Amazon S3 Resources</a>.
  ///
  /// If you already created a recommender or deployed a custom solution version
  /// with a campaign, how new bulk records influence recommendations depends on
  /// the domain use case or recipe that you use. For more information, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/how-new-data-influences-recommendations.html">How
  /// new data influences real-time recommendations</a>.
  /// <important>
  /// By default, a dataset import job replaces any existing data in the dataset
  /// that you imported in bulk. To add new records without replacing existing
  /// data, specify INCREMENTAL for the import mode in the
  /// CreateDatasetImportJob operation.
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
  /// To get the status of the import job, call <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetImportJob.html">DescribeDatasetImportJob</a>,
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
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_ListDatasetImportJobs.html">ListDatasetImportJobs</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetImportJob.html">DescribeDatasetImportJob</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [TooManyTagsException].
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
  ///
  /// Parameter [importMode] :
  /// Specify how to add the new records to an existing dataset. The default
  /// import mode is <code>FULL</code>. If you haven't imported bulk records
  /// into the dataset previously, you can only specify <code>FULL</code>.
  ///
  /// <ul>
  /// <li>
  /// Specify <code>FULL</code> to overwrite all existing bulk data in your
  /// dataset. Data you imported individually is not replaced.
  /// </li>
  /// <li>
  /// Specify <code>INCREMENTAL</code> to append the new records to the existing
  /// data in your dataset. Amazon Personalize replaces any record with the same
  /// ID with the new one.
  /// </li>
  /// </ul>
  ///
  /// Parameter [publishAttributionMetricsToS3] :
  /// If you created a metric attribution, specify whether to publish metrics
  /// for this import job to Amazon S3
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html">tags</a>
  /// to apply to the dataset import job.
  Future<CreateDatasetImportJobResponse> createDatasetImportJob({
    required DataSource dataSource,
    required String datasetArn,
    required String jobName,
    required String roleArn,
    ImportMode? importMode,
    bool? publishAttributionMetricsToS3,
    List<Tag>? tags,
  }) async {
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
        if (importMode != null) 'importMode': importMode.toValue(),
        if (publishAttributionMetricsToS3 != null)
          'publishAttributionMetricsToS3': publishAttributionMetricsToS3,
        if (tags != null) 'tags': tags,
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
  /// operation. Amazon Personalize then appends the event data to the Item
  /// interactions dataset of the dataset group you specify in your event
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
  /// To get the status of the event tracker, call <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeEventTracker.html">DescribeEventTracker</a>.
  /// <note>
  /// The event tracker must be in the ACTIVE state before using the tracking
  /// ID.
  /// </note> <p class="title"> <b>Related APIs</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_ListEventTrackers.html">ListEventTrackers</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeEventTracker.html">DescribeEventTracker</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteEventTracker.html">DeleteEventTracker</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The Amazon Resource Name (ARN) of the dataset group that receives the
  /// event data.
  ///
  /// Parameter [name] :
  /// The name for the event tracker.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html">tags</a>
  /// to apply to the event tracker.
  Future<CreateEventTrackerResponse> createEventTracker({
    required String datasetGroupArn,
    required String name,
    List<Tag>? tags,
  }) async {
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
        if (tags != null) 'tags': tags,
      },
    );

    return CreateEventTrackerResponse.fromJson(jsonResponse.body);
  }

  /// Creates a recommendation filter. For more information, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/filter.html">Filtering
  /// recommendations and user segments</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The ARN of the dataset group that the filter will belong to.
  ///
  /// Parameter [filterExpression] :
  /// The filter expression defines which items are included or excluded from
  /// recommendations. Filter expression must follow specific format rules. For
  /// information about filter expression structure and syntax, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/filter-expressions.html">Filter
  /// expressions</a>.
  ///
  /// Parameter [name] :
  /// The name of the filter to create.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html">tags</a>
  /// to apply to the filter.
  Future<CreateFilterResponse> createFilter({
    required String datasetGroupArn,
    required String filterExpression,
    required String name,
    List<Tag>? tags,
  }) async {
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
        if (tags != null) 'tags': tags,
      },
    );

    return CreateFilterResponse.fromJson(jsonResponse.body);
  }

  /// Creates a metric attribution. A metric attribution creates reports on the
  /// data that you import into Amazon Personalize. Depending on how you
  /// imported the data, you can view reports in Amazon CloudWatch or Amazon S3.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/measuring-recommendation-impact.html">Measuring
  /// impact of recommendations</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The Amazon Resource Name (ARN) of the destination dataset group for the
  /// metric attribution.
  ///
  /// Parameter [metrics] :
  /// A list of metric attributes for the metric attribution. Each metric
  /// attribute specifies an event type to track and a function. Available
  /// functions are <code>SUM()</code> or <code>SAMPLECOUNT()</code>. For SUM()
  /// functions, provide the dataset type (either Interactions or Items) and
  /// column to sum as a parameter. For example SUM(Items.PRICE).
  ///
  /// Parameter [metricsOutputConfig] :
  /// The output configuration details for the metric attribution.
  ///
  /// Parameter [name] :
  /// A name for the metric attribution.
  Future<CreateMetricAttributionResponse> createMetricAttribution({
    required String datasetGroupArn,
    required List<MetricAttribute> metrics,
    required MetricAttributionOutput metricsOutputConfig,
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.CreateMetricAttribution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'datasetGroupArn': datasetGroupArn,
        'metrics': metrics,
        'metricsOutputConfig': metricsOutputConfig,
        'name': name,
      },
    );

    return CreateMetricAttributionResponse.fromJson(jsonResponse.body);
  }

  /// Creates a recommender with the recipe (a Domain dataset group use case)
  /// you specify. You create recommenders for a Domain dataset group and
  /// specify the recommender's Amazon Resource Name (ARN) when you make a <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html">GetRecommendations</a>
  /// request.
  ///
  /// <b>Minimum recommendation requests per second</b>
  /// <important>
  /// A high <code>minRecommendationRequestsPerSecond</code> will increase your
  /// bill. We recommend starting with 1 for
  /// <code>minRecommendationRequestsPerSecond</code> (the default). Track your
  /// usage using Amazon CloudWatch metrics, and increase the
  /// <code>minRecommendationRequestsPerSecond</code> as necessary.
  /// </important>
  /// When you create a recommender, you can configure the recommender's minimum
  /// recommendation requests per second. The minimum recommendation requests
  /// per second (<code>minRecommendationRequestsPerSecond</code>) specifies the
  /// baseline recommendation request throughput provisioned by Amazon
  /// Personalize. The default minRecommendationRequestsPerSecond is
  /// <code>1</code>. A recommendation request is a single
  /// <code>GetRecommendations</code> operation. Request throughput is measured
  /// in requests per second and Amazon Personalize uses your requests per
  /// second to derive your requests per hour and the price of your recommender
  /// usage.
  ///
  /// If your requests per second increases beyond
  /// <code>minRecommendationRequestsPerSecond</code>, Amazon Personalize
  /// auto-scales the provisioned capacity up and down, but never below
  /// <code>minRecommendationRequestsPerSecond</code>. There's a short time
  /// delay while the capacity is increased that might cause loss of requests.
  ///
  /// Your bill is the greater of either the minimum requests per hour (based on
  /// minRecommendationRequestsPerSecond) or the actual number of requests. The
  /// actual request throughput used is calculated as the average
  /// requests/second within a one-hour window. We recommend starting with the
  /// default <code>minRecommendationRequestsPerSecond</code>, track your usage
  /// using Amazon CloudWatch metrics, and then increase the
  /// <code>minRecommendationRequestsPerSecond</code> as necessary.
  ///
  /// <b>Status</b>
  ///
  /// A recommender can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// STOP PENDING &gt; STOP IN_PROGRESS &gt; INACTIVE &gt; START PENDING &gt;
  /// START IN_PROGRESS &gt; ACTIVE
  /// </li>
  /// <li>
  /// DELETE PENDING &gt; DELETE IN_PROGRESS
  /// </li>
  /// </ul>
  /// To get the recommender status, call <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeRecommender.html">DescribeRecommender</a>.
  /// <note>
  /// Wait until the <code>status</code> of the recommender is
  /// <code>ACTIVE</code> before asking the recommender for recommendations.
  /// </note> <p class="title"> <b>Related APIs</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_ListRecommenders.html">ListRecommenders</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeRecommender.html">DescribeRecommender</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_UpdateRecommender.html">UpdateRecommender</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteRecommender.html">DeleteRecommender</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The Amazon Resource Name (ARN) of the destination domain dataset group for
  /// the recommender.
  ///
  /// Parameter [name] :
  /// The name of the recommender.
  ///
  /// Parameter [recipeArn] :
  /// The Amazon Resource Name (ARN) of the recipe that the recommender will
  /// use. For a recommender, a recipe is a Domain dataset group use case. Only
  /// Domain dataset group use cases can be used to create a recommender. For
  /// information about use cases see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/domain-use-cases.html">Choosing
  /// recommender use cases</a>.
  ///
  /// Parameter [recommenderConfig] :
  /// The configuration details of the recommender.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html">tags</a>
  /// to apply to the recommender.
  Future<CreateRecommenderResponse> createRecommender({
    required String datasetGroupArn,
    required String name,
    required String recipeArn,
    RecommenderConfig? recommenderConfig,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.CreateRecommender'
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
        'recipeArn': recipeArn,
        if (recommenderConfig != null) 'recommenderConfig': recommenderConfig,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateRecommenderResponse.fromJson(jsonResponse.body);
  }

  /// Creates an Amazon Personalize schema from the specified schema string. The
  /// schema you create must be in Avro JSON format.
  ///
  /// Amazon Personalize recognizes three schema variants. Each schema is
  /// associated with a dataset type and has a set of required field and
  /// keywords. If you are creating a schema for a dataset in a Domain dataset
  /// group, you provide the domain of the Domain dataset group. You specify a
  /// schema when you call <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html">CreateDataset</a>.
  /// <p class="title"> <b>Related APIs</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_ListSchemas.html">ListSchemas</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSchema.html">DescribeSchema</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteSchema.html">DeleteSchema</a>
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
  ///
  /// Parameter [domain] :
  /// The domain for the schema. If you are creating a schema for a dataset in a
  /// Domain dataset group, specify the domain you chose when you created the
  /// Domain dataset group.
  Future<CreateSchemaResponse> createSchema({
    required String name,
    required String schema,
    Domain? domain,
  }) async {
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
        if (domain != null) 'domain': domain.toValue(),
      },
    );

    return CreateSchemaResponse.fromJson(jsonResponse.body);
  }

  /// <important>
  /// After you create a solution, you can’t change its configuration. By
  /// default, all new solutions use automatic training. With automatic
  /// training, you incur training costs while your solution is active. You
  /// can't stop automatic training for a solution. To avoid unnecessary costs,
  /// make sure to delete the solution when you are finished. For information
  /// about training costs, see <a
  /// href="https://aws.amazon.com/personalize/pricing/">Amazon Personalize
  /// pricing</a>.
  /// </important>
  /// Creates the configuration for training a model (creating a solution
  /// version). This configuration includes the recipe to use for model training
  /// and optional training configuration, such as columns to use in training
  /// and feature transformation parameters. For more information about
  /// configuring a solution, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/customizing-solution-config.html">Creating
  /// and configuring a solution</a>.
  ///
  /// By default, new solutions use automatic training to create solution
  /// versions every 7 days. You can change the training frequency. Automatic
  /// solution version creation starts one hour after the solution is ACTIVE. If
  /// you manually create a solution version within the hour, the solution skips
  /// the first automatic training. For more information, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/solution-config-auto-training.html">Configuring
  /// automatic training</a>.
  ///
  /// To turn off automatic training, set <code>performAutoTraining</code> to
  /// false. If you turn off automatic training, you must manually create a
  /// solution version by calling the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolutionVersion.html">CreateSolutionVersion</a>
  /// operation.
  ///
  /// After training starts, you can get the solution version's Amazon Resource
  /// Name (ARN) with the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutionVersions.html">ListSolutionVersions</a>
  /// API operation. To get its status, use the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolutionVersion.html">DescribeSolutionVersion</a>.
  ///
  /// After training completes you can evaluate model accuracy by calling <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_GetSolutionMetrics.html">GetSolutionMetrics</a>.
  /// When you are satisfied with the solution version, you deploy it using <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateCampaign.html">CreateCampaign</a>.
  /// The campaign provides recommendations to a client through the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html">GetRecommendations</a>
  /// API.
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
  /// To get the status of the solution, call <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolution.html">DescribeSolution</a>.
  /// If you use manual training, the status must be ACTIVE before you call
  /// <code>CreateSolutionVersion</code>.
  /// <p class="title"> <b>Related APIs</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutions.html">ListSolutions</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolutionVersion.html">CreateSolutionVersion</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolution.html">DescribeSolution</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteSolution.html">DeleteSolution</a>
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutionVersions.html">ListSolutionVersions</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolutionVersion.html">DescribeSolutionVersion</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [TooManyTagsException].
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
  /// <important>
  /// We don't recommend enabling automated machine learning. Instead, match
  /// your use case to the available Amazon Personalize recipes. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/working-with-predefined-recipes.html">Choosing
  /// a recipe</a>.
  /// </important>
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
  /// Parameter [performAutoTraining] :
  /// Whether the solution uses automatic training to create new solution
  /// versions (trained models). The default is <code>True</code> and the
  /// solution automatically creates new solution versions every 7 days. You can
  /// change the training frequency by specifying a
  /// <code>schedulingExpression</code> in the <code>AutoTrainingConfig</code>
  /// as part of solution configuration. For more information about automatic
  /// training, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/solution-config-auto-training.html">Configuring
  /// automatic training</a>.
  ///
  /// Automatic solution version creation starts one hour after the solution is
  /// ACTIVE. If you manually create a solution version within the hour, the
  /// solution skips the first automatic training.
  ///
  /// After training starts, you can get the solution version's Amazon Resource
  /// Name (ARN) with the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutionVersions.html">ListSolutionVersions</a>
  /// API operation. To get its status, use the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolutionVersion.html">DescribeSolutionVersion</a>.
  ///
  /// Parameter [performHPO] :
  /// Whether to perform hyperparameter optimization (HPO) on the specified or
  /// selected recipe. The default is <code>false</code>.
  ///
  /// When performing AutoML, this parameter is always <code>true</code> and you
  /// should not set it to <code>false</code>.
  ///
  /// Parameter [recipeArn] :
  /// The Amazon Resource Name (ARN) of the recipe to use for model training.
  /// This is required when <code>performAutoML</code> is false. For information
  /// about different Amazon Personalize recipes and their ARNs, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/working-with-predefined-recipes.html">Choosing
  /// a recipe</a>.
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
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html">tags</a>
  /// to apply to the solution.
  Future<CreateSolutionResponse> createSolution({
    required String datasetGroupArn,
    required String name,
    String? eventType,
    bool? performAutoML,
    bool? performAutoTraining,
    bool? performHPO,
    String? recipeArn,
    SolutionConfig? solutionConfig,
    List<Tag>? tags,
  }) async {
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
        if (performAutoTraining != null)
          'performAutoTraining': performAutoTraining,
        if (performHPO != null) 'performHPO': performHPO,
        if (recipeArn != null) 'recipeArn': recipeArn,
        if (solutionConfig != null) 'solutionConfig': solutionConfig,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateSolutionResponse.fromJson(jsonResponse.body);
  }

  /// Trains or retrains an active solution in a Custom dataset group. A
  /// solution is created using the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html">CreateSolution</a>
  /// operation and must be in the ACTIVE state before calling
  /// <code>CreateSolutionVersion</code>. A new version of the solution is
  /// created every time you call this operation.
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
  /// To get the status of the version, call <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolutionVersion.html">DescribeSolutionVersion</a>.
  /// Wait until the status shows as ACTIVE before calling
  /// <code>CreateCampaign</code>.
  ///
  /// If the status shows as CREATE FAILED, the response includes a
  /// <code>failureReason</code> key, which describes why the job failed.
  /// <p class="title"> <b>Related APIs</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutionVersions.html">ListSolutionVersions</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolutionVersion.html">DescribeSolutionVersion</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutions.html">ListSolutions</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html">CreateSolution</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolution.html">DescribeSolution</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteSolution.html">DeleteSolution</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [TooManyTagsException].
  /// May throw [ResourceAlreadyExistsException].
  ///
  /// Parameter [solutionArn] :
  /// The Amazon Resource Name (ARN) of the solution containing the training
  /// configuration information.
  ///
  /// Parameter [name] :
  /// The name of the solution version.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html">tags</a>
  /// to apply to the solution version.
  ///
  /// Parameter [trainingMode] :
  /// The scope of training to be performed when creating the solution version.
  /// The default is <code>FULL</code>. This creates a completely new model
  /// based on the entirety of the training data from the datasets in your
  /// dataset group.
  ///
  /// If you use <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/native-recipe-new-item-USER_PERSONALIZATION.html">User-Personalization</a>,
  /// you can specify a training mode of <code>UPDATE</code>. This updates the
  /// model to consider new items for recommendations. It is not a full
  /// retraining. You should still complete a full retraining weekly. If you
  /// specify <code>UPDATE</code>, Amazon Personalize will stop automatic
  /// updates for the solution version. To resume updates, create a new solution
  /// with training mode set to <code>FULL</code> and deploy it in a campaign.
  /// For more information about automatic updates, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/use-case-recipe-features.html#maintaining-with-automatic-updates">Automatic
  /// updates</a>.
  ///
  /// The <code>UPDATE</code> option can only be used when you already have an
  /// active solution version created from the input solution using the
  /// <code>FULL</code> option and the input solution was trained with the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/native-recipe-new-item-USER_PERSONALIZATION.html">User-Personalization</a>
  /// recipe or the legacy <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/native-recipe-hrnn-coldstart.html">HRNN-Coldstart</a>
  /// recipe.
  Future<CreateSolutionVersionResponse> createSolutionVersion({
    required String solutionArn,
    String? name,
    List<Tag>? tags,
    TrainingMode? trainingMode,
  }) async {
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
        if (name != null) 'name': name,
        if (tags != null) 'tags': tags,
        if (trainingMode != null) 'trainingMode': trainingMode.toValue(),
      },
    );

    return CreateSolutionVersionResponse.fromJson(jsonResponse.body);
  }

  /// Removes a campaign by deleting the solution deployment. The solution that
  /// the campaign is based on is not deleted and can be redeployed when needed.
  /// A deleted campaign can no longer be specified in a <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html">GetRecommendations</a>
  /// request. For information on creating campaigns, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateCampaign.html">CreateCampaign</a>.
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
  /// <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html">CreateDataset</a>.
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

  /// Deletes the event tracker. Does not delete the dataset from the dataset
  /// group. For more information on event trackers, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateEventTracker.html">CreateEventTracker</a>.
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

  /// Deletes a metric attribution.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [metricAttributionArn] :
  /// The metric attribution's Amazon Resource Name (ARN).
  Future<void> deleteMetricAttribution({
    required String metricAttributionArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DeleteMetricAttribution'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'metricAttributionArn': metricAttributionArn,
      },
    );
  }

  /// Deactivates and removes a recommender. A deleted recommender can no longer
  /// be specified in a <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html">GetRecommendations</a>
  /// request.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [recommenderArn] :
  /// The Amazon Resource Name (ARN) of the recommender to delete.
  Future<void> deleteRecommender({
    required String recommenderArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DeleteRecommender'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'recommenderArn': recommenderArn,
      },
    );
  }

  /// Deletes a schema. Before deleting a schema, you must delete all datasets
  /// referencing the schema. For more information on schemas, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSchema.html">CreateSchema</a>.
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
  /// the solution. To determine what campaigns are using the solution, call <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_ListCampaigns.html">ListCampaigns</a>
  /// and supply the Amazon Resource Name (ARN) of the solution. You can't
  /// delete a solution if an associated <code>SolutionVersion</code> is in the
  /// CREATE PENDING or IN PROGRESS state. For more information on solutions,
  /// see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html">CreateSolution</a>.
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

  /// Gets the properties of a batch segment job including name, Amazon Resource
  /// Name (ARN), status, input and output configurations, and the ARN of the
  /// solution version used to generate segments.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [batchSegmentJobArn] :
  /// The ARN of the batch segment job to describe.
  Future<DescribeBatchSegmentJobResponse> describeBatchSegmentJob({
    required String batchSegmentJobArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DescribeBatchSegmentJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'batchSegmentJobArn': batchSegmentJobArn,
      },
    );

    return DescribeBatchSegmentJobResponse.fromJson(jsonResponse.body);
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
  /// For more information on campaigns, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateCampaign.html">CreateCampaign</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [campaignArn] :
  /// The Amazon Resource Name (ARN) of the campaign.
  Future<DescribeCampaignResponse> describeCampaign({
    required String campaignArn,
  }) async {
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

  /// Describes the data deletion job created by <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataDeletionJob.html">CreateDataDeletionJob</a>,
  /// including the job status.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [dataDeletionJobArn] :
  /// The Amazon Resource Name (ARN) of the data deletion job.
  Future<DescribeDataDeletionJobResponse> describeDataDeletionJob({
    required String dataDeletionJobArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DescribeDataDeletionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'dataDeletionJobArn': dataDeletionJobArn,
      },
    );

    return DescribeDataDeletionJobResponse.fromJson(jsonResponse.body);
  }

  /// Describes the given dataset. For more information on datasets, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html">CreateDataset</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [datasetArn] :
  /// The Amazon Resource Name (ARN) of the dataset to describe.
  Future<DescribeDatasetResponse> describeDataset({
    required String datasetArn,
  }) async {
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

  /// Describes the dataset export job created by <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetExportJob.html">CreateDatasetExportJob</a>,
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
  /// see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetGroup.html">CreateDatasetGroup</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The Amazon Resource Name (ARN) of the dataset group to describe.
  Future<DescribeDatasetGroupResponse> describeDatasetGroup({
    required String datasetGroupArn,
  }) async {
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

  /// Describes the dataset import job created by <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetImportJob.html">CreateDatasetImportJob</a>,
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
  /// more information on event trackers, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateEventTracker.html">CreateEventTracker</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [eventTrackerArn] :
  /// The Amazon Resource Name (ARN) of the event tracker to describe.
  Future<DescribeEventTrackerResponse> describeEventTracker({
    required String eventTrackerArn,
  }) async {
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

  /// Describes a metric attribution.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [metricAttributionArn] :
  /// The metric attribution's Amazon Resource Name (ARN).
  Future<DescribeMetricAttributionResponse> describeMetricAttribution({
    required String metricAttributionArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DescribeMetricAttribution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'metricAttributionArn': metricAttributionArn,
      },
    );

    return DescribeMetricAttributionResponse.fromJson(jsonResponse.body);
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
  /// recipe when you create a solution with the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html">CreateSolution</a>
  /// API. <code>CreateSolution</code> trains a model by using the algorithm in
  /// the specified recipe and a training dataset. The solution, when deployed
  /// as a campaign, can provide recommendations using the <a
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

  /// Describes the given recommender, including its status.
  ///
  /// A recommender can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// STOP PENDING &gt; STOP IN_PROGRESS &gt; INACTIVE &gt; START PENDING &gt;
  /// START IN_PROGRESS &gt; ACTIVE
  /// </li>
  /// <li>
  /// DELETE PENDING &gt; DELETE IN_PROGRESS
  /// </li>
  /// </ul>
  /// When the <code>status</code> is <code>CREATE FAILED</code>, the response
  /// includes the <code>failureReason</code> key, which describes why.
  ///
  /// The <code>modelMetrics</code> key is null when the recommender is being
  /// created or deleted.
  ///
  /// For more information on recommenders, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateRecommender.html">CreateRecommender</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [recommenderArn] :
  /// The Amazon Resource Name (ARN) of the recommender to describe.
  Future<DescribeRecommenderResponse> describeRecommender({
    required String recommenderArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.DescribeRecommender'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'recommenderArn': recommenderArn,
      },
    );

    return DescribeRecommenderResponse.fromJson(jsonResponse.body);
  }

  /// Describes a schema. For more information on schemas, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSchema.html">CreateSchema</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [schemaArn] :
  /// The Amazon Resource Name (ARN) of the schema to retrieve.
  Future<DescribeSchemaResponse> describeSchema({
    required String schemaArn,
  }) async {
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

  /// Describes a solution. For more information on solutions, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html">CreateSolution</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [solutionArn] :
  /// The Amazon Resource Name (ARN) of the solution to describe.
  Future<DescribeSolutionResponse> describeSolution({
    required String solutionArn,
  }) async {
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
  /// solutions, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html">CreateSolution</a>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [solutionVersionArn] :
  /// The Amazon Resource Name (ARN) of the solution version.
  Future<DescribeSolutionVersionResponse> describeSolutionVersion({
    required String solutionVersionArn,
  }) async {
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

  /// Gets a list of the batch segment jobs that have been performed off of a
  /// solution version that you specify.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of batch segment job results to return in each page.
  /// The default value is 100.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  ///
  /// Parameter [solutionVersionArn] :
  /// The Amazon Resource Name (ARN) of the solution version that the batch
  /// segment jobs used to generate batch segments.
  Future<ListBatchSegmentJobsResponse> listBatchSegmentJobs({
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.ListBatchSegmentJobs'
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

    return ListBatchSegmentJobsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of campaigns that use the given solution. When a solution
  /// is not specified, all the campaigns associated with the account are
  /// listed. The response provides the properties for each campaign, including
  /// the Amazon Resource Name (ARN). For more information on campaigns, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateCampaign.html">CreateCampaign</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of campaigns to return.
  ///
  /// Parameter [nextToken] :
  /// A token returned from the previous call to <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_ListCampaigns.html">ListCampaigns</a>
  /// for getting the next set of campaigns (if they exist).
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

  /// Returns a list of data deletion jobs for a dataset group ordered by
  /// creation time, with the most recent first. When a dataset group is not
  /// specified, all the data deletion jobs associated with the account are
  /// listed. The response provides the properties for each job, including the
  /// Amazon Resource Name (ARN). For more information on data deletion jobs,
  /// see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/delete-records.html">Deleting
  /// users</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The Amazon Resource Name (ARN) of the dataset group to list data deletion
  /// jobs for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of data deletion jobs to return.
  ///
  /// Parameter [nextToken] :
  /// A token returned from the previous call to
  /// <code>ListDataDeletionJobs</code> for getting the next set of jobs (if
  /// they exist).
  Future<ListDataDeletionJobsResponse> listDataDeletionJobs({
    String? datasetGroupArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.ListDataDeletionJobs'
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

    return ListDataDeletionJobsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of dataset export jobs that use the given dataset. When a
  /// dataset is not specified, all the dataset export jobs associated with the
  /// account are listed. The response provides the properties for each dataset
  /// export job, including the Amazon Resource Name (ARN). For more information
  /// on dataset export jobs, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetExportJob.html">CreateDatasetExportJob</a>.
  /// For more information on datasets, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html">CreateDataset</a>.
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
  /// information on dataset groups, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetGroup.html">CreateDatasetGroup</a>.
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
  /// on dataset import jobs, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetImportJob.html">CreateDatasetImportJob</a>.
  /// For more information on datasets, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html">CreateDataset</a>.
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
  /// Resource Name (ARN). For more information on datasets, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html">CreateDataset</a>.
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
  /// A token returned from the previous call to <code>ListDatasets</code> for
  /// getting the next set of dataset import jobs (if they exist).
  Future<ListDatasetsResponse> listDatasets({
    String? datasetGroupArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
  /// trackers, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateEventTracker.html">CreateEventTracker</a>.
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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

  /// Lists the metrics for the metric attribution.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of metrics to return in one page of results.
  ///
  /// Parameter [metricAttributionArn] :
  /// The Amazon Resource Name (ARN) of the metric attribution to retrieve
  /// attributes for.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListMetricAttributionMetricsResponse> listMetricAttributionMetrics({
    int? maxResults,
    String? metricAttributionArn,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.ListMetricAttributionMetrics'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (metricAttributionArn != null)
          'metricAttributionArn': metricAttributionArn,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListMetricAttributionMetricsResponse.fromJson(jsonResponse.body);
  }

  /// Lists metric attributions.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The metric attributions' dataset group Amazon Resource Name (ARN).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of metric attributions to return in one page of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  Future<ListMetricAttributionsResponse> listMetricAttributions({
    String? datasetGroupArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.ListMetricAttributions'
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

    return ListMetricAttributionsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of available recipes. The response provides the properties
  /// for each recipe, including the recipe's Amazon Resource Name (ARN).
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [domain] :
  /// Filters returned recipes by domain for a Domain dataset group. Only
  /// recipes (Domain dataset group use cases) for this domain are included in
  /// the response. If you don't specify a domain, all recipes are returned.
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
    Domain? domain,
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
        if (domain != null) 'domain': domain.toValue(),
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (recipeProvider != null) 'recipeProvider': recipeProvider.toValue(),
      },
    );

    return ListRecipesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of recommenders in a given Domain dataset group. When a
  /// Domain dataset group is not specified, all the recommenders associated
  /// with the account are listed. The response provides the properties for each
  /// recommender, including the Amazon Resource Name (ARN). For more
  /// information on recommenders, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateRecommender.html">CreateRecommender</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The Amazon Resource Name (ARN) of the Domain dataset group to list the
  /// recommenders for. When a Domain dataset group is not specified, all the
  /// recommenders associated with the account are listed.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of recommenders to return.
  ///
  /// Parameter [nextToken] :
  /// A token returned from the previous call to <code>ListRecommenders</code>
  /// for getting the next set of recommenders (if they exist).
  Future<ListRecommendersResponse> listRecommenders({
    String? datasetGroupArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.ListRecommenders'
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

    return ListRecommendersResponse.fromJson(jsonResponse.body);
  }

  /// Returns the list of schemas associated with the account. The response
  /// provides the properties for each schema, including the Amazon Resource
  /// Name (ARN). For more information on schemas, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSchema.html">CreateSchema</a>.
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
  /// version, including the Amazon Resource Name (ARN).
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

  /// Returns a list of solutions in a given dataset group. When a dataset group
  /// is not specified, all the solutions associated with the account are
  /// listed. The response provides the properties for each solution, including
  /// the Amazon Resource Name (ARN). For more information on solutions, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html">CreateSolution</a>.
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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

  /// Get a list of <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html">tags</a>
  /// attached to a resource.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [resourceArn] :
  /// The resource's Amazon Resource Name (ARN).
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Starts a recommender that is INACTIVE. Starting a recommender does not
  /// create any new models, but resumes billing and automatic retraining for
  /// the recommender.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [recommenderArn] :
  /// The Amazon Resource Name (ARN) of the recommender to start.
  Future<StartRecommenderResponse> startRecommender({
    required String recommenderArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.StartRecommender'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'recommenderArn': recommenderArn,
      },
    );

    return StartRecommenderResponse.fromJson(jsonResponse.body);
  }

  /// Stops a recommender that is ACTIVE. Stopping a recommender halts billing
  /// and automatic retraining for the recommender.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [recommenderArn] :
  /// The Amazon Resource Name (ARN) of the recommender to stop.
  Future<StopRecommenderResponse> stopRecommender({
    required String recommenderArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.StopRecommender'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'recommenderArn': recommenderArn,
      },
    );

    return StopRecommenderResponse.fromJson(jsonResponse.body);
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

  /// Add a list of tags to a resource.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyTagsException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The resource's Amazon Resource Name (ARN).
  ///
  /// Parameter [tags] :
  /// Tags to apply to the resource. For more information see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html">Tagging
  /// Amazon Personalize resources</a>.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tags': tags,
      },
    );
  }

  /// Removes the specified tags that are attached to a resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/tags-remove.html">Removing
  /// tags from Amazon Personalize resources</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyTagKeysException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [resourceArn] :
  /// The resource's Amazon Resource Name (ARN).
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to be removed.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tagKeys': tagKeys,
      },
    );
  }

  /// Updates a campaign to deploy a retrained solution version with an existing
  /// campaign, change your campaign's <code>minProvisionedTPS</code>, or modify
  /// your campaign's configuration. For example, you can set
  /// <code>enableMetadataWithRecommendations</code> to true for an existing
  /// campaign.
  ///
  /// To update a campaign to start automatically using the latest solution
  /// version, specify the following:
  ///
  /// <ul>
  /// <li>
  /// For the <code>SolutionVersionArn</code> parameter, specify the Amazon
  /// Resource Name (ARN) of your solution in <code>SolutionArn/$LATEST</code>
  /// format.
  /// </li>
  /// <li>
  /// In the <code>campaignConfig</code>, set
  /// <code>syncWithLatestSolutionVersion</code> to <code>true</code>.
  /// </li>
  /// </ul>
  /// To update a campaign, the campaign status must be ACTIVE or CREATE FAILED.
  /// Check the campaign status using the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeCampaign.html">DescribeCampaign</a>
  /// operation.
  /// <note>
  /// You can still get recommendations from a campaign while an update is in
  /// progress. The campaign will use the previous solution version and campaign
  /// configuration to generate recommendations until the latest campaign update
  /// status is <code>Active</code>.
  /// </note>
  /// For more information about updating a campaign, including code samples,
  /// see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/update-campaigns.html">Updating
  /// a campaign</a>. For more information about campaigns, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/campaigns.html">Creating
  /// a campaign</a>.
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
  /// per second that Amazon Personalize will support. A high
  /// <code>minProvisionedTPS</code> will increase your bill. We recommend
  /// starting with 1 for <code>minProvisionedTPS</code> (the default). Track
  /// your usage using Amazon CloudWatch metrics, and increase the
  /// <code>minProvisionedTPS</code> as necessary.
  ///
  /// Parameter [solutionVersionArn] :
  /// The Amazon Resource Name (ARN) of a new model to deploy. To specify the
  /// latest solution version of your solution, specify the ARN of your
  /// <i>solution</i> in <code>SolutionArn/$LATEST</code> format. You must use
  /// this format if you set <code>syncWithLatestSolutionVersion</code> to
  /// <code>True</code> in the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CampaignConfig.html">CampaignConfig</a>.
  ///
  /// To deploy a model that isn't the latest solution version of your solution,
  /// specify the ARN of the solution version.
  ///
  /// For more information about automatic campaign updates, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/campaigns.html#create-campaign-automatic-latest-sv-update">Enabling
  /// automatic campaign updates</a>.
  Future<UpdateCampaignResponse> updateCampaign({
    required String campaignArn,
    CampaignConfig? campaignConfig,
    int? minProvisionedTPS,
    String? solutionVersionArn,
  }) async {
    _s.validateNumRange(
      'minProvisionedTPS',
      minProvisionedTPS,
      1,
      1152921504606846976,
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

  /// Update a dataset to replace its schema with a new or existing one. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/updating-dataset-schema.html">Replacing
  /// a dataset's schema</a>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [datasetArn] :
  /// The Amazon Resource Name (ARN) of the dataset that you want to update.
  ///
  /// Parameter [schemaArn] :
  /// The Amazon Resource Name (ARN) of the new schema you want use.
  Future<UpdateDatasetResponse> updateDataset({
    required String datasetArn,
    required String schemaArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.UpdateDataset'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'datasetArn': datasetArn,
        'schemaArn': schemaArn,
      },
    );

    return UpdateDatasetResponse.fromJson(jsonResponse.body);
  }

  /// Updates a metric attribution.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceAlreadyExistsException].
  ///
  /// Parameter [addMetrics] :
  /// Add new metric attributes to the metric attribution.
  ///
  /// Parameter [metricAttributionArn] :
  /// The Amazon Resource Name (ARN) for the metric attribution to update.
  ///
  /// Parameter [metricsOutputConfig] :
  /// An output config for the metric attribution.
  ///
  /// Parameter [removeMetrics] :
  /// Remove metric attributes from the metric attribution.
  Future<UpdateMetricAttributionResponse> updateMetricAttribution({
    List<MetricAttribute>? addMetrics,
    String? metricAttributionArn,
    MetricAttributionOutput? metricsOutputConfig,
    List<String>? removeMetrics,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.UpdateMetricAttribution'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (addMetrics != null) 'addMetrics': addMetrics,
        if (metricAttributionArn != null)
          'metricAttributionArn': metricAttributionArn,
        if (metricsOutputConfig != null)
          'metricsOutputConfig': metricsOutputConfig,
        if (removeMetrics != null) 'removeMetrics': removeMetrics,
      },
    );

    return UpdateMetricAttributionResponse.fromJson(jsonResponse.body);
  }

  /// Updates the recommender to modify the recommender configuration. If you
  /// update the recommender to modify the columns used in training, Amazon
  /// Personalize automatically starts a full retraining of the models backing
  /// your recommender. While the update completes, you can still get
  /// recommendations from the recommender. The recommender uses the previous
  /// configuration until the update completes. To track the status of this
  /// update, use the <code>latestRecommenderUpdate</code> returned in the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeRecommender.html">DescribeRecommender</a>
  /// operation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [recommenderArn] :
  /// The Amazon Resource Name (ARN) of the recommender to modify.
  ///
  /// Parameter [recommenderConfig] :
  /// The configuration details of the recommender.
  Future<UpdateRecommenderResponse> updateRecommender({
    required String recommenderArn,
    required RecommenderConfig recommenderConfig,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonPersonalize.UpdateRecommender'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'recommenderArn': recommenderArn,
        'recommenderConfig': recommenderConfig,
      },
    );

    return UpdateRecommenderResponse.fromJson(jsonResponse.body);
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

/// When the solution performs AutoML (<code>performAutoML</code> is true in <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html">CreateSolution</a>),
/// Amazon Personalize determines which recipe, from the specified list,
/// optimizes the given metric. Amazon Personalize then uses that recipe for the
/// solution.
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

/// When the solution performs AutoML (<code>performAutoML</code> is true in <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html">CreateSolution</a>),
/// specifies the recipe that best optimized the specified metric.
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

/// The automatic training configuration to use when
/// <code>performAutoTraining</code> is true.
class AutoTrainingConfig {
  /// Specifies how often to automatically train new solution versions. Specify a
  /// rate expression in rate(<i>value</i> <i>unit</i>) format. For value, specify
  /// a number between 1 and 30. For unit, specify <code>day</code> or
  /// <code>days</code>. For example, to automatically create a new solution
  /// version every 5 days, specify <code>rate(5 days)</code>. The default is
  /// every 7 days.
  ///
  /// For more information about auto training, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/customizing-solution-config.html">Creating
  /// and configuring a solution</a>.
  final String? schedulingExpression;

  AutoTrainingConfig({
    this.schedulingExpression,
  });

  factory AutoTrainingConfig.fromJson(Map<String, dynamic> json) {
    return AutoTrainingConfig(
      schedulingExpression: json['schedulingExpression'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final schedulingExpression = this.schedulingExpression;
    return {
      if (schedulingExpression != null)
        'schedulingExpression': schedulingExpression,
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

  /// The job's mode.
  final BatchInferenceJobMode? batchInferenceJobMode;

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

  /// The job's theme generation settings.
  final ThemeGenerationConfig? themeGenerationConfig;

  BatchInferenceJob({
    this.batchInferenceJobArn,
    this.batchInferenceJobConfig,
    this.batchInferenceJobMode,
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
    this.themeGenerationConfig,
  });

  factory BatchInferenceJob.fromJson(Map<String, dynamic> json) {
    return BatchInferenceJob(
      batchInferenceJobArn: json['batchInferenceJobArn'] as String?,
      batchInferenceJobConfig: json['batchInferenceJobConfig'] != null
          ? BatchInferenceJobConfig.fromJson(
              json['batchInferenceJobConfig'] as Map<String, dynamic>)
          : null,
      batchInferenceJobMode:
          (json['batchInferenceJobMode'] as String?)?.toBatchInferenceJobMode(),
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
      themeGenerationConfig: json['themeGenerationConfig'] != null
          ? ThemeGenerationConfig.fromJson(
              json['themeGenerationConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final batchInferenceJobArn = this.batchInferenceJobArn;
    final batchInferenceJobConfig = this.batchInferenceJobConfig;
    final batchInferenceJobMode = this.batchInferenceJobMode;
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
    final themeGenerationConfig = this.themeGenerationConfig;
    return {
      if (batchInferenceJobArn != null)
        'batchInferenceJobArn': batchInferenceJobArn,
      if (batchInferenceJobConfig != null)
        'batchInferenceJobConfig': batchInferenceJobConfig,
      if (batchInferenceJobMode != null)
        'batchInferenceJobMode': batchInferenceJobMode.toValue(),
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
      if (themeGenerationConfig != null)
        'themeGenerationConfig': themeGenerationConfig,
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

enum BatchInferenceJobMode {
  batchInference,
  themeGeneration,
}

extension BatchInferenceJobModeValueExtension on BatchInferenceJobMode {
  String toValue() {
    switch (this) {
      case BatchInferenceJobMode.batchInference:
        return 'BATCH_INFERENCE';
      case BatchInferenceJobMode.themeGeneration:
        return 'THEME_GENERATION';
    }
  }
}

extension BatchInferenceJobModeFromString on String {
  BatchInferenceJobMode toBatchInferenceJobMode() {
    switch (this) {
      case 'BATCH_INFERENCE':
        return BatchInferenceJobMode.batchInference;
      case 'THEME_GENERATION':
        return BatchInferenceJobMode.themeGeneration;
    }
    throw Exception('$this is not known in enum BatchInferenceJobMode');
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

/// A truncated version of the <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_BatchInferenceJob.html">BatchInferenceJob</a>.
/// The <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_ListBatchInferenceJobs.html">ListBatchInferenceJobs</a>
/// operation returns a list of batch inference job summaries.
class BatchInferenceJobSummary {
  /// The Amazon Resource Name (ARN) of the batch inference job.
  final String? batchInferenceJobArn;

  /// The job's mode.
  final BatchInferenceJobMode? batchInferenceJobMode;

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
    this.batchInferenceJobMode,
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
      batchInferenceJobMode:
          (json['batchInferenceJobMode'] as String?)?.toBatchInferenceJobMode(),
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
    final batchInferenceJobMode = this.batchInferenceJobMode;
    final creationDateTime = this.creationDateTime;
    final failureReason = this.failureReason;
    final jobName = this.jobName;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final solutionVersionArn = this.solutionVersionArn;
    final status = this.status;
    return {
      if (batchInferenceJobArn != null)
        'batchInferenceJobArn': batchInferenceJobArn,
      if (batchInferenceJobMode != null)
        'batchInferenceJobMode': batchInferenceJobMode.toValue(),
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

/// Contains information on a batch segment job.
class BatchSegmentJob {
  /// The Amazon Resource Name (ARN) of the batch segment job.
  final String? batchSegmentJobArn;

  /// The time at which the batch segment job was created.
  final DateTime? creationDateTime;

  /// If the batch segment job failed, the reason for the failure.
  final String? failureReason;

  /// The ARN of the filter used on the batch segment job.
  final String? filterArn;

  /// The Amazon S3 path that leads to the input data used to generate the batch
  /// segment job.
  final BatchSegmentJobInput? jobInput;

  /// The name of the batch segment job.
  final String? jobName;

  /// The Amazon S3 bucket that contains the output data generated by the batch
  /// segment job.
  final BatchSegmentJobOutput? jobOutput;

  /// The time at which the batch segment job last updated.
  final DateTime? lastUpdatedDateTime;

  /// The number of predicted users generated by the batch segment job for each
  /// line of input data. The maximum number of users per segment is 5 million.
  final int? numResults;

  /// The ARN of the Amazon Identity and Access Management (IAM) role that
  /// requested the batch segment job.
  final String? roleArn;

  /// The Amazon Resource Name (ARN) of the solution version used by the batch
  /// segment job to generate batch segments.
  final String? solutionVersionArn;

  /// The status of the batch segment job. The status is one of the following
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

  BatchSegmentJob({
    this.batchSegmentJobArn,
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

  factory BatchSegmentJob.fromJson(Map<String, dynamic> json) {
    return BatchSegmentJob(
      batchSegmentJobArn: json['batchSegmentJobArn'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      failureReason: json['failureReason'] as String?,
      filterArn: json['filterArn'] as String?,
      jobInput: json['jobInput'] != null
          ? BatchSegmentJobInput.fromJson(
              json['jobInput'] as Map<String, dynamic>)
          : null,
      jobName: json['jobName'] as String?,
      jobOutput: json['jobOutput'] != null
          ? BatchSegmentJobOutput.fromJson(
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
    final batchSegmentJobArn = this.batchSegmentJobArn;
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
      if (batchSegmentJobArn != null) 'batchSegmentJobArn': batchSegmentJobArn,
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

/// The input configuration of a batch segment job.
class BatchSegmentJobInput {
  final S3DataConfig s3DataSource;

  BatchSegmentJobInput({
    required this.s3DataSource,
  });

  factory BatchSegmentJobInput.fromJson(Map<String, dynamic> json) {
    return BatchSegmentJobInput(
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

/// The output configuration parameters of a batch segment job.
class BatchSegmentJobOutput {
  final S3DataConfig s3DataDestination;

  BatchSegmentJobOutput({
    required this.s3DataDestination,
  });

  factory BatchSegmentJobOutput.fromJson(Map<String, dynamic> json) {
    return BatchSegmentJobOutput(
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

/// A truncated version of the <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_BatchSegmentJob.html">BatchSegmentJob</a>
/// datatype. <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_ListBatchSegmentJobs.html">ListBatchSegmentJobs</a>
/// operation returns a list of batch segment job summaries.
class BatchSegmentJobSummary {
  /// The Amazon Resource Name (ARN) of the batch segment job.
  final String? batchSegmentJobArn;

  /// The time at which the batch segment job was created.
  final DateTime? creationDateTime;

  /// If the batch segment job failed, the reason for the failure.
  final String? failureReason;

  /// The name of the batch segment job.
  final String? jobName;

  /// The time at which the batch segment job was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The Amazon Resource Name (ARN) of the solution version used by the batch
  /// segment job to generate batch segments.
  final String? solutionVersionArn;

  /// The status of the batch segment job. The status is one of the following
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

  BatchSegmentJobSummary({
    this.batchSegmentJobArn,
    this.creationDateTime,
    this.failureReason,
    this.jobName,
    this.lastUpdatedDateTime,
    this.solutionVersionArn,
    this.status,
  });

  factory BatchSegmentJobSummary.fromJson(Map<String, dynamic> json) {
    return BatchSegmentJobSummary(
      batchSegmentJobArn: json['batchSegmentJobArn'] as String?,
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      failureReason: json['failureReason'] as String?,
      jobName: json['jobName'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      solutionVersionArn: json['solutionVersionArn'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchSegmentJobArn = this.batchSegmentJobArn;
    final creationDateTime = this.creationDateTime;
    final failureReason = this.failureReason;
    final jobName = this.jobName;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final solutionVersionArn = this.solutionVersionArn;
    final status = this.status;
    return {
      if (batchSegmentJobArn != null) 'batchSegmentJobArn': batchSegmentJobArn,
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

/// An object that describes the deployment of a solution version. For more
/// information on campaigns, see <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateCampaign.html">CreateCampaign</a>.
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
  /// per second. A high <code>minProvisionedTPS</code> will increase your bill.
  /// We recommend starting with 1 for <code>minProvisionedTPS</code> (the
  /// default). Track your usage using Amazon CloudWatch metrics, and increase the
  /// <code>minProvisionedTPS</code> as necessary.
  final int? minProvisionedTPS;

  /// The name of the campaign.
  final String? name;

  /// The Amazon Resource Name (ARN) of the solution version the campaign uses.
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
  /// Whether metadata with recommendations is enabled for the campaign. If
  /// enabled, you can specify the columns from your Items dataset in your request
  /// for recommendations. Amazon Personalize returns this data for each item in
  /// the recommendation response. For information about enabling metadata for a
  /// campaign, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/campaigns.html#create-campaign-return-metadata">Enabling
  /// metadata in recommendations for a campaign</a>.
  ///
  /// If you enable metadata in recommendations, you will incur additional costs.
  /// For more information, see <a
  /// href="https://aws.amazon.com/personalize/pricing/">Amazon Personalize
  /// pricing</a>.
  final bool? enableMetadataWithRecommendations;

  /// Specifies the exploration configuration hyperparameters, including
  /// <code>explorationWeight</code> and <code>explorationItemAgeCutOff</code>,
  /// you want to use to configure the amount of item exploration Amazon
  /// Personalize uses when recommending items. Provide
  /// <code>itemExplorationConfig</code> data only if your solution uses the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/native-recipe-new-item-USER_PERSONALIZATION.html">User-Personalization</a>
  /// recipe.
  final Map<String, String>? itemExplorationConfig;

  /// Whether the campaign automatically updates to use the latest solution
  /// version (trained model) of a solution. If you specify <code>True</code>, you
  /// must specify the ARN of your <i>solution</i> for the
  /// <code>SolutionVersionArn</code> parameter. It must be in
  /// <code>SolutionArn/$LATEST</code> format. The default is <code>False</code>
  /// and you must manually update the campaign to deploy the latest solution
  /// version.
  ///
  /// For more information about automatic campaign updates, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/campaigns.html#create-campaign-automatic-latest-sv-update">Enabling
  /// automatic campaign updates</a>.
  final bool? syncWithLatestSolutionVersion;

  CampaignConfig({
    this.enableMetadataWithRecommendations,
    this.itemExplorationConfig,
    this.syncWithLatestSolutionVersion,
  });

  factory CampaignConfig.fromJson(Map<String, dynamic> json) {
    return CampaignConfig(
      enableMetadataWithRecommendations:
          json['enableMetadataWithRecommendations'] as bool?,
      itemExplorationConfig:
          (json['itemExplorationConfig'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      syncWithLatestSolutionVersion:
          json['syncWithLatestSolutionVersion'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enableMetadataWithRecommendations =
        this.enableMetadataWithRecommendations;
    final itemExplorationConfig = this.itemExplorationConfig;
    final syncWithLatestSolutionVersion = this.syncWithLatestSolutionVersion;
    return {
      if (enableMetadataWithRecommendations != null)
        'enableMetadataWithRecommendations': enableMetadataWithRecommendations,
      if (itemExplorationConfig != null)
        'itemExplorationConfig': itemExplorationConfig,
      if (syncWithLatestSolutionVersion != null)
        'syncWithLatestSolutionVersion': syncWithLatestSolutionVersion,
    };
  }
}

/// Provides a summary of the properties of a campaign. For a complete listing,
/// call the <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeCampaign.html">DescribeCampaign</a>
/// API.
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
/// listing, call the <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeCampaign.html">DescribeCampaign</a>
/// API.
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

class CreateBatchSegmentJobResponse {
  /// The ARN of the batch segment job.
  final String? batchSegmentJobArn;

  CreateBatchSegmentJobResponse({
    this.batchSegmentJobArn,
  });

  factory CreateBatchSegmentJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateBatchSegmentJobResponse(
      batchSegmentJobArn: json['batchSegmentJobArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchSegmentJobArn = this.batchSegmentJobArn;
    return {
      if (batchSegmentJobArn != null) 'batchSegmentJobArn': batchSegmentJobArn,
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

class CreateDataDeletionJobResponse {
  /// The Amazon Resource Name (ARN) of the data deletion job.
  final String? dataDeletionJobArn;

  CreateDataDeletionJobResponse({
    this.dataDeletionJobArn,
  });

  factory CreateDataDeletionJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateDataDeletionJobResponse(
      dataDeletionJobArn: json['dataDeletionJobArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataDeletionJobArn = this.dataDeletionJobArn;
    return {
      if (dataDeletionJobArn != null) 'dataDeletionJobArn': dataDeletionJobArn,
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

  /// The domain for the new Domain dataset group.
  final Domain? domain;

  CreateDatasetGroupResponse({
    this.datasetGroupArn,
    this.domain,
  });

  factory CreateDatasetGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateDatasetGroupResponse(
      datasetGroupArn: json['datasetGroupArn'] as String?,
      domain: (json['domain'] as String?)?.toDomain(),
    );
  }

  Map<String, dynamic> toJson() {
    final datasetGroupArn = this.datasetGroupArn;
    final domain = this.domain;
    return {
      if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
      if (domain != null) 'domain': domain.toValue(),
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

class CreateMetricAttributionResponse {
  /// The Amazon Resource Name (ARN) for the new metric attribution.
  final String? metricAttributionArn;

  CreateMetricAttributionResponse({
    this.metricAttributionArn,
  });

  factory CreateMetricAttributionResponse.fromJson(Map<String, dynamic> json) {
    return CreateMetricAttributionResponse(
      metricAttributionArn: json['metricAttributionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricAttributionArn = this.metricAttributionArn;
    return {
      if (metricAttributionArn != null)
        'metricAttributionArn': metricAttributionArn,
    };
  }
}

class CreateRecommenderResponse {
  /// The Amazon Resource Name (ARN) of the recommender.
  final String? recommenderArn;

  CreateRecommenderResponse({
    this.recommenderArn,
  });

  factory CreateRecommenderResponse.fromJson(Map<String, dynamic> json) {
    return CreateRecommenderResponse(
      recommenderArn: json['recommenderArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recommenderArn = this.recommenderArn;
    return {
      if (recommenderArn != null) 'recommenderArn': recommenderArn,
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

/// Describes a job that deletes all references to specific users from an Amazon
/// Personalize dataset group in batches. For information about creating a data
/// deletion job, see <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/delete-records.html">Deleting
/// users</a>.
class DataDeletionJob {
  /// The creation date and time (in Unix time) of the data deletion job.
  final DateTime? creationDateTime;

  /// The Amazon Resource Name (ARN) of the data deletion job.
  final String? dataDeletionJobArn;
  final DataSource? dataSource;

  /// The Amazon Resource Name (ARN) of the dataset group the job deletes records
  /// from.
  final String? datasetGroupArn;

  /// If a data deletion job fails, provides the reason why.
  final String? failureReason;

  /// The name of the data deletion job.
  final String? jobName;

  /// The date and time (in Unix time) the data deletion job was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The number of records deleted by a COMPLETED job.
  final int? numDeleted;

  /// The Amazon Resource Name (ARN) of the IAM role that has permissions to read
  /// from the Amazon S3 data source.
  final String? roleArn;

  /// The status of the data deletion job.
  ///
  /// A data deletion job can have one of the following statuses:
  ///
  /// <ul>
  /// <li>
  /// PENDING &gt; IN_PROGRESS &gt; COMPLETED -or- FAILED
  /// </li>
  /// </ul>
  final String? status;

  DataDeletionJob({
    this.creationDateTime,
    this.dataDeletionJobArn,
    this.dataSource,
    this.datasetGroupArn,
    this.failureReason,
    this.jobName,
    this.lastUpdatedDateTime,
    this.numDeleted,
    this.roleArn,
    this.status,
  });

  factory DataDeletionJob.fromJson(Map<String, dynamic> json) {
    return DataDeletionJob(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      dataDeletionJobArn: json['dataDeletionJobArn'] as String?,
      dataSource: json['dataSource'] != null
          ? DataSource.fromJson(json['dataSource'] as Map<String, dynamic>)
          : null,
      datasetGroupArn: json['datasetGroupArn'] as String?,
      failureReason: json['failureReason'] as String?,
      jobName: json['jobName'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      numDeleted: json['numDeleted'] as int?,
      roleArn: json['roleArn'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final dataDeletionJobArn = this.dataDeletionJobArn;
    final dataSource = this.dataSource;
    final datasetGroupArn = this.datasetGroupArn;
    final failureReason = this.failureReason;
    final jobName = this.jobName;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final numDeleted = this.numDeleted;
    final roleArn = this.roleArn;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (dataDeletionJobArn != null) 'dataDeletionJobArn': dataDeletionJobArn,
      if (dataSource != null) 'dataSource': dataSource,
      if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
      if (failureReason != null) 'failureReason': failureReason,
      if (jobName != null) 'jobName': jobName,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (numDeleted != null) 'numDeleted': numDeleted,
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status,
    };
  }
}

/// Provides a summary of the properties of a data deletion job. For a complete
/// listing, call the <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDataDeletionJob.html">DescribeDataDeletionJob</a>
/// API operation.
class DataDeletionJobSummary {
  /// The creation date and time (in Unix time) of the data deletion job.
  final DateTime? creationDateTime;

  /// The Amazon Resource Name (ARN) of the data deletion job.
  final String? dataDeletionJobArn;

  /// The Amazon Resource Name (ARN) of the dataset group the job deleted records
  /// from.
  final String? datasetGroupArn;

  /// If a data deletion job fails, provides the reason why.
  final String? failureReason;

  /// The name of the data deletion job.
  final String? jobName;

  /// The date and time (in Unix time) the data deletion job was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The status of the data deletion job.
  ///
  /// A data deletion job can have one of the following statuses:
  ///
  /// <ul>
  /// <li>
  /// PENDING &gt; IN_PROGRESS &gt; COMPLETED -or- FAILED
  /// </li>
  /// </ul>
  final String? status;

  DataDeletionJobSummary({
    this.creationDateTime,
    this.dataDeletionJobArn,
    this.datasetGroupArn,
    this.failureReason,
    this.jobName,
    this.lastUpdatedDateTime,
    this.status,
  });

  factory DataDeletionJobSummary.fromJson(Map<String, dynamic> json) {
    return DataDeletionJobSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      dataDeletionJobArn: json['dataDeletionJobArn'] as String?,
      datasetGroupArn: json['datasetGroupArn'] as String?,
      failureReason: json['failureReason'] as String?,
      jobName: json['jobName'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final dataDeletionJobArn = this.dataDeletionJobArn;
    final datasetGroupArn = this.datasetGroupArn;
    final failureReason = this.failureReason;
    final jobName = this.jobName;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (dataDeletionJobArn != null) 'dataDeletionJobArn': dataDeletionJobArn,
      if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
      if (failureReason != null) 'failureReason': failureReason,
      if (jobName != null) 'jobName': jobName,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (status != null) 'status': status,
    };
  }
}

/// Describes the data source that contains the data to upload to a dataset, or
/// the list of records to delete from Amazon Personalize.
class DataSource {
  /// For dataset import jobs, the path to the Amazon S3 bucket where the data
  /// that you want to upload to your dataset is stored. For data deletion jobs,
  /// the path to the Amazon S3 bucket that stores the list of records to delete.
  ///
  /// For example:
  ///
  /// <code>s3://bucket-name/folder-name/fileName.csv</code>
  ///
  /// If your CSV files are in a folder in your Amazon S3 bucket and you want your
  /// import job or data deletion job to consider multiple files, you can specify
  /// the path to the folder. With a data deletion job, Amazon Personalize uses
  /// all files in the folder and any sub folder. Use the following syntax with a
  /// <code>/</code> after the folder name:
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
  /// <li>
  /// Actions
  /// </li>
  /// <li>
  /// Action_Interactions
  /// </li>
  /// </ul>
  final String? datasetType;

  /// A time stamp that shows when the dataset was updated.
  final DateTime? lastUpdatedDateTime;

  /// Describes the latest update to the dataset.
  final DatasetUpdateSummary? latestDatasetUpdate;

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

  /// The ID of the event tracker for an Action interactions dataset. You specify
  /// the tracker's ID in the <code>PutActionInteractions</code> API operation.
  /// Amazon Personalize uses it to direct new data to the Action interactions
  /// dataset in your dataset group.
  final String? trackingId;

  Dataset({
    this.creationDateTime,
    this.datasetArn,
    this.datasetGroupArn,
    this.datasetType,
    this.lastUpdatedDateTime,
    this.latestDatasetUpdate,
    this.name,
    this.schemaArn,
    this.status,
    this.trackingId,
  });

  factory Dataset.fromJson(Map<String, dynamic> json) {
    return Dataset(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      datasetArn: json['datasetArn'] as String?,
      datasetGroupArn: json['datasetGroupArn'] as String?,
      datasetType: json['datasetType'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      latestDatasetUpdate: json['latestDatasetUpdate'] != null
          ? DatasetUpdateSummary.fromJson(
              json['latestDatasetUpdate'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      schemaArn: json['schemaArn'] as String?,
      status: json['status'] as String?,
      trackingId: json['trackingId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final datasetArn = this.datasetArn;
    final datasetGroupArn = this.datasetGroupArn;
    final datasetType = this.datasetType;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final latestDatasetUpdate = this.latestDatasetUpdate;
    final name = this.name;
    final schemaArn = this.schemaArn;
    final status = this.status;
    final trackingId = this.trackingId;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (datasetArn != null) 'datasetArn': datasetArn,
      if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
      if (datasetType != null) 'datasetType': datasetType,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (latestDatasetUpdate != null)
        'latestDatasetUpdate': latestDatasetUpdate,
      if (name != null) 'name': name,
      if (schemaArn != null) 'schemaArn': schemaArn,
      if (status != null) 'status': status,
      if (trackingId != null) 'trackingId': trackingId,
    };
  }
}

/// Describes a job that exports a dataset to an Amazon S3 bucket. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetExportJob.html">CreateDatasetExportJob</a>.
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

  /// The Amazon Resource Name (ARN) of the IAM service role that has permissions
  /// to add data to your output Amazon S3 bucket.
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
/// listing, call the <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetExportJob.html">DescribeDatasetExportJob</a>
/// API.
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

/// A dataset group is a collection of related datasets (Item interactions,
/// Users, Items, Actions, Action interactions). You create a dataset group by
/// calling <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetGroup.html">CreateDatasetGroup</a>.
/// You then create a dataset and add it to a dataset group by calling <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html">CreateDataset</a>.
/// The dataset group is used to create and train a solution by calling <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html">CreateSolution</a>.
/// A dataset group can contain only one of each type of dataset.
///
/// You can specify an Key Management Service (KMS) key to encrypt the datasets
/// in the group.
class DatasetGroup {
  /// The creation date and time (in Unix time) of the dataset group.
  final DateTime? creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset group.
  final String? datasetGroupArn;

  /// The domain of a Domain dataset group.
  final Domain? domain;

  /// If creating a dataset group fails, provides the reason why.
  final String? failureReason;

  /// The Amazon Resource Name (ARN) of the Key Management Service (KMS) key used
  /// to encrypt the datasets.
  final String? kmsKeyArn;

  /// The last update date and time (in Unix time) of the dataset group.
  final DateTime? lastUpdatedDateTime;

  /// The name of the dataset group.
  final String? name;

  /// The ARN of the Identity and Access Management (IAM) role that has
  /// permissions to access the Key Management Service (KMS) key. Supplying an IAM
  /// role is only valid when also specifying a KMS key.
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
    this.domain,
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
      domain: (json['domain'] as String?)?.toDomain(),
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
    final domain = this.domain;
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
      if (domain != null) 'domain': domain.toValue(),
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
/// listing, call the <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetGroup.html">DescribeDatasetGroup</a>
/// API.
class DatasetGroupSummary {
  /// The date and time (in Unix time) that the dataset group was created.
  final DateTime? creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset group.
  final String? datasetGroupArn;

  /// The domain of a Domain dataset group.
  final Domain? domain;

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
    this.domain,
    this.failureReason,
    this.lastUpdatedDateTime,
    this.name,
    this.status,
  });

  factory DatasetGroupSummary.fromJson(Map<String, dynamic> json) {
    return DatasetGroupSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      datasetGroupArn: json['datasetGroupArn'] as String?,
      domain: (json['domain'] as String?)?.toDomain(),
      failureReason: json['failureReason'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final datasetGroupArn = this.datasetGroupArn;
    final domain = this.domain;
    final failureReason = this.failureReason;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
      if (domain != null) 'domain': domain.toValue(),
      if (failureReason != null) 'failureReason': failureReason,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (status != null) 'status': status,
    };
  }
}

/// Describes a job that imports training data from a data source (Amazon S3
/// bucket) to an Amazon Personalize dataset. For more information, see <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetImportJob.html">CreateDatasetImportJob</a>.
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

  /// The import mode used by the dataset import job to import new records.
  final ImportMode? importMode;

  /// The name of the import job.
  final String? jobName;

  /// The date and time (in Unix time) the dataset was last updated.
  final DateTime? lastUpdatedDateTime;

  /// Whether the job publishes metrics to Amazon S3 for a metric attribution.
  final bool? publishAttributionMetricsToS3;

  /// The ARN of the IAM role that has permissions to read from the Amazon S3 data
  /// source.
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
    this.importMode,
    this.jobName,
    this.lastUpdatedDateTime,
    this.publishAttributionMetricsToS3,
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
      importMode: (json['importMode'] as String?)?.toImportMode(),
      jobName: json['jobName'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      publishAttributionMetricsToS3:
          json['publishAttributionMetricsToS3'] as bool?,
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
    final importMode = this.importMode;
    final jobName = this.jobName;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final publishAttributionMetricsToS3 = this.publishAttributionMetricsToS3;
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
      if (importMode != null) 'importMode': importMode.toValue(),
      if (jobName != null) 'jobName': jobName,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (publishAttributionMetricsToS3 != null)
        'publishAttributionMetricsToS3': publishAttributionMetricsToS3,
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status,
    };
  }
}

/// Provides a summary of the properties of a dataset import job. For a complete
/// listing, call the <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetImportJob.html">DescribeDatasetImportJob</a>
/// API.
class DatasetImportJobSummary {
  /// The date and time (in Unix time) that the dataset import job was created.
  final DateTime? creationDateTime;

  /// The Amazon Resource Name (ARN) of the dataset import job.
  final String? datasetImportJobArn;

  /// If a dataset import job fails, the reason behind the failure.
  final String? failureReason;

  /// The import mode the dataset import job used to update the data in the
  /// dataset. For more information see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/updating-existing-bulk-data.html">Updating
  /// existing bulk data</a>.
  final ImportMode? importMode;

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
    this.importMode,
    this.jobName,
    this.lastUpdatedDateTime,
    this.status,
  });

  factory DatasetImportJobSummary.fromJson(Map<String, dynamic> json) {
    return DatasetImportJobSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      datasetImportJobArn: json['datasetImportJobArn'] as String?,
      failureReason: json['failureReason'] as String?,
      importMode: (json['importMode'] as String?)?.toImportMode(),
      jobName: json['jobName'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final datasetImportJobArn = this.datasetImportJobArn;
    final failureReason = this.failureReason;
    final importMode = this.importMode;
    final jobName = this.jobName;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (datasetImportJobArn != null)
        'datasetImportJobArn': datasetImportJobArn,
      if (failureReason != null) 'failureReason': failureReason,
      if (importMode != null) 'importMode': importMode.toValue(),
      if (jobName != null) 'jobName': jobName,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (status != null) 'status': status,
    };
  }
}

/// Describes the schema for a dataset. For more information on schemas, see <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSchema.html">CreateSchema</a>.
class DatasetSchema {
  /// The date and time (in Unix time) that the schema was created.
  final DateTime? creationDateTime;

  /// The domain of a schema that you created for a dataset in a Domain dataset
  /// group.
  final Domain? domain;

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
    this.domain,
    this.lastUpdatedDateTime,
    this.name,
    this.schema,
    this.schemaArn,
  });

  factory DatasetSchema.fromJson(Map<String, dynamic> json) {
    return DatasetSchema(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      domain: (json['domain'] as String?)?.toDomain(),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      schema: json['schema'] as String?,
      schemaArn: json['schemaArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final domain = this.domain;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final schema = this.schema;
    final schemaArn = this.schemaArn;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (domain != null) 'domain': domain.toValue(),
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (schema != null) 'schema': schema,
      if (schemaArn != null) 'schemaArn': schemaArn,
    };
  }
}

/// Provides a summary of the properties of a dataset schema. For a complete
/// listing, call the <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSchema.html">DescribeSchema</a>
/// API.
class DatasetSchemaSummary {
  /// The date and time (in Unix time) that the schema was created.
  final DateTime? creationDateTime;

  /// The domain of a schema that you created for a dataset in a Domain dataset
  /// group.
  final Domain? domain;

  /// The date and time (in Unix time) that the schema was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The name of the schema.
  final String? name;

  /// The Amazon Resource Name (ARN) of the schema.
  final String? schemaArn;

  DatasetSchemaSummary({
    this.creationDateTime,
    this.domain,
    this.lastUpdatedDateTime,
    this.name,
    this.schemaArn,
  });

  factory DatasetSchemaSummary.fromJson(Map<String, dynamic> json) {
    return DatasetSchemaSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      domain: (json['domain'] as String?)?.toDomain(),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      schemaArn: json['schemaArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final domain = this.domain;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final schemaArn = this.schemaArn;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (domain != null) 'domain': domain.toValue(),
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (schemaArn != null) 'schemaArn': schemaArn,
    };
  }
}

/// Provides a summary of the properties of a dataset. For a complete listing,
/// call the <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDataset.html">DescribeDataset</a>
/// API.
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

/// Describes an update to a dataset.
class DatasetUpdateSummary {
  /// The creation date and time (in Unix time) of the dataset update.
  final DateTime? creationDateTime;

  /// If updating a dataset fails, provides the reason why.
  final String? failureReason;

  /// The last update date and time (in Unix time) of the dataset.
  final DateTime? lastUpdatedDateTime;

  /// The Amazon Resource Name (ARN) of the schema that replaced the previous
  /// schema of the dataset.
  final String? schemaArn;

  /// The status of the dataset update.
  final String? status;

  DatasetUpdateSummary({
    this.creationDateTime,
    this.failureReason,
    this.lastUpdatedDateTime,
    this.schemaArn,
    this.status,
  });

  factory DatasetUpdateSummary.fromJson(Map<String, dynamic> json) {
    return DatasetUpdateSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      failureReason: json['failureReason'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      schemaArn: json['schemaArn'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final failureReason = this.failureReason;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final schemaArn = this.schemaArn;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (failureReason != null) 'failureReason': failureReason,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (schemaArn != null) 'schemaArn': schemaArn,
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

class DescribeBatchSegmentJobResponse {
  /// Information on the specified batch segment job.
  final BatchSegmentJob? batchSegmentJob;

  DescribeBatchSegmentJobResponse({
    this.batchSegmentJob,
  });

  factory DescribeBatchSegmentJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeBatchSegmentJobResponse(
      batchSegmentJob: json['batchSegmentJob'] != null
          ? BatchSegmentJob.fromJson(
              json['batchSegmentJob'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final batchSegmentJob = this.batchSegmentJob;
    return {
      if (batchSegmentJob != null) 'batchSegmentJob': batchSegmentJob,
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

class DescribeDataDeletionJobResponse {
  /// Information about the data deletion job, including the status.
  ///
  /// The status is one of the following values:
  ///
  /// <ul>
  /// <li>
  /// PENDING
  /// </li>
  /// <li>
  /// IN_PROGRESS
  /// </li>
  /// <li>
  /// COMPLETED
  /// </li>
  /// <li>
  /// FAILED
  /// </li>
  /// </ul>
  final DataDeletionJob? dataDeletionJob;

  DescribeDataDeletionJobResponse({
    this.dataDeletionJob,
  });

  factory DescribeDataDeletionJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDataDeletionJobResponse(
      dataDeletionJob: json['dataDeletionJob'] != null
          ? DataDeletionJob.fromJson(
              json['dataDeletionJob'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataDeletionJob = this.dataDeletionJob;
    return {
      if (dataDeletionJob != null) 'dataDeletionJob': dataDeletionJob,
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

class DescribeMetricAttributionResponse {
  /// The details of the metric attribution.
  final MetricAttribution? metricAttribution;

  DescribeMetricAttributionResponse({
    this.metricAttribution,
  });

  factory DescribeMetricAttributionResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeMetricAttributionResponse(
      metricAttribution: json['metricAttribution'] != null
          ? MetricAttribution.fromJson(
              json['metricAttribution'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final metricAttribution = this.metricAttribution;
    return {
      if (metricAttribution != null) 'metricAttribution': metricAttribution,
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

class DescribeRecommenderResponse {
  /// The properties of the recommender.
  final Recommender? recommender;

  DescribeRecommenderResponse({
    this.recommender,
  });

  factory DescribeRecommenderResponse.fromJson(Map<String, dynamic> json) {
    return DescribeRecommenderResponse(
      recommender: json['recommender'] != null
          ? Recommender.fromJson(json['recommender'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final recommender = this.recommender;
    return {
      if (recommender != null) 'recommender': recommender,
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

enum Domain {
  ecommerce,
  videoOnDemand,
}

extension DomainValueExtension on Domain {
  String toValue() {
    switch (this) {
      case Domain.ecommerce:
        return 'ECOMMERCE';
      case Domain.videoOnDemand:
        return 'VIDEO_ON_DEMAND';
    }
  }
}

extension DomainFromString on String {
  Domain toDomain() {
    switch (this) {
      case 'ECOMMERCE':
        return Domain.ecommerce;
      case 'VIDEO_ON_DEMAND':
        return Domain.videoOnDemand;
    }
    throw Exception('$this is not known in enum Domain');
  }
}

/// Provides information about an event tracker.
class EventTracker {
  /// The Amazon Web Services account that owns the event tracker.
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
/// listing, call the <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeEventTracker.html">DescribeEventTracker</a>
/// API.
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

/// A string to string map of the configuration details for theme generation.
class FieldsForThemeGeneration {
  /// The name of the Items dataset column that stores the name of each item in
  /// the dataset.
  final String itemName;

  FieldsForThemeGeneration({
    required this.itemName,
  });

  factory FieldsForThemeGeneration.fromJson(Map<String, dynamic> json) {
    return FieldsForThemeGeneration(
      itemName: json['itemName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final itemName = this.itemName;
    return {
      'itemName': itemName,
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
  /// information about filter expression structure and syntax, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/filter-expressions.html">Filter
  /// expressions</a>.
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
  /// The metrics for the solution version. For more information, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/working-with-training-metrics.html">
  /// Evaluating a solution version with metrics </a>.
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

enum ImportMode {
  full,
  incremental,
}

extension ImportModeValueExtension on ImportMode {
  String toValue() {
    switch (this) {
      case ImportMode.full:
        return 'FULL';
      case ImportMode.incremental:
        return 'INCREMENTAL';
    }
  }
}

extension ImportModeFromString on String {
  ImportMode toImportMode() {
    switch (this) {
      case 'FULL':
        return ImportMode.full;
      case 'INCREMENTAL':
        return ImportMode.incremental;
    }
    throw Exception('$this is not known in enum ImportMode');
  }
}

enum IngestionMode {
  bulk,
  put,
  all,
}

extension IngestionModeValueExtension on IngestionMode {
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

extension IngestionModeFromString on String {
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

class ListBatchSegmentJobsResponse {
  /// A list containing information on each job that is returned.
  final List<BatchSegmentJobSummary>? batchSegmentJobs;

  /// The token to use to retrieve the next page of results. The value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListBatchSegmentJobsResponse({
    this.batchSegmentJobs,
    this.nextToken,
  });

  factory ListBatchSegmentJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListBatchSegmentJobsResponse(
      batchSegmentJobs: (json['batchSegmentJobs'] as List?)
          ?.whereNotNull()
          .map(
              (e) => BatchSegmentJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchSegmentJobs = this.batchSegmentJobs;
    final nextToken = this.nextToken;
    return {
      if (batchSegmentJobs != null) 'batchSegmentJobs': batchSegmentJobs,
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

class ListDataDeletionJobsResponse {
  /// The list of data deletion jobs.
  final List<DataDeletionJobSummary>? dataDeletionJobs;

  /// A token for getting the next set of data deletion jobs (if they exist).
  final String? nextToken;

  ListDataDeletionJobsResponse({
    this.dataDeletionJobs,
    this.nextToken,
  });

  factory ListDataDeletionJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListDataDeletionJobsResponse(
      dataDeletionJobs: (json['dataDeletionJobs'] as List?)
          ?.whereNotNull()
          .map(
              (e) => DataDeletionJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataDeletionJobs = this.dataDeletionJobs;
    final nextToken = this.nextToken;
    return {
      if (dataDeletionJobs != null) 'dataDeletionJobs': dataDeletionJobs,
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

class ListMetricAttributionMetricsResponse {
  /// The metrics for the specified metric attribution.
  final List<MetricAttribute>? metrics;

  /// Specify the pagination token from a previous
  /// <code>ListMetricAttributionMetricsResponse</code> request to retrieve the
  /// next page of results.
  final String? nextToken;

  ListMetricAttributionMetricsResponse({
    this.metrics,
    this.nextToken,
  });

  factory ListMetricAttributionMetricsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListMetricAttributionMetricsResponse(
      metrics: (json['metrics'] as List?)
          ?.whereNotNull()
          .map((e) => MetricAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metrics = this.metrics;
    final nextToken = this.nextToken;
    return {
      if (metrics != null) 'metrics': metrics,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListMetricAttributionsResponse {
  /// The list of metric attributions.
  final List<MetricAttributionSummary>? metricAttributions;

  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  final String? nextToken;

  ListMetricAttributionsResponse({
    this.metricAttributions,
    this.nextToken,
  });

  factory ListMetricAttributionsResponse.fromJson(Map<String, dynamic> json) {
    return ListMetricAttributionsResponse(
      metricAttributions: (json['metricAttributions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              MetricAttributionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricAttributions = this.metricAttributions;
    final nextToken = this.nextToken;
    return {
      if (metricAttributions != null) 'metricAttributions': metricAttributions,
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

class ListRecommendersResponse {
  /// A token for getting the next set of recommenders (if they exist).
  final String? nextToken;

  /// A list of the recommenders.
  final List<RecommenderSummary>? recommenders;

  ListRecommendersResponse({
    this.nextToken,
    this.recommenders,
  });

  factory ListRecommendersResponse.fromJson(Map<String, dynamic> json) {
    return ListRecommendersResponse(
      nextToken: json['nextToken'] as String?,
      recommenders: (json['recommenders'] as List?)
          ?.whereNotNull()
          .map((e) => RecommenderSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final recommenders = this.recommenders;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (recommenders != null) 'recommenders': recommenders,
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

class ListTagsForResourceResponse {
  /// The resource's tags.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

/// Contains information on a metric that a metric attribution reports on. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/measuring-recommendation-impact.html">Measuring
/// impact of recommendations</a>.
class MetricAttribute {
  /// The metric's event type.
  final String eventType;

  /// The attribute's expression. Available functions are <code>SUM()</code> or
  /// <code>SAMPLECOUNT()</code>. For SUM() functions, provide the dataset type
  /// (either Interactions or Items) and column to sum as a parameter. For example
  /// SUM(Items.PRICE).
  final String expression;

  /// The metric's name. The name helps you identify the metric in Amazon
  /// CloudWatch or Amazon S3.
  final String metricName;

  MetricAttribute({
    required this.eventType,
    required this.expression,
    required this.metricName,
  });

  factory MetricAttribute.fromJson(Map<String, dynamic> json) {
    return MetricAttribute(
      eventType: json['eventType'] as String,
      expression: json['expression'] as String,
      metricName: json['metricName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final eventType = this.eventType;
    final expression = this.expression;
    final metricName = this.metricName;
    return {
      'eventType': eventType,
      'expression': expression,
      'metricName': metricName,
    };
  }
}

/// Contains information on a metric attribution. A metric attribution creates
/// reports on the data that you import into Amazon Personalize. Depending on
/// how you import the data, you can view reports in Amazon CloudWatch or Amazon
/// S3. For more information, see <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/measuring-recommendation-impact.html">Measuring
/// impact of recommendations</a>.
class MetricAttribution {
  /// The metric attribution's creation date time.
  final DateTime? creationDateTime;

  /// The metric attribution's dataset group Amazon Resource Name (ARN).
  final String? datasetGroupArn;

  /// The metric attribution's failure reason.
  final String? failureReason;

  /// The metric attribution's last updated date time.
  final DateTime? lastUpdatedDateTime;

  /// The metric attribution's Amazon Resource Name (ARN).
  final String? metricAttributionArn;

  /// The metric attribution's output configuration.
  final MetricAttributionOutput? metricsOutputConfig;

  /// The metric attribution's name.
  final String? name;

  /// The metric attribution's status.
  final String? status;

  MetricAttribution({
    this.creationDateTime,
    this.datasetGroupArn,
    this.failureReason,
    this.lastUpdatedDateTime,
    this.metricAttributionArn,
    this.metricsOutputConfig,
    this.name,
    this.status,
  });

  factory MetricAttribution.fromJson(Map<String, dynamic> json) {
    return MetricAttribution(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      datasetGroupArn: json['datasetGroupArn'] as String?,
      failureReason: json['failureReason'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      metricAttributionArn: json['metricAttributionArn'] as String?,
      metricsOutputConfig: json['metricsOutputConfig'] != null
          ? MetricAttributionOutput.fromJson(
              json['metricsOutputConfig'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final datasetGroupArn = this.datasetGroupArn;
    final failureReason = this.failureReason;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final metricAttributionArn = this.metricAttributionArn;
    final metricsOutputConfig = this.metricsOutputConfig;
    final name = this.name;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
      if (failureReason != null) 'failureReason': failureReason,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (metricAttributionArn != null)
        'metricAttributionArn': metricAttributionArn,
      if (metricsOutputConfig != null)
        'metricsOutputConfig': metricsOutputConfig,
      if (name != null) 'name': name,
      if (status != null) 'status': status,
    };
  }
}

/// The output configuration details for a metric attribution.
class MetricAttributionOutput {
  /// The Amazon Resource Name (ARN) of the IAM service role that has permissions
  /// to add data to your output Amazon S3 bucket and add metrics to Amazon
  /// CloudWatch. For more information, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/measuring-recommendation-impact.html">Measuring
  /// impact of recommendations</a>.
  final String roleArn;
  final S3DataConfig? s3DataDestination;

  MetricAttributionOutput({
    required this.roleArn,
    this.s3DataDestination,
  });

  factory MetricAttributionOutput.fromJson(Map<String, dynamic> json) {
    return MetricAttributionOutput(
      roleArn: json['roleArn'] as String,
      s3DataDestination: json['s3DataDestination'] != null
          ? S3DataConfig.fromJson(
              json['s3DataDestination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final s3DataDestination = this.s3DataDestination;
    return {
      'roleArn': roleArn,
      if (s3DataDestination != null) 's3DataDestination': s3DataDestination,
    };
  }
}

/// Provides a summary of the properties of a metric attribution. For a complete
/// listing, call the <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeMetricAttribution.html">DescribeMetricAttribution</a>.
class MetricAttributionSummary {
  /// The metric attribution's creation date time.
  final DateTime? creationDateTime;

  /// The metric attribution's failure reason.
  final String? failureReason;

  /// The metric attribution's last updated date time.
  final DateTime? lastUpdatedDateTime;

  /// The metric attribution's Amazon Resource Name (ARN).
  final String? metricAttributionArn;

  /// The name of the metric attribution.
  final String? name;

  /// The metric attribution's status.
  final String? status;

  MetricAttributionSummary({
    this.creationDateTime,
    this.failureReason,
    this.lastUpdatedDateTime,
    this.metricAttributionArn,
    this.name,
    this.status,
  });

  factory MetricAttributionSummary.fromJson(Map<String, dynamic> json) {
    return MetricAttributionSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      failureReason: json['failureReason'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      metricAttributionArn: json['metricAttributionArn'] as String?,
      name: json['name'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final failureReason = this.failureReason;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final metricAttributionArn = this.metricAttributionArn;
    final name = this.name;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (failureReason != null) 'failureReason': failureReason,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (metricAttributionArn != null)
        'metricAttributionArn': metricAttributionArn,
      if (name != null) 'name': name,
      if (status != null) 'status': status,
    };
  }
}

enum ObjectiveSensitivity {
  low,
  medium,
  high,
  off,
}

extension ObjectiveSensitivityValueExtension on ObjectiveSensitivity {
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

extension ObjectiveSensitivityFromString on String {
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
/// Amazon Personalize uses in model training when you use the <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html">CreateSolution</a>
/// operation.
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

extension RecipeProviderValueExtension on RecipeProvider {
  String toValue() {
    switch (this) {
      case RecipeProvider.service:
        return 'SERVICE';
    }
  }
}

extension RecipeProviderFromString on String {
  RecipeProvider toRecipeProvider() {
    switch (this) {
      case 'SERVICE':
        return RecipeProvider.service;
    }
    throw Exception('$this is not known in enum RecipeProvider');
  }
}

/// Provides a summary of the properties of a recipe. For a complete listing,
/// call the <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeRecipe.html">DescribeRecipe</a>
/// API.
class RecipeSummary {
  /// The date and time (in Unix time) that the recipe was created.
  final DateTime? creationDateTime;

  /// The domain of the recipe (if the recipe is a Domain dataset group use case).
  final Domain? domain;

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
    this.domain,
    this.lastUpdatedDateTime,
    this.name,
    this.recipeArn,
    this.status,
  });

  factory RecipeSummary.fromJson(Map<String, dynamic> json) {
    return RecipeSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      domain: (json['domain'] as String?)?.toDomain(),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      recipeArn: json['recipeArn'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final domain = this.domain;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final recipeArn = this.recipeArn;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (domain != null) 'domain': domain.toValue(),
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (recipeArn != null) 'recipeArn': recipeArn,
      if (status != null) 'status': status,
    };
  }
}

/// Describes a recommendation generator for a Domain dataset group. You create
/// a recommender in a Domain dataset group for a specific domain use case
/// (domain recipe), and specify the recommender in a <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html">GetRecommendations</a>
/// request.
class Recommender {
  /// The date and time (in Unix format) that the recommender was created.
  final DateTime? creationDateTime;

  /// The Amazon Resource Name (ARN) of the Domain dataset group that contains the
  /// recommender.
  final String? datasetGroupArn;

  /// If a recommender fails, the reason behind the failure.
  final String? failureReason;

  /// The date and time (in Unix format) that the recommender was last updated.
  final DateTime? lastUpdatedDateTime;

  /// Provides a summary of the latest updates to the recommender.
  final RecommenderUpdateSummary? latestRecommenderUpdate;

  /// Provides evaluation metrics that help you determine the performance of a
  /// recommender. For more information, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/evaluating-recommenders.html">
  /// Evaluating a recommender</a>.
  final Map<String, double>? modelMetrics;

  /// The name of the recommender.
  final String? name;

  /// The Amazon Resource Name (ARN) of the recipe (Domain dataset group use case)
  /// that the recommender was created for.
  final String? recipeArn;

  /// The Amazon Resource Name (ARN) of the recommender.
  final String? recommenderArn;

  /// The configuration details of the recommender.
  final RecommenderConfig? recommenderConfig;

  /// The status of the recommender.
  ///
  /// A recommender can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// STOP PENDING &gt; STOP IN_PROGRESS &gt; INACTIVE &gt; START PENDING &gt;
  /// START IN_PROGRESS &gt; ACTIVE
  /// </li>
  /// <li>
  /// DELETE PENDING &gt; DELETE IN_PROGRESS
  /// </li>
  /// </ul>
  final String? status;

  Recommender({
    this.creationDateTime,
    this.datasetGroupArn,
    this.failureReason,
    this.lastUpdatedDateTime,
    this.latestRecommenderUpdate,
    this.modelMetrics,
    this.name,
    this.recipeArn,
    this.recommenderArn,
    this.recommenderConfig,
    this.status,
  });

  factory Recommender.fromJson(Map<String, dynamic> json) {
    return Recommender(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      datasetGroupArn: json['datasetGroupArn'] as String?,
      failureReason: json['failureReason'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      latestRecommenderUpdate: json['latestRecommenderUpdate'] != null
          ? RecommenderUpdateSummary.fromJson(
              json['latestRecommenderUpdate'] as Map<String, dynamic>)
          : null,
      modelMetrics: (json['modelMetrics'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as double)),
      name: json['name'] as String?,
      recipeArn: json['recipeArn'] as String?,
      recommenderArn: json['recommenderArn'] as String?,
      recommenderConfig: json['recommenderConfig'] != null
          ? RecommenderConfig.fromJson(
              json['recommenderConfig'] as Map<String, dynamic>)
          : null,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final datasetGroupArn = this.datasetGroupArn;
    final failureReason = this.failureReason;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final latestRecommenderUpdate = this.latestRecommenderUpdate;
    final modelMetrics = this.modelMetrics;
    final name = this.name;
    final recipeArn = this.recipeArn;
    final recommenderArn = this.recommenderArn;
    final recommenderConfig = this.recommenderConfig;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
      if (failureReason != null) 'failureReason': failureReason,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (latestRecommenderUpdate != null)
        'latestRecommenderUpdate': latestRecommenderUpdate,
      if (modelMetrics != null) 'modelMetrics': modelMetrics,
      if (name != null) 'name': name,
      if (recipeArn != null) 'recipeArn': recipeArn,
      if (recommenderArn != null) 'recommenderArn': recommenderArn,
      if (recommenderConfig != null) 'recommenderConfig': recommenderConfig,
      if (status != null) 'status': status,
    };
  }
}

/// The configuration details of the recommender.
class RecommenderConfig {
  /// Whether metadata with recommendations is enabled for the recommender. If
  /// enabled, you can specify the columns from your Items dataset in your request
  /// for recommendations. Amazon Personalize returns this data for each item in
  /// the recommendation response. For information about enabling metadata for a
  /// recommender, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/creating-recommenders.html#create-recommender-return-metadata">Enabling
  /// metadata in recommendations for a recommender</a>.
  ///
  /// If you enable metadata in recommendations, you will incur additional costs.
  /// For more information, see <a
  /// href="https://aws.amazon.com/personalize/pricing/">Amazon Personalize
  /// pricing</a>.
  final bool? enableMetadataWithRecommendations;

  /// Specifies the exploration configuration hyperparameters, including
  /// <code>explorationWeight</code> and <code>explorationItemAgeCutOff</code>,
  /// you want to use to configure the amount of item exploration Amazon
  /// Personalize uses when recommending items. Provide
  /// <code>itemExplorationConfig</code> data only if your recommenders generate
  /// personalized recommendations for a user (not popular items or similar
  /// items).
  final Map<String, String>? itemExplorationConfig;

  /// Specifies the requested minimum provisioned recommendation requests per
  /// second that Amazon Personalize will support. A high
  /// <code>minRecommendationRequestsPerSecond</code> will increase your bill. We
  /// recommend starting with 1 for
  /// <code>minRecommendationRequestsPerSecond</code> (the default). Track your
  /// usage using Amazon CloudWatch metrics, and increase the
  /// <code>minRecommendationRequestsPerSecond</code> as necessary.
  final int? minRecommendationRequestsPerSecond;

  /// Specifies the training data configuration to use when creating a domain
  /// recommender.
  final TrainingDataConfig? trainingDataConfig;

  RecommenderConfig({
    this.enableMetadataWithRecommendations,
    this.itemExplorationConfig,
    this.minRecommendationRequestsPerSecond,
    this.trainingDataConfig,
  });

  factory RecommenderConfig.fromJson(Map<String, dynamic> json) {
    return RecommenderConfig(
      enableMetadataWithRecommendations:
          json['enableMetadataWithRecommendations'] as bool?,
      itemExplorationConfig:
          (json['itemExplorationConfig'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      minRecommendationRequestsPerSecond:
          json['minRecommendationRequestsPerSecond'] as int?,
      trainingDataConfig: json['trainingDataConfig'] != null
          ? TrainingDataConfig.fromJson(
              json['trainingDataConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final enableMetadataWithRecommendations =
        this.enableMetadataWithRecommendations;
    final itemExplorationConfig = this.itemExplorationConfig;
    final minRecommendationRequestsPerSecond =
        this.minRecommendationRequestsPerSecond;
    final trainingDataConfig = this.trainingDataConfig;
    return {
      if (enableMetadataWithRecommendations != null)
        'enableMetadataWithRecommendations': enableMetadataWithRecommendations,
      if (itemExplorationConfig != null)
        'itemExplorationConfig': itemExplorationConfig,
      if (minRecommendationRequestsPerSecond != null)
        'minRecommendationRequestsPerSecond':
            minRecommendationRequestsPerSecond,
      if (trainingDataConfig != null) 'trainingDataConfig': trainingDataConfig,
    };
  }
}

/// Provides a summary of the properties of the recommender.
class RecommenderSummary {
  /// The date and time (in Unix format) that the recommender was created.
  final DateTime? creationDateTime;

  /// The Amazon Resource Name (ARN) of the Domain dataset group that contains the
  /// recommender.
  final String? datasetGroupArn;

  /// The date and time (in Unix format) that the recommender was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The name of the recommender.
  final String? name;

  /// The Amazon Resource Name (ARN) of the recipe (Domain dataset group use case)
  /// that the recommender was created for.
  final String? recipeArn;

  /// The Amazon Resource Name (ARN) of the recommender.
  final String? recommenderArn;

  /// The configuration details of the recommender.
  final RecommenderConfig? recommenderConfig;

  /// The status of the recommender. A recommender can be in one of the following
  /// states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// STOP PENDING &gt; STOP IN_PROGRESS &gt; INACTIVE &gt; START PENDING &gt;
  /// START IN_PROGRESS &gt; ACTIVE
  /// </li>
  /// <li>
  /// DELETE PENDING &gt; DELETE IN_PROGRESS
  /// </li>
  /// </ul>
  final String? status;

  RecommenderSummary({
    this.creationDateTime,
    this.datasetGroupArn,
    this.lastUpdatedDateTime,
    this.name,
    this.recipeArn,
    this.recommenderArn,
    this.recommenderConfig,
    this.status,
  });

  factory RecommenderSummary.fromJson(Map<String, dynamic> json) {
    return RecommenderSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      datasetGroupArn: json['datasetGroupArn'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      recipeArn: json['recipeArn'] as String?,
      recommenderArn: json['recommenderArn'] as String?,
      recommenderConfig: json['recommenderConfig'] != null
          ? RecommenderConfig.fromJson(
              json['recommenderConfig'] as Map<String, dynamic>)
          : null,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final datasetGroupArn = this.datasetGroupArn;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final recipeArn = this.recipeArn;
    final recommenderArn = this.recommenderArn;
    final recommenderConfig = this.recommenderConfig;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (recipeArn != null) 'recipeArn': recipeArn,
      if (recommenderArn != null) 'recommenderArn': recommenderArn,
      if (recommenderConfig != null) 'recommenderConfig': recommenderConfig,
      if (status != null) 'status': status,
    };
  }
}

/// Provides a summary of the properties of a recommender update. For a complete
/// listing, call the <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeRecommender.html">DescribeRecommender</a>
/// API.
class RecommenderUpdateSummary {
  /// The date and time (in Unix format) that the recommender update was created.
  final DateTime? creationDateTime;

  /// If a recommender update fails, the reason behind the failure.
  final String? failureReason;

  /// The date and time (in Unix time) that the recommender update was last
  /// updated.
  final DateTime? lastUpdatedDateTime;

  /// The configuration details of the recommender update.
  final RecommenderConfig? recommenderConfig;

  /// The status of the recommender update.
  ///
  /// A recommender can be in one of the following states:
  ///
  /// <ul>
  /// <li>
  /// CREATE PENDING &gt; CREATE IN_PROGRESS &gt; ACTIVE -or- CREATE FAILED
  /// </li>
  /// <li>
  /// STOP PENDING &gt; STOP IN_PROGRESS &gt; INACTIVE &gt; START PENDING &gt;
  /// START IN_PROGRESS &gt; ACTIVE
  /// </li>
  /// <li>
  /// DELETE PENDING &gt; DELETE IN_PROGRESS
  /// </li>
  /// </ul>
  final String? status;

  RecommenderUpdateSummary({
    this.creationDateTime,
    this.failureReason,
    this.lastUpdatedDateTime,
    this.recommenderConfig,
    this.status,
  });

  factory RecommenderUpdateSummary.fromJson(Map<String, dynamic> json) {
    return RecommenderUpdateSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      failureReason: json['failureReason'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      recommenderConfig: json['recommenderConfig'] != null
          ? RecommenderConfig.fromJson(
              json['recommenderConfig'] as Map<String, dynamic>)
          : null,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final failureReason = this.failureReason;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final recommenderConfig = this.recommenderConfig;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (failureReason != null) 'failureReason': failureReason,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (recommenderConfig != null) 'recommenderConfig': recommenderConfig,
      if (status != null) 'status': status,
    };
  }
}

/// The configuration details of an Amazon S3 input or output bucket.
class S3DataConfig {
  /// The file path of the Amazon S3 bucket.
  final String path;

  /// The Amazon Resource Name (ARN) of the Key Management Service (KMS) key that
  /// Amazon Personalize uses to encrypt or decrypt the input and output files.
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

/// <important>
/// After you create a solution, you can’t change its configuration. By default,
/// all new solutions use automatic training. With automatic training, you incur
/// training costs while your solution is active. You can't stop automatic
/// training for a solution. To avoid unnecessary costs, make sure to delete the
/// solution when you are finished. For information about training costs, see <a
/// href="https://aws.amazon.com/personalize/pricing/">Amazon Personalize
/// pricing</a>.
/// </important>
/// An object that provides information about a solution. A solution includes
/// the custom recipe, customized parameters, and trained models (Solution
/// Versions) that Amazon Personalize uses to generate recommendations.
///
/// After you create a solution, you can’t change its configuration. If you need
/// to make changes, you can <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/cloning-solution.html">clone
/// the solution</a> with the Amazon Personalize console or create a new one.
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

  /// <important>
  /// We don't recommend enabling automated machine learning. Instead, match your
  /// use case to the available Amazon Personalize recipes. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/determining-use-case.html">Determining
  /// your use case.</a>
  /// </important>
  /// When true, Amazon Personalize performs a search for the best
  /// USER_PERSONALIZATION recipe from the list specified in the solution
  /// configuration (<code>recipeArn</code> must not be specified). When false
  /// (the default), Amazon Personalize uses <code>recipeArn</code> for training.
  final bool? performAutoML;

  /// Specifies whether the solution automatically creates solution versions. The
  /// default is <code>True</code> and the solution automatically creates new
  /// solution versions every 7 days.
  ///
  /// For more information about auto training, see <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/customizing-solution-config.html">Creating
  /// and configuring a solution</a>.
  final bool? performAutoTraining;

  /// Whether to perform hyperparameter optimization (HPO) on the chosen recipe.
  /// The default is <code>false</code>.
  final bool? performHPO;

  /// The ARN of the recipe used to create the solution. This is required when
  /// <code>performAutoML</code> is false.
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
    this.performAutoTraining,
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
      performAutoTraining: json['performAutoTraining'] as bool?,
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
    final performAutoTraining = this.performAutoTraining;
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
      if (performAutoTraining != null)
        'performAutoTraining': performAutoTraining,
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
  /// Lists the algorithm hyperparameters and their values.
  final Map<String, String>? algorithmHyperParameters;

  /// The <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_AutoMLConfig.html">AutoMLConfig</a>
  /// object containing a list of recipes to search when AutoML is performed.
  final AutoMLConfig? autoMLConfig;

  /// Specifies the automatic training configuration to use.
  final AutoTrainingConfig? autoTrainingConfig;

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

  /// Specifies the training data configuration to use when creating a custom
  /// solution version (trained model).
  final TrainingDataConfig? trainingDataConfig;

  SolutionConfig({
    this.algorithmHyperParameters,
    this.autoMLConfig,
    this.autoTrainingConfig,
    this.eventValueThreshold,
    this.featureTransformationParameters,
    this.hpoConfig,
    this.optimizationObjective,
    this.trainingDataConfig,
  });

  factory SolutionConfig.fromJson(Map<String, dynamic> json) {
    return SolutionConfig(
      algorithmHyperParameters:
          (json['algorithmHyperParameters'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      autoMLConfig: json['autoMLConfig'] != null
          ? AutoMLConfig.fromJson(json['autoMLConfig'] as Map<String, dynamic>)
          : null,
      autoTrainingConfig: json['autoTrainingConfig'] != null
          ? AutoTrainingConfig.fromJson(
              json['autoTrainingConfig'] as Map<String, dynamic>)
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
      trainingDataConfig: json['trainingDataConfig'] != null
          ? TrainingDataConfig.fromJson(
              json['trainingDataConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final algorithmHyperParameters = this.algorithmHyperParameters;
    final autoMLConfig = this.autoMLConfig;
    final autoTrainingConfig = this.autoTrainingConfig;
    final eventValueThreshold = this.eventValueThreshold;
    final featureTransformationParameters =
        this.featureTransformationParameters;
    final hpoConfig = this.hpoConfig;
    final optimizationObjective = this.optimizationObjective;
    final trainingDataConfig = this.trainingDataConfig;
    return {
      if (algorithmHyperParameters != null)
        'algorithmHyperParameters': algorithmHyperParameters,
      if (autoMLConfig != null) 'autoMLConfig': autoMLConfig,
      if (autoTrainingConfig != null) 'autoTrainingConfig': autoTrainingConfig,
      if (eventValueThreshold != null)
        'eventValueThreshold': eventValueThreshold,
      if (featureTransformationParameters != null)
        'featureTransformationParameters': featureTransformationParameters,
      if (hpoConfig != null) 'hpoConfig': hpoConfig,
      if (optimizationObjective != null)
        'optimizationObjective': optimizationObjective,
      if (trainingDataConfig != null) 'trainingDataConfig': trainingDataConfig,
    };
  }
}

/// Provides a summary of the properties of a solution. For a complete listing,
/// call the <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolution.html">DescribeSolution</a>
/// API.
class SolutionSummary {
  /// The date and time (in Unix time) that the solution was created.
  final DateTime? creationDateTime;

  /// The date and time (in Unix time) that the solution was last updated.
  final DateTime? lastUpdatedDateTime;

  /// The name of the solution.
  final String? name;

  /// The Amazon Resource Name (ARN) of the recipe used by the solution.
  final String? recipeArn;

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
    this.recipeArn,
    this.solutionArn,
    this.status,
  });

  factory SolutionSummary.fromJson(Map<String, dynamic> json) {
    return SolutionSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
      recipeArn: json['recipeArn'] as String?,
      solutionArn: json['solutionArn'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final name = this.name;
    final recipeArn = this.recipeArn;
    final solutionArn = this.solutionArn;
    final status = this.status;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (recipeArn != null) 'recipeArn': recipeArn,
      if (solutionArn != null) 'solutionArn': solutionArn,
      if (status != null) 'status': status,
    };
  }
}

/// An object that provides information about a specific version of a <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_Solution.html">Solution</a>
/// in a Custom dataset group.
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

  /// The name of the solution version.
  final String? name;

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

  /// The scope of training to be performed when creating the solution version. A
  /// <code>FULL</code> training considers all of the data in your dataset group.
  /// An <code>UPDATE</code> processes only the data that has changed since the
  /// latest training. Only solution versions created with the
  /// User-Personalization recipe can use <code>UPDATE</code>.
  final TrainingMode? trainingMode;

  /// Whether the solution version was created automatically or manually.
  final TrainingType? trainingType;

  /// If hyperparameter optimization was performed, contains the hyperparameter
  /// values of the best performing model.
  final TunedHPOParams? tunedHPOParams;

  SolutionVersion({
    this.creationDateTime,
    this.datasetGroupArn,
    this.eventType,
    this.failureReason,
    this.lastUpdatedDateTime,
    this.name,
    this.performAutoML,
    this.performHPO,
    this.recipeArn,
    this.solutionArn,
    this.solutionConfig,
    this.solutionVersionArn,
    this.status,
    this.trainingHours,
    this.trainingMode,
    this.trainingType,
    this.tunedHPOParams,
  });

  factory SolutionVersion.fromJson(Map<String, dynamic> json) {
    return SolutionVersion(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      datasetGroupArn: json['datasetGroupArn'] as String?,
      eventType: json['eventType'] as String?,
      failureReason: json['failureReason'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      name: json['name'] as String?,
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
      trainingType: (json['trainingType'] as String?)?.toTrainingType(),
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
    final name = this.name;
    final performAutoML = this.performAutoML;
    final performHPO = this.performHPO;
    final recipeArn = this.recipeArn;
    final solutionArn = this.solutionArn;
    final solutionConfig = this.solutionConfig;
    final solutionVersionArn = this.solutionVersionArn;
    final status = this.status;
    final trainingHours = this.trainingHours;
    final trainingMode = this.trainingMode;
    final trainingType = this.trainingType;
    final tunedHPOParams = this.tunedHPOParams;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (datasetGroupArn != null) 'datasetGroupArn': datasetGroupArn,
      if (eventType != null) 'eventType': eventType,
      if (failureReason != null) 'failureReason': failureReason,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (name != null) 'name': name,
      if (performAutoML != null) 'performAutoML': performAutoML,
      if (performHPO != null) 'performHPO': performHPO,
      if (recipeArn != null) 'recipeArn': recipeArn,
      if (solutionArn != null) 'solutionArn': solutionArn,
      if (solutionConfig != null) 'solutionConfig': solutionConfig,
      if (solutionVersionArn != null) 'solutionVersionArn': solutionVersionArn,
      if (status != null) 'status': status,
      if (trainingHours != null) 'trainingHours': trainingHours,
      if (trainingMode != null) 'trainingMode': trainingMode.toValue(),
      if (trainingType != null) 'trainingType': trainingType.toValue(),
      if (tunedHPOParams != null) 'tunedHPOParams': tunedHPOParams,
    };
  }
}

/// Provides a summary of the properties of a solution version. For a complete
/// listing, call the <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolutionVersion.html">DescribeSolutionVersion</a>
/// API.
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

  /// The scope of training to be performed when creating the solution version. A
  /// <code>FULL</code> training considers all of the data in your dataset group.
  /// An <code>UPDATE</code> processes only the data that has changed since the
  /// latest training. Only solution versions created with the
  /// User-Personalization recipe can use <code>UPDATE</code>.
  final TrainingMode? trainingMode;

  /// Whether the solution version was created automatically or manually.
  final TrainingType? trainingType;

  SolutionVersionSummary({
    this.creationDateTime,
    this.failureReason,
    this.lastUpdatedDateTime,
    this.solutionVersionArn,
    this.status,
    this.trainingMode,
    this.trainingType,
  });

  factory SolutionVersionSummary.fromJson(Map<String, dynamic> json) {
    return SolutionVersionSummary(
      creationDateTime: timeStampFromJson(json['creationDateTime']),
      failureReason: json['failureReason'] as String?,
      lastUpdatedDateTime: timeStampFromJson(json['lastUpdatedDateTime']),
      solutionVersionArn: json['solutionVersionArn'] as String?,
      status: json['status'] as String?,
      trainingMode: (json['trainingMode'] as String?)?.toTrainingMode(),
      trainingType: (json['trainingType'] as String?)?.toTrainingType(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final failureReason = this.failureReason;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final solutionVersionArn = this.solutionVersionArn;
    final status = this.status;
    final trainingMode = this.trainingMode;
    final trainingType = this.trainingType;
    return {
      if (creationDateTime != null)
        'creationDateTime': unixTimestampToJson(creationDateTime),
      if (failureReason != null) 'failureReason': failureReason,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': unixTimestampToJson(lastUpdatedDateTime),
      if (solutionVersionArn != null) 'solutionVersionArn': solutionVersionArn,
      if (status != null) 'status': status,
      if (trainingMode != null) 'trainingMode': trainingMode.toValue(),
      if (trainingType != null) 'trainingType': trainingType.toValue(),
    };
  }
}

class StartRecommenderResponse {
  /// The Amazon Resource Name (ARN) of the recommender you started.
  final String? recommenderArn;

  StartRecommenderResponse({
    this.recommenderArn,
  });

  factory StartRecommenderResponse.fromJson(Map<String, dynamic> json) {
    return StartRecommenderResponse(
      recommenderArn: json['recommenderArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recommenderArn = this.recommenderArn;
    return {
      if (recommenderArn != null) 'recommenderArn': recommenderArn,
    };
  }
}

class StopRecommenderResponse {
  /// The Amazon Resource Name (ARN) of the recommender you stopped.
  final String? recommenderArn;

  StopRecommenderResponse({
    this.recommenderArn,
  });

  factory StopRecommenderResponse.fromJson(Map<String, dynamic> json) {
    return StopRecommenderResponse(
      recommenderArn: json['recommenderArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recommenderArn = this.recommenderArn;
    return {
      if (recommenderArn != null) 'recommenderArn': recommenderArn,
    };
  }
}

/// The optional metadata that you apply to resources to help you categorize and
/// organize them. Each tag consists of a key and an optional value, both of
/// which you define. For more information see <a
/// href="https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html">Tagging
/// Amazon Personalize resources</a>.
class Tag {
  /// One part of a key-value pair that makes up a tag. A key is a general label
  /// that acts like a category for more specific tag values.
  final String tagKey;

  /// The optional part of a key-value pair that makes up a tag. A value acts as a
  /// descriptor within a tag category (key).
  final String tagValue;

  Tag({
    required this.tagKey,
    required this.tagValue,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      tagKey: json['tagKey'] as String,
      tagValue: json['tagValue'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final tagKey = this.tagKey;
    final tagValue = this.tagValue;
    return {
      'tagKey': tagKey,
      'tagValue': tagValue,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The configuration details for generating themes with a batch inference job.
class ThemeGenerationConfig {
  /// Fields used to generate descriptive themes for a batch inference job.
  final FieldsForThemeGeneration fieldsForThemeGeneration;

  ThemeGenerationConfig({
    required this.fieldsForThemeGeneration,
  });

  factory ThemeGenerationConfig.fromJson(Map<String, dynamic> json) {
    return ThemeGenerationConfig(
      fieldsForThemeGeneration: FieldsForThemeGeneration.fromJson(
          json['fieldsForThemeGeneration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldsForThemeGeneration = this.fieldsForThemeGeneration;
    return {
      'fieldsForThemeGeneration': fieldsForThemeGeneration,
    };
  }
}

/// The training data configuration to use when creating a domain recommender or
/// custom solution version (trained model).
class TrainingDataConfig {
  /// Specifies the columns to exclude from training. Each key is a dataset type,
  /// and each value is a list of columns. Exclude columns to control what data
  /// Amazon Personalize uses to generate recommendations.
  ///
  /// For example, you might have a column that you want to use only to filter
  /// recommendations. You can exclude this column from training and Amazon
  /// Personalize considers it only when filtering.
  final Map<String, List<String>>? excludedDatasetColumns;

  TrainingDataConfig({
    this.excludedDatasetColumns,
  });

  factory TrainingDataConfig.fromJson(Map<String, dynamic> json) {
    return TrainingDataConfig(
      excludedDatasetColumns: (json['excludedDatasetColumns']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final excludedDatasetColumns = this.excludedDatasetColumns;
    return {
      if (excludedDatasetColumns != null)
        'excludedDatasetColumns': excludedDatasetColumns,
    };
  }
}

enum TrainingMode {
  full,
  update,
  autotrain,
}

extension TrainingModeValueExtension on TrainingMode {
  String toValue() {
    switch (this) {
      case TrainingMode.full:
        return 'FULL';
      case TrainingMode.update:
        return 'UPDATE';
      case TrainingMode.autotrain:
        return 'AUTOTRAIN';
    }
  }
}

extension TrainingModeFromString on String {
  TrainingMode toTrainingMode() {
    switch (this) {
      case 'FULL':
        return TrainingMode.full;
      case 'UPDATE':
        return TrainingMode.update;
      case 'AUTOTRAIN':
        return TrainingMode.autotrain;
    }
    throw Exception('$this is not known in enum TrainingMode');
  }
}

enum TrainingType {
  automatic,
  manual,
}

extension TrainingTypeValueExtension on TrainingType {
  String toValue() {
    switch (this) {
      case TrainingType.automatic:
        return 'AUTOMATIC';
      case TrainingType.manual:
        return 'MANUAL';
    }
  }
}

extension TrainingTypeFromString on String {
  TrainingType toTrainingType() {
    switch (this) {
      case 'AUTOMATIC':
        return TrainingType.automatic;
      case 'MANUAL':
        return TrainingType.manual;
    }
    throw Exception('$this is not known in enum TrainingType');
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class UpdateDatasetResponse {
  /// The Amazon Resource Name (ARN) of the dataset you updated.
  final String? datasetArn;

  UpdateDatasetResponse({
    this.datasetArn,
  });

  factory UpdateDatasetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDatasetResponse(
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

class UpdateMetricAttributionResponse {
  /// The Amazon Resource Name (ARN) for the metric attribution that you updated.
  final String? metricAttributionArn;

  UpdateMetricAttributionResponse({
    this.metricAttributionArn,
  });

  factory UpdateMetricAttributionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMetricAttributionResponse(
      metricAttributionArn: json['metricAttributionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricAttributionArn = this.metricAttributionArn;
    return {
      if (metricAttributionArn != null)
        'metricAttributionArn': metricAttributionArn,
    };
  }
}

class UpdateRecommenderResponse {
  /// The same recommender Amazon Resource Name (ARN) as given in the request.
  final String? recommenderArn;

  UpdateRecommenderResponse({
    this.recommenderArn,
  });

  factory UpdateRecommenderResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRecommenderResponse(
      recommenderArn: json['recommenderArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recommenderArn = this.recommenderArn;
    return {
      if (recommenderArn != null) 'recommenderArn': recommenderArn,
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

class TooManyTagKeysException extends _s.GenericAwsException {
  TooManyTagKeysException({String? type, String? message})
      : super(type: type, code: 'TooManyTagKeysException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
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
  'TooManyTagKeysException': (type, message) =>
      TooManyTagKeysException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
};

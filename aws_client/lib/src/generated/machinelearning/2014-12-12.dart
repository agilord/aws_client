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

part '2014-12-12.g.dart';

/// Definition of the public APIs exposed by Amazon Machine Learning
class MachineLearning {
  final _s.JsonProtocol _protocol;
  MachineLearning({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'machinelearning',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds one or more tags to an object, up to a limit of 10. Each tag consists
  /// of a key and an optional value. If you add a tag using a key that is
  /// already associated with the ML object, <code>AddTags</code> updates the
  /// tag's value.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InvalidTagException].
  /// May throw [TagLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the ML object to tag. For example, <code>exampleModelId</code>.
  ///
  /// Parameter [resourceType] :
  /// The type of the ML object to tag.
  ///
  /// Parameter [tags] :
  /// The key-value pairs to use to create tags. If you specify a key without
  /// specifying a value, Amazon ML creates a tag with the specified key and a
  /// value of null.
  Future<AddTagsOutput> addTags({
    @_s.required String resourceId,
    @_s.required TaggableResourceType resourceType,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.AddTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'ResourceType': resourceType?.toValue() ?? '',
        'Tags': tags,
      },
    );

    return AddTagsOutput.fromJson(jsonResponse.body);
  }

  /// Generates predictions for a group of observations. The observations to
  /// process exist in one or more data files referenced by a
  /// <code>DataSource</code>. This operation creates a new
  /// <code>BatchPrediction</code>, and uses an <code>MLModel</code> and the
  /// data files referenced by the <code>DataSource</code> as information
  /// sources.
  ///
  /// <code>CreateBatchPrediction</code> is an asynchronous operation. In
  /// response to <code>CreateBatchPrediction</code>, Amazon Machine Learning
  /// (Amazon ML) immediately returns and sets the <code>BatchPrediction</code>
  /// status to <code>PENDING</code>. After the <code>BatchPrediction</code>
  /// completes, Amazon ML sets the status to <code>COMPLETED</code>.
  ///
  /// You can poll for status updates by using the <a>GetBatchPrediction</a>
  /// operation and checking the <code>Status</code> parameter of the result.
  /// After the <code>COMPLETED</code> status appears, the results are available
  /// in the location specified by the <code>OutputUri</code> parameter.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServerException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [batchPredictionDataSourceId] :
  /// The ID of the <code>DataSource</code> that points to the group of
  /// observations to predict.
  ///
  /// Parameter [batchPredictionId] :
  /// A user-supplied ID that uniquely identifies the
  /// <code>BatchPrediction</code>.
  ///
  /// Parameter [mLModelId] :
  /// The ID of the <code>MLModel</code> that will generate predictions for the
  /// group of observations.
  ///
  /// Parameter [outputUri] :
  /// The location of an Amazon Simple Storage Service (Amazon S3) bucket or
  /// directory to store the batch prediction results. The following substrings
  /// are not allowed in the <code>s3 key</code> portion of the
  /// <code>outputURI</code> field: ':', '//', '/./', '/../'.
  ///
  /// Amazon ML needs permissions to store and retrieve the logs on your behalf.
  /// For information about how to set permissions, see the <a
  /// href="http://docs.aws.amazon.com/machine-learning/latest/dg">Amazon
  /// Machine Learning Developer Guide</a>.
  ///
  /// Parameter [batchPredictionName] :
  /// A user-supplied name or description of the <code>BatchPrediction</code>.
  /// <code>BatchPredictionName</code> can only use the UTF-8 character set.
  Future<CreateBatchPredictionOutput> createBatchPrediction({
    @_s.required String batchPredictionDataSourceId,
    @_s.required String batchPredictionId,
    @_s.required String mLModelId,
    @_s.required String outputUri,
    String batchPredictionName,
  }) async {
    ArgumentError.checkNotNull(
        batchPredictionDataSourceId, 'batchPredictionDataSourceId');
    _s.validateStringLength(
      'batchPredictionDataSourceId',
      batchPredictionDataSourceId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'batchPredictionDataSourceId',
      batchPredictionDataSourceId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(batchPredictionId, 'batchPredictionId');
    _s.validateStringLength(
      'batchPredictionId',
      batchPredictionId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'batchPredictionId',
      batchPredictionId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(mLModelId, 'mLModelId');
    _s.validateStringLength(
      'mLModelId',
      mLModelId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'mLModelId',
      mLModelId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(outputUri, 'outputUri');
    _s.validateStringLength(
      'outputUri',
      outputUri,
      0,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'outputUri',
      outputUri,
      r'''s3://([^/]+)(/.*)?''',
      isRequired: true,
    );
    _s.validateStringLength(
      'batchPredictionName',
      batchPredictionName,
      0,
      1024,
    );
    _s.validateStringPattern(
      'batchPredictionName',
      batchPredictionName,
      r'''.*\S.*|^$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.CreateBatchPrediction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BatchPredictionDataSourceId': batchPredictionDataSourceId,
        'BatchPredictionId': batchPredictionId,
        'MLModelId': mLModelId,
        'OutputUri': outputUri,
        if (batchPredictionName != null)
          'BatchPredictionName': batchPredictionName,
      },
    );

    return CreateBatchPredictionOutput.fromJson(jsonResponse.body);
  }

  /// Creates a <code>DataSource</code> object from an <a
  /// href="http://aws.amazon.com/rds/"> Amazon Relational Database Service</a>
  /// (Amazon RDS). A <code>DataSource</code> references data that can be used
  /// to perform <code>CreateMLModel</code>, <code>CreateEvaluation</code>, or
  /// <code>CreateBatchPrediction</code> operations.
  ///
  /// <code>CreateDataSourceFromRDS</code> is an asynchronous operation. In
  /// response to <code>CreateDataSourceFromRDS</code>, Amazon Machine Learning
  /// (Amazon ML) immediately returns and sets the <code>DataSource</code>
  /// status to <code>PENDING</code>. After the <code>DataSource</code> is
  /// created and ready for use, Amazon ML sets the <code>Status</code>
  /// parameter to <code>COMPLETED</code>. <code>DataSource</code> in the
  /// <code>COMPLETED</code> or <code>PENDING</code> state can be used only to
  /// perform <code>&gt;CreateMLModel</code>&gt;, <code>CreateEvaluation</code>,
  /// or <code>CreateBatchPrediction</code> operations.
  ///
  /// If Amazon ML cannot accept the input source, it sets the
  /// <code>Status</code> parameter to <code>FAILED</code> and includes an error
  /// message in the <code>Message</code> attribute of the
  /// <code>GetDataSource</code> operation response.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServerException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [dataSourceId] :
  /// A user-supplied ID that uniquely identifies the <code>DataSource</code>.
  /// Typically, an Amazon Resource Number (ARN) becomes the ID for a
  /// <code>DataSource</code>.
  ///
  /// Parameter [rDSData] :
  /// The data specification of an Amazon RDS <code>DataSource</code>:
  ///
  /// <ul>
  /// <li>
  /// DatabaseInformation -
  /// <ul>
  /// <li> <code>DatabaseName</code> - The name of the Amazon RDS database.</li>
  /// <li> <code>InstanceIdentifier </code> - A unique identifier for the Amazon
  /// RDS database instance.</li>
  /// </ul>
  /// </li>
  /// <li>
  /// DatabaseCredentials - AWS Identity and Access Management (IAM) credentials
  /// that are used to connect to the Amazon RDS database.
  /// </li>
  /// <li>
  /// ResourceRole - A role (DataPipelineDefaultResourceRole) assumed by an EC2
  /// instance to carry out the copy task from Amazon RDS to Amazon Simple
  /// Storage Service (Amazon S3). For more information, see <a
  /// href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html">Role
  /// templates</a> for data pipelines.
  /// </li>
  /// <li>
  /// ServiceRole - A role (DataPipelineDefaultRole) assumed by the AWS Data
  /// Pipeline service to monitor the progress of the copy task from Amazon RDS
  /// to Amazon S3. For more information, see <a
  /// href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html">Role
  /// templates</a> for data pipelines.
  /// </li>
  /// <li>
  /// SecurityInfo - The security information to use to access an RDS DB
  /// instance. You need to set up appropriate ingress rules for the security
  /// entity IDs provided to allow access to the Amazon RDS instance. Specify a
  /// [<code>SubnetId</code>, <code>SecurityGroupIds</code>] pair for a
  /// VPC-based RDS DB instance.
  /// </li>
  /// <li>
  /// SelectSqlQuery - A query that is used to retrieve the observation data for
  /// the <code>Datasource</code>.
  /// </li>
  /// <li>
  /// S3StagingLocation - The Amazon S3 location for staging Amazon RDS data.
  /// The data retrieved from Amazon RDS using <code>SelectSqlQuery</code> is
  /// stored in this location.
  /// </li>
  /// <li>
  /// DataSchemaUri - The Amazon S3 location of the <code>DataSchema</code>.
  /// </li>
  /// <li>
  /// DataSchema - A JSON string representing the schema. This is not required
  /// if <code>DataSchemaUri</code> is specified.
  /// </li>
  /// <li>
  /// DataRearrangement - A JSON string that represents the splitting and
  /// rearrangement requirements for the <code>Datasource</code>.
  /// <br>
  /// Sample - <code>
  /// "{\"splitting\":{\"percentBegin\":10,\"percentEnd\":60}}"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [roleARN] :
  /// The role that Amazon ML assumes on behalf of the user to create and
  /// activate a data pipeline in the user's account and copy data using the
  /// <code>SelectSqlQuery</code> query from Amazon RDS to Amazon S3.
  ///
  ///
  ///
  /// Parameter [computeStatistics] :
  /// The compute statistics for a <code>DataSource</code>. The statistics are
  /// generated from the observation data referenced by a
  /// <code>DataSource</code>. Amazon ML uses the statistics internally during
  /// <code>MLModel</code> training. This parameter must be set to
  /// <code>true</code> if the <code></code>DataSource<code></code> needs to be
  /// used for <code>MLModel</code> training.
  ///
  /// Parameter [dataSourceName] :
  /// A user-supplied name or description of the <code>DataSource</code>.
  Future<CreateDataSourceFromRDSOutput> createDataSourceFromRDS({
    @_s.required String dataSourceId,
    @_s.required RDSDataSpec rDSData,
    @_s.required String roleARN,
    bool computeStatistics,
    String dataSourceName,
  }) async {
    ArgumentError.checkNotNull(dataSourceId, 'dataSourceId');
    _s.validateStringLength(
      'dataSourceId',
      dataSourceId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dataSourceId',
      dataSourceId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(rDSData, 'rDSData');
    ArgumentError.checkNotNull(roleARN, 'roleARN');
    _s.validateStringLength(
      'roleARN',
      roleARN,
      1,
      110,
      isRequired: true,
    );
    _s.validateStringLength(
      'dataSourceName',
      dataSourceName,
      0,
      1024,
    );
    _s.validateStringPattern(
      'dataSourceName',
      dataSourceName,
      r'''.*\S.*|^$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.CreateDataSourceFromRDS'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataSourceId': dataSourceId,
        'RDSData': rDSData,
        'RoleARN': roleARN,
        if (computeStatistics != null) 'ComputeStatistics': computeStatistics,
        if (dataSourceName != null) 'DataSourceName': dataSourceName,
      },
    );

    return CreateDataSourceFromRDSOutput.fromJson(jsonResponse.body);
  }

  /// Creates a <code>DataSource</code> from a database hosted on an Amazon
  /// Redshift cluster. A <code>DataSource</code> references data that can be
  /// used to perform either <code>CreateMLModel</code>,
  /// <code>CreateEvaluation</code>, or <code>CreateBatchPrediction</code>
  /// operations.
  ///
  /// <code>CreateDataSourceFromRedshift</code> is an asynchronous operation. In
  /// response to <code>CreateDataSourceFromRedshift</code>, Amazon Machine
  /// Learning (Amazon ML) immediately returns and sets the
  /// <code>DataSource</code> status to <code>PENDING</code>. After the
  /// <code>DataSource</code> is created and ready for use, Amazon ML sets the
  /// <code>Status</code> parameter to <code>COMPLETED</code>.
  /// <code>DataSource</code> in <code>COMPLETED</code> or <code>PENDING</code>
  /// states can be used to perform only <code>CreateMLModel</code>,
  /// <code>CreateEvaluation</code>, or <code>CreateBatchPrediction</code>
  /// operations.
  ///
  /// If Amazon ML can't accept the input source, it sets the
  /// <code>Status</code> parameter to <code>FAILED</code> and includes an error
  /// message in the <code>Message</code> attribute of the
  /// <code>GetDataSource</code> operation response.
  ///
  /// The observations should be contained in the database hosted on an Amazon
  /// Redshift cluster and should be specified by a <code>SelectSqlQuery</code>
  /// query. Amazon ML executes an <code>Unload</code> command in Amazon
  /// Redshift to transfer the result set of the <code>SelectSqlQuery</code>
  /// query to <code>S3StagingLocation</code>.
  ///
  /// After the <code>DataSource</code> has been created, it's ready for use in
  /// evaluations and batch predictions. If you plan to use the
  /// <code>DataSource</code> to train an <code>MLModel</code>, the
  /// <code>DataSource</code> also requires a recipe. A recipe describes how
  /// each input variable will be used in training an <code>MLModel</code>. Will
  /// the variable be included or excluded from training? Will the variable be
  /// manipulated; for example, will it be combined with another variable or
  /// will it be split apart into word combinations? The recipe provides answers
  /// to these questions.
  /// <?oxy_insert_start author="laurama" timestamp="20160406T153842-0700">
  /// You can't change an existing datasource, but you can copy and modify the
  /// settings from an existing Amazon Redshift datasource to create a new
  /// datasource. To do so, call <code>GetDataSource</code> for an existing
  /// datasource and copy the values to a <code>CreateDataSource</code> call.
  /// Change the settings that you want to change and make sure that all
  /// required fields have the appropriate values.
  /// <?oxy_insert_end>
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServerException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [dataSourceId] :
  /// A user-supplied ID that uniquely identifies the <code>DataSource</code>.
  ///
  /// Parameter [dataSpec] :
  /// The data specification of an Amazon Redshift <code>DataSource</code>:
  ///
  /// <ul>
  /// <li>
  /// DatabaseInformation -
  /// <ul>
  /// <li> <code>DatabaseName</code> - The name of the Amazon Redshift database.
  /// </li>
  /// <li> <code> ClusterIdentifier</code> - The unique ID for the Amazon
  /// Redshift cluster.</li>
  /// </ul>
  /// </li>
  /// <li>
  /// DatabaseCredentials - The AWS Identity and Access Management (IAM)
  /// credentials that are used to connect to the Amazon Redshift database.
  /// </li>
  /// <li>
  /// SelectSqlQuery - The query that is used to retrieve the observation data
  /// for the <code>Datasource</code>.
  /// </li>
  /// <li>
  /// S3StagingLocation - The Amazon Simple Storage Service (Amazon S3) location
  /// for staging Amazon Redshift data. The data retrieved from Amazon Redshift
  /// using the <code>SelectSqlQuery</code> query is stored in this location.
  /// </li>
  /// <li>
  /// DataSchemaUri - The Amazon S3 location of the <code>DataSchema</code>.
  /// </li>
  /// <li>
  /// DataSchema - A JSON string representing the schema. This is not required
  /// if <code>DataSchemaUri</code> is specified.
  /// </li>
  /// <li>
  /// DataRearrangement - A JSON string that represents the splitting and
  /// rearrangement requirements for the <code>DataSource</code>.
  ///
  /// Sample - <code>
  /// "{\"splitting\":{\"percentBegin\":10,\"percentEnd\":60}}"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [roleARN] :
  /// A fully specified role Amazon Resource Name (ARN). Amazon ML assumes the
  /// role on behalf of the user to create the following:
  ///
  ///
  /// <ul>
  /// <li>
  /// A security group to allow Amazon ML to execute the
  /// <code>SelectSqlQuery</code> query on an Amazon Redshift cluster
  /// </li>
  /// <li>
  /// An Amazon S3 bucket policy to grant Amazon ML read/write permissions on
  /// the <code>S3StagingLocation</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [computeStatistics] :
  /// The compute statistics for a <code>DataSource</code>. The statistics are
  /// generated from the observation data referenced by a
  /// <code>DataSource</code>. Amazon ML uses the statistics internally during
  /// <code>MLModel</code> training. This parameter must be set to
  /// <code>true</code> if the <code>DataSource</code> needs to be used for
  /// <code>MLModel</code> training.
  ///
  /// Parameter [dataSourceName] :
  /// A user-supplied name or description of the <code>DataSource</code>.
  Future<CreateDataSourceFromRedshiftOutput> createDataSourceFromRedshift({
    @_s.required String dataSourceId,
    @_s.required RedshiftDataSpec dataSpec,
    @_s.required String roleARN,
    bool computeStatistics,
    String dataSourceName,
  }) async {
    ArgumentError.checkNotNull(dataSourceId, 'dataSourceId');
    _s.validateStringLength(
      'dataSourceId',
      dataSourceId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dataSourceId',
      dataSourceId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataSpec, 'dataSpec');
    ArgumentError.checkNotNull(roleARN, 'roleARN');
    _s.validateStringLength(
      'roleARN',
      roleARN,
      1,
      110,
      isRequired: true,
    );
    _s.validateStringLength(
      'dataSourceName',
      dataSourceName,
      0,
      1024,
    );
    _s.validateStringPattern(
      'dataSourceName',
      dataSourceName,
      r'''.*\S.*|^$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.CreateDataSourceFromRedshift'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataSourceId': dataSourceId,
        'DataSpec': dataSpec,
        'RoleARN': roleARN,
        if (computeStatistics != null) 'ComputeStatistics': computeStatistics,
        if (dataSourceName != null) 'DataSourceName': dataSourceName,
      },
    );

    return CreateDataSourceFromRedshiftOutput.fromJson(jsonResponse.body);
  }

  /// Creates a <code>DataSource</code> object. A <code>DataSource</code>
  /// references data that can be used to perform <code>CreateMLModel</code>,
  /// <code>CreateEvaluation</code>, or <code>CreateBatchPrediction</code>
  /// operations.
  ///
  /// <code>CreateDataSourceFromS3</code> is an asynchronous operation. In
  /// response to <code>CreateDataSourceFromS3</code>, Amazon Machine Learning
  /// (Amazon ML) immediately returns and sets the <code>DataSource</code>
  /// status to <code>PENDING</code>. After the <code>DataSource</code> has been
  /// created and is ready for use, Amazon ML sets the <code>Status</code>
  /// parameter to <code>COMPLETED</code>. <code>DataSource</code> in the
  /// <code>COMPLETED</code> or <code>PENDING</code> state can be used to
  /// perform only <code>CreateMLModel</code>, <code>CreateEvaluation</code> or
  /// <code>CreateBatchPrediction</code> operations.
  ///
  /// If Amazon ML can't accept the input source, it sets the
  /// <code>Status</code> parameter to <code>FAILED</code> and includes an error
  /// message in the <code>Message</code> attribute of the
  /// <code>GetDataSource</code> operation response.
  ///
  /// The observation data used in a <code>DataSource</code> should be ready to
  /// use; that is, it should have a consistent structure, and missing data
  /// values should be kept to a minimum. The observation data must reside in
  /// one or more .csv files in an Amazon Simple Storage Service (Amazon S3)
  /// location, along with a schema that describes the data items by name and
  /// type. The same schema must be used for all of the data files referenced by
  /// the <code>DataSource</code>.
  ///
  /// After the <code>DataSource</code> has been created, it's ready to use in
  /// evaluations and batch predictions. If you plan to use the
  /// <code>DataSource</code> to train an <code>MLModel</code>, the
  /// <code>DataSource</code> also needs a recipe. A recipe describes how each
  /// input variable will be used in training an <code>MLModel</code>. Will the
  /// variable be included or excluded from training? Will the variable be
  /// manipulated; for example, will it be combined with another variable or
  /// will it be split apart into word combinations? The recipe provides answers
  /// to these questions.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServerException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [dataSourceId] :
  /// A user-supplied identifier that uniquely identifies the
  /// <code>DataSource</code>.
  ///
  /// Parameter [dataSpec] :
  /// The data specification of a <code>DataSource</code>:
  ///
  /// <ul>
  /// <li>
  /// DataLocationS3 - The Amazon S3 location of the observation data.
  /// </li>
  /// <li>
  /// DataSchemaLocationS3 - The Amazon S3 location of the
  /// <code>DataSchema</code>.
  /// </li>
  /// <li>
  /// DataSchema - A JSON string representing the schema. This is not required
  /// if <code>DataSchemaUri</code> is specified.
  /// </li>
  /// <li>
  /// DataRearrangement - A JSON string that represents the splitting and
  /// rearrangement requirements for the <code>Datasource</code>.
  ///
  /// Sample - <code>
  /// "{\"splitting\":{\"percentBegin\":10,\"percentEnd\":60}}"</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [computeStatistics] :
  /// The compute statistics for a <code>DataSource</code>. The statistics are
  /// generated from the observation data referenced by a
  /// <code>DataSource</code>. Amazon ML uses the statistics internally during
  /// <code>MLModel</code> training. This parameter must be set to
  /// <code>true</code> if the <code></code>DataSource<code></code> needs to be
  /// used for <code>MLModel</code> training.
  ///
  /// Parameter [dataSourceName] :
  /// A user-supplied name or description of the <code>DataSource</code>.
  Future<CreateDataSourceFromS3Output> createDataSourceFromS3({
    @_s.required String dataSourceId,
    @_s.required S3DataSpec dataSpec,
    bool computeStatistics,
    String dataSourceName,
  }) async {
    ArgumentError.checkNotNull(dataSourceId, 'dataSourceId');
    _s.validateStringLength(
      'dataSourceId',
      dataSourceId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dataSourceId',
      dataSourceId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataSpec, 'dataSpec');
    _s.validateStringLength(
      'dataSourceName',
      dataSourceName,
      0,
      1024,
    );
    _s.validateStringPattern(
      'dataSourceName',
      dataSourceName,
      r'''.*\S.*|^$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.CreateDataSourceFromS3'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataSourceId': dataSourceId,
        'DataSpec': dataSpec,
        if (computeStatistics != null) 'ComputeStatistics': computeStatistics,
        if (dataSourceName != null) 'DataSourceName': dataSourceName,
      },
    );

    return CreateDataSourceFromS3Output.fromJson(jsonResponse.body);
  }

  /// Creates a new <code>Evaluation</code> of an <code>MLModel</code>. An
  /// <code>MLModel</code> is evaluated on a set of observations associated to a
  /// <code>DataSource</code>. Like a <code>DataSource</code> for an
  /// <code>MLModel</code>, the <code>DataSource</code> for an
  /// <code>Evaluation</code> contains values for the <code>Target
  /// Variable</code>. The <code>Evaluation</code> compares the predicted result
  /// for each observation to the actual outcome and provides a summary so that
  /// you know how effective the <code>MLModel</code> functions on the test
  /// data. Evaluation generates a relevant performance metric, such as
  /// BinaryAUC, RegressionRMSE or MulticlassAvgFScore based on the
  /// corresponding <code>MLModelType</code>: <code>BINARY</code>,
  /// <code>REGRESSION</code> or <code>MULTICLASS</code>.
  ///
  /// <code>CreateEvaluation</code> is an asynchronous operation. In response to
  /// <code>CreateEvaluation</code>, Amazon Machine Learning (Amazon ML)
  /// immediately returns and sets the evaluation status to
  /// <code>PENDING</code>. After the <code>Evaluation</code> is created and
  /// ready for use, Amazon ML sets the status to <code>COMPLETED</code>.
  ///
  /// You can use the <code>GetEvaluation</code> operation to check progress of
  /// the evaluation during the creation operation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServerException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [evaluationDataSourceId] :
  /// The ID of the <code>DataSource</code> for the evaluation. The schema of
  /// the <code>DataSource</code> must match the schema used to create the
  /// <code>MLModel</code>.
  ///
  /// Parameter [evaluationId] :
  /// A user-supplied ID that uniquely identifies the <code>Evaluation</code>.
  ///
  /// Parameter [mLModelId] :
  /// The ID of the <code>MLModel</code> to evaluate.
  ///
  /// The schema used in creating the <code>MLModel</code> must match the schema
  /// of the <code>DataSource</code> used in the <code>Evaluation</code>.
  ///
  /// Parameter [evaluationName] :
  /// A user-supplied name or description of the <code>Evaluation</code>.
  Future<CreateEvaluationOutput> createEvaluation({
    @_s.required String evaluationDataSourceId,
    @_s.required String evaluationId,
    @_s.required String mLModelId,
    String evaluationName,
  }) async {
    ArgumentError.checkNotNull(
        evaluationDataSourceId, 'evaluationDataSourceId');
    _s.validateStringLength(
      'evaluationDataSourceId',
      evaluationDataSourceId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'evaluationDataSourceId',
      evaluationDataSourceId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(evaluationId, 'evaluationId');
    _s.validateStringLength(
      'evaluationId',
      evaluationId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'evaluationId',
      evaluationId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(mLModelId, 'mLModelId');
    _s.validateStringLength(
      'mLModelId',
      mLModelId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'mLModelId',
      mLModelId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'evaluationName',
      evaluationName,
      0,
      1024,
    );
    _s.validateStringPattern(
      'evaluationName',
      evaluationName,
      r'''.*\S.*|^$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.CreateEvaluation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EvaluationDataSourceId': evaluationDataSourceId,
        'EvaluationId': evaluationId,
        'MLModelId': mLModelId,
        if (evaluationName != null) 'EvaluationName': evaluationName,
      },
    );

    return CreateEvaluationOutput.fromJson(jsonResponse.body);
  }

  /// Creates a new <code>MLModel</code> using the <code>DataSource</code> and
  /// the recipe as information sources.
  ///
  /// An <code>MLModel</code> is nearly immutable. Users can update only the
  /// <code>MLModelName</code> and the <code>ScoreThreshold</code> in an
  /// <code>MLModel</code> without creating a new <code>MLModel</code>.
  ///
  /// <code>CreateMLModel</code> is an asynchronous operation. In response to
  /// <code>CreateMLModel</code>, Amazon Machine Learning (Amazon ML)
  /// immediately returns and sets the <code>MLModel</code> status to
  /// <code>PENDING</code>. After the <code>MLModel</code> has been created and
  /// ready is for use, Amazon ML sets the status to <code>COMPLETED</code>.
  ///
  /// You can use the <code>GetMLModel</code> operation to check the progress of
  /// the <code>MLModel</code> during the creation operation.
  ///
  /// <code>CreateMLModel</code> requires a <code>DataSource</code> with
  /// computed statistics, which can be created by setting
  /// <code>ComputeStatistics</code> to <code>true</code> in
  /// <code>CreateDataSourceFromRDS</code>, <code>CreateDataSourceFromS3</code>,
  /// or <code>CreateDataSourceFromRedshift</code> operations.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServerException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [mLModelId] :
  /// A user-supplied ID that uniquely identifies the <code>MLModel</code>.
  ///
  /// Parameter [mLModelType] :
  /// The category of supervised learning that this <code>MLModel</code> will
  /// address. Choose from the following types:
  ///
  /// <ul>
  /// <li>Choose <code>REGRESSION</code> if the <code>MLModel</code> will be
  /// used to predict a numeric value.</li>
  /// <li>Choose <code>BINARY</code> if the <code>MLModel</code> result has two
  /// possible values.</li>
  /// <li>Choose <code>MULTICLASS</code> if the <code>MLModel</code> result has
  /// a limited number of values. </li>
  /// </ul>
  /// For more information, see the <a
  /// href="http://docs.aws.amazon.com/machine-learning/latest/dg">Amazon
  /// Machine Learning Developer Guide</a>.
  ///
  /// Parameter [trainingDataSourceId] :
  /// The <code>DataSource</code> that points to the training data.
  ///
  /// Parameter [mLModelName] :
  /// A user-supplied name or description of the <code>MLModel</code>.
  ///
  /// Parameter [parameters] :
  /// A list of the training parameters in the <code>MLModel</code>. The list is
  /// implemented as a map of key-value pairs.
  ///
  /// The following is the current set of training parameters:
  ///
  /// <ul>
  /// <li>
  /// <code>sgd.maxMLModelSizeInBytes</code> - The maximum allowed size of the
  /// model. Depending on the input data, the size of the model might affect its
  /// performance.
  ///
  /// The value is an integer that ranges from <code>100000</code> to
  /// <code>2147483648</code>. The default value is <code>33554432</code>.
  /// </li>
  /// <li>
  /// <code>sgd.maxPasses</code> - The number of times that the training process
  /// traverses the observations to build the <code>MLModel</code>. The value is
  /// an integer that ranges from <code>1</code> to <code>10000</code>. The
  /// default value is <code>10</code>.
  /// </li>
  /// <li>
  /// <code>sgd.shuffleType</code> - Whether Amazon ML shuffles the training
  /// data. Shuffling the data improves a model's ability to find the optimal
  /// solution for a variety of data types. The valid values are
  /// <code>auto</code> and <code>none</code>. The default value is
  /// <code>none</code>. We <?oxy_insert_start author="laurama"
  /// timestamp="20160329T131121-0700">strongly recommend that you shuffle your
  /// data.<?oxy_insert_end>
  /// </li>
  /// <li>
  /// <code>sgd.l1RegularizationAmount</code> - The coefficient regularization
  /// L1 norm. It controls overfitting the data by penalizing large
  /// coefficients. This tends to drive coefficients to zero, resulting in a
  /// sparse feature set. If you use this parameter, start by specifying a small
  /// value, such as <code>1.0E-08</code>.
  ///
  /// The value is a double that ranges from <code>0</code> to
  /// <code>MAX_DOUBLE</code>. The default is to not use L1 normalization. This
  /// parameter can't be used when <code>L2</code> is specified. Use this
  /// parameter sparingly.
  /// </li>
  /// <li>
  /// <code>sgd.l2RegularizationAmount</code> - The coefficient regularization
  /// L2 norm. It controls overfitting the data by penalizing large
  /// coefficients. This tends to drive coefficients to small, nonzero values.
  /// If you use this parameter, start by specifying a small value, such as
  /// <code>1.0E-08</code>.
  ///
  /// The value is a double that ranges from <code>0</code> to
  /// <code>MAX_DOUBLE</code>. The default is to not use L2 normalization. This
  /// parameter can't be used when <code>L1</code> is specified. Use this
  /// parameter sparingly.
  /// </li>
  /// </ul>
  ///
  /// Parameter [recipe] :
  /// The data recipe for creating the <code>MLModel</code>. You must specify
  /// either the recipe or its URI. If you don't specify a recipe or its URI,
  /// Amazon ML creates a default.
  ///
  /// Parameter [recipeUri] :
  /// The Amazon Simple Storage Service (Amazon S3) location and file name that
  /// contains the <code>MLModel</code> recipe. You must specify either the
  /// recipe or its URI. If you don't specify a recipe or its URI, Amazon ML
  /// creates a default.
  Future<CreateMLModelOutput> createMLModel({
    @_s.required String mLModelId,
    @_s.required MLModelType mLModelType,
    @_s.required String trainingDataSourceId,
    String mLModelName,
    Map<String, String> parameters,
    String recipe,
    String recipeUri,
  }) async {
    ArgumentError.checkNotNull(mLModelId, 'mLModelId');
    _s.validateStringLength(
      'mLModelId',
      mLModelId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'mLModelId',
      mLModelId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(mLModelType, 'mLModelType');
    ArgumentError.checkNotNull(trainingDataSourceId, 'trainingDataSourceId');
    _s.validateStringLength(
      'trainingDataSourceId',
      trainingDataSourceId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'trainingDataSourceId',
      trainingDataSourceId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'mLModelName',
      mLModelName,
      0,
      1024,
    );
    _s.validateStringPattern(
      'mLModelName',
      mLModelName,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'recipe',
      recipe,
      0,
      131071,
    );
    _s.validateStringLength(
      'recipeUri',
      recipeUri,
      0,
      2048,
    );
    _s.validateStringPattern(
      'recipeUri',
      recipeUri,
      r'''s3://([^/]+)(/.*)?''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.CreateMLModel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MLModelId': mLModelId,
        'MLModelType': mLModelType?.toValue() ?? '',
        'TrainingDataSourceId': trainingDataSourceId,
        if (mLModelName != null) 'MLModelName': mLModelName,
        if (parameters != null) 'Parameters': parameters,
        if (recipe != null) 'Recipe': recipe,
        if (recipeUri != null) 'RecipeUri': recipeUri,
      },
    );

    return CreateMLModelOutput.fromJson(jsonResponse.body);
  }

  /// Creates a real-time endpoint for the <code>MLModel</code>. The endpoint
  /// contains the URI of the <code>MLModel</code>; that is, the location to
  /// send real-time prediction requests for the specified <code>MLModel</code>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [mLModelId] :
  /// The ID assigned to the <code>MLModel</code> during creation.
  Future<CreateRealtimeEndpointOutput> createRealtimeEndpoint({
    @_s.required String mLModelId,
  }) async {
    ArgumentError.checkNotNull(mLModelId, 'mLModelId');
    _s.validateStringLength(
      'mLModelId',
      mLModelId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'mLModelId',
      mLModelId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.CreateRealtimeEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MLModelId': mLModelId,
      },
    );

    return CreateRealtimeEndpointOutput.fromJson(jsonResponse.body);
  }

  /// Assigns the DELETED status to a <code>BatchPrediction</code>, rendering it
  /// unusable.
  ///
  /// After using the <code>DeleteBatchPrediction</code> operation, you can use
  /// the <a>GetBatchPrediction</a> operation to verify that the status of the
  /// <code>BatchPrediction</code> changed to DELETED.
  ///
  /// <b>Caution:</b> The result of the <code>DeleteBatchPrediction</code>
  /// operation is irreversible.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [batchPredictionId] :
  /// A user-supplied ID that uniquely identifies the
  /// <code>BatchPrediction</code>.
  Future<DeleteBatchPredictionOutput> deleteBatchPrediction({
    @_s.required String batchPredictionId,
  }) async {
    ArgumentError.checkNotNull(batchPredictionId, 'batchPredictionId');
    _s.validateStringLength(
      'batchPredictionId',
      batchPredictionId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'batchPredictionId',
      batchPredictionId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.DeleteBatchPrediction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BatchPredictionId': batchPredictionId,
      },
    );

    return DeleteBatchPredictionOutput.fromJson(jsonResponse.body);
  }

  /// Assigns the DELETED status to a <code>DataSource</code>, rendering it
  /// unusable.
  ///
  /// After using the <code>DeleteDataSource</code> operation, you can use the
  /// <a>GetDataSource</a> operation to verify that the status of the
  /// <code>DataSource</code> changed to DELETED.
  ///
  /// <b>Caution:</b> The results of the <code>DeleteDataSource</code> operation
  /// are irreversible.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataSourceId] :
  /// A user-supplied ID that uniquely identifies the <code>DataSource</code>.
  Future<DeleteDataSourceOutput> deleteDataSource({
    @_s.required String dataSourceId,
  }) async {
    ArgumentError.checkNotNull(dataSourceId, 'dataSourceId');
    _s.validateStringLength(
      'dataSourceId',
      dataSourceId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dataSourceId',
      dataSourceId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.DeleteDataSource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataSourceId': dataSourceId,
      },
    );

    return DeleteDataSourceOutput.fromJson(jsonResponse.body);
  }

  /// Assigns the <code>DELETED</code> status to an <code>Evaluation</code>,
  /// rendering it unusable.
  ///
  /// After invoking the <code>DeleteEvaluation</code> operation, you can use
  /// the <code>GetEvaluation</code> operation to verify that the status of the
  /// <code>Evaluation</code> changed to <code>DELETED</code>.
  /// <caution><title>Caution</title>
  /// The results of the <code>DeleteEvaluation</code> operation are
  /// irreversible.
  /// </caution>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [evaluationId] :
  /// A user-supplied ID that uniquely identifies the <code>Evaluation</code> to
  /// delete.
  Future<DeleteEvaluationOutput> deleteEvaluation({
    @_s.required String evaluationId,
  }) async {
    ArgumentError.checkNotNull(evaluationId, 'evaluationId');
    _s.validateStringLength(
      'evaluationId',
      evaluationId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'evaluationId',
      evaluationId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.DeleteEvaluation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EvaluationId': evaluationId,
      },
    );

    return DeleteEvaluationOutput.fromJson(jsonResponse.body);
  }

  /// Assigns the <code>DELETED</code> status to an <code>MLModel</code>,
  /// rendering it unusable.
  ///
  /// After using the <code>DeleteMLModel</code> operation, you can use the
  /// <code>GetMLModel</code> operation to verify that the status of the
  /// <code>MLModel</code> changed to DELETED.
  ///
  /// <b>Caution:</b> The result of the <code>DeleteMLModel</code> operation is
  /// irreversible.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [mLModelId] :
  /// A user-supplied ID that uniquely identifies the <code>MLModel</code>.
  Future<DeleteMLModelOutput> deleteMLModel({
    @_s.required String mLModelId,
  }) async {
    ArgumentError.checkNotNull(mLModelId, 'mLModelId');
    _s.validateStringLength(
      'mLModelId',
      mLModelId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'mLModelId',
      mLModelId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.DeleteMLModel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MLModelId': mLModelId,
      },
    );

    return DeleteMLModelOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a real time endpoint of an <code>MLModel</code>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [mLModelId] :
  /// The ID assigned to the <code>MLModel</code> during creation.
  Future<DeleteRealtimeEndpointOutput> deleteRealtimeEndpoint({
    @_s.required String mLModelId,
  }) async {
    ArgumentError.checkNotNull(mLModelId, 'mLModelId');
    _s.validateStringLength(
      'mLModelId',
      mLModelId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'mLModelId',
      mLModelId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.DeleteRealtimeEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MLModelId': mLModelId,
      },
    );

    return DeleteRealtimeEndpointOutput.fromJson(jsonResponse.body);
  }

  /// Deletes the specified tags associated with an ML object. After this
  /// operation is complete, you can't recover deleted tags.
  ///
  /// If you specify a tag that doesn't exist, Amazon ML ignores it.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InvalidTagException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the tagged ML object. For example, <code>exampleModelId</code>.
  ///
  /// Parameter [resourceType] :
  /// The type of the tagged ML object.
  ///
  /// Parameter [tagKeys] :
  /// One or more tags to delete.
  Future<DeleteTagsOutput> deleteTags({
    @_s.required String resourceId,
    @_s.required TaggableResourceType resourceType,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.DeleteTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'ResourceType': resourceType?.toValue() ?? '',
        'TagKeys': tagKeys,
      },
    );

    return DeleteTagsOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of <code>BatchPrediction</code> operations that match the
  /// search criteria in the request.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [eq] :
  /// The equal to operator. The <code>BatchPrediction</code> results will have
  /// <code>FilterVariable</code> values that exactly match the value specified
  /// with <code>EQ</code>.
  ///
  /// Parameter [filterVariable] :
  /// Use one of the following variables to filter a list of
  /// <code>BatchPrediction</code>:
  ///
  /// <ul>
  /// <li> <code>CreatedAt</code> - Sets the search criteria to the
  /// <code>BatchPrediction</code> creation date.</li>
  /// <li> <code>Status</code> - Sets the search criteria to the
  /// <code>BatchPrediction</code> status.</li>
  /// <li> <code>Name</code> - Sets the search criteria to the contents of the
  /// <code>BatchPrediction</code><b> </b> <code>Name</code>.</li>
  /// <li> <code>IAMUser</code> - Sets the search criteria to the user account
  /// that invoked the <code>BatchPrediction</code> creation.</li>
  /// <li> <code>MLModelId</code> - Sets the search criteria to the
  /// <code>MLModel</code> used in the <code>BatchPrediction</code>.</li>
  /// <li> <code>DataSourceId</code> - Sets the search criteria to the
  /// <code>DataSource</code> used in the <code>BatchPrediction</code>.</li>
  /// <li> <code>DataURI</code> - Sets the search criteria to the data file(s)
  /// used in the <code>BatchPrediction</code>. The URL can identify either a
  /// file or an Amazon Simple Storage Solution (Amazon S3) bucket or
  /// directory.</li>
  /// </ul>
  ///
  /// Parameter [ge] :
  /// The greater than or equal to operator. The <code>BatchPrediction</code>
  /// results will have <code>FilterVariable</code> values that are greater than
  /// or equal to the value specified with <code>GE</code>.
  ///
  /// Parameter [gt] :
  /// The greater than operator. The <code>BatchPrediction</code> results will
  /// have <code>FilterVariable</code> values that are greater than the value
  /// specified with <code>GT</code>.
  ///
  /// Parameter [le] :
  /// The less than or equal to operator. The <code>BatchPrediction</code>
  /// results will have <code>FilterVariable</code> values that are less than or
  /// equal to the value specified with <code>LE</code>.
  ///
  /// Parameter [lt] :
  /// The less than operator. The <code>BatchPrediction</code> results will have
  /// <code>FilterVariable</code> values that are less than the value specified
  /// with <code>LT</code>.
  ///
  /// Parameter [limit] :
  /// The number of pages of information to include in the result. The range of
  /// acceptable values is <code>1</code> through <code>100</code>. The default
  /// value is <code>100</code>.
  ///
  /// Parameter [ne] :
  /// The not equal to operator. The <code>BatchPrediction</code> results will
  /// have <code>FilterVariable</code> values not equal to the value specified
  /// with <code>NE</code>.
  ///
  /// Parameter [nextToken] :
  /// An ID of the page in the paginated results.
  ///
  /// Parameter [prefix] :
  /// A string that is found at the beginning of a variable, such as
  /// <code>Name</code> or <code>Id</code>.
  ///
  /// For example, a <code>Batch Prediction</code> operation could have the
  /// <code>Name</code> <code>2014-09-09-HolidayGiftMailer</code>. To search for
  /// this <code>BatchPrediction</code>, select <code>Name</code> for the
  /// <code>FilterVariable</code> and any of the following strings for the
  /// <code>Prefix</code>:
  ///
  /// <ul>
  /// <li>
  /// 2014-09
  /// </li>
  /// <li>
  /// 2014-09-09
  /// </li>
  /// <li>
  /// 2014-09-09-Holiday
  /// </li>
  /// </ul>
  ///
  /// Parameter [sortOrder] :
  /// A two-value parameter that determines the sequence of the resulting list
  /// of <code>MLModel</code>s.
  ///
  /// <ul>
  /// <li> <code>asc</code> - Arranges the list in ascending order (A-Z,
  /// 0-9).</li>
  /// <li> <code>dsc</code> - Arranges the list in descending order (Z-A,
  /// 9-0).</li>
  /// </ul>
  /// Results are sorted by <code>FilterVariable</code>.
  Future<DescribeBatchPredictionsOutput> describeBatchPredictions({
    String eq,
    BatchPredictionFilterVariable filterVariable,
    String ge,
    String gt,
    String le,
    String lt,
    int limit,
    String ne,
    String nextToken,
    String prefix,
    SortOrder sortOrder,
  }) async {
    _s.validateStringLength(
      'eq',
      eq,
      0,
      1024,
    );
    _s.validateStringPattern(
      'eq',
      eq,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'ge',
      ge,
      0,
      1024,
    );
    _s.validateStringPattern(
      'ge',
      ge,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'gt',
      gt,
      0,
      1024,
    );
    _s.validateStringPattern(
      'gt',
      gt,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'le',
      le,
      0,
      1024,
    );
    _s.validateStringPattern(
      'le',
      le,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'lt',
      lt,
      0,
      1024,
    );
    _s.validateStringPattern(
      'lt',
      lt,
      r'''.*\S.*|^$''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'ne',
      ne,
      0,
      1024,
    );
    _s.validateStringPattern(
      'ne',
      ne,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'prefix',
      prefix,
      0,
      1024,
    );
    _s.validateStringPattern(
      'prefix',
      prefix,
      r'''.*\S.*|^$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.DescribeBatchPredictions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (eq != null) 'EQ': eq,
        if (filterVariable != null) 'FilterVariable': filterVariable.toValue(),
        if (ge != null) 'GE': ge,
        if (gt != null) 'GT': gt,
        if (le != null) 'LE': le,
        if (lt != null) 'LT': lt,
        if (limit != null) 'Limit': limit,
        if (ne != null) 'NE': ne,
        if (nextToken != null) 'NextToken': nextToken,
        if (prefix != null) 'Prefix': prefix,
        if (sortOrder != null) 'SortOrder': sortOrder.toValue(),
      },
    );

    return DescribeBatchPredictionsOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of <code>DataSource</code> that match the search criteria
  /// in the request.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [eq] :
  /// The equal to operator. The <code>DataSource</code> results will have
  /// <code>FilterVariable</code> values that exactly match the value specified
  /// with <code>EQ</code>.
  ///
  /// Parameter [filterVariable] :
  /// Use one of the following variables to filter a list of
  /// <code>DataSource</code>:
  ///
  /// <ul>
  /// <li> <code>CreatedAt</code> - Sets the search criteria to
  /// <code>DataSource</code> creation dates.</li>
  /// <li> <code>Status</code> - Sets the search criteria to
  /// <code>DataSource</code> statuses.</li>
  /// <li> <code>Name</code> - Sets the search criteria to the contents of
  /// <code>DataSource</code> <b> </b> <code>Name</code>.</li>
  /// <li> <code>DataUri</code> - Sets the search criteria to the URI of data
  /// files used to create the <code>DataSource</code>. The URI can identify
  /// either a file or an Amazon Simple Storage Service (Amazon S3) bucket or
  /// directory.</li>
  /// <li> <code>IAMUser</code> - Sets the search criteria to the user account
  /// that invoked the <code>DataSource</code> creation.</li>
  /// </ul>
  ///
  /// Parameter [ge] :
  /// The greater than or equal to operator. The <code>DataSource</code> results
  /// will have <code>FilterVariable</code> values that are greater than or
  /// equal to the value specified with <code>GE</code>.
  ///
  /// Parameter [gt] :
  /// The greater than operator. The <code>DataSource</code> results will have
  /// <code>FilterVariable</code> values that are greater than the value
  /// specified with <code>GT</code>.
  ///
  /// Parameter [le] :
  /// The less than or equal to operator. The <code>DataSource</code> results
  /// will have <code>FilterVariable</code> values that are less than or equal
  /// to the value specified with <code>LE</code>.
  ///
  /// Parameter [lt] :
  /// The less than operator. The <code>DataSource</code> results will have
  /// <code>FilterVariable</code> values that are less than the value specified
  /// with <code>LT</code>.
  ///
  /// Parameter [limit] :
  /// The maximum number of <code>DataSource</code> to include in the result.
  ///
  /// Parameter [ne] :
  /// The not equal to operator. The <code>DataSource</code> results will have
  /// <code>FilterVariable</code> values not equal to the value specified with
  /// <code>NE</code>.
  ///
  /// Parameter [nextToken] :
  /// The ID of the page in the paginated results.
  ///
  /// Parameter [prefix] :
  /// A string that is found at the beginning of a variable, such as
  /// <code>Name</code> or <code>Id</code>.
  ///
  /// For example, a <code>DataSource</code> could have the <code>Name</code>
  /// <code>2014-09-09-HolidayGiftMailer</code>. To search for this
  /// <code>DataSource</code>, select <code>Name</code> for the
  /// <code>FilterVariable</code> and any of the following strings for the
  /// <code>Prefix</code>:
  ///
  /// <ul>
  /// <li>
  /// 2014-09
  /// </li>
  /// <li>
  /// 2014-09-09
  /// </li>
  /// <li>
  /// 2014-09-09-Holiday
  /// </li>
  /// </ul>
  ///
  /// Parameter [sortOrder] :
  /// A two-value parameter that determines the sequence of the resulting list
  /// of <code>DataSource</code>.
  ///
  /// <ul>
  /// <li> <code>asc</code> - Arranges the list in ascending order (A-Z,
  /// 0-9).</li>
  /// <li> <code>dsc</code> - Arranges the list in descending order (Z-A,
  /// 9-0).</li>
  /// </ul>
  /// Results are sorted by <code>FilterVariable</code>.
  Future<DescribeDataSourcesOutput> describeDataSources({
    String eq,
    DataSourceFilterVariable filterVariable,
    String ge,
    String gt,
    String le,
    String lt,
    int limit,
    String ne,
    String nextToken,
    String prefix,
    SortOrder sortOrder,
  }) async {
    _s.validateStringLength(
      'eq',
      eq,
      0,
      1024,
    );
    _s.validateStringPattern(
      'eq',
      eq,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'ge',
      ge,
      0,
      1024,
    );
    _s.validateStringPattern(
      'ge',
      ge,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'gt',
      gt,
      0,
      1024,
    );
    _s.validateStringPattern(
      'gt',
      gt,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'le',
      le,
      0,
      1024,
    );
    _s.validateStringPattern(
      'le',
      le,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'lt',
      lt,
      0,
      1024,
    );
    _s.validateStringPattern(
      'lt',
      lt,
      r'''.*\S.*|^$''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'ne',
      ne,
      0,
      1024,
    );
    _s.validateStringPattern(
      'ne',
      ne,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'prefix',
      prefix,
      0,
      1024,
    );
    _s.validateStringPattern(
      'prefix',
      prefix,
      r'''.*\S.*|^$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.DescribeDataSources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (eq != null) 'EQ': eq,
        if (filterVariable != null) 'FilterVariable': filterVariable.toValue(),
        if (ge != null) 'GE': ge,
        if (gt != null) 'GT': gt,
        if (le != null) 'LE': le,
        if (lt != null) 'LT': lt,
        if (limit != null) 'Limit': limit,
        if (ne != null) 'NE': ne,
        if (nextToken != null) 'NextToken': nextToken,
        if (prefix != null) 'Prefix': prefix,
        if (sortOrder != null) 'SortOrder': sortOrder.toValue(),
      },
    );

    return DescribeDataSourcesOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of <code>DescribeEvaluations</code> that match the search
  /// criteria in the request.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [eq] :
  /// The equal to operator. The <code>Evaluation</code> results will have
  /// <code>FilterVariable</code> values that exactly match the value specified
  /// with <code>EQ</code>.
  ///
  /// Parameter [filterVariable] :
  /// Use one of the following variable to filter a list of
  /// <code>Evaluation</code> objects:
  ///
  /// <ul>
  /// <li> <code>CreatedAt</code> - Sets the search criteria to the
  /// <code>Evaluation</code> creation date.</li>
  /// <li> <code>Status</code> - Sets the search criteria to the
  /// <code>Evaluation</code> status.</li>
  /// <li> <code>Name</code> - Sets the search criteria to the contents of
  /// <code>Evaluation</code> <b> </b> <code>Name</code>.</li>
  /// <li> <code>IAMUser</code> - Sets the search criteria to the user account
  /// that invoked an <code>Evaluation</code>.</li>
  /// <li> <code>MLModelId</code> - Sets the search criteria to the
  /// <code>MLModel</code> that was evaluated.</li>
  /// <li> <code>DataSourceId</code> - Sets the search criteria to the
  /// <code>DataSource</code> used in <code>Evaluation</code>.</li>
  /// <li> <code>DataUri</code> - Sets the search criteria to the data file(s)
  /// used in <code>Evaluation</code>. The URL can identify either a file or an
  /// Amazon Simple Storage Solution (Amazon S3) bucket or directory.</li>
  /// </ul>
  ///
  /// Parameter [ge] :
  /// The greater than or equal to operator. The <code>Evaluation</code> results
  /// will have <code>FilterVariable</code> values that are greater than or
  /// equal to the value specified with <code>GE</code>.
  ///
  /// Parameter [gt] :
  /// The greater than operator. The <code>Evaluation</code> results will have
  /// <code>FilterVariable</code> values that are greater than the value
  /// specified with <code>GT</code>.
  ///
  /// Parameter [le] :
  /// The less than or equal to operator. The <code>Evaluation</code> results
  /// will have <code>FilterVariable</code> values that are less than or equal
  /// to the value specified with <code>LE</code>.
  ///
  /// Parameter [lt] :
  /// The less than operator. The <code>Evaluation</code> results will have
  /// <code>FilterVariable</code> values that are less than the value specified
  /// with <code>LT</code>.
  ///
  /// Parameter [limit] :
  /// The maximum number of <code>Evaluation</code> to include in the result.
  ///
  /// Parameter [ne] :
  /// The not equal to operator. The <code>Evaluation</code> results will have
  /// <code>FilterVariable</code> values not equal to the value specified with
  /// <code>NE</code>.
  ///
  /// Parameter [nextToken] :
  /// The ID of the page in the paginated results.
  ///
  /// Parameter [prefix] :
  /// A string that is found at the beginning of a variable, such as
  /// <code>Name</code> or <code>Id</code>.
  ///
  /// For example, an <code>Evaluation</code> could have the <code>Name</code>
  /// <code>2014-09-09-HolidayGiftMailer</code>. To search for this
  /// <code>Evaluation</code>, select <code>Name</code> for the
  /// <code>FilterVariable</code> and any of the following strings for the
  /// <code>Prefix</code>:
  ///
  /// <ul>
  /// <li>
  /// 2014-09
  /// </li>
  /// <li>
  /// 2014-09-09
  /// </li>
  /// <li>
  /// 2014-09-09-Holiday
  /// </li>
  /// </ul>
  ///
  /// Parameter [sortOrder] :
  /// A two-value parameter that determines the sequence of the resulting list
  /// of <code>Evaluation</code>.
  ///
  /// <ul>
  /// <li> <code>asc</code> - Arranges the list in ascending order (A-Z,
  /// 0-9).</li>
  /// <li> <code>dsc</code> - Arranges the list in descending order (Z-A,
  /// 9-0).</li>
  /// </ul>
  /// Results are sorted by <code>FilterVariable</code>.
  Future<DescribeEvaluationsOutput> describeEvaluations({
    String eq,
    EvaluationFilterVariable filterVariable,
    String ge,
    String gt,
    String le,
    String lt,
    int limit,
    String ne,
    String nextToken,
    String prefix,
    SortOrder sortOrder,
  }) async {
    _s.validateStringLength(
      'eq',
      eq,
      0,
      1024,
    );
    _s.validateStringPattern(
      'eq',
      eq,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'ge',
      ge,
      0,
      1024,
    );
    _s.validateStringPattern(
      'ge',
      ge,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'gt',
      gt,
      0,
      1024,
    );
    _s.validateStringPattern(
      'gt',
      gt,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'le',
      le,
      0,
      1024,
    );
    _s.validateStringPattern(
      'le',
      le,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'lt',
      lt,
      0,
      1024,
    );
    _s.validateStringPattern(
      'lt',
      lt,
      r'''.*\S.*|^$''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'ne',
      ne,
      0,
      1024,
    );
    _s.validateStringPattern(
      'ne',
      ne,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'prefix',
      prefix,
      0,
      1024,
    );
    _s.validateStringPattern(
      'prefix',
      prefix,
      r'''.*\S.*|^$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.DescribeEvaluations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (eq != null) 'EQ': eq,
        if (filterVariable != null) 'FilterVariable': filterVariable.toValue(),
        if (ge != null) 'GE': ge,
        if (gt != null) 'GT': gt,
        if (le != null) 'LE': le,
        if (lt != null) 'LT': lt,
        if (limit != null) 'Limit': limit,
        if (ne != null) 'NE': ne,
        if (nextToken != null) 'NextToken': nextToken,
        if (prefix != null) 'Prefix': prefix,
        if (sortOrder != null) 'SortOrder': sortOrder.toValue(),
      },
    );

    return DescribeEvaluationsOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of <code>MLModel</code> that match the search criteria in
  /// the request.
  ///
  /// May throw [InvalidInputException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [eq] :
  /// The equal to operator. The <code>MLModel</code> results will have
  /// <code>FilterVariable</code> values that exactly match the value specified
  /// with <code>EQ</code>.
  ///
  /// Parameter [filterVariable] :
  /// Use one of the following variables to filter a list of
  /// <code>MLModel</code>:
  ///
  /// <ul>
  /// <li> <code>CreatedAt</code> - Sets the search criteria to
  /// <code>MLModel</code> creation date.</li>
  /// <li> <code>Status</code> - Sets the search criteria to
  /// <code>MLModel</code> status.</li>
  /// <li> <code>Name</code> - Sets the search criteria to the contents of
  /// <code>MLModel</code><b> </b> <code>Name</code>.</li>
  /// <li> <code>IAMUser</code> - Sets the search criteria to the user account
  /// that invoked the <code>MLModel</code> creation.</li>
  /// <li> <code>TrainingDataSourceId</code> - Sets the search criteria to the
  /// <code>DataSource</code> used to train one or more
  /// <code>MLModel</code>.</li>
  /// <li> <code>RealtimeEndpointStatus</code> - Sets the search criteria to the
  /// <code>MLModel</code> real-time endpoint status.</li>
  /// <li> <code>MLModelType</code> - Sets the search criteria to
  /// <code>MLModel</code> type: binary, regression, or multi-class.</li>
  /// <li> <code>Algorithm</code> - Sets the search criteria to the algorithm
  /// that the <code>MLModel</code> uses.</li>
  /// <li> <code>TrainingDataURI</code> - Sets the search criteria to the data
  /// file(s) used in training a <code>MLModel</code>. The URL can identify
  /// either a file or an Amazon Simple Storage Service (Amazon S3) bucket or
  /// directory.</li>
  /// </ul>
  ///
  /// Parameter [ge] :
  /// The greater than or equal to operator. The <code>MLModel</code> results
  /// will have <code>FilterVariable</code> values that are greater than or
  /// equal to the value specified with <code>GE</code>.
  ///
  /// Parameter [gt] :
  /// The greater than operator. The <code>MLModel</code> results will have
  /// <code>FilterVariable</code> values that are greater than the value
  /// specified with <code>GT</code>.
  ///
  /// Parameter [le] :
  /// The less than or equal to operator. The <code>MLModel</code> results will
  /// have <code>FilterVariable</code> values that are less than or equal to the
  /// value specified with <code>LE</code>.
  ///
  /// Parameter [lt] :
  /// The less than operator. The <code>MLModel</code> results will have
  /// <code>FilterVariable</code> values that are less than the value specified
  /// with <code>LT</code>.
  ///
  /// Parameter [limit] :
  /// The number of pages of information to include in the result. The range of
  /// acceptable values is <code>1</code> through <code>100</code>. The default
  /// value is <code>100</code>.
  ///
  /// Parameter [ne] :
  /// The not equal to operator. The <code>MLModel</code> results will have
  /// <code>FilterVariable</code> values not equal to the value specified with
  /// <code>NE</code>.
  ///
  /// Parameter [nextToken] :
  /// The ID of the page in the paginated results.
  ///
  /// Parameter [prefix] :
  /// A string that is found at the beginning of a variable, such as
  /// <code>Name</code> or <code>Id</code>.
  ///
  /// For example, an <code>MLModel</code> could have the <code>Name</code>
  /// <code>2014-09-09-HolidayGiftMailer</code>. To search for this
  /// <code>MLModel</code>, select <code>Name</code> for the
  /// <code>FilterVariable</code> and any of the following strings for the
  /// <code>Prefix</code>:
  ///
  /// <ul>
  /// <li>
  /// 2014-09
  /// </li>
  /// <li>
  /// 2014-09-09
  /// </li>
  /// <li>
  /// 2014-09-09-Holiday
  /// </li>
  /// </ul>
  ///
  /// Parameter [sortOrder] :
  /// A two-value parameter that determines the sequence of the resulting list
  /// of <code>MLModel</code>.
  ///
  /// <ul>
  /// <li> <code>asc</code> - Arranges the list in ascending order (A-Z,
  /// 0-9).</li>
  /// <li> <code>dsc</code> - Arranges the list in descending order (Z-A,
  /// 9-0).</li>
  /// </ul>
  /// Results are sorted by <code>FilterVariable</code>.
  Future<DescribeMLModelsOutput> describeMLModels({
    String eq,
    MLModelFilterVariable filterVariable,
    String ge,
    String gt,
    String le,
    String lt,
    int limit,
    String ne,
    String nextToken,
    String prefix,
    SortOrder sortOrder,
  }) async {
    _s.validateStringLength(
      'eq',
      eq,
      0,
      1024,
    );
    _s.validateStringPattern(
      'eq',
      eq,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'ge',
      ge,
      0,
      1024,
    );
    _s.validateStringPattern(
      'ge',
      ge,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'gt',
      gt,
      0,
      1024,
    );
    _s.validateStringPattern(
      'gt',
      gt,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'le',
      le,
      0,
      1024,
    );
    _s.validateStringPattern(
      'le',
      le,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'lt',
      lt,
      0,
      1024,
    );
    _s.validateStringPattern(
      'lt',
      lt,
      r'''.*\S.*|^$''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      100,
    );
    _s.validateStringLength(
      'ne',
      ne,
      0,
      1024,
    );
    _s.validateStringPattern(
      'ne',
      ne,
      r'''.*\S.*|^$''',
    );
    _s.validateStringLength(
      'prefix',
      prefix,
      0,
      1024,
    );
    _s.validateStringPattern(
      'prefix',
      prefix,
      r'''.*\S.*|^$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.DescribeMLModels'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (eq != null) 'EQ': eq,
        if (filterVariable != null) 'FilterVariable': filterVariable.toValue(),
        if (ge != null) 'GE': ge,
        if (gt != null) 'GT': gt,
        if (le != null) 'LE': le,
        if (lt != null) 'LT': lt,
        if (limit != null) 'Limit': limit,
        if (ne != null) 'NE': ne,
        if (nextToken != null) 'NextToken': nextToken,
        if (prefix != null) 'Prefix': prefix,
        if (sortOrder != null) 'SortOrder': sortOrder.toValue(),
      },
    );

    return DescribeMLModelsOutput.fromJson(jsonResponse.body);
  }

  /// Describes one or more of the tags for your Amazon ML object.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceId] :
  /// The ID of the ML object. For example, <code>exampleModelId</code>.
  ///
  /// Parameter [resourceType] :
  /// The type of the ML object.
  Future<DescribeTagsOutput> describeTags({
    @_s.required String resourceId,
    @_s.required TaggableResourceType resourceType,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceType, 'resourceType');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.DescribeTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'ResourceType': resourceType?.toValue() ?? '',
      },
    );

    return DescribeTagsOutput.fromJson(jsonResponse.body);
  }

  /// Returns a <code>BatchPrediction</code> that includes detailed metadata,
  /// status, and data file information for a <code>Batch Prediction</code>
  /// request.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [batchPredictionId] :
  /// An ID assigned to the <code>BatchPrediction</code> at creation.
  Future<GetBatchPredictionOutput> getBatchPrediction({
    @_s.required String batchPredictionId,
  }) async {
    ArgumentError.checkNotNull(batchPredictionId, 'batchPredictionId');
    _s.validateStringLength(
      'batchPredictionId',
      batchPredictionId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'batchPredictionId',
      batchPredictionId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.GetBatchPrediction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BatchPredictionId': batchPredictionId,
      },
    );

    return GetBatchPredictionOutput.fromJson(jsonResponse.body);
  }

  /// Returns a <code>DataSource</code> that includes metadata and data file
  /// information, as well as the current status of the <code>DataSource</code>.
  ///
  /// <code>GetDataSource</code> provides results in normal or verbose format.
  /// The verbose format adds the schema description and the list of files
  /// pointed to by the DataSource to the normal format.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataSourceId] :
  /// The ID assigned to the <code>DataSource</code> at creation.
  ///
  /// Parameter [verbose] :
  /// Specifies whether the <code>GetDataSource</code> operation should return
  /// <code>DataSourceSchema</code>.
  ///
  /// If true, <code>DataSourceSchema</code> is returned.
  ///
  /// If false, <code>DataSourceSchema</code> is not returned.
  Future<GetDataSourceOutput> getDataSource({
    @_s.required String dataSourceId,
    bool verbose,
  }) async {
    ArgumentError.checkNotNull(dataSourceId, 'dataSourceId');
    _s.validateStringLength(
      'dataSourceId',
      dataSourceId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dataSourceId',
      dataSourceId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.GetDataSource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataSourceId': dataSourceId,
        if (verbose != null) 'Verbose': verbose,
      },
    );

    return GetDataSourceOutput.fromJson(jsonResponse.body);
  }

  /// Returns an <code>Evaluation</code> that includes metadata as well as the
  /// current status of the <code>Evaluation</code>.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [evaluationId] :
  /// The ID of the <code>Evaluation</code> to retrieve. The evaluation of each
  /// <code>MLModel</code> is recorded and cataloged. The ID provides the means
  /// to access the information.
  Future<GetEvaluationOutput> getEvaluation({
    @_s.required String evaluationId,
  }) async {
    ArgumentError.checkNotNull(evaluationId, 'evaluationId');
    _s.validateStringLength(
      'evaluationId',
      evaluationId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'evaluationId',
      evaluationId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.GetEvaluation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EvaluationId': evaluationId,
      },
    );

    return GetEvaluationOutput.fromJson(jsonResponse.body);
  }

  /// Returns an <code>MLModel</code> that includes detailed metadata, data
  /// source information, and the current status of the <code>MLModel</code>.
  ///
  /// <code>GetMLModel</code> provides results in normal or verbose format.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [mLModelId] :
  /// The ID assigned to the <code>MLModel</code> at creation.
  ///
  /// Parameter [verbose] :
  /// Specifies whether the <code>GetMLModel</code> operation should return
  /// <code>Recipe</code>.
  ///
  /// If true, <code>Recipe</code> is returned.
  ///
  /// If false, <code>Recipe</code> is not returned.
  Future<GetMLModelOutput> getMLModel({
    @_s.required String mLModelId,
    bool verbose,
  }) async {
    ArgumentError.checkNotNull(mLModelId, 'mLModelId');
    _s.validateStringLength(
      'mLModelId',
      mLModelId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'mLModelId',
      mLModelId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.GetMLModel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MLModelId': mLModelId,
        if (verbose != null) 'Verbose': verbose,
      },
    );

    return GetMLModelOutput.fromJson(jsonResponse.body);
  }

  /// Generates a prediction for the observation using the specified <code>ML
  /// Model</code>.
  /// <note><title>Note</title>
  /// Not all response parameters will be populated. Whether a response
  /// parameter is populated depends on the type of model requested.
  /// </note>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerException].
  /// May throw [PredictorNotMountedException].
  ///
  /// Parameter [mLModelId] :
  /// A unique identifier of the <code>MLModel</code>.
  Future<PredictOutput> predict({
    @_s.required String mLModelId,
    @_s.required String predictEndpoint,
    @_s.required Map<String, String> record,
  }) async {
    ArgumentError.checkNotNull(mLModelId, 'mLModelId');
    _s.validateStringLength(
      'mLModelId',
      mLModelId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'mLModelId',
      mLModelId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(predictEndpoint, 'predictEndpoint');
    _s.validateStringLength(
      'predictEndpoint',
      predictEndpoint,
      0,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'predictEndpoint',
      predictEndpoint,
      r'''https://[a-zA-Z0-9-.]*\.amazon(aws)?\.com[/]?''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(record, 'record');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.Predict'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MLModelId': mLModelId,
        'PredictEndpoint': predictEndpoint,
        'Record': record,
      },
    );

    return PredictOutput.fromJson(jsonResponse.body);
  }

  /// Updates the <code>BatchPredictionName</code> of a
  /// <code>BatchPrediction</code>.
  ///
  /// You can use the <code>GetBatchPrediction</code> operation to view the
  /// contents of the updated data element.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [batchPredictionId] :
  /// The ID assigned to the <code>BatchPrediction</code> during creation.
  ///
  /// Parameter [batchPredictionName] :
  /// A new user-supplied name or description of the
  /// <code>BatchPrediction</code>.
  Future<UpdateBatchPredictionOutput> updateBatchPrediction({
    @_s.required String batchPredictionId,
    @_s.required String batchPredictionName,
  }) async {
    ArgumentError.checkNotNull(batchPredictionId, 'batchPredictionId');
    _s.validateStringLength(
      'batchPredictionId',
      batchPredictionId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'batchPredictionId',
      batchPredictionId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(batchPredictionName, 'batchPredictionName');
    _s.validateStringLength(
      'batchPredictionName',
      batchPredictionName,
      0,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'batchPredictionName',
      batchPredictionName,
      r'''.*\S.*|^$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.UpdateBatchPrediction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BatchPredictionId': batchPredictionId,
        'BatchPredictionName': batchPredictionName,
      },
    );

    return UpdateBatchPredictionOutput.fromJson(jsonResponse.body);
  }

  /// Updates the <code>DataSourceName</code> of a <code>DataSource</code>.
  ///
  /// You can use the <code>GetDataSource</code> operation to view the contents
  /// of the updated data element.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataSourceId] :
  /// The ID assigned to the <code>DataSource</code> during creation.
  ///
  /// Parameter [dataSourceName] :
  /// A new user-supplied name or description of the <code>DataSource</code>
  /// that will replace the current description.
  Future<UpdateDataSourceOutput> updateDataSource({
    @_s.required String dataSourceId,
    @_s.required String dataSourceName,
  }) async {
    ArgumentError.checkNotNull(dataSourceId, 'dataSourceId');
    _s.validateStringLength(
      'dataSourceId',
      dataSourceId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dataSourceId',
      dataSourceId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataSourceName, 'dataSourceName');
    _s.validateStringLength(
      'dataSourceName',
      dataSourceName,
      0,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dataSourceName',
      dataSourceName,
      r'''.*\S.*|^$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.UpdateDataSource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataSourceId': dataSourceId,
        'DataSourceName': dataSourceName,
      },
    );

    return UpdateDataSourceOutput.fromJson(jsonResponse.body);
  }

  /// Updates the <code>EvaluationName</code> of an <code>Evaluation</code>.
  ///
  /// You can use the <code>GetEvaluation</code> operation to view the contents
  /// of the updated data element.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [evaluationId] :
  /// The ID assigned to the <code>Evaluation</code> during creation.
  ///
  /// Parameter [evaluationName] :
  /// A new user-supplied name or description of the <code>Evaluation</code>
  /// that will replace the current content.
  Future<UpdateEvaluationOutput> updateEvaluation({
    @_s.required String evaluationId,
    @_s.required String evaluationName,
  }) async {
    ArgumentError.checkNotNull(evaluationId, 'evaluationId');
    _s.validateStringLength(
      'evaluationId',
      evaluationId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'evaluationId',
      evaluationId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(evaluationName, 'evaluationName');
    _s.validateStringLength(
      'evaluationName',
      evaluationName,
      0,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'evaluationName',
      evaluationName,
      r'''.*\S.*|^$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.UpdateEvaluation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EvaluationId': evaluationId,
        'EvaluationName': evaluationName,
      },
    );

    return UpdateEvaluationOutput.fromJson(jsonResponse.body);
  }

  /// Updates the <code>MLModelName</code> and the <code>ScoreThreshold</code>
  /// of an <code>MLModel</code>.
  ///
  /// You can use the <code>GetMLModel</code> operation to view the contents of
  /// the updated data element.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [mLModelId] :
  /// The ID assigned to the <code>MLModel</code> during creation.
  ///
  /// Parameter [mLModelName] :
  /// A user-supplied name or description of the <code>MLModel</code>.
  ///
  /// Parameter [scoreThreshold] :
  /// The <code>ScoreThreshold</code> used in binary classification
  /// <code>MLModel</code> that marks the boundary between a positive prediction
  /// and a negative prediction.
  ///
  /// Output values greater than or equal to the <code>ScoreThreshold</code>
  /// receive a positive result from the <code>MLModel</code>, such as
  /// <code>true</code>. Output values less than the <code>ScoreThreshold</code>
  /// receive a negative response from the <code>MLModel</code>, such as
  /// <code>false</code>.
  Future<UpdateMLModelOutput> updateMLModel({
    @_s.required String mLModelId,
    String mLModelName,
    double scoreThreshold,
  }) async {
    ArgumentError.checkNotNull(mLModelId, 'mLModelId');
    _s.validateStringLength(
      'mLModelId',
      mLModelId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'mLModelId',
      mLModelId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'mLModelName',
      mLModelName,
      0,
      1024,
    );
    _s.validateStringPattern(
      'mLModelName',
      mLModelName,
      r'''.*\S.*|^$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonML_20141212.UpdateMLModel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MLModelId': mLModelId,
        if (mLModelName != null) 'MLModelName': mLModelName,
        if (scoreThreshold != null) 'ScoreThreshold': scoreThreshold,
      },
    );

    return UpdateMLModelOutput.fromJson(jsonResponse.body);
  }
}

/// Amazon ML returns the following elements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddTagsOutput {
  /// The ID of the ML object that was tagged.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The type of the ML object that was tagged.
  @_s.JsonKey(name: 'ResourceType')
  final TaggableResourceType resourceType;

  AddTagsOutput({
    this.resourceId,
    this.resourceType,
  });
  factory AddTagsOutput.fromJson(Map<String, dynamic> json) =>
      _$AddTagsOutputFromJson(json);
}

/// The function used to train an <code>MLModel</code>. Training choices
/// supported by Amazon ML include the following:
///
/// <ul>
/// <li> <code>SGD</code> - Stochastic Gradient Descent.</li>
/// <li> <code>RandomForest</code> - Random forest of decision trees.</li>
/// </ul>
enum Algorithm {
  @_s.JsonValue('sgd')
  sgd,
}

/// Represents the output of a <code>GetBatchPrediction</code> operation.
///
/// The content consists of the detailed metadata, the status, and the data file
/// information of a <code>Batch Prediction</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchPrediction {
  /// The ID of the <code>DataSource</code> that points to the group of
  /// observations to predict.
  @_s.JsonKey(name: 'BatchPredictionDataSourceId')
  final String batchPredictionDataSourceId;

  /// The ID assigned to the <code>BatchPrediction</code> at creation. This value
  /// should be identical to the value of the <code>BatchPredictionID</code> in
  /// the request.
  @_s.JsonKey(name: 'BatchPredictionId')
  final String batchPredictionId;
  @_s.JsonKey(name: 'ComputeTime')
  final int computeTime;

  /// The time that the <code>BatchPrediction</code> was created. The time is
  /// expressed in epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The AWS user account that invoked the <code>BatchPrediction</code>. The
  /// account type can be either an AWS root account or an AWS Identity and Access
  /// Management (IAM) user account.
  @_s.JsonKey(name: 'CreatedByIamUser')
  final String createdByIamUser;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'FinishedAt')
  final DateTime finishedAt;

  /// The location of the data file or directory in Amazon Simple Storage Service
  /// (Amazon S3).
  @_s.JsonKey(name: 'InputDataLocationS3')
  final String inputDataLocationS3;
  @_s.JsonKey(name: 'InvalidRecordCount')
  final int invalidRecordCount;

  /// The time of the most recent edit to the <code>BatchPrediction</code>. The
  /// time is expressed in epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The ID of the <code>MLModel</code> that generated predictions for the
  /// <code>BatchPrediction</code> request.
  @_s.JsonKey(name: 'MLModelId')
  final String mLModelId;

  /// A description of the most recent details about processing the batch
  /// prediction request.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// A user-supplied name or description of the <code>BatchPrediction</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The location of an Amazon S3 bucket or directory to receive the operation
  /// results. The following substrings are not allowed in the <code>s3 key</code>
  /// portion of the <code>outputURI</code> field: ':', '//', '/./', '/../'.
  @_s.JsonKey(name: 'OutputUri')
  final String outputUri;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartedAt')
  final DateTime startedAt;

  /// The status of the <code>BatchPrediction</code>. This element can have one of
  /// the following values:
  ///
  /// <ul>
  /// <li> <code>PENDING</code> - Amazon Machine Learning (Amazon ML) submitted a
  /// request to generate predictions for a batch of observations.</li>
  /// <li> <code>INPROGRESS</code> - The process is underway.</li>
  /// <li> <code>FAILED</code> - The request to perform a batch prediction did not
  /// run to completion. It is not usable.</li>
  /// <li> <code>COMPLETED</code> - The batch prediction process completed
  /// successfully.</li>
  /// <li> <code>DELETED</code> - The <code>BatchPrediction</code> is marked as
  /// deleted. It is not usable.</li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final EntityStatus status;
  @_s.JsonKey(name: 'TotalRecordCount')
  final int totalRecordCount;

  BatchPrediction({
    this.batchPredictionDataSourceId,
    this.batchPredictionId,
    this.computeTime,
    this.createdAt,
    this.createdByIamUser,
    this.finishedAt,
    this.inputDataLocationS3,
    this.invalidRecordCount,
    this.lastUpdatedAt,
    this.mLModelId,
    this.message,
    this.name,
    this.outputUri,
    this.startedAt,
    this.status,
    this.totalRecordCount,
  });
  factory BatchPrediction.fromJson(Map<String, dynamic> json) =>
      _$BatchPredictionFromJson(json);
}

/// A list of the variables to use in searching or filtering
/// <code>BatchPrediction</code>.
///
/// <ul>
/// <li> <code>CreatedAt</code> - Sets the search criteria to
/// <code>BatchPrediction</code> creation date.</li>
/// <li> <code>Status</code> - Sets the search criteria to
/// <code>BatchPrediction</code> status.</li>
/// <li> <code>Name</code> - Sets the search criteria to the contents of
/// <code>BatchPrediction</code><b> </b> <code>Name</code>.</li>
/// <li> <code>IAMUser</code> - Sets the search criteria to the user account
/// that invoked the <code>BatchPrediction</code> creation.</li>
/// <li> <code>MLModelId</code> - Sets the search criteria to the
/// <code>MLModel</code> used in the <code>BatchPrediction</code>.</li>
/// <li> <code>DataSourceId</code> - Sets the search criteria to the
/// <code>DataSource</code> used in the <code>BatchPrediction</code>.</li>
/// <li> <code>DataURI</code> - Sets the search criteria to the data file(s)
/// used in the <code>BatchPrediction</code>. The URL can identify either a file
/// or an Amazon Simple Storage Service (Amazon S3) bucket or directory.</li>
/// </ul>
enum BatchPredictionFilterVariable {
  @_s.JsonValue('CreatedAt')
  createdAt,
  @_s.JsonValue('LastUpdatedAt')
  lastUpdatedAt,
  @_s.JsonValue('Status')
  status,
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('IAMUser')
  iAMUser,
  @_s.JsonValue('MLModelId')
  mLModelId,
  @_s.JsonValue('DataSourceId')
  dataSourceId,
  @_s.JsonValue('DataURI')
  dataURI,
}

extension on BatchPredictionFilterVariable {
  String toValue() {
    switch (this) {
      case BatchPredictionFilterVariable.createdAt:
        return 'CreatedAt';
      case BatchPredictionFilterVariable.lastUpdatedAt:
        return 'LastUpdatedAt';
      case BatchPredictionFilterVariable.status:
        return 'Status';
      case BatchPredictionFilterVariable.name:
        return 'Name';
      case BatchPredictionFilterVariable.iAMUser:
        return 'IAMUser';
      case BatchPredictionFilterVariable.mLModelId:
        return 'MLModelId';
      case BatchPredictionFilterVariable.dataSourceId:
        return 'DataSourceId';
      case BatchPredictionFilterVariable.dataURI:
        return 'DataURI';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the output of a <code>CreateBatchPrediction</code> operation, and
/// is an acknowledgement that Amazon ML received the request.
///
/// The <code>CreateBatchPrediction</code> operation is asynchronous. You can
/// poll for status updates by using the <code>&gt;GetBatchPrediction</code>
/// operation and checking the <code>Status</code> parameter of the result.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBatchPredictionOutput {
  /// A user-supplied ID that uniquely identifies the
  /// <code>BatchPrediction</code>. This value is identical to the value of the
  /// <code>BatchPredictionId</code> in the request.
  @_s.JsonKey(name: 'BatchPredictionId')
  final String batchPredictionId;

  CreateBatchPredictionOutput({
    this.batchPredictionId,
  });
  factory CreateBatchPredictionOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateBatchPredictionOutputFromJson(json);
}

/// Represents the output of a <code>CreateDataSourceFromRDS</code> operation,
/// and is an acknowledgement that Amazon ML received the request.
///
/// The <code>CreateDataSourceFromRDS</code>&gt; operation is asynchronous. You
/// can poll for updates by using the <code>GetBatchPrediction</code> operation
/// and checking the <code>Status</code> parameter. You can inspect the
/// <code>Message</code> when <code>Status</code> shows up as
/// <code>FAILED</code>. You can also check the progress of the copy operation
/// by going to the <code>DataPipeline</code> console and looking up the
/// pipeline using the <code>pipelineId </code> from the describe call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDataSourceFromRDSOutput {
  /// A user-supplied ID that uniquely identifies the datasource. This value
  /// should be identical to the value of the <code>DataSourceID</code> in the
  /// request.
  @_s.JsonKey(name: 'DataSourceId')
  final String dataSourceId;

  CreateDataSourceFromRDSOutput({
    this.dataSourceId,
  });
  factory CreateDataSourceFromRDSOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateDataSourceFromRDSOutputFromJson(json);
}

/// Represents the output of a <code>CreateDataSourceFromRedshift</code>
/// operation, and is an acknowledgement that Amazon ML received the request.
///
/// The <code>CreateDataSourceFromRedshift</code> operation is asynchronous. You
/// can poll for updates by using the <code>GetBatchPrediction</code> operation
/// and checking the <code>Status</code> parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDataSourceFromRedshiftOutput {
  /// A user-supplied ID that uniquely identifies the datasource. This value
  /// should be identical to the value of the <code>DataSourceID</code> in the
  /// request.
  @_s.JsonKey(name: 'DataSourceId')
  final String dataSourceId;

  CreateDataSourceFromRedshiftOutput({
    this.dataSourceId,
  });
  factory CreateDataSourceFromRedshiftOutput.fromJson(
          Map<String, dynamic> json) =>
      _$CreateDataSourceFromRedshiftOutputFromJson(json);
}

/// Represents the output of a <code>CreateDataSourceFromS3</code> operation,
/// and is an acknowledgement that Amazon ML received the request.
///
/// The <code>CreateDataSourceFromS3</code> operation is asynchronous. You can
/// poll for updates by using the <code>GetBatchPrediction</code> operation and
/// checking the <code>Status</code> parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDataSourceFromS3Output {
  /// A user-supplied ID that uniquely identifies the <code>DataSource</code>.
  /// This value should be identical to the value of the <code>DataSourceID</code>
  /// in the request.
  @_s.JsonKey(name: 'DataSourceId')
  final String dataSourceId;

  CreateDataSourceFromS3Output({
    this.dataSourceId,
  });
  factory CreateDataSourceFromS3Output.fromJson(Map<String, dynamic> json) =>
      _$CreateDataSourceFromS3OutputFromJson(json);
}

/// Represents the output of a <code>CreateEvaluation</code> operation, and is
/// an acknowledgement that Amazon ML received the request.
///
/// <code>CreateEvaluation</code> operation is asynchronous. You can poll for
/// status updates by using the <code>GetEvcaluation</code> operation and
/// checking the <code>Status</code> parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateEvaluationOutput {
  /// The user-supplied ID that uniquely identifies the <code>Evaluation</code>.
  /// This value should be identical to the value of the <code>EvaluationId</code>
  /// in the request.
  @_s.JsonKey(name: 'EvaluationId')
  final String evaluationId;

  CreateEvaluationOutput({
    this.evaluationId,
  });
  factory CreateEvaluationOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateEvaluationOutputFromJson(json);
}

/// Represents the output of a <code>CreateMLModel</code> operation, and is an
/// acknowledgement that Amazon ML received the request.
///
/// The <code>CreateMLModel</code> operation is asynchronous. You can poll for
/// status updates by using the <code>GetMLModel</code> operation and checking
/// the <code>Status</code> parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateMLModelOutput {
  /// A user-supplied ID that uniquely identifies the <code>MLModel</code>. This
  /// value should be identical to the value of the <code>MLModelId</code> in the
  /// request.
  @_s.JsonKey(name: 'MLModelId')
  final String mLModelId;

  CreateMLModelOutput({
    this.mLModelId,
  });
  factory CreateMLModelOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateMLModelOutputFromJson(json);
}

/// Represents the output of an <code>CreateRealtimeEndpoint</code> operation.
///
/// The result contains the <code>MLModelId</code> and the endpoint information
/// for the <code>MLModel</code>.
/// <note>
/// The endpoint information includes the URI of the <code>MLModel</code>; that
/// is, the location to send online prediction requests for the specified
/// <code>MLModel</code>.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRealtimeEndpointOutput {
  /// A user-supplied ID that uniquely identifies the <code>MLModel</code>. This
  /// value should be identical to the value of the <code>MLModelId</code> in the
  /// request.
  @_s.JsonKey(name: 'MLModelId')
  final String mLModelId;

  /// The endpoint information of the <code>MLModel</code>
  @_s.JsonKey(name: 'RealtimeEndpointInfo')
  final RealtimeEndpointInfo realtimeEndpointInfo;

  CreateRealtimeEndpointOutput({
    this.mLModelId,
    this.realtimeEndpointInfo,
  });
  factory CreateRealtimeEndpointOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateRealtimeEndpointOutputFromJson(json);
}

/// Represents the output of the <code>GetDataSource</code> operation.
///
/// The content consists of the detailed metadata and data file information and
/// the current status of the <code>DataSource</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataSource {
  /// The parameter is <code>true</code> if statistics need to be generated from
  /// the observation data.
  @_s.JsonKey(name: 'ComputeStatistics')
  final bool computeStatistics;
  @_s.JsonKey(name: 'ComputeTime')
  final int computeTime;

  /// The time that the <code>DataSource</code> was created. The time is expressed
  /// in epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The AWS user account from which the <code>DataSource</code> was created. The
  /// account type can be either an AWS root account or an AWS Identity and Access
  /// Management (IAM) user account.
  @_s.JsonKey(name: 'CreatedByIamUser')
  final String createdByIamUser;

  /// The location and name of the data in Amazon Simple Storage Service (Amazon
  /// S3) that is used by a <code>DataSource</code>.
  @_s.JsonKey(name: 'DataLocationS3')
  final String dataLocationS3;

  /// A JSON string that represents the splitting and rearrangement requirement
  /// used when this <code>DataSource</code> was created.
  @_s.JsonKey(name: 'DataRearrangement')
  final String dataRearrangement;

  /// The total number of observations contained in the data files that the
  /// <code>DataSource</code> references.
  @_s.JsonKey(name: 'DataSizeInBytes')
  final int dataSizeInBytes;

  /// The ID that is assigned to the <code>DataSource</code> during creation.
  @_s.JsonKey(name: 'DataSourceId')
  final String dataSourceId;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'FinishedAt')
  final DateTime finishedAt;

  /// The time of the most recent edit to the <code>BatchPrediction</code>. The
  /// time is expressed in epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// A description of the most recent details about creating the
  /// <code>DataSource</code>.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// A user-supplied name or description of the <code>DataSource</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The number of data files referenced by the <code>DataSource</code>.
  @_s.JsonKey(name: 'NumberOfFiles')
  final int numberOfFiles;
  @_s.JsonKey(name: 'RDSMetadata')
  final RDSMetadata rDSMetadata;
  @_s.JsonKey(name: 'RedshiftMetadata')
  final RedshiftMetadata redshiftMetadata;
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartedAt')
  final DateTime startedAt;

  /// The current status of the <code>DataSource</code>. This element can have one
  /// of the following values:
  ///
  /// <ul>
  /// <li>PENDING - Amazon Machine Learning (Amazon ML) submitted a request to
  /// create a <code>DataSource</code>.</li>
  /// <li>INPROGRESS - The creation process is underway.</li>
  /// <li>FAILED - The request to create a <code>DataSource</code> did not run to
  /// completion. It is not usable.</li>
  /// <li>COMPLETED - The creation process completed successfully.</li>
  /// <li>DELETED - The <code>DataSource</code> is marked as deleted. It is not
  /// usable.</li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final EntityStatus status;

  DataSource({
    this.computeStatistics,
    this.computeTime,
    this.createdAt,
    this.createdByIamUser,
    this.dataLocationS3,
    this.dataRearrangement,
    this.dataSizeInBytes,
    this.dataSourceId,
    this.finishedAt,
    this.lastUpdatedAt,
    this.message,
    this.name,
    this.numberOfFiles,
    this.rDSMetadata,
    this.redshiftMetadata,
    this.roleARN,
    this.startedAt,
    this.status,
  });
  factory DataSource.fromJson(Map<String, dynamic> json) =>
      _$DataSourceFromJson(json);
}

/// A list of the variables to use in searching or filtering
/// <code>DataSource</code>.
///
/// <ul>
/// <li> <code>CreatedAt</code> - Sets the search criteria to
/// <code>DataSource</code> creation date.</li>
/// <li> <code>Status</code> - Sets the search criteria to
/// <code>DataSource</code> status.</li>
/// <li> <code>Name</code> - Sets the search criteria to the contents of
/// <code>DataSource</code> <b> </b> <code>Name</code>.</li>
/// <li> <code>DataUri</code> - Sets the search criteria to the URI of data
/// files used to create the <code>DataSource</code>. The URI can identify
/// either a file or an Amazon Simple Storage Service (Amazon S3) bucket or
/// directory.</li>
/// <li> <code>IAMUser</code> - Sets the search criteria to the user account
/// that invoked the <code>DataSource</code> creation.</li>
/// </ul> <note><title>Note</title>
/// The variable names should match the variable names in the
/// <code>DataSource</code>.
/// </note>
enum DataSourceFilterVariable {
  @_s.JsonValue('CreatedAt')
  createdAt,
  @_s.JsonValue('LastUpdatedAt')
  lastUpdatedAt,
  @_s.JsonValue('Status')
  status,
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('DataLocationS3')
  dataLocationS3,
  @_s.JsonValue('IAMUser')
  iAMUser,
}

extension on DataSourceFilterVariable {
  String toValue() {
    switch (this) {
      case DataSourceFilterVariable.createdAt:
        return 'CreatedAt';
      case DataSourceFilterVariable.lastUpdatedAt:
        return 'LastUpdatedAt';
      case DataSourceFilterVariable.status:
        return 'Status';
      case DataSourceFilterVariable.name:
        return 'Name';
      case DataSourceFilterVariable.dataLocationS3:
        return 'DataLocationS3';
      case DataSourceFilterVariable.iAMUser:
        return 'IAMUser';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the output of a <code>DeleteBatchPrediction</code> operation.
///
/// You can use the <code>GetBatchPrediction</code> operation and check the
/// value of the <code>Status</code> parameter to see whether a
/// <code>BatchPrediction</code> is marked as <code>DELETED</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBatchPredictionOutput {
  /// A user-supplied ID that uniquely identifies the
  /// <code>BatchPrediction</code>. This value should be identical to the value of
  /// the <code>BatchPredictionID</code> in the request.
  @_s.JsonKey(name: 'BatchPredictionId')
  final String batchPredictionId;

  DeleteBatchPredictionOutput({
    this.batchPredictionId,
  });
  factory DeleteBatchPredictionOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteBatchPredictionOutputFromJson(json);
}

/// Represents the output of a <code>DeleteDataSource</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDataSourceOutput {
  /// A user-supplied ID that uniquely identifies the <code>DataSource</code>.
  /// This value should be identical to the value of the <code>DataSourceID</code>
  /// in the request.
  @_s.JsonKey(name: 'DataSourceId')
  final String dataSourceId;

  DeleteDataSourceOutput({
    this.dataSourceId,
  });
  factory DeleteDataSourceOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteDataSourceOutputFromJson(json);
}

/// Represents the output of a <code>DeleteEvaluation</code> operation. The
/// output indicates that Amazon Machine Learning (Amazon ML) received the
/// request.
///
/// You can use the <code>GetEvaluation</code> operation and check the value of
/// the <code>Status</code> parameter to see whether an <code>Evaluation</code>
/// is marked as <code>DELETED</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteEvaluationOutput {
  /// A user-supplied ID that uniquely identifies the <code>Evaluation</code>.
  /// This value should be identical to the value of the <code>EvaluationId</code>
  /// in the request.
  @_s.JsonKey(name: 'EvaluationId')
  final String evaluationId;

  DeleteEvaluationOutput({
    this.evaluationId,
  });
  factory DeleteEvaluationOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteEvaluationOutputFromJson(json);
}

/// Represents the output of a <code>DeleteMLModel</code> operation.
///
/// You can use the <code>GetMLModel</code> operation and check the value of the
/// <code>Status</code> parameter to see whether an <code>MLModel</code> is
/// marked as <code>DELETED</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteMLModelOutput {
  /// A user-supplied ID that uniquely identifies the <code>MLModel</code>. This
  /// value should be identical to the value of the <code>MLModelID</code> in the
  /// request.
  @_s.JsonKey(name: 'MLModelId')
  final String mLModelId;

  DeleteMLModelOutput({
    this.mLModelId,
  });
  factory DeleteMLModelOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteMLModelOutputFromJson(json);
}

/// Represents the output of an <code>DeleteRealtimeEndpoint</code> operation.
///
/// The result contains the <code>MLModelId</code> and the endpoint information
/// for the <code>MLModel</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRealtimeEndpointOutput {
  /// A user-supplied ID that uniquely identifies the <code>MLModel</code>. This
  /// value should be identical to the value of the <code>MLModelId</code> in the
  /// request.
  @_s.JsonKey(name: 'MLModelId')
  final String mLModelId;

  /// The endpoint information of the <code>MLModel</code>
  @_s.JsonKey(name: 'RealtimeEndpointInfo')
  final RealtimeEndpointInfo realtimeEndpointInfo;

  DeleteRealtimeEndpointOutput({
    this.mLModelId,
    this.realtimeEndpointInfo,
  });
  factory DeleteRealtimeEndpointOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteRealtimeEndpointOutputFromJson(json);
}

/// Amazon ML returns the following elements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTagsOutput {
  /// The ID of the ML object from which tags were deleted.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The type of the ML object from which tags were deleted.
  @_s.JsonKey(name: 'ResourceType')
  final TaggableResourceType resourceType;

  DeleteTagsOutput({
    this.resourceId,
    this.resourceType,
  });
  factory DeleteTagsOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteTagsOutputFromJson(json);
}

/// Represents the output of a <code>DescribeBatchPredictions</code> operation.
/// The content is essentially a list of <code>BatchPrediction</code>s.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBatchPredictionsOutput {
  /// The ID of the next page in the paginated results that indicates at least one
  /// more page follows.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of <code>BatchPrediction</code> objects that meet the search
  /// criteria.
  @_s.JsonKey(name: 'Results')
  final List<BatchPrediction> results;

  DescribeBatchPredictionsOutput({
    this.nextToken,
    this.results,
  });
  factory DescribeBatchPredictionsOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeBatchPredictionsOutputFromJson(json);
}

/// Represents the query results from a <a>DescribeDataSources</a> operation.
/// The content is essentially a list of <code>DataSource</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDataSourcesOutput {
  /// An ID of the next page in the paginated results that indicates at least one
  /// more page follows.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of <code>DataSource</code> that meet the search criteria.
  @_s.JsonKey(name: 'Results')
  final List<DataSource> results;

  DescribeDataSourcesOutput({
    this.nextToken,
    this.results,
  });
  factory DescribeDataSourcesOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeDataSourcesOutputFromJson(json);
}

/// Represents the query results from a <code>DescribeEvaluations</code>
/// operation. The content is essentially a list of <code>Evaluation</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEvaluationsOutput {
  /// The ID of the next page in the paginated results that indicates at least one
  /// more page follows.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of <code>Evaluation</code> that meet the search criteria.
  @_s.JsonKey(name: 'Results')
  final List<Evaluation> results;

  DescribeEvaluationsOutput({
    this.nextToken,
    this.results,
  });
  factory DescribeEvaluationsOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeEvaluationsOutputFromJson(json);
}

/// Represents the output of a <code>DescribeMLModels</code> operation. The
/// content is essentially a list of <code>MLModel</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMLModelsOutput {
  /// The ID of the next page in the paginated results that indicates at least one
  /// more page follows.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of <code>MLModel</code> that meet the search criteria.
  @_s.JsonKey(name: 'Results')
  final List<MLModel> results;

  DescribeMLModelsOutput({
    this.nextToken,
    this.results,
  });
  factory DescribeMLModelsOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeMLModelsOutputFromJson(json);
}

/// Amazon ML returns the following elements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTagsOutput {
  /// The ID of the tagged ML object.
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The type of the tagged ML object.
  @_s.JsonKey(name: 'ResourceType')
  final TaggableResourceType resourceType;

  /// A list of tags associated with the ML object.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  DescribeTagsOutput({
    this.resourceId,
    this.resourceType,
    this.tags,
  });
  factory DescribeTagsOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeTagsOutputFromJson(json);
}

/// Contains the key values of <code>DetailsMap</code>:
/// <code>PredictiveModelType</code> - Indicates the type of the
/// <code>MLModel</code>. <code>Algorithm</code> - Indicates the algorithm that
/// was used for the <code>MLModel</code>.
enum DetailsAttributes {
  @_s.JsonValue('PredictiveModelType')
  predictiveModelType,
  @_s.JsonValue('Algorithm')
  algorithm,
}

/// Object status with the following possible values:
///
/// <ul>
/// <li><code>PENDING</code></li>
/// <li><code>INPROGRESS</code></li>
/// <li><code>FAILED</code></li>
/// <li><code>COMPLETED</code></li>
/// <li><code>DELETED</code></li>
/// </ul>
enum EntityStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('INPROGRESS')
  inprogress,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('DELETED')
  deleted,
}

/// Represents the output of <code>GetEvaluation</code> operation.
///
/// The content consists of the detailed metadata and data file information and
/// the current status of the <code>Evaluation</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Evaluation {
  @_s.JsonKey(name: 'ComputeTime')
  final int computeTime;

  /// The time that the <code>Evaluation</code> was created. The time is expressed
  /// in epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The AWS user account that invoked the evaluation. The account type can be
  /// either an AWS root account or an AWS Identity and Access Management (IAM)
  /// user account.
  @_s.JsonKey(name: 'CreatedByIamUser')
  final String createdByIamUser;

  /// The ID of the <code>DataSource</code> that is used to evaluate the
  /// <code>MLModel</code>.
  @_s.JsonKey(name: 'EvaluationDataSourceId')
  final String evaluationDataSourceId;

  /// The ID that is assigned to the <code>Evaluation</code> at creation.
  @_s.JsonKey(name: 'EvaluationId')
  final String evaluationId;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'FinishedAt')
  final DateTime finishedAt;

  /// The location and name of the data in Amazon Simple Storage Server (Amazon
  /// S3) that is used in the evaluation.
  @_s.JsonKey(name: 'InputDataLocationS3')
  final String inputDataLocationS3;

  /// The time of the most recent edit to the <code>Evaluation</code>. The time is
  /// expressed in epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The ID of the <code>MLModel</code> that is the focus of the evaluation.
  @_s.JsonKey(name: 'MLModelId')
  final String mLModelId;

  /// A description of the most recent details about evaluating the
  /// <code>MLModel</code>.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// A user-supplied name or description of the <code>Evaluation</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Measurements of how well the <code>MLModel</code> performed, using
  /// observations referenced by the <code>DataSource</code>. One of the following
  /// metrics is returned, based on the type of the <code>MLModel</code>:
  ///
  /// <ul>
  /// <li>
  /// BinaryAUC: A binary <code>MLModel</code> uses the Area Under the Curve (AUC)
  /// technique to measure performance.
  /// </li>
  /// <li>
  /// RegressionRMSE: A regression <code>MLModel</code> uses the Root Mean Square
  /// Error (RMSE) technique to measure performance. RMSE measures the difference
  /// between predicted and actual values for a single variable.
  /// </li>
  /// <li>
  /// MulticlassAvgFScore: A multiclass <code>MLModel</code> uses the F1 score
  /// technique to measure performance.
  /// </li>
  /// </ul>
  /// For more information about performance metrics, please see the <a
  /// href="http://docs.aws.amazon.com/machine-learning/latest/dg">Amazon Machine
  /// Learning Developer Guide</a>.
  @_s.JsonKey(name: 'PerformanceMetrics')
  final PerformanceMetrics performanceMetrics;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartedAt')
  final DateTime startedAt;

  /// The status of the evaluation. This element can have one of the following
  /// values:
  ///
  /// <ul>
  /// <li> <code>PENDING</code> - Amazon Machine Learning (Amazon ML) submitted a
  /// request to evaluate an <code>MLModel</code>.</li>
  /// <li> <code>INPROGRESS</code> - The evaluation is underway.</li>
  /// <li> <code>FAILED</code> - The request to evaluate an <code>MLModel</code>
  /// did not run to completion. It is not usable.</li>
  /// <li> <code>COMPLETED</code> - The evaluation process completed
  /// successfully.</li>
  /// <li> <code>DELETED</code> - The <code>Evaluation</code> is marked as
  /// deleted. It is not usable.</li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final EntityStatus status;

  Evaluation({
    this.computeTime,
    this.createdAt,
    this.createdByIamUser,
    this.evaluationDataSourceId,
    this.evaluationId,
    this.finishedAt,
    this.inputDataLocationS3,
    this.lastUpdatedAt,
    this.mLModelId,
    this.message,
    this.name,
    this.performanceMetrics,
    this.startedAt,
    this.status,
  });
  factory Evaluation.fromJson(Map<String, dynamic> json) =>
      _$EvaluationFromJson(json);
}

/// A list of the variables to use in searching or filtering
/// <code>Evaluation</code>.
///
/// <ul>
/// <li> <code>CreatedAt</code> - Sets the search criteria to
/// <code>Evaluation</code> creation date.</li>
/// <li> <code>Status</code> - Sets the search criteria to
/// <code>Evaluation</code> status.</li>
/// <li> <code>Name</code> - Sets the search criteria to the contents of
/// <code>Evaluation</code> <b> </b> <code>Name</code>.</li>
/// <li> <code>IAMUser</code> - Sets the search criteria to the user account
/// that invoked an evaluation.</li>
/// <li> <code>MLModelId</code> - Sets the search criteria to the
/// <code>Predictor</code> that was evaluated.</li>
/// <li> <code>DataSourceId</code> - Sets the search criteria to the
/// <code>DataSource</code> used in evaluation.</li>
/// <li> <code>DataUri</code> - Sets the search criteria to the data file(s)
/// used in evaluation. The URL can identify either a file or an Amazon Simple
/// Storage Service (Amazon S3) bucket or directory.</li>
/// </ul>
enum EvaluationFilterVariable {
  @_s.JsonValue('CreatedAt')
  createdAt,
  @_s.JsonValue('LastUpdatedAt')
  lastUpdatedAt,
  @_s.JsonValue('Status')
  status,
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('IAMUser')
  iAMUser,
  @_s.JsonValue('MLModelId')
  mLModelId,
  @_s.JsonValue('DataSourceId')
  dataSourceId,
  @_s.JsonValue('DataURI')
  dataURI,
}

extension on EvaluationFilterVariable {
  String toValue() {
    switch (this) {
      case EvaluationFilterVariable.createdAt:
        return 'CreatedAt';
      case EvaluationFilterVariable.lastUpdatedAt:
        return 'LastUpdatedAt';
      case EvaluationFilterVariable.status:
        return 'Status';
      case EvaluationFilterVariable.name:
        return 'Name';
      case EvaluationFilterVariable.iAMUser:
        return 'IAMUser';
      case EvaluationFilterVariable.mLModelId:
        return 'MLModelId';
      case EvaluationFilterVariable.dataSourceId:
        return 'DataSourceId';
      case EvaluationFilterVariable.dataURI:
        return 'DataURI';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the output of a <code>GetBatchPrediction</code> operation and
/// describes a <code>BatchPrediction</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBatchPredictionOutput {
  /// The ID of the <code>DataSource</code> that was used to create the
  /// <code>BatchPrediction</code>.
  @_s.JsonKey(name: 'BatchPredictionDataSourceId')
  final String batchPredictionDataSourceId;

  /// An ID assigned to the <code>BatchPrediction</code> at creation. This value
  /// should be identical to the value of the <code>BatchPredictionID</code> in
  /// the request.
  @_s.JsonKey(name: 'BatchPredictionId')
  final String batchPredictionId;

  /// The approximate CPU time in milliseconds that Amazon Machine Learning spent
  /// processing the <code>BatchPrediction</code>, normalized and scaled on
  /// computation resources. <code>ComputeTime</code> is only available if the
  /// <code>BatchPrediction</code> is in the <code>COMPLETED</code> state.
  @_s.JsonKey(name: 'ComputeTime')
  final int computeTime;

  /// The time when the <code>BatchPrediction</code> was created. The time is
  /// expressed in epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The AWS user account that invoked the <code>BatchPrediction</code>. The
  /// account type can be either an AWS root account or an AWS Identity and Access
  /// Management (IAM) user account.
  @_s.JsonKey(name: 'CreatedByIamUser')
  final String createdByIamUser;

  /// The epoch time when Amazon Machine Learning marked the
  /// <code>BatchPrediction</code> as <code>COMPLETED</code> or
  /// <code>FAILED</code>. <code>FinishedAt</code> is only available when the
  /// <code>BatchPrediction</code> is in the <code>COMPLETED</code> or
  /// <code>FAILED</code> state.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'FinishedAt')
  final DateTime finishedAt;

  /// The location of the data file or directory in Amazon Simple Storage Service
  /// (Amazon S3).
  @_s.JsonKey(name: 'InputDataLocationS3')
  final String inputDataLocationS3;

  /// The number of invalid records that Amazon Machine Learning saw while
  /// processing the <code>BatchPrediction</code>.
  @_s.JsonKey(name: 'InvalidRecordCount')
  final int invalidRecordCount;

  /// The time of the most recent edit to <code>BatchPrediction</code>. The time
  /// is expressed in epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// A link to the file that contains logs of the
  /// <code>CreateBatchPrediction</code> operation.
  @_s.JsonKey(name: 'LogUri')
  final String logUri;

  /// The ID of the <code>MLModel</code> that generated predictions for the
  /// <code>BatchPrediction</code> request.
  @_s.JsonKey(name: 'MLModelId')
  final String mLModelId;

  /// A description of the most recent details about processing the batch
  /// prediction request.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// A user-supplied name or description of the <code>BatchPrediction</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The location of an Amazon S3 bucket or directory to receive the operation
  /// results.
  @_s.JsonKey(name: 'OutputUri')
  final String outputUri;

  /// The epoch time when Amazon Machine Learning marked the
  /// <code>BatchPrediction</code> as <code>INPROGRESS</code>.
  /// <code>StartedAt</code> isn't available if the <code>BatchPrediction</code>
  /// is in the <code>PENDING</code> state.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartedAt')
  final DateTime startedAt;

  /// The status of the <code>BatchPrediction</code>, which can be one of the
  /// following values:
  ///
  /// <ul>
  /// <li> <code>PENDING</code> - Amazon Machine Learning (Amazon ML) submitted a
  /// request to generate batch predictions.</li>
  /// <li> <code>INPROGRESS</code> - The batch predictions are in progress.</li>
  /// <li> <code>FAILED</code> - The request to perform a batch prediction did not
  /// run to completion. It is not usable.</li>
  /// <li> <code>COMPLETED</code> - The batch prediction process completed
  /// successfully.</li>
  /// <li> <code>DELETED</code> - The <code>BatchPrediction</code> is marked as
  /// deleted. It is not usable.</li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final EntityStatus status;

  /// The number of total records that Amazon Machine Learning saw while
  /// processing the <code>BatchPrediction</code>.
  @_s.JsonKey(name: 'TotalRecordCount')
  final int totalRecordCount;

  GetBatchPredictionOutput({
    this.batchPredictionDataSourceId,
    this.batchPredictionId,
    this.computeTime,
    this.createdAt,
    this.createdByIamUser,
    this.finishedAt,
    this.inputDataLocationS3,
    this.invalidRecordCount,
    this.lastUpdatedAt,
    this.logUri,
    this.mLModelId,
    this.message,
    this.name,
    this.outputUri,
    this.startedAt,
    this.status,
    this.totalRecordCount,
  });
  factory GetBatchPredictionOutput.fromJson(Map<String, dynamic> json) =>
      _$GetBatchPredictionOutputFromJson(json);
}

/// Represents the output of a <code>GetDataSource</code> operation and
/// describes a <code>DataSource</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDataSourceOutput {
  /// The parameter is <code>true</code> if statistics need to be generated from
  /// the observation data.
  @_s.JsonKey(name: 'ComputeStatistics')
  final bool computeStatistics;

  /// The approximate CPU time in milliseconds that Amazon Machine Learning spent
  /// processing the <code>DataSource</code>, normalized and scaled on computation
  /// resources. <code>ComputeTime</code> is only available if the
  /// <code>DataSource</code> is in the <code>COMPLETED</code> state and the
  /// <code>ComputeStatistics</code> is set to true.
  @_s.JsonKey(name: 'ComputeTime')
  final int computeTime;

  /// The time that the <code>DataSource</code> was created. The time is expressed
  /// in epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The AWS user account from which the <code>DataSource</code> was created. The
  /// account type can be either an AWS root account or an AWS Identity and Access
  /// Management (IAM) user account.
  @_s.JsonKey(name: 'CreatedByIamUser')
  final String createdByIamUser;

  /// The location of the data file or directory in Amazon Simple Storage Service
  /// (Amazon S3).
  @_s.JsonKey(name: 'DataLocationS3')
  final String dataLocationS3;

  /// A JSON string that represents the splitting and rearrangement requirement
  /// used when this <code>DataSource</code> was created.
  @_s.JsonKey(name: 'DataRearrangement')
  final String dataRearrangement;

  /// The total size of observations in the data files.
  @_s.JsonKey(name: 'DataSizeInBytes')
  final int dataSizeInBytes;

  /// The ID assigned to the <code>DataSource</code> at creation. This value
  /// should be identical to the value of the <code>DataSourceId</code> in the
  /// request.
  @_s.JsonKey(name: 'DataSourceId')
  final String dataSourceId;

  /// The schema used by all of the data files of this <code>DataSource</code>.
  /// <note><title>Note</title>
  /// This parameter is provided as part of the verbose format.
  /// </note>
  @_s.JsonKey(name: 'DataSourceSchema')
  final String dataSourceSchema;

  /// The epoch time when Amazon Machine Learning marked the
  /// <code>DataSource</code> as <code>COMPLETED</code> or <code>FAILED</code>.
  /// <code>FinishedAt</code> is only available when the <code>DataSource</code>
  /// is in the <code>COMPLETED</code> or <code>FAILED</code> state.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'FinishedAt')
  final DateTime finishedAt;

  /// The time of the most recent edit to the <code>DataSource</code>. The time is
  /// expressed in epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// A link to the file containing logs of <code>CreateDataSourceFrom*</code>
  /// operations.
  @_s.JsonKey(name: 'LogUri')
  final String logUri;

  /// The user-supplied description of the most recent details about creating the
  /// <code>DataSource</code>.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// A user-supplied name or description of the <code>DataSource</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The number of data files referenced by the <code>DataSource</code>.
  @_s.JsonKey(name: 'NumberOfFiles')
  final int numberOfFiles;
  @_s.JsonKey(name: 'RDSMetadata')
  final RDSMetadata rDSMetadata;
  @_s.JsonKey(name: 'RedshiftMetadata')
  final RedshiftMetadata redshiftMetadata;
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// The epoch time when Amazon Machine Learning marked the
  /// <code>DataSource</code> as <code>INPROGRESS</code>. <code>StartedAt</code>
  /// isn't available if the <code>DataSource</code> is in the
  /// <code>PENDING</code> state.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartedAt')
  final DateTime startedAt;

  /// The current status of the <code>DataSource</code>. This element can have one
  /// of the following values:
  ///
  /// <ul>
  /// <li> <code>PENDING</code> - Amazon ML submitted a request to create a
  /// <code>DataSource</code>.</li>
  /// <li> <code>INPROGRESS</code> - The creation process is underway.</li>
  /// <li> <code>FAILED</code> - The request to create a <code>DataSource</code>
  /// did not run to completion. It is not usable.</li>
  /// <li> <code>COMPLETED</code> - The creation process completed
  /// successfully.</li>
  /// <li> <code>DELETED</code> - The <code>DataSource</code> is marked as
  /// deleted. It is not usable.</li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final EntityStatus status;

  GetDataSourceOutput({
    this.computeStatistics,
    this.computeTime,
    this.createdAt,
    this.createdByIamUser,
    this.dataLocationS3,
    this.dataRearrangement,
    this.dataSizeInBytes,
    this.dataSourceId,
    this.dataSourceSchema,
    this.finishedAt,
    this.lastUpdatedAt,
    this.logUri,
    this.message,
    this.name,
    this.numberOfFiles,
    this.rDSMetadata,
    this.redshiftMetadata,
    this.roleARN,
    this.startedAt,
    this.status,
  });
  factory GetDataSourceOutput.fromJson(Map<String, dynamic> json) =>
      _$GetDataSourceOutputFromJson(json);
}

/// Represents the output of a <code>GetEvaluation</code> operation and
/// describes an <code>Evaluation</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEvaluationOutput {
  /// The approximate CPU time in milliseconds that Amazon Machine Learning spent
  /// processing the <code>Evaluation</code>, normalized and scaled on computation
  /// resources. <code>ComputeTime</code> is only available if the
  /// <code>Evaluation</code> is in the <code>COMPLETED</code> state.
  @_s.JsonKey(name: 'ComputeTime')
  final int computeTime;

  /// The time that the <code>Evaluation</code> was created. The time is expressed
  /// in epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The AWS user account that invoked the evaluation. The account type can be
  /// either an AWS root account or an AWS Identity and Access Management (IAM)
  /// user account.
  @_s.JsonKey(name: 'CreatedByIamUser')
  final String createdByIamUser;

  /// The <code>DataSource</code> used for this evaluation.
  @_s.JsonKey(name: 'EvaluationDataSourceId')
  final String evaluationDataSourceId;

  /// The evaluation ID which is same as the <code>EvaluationId</code> in the
  /// request.
  @_s.JsonKey(name: 'EvaluationId')
  final String evaluationId;

  /// The epoch time when Amazon Machine Learning marked the
  /// <code>Evaluation</code> as <code>COMPLETED</code> or <code>FAILED</code>.
  /// <code>FinishedAt</code> is only available when the <code>Evaluation</code>
  /// is in the <code>COMPLETED</code> or <code>FAILED</code> state.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'FinishedAt')
  final DateTime finishedAt;

  /// The location of the data file or directory in Amazon Simple Storage Service
  /// (Amazon S3).
  @_s.JsonKey(name: 'InputDataLocationS3')
  final String inputDataLocationS3;

  /// The time of the most recent edit to the <code>Evaluation</code>. The time is
  /// expressed in epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// A link to the file that contains logs of the <code>CreateEvaluation</code>
  /// operation.
  @_s.JsonKey(name: 'LogUri')
  final String logUri;

  /// The ID of the <code>MLModel</code> that was the focus of the evaluation.
  @_s.JsonKey(name: 'MLModelId')
  final String mLModelId;

  /// A description of the most recent details about evaluating the
  /// <code>MLModel</code>.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// A user-supplied name or description of the <code>Evaluation</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Measurements of how well the <code>MLModel</code> performed using
  /// observations referenced by the <code>DataSource</code>. One of the following
  /// metric is returned based on the type of the <code>MLModel</code>:
  ///
  /// <ul>
  /// <li>
  /// BinaryAUC: A binary <code>MLModel</code> uses the Area Under the Curve (AUC)
  /// technique to measure performance.
  /// </li>
  /// <li>
  /// RegressionRMSE: A regression <code>MLModel</code> uses the Root Mean Square
  /// Error (RMSE) technique to measure performance. RMSE measures the difference
  /// between predicted and actual values for a single variable.
  /// </li>
  /// <li>
  /// MulticlassAvgFScore: A multiclass <code>MLModel</code> uses the F1 score
  /// technique to measure performance.
  /// </li>
  /// </ul>
  /// For more information about performance metrics, please see the <a
  /// href="http://docs.aws.amazon.com/machine-learning/latest/dg">Amazon Machine
  /// Learning Developer Guide</a>.
  @_s.JsonKey(name: 'PerformanceMetrics')
  final PerformanceMetrics performanceMetrics;

  /// The epoch time when Amazon Machine Learning marked the
  /// <code>Evaluation</code> as <code>INPROGRESS</code>. <code>StartedAt</code>
  /// isn't available if the <code>Evaluation</code> is in the
  /// <code>PENDING</code> state.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartedAt')
  final DateTime startedAt;

  /// The status of the evaluation. This element can have one of the following
  /// values:
  ///
  /// <ul>
  /// <li> <code>PENDING</code> - Amazon Machine Language (Amazon ML) submitted a
  /// request to evaluate an <code>MLModel</code>.</li>
  /// <li> <code>INPROGRESS</code> - The evaluation is underway.</li>
  /// <li> <code>FAILED</code> - The request to evaluate an <code>MLModel</code>
  /// did not run to completion. It is not usable.</li>
  /// <li> <code>COMPLETED</code> - The evaluation process completed
  /// successfully.</li>
  /// <li> <code>DELETED</code> - The <code>Evaluation</code> is marked as
  /// deleted. It is not usable.</li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final EntityStatus status;

  GetEvaluationOutput({
    this.computeTime,
    this.createdAt,
    this.createdByIamUser,
    this.evaluationDataSourceId,
    this.evaluationId,
    this.finishedAt,
    this.inputDataLocationS3,
    this.lastUpdatedAt,
    this.logUri,
    this.mLModelId,
    this.message,
    this.name,
    this.performanceMetrics,
    this.startedAt,
    this.status,
  });
  factory GetEvaluationOutput.fromJson(Map<String, dynamic> json) =>
      _$GetEvaluationOutputFromJson(json);
}

/// Represents the output of a <code>GetMLModel</code> operation, and provides
/// detailed information about a <code>MLModel</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMLModelOutput {
  /// The approximate CPU time in milliseconds that Amazon Machine Learning spent
  /// processing the <code>MLModel</code>, normalized and scaled on computation
  /// resources. <code>ComputeTime</code> is only available if the
  /// <code>MLModel</code> is in the <code>COMPLETED</code> state.
  @_s.JsonKey(name: 'ComputeTime')
  final int computeTime;

  /// The time that the <code>MLModel</code> was created. The time is expressed in
  /// epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The AWS user account from which the <code>MLModel</code> was created. The
  /// account type can be either an AWS root account or an AWS Identity and Access
  /// Management (IAM) user account.
  @_s.JsonKey(name: 'CreatedByIamUser')
  final String createdByIamUser;

  /// The current endpoint of the <code>MLModel</code>
  @_s.JsonKey(name: 'EndpointInfo')
  final RealtimeEndpointInfo endpointInfo;

  /// The epoch time when Amazon Machine Learning marked the <code>MLModel</code>
  /// as <code>COMPLETED</code> or <code>FAILED</code>. <code>FinishedAt</code> is
  /// only available when the <code>MLModel</code> is in the
  /// <code>COMPLETED</code> or <code>FAILED</code> state.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'FinishedAt')
  final DateTime finishedAt;

  /// The location of the data file or directory in Amazon Simple Storage Service
  /// (Amazon S3).
  @_s.JsonKey(name: 'InputDataLocationS3')
  final String inputDataLocationS3;

  /// The time of the most recent edit to the <code>MLModel</code>. The time is
  /// expressed in epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// A link to the file that contains logs of the <code>CreateMLModel</code>
  /// operation.
  @_s.JsonKey(name: 'LogUri')
  final String logUri;

  /// The MLModel ID<?oxy_insert_start author="annbech"
  /// timestamp="20160328T151251-0700">,<?oxy_insert_end> which is same as the
  /// <code>MLModelId</code> in the request.
  @_s.JsonKey(name: 'MLModelId')
  final String mLModelId;

  /// Identifies the <code>MLModel</code> category. The following are the
  /// available types:
  ///
  /// <ul>
  /// <li>REGRESSION -- Produces a numeric result. For example, "What price should
  /// a house be listed at?"</li>
  /// <li>BINARY -- Produces one of two possible results. For example, "Is this an
  /// e-commerce website?"</li>
  /// <li>MULTICLASS -- Produces one of several possible results. For example, "Is
  /// this a HIGH, LOW or MEDIUM risk trade?"</li>
  /// </ul>
  @_s.JsonKey(name: 'MLModelType')
  final MLModelType mLModelType;

  /// A description of the most recent details about accessing the
  /// <code>MLModel</code>.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// A user-supplied name or description of the <code>MLModel</code>.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The recipe to use when training the <code>MLModel</code>. The
  /// <code>Recipe</code> provides detailed information about the observation data
  /// to use during training, and manipulations to perform on the observation data
  /// during training.
  /// <note><title>Note</title>
  /// This parameter is provided as part of the verbose format.
  /// </note>
  @_s.JsonKey(name: 'Recipe')
  final String recipe;

  /// The schema used by all of the data files referenced by the
  /// <code>DataSource</code>.
  /// <note><title>Note</title>
  /// This parameter is provided as part of the verbose format.
  /// </note>
  @_s.JsonKey(name: 'Schema')
  final String schema;

  /// The scoring threshold is used in binary classification
  /// <code>MLModel</code><?oxy_insert_start author="laurama"
  /// timestamp="20160329T114851-0700"> <?oxy_insert_end>models. It marks the
  /// boundary between a positive prediction and a negative prediction.
  ///
  /// Output values greater than or equal to the threshold receive a positive
  /// result from the MLModel, such as <code>true</code>. Output values less than
  /// the threshold receive a negative response from the MLModel, such as
  /// <code>false</code>.
  @_s.JsonKey(name: 'ScoreThreshold')
  final double scoreThreshold;

  /// The time of the most recent edit to the <code>ScoreThreshold</code>. The
  /// time is expressed in epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ScoreThresholdLastUpdatedAt')
  final DateTime scoreThresholdLastUpdatedAt;
  @_s.JsonKey(name: 'SizeInBytes')
  final int sizeInBytes;

  /// The epoch time when Amazon Machine Learning marked the <code>MLModel</code>
  /// as <code>INPROGRESS</code>. <code>StartedAt</code> isn't available if the
  /// <code>MLModel</code> is in the <code>PENDING</code> state.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartedAt')
  final DateTime startedAt;

  /// The current status of the <code>MLModel</code>. This element can have one of
  /// the following values:
  ///
  /// <ul>
  /// <li> <code>PENDING</code> - Amazon Machine Learning (Amazon ML) submitted a
  /// request to describe a <code>MLModel</code>.</li>
  /// <li> <code>INPROGRESS</code> - The request is processing.</li>
  /// <li> <code>FAILED</code> - The request did not run to completion. The ML
  /// model isn't usable.</li>
  /// <li> <code>COMPLETED</code> - The request completed successfully.</li>
  /// <li> <code>DELETED</code> - The <code>MLModel</code> is marked as deleted.
  /// It isn't usable.</li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final EntityStatus status;

  /// The ID of the training <code>DataSource</code>.
  @_s.JsonKey(name: 'TrainingDataSourceId')
  final String trainingDataSourceId;

  /// A list of the training parameters in the <code>MLModel</code>. The list is
  /// implemented as a map of key-value pairs.
  ///
  /// The following is the current set of training parameters:
  ///
  /// <ul>
  /// <li>
  /// <code>sgd.maxMLModelSizeInBytes</code> - The maximum allowed size of the
  /// model. Depending on the input data, the size of the model might affect its
  /// performance.
  ///
  /// The value is an integer that ranges from <code>100000</code> to
  /// <code>2147483648</code>. The default value is <code>33554432</code>.
  /// </li>
  /// <li>
  /// <code>sgd.maxPasses</code> - The number of times that the training process
  /// traverses the observations to build the <code>MLModel</code>. The value is
  /// an integer that ranges from <code>1</code> to <code>10000</code>. The
  /// default value is <code>10</code>.
  /// </li>
  /// <li>
  /// <code>sgd.shuffleType</code> - Whether Amazon ML shuffles the training data.
  /// Shuffling data improves a model's ability to find the optimal solution for a
  /// variety of data types. The valid values are <code>auto</code> and
  /// <code>none</code>. The default value is <code>none</code>. We strongly
  /// recommend that you shuffle your data.
  /// </li>
  /// <li>
  /// <code>sgd.l1RegularizationAmount</code> - The coefficient regularization L1
  /// norm. It controls overfitting the data by penalizing large coefficients.
  /// This tends to drive coefficients to zero, resulting in a sparse feature set.
  /// If you use this parameter, start by specifying a small value, such as
  /// <code>1.0E-08</code>.
  ///
  /// The value is a double that ranges from <code>0</code> to
  /// <code>MAX_DOUBLE</code>. The default is to not use L1 normalization. This
  /// parameter can't be used when <code>L2</code> is specified. Use this
  /// parameter sparingly.
  /// </li>
  /// <li>
  /// <code>sgd.l2RegularizationAmount</code> - The coefficient regularization L2
  /// norm. It controls overfitting the data by penalizing large coefficients.
  /// This tends to drive coefficients to small, nonzero values. If you use this
  /// parameter, start by specifying a small value, such as <code>1.0E-08</code>.
  ///
  /// The value is a double that ranges from <code>0</code> to
  /// <code>MAX_DOUBLE</code>. The default is to not use L2 normalization. This
  /// parameter can't be used when <code>L1</code> is specified. Use this
  /// parameter sparingly.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'TrainingParameters')
  final Map<String, String> trainingParameters;

  GetMLModelOutput({
    this.computeTime,
    this.createdAt,
    this.createdByIamUser,
    this.endpointInfo,
    this.finishedAt,
    this.inputDataLocationS3,
    this.lastUpdatedAt,
    this.logUri,
    this.mLModelId,
    this.mLModelType,
    this.message,
    this.name,
    this.recipe,
    this.schema,
    this.scoreThreshold,
    this.scoreThresholdLastUpdatedAt,
    this.sizeInBytes,
    this.startedAt,
    this.status,
    this.trainingDataSourceId,
    this.trainingParameters,
  });
  factory GetMLModelOutput.fromJson(Map<String, dynamic> json) =>
      _$GetMLModelOutputFromJson(json);
}

/// A second request to use or change an object was not allowed. This can result
/// from retrying a request using a parameter that was not present in the
/// original request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IdempotentParameterMismatchException implements _s.AwsException {
  @_s.JsonKey(name: 'code')
  final int code;
  @_s.JsonKey(name: 'message')
  final String message;

  IdempotentParameterMismatchException({
    this.code,
    this.message,
  });
  factory IdempotentParameterMismatchException.fromJson(
          Map<String, dynamic> json) =>
      _$IdempotentParameterMismatchExceptionFromJson(json);
}

/// An error on the server occurred when trying to process a request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InternalServerException implements _s.AwsException {
  @_s.JsonKey(name: 'code')
  final int code;
  @_s.JsonKey(name: 'message')
  final String message;

  InternalServerException({
    this.code,
    this.message,
  });
  factory InternalServerException.fromJson(Map<String, dynamic> json) =>
      _$InternalServerExceptionFromJson(json);
}

/// An error on the client occurred. Typically, the cause is an invalid input
/// value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InvalidInputException implements _s.AwsException {
  @_s.JsonKey(name: 'code')
  final int code;
  @_s.JsonKey(name: 'message')
  final String message;

  InvalidInputException({
    this.code,
    this.message,
  });
  factory InvalidInputException.fromJson(Map<String, dynamic> json) =>
      _$InvalidInputExceptionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InvalidTagException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  InvalidTagException({
    this.message,
  });
  factory InvalidTagException.fromJson(Map<String, dynamic> json) =>
      _$InvalidTagExceptionFromJson(json);
}

/// The subscriber exceeded the maximum number of operations. This exception can
/// occur when listing objects such as <code>DataSource</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LimitExceededException implements _s.AwsException {
  @_s.JsonKey(name: 'code')
  final int code;
  @_s.JsonKey(name: 'message')
  final String message;

  LimitExceededException({
    this.code,
    this.message,
  });
  factory LimitExceededException.fromJson(Map<String, dynamic> json) =>
      _$LimitExceededExceptionFromJson(json);
}

/// Represents the output of a <code>GetMLModel</code> operation.
///
/// The content consists of the detailed metadata and the current status of the
/// <code>MLModel</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MLModel {
  /// The algorithm used to train the <code>MLModel</code>. The following
  /// algorithm is supported:
  ///
  /// <ul>
  /// <li> <code>SGD</code> -- Stochastic gradient descent. The goal of
  /// <code>SGD</code> is to minimize the gradient of the loss function. </li>
  /// </ul>
  @_s.JsonKey(name: 'Algorithm')
  final Algorithm algorithm;
  @_s.JsonKey(name: 'ComputeTime')
  final int computeTime;

  /// The time that the <code>MLModel</code> was created. The time is expressed in
  /// epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The AWS user account from which the <code>MLModel</code> was created. The
  /// account type can be either an AWS root account or an AWS Identity and Access
  /// Management (IAM) user account.
  @_s.JsonKey(name: 'CreatedByIamUser')
  final String createdByIamUser;

  /// The current endpoint of the <code>MLModel</code>.
  @_s.JsonKey(name: 'EndpointInfo')
  final RealtimeEndpointInfo endpointInfo;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'FinishedAt')
  final DateTime finishedAt;

  /// The location of the data file or directory in Amazon Simple Storage Service
  /// (Amazon S3).
  @_s.JsonKey(name: 'InputDataLocationS3')
  final String inputDataLocationS3;

  /// The time of the most recent edit to the <code>MLModel</code>. The time is
  /// expressed in epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The ID assigned to the <code>MLModel</code> at creation.
  @_s.JsonKey(name: 'MLModelId')
  final String mLModelId;

  /// Identifies the <code>MLModel</code> category. The following are the
  /// available types:
  ///
  /// <ul>
  /// <li> <code>REGRESSION</code> - Produces a numeric result. For example, "What
  /// price should a house be listed at?"</li>
  /// <li> <code>BINARY</code> - Produces one of two possible results. For
  /// example, "Is this a child-friendly web site?".</li>
  /// <li> <code>MULTICLASS</code> - Produces one of several possible results. For
  /// example, "Is this a HIGH-, LOW-, or MEDIUM<?oxy_delete author="annbech"
  /// timestamp="20160328T175050-0700" content=" "><?oxy_insert_start
  /// author="annbech" timestamp="20160328T175050-0700">-<?oxy_insert_end>risk
  /// trade?".</li>
  /// </ul>
  @_s.JsonKey(name: 'MLModelType')
  final MLModelType mLModelType;

  /// A description of the most recent details about accessing the
  /// <code>MLModel</code>.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// A user-supplied name or description of the <code>MLModel</code>.
  @_s.JsonKey(name: 'Name')
  final String name;
  @_s.JsonKey(name: 'ScoreThreshold')
  final double scoreThreshold;

  /// The time of the most recent edit to the <code>ScoreThreshold</code>. The
  /// time is expressed in epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ScoreThresholdLastUpdatedAt')
  final DateTime scoreThresholdLastUpdatedAt;
  @_s.JsonKey(name: 'SizeInBytes')
  final int sizeInBytes;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartedAt')
  final DateTime startedAt;

  /// The current status of an <code>MLModel</code>. This element can have one of
  /// the following values:
  ///
  /// <ul>
  /// <li> <code>PENDING</code> - Amazon Machine Learning (Amazon ML) submitted a
  /// request to create an <code>MLModel</code>.</li>
  /// <li> <code>INPROGRESS</code> - The creation process is underway.</li>
  /// <li> <code>FAILED</code> - The request to create an <code>MLModel</code>
  /// didn't run to completion. The model isn't usable.</li>
  /// <li> <code>COMPLETED</code> - The creation process completed
  /// successfully.</li>
  /// <li> <code>DELETED</code> - The <code>MLModel</code> is marked as deleted.
  /// It isn't usable.</li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final EntityStatus status;

  /// The ID of the training <code>DataSource</code>. The
  /// <code>CreateMLModel</code> operation uses the
  /// <code>TrainingDataSourceId</code>.
  @_s.JsonKey(name: 'TrainingDataSourceId')
  final String trainingDataSourceId;

  /// A list of the training parameters in the <code>MLModel</code>. The list is
  /// implemented as a map of key-value pairs.
  ///
  /// The following is the current set of training parameters:
  ///
  /// <ul>
  /// <li>
  /// <code>sgd.maxMLModelSizeInBytes</code> - The maximum allowed size of the
  /// model. Depending on the input data, the size of the model might affect its
  /// performance.
  ///
  /// The value is an integer that ranges from <code>100000</code> to
  /// <code>2147483648</code>. The default value is <code>33554432</code>.
  /// </li>
  /// <li>
  /// <code>sgd.maxPasses</code> - The number of times that the training process
  /// traverses the observations to build the <code>MLModel</code>. The value is
  /// an integer that ranges from <code>1</code> to <code>10000</code>. The
  /// default value is <code>10</code>.
  /// </li>
  /// <li>
  /// <code>sgd.shuffleType</code> - Whether Amazon ML shuffles the training data.
  /// Shuffling the data improves a model's ability to find the optimal solution
  /// for a variety of data types. The valid values are <code>auto</code> and
  /// <code>none</code>. The default value is <code>none</code>.
  /// </li>
  /// <li>
  /// <code>sgd.l1RegularizationAmount</code> - The coefficient regularization L1
  /// norm, which controls overfitting the data by penalizing large coefficients.
  /// This parameter tends to drive coefficients to zero, resulting in sparse
  /// feature set. If you use this parameter, start by specifying a small value,
  /// such as <code>1.0E-08</code>.
  ///
  /// The value is a double that ranges from <code>0</code> to
  /// <code>MAX_DOUBLE</code>. The default is to not use L1 normalization. This
  /// parameter can't be used when <code>L2</code> is specified. Use this
  /// parameter sparingly.
  /// </li>
  /// <li>
  /// <code>sgd.l2RegularizationAmount</code> - The coefficient regularization L2
  /// norm, which controls overfitting the data by penalizing large coefficients.
  /// This tends to drive coefficients to small, nonzero values. If you use this
  /// parameter, start by specifying a small value, such as <code>1.0E-08</code>.
  ///
  /// The value is a double that ranges from <code>0</code> to
  /// <code>MAX_DOUBLE</code>. The default is to not use L2 normalization. This
  /// parameter can't be used when <code>L1</code> is specified. Use this
  /// parameter sparingly.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'TrainingParameters')
  final Map<String, String> trainingParameters;

  MLModel({
    this.algorithm,
    this.computeTime,
    this.createdAt,
    this.createdByIamUser,
    this.endpointInfo,
    this.finishedAt,
    this.inputDataLocationS3,
    this.lastUpdatedAt,
    this.mLModelId,
    this.mLModelType,
    this.message,
    this.name,
    this.scoreThreshold,
    this.scoreThresholdLastUpdatedAt,
    this.sizeInBytes,
    this.startedAt,
    this.status,
    this.trainingDataSourceId,
    this.trainingParameters,
  });
  factory MLModel.fromJson(Map<String, dynamic> json) =>
      _$MLModelFromJson(json);
}

enum MLModelFilterVariable {
  @_s.JsonValue('CreatedAt')
  createdAt,
  @_s.JsonValue('LastUpdatedAt')
  lastUpdatedAt,
  @_s.JsonValue('Status')
  status,
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('IAMUser')
  iAMUser,
  @_s.JsonValue('TrainingDataSourceId')
  trainingDataSourceId,
  @_s.JsonValue('RealtimeEndpointStatus')
  realtimeEndpointStatus,
  @_s.JsonValue('MLModelType')
  mLModelType,
  @_s.JsonValue('Algorithm')
  algorithm,
  @_s.JsonValue('TrainingDataURI')
  trainingDataURI,
}

extension on MLModelFilterVariable {
  String toValue() {
    switch (this) {
      case MLModelFilterVariable.createdAt:
        return 'CreatedAt';
      case MLModelFilterVariable.lastUpdatedAt:
        return 'LastUpdatedAt';
      case MLModelFilterVariable.status:
        return 'Status';
      case MLModelFilterVariable.name:
        return 'Name';
      case MLModelFilterVariable.iAMUser:
        return 'IAMUser';
      case MLModelFilterVariable.trainingDataSourceId:
        return 'TrainingDataSourceId';
      case MLModelFilterVariable.realtimeEndpointStatus:
        return 'RealtimeEndpointStatus';
      case MLModelFilterVariable.mLModelType:
        return 'MLModelType';
      case MLModelFilterVariable.algorithm:
        return 'Algorithm';
      case MLModelFilterVariable.trainingDataURI:
        return 'TrainingDataURI';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum MLModelType {
  @_s.JsonValue('REGRESSION')
  regression,
  @_s.JsonValue('BINARY')
  binary,
  @_s.JsonValue('MULTICLASS')
  multiclass,
}

extension on MLModelType {
  String toValue() {
    switch (this) {
      case MLModelType.regression:
        return 'REGRESSION';
      case MLModelType.binary:
        return 'BINARY';
      case MLModelType.multiclass:
        return 'MULTICLASS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Measurements of how well the <code>MLModel</code> performed on known
/// observations. One of the following metrics is returned, based on the type of
/// the <code>MLModel</code>:
///
/// <ul>
/// <li>
/// BinaryAUC: The binary <code>MLModel</code> uses the Area Under the Curve
/// (AUC) technique to measure performance.
/// </li>
/// <li>
/// RegressionRMSE: The regression <code>MLModel</code> uses the Root Mean
/// Square Error (RMSE) technique to measure performance. RMSE measures the
/// difference between predicted and actual values for a single variable.
/// </li>
/// <li>
/// MulticlassAvgFScore: The multiclass <code>MLModel</code> uses the F1 score
/// technique to measure performance.
/// </li>
/// </ul>
/// For more information about performance metrics, please see the <a
/// href="http://docs.aws.amazon.com/machine-learning/latest/dg">Amazon Machine
/// Learning Developer Guide</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PerformanceMetrics {
  @_s.JsonKey(name: 'Properties')
  final Map<String, String> properties;

  PerformanceMetrics({
    this.properties,
  });
  factory PerformanceMetrics.fromJson(Map<String, dynamic> json) =>
      _$PerformanceMetricsFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PredictOutput {
  @_s.JsonKey(name: 'Prediction')
  final Prediction prediction;

  PredictOutput({
    this.prediction,
  });
  factory PredictOutput.fromJson(Map<String, dynamic> json) =>
      _$PredictOutputFromJson(json);
}

/// The output from a <code>Predict</code> operation:
///
/// <ul>
/// <li>
/// <code>Details</code> - Contains the following attributes:
/// <code>DetailsAttributes.PREDICTIVE_MODEL_TYPE - REGRESSION | BINARY |
/// MULTICLASS</code> <code>DetailsAttributes.ALGORITHM - SGD</code>
/// </li>
/// <li>
/// <code>PredictedLabel</code> - Present for either a <code>BINARY</code> or
/// <code>MULTICLASS</code> <code>MLModel</code> request.
/// </li>
/// <li>
/// <code>PredictedScores</code> - Contains the raw classification score
/// corresponding to each label.
/// </li>
/// <li>
/// <code>PredictedValue</code> - Present for a <code>REGRESSION</code>
/// <code>MLModel</code> request.
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Prediction {
  @_s.JsonKey(name: 'details')
  final Map<DetailsAttributes, String> details;

  /// The prediction label for either a <code>BINARY</code> or
  /// <code>MULTICLASS</code> <code>MLModel</code>.
  @_s.JsonKey(name: 'predictedLabel')
  final String predictedLabel;
  @_s.JsonKey(name: 'predictedScores')
  final Map<String, double> predictedScores;

  /// The prediction value for <code>REGRESSION</code> <code>MLModel</code>.
  @_s.JsonKey(name: 'predictedValue')
  final double predictedValue;

  Prediction({
    this.details,
    this.predictedLabel,
    this.predictedScores,
    this.predictedValue,
  });
  factory Prediction.fromJson(Map<String, dynamic> json) =>
      _$PredictionFromJson(json);
}

/// The exception is thrown when a predict request is made to an unmounted
/// <code>MLModel</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PredictorNotMountedException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  PredictorNotMountedException({
    this.message,
  });
  factory PredictorNotMountedException.fromJson(Map<String, dynamic> json) =>
      _$PredictorNotMountedExceptionFromJson(json);
}

/// The data specification of an Amazon Relational Database Service (Amazon RDS)
/// <code>DataSource</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RDSDataSpec {
  /// The AWS Identity and Access Management (IAM) credentials that are used
  /// connect to the Amazon RDS database.
  @_s.JsonKey(name: 'DatabaseCredentials')
  final RDSDatabaseCredentials databaseCredentials;

  /// Describes the <code>DatabaseName</code> and <code>InstanceIdentifier</code>
  /// of an Amazon RDS database.
  @_s.JsonKey(name: 'DatabaseInformation')
  final RDSDatabase databaseInformation;

  /// The role (DataPipelineDefaultResourceRole) assumed by an Amazon Elastic
  /// Compute Cloud (Amazon EC2) instance to carry out the copy operation from
  /// Amazon RDS to an Amazon S3 task. For more information, see <a
  /// href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html">Role
  /// templates</a> for data pipelines.
  @_s.JsonKey(name: 'ResourceRole')
  final String resourceRole;

  /// The Amazon S3 location for staging Amazon RDS data. The data retrieved from
  /// Amazon RDS using <code>SelectSqlQuery</code> is stored in this location.
  @_s.JsonKey(name: 'S3StagingLocation')
  final String s3StagingLocation;

  /// The security group IDs to be used to access a VPC-based RDS DB instance.
  /// Ensure that there are appropriate ingress rules set up to allow access to
  /// the RDS DB instance. This attribute is used by Data Pipeline to carry out
  /// the copy operation from Amazon RDS to an Amazon S3 task.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// The query that is used to retrieve the observation data for the
  /// <code>DataSource</code>.
  @_s.JsonKey(name: 'SelectSqlQuery')
  final String selectSqlQuery;

  /// The role (DataPipelineDefaultRole) assumed by AWS Data Pipeline service to
  /// monitor the progress of the copy task from Amazon RDS to Amazon S3. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html">Role
  /// templates</a> for data pipelines.
  @_s.JsonKey(name: 'ServiceRole')
  final String serviceRole;

  /// The subnet ID to be used to access a VPC-based RDS DB instance. This
  /// attribute is used by Data Pipeline to carry out the copy task from Amazon
  /// RDS to Amazon S3.
  @_s.JsonKey(name: 'SubnetId')
  final String subnetId;

  /// A JSON string that represents the splitting and rearrangement processing to
  /// be applied to a <code>DataSource</code>. If the
  /// <code>DataRearrangement</code> parameter is not provided, all of the input
  /// data is used to create the <code>Datasource</code>.
  ///
  /// There are multiple parameters that control what data is used to create a
  /// datasource:
  ///
  /// <ul>
  /// <li>
  /// <b><code>percentBegin</code></b>
  ///
  /// Use <code>percentBegin</code> to indicate the beginning of the range of the
  /// data used to create the Datasource. If you do not include
  /// <code>percentBegin</code> and <code>percentEnd</code>, Amazon ML includes
  /// all of the data when creating the datasource.
  /// </li>
  /// <li>
  /// <b><code>percentEnd</code></b>
  ///
  /// Use <code>percentEnd</code> to indicate the end of the range of the data
  /// used to create the Datasource. If you do not include
  /// <code>percentBegin</code> and <code>percentEnd</code>, Amazon ML includes
  /// all of the data when creating the datasource.
  /// </li>
  /// <li>
  /// <b><code>complement</code></b>
  ///
  /// The <code>complement</code> parameter instructs Amazon ML to use the data
  /// that is not included in the range of <code>percentBegin</code> to
  /// <code>percentEnd</code> to create a datasource. The <code>complement</code>
  /// parameter is useful if you need to create complementary datasources for
  /// training and evaluation. To create a complementary datasource, use the same
  /// values for <code>percentBegin</code> and <code>percentEnd</code>, along with
  /// the <code>complement</code> parameter.
  ///
  /// For example, the following two datasources do not share any data, and can be
  /// used to train and evaluate a model. The first datasource has 25 percent of
  /// the data, and the second one has 75 percent of the data.
  ///
  /// Datasource for evaluation: <code>{"splitting":{"percentBegin":0,
  /// "percentEnd":25}}</code>
  ///
  /// Datasource for training: <code>{"splitting":{"percentBegin":0,
  /// "percentEnd":25, "complement":"true"}}</code>
  /// </li>
  /// <li>
  /// <b><code>strategy</code></b>
  ///
  /// To change how Amazon ML splits the data for a datasource, use the
  /// <code>strategy</code> parameter.
  ///
  /// The default value for the <code>strategy</code> parameter is
  /// <code>sequential</code>, meaning that Amazon ML takes all of the data
  /// records between the <code>percentBegin</code> and <code>percentEnd</code>
  /// parameters for the datasource, in the order that the records appear in the
  /// input data.
  ///
  /// The following two <code>DataRearrangement</code> lines are examples of
  /// sequentially ordered training and evaluation datasources:
  ///
  /// Datasource for evaluation: <code>{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"sequential"}}</code>
  ///
  /// Datasource for training: <code>{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"sequential", "complement":"true"}}</code>
  ///
  /// To randomly split the input data into the proportions indicated by the
  /// percentBegin and percentEnd parameters, set the <code>strategy</code>
  /// parameter to <code>random</code> and provide a string that is used as the
  /// seed value for the random data splitting (for example, you can use the S3
  /// path to your data as the random seed string). If you choose the random split
  /// strategy, Amazon ML assigns each row of data a pseudo-random number between
  /// 0 and 100, and then selects the rows that have an assigned number between
  /// <code>percentBegin</code> and <code>percentEnd</code>. Pseudo-random numbers
  /// are assigned using both the input seed string value and the byte offset as a
  /// seed, so changing the data results in a different split. Any existing
  /// ordering is preserved. The random splitting strategy ensures that variables
  /// in the training and evaluation data are distributed similarly. It is useful
  /// in the cases where the input data may have an implicit sort order, which
  /// would otherwise result in training and evaluation datasources containing
  /// non-similar data records.
  ///
  /// The following two <code>DataRearrangement</code> lines are examples of
  /// non-sequentially ordered training and evaluation datasources:
  ///
  /// Datasource for evaluation: <code>{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"random",
  /// "randomSeed"="s3://my_s3_path/bucket/file.csv"}}</code>
  ///
  /// Datasource for training: <code>{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"random",
  /// "randomSeed"="s3://my_s3_path/bucket/file.csv", "complement":"true"}}</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'DataRearrangement')
  final String dataRearrangement;

  /// A JSON string that represents the schema for an Amazon RDS
  /// <code>DataSource</code>. The <code>DataSchema</code> defines the structure
  /// of the observation data in the data file(s) referenced in the
  /// <code>DataSource</code>.
  ///
  /// A <code>DataSchema</code> is not required if you specify a
  /// <code>DataSchemaUri</code>
  ///
  /// Define your <code>DataSchema</code> as a series of key-value pairs.
  /// <code>attributes</code> and <code>excludedVariableNames</code> have an array
  /// of key-value pairs for their value. Use the following format to define your
  /// <code>DataSchema</code>.
  ///
  /// { "version": "1.0",
  ///
  /// "recordAnnotationFieldName": "F1",
  ///
  /// "recordWeightFieldName": "F2",
  ///
  /// "targetFieldName": "F3",
  ///
  /// "dataFormat": "CSV",
  ///
  /// "dataFileContainsHeader": true,
  ///
  /// "attributes": [
  ///
  /// { "fieldName": "F1", "fieldType": "TEXT" }, { "fieldName": "F2",
  /// "fieldType": "NUMERIC" }, { "fieldName": "F3", "fieldType": "CATEGORICAL" },
  /// { "fieldName": "F4", "fieldType": "NUMERIC" }, { "fieldName": "F5",
  /// "fieldType": "CATEGORICAL" }, { "fieldName": "F6", "fieldType": "TEXT" }, {
  /// "fieldName": "F7", "fieldType": "WEIGHTED_INT_SEQUENCE" }, { "fieldName":
  /// "F8", "fieldType": "WEIGHTED_STRING_SEQUENCE" } ],
  ///
  /// "excludedVariableNames": [ "F6" ] }
  /// <?oxy_insert_end>
  @_s.JsonKey(name: 'DataSchema')
  final String dataSchema;

  /// The Amazon S3 location of the <code>DataSchema</code>.
  @_s.JsonKey(name: 'DataSchemaUri')
  final String dataSchemaUri;

  RDSDataSpec({
    @_s.required this.databaseCredentials,
    @_s.required this.databaseInformation,
    @_s.required this.resourceRole,
    @_s.required this.s3StagingLocation,
    @_s.required this.securityGroupIds,
    @_s.required this.selectSqlQuery,
    @_s.required this.serviceRole,
    @_s.required this.subnetId,
    this.dataRearrangement,
    this.dataSchema,
    this.dataSchemaUri,
  });
  Map<String, dynamic> toJson() => _$RDSDataSpecToJson(this);
}

/// The database details of an Amazon RDS database.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RDSDatabase {
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The ID of an RDS DB instance.
  @_s.JsonKey(name: 'InstanceIdentifier')
  final String instanceIdentifier;

  RDSDatabase({
    @_s.required this.databaseName,
    @_s.required this.instanceIdentifier,
  });
  factory RDSDatabase.fromJson(Map<String, dynamic> json) =>
      _$RDSDatabaseFromJson(json);

  Map<String, dynamic> toJson() => _$RDSDatabaseToJson(this);
}

/// The database credentials to connect to a database on an RDS DB instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RDSDatabaseCredentials {
  @_s.JsonKey(name: 'Password')
  final String password;
  @_s.JsonKey(name: 'Username')
  final String username;

  RDSDatabaseCredentials({
    @_s.required this.password,
    @_s.required this.username,
  });
  Map<String, dynamic> toJson() => _$RDSDatabaseCredentialsToJson(this);
}

/// The datasource details that are specific to Amazon RDS.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RDSMetadata {
  /// The ID of the Data Pipeline instance that is used to carry to copy data from
  /// Amazon RDS to Amazon S3. You can use the ID to find details about the
  /// instance in the Data Pipeline console.
  @_s.JsonKey(name: 'DataPipelineId')
  final String dataPipelineId;

  /// The database details required to connect to an Amazon RDS.
  @_s.JsonKey(name: 'Database')
  final RDSDatabase database;
  @_s.JsonKey(name: 'DatabaseUserName')
  final String databaseUserName;

  /// The role (DataPipelineDefaultResourceRole) assumed by an Amazon EC2 instance
  /// to carry out the copy task from Amazon RDS to Amazon S3. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html">Role
  /// templates</a> for data pipelines.
  @_s.JsonKey(name: 'ResourceRole')
  final String resourceRole;

  /// The SQL query that is supplied during <a>CreateDataSourceFromRDS</a>.
  /// Returns only if <code>Verbose</code> is true in
  /// <code>GetDataSourceInput</code>.
  @_s.JsonKey(name: 'SelectSqlQuery')
  final String selectSqlQuery;

  /// The role (DataPipelineDefaultRole) assumed by the Data Pipeline service to
  /// monitor the progress of the copy task from Amazon RDS to Amazon S3. For more
  /// information, see <a
  /// href="http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html">Role
  /// templates</a> for data pipelines.
  @_s.JsonKey(name: 'ServiceRole')
  final String serviceRole;

  RDSMetadata({
    this.dataPipelineId,
    this.database,
    this.databaseUserName,
    this.resourceRole,
    this.selectSqlQuery,
    this.serviceRole,
  });
  factory RDSMetadata.fromJson(Map<String, dynamic> json) =>
      _$RDSMetadataFromJson(json);
}

/// Describes the real-time endpoint information for an <code>MLModel</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RealtimeEndpointInfo {
  /// The time that the request to create the real-time endpoint for the
  /// <code>MLModel</code> was received. The time is expressed in epoch time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The current status of the real-time endpoint for the <code>MLModel</code>.
  /// This element can have one of the following values:
  ///
  /// <ul>
  /// <li> <code>NONE</code> - Endpoint does not exist or was previously
  /// deleted.</li>
  /// <li> <code>READY</code> - Endpoint is ready to be used for real-time
  /// predictions.</li>
  /// <li> <code>UPDATING</code> - Updating/creating the endpoint. </li>
  /// </ul>
  @_s.JsonKey(name: 'EndpointStatus')
  final RealtimeEndpointStatus endpointStatus;

  /// The URI that specifies where to send real-time prediction requests for the
  /// <code>MLModel</code>.
  /// <note><title>Note</title>
  /// The application must wait until the real-time endpoint is ready before using
  /// this URI.
  /// </note>
  @_s.JsonKey(name: 'EndpointUrl')
  final String endpointUrl;

  /// The maximum processing rate for the real-time endpoint for
  /// <code>MLModel</code>, measured in incoming requests per second.
  @_s.JsonKey(name: 'PeakRequestsPerSecond')
  final int peakRequestsPerSecond;

  RealtimeEndpointInfo({
    this.createdAt,
    this.endpointStatus,
    this.endpointUrl,
    this.peakRequestsPerSecond,
  });
  factory RealtimeEndpointInfo.fromJson(Map<String, dynamic> json) =>
      _$RealtimeEndpointInfoFromJson(json);
}

enum RealtimeEndpointStatus {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('READY')
  ready,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('FAILED')
  failed,
}

/// Describes the data specification of an Amazon Redshift
/// <code>DataSource</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RedshiftDataSpec {
  /// Describes AWS Identity and Access Management (IAM) credentials that are used
  /// connect to the Amazon Redshift database.
  @_s.JsonKey(name: 'DatabaseCredentials')
  final RedshiftDatabaseCredentials databaseCredentials;

  /// Describes the <code>DatabaseName</code> and <code>ClusterIdentifier</code>
  /// for an Amazon Redshift <code>DataSource</code>.
  @_s.JsonKey(name: 'DatabaseInformation')
  final RedshiftDatabase databaseInformation;

  /// Describes an Amazon S3 location to store the result set of the
  /// <code>SelectSqlQuery</code> query.
  @_s.JsonKey(name: 'S3StagingLocation')
  final String s3StagingLocation;

  /// Describes the SQL Query to execute on an Amazon Redshift database for an
  /// Amazon Redshift <code>DataSource</code>.
  @_s.JsonKey(name: 'SelectSqlQuery')
  final String selectSqlQuery;

  /// A JSON string that represents the splitting and rearrangement processing to
  /// be applied to a <code>DataSource</code>. If the
  /// <code>DataRearrangement</code> parameter is not provided, all of the input
  /// data is used to create the <code>Datasource</code>.
  ///
  /// There are multiple parameters that control what data is used to create a
  /// datasource:
  ///
  /// <ul>
  /// <li>
  /// <b><code>percentBegin</code></b>
  ///
  /// Use <code>percentBegin</code> to indicate the beginning of the range of the
  /// data used to create the Datasource. If you do not include
  /// <code>percentBegin</code> and <code>percentEnd</code>, Amazon ML includes
  /// all of the data when creating the datasource.
  /// </li>
  /// <li>
  /// <b><code>percentEnd</code></b>
  ///
  /// Use <code>percentEnd</code> to indicate the end of the range of the data
  /// used to create the Datasource. If you do not include
  /// <code>percentBegin</code> and <code>percentEnd</code>, Amazon ML includes
  /// all of the data when creating the datasource.
  /// </li>
  /// <li>
  /// <b><code>complement</code></b>
  ///
  /// The <code>complement</code> parameter instructs Amazon ML to use the data
  /// that is not included in the range of <code>percentBegin</code> to
  /// <code>percentEnd</code> to create a datasource. The <code>complement</code>
  /// parameter is useful if you need to create complementary datasources for
  /// training and evaluation. To create a complementary datasource, use the same
  /// values for <code>percentBegin</code> and <code>percentEnd</code>, along with
  /// the <code>complement</code> parameter.
  ///
  /// For example, the following two datasources do not share any data, and can be
  /// used to train and evaluate a model. The first datasource has 25 percent of
  /// the data, and the second one has 75 percent of the data.
  ///
  /// Datasource for evaluation: <code>{"splitting":{"percentBegin":0,
  /// "percentEnd":25}}</code>
  ///
  /// Datasource for training: <code>{"splitting":{"percentBegin":0,
  /// "percentEnd":25, "complement":"true"}}</code>
  /// </li>
  /// <li>
  /// <b><code>strategy</code></b>
  ///
  /// To change how Amazon ML splits the data for a datasource, use the
  /// <code>strategy</code> parameter.
  ///
  /// The default value for the <code>strategy</code> parameter is
  /// <code>sequential</code>, meaning that Amazon ML takes all of the data
  /// records between the <code>percentBegin</code> and <code>percentEnd</code>
  /// parameters for the datasource, in the order that the records appear in the
  /// input data.
  ///
  /// The following two <code>DataRearrangement</code> lines are examples of
  /// sequentially ordered training and evaluation datasources:
  ///
  /// Datasource for evaluation: <code>{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"sequential"}}</code>
  ///
  /// Datasource for training: <code>{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"sequential", "complement":"true"}}</code>
  ///
  /// To randomly split the input data into the proportions indicated by the
  /// percentBegin and percentEnd parameters, set the <code>strategy</code>
  /// parameter to <code>random</code> and provide a string that is used as the
  /// seed value for the random data splitting (for example, you can use the S3
  /// path to your data as the random seed string). If you choose the random split
  /// strategy, Amazon ML assigns each row of data a pseudo-random number between
  /// 0 and 100, and then selects the rows that have an assigned number between
  /// <code>percentBegin</code> and <code>percentEnd</code>. Pseudo-random numbers
  /// are assigned using both the input seed string value and the byte offset as a
  /// seed, so changing the data results in a different split. Any existing
  /// ordering is preserved. The random splitting strategy ensures that variables
  /// in the training and evaluation data are distributed similarly. It is useful
  /// in the cases where the input data may have an implicit sort order, which
  /// would otherwise result in training and evaluation datasources containing
  /// non-similar data records.
  ///
  /// The following two <code>DataRearrangement</code> lines are examples of
  /// non-sequentially ordered training and evaluation datasources:
  ///
  /// Datasource for evaluation: <code>{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"random",
  /// "randomSeed"="s3://my_s3_path/bucket/file.csv"}}</code>
  ///
  /// Datasource for training: <code>{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"random",
  /// "randomSeed"="s3://my_s3_path/bucket/file.csv", "complement":"true"}}</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'DataRearrangement')
  final String dataRearrangement;

  /// A JSON string that represents the schema for an Amazon Redshift
  /// <code>DataSource</code>. The <code>DataSchema</code> defines the structure
  /// of the observation data in the data file(s) referenced in the
  /// <code>DataSource</code>.
  ///
  /// A <code>DataSchema</code> is not required if you specify a
  /// <code>DataSchemaUri</code>.
  ///
  /// Define your <code>DataSchema</code> as a series of key-value pairs.
  /// <code>attributes</code> and <code>excludedVariableNames</code> have an array
  /// of key-value pairs for their value. Use the following format to define your
  /// <code>DataSchema</code>.
  ///
  /// { "version": "1.0",
  ///
  /// "recordAnnotationFieldName": "F1",
  ///
  /// "recordWeightFieldName": "F2",
  ///
  /// "targetFieldName": "F3",
  ///
  /// "dataFormat": "CSV",
  ///
  /// "dataFileContainsHeader": true,
  ///
  /// "attributes": [
  ///
  /// { "fieldName": "F1", "fieldType": "TEXT" }, { "fieldName": "F2",
  /// "fieldType": "NUMERIC" }, { "fieldName": "F3", "fieldType": "CATEGORICAL" },
  /// { "fieldName": "F4", "fieldType": "NUMERIC" }, { "fieldName": "F5",
  /// "fieldType": "CATEGORICAL" }, { "fieldName": "F6", "fieldType": "TEXT" }, {
  /// "fieldName": "F7", "fieldType": "WEIGHTED_INT_SEQUENCE" }, { "fieldName":
  /// "F8", "fieldType": "WEIGHTED_STRING_SEQUENCE" } ],
  ///
  /// "excludedVariableNames": [ "F6" ] }
  @_s.JsonKey(name: 'DataSchema')
  final String dataSchema;

  /// Describes the schema location for an Amazon Redshift
  /// <code>DataSource</code>.
  @_s.JsonKey(name: 'DataSchemaUri')
  final String dataSchemaUri;

  RedshiftDataSpec({
    @_s.required this.databaseCredentials,
    @_s.required this.databaseInformation,
    @_s.required this.s3StagingLocation,
    @_s.required this.selectSqlQuery,
    this.dataRearrangement,
    this.dataSchema,
    this.dataSchemaUri,
  });
  Map<String, dynamic> toJson() => _$RedshiftDataSpecToJson(this);
}

/// Describes the database details required to connect to an Amazon Redshift
/// database.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RedshiftDatabase {
  @_s.JsonKey(name: 'ClusterIdentifier')
  final String clusterIdentifier;
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  RedshiftDatabase({
    @_s.required this.clusterIdentifier,
    @_s.required this.databaseName,
  });
  factory RedshiftDatabase.fromJson(Map<String, dynamic> json) =>
      _$RedshiftDatabaseFromJson(json);

  Map<String, dynamic> toJson() => _$RedshiftDatabaseToJson(this);
}

/// Describes the database credentials for connecting to a database on an Amazon
/// Redshift cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RedshiftDatabaseCredentials {
  @_s.JsonKey(name: 'Password')
  final String password;
  @_s.JsonKey(name: 'Username')
  final String username;

  RedshiftDatabaseCredentials({
    @_s.required this.password,
    @_s.required this.username,
  });
  Map<String, dynamic> toJson() => _$RedshiftDatabaseCredentialsToJson(this);
}

/// Describes the <code>DataSource</code> details specific to Amazon Redshift.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RedshiftMetadata {
  @_s.JsonKey(name: 'DatabaseUserName')
  final String databaseUserName;
  @_s.JsonKey(name: 'RedshiftDatabase')
  final RedshiftDatabase redshiftDatabase;

  /// The SQL query that is specified during <a>CreateDataSourceFromRedshift</a>.
  /// Returns only if <code>Verbose</code> is true in GetDataSourceInput.
  @_s.JsonKey(name: 'SelectSqlQuery')
  final String selectSqlQuery;

  RedshiftMetadata({
    this.databaseUserName,
    this.redshiftDatabase,
    this.selectSqlQuery,
  });
  factory RedshiftMetadata.fromJson(Map<String, dynamic> json) =>
      _$RedshiftMetadataFromJson(json);
}

/// A specified resource cannot be located.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceNotFoundException implements _s.AwsException {
  @_s.JsonKey(name: 'code')
  final int code;
  @_s.JsonKey(name: 'message')
  final String message;

  ResourceNotFoundException({
    this.code,
    this.message,
  });
  factory ResourceNotFoundException.fromJson(Map<String, dynamic> json) =>
      _$ResourceNotFoundExceptionFromJson(json);
}

/// Describes the data specification of a <code>DataSource</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class S3DataSpec {
  /// The location of the data file(s) used by a <code>DataSource</code>. The URI
  /// specifies a data file or an Amazon Simple Storage Service (Amazon S3)
  /// directory or bucket containing data files.
  @_s.JsonKey(name: 'DataLocationS3')
  final String dataLocationS3;

  /// A JSON string that represents the splitting and rearrangement processing to
  /// be applied to a <code>DataSource</code>. If the
  /// <code>DataRearrangement</code> parameter is not provided, all of the input
  /// data is used to create the <code>Datasource</code>.
  ///
  /// There are multiple parameters that control what data is used to create a
  /// datasource:
  ///
  /// <ul>
  /// <li>
  /// <b><code>percentBegin</code></b>
  ///
  /// Use <code>percentBegin</code> to indicate the beginning of the range of the
  /// data used to create the Datasource. If you do not include
  /// <code>percentBegin</code> and <code>percentEnd</code>, Amazon ML includes
  /// all of the data when creating the datasource.
  /// </li>
  /// <li>
  /// <b><code>percentEnd</code></b>
  ///
  /// Use <code>percentEnd</code> to indicate the end of the range of the data
  /// used to create the Datasource. If you do not include
  /// <code>percentBegin</code> and <code>percentEnd</code>, Amazon ML includes
  /// all of the data when creating the datasource.
  /// </li>
  /// <li>
  /// <b><code>complement</code></b>
  ///
  /// The <code>complement</code> parameter instructs Amazon ML to use the data
  /// that is not included in the range of <code>percentBegin</code> to
  /// <code>percentEnd</code> to create a datasource. The <code>complement</code>
  /// parameter is useful if you need to create complementary datasources for
  /// training and evaluation. To create a complementary datasource, use the same
  /// values for <code>percentBegin</code> and <code>percentEnd</code>, along with
  /// the <code>complement</code> parameter.
  ///
  /// For example, the following two datasources do not share any data, and can be
  /// used to train and evaluate a model. The first datasource has 25 percent of
  /// the data, and the second one has 75 percent of the data.
  ///
  /// Datasource for evaluation: <code>{"splitting":{"percentBegin":0,
  /// "percentEnd":25}}</code>
  ///
  /// Datasource for training: <code>{"splitting":{"percentBegin":0,
  /// "percentEnd":25, "complement":"true"}}</code>
  /// </li>
  /// <li>
  /// <b><code>strategy</code></b>
  ///
  /// To change how Amazon ML splits the data for a datasource, use the
  /// <code>strategy</code> parameter.
  ///
  /// The default value for the <code>strategy</code> parameter is
  /// <code>sequential</code>, meaning that Amazon ML takes all of the data
  /// records between the <code>percentBegin</code> and <code>percentEnd</code>
  /// parameters for the datasource, in the order that the records appear in the
  /// input data.
  ///
  /// The following two <code>DataRearrangement</code> lines are examples of
  /// sequentially ordered training and evaluation datasources:
  ///
  /// Datasource for evaluation: <code>{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"sequential"}}</code>
  ///
  /// Datasource for training: <code>{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"sequential", "complement":"true"}}</code>
  ///
  /// To randomly split the input data into the proportions indicated by the
  /// percentBegin and percentEnd parameters, set the <code>strategy</code>
  /// parameter to <code>random</code> and provide a string that is used as the
  /// seed value for the random data splitting (for example, you can use the S3
  /// path to your data as the random seed string). If you choose the random split
  /// strategy, Amazon ML assigns each row of data a pseudo-random number between
  /// 0 and 100, and then selects the rows that have an assigned number between
  /// <code>percentBegin</code> and <code>percentEnd</code>. Pseudo-random numbers
  /// are assigned using both the input seed string value and the byte offset as a
  /// seed, so changing the data results in a different split. Any existing
  /// ordering is preserved. The random splitting strategy ensures that variables
  /// in the training and evaluation data are distributed similarly. It is useful
  /// in the cases where the input data may have an implicit sort order, which
  /// would otherwise result in training and evaluation datasources containing
  /// non-similar data records.
  ///
  /// The following two <code>DataRearrangement</code> lines are examples of
  /// non-sequentially ordered training and evaluation datasources:
  ///
  /// Datasource for evaluation: <code>{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"random",
  /// "randomSeed"="s3://my_s3_path/bucket/file.csv"}}</code>
  ///
  /// Datasource for training: <code>{"splitting":{"percentBegin":70,
  /// "percentEnd":100, "strategy":"random",
  /// "randomSeed"="s3://my_s3_path/bucket/file.csv", "complement":"true"}}</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'DataRearrangement')
  final String dataRearrangement;

  /// A JSON string that represents the schema for an Amazon S3
  /// <code>DataSource</code>. The <code>DataSchema</code> defines the structure
  /// of the observation data in the data file(s) referenced in the
  /// <code>DataSource</code>.
  ///
  /// You must provide either the <code>DataSchema</code> or the
  /// <code>DataSchemaLocationS3</code>.
  ///
  /// Define your <code>DataSchema</code> as a series of key-value pairs.
  /// <code>attributes</code> and <code>excludedVariableNames</code> have an array
  /// of key-value pairs for their value. Use the following format to define your
  /// <code>DataSchema</code>.
  ///
  /// { "version": "1.0",
  ///
  /// "recordAnnotationFieldName": "F1",
  ///
  /// "recordWeightFieldName": "F2",
  ///
  /// "targetFieldName": "F3",
  ///
  /// "dataFormat": "CSV",
  ///
  /// "dataFileContainsHeader": true,
  ///
  /// "attributes": [
  ///
  /// { "fieldName": "F1", "fieldType": "TEXT" }, { "fieldName": "F2",
  /// "fieldType": "NUMERIC" }, { "fieldName": "F3", "fieldType": "CATEGORICAL" },
  /// { "fieldName": "F4", "fieldType": "NUMERIC" }, { "fieldName": "F5",
  /// "fieldType": "CATEGORICAL" }, { "fieldName": "F6", "fieldType": "TEXT" }, {
  /// "fieldName": "F7", "fieldType": "WEIGHTED_INT_SEQUENCE" }, { "fieldName":
  /// "F8", "fieldType": "WEIGHTED_STRING_SEQUENCE" } ],
  ///
  /// "excludedVariableNames": [ "F6" ] }
  /// <?oxy_insert_end>
  @_s.JsonKey(name: 'DataSchema')
  final String dataSchema;

  /// Describes the schema location in Amazon S3. You must provide either the
  /// <code>DataSchema</code> or the <code>DataSchemaLocationS3</code>.
  @_s.JsonKey(name: 'DataSchemaLocationS3')
  final String dataSchemaLocationS3;

  S3DataSpec({
    @_s.required this.dataLocationS3,
    this.dataRearrangement,
    this.dataSchema,
    this.dataSchemaLocationS3,
  });
  Map<String, dynamic> toJson() => _$S3DataSpecToJson(this);
}

/// The sort order specified in a listing condition. Possible values include the
/// following:
///
/// <ul>
/// <li> <code>asc</code> - Present the information in ascending order (from
/// A-Z).</li>
/// <li> <code>dsc</code> - Present the information in descending order (from
/// Z-A).</li>
/// </ul>
enum SortOrder {
  @_s.JsonValue('asc')
  asc,
  @_s.JsonValue('dsc')
  dsc,
}

extension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.asc:
        return 'asc';
      case SortOrder.dsc:
        return 'dsc';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A custom key-value pair associated with an ML object, such as an ML model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// A unique identifier for the tag. Valid characters include Unicode letters,
  /// digits, white space, _, ., /, =, +, -, %, and @.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// An optional string, typically used to describe or define the tag. Valid
  /// characters include Unicode letters, digits, white space, _, ., /, =, +, -,
  /// %, and @.
  @_s.JsonKey(name: 'Value')
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
class TagLimitExceededException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  TagLimitExceededException({
    this.message,
  });
  factory TagLimitExceededException.fromJson(Map<String, dynamic> json) =>
      _$TagLimitExceededExceptionFromJson(json);
}

enum TaggableResourceType {
  @_s.JsonValue('BatchPrediction')
  batchPrediction,
  @_s.JsonValue('DataSource')
  dataSource,
  @_s.JsonValue('Evaluation')
  evaluation,
  @_s.JsonValue('MLModel')
  mLModel,
}

extension on TaggableResourceType {
  String toValue() {
    switch (this) {
      case TaggableResourceType.batchPrediction:
        return 'BatchPrediction';
      case TaggableResourceType.dataSource:
        return 'DataSource';
      case TaggableResourceType.evaluation:
        return 'Evaluation';
      case TaggableResourceType.mLModel:
        return 'MLModel';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents the output of an <code>UpdateBatchPrediction</code> operation.
///
/// You can see the updated content by using the <code>GetBatchPrediction</code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateBatchPredictionOutput {
  /// The ID assigned to the <code>BatchPrediction</code> during creation. This
  /// value should be identical to the value of the <code>BatchPredictionId</code>
  /// in the request.
  @_s.JsonKey(name: 'BatchPredictionId')
  final String batchPredictionId;

  UpdateBatchPredictionOutput({
    this.batchPredictionId,
  });
  factory UpdateBatchPredictionOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateBatchPredictionOutputFromJson(json);
}

/// Represents the output of an <code>UpdateDataSource</code> operation.
///
/// You can see the updated content by using the <code>GetBatchPrediction</code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDataSourceOutput {
  /// The ID assigned to the <code>DataSource</code> during creation. This value
  /// should be identical to the value of the <code>DataSourceID</code> in the
  /// request.
  @_s.JsonKey(name: 'DataSourceId')
  final String dataSourceId;

  UpdateDataSourceOutput({
    this.dataSourceId,
  });
  factory UpdateDataSourceOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateDataSourceOutputFromJson(json);
}

/// Represents the output of an <code>UpdateEvaluation</code> operation.
///
/// You can see the updated content by using the <code>GetEvaluation</code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateEvaluationOutput {
  /// The ID assigned to the <code>Evaluation</code> during creation. This value
  /// should be identical to the value of the <code>Evaluation</code> in the
  /// request.
  @_s.JsonKey(name: 'EvaluationId')
  final String evaluationId;

  UpdateEvaluationOutput({
    this.evaluationId,
  });
  factory UpdateEvaluationOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateEvaluationOutputFromJson(json);
}

/// Represents the output of an <code>UpdateMLModel</code> operation.
///
/// You can see the updated content by using the <code>GetMLModel</code>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateMLModelOutput {
  /// The ID assigned to the <code>MLModel</code> during creation. This value
  /// should be identical to the value of the <code>MLModelID</code> in the
  /// request.
  @_s.JsonKey(name: 'MLModelId')
  final String mLModelId;

  UpdateMLModelOutput({
    this.mLModelId,
  });
  factory UpdateMLModelOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateMLModelOutputFromJson(json);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'IdempotentParameterMismatchException': (type, message) =>
      IdempotentParameterMismatchException(message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(message: message),
  'InvalidInputException': (type, message) =>
      InvalidInputException(message: message),
  'InvalidTagException': (type, message) =>
      InvalidTagException(message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(message: message),
  'PredictorNotMountedException': (type, message) =>
      PredictorNotMountedException(message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(message: message),
  'TagLimitExceededException': (type, message) =>
      TagLimitExceededException(message: message),
};

// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822fromJson,
        rfc822toJson,
        iso8601fromJson,
        iso8601toJson,
        unixFromJson,
        unixToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'forecast-2018-06-26.g.dart';

/// Provides APIs for creating and managing Amazon Forecast resources.
class ForecastService {
  final _s.JsonProtocol _protocol;
  ForecastService({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'forecast',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates an Amazon Forecast dataset. The information about the dataset that
  /// you provide helps Forecast understand how to consume the data for model
  /// training. This includes the following:
  ///
  /// <ul>
  /// <li>
  /// <i> <code>DataFrequency</code> </i> - How frequently your historical
  /// time-series data is collected.
  /// </li>
  /// <li>
  /// <i> <code>Domain</code> </i> and <i> <code>DatasetType</code> </i> - Each
  /// dataset has an associated dataset domain and a type within the domain.
  /// Amazon Forecast provides a list of predefined domains and types within
  /// each domain. For each unique dataset domain and type within the domain,
  /// Amazon Forecast requires your data to include a minimum set of predefined
  /// fields.
  /// </li>
  /// <li>
  /// <i> <code>Schema</code> </i> - A schema specifies the fields in the
  /// dataset, including the field name and data type.
  /// </li>
  /// </ul>
  /// After creating a dataset, you import your training data into it and add
  /// the dataset to a dataset group. You use the dataset group to create a
  /// predictor. For more information, see <a>howitworks-datasets-groups</a>.
  ///
  /// To get a list of all your datasets, use the <a>ListDatasets</a> operation.
  ///
  /// For example Forecast datasets, see the <a
  /// href="https://github.com/aws-samples/amazon-forecast-samples/tree/master/data">Amazon
  /// Forecast Sample GitHub repository</a>.
  /// <note>
  /// The <code>Status</code> of a dataset must be <code>ACTIVE</code> before
  /// you can import training data. Use the <a>DescribeDataset</a> operation to
  /// get the status.
  /// </note>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [datasetName] :
  /// A name for the dataset.
  ///
  /// Parameter [datasetType] :
  /// The dataset type. Valid values depend on the chosen <code>Domain</code>.
  ///
  /// Parameter [domain] :
  /// The domain associated with the dataset. When you add a dataset to a
  /// dataset group, this value and the value specified for the
  /// <code>Domain</code> parameter of the <a>CreateDatasetGroup</a> operation
  /// must match.
  ///
  /// The <code>Domain</code> and <code>DatasetType</code> that you choose
  /// determine the fields that must be present in the training data that you
  /// import to the dataset. For example, if you choose the <code>RETAIL</code>
  /// domain and <code>TARGET_TIME_SERIES</code> as the
  /// <code>DatasetType</code>, Amazon Forecast requires <code>item_id</code>,
  /// <code>timestamp</code>, and <code>demand</code> fields to be present in
  /// your data. For more information, see <a>howitworks-datasets-groups</a>.
  ///
  /// Parameter [schema] :
  /// The schema for the dataset. The schema attributes and their order must
  /// match the fields in your data. The dataset <code>Domain</code> and
  /// <code>DatasetType</code> that you choose determine the minimum required
  /// fields in your training data. For information about the required fields
  /// for a specific dataset domain and type, see
  /// <a>howitworks-domains-ds-types</a>.
  ///
  /// Parameter [dataFrequency] :
  /// The frequency of data collection. This parameter is required for
  /// RELATED_TIME_SERIES datasets.
  ///
  /// Valid intervals are Y (Year), M (Month), W (Week), D (Day), H (Hour),
  /// 30min (30 minutes), 15min (15 minutes), 10min (10 minutes), 5min (5
  /// minutes), and 1min (1 minute). For example, "D" indicates every day and
  /// "15min" indicates every 15 minutes.
  ///
  /// Parameter [encryptionConfig] :
  /// An AWS Key Management Service (KMS) key and the AWS Identity and Access
  /// Management (IAM) role that Amazon Forecast can assume to access the key.
  Future<CreateDatasetResponse> createDataset({
    @_s.required String datasetName,
    @_s.required DatasetType datasetType,
    @_s.required Domain domain,
    @_s.required Schema schema,
    String dataFrequency,
    EncryptionConfig encryptionConfig,
  }) async {
    ArgumentError.checkNotNull(datasetName, 'datasetName');
    _s.validateStringLength(
      'datasetName',
      datasetName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetName',
      datasetName,
      r'''^[a-zA-Z][a-zA-Z0-9_]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(datasetType, 'datasetType');
    ArgumentError.checkNotNull(domain, 'domain');
    ArgumentError.checkNotNull(schema, 'schema');
    _s.validateStringPattern(
      'dataFrequency',
      dataFrequency,
      r'''^Y|M|W|D|H|30min|15min|10min|5min|1min$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.CreateDataset'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetName': datasetName,
        'DatasetType': datasetType,
        'Domain': domain,
        'Schema': schema,
        'DataFrequency': dataFrequency,
        'EncryptionConfig': encryptionConfig,
      },
    );

    return CreateDatasetResponse.fromJson(jsonResponse.body);
  }

  /// Creates a dataset group, which holds a collection of related datasets. You
  /// can add datasets to the dataset group when you create the dataset group,
  /// or later by using the <a>UpdateDatasetGroup</a> operation.
  ///
  /// After creating a dataset group and adding datasets, you use the dataset
  /// group when you create a predictor. For more information, see
  /// <a>howitworks-datasets-groups</a>.
  ///
  /// To get a list of all your datasets groups, use the
  /// <a>ListDatasetGroups</a> operation.
  /// <note>
  /// The <code>Status</code> of a dataset group must be <code>ACTIVE</code>
  /// before you can create use the dataset group to create a predictor. To get
  /// the status, use the <a>DescribeDatasetGroup</a> operation.
  /// </note>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [datasetGroupName] :
  /// A name for the dataset group.
  ///
  /// Parameter [domain] :
  /// The domain associated with the dataset group. When you add a dataset to a
  /// dataset group, this value and the value specified for the
  /// <code>Domain</code> parameter of the <a>CreateDataset</a> operation must
  /// match.
  ///
  /// The <code>Domain</code> and <code>DatasetType</code> that you choose
  /// determine the fields that must be present in training data that you import
  /// to a dataset. For example, if you choose the <code>RETAIL</code> domain
  /// and <code>TARGET_TIME_SERIES</code> as the <code>DatasetType</code>,
  /// Amazon Forecast requires that <code>item_id</code>,
  /// <code>timestamp</code>, and <code>demand</code> fields are present in your
  /// data. For more information, see <a>howitworks-datasets-groups</a>.
  ///
  /// Parameter [datasetArns] :
  /// An array of Amazon Resource Names (ARNs) of the datasets that you want to
  /// include in the dataset group.
  Future<CreateDatasetGroupResponse> createDatasetGroup({
    @_s.required String datasetGroupName,
    @_s.required Domain domain,
    List<String> datasetArns,
  }) async {
    ArgumentError.checkNotNull(datasetGroupName, 'datasetGroupName');
    _s.validateStringLength(
      'datasetGroupName',
      datasetGroupName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetGroupName',
      datasetGroupName,
      r'''^[a-zA-Z][a-zA-Z0-9_]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(domain, 'domain');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.CreateDatasetGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetGroupName': datasetGroupName,
        'Domain': domain,
        'DatasetArns': datasetArns,
      },
    );

    return CreateDatasetGroupResponse.fromJson(jsonResponse.body);
  }

  /// Imports your training data to an Amazon Forecast dataset. You provide the
  /// location of your training data in an Amazon Simple Storage Service (Amazon
  /// S3) bucket and the Amazon Resource Name (ARN) of the dataset that you want
  /// to import the data to.
  ///
  /// You must specify a <a>DataSource</a> object that includes an AWS Identity
  /// and Access Management (IAM) role that Amazon Forecast can assume to access
  /// the data. For more information, see <a>aws-forecast-iam-roles</a>.
  ///
  /// The training data must be in CSV format. The delimiter must be a comma
  /// (,).
  ///
  /// You can specify the path to a specific CSV file, the S3 bucket, or to a
  /// folder in the S3 bucket. For the latter two cases, Amazon Forecast imports
  /// all files up to the limit of 10,000 files.
  ///
  /// To get a list of all your dataset import jobs, filtered by specified
  /// criteria, use the <a>ListDatasetImportJobs</a> operation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [dataSource] :
  /// The location of the training data to import and an AWS Identity and Access
  /// Management (IAM) role that Amazon Forecast can assume to access the data.
  /// The training data must be stored in an Amazon S3 bucket.
  ///
  /// If encryption is used, <code>DataSource</code> must include an AWS Key
  /// Management Service (KMS) key and the IAM role must allow Amazon Forecast
  /// permission to access the key. The KMS key and IAM role must match those
  /// specified in the <code>EncryptionConfig</code> parameter of the
  /// <a>CreateDataset</a> operation.
  ///
  /// Parameter [datasetArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Forecast dataset that you
  /// want to import data to.
  ///
  /// Parameter [datasetImportJobName] :
  /// The name for the dataset import job. We recommend including the current
  /// timestamp in the name, for example, <code>20190721DatasetImport</code>.
  /// This can help you avoid getting a
  /// <code>ResourceAlreadyExistsException</code> exception.
  ///
  /// Parameter [timestampFormat] :
  /// The format of timestamps in the dataset. The format that you specify
  /// depends on the <code>DataFrequency</code> specified when the dataset was
  /// created. The following formats are supported
  ///
  /// <ul>
  /// <li>
  /// "yyyy-MM-dd"
  ///
  /// For the following data frequencies: Y, M, W, and D
  /// </li>
  /// <li>
  /// "yyyy-MM-dd HH:mm:ss"
  ///
  /// For the following data frequencies: H, 30min, 15min, and 1min; and
  /// optionally, for: Y, M, W, and D
  /// </li>
  /// </ul>
  /// If the format isn't specified, Amazon Forecast expects the format to be
  /// "yyyy-MM-dd HH:mm:ss".
  Future<CreateDatasetImportJobResponse> createDatasetImportJob({
    @_s.required DataSource dataSource,
    @_s.required String datasetArn,
    @_s.required String datasetImportJobName,
    String timestampFormat,
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
      r'''^[a-zA-Z0-9\-\_\.\/\:]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(datasetImportJobName, 'datasetImportJobName');
    _s.validateStringLength(
      'datasetImportJobName',
      datasetImportJobName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datasetImportJobName',
      datasetImportJobName,
      r'''^[a-zA-Z][a-zA-Z0-9_]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'timestampFormat',
      timestampFormat,
      0,
      256,
    );
    _s.validateStringPattern(
      'timestampFormat',
      timestampFormat,
      r'''^[a-zA-Z0-9\-\:\.\,\'\s]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.CreateDatasetImportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataSource': dataSource,
        'DatasetArn': datasetArn,
        'DatasetImportJobName': datasetImportJobName,
        'TimestampFormat': timestampFormat,
      },
    );

    return CreateDatasetImportJobResponse.fromJson(jsonResponse.body);
  }

  /// Creates a forecast for each item in the <code>TARGET_TIME_SERIES</code>
  /// dataset that was used to train the predictor. This is known as inference.
  /// To retrieve the forecast for a single item at low latency, use the
  /// operation. To export the complete forecast into your Amazon Simple Storage
  /// Service (Amazon S3) bucket, use the <a>CreateForecastExportJob</a>
  /// operation.
  ///
  /// The range of the forecast is determined by the
  /// <code>ForecastHorizon</code> value, which you specify in the
  /// <a>CreatePredictor</a> request, multiplied by the
  /// <code>DataFrequency</code> value, which you specify in the
  /// <a>CreateDataset</a> request. When you query a forecast, you can request a
  /// specific date range within the forecast.
  ///
  /// To get a list of all your forecasts, use the <a>ListForecasts</a>
  /// operation.
  /// <note>
  /// The forecasts generated by Amazon Forecast are in the same time zone as
  /// the dataset that was used to create the predictor.
  /// </note>
  /// For more information, see <a>howitworks-forecast</a>.
  /// <note>
  /// The <code>Status</code> of the forecast must be <code>ACTIVE</code> before
  /// you can query or export the forecast. Use the <a>DescribeForecast</a>
  /// operation to get the status.
  /// </note>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [forecastName] :
  /// A name for the forecast.
  ///
  /// Parameter [predictorArn] :
  /// The Amazon Resource Name (ARN) of the predictor to use to generate the
  /// forecast.
  ///
  /// Parameter [forecastTypes] :
  /// The quantiles at which probabilistic forecasts are generated. You can
  /// specify up to 5 quantiles per forecast. Accepted values include <code>0.01
  /// to 0.99</code> (increments of .01 only) and <code>mean</code>. The mean
  /// forecast is different from the median (0.50) when the distribution is not
  /// symmetric (e.g. Beta, Negative Binomial). The default value is
  /// <code>["0.1", "0.5", "0.9"]</code>.
  Future<CreateForecastResponse> createForecast({
    @_s.required String forecastName,
    @_s.required String predictorArn,
    List<String> forecastTypes,
  }) async {
    ArgumentError.checkNotNull(forecastName, 'forecastName');
    _s.validateStringLength(
      'forecastName',
      forecastName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'forecastName',
      forecastName,
      r'''^[a-zA-Z][a-zA-Z0-9_]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(predictorArn, 'predictorArn');
    _s.validateStringLength(
      'predictorArn',
      predictorArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'predictorArn',
      predictorArn,
      r'''^[a-zA-Z0-9\-\_\.\/\:]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.CreateForecast'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ForecastName': forecastName,
        'PredictorArn': predictorArn,
        'ForecastTypes': forecastTypes,
      },
    );

    return CreateForecastResponse.fromJson(jsonResponse.body);
  }

  /// Exports a forecast created by the <a>CreateForecast</a> operation to your
  /// Amazon Simple Storage Service (Amazon S3) bucket. The forecast file name
  /// will match the following conventions:
  ///
  /// &lt;ForecastExportJobName&gt;_&lt;ExportTimestamp&gt;_&lt;PageNumber&gt;
  ///
  /// where the &lt;ExportTimestamp&gt; component is in Java SimpleDateFormat
  /// (yyyy-MM-ddTHH-mm-ssZ).
  ///
  /// You must specify a <a>DataDestination</a> object that includes an AWS
  /// Identity and Access Management (IAM) role that Amazon Forecast can assume
  /// to access the Amazon S3 bucket. For more information, see
  /// <a>aws-forecast-iam-roles</a>.
  ///
  /// For more information, see <a>howitworks-forecast</a>.
  ///
  /// To get a list of all your forecast export jobs, use the
  /// <a>ListForecastExportJobs</a> operation.
  /// <note>
  /// The <code>Status</code> of the forecast export job must be
  /// <code>ACTIVE</code> before you can access the forecast in your Amazon S3
  /// bucket. To get the status, use the <a>DescribeForecastExportJob</a>
  /// operation.
  /// </note>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [destination] :
  /// The location where you want to save the forecast and an AWS Identity and
  /// Access Management (IAM) role that Amazon Forecast can assume to access the
  /// location. The forecast must be exported to an Amazon S3 bucket.
  ///
  /// If encryption is used, <code>Destination</code> must include an AWS Key
  /// Management Service (KMS) key. The IAM role must allow Amazon Forecast
  /// permission to access the key.
  ///
  /// Parameter [forecastArn] :
  /// The Amazon Resource Name (ARN) of the forecast that you want to export.
  ///
  /// Parameter [forecastExportJobName] :
  /// The name for the forecast export job.
  Future<CreateForecastExportJobResponse> createForecastExportJob({
    @_s.required DataDestination destination,
    @_s.required String forecastArn,
    @_s.required String forecastExportJobName,
  }) async {
    ArgumentError.checkNotNull(destination, 'destination');
    ArgumentError.checkNotNull(forecastArn, 'forecastArn');
    _s.validateStringLength(
      'forecastArn',
      forecastArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'forecastArn',
      forecastArn,
      r'''^[a-zA-Z0-9\-\_\.\/\:]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(forecastExportJobName, 'forecastExportJobName');
    _s.validateStringLength(
      'forecastExportJobName',
      forecastExportJobName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'forecastExportJobName',
      forecastExportJobName,
      r'''^[a-zA-Z][a-zA-Z0-9_]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.CreateForecastExportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Destination': destination,
        'ForecastArn': forecastArn,
        'ForecastExportJobName': forecastExportJobName,
      },
    );

    return CreateForecastExportJobResponse.fromJson(jsonResponse.body);
  }

  /// Creates an Amazon Forecast predictor.
  ///
  /// In the request, you provide a dataset group and either specify an
  /// algorithm or let Amazon Forecast choose the algorithm for you using
  /// AutoML. If you specify an algorithm, you also can override
  /// algorithm-specific hyperparameters.
  ///
  /// Amazon Forecast uses the chosen algorithm to train a model using the
  /// latest version of the datasets in the specified dataset group. The result
  /// is called a predictor. You then generate a forecast using the
  /// <a>CreateForecast</a> operation.
  ///
  /// After training a model, the <code>CreatePredictor</code> operation also
  /// evaluates it. To see the evaluation metrics, use the
  /// <a>GetAccuracyMetrics</a> operation. Always review the evaluation metrics
  /// before deciding to use the predictor to generate a forecast.
  ///
  /// Optionally, you can specify a featurization configuration to fill and
  /// aggregate the data fields in the <code>TARGET_TIME_SERIES</code> dataset
  /// to improve model training. For more information, see
  /// <a>FeaturizationConfig</a>.
  ///
  /// For RELATED_TIME_SERIES datasets, <code>CreatePredictor</code> verifies
  /// that the <code>DataFrequency</code> specified when the dataset was created
  /// matches the <code>ForecastFrequency</code>. TARGET_TIME_SERIES datasets
  /// don't have this restriction. Amazon Forecast also verifies the delimiter
  /// and timestamp format. For more information, see
  /// <a>howitworks-datasets-groups</a>.
  ///
  /// <b>AutoML</b>
  ///
  /// If you want Amazon Forecast to evaluate each algorithm and choose the one
  /// that minimizes the <code>objective function</code>, set
  /// <code>PerformAutoML</code> to <code>true</code>. The <code>objective
  /// function</code> is defined as the mean of the weighted p10, p50, and p90
  /// quantile losses. For more information, see <a>EvaluationResult</a>.
  ///
  /// When AutoML is enabled, the following properties are disallowed:
  ///
  /// <ul>
  /// <li>
  /// <code>AlgorithmArn</code>
  /// </li>
  /// <li>
  /// <code>HPOConfig</code>
  /// </li>
  /// <li>
  /// <code>PerformHPO</code>
  /// </li>
  /// <li>
  /// <code>TrainingParameters</code>
  /// </li>
  /// </ul>
  /// To get a list of all of your predictors, use the <a>ListPredictors</a>
  /// operation.
  /// <note>
  /// Before you can use the predictor to create a forecast, the
  /// <code>Status</code> of the predictor must be <code>ACTIVE</code>,
  /// signifying that training has completed. To get the status, use the
  /// <a>DescribePredictor</a> operation.
  /// </note>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [featurizationConfig] :
  /// The featurization configuration.
  ///
  /// Parameter [forecastHorizon] :
  /// Specifies the number of time-steps that the model is trained to predict.
  /// The forecast horizon is also called the prediction length.
  ///
  /// For example, if you configure a dataset for daily data collection (using
  /// the <code>DataFrequency</code> parameter of the <a>CreateDataset</a>
  /// operation) and set the forecast horizon to 10, the model returns
  /// predictions for 10 days.
  ///
  /// The maximum forecast horizon is the lesser of 500 time-steps or 1/3 of the
  /// TARGET_TIME_SERIES dataset length.
  ///
  /// Parameter [inputDataConfig] :
  /// Describes the dataset group that contains the data to use to train the
  /// predictor.
  ///
  /// Parameter [predictorName] :
  /// A name for the predictor.
  ///
  /// Parameter [algorithmArn] :
  /// The Amazon Resource Name (ARN) of the algorithm to use for model training.
  /// Required if <code>PerformAutoML</code> is not set to <code>true</code>.
  /// <p class="title"> <b>Supported algorithms:</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:forecast:::algorithm/ARIMA</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:forecast:::algorithm/Deep_AR_Plus</code>
  ///
  /// Supports hyperparameter optimization (HPO)
  /// </li>
  /// <li>
  /// <code>arn:aws:forecast:::algorithm/ETS</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:forecast:::algorithm/NPTS</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:forecast:::algorithm/Prophet</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [encryptionConfig] :
  /// An AWS Key Management Service (KMS) key and the AWS Identity and Access
  /// Management (IAM) role that Amazon Forecast can assume to access the key.
  ///
  /// Parameter [evaluationParameters] :
  /// Used to override the default evaluation parameters of the specified
  /// algorithm. Amazon Forecast evaluates a predictor by splitting a dataset
  /// into training data and testing data. The evaluation parameters define how
  /// to perform the split and the number of iterations.
  ///
  /// Parameter [hPOConfig] :
  /// Provides hyperparameter override values for the algorithm. If you don't
  /// provide this parameter, Amazon Forecast uses default values. The
  /// individual algorithms specify which hyperparameters support hyperparameter
  /// optimization (HPO). For more information, see
  /// <a>aws-forecast-choosing-recipes</a>.
  ///
  /// If you included the <code>HPOConfig</code> object, you must set
  /// <code>PerformHPO</code> to true.
  ///
  /// Parameter [performAutoML] :
  /// Whether to perform AutoML. When Amazon Forecast performs AutoML, it
  /// evaluates the algorithms it provides and chooses the best algorithm and
  /// configuration for your training dataset.
  ///
  /// The default value is <code>false</code>. In this case, you are required to
  /// specify an algorithm.
  ///
  /// Set <code>PerformAutoML</code> to <code>true</code> to have Amazon
  /// Forecast perform AutoML. This is a good option if you aren't sure which
  /// algorithm is suitable for your training data. In this case,
  /// <code>PerformHPO</code> must be false.
  ///
  /// Parameter [performHPO] :
  /// Whether to perform hyperparameter optimization (HPO). HPO finds optimal
  /// hyperparameter values for your training data. The process of performing
  /// HPO is known as running a hyperparameter tuning job.
  ///
  /// The default value is <code>false</code>. In this case, Amazon Forecast
  /// uses default hyperparameter values from the chosen algorithm.
  ///
  /// To override the default values, set <code>PerformHPO</code> to
  /// <code>true</code> and, optionally, supply the
  /// <a>HyperParameterTuningJobConfig</a> object. The tuning job specifies a
  /// metric to optimize, which hyperparameters participate in tuning, and the
  /// valid range for each tunable hyperparameter. In this case, you are
  /// required to specify an algorithm and <code>PerformAutoML</code> must be
  /// false.
  ///
  /// The following algorithm supports HPO:
  ///
  /// <ul>
  /// <li>
  /// DeepAR+
  /// </li>
  /// </ul>
  ///
  /// Parameter [trainingParameters] :
  /// The hyperparameters to override for model training. The hyperparameters
  /// that you can override are listed in the individual algorithms. For the
  /// list of supported algorithms, see <a>aws-forecast-choosing-recipes</a>.
  Future<CreatePredictorResponse> createPredictor({
    @_s.required FeaturizationConfig featurizationConfig,
    @_s.required int forecastHorizon,
    @_s.required InputDataConfig inputDataConfig,
    @_s.required String predictorName,
    String algorithmArn,
    EncryptionConfig encryptionConfig,
    EvaluationParameters evaluationParameters,
    HyperParameterTuningJobConfig hPOConfig,
    bool performAutoML,
    bool performHPO,
    Map<String, String> trainingParameters,
  }) async {
    ArgumentError.checkNotNull(featurizationConfig, 'featurizationConfig');
    ArgumentError.checkNotNull(forecastHorizon, 'forecastHorizon');
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    ArgumentError.checkNotNull(predictorName, 'predictorName');
    _s.validateStringLength(
      'predictorName',
      predictorName,
      1,
      63,
      isRequired: true,
    );
    _s.validateStringPattern(
      'predictorName',
      predictorName,
      r'''^[a-zA-Z][a-zA-Z0-9_]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'algorithmArn',
      algorithmArn,
      0,
      256,
    );
    _s.validateStringPattern(
      'algorithmArn',
      algorithmArn,
      r'''^[a-zA-Z0-9\-\_\.\/\:]+$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.CreatePredictor'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FeaturizationConfig': featurizationConfig,
        'ForecastHorizon': forecastHorizon,
        'InputDataConfig': inputDataConfig,
        'PredictorName': predictorName,
        'AlgorithmArn': algorithmArn,
        'EncryptionConfig': encryptionConfig,
        'EvaluationParameters': evaluationParameters,
        'HPOConfig': hPOConfig,
        'PerformAutoML': performAutoML,
        'PerformHPO': performHPO,
        'TrainingParameters': trainingParameters,
      },
    );

    return CreatePredictorResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an Amazon Forecast dataset that was created using the
  /// <a>CreateDataset</a> operation. You can only delete datasets that have a
  /// status of <code>ACTIVE</code> or <code>CREATE_FAILED</code>. To get the
  /// status use the <a>DescribeDataset</a> operation.
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
      r'''^[a-zA-Z0-9\-\_\.\/\:]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DeleteDataset'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetArn': datasetArn,
      },
    );
  }

  /// Deletes a dataset group created using the <a>CreateDatasetGroup</a>
  /// operation. You can only delete dataset groups that have a status of
  /// <code>ACTIVE</code>, <code>CREATE_FAILED</code>, or
  /// <code>UPDATE_FAILED</code>. To get the status, use the
  /// <a>DescribeDatasetGroup</a> operation.
  ///
  /// This operation deletes only the dataset group, not the datasets in the
  /// group.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The Amazon Resource Name (ARN) of the dataset group to delete.
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
      r'''^[a-zA-Z0-9\-\_\.\/\:]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DeleteDatasetGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetGroupArn': datasetGroupArn,
      },
    );
  }

  /// Deletes a dataset import job created using the
  /// <a>CreateDatasetImportJob</a> operation. You can delete only dataset
  /// import jobs that have a status of <code>ACTIVE</code> or
  /// <code>CREATE_FAILED</code>. To get the status, use the
  /// <a>DescribeDatasetImportJob</a> operation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [datasetImportJobArn] :
  /// The Amazon Resource Name (ARN) of the dataset import job to delete.
  Future<void> deleteDatasetImportJob({
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
      r'''^[a-zA-Z0-9\-\_\.\/\:]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DeleteDatasetImportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetImportJobArn': datasetImportJobArn,
      },
    );
  }

  /// Deletes a forecast created using the <a>CreateForecast</a> operation. You
  /// can delete only forecasts that have a status of <code>ACTIVE</code> or
  /// <code>CREATE_FAILED</code>. To get the status, use the
  /// <a>DescribeForecast</a> operation.
  ///
  /// You can't delete a forecast while it is being exported. After a forecast
  /// is deleted, you can no longer query the forecast.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [forecastArn] :
  /// The Amazon Resource Name (ARN) of the forecast to delete.
  Future<void> deleteForecast({
    @_s.required String forecastArn,
  }) async {
    ArgumentError.checkNotNull(forecastArn, 'forecastArn');
    _s.validateStringLength(
      'forecastArn',
      forecastArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'forecastArn',
      forecastArn,
      r'''^[a-zA-Z0-9\-\_\.\/\:]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DeleteForecast'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ForecastArn': forecastArn,
      },
    );
  }

  /// Deletes a forecast export job created using the
  /// <a>CreateForecastExportJob</a> operation. You can delete only export jobs
  /// that have a status of <code>ACTIVE</code> or <code>CREATE_FAILED</code>.
  /// To get the status, use the <a>DescribeForecastExportJob</a> operation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [forecastExportJobArn] :
  /// The Amazon Resource Name (ARN) of the forecast export job to delete.
  Future<void> deleteForecastExportJob({
    @_s.required String forecastExportJobArn,
  }) async {
    ArgumentError.checkNotNull(forecastExportJobArn, 'forecastExportJobArn');
    _s.validateStringLength(
      'forecastExportJobArn',
      forecastExportJobArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'forecastExportJobArn',
      forecastExportJobArn,
      r'''^[a-zA-Z0-9\-\_\.\/\:]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DeleteForecastExportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ForecastExportJobArn': forecastExportJobArn,
      },
    );
  }

  /// Deletes a predictor created using the <a>CreatePredictor</a> operation.
  /// You can delete only predictor that have a status of <code>ACTIVE</code> or
  /// <code>CREATE_FAILED</code>. To get the status, use the
  /// <a>DescribePredictor</a> operation.
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [predictorArn] :
  /// The Amazon Resource Name (ARN) of the predictor to delete.
  Future<void> deletePredictor({
    @_s.required String predictorArn,
  }) async {
    ArgumentError.checkNotNull(predictorArn, 'predictorArn');
    _s.validateStringLength(
      'predictorArn',
      predictorArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'predictorArn',
      predictorArn,
      r'''^[a-zA-Z0-9\-\_\.\/\:]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DeletePredictor'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PredictorArn': predictorArn,
      },
    );
  }

  /// Describes an Amazon Forecast dataset created using the
  /// <a>CreateDataset</a> operation.
  ///
  /// In addition to listing the parameters specified in the
  /// <code>CreateDataset</code> request, this operation includes the following
  /// dataset properties:
  ///
  /// <ul>
  /// <li>
  /// <code>CreationTime</code>
  /// </li>
  /// <li>
  /// <code>LastModificationTime</code>
  /// </li>
  /// <li>
  /// <code>Status</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [datasetArn] :
  /// The Amazon Resource Name (ARN) of the dataset.
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
      r'''^[a-zA-Z0-9\-\_\.\/\:]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DescribeDataset'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetArn': datasetArn,
      },
    );

    return DescribeDatasetResponse.fromJson(jsonResponse.body);
  }

  /// Describes a dataset group created using the <a>CreateDatasetGroup</a>
  /// operation.
  ///
  /// In addition to listing the parameters provided in the
  /// <code>CreateDatasetGroup</code> request, this operation includes the
  /// following properties:
  ///
  /// <ul>
  /// <li>
  /// <code>DatasetArns</code> - The datasets belonging to the group.
  /// </li>
  /// <li>
  /// <code>CreationTime</code>
  /// </li>
  /// <li>
  /// <code>LastModificationTime</code>
  /// </li>
  /// <li>
  /// <code>Status</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [datasetGroupArn] :
  /// The Amazon Resource Name (ARN) of the dataset group.
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
      r'''^[a-zA-Z0-9\-\_\.\/\:]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DescribeDatasetGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetGroupArn': datasetGroupArn,
      },
    );

    return DescribeDatasetGroupResponse.fromJson(jsonResponse.body);
  }

  /// Describes a dataset import job created using the
  /// <a>CreateDatasetImportJob</a> operation.
  ///
  /// In addition to listing the parameters provided in the
  /// <code>CreateDatasetImportJob</code> request, this operation includes the
  /// following properties:
  ///
  /// <ul>
  /// <li>
  /// <code>CreationTime</code>
  /// </li>
  /// <li>
  /// <code>LastModificationTime</code>
  /// </li>
  /// <li>
  /// <code>DataSize</code>
  /// </li>
  /// <li>
  /// <code>FieldStatistics</code>
  /// </li>
  /// <li>
  /// <code>Status</code>
  /// </li>
  /// <li>
  /// <code>Message</code> - If an error occurred, information about the error.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [datasetImportJobArn] :
  /// The Amazon Resource Name (ARN) of the dataset import job.
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
      r'''^[a-zA-Z0-9\-\_\.\/\:]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DescribeDatasetImportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetImportJobArn': datasetImportJobArn,
      },
    );

    return DescribeDatasetImportJobResponse.fromJson(jsonResponse.body);
  }

  /// Describes a forecast created using the <a>CreateForecast</a> operation.
  ///
  /// In addition to listing the properties provided in the
  /// <code>CreateForecast</code> request, this operation lists the following
  /// properties:
  ///
  /// <ul>
  /// <li>
  /// <code>DatasetGroupArn</code> - The dataset group that provided the
  /// training data.
  /// </li>
  /// <li>
  /// <code>CreationTime</code>
  /// </li>
  /// <li>
  /// <code>LastModificationTime</code>
  /// </li>
  /// <li>
  /// <code>Status</code>
  /// </li>
  /// <li>
  /// <code>Message</code> - If an error occurred, information about the error.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [forecastArn] :
  /// The Amazon Resource Name (ARN) of the forecast.
  Future<DescribeForecastResponse> describeForecast({
    @_s.required String forecastArn,
  }) async {
    ArgumentError.checkNotNull(forecastArn, 'forecastArn');
    _s.validateStringLength(
      'forecastArn',
      forecastArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'forecastArn',
      forecastArn,
      r'''^[a-zA-Z0-9\-\_\.\/\:]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DescribeForecast'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ForecastArn': forecastArn,
      },
    );

    return DescribeForecastResponse.fromJson(jsonResponse.body);
  }

  /// Describes a forecast export job created using the
  /// <a>CreateForecastExportJob</a> operation.
  ///
  /// In addition to listing the properties provided by the user in the
  /// <code>CreateForecastExportJob</code> request, this operation lists the
  /// following properties:
  ///
  /// <ul>
  /// <li>
  /// <code>CreationTime</code>
  /// </li>
  /// <li>
  /// <code>LastModificationTime</code>
  /// </li>
  /// <li>
  /// <code>Status</code>
  /// </li>
  /// <li>
  /// <code>Message</code> - If an error occurred, information about the error.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [forecastExportJobArn] :
  /// The Amazon Resource Name (ARN) of the forecast export job.
  Future<DescribeForecastExportJobResponse> describeForecastExportJob({
    @_s.required String forecastExportJobArn,
  }) async {
    ArgumentError.checkNotNull(forecastExportJobArn, 'forecastExportJobArn');
    _s.validateStringLength(
      'forecastExportJobArn',
      forecastExportJobArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'forecastExportJobArn',
      forecastExportJobArn,
      r'''^[a-zA-Z0-9\-\_\.\/\:]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DescribeForecastExportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ForecastExportJobArn': forecastExportJobArn,
      },
    );

    return DescribeForecastExportJobResponse.fromJson(jsonResponse.body);
  }

  /// Describes a predictor created using the <a>CreatePredictor</a> operation.
  ///
  /// In addition to listing the properties provided in the
  /// <code>CreatePredictor</code> request, this operation lists the following
  /// properties:
  ///
  /// <ul>
  /// <li>
  /// <code>DatasetImportJobArns</code> - The dataset import jobs used to import
  /// training data.
  /// </li>
  /// <li>
  /// <code>AutoMLAlgorithmArns</code> - If AutoML is performed, the algorithms
  /// that were evaluated.
  /// </li>
  /// <li>
  /// <code>CreationTime</code>
  /// </li>
  /// <li>
  /// <code>LastModificationTime</code>
  /// </li>
  /// <li>
  /// <code>Status</code>
  /// </li>
  /// <li>
  /// <code>Message</code> - If an error occurred, information about the error.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [predictorArn] :
  /// The Amazon Resource Name (ARN) of the predictor that you want information
  /// about.
  Future<DescribePredictorResponse> describePredictor({
    @_s.required String predictorArn,
  }) async {
    ArgumentError.checkNotNull(predictorArn, 'predictorArn');
    _s.validateStringLength(
      'predictorArn',
      predictorArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'predictorArn',
      predictorArn,
      r'''^[a-zA-Z0-9\-\_\.\/\:]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.DescribePredictor'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PredictorArn': predictorArn,
      },
    );

    return DescribePredictorResponse.fromJson(jsonResponse.body);
  }

  /// Provides metrics on the accuracy of the models that were trained by the
  /// <a>CreatePredictor</a> operation. Use metrics to see how well the model
  /// performed and to decide whether to use the predictor to generate a
  /// forecast. For more information, see <a>metrics</a>.
  ///
  /// This operation generates metrics for each backtest window that was
  /// evaluated. The number of backtest windows
  /// (<code>NumberOfBacktestWindows</code>) is specified using the
  /// <a>EvaluationParameters</a> object, which is optionally included in the
  /// <code>CreatePredictor</code> request. If
  /// <code>NumberOfBacktestWindows</code> isn't specified, the number defaults
  /// to one.
  ///
  /// The parameters of the <code>filling</code> method determine which items
  /// contribute to the metrics. If you want all items to contribute, specify
  /// <code>zero</code>. If you want only those items that have complete data in
  /// the range being evaluated to contribute, specify <code>nan</code>. For
  /// more information, see <a>FeaturizationMethod</a>.
  /// <note>
  /// Before you can get accuracy metrics, the <code>Status</code> of the
  /// predictor must be <code>ACTIVE</code>, signifying that training has
  /// completed. To get the status, use the <a>DescribePredictor</a> operation.
  /// </note>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [predictorArn] :
  /// The Amazon Resource Name (ARN) of the predictor to get metrics for.
  Future<GetAccuracyMetricsResponse> getAccuracyMetrics({
    @_s.required String predictorArn,
  }) async {
    ArgumentError.checkNotNull(predictorArn, 'predictorArn');
    _s.validateStringLength(
      'predictorArn',
      predictorArn,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'predictorArn',
      predictorArn,
      r'''^[a-zA-Z0-9\-\_\.\/\:]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.GetAccuracyMetrics'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PredictorArn': predictorArn,
      },
    );

    return GetAccuracyMetricsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of dataset groups created using the
  /// <a>CreateDatasetGroup</a> operation. For each dataset group, this
  /// operation returns a summary of its properties, including its Amazon
  /// Resource Name (ARN). You can retrieve the complete set of properties by
  /// using the dataset group ARN with the <a>DescribeDatasetGroup</a>
  /// operation.
  ///
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The number of items to return in the response.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request was truncated, the response includes
  /// a <code>NextToken</code>. To retrieve the next set of results, use the
  /// token in the next request. Tokens expire after 24 hours.
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
      1,
      3000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.ListDatasetGroups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListDatasetGroupsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of dataset import jobs created using the
  /// <a>CreateDatasetImportJob</a> operation. For each import job, this
  /// operation returns a summary of its properties, including its Amazon
  /// Resource Name (ARN). You can retrieve the complete set of properties by
  /// using the ARN with the <a>DescribeDatasetImportJob</a> operation. You can
  /// filter the list by providing an array of <a>Filter</a> objects.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [filters] :
  /// An array of filters. For each filter, you provide a condition and a match
  /// statement. The condition is either <code>IS</code> or <code>IS_NOT</code>,
  /// which specifies whether to include or exclude the datasets that match the
  /// statement from the list, respectively. The match statement consists of a
  /// key and a value.
  ///
  /// <b>Filter properties</b>
  ///
  /// <ul>
  /// <li>
  /// <code>Condition</code> - The condition to apply. Valid values are
  /// <code>IS</code> and <code>IS_NOT</code>. To include the datasets that
  /// match the statement, specify <code>IS</code>. To exclude matching
  /// datasets, specify <code>IS_NOT</code>.
  /// </li>
  /// <li>
  /// <code>Key</code> - The name of the parameter to filter on. Valid values
  /// are <code>DatasetArn</code> and <code>Status</code>.
  /// </li>
  /// <li>
  /// <code>Value</code> - The value to match.
  /// </li>
  /// </ul>
  /// For example, to list all dataset import jobs whose status is ACTIVE, you
  /// specify the following filter:
  ///
  /// <code>"Filters": [ { "Condition": "IS", "Key": "Status", "Value": "ACTIVE"
  /// } ]</code>
  ///
  /// Parameter [maxResults] :
  /// The number of items to return in the response.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request was truncated, the response includes
  /// a <code>NextToken</code>. To retrieve the next set of results, use the
  /// token in the next request. Tokens expire after 24 hours.
  Future<ListDatasetImportJobsResponse> listDatasetImportJobs({
    List<Filter> filters,
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
      1,
      3000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.ListDatasetImportJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filters': filters,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListDatasetImportJobsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of datasets created using the <a>CreateDataset</a>
  /// operation. For each dataset, a summary of its properties, including its
  /// Amazon Resource Name (ARN), is returned. To retrieve the complete set of
  /// properties, use the ARN with the <a>DescribeDataset</a> operation.
  ///
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The number of items to return in the response.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request was truncated, the response includes
  /// a <code>NextToken</code>. To retrieve the next set of results, use the
  /// token in the next request. Tokens expire after 24 hours.
  Future<ListDatasetsResponse> listDatasets({
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
      1,
      3000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.ListDatasets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListDatasetsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of forecast export jobs created using the
  /// <a>CreateForecastExportJob</a> operation. For each forecast export job,
  /// this operation returns a summary of its properties, including its Amazon
  /// Resource Name (ARN). To retrieve the complete set of properties, use the
  /// ARN with the <a>DescribeForecastExportJob</a> operation. You can filter
  /// the list using an array of <a>Filter</a> objects.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [filters] :
  /// An array of filters. For each filter, you provide a condition and a match
  /// statement. The condition is either <code>IS</code> or <code>IS_NOT</code>,
  /// which specifies whether to include or exclude the forecast export jobs
  /// that match the statement from the list, respectively. The match statement
  /// consists of a key and a value.
  ///
  /// <b>Filter properties</b>
  ///
  /// <ul>
  /// <li>
  /// <code>Condition</code> - The condition to apply. Valid values are
  /// <code>IS</code> and <code>IS_NOT</code>. To include the forecast export
  /// jobs that match the statement, specify <code>IS</code>. To exclude
  /// matching forecast export jobs, specify <code>IS_NOT</code>.
  /// </li>
  /// <li>
  /// <code>Key</code> - The name of the parameter to filter on. Valid values
  /// are <code>ForecastArn</code> and <code>Status</code>.
  /// </li>
  /// <li>
  /// <code>Value</code> - The value to match.
  /// </li>
  /// </ul>
  /// For example, to list all jobs that export a forecast named
  /// <i>electricityforecast</i>, specify the following filter:
  ///
  /// <code>"Filters": [ { "Condition": "IS", "Key": "ForecastArn", "Value":
  /// "arn:aws:forecast:us-west-2:&lt;acct-id&gt;:forecast/electricityforecast"
  /// } ]</code>
  ///
  /// Parameter [maxResults] :
  /// The number of items to return in the response.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request was truncated, the response includes
  /// a <code>NextToken</code>. To retrieve the next set of results, use the
  /// token in the next request. Tokens expire after 24 hours.
  Future<ListForecastExportJobsResponse> listForecastExportJobs({
    List<Filter> filters,
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
      1,
      3000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.ListForecastExportJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filters': filters,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListForecastExportJobsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of forecasts created using the <a>CreateForecast</a>
  /// operation. For each forecast, this operation returns a summary of its
  /// properties, including its Amazon Resource Name (ARN). To retrieve the
  /// complete set of properties, specify the ARN with the
  /// <a>DescribeForecast</a> operation. You can filter the list using an array
  /// of <a>Filter</a> objects.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [filters] :
  /// An array of filters. For each filter, you provide a condition and a match
  /// statement. The condition is either <code>IS</code> or <code>IS_NOT</code>,
  /// which specifies whether to include or exclude the forecasts that match the
  /// statement from the list, respectively. The match statement consists of a
  /// key and a value.
  ///
  /// <b>Filter properties</b>
  ///
  /// <ul>
  /// <li>
  /// <code>Condition</code> - The condition to apply. Valid values are
  /// <code>IS</code> and <code>IS_NOT</code>. To include the forecasts that
  /// match the statement, specify <code>IS</code>. To exclude matching
  /// forecasts, specify <code>IS_NOT</code>.
  /// </li>
  /// <li>
  /// <code>Key</code> - The name of the parameter to filter on. Valid values
  /// are <code>DatasetGroupArn</code>, <code>PredictorArn</code>, and
  /// <code>Status</code>.
  /// </li>
  /// <li>
  /// <code>Value</code> - The value to match.
  /// </li>
  /// </ul>
  /// For example, to list all forecasts whose status is not ACTIVE, you would
  /// specify:
  ///
  /// <code>"Filters": [ { "Condition": "IS_NOT", "Key": "Status", "Value":
  /// "ACTIVE" } ]</code>
  ///
  /// Parameter [maxResults] :
  /// The number of items to return in the response.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request was truncated, the response includes
  /// a <code>NextToken</code>. To retrieve the next set of results, use the
  /// token in the next request. Tokens expire after 24 hours.
  Future<ListForecastsResponse> listForecasts({
    List<Filter> filters,
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
      1,
      3000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.ListForecasts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filters': filters,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListForecastsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of predictors created using the <a>CreatePredictor</a>
  /// operation. For each predictor, this operation returns a summary of its
  /// properties, including its Amazon Resource Name (ARN). You can retrieve the
  /// complete set of properties by using the ARN with the
  /// <a>DescribePredictor</a> operation. You can filter the list using an array
  /// of <a>Filter</a> objects.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidInputException].
  ///
  /// Parameter [filters] :
  /// An array of filters. For each filter, you provide a condition and a match
  /// statement. The condition is either <code>IS</code> or <code>IS_NOT</code>,
  /// which specifies whether to include or exclude the predictors that match
  /// the statement from the list, respectively. The match statement consists of
  /// a key and a value.
  ///
  /// <b>Filter properties</b>
  ///
  /// <ul>
  /// <li>
  /// <code>Condition</code> - The condition to apply. Valid values are
  /// <code>IS</code> and <code>IS_NOT</code>. To include the predictors that
  /// match the statement, specify <code>IS</code>. To exclude matching
  /// predictors, specify <code>IS_NOT</code>.
  /// </li>
  /// <li>
  /// <code>Key</code> - The name of the parameter to filter on. Valid values
  /// are <code>DatasetGroupArn</code> and <code>Status</code>.
  /// </li>
  /// <li>
  /// <code>Value</code> - The value to match.
  /// </li>
  /// </ul>
  /// For example, to list all predictors whose status is ACTIVE, you would
  /// specify:
  ///
  /// <code>"Filters": [ { "Condition": "IS", "Key": "Status", "Value": "ACTIVE"
  /// } ]</code>
  ///
  /// Parameter [maxResults] :
  /// The number of items to return in the response.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request was truncated, the response includes
  /// a <code>NextToken</code>. To retrieve the next set of results, use the
  /// token in the next request. Tokens expire after 24 hours.
  Future<ListPredictorsResponse> listPredictors({
    List<Filter> filters,
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
      1,
      3000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.ListPredictors'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Filters': filters,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListPredictorsResponse.fromJson(jsonResponse.body);
  }

  /// Replaces the datasets in a dataset group with the specified datasets.
  /// <note>
  /// The <code>Status</code> of the dataset group must be <code>ACTIVE</code>
  /// before you can use the dataset group to create a predictor. Use the
  /// <a>DescribeDatasetGroup</a> operation to get the status.
  /// </note>
  ///
  /// May throw [InvalidInputException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [datasetArns] :
  /// An array of the Amazon Resource Names (ARNs) of the datasets to add to the
  /// dataset group.
  ///
  /// Parameter [datasetGroupArn] :
  /// The ARN of the dataset group.
  Future<void> updateDatasetGroup({
    @_s.required List<String> datasetArns,
    @_s.required String datasetGroupArn,
  }) async {
    ArgumentError.checkNotNull(datasetArns, 'datasetArns');
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
      r'''^[a-zA-Z0-9\-\_\.\/\:]+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonForecast.UpdateDatasetGroup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatasetArns': datasetArns,
        'DatasetGroupArn': datasetGroupArn,
      },
    );

    return UpdateDatasetGroupResponse.fromJson(jsonResponse.body);
  }
}

enum AttributeType {
  @_s.JsonValue('string')
  string,
  @_s.JsonValue('integer')
  integer,
  @_s.JsonValue('float')
  float,
  @_s.JsonValue('timestamp')
  timestamp,
}

/// Specifies a categorical hyperparameter and it's range of tunable values.
/// This object is part of the <a>ParameterRanges</a> object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CategoricalParameterRange {
  /// The name of the categorical hyperparameter to tune.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A list of the tunable categories for the hyperparameter.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  CategoricalParameterRange({
    @_s.required this.name,
    @_s.required this.values,
  });
  factory CategoricalParameterRange.fromJson(Map<String, dynamic> json) =>
      _$CategoricalParameterRangeFromJson(json);

  Map<String, dynamic> toJson() => _$CategoricalParameterRangeToJson(this);
}

/// Specifies a continuous hyperparameter and it's range of tunable values. This
/// object is part of the <a>ParameterRanges</a> object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ContinuousParameterRange {
  /// The maximum tunable value of the hyperparameter.
  @_s.JsonKey(name: 'MaxValue')
  final double maxValue;

  /// The minimum tunable value of the hyperparameter.
  @_s.JsonKey(name: 'MinValue')
  final double minValue;

  /// The name of the hyperparameter to tune.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The scale that hyperparameter tuning uses to search the hyperparameter
  /// range. Valid values:
  /// <dl> <dt>Auto</dt> <dd>
  /// Amazon Forecast hyperparameter tuning chooses the best scale for the
  /// hyperparameter.
  /// </dd> <dt>Linear</dt> <dd>
  /// Hyperparameter tuning searches the values in the hyperparameter range by
  /// using a linear scale.
  /// </dd> <dt>Logarithmic</dt> <dd>
  /// Hyperparameter tuning searches the values in the hyperparameter range by
  /// using a logarithmic scale.
  ///
  /// Logarithmic scaling works only for ranges that have values greater than 0.
  /// </dd> <dt>ReverseLogarithmic</dt> <dd>
  /// hyperparameter tuning searches the values in the hyperparameter range by
  /// using a reverse logarithmic scale.
  ///
  /// Reverse logarithmic scaling works only for ranges that are entirely within
  /// the range 0 &lt;= x &lt; 1.0.
  /// </dd> </dl>
  /// For information about choosing a hyperparameter scale, see <a
  /// href="http://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-define-ranges.html#scaling-type">Hyperparameter
  /// Scaling</a>. One of the following values:
  @_s.JsonKey(name: 'ScalingType')
  final ScalingType scalingType;

  ContinuousParameterRange({
    @_s.required this.maxValue,
    @_s.required this.minValue,
    @_s.required this.name,
    this.scalingType,
  });
  factory ContinuousParameterRange.fromJson(Map<String, dynamic> json) =>
      _$ContinuousParameterRangeFromJson(json);

  Map<String, dynamic> toJson() => _$ContinuousParameterRangeToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDatasetGroupResponse {
  /// The Amazon Resource Name (ARN) of the dataset group.
  @_s.JsonKey(name: 'DatasetGroupArn')
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
  /// The Amazon Resource Name (ARN) of the dataset import job.
  @_s.JsonKey(name: 'DatasetImportJobArn')
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
  /// The Amazon Resource Name (ARN) of the dataset.
  @_s.JsonKey(name: 'DatasetArn')
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
class CreateForecastExportJobResponse {
  /// The Amazon Resource Name (ARN) of the export job.
  @_s.JsonKey(name: 'ForecastExportJobArn')
  final String forecastExportJobArn;

  CreateForecastExportJobResponse({
    this.forecastExportJobArn,
  });
  factory CreateForecastExportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateForecastExportJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateForecastResponse {
  /// The Amazon Resource Name (ARN) of the forecast.
  @_s.JsonKey(name: 'ForecastArn')
  final String forecastArn;

  CreateForecastResponse({
    this.forecastArn,
  });
  factory CreateForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateForecastResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePredictorResponse {
  /// The Amazon Resource Name (ARN) of the predictor.
  @_s.JsonKey(name: 'PredictorArn')
  final String predictorArn;

  CreatePredictorResponse({
    this.predictorArn,
  });
  factory CreatePredictorResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePredictorResponseFromJson(json);
}

/// The destination for an exported forecast, an AWS Identity and Access
/// Management (IAM) role that allows Amazon Forecast to access the location
/// and, optionally, an AWS Key Management Service (KMS) key. This object is
/// submitted in the <a>CreateForecastExportJob</a> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataDestination {
  /// The path to an Amazon Simple Storage Service (Amazon S3) bucket along with
  /// the credentials to access the bucket.
  @_s.JsonKey(name: 'S3Config')
  final S3Config s3Config;

  DataDestination({
    @_s.required this.s3Config,
  });
  factory DataDestination.fromJson(Map<String, dynamic> json) =>
      _$DataDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$DataDestinationToJson(this);
}

/// The source of your training data, an AWS Identity and Access Management
/// (IAM) role that allows Amazon Forecast to access the data and, optionally,
/// an AWS Key Management Service (KMS) key. This object is submitted in the
/// <a>CreateDatasetImportJob</a> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataSource {
  /// The path to the training data stored in an Amazon Simple Storage Service
  /// (Amazon S3) bucket along with the credentials to access the data.
  @_s.JsonKey(name: 'S3Config')
  final S3Config s3Config;

  DataSource({
    @_s.required this.s3Config,
  });
  factory DataSource.fromJson(Map<String, dynamic> json) =>
      _$DataSourceFromJson(json);

  Map<String, dynamic> toJson() => _$DataSourceToJson(this);
}

/// Provides a summary of the dataset group properties used in the
/// <a>ListDatasetGroups</a> operation. To get the complete set of properties,
/// call the <a>DescribeDatasetGroup</a> operation, and provide the
/// <code>DatasetGroupArn</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatasetGroupSummary {
  /// When the dataset group was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the dataset group.
  @_s.JsonKey(name: 'DatasetGroupArn')
  final String datasetGroupArn;

  /// The name of the dataset group.
  @_s.JsonKey(name: 'DatasetGroupName')
  final String datasetGroupName;

  /// When the dataset group was created or last updated from a call to the
  /// <a>UpdateDatasetGroup</a> operation. While the dataset group is being
  /// updated, <code>LastModificationTime</code> is the current time of the
  /// <code>ListDatasetGroups</code> call.
  @_s.JsonKey(
      name: 'LastModificationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModificationTime;

  DatasetGroupSummary({
    this.creationTime,
    this.datasetGroupArn,
    this.datasetGroupName,
    this.lastModificationTime,
  });
  factory DatasetGroupSummary.fromJson(Map<String, dynamic> json) =>
      _$DatasetGroupSummaryFromJson(json);
}

/// Provides a summary of the dataset import job properties used in the
/// <a>ListDatasetImportJobs</a> operation. To get the complete set of
/// properties, call the <a>DescribeDatasetImportJob</a> operation, and provide
/// the <code>DatasetImportJobArn</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatasetImportJobSummary {
  /// When the dataset import job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The location of the training data to import and an AWS Identity and Access
  /// Management (IAM) role that Amazon Forecast can assume to access the data.
  /// The training data must be stored in an Amazon S3 bucket.
  ///
  /// If encryption is used, <code>DataSource</code> includes an AWS Key
  /// Management Service (KMS) key.
  @_s.JsonKey(name: 'DataSource')
  final DataSource dataSource;

  /// The Amazon Resource Name (ARN) of the dataset import job.
  @_s.JsonKey(name: 'DatasetImportJobArn')
  final String datasetImportJobArn;

  /// The name of the dataset import job.
  @_s.JsonKey(name: 'DatasetImportJobName')
  final String datasetImportJobName;

  /// The last time that the dataset was modified. The time depends on the status
  /// of the job, as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The same time as <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  @_s.JsonKey(
      name: 'LastModificationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModificationTime;

  /// If an error occurred, an informational message about the error.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The status of the dataset import job. The status is reflected in the status
  /// of the dataset. For example, when the import job status is
  /// <code>CREATE_IN_PROGRESS</code>, the status of the dataset is
  /// <code>UPDATE_IN_PROGRESS</code>. States include:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>
  /// </li>
  /// <li>
  /// <code>CREATE_PENDING</code>, <code>CREATE_IN_PROGRESS</code>,
  /// <code>CREATE_FAILED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final String status;

  DatasetImportJobSummary({
    this.creationTime,
    this.dataSource,
    this.datasetImportJobArn,
    this.datasetImportJobName,
    this.lastModificationTime,
    this.message,
    this.status,
  });
  factory DatasetImportJobSummary.fromJson(Map<String, dynamic> json) =>
      _$DatasetImportJobSummaryFromJson(json);
}

/// Provides a summary of the dataset properties used in the <a>ListDatasets</a>
/// operation. To get the complete set of properties, call the
/// <a>DescribeDataset</a> operation, and provide the <code>DatasetArn</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatasetSummary {
  /// When the dataset was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the dataset.
  @_s.JsonKey(name: 'DatasetArn')
  final String datasetArn;

  /// The name of the dataset.
  @_s.JsonKey(name: 'DatasetName')
  final String datasetName;

  /// The dataset type.
  @_s.JsonKey(name: 'DatasetType')
  final DatasetType datasetType;

  /// The domain associated with the dataset.
  @_s.JsonKey(name: 'Domain')
  final Domain domain;

  /// When you create a dataset, <code>LastModificationTime</code> is the same as
  /// <code>CreationTime</code>. While data is being imported to the dataset,
  /// <code>LastModificationTime</code> is the current time of the
  /// <code>ListDatasets</code> call. After a <a>CreateDatasetImportJob</a>
  /// operation has finished, <code>LastModificationTime</code> is when the import
  /// job completed or failed.
  @_s.JsonKey(
      name: 'LastModificationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModificationTime;

  DatasetSummary({
    this.creationTime,
    this.datasetArn,
    this.datasetName,
    this.datasetType,
    this.domain,
    this.lastModificationTime,
  });
  factory DatasetSummary.fromJson(Map<String, dynamic> json) =>
      _$DatasetSummaryFromJson(json);
}

enum DatasetType {
  @_s.JsonValue('TARGET_TIME_SERIES')
  targetTimeSeries,
  @_s.JsonValue('RELATED_TIME_SERIES')
  relatedTimeSeries,
  @_s.JsonValue('ITEM_METADATA')
  itemMetadata,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDatasetGroupResponse {
  /// When the dataset group was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// An array of Amazon Resource Names (ARNs) of the datasets contained in the
  /// dataset group.
  @_s.JsonKey(name: 'DatasetArns')
  final List<String> datasetArns;

  /// The ARN of the dataset group.
  @_s.JsonKey(name: 'DatasetGroupArn')
  final String datasetGroupArn;

  /// The name of the dataset group.
  @_s.JsonKey(name: 'DatasetGroupName')
  final String datasetGroupName;

  /// The domain associated with the dataset group.
  @_s.JsonKey(name: 'Domain')
  final Domain domain;

  /// When the dataset group was created or last updated from a call to the
  /// <a>UpdateDatasetGroup</a> operation. While the dataset group is being
  /// updated, <code>LastModificationTime</code> is the current time of the
  /// <code>DescribeDatasetGroup</code> call.
  @_s.JsonKey(
      name: 'LastModificationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModificationTime;

  /// The status of the dataset group. States include:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>
  /// </li>
  /// <li>
  /// <code>CREATE_PENDING</code>, <code>CREATE_IN_PROGRESS</code>,
  /// <code>CREATE_FAILED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// <li>
  /// <code>UPDATE_PENDING</code>, <code>UPDATE_IN_PROGRESS</code>,
  /// <code>UPDATE_FAILED</code>
  /// </li>
  /// </ul>
  /// The <code>UPDATE</code> states apply when you call the
  /// <a>UpdateDatasetGroup</a> operation.
  /// <note>
  /// The <code>Status</code> of the dataset group must be <code>ACTIVE</code>
  /// before you can use the dataset group to create a predictor.
  /// </note>
  @_s.JsonKey(name: 'Status')
  final String status;

  DescribeDatasetGroupResponse({
    this.creationTime,
    this.datasetArns,
    this.datasetGroupArn,
    this.datasetGroupName,
    this.domain,
    this.lastModificationTime,
    this.status,
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
  /// When the dataset import job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The size of the dataset in gigabytes (GB) after the import job has finished.
  @_s.JsonKey(name: 'DataSize')
  final double dataSize;

  /// The location of the training data to import and an AWS Identity and Access
  /// Management (IAM) role that Amazon Forecast can assume to access the data.
  ///
  /// If encryption is used, <code>DataSource</code> includes an AWS Key
  /// Management Service (KMS) key.
  @_s.JsonKey(name: 'DataSource')
  final DataSource dataSource;

  /// The Amazon Resource Name (ARN) of the dataset that the training data was
  /// imported to.
  @_s.JsonKey(name: 'DatasetArn')
  final String datasetArn;

  /// The ARN of the dataset import job.
  @_s.JsonKey(name: 'DatasetImportJobArn')
  final String datasetImportJobArn;

  /// The name of the dataset import job.
  @_s.JsonKey(name: 'DatasetImportJobName')
  final String datasetImportJobName;

  /// Statistical information about each field in the input data.
  @_s.JsonKey(name: 'FieldStatistics')
  final Map<String, Statistics> fieldStatistics;

  /// The last time that the dataset was modified. The time depends on the status
  /// of the job, as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATE_PENDING</code> - The same time as <code>CreationTime</code>.
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code> - The current timestamp.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> or <code>CREATE_FAILED</code> - When the job finished or
  /// failed.
  /// </li>
  /// </ul>
  @_s.JsonKey(
      name: 'LastModificationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModificationTime;

  /// If an error occurred, an informational message about the error.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The status of the dataset import job. The status is reflected in the status
  /// of the dataset. For example, when the import job status is
  /// <code>CREATE_IN_PROGRESS</code>, the status of the dataset is
  /// <code>UPDATE_IN_PROGRESS</code>. States include:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>
  /// </li>
  /// <li>
  /// <code>CREATE_PENDING</code>, <code>CREATE_IN_PROGRESS</code>,
  /// <code>CREATE_FAILED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The format of timestamps in the dataset. The format that you specify depends
  /// on the <code>DataFrequency</code> specified when the dataset was created.
  /// The following formats are supported
  ///
  /// <ul>
  /// <li>
  /// "yyyy-MM-dd"
  ///
  /// For the following data frequencies: Y, M, W, and D
  /// </li>
  /// <li>
  /// "yyyy-MM-dd HH:mm:ss"
  ///
  /// For the following data frequencies: H, 30min, 15min, and 1min; and
  /// optionally, for: Y, M, W, and D
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'TimestampFormat')
  final String timestampFormat;

  DescribeDatasetImportJobResponse({
    this.creationTime,
    this.dataSize,
    this.dataSource,
    this.datasetArn,
    this.datasetImportJobArn,
    this.datasetImportJobName,
    this.fieldStatistics,
    this.lastModificationTime,
    this.message,
    this.status,
    this.timestampFormat,
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
  /// When the dataset was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The frequency of data collection.
  ///
  /// Valid intervals are Y (Year), M (Month), W (Week), D (Day), H (Hour), 30min
  /// (30 minutes), 15min (15 minutes), 10min (10 minutes), 5min (5 minutes), and
  /// 1min (1 minute). For example, "M" indicates every month and "30min"
  /// indicates every 30 minutes.
  @_s.JsonKey(name: 'DataFrequency')
  final String dataFrequency;

  /// The Amazon Resource Name (ARN) of the dataset.
  @_s.JsonKey(name: 'DatasetArn')
  final String datasetArn;

  /// The name of the dataset.
  @_s.JsonKey(name: 'DatasetName')
  final String datasetName;

  /// The dataset type.
  @_s.JsonKey(name: 'DatasetType')
  final DatasetType datasetType;

  /// The domain associated with the dataset.
  @_s.JsonKey(name: 'Domain')
  final Domain domain;

  /// The AWS Key Management Service (KMS) key and the AWS Identity and Access
  /// Management (IAM) role that Amazon Forecast can assume to access the key.
  @_s.JsonKey(name: 'EncryptionConfig')
  final EncryptionConfig encryptionConfig;

  /// When you create a dataset, <code>LastModificationTime</code> is the same as
  /// <code>CreationTime</code>. While data is being imported to the dataset,
  /// <code>LastModificationTime</code> is the current time of the
  /// <code>DescribeDataset</code> call. After a <a>CreateDatasetImportJob</a>
  /// operation has finished, <code>LastModificationTime</code> is when the import
  /// job completed or failed.
  @_s.JsonKey(
      name: 'LastModificationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModificationTime;

  /// An array of <code>SchemaAttribute</code> objects that specify the dataset
  /// fields. Each <code>SchemaAttribute</code> specifies the name and data type
  /// of a field.
  @_s.JsonKey(name: 'Schema')
  final Schema schema;

  /// The status of the dataset. States include:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>
  /// </li>
  /// <li>
  /// <code>CREATE_PENDING</code>, <code>CREATE_IN_PROGRESS</code>,
  /// <code>CREATE_FAILED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// <li>
  /// <code>UPDATE_PENDING</code>, <code>UPDATE_IN_PROGRESS</code>,
  /// <code>UPDATE_FAILED</code>
  /// </li>
  /// </ul>
  /// The <code>UPDATE</code> states apply while data is imported to the dataset
  /// from a call to the <a>CreateDatasetImportJob</a> operation and reflect the
  /// status of the dataset import job. For example, when the import job status is
  /// <code>CREATE_IN_PROGRESS</code>, the status of the dataset is
  /// <code>UPDATE_IN_PROGRESS</code>.
  /// <note>
  /// The <code>Status</code> of the dataset must be <code>ACTIVE</code> before
  /// you can import training data.
  /// </note>
  @_s.JsonKey(name: 'Status')
  final String status;

  DescribeDatasetResponse({
    this.creationTime,
    this.dataFrequency,
    this.datasetArn,
    this.datasetName,
    this.datasetType,
    this.domain,
    this.encryptionConfig,
    this.lastModificationTime,
    this.schema,
    this.status,
  });
  factory DescribeDatasetResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDatasetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeForecastExportJobResponse {
  /// When the forecast export job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The path to the Amazon Simple Storage Service (Amazon S3) bucket where the
  /// forecast is exported.
  @_s.JsonKey(name: 'Destination')
  final DataDestination destination;

  /// The Amazon Resource Name (ARN) of the exported forecast.
  @_s.JsonKey(name: 'ForecastArn')
  final String forecastArn;

  /// The ARN of the forecast export job.
  @_s.JsonKey(name: 'ForecastExportJobArn')
  final String forecastExportJobArn;

  /// The name of the forecast export job.
  @_s.JsonKey(name: 'ForecastExportJobName')
  final String forecastExportJobName;

  /// When the last successful export job finished.
  @_s.JsonKey(
      name: 'LastModificationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModificationTime;

  /// If an error occurred, an informational message about the error.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The status of the forecast export job. States include:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>
  /// </li>
  /// <li>
  /// <code>CREATE_PENDING</code>, <code>CREATE_IN_PROGRESS</code>,
  /// <code>CREATE_FAILED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul> <note>
  /// The <code>Status</code> of the forecast export job must be
  /// <code>ACTIVE</code> before you can access the forecast in your S3 bucket.
  /// </note>
  @_s.JsonKey(name: 'Status')
  final String status;

  DescribeForecastExportJobResponse({
    this.creationTime,
    this.destination,
    this.forecastArn,
    this.forecastExportJobArn,
    this.forecastExportJobName,
    this.lastModificationTime,
    this.message,
    this.status,
  });
  factory DescribeForecastExportJobResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeForecastExportJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeForecastResponse {
  /// When the forecast creation task was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The ARN of the dataset group that provided the data used to train the
  /// predictor.
  @_s.JsonKey(name: 'DatasetGroupArn')
  final String datasetGroupArn;

  /// The forecast ARN as specified in the request.
  @_s.JsonKey(name: 'ForecastArn')
  final String forecastArn;

  /// The name of the forecast.
  @_s.JsonKey(name: 'ForecastName')
  final String forecastName;

  /// The quantiles at which proababilistic forecasts were generated.
  @_s.JsonKey(name: 'ForecastTypes')
  final List<String> forecastTypes;

  /// Initially, the same as <code>CreationTime</code> (status is
  /// <code>CREATE_PENDING</code>). Updated when inference (creating the forecast)
  /// starts (status changed to <code>CREATE_IN_PROGRESS</code>), and when
  /// inference is complete (status changed to <code>ACTIVE</code>) or fails
  /// (status changed to <code>CREATE_FAILED</code>).
  @_s.JsonKey(
      name: 'LastModificationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModificationTime;

  /// If an error occurred, an informational message about the error.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The ARN of the predictor used to generate the forecast.
  @_s.JsonKey(name: 'PredictorArn')
  final String predictorArn;

  /// The status of the forecast. States include:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>
  /// </li>
  /// <li>
  /// <code>CREATE_PENDING</code>, <code>CREATE_IN_PROGRESS</code>,
  /// <code>CREATE_FAILED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul> <note>
  /// The <code>Status</code> of the forecast must be <code>ACTIVE</code> before
  /// you can query or export the forecast.
  /// </note>
  @_s.JsonKey(name: 'Status')
  final String status;

  DescribeForecastResponse({
    this.creationTime,
    this.datasetGroupArn,
    this.forecastArn,
    this.forecastName,
    this.forecastTypes,
    this.lastModificationTime,
    this.message,
    this.predictorArn,
    this.status,
  });
  factory DescribeForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeForecastResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePredictorResponse {
  /// The Amazon Resource Name (ARN) of the algorithm used for model training.
  @_s.JsonKey(name: 'AlgorithmArn')
  final String algorithmArn;

  /// When <code>PerformAutoML</code> is specified, the ARN of the chosen
  /// algorithm.
  @_s.JsonKey(name: 'AutoMLAlgorithmArns')
  final List<String> autoMLAlgorithmArns;

  /// When the model training task was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// An array of the ARNs of the dataset import jobs used to import training data
  /// for the predictor.
  @_s.JsonKey(name: 'DatasetImportJobArns')
  final List<String> datasetImportJobArns;

  /// An AWS Key Management Service (KMS) key and the AWS Identity and Access
  /// Management (IAM) role that Amazon Forecast can assume to access the key.
  @_s.JsonKey(name: 'EncryptionConfig')
  final EncryptionConfig encryptionConfig;

  /// Used to override the default evaluation parameters of the specified
  /// algorithm. Amazon Forecast evaluates a predictor by splitting a dataset into
  /// training data and testing data. The evaluation parameters define how to
  /// perform the split and the number of iterations.
  @_s.JsonKey(name: 'EvaluationParameters')
  final EvaluationParameters evaluationParameters;

  /// The featurization configuration.
  @_s.JsonKey(name: 'FeaturizationConfig')
  final FeaturizationConfig featurizationConfig;

  /// The number of time-steps of the forecast. The forecast horizon is also
  /// called the prediction length.
  @_s.JsonKey(name: 'ForecastHorizon')
  final int forecastHorizon;

  /// The hyperparameter override values for the algorithm.
  @_s.JsonKey(name: 'HPOConfig')
  final HyperParameterTuningJobConfig hPOConfig;

  /// Describes the dataset group that contains the data to use to train the
  /// predictor.
  @_s.JsonKey(name: 'InputDataConfig')
  final InputDataConfig inputDataConfig;

  /// Initially, the same as <code>CreationTime</code> (when the status is
  /// <code>CREATE_PENDING</code>). This value is updated when training starts
  /// (when the status changes to <code>CREATE_IN_PROGRESS</code>), and when
  /// training has completed (when the status changes to <code>ACTIVE</code>) or
  /// fails (when the status changes to <code>CREATE_FAILED</code>).
  @_s.JsonKey(
      name: 'LastModificationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModificationTime;

  /// If an error occurred, an informational message about the error.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// Whether the predictor is set to perform AutoML.
  @_s.JsonKey(name: 'PerformAutoML')
  final bool performAutoML;

  /// Whether the predictor is set to perform hyperparameter optimization (HPO).
  @_s.JsonKey(name: 'PerformHPO')
  final bool performHPO;

  /// The ARN of the predictor.
  @_s.JsonKey(name: 'PredictorArn')
  final String predictorArn;

  /// Details on the the status and results of the backtests performed to evaluate
  /// the accuracy of the predictor. You specify the number of backtests to
  /// perform when you call the operation.
  @_s.JsonKey(name: 'PredictorExecutionDetails')
  final PredictorExecutionDetails predictorExecutionDetails;

  /// The name of the predictor.
  @_s.JsonKey(name: 'PredictorName')
  final String predictorName;

  /// The status of the predictor. States include:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>
  /// </li>
  /// <li>
  /// <code>CREATE_PENDING</code>, <code>CREATE_IN_PROGRESS</code>,
  /// <code>CREATE_FAILED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// <li>
  /// <code>UPDATE_PENDING</code>, <code>UPDATE_IN_PROGRESS</code>,
  /// <code>UPDATE_FAILED</code>
  /// </li>
  /// </ul> <note>
  /// The <code>Status</code> of the predictor must be <code>ACTIVE</code> before
  /// you can use the predictor to create a forecast.
  /// </note>
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The default training parameters or overrides selected during model training.
  /// If using the AutoML algorithm or if HPO is turned on while using the DeepAR+
  /// algorithms, the optimized values for the chosen hyperparameters are
  /// returned. For more information, see <a>aws-forecast-choosing-recipes</a>.
  @_s.JsonKey(name: 'TrainingParameters')
  final Map<String, String> trainingParameters;

  DescribePredictorResponse({
    this.algorithmArn,
    this.autoMLAlgorithmArns,
    this.creationTime,
    this.datasetImportJobArns,
    this.encryptionConfig,
    this.evaluationParameters,
    this.featurizationConfig,
    this.forecastHorizon,
    this.hPOConfig,
    this.inputDataConfig,
    this.lastModificationTime,
    this.message,
    this.performAutoML,
    this.performHPO,
    this.predictorArn,
    this.predictorExecutionDetails,
    this.predictorName,
    this.status,
    this.trainingParameters,
  });
  factory DescribePredictorResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribePredictorResponseFromJson(json);
}

enum Domain {
  @_s.JsonValue('RETAIL')
  retail,
  @_s.JsonValue('CUSTOM')
  custom,
  @_s.JsonValue('INVENTORY_PLANNING')
  inventoryPlanning,
  @_s.JsonValue('EC2_CAPACITY')
  ec2Capacity,
  @_s.JsonValue('WORK_FORCE')
  workForce,
  @_s.JsonValue('WEB_TRAFFIC')
  webTraffic,
  @_s.JsonValue('METRICS')
  metrics,
}

/// An AWS Key Management Service (KMS) key and an AWS Identity and Access
/// Management (IAM) role that Amazon Forecast can assume to access the key. You
/// can specify this optional object in the <a>CreateDataset</a> and
/// <a>CreatePredictor</a> requests.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EncryptionConfig {
  /// The Amazon Resource Name (ARN) of the KMS key.
  @_s.JsonKey(name: 'KMSKeyArn')
  final String kMSKeyArn;

  /// The ARN of the IAM role that Amazon Forecast can assume to access the AWS
  /// KMS key.
  ///
  /// Passing a role across AWS accounts is not allowed. If you pass a role that
  /// isn't in your account, you get an <code>InvalidInputException</code> error.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  EncryptionConfig({
    @_s.required this.kMSKeyArn,
    @_s.required this.roleArn,
  });
  factory EncryptionConfig.fromJson(Map<String, dynamic> json) =>
      _$EncryptionConfigFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptionConfigToJson(this);
}

/// Parameters that define how to split a dataset into training data and testing
/// data, and the number of iterations to perform. These parameters are
/// specified in the predefined algorithms but you can override them in the
/// <a>CreatePredictor</a> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EvaluationParameters {
  /// The point from the end of the dataset where you want to split the data for
  /// model training and testing (evaluation). Specify the value as the number of
  /// data points. The default is the value of the forecast horizon.
  /// <code>BackTestWindowOffset</code> can be used to mimic a past virtual
  /// forecast start date. This value must be greater than or equal to the
  /// forecast horizon and less than half of the TARGET_TIME_SERIES dataset
  /// length.
  ///
  /// <code>ForecastHorizon</code> &lt;= <code>BackTestWindowOffset</code> &lt;
  /// 1/2 * TARGET_TIME_SERIES dataset length
  @_s.JsonKey(name: 'BackTestWindowOffset')
  final int backTestWindowOffset;

  /// The number of times to split the input data. The default is 1. Valid values
  /// are 1 through 5.
  @_s.JsonKey(name: 'NumberOfBacktestWindows')
  final int numberOfBacktestWindows;

  EvaluationParameters({
    this.backTestWindowOffset,
    this.numberOfBacktestWindows,
  });
  factory EvaluationParameters.fromJson(Map<String, dynamic> json) =>
      _$EvaluationParametersFromJson(json);

  Map<String, dynamic> toJson() => _$EvaluationParametersToJson(this);
}

/// The results of evaluating an algorithm. Returned as part of the
/// <a>GetAccuracyMetrics</a> response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EvaluationResult {
  /// The Amazon Resource Name (ARN) of the algorithm that was evaluated.
  @_s.JsonKey(name: 'AlgorithmArn')
  final String algorithmArn;

  /// The array of test windows used for evaluating the algorithm. The
  /// <code>NumberOfBacktestWindows</code> from the <a>EvaluationParameters</a>
  /// object determines the number of windows in the array.
  @_s.JsonKey(name: 'TestWindows')
  final List<WindowSummary> testWindows;

  EvaluationResult({
    this.algorithmArn,
    this.testWindows,
  });
  factory EvaluationResult.fromJson(Map<String, dynamic> json) =>
      _$EvaluationResultFromJson(json);
}

enum EvaluationType {
  @_s.JsonValue('SUMMARY')
  summary,
  @_s.JsonValue('COMPUTED')
  computed,
}

/// Provides featurization (transformation) information for a dataset field.
/// This object is part of the <a>FeaturizationConfig</a> object.
///
/// For example:
///
/// <code>{</code>
///
/// <code>"AttributeName": "demand",</code>
///
/// <code>FeaturizationPipeline [ {</code>
///
/// <code>"FeaturizationMethodName": "filling",</code>
///
/// <code>"FeaturizationMethodParameters": {"aggregation": "avg", "backfill":
/// "nan"}</code>
///
/// <code>} ]</code>
///
/// <code>}</code>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Featurization {
  /// The name of the schema attribute that specifies the data field to be
  /// featurized. Only the <code>target</code> field of the
  /// <code>TARGET_TIME_SERIES</code> dataset type is supported. For example, for
  /// the <code>RETAIL</code> domain, the target is <code>demand</code>, and for
  /// the <code>CUSTOM</code> domain, the target is <code>target_value</code>.
  @_s.JsonKey(name: 'AttributeName')
  final String attributeName;

  /// An array of one <code>FeaturizationMethod</code> object that specifies the
  /// feature transformation method.
  @_s.JsonKey(name: 'FeaturizationPipeline')
  final List<FeaturizationMethod> featurizationPipeline;

  Featurization({
    @_s.required this.attributeName,
    this.featurizationPipeline,
  });
  factory Featurization.fromJson(Map<String, dynamic> json) =>
      _$FeaturizationFromJson(json);

  Map<String, dynamic> toJson() => _$FeaturizationToJson(this);
}

/// In a <a>CreatePredictor</a> operation, the specified algorithm trains a
/// model using the specified dataset group. You can optionally tell the
/// operation to modify data fields prior to training a model. These
/// modifications are referred to as <i>featurization</i>.
///
/// You define featurization using the <code>FeaturizationConfig</code> object.
/// You specify an array of transformations, one for each field that you want to
/// featurize. You then include the <code>FeaturizationConfig</code> object in
/// your <code>CreatePredictor</code> request. Amazon Forecast applies the
/// featurization to the <code>TARGET_TIME_SERIES</code> dataset before model
/// training.
///
/// You can create multiple featurization configurations. For example, you might
/// call the <code>CreatePredictor</code> operation twice by specifying
/// different featurization configurations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FeaturizationConfig {
  /// The frequency of predictions in a forecast.
  ///
  /// Valid intervals are Y (Year), M (Month), W (Week), D (Day), H (Hour), 30min
  /// (30 minutes), 15min (15 minutes), 10min (10 minutes), 5min (5 minutes), and
  /// 1min (1 minute). For example, "Y" indicates every year and "5min" indicates
  /// every five minutes.
  ///
  /// The frequency must be greater than or equal to the TARGET_TIME_SERIES
  /// dataset frequency.
  ///
  /// When a RELATED_TIME_SERIES dataset is provided, the frequency must be equal
  /// to the RELATED_TIME_SERIES dataset frequency.
  @_s.JsonKey(name: 'ForecastFrequency')
  final String forecastFrequency;

  /// An array of featurization (transformation) information for the fields of a
  /// dataset. Only a single featurization is supported.
  @_s.JsonKey(name: 'Featurizations')
  final List<Featurization> featurizations;

  /// An array of dimension (field) names that specify how to group the generated
  /// forecast.
  ///
  /// For example, suppose that you are generating a forecast for item sales
  /// across all of your stores, and your dataset contains a <code>store_id</code>
  /// field. If you want the sales forecast for each item by store, you would
  /// specify <code>store_id</code> as the dimension.
  ///
  /// All forecast dimensions specified in the <code>TARGET_TIME_SERIES</code>
  /// dataset don't need to be specified in the <code>CreatePredictor</code>
  /// request. All forecast dimensions specified in the
  /// <code>RELATED_TIME_SERIES</code> dataset must be specified in the
  /// <code>CreatePredictor</code> request.
  @_s.JsonKey(name: 'ForecastDimensions')
  final List<String> forecastDimensions;

  FeaturizationConfig({
    @_s.required this.forecastFrequency,
    this.featurizations,
    this.forecastDimensions,
  });
  factory FeaturizationConfig.fromJson(Map<String, dynamic> json) =>
      _$FeaturizationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$FeaturizationConfigToJson(this);
}

/// Provides information about the method that featurizes (transforms) a dataset
/// field. The method is part of the <code>FeaturizationPipeline</code> of the
/// <a>Featurization</a> object. If you don't specify
/// <code>FeaturizationMethodParameters</code>, Amazon Forecast uses default
/// parameters.
///
/// The following is an example of how you specify a
/// <code>FeaturizationMethod</code> object.
///
/// <code>{</code>
///
/// <code>"FeaturizationMethodName": "filling",</code>
///
/// <code>"FeaturizationMethodParameters": {"aggregation": "avg", "backfill":
/// "nan"}</code>
///
/// <code>}</code>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FeaturizationMethod {
  /// The name of the method. The "filling" method is the only supported method.
  @_s.JsonKey(name: 'FeaturizationMethodName')
  final FeaturizationMethodName featurizationMethodName;

  /// The method parameters (key-value pairs). Specify these parameters to
  /// override the default values. The following list shows the parameters and
  /// their valid values. Bold signifies the default value.
  ///
  /// <ul>
  /// <li>
  /// <code>aggregation</code>: <b>sum</b>, <code>avg</code>, <code>first</code>,
  /// <code>min</code>, <code>max</code>
  /// </li>
  /// <li>
  /// <code>frontfill</code>: <b>none</b>
  /// </li>
  /// <li>
  /// <code>middlefill</code>: <b>zero</b>, <code>nan</code> (not a number)
  /// </li>
  /// <li>
  /// <code>backfill</code>: <b>zero</b>, <code>nan</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'FeaturizationMethodParameters')
  final Map<String, String> featurizationMethodParameters;

  FeaturizationMethod({
    @_s.required this.featurizationMethodName,
    this.featurizationMethodParameters,
  });
  factory FeaturizationMethod.fromJson(Map<String, dynamic> json) =>
      _$FeaturizationMethodFromJson(json);

  Map<String, dynamic> toJson() => _$FeaturizationMethodToJson(this);
}

enum FeaturizationMethodName {
  @_s.JsonValue('filling')
  filling,
}

/// Describes a filter for choosing a subset of objects. Each filter consists of
/// a condition and a match statement. The condition is either <code>IS</code>
/// or <code>IS_NOT</code>, which specifies whether to include or exclude the
/// objects that match the statement, respectively. The match statement consists
/// of a key and a value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// The condition to apply. To include the objects that match the statement,
  /// specify <code>IS</code>. To exclude matching objects, specify
  /// <code>IS_NOT</code>.
  @_s.JsonKey(name: 'Condition')
  final FilterConditionString condition;

  /// The name of the parameter to filter on.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value to match.
  @_s.JsonKey(name: 'Value')
  final String value;

  Filter({
    @_s.required this.condition,
    @_s.required this.key,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

enum FilterConditionString {
  @_s.JsonValue('IS')
  $is,
  @_s.JsonValue('IS_NOT')
  isNot,
}

/// Provides a summary of the forecast export job properties used in the
/// <a>ListForecastExportJobs</a> operation. To get the complete set of
/// properties, call the <a>DescribeForecastExportJob</a> operation, and provide
/// the listed <code>ForecastExportJobArn</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ForecastExportJobSummary {
  /// When the forecast export job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The path to the Amazon Simple Storage Service (Amazon S3) bucket where the
  /// forecast is exported.
  @_s.JsonKey(name: 'Destination')
  final DataDestination destination;

  /// The Amazon Resource Name (ARN) of the forecast export job.
  @_s.JsonKey(name: 'ForecastExportJobArn')
  final String forecastExportJobArn;

  /// The name of the forecast export job.
  @_s.JsonKey(name: 'ForecastExportJobName')
  final String forecastExportJobName;

  /// When the last successful export job finished.
  @_s.JsonKey(
      name: 'LastModificationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModificationTime;

  /// If an error occurred, an informational message about the error.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The status of the forecast export job. States include:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>
  /// </li>
  /// <li>
  /// <code>CREATE_PENDING</code>, <code>CREATE_IN_PROGRESS</code>,
  /// <code>CREATE_FAILED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul> <note>
  /// The <code>Status</code> of the forecast export job must be
  /// <code>ACTIVE</code> before you can access the forecast in your S3 bucket.
  /// </note>
  @_s.JsonKey(name: 'Status')
  final String status;

  ForecastExportJobSummary({
    this.creationTime,
    this.destination,
    this.forecastExportJobArn,
    this.forecastExportJobName,
    this.lastModificationTime,
    this.message,
    this.status,
  });
  factory ForecastExportJobSummary.fromJson(Map<String, dynamic> json) =>
      _$ForecastExportJobSummaryFromJson(json);
}

/// Provides a summary of the forecast properties used in the
/// <a>ListForecasts</a> operation. To get the complete set of properties, call
/// the <a>DescribeForecast</a> operation, and provide the
/// <code>ForecastArn</code> that is listed in the summary.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ForecastSummary {
  /// When the forecast creation task was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the dataset group that provided the data
  /// used to train the predictor.
  @_s.JsonKey(name: 'DatasetGroupArn')
  final String datasetGroupArn;

  /// The ARN of the forecast.
  @_s.JsonKey(name: 'ForecastArn')
  final String forecastArn;

  /// The name of the forecast.
  @_s.JsonKey(name: 'ForecastName')
  final String forecastName;

  /// Initially, the same as <code>CreationTime</code> (status is
  /// <code>CREATE_PENDING</code>). Updated when inference (creating the forecast)
  /// starts (status changed to <code>CREATE_IN_PROGRESS</code>), and when
  /// inference is complete (status changed to <code>ACTIVE</code>) or fails
  /// (status changed to <code>CREATE_FAILED</code>).
  @_s.JsonKey(
      name: 'LastModificationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModificationTime;

  /// If an error occurred, an informational message about the error.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The ARN of the predictor used to generate the forecast.
  @_s.JsonKey(name: 'PredictorArn')
  final String predictorArn;

  /// The status of the forecast. States include:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>
  /// </li>
  /// <li>
  /// <code>CREATE_PENDING</code>, <code>CREATE_IN_PROGRESS</code>,
  /// <code>CREATE_FAILED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// </ul> <note>
  /// The <code>Status</code> of the forecast must be <code>ACTIVE</code> before
  /// you can query or export the forecast.
  /// </note>
  @_s.JsonKey(name: 'Status')
  final String status;

  ForecastSummary({
    this.creationTime,
    this.datasetGroupArn,
    this.forecastArn,
    this.forecastName,
    this.lastModificationTime,
    this.message,
    this.predictorArn,
    this.status,
  });
  factory ForecastSummary.fromJson(Map<String, dynamic> json) =>
      _$ForecastSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAccuracyMetricsResponse {
  /// An array of results from evaluating the predictor.
  @_s.JsonKey(name: 'PredictorEvaluationResults')
  final List<EvaluationResult> predictorEvaluationResults;

  GetAccuracyMetricsResponse({
    this.predictorEvaluationResults,
  });
  factory GetAccuracyMetricsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAccuracyMetricsResponseFromJson(json);
}

/// Configuration information for a hyperparameter tuning job. You specify this
/// object in the <a>CreatePredictor</a> request.
///
/// A <i>hyperparameter</i> is a parameter that governs the model training
/// process. You set hyperparameters before training starts, unlike model
/// parameters, which are determined during training. The values of the
/// hyperparameters effect which values are chosen for the model parameters.
///
/// In a <i>hyperparameter tuning job</i>, Amazon Forecast chooses the set of
/// hyperparameter values that optimize a specified metric. Forecast
/// accomplishes this by running many training jobs over a range of
/// hyperparameter values. The optimum set of values depends on the algorithm,
/// the training data, and the specified metric objective.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HyperParameterTuningJobConfig {
  /// Specifies the ranges of valid values for the hyperparameters.
  @_s.JsonKey(name: 'ParameterRanges')
  final ParameterRanges parameterRanges;

  HyperParameterTuningJobConfig({
    this.parameterRanges,
  });
  factory HyperParameterTuningJobConfig.fromJson(Map<String, dynamic> json) =>
      _$HyperParameterTuningJobConfigFromJson(json);

  Map<String, dynamic> toJson() => _$HyperParameterTuningJobConfigToJson(this);
}

/// The data used to train a predictor. The data includes a dataset group and
/// any supplementary features. You specify this object in the
/// <a>CreatePredictor</a> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputDataConfig {
  /// The Amazon Resource Name (ARN) of the dataset group.
  @_s.JsonKey(name: 'DatasetGroupArn')
  final String datasetGroupArn;

  /// An array of supplementary features. The only supported feature is a holiday
  /// calendar.
  @_s.JsonKey(name: 'SupplementaryFeatures')
  final List<SupplementaryFeature> supplementaryFeatures;

  InputDataConfig({
    @_s.required this.datasetGroupArn,
    this.supplementaryFeatures,
  });
  factory InputDataConfig.fromJson(Map<String, dynamic> json) =>
      _$InputDataConfigFromJson(json);

  Map<String, dynamic> toJson() => _$InputDataConfigToJson(this);
}

/// Specifies an integer hyperparameter and it's range of tunable values. This
/// object is part of the <a>ParameterRanges</a> object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IntegerParameterRange {
  /// The maximum tunable value of the hyperparameter.
  @_s.JsonKey(name: 'MaxValue')
  final int maxValue;

  /// The minimum tunable value of the hyperparameter.
  @_s.JsonKey(name: 'MinValue')
  final int minValue;

  /// The name of the hyperparameter to tune.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The scale that hyperparameter tuning uses to search the hyperparameter
  /// range. Valid values:
  /// <dl> <dt>Auto</dt> <dd>
  /// Amazon Forecast hyperparameter tuning chooses the best scale for the
  /// hyperparameter.
  /// </dd> <dt>Linear</dt> <dd>
  /// Hyperparameter tuning searches the values in the hyperparameter range by
  /// using a linear scale.
  /// </dd> <dt>Logarithmic</dt> <dd>
  /// Hyperparameter tuning searches the values in the hyperparameter range by
  /// using a logarithmic scale.
  ///
  /// Logarithmic scaling works only for ranges that have values greater than 0.
  /// </dd> <dt>ReverseLogarithmic</dt> <dd>
  /// Not supported for <code>IntegerParameterRange</code>.
  ///
  /// Reverse logarithmic scaling works only for ranges that are entirely within
  /// the range 0 &lt;= x &lt; 1.0.
  /// </dd> </dl>
  /// For information about choosing a hyperparameter scale, see <a
  /// href="http://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-define-ranges.html#scaling-type">Hyperparameter
  /// Scaling</a>. One of the following values:
  @_s.JsonKey(name: 'ScalingType')
  final ScalingType scalingType;

  IntegerParameterRange({
    @_s.required this.maxValue,
    @_s.required this.minValue,
    @_s.required this.name,
    this.scalingType,
  });
  factory IntegerParameterRange.fromJson(Map<String, dynamic> json) =>
      _$IntegerParameterRangeFromJson(json);

  Map<String, dynamic> toJson() => _$IntegerParameterRangeToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDatasetGroupsResponse {
  /// An array of objects that summarize each dataset group's properties.
  @_s.JsonKey(name: 'DatasetGroups')
  final List<DatasetGroupSummary> datasetGroups;

  /// If the response is truncated, Amazon Forecast returns this token. To
  /// retrieve the next set of results, use the token in the next request.
  @_s.JsonKey(name: 'NextToken')
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
  /// An array of objects that summarize each dataset import job's properties.
  @_s.JsonKey(name: 'DatasetImportJobs')
  final List<DatasetImportJobSummary> datasetImportJobs;

  /// If the response is truncated, Amazon Forecast returns this token. To
  /// retrieve the next set of results, use the token in the next request.
  @_s.JsonKey(name: 'NextToken')
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
  /// An array of objects that summarize each dataset's properties.
  @_s.JsonKey(name: 'Datasets')
  final List<DatasetSummary> datasets;

  /// If the response is truncated, Amazon Forecast returns this token. To
  /// retrieve the next set of results, use the token in the next request.
  @_s.JsonKey(name: 'NextToken')
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
class ListForecastExportJobsResponse {
  /// An array of objects that summarize each export job's properties.
  @_s.JsonKey(name: 'ForecastExportJobs')
  final List<ForecastExportJobSummary> forecastExportJobs;

  /// If the response is truncated, Amazon Forecast returns this token. To
  /// retrieve the next set of results, use the token in the next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListForecastExportJobsResponse({
    this.forecastExportJobs,
    this.nextToken,
  });
  factory ListForecastExportJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListForecastExportJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListForecastsResponse {
  /// An array of objects that summarize each forecast's properties.
  @_s.JsonKey(name: 'Forecasts')
  final List<ForecastSummary> forecasts;

  /// If the response is truncated, Amazon Forecast returns this token. To
  /// retrieve the next set of results, use the token in the next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListForecastsResponse({
    this.forecasts,
    this.nextToken,
  });
  factory ListForecastsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListForecastsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPredictorsResponse {
  /// If the response is truncated, Amazon Forecast returns this token. To
  /// retrieve the next set of results, use the token in the next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of objects that summarize each predictor's properties.
  @_s.JsonKey(name: 'Predictors')
  final List<PredictorSummary> predictors;

  ListPredictorsResponse({
    this.nextToken,
    this.predictors,
  });
  factory ListPredictorsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPredictorsResponseFromJson(json);
}

/// Provides metrics that are used to evaluate the performance of a predictor.
/// This object is part of the <a>WindowSummary</a> object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Metrics {
  /// The root mean square error (RMSE).
  @_s.JsonKey(name: 'RMSE')
  final double rmse;

  /// An array of weighted quantile losses. Quantiles divide a probability
  /// distribution into regions of equal probability. The distribution in this
  /// case is the loss function.
  @_s.JsonKey(name: 'WeightedQuantileLosses')
  final List<WeightedQuantileLoss> weightedQuantileLosses;

  Metrics({
    this.rmse,
    this.weightedQuantileLosses,
  });
  factory Metrics.fromJson(Map<String, dynamic> json) =>
      _$MetricsFromJson(json);
}

/// Specifies the categorical, continuous, and integer hyperparameters, and
/// their ranges of tunable values. The range of tunable values determines which
/// values that a hyperparameter tuning job can choose for the specified
/// hyperparameter. This object is part of the
/// <a>HyperParameterTuningJobConfig</a> object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ParameterRanges {
  /// Specifies the tunable range for each categorical hyperparameter.
  @_s.JsonKey(name: 'CategoricalParameterRanges')
  final List<CategoricalParameterRange> categoricalParameterRanges;

  /// Specifies the tunable range for each continuous hyperparameter.
  @_s.JsonKey(name: 'ContinuousParameterRanges')
  final List<ContinuousParameterRange> continuousParameterRanges;

  /// Specifies the tunable range for each integer hyperparameter.
  @_s.JsonKey(name: 'IntegerParameterRanges')
  final List<IntegerParameterRange> integerParameterRanges;

  ParameterRanges({
    this.categoricalParameterRanges,
    this.continuousParameterRanges,
    this.integerParameterRanges,
  });
  factory ParameterRanges.fromJson(Map<String, dynamic> json) =>
      _$ParameterRangesFromJson(json);

  Map<String, dynamic> toJson() => _$ParameterRangesToJson(this);
}

/// The algorithm used to perform a backtest and the status of those tests.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PredictorExecution {
  /// The ARN of the algorithm used to test the predictor.
  @_s.JsonKey(name: 'AlgorithmArn')
  final String algorithmArn;

  /// An array of test windows used to evaluate the algorithm. The
  /// <code>NumberOfBacktestWindows</code> from the object determines the number
  /// of windows in the array.
  @_s.JsonKey(name: 'TestWindows')
  final List<TestWindowSummary> testWindows;

  PredictorExecution({
    this.algorithmArn,
    this.testWindows,
  });
  factory PredictorExecution.fromJson(Map<String, dynamic> json) =>
      _$PredictorExecutionFromJson(json);
}

/// Contains details on the backtests performed to evaluate the accuracy of the
/// predictor. The tests are returned in descending order of accuracy, with the
/// most accurate backtest appearing first. You specify the number of backtests
/// to perform when you call the operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PredictorExecutionDetails {
  /// An array of the backtests performed to evaluate the accuracy of the
  /// predictor against a particular algorithm. The
  /// <code>NumberOfBacktestWindows</code> from the object determines the number
  /// of windows in the array.
  @_s.JsonKey(name: 'PredictorExecutions')
  final List<PredictorExecution> predictorExecutions;

  PredictorExecutionDetails({
    this.predictorExecutions,
  });
  factory PredictorExecutionDetails.fromJson(Map<String, dynamic> json) =>
      _$PredictorExecutionDetailsFromJson(json);
}

/// Provides a summary of the predictor properties that are used in the
/// <a>ListPredictors</a> operation. To get the complete set of properties, call
/// the <a>DescribePredictor</a> operation, and provide the listed
/// <code>PredictorArn</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PredictorSummary {
  /// When the model training task was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the dataset group that contains the data
  /// used to train the predictor.
  @_s.JsonKey(name: 'DatasetGroupArn')
  final String datasetGroupArn;

  /// Initially, the same as <code>CreationTime</code> (status is
  /// <code>CREATE_PENDING</code>). Updated when training starts (status changed
  /// to <code>CREATE_IN_PROGRESS</code>), and when training is complete (status
  /// changed to <code>ACTIVE</code>) or fails (status changed to
  /// <code>CREATE_FAILED</code>).
  @_s.JsonKey(
      name: 'LastModificationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModificationTime;

  /// If an error occurred, an informational message about the error.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The ARN of the predictor.
  @_s.JsonKey(name: 'PredictorArn')
  final String predictorArn;

  /// The name of the predictor.
  @_s.JsonKey(name: 'PredictorName')
  final String predictorName;

  /// The status of the predictor. States include:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>
  /// </li>
  /// <li>
  /// <code>CREATE_PENDING</code>, <code>CREATE_IN_PROGRESS</code>,
  /// <code>CREATE_FAILED</code>
  /// </li>
  /// <li>
  /// <code>DELETE_PENDING</code>, <code>DELETE_IN_PROGRESS</code>,
  /// <code>DELETE_FAILED</code>
  /// </li>
  /// <li>
  /// <code>UPDATE_PENDING</code>, <code>UPDATE_IN_PROGRESS</code>,
  /// <code>UPDATE_FAILED</code>
  /// </li>
  /// </ul> <note>
  /// The <code>Status</code> of the predictor must be <code>ACTIVE</code> before
  /// you can use the predictor to create a forecast.
  /// </note>
  @_s.JsonKey(name: 'Status')
  final String status;

  PredictorSummary({
    this.creationTime,
    this.datasetGroupArn,
    this.lastModificationTime,
    this.message,
    this.predictorArn,
    this.predictorName,
    this.status,
  });
  factory PredictorSummary.fromJson(Map<String, dynamic> json) =>
      _$PredictorSummaryFromJson(json);
}

/// The path to the file(s) in an Amazon Simple Storage Service (Amazon S3)
/// bucket, and an AWS Identity and Access Management (IAM) role that Amazon
/// Forecast can assume to access the file(s). Optionally, includes an AWS Key
/// Management Service (KMS) key. This object is part of the <a>DataSource</a>
/// object that is submitted in the <a>CreateDatasetImportJob</a> request, and
/// part of the <a>DataDestination</a> object that is submitted in the
/// <a>CreateForecastExportJob</a> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Config {
  /// The path to an Amazon Simple Storage Service (Amazon S3) bucket or file(s)
  /// in an Amazon S3 bucket.
  @_s.JsonKey(name: 'Path')
  final String path;

  /// The ARN of the AWS Identity and Access Management (IAM) role that Amazon
  /// Forecast can assume to access the Amazon S3 bucket or files. If you provide
  /// a value for the <code>KMSKeyArn</code> key, the role must allow access to
  /// the key.
  ///
  /// Passing a role across AWS accounts is not allowed. If you pass a role that
  /// isn't in your account, you get an <code>InvalidInputException</code> error.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// The Amazon Resource Name (ARN) of an AWS Key Management Service (KMS) key.
  @_s.JsonKey(name: 'KMSKeyArn')
  final String kMSKeyArn;

  S3Config({
    @_s.required this.path,
    @_s.required this.roleArn,
    this.kMSKeyArn,
  });
  factory S3Config.fromJson(Map<String, dynamic> json) =>
      _$S3ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$S3ConfigToJson(this);
}

enum ScalingType {
  @_s.JsonValue('Auto')
  auto,
  @_s.JsonValue('Linear')
  linear,
  @_s.JsonValue('Logarithmic')
  logarithmic,
  @_s.JsonValue('ReverseLogarithmic')
  reverseLogarithmic,
}

/// Defines the fields of a dataset. You specify this object in the
/// <a>CreateDataset</a> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Schema {
  /// An array of attributes specifying the name and type of each field in a
  /// dataset.
  @_s.JsonKey(name: 'Attributes')
  final List<SchemaAttribute> attributes;

  Schema({
    this.attributes,
  });
  factory Schema.fromJson(Map<String, dynamic> json) => _$SchemaFromJson(json);

  Map<String, dynamic> toJson() => _$SchemaToJson(this);
}

/// An attribute of a schema, which defines a dataset field. A schema attribute
/// is required for every field in a dataset. The <a>Schema</a> object contains
/// an array of <code>SchemaAttribute</code> objects.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SchemaAttribute {
  /// The name of the dataset field.
  @_s.JsonKey(name: 'AttributeName')
  final String attributeName;

  /// The data type of the field.
  @_s.JsonKey(name: 'AttributeType')
  final AttributeType attributeType;

  SchemaAttribute({
    this.attributeName,
    this.attributeType,
  });
  factory SchemaAttribute.fromJson(Map<String, dynamic> json) =>
      _$SchemaAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$SchemaAttributeToJson(this);
}

/// Provides statistics for each data field imported into to an Amazon Forecast
/// dataset with the <a>CreateDatasetImportJob</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Statistics {
  /// For a numeric field, the average value in the field.
  @_s.JsonKey(name: 'Avg')
  final double avg;

  /// The number of values in the field.
  @_s.JsonKey(name: 'Count')
  final int count;

  /// The number of distinct values in the field.
  @_s.JsonKey(name: 'CountDistinct')
  final int countDistinct;

  /// The number of NAN (not a number) values in the field.
  @_s.JsonKey(name: 'CountNan')
  final int countNan;

  /// The number of null values in the field.
  @_s.JsonKey(name: 'CountNull')
  final int countNull;

  /// For a numeric field, the maximum value in the field.
  @_s.JsonKey(name: 'Max')
  final String max;

  /// For a numeric field, the minimum value in the field.
  @_s.JsonKey(name: 'Min')
  final String min;

  /// For a numeric field, the standard deviation.
  @_s.JsonKey(name: 'Stddev')
  final double stddev;

  Statistics({
    this.avg,
    this.count,
    this.countDistinct,
    this.countNan,
    this.countNull,
    this.max,
    this.min,
    this.stddev,
  });
  factory Statistics.fromJson(Map<String, dynamic> json) =>
      _$StatisticsFromJson(json);
}

/// Describes a supplementary feature of a dataset group. This object is part of
/// the <a>InputDataConfig</a> object.
///
/// The only supported feature is a holiday calendar. If you use the calendar,
/// all data in the datasets should belong to the same country as the calendar.
/// For the holiday calendar data, see the <a
/// href="http://jollyday.sourceforge.net/data.html">Jollyday</a> web site.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SupplementaryFeature {
  /// The name of the feature. This must be "holiday".
  @_s.JsonKey(name: 'Name')
  final String name;

  /// One of the following 2 letter country codes:
  ///
  /// <ul>
  /// <li>
  /// "AU" - AUSTRALIA
  /// </li>
  /// <li>
  /// "DE" - GERMANY
  /// </li>
  /// <li>
  /// "JP" - JAPAN
  /// </li>
  /// <li>
  /// "US" - UNITED_STATES
  /// </li>
  /// <li>
  /// "UK" - UNITED_KINGDOM
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Value')
  final String value;

  SupplementaryFeature({
    @_s.required this.name,
    @_s.required this.value,
  });
  factory SupplementaryFeature.fromJson(Map<String, dynamic> json) =>
      _$SupplementaryFeatureFromJson(json);

  Map<String, dynamic> toJson() => _$SupplementaryFeatureToJson(this);
}

/// The status, start time, and end time of a backtest, as well as a failure
/// reason if applicable.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestWindowSummary {
  /// If the test failed, the reason why it failed.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The status of the test. Possible status values are:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>
  /// </li>
  /// <li>
  /// <code>CREATE_IN_PROGRESS</code>
  /// </li>
  /// <li>
  /// <code>CREATE_FAILED</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final String status;

  /// The time at which the test ended.
  @_s.JsonKey(name: 'TestWindowEnd', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime testWindowEnd;

  /// The time at which the test began.
  @_s.JsonKey(
      name: 'TestWindowStart', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime testWindowStart;

  TestWindowSummary({
    this.message,
    this.status,
    this.testWindowEnd,
    this.testWindowStart,
  });
  factory TestWindowSummary.fromJson(Map<String, dynamic> json) =>
      _$TestWindowSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDatasetGroupResponse {
  UpdateDatasetGroupResponse();
  factory UpdateDatasetGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDatasetGroupResponseFromJson(json);
}

/// The weighted loss value for a quantile. This object is part of the
/// <a>Metrics</a> object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WeightedQuantileLoss {
  /// The difference between the predicted value and the actual value over the
  /// quantile, weighted (normalized) by dividing by the sum over all quantiles.
  @_s.JsonKey(name: 'LossValue')
  final double lossValue;

  /// The quantile. Quantiles divide a probability distribution into regions of
  /// equal probability. For example, if the distribution was divided into 5
  /// regions of equal probability, the quantiles would be 0.2, 0.4, 0.6, and 0.8.
  @_s.JsonKey(name: 'Quantile')
  final double quantile;

  WeightedQuantileLoss({
    this.lossValue,
    this.quantile,
  });
  factory WeightedQuantileLoss.fromJson(Map<String, dynamic> json) =>
      _$WeightedQuantileLossFromJson(json);
}

/// The metrics for a time range within the evaluation portion of a dataset.
/// This object is part of the <a>EvaluationResult</a> object.
///
/// The <code>TestWindowStart</code> and <code>TestWindowEnd</code> parameters
/// are determined by the <code>BackTestWindowOffset</code> parameter of the
/// <a>EvaluationParameters</a> object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WindowSummary {
  /// The type of evaluation.
  ///
  /// <ul>
  /// <li>
  /// <code>SUMMARY</code> - The average metrics across all windows.
  /// </li>
  /// <li>
  /// <code>COMPUTED</code> - The metrics for the specified window.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'EvaluationType')
  final EvaluationType evaluationType;

  /// The number of data points within the window.
  @_s.JsonKey(name: 'ItemCount')
  final int itemCount;

  /// Provides metrics used to evaluate the performance of a predictor.
  @_s.JsonKey(name: 'Metrics')
  final Metrics metrics;

  /// The timestamp that defines the end of the window.
  @_s.JsonKey(name: 'TestWindowEnd', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime testWindowEnd;

  /// The timestamp that defines the start of the window.
  @_s.JsonKey(
      name: 'TestWindowStart', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime testWindowStart;

  WindowSummary({
    this.evaluationType,
    this.itemCount,
    this.metrics,
    this.testWindowEnd,
    this.testWindowStart,
  });
  factory WindowSummary.fromJson(Map<String, dynamic> json) =>
      _$WindowSummaryFromJson(json);
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
